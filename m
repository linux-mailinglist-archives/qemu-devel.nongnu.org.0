Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2BB950CA57
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Apr 2022 15:06:00 +0200 (CEST)
Received: from localhost ([::1]:39062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1niFSZ-0006VN-So
	for lists+qemu-devel@lfdr.de; Sat, 23 Apr 2022 09:05:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1niFFP-0007Hc-QQ
 for qemu-devel@nongnu.org; Sat, 23 Apr 2022 08:52:23 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:41496)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1niFFN-000591-P0
 for qemu-devel@nongnu.org; Sat, 23 Apr 2022 08:52:23 -0400
Received: by mail-ej1-x631.google.com with SMTP id y10so21132070ejw.8
 for <qemu-devel@nongnu.org>; Sat, 23 Apr 2022 05:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9/t8b1B+mUb45QLloontMZsmfPWneD1hpUFMiqhFQJY=;
 b=GZ4jpNjn4jw7VxOppU/hrTBifr09g3+jTCPJVSfj0Qvflf5hbjfRyXEg/coUlqUIZK
 40EXEeV18YI27cbM7udokjiDE/qH89UsPqO4D5zLEF1u+uHGxFLNohFgLdTB5xuON5tL
 5q86TTE41QZDc6zThCUsSaUQvULNWHPSuR2YeuPdh66716jH6PjcSEiRK1aQx6TLTL58
 R1leV0htymQQ3nZtD2ldLAWXHkw9+uzE0CqDqOUTVd+1yB4SrYh6JM2XF3dEJr3cWDMs
 AcNveQQar200smkM9QvmcGGdY2BKiesRr9BBrZsgPNbvJBdbQU6rhwbb15/ZIU3bgObg
 VXeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=9/t8b1B+mUb45QLloontMZsmfPWneD1hpUFMiqhFQJY=;
 b=MAicPl/LjwFptYcaX0zLIOexUiaoH0ajTFVRyM7DU4tKI6feaZSuJD3p8az0r8Qlea
 ptu0nNwLA67VqgzYTwpu5gCzXv1uA7psXnf/V3KnG1ds5SuObDYHhK/Kh/JQvPEX3LVl
 Jll/ptakWj6dM5JhVXuE21ruIyg15m4o37EMO9zftUdRzziYeNeQvst0LIe/7boJ23ji
 t/WbcYkfUoJ/TyKeDhzq50UV7038uhDxwK4XmaxdHG/FcDdVdw2UIyshMUcHAhn32Rj6
 rAphNsOT2tbor7y/FvTn5sUapnMm1BtwykKxxvn//e1BDxFie1K1vY8wD5hp/wF1qYQy
 xzcQ==
X-Gm-Message-State: AOAM5303mErrij+P6X+G5REk7XJzpDWwvIMiScD5V4Doip+lqs2hQVvR
 aQ6X8/UnaVFD5RFG1zhWAo9gw+Xdl1UQgw==
X-Google-Smtp-Source: ABdhPJx9sJ/nGGuBDzUnIUJCt6qnr+hGWTP1ePY9LkBk2Wb+3QINUFAbKdbpzRQ0K0SpPnsw9InOgg==
X-Received: by 2002:a17:907:6e0f:b0:6ef:f51a:fe8c with SMTP id
 sd15-20020a1709076e0f00b006eff51afe8cmr8315327ejc.661.1650718340335; 
 Sat, 23 Apr 2022 05:52:20 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 bo14-20020a170906d04e00b006ce98d9c3e3sm1655573ejb.194.2022.04.23.05.52.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Apr 2022 05:52:19 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 11/34] meson, configure: move libgio test to meson
Date: Sat, 23 Apr 2022 14:51:28 +0200
Message-Id: <20220423125151.27821-12-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220423125151.27821-1-pbonzini@redhat.com>
References: <20220423125151.27821-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x631.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PP_MIME_FAKE_ASCII_TEXT=0.999, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 backends/meson.build          |  2 +-
 configure                     | 58 -----------------------------------
 meson.build                   | 32 ++++++++++++++++---
 meson_options.txt             |  2 ++
 scripts/meson-buildoptions.sh |  3 ++
 tests/qtest/meson.build       |  5 ++-
 ui/meson.build                |  7 ++---
 util/meson.build              |  2 +-
 8 files changed, 39 insertions(+), 72 deletions(-)

