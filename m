Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C53D559E6A
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 18:21:34 +0200 (CEST)
Received: from localhost ([::1]:39510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4m3p-0001H7-OF
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 12:21:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1o4lZx-0007cV-1t
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 11:50:41 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:46011)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1o4lZv-00026j-3K
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 11:50:40 -0400
Received: by mail-ej1-x62b.google.com with SMTP id h23so5494312ejj.12
 for <qemu-devel@nongnu.org>; Fri, 24 Jun 2022 08:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=oknH46YjdeVmdb/AYLELv8S0kHpClhZF2xy4iPz4Q3s=;
 b=WMIaZ8Jptbd1qM+MBegWuYL/9o4ca4c7L0uMoGkPzi2at4HS2OP2oJ9q0fdA1+zsGw
 tYJu51YvolAQ5amZQZP59E79BG7Yui85RdiO3ZadIOukFHhjHY+dXM2lEN9uH5U7S5wg
 czPHBAZARpRe9pJGtMQQSF59BWO+eoLV0G+7b4+Y4+3mlz/NyU/QOlpc0zI6I3DWrOQi
 m2nKJU5P9kQJtXJLlwbC7IMYBawk3DMMf6fW3qf9Xvta6BQsk3JrEB5S7VXL+3Hx1D/V
 3BtrmQDw7lUnUHLsh49vWvzsr+b4v5y/dRGp24se/mB+9mY2nYVA1MoGuG0cG1CQFXWX
 Yk6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=oknH46YjdeVmdb/AYLELv8S0kHpClhZF2xy4iPz4Q3s=;
 b=oDPwQFGKKtgItGf3EkGDsiRypJwBBc57EUwx2Gc8LK2BlCskHvY2/iHwgjRstI+G9R
 HoFuSUkl6jFTtNCKD0vXXZnWAO66aEUqQCd4wD0ghffovv9kOr2mA6NB7QgHY9cBiSYK
 SqRHHIT2zqpGQOkM11wz2z2KTJ0Y6cBr3cVhTzebcAw0reAoxQGEhB8uT2MbPbgMeAbK
 dGMs3ObICT4ooeHMa4fHFiaPPrrlcRErETJ7RL2h7mpntauFD/DBGEYlP71ezJwumMwF
 Bctf/VBzTMItJlJ1/n4tjDvnn3xo88NQ/BnppWuwyIxW9kYdK4l1OJyBDHKRWdEZSfuX
 r5Kg==
X-Gm-Message-State: AJIora/IhPVZjND9eUIbMt1QczOnF0//r43feHNqGQkl7k2yzs1XOHlo
 FbZXs7tJOM9UBGx6d6WX9lE=
X-Google-Smtp-Source: AGRyM1vY9QKIwwPZQOC5cdp3N3GiNqxXTlgl5lqqPeLr3bG1SBk5iIE7aHflOGzVFnfwNKIE4P+vZQ==
X-Received: by 2002:a17:906:2086:b0:715:7983:a277 with SMTP id
 6-20020a170906208600b007157983a277mr14622485ejq.386.1656085837233; 
 Fri, 24 Jun 2022 08:50:37 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 g4-20020a170906868400b006fee98045cdsm1381395ejx.10.2022.06.24.08.50.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Jun 2022 08:50:36 -0700 (PDT)
Message-ID: <9c5ddc81-1401-b787-6944-0af21f1a9d6c@redhat.com>
Date: Fri, 24 Jun 2022 17:50:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] meson: Prefix each element of firmware path
Content-Language: en-US
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, "Daniel P . Berrange"
 <berrange@redhat.com>, John Snow <jsnow@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org
References: <20220624154042.51512-1-akihiko.odaki@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220624154042.51512-1-akihiko.odaki@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Queued, thanks!

Paolo

