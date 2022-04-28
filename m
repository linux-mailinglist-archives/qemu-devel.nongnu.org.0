Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70172512D56
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 09:51:45 +0200 (CEST)
Received: from localhost ([::1]:42548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njywC-0004g2-BI
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 03:51:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1njy2E-0000SV-8w
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 02:53:55 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:44572)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1njy2C-000578-4E
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 02:53:53 -0400
Received: by mail-ej1-x632.google.com with SMTP id i19so7571377eja.11
 for <qemu-devel@nongnu.org>; Wed, 27 Apr 2022 23:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QX6/qosMko92rV11J5BGgNOcKBZZNCHyWq7MkNluS98=;
 b=TmiO7Hp3JF0c97ZH0XhOpRiDouTZsleEci3/j8DhllRjQODurQKLQJj6DQ9Z+O4Yzz
 L1x5QVGizEguzi01iWe0OL1cfLrpPUHyIV10PDLFDScxUj/Xk4z56HWiAJcgb3+f5zK6
 znSPiVHpWYV3qIP682TyJVzKRiG8WTVEYbVHKLIBlRQKI0l4NORMfotVBlEwN/1oQ7Ca
 bfNwAQEuqw9Akkpd4XIfaFdEqFomhkPEXb8yXQ1xjZ8wxlt9kIOE13iUWbN/A5BexYFe
 kucTNUSQevX7lR69TQalYvJg7Rf31roeuPDRfcHqIy6fo9D0JHGek/qu42lj7MVVPL1J
 qtmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=QX6/qosMko92rV11J5BGgNOcKBZZNCHyWq7MkNluS98=;
 b=vdXsZonynUVhFYbQFAjqE5lKyYv6Khoo+I4PZT6RkN3V/cJav90Zit90CMHMjA3yZU
 na6Fr873sAgX3U/WRJyY8YAi9WUdU730+2J9t1w39SI0krvblGj7h6ApaGSo+wUNAQuG
 SRNdqegyPGYzav5s4oVOHrWp/QfIgIrQDmymcJuhds2w0k+zbZzjghVLbLFNKgWyXAZh
 UN0FEsSQUdfw0BS2XrYk13FZNvIoF4Gxg5t8zVbW5goHHCPMV1W4t9V+P8MbDZ8VDu4Q
 AaxGxRzVPhSCGGgt6x/eUaoax9nVZTz5xkqh2dpcgMjvWY/V7cjVarhI715wFGBVwyI8
 0V2g==
X-Gm-Message-State: AOAM533PEvtKGKM14U/EivJ54MJfWo9CXyo70saZlfcFTcFZdgrKm9O3
 oj8eFRpPRNJ/JZlfBwYiy53IWMul3xSRDA==
X-Google-Smtp-Source: ABdhPJw7t+uGVNHU8xQu1Yw2dUVXnfF76fpT1yWyz5COO6msbBZYiB3r5an9o5INwYQ0Rg+SuCZdzw==
X-Received: by 2002:a17:907:1c9b:b0:6f3:833c:2816 with SMTP id
 nb27-20020a1709071c9b00b006f3833c2816mr22844295ejc.601.1651128830683; 
 Wed, 27 Apr 2022 23:53:50 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 jo11-20020a170906f6cb00b006f3955761c4sm5406804ejb.158.2022.04.27.23.53.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Apr 2022 23:53:50 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 15/18] meson, configure: move libgio test to meson
Date: Thu, 28 Apr 2022 08:53:32 +0200
Message-Id: <20220428065335.189795-16-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220428065335.189795-1-pbonzini@redhat.com>
References: <20220428065335.189795-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x632.google.com
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
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
index c99b28a5ef..9f2a12e1cf 100644
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
@@ -1480,7 +1501,7 @@ dbus_display = get_option('dbus_display') \
            error_message: '-display dbus requires glib>=2.64') \
   .require(enable_modules,
            error_message: '-display dbus requires --enable-modules') \
-  .require(config_host.has_key('GDBUS_CODEGEN'),
+  .require(gdbus_codegen.found(),
            error_message: '-display dbus requires gdbus-codegen') \
   .allowed()
 
@@ -1542,6 +1563,7 @@ config_host_data.set('CONFIG_MPATH_NEW_API', mpathpersist_new_api)
 config_host_data.set('CONFIG_CURL', curl.found())
 config_host_data.set('CONFIG_CURSES', curses.found())
 config_host_data.set('CONFIG_GBM', gbm.found())
+config_host_data.set('CONFIG_GIO', gio.found())
 config_host_data.set('CONFIG_GLUSTERFS', glusterfs.found())
 if glusterfs.found()
   config_host_data.set('CONFIG_GLUSTERFS_XLATOR_OPT', glusterfs.version().version_compare('>=4'))
diff --git a/meson_options.txt b/meson_options.txt
index 8efdd0193a..65f7010bae 100644
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
index 3ba4aaf132..ee80f01cea 100644
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



