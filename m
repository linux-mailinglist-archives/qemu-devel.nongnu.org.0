Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65D446C80ED
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Mar 2023 16:14:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfdTS-00036y-Tz; Fri, 24 Mar 2023 05:12:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1pfdTR-00036j-36; Fri, 24 Mar 2023 05:12:37 -0400
Received: from mail-ua1-x935.google.com ([2607:f8b0:4864:20::935])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1pfdTJ-0002EH-7g; Fri, 24 Mar 2023 05:12:36 -0400
Received: by mail-ua1-x935.google.com with SMTP id g9so938947uam.9;
 Fri, 24 Mar 2023 02:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679649144;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fJolfis9eNU4/OYkJ16j42VmOzq14bXYMKd+Adi/cMk=;
 b=hpyX9VLa+GhegiWK0mu8FcX6pZs1YHSRooV7NrNbAgBVbf5b/INtVV7NAUuJDoLWwO
 j5z2fVArMPyoBhhyPVpuEgAwpCY3TUPDj3kwPDPpHWr4hG/moAozsoIHXi9cFusiSmjz
 jBZ+mP0n3G4mbnP73CqFAEzjogiBXcqIVxDW9oDRI4obd9Bs4PY06wgGaFoivEcVhfQu
 s/8Bl3CDViN2E4w6W8F8ngJgtRUCwrpbuZHbLe8FCfJnMkSE76WA4IOtTmupCAJ3E3M8
 P7oHqJpROR1XJl9SnuJZ+JeJz6xyyikKt74yMnrRCkfQdFmmi6Yq5pKtyd379wAwp9re
 K66Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679649144;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fJolfis9eNU4/OYkJ16j42VmOzq14bXYMKd+Adi/cMk=;
 b=012a8Bfwy7OiWeFVZh0q9O5YtsoEJF6mXTSNm4EFP45t8sAQVYTkMlnn3O8tll17ej
 ALcTjUf7Td6JpwJ4NMGwgi9+LmOTZmMIyq6bdcg4zbyk/I/HD+77vfq6xT4QTHDRGOfC
 Hti5J2B9ujhucxFHJ+4a1Va8LKu6iDjzFvfBun+/l8+hO/dg+VPSoNrY5bXRbf719Oev
 Poof7f6rWVddAMDGHp3FQl7VtaV9HHT5v1JsrxLDmw+zphml3eNEWVG9lcoHwTkyPxUs
 U+4tlJfdmLKEfYQTYKB8pc0OfR3jnspKN4SafyOToAkm367c41Nwe+hznNPUYTjo76Rr
 DgRg==
X-Gm-Message-State: AAQBX9ciyce7x95QYUNH0x7mMGfrivtgRuLpki//CRXWICIsa8krYfzo
 HsYfC70xEKWJ/8UbA3+rJIrCvHghJ2Nc1IS1
X-Google-Smtp-Source: AKy350Ys/Gx2H6GTm9NVoB3ReDkBMkYEDHQjjISUBbLeSQ9W/2EcN2dTvzwLybuVmkoDoCqHoii3yA==
X-Received: by 2002:a17:902:d509:b0:19a:9859:be26 with SMTP id
 b9-20020a170902d50900b0019a9859be26mr7537290plg.22.1679648789020; 
 Fri, 24 Mar 2023 02:06:29 -0700 (PDT)
Received: from fedlinux.. ([106.84.130.185]) by smtp.gmail.com with ESMTPSA id
 u4-20020a170902b28400b001a06b33923bsm13722350plr.164.2023.03.24.02.06.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Mar 2023 02:06:28 -0700 (PDT)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Fam Zheng <fam@euphon.net>, Hanna Reitz <hreitz@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, hare@suse.de,
 damien.lemoal@opensource.wdc.com, dmitry.fomichev@wdc.com,
 qemu-block@nongnu.org, Sam Li <faithilikerun@gmail.com>
Subject: [PATCH v18 2/8] file-posix: introduce helper functions for sysfs
 attributes
Date: Fri, 24 Mar 2023 17:05:59 +0800
Message-Id: <20230324090605.28361-3-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230324090605.28361-1-faithilikerun@gmail.com>
References: <20230324090605.28361-1-faithilikerun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::935;
 envelope-from=faithilikerun@gmail.com; helo=mail-ua1-x935.google.com
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
---
 block/file-posix.c               | 122 ++++++++++++++++++++++---------
 include/block/block_int-common.h |   3 +
 2 files changed, 91 insertions(+), 34 deletions(-)

diff --git a/block/file-posix.c b/block/file-posix.c
index 5760cf22d1..496edc644c 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -1202,64 +1202,112 @@ static int hdev_get_max_hw_transfer(int fd, struct stat *st)
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
+    }
+    return 0;
+}
+
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
     }
 
-out:
-    if (sysfd != -1) {
-        close(sysfd);
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
@@ -1297,6 +1345,12 @@ static void raw_refresh_limits(BlockDriverState *bs, Error **errp)
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
index d419017328..6d0f470626 100644
--- a/include/block/block_int-common.h
+++ b/include/block/block_int-common.h
@@ -855,6 +855,9 @@ typedef struct BlockLimits {
 
     /* maximum number of iovec elements */
     int max_iov;
+
+    /* device zone model */
+    BlockZoneModel zoned;
 } BlockLimits;
 
 typedef struct BdrvOpBlocker BdrvOpBlocker;
-- 
2.39.2