diff --git a/backends/meson.build b/backends/meson.build
index 6e68945528..535c3ca7dd 100644
--- a/backends/meson.build
+++ b/backends/meson.build
@@ -15,7 +15,7 @@ softmmu_ss.add(when: 'CONFIG_LINUX', if_true: files('hostmem-memfd.c'))
 softmmu_ss.add(when: ['CONFIG_VHOST_USER', 'CONFIG_VIRTIO'], if_true: files('vhost-user.c'))
 softmmu_ss.add(when: 'CONFIG_VIRTIO_CRYPTO', if_true: files('cryptodev-vhost.c'))
 softmmu_ss.add(when: ['CONFIG_VIRTIO_CRYPTO', 'CONFIG_VHOST_CRYPTO'], if_true: files('cryptodev-vhost-user.c'))
-softmmu_ss.add(when: 'CONFIG_GIO', if_true: [files('dbus-vmstate.c'), gio])
+softmmu_ss.add(when: gio, if_true: files('dbus-vmstate.c'))
 softmmu_ss.add(when: 'CONFIG_SGX', if_true: files('hostmem-epc.c'))
 
 subdir('tpm')
diff --git a/configure b/configure
index d527a9c22e..1fb70bf614 100755
--- a/configure
+++ b/configure
@@ -325,7 +325,6 @@ plugins="$default_feature"
 meson=""
 meson_args=""
 ninja=""
-gio="$default_feature"
 skip_meson=no
 
 # The following Meson options are handled manually (still they
@@ -1008,10 +1007,6 @@ for opt do
   ;;
   --gdb=*) gdb_bin="$optarg"
   ;;
-  --enable-gio) gio=yes
-  ;;
-  --disable-gio) gio=no
-  ;;
   # backwards compatibility options
   --enable-trace-backend=*) meson_option_parse "--enable-trace-backends=$optarg" "$optarg"
   ;;
@@ -1236,7 +1231,6 @@ cat << EOF
   vhost-kernel    vhost kernel backend support
   vhost-user      vhost-user backend support
   vhost-vdpa      vhost-vdpa kernel backend support
-  gio             libgio support
 
 NOTE: The object files are built at the place where configure is launched
 EOF
@@ -2047,50 +2041,6 @@ if test "$static" = yes && test "$mingw32" = yes; then
     glib_cflags="-DGLIB_STATIC_COMPILATION $glib_cflags"
 fi
 
-if ! test "$gio" = "no"; then
-    pass=no
-    if $pkg_config --atleast-version=$glib_req_ver gio-2.0; then
-        gio_cflags=$($pkg_config --cflags gio-2.0)
-        gio_libs=$($pkg_config --libs gio-2.0)
-        gdbus_codegen=$($pkg_config --variable=gdbus_codegen gio-2.0)
-        if ! has "$gdbus_codegen"; then
-            gdbus_codegen=
-        fi
-        # Check that the libraries actually work -- Ubuntu 18.04 ships
-        # with pkg-config --static --libs data for gio-2.0 that is missing
-        # -lblkid and will give a link error.
-        cat > $TMPC <<EOF
-#include <gio/gio.h>
-int main(void)
-{
-    g_dbus_proxy_new_sync(0, 0, 0, 0, 0, 0, 0, 0);
-    return 0;
-}
-EOF
-        if compile_prog "$gio_cflags" "$gio_libs" ; then
-            pass=yes
-        else
-            pass=no
-        fi
-
-        if test "$pass" = "yes" &&
-            $pkg_config --atleast-version=$glib_req_ver gio-unix-2.0; then
-            gio_cflags="$gio_cflags $($pkg_config --cflags gio-unix-2.0)"
-            gio_libs="$gio_libs $($pkg_config --libs gio-unix-2.0)"
-        fi
-    fi
-
-    if test "$pass" = "no"; then
-        if test "$gio" = "yes"; then
-            feature_not_found "gio" "Install libgio >= 2.0"
-        else
-            gio=no
-        fi
-    else
-        gio=yes
-    fi
-fi
-
 # Sanity check that the current size_t matches the
 # size that glib thinks it should be. This catches
 # problems on multi-arch where people try to build
@@ -2616,14 +2566,6 @@ fi
 if test "$module_upgrades" = "yes"; then
   echo "CONFIG_MODULE_UPGRADES=y" >> $config_host_mak
 fi
-if test "$gio" = "yes" ; then
-    echo "CONFIG_GIO=y" >> $config_host_mak
-    echo "GIO_CFLAGS=$gio_cflags" >> $config_host_mak
-    echo "GIO_LIBS=$gio_libs" >> $config_host_mak
-fi
-if test "$gdbus_codegen" != "" ; then
-    echo "GDBUS_CODEGEN=$gdbus_codegen" >> $config_host_mak
-fi
 echo "CONFIG_TLS_PRIORITY=\"$tls_priority\"" >> $config_host_mak
 
 if test "$xen" = "enabled" ; then
diff --git a/meson.build b/meson.build
index a26eb878ea..e6015fcae4 100644
--- a/meson.build
+++ b/meson.build
@@ -448,11 +448,32 @@ glib = declare_dependency(compile_args: config_host['GLIB_CFLAGS'].split(),
 meson.override_dependency('glib-2.0', glib)
 
 gio = not_found
-if 'CONFIG_GIO' in config_host
-  gio = declare_dependency(compile_args: config_host['GIO_CFLAGS'].split(),
-                           link_args: config_host['GIO_LIBS'].split(),
-                           version: config_host['GLIB_VERSION'])
+gdbus_codegen = not_found
+if not get_option('gio').auto() or have_system
+  gio = dependency('gio-2.0', required: get_option('gio'),
+                   method: 'pkg-config', kwargs: static_kwargs)
+  if gio.found() and not cc.links('''
+    #include <gio/gio.h>
+    int main(void)
+    {
+      g_dbus_proxy_new_sync(0, 0, 0, 0, 0, 0, 0, 0);
+      return 0;
+    }''', dependencies: [glib, gio])
+    if get_option('gio').enabled()
+      error('The installed libgio is broken for static linking')
+    endif
+    gio = not_found
+  endif
+  if gio.found()
+    gdbus_codegen = find_program(gio.get_variable('gdbus_codegen'),
+                                 required: get_option('gio'))
+    gio_unix = dependency('gio-unix-2.0', required: get_option('gio'),
+                          method: 'pkg-config', kwargs: static_kwargs)
+    gio = declare_dependency(dependencies: [gio, gio_unix],
+                             version: gio.version())
+  endif
 endif
+
 lttng = not_found
 if 'ust' in get_option('trace_backends')
   lttng = dependency('lttng-ust', required: true, version: '>= 2.1',
@@ -1478,7 +1499,7 @@ dbus_display = get_option('dbus_display') \
            error_message: '-display dbus requires glib>=2.64') \
   .require(enable_modules,
            error_message: '-display dbus requires --enable-modules') \
-  .require(config_host.has_key('GDBUS_CODEGEN'),
+  .require(gdbus_codegen.found(),
            error_message: '-display dbus requires gdbus-codegen') \
   .allowed()
 
@@ -1540,6 +1561,7 @@ config_host_data.set('CONFIG_MPATH_NEW_API', mpathpersist_new_api)
 config_host_data.set('CONFIG_CURL', curl.found())
 config_host_data.set('CONFIG_CURSES', curses.found())
 config_host_data.set('CONFIG_GBM', gbm.found())
+config_host_data.set('CONFIG_GIO', gio.found())
 config_host_data.set('CONFIG_GLUSTERFS', glusterfs.found())
 if glusterfs.found()
   config_host_data.set('CONFIG_GLUSTERFS_XLATOR_OPT', glusterfs.version().version_compare('>=4'))
diff --git a/meson_options.txt b/meson_options.txt
index d58c69315c..d140c0ef89 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -109,6 +109,8 @@ option('cocoa', type : 'feature', value : 'auto',
        description: 'Cocoa user interface (macOS only)')
 option('curl', type : 'feature', value : 'auto',
        description: 'CURL block device driver')
+option('gio', type : 'feature', value : 'auto',
+       description: 'use libgio for D-Bus support')
 option('glusterfs', type : 'feature', value : 'auto',
        description: 'Glusterfs block device driver')
 option('libiscsi', type : 'feature', value : 'auto',
diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh
index 0daeb11fd3..92be3e6187 100644
--- a/scripts/meson-buildoptions.sh
+++ b/scripts/meson-buildoptions.sh
@@ -59,6 +59,7 @@ meson_options_help() {
   printf "%s\n" '  fuse-lseek      SEEK_HOLE/SEEK_DATA support for FUSE exports'
   printf "%s\n" '  gcrypt          libgcrypt cryptography support'
   printf "%s\n" '  gettext         Localization of the GTK+ user interface'
+  printf "%s\n" '  gio             use libgio for D-Bus support'
   printf "%s\n" '  glusterfs       Glusterfs block device driver'
   printf "%s\n" '  gnutls          GNUTLS cryptography support'
   printf "%s\n" '  gtk             GTK+ user interface'
@@ -208,6 +209,8 @@ _meson_option_parse() {
     --disable-gcrypt) printf "%s" -Dgcrypt=disabled ;;
     --enable-gettext) printf "%s" -Dgettext=enabled ;;
     --disable-gettext) printf "%s" -Dgettext=disabled ;;
+    --enable-gio) printf "%s" -Dgio=enabled ;;
+    --disable-gio) printf "%s" -Dgio=disabled ;;
     --enable-glusterfs) printf "%s" -Dglusterfs=enabled ;;
     --disable-glusterfs) printf "%s" -Dglusterfs=disabled ;;
     --enable-gnutls) printf "%s" -Dgnutls=enabled ;;
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 22e1361210..6b9807c183 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -98,14 +98,13 @@ if dbus_display
 endif
 
 dbus_daemon = find_program('dbus-daemon', required: false)
