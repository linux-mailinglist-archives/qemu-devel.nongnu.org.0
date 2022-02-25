Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 563DC4C4CFE
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 18:55:18 +0100 (CET)
Received: from localhost ([::1]:43754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNeoG-00023f-TF
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 12:55:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nNe3e-0000g1-DT
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 12:07:09 -0500
Received: from [2607:f8b0:4864:20::430] (port=40710
 helo=mail-pf1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nNe3b-0006Tq-TW
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 12:07:06 -0500
Received: by mail-pf1-x430.google.com with SMTP id z15so5197589pfe.7
 for <qemu-devel@nongnu.org>; Fri, 25 Feb 2022 09:07:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=sg5dmd0UpdsYddZt0eqWlGoP90Yia1hTxTRGYJuSREQ=;
 b=q6L7Q6ctVUfLYlEG3zQ3vBuqwxmUk2rpYDduXlEI9wFkn89pLy0x4lFp4UdL1w56lT
 GX+/B2/mFuxxRK4KT60EA9Edshw0lq1sEyK0CbRU1y7Z6fhbCPQ6jpRLTil6vcXatVHQ
 cQBtY7T4lCjC5FtvQ87H6MXaTyieNdRcM9oMXS8cQ1GDkFMddKC0SlyY/CQYiBy9qzpH
 4AL98+0Jl8/LvP1lY7Ld/fJMp3A884PPgSMO3CBEGGgGVL/YN1KPmGhnl2oHjC/0YQDs
 3GS43Xl2Y4o4v31Yqv4M4tiGtLNmB/Iu4sXNM0w3XPsaJLfmGwi8rvF1/wTwiN1TC64h
 l09g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=sg5dmd0UpdsYddZt0eqWlGoP90Yia1hTxTRGYJuSREQ=;
 b=yh4NfVnNgr15cDA60DWnc0tgjI+nPGnXQePvVVB3dbnM8ewqq5e1N7F8K2BMvvKgcg
 M1HWEWdHdVj62ZQbVCbaI70ImAk7doSroFdkKP8jPTSdW1gAYaPtybPtXqccMFNJxtXd
 nVGocABRT4yZsW0EnEPEnOzKE+Ab1ygRNxNRAZ+feX394HBBuZSsDC0jjFVacT4BDuBP
 ajTNPb1K80juFXUGKfJ0HHqMfurN3KqvDHWBPa48U0h3AUw1GMAxczNEz5lA/sa856u1
 g6IPDarcw+LWocyDYZtp9uk2XgZL75S/sY2+oBzREgFJ44GUikfx4qjEmhN8S2RvJiMZ
 Enqg==
X-Gm-Message-State: AOAM532BWueBoGlPgRjsxkQ7LLfdL1jsoJ2gdfUyYMlh6PrBIw3o7cxm
 IZk/sXEJqvSEajL8mdrrx14=
X-Google-Smtp-Source: ABdhPJzjLyADzhgBYAoCitZubJGAnAhIHEibRyZx22njbY8Qq3xsB3xSK4qX4LSVQIAjuzyssBjzyg==
X-Received: by 2002:a63:8942:0:b0:372:f41e:1110 with SMTP id
 v63-20020a638942000000b00372f41e1110mr6828994pgd.127.1645808821985; 
 Fri, 25 Feb 2022 09:07:01 -0800 (PST)
Received: from [192.168.66.3] (p912131-ipoe.ipoe.ocn.ne.jp. [153.243.13.130])
 by smtp.gmail.com with ESMTPSA id
 c15-20020a056a00248f00b004f10a245b83sm4028004pfv.73.2022.02.25.09.06.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Feb 2022 09:07:01 -0800 (PST)
Message-ID: <18305576-d7de-f307-68bc-164ecba9a275@gmail.com>
Date: Sat, 26 Feb 2022 02:06:56 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v14 1/8] net/vmnet: add vmnet dependency and customizable
 option
Content-Language: en-US
To: Vladislav Yaroshchuk <vladislav.yaroshchuk@jetbrains.com>,
 qemu-devel@nongnu.org
References: <20220225165238.63646-1-Vladislav.Yaroshchuk@jetbrains.com>
 <20220225165238.63646-2-Vladislav.Yaroshchuk@jetbrains.com>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
In-Reply-To: <20220225165238.63646-2-Vladislav.Yaroshchuk@jetbrains.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::430
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pf1-x430.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: peter.maydell@linaro.org, alex.bennee@linaro.org, jasowang@redhat.com,
 phillip.ennen@gmail.com, armbru@redhat.com, dirty@apple.com, f4bug@amsat.org,
 r.bolshakov@yadro.com, agraf@csgraf.de, phillip@axleos.com, roman@roolebo.dev,
 hsp.cat7@gmail.com, hello@adns.io, qemu_oss@crudebyte.com, eblake@redhat.com,
 kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2022/02/26 1:52, Vladislav Yaroshchuk wrote:
> vmnet.framework dependency is added with 'vmnet' option
> to enable or disable it. Default value is 'auto'.
> 
> vmnet features to be used are available since macOS 11.0,
> corresponding probe is created into meson.build.
> 
> Signed-off-by: Vladislav Yaroshchuk <Vladislav.Yaroshchuk@jetbrains.com>
> ---
>   meson.build                   | 16 +++++++++++++++-
>   meson_options.txt             |  2 ++
>   scripts/meson-buildoptions.sh |  3 +--
>   3 files changed, 18 insertions(+), 3 deletions(-)
> 
> diff --git a/meson.build b/meson.build
> index 8df40bfac4..d3a791e6c4 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -522,6 +522,18 @@ if cocoa.found() and get_option('gtk').enabled()
>     error('Cocoa and GTK+ cannot be enabled at the same time')
>   endif
>   
> +vmnet = dependency('appleframeworks', modules: 'vmnet', required: get_option('vmnet'))
> +if vmnet.found() and not cc.has_header_symbol('vmnet/vmnet.h',
> +                                              'VMNET_BRIDGED_MODE',
> +                                              dependencies: vmnet)
> +  vmnet = not_found
> +  if get_option('vmnet').enabled()
> +    error('vmnet.framework API is outdated')
> +  else
> +    warning('vmnet.framework API is outdated, disabling')
> +  endif
> +endif
> +
>   seccomp = not_found
>   if not get_option('seccomp').auto() or have_system or have_tools
>     seccomp = dependency('libseccomp', version: '>=2.3.0',
> @@ -1536,6 +1548,7 @@ config_host_data.set('CONFIG_SNAPPY', snappy.found())
>   config_host_data.set('CONFIG_TPM', have_tpm)
>   config_host_data.set('CONFIG_USB_LIBUSB', libusb.found())
>   config_host_data.set('CONFIG_VDE', vde.found())
> +config_host_data.set('CONFIG_VMNET', vmnet.found())
>   config_host_data.set('CONFIG_VHOST_USER_BLK_SERVER', have_vhost_user_blk_server)
>   config_host_data.set('CONFIG_VNC', vnc.found())
>   config_host_data.set('CONFIG_VNC_JPEG', jpeg.found())
> @@ -3564,7 +3577,8 @@ summary(summary_info, bool_yn: true, section: 'Crypto')
>   # Libraries
>   summary_info = {}
>   if targetos == 'darwin'
> -  summary_info += {'Cocoa support':   cocoa}
> +  summary_info += {'Cocoa support':           cocoa}
> +  summary_info += {'vmnet.framework support': vmnet}
>   endif
>   summary_info += {'SDL support':       sdl}
>   summary_info += {'SDL image support': sdl_image}
> diff --git a/meson_options.txt b/meson_options.txt
> index 52b11cead4..d2c0b6b412 100644
> --- a/meson_options.txt
> +++ b/meson_options.txt
> @@ -175,6 +175,8 @@ option('netmap', type : 'feature', value : 'auto',
>          description: 'netmap network backend support')
>   option('vde', type : 'feature', value : 'auto',
>          description: 'vde network backend support')
> +option('vmnet', type : 'feature', value : 'auto',
> +       description: 'vmnet.framework network backend support')
>   option('virglrenderer', type : 'feature', value : 'auto',
>          description: 'virgl rendering support')
>   option('vnc', type : 'feature', value : 'auto',
> diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh
> index 9ee684ef03..7c37f13384 100644
> --- a/scripts/meson-buildoptions.sh
> +++ b/scripts/meson-buildoptions.sh
> @@ -116,6 +116,7 @@ meson_options_help() {
>     printf "%s\n" '  usb-redir       libusbredir support'
>     printf "%s\n" '  vde             vde network backend support'
>     printf "%s\n" '  vdi             vdi image format support'
> +  printf "%s\n" '  vmnet           vmnet.framework network backend support'
>     printf "%s\n" '  vhost-user-blk-server'
>     printf "%s\n" '                  build vhost-user-blk server'
>     printf "%s\n" '  virglrenderer   virgl rendering support'
> @@ -333,8 +334,6 @@ _meson_option_parse() {
>       --disable-usb-redir) printf "%s" -Dusb_redir=disabled ;;
>       --enable-vde) printf "%s" -Dvde=enabled ;;
>       --disable-vde) printf "%s" -Dvde=disabled ;;
> -    --enable-vdi) printf "%s" -Dvdi=enabled ;;
> -    --disable-vdi) printf "%s" -Dvdi=disabled ;;
>       --enable-vhost-user-blk-server) printf "%s" -Dvhost_user_blk_server=enabled ;;
>       --disable-vhost-user-blk-server) printf "%s" -Dvhost_user_blk_server=disabled ;;
>       --enable-virglrenderer) printf "%s" -Dvirglrenderer=enabled ;;

--enable-vdi and --disable-vdi are mistakenly dropped.

