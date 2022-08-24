Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8104859FE0F
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 17:15:02 +0200 (CEST)
Received: from localhost ([::1]:50888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQs5t-0006Dz-Gt
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 11:15:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oQs2l-0000l1-CD
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 11:11:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29894)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oQs2i-0003qm-K4
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 11:11:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661353904;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3GIJrf6S36ie5QG3sBjQUkb7rHIJrIMLztP+NcvxeTk=;
 b=fWvBkzHXEL50Rg/q3Yiz9Tvy1ZVOG8hB0CySggEvP+BcbCU3TJ5Mfu2c/1b2rqgsMi+cqI
 GyHAip6mwRl9HTSw8n7wRo2TluW35ohh23ZvI6QmhdNc5+/B1ibGoeYnz8GisQoAli4J7/
 lFk2MQFqMcY8Q1aq0CP4Q4/0w2acDvg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-543-4xmgNe5tOLuTC9zu_kUtuA-1; Wed, 24 Aug 2022 11:11:40 -0400
X-MC-Unique: 4xmgNe5tOLuTC9zu_kUtuA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4739F101A56D;
 Wed, 24 Aug 2022 15:11:40 +0000 (UTC)
Received: from thuth.com (unknown [10.39.194.35])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AFB34403348;
 Wed, 24 Aug 2022 15:11:38 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Warner Losh <imp@bsdimp.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 "Daniel P . Berrange" <berrange@redhat.com>
Subject: [PATCH v2 6/6] Remove the slirp submodule (i.e. compile only with an
 external libslirp)
Date: Wed, 24 Aug 2022 17:11:22 +0200
Message-Id: <20220824151122.704946-7-thuth@redhat.com>
In-Reply-To: <20220824151122.704946-1-thuth@redhat.com>
References: <20220824151122.704946-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Since QEMU 7.1 we don't support Ubuntu 18.04 anymore, so the last big
important Linux distro that did not have a pre-packaged libslirp has
been dismissed. All other major distros seem to have a libslirp package
in their distribution already - according to repology.org:

          Fedora 35: 4.6.1
  CentOS 8 (RHEL-8): 4.4.0
          Debian 11: 4.4.0
 OpenSUSE Leap 15.3: 4.3.1
   Ubuntu LTS 20.04: 4.1.0
      FreeBSD Ports: 4.7.0
      NetBSD pkgsrc: 4.7.0
           Homebrew: 4.7.0
        MSYS2 mingw: 4.7.0

The only one that was still missing a libslirp package is OpenBSD - but
the next version (OpenBSD 7.2 which will be shipped in October) is going
to include a libslirp package. Since QEMU 7.2 will be published after
OpenBSD 7.2, we should be fine there, too.

So there is no real urgent need for keeping the slirp submodule in
the QEMU tree anymore. Thus let's drop the slirp submodule now and
rely on the libslirp packages from the distributions instead.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 configure                     |  24 -------
 meson.build                   | 121 +++++++---------------------------
 .gitlab-ci.d/buildtest.yml    |  20 +++---
 .gitmodules                   |   3 -
 MAINTAINERS                   |   1 -
 meson_options.txt             |   5 +-
 scripts/archive-source.sh     |   2 +-
 scripts/meson-buildoptions.sh |   4 +-
 slirp                         |   1 -
 9 files changed, 34 insertions(+), 147 deletions(-)
 delete mode 160000 slirp

diff --git a/configure b/configure
index 72ab03f11a..b8ac0f8e56 100755
--- a/configure
+++ b/configure
@@ -321,11 +321,6 @@ vfio_user_server="disabled"
 # are included in the automatically generated help message)
 
 # 1. Track which submodules are needed
-if test "$default_feature" = no ; then
-  slirp="disabled"
-else
-  slirp="auto"
-fi
 fdt="auto"
 
 # 2. Automatically enable/disable other options
@@ -829,14 +824,6 @@ for opt do
   ;;
   --disable-tsan) tsan="no"
   ;;
-  --disable-slirp) slirp="disabled"
-  ;;
-  --enable-slirp) slirp="enabled"
-  ;;
-  --enable-slirp=git) slirp="internal"
-  ;;
-  --enable-slirp=*) slirp="$optarg"
-  ;;
   --disable-tcg) tcg="disabled"
                  plugins="no"
   ;;
@@ -1828,16 +1815,6 @@ EOF
   fi
 fi
 
