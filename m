Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 023854C55F9
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Feb 2022 13:56:58 +0100 (CET)
Received: from localhost ([::1]:38994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNwd6-0007DW-K6
	for lists+qemu-devel@lfdr.de; Sat, 26 Feb 2022 07:56:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nNwSP-0001Pm-37
 for qemu-devel@nongnu.org; Sat, 26 Feb 2022 07:45:55 -0500
Received: from [2607:f8b0:4864:20::1035] (port=42809
 helo=mail-pj1-x1035.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nNwSM-0003KZ-Rs
 for qemu-devel@nongnu.org; Sat, 26 Feb 2022 07:45:52 -0500
Received: by mail-pj1-x1035.google.com with SMTP id
 q8-20020a17090a178800b001bc299b8de1so7263178pja.1
 for <qemu-devel@nongnu.org>; Sat, 26 Feb 2022 04:45:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/9mK1xO4TByeuzuYFvQ7V+Fn6OHDRjXWjpXpK7eIeg4=;
 b=Z9LabU0D8yS8qzmk6hdDXBWI39wAFMRoAbtFejBa1qi1VBGyDuCOADdtGiOY7qnqA2
 DGPWvK76EQZQkHO2+Q5/C4K0Ne0u4m8yAZ82Cm189nmvuqJAWV0AF0Ck+VJH4hb8MCVX
 sajVVkof+DtEJl5IESAJYqzGJDowYuExLoCsMPj8oNUC5lTW3xjR0vF2Vuvcg/g1eMcT
 bnzB3nbZXwXF42ezlLlgOSky/vlc93M6Cvk25JIEOyhu18SXKxTSvp7ZeoLrzkdzHOQW
 rjCK2PrbfdFKMz0/07jw7eFWBH1cfPyKOd97l99FC+AvqRV19EdgN2Av1wI40oObxmvc
 zV4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/9mK1xO4TByeuzuYFvQ7V+Fn6OHDRjXWjpXpK7eIeg4=;
 b=ST9RjWf2fZPsCnbr14txTTzS8wwa1RqQVOoa9l9VXadiK8jbqepPmni3gBCe7u9M6R
 wwU61z0eaXoMjZafcxzooJ0m7qOup4rMPwBf1Io/SBxwZnGk0Q/XClS+/AmrxYPmAeXy
 MIcU8xPmAsVnYTbpqlJE215fKJKsFx1VYFIAIw/gyd6ml9AaFiOqelTCgGI+gsRc/OCW
 U/y1B9cjIV76wY0nFREs36ELt66qkkmxWega1KJ1J67wS2UVlKAPUJkwHH1HvsJWE5zV
 2ZJs/Qe7UPA0lpVnvMAdnfSOzdivmrn8Ipo948CBmfhxszwDHtRyldeM+VOZ4XWHqWo8
 NKaQ==
X-Gm-Message-State: AOAM530LzBzeBZPFaadTEWObKVYRDzNIbeTJrPOhuc5+uxVIeoKs9FSy
 sEP0o3f5v+OIzvbFKejuxt0U/sNTdfE=
X-Google-Smtp-Source: ABdhPJxe/hIR0oH5w8sHOP709Z74sanIrfdUiZ2TWDSs6i2P8T/L6Dyg5G/Ab5RF6fa2MzwzboUqOw==
X-Received: by 2002:a17:902:ccce:b0:14e:ed3f:e3a1 with SMTP id
 z14-20020a170902ccce00b0014eed3fe3a1mr12021451ple.12.1645879549277; 
 Sat, 26 Feb 2022 04:45:49 -0800 (PST)
Received: from localhost.localdomain
 ([2400:4050:c360:8200:4c8a:825a:fb9a:12f3])
 by smtp.gmail.com with ESMTPSA id
 r4-20020a17090a438400b001bc6d52de70sm11725653pjg.24.2022.02.26.04.45.47
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 26 Feb 2022 04:45:49 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Subject: [PATCH v2 2/4] datadir: Use bundle mechanism
Date: Sat, 26 Feb 2022 21:45:33 +0900
Message-Id: <20220226124535.76885-3-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
In-Reply-To: <20220226124535.76885-1-akihiko.odaki@gmail.com>
References: <20220226124535.76885-1-akihiko.odaki@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1035
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, Programmingkid <programmingkidx@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Akihiko Odaki <akihiko.odaki@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

bundle mechanism and softmmu/datadir.c provides some overlapped
functionality. Use bundle mechanism in softmmu/datadir.c to remove the
redundancy.

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
---
 configure         |  2 ++
 meson.build       |  2 +-
 softmmu/datadir.c | 35 ++++++++++++-----------------------
 3 files changed, 15 insertions(+), 24 deletions(-)

diff --git a/configure b/configure
index c56ed53ee36..fda1a35cbc0 100755
--- a/configure
+++ b/configure
@@ -3089,6 +3089,8 @@ for f in $LINKS ; do
     fi
 done
 
+symlink ../../pc-bios qemu-bundle/share/qemu
+
 (for i in $cross_cc_vars; do
   export $i
 done
diff --git a/meson.build b/meson.build
index 8df40bfac4d..a2c987b41d6 100644
--- a/meson.build
+++ b/meson.build
@@ -1469,7 +1469,7 @@ endif
 config_host_data.set_quoted('CONFIG_BINDIR', get_option('prefix') / get_option('bindir'))
 config_host_data.set_quoted('CONFIG_PREFIX', get_option('prefix'))
 config_host_data.set_quoted('CONFIG_QEMU_CONFDIR', get_option('prefix') / qemu_confdir)
-config_host_data.set_quoted('CONFIG_QEMU_DATADIR', get_option('prefix') / qemu_datadir)
+config_host_data.set_quoted('CONFIG_QEMU_BUNDLE_DATADIR', qemu_datadir)
 config_host_data.set_quoted('CONFIG_QEMU_DESKTOPDIR', get_option('prefix') / qemu_desktopdir)
 config_host_data.set_quoted('CONFIG_QEMU_FIRMWAREPATH', get_option('qemu_firmwarepath'))
 config_host_data.set_quoted('CONFIG_QEMU_HELPERDIR', get_option('prefix') / get_option('libexecdir'))
diff --git a/softmmu/datadir.c b/softmmu/datadir.c
index 504c4665bed..2d8366039d9 100644
--- a/softmmu/datadir.c
+++ b/softmmu/datadir.c
@@ -36,6 +36,7 @@ char *qemu_find_file(int type, const char *name)
     int i;
     const char *subdir;
     char *buf;
+    char *bundle;
 
     /* Try the name as a straight path first */
     if (access(name, R_OK) == 0) {
@@ -62,6 +63,16 @@ char *qemu_find_file(int type, const char *name)
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
 
@@ -84,26 +95,6 @@ void qemu_add_data_dir(char *path)
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
@@ -115,9 +106,6 @@ void qemu_add_default_firmwarepath(void)
         qemu_add_data_dir(get_relocated_path(dirs[i]));
     }
     g_strfreev(dirs);
-
-    /* try to find datadir relative to the executable path */
-    qemu_add_data_dir(find_datadir());
 }
 
 void qemu_list_data_dirs(void)
@@ -126,4 +114,5 @@ void qemu_list_data_dirs(void)
     for (i = 0; i < data_dir_idx; i++) {
         printf("%s\n", data_dir[i]);
     }
+    list_bundle_candidates(CONFIG_QEMU_BUNDLE_DATADIR);
 }
-- 
2.32.0 (Apple Git-132)


