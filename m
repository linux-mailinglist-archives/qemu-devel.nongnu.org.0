Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C485F6A8369
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 14:20:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXiq7-0002Pk-2H; Thu, 02 Mar 2023 08:19:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pXiq2-0002MS-82
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 08:19:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pXiq0-0001vu-Ai
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 08:19:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677763151;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C92cwbrUIEb79ztRwJO63K6JAXeMJ8+BlbvlMZXumCU=;
 b=ieVCPBmBDIH0yzmVlcG1iOGUOSNkqcCmNq73ZVi/1QVLTI2+tG7AhwwsAY7UKW/QBH0aE7
 HxzHRQF5I3zV03I5R9gLNWQrixrd8y6hkFIMNNp9Ip5r/jRjaKQIrMpbu6fBmOmjW8sdPZ
 N9MqA0x7uJEtBESNcixrc9nGEsKy4vc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-55-MmE3ldrwMceYKrmkwpUYGg-1; Thu, 02 Mar 2023 08:19:10 -0500
X-MC-Unique: MmE3ldrwMceYKrmkwpUYGg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E0128858F09;
 Thu,  2 Mar 2023 13:19:09 +0000 (UTC)
Received: from localhost (unknown [10.39.208.35])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 40D7B40C6EC4;
 Thu,  2 Mar 2023 13:19:07 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 John Snow <jsnow@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>
Subject: [PATCH 4/4] build-sys: replace dtc submodule with dtc.wrap
Date: Thu,  2 Mar 2023 17:18:48 +0400
Message-Id: <20230302131848.1527460-5-marcandre.lureau@redhat.com>
In-Reply-To: <20230302131848.1527460-1-marcandre.lureau@redhat.com>
References: <20230302131848.1527460-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
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

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Use meson wrap fallback for libfdt. Simplify handling of
fallback/internal build and get rid of a submodule.

This drops support for ./configure --enable-fdt=git/--enable-fdt=internal:
if the system version is enough, it will use it, otherwise it can fall back
on the wrapped subproject.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 configure                     | 21 -------------
 meson.build                   | 56 +++++------------------------------
 .gitignore                    |  1 +
 .gitmodules                   |  3 --
 dtc                           |  1 -
 meson_options.txt             |  5 ++--
 scripts/meson-buildoptions.sh |  4 +--
 subprojects/dtc.wrap          |  6 ++++
 8 files changed, 18 insertions(+), 79 deletions(-)
 delete mode 160000 dtc
 create mode 100644 subprojects/dtc.wrap

diff --git a/configure b/configure
index 02b4aa4ce9..051a5cc69b 100755
--- a/configure
+++ b/configure
@@ -297,8 +297,6 @@ vfio_user_server="disabled"
 # are included in the automatically generated help message)
 
 # 1. Track which submodules are needed
-fdt="auto"
-
 # 2. Automatically enable/disable other options
 tcg="auto"
 cfi="false"
@@ -860,14 +858,6 @@ for opt do
   ;;
   --disable-cfi) cfi="false"
   ;;
-  --disable-fdt) fdt="disabled"
-  ;;
-  --enable-fdt) fdt="enabled"
-  ;;
-  --enable-fdt=git) fdt="internal"
-  ;;
-  --enable-fdt=*) fdt="$optarg"
-  ;;
   --with-coroutine=*) coroutine="$optarg"
   ;;
   --with-git=*) git="$optarg"
@@ -1546,16 +1536,6 @@ if ! compile_prog "$glib_cflags -Werror" "$glib_libs" ; then
     fi
 fi
 
-##########################################
-# fdt probe
-
-case "$fdt" in
-  auto | enabled | internal)
-    # Simpler to always update submodule, even if not needed.
-    git_submodules="${git_submodules} dtc"
-    ;;
-esac
-
 ##########################################
 # check and set a backend for coroutine
 
@@ -2597,7 +2577,6 @@ if test "$skip_meson" = no; then
 
   # QEMU options
   test "$cfi" != false && meson_option_add "-Dcfi=$cfi"
