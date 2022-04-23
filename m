Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 813B050CA68
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Apr 2022 15:11:11 +0200 (CEST)
Received: from localhost ([::1]:53650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1niFXa-00082l-IU
	for lists+qemu-devel@lfdr.de; Sat, 23 Apr 2022 09:11:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1niFFk-0007Os-Vl
 for qemu-devel@nongnu.org; Sat, 23 Apr 2022 08:52:45 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:45638)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1niFFi-0005C0-4C
 for qemu-devel@nongnu.org; Sat, 23 Apr 2022 08:52:44 -0400
Received: by mail-ej1-x635.google.com with SMTP id y3so791822ejo.12
 for <qemu-devel@nongnu.org>; Sat, 23 Apr 2022 05:52:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8XrJaRvvrhzzc/9h69WhtVUDnFV/wvbnBeaU7prxgqs=;
 b=ZbA9j0AElIGVlkZLdNrIjvmVA+g683+BmpHZHh+cVyare1W0o+ku4w4iRv3FcfkH9t
 lCKCZjvBPYmlI/963st8MSoYN3oRx9x8Ethg5+Sop/Zi5Nw6go26WSQMj85XX87Hez/M
 Ny5AtFL4ESSaImejqMOHTt6zgSG9gOj0dinYYqJfwk4SzGBbXyjKyQbeRCCp9VqhAbiY
 xTILs6UrDu6hHxjHCi6wwNYQZMjk570QBIqJPe/VpqIYAN/nqzjng7Fcw/ObUo0JK5Hd
 fwfkiwzxjprL7nWHvPI60kbbkDWj718onPF45P1HO0wvuRUagd4LqMk6GDZSu+tb32WS
 YE6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=8XrJaRvvrhzzc/9h69WhtVUDnFV/wvbnBeaU7prxgqs=;
 b=EptRLk/tlpMUXSQOtmCEnjtVRuQnfABoxCM/WsdGlUaAYSgbLoXy69uv9n7V2RJQ8/
 ovfaZmrUUeRepEmRV1m6PVEs4hLXzl2PimV2Fu+9olfaqAEnL4EPBk70aazGIqixfTip
 YeM+TSjmjfvO2olAc1Z06D9YPq33Rs4jZaBVj5bRxJkLYhRwuaaGmAHbQ49dVv8spmh8
 2DllK76UasgKOB/tU+roQ1cl3NbtQ0zN+G+QMBHV3iQGNEujULeIAULjKx+bHb35JSiZ
 8Jg6JHhG4l0E5Bzm4MXXqWV4phlEmOSgn70HJ4Hx2BiObP83yblRe849DqGxkUwDZjZJ
 P6Ig==
X-Gm-Message-State: AOAM532xmsnkW+KYbwUGSvZYrTzw7O5AQl0Tas8/JVyf0Vg90hl1DQYY
 Mzmv4mr8LV9+b+JHstobfv9MaWt38u6AvA==
X-Google-Smtp-Source: ABdhPJwQbUJs254V7VLnM8DTOF2YBYRkou5bLHXdUnudkBNoyh4W+rmdAsc7XGwbNyQ4mJfuaHLaLw==
X-Received: by 2002:a17:907:7b96:b0:6f0:2922:7ff8 with SMTP id
 ne22-20020a1709077b9600b006f029227ff8mr8227582ejc.398.1650718360171; 
 Sat, 23 Apr 2022 05:52:40 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 bo14-20020a170906d04e00b006ce98d9c3e3sm1655573ejb.194.2022.04.23.05.52.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Apr 2022 05:52:39 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 21/34] meson, configure: move --with-pkgversion,
 CONFIG_STAMP to meson
Date: Sat, 23 Apr 2022 14:51:38 +0200
Message-Id: <20220423125151.27821-22-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220423125151.27821-1-pbonzini@redhat.com>
References: <20220423125151.27821-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x635.google.com
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

The hash is now generated with a Python script.

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure                     | 23 -----------------------
 docs/meson.build              |  2 +-
 meson.build                   | 10 +++++++++-
 meson_options.txt             |  2 ++
 scripts/meson-buildoptions.py |  1 +
 scripts/meson-buildoptions.sh |  3 +++
 scripts/qemu-stamp.py         | 24 ++++++++++++++++++++++++
 7 files changed, 40 insertions(+), 25 deletions(-)
 create mode 100644 scripts/qemu-stamp.py

