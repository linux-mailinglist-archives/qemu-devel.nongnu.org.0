Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E32884FB48A
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Apr 2022 09:21:30 +0200 (CEST)
Received: from localhost ([::1]:37568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ndoMc-0007Ox-1P
	for lists+qemu-devel@lfdr.de; Mon, 11 Apr 2022 03:21:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ndoDL-0000x6-DU
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 03:11:55 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:41947)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ndoDH-0000j8-N6
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 03:11:54 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 o20-20020a05600c511400b0038ebbbb2ad8so1111765wms.0
 for <qemu-devel@nongnu.org>; Mon, 11 Apr 2022 00:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=fxyU05ucwrB0Vc8MIwP6cPyb4W6YTPCgGpaK7cTVMsE=;
 b=guMrk0UExVFWJlho5H7CsHmLIUrYyJWQwYiz33wNj4pqP0cOq3FuogA223U9LikTs9
 8eMJn/dUDIf/pxKD6HnWyBTZtTO/9zVOULx81sf7yKZ4K7itMVz8WCSNxp3vyeIAT80x
 mtT2gfIx0zNQhTYHktYhVrsXbNtRlt8xJiTHpxTwSxlejBa3/VO43Z5b4Gvln9/+BVmT
 7oQTlGDsi4uuPkGDZMCK+zxLazXXJz8i8+tgnEWYhtK/aeyXmj9usnnHfsZigDbCx2j1
 oiTuMYpYUhQdMHwKcWxV9RjTiHeYw/V9njej1jUhIBXhk6x+XwXU5nOuhwVyTx5MZyJV
 UhsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=fxyU05ucwrB0Vc8MIwP6cPyb4W6YTPCgGpaK7cTVMsE=;
 b=GSn2eWxvPwPziCw1CWULaX88tLSZTqKPex3Hu/OiNcVgP5+qCvER/TX4lAb9AsjW4H
 VH+GaiyO2QjopelBq+c4uuTbOpbnqldNhVsTs62+mZCEHOKDSjRAJzdg/2AS/sBDkQ4a
 Iyjcak1Ko3iF6JwUV2kSC1f3sIJEKQ7bSqsTjk4i0zJ1duuzbI6/ZPAIRV7sb8vi2Gzd
 vTvcH5LfYtX4vUhE1ZgLOcUMheF9dZfMVl6J7lPF3sle/Ty+MSF493bnTnRVCipGCAfp
 +dE5uMDfpBK08taEoD24wY2JGATBgDdLrehvi8NbHvbLfLUhUbLraOkRtOwQVIr99y0P
 CCUg==
X-Gm-Message-State: AOAM531qst/XHJcIaiVlyse0vx4FoMAUN9yz99ZGVjzWHkM+h+vhympN
 OW1BVgHUw+qPkItfz+LFQ5M=
X-Google-Smtp-Source: ABdhPJzMRm2hXr8ja1Bl+HS3eCJTm02rvGkpAR2An847vM0BqZYsKxMH0RHbatFbO7M1nIEqM0yl5Q==
X-Received: by 2002:a7b:cd10:0:b0:38e:b3c5:bc68 with SMTP id
 f16-20020a7bcd10000000b0038eb3c5bc68mr8289164wmj.47.1649661109855; 
 Mon, 11 Apr 2022 00:11:49 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id
 s1-20020adfb781000000b002060d4a8bd9sm21072427wre.17.2022.04.11.00.11.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Apr 2022 00:11:49 -0700 (PDT)
Message-ID: <774adae3-ff97-44b2-a510-fd46c073eb1a@redhat.com>
Date: Mon, 11 Apr 2022 09:11:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [RFC PATCH for-7.1] Remove the slirp submodule (and only compile
 with an external libslirp)
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
References: <20220408164749.534758-1-thuth@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220408164749.534758-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x335.google.com
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
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/8/22 18:47, Thomas Huth wrote:
> The only one that still seems to be missing a libslirp package is
> OpenBSD - but I assume that they can add it to their ports system
> quickly if required.
> 
> So there is no real urgent need for keeping the slirp submodule in
> the QEMU tree anymore. Thus let's drop the slirp submodule now and
> rely on the libslirp packages from the distributions instead.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>

