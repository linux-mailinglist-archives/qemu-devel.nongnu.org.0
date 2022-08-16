Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71C985952C2
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Aug 2022 08:42:52 +0200 (CEST)
Received: from localhost ([::1]:35740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNqHn-0002sK-HI
	for lists+qemu-devel@lfdr.de; Tue, 16 Aug 2022 02:42:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oNq1E-0005dV-1G; Tue, 16 Aug 2022 02:25:40 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:40731)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oNq1C-0003ZG-BW; Tue, 16 Aug 2022 02:25:39 -0400
Received: by mail-pg1-x533.google.com with SMTP id 24so8446580pgr.7;
 Mon, 15 Aug 2022 23:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=oBur3qKGiJGHF0aic5DCV+9mWyAk9SD7xII096cvZUM=;
 b=aZwfcFwBruJtWpTCpvKkKunKtvTRxRv6mKYQrJ77A2pcJ66IGVCqnG9mE4SM/3lymQ
 m81yLmXKDFHk2j2ZFhzQEKxkKGNZ+eCWaVouAyg0gSa0eEvzgEkseJzEOq0fFO+MYBTD
 Bf3JpPZmRbJjxP46t4odruPItHVqd9L5QE6Jyiy6OZ9TLiUtkwid0Ugy0encamwemmu0
 0nyhhLGsFcCXVFgGFk7U7LmYeNXi5s4pJBZ5JVE1aB88WZlvoD6sx6X2OLbZDiSveTQd
 gUuvGPRYwFRKbQghsNgRDXFPi+v3Ek74IODewHaOuC4CkxK2RJqBg5ONU+8fbJHJFmZA
 5lPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=oBur3qKGiJGHF0aic5DCV+9mWyAk9SD7xII096cvZUM=;
 b=GnDYdW86ycgKC/QNHIL/rB/9ptfyI9qTmblk0WRwzRrHcwDgTkxvHX6eVvJDBJqiHe
 9MJcVxRq5UD3UGXKiFcEb5Pe7Jn931o8qQlmqvJE6uOKk5WiCverHijrOoQPvIEyW2s2
 fyAHE1I0EAb2tq8EfQVXtHnNfuijyhPIaVur0fGeacEJczkWMi9vaY9O2TUMWNRSqfY1
 OMbof4oPkNX+8eCCCI9O5LoMKYVIJrkQsOMIx5QrULUGiGh8VkngDlZpTi3qjY5XQ4Eh
 WW74rFq40fABBvJTdSpoXEZ53fQOuSzGrS6dgXSS+0d6+6wvaA6ghTcZrhHrUycm4h2S
 pTUw==
X-Gm-Message-State: ACgBeo37WZrjLxtIr2sDuv3KnEjdLWoVHlmOCbkiWzhTgidLOcnCRdIv
 Lrii5wBf2dI7/I31XH1v1ofxSTbLnUUcew==
X-Google-Smtp-Source: AA6agR5i4Tpc3S9IZ/IXAGQrYITdn1osWoi81d0XAVn/idNCepKCGjQn57lMS/xiMadKq4euPH1Tgw==
X-Received: by 2002:a63:e901:0:b0:422:4d27:5814 with SMTP id
 i1-20020a63e901000000b004224d275814mr15580089pgh.317.1660631136247; 
 Mon, 15 Aug 2022 23:25:36 -0700 (PDT)
Received: from roots.. ([106.84.129.185]) by smtp.gmail.com with ESMTPSA id
 e15-20020a170902784f00b0016f1c1f50f4sm8082868pln.235.2022.08.15.23.25.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Aug 2022 23:25:35 -0700 (PDT)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: hare@suse.de, Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 stefanha@redhat.com, Hanna Reitz <hreitz@redhat.com>,
 dmitry.fomichev@wdc.com, qemu-block@nongnu.org,
 damien.lemoal@opensource.wdc.com, Sam Li <faithilikerun@gmail.com>
Subject: [PATCH v7 2/8] file-posix: introduce get_sysfs_str_val for device
 zoned model
Date: Tue, 16 Aug 2022 14:25:16 +0800
Message-Id: <20220816062522.85714-3-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220816062522.85714-1-faithilikerun@gmail.com>
References: <20220816062522.85714-1-faithilikerun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=faithilikerun@gmail.com; helo=mail-pg1-x533.google.com
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

Use sysfs attribute files to get the string value of device
zoned model. Then get_sysfs_zoned_model can convert it to
BlockZoneModel type in QEMU.

Signed-off-by: Sam Li <faithilikerun@gmail.com>
Reviewed-by: Hannes Reinecke <hare@suse.de>
---
 block/file-posix.c               | 93 ++++++++++++++++++--------------
 include/block/block_int-common.h |  3 ++
 2 files changed, 55 insertions(+), 41 deletions(-)

