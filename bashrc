# Prompt with ruby version
# rbenv version | sed -e 's/ .*//'
function rbenv_ps1 () {
  rbenv_ruby_version=`rbenv version | sed -e 's/ .*//'`
  printf $rbenv_ruby_version
}

function parse_git_branch {
  git_branch=`git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
  if [ "$git_branch" ]; then
    printf "\033[0;37mon\033[0m $git_branch"
  fi
}

GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWSTASHSTATE=1
GIT_PS1_SHOWUNTRACKEDFILES=1
GIT_PS1_SHOWUPSTREAM="auto"
color_off='\e[0m' # Text Reset
black='\e[0;30m' # Black
red='\e[0;31m' # Red
green='\e[0;32m' # Green
yellow='\e[0;33m' # Yellow
blue='\e[0;34m' # Blue
purple='\e[0;35m' # Purple
cyan='\e[0;36m' # Cyan
white='\e[0;37m' # White

# Tell things to be colourful
export GREP_COLOR="1;31"
export GREP_OPTIONS='--color=auto'
export LESS="-R"
export TERM=xterm-256color

# Simple PS1
PS1="\[${white}\]using\[${color_off}\] \$(rbenv_ps1) \[${white}\]at\[${color_off}\] \\W \$(parse_git_branch) \n\\[${purple}\]\$\[${color_off}\] "

# Overwriting PATH for better homebrew compatibility
PATH=/usr/local/bin:/usr/local/sbin:/usr/local/share/npm/bin:$PATH:/usr/local/share/python

# Default Editor
export EDITOR=vim

# Call Aliases
source ~/.aliases

# rbenv Configurations
source ~/.rbenvrc

### Added by the Heroku Toolbelt
PATH="/usr/local/heroku/bin:$PATH"

if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi
