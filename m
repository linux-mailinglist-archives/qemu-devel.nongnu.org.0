Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6712355B4A9
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 02:27:14 +0200 (CEST)
Received: from localhost ([::1]:60826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5cav-00085K-H8
	for lists+qemu-devel@lfdr.de; Sun, 26 Jun 2022 20:27:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1o5cTp-0007WF-Sv; Sun, 26 Jun 2022 20:19:53 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:35600)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1o5cTo-0000bq-2X; Sun, 26 Jun 2022 20:19:53 -0400
Received: by mail-pl1-x630.google.com with SMTP id o18so6761679plg.2;
 Sun, 26 Jun 2022 17:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uCBSV1a3T0RavDWr47mBjoBHGiE4VvB7HcyvwccMHIE=;
 b=hd0frErwRGQz3O1CS7pf2b+VjSz5VNEsPY5IY5tww4JXsRYnuReC5Dxw8K8ceyMPu5
 wPaZ6uaC+rpSxId183rpRX7cCO8Qs1KJMxvMFFJ50MfM3NYdHdrZrdG1Y4sNFvr/D2M8
 At+LsWQGsHaGlfHInwbLYlIzP2yLYdBGxMOWov7dRj2CW0v4Px1SJY6DuPtic8hRvmEn
 XlFCFkco9rt2tD/pfDLrDEaqmZ07LYq/bMQpzUknhlPNKkQht5H1Ufb/XngWmNUyJws/
 bB7yoyUwZynzpCVr47z7CP3CxGN44XF0n1ag/xYCiFRCgpWf+CRyaKmVkvDRwBE6yHZf
 TU5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uCBSV1a3T0RavDWr47mBjoBHGiE4VvB7HcyvwccMHIE=;
 b=fYM8rZC7HSEFkKXI06gisK3AWYfBeGZviVv5U0qcUKNrX4gFBp1Iw08oPlpE+ILrs6
 g289v/5/BKPfLe2OaQjqFS1JaNihWq+WVWyEq/OtTHj7XzGc4Uan1UXKHYVpQ1hrPckz
 p4NPhGZvpZ1nEGZqLHP4aAAQIV8+o9xo+ovCmaTrnjhZgkmbN4BF3Ok/3K2irZBE1uUO
 IW2/quVjFd/iTYNy4E8NsL0EneXFOssjDTgkR98K5upMZrHlcDhRf+mrZU4uPSlYvo8e
 RhxrLs6pReOK5pSpGYP9tqD81hc2DAHS34BhB6wwgO0bXIQXIYun2WKFYAigLGYk2xZi
 2Plg==
X-Gm-Message-State: AJIora+pVrXjfS+p5/ZwLSN08JWCJD/9kjmQU+v7KpS9N5xx0ei2S2KF
 TfLhgo+IZi7KK3rXua6BJJ9QY7PVoqqfqQ==
X-Google-Smtp-Source: AGRyM1vcDzXMhXJ7a2GAhUp1MlyZqh6RjcmIQX/zzJh5b/AKLRDyMAZ9vsQfOeKysdZNL1WUNQoxrg==
X-Received: by 2002:a17:90a:6396:b0:1ec:f52d:90db with SMTP id
 f22-20020a17090a639600b001ecf52d90dbmr12747532pjj.52.1656289190224; 
 Sun, 26 Jun 2022 17:19:50 -0700 (PDT)
Received: from fedora.. ([106.84.130.34]) by smtp.gmail.com with ESMTPSA id
 e11-20020a6558cb000000b00408b89e4282sm5715294pgu.47.2022.06.26.17.19.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Jun 2022 17:19:49 -0700 (PDT)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: hare@suse.de, Hanna Reitz <hreitz@redhat.com>, dmitry.fomichev@wdc.com,
 Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Stefan Hajnoczi <stefanha@redhat.com>, damien.lemoal@opensource.wdc.com,
 qemu-block@nongnu.org, Sam Li <faithilikerun@gmail.com>
Subject: [RFC v3 3/5] file-posix: introduce get_sysfs_long_val for zoned
 device information.
Date: Mon, 27 Jun 2022 08:19:15 +0800
Message-Id: <20220627001917.9417-4-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220627001917.9417-1-faithilikerun@gmail.com>
References: <20220627001917.9417-1-faithilikerun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=faithilikerun@gmail.com; helo=mail-pl1-x630.google.com
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
that ioctl() commands of zone management interface won't work. It can
return long type of value like chunk_sectors, zoned_append_max_bytes,
max_open_zones, max_active_zones.
---
 block/file-posix.c | 37 +++++++++++++++++++++++++------------
 1 file changed, 25 insertions(+), 12 deletions(-)

diff --git a/block/file-posix.c b/block/file-posix.c
index 1b8b0d351f..73c2cdfbca 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -1216,15 +1216,19 @@ static int hdev_get_max_hw_transfer(int fd, struct stat *st)
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
@@ -1237,8 +1241,9 @@ static int hdev_get_max_segments(int fd, struct stat *st)
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
@@ -1256,9 +1261,9 @@ static int hdev_get_max_segments(int fd, struct stat *st)
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
@@ -1272,6 +1277,15 @@ out:
 #endif
 }
 
+static int hdev_get_max_segments(int fd, struct stat *st) {
+    int ret;
+    ret = get_sysfs_long_val(fd, st, "max_segments");
+    if (ret < 0) {
+        return -1;
+    }
+    return ret;
+}
+
 static void raw_refresh_limits(BlockDriverState *bs, Error **errp)
 {
     BDRVRawState *s = bs->opaque;
@@ -1872,6 +1886,7 @@ static int handle_aiocb_zone_report(void *opaque) {
 
 static int handle_aiocb_zone_mgmt(void *opaque) {
     RawPosixAIOData *aiocb = opaque;
+    BlockDriverState *s = aiocb->bs;
     int fd = aiocb->aio_fildes;
     int64_t offset = aiocb->aio_offset;
     int64_t len = aiocb->aio_nbytes;
@@ -1884,11 +1899,9 @@ static int handle_aiocb_zone_mgmt(void *opaque) {
     int64_t zone_size_mask;
     int ret;
 
-    ret = ioctl(fd, BLKGETZONESZ, &zone_size);
-    if (ret) {
-        return -1;
-    }
-
+    g_autofree struct stat *file = g_new(struct stat, 1);
+    stat(s->filename, file);
+    zone_size = get_sysfs_long_val(fd, file, "chunk_sectors");
     zone_size_mask = zone_size - 1;
     if (offset & zone_size_mask) {
         error_report("offset is not the start of a zone");
-- 
2.35.3