diff --git a/block/file-posix.c b/block/file-posix.c
index 48cd096624..c07ac4c697 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -1210,66 +1210,71 @@ static int hdev_get_max_hw_transfer(int fd, struct stat *st)
 #endif
 }
 
-static int hdev_get_max_segments(int fd, struct stat *st)
-{
+/*
+ * Convert the zoned attribute file in sysfs to internal value.
+ */
+static int get_sysfs_str_val(struct stat *st, const char *attribute,
+                             char **val) {
 #ifdef CONFIG_LINUX
-    char buf[32];
-    const char *end;
-    char *sysfspath = NULL;
+    g_autofree char *sysfspath = NULL;
     int ret;
-    int sysfd = -1;
-    long max_segments;
-
-    if (S_ISCHR(st->st_mode)) {
-        if (ioctl(fd, SG_GET_SG_TABLESIZE, &ret) == 0) {
-            return ret;
-        }
-        return -ENOTSUP;
-    }
+    size_t len;
 
     if (!S_ISBLK(st->st_mode)) {
         return -ENOTSUP;
     }
 
-    sysfspath = g_strdup_printf("/sys/dev/block/%u:%u/queue/max_segments",
-                                major(st->st_rdev), minor(st->st_rdev));
-    sysfd = open(sysfspath, O_RDONLY);
-    if (sysfd == -1) {
-        ret = -errno;
-        goto out;
+    sysfspath = g_strdup_printf("/sys/dev/block/%u:%u/queue/%s",
+                                major(st->st_rdev), minor(st->st_rdev),
+                                attribute);
+    ret = g_file_get_contents(sysfspath, val, &len, NULL);
+    if (ret == -1) {
+        return -ENOENT;
     }
-    do {
-        ret = read(sysfd, buf, sizeof(buf) - 1);
-    } while (ret == -1 && errno == EINTR);
+    return ret;
+#else
+    return -ENOTSUP;
+#endif
+}
+
+static int get_sysfs_zoned_model(struct stat *st, BlockZoneModel *zoned) {
+    g_autofree char *val = NULL;
+    int ret;
+
+    ret = get_sysfs_str_val(st, "zoned", &val);
     if (ret < 0) {
-        ret = -errno;
-        goto out;
-    } else if (ret == 0) {
-        ret = -EIO;
-        goto out;
+        return ret;
     }
-    buf[ret] = 0;
-    /* The file is ended with '\n', pass 'end' to accept that. */
-    ret = qemu_strtol(buf, &end, 10, &max_segments);
-    if (ret == 0 && end && *end == '\n') {
-        ret = max_segments;
+
+    if (strcmp(val, "host-managed") == 0) {
+        *zoned = BLK_Z_HM;
+    } else if (strcmp(val, "host-aware") == 0) {
+        *zoned = BLK_Z_HA;
+    } else if (strcmp(val, "none") == 0) {
+        *zoned = BLK_Z_NONE;
+    } else {
+        return -ENOTSUP;
     }
+    return 0;
+}
 
-out:
-    if (sysfd != -1) {
-        close(sysfd);
+static int hdev_get_max_segments(int fd, struct stat *st) {
+    int ret;
+    if (S_ISCHR(st->st_mode)) {
+        if (ioctl(fd, SG_GET_SG_TABLESIZE, &ret) == 0) {
+            return ret;
+        }
+        return -ENOTSUP;
     }
-    g_free(sysfspath);
-    return ret;
-#else
-    return -ENOTSUP;
-#endif
+    return get_sysfs_long_val(st, "max_segments");
 }
 
 static void raw_refresh_limits(BlockDriverState *bs, Error **errp)
 {
     BDRVRawState *s = bs->opaque;
     struct stat st;
+    int ret;
+    BlockZoneModel zoned;
 
     s->needs_alignment = raw_needs_alignment(bs);
     raw_probe_alignment(bs, s->fd, errp);
@@ -1307,6 +1312,12 @@ static void raw_refresh_limits(BlockDriverState *bs, Error **errp)
             bs->bl.max_hw_iov = ret;
         }
     }
+
+    ret = get_sysfs_zoned_model(s->fd, &st, &zoned);
+    if (ret < 0) {
+        zoned = BLK_Z_NONE;
+    }
+    bs->bl.zoned = zoned;
 }
 
 static int check_for_dasd(int fd)
diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
index 8947abab76..7f7863cc9e 100644
--- a/include/block/block_int-common.h
+++ b/include/block/block_int-common.h
@@ -825,6 +825,9 @@ typedef struct BlockLimits {
 
     /* maximum number of iovec elements */
     int max_iov;
+
+    /* device zone model */
+    BlockZoneModel zoned;
 } BlockLimits;
 
 typedef struct BdrvOpBlocker BdrvOpBlocker;
-- 
2.37.1