-if dbus_daemon.found() and config_host.has_key('GDBUS_CODEGEN')
+if dbus_daemon.found() and gdbus_codegen.found()
   # Temporarily disabled due to Patchew failures:
   #qtests_i386 += ['dbus-vmstate-test']
   dbus_vmstate1 = custom_target('dbus-vmstate description',
                                 output: ['dbus-vmstate1.h', 'dbus-vmstate1.c'],
                                 input: meson.project_source_root() / 'backends/dbus-vmstate1.xml',
-                                command: [config_host['GDBUS_CODEGEN'],
-                                          '@INPUT@',
+                                command: [gdbus_codegen, '@INPUT@',
                                           '--interface-prefix', 'org.qemu',
                                           '--generate-c-code', '@BASENAME@']).to_list()
 else
diff --git a/ui/meson.build b/ui/meson.build
index b21d3d1534..eba93b41e3 100644
--- a/ui/meson.build
+++ b/ui/meson.build
@@ -74,14 +74,13 @@ if dbus_display
   dbus_display1 = custom_target('dbus-display gdbus-codegen',
                                 output: ['dbus-display1.h', 'dbus-display1.c'],
                                 input: files('dbus-display1.xml'),
-                                command: [config_host['GDBUS_CODEGEN'],
-                                          '@INPUT@',
+                                command: [gdbus_codegen, '@INPUT@',
                                           '--glib-min-required', '2.64',
                                           '--output-directory', meson.current_build_dir(),
                                           '--interface-prefix', 'org.qemu.',
                                           '--c-namespace', 'QemuDBus',
                                           '--generate-c-code', '@BASENAME@'])
-  dbus_ss.add(when: [gio, pixman, opengl, 'CONFIG_GIO'],
+  dbus_ss.add(when: [gio, pixman, opengl],
               if_true: [files(
                 'dbus-chardev.c',
                 'dbus-clipboard.c',
@@ -128,7 +127,7 @@ if spice.found()
   ui_modules += {'spice-core' : spice_core_ss}
 endif
 
-if spice.found() and config_host.has_key('CONFIG_GIO')
+if spice.found() and gio.found()
   spice_ss = ss.source_set()
   spice_ss.add(spice, gio, pixman, files('spice-app.c'))
   ui_modules += {'spice-app': spice_ss}
diff --git a/util/meson.build b/util/meson.build
index 82eec004e2..8f16018cd4 100644
--- a/util/meson.build
+++ b/util/meson.build
@@ -61,7 +61,7 @@ endif
 
 if have_system
   util_ss.add(files('crc-ccitt.c'))
-  util_ss.add(when: 'CONFIG_GIO', if_true: [files('dbus.c'), gio])
+  util_ss.add(when: gio, if_true: files('dbus.c'))
   util_ss.add(when: 'CONFIG_LINUX', if_true: files('userfaultfd.c'))
 endif
 
-- 
2.35.1



