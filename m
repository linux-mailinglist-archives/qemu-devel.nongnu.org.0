Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 765146A91C2
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 08:35:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXzvY-0000Oe-T5; Fri, 03 Mar 2023 02:34:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXzvE-0000K2-Pn
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 02:33:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXzvC-00016s-Ii
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 02:33:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677828820;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hQAvsxIN8ell9djqNz6j9SurelbkwZ0criHJi7jCc+0=;
 b=h7Sj56gA/mf6E4kKp4Uy5fBHn+kz3pjYlWJN7/4nU27OArO2QBOas1lu3GAhLEx6krcqn/
 NUqXmiWg61eXL9zq2LLdjX5OrS+zrTTm60tN8PTxKGTmlGG0Cm3Cf1cArA7kM+DEnsPTNd
 t9lCCE+NQoHPjWjN81jgsLFyq8rk5ls=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-634-il88HhfbOj-kq58DxVEvIA-1; Fri, 03 Mar 2023 02:33:39 -0500
X-MC-Unique: il88HhfbOj-kq58DxVEvIA-1
Received: by mail-wm1-f69.google.com with SMTP id
 l31-20020a05600c1d1f00b003e8626cdd42so596428wms.3
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 23:33:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677828818;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hQAvsxIN8ell9djqNz6j9SurelbkwZ0criHJi7jCc+0=;
 b=cwqRgSlVT2snehvMfVSlacansJhCoHM/4zk/1ALZ8fLfISmmfZ+2/v4r3bIadFRbYa
 zqsp2tsSxY2tg42JIPlpSxdOiPP8vReezaL7PjlVSyXw0dktgLJevml34HK88bKZmQ4D
 L2NTUBZIhdoROMg5eVm/PXE4vmmO1JUAYiV8JVdMhUV7bvBGsKN+jlGWr2FQ8S0xGpJZ
 xOv2CSc4d54/QTnIoQIQaKSkSFvnCMHTYggxOXK8TZ0Zz6MV7Yx201ftKka+3KQ5MBCi
 Z/5lhMW0JRqZT86LpEN5+GYiFBNSqtHuzZF2ZmGghkjYzn91Okig+p/3Wu5uQOiW956X
 4h7g==
X-Gm-Message-State: AO0yUKVXPZbqGM0M4eljJsqIk12VhBkoNLs8UoUM5nAFI+nuJF57YfeZ
 WdDGeYXgBr1XdJpC9IvSsO/gHj4uTY40OO0u2nHYePF78GZn7jKKLnRBFmtUkza5lytqI2KCNu9
 eDUg8ZUFEg7yWzhU=
X-Received: by 2002:a05:600c:a46:b0:3ea:dc1b:90c with SMTP id
 c6-20020a05600c0a4600b003eadc1b090cmr784149wmq.20.1677828817942; 
 Thu, 02 Mar 2023 23:33:37 -0800 (PST)
X-Google-Smtp-Source: AK7set/Rclr73qUbPo2U3/PF/8BNmSb4DeJTOv6osYapjJ5sQj5R9HGF4xI/hFs69FyS/plHDIEOww==
X-Received: by 2002:a05:600c:a46:b0:3ea:dc1b:90c with SMTP id
 c6-20020a05600c0a4600b003eadc1b090cmr784130wmq.20.1677828817560; 
 Thu, 02 Mar 2023 23:33:37 -0800 (PST)
Received: from redhat.com ([2a06:c701:742d:fd00:c847:221d:9254:f7ce])
 by smtp.gmail.com with ESMTPSA id
 q11-20020a05600000cb00b002c3f03d8851sm1364868wrx.16.2023.03.02.23.33.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 23:33:37 -0800 (PST)
Date: Fri, 3 Mar 2023 02:33:34 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Haitao Shan <hshan@google.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Subject: Re: [PATCH 1/6] Add the Android Emulator hypervisor driver (AEHD)
 accelerator.
Message-ID: <20230303023013-mutt-send-email-mst@kernel.org>
References: <20230303022618.4098825-1-hshan@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230303022618.4098825-1-hshan@google.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, Mar 02, 2023 at 06:26:12PM -0800, Haitao Shan wrote:
> Add the configure support for the Android Emulator hypervisor driver
> accelerator. The Android Emulator hypervisor driver is a Windows
> driver made by porting the KVM from kernel 4.9-rc7.
> 
> Signed-off-by: Haitao Shan <hshan@google.com>

Replying on patch 1 but it applies to the whole patchset.

There's obvious duplication with kvm here - probably not surprising.

I'd be interested to hear from KVM people to know whether
there's interest in unifying code, or they would rather
not bother supporting this platform and it's better off
being kept separate.