I would like to have feature parity even with CFI.  I had written the 
libslirp side a few months ago, but never tested it because I didn't get 
to the QEMU side.

I updated it and you can find it at 
https://gitlab.freedesktop.org/slirp/libslirp/-/merge_requests/117. 
I'll get to the QEMU side now.

Paolo

> ---
>   configure                     |  22 +------
>   meson.build                   | 112 +++++-----------------------------
>   .gitlab-ci.d/buildtest.yml    |  19 +++---
>   .gitmodules                   |   3 -
>   MAINTAINERS                   |   1 -
>   meson_options.txt             |   5 +-
>   scripts/archive-source.sh     |   2 +-
>   scripts/meson-buildoptions.sh |   4 +-
>   slirp                         |   1 -
>   9 files changed, 29 insertions(+), 140 deletions(-)
>   delete mode 160000 slirp
> 
> diff --git a/configure b/configure
> index 7c08c18358..3aedff78a9 100755
> --- a/configure
> +++ b/configure
> @@ -339,10 +339,8 @@ skip_meson=no
>   # 1. Track which submodules are needed
>   if test "$default_feature" = no ; then
>     capstone="disabled"
> -  slirp="disabled"
>   else
>     capstone="auto"
> -  slirp="auto"
>   fi
>   fdt="auto"
>   
> @@ -874,14 +872,6 @@ for opt do
>     ;;
>     --disable-tsan) tsan="no"
>     ;;
> -  --disable-slirp) slirp="disabled"
> -  ;;
> -  --enable-slirp) slirp="enabled"
> -  ;;
> -  --enable-slirp=git) slirp="internal"
> -  ;;
> -  --enable-slirp=*) slirp="$optarg"
> -  ;;
>     --disable-xen) xen="disabled"
>     ;;
>     --enable-xen) xen="enabled"
> @@ -2576,16 +2566,6 @@ EOF
>     fi
>   fi
>   
> -##########################################
> -# check for slirp
> -
> -case "$slirp" in
> -  auto | enabled | internal)
> -    # Simpler to always update submodule, even if not needed.
> -    git_submodules="${git_submodules} slirp"
> -    ;;
> -esac
> -
>   ##########################################
>   # check for usable __NR_keyctl syscall
>   
> @@ -3169,7 +3149,7 @@ if test "$skip_meson" = no; then
>           -Db_pie=$(if test "$pie" = yes; then echo true; else echo false; fi) \
>           -Db_coverage=$(if test "$gcov" = yes; then echo true; else echo false; fi) \
>           -Db_lto=$lto -Dcfi=$cfi -Dtcg=$tcg -Dxen=$xen \
> -        -Dcapstone=$capstone -Dfdt=$fdt -Dslirp=$slirp \
> +        -Dcapstone=$capstone -Dfdt=$fdt \
>           $(test -n "${LIB_FUZZING_ENGINE+xxx}" && echo "-Dfuzzing_engine=$LIB_FUZZING_ENGINE") \
>           $(if test "$default_feature" = no; then echo "-Dauto_features=disabled"; fi) \
>           "$@" $cross_arg "$PWD" "$source_path"
> diff --git a/meson.build b/meson.build
> index 861de93c4f..5d93030da5 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -560,6 +560,20 @@ else
>                            method: 'pkg-config', kwargs: static_kwargs)
>   endif
>   
> +slirp = not_found
> +if not get_option('slirp').auto() or have_system
> +  slirp = dependency('slirp', required: get_option('slirp'),
> +                     method: 'pkg-config', kwargs: static_kwargs)
> +  # We cannot compile QEMU with CFI and libslirp enabled at the same time.
> +  # This is because we register slirp functions as callbacks for QEMU Timers.
> +  # When using a system-wide shared libslirp, the type information for the
> +  # callback is missing and the timer call produces a false positive with CFI.
> +  if get_option('cfi')
> +    error('Control-Flow Integrity is not compatible with libslirp.' \
> +           + ' Please configure with --disable-slirp')
> +  endif
> +endif
> +
>   vde = not_found
>   if not get_option('vde').auto() or have_system or have_tools
>     vde = cc.find_library('vdeplug', has_headers: ['libvdeplug.h'],
> @@ -2406,100 +2420,6 @@ if capstone_opt == 'internal'
>                                   include_directories: 'capstone/include/capstone')
>   endif
>   
> -slirp = not_found
> -slirp_opt = 'disabled'
> -if have_system
> -  slirp_opt = get_option('slirp')
> -  if slirp_opt in ['enabled', 'auto', 'system']
> -    have_internal = fs.exists(meson.current_source_dir() / 'slirp/meson.build')
> -    slirp = dependency('slirp', kwargs: static_kwargs,
> -                       method: 'pkg-config',
> -                       required: slirp_opt == 'system' or
> -                                 slirp_opt == 'enabled' and not have_internal)
> -    if slirp.found()
> -      slirp_opt = 'system'
> -    elif have_internal
> -      slirp_opt = 'internal'
> -    else
> -      slirp_opt = 'disabled'
> -    endif
> -  endif
> -  if slirp_opt == 'internal'
> -    slirp_deps = []
> -    if targetos == 'windows'
> -      slirp_deps = cc.find_library('iphlpapi')
> -    elif targetos == 'darwin'
> -      slirp_deps = cc.find_library('resolv')
> -    endif
> -    slirp_conf = configuration_data()
> -    slirp_conf.set('SLIRP_MAJOR_VERSION', meson.project_version().split('.')[0])
> -    slirp_conf.set('SLIRP_MINOR_VERSION', meson.project_version().split('.')[1])
> -    slirp_conf.set('SLIRP_MICRO_VERSION', meson.project_version().split('.')[2])
> -    slirp_conf.set_quoted('SLIRP_VERSION_STRING', meson.project_version())
> -    slirp_cargs = ['-DG_LOG_DOMAIN="Slirp"']
> -    slirp_files = [
> -      'slirp/src/arp_table.c',
> -      'slirp/src/bootp.c',
> -      'slirp/src/cksum.c',
> -      'slirp/src/dhcpv6.c',
> -      'slirp/src/dnssearch.c',
> -      'slirp/src/if.c',
> -      'slirp/src/ip6_icmp.c',
> -      'slirp/src/ip6_input.c',
> -      'slirp/src/ip6_output.c',
> -      'slirp/src/ip_icmp.c',
> -      'slirp/src/ip_input.c',
> -      'slirp/src/ip_output.c',
> -      'slirp/src/mbuf.c',
> -      'slirp/src/misc.c',
> -      'slirp/src/ncsi.c',
> -      'slirp/src/ndp_table.c',
> -      'slirp/src/sbuf.c',
> -      'slirp/src/slirp.c',
> -      'slirp/src/socket.c',
> -      'slirp/src/state.c',
> -      'slirp/src/stream.c',
> -      'slirp/src/tcp_input.c',
> -      'slirp/src/tcp_output.c',
> -      'slirp/src/tcp_subr.c',
> -      'slirp/src/tcp_timer.c',
> -      'slirp/src/tftp.c',
> -      'slirp/src/udp.c',
> -      'slirp/src/udp6.c',
> -      'slirp/src/util.c',
> -      'slirp/src/version.c',
> -      'slirp/src/vmstate.c',
> -    ]
> -
> -    configure_file(
> -      input : 'slirp/src/libslirp-version.h.in',
> -      output : 'libslirp-version.h',
> -      configuration: slirp_conf)
> -
> -    slirp_inc = include_directories('slirp', 'slirp/src')
> -    libslirp = static_library('slirp',
> -                              build_by_default: false,
> -                              sources: slirp_files,
> -                              c_args: slirp_cargs,
> -                              include_directories: slirp_inc)
> -    slirp = declare_dependency(link_with: libslirp,
> -                               dependencies: slirp_deps,
> -                               include_directories: slirp_inc)
> -  endif
> -endif
> -
> -# For CFI, we need to compile slirp as a static library together with qemu.
> -# This is because we register slirp functions as callbacks for QEMU Timers.
> -# When using a system-wide shared libslirp, the type information for the
> -# callback is missing and the timer call produces a false positive with CFI.
> -#
> -# Now that slirp_opt has been defined, check if the selected slirp is compatible
> -# with control-flow integrity.
> -if get_option('cfi') and slirp_opt == 'system'
> -  error('Control-Flow Integrity is not compatible with system-wide slirp.' \
> -         + ' Please configure with --enable-slirp=git')
> -endif
> -
>   fdt = not_found
>   if have_system
>     fdt_opt = get_option('fdt')
> @@ -3471,7 +3391,7 @@ summary_info += {'genisoimage':       config_host['GENISOIMAGE']}
>   if targetos == 'windows' and have_ga
>     summary_info += {'wixl':            wixl}
>   endif
> -if slirp_opt != 'disabled' and have_system
> +if slirp.found() and have_system
>     summary_info += {'smbd':            have_slirp_smbd ? smbd_path : false}
>   endif
>   summary(summary_info, bool_yn: true, section: 'Host binaries')
> @@ -3666,7 +3586,7 @@ summary_info += {'SDL image support': sdl_image}
>   summary_info += {'GTK support':       gtk}
>   summary_info += {'pixman':            pixman}
>   summary_info += {'VTE support':       vte}
> -summary_info += {'slirp support':     slirp_opt == 'internal' ? slirp_opt : slirp}
> +summary_info += {'slirp support':     slirp}
>   summary_info += {'libtasn1':          tasn1}
>   summary_info += {'PAM':               pam}
>   summary_info += {'iconv support':     iconv}
> diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
> index 0aea7ab84c..19dc9f4590 100644
> --- a/.gitlab-ci.d/buildtest.yml
> +++ b/.gitlab-ci.d/buildtest.yml
> @@ -41,7 +41,7 @@ build-system-ubuntu:
>       job: amd64-ubuntu2004-container
>     variables:
>       IMAGE: ubuntu2004
> -    CONFIGURE_ARGS: --enable-docs --enable-fdt=system --enable-slirp=system
> +    CONFIGURE_ARGS: --enable-docs --enable-fdt=system
>       TARGETS: aarch64-softmmu alpha-softmmu cris-softmmu hppa-softmmu
>         microblazeel-softmmu mips64el-softmmu
>       MAKE_CHECK_ARGS: check-build
> @@ -118,7 +118,7 @@ build-system-fedora:
>     variables:
>       IMAGE: fedora
>       CONFIGURE_ARGS: --disable-gcrypt --enable-nettle --enable-docs
> -             --enable-fdt=system --enable-slirp=system --enable-capstone=system
> +             --enable-fdt=system --enable-capstone=system
>       TARGETS: tricore-softmmu microblaze-softmmu mips-softmmu
>         xtensa-softmmu m68k-softmmu riscv32-softmmu ppc-softmmu sparc64-softmmu
>       MAKE_CHECK_ARGS: check-build
> @@ -335,10 +335,8 @@ clang-user:
>   # On gitlab runners, default value sometimes end up calling 2 lds concurrently and
>   # triggers an Out-Of-Memory error
>   #
> -# Since slirp callbacks are used in QEMU Timers, slirp needs to be compiled together
> -# with QEMU and linked as a static library to avoid false positives in CFI checks.
> -# This can be accomplished by using -enable-slirp=git, which avoids the use of
> -# a system-wide version of the library
> +# Since slirp callbacks are used in QEMU Timers, we cannot use libslirp with
> +# CFI builds, and thus have to disable it here.
>   #
>   # Split in three sets of build/check/avocado to limit the execution time of each
>   # job
> @@ -351,7 +349,7 @@ build-cfi-aarch64:
>       AR: llvm-ar
>       IMAGE: fedora
>       CONFIGURE_ARGS: --cc=clang --cxx=clang++ --enable-cfi --enable-cfi-debug
> -      --enable-safe-stack --enable-slirp=git
> +      --enable-safe-stack --disable-slirp
>       TARGETS: aarch64-softmmu
>       MAKE_CHECK_ARGS: check-build
>     timeout: 70m
> @@ -393,7 +391,7 @@ build-cfi-ppc64-s390x:
>       AR: llvm-ar
>       IMAGE: fedora
>       CONFIGURE_ARGS: --cc=clang --cxx=clang++ --enable-cfi --enable-cfi-debug
> -      --enable-safe-stack --enable-slirp=git
> +      --enable-safe-stack --disable-slirp
>       TARGETS: ppc64-softmmu s390x-softmmu
>       MAKE_CHECK_ARGS: check-build
>     timeout: 70m
> @@ -435,7 +433,7 @@ build-cfi-x86_64:
>       AR: llvm-ar
>       IMAGE: fedora
>       CONFIGURE_ARGS: --cc=clang --cxx=clang++ --enable-cfi --enable-cfi-debug
> -      --enable-safe-stack --enable-slirp=git
> +      --enable-safe-stack --disable-slirp
>       TARGETS: x86_64-softmmu
>       MAKE_CHECK_ARGS: check-build
>     timeout: 70m
> @@ -469,7 +467,7 @@ tsan-build:
>     variables:
>       IMAGE: ubuntu2004
>       CONFIGURE_ARGS: --enable-tsan --cc=clang-10 --cxx=clang++-10
> -          --enable-trace-backends=ust --enable-fdt=system --enable-slirp=system
> +          --enable-trace-backends=ust --enable-fdt=system --disable-slirp
>       TARGETS: x86_64-softmmu ppc64-softmmu riscv64-softmmu x86_64-linux-user
>       MAKE_CHECK_ARGS: bench V=1
>   
> @@ -571,7 +569,6 @@ build-without-default-features:
>         --disable-capstone
>         --disable-pie
>         --disable-qom-cast-debug
> -      --disable-slirp
>         --disable-strip
>       TARGETS: avr-softmmu i386-softmmu mips64-softmmu s390x-softmmu sh4-softmmu
>         sparc64-softmmu hexagon-linux-user i386-linux-user s390x-linux-user
> diff --git a/.gitmodules b/.gitmodules
> index f4b6a9b401..d55cdb5036 100644
> --- a/.gitmodules
> +++ b/.gitmodules
> @@ -49,9 +49,6 @@
>   [submodule "roms/edk2"]
>   	path = roms/edk2
>   	url = https://gitlab.com/qemu-project/edk2.git
> -[submodule "slirp"]
> -	path = slirp
> -	url = https://gitlab.com/qemu-project/libslirp.git
>   [submodule "roms/opensbi"]
>   	path = roms/opensbi
>   	url = 	https://gitlab.com/qemu-project/opensbi.git
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 4ad2451e03..9a4fa68cc0 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2924,7 +2924,6 @@ F: include/hw/registerfields.h
>   SLIRP
>   M: Samuel Thibault <samuel.thibault@ens-lyon.org>
>   S: Maintained
> -F: slirp/
>   F: net/slirp.c
>   F: include/net/slirp.h
>   T: git https://people.debian.org/~sthibault/qemu.git slirp
> diff --git a/meson_options.txt b/meson_options.txt
> index 52b11cead4..668c859d84 100644
> --- a/meson_options.txt
> +++ b/meson_options.txt
> @@ -173,6 +173,8 @@ option('l2tpv3', type : 'feature', value : 'auto',
>          description: 'l2tpv3 network backend support')
>   option('netmap', type : 'feature', value : 'auto',
>          description: 'netmap network backend support')
> +option('slirp', type: 'feature', value: 'auto',
> +       description: 'libslirp user mode network backend support')
>   option('vde', type : 'feature', value : 'auto',
>          description: 'vde network backend support')
>   option('virglrenderer', type : 'feature', value : 'auto',
> @@ -223,9 +225,6 @@ option('virtiofsd', type: 'feature', value: 'auto',
>   option('capstone', type: 'combo', value: 'auto',
>          choices: ['disabled', 'enabled', 'auto', 'system', 'internal'],
>          description: 'Whether and how to find the capstone library')
> -option('slirp', type: 'combo', value: 'auto',
> -       choices: ['disabled', 'enabled', 'auto', 'system', 'internal'],
> -       description: 'Whether and how to find the slirp library')
>   option('fdt', type: 'combo', value: 'auto',
>          choices: ['disabled', 'enabled', 'auto', 'system', 'internal'],
>          description: 'Whether and how to find the libfdt library')
> diff --git a/scripts/archive-source.sh b/scripts/archive-source.sh
> index c6169db69f..23e042dacd 100755
> --- a/scripts/archive-source.sh
> +++ b/scripts/archive-source.sh
> @@ -26,7 +26,7 @@ sub_file="${sub_tdir}/submodule.tar"
>   # independent of what the developer currently has initialized
>   # in their checkout, because the build environment is completely
>   # different to the host OS.
> -submodules="dtc slirp meson ui/keycodemapdb"
> +submodules="dtc meson ui/keycodemapdb"
>   submodules="$submodules tests/fp/berkeley-softfloat-3 tests/fp/berkeley-testfloat-3"
>   sub_deinit=""
>   
> diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh
> index 1e26f4571e..dcfecb69ad 100644
> --- a/scripts/meson-buildoptions.sh
> +++ b/scripts/meson-buildoptions.sh
> @@ -23,8 +23,6 @@ meson_options_help() {
>     printf "%s\n" '  --enable-qom-cast-debug  cast debugging support'
>     printf "%s\n" '  --enable-rng-none        dummy RNG, avoid using /dev/(u)random and'
>     printf "%s\n" '                           getrandom()'
> -  printf "%s\n" '  --enable-slirp[=CHOICE]  Whether and how to find the slirp library'
> -  printf "%s\n" '                           (choices: auto/disabled/enabled/internal/system)'
>     printf "%s\n" '  --enable-strip           Strip targets on install'
>     printf "%s\n" '  --enable-tcg-interpreter TCG with bytecode interpreter (slow)'
>     printf "%s\n" '  --enable-trace-backends=CHOICE'
> @@ -103,6 +101,7 @@ meson_options_help() {
>     printf "%s\n" '  sdl-image       SDL Image support for icons'
>     printf "%s\n" '  seccomp         seccomp support'
>     printf "%s\n" '  selinux         SELinux support in qemu-nbd'
> +  printf "%s\n" '  slirp           libslirp user mode network backend support'
>     printf "%s\n" '  slirp-smbd      use smbd (at path --smbd=*) in slirp networking'
>     printf "%s\n" '  smartcard       CA smartcard emulation support'
>     printf "%s\n" '  snappy          snappy compression support'
> @@ -303,7 +302,6 @@ _meson_option_parse() {
>       --disable-selinux) printf "%s" -Dselinux=disabled ;;
>       --enable-slirp) printf "%s" -Dslirp=enabled ;;
>       --disable-slirp) printf "%s" -Dslirp=disabled ;;
> -    --enable-slirp=*) quote_sh "-Dslirp=$2" ;;
>       --enable-slirp-smbd) printf "%s" -Dslirp_smbd=enabled ;;
>       --disable-slirp-smbd) printf "%s" -Dslirp_smbd=disabled ;;
>       --enable-smartcard) printf "%s" -Dsmartcard=enabled ;;
> diff --git a/slirp b/slirp
> deleted file mode 160000
> index a88d9ace23..0000000000
> --- a/slirp
> +++ /dev/null
> @@ -1 +0,0 @@
> -Subproject commit a88d9ace234a24ce1c17189642ef9104799425e0