On 6/24/22 17:40, Akihiko Odaki wrote:
> Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
> ---
>   configure                     | 23 +++++++++++++++++++++++
>   meson.build                   | 10 ++++++++--
>   meson_options.txt             |  2 +-
>   scripts/meson-buildoptions.py |  7 +++++--
>   scripts/meson-buildoptions.sh |  6 +++---
>   softmmu/datadir.c             |  8 +++++---
>   6 files changed, 45 insertions(+), 11 deletions(-)
> 
> diff --git a/configure b/configure
> index 4b12a8094ca..ab952e7ce3b 100755
> --- a/configure
> +++ b/configure
> @@ -675,6 +675,29 @@ fi
>   
>   werror=""
>   
> +meson_option_build_array() {
> +  local a
> +  local ifs
> +
> +  if test "$targetos" == windows; then
> +    ifs=\;
> +  else
> +    ifs=:
> +  fi
> +
> +  echo -n "["
> +
> +  while IFS="$ifs" read -ra a; do
> +    for e in "${a[@]}"; do
> +      echo -n '"""'
> +      echo -n "$e" | sed 's/\\/\\\\/g; s/"/\\"/g'
> +      echo -n '"""',
> +    done
> +  done <<< "$1"
> +
> +  echo "]"
> +}
> +
>   . $source_path/scripts/meson-buildoptions.sh
>   
>   meson_options=
> diff --git a/meson.build b/meson.build
> index 0c2e11ff071..40111ce4053 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -1684,7 +1684,13 @@ config_host_data.set_quoted('CONFIG_PREFIX', get_option('prefix'))
>   config_host_data.set_quoted('CONFIG_QEMU_CONFDIR', get_option('prefix') / qemu_confdir)
>   config_host_data.set_quoted('CONFIG_QEMU_DATADIR', get_option('prefix') / qemu_datadir)
>   config_host_data.set_quoted('CONFIG_QEMU_DESKTOPDIR', get_option('prefix') / qemu_desktopdir)
> -config_host_data.set_quoted('CONFIG_QEMU_FIRMWAREPATH', get_option('prefix') / get_option('qemu_firmwarepath'))
> +
> +qemu_firmwarepath = ''
> +foreach k : get_option('qemu_firmwarepath')
> +  qemu_firmwarepath += '"' + get_option('prefix') / k + '", '
> +endforeach
> +config_host_data.set('CONFIG_QEMU_FIRMWAREPATH', qemu_firmwarepath)
> +
>   config_host_data.set_quoted('CONFIG_QEMU_HELPERDIR', get_option('prefix') / get_option('libexecdir'))
>   config_host_data.set_quoted('CONFIG_QEMU_ICONDIR', get_option('prefix') / qemu_icondir)
>   config_host_data.set_quoted('CONFIG_QEMU_LOCALEDIR', get_option('prefix') / get_option('localedir'))
> @@ -3622,7 +3628,7 @@ endif
>   summary_info = {}
>   summary_info += {'Install prefix':    get_option('prefix')}
>   summary_info += {'BIOS directory':    qemu_datadir}
> -summary_info += {'firmware path':     get_option('prefix') / get_option('qemu_firmwarepath')}
> +summary_info += {'firmware path':     qemu_firmwarepath}
>   summary_info += {'binary directory':  get_option('prefix') / get_option('bindir')}
>   summary_info += {'library directory': get_option('prefix') / get_option('libdir')}
>   summary_info += {'module directory':  qemu_moddir}
> diff --git a/meson_options.txt b/meson_options.txt
> index 0e8197386b9..8ad5cd73819 100644
> --- a/meson_options.txt
> +++ b/meson_options.txt
> @@ -6,7 +6,7 @@ option('qemu_suffix', type : 'string', value: 'qemu',
>          description: 'Suffix for QEMU data/modules/config directories (can be empty)')
>   option('docdir', type : 'string', value : 'share/doc',
>          description: 'Base directory for documentation installation (can be empty)')
> -option('qemu_firmwarepath', type : 'string', value : 'qemu-firmware',
> +option('qemu_firmwarepath', type : 'array', value : ['qemu-firmware'],
>          description: 'search PATH for firmware files')
>   option('pkgversion', type : 'string', value : '',
>          description: 'use specified string as sub-version of the package')
> diff --git a/scripts/meson-buildoptions.py b/scripts/meson-buildoptions.py
> index e624c16b01a..3e2b4785388 100755
> --- a/scripts/meson-buildoptions.py
> +++ b/scripts/meson-buildoptions.py
> @@ -156,7 +156,7 @@ def cli_metavar(opt):
>       if opt["type"] == "string":
>           return "VALUE"
>       if opt["type"] == "array":
> -        return "CHOICES"
> +        return "CHOICES" if "choices" in opt else "VALUES"
>       return "CHOICE"
>   
>   
> @@ -199,7 +199,10 @@ def print_parse(options):
>           key = cli_option(opt)
>           name = opt["name"]
>           if require_arg(opt):
> -            print(f'    --{key}=*) quote_sh "-D{name}=$2" ;;')
> +            if opt["type"] == "array" and not "choices" in opt:
> +                print(f'    --{key}=*) quote_sh "-D{name}=$(meson_option_build_array $2)" ;;')
> +            else:
> +                print(f'    --{key}=*) quote_sh "-D{name}=$2" ;;')
>           elif opt["type"] == "boolean":
>               print(f'    --enable-{key}) printf "%s" -D{name}=true ;;')
>               print(f'    --disable-{key}) printf "%s" -D{name}=false ;;')
> diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh
> index 1fc1d2e2c36..238bab162bd 100644
> --- a/scripts/meson-buildoptions.sh
> +++ b/scripts/meson-buildoptions.sh
> @@ -42,12 +42,12 @@ meson_options_help() {
>     printf "%s\n" '  --enable-trace-backends=CHOICES'
>     printf "%s\n" '                           Set available tracing backends [log] (choices:'
>     printf "%s\n" '                           dtrace/ftrace/log/nop/simple/syslog/ust)'
> -  printf "%s\n" '  --firmwarepath=VALUE     search PATH for firmware files [qemu-firmware]'
> +  printf "%s\n" '  --firmwarepath=VALUES    search PATH for firmware files [qemu-firmware]'
>     printf "%s\n" '  --iasl=VALUE             Path to ACPI disassembler'
>     printf "%s\n" '  --includedir=VALUE       Header file directory [include]'
>     printf "%s\n" '  --interp-prefix=VALUE    where to find shared libraries etc., use %M for'
>     printf "%s\n" '                           cpu name [/usr/gnemul/qemu-%M]'
> -  printf "%s\n" '  --libdir=VALUE           Library directory [lib64]'
> +  printf "%s\n" '  --libdir=VALUE           Library directory [lib]'
>     printf "%s\n" '  --libexecdir=VALUE       Library executable directory [libexec]'
>     printf "%s\n" '  --localedir=VALUE        Locale data directory [share/locale]'
>     printf "%s\n" '  --localstatedir=VALUE    Localstate data directory [/var/local]'
> @@ -356,7 +356,7 @@ _meson_option_parse() {
>       --disable-qcow1) printf "%s" -Dqcow1=disabled ;;
>       --enable-qed) printf "%s" -Dqed=enabled ;;
>       --disable-qed) printf "%s" -Dqed=disabled ;;
> -    --firmwarepath=*) quote_sh "-Dqemu_firmwarepath=$2" ;;
> +    --firmwarepath=*) quote_sh "-Dqemu_firmwarepath=$(meson_option_build_array $2)" ;;
>       --enable-qga-vss) printf "%s" -Dqga_vss=enabled ;;
>       --disable-qga-vss) printf "%s" -Dqga_vss=disabled ;;
>       --enable-qom-cast-debug) printf "%s" -Dqom_cast_debug=true ;;
> diff --git a/softmmu/datadir.c b/softmmu/datadir.c
> index 160cac999a6..fd24629c543 100644
> --- a/softmmu/datadir.c
> +++ b/softmmu/datadir.c
> @@ -105,15 +105,17 @@ static char *find_datadir(void)
>   
>   void qemu_add_default_firmwarepath(void)
>   {
> -    char **dirs;
> +    static const char * const dirs[] = {
> +        CONFIG_QEMU_FIRMWAREPATH
> +        NULL
> +    };
> +
>       size_t i;
>   
>       /* add configured firmware directories */
> -    dirs = g_strsplit(CONFIG_QEMU_FIRMWAREPATH, G_SEARCHPATH_SEPARATOR_S, 0);
>       for (i = 0; dirs[i] != NULL; i++) {
>           qemu_add_data_dir(get_relocated_path(dirs[i]));
>       }
> -    g_strfreev(dirs);
>   
>       /* try to find datadir relative to the executable path */
>       qemu_add_data_dir(find_datadir());