> ---
>  accel/Kconfig                  |  3 +++
>  docs/about/build-platforms.rst |  2 +-
>  include/exec/poison.h          |  1 +
>  meson.build                    | 16 ++++++++++++++++
>  meson_options.txt              |  2 ++
>  qemu-options.hx                | 20 ++++++++++----------
>  scripts/meson-buildoptions.sh  |  2 ++
>  7 files changed, 35 insertions(+), 11 deletions(-)
> 
> diff --git a/accel/Kconfig b/accel/Kconfig
> index 8bdedb7d15..187d8f6acf 100644
> --- a/accel/Kconfig
> +++ b/accel/Kconfig
> @@ -16,6 +16,9 @@ config TCG
>  config KVM
>      bool
>  
> +config AEHD
> +    bool
> +
>  config XEN
>      bool
>      select FSDEV_9P if VIRTFS
> diff --git a/docs/about/build-platforms.rst b/docs/about/build-platforms.rst
> index 20b97c3310..184707bd62 100644
> --- a/docs/about/build-platforms.rst
> +++ b/docs/about/build-platforms.rst
> @@ -52,7 +52,7 @@ Those hosts are officially supported, with various accelerators:
>     * - SPARC
>       - tcg
>     * - x86
> -     - hax, hvf (64 bit only), kvm, nvmm, tcg, whpx (64 bit only), xen
> +     - aehd (64 bit only), hax, hvf (64 bit only), kvm, nvmm, tcg, whpx (64 bit only), xen
>  
>  Other host architectures are not supported. It is possible to build QEMU system
>  emulation on an unsupported host architecture using the configure
> diff --git a/include/exec/poison.h b/include/exec/poison.h
> index 140daa4a85..cb851744d1 100644
> --- a/include/exec/poison.h
> +++ b/include/exec/poison.h
> @@ -86,6 +86,7 @@
>  #pragma GCC poison CONFIG_HVF
>  #pragma GCC poison CONFIG_LINUX_USER
>  #pragma GCC poison CONFIG_KVM
> +#pragma GCC poison CONFIG_AEHD
>  #pragma GCC poison CONFIG_SOFTMMU
>  #pragma GCC poison CONFIG_WHPX
>  #pragma GCC poison CONFIG_XEN
> diff --git a/meson.build b/meson.build
> index 77d2ae87e4..f2b049ceac 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -146,6 +146,11 @@ if cpu in ['x86', 'x86_64']
>      'CONFIG_WHPX': ['i386-softmmu', 'x86_64-softmmu'],
>    }
>  endif
> +if cpu in ['x86_64']
> +  accelerator_targets += {
> +    'CONFIG_AEHD': ['i386-softmmu', 'x86_64-softmmu'],
> +  }
> +endif
>  
>  modular_tcg = []
>  # Darwin does not support references to thread-local variables in modules
> @@ -421,6 +426,13 @@ accelerators = []
>  if get_option('kvm').allowed() and targetos == 'linux'
>    accelerators += 'CONFIG_KVM'
>  endif
> +if get_option('aehd').allowed() and targetos == 'windows'
> +  if get_option('aehd').enabled() and host_machine.cpu() != 'x86_64'
> +    error('AEHD requires 64-bit host')
> +  else
> +    accelerators += 'CONFIG_AEHD'
> +  endif
> +endif
>  if get_option('whpx').allowed() and targetos == 'windows'
>    if get_option('whpx').enabled() and host_machine.cpu() != 'x86_64'
>      error('WHPX requires 64-bit host')
> @@ -482,6 +494,9 @@ endif
>  if 'CONFIG_KVM' not in accelerators and get_option('kvm').enabled()
>    error('KVM not available on this platform')
>  endif
> +if 'CONFIG_AEHD' not in accelerators and get_option('aehd').enabled()
> +  error('AEHD not available on this platform')
> +endif
>  if 'CONFIG_HVF' not in accelerators and get_option('hvf').enabled()
>    error('HVF not available on this platform')
>  endif
> @@ -3873,6 +3888,7 @@ endif
>  summary_info = {}
>  if have_system
>    summary_info += {'KVM support':       config_all.has_key('CONFIG_KVM')}
> +  summary_info += {'AEHD support':      config_all.has_key('CONFIG_AEHD')}
>    summary_info += {'HAX support':       config_all.has_key('CONFIG_HAX')}
>    summary_info += {'HVF support':       config_all.has_key('CONFIG_HVF')}
>    summary_info += {'WHPX support':      config_all.has_key('CONFIG_WHPX')}
> diff --git a/meson_options.txt b/meson_options.txt
> index fc9447d267..d3e9805b6d 100644
> --- a/meson_options.txt
> +++ b/meson_options.txt
> @@ -66,6 +66,8 @@ option('malloc', type : 'combo', choices : ['system', 'tcmalloc', 'jemalloc'],
>  
>  option('kvm', type: 'feature', value: 'auto',
>         description: 'KVM acceleration support')
> +option('aehd', type: 'feature', value: 'auto',
> +       description: 'AEHD acceleration support')
>  option('hax', type: 'feature', value: 'auto',
>         description: 'HAX acceleration support')
>  option('whpx', type: 'feature', value: 'auto',
> diff --git a/qemu-options.hx b/qemu-options.hx
> index beeb4475ba..2870c54a43 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -26,7 +26,7 @@ DEF("machine", HAS_ARG, QEMU_OPTION_machine, \
>      "-machine [type=]name[,prop[=value][,...]]\n"
>      "                selects emulated machine ('-machine help' for list)\n"
>      "                property accel=accel1[:accel2[:...]] selects accelerator\n"
> -    "                supported accelerators are kvm, xen, hax, hvf, nvmm, whpx or tcg (default: tcg)\n"
> +    "                supported accelerators are kvm, xen, hax, hvf, nvmm, whpx, aehd or tcg (default: tcg)\n"
>      "                vmport=on|off|auto controls emulation of vmport (default: auto)\n"
>      "                dump-guest-core=on|off include guest memory in a core dump (default=on)\n"
>      "                mem-merge=on|off controls memory merge support (default: on)\n"
> @@ -59,10 +59,10 @@ SRST
>  
>      ``accel=accels1[:accels2[:...]]``
>          This is used to enable an accelerator. Depending on the target
> -        architecture, kvm, xen, hax, hvf, nvmm, whpx or tcg can be available.
> -        By default, tcg is used. If there is more than one accelerator
> -        specified, the next one is used if the previous one fails to
> -        initialize.
> +        architecture, kvm, xen, hax, hvf, nvmm, whpx, aehd or tcg can be
> +        available. By default, tcg is used. If there is more than one
> +        accelerator specified, the next one is used if the previous one
> +        fails to initialize.
>  
>      ``vmport=on|off|auto``
>          Enables emulation of VMWare IO port, for vmmouse etc. auto says
> @@ -178,7 +178,7 @@ ERST
>  
>  DEF("accel", HAS_ARG, QEMU_OPTION_accel,
>      "-accel [accel=]accelerator[,prop[=value][,...]]\n"
> -    "                select accelerator (kvm, xen, hax, hvf, nvmm, whpx or tcg; use 'help' for a list)\n"
> +    "                select accelerator (kvm, xen, hax, hvf, nvmm, whpx, aehd or tcg; use 'help' for a list)\n"
>      "                igd-passthru=on|off (enable Xen integrated Intel graphics passthrough, default=off)\n"
>      "                kernel-irqchip=on|off|split controls accelerated irqchip support (default=on)\n"
>      "                kvm-shadow-mem=size of KVM shadow MMU in bytes\n"
> @@ -190,10 +190,10 @@ DEF("accel", HAS_ARG, QEMU_OPTION_accel,
>  SRST
>  ``-accel name[,prop=value[,...]]``
>      This is used to enable an accelerator. Depending on the target
> -    architecture, kvm, xen, hax, hvf, nvmm, whpx or tcg can be available. By
> -    default, tcg is used. If there is more than one accelerator
> -    specified, the next one is used if the previous one fails to
> -    initialize.
> +    architecture, kvm, xen, hax, hvf, nvmm, whpx, aehd or tcg can be
> +    available. By default, tcg is used. If there is more than one
> +    accelerator specified, the next one is used if the previous one
> +    fails to initialize.
>  
>      ``igd-passthru=on|off``
>          When Xen is in use, this option controls whether Intel
> diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh
> index 009fab1515..f17df07c5d 100644
> --- a/scripts/meson-buildoptions.sh
> +++ b/scripts/meson-buildoptions.sh
> @@ -289,6 +289,8 @@ _meson_option_parse() {
>      --disable-guest-agent) printf "%s" -Dguest_agent=disabled ;;
>      --enable-guest-agent-msi) printf "%s" -Dguest_agent_msi=enabled ;;
>      --disable-guest-agent-msi) printf "%s" -Dguest_agent_msi=disabled ;;
> +    --enable-aehd) printf "%s" -Daehd=enabled ;;
> +    --disable-aehd) printf "%s" -Daehd=disabled ;;
>      --enable-hax) printf "%s" -Dhax=enabled ;;
>      --disable-hax) printf "%s" -Dhax=disabled ;;
>      --enable-hexagon-idef-parser) printf "%s" -Dhexagon_idef_parser=true ;;
> -- 
> 2.40.0.rc0.216.gc4246ad0f0-goog
> 
> 
> 