-##########################################
-# check for slirp
-
-case "$slirp" in
-  auto | enabled | internal)
-    # Simpler to always update submodule, even if not needed.
-    git_submodules="${git_submodules} slirp"
-    ;;
-esac
-
 ##########################################
 # functions to probe cross compilers
 
@@ -2746,7 +2723,6 @@ if test "$skip_meson" = no; then
   test "$fdt" != auto && meson_option_add "-Dfdt=$fdt"
   test -n "${LIB_FUZZING_ENGINE+xxx}" && meson_option_add "-Dfuzzing_engine=$LIB_FUZZING_ENGINE"
   test "$qemu_suffix" != qemu && meson_option_add "-Dqemu_suffix=$qemu_suffix"
-  test "$slirp" != auto && meson_option_add "-Dslirp=$slirp"
   test "$smbd" != '' && meson_option_add "-Dsmbd=$smbd"
   test "$tcg" != enabled && meson_option_add "-Dtcg=$tcg"
   test "$vfio_user_server" != auto && meson_option_add "-Dvfio_user_server=$vfio_user_server"
diff --git a/meson.build b/meson.build
index 20fddbd707..fa55145d1a 100644
--- a/meson.build
+++ b/meson.build
@@ -643,6 +643,26 @@ else
                          method: 'pkg-config', kwargs: static_kwargs)
 endif
 
