Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DD0860FC3F
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 17:47:56 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo54w-0000wD-BZ; Thu, 27 Oct 2022 11:45:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oo54r-0000Vk-IL; Thu, 27 Oct 2022 11:45:55 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oo54c-00013p-6L; Thu, 27 Oct 2022 11:45:46 -0400
Received: by mail-pl1-x634.google.com with SMTP id n7so1930384plp.1;
 Thu, 27 Oct 2022 08:45:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R2mJnjpcL3xEm+xhC8qiDzUKjlvtfd7jwLm78mbcKIo=;
 b=ErbE84OaBfXWc9UeTJ/0eD35tKlEOc0TL6KL5/gR0rxt2NrmwSh27uCClVpFnlx98M
 3oqoySfVp3v3EGSA/2uaqbM9171DU86kRZAzMguSikiyaTin6Z3ixAoNemJaW6cPn0fp
 5n5GiBDvmjArnoTvL6FsGBQ68Ayn5kmbCgxo51h776yqmmUDySuXJjZv7vcyxz8S+x5s
 Xy3lpg0IUjIkc2rh3+QSe2pKPPvUUWaFgP0pOurE8BNEXrfYfGhhqx7maW/uJ0EMH3wH
 +G4OkYECW02HKxNJgS7uS1nB6sCk33tOTaarAzY3nL3lkHe1LuF/4X5KUS+4ZucUvRfT
 lkeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=R2mJnjpcL3xEm+xhC8qiDzUKjlvtfd7jwLm78mbcKIo=;
 b=X4BZL63VFliXrAfNOJgYJsrdX7k93AjBQnAl+g/RHUB5KzaBi7710m5PEUoELyrsNV
 loeXTIeWxF4XdJN6pmQ2Elp4y53fpMkkC/6LeF4DtNuK7Vn45M6GFcsfOB/U9WkINKcu
 BIat0ZbkLehg8m7RY/RNsqqabQJP5tIsR/JtEp3d5itSbHTkrMvnqyJz/ugZvoD7y45g
 DL7lQ1HT3Bk6OVtVmA0kJ+GFAs5VNJnIL/ZEBAhInH0nx2oG41noVH563tquU0W8RGwF
 M4zx3gUwa2RWphrm4Ru6RPnOGL2/BpR3saiiwgh7wRKthAKoGJiONBLkul+SP/JSL8Uf
 AcCA==
X-Gm-Message-State: ACrzQf1b3nSoopmaWOc4A3MaqKTf2lBPaKO6UkR12wFG56ldXtVmAnxD
 HuttdIFYRzJex51oT7red1Mq0xZW41k2x+nx
X-Google-Smtp-Source: AMsMyM7chBDQNPc7gk62PmL5S3CDhI3s3pa2UJQaMre+L+VNxVUm0yxOP0UofBEU+2RLPppDfbtdUA==
X-Received: by 2002:a17:902:f786:b0:186:7a6b:217c with SMTP id
 q6-20020a170902f78600b001867a6b217cmr33127410pln.55.1666885535854; 
 Thu, 27 Oct 2022 08:45:35 -0700 (PDT)
Received: from roots.. ([112.44.202.248]) by smtp.gmail.com with ESMTPSA id
 q9-20020a63d609000000b004405c6eb962sm1232801pgg.4.2022.10.27.08.45.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Oct 2022 08:45:35 -0700 (PDT)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: Fam Zheng <fam@euphon.net>, Hanna Reitz <hreitz@redhat.com>,
 damien.lemoal@opensource.wdc.com, qemu-block@nongnu.org,
 stefanha@redhat.com, Markus Armbruster <armbru@redhat.com>, hare@suse.de,
 Kevin Wolf <kwolf@redhat.com>, dmitry.fomichev@wdc.com,
 Eric Blake <eblake@redhat.com>, Sam Li <faithilikerun@gmail.com>
Subject: [PATCH v13 2/8] file-posix: introduce helper functions for sysfs
 attributes
Date: Thu, 27 Oct 2022 23:44:58 +0800
Message-Id: <20221027154504.20684-3-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221027154504.20684-1-faithilikerun@gmail.com>
References: <20221027154504.20684-1-faithilikerun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=faithilikerun@gmail.com; helo=mail-pl1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Use get_sysfs_str_val() to get the string value of device
zoned model. Then get_sysfs_zoned_model() can convert it to
BlockZoneModel type of QEMU.

