Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DEBB58A7AD
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 10:03:57 +0200 (CEST)
Received: from localhost ([::1]:54824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJsJH-0008AO-JH
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 04:03:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oJsDl-0002rE-QS; Fri, 05 Aug 2022 03:58:13 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:38790)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oJsDk-0001vY-7B; Fri, 05 Aug 2022 03:58:13 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 q9-20020a17090a2dc900b001f58bcaca95so756506pjm.3; 
 Fri, 05 Aug 2022 00:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=CmKuBcw8ARJwBYjuXzUoGFsoFdqkxX9OVMWD9ZCDqJ0=;
 b=BSL5nBvxLHHdphXbYJOYMDuaMHZPJgeFTjbGx/Q9CnI2Sk8Q0dz9CIGp5ixdEliEwQ
 YPsatZbdc9QCan7I2XZmZ4xOFI7SgmflEYjyQLg1KTrdnlRUIRt+VuFLVjjwANLi5O9y
 Zm0nqSfTdaH9fovdVvd+fSmOvNYT6XisF5+UNRMXzES65f7GDWdoJutnIVPqTUuFg78Q
 Ooj9yWHC+ld60ID8gQFkJtBUBP3dzbRT1rGFDqI1jz24wcJRNt76qQh821uVlWM6m0HK
 wImLY6yNSaSsczC1cm+VidNC/NblwUdjKd1P4Q/vpVpOCFSRVptwizway/cZnokYl1Jp
 CYGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=CmKuBcw8ARJwBYjuXzUoGFsoFdqkxX9OVMWD9ZCDqJ0=;
 b=Fqj5ayOwQ1b/X5U5nz6TXNdM03QtGRxNXHbL48ik9HXOhZgkYkU/rBCdezuQkKldgK
 Sg9+9hDEoEeF7+C0WmXU6A8iHEpwvuHHK4j196cBFf8t+Doz69CQhS1vFkDQRndZ2siR
 t14iPXDKAZOpVFaC3ZQ/xpvIOXR/YfvU/vf+j/ZTIRwJd7yj/OLnYfYWx5SXaNE7Egsm
 PpwcGMhJYAKCL5UpDWf3CwfZT1xEpk/PMRCCx12vivIy9mjuwMPAtw+Yi8hrJCLyY83+
 KjLAWYmV7hbzr4dCjg5v7DfVy0dbWCW7RliSnFHbkEesW9U1SI4kiRqT6AFZYlRMJ5sP
 sd3Q==
X-Gm-Message-State: ACgBeo3OswpHB5G9DeurFsmClnINl2W72x1yW2BtleJGNtbJ9wamr9s8
 PNtD3Y1f7QJQnLOUN0QljIex12hNCIiAOg==
X-Google-Smtp-Source: AA6agR6Yv5ywlZL2tbhvAEK9FSkbuV3ADYvz1pBrFxHDGsscF0B1lNbHX+1S9VBEj7M3lJuZ+9b7Zw==
X-Received: by 2002:a17:902:e848:b0:16f:8f:9027 with SMTP id
 t8-20020a170902e84800b0016f008f9027mr5756015plg.66.1659686290363; 
 Fri, 05 Aug 2022 00:58:10 -0700 (PDT)
Received: from roots.. ([106.84.130.246]) by smtp.gmail.com with ESMTPSA id
 z15-20020a170903018f00b0016ee708350bsm2418564plg.14.2022.08.05.00.58.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Aug 2022 00:58:10 -0700 (PDT)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, hare@suse.de, Stefan Hajnoczi <stefanha@redhat.com>,
 dmitry.fomichev@wdc.com, Kevin Wolf <kwolf@redhat.com>,
 damien.lemoal@opensource.wdc.com, Eric Blake <eblake@redhat.com>,
 Fam Zheng <fam@euphon.net>, Markus Armbruster <armbru@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Sam Li <faithilikerun@gmail.com>
Subject: [PATCH v6 2/8] file-posix: introduce get_sysfs_long_val for the long
 sysfs attribute
Date: Fri,  5 Aug 2022 15:57:45 +0800
Message-Id: <20220805075751.77499-3-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220805075751.77499-1-faithilikerun@gmail.com>
References: <20220805075751.77499-1-faithilikerun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=faithilikerun@gmail.com; helo=mail-pj1-x1030.google.com
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

Use sysfs attribute files to get the long value of zoned device
information.

Signed-off-by: Sam Li <faithilikerun@gmail.com>
Reviewed-by: Hannes Reinecke <hare@suse.de>
---
 block/file-posix.c | 37 +++++++++++++++++++++++--------------
 1 file changed, 23 insertions(+), 14 deletions(-)

diff --git a/block/file-posix.c b/block/file-posix.c
index 48cd096624..a40eab64a2 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -1210,29 +1210,27 @@ static int hdev_get_max_hw_transfer(int fd, struct stat *st)
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
-
-    if (S_ISCHR(st->st_mode)) {
-        if (ioctl(fd, SG_GET_SG_TABLESIZE, &ret) == 0) {
-            return ret;
-        }
-        return -ENOTSUP;
-    }
+    long val;
 
     if (!S_ISBLK(st->st_mode)) {
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
@@ -1250,9 +1248,9 @@ static int hdev_get_max_segments(int fd, struct stat *st)
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
@@ -1266,6 +1264,17 @@ out:
 #endif
 }
 
+static int hdev_get_max_segments(int fd, struct stat *st) {
+    int ret;
+    if (S_ISCHR(st->st_mode)) {
+        if (ioctl(fd, SG_GET_SG_TABLESIZE, &ret) == 0) {
+            return ret;
+        }
+        return -ENOTSUP;
+    }
+    return get_sysfs_long_val(fd, st, "max_segments");
+}
+
 static void raw_refresh_limits(BlockDriverState *bs, Error **errp)
 {
     BDRVRawState *s = bs->opaque;
-- 
2.37.1


