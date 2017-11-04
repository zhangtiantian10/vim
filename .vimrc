"""""""""" Plugins
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree' " A tree explorer plugin for vim
Plug 'Xuyuanp/nerdtree-git-plugin' " Git flag on nerdtree
Plug 'kien/ctrlp.vim' "Fuzzy file, buffer, mru, tag, etc finder
Plug 'altercation/vim-colors-solarized' " precision colorscheme for the vim text editor
Plug 'bling/vim-airline' " lean & mean status/tabline for vim that's light as air
Plug 'scrooloose/nerdcommenter' " Vim plugin for intensely orgasmic commenting
Plug 'airblade/vim-gitgutter' " A Vim plugin which shows a git diff in the gutter (sign column) and stages/undoes hunks
Plug 'easymotion/vim-easymotion' " Vim motions on speed
Plug 'mileszs/ack.vim' " Vim plugin for the Perl module / CLI script 'ack'
Plug 'terryma/vim-multiple-cursors' " Vim plugin for the_silver_searcher, 'ag', a replacement for the Perl module / CLI script 'ack'
Plug 'SirVer/ultisnips' " The ultimate snippet solution for Vim. Send pull requests to SirVer/ultisnips!
Plug 'honza/vim-snippets' " vim-snipmate default snippets (Previously snipmate-snippets)
Plug 'tpope/vim-cucumber' " Vim Cucumber runtime files
Plug 'mattn/emmet-vim' " Emmet-vim is a vim plug-in which provides support for expanding abbreviations similar to emmet.
call plug#end()

"""""""""" Configuration
" scrooloose/nerdtree
"" open a NERDTree automatically when vim starts up
autocmd vimenter * NERDTree | wincmd p
"" close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif " close vim if the only window left open is a NERDTree
"" open a NERDTree automatically when vim starts up if no files were specified
autocmd StdinReadPre * let s:std_in=1 
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif 
"" open NERDTree automatically when vim starts up on opening a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" altercation/vim-colors-solarized
"" https://github.com/altercation/vim-colors-solarized
syntax enable
let g:solarized_termcolors=256
set background=dark
colorscheme solarized

" hightline current line and column
au WinLeave * set nocursorline nocursorcolumn
au WinEnter * set cursorline cursorcolumn
set cursorline cursorcolumn

" tab spaces
set tabstop=2
set expandtab
set shiftwidth=2

" number
set nu

" Auto reload file when file changed
:set autoread

" hide scroll
set guioptions-=L
set guioptions-=r

" split line
hi VertSplit term=reverse cterm=reverse gui=none guibg=#002b36 guifg=#859900

" font
set guifont=Monospace\ Regular\ 14

"""""""""" Hot Keys
" tree
"" toggle tree
map <Leader>n :NERDTreeToggle<Enter>
"" locate current file in the tree
map <Leader>j :NERDTreeFind<Enter>
inoremap <Leader>j <Esc>:NERDTreeFind<Enter>

" kien/ctrlp.vim
"" Recent file
map <Leader>e :CtrlPBuffer<Enter>

" mileszs/ack.vim
"" https://github.com/mileszs/ack.vim
map <Leader>f :Ack!<Space>
map <Leader>fh :Ack! --html<Space>
map <Leader>fj :Ack! --js<Space>
map <Leader>fc :Ack! --css<Space>

" SirVer/ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" Alt + * move line
"" http://vim.wikia.com/wiki/Moving_lines_up_or_down
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" move between different window 
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" quit
nmap <Leader>w :wq<Enter>
nmap <Leader>q :q!<Enter>
imap <Leader>w <Esc>:wq<Enter>
imap <Leader>q <Esc>:q!<Enter>

" resize window
map <Leader>< :vertical resize -10<Enter>
map <Leader>> :vertical resize +10<Enter>