Use get_sysfs_long_val() to get the long value of zoned device
information.

Signed-off-by: Sam Li <faithilikerun@gmail.com>
Reviewed-by: Hannes Reinecke <hare@suse.de>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Reviewed-by: Dmitry Fomichev <dmitry.fomichev@wdc.com>
---
 block/file-posix.c               | 124 ++++++++++++++++++++++---------
 include/block/block_int-common.h |   3 +
 2 files changed, 91 insertions(+), 36 deletions(-)

diff --git a/block/file-posix.c b/block/file-posix.c
index 23acffb9a4..8cb07fdb8a 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -1201,66 +1201,112 @@ static int hdev_get_max_hw_transfer(int fd, struct stat *st)
 #endif
 }
 
-static int hdev_get_max_segments(int fd, struct stat *st)
-{
+/*
+ * Get a sysfs attribute value as character string.
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
+    size_t len;
 
-    if (S_ISCHR(st->st_mode)) {
-        if (ioctl(fd, SG_GET_SG_TABLESIZE, &ret) == 0) {
-            return ret;
-        }
+    if (!S_ISBLK(st->st_mode)) {
         return -ENOTSUP;
     }
 
-    if (!S_ISBLK(st->st_mode)) {
-        return -ENOTSUP;
+    sysfspath = g_strdup_printf("/sys/dev/block/%u:%u/queue/%s",
+                                major(st->st_rdev), minor(st->st_rdev),
+                                attribute);
+    ret = g_file_get_contents(sysfspath, val, &len, NULL);
+    if (ret == -1) {
+        return -ENOENT;
     }
 
-    sysfspath = g_strdup_printf("/sys/dev/block/%u:%u/queue/max_segments",
-                                major(st->st_rdev), minor(st->st_rdev));
-    sysfd = open(sysfspath, O_RDONLY);
-    if (sysfd == -1) {
-        ret = -errno;
-        goto out;
+    /* The file is ended with '\n' */
+    char *p;
+    p = *val;
+    if (*(p + len - 1) == '\n') {
+        *(p + len - 1) = '\0';
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
+static int get_sysfs_zoned_model(struct stat *st, BlockZoneModel *zoned)
+{
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
+/*
+ * Get a sysfs attribute value as a long integer.
+ */
+static long get_sysfs_long_val(struct stat *st, const char *attribute)
+{
+#ifdef CONFIG_LINUX
+    g_autofree char *str = NULL;
+    const char *end;
+    long val;
+    int ret;
+
+    ret = get_sysfs_str_val(st, attribute, &str);
+    if (ret < 0) {
+        return ret;
+    }
+
+    /* The file is ended with '\n', pass 'end' to accept that. */
+    ret = qemu_strtol(str, &end, 10, &val);
+    if (ret == 0 && end && *end == '\0') {
+        ret = val;
     }
-    g_free(sysfspath);
     return ret;
 #else
     return -ENOTSUP;
 #endif
 }
 
+static int hdev_get_max_segments(int fd, struct stat *st)
+{
+#ifdef CONFIG_LINUX
+    int ret;
+
+    if (S_ISCHR(st->st_mode)) {
+        if (ioctl(fd, SG_GET_SG_TABLESIZE, &ret) == 0) {
+            return ret;
+        }
+        return -ENOTSUP;
+    }
+    return get_sysfs_long_val(st, "max_segments");
+#else
+    return -ENOTSUP;
+#endif
+}
+
 static void raw_refresh_limits(BlockDriverState *bs, Error **errp)
 {
     BDRVRawState *s = bs->opaque;
     struct stat st;
+    int ret;
+    BlockZoneModel zoned;
 
     s->needs_alignment = raw_needs_alignment(bs);
     raw_probe_alignment(bs, s->fd, errp);
@@ -1298,6 +1344,12 @@ static void raw_refresh_limits(BlockDriverState *bs, Error **errp)
             bs->bl.max_hw_iov = ret;
         }
     }
+
+    ret = get_sysfs_zoned_model(&st, &zoned);
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
2.38.1


