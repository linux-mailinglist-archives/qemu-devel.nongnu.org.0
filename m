Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8560B55B602
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 06:17:31 +0200 (CEST)
Received: from localhost ([::1]:42200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5gBm-0003H3-CX
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 00:17:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1o5ft5-0004kE-GE
 for qemu-devel@nongnu.org; Sun, 26 Jun 2022 23:58:15 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:39607)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1o5ft3-00083f-Kh
 for qemu-devel@nongnu.org; Sun, 26 Jun 2022 23:58:11 -0400
Received: by mail-pg1-x529.google.com with SMTP id q140so7951144pgq.6
 for <qemu-devel@nongnu.org>; Sun, 26 Jun 2022 20:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vwv4FPGt6FeS4iOQvh4mjchV/ZSf2nl3arPW8BgJEEg=;
 b=Jg47X/7p35hg0zHG9oAy+j/mWvQSFcc/RwknNhk8s6vxKn7+L9X/ufmT94HwnRX4Hu
 1O391eibGi/ecXVZbCcIyEWVBaxhuADH81VzfxOub4NSjj30WVNOpAZod9ToiAr8Vv5i
 ydifi2+6k3khkP2p5/qJZliJqnk0BNXXMRm4oDSGebVnoDh4xbaZeqJWBfQGOLgajp+h
 lvR/4+r9d1mRRjGUftsrh6J85hl2UVl77qL99N7Y9SxMeT/1v8SjBDU2rpX+UC9H2Miy
 rE4CcInLQQBckOQYw1fXZC7joIQZkDLgDonclq6wxu9jl6Pw7C+bImAdTplXq/e7BKsj
 GkEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vwv4FPGt6FeS4iOQvh4mjchV/ZSf2nl3arPW8BgJEEg=;
 b=sQLgEX3tVAM8CPiY0kCx7FW3enPcaISpVNlA/LnQ/ikGMvvz1u0GKREX1Ud48BYfAh
 DcBP1GtfOV5+EaobVevzwVehksLWetAEFWfs5nsvWrOuModv6efGev4TYCfEB/aiaT3u
 YaJcICERC8nRPoyqrDTz+lN6fjJHKSw9SWW3Qmhb3RuKlpbSxiXSKWl8el3bjunxrKCA
 TFUaq8MfR4UTgEU8J9ARZq5YKm+Ge10o2FqCV8QzZtY3V/6hIB4NR3v6NqQrcPqrcd/w
 qBqD7uEtpd385JsmiBtbB44FZQnffH6/JGPGIE4RaTtAWRYC9FOM+5t3ZtIplSKYs0Nq
 nQOw==
X-Gm-Message-State: AJIora+gTp1wKXOLVO6SeeYmdEYA6pV5FI4PqMNJyjiCmRSF1JAqwxVl
 XQU0lkA/sOXaKZkN1uYT5ngohY2Z+b4=
X-Google-Smtp-Source: AGRyM1u9WWt0NPHrysGVcBe84JnGZOvyD5rYMaIm+fX2qj6wZden6gbHa51msCIhsBq+A31F8qOD6g==
X-Received: by 2002:a05:6a00:140a:b0:4e0:54d5:d01 with SMTP id
 l10-20020a056a00140a00b004e054d50d01mr12589248pfu.20.1656302287204; 
 Sun, 26 Jun 2022 20:58:07 -0700 (PDT)
Received: from localhost.localdomain ([157.82.194.15])
 by smtp.gmail.com with ESMTPSA id
 a9-20020aa78649000000b0052531985e3esm5951314pfo.22.2022.06.26.20.58.03
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 26 Jun 2022 20:58:06 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, Programmingkid <programmingkidx@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, John Snow <jsnow@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Akihiko Odaki <akihiko.odaki@gmail.com>
Subject: [PATCH v10 3/4] datadir: Use bundle mechanism
Date: Mon, 27 Jun 2022 12:57:43 +0900
Message-Id: <20220627035744.23218-4-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.32.1 (Apple Git-133)
In-Reply-To: <20220627035744.23218-1-akihiko.odaki@gmail.com>
References: <20220627035744.23218-1-akihiko.odaki@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pg1-x529.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

