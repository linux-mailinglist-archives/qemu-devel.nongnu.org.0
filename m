Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6D18571011
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 04:18:20 +0200 (CEST)
Received: from localhost ([::1]:47082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oB5Tf-00076o-Ti
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 22:18:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oB5Pb-0000uk-0k; Mon, 11 Jul 2022 22:14:07 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:40715)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oB5PZ-0007yv-DO; Mon, 11 Jul 2022 22:14:06 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 g16-20020a17090a7d1000b001ea9f820449so10041968pjl.5; 
 Mon, 11 Jul 2022 19:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=X6UnQvN3OLOVsFUsNq31Hyp6m/tlEpJBxogdQyEOF0s=;
 b=dZDnoBisiFSaZtf2sKxaKEoW0fFNoDs0TnEhE+ZumeFGt3Y3ROSimO9YxoWRqf6Jn+
 v4X6lkyB8wEOzSuW48XqFiUSSqOvvJJAYt3k7khNakzyRlmEXbI/GnnD3f5q/Z3hBwbU
 95KuSG7C4qwGiYkXtCiSM3PaV4Iy8zu0O52X7czfhLHHP/kNeD/FQIPX6irJFSJVytQE
 Qwijpy5OYMe2mOPKVuqYcCTj+rhuKkEBubQbxmK6Su4TuYz8dwRrkLuxBSYGqnB2ORCD
 cSUrwxKZ9+YmG7WYsdulRm353ozJDLDxusdehQzDeWMBvnCV2l0sMZpir9Tifynwy6vh
 0JGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=X6UnQvN3OLOVsFUsNq31Hyp6m/tlEpJBxogdQyEOF0s=;
 b=awZ8onYRApvHs8zUQ3OPKEOWNyIOIzRnUvviIM5Ch5aet41+YgSurNzWMxVgUKOV2A
 J85WHmdrJQwU6lwECHb7JY5XYTg3VXicd152VfdrynamOGW+umfeHwjDmuP4lu0/L8t0
 cgx3+0RYHoODgIEc7emJqo7U1JtxZw2D+Y926ezn/+NjKAsp0bUanfBzkp+3QyGVMh1+
 7x0jtvpOSmHZEGOIJq5C67o/ZxaGSNrlDgj1bq/BbQpBc04OkjI+IrBzkRmUEglPEFV9
 iInChLhwm0Q9H5XPFEzCNNc9SnsixQc+onw6Dxg36BfaMi/9mdoLoQT36KGd0LodVn17
 xBtQ==
X-Gm-Message-State: AJIora/rFly/qeiDlp4rRyCe19xovOA6wiK12StvDssgt9EIx6hiV8nI
 r2Hs/BVEkGuGYs5OZaKX26E/Et+qLD1nHim8
X-Google-Smtp-Source: AGRyM1tmhv8Z/292CrWuxRK8pJ5PGO1yww1pegunr3sJ390+7fBG3++dhWHndRvQV1bT8L89WDNMeA==
X-Received: by 2002:a17:90b:4c0f:b0:1f0:3dba:bdb0 with SMTP id
 na15-20020a17090b4c0f00b001f03dbabdb0mr1580379pjb.6.1657592043601; 
 Mon, 11 Jul 2022 19:14:03 -0700 (PDT)
Received: from roots.. ([106.84.131.214]) by smtp.gmail.com with ESMTPSA id
 k22-20020aa79736000000b00528f9597fb3sm5430251pfg.197.2022.07.11.19.14.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jul 2022 19:14:03 -0700 (PDT)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: damien.lemoal@opensource.wdc.com, Markus Armbruster <armbru@redhat.com>,
 dmitry.fomichev@wdc.com, Stefan Hajnoczi <stefanha@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org,
 Eric Blake <eblake@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Fam Zheng <fam@euphon.net>, hare@suse.de, Sam Li <faithilikerun@gmail.com>
Subject: [RFC v4 3/9] file-posix: introduce get_sysfs_long_val for a block
 queue of sysfs attribute
