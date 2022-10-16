Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4DC6600021
	for <lists+qemu-devel@lfdr.de>; Sun, 16 Oct 2022 16:57:28 +0200 (CEST)
Received: from localhost ([::1]:54634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ok54x-0006zY-Tx
	for lists+qemu-devel@lfdr.de; Sun, 16 Oct 2022 10:57:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1ok4zM-0006GS-0W; Sun, 16 Oct 2022 10:51:40 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:46707)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1ok4zK-0004qi-56; Sun, 16 Oct 2022 10:51:39 -0400
Received: by mail-pf1-x42b.google.com with SMTP id y8so8972237pfp.13;
 Sun, 16 Oct 2022 07:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7vNjrZGHj3ROzur/QKsAJAxo+Dn49VyUObcXs/TtCn4=;
 b=Yn4Faf1tyo/kHVGQX5q+/xrtxea3UAyCCupSgcAGDZ5/RsOOne3VCKzJ4f/zyruSuE
 anmPYZaAwUn7QxiP5pE2g4RgOPLbkRViop8ixQxzdJMNI3hH7ei3rHJyFpEPb6hE1G/6
 92wuNHXDy63bJcDWZK+t1f+OPpfwOiFso+fqQGMonlC700cAFThRgfImYvHK3I7i1FH3
 hYLC8pCvHXb+SmLT+1JLkP/+tQzCTrBBhHgZumT9rllrtZh2UtjaDbjpH5MtF604Zqml
 Z+UpNaByYuKhpkWdoM2ROANU21/8A3UgA/fHJQOMRE03YNtYnAyd1juxf0n/CyoQy9+4
 PSNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7vNjrZGHj3ROzur/QKsAJAxo+Dn49VyUObcXs/TtCn4=;
 b=vLkDM4w50Zk0yLsd0u77STgsKscd/jXpsLwW4HG5gE7LY1TDn7EgtWlPm5/JXnTHrA
 9lg8gwZpHmZNiKxVwtY9J8H2jasYDAjNPpsn/+wQ8W8RshQMBzBLJBaPmTb+T9WJASJ4
 BJ+tna06LuzBfrcSSjnMTKGBpNwD5o10TvnthX8C85Z/pXwIsgDH7yHdACME5S+559qS
 mPQZgkGSZFl+t9fwC28OdfMXQTek2REo7so7iMcd+X1hEYCSf2bPpq53X8JKyN58ifxc
 haJpNyTdnvpYqjrE2A/YSBLX5wEuMsB7QAwDATBDb+4D9WeESfbFUfwFtMK551vpXK27
 Vrig==
X-Gm-Message-State: ACrzQf1t7+jUr4Qc+Z9jqEUKqhtwLq8UHNgE6RkdsQ1czr+J37Bxefq4
 YIhL9NHhvTtCc8H8VKP2Iolb18gAZtnXiQ==
X-Google-Smtp-Source: AMsMyM6x0WrD2b7qv7GWBp0+KhwN8obj/NAR6SmVW0JB5sRMr1pcTUsYuwmqPKDmvtjK+gbbyPQAMw==
X-Received: by 2002:a63:f305:0:b0:43f:6af:7553 with SMTP id
 l5-20020a63f305000000b0043f06af7553mr6885850pgh.570.1665931896074; 
 Sun, 16 Oct 2022 07:51:36 -0700 (PDT)
Received: from roots.. ([183.221.93.248]) by smtp.gmail.com with ESMTPSA id
 z27-20020aa79e5b000000b005377c74c409sm5143619pfq.4.2022.10.16.07.51.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Oct 2022 07:51:35 -0700 (PDT)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Fam Zheng <fam@euphon.net>, damien.lemoal@opensource.wdc.com,
 Stefan Hajnoczi <stefanha@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-block@nongnu.org, hare@suse.de, Eric Blake <eblake@redhat.com>,
 dmitry.fomichev@wdc.com, Sam Li <faithilikerun@gmail.com>
Subject: [PATCH v12 2/7] file-posix: introduce helper functions for sysfs
 attributes
Date: Sun, 16 Oct 2022 22:51:05 +0800
Message-Id: <20221016145110.171262-3-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221016145110.171262-1-faithilikerun@gmail.com>
References: <20221016145110.171262-1-faithilikerun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=faithilikerun@gmail.com; helo=mail-pf1-x42b.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use get_sysfs_str_val() to get the string value of device
zoned model. Then get_sysfs_zoned_model() can convert it to
BlockZoneModel type of QEMU.

Use get_sysfs_long_val() to get the long value of zoned device
information.

Signed-off-by: Sam Li <faithilikerun@gmail.com>
Reviewed-by: Hannes Reinecke <hare@suse.de>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
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
2.37.3


