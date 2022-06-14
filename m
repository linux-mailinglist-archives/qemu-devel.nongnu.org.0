Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F133254BC88
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jun 2022 23:10:53 +0200 (CEST)
Received: from localhost ([::1]:43088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1DoK-00088J-WD
	for lists+qemu-devel@lfdr.de; Tue, 14 Jun 2022 17:10:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1o1Dld-0005OP-Nh
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 17:08:05 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:45575)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1o1Dlb-0007kv-MA
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 17:08:05 -0400
Received: by mail-pl1-x630.google.com with SMTP id d5so6158101plo.12
 for <qemu-devel@nongnu.org>; Tue, 14 Jun 2022 14:08:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vFXw3S/lKKr8k4tmj6/hlHwCnffDmNRB5XhVT1Lgayo=;
 b=NLabtPXmMmAhzluF8F8pLJq+HwlTU9TF2gnqscSUKa2k+e4Y/VH6Hyk806V38xhInS
 x9sn0vTEouf1MtNAAiIjqhSnzsDrsly71r0Rtmyywwog1q3lxnRtfSqoJGLsRle28yCF
 fiTkqnV0KYZCTPwIh9jMhUjmrDJkSlD2kHowLLCIDwlR7hw1CjEGWGgX0ezU7TG74VC3
 iXpryNk6vVL3cOZ3bgTElSaWnfoMaNy1p3PBvKnvxVLON39sx2Vql652gKGjFt4gxExj
 2kxyCirbv6xutJcD4v6FNwgUBwyepCPZtoo1d9b972EZhoCxG+kI3RaS49vrYotEh3kI
 Ohow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vFXw3S/lKKr8k4tmj6/hlHwCnffDmNRB5XhVT1Lgayo=;
 b=dz/GzfcQZz9kK5VpYoj/PkRKsxxv2deiGJ/jLrpzM8PO/sFX808SNhEW042THaGW+e
 mFi4CdHhKVTfw8ZSQI8a1zbE3iYIvG3u29rTgMTMsIGMnOH/QVZT8lOTPjh2WiDSync2
 pTnM2ojYSAbHC7lNz0Rkc//JmU/w/iWpwh3dFnVaWXmqMgp2K9stVadl3iqZATpH37/v
 DtvcAznCJ4zWGxo3Q64DRpDCfAqs4tmQF6i+Vk16OGFoRdIycKcem/LEHXdSbvoEiXCO
 bP07I92iF41Sq/yqH731PFVlASlbkttt0CQCoQ6AZI2hAXuLEBCl7jsYdSwemgtcoPZI
 oZ4A==
X-Gm-Message-State: AJIora+Nmxz/MgyQKLrEnla8PshhlYljwmFwnfXLM57OgurnziSydWJd
 CwnymA43JY6MPEl93Oz6XmY=
X-Google-Smtp-Source: ABdhPJzx2PBy4f609vzSXWUYUp58j26cdhsJz183xm5jONB+j+pDfzdNJHCWcWMJ0yxLUurl+Lk6vw==
X-Received: by 2002:a17:902:c651:b0:164:127:cdfd with SMTP id
 s17-20020a170902c65100b001640127cdfdmr6334958pls.154.1655240882368; 
 Tue, 14 Jun 2022 14:08:02 -0700 (PDT)
Received: from localhost.localdomain
 ([2400:4050:c360:8200:d5aa:1806:cce3:7773])
 by smtp.gmail.com with ESMTPSA id
 h65-20020a62de44000000b0050dc762813csm8129456pfg.22.2022.06.14.14.07.59
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 14 Jun 2022 14:08:01 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, Programmingkid <programmingkidx@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>
Subject: [PATCH v4 2/4] datadir: Use bundle mechanism
Date: Wed, 15 Jun 2022 06:07:44 +0900
Message-Id: <20220614210746.78911-3-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.32.1 (Apple Git-133)
In-Reply-To: <20220614210746.78911-1-akihiko.odaki@gmail.com>
References: <20220614210746.78911-1-akihiko.odaki@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pl1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

