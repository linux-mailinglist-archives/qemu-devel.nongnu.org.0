Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C71C54C973
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jun 2022 15:11:36 +0200 (CEST)
Received: from localhost ([::1]:38860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1So2-0001B1-RN
	for lists+qemu-devel@lfdr.de; Wed, 15 Jun 2022 09:11:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1o1Sll-0007R9-3z
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 09:09:13 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:45805)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1o1Sli-0007SX-TM
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 09:09:12 -0400
Received: by mail-pl1-x62a.google.com with SMTP id d5so7758889plo.12
 for <qemu-devel@nongnu.org>; Wed, 15 Jun 2022 06:09:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3bLNlDtw3f/zAaqgNiCKmE8QYq9vbkjYUSzdMASAlVA=;
 b=KAHJh/lB+k7Uo77PhblcLQSASNAtq0kC4GbPeMwnrjm5pYKqtkzkLox15aW2MlClgJ
 Zni/jblRegggk72Ca5OsKLcgzHgH80yGc5peu/mBhW7NGY5fb6KF1skPq3rhyVg2uiEY
 pNVR0N1JhA+c5MIO3Y/Jt1WY26ySsv7/jqQrMqREhMFjf1/qxOOPLtbYZJe8aFs/QfhU
 DphUD0tavdfTB8clngc6dbEPhcwvaVzwMJUJxp3h2clxUGEGn0mBd7H18bmkhqfPKI+a
 nDowfPe1ZwdgDcdFyotTsj211z4/oObuRDaSk1GuqsU9jc4taj2t6g299ONWwuky2sja
 4fTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3bLNlDtw3f/zAaqgNiCKmE8QYq9vbkjYUSzdMASAlVA=;
 b=DWxhBR946JcJQrXBcSoFUQTCgj2nRQAaWU/fm0q8LHaUD5iSiRUgrJroi6KeUarX2m
 yhLkJWjXHWG5idByfEmCm+HmDh1OYFmkhCJyIUuZeKeBdn2UTYSMGHHjO4ckHvfCfL/q
 vjjjgOZe+CIdgz/u5bMr5f+VkuIDHLRB1DUNDyHhujzACDCu7JqhUseoL01heUyN3a9m
 WRSW06T4AiH34z9ZmDU2OIxN0jMa6mKGjoVUgLpYO0voOIDstso9/CimGe289HGQZZoE
 uPBmt02saSSkR9juTVV3nvlXtKPVPRfv97ypQPKrZkRlImpYK2lG148e3SN2dozHA1zC
 n9ZA==
X-Gm-Message-State: AJIora+WCSV73tjpcP3VJLA89AF+9KIN64Q/7JTFWrODaOkoSbFXp6Xm
 Ji0JoaMJNr+Y0PRXBv5SapE=
X-Google-Smtp-Source: AGRyM1sRVe3eSK9dLNGF24WCwqwLT8SyX4DdQMejybp5yUTQd6OD1f0LA8PktvPjeT/gj3bIRQYcqQ==
X-Received: by 2002:a17:90b:314a:b0:1e8:5362:5620 with SMTP id
 ip10-20020a17090b314a00b001e853625620mr10257344pjb.9.1655298549529; 
 Wed, 15 Jun 2022 06:09:09 -0700 (PDT)
Received: from localhost.localdomain ([2400:4050:c360:8200:4126:b1a8:8fce:1a8])
 by smtp.gmail.com with ESMTPSA id
 f12-20020a170902684c00b0016392bd5060sm9278448pln.142.2022.06.15.06.09.06
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 15 Jun 2022 06:09:08 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, Programmingkid <programmingkidx@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>
Subject: [PATCH v5 2/4] datadir: Use bundle mechanism
Date: Wed, 15 Jun 2022 22:08:43 +0900
Message-Id: <20220615130845.32674-3-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.32.1 (Apple Git-133)
In-Reply-To: <20220615130845.32674-1-akihiko.odaki@gmail.com>
References: <20220615130845.32674-1-akihiko.odaki@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pl1-x62a.google.com
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
 meson.build                 |  2 +-
 pc-bios/keymaps/meson.build |  2 ++
 pc-bios/meson.build         | 19 +++++++++----------
 scripts/oss-fuzz/build.sh   |  2 +-
 softmmu/datadir.c           | 35 ++++++++++++-----------------------
 tests/qtest/fuzz/fuzz.c     | 15 ---------------
 tests/vm/fedora             |  2 +-
 tests/vm/freebsd            |  2 +-
 tests/vm/netbsd             |  2 +-
 tests/vm/openbsd            |  2 +-
 11 files changed, 30 insertions(+), 55 deletions(-)

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
index 2f9bb27554c..9bdcd26a4af 100644
--- a/meson.build
+++ b/meson.build
@@ -1683,7 +1683,7 @@ endif
 config_host_data.set_quoted('CONFIG_BINDIR', get_option('prefix') / get_option('bindir'))
 config_host_data.set_quoted('CONFIG_PREFIX', get_option('prefix'))
 config_host_data.set_quoted('CONFIG_QEMU_CONFDIR', get_option('prefix') / qemu_confdir)
-config_host_data.set_quoted('CONFIG_QEMU_DATADIR', get_option('prefix') / qemu_datadir)
+config_host_data.set_quoted('CONFIG_QEMU_BUNDLE_DATADIR', qemu_datadir)
 config_host_data.set_quoted('CONFIG_QEMU_DESKTOPDIR', get_option('prefix') / qemu_desktopdir)
 config_host_data.set_quoted('CONFIG_QEMU_FIRMWAREPATH', get_option('prefix') / get_option('qemu_firmwarepath'))
 config_host_data.set_quoted('CONFIG_QEMU_HELPERDIR', get_option('prefix') / get_option('libexecdir'))
diff --git a/pc-bios/keymaps/meson.build b/pc-bios/keymaps/meson.build
index 44247a12b54..dd103092290 100644
--- a/pc-bios/keymaps/meson.build
+++ b/pc-bios/keymaps/meson.build
@@ -67,3 +67,5 @@ if native_qemu_keymap.found()
 endif
 
 install_data(['sl', 'sv'], install_dir: qemu_datadir / 'keymaps')
+
+bundles += { qemu_datadir / 'keymaps': '../../../pc-bios/keymaps' }
diff --git a/pc-bios/meson.build b/pc-bios/meson.build
index 41ba1c0ec7b..0d2119836bd 100644
--- a/pc-bios/meson.build
+++ b/pc-bios/meson.build
@@ -20,6 +20,8 @@ if unpack_edk2_blobs
                   install: get_option('install_blobs'),
                   install_dir: qemu_datadir,
                   command: [ bzip2, '-dc', '@INPUT0@' ])
+
+    bundles += { qemu_datadir / f: '../../../pc-bios' / f  }
   endforeach
 endif
 
@@ -85,16 +87,13 @@ blobs = [
   'vof-nvram.bin',
 ]
 
-ln_s = [find_program('ln', required: true), '-sf']
-foreach f : blobs
-  roms += custom_target(f,
-                build_by_default: have_system,
-                output: f,
-                input: files('meson.build'),            # dummy input
-                install: get_option('install_blobs'),
-                install_dir: qemu_datadir,
-                command: [ ln_s, meson.project_source_root() / 'pc-bios' / f, '@OUTPUT@' ])
-endforeach
+if get_option('install_blobs')
+  install_data(blobs, install_dir: qemu_datadir)
+
+  foreach f : blobs
+    bundles += { qemu_datadir / f: meson.current_source_dir() / f }
+  endforeach
+endif
 
 subdir('descriptors')
 subdir('keymaps')
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