-  test "$fdt" != auto && meson_option_add "-Dfdt=$fdt"
   test -n "${LIB_FUZZING_ENGINE+xxx}" && meson_option_add "-Dfuzzing_engine=$LIB_FUZZING_ENGINE"
   test "$qemu_suffix" != qemu && meson_option_add "-Dqemu_suffix=$qemu_suffix"
   test "$smbd" != '' && meson_option_add "-Dsmbd=$smbd"
diff --git a/meson.build b/meson.build
index 77d2ae87e4..9017141d7d 100644
--- a/meson.build
+++ b/meson.build
@@ -2759,54 +2759,14 @@ endif
 
 fdt = not_found
 if have_system
-  fdt_opt = get_option('fdt')
-  if fdt_opt in ['enabled', 'auto', 'system']
-    have_internal = fs.exists(meson.current_source_dir() / 'dtc/libfdt/Makefile.libfdt')
-    fdt = cc.find_library('fdt', kwargs: static_kwargs,
-                          required: fdt_opt == 'system' or
-                                    fdt_opt == 'enabled' and not have_internal)
-    if fdt.found() and cc.links('''
-       #include <libfdt.h>
-       #include <libfdt_env.h>
-       int main(void) { fdt_find_max_phandle(NULL, NULL); return 0; }''',
-         dependencies: fdt)
-      fdt_opt = 'system'
-    elif fdt_opt == 'system'
-       error('system libfdt requested, but it is too old (1.5.1 or newer required)')
-    elif have_internal
-      fdt_opt = 'internal'
-    else
-      fdt_opt = 'disabled'
-      fdt = not_found
+    # libfdt is not always shipped with a pkgconfig file.
+    fdt = cc.find_library('fdt', kwargs: static_kwargs, required: false)
+    if not fdt.found() or not cc.has_function('fdt_find_max_phandle', dependencies: fdt)
+      fdt = dependency('fdt', kwargs: static_kwargs,
+                method: 'pkg-config', version: '>=1.5.1',
+                required: (get_option('fdt').auto() and fdt_required.length() > 0) or get_option('fdt').enabled(),
+                default_options: ['python=disabled', 'tools=false'])
     endif
-  endif
-  if fdt_opt == 'internal'
-    fdt_files = files(
-      'dtc/libfdt/fdt.c',
-      'dtc/libfdt/fdt_ro.c',
-      'dtc/libfdt/fdt_wip.c',
-      'dtc/libfdt/fdt_sw.c',
-      'dtc/libfdt/fdt_rw.c',
-      'dtc/libfdt/fdt_strerror.c',
-      'dtc/libfdt/fdt_empty_tree.c',
-      'dtc/libfdt/fdt_addresses.c',
-      'dtc/libfdt/fdt_overlay.c',
-      'dtc/libfdt/fdt_check.c',
-    )
-
-    fdt_inc = include_directories('dtc/libfdt')
-    libfdt = static_library('fdt',
-                            build_by_default: false,
-                            sources: fdt_files,
-                            include_directories: fdt_inc)
-    fdt = declare_dependency(link_with: libfdt,
-                             include_directories: fdt_inc)
-  endif
-else
-  fdt_opt = 'disabled'
-endif
-if not fdt.found() and fdt_required.length() > 0
-  error('fdt not available but required by targets ' + ', '.join(fdt_required))
 endif
 
 config_host_data.set('CONFIG_CAPSTONE', capstone.found())
@@ -3989,7 +3949,7 @@ summary_info += {'Linux io_uring support': linux_io_uring}
 summary_info += {'ATTR/XATTR support': libattr}
 summary_info += {'RDMA support':      rdma}
 summary_info += {'PVRDMA support':    have_pvrdma}
-summary_info += {'fdt support':       fdt_opt == 'disabled' ? false : fdt_opt}
+summary_info += {'fdt support':       fdt}
 summary_info += {'libcap-ng support': libcap_ng}
 summary_info += {'bpf support':       libbpf}
 summary_info += {'spice protocol support': spice_protocol}
diff --git a/.gitignore b/.gitignore
index 1ea59f4819..13662d4f24 100644
--- a/.gitignore
+++ b/.gitignore
@@ -21,4 +21,5 @@ GTAGS
 *.patch
 *.gcov
 
