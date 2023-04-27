Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BCBA6F0AB6
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 19:22:10 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ps5Ib-0006aR-Bp; Thu, 27 Apr 2023 13:20:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1ps5IY-0006TR-LS; Thu, 27 Apr 2023 13:20:50 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1ps5IW-0007LR-W8; Thu, 27 Apr 2023 13:20:50 -0400
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-1a920d484bdso68664045ad.1; 
 Thu, 27 Apr 2023 10:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682616047; x=1685208047;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=onSu0Ke/vEcZki4o3PulYUE8aFRZwU69Hc3w/Cte9mM=;
 b=UqyUVE/Jopsdt3CAyUE+JKznF9akwMG3nZGMbybqZyMvcHvfOW5+EORaeU1iTNvqck
 08HAeDKLbcwOLPxAvPyQPl8YRNH4FQJI9B/EmDkAAVqFHG8fNSVhVF/2SEimGdbDw9YB
 t1LR99wukXcya7c5eRBGmeknSYcuDp61bXxh8wvEwXha1TZj+OSIW0vOT3SSnMUGMCBW
 VGcT+1P36VnzO4lGunogJG5RN0H1kLxmd5Mx57Su03QOAyycLhZHYAOXGXHWvjBFEKl2
 oPRo129MQ9UBZ/AGv/nhQLD0He4D6u5Vnc7+UP012UM8oqFweUIoLgQQrtRD5CtizQMX
 uzYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682616047; x=1685208047;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=onSu0Ke/vEcZki4o3PulYUE8aFRZwU69Hc3w/Cte9mM=;
 b=QBL4SES5dULLkGXuMTGJbVQBQ7l0RUyv8C8uxfTaVndN/FvYFWj0tSwy+K5or9qyo7
 OTVxAdJZHAUUyXv6cFR8kmjXtNBPHD8E+69qFbXYA2kQxeveq56kD9cKp5ywTc1ssxz3
 1HKewLGWMGURLi20jVF1xmRI1O7ZJMLtJjWfStHY8qaQ53ry3u3dLxk1Hf1mgqhmp6gM
 6/ONg8/ZU2G8kciAhk1b5FNxUE3nw0gbTP8rfoEYnJ7p8m6XJTnyTJFHlwkbwCx6zakW
 Ops1y4yPu8YaR7uSu8xtka6eOEgQVP9lKLG+EwvGcHFuOjOV8w+Dgj/tuLO+uDR6ywBS
 XLng==
X-Gm-Message-State: AC+VfDy2l21h7H0Zmnwpc2sGK3BfTSZibllZvCUPx22QKPtr3UQ/HToa
 lSqdprZGQpe+qllnRahUuQuf0go9DO7lRa/nZSU=
X-Google-Smtp-Source: ACHHUZ6t35ZlODB0GpOKCd8k4WbVRdgxU6H9YMyzSl8f3by67/GqJYYTqJIOQ2JlDYUif1Xm+dPa/w==
X-Received: by 2002:a17:903:120f:b0:1a8:13fc:a654 with SMTP id
 l15-20020a170903120f00b001a813fca654mr2495517plh.25.1682616046444; 
 Thu, 27 Apr 2023 10:20:46 -0700 (PDT)
Received: from fedlinux.. ([106.84.128.101]) by smtp.gmail.com with ESMTPSA id
 p1-20020a170902a40100b001a95c7742bbsm8878578plq.9.2023.04.27.10.20.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Apr 2023 10:20:46 -0700 (PDT)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Paolo Bonzini <pbonzini@redhat.com>, dlemoal@kernel.org, hare@suse.de,
 Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 stefanha@redhat.com, dmitry.fomichev@wdc.com, qemu-block@nongnu.org,
 Sam Li <faithilikerun@gmail.com>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>
Subject: [PATCH v19 2/8] block/file-posix: introduce helper functions for
 sysfs attributes
Date: Fri, 28 Apr 2023 01:20:13 +0800
Message-Id: <20230427172019.3345-3-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230427172019.3345-1-faithilikerun@gmail.com>
References: <20230427172019.3345-1-faithilikerun@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=faithilikerun@gmail.com; helo=mail-pl1-x633.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FREEMAIL_REPLY=1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

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
Acked-by: Kevin Wolf <kwolf@redhat.com>
Message-id: 20230324090605.28361-3-faithilikerun@gmail.com
[Adjust commit message prefix as suggested by Philippe Mathieu-Daudé
<philmd@linaro.org>.
--Stefan]
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 block/file-posix.c               | 131 +++++++++++++++++++++++--------
 include/block/block_int-common.h |   3 +
 2 files changed, 100 insertions(+), 34 deletions(-)

diff --git a/block/file-posix.c b/block/file-posix.c
index c7b723368e..ba15b10eee 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -1202,60 +1202,121 @@ static int hdev_get_max_hw_transfer(int fd, struct stat *st)
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
-    ret = RETRY_ON_EINTR(read(sysfd, buf, sizeof(buf) - 1));
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
+static void raw_refresh_zoned_limits(BlockDriverState *bs, struct stat *st,
+                                     Error **errp)
+{
+    BlockZoneModel zoned;
+    int ret;
+
+    bs->bl.zoned = BLK_Z_NONE;
+
+    ret = get_sysfs_zoned_model(st, &zoned);
+    if (ret < 0 || zoned == BLK_Z_NONE) {
+        return;
+    }
+    bs->bl.zoned = zoned;
+}
+
 static void raw_refresh_limits(BlockDriverState *bs, Error **errp)
 {
     BDRVRawState *s = bs->opaque;
@@ -1297,6 +1358,8 @@ static void raw_refresh_limits(BlockDriverState *bs, Error **errp)
             bs->bl.max_hw_iov = ret;
         }
     }
+
+    raw_refresh_zoned_limits(bs, &st, errp);
 }
 
 static int check_for_dasd(int fd)
diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
index 013d419444..150dc6f68f 100644
--- a/include/block/block_int-common.h
+++ b/include/block/block_int-common.h
@@ -861,6 +861,9 @@ typedef struct BlockLimits {
      * an explicit monitor command to load the disk inside the guest).
      */
     bool has_variable_length;
+
+    /* device zone model */
+    BlockZoneModel zoned;
 } BlockLimits;
 
 typedef struct BdrvOpBlocker BdrvOpBlocker;
-- 
2.40.0


