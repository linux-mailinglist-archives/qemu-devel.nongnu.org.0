Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C7FA57101A
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 04:22:07 +0200 (CEST)
Received: from localhost ([::1]:55000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oB5XK-0004Kl-Gp
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 22:22:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oB5Pe-0000vq-RF; Mon, 11 Jul 2022 22:14:12 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:35769)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oB5Pd-0007zK-Aa; Mon, 11 Jul 2022 22:14:10 -0400
Received: by mail-pl1-x62f.google.com with SMTP id g13so1089565plh.2;
 Mon, 11 Jul 2022 19:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hPoBlU6VEZ9/MBaZgZCAm+WFSPnS8MEgQJKdwtPiJww=;
 b=akr+G9tMYn2cOi2u8YgHSwuPWbYg0ShqDnlaX8j5o+zy+SJEtERJg9EqUqPA/19IZw
 AV1POeYqmCUQvsgr5yE541hb7Qp0JRaQFIvx8UKqcqeTBEiT1p4w6k3O4AO2lUGA7WXR
 dcsTakqvgFAG3yxpN8Lp0R5nXLKux8TepBUWhTcqYeLrHbn+A5Klwc0qsBdAVADUsUpe
 94oACk3yV4XFT7/7X63MfZ7moWoyA7xyGQkg2tT3QY17lxoI1MblJ/aB3vnviUnLJ+Fj
 7D8M814MV+bFdKph6Ix/gLOHkxbL8939K+WIk6R8zfM9oKvjZSbjP7pp1EYZggoAtigr
 hyUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hPoBlU6VEZ9/MBaZgZCAm+WFSPnS8MEgQJKdwtPiJww=;
 b=bw/2rOEPRkWOM+yeYBAAeCkinKcde1DFzDwgDz8WBhj6anid6FPXQOfi1FhMcGWAah
 6r2e54YnHMEEBpQ8dWIgIYFbzmVOW0v39JcVrz1AU+dRus2nmmZCPio47fOFnrP/Nrem
 2RELE3Hx0D7YBgOEJQLlvWp1Iny87FSqQ16rgNc9TV6OetLE/GBQxX3t6lFNLq1/r4VU
 yCwKPrb0iExHw5FaZB1//3WUf+3t9o9+uVDA5AmbZe2fBZlPzeAAA3l/uAA83aV9zgwl
 vU2aZoGHiw0/ahREQL/PzRKcF9Pq5AF9AE8WRANB2RJ89pzPXd9U1xVH8izXFGlCmJaY
 DY4g==
X-Gm-Message-State: AJIora+pyEyRXLHFq932VXV5DzJ4XVfXchttcMqvq9qi7VgxD70e4GZa
 bSrLSnWNxeYp6l9F0/SDdZ+240dEzWcK7jka
X-Google-Smtp-Source: AGRyM1s6hYKYIg4JStjdBFTWXYTK5HeavaV2pUjmY0PdeO9rKBfkl9thep2yc1yGEiKO2CMa8QqD3g==
X-Received: by 2002:a17:90b:4c48:b0:1ef:c839:c68c with SMTP id
 np8-20020a17090b4c4800b001efc839c68cmr1503260pjb.233.1657592047381; 
 Mon, 11 Jul 2022 19:14:07 -0700 (PDT)
Received: from roots.. ([106.84.131.214]) by smtp.gmail.com with ESMTPSA id
 k22-20020aa79736000000b00528f9597fb3sm5430251pfg.197.2022.07.11.19.14.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jul 2022 19:14:07 -0700 (PDT)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: damien.lemoal@opensource.wdc.com, Markus Armbruster <armbru@redhat.com>,
 dmitry.fomichev@wdc.com, Stefan Hajnoczi <stefanha@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org,
 Eric Blake <eblake@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Fam Zheng <fam@euphon.net>, hare@suse.de, Sam Li <faithilikerun@gmail.com>
Subject: [RFC v4 4/9] file-posix: introduce get_sysfs_str_val for device zoned
 model.
Date: Tue, 12 Jul 2022 10:13:40 +0800
Message-Id: <20220712021345.8530-5-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220712021345.8530-1-faithilikerun@gmail.com>
References: <20220712021345.8530-1-faithilikerun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=faithilikerun@gmail.com; helo=mail-pl1-x62f.google.com
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

Signed-off-by: Sam Li <faithilikerun@gmail.com>
---
 block/file-posix.c           | 60 ++++++++++++++++++++++++++++++++++++
 include/block/block-common.h |  4 +--
 2 files changed, 62 insertions(+), 2 deletions(-)

diff --git a/block/file-posix.c b/block/file-posix.c
index 3161d39ea4..42708012ff 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -1279,6 +1279,65 @@ out:
 #endif
 }
 
+/*
+ * Convert the zoned attribute file in sysfs to internal value.
+ */
+static zone_model get_sysfs_str_val(int fd, struct stat *st) {
+#ifdef CONFIG_LINUX
+    char buf[32];
+    char *sysfspath = NULL;
+    int ret, offset;
+    int sysfd = -1;
+
+    if (S_ISCHR(st->st_mode)) {
+        if (ioctl(fd, SG_GET_SG_TABLESIZE, &ret) == 0) {
+            return ret;
+        }
+        return -ENOTSUP;
+    }
+
+    if (!S_ISBLK(st->st_mode)) {
+        return -ENOTSUP;
+    }
+
+    sysfspath = g_strdup_printf("/sys/dev/block/%u:%u/queue/zoned",
+                                major(st->st_rdev), minor(st->st_rdev));
+    sysfd = open(sysfspath, O_RDONLY);
+    if (sysfd == -1) {
+        ret = -errno;
+        goto out;
+    }
+    offset = 0;
+    do {
+        ret = read(sysfd, buf + offset, sizeof(buf) - 1 + offset);
+        if (ret > 0) {
+            offset += ret;
+        }
+    } while (ret == -1);
+    /* The file is ended with '\n' */
+    if (buf[ret - 1] == '\n') {
+        buf[ret - 1] = '\0';
+    }
+
+    if (strcmp(buf, "host-managed") == 0) {
+        return BLK_Z_HM;
+    } else if (strcmp(buf, "host-aware") == 0) {
+        return BLK_Z_HA;
+    } else {
+        return -ENOTSUP;
+    }
+
+out:
+    if (sysfd != -1) {
+        close(sysfd);
+    }
+    g_free(sysfspath);
+    return ret;
+#else
+    return -ENOTSUP;
+#endif
+}
+
 static int hdev_get_max_segments(int fd, struct stat *st) {
     return get_sysfs_long_val(fd, st, "max_segments");
 }
@@ -1885,6 +1944,7 @@ static int handle_aiocb_zone_mgmt(void *opaque) {
     int64_t len = aiocb->aio_nbytes;
     zone_op op = aiocb->zone_mgmt.op;
 
+    zone_model mod;
     struct blk_zone_range range;
     const char *ioctl_name;
     unsigned long ioctl_op;
diff --git a/include/block/block-common.h b/include/block/block-common.h
index 78cddeeda5..35e00afe8e 100644
--- a/include/block/block-common.h
+++ b/include/block/block-common.h
@@ -56,8 +56,8 @@ typedef enum zone_op {
 } zone_op;
 
 typedef enum zone_model {
-    BLK_Z_HM,
-    BLK_Z_HA,
+    BLK_Z_HM = 0x1,
+    BLK_Z_HA = 0x2,
 } zone_model;
 
 typedef enum BlkZoneCondition {
-- 
2.36.1