softmmu/datadir.c had its own implementation to find files in the
build tree, but now bundle mechanism provides the unified
implementation which works for datadir and the other files.

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
---
 .travis.yml                 |  2 +-
 meson.build                 |  3 ++-
 pc-bios/keymaps/meson.build |  3 +++
 pc-bios/meson.build         | 17 +++++++++--------
 scripts/oss-fuzz/build.sh   |  2 +-
 softmmu/datadir.c           | 35 ++++++++++++-----------------------
 tests/qtest/fuzz/fuzz.c     | 15 ---------------
 tests/vm/fedora             |  2 +-
 tests/vm/freebsd            |  2 +-
 tests/vm/netbsd             |  2 +-
 tests/vm/openbsd            |  2 +-
 11 files changed, 32 insertions(+), 53 deletions(-)

diff --git a/.travis.yml b/.travis.yml
index 9afc4a54b8f..9fee2167b95 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -223,7 +223,7 @@ jobs:
         - BUILD_RC=0 && make -j${JOBS} || BUILD_RC=$?
         - |
           if [ "$BUILD_RC" -eq 0 ] ; then
-              mv pc-bios/s390-ccw/*.img pc-bios/ ;
+              mv pc-bios/s390-ccw/*.img qemu-bundle/share/qemu ;
               ${TEST_CMD} ;
           else
               $(exit $BUILD_RC);
diff --git a/meson.build b/meson.build
index 0c2e11ff071..c573815813f 100644
--- a/meson.build
+++ b/meson.build
@@ -32,6 +32,7 @@ if get_option('qemu_suffix').startswith('/')
   error('qemu_suffix cannot start with a /')
 endif
 
+qemu_bundledir = meson.project_build_root() / 'qemu-bundle'
 qemu_confdir = get_option('sysconfdir') / get_option('qemu_suffix')
 qemu_datadir = get_option('datadir') / get_option('qemu_suffix')
 qemu_docdir = get_option('docdir') / get_option('qemu_suffix')
@@ -1682,7 +1683,7 @@ endif
 config_host_data.set_quoted('CONFIG_BINDIR', get_option('prefix') / get_option('bindir'))
 config_host_data.set_quoted('CONFIG_PREFIX', get_option('prefix'))
 config_host_data.set_quoted('CONFIG_QEMU_CONFDIR', get_option('prefix') / qemu_confdir)
-config_host_data.set_quoted('CONFIG_QEMU_DATADIR', get_option('prefix') / qemu_datadir)
+config_host_data.set_quoted('CONFIG_QEMU_BUNDLE_DATADIR', qemu_datadir)
 config_host_data.set_quoted('CONFIG_QEMU_DESKTOPDIR', get_option('prefix') / qemu_desktopdir)
 config_host_data.set_quoted('CONFIG_QEMU_FIRMWAREPATH', get_option('prefix') / get_option('qemu_firmwarepath'))
 config_host_data.set_quoted('CONFIG_QEMU_HELPERDIR', get_option('prefix') / get_option('libexecdir'))
diff --git a/pc-bios/keymaps/meson.build b/pc-bios/keymaps/meson.build
index 44247a12b54..b8bac138756 100644
--- a/pc-bios/keymaps/meson.build
+++ b/pc-bios/keymaps/meson.build
@@ -67,3 +67,6 @@ if native_qemu_keymap.found()
 endif
 
 install_data(['sl', 'sv'], install_dir: qemu_datadir / 'keymaps')
+
+run_command('ln', '-sf', '../../../pc-bios/keymaps', qemu_bundledir / qemu_datadir,
+            check: true)
diff --git a/pc-bios/meson.build b/pc-bios/meson.build
index 41ba1c0ec7b..d1ff75b0b13 100644
--- a/pc-bios/meson.build
+++ b/pc-bios/meson.build
@@ -1,3 +1,5 @@
+run_command('mkdir', '-p', qemu_bundledir / qemu_datadir, check: true)
+
 roms = []
 if unpack_edk2_blobs
   fds = [
@@ -20,6 +22,9 @@ if unpack_edk2_blobs
                   install: get_option('install_blobs'),
                   install_dir: qemu_datadir,
                   command: [ bzip2, '-dc', '@INPUT0@' ])
+
+    run_command('ln', '-sf', '../../../pc-bios' / f, qemu_bundledir / qemu_datadir,
+                check: true)
   endforeach
 endif
 
@@ -85,15 +90,11 @@ blobs = [
   'vof-nvram.bin',
 ]
 
-ln_s = [find_program('ln', required: true), '-sf']
+install_data(blobs, install_dir: qemu_datadir)
+
 foreach f : blobs
-  roms += custom_target(f,
-                build_by_default: have_system,
-                output: f,
-                input: files('meson.build'),            # dummy input
-                install: get_option('install_blobs'),
-                install_dir: qemu_datadir,
-                command: [ ln_s, meson.project_source_root() / 'pc-bios' / f, '@OUTPUT@' ])
+  run_command('ln', '-sf', meson.current_source_dir() / f, qemu_bundledir / qemu_datadir,
+              check: true)
 endforeach
 
 subdir('descriptors')
diff --git a/scripts/oss-fuzz/build.sh b/scripts/oss-fuzz/build.sh
index 98b56e05210..cbf8b3080e9 100755
--- a/scripts/oss-fuzz/build.sh
+++ b/scripts/oss-fuzz/build.sh
@@ -88,7 +88,7 @@ if [ "$GITLAB_CI" != "true" ]; then
 fi
 
 # Copy over the datadir
-cp  -r ../pc-bios/ "$DEST_DIR/pc-bios"
+cp  -r ../pc-bios/ "$DEST_DIR/qemu-bundle/share/qemu"
 
 targets=$(./qemu-fuzz-i386 | awk '$1 ~ /\*/  {print $2}')
 base_copy="$DEST_DIR/qemu-fuzz-i386-target-$(echo "$targets" | head -n 1)"
