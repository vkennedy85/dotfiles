#Start up commands
#run fortune | cowsay
#fortune -a | cowsay

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"


# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git git-flow gitfast git jsontools)

DISABLE_UPDATE_PROMPT=true

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export ANDROID_HOME=$HOME/Development/sdk
export PATH=$PATH:/usr/local/bin::/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:
export PATH=$PATH:$ANDROID_HOME/platform_tools:$ANDROID_HOME/platforms:$ANDROID_HOME/tools:$ANDROID_HOME/ndk-bundle/
export PATH=$PATH:$HOME/bin:/usr/local/bin
export PATH=$PATH:$HOME/Library/Android/sdk/platform-tools


alias c='clear'
alias ping='ping -c 3'
alias dotfiles='cd ~/.dotfiles'
alias fuck='sudo $(fc -ln -1)'

alias whisper='say -v whisper'
#Directories

#OSX Specific
alias f='open -a Finder ./'

#Gradle
alias td='./gradlew testDebug'

#POW
alias kapow='touch ~/.pow/restart.txt'

#Git aliases
alias gcam='git commit -a -m'
alias gaa='git add -A'
alias gcamall='gaa; gcam'
alias gffs='git flow feature start'
alias glall='git pull --all'
alias gpf='gp -f'
alias gpo='git push origin'
alias gcd='git checkout develop || git pull'

gbclean(){ 
  gb -a --merged develop | grep -vEi 'develop|weekly|master|origin' | xargs git branch -D
	find . -name "*.orig" -type f -delete
	git fetch --prune
}

#Make directory and move to it
mcd() {  
  test -e "$1" || mkdir -p "$1"; cd "$1";  
}  

cdl(){
	cd "$1"; ll;
}

#VI Mode in Command Line
bindkey -v

[ -f /opt/boxen/env.sh ] && source /opt/boxen/env.sh

#Changing cursoer based on vim-mode input mode
function zle-keymap-select zle-line-init
{
  # change cursor shape in iTerm2
  case $KEYMAP in
    vicmd)      print -n -- "\E]50;CursorShape=0\C-G";;  # block cursor
    viins|main) print -n -- "\E]50;CursorShape=1\C-G";;  # line cursor
  esac

  zle reset-prompt
  zle -R
}

function zle-line-finish
{
  print -n -- "\E]50;CursorShape=0\C-G"  # block cursor
}

zle -N zle-line-init
zle -N zle-line-finish
zle -N zle-keymap-select
### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