+slirp = not_found
+if not get_option('slirp').auto() or have_system
+  slirp = dependency('slirp', required: get_option('slirp'),
+                     method: 'pkg-config', kwargs: static_kwargs)
+  # slirp < 4.7 is incompatible with CFI support in QEMU.  This is because
+  # it passes function pointers within libslirp as callbacks for timers.
+  # When using a system-wide shared libslirp, the type information for the
+  # callback is missing and the timer call produces a false positive with CFI.
+  # Do not use the "version" keyword argument to produce a better error.
+  # with control-flow integrity.
+  if get_option('cfi') and slirp.found() and slirp.version().version_compare('<4.7')
+    if get_option('slirp').enabled()
+      error('Control-Flow Integrity requires libslirp 4.7.')
+    else
+      warning('Cannot use libslirp since Control-Flow Integrity requires libslirp >= 4.7.')
+      slirp = not_found
+    endif
+  endif
+endif
+
 vde = not_found
 if not get_option('vde').auto() or have_system or have_tools
   vde = cc.find_library('vdeplug', has_headers: ['libvdeplug.h'],
@@ -2614,103 +2634,6 @@ if not get_option('capstone').auto() or have_system or have_user
   endif
 endif
 
-slirp = not_found
-slirp_opt = 'disabled'
-if have_system
-  slirp_opt = get_option('slirp')
-  if slirp_opt in ['enabled', 'auto', 'system']
-    have_internal = fs.exists(meson.current_source_dir() / 'slirp/meson.build')
-    slirp_dep_required = (slirp_opt == 'system' or
-                          slirp_opt == 'enabled' and not have_internal)
-    slirp = dependency('slirp', kwargs: static_kwargs,
-                       method: 'pkg-config', version: '>=4.1.0',
-                       required: slirp_dep_required)
-    # slirp <4.7 is incompatible with CFI support in QEMU.  This is because
-    # it passes function pointers within libslirp as callbacks for timers.
-    # When using a system-wide shared libslirp, the type information for the
-    # callback is missing and the timer call produces a false positive with CFI.
-    # Do not use the "version" keyword argument to produce a better error.
-    # with control-flow integrity.
-    if get_option('cfi') and slirp.found() and slirp.version().version_compare('<4.7')
-      if slirp_dep_required
-        error('Control-Flow Integrity requires libslirp 4.7.')
-      else
-        warning('Control-Flow Integrity requires libslirp 4.7, not using system-wide libslirp.')
-        slirp = not_found
-      endif
-    endif
-    if slirp.found()
-      slirp_opt = 'system'
-    elif have_internal
-      slirp_opt = 'internal'
-    else
-      slirp_opt = 'disabled'
-    endif
-  endif
-  if slirp_opt == 'internal'
-    slirp_deps = []
-    if targetos == 'windows'
-      slirp_deps = cc.find_library('iphlpapi')
-    elif targetos == 'darwin'
-      slirp_deps = cc.find_library('resolv')
-    endif
-    slirp_conf = configuration_data()
-    slirp_conf.set('SLIRP_MAJOR_VERSION', meson.project_version().split('.')[0])
-    slirp_conf.set('SLIRP_MINOR_VERSION', meson.project_version().split('.')[1])
-    slirp_conf.set('SLIRP_MICRO_VERSION', meson.project_version().split('.')[2])
-    slirp_conf.set_quoted('SLIRP_VERSION_STRING', meson.project_version())
-    slirp_cargs = ['-DG_LOG_DOMAIN="Slirp"']
-    slirp_files = [
-      'slirp/src/arp_table.c',
-      'slirp/src/bootp.c',
-      'slirp/src/cksum.c',
-      'slirp/src/dhcpv6.c',
-      'slirp/src/dnssearch.c',
-      'slirp/src/if.c',
-      'slirp/src/ip6_icmp.c',
-      'slirp/src/ip6_input.c',
-      'slirp/src/ip6_output.c',
-      'slirp/src/ip_icmp.c',
-      'slirp/src/ip_input.c',
-      'slirp/src/ip_output.c',
-      'slirp/src/mbuf.c',
-      'slirp/src/misc.c',
-      'slirp/src/ncsi.c',
-      'slirp/src/ndp_table.c',
-      'slirp/src/sbuf.c',
-      'slirp/src/slirp.c',
-      'slirp/src/socket.c',
-      'slirp/src/state.c',
-      'slirp/src/stream.c',
-      'slirp/src/tcp_input.c',
-      'slirp/src/tcp_output.c',
-      'slirp/src/tcp_subr.c',
-      'slirp/src/tcp_timer.c',
-      'slirp/src/tftp.c',
-      'slirp/src/udp.c',
-      'slirp/src/udp6.c',
-      'slirp/src/util.c',
-      'slirp/src/version.c',
-      'slirp/src/vmstate.c',
-    ]
-
-    configure_file(
-      input : 'slirp/src/libslirp-version.h.in',
-      output : 'libslirp-version.h',
-      configuration: slirp_conf)
-
-    slirp_inc = include_directories('slirp', 'slirp/src')
-    libslirp = static_library('slirp',
-                              build_by_default: false,
-                              sources: slirp_files,
-                              c_args: slirp_cargs,
-                              include_directories: slirp_inc)
-    slirp = declare_dependency(link_with: libslirp,
-                               dependencies: slirp_deps,
-                               include_directories: slirp_inc)
-  endif
-endif
-
 libvfio_user_dep = not_found
 if have_system and vfio_user_server_allowed
   have_internal = fs.exists(meson.current_source_dir() / 'subprojects/libvfio-user/meson.build')
@@ -3717,7 +3640,7 @@ summary_info += {'genisoimage':       config_host['GENISOIMAGE']}
 if targetos == 'windows' and have_ga
   summary_info += {'wixl':            wixl}
 endif
-if slirp_opt != 'disabled' and have_system
+if slirp.found() and have_system
   summary_info += {'smbd':            have_slirp_smbd ? smbd_path : false}
 endif
 summary(summary_info, bool_yn: true, section: 'Host binaries')
@@ -3911,7 +3834,7 @@ summary_info += {'SDL image support': sdl_image}
 summary_info += {'GTK support':       gtk}
 summary_info += {'pixman':            pixman}
 summary_info += {'VTE support':       vte}
-summary_info += {'slirp support':     slirp_opt == 'internal' ? slirp_opt : slirp}
+summary_info += {'slirp support':     slirp}
 summary_info += {'libtasn1':          tasn1}
 summary_info += {'PAM':               pam}
 summary_info += {'iconv support':     iconv}
diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
index 1931b77b49..6c05c46397 100644
--- a/.gitlab-ci.d/buildtest.yml
+++ b/.gitlab-ci.d/buildtest.yml
@@ -41,8 +41,7 @@ build-system-ubuntu:
     job: amd64-ubuntu2004-container
   variables:
     IMAGE: ubuntu2004
-    CONFIGURE_ARGS: --enable-docs --enable-fdt=system --enable-slirp=system
-        --enable-capstone
+    CONFIGURE_ARGS: --enable-docs --enable-fdt=system --enable-capstone
     TARGETS: aarch64-softmmu alpha-softmmu cris-softmmu hppa-softmmu
       microblazeel-softmmu mips64el-softmmu
     MAKE_CHECK_ARGS: check-build
@@ -120,7 +119,7 @@ build-system-fedora:
   variables:
     IMAGE: fedora
     CONFIGURE_ARGS: --disable-gcrypt --enable-nettle --enable-docs
-             --enable-fdt=system --enable-slirp=system --enable-capstone
+             --enable-fdt=system --enable-slirp --enable-capstone
     TARGETS: tricore-softmmu microblaze-softmmu mips-softmmu
       xtensa-softmmu m68k-softmmu riscv32-softmmu ppc-softmmu sparc64-softmmu
     MAKE_CHECK_ARGS: check-build
@@ -339,10 +338,8 @@ clang-user:
 # On gitlab runners, default value sometimes end up calling 2 lds concurrently and
 # triggers an Out-Of-Memory error
 #
-# Since slirp callbacks are used in QEMU Timers, slirp needs to be compiled together
-# with QEMU and linked as a static library to avoid false positives in CFI checks.
-# This can be accomplished by using -enable-slirp=git, which avoids the use of
-# a system-wide version of the library
+# Since slirp callbacks are used in QEMU Timers, we cannot use libslirp with
+# CFI builds, and thus have to disable it here.
 #
 # Split in three sets of build/check/avocado to limit the execution time of each
 # job
@@ -355,7 +352,7 @@ build-cfi-aarch64:
     AR: llvm-ar
     IMAGE: fedora
     CONFIGURE_ARGS: --cc=clang --cxx=clang++ --enable-cfi --enable-cfi-debug
-      --enable-safe-stack --enable-slirp=git
+      --enable-safe-stack --disable-slirp
     TARGETS: aarch64-softmmu
     MAKE_CHECK_ARGS: check-build
     # FIXME: This job is often failing, likely due to out-of-memory problems in
@@ -395,7 +392,7 @@ build-cfi-ppc64-s390x:
     AR: llvm-ar
     IMAGE: fedora
     CONFIGURE_ARGS: --cc=clang --cxx=clang++ --enable-cfi --enable-cfi-debug
-      --enable-safe-stack --enable-slirp=git
+      --enable-safe-stack --disable-slirp
     TARGETS: ppc64-softmmu s390x-softmmu
     MAKE_CHECK_ARGS: check-build
     # FIXME: This job is often failing, likely due to out-of-memory problems in
@@ -435,7 +432,7 @@ build-cfi-x86_64:
     AR: llvm-ar
     IMAGE: fedora
     CONFIGURE_ARGS: --cc=clang --cxx=clang++ --enable-cfi --enable-cfi-debug
-      --enable-safe-stack --enable-slirp=git
+      --enable-safe-stack --disable-slirp
     TARGETS: x86_64-softmmu
     MAKE_CHECK_ARGS: check-build
   timeout: 70m
@@ -469,7 +466,7 @@ tsan-build:
   variables:
     IMAGE: ubuntu2004
     CONFIGURE_ARGS: --enable-tsan --cc=clang-10 --cxx=clang++-10
-          --enable-trace-backends=ust --enable-fdt=system --enable-slirp=system
+          --enable-trace-backends=ust --enable-fdt=system --disable-slirp
     TARGETS: x86_64-softmmu ppc64-softmmu riscv64-softmmu x86_64-linux-user
     MAKE_CHECK_ARGS: bench V=1
 
@@ -571,7 +568,6 @@ build-without-default-features:
       --disable-capstone
       --disable-pie
       --disable-qom-cast-debug
-      --disable-slirp
       --disable-strip
     TARGETS: avr-softmmu i386-softmmu mips64-softmmu s390x-softmmu sh4-softmmu
       sparc64-softmmu hexagon-linux-user i386-linux-user s390x-linux-user
diff --git a/.gitmodules b/.gitmodules
index aedd9a03d4..24cffa87d4 100644
--- a/.gitmodules
+++ b/.gitmodules
@@ -46,9 +46,6 @@
 [submodule "roms/edk2"]
 	path = roms/edk2
 	url = https://gitlab.com/qemu-project/edk2.git
-[submodule "slirp"]
-	path = slirp
-	url = https://gitlab.com/qemu-project/libslirp.git
 [submodule "roms/opensbi"]
 	path = roms/opensbi
 	url = 	https://gitlab.com/qemu-project/opensbi.git
diff --git a/MAINTAINERS b/MAINTAINERS
index 5ce4227ff6..5e2c0d649e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2978,7 +2978,6 @@ F: include/hw/registerfields.h
 SLIRP
 M: Samuel Thibault <samuel.thibault@ens-lyon.org>
 S: Maintained
-F: slirp/
 F: net/slirp.c
 F: include/net/slirp.h
 T: git https://people.debian.org/~sthibault/qemu.git slirp
diff --git a/meson_options.txt b/meson_options.txt
index e58e158396..53fca1c554 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -199,6 +199,8 @@ option('l2tpv3', type : 'feature', value : 'auto',
        description: 'l2tpv3 network backend support')
 option('netmap', type : 'feature', value : 'auto',
        description: 'netmap network backend support')
+option('slirp', type: 'feature', value: 'auto',
+       description: 'libslirp user mode network backend support')
 option('vde', type : 'feature', value : 'auto',
        description: 'vde network backend support')
 option('vmnet', type : 'feature', value : 'auto',
@@ -264,9 +266,6 @@ option('vduse_blk_export', type: 'feature', value: 'auto',
 
 option('capstone', type: 'feature', value: 'auto',
        description: 'Whether and how to find the capstone library')
-option('slirp', type: 'combo', value: 'auto',
-       choices: ['disabled', 'enabled', 'auto', 'system', 'internal'],
-       description: 'Whether and how to find the slirp library')
 option('fdt', type: 'combo', value: 'auto',
        choices: ['disabled', 'enabled', 'auto', 'system', 'internal'],
        description: 'Whether and how to find the libfdt library')
diff --git a/scripts/archive-source.sh b/scripts/archive-source.sh
index c6169db69f..23e042dacd 100755
--- a/scripts/archive-source.sh
+++ b/scripts/archive-source.sh
@@ -26,7 +26,7 @@ sub_file="${sub_tdir}/submodule.tar"
 # independent of what the developer currently has initialized
 # in their checkout, because the build environment is completely
 # different to the host OS.
-submodules="dtc slirp meson ui/keycodemapdb"
+submodules="dtc meson ui/keycodemapdb"
 submodules="$submodules tests/fp/berkeley-softfloat-3 tests/fp/berkeley-testfloat-3"
 sub_deinit=""
 
diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh
index 359b04e0e6..c68ba32ce2 100644
--- a/scripts/meson-buildoptions.sh
+++ b/scripts/meson-buildoptions.sh
@@ -35,8 +35,6 @@ meson_options_help() {
   printf "%s\n" '  --enable-qom-cast-debug  cast debugging support'
   printf "%s\n" '  --enable-rng-none        dummy RNG, avoid using /dev/(u)random and'
   printf "%s\n" '                           getrandom()'
-  printf "%s\n" '  --enable-slirp[=CHOICE]  Whether and how to find the slirp library'
-  printf "%s\n" '                           (choices: auto/disabled/enabled/internal/system)'
   printf "%s\n" '  --enable-strip           Strip targets on install'
   printf "%s\n" '  --enable-tcg-interpreter TCG with bytecode interpreter (slow)'
   printf "%s\n" '  --enable-trace-backends=CHOICES'
@@ -141,6 +139,7 @@ meson_options_help() {
   printf "%s\n" '  sdl-image       SDL Image support for icons'
   printf "%s\n" '  seccomp         seccomp support'
   printf "%s\n" '  selinux         SELinux support in qemu-nbd'
+  printf "%s\n" '  slirp           libslirp user mode network backend support'
   printf "%s\n" '  slirp-smbd      use smbd (at path --smbd=*) in slirp networking'
   printf "%s\n" '  smartcard       CA smartcard emulation support'
   printf "%s\n" '  snappy          snappy compression support'
@@ -386,7 +385,6 @@ _meson_option_parse() {
     --disable-selinux) printf "%s" -Dselinux=disabled ;;
     --enable-slirp) printf "%s" -Dslirp=enabled ;;
     --disable-slirp) printf "%s" -Dslirp=disabled ;;
-    --enable-slirp=*) quote_sh "-Dslirp=$2" ;;
     --enable-slirp-smbd) printf "%s" -Dslirp_smbd=enabled ;;
     --disable-slirp-smbd) printf "%s" -Dslirp_smbd=disabled ;;
     --enable-smartcard) printf "%s" -Dsmartcard=enabled ;;
diff --git a/slirp b/slirp
deleted file mode 160000
index 9d59bb775d..0000000000
--- a/slirp
+++ /dev/null
@@ -1 +0,0 @@
-Subproject commit 9d59bb775d6294c8b447a88512f7bb43f12a25a8
-- 
2.31.1