diff --git a/softmmu/datadir.c b/softmmu/datadir.c
index 160cac999a6..4dadf0e010c 100644
--- a/softmmu/datadir.c
+++ b/softmmu/datadir.c
@@ -35,6 +35,7 @@ char *qemu_find_file(int type, const char *name)
     int i;
     const char *subdir;
     char *buf;
+    char *bundle;
 
     /* Try the name as a straight path first */
     if (access(name, R_OK) == 0) {
@@ -61,6 +62,16 @@ char *qemu_find_file(int type, const char *name)
         }
         g_free(buf);
     }
+
+    bundle = g_strdup_printf("%s/%s%s",
+                             CONFIG_QEMU_BUNDLE_DATADIR, subdir, name);
+    buf = find_bundle(bundle);
+    g_free(bundle);
+    if (buf) {
+        trace_load_file(name, buf);
+        return buf;
+    }
+
     return NULL;
 }
 
@@ -83,26 +94,6 @@ void qemu_add_data_dir(char *path)
     data_dir[data_dir_idx++] = path;
 }
 
-/*
- * Find a likely location for support files using the location of the binary.
- * When running from the build tree this will be "$bindir/pc-bios".
- * Otherwise, this is CONFIG_QEMU_DATADIR (possibly relocated).
- *
- * The caller must use g_free() to free the returned data when it is
- * no longer required.
- */
-static char *find_datadir(void)
-{
-    g_autofree char *dir = NULL;
-
-    dir = g_build_filename(qemu_get_exec_dir(), "pc-bios", NULL);
-    if (g_file_test(dir, G_FILE_TEST_IS_DIR)) {
-        return g_steal_pointer(&dir);
-    }
-
-    return get_relocated_path(CONFIG_QEMU_DATADIR);
-}
-
 void qemu_add_default_firmwarepath(void)
 {
     char **dirs;
@@ -114,9 +105,6 @@ void qemu_add_default_firmwarepath(void)
         qemu_add_data_dir(get_relocated_path(dirs[i]));
     }
     g_strfreev(dirs);
-
-    /* try to find datadir relative to the executable path */
-    qemu_add_data_dir(find_datadir());
 }
 
 void qemu_list_data_dirs(void)
@@ -125,4 +113,5 @@ void qemu_list_data_dirs(void)
     for (i = 0; i < data_dir_idx; i++) {
         printf("%s\n", data_dir[i]);
     }