Date: Tue, 12 Jul 2022 10:13:39 +0800
Message-Id: <20220712021345.8530-4-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220712021345.8530-1-faithilikerun@gmail.com>
References: <20220712021345.8530-1-faithilikerun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=faithilikerun@gmail.com; helo=mail-pj1-x1033.google.com
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

Use sysfs attribute files to get the zoned device information in case
that ioctl() commands of zone management interface won't work.

Signed-off-by: Sam Li <faithilikerun@gmail.com>
---
 block/file-posix.c | 38 +++++++++++++++++++++++++++-----------
 1 file changed, 27 insertions(+), 11 deletions(-)

diff --git a/block/file-posix.c b/block/file-posix.c
index e7523ae2ed..3161d39ea4 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -1218,15 +1218,19 @@ static int hdev_get_max_hw_transfer(int fd, struct stat *st)
 #endif
 }
 
-static int hdev_get_max_segments(int fd, struct stat *st)
-{
+/*
+ * Get zoned device information (chunk_sectors, zoned_append_max_bytes,
+ * max_open_zones, max_active_zones) through sysfs attribute files.
+ */
+static long get_sysfs_long_val(int fd, struct stat *st,
+                               const char *attribute) {
 #ifdef CONFIG_LINUX
     char buf[32];
     const char *end;
     char *sysfspath = NULL;
     int ret;
     int sysfd = -1;
-    long max_segments;
+    long val;
 
     if (S_ISCHR(st->st_mode)) {
         if (ioctl(fd, SG_GET_SG_TABLESIZE, &ret) == 0) {
@@ -1239,8 +1243,9 @@ static int hdev_get_max_segments(int fd, struct stat *st)
         return -ENOTSUP;
     }
 
-    sysfspath = g_strdup_printf("/sys/dev/block/%u:%u/queue/max_segments",
-                                major(st->st_rdev), minor(st->st_rdev));
+    sysfspath = g_strdup_printf("/sys/dev/block/%u:%u/queue/%s",
+                                major(st->st_rdev), minor(st->st_rdev),
+                                attribute);
     sysfd = open(sysfspath, O_RDONLY);
     if (sysfd == -1) {
         ret = -errno;
@@ -1258,9 +1263,9 @@ static int hdev_get_max_segments(int fd, struct stat *st)
     }
     buf[ret] = 0;
     /* The file is ended with '\n', pass 'end' to accept that. */
-    ret = qemu_strtol(buf, &end, 10, &max_segments);
+    ret = qemu_strtol(buf, &end, 10, &val);
     if (ret == 0 && end && *end == '\n') {
-        ret = max_segments;
+        ret = val;
     }
 
 out:
@@ -1274,6 +1279,10 @@ out:
 #endif
 }
 
+static int hdev_get_max_segments(int fd, struct stat *st) {
+    return get_sysfs_long_val(fd, st, "max_segments");
+}
+
 static void raw_refresh_limits(BlockDriverState *bs, Error **errp)
 {
     BDRVRawState *s = bs->opaque;
@@ -1883,10 +1892,17 @@ static int handle_aiocb_zone_mgmt(void *opaque) {
     int64_t zone_size_mask;
     int ret;
 
-    g_autofree struct stat *file = NULL;
-    file = g_new(struct stat, 1);
-    stat(s->filename, file);
-    zone_size = get_sysfs_long_val(fd, file, "chunk_sectors");
+    struct stat file;
+    if (fstat(fd, &file) < 0) {
+        return -errno;
+    }
+    mod = get_sysfs_str_val(fd, &file);
+    if (mod != BLK_Z_HM) {
+        ret = -ENOTSUP;
+        return ret;
+    }
+
+    zone_size = get_sysfs_long_val(fd, &file, "chunk_sectors");
     zone_size_mask = zone_size - 1;
     if (offset & zone_size_mask) {
         error_report("offset is not the start of a zone");
-- 
2.36.1