softmmu/datadir.c had its own implementation to find files in the
build tree, but now bundle mechanism provides the unified
implementation which works for datadir and the other files.

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
---
 .travis.yml                 |  2 +-
 pc-bios/keymaps/meson.build | 21 ++++++---------------
 pc-bios/meson.build         | 13 +++----------
 scripts/oss-fuzz/build.sh   |  2 +-
 softmmu/datadir.c           | 22 +---------------------
 tests/qtest/fuzz/fuzz.c     | 15 ---------------
 6 files changed, 12 insertions(+), 63 deletions(-)

diff --git a/.travis.yml b/.travis.yml
index 9afc4a54b8f..4fdc9a67855 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -223,7 +223,7 @@ jobs:
         - BUILD_RC=0 && make -j${JOBS} || BUILD_RC=$?
         - |
           if [ "$BUILD_RC" -eq 0 ] ; then
-              mv pc-bios/s390-ccw/*.img pc-bios/ ;
+              mv pc-bios/s390-ccw/*.img qemu-bundle/usr/local/share/qemu ;
               ${TEST_CMD} ;
           else
               $(exit $BUILD_RC);
diff --git a/pc-bios/keymaps/meson.build b/pc-bios/keymaps/meson.build
index 44247a12b54..2837eb34f4e 100644
--- a/pc-bios/keymaps/meson.build
+++ b/pc-bios/keymaps/meson.build
@@ -40,9 +40,9 @@ else
 endif
 cp = find_program('cp')
 
-t = []
-foreach km, args: keymaps
-  if native_qemu_keymap.found()
+if native_qemu_keymap.found()
+  t = []
+  foreach km, args: keymaps
     # generate with qemu-kvm
     t += custom_target(km,
                        build_by_default: true,
@@ -50,20 +50,11 @@ foreach km, args: keymaps
                        command: [native_qemu_keymap, '-f', '@OUTPUT@', args.split()],
                        install: true,
                        install_dir: qemu_datadir / 'keymaps')
-  else
-    # copy from source tree
-    t += custom_target(km,
-                       build_by_default: true,
-                       input: km,
-                       output: km,
-                       command: [cp, '@INPUT@', '@OUTPUT@'],
-                       install: true,
-                       install_dir: qemu_datadir / 'keymaps')
-  endif
-endforeach
+  endforeach
 
-if native_qemu_keymap.found()
   alias_target('update-keymaps', t)
+else
+  install_data(keymaps.keys(), install_dir: qemu_datadir / 'keymaps')
 endif
 
 install_data(['sl', 'sv'], install_dir: qemu_datadir / 'keymaps')
diff --git a/pc-bios/meson.build b/pc-bios/meson.build
index 41ba1c0ec7b..388e0db6e40 100644
--- a/pc-bios/meson.build
+++ b/pc-bios/meson.build
@@ -85,16 +85,9 @@ blobs = [
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
+endif
 
 subdir('descriptors')
 subdir('keymaps')
diff --git a/scripts/oss-fuzz/build.sh b/scripts/oss-fuzz/build.sh
index 98b56e05210..16316b25662 100755
--- a/scripts/oss-fuzz/build.sh
+++ b/scripts/oss-fuzz/build.sh
@@ -88,7 +88,7 @@ if [ "$GITLAB_CI" != "true" ]; then
 fi
 
 # Copy over the datadir
-cp  -r ../pc-bios/ "$DEST_DIR/pc-bios"
+cp  -r ../pc-bios/ "$DEST_DIR/data"
 
 targets=$(./qemu-fuzz-i386 | awk '$1 ~ /\*/  {print $2}')
 base_copy="$DEST_DIR/qemu-fuzz-i386-target-$(echo "$targets" | head -n 1)"
diff --git a/softmmu/datadir.c b/softmmu/datadir.c
index 160cac999a6..697cffea932 100644
--- a/softmmu/datadir.c
+++ b/softmmu/datadir.c
@@ -83,26 +83,6 @@ void qemu_add_data_dir(char *path)
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
@@ -116,7 +96,7 @@ void qemu_add_default_firmwarepath(void)
     g_strfreev(dirs);
 
     /* try to find datadir relative to the executable path */
-    qemu_add_data_dir(find_datadir());
+    qemu_add_data_dir(get_relocated_path(CONFIG_QEMU_DATADIR));
 }
 
 void qemu_list_data_dirs(void)
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
-- 
2.32.1 (Apple Git-133)