+    list_bundle_candidates(CONFIG_QEMU_BUNDLE_DATADIR);
 }
diff --git a/tests/qtest/fuzz/fuzz.c b/tests/qtest/fuzz/fuzz.c
index 0ad4ba9e94d..2062b40d82b 100644
--- a/tests/qtest/fuzz/fuzz.c
+++ b/tests/qtest/fuzz/fuzz.c
@@ -174,21 +174,6 @@ int LLVMFuzzerInitialize(int *argc, char ***argv, char ***envp)
     target_name = strstr(**argv, "-target-");
     if (target_name) {        /* The binary name specifies the target */
         target_name += strlen("-target-");
-        /*
-         * With oss-fuzz, the executable is kept in the root of a directory (we
-         * cannot assume the path). All data (including bios binaries) must be
-         * in the same dir, or a subdir. Thus, we cannot place the pc-bios so
-         * that it would be in exec_dir/../pc-bios.
-         * As a workaround, oss-fuzz allows us to use argv[0] to get the
-         * location of the executable. Using this we add exec_dir/pc-bios to
-         * the datadirs.
-         */
-        bindir = qemu_get_exec_dir();
-        datadir = g_build_filename(bindir, "pc-bios", NULL);
-        if (g_file_test(datadir, G_FILE_TEST_IS_DIR)) {
-            qemu_add_data_dir(datadir);
-        } else {
-            g_free(datadir);
 	}
     } else if (*argc > 1) {  /* The target is specified as an argument */
         target_name = (*argv)[1];
diff --git a/tests/vm/fedora b/tests/vm/fedora
index 92b78d6e2c9..4ccd31bba61 100755
--- a/tests/vm/fedora
+++ b/tests/vm/fedora
@@ -79,7 +79,7 @@ class FedoraVM(basevm.BaseVM):
         self.exec_qemu_img("create", "-f", "qcow2", img_tmp, self.size)
         self.print_step("Booting installer")
         self.boot(img_tmp, extra_args = [
-            "-bios", "pc-bios/bios-256k.bin",
+            "-bios", "qemu-bundle/share/qemu/bios-256k.bin",
             "-machine", "graphics=off",
             "-device", "VGA",
             "-cdrom", iso
diff --git a/tests/vm/freebsd b/tests/vm/freebsd
index 805db759d67..2095d8c5204 100755
--- a/tests/vm/freebsd
+++ b/tests/vm/freebsd
@@ -95,7 +95,7 @@ class FreeBSDVM(basevm.BaseVM):
 
         self.print_step("Booting installer")
         self.boot(img_tmp, extra_args = [
-            "-bios", "pc-bios/bios-256k.bin",
+            "-bios", "qemu-bundle/share/qemu/bios-256k.bin",
             "-machine", "graphics=off",
             "-device", "VGA",
             "-cdrom", iso
diff --git a/tests/vm/netbsd b/tests/vm/netbsd
index 45aa9a7fda7..d59cfedb83e 100755
--- a/tests/vm/netbsd
+++ b/tests/vm/netbsd
@@ -86,7 +86,7 @@ class NetBSDVM(basevm.BaseVM):
 
         self.print_step("Booting installer")
         self.boot(img_tmp, extra_args = [
-            "-bios", "pc-bios/bios-256k.bin",
+            "-bios", "qemu-bundle/share/qemu/bios-256k.bin",
             "-machine", "graphics=off",
             "-cdrom", iso
         ])
diff --git a/tests/vm/openbsd b/tests/vm/openbsd
index 13c82542140..036907c6243 100755
--- a/tests/vm/openbsd
+++ b/tests/vm/openbsd
@@ -82,7 +82,7 @@ class OpenBSDVM(basevm.BaseVM):
 
         self.print_step("Booting installer")
         self.boot(img_tmp, extra_args = [
-            "-bios", "pc-bios/bios-256k.bin",
+            "-bios", "qemu-bundle/share/qemu/bios-256k.bin",
             "-machine", "graphics=off",
             "-device", "VGA",
             "-cdrom", iso
-- 
2.32.1 (Apple Git-133)