+/subprojects/dtc
 /subprojects/slirp
diff --git a/.gitmodules b/.gitmodules
index 6ce5bf49c5..410a00d566 100644
--- a/.gitmodules
+++ b/.gitmodules
@@ -13,9 +13,6 @@
 [submodule "roms/qemu-palcode"]
 	path = roms/qemu-palcode
 	url = https://gitlab.com/qemu-project/qemu-palcode.git
-[submodule "dtc"]
-	path = dtc
-	url = https://gitlab.com/qemu-project/dtc.git
 [submodule "roms/u-boot"]
 	path = roms/u-boot
 	url = https://gitlab.com/qemu-project/u-boot.git
diff --git a/dtc b/dtc
deleted file mode 160000
index b6910bec11..0000000000
--- a/dtc
+++ /dev/null
@@ -1 +0,0 @@
-Subproject commit b6910bec11614980a21e46fbccc35934b671bd81
diff --git a/meson_options.txt b/meson_options.txt
index fc9447d267..493100ba4c 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -279,9 +279,8 @@ option('vduse_blk_export', type: 'feature', value: 'auto',
 
 option('capstone', type: 'feature', value: 'auto',
        description: 'Whether and how to find the capstone library')
-option('fdt', type: 'combo', value: 'auto',
-       choices: ['disabled', 'enabled', 'auto', 'system', 'internal'],
-       description: 'Whether and how to find the libfdt library')
+option('fdt', type: 'feature', value: 'auto',
+       description: 'libfdt device tree library')
 
 option('selinux', type: 'feature', value: 'auto',
        description: 'SELinux support in qemu-nbd')
diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh
index 009fab1515..2a8e91a60c 100644
--- a/scripts/meson-buildoptions.sh
+++ b/scripts/meson-buildoptions.sh
@@ -24,8 +24,6 @@ meson_options_help() {
   printf "%s\n" '  --enable-debug-mutex     mutex debugging support'
   printf "%s\n" '  --enable-debug-stack-usage'
   printf "%s\n" '                           measure coroutine stack usage'
-  printf "%s\n" '  --enable-fdt[=CHOICE]    Whether and how to find the libfdt library'
-  printf "%s\n" '                           (choices: auto/disabled/enabled/internal/system)'
   printf "%s\n" '  --enable-fuzzing         build fuzzing targets'
   printf "%s\n" '  --enable-gcov            Enable coverage tracking.'
   printf "%s\n" '  --enable-gprof           QEMU profiling with gprof'
@@ -91,6 +89,7 @@ meson_options_help() {
   printf "%s\n" '  dmg             dmg image format support'
   printf "%s\n" '  docs            Documentations build support'
   printf "%s\n" '  dsound          DirectSound sound support'
+  printf "%s\n" '  fdt             libfdt device tree library'
   printf "%s\n" '  fuse            FUSE block device export'
   printf "%s\n" '  fuse-lseek      SEEK_HOLE/SEEK_DATA support for FUSE exports'
   printf "%s\n" '  gcrypt          libgcrypt cryptography support'
@@ -262,7 +261,6 @@ _meson_option_parse() {
     --disable-dsound) printf "%s" -Ddsound=disabled ;;
     --enable-fdt) printf "%s" -Dfdt=enabled ;;
     --disable-fdt) printf "%s" -Dfdt=disabled ;;
-    --enable-fdt=*) quote_sh "-Dfdt=$2" ;;
     --enable-fuse) printf "%s" -Dfuse=enabled ;;
     --disable-fuse) printf "%s" -Dfuse=disabled ;;
     --enable-fuse-lseek) printf "%s" -Dfuse_lseek=enabled ;;
diff --git a/subprojects/dtc.wrap b/subprojects/dtc.wrap
new file mode 100644
index 0000000000..da789704d0
--- /dev/null
+++ b/subprojects/dtc.wrap
@@ -0,0 +1,6 @@
+[wrap-git]
+url = https://github.com/dgibson/dtc.git
+revision = 72fc810c3025f07de718f5f32a290a6cd5d1f4ee
+
+[provide]
+fdt = libfdt_dep
-- 
2.39.2


