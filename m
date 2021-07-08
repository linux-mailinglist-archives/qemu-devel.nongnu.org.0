Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 233723C18C4
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 19:59:47 +0200 (CEST)
Received: from localhost ([::1]:52974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1YJO-0001z1-6O
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 13:59:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1m1Xmd-0007kh-2P
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 13:25:55 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:35770)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1m1Xma-0005Xv-QN
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 13:25:54 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 h1-20020a17090a3d01b0290172d33bb8bcso6422037pjc.0
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 10:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LQbJ6tvxgtSuK82AYiemIK41Tl8sHz5A/wPUWSQw+Ko=;
 b=PVSmOLIBVb25pmjBW/0SNz0jWOpAVuhOwxUI/ddD9j/Leuj46Xqk6gfwAg4jbLsY1U
 i2bhFy9lSNHb0Uyp91Pjhpt5qgDr2Q9AxES0eZo4YaNlnLXeCY0LDvPqTqOqCS4sXE/0
 u41uYmN4/oVVFG0oLAhiG1IzCuI8crBPRvoHNfcVFGGBI2lmo4OtaU558MfNRB2MItMo
 KcJHbjvZsDoF0ne5holSbHNsPjF1EZkbjLjbgFw93whO9Ly/fwjUupH590SHyp1yg4YH
 lljEhRynyISGnOXZ26rJB53s/M8v+UPyNTG3+y+K+3QgdVdsQ/mB6IOrg+BQ66FY+PFY
 j5QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LQbJ6tvxgtSuK82AYiemIK41Tl8sHz5A/wPUWSQw+Ko=;
 b=Hz8kTDitp7zrI+aU7UN7uWKsJaR2miikjPDrQ/KMH+0Nbxsga+wWMjA8v1XdKqDiDl
 9qjPp0y/vqEALxR+2/kATd0UeC3+YJFLDpsPNwv89WeBu+UmT+w2fYmMeWjCOAT28lLN
 Vjf+ekMOPrfF5yZaoIbA6lgeEaN1EM2jciW1GhzzWzgDmqzmNfTqdFElgwC6QYhbeHuC
 EOrO9p0SkGjsid+c11SGdKBiQYlg9+BH+YkuJh1F0kklkH0VVLELw5s6Jx3mi6nf0YoK
 b6KhYzNFKxV/L9chfmoQKGJOZYBK3NMUJ9AVppDY+KRLK7/fd9GnUyk4FFCkxdgQ0oaj
 b1Jg==
X-Gm-Message-State: AOAM531MIDbq8NAj78lG6t06uHDvAZZJTkkk1c6n7e1cKKiBtlr8G245
 FRIxug2ho38WwAAwGDx0Wd6wE7QQzUXJjA==
X-Google-Smtp-Source: ABdhPJy7vxz/zk8dLj+jp6NYTA21lSjJNiC4uxfXqduZ2js8s7Q7zb+BPv5tiiEZfCuibLYVBZUDVw==
X-Received: by 2002:a17:902:768c:b029:128:b109:d0d8 with SMTP id
 m12-20020a170902768cb0290128b109d0d8mr26893909pll.19.1625765150977; 
 Thu, 08 Jul 2021 10:25:50 -0700 (PDT)
Received: from localhost.localdomain
 ([2400:4050:c360:8200:7947:37f7:fd02:9c0c])
 by smtp.gmail.com with ESMTPSA id c20sm3579429pfd.64.2021.07.08.10.25.48
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 08 Jul 2021 10:25:50 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Subject: [PATCH 2/4] datadir: Use bundle mechanism
Date: Fri,  9 Jul 2021 02:25:39 +0900
Message-Id: <20210708172541.29530-2-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
In-Reply-To: <20210708172541.29530-1-akihiko.odaki@gmail.com>
References: <20210708172541.29530-1-akihiko.odaki@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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
index 650d9c07358..cff5a8ac280 100755
--- a/configure
+++ b/configure
@@ -5058,6 +5058,8 @@ for f in $UNLINK ; do
     fi
 done
 
+symlink ../../pc-bios qemu-bundle/share/qemu
+
 (for i in $cross_cc_vars; do
   export $i
 done
diff --git a/meson.build b/meson.build
index 877d4fa0b6a..44adc660e23 100644
--- a/meson.build
+++ b/meson.build
@@ -1197,7 +1197,7 @@ endif
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
2.30.1 (Apple Git-130)