diff --git a/configure b/configure
index 56dcc7ba8e..3f0fe1c4e1 100755
--- a/configure
+++ b/configure
@@ -306,7 +306,6 @@ qemu_suffix="qemu"
 softmmu="yes"
 linux_user=""
 bsd_user=""
-pkgversion=""
 pie=""
 coroutine=""
 plugins="$default_feature"
@@ -896,8 +895,6 @@ for opt do
   ;;
   --enable-fdt=*) fdt="$optarg"
   ;;
-  --with-pkgversion=*) pkgversion="$optarg"
-  ;;
   --with-coroutine=*) coroutine="$optarg"
   ;;
   --disable-vhost-net) vhost_net="no"
@@ -1135,7 +1132,6 @@ Advanced options (experts only):
   --firmwarepath=PATH      search PATH for firmware files
   --efi-aarch64=PATH       PATH of efi file to use for aarch64 VMs.
   --with-suffix=SUFFIX     suffix for QEMU data inside datadir/libdir/sysconfdir/docdir [$qemu_suffix]
-  --with-pkgversion=VERS   use specified string as sub-version of the package
   --without-default-features default all --enable-* options to "disabled"
   --without-default-devices  do not include any device that is not needed to
                            start the emulator (only use if you are including
@@ -1722,21 +1718,6 @@ if ! compile_prog "$glib_cflags -Werror" "$glib_libs" ; then
     fi
 fi
 
-##########################################
-# SHA command probe for modules
-if test "$modules" = yes; then
-    shacmd_probe="sha1sum sha1 shasum"
-    for c in $shacmd_probe; do
-        if has $c; then
-            shacmd="$c"
-            break
-        fi
-    done
-    if test "$shacmd" = ""; then
-        error_exit "one of the checksum commands is required to enable modules: $shacmd_probe"
-    fi
-fi
-
 ##########################################
 # fdt probe
 
@@ -2173,13 +2154,9 @@ if test "$static" = "yes" ; then
   echo "CONFIG_STATIC=y" >> $config_host_mak
 fi
 qemu_version=$(head $source_path/VERSION)
-echo "PKGVERSION=$pkgversion" >>$config_host_mak
 echo "SRC_PATH=$source_path" >> $config_host_mak
 echo "TARGET_DIRS=$target_list" >> $config_host_mak
 if test "$modules" = "yes"; then
-  # $shacmd can generate a hash started with digit, which the compiler doesn't
-  # like as an symbol. So prefix it with an underscore
-  echo "CONFIG_STAMP=_$( (echo $qemu_version; echo $pkgversion; cat $0) | $shacmd - | cut -f1 -d\ )" >> $config_host_mak
   echo "CONFIG_MODULES=y" >> $config_host_mak
 fi
 
diff --git a/docs/meson.build b/docs/meson.build
index 831d4aea2b..9136fed3b7 100644
--- a/docs/meson.build
+++ b/docs/meson.build
@@ -35,7 +35,7 @@ if sphinx_build.found()
 endif
 
 if build_docs
-  SPHINX_ARGS += ['-Dversion=' + meson.project_version(), '-Drelease=' + config_host['PKGVERSION']]
+  SPHINX_ARGS += ['-Dversion=' + meson.project_version(), '-Drelease=' + get_option('pkgversion')]
 
   man_pages = {
         'qemu-ga.8': (have_ga ? 'man8' : ''),
diff --git a/meson.build b/meson.build
index da8d3076d7..66b2a3aa31 100644
--- a/meson.build
+++ b/meson.build
@@ -1626,6 +1626,14 @@ config_host_data.set_quoted('CONFIG_QEMU_LOCALSTATEDIR', get_option('prefix') /
 config_host_data.set_quoted('CONFIG_QEMU_MODDIR', get_option('prefix') / qemu_moddir)
 config_host_data.set_quoted('CONFIG_SYSCONFDIR', get_option('prefix') / get_option('sysconfdir'))
 
+if config_host.has_key('CONFIG_MODULES')
+  config_host_data.set('CONFIG_STAMP', run_command(
+      meson.current_source_dir() / 'scripts/qemu-stamp.py',
+      meson.project_version(), get_option('pkgversion'), '--',
+      meson.current_source_dir() / 'configure',
+      capture: true, check: true).stdout().strip())
+endif
+
 have_slirp_smbd = get_option('slirp_smbd') \
   .require(targetos != 'windows', error_message: 'Host smbd not supported on this platform.') \
   .allowed()
@@ -2796,7 +2804,7 @@ tracetool_depends = files(
 
 qemu_version_cmd = [find_program('scripts/qemu-version.sh'),
                     meson.current_source_dir(),
-                    config_host['PKGVERSION'], meson.project_version()]
+                    get_option('pkgversion'), meson.project_version()]
 qemu_version = custom_target('qemu-version.h',
                              output: 'qemu-version.h',
                              command: qemu_version_cmd,
diff --git a/meson_options.txt b/meson_options.txt
index ec974003b3..dc6fb796c6 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -8,6 +8,8 @@ option('docdir', type : 'string', value : 'doc',
        description: 'Base directory for documentation installation (can be empty)')
 option('qemu_firmwarepath', type : 'string', value : '',
        description: 'search PATH for firmware files')
+option('pkgversion', type : 'string', value : '',
+       description: 'use specified string as sub-version of the package')
 option('smbd', type : 'string', value : '',
        description: 'Path to smbd for slirp networking')
 option('sphinx_build', type : 'string', value : '',
diff --git a/scripts/meson-buildoptions.py b/scripts/meson-buildoptions.py
index 3e540e8bb3..0f9603a7f6 100755
--- a/scripts/meson-buildoptions.py
+++ b/scripts/meson-buildoptions.py
@@ -36,6 +36,7 @@
 
 OPTION_NAMES = {
     "malloc": "enable-malloc",
+    "pkgversion": "with-pkgversion",
     "trace_backends": "enable-trace-backends",
     "trace_file": "with-trace-file",
 }
diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh
index 4c49d4af08..bf9878e24f 100644
--- a/scripts/meson-buildoptions.sh
+++ b/scripts/meson-buildoptions.sh
@@ -44,6 +44,8 @@ meson_options_help() {
   printf "%s\n" '  --sphinx-build=VALUE     Use specified sphinx-build for building document'
   printf "%s\n" '  --tls-priority=VALUE     Default TLS protocol/cipher priority string'
   printf "%s\n" '                           [NORMAL]'
+  printf "%s\n" '  --with-pkgversion=VALUE  use specified string as sub-version of the'
+  printf "%s\n" '                           package'
   printf "%s\n" '  --with-trace-file=VALUE  Trace file prefix for simple backend [trace]'
   printf "%s\n" ''
   printf "%s\n" 'Optional features, enabled with --enable-FEATURE and'
@@ -309,6 +311,7 @@ _meson_option_parse() {
     --disable-pa) printf "%s" -Dpa=disabled ;;
     --enable-parallels) printf "%s" -Dparallels=enabled ;;
     --disable-parallels) printf "%s" -Dparallels=disabled ;;
+    --with-pkgversion=*) quote_sh "-Dpkgversion=$2" ;;
     --enable-profiler) printf "%s" -Dprofiler=true ;;
     --disable-profiler) printf "%s" -Dprofiler=false ;;
     --enable-pvrdma) printf "%s" -Dpvrdma=enabled ;;
diff --git a/scripts/qemu-stamp.py b/scripts/qemu-stamp.py
new file mode 100644
index 0000000000..7beeeb07ed
--- /dev/null
+++ b/scripts/qemu-stamp.py
@@ -0,0 +1,24 @@
+#! /usr/bin/env python3
+
+# Usage: scripts/qemu-stamp.py STRING1 STRING2... -- FILE1 FILE2...
+import hashlib
+import os
+import sys
+
+sha = hashlib.sha1()
+is_file = False
+for arg in sys.argv[1:]:
+    if arg == '--':
+        is_file = True
+        continue
+    if is_file:
+        with open(arg, 'rb') as f:
+            for chunk in iter(lambda: f.read(65536), b''):
+                sha.update(chunk)
+    else:
+        sha.update(os.fsencode(arg))
+        sha.update(b'\n')
+
+# The hash can start with a digit, which the compiler doesn't
+# like as an symbol. So prefix it with an underscore
+print("_" + sha.hexdigest())
-- 
2.35.1



