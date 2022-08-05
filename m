Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E349458A7BC
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 10:06:07 +0200 (CEST)
Received: from localhost ([::1]:56438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJsLO-0000xp-72
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 04:06:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oJsDs-0002xH-Ih; Fri, 05 Aug 2022 03:58:21 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:33558)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oJsDq-0001vv-T8; Fri, 05 Aug 2022 03:58:20 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 f11-20020a17090a4a8b00b001f2f7e32d03so7332143pjh.0; 
 Fri, 05 Aug 2022 00:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=bDPuAiP4ePtzz22qpEVMqEcyzCUbID81bXO+GFqczYY=;
 b=h02+qrcRoxXZgOwTormWYVqwmKyqquWg9hzyvMjkPLWXbhbtPoowSSDrgtPJmGye/+
 kywORMHHPVL1n9rxq8NSup+bgGTqh7/DBgWrVL7vJhasxVGVV9SIy8hweD0xVnneH4ym
 pSuW6xUHmfRlNCH7i6O74DS1qyhV0PInX31sigStmOpX1+dmM4qzTh4PElcV3TYwIJGq
 YcNbTxwqZzOWRWzh4shq643eB4tFK4g6wF1TQH3SeSgYRKTgbHstFEXuTqBeI8UNpOaH
 2dZ+0d0HsegeRmZJla5i1phiUkJkMlud8v7IbNu9WC08L529o1e2Hoe+ComHqWK2fCpa
 UZ/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=bDPuAiP4ePtzz22qpEVMqEcyzCUbID81bXO+GFqczYY=;
 b=PbonOOq0q8lriUJazLHw8I52UEqaHfSOJGmQJYkx87Nq+vldmGw7AItuKddSVWplZD
 cKvEr41opENpsWlESmbHV7otIGBlfEs0H07RYCKmfNo9FN8DhFMw8CvvXeLi0RuaHQwh
 Y8VURflo8LXHAW+bSFBNtyCioESDLGmtG4yuyhgCn7BV46IioDnJsF8tgTEKCrFbp2xk
 WuGFph7KvUgS077yFHA3YglbD5lL+ZXZjUzee/CnZ1ltDmbftHtzP7eY7Aogkzh19URk
 6C+idvawiZ1fQBK0hrpxXWrhXzy8X0iThS7f4q4q+5guOhhyDA+gnSqOjLy9Awr4U+N8
 //AQ==
X-Gm-Message-State: ACgBeo0r0+snH0JWtb+pf0i47ZxcjaeiMitghaFZWm6+PMUqvcBnIS4q
 LyRXOw6Eu6/x5OGIQoylzH+/1YE0r/Vmzw==
X-Google-Smtp-Source: AA6agR7qR2fa3U3vSWsqPwKBKSScGRKnBpIuh6Rlr9FuRwx1HAaYPeKAOWwCVtdTYFEM5PGQHuUOjw==
X-Received: by 2002:a17:90b:1e11:b0:1f4:ee94:6236 with SMTP id
 pg17-20020a17090b1e1100b001f4ee946236mr6458422pjb.63.1659686295654; 
 Fri, 05 Aug 2022 00:58:15 -0700 (PDT)
Received: from roots.. ([106.84.130.246]) by smtp.gmail.com with ESMTPSA id
 z15-20020a170903018f00b0016ee708350bsm2418564plg.14.2022.08.05.00.58.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Aug 2022 00:58:15 -0700 (PDT)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, hare@suse.de, Stefan Hajnoczi <stefanha@redhat.com>,
 dmitry.fomichev@wdc.com, Kevin Wolf <kwolf@redhat.com>,
 damien.lemoal@opensource.wdc.com, Eric Blake <eblake@redhat.com>,
 Fam Zheng <fam@euphon.net>, Markus Armbruster <armbru@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Sam Li <faithilikerun@gmail.com>
Subject: [PATCH v6 3/8] file-posix: introduce get_sysfs_str_val for device
 zoned model
Date: Fri,  5 Aug 2022 15:57:46 +0800
Message-Id: <20220805075751.77499-4-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220805075751.77499-1-faithilikerun@gmail.com>
References: <20220805075751.77499-1-faithilikerun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=faithilikerun@gmail.com; helo=mail-pj1-x1031.google.com
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
 block/file-posix.c               | 70 ++++++++++++++++++++++++++++++++
 include/block/block_int-common.h |  3 ++
 2 files changed, 73 insertions(+)

diff --git a/block/file-posix.c b/block/file-posix.c
index a40eab64a2..4785203eea 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -1264,6 +1264,68 @@ out:
 #endif
 }
 
+/*
+ * Convert the zoned attribute file in sysfs to internal value.
+ */
+static int get_sysfs_str_val(int fd, struct stat *st,
+                              const char *attribute,
+                              char **val) {
+#ifdef CONFIG_LINUX
+    char *buf = NULL;
+    g_autofree char *sysfspath = NULL;
+    int ret;
+    size_t len;
+
+    if (!S_ISBLK(st->st_mode)) {
+        return -ENOTSUP;
+    }
+
+    sysfspath = g_strdup_printf("/sys/dev/block/%u:%u/queue/%s",
+                                major(st->st_rdev), minor(st->st_rdev),
+                                attribute);
+    ret = g_file_get_contents(sysfspath, &buf, &len, NULL);
+    if (ret == -1) {
+        ret = -errno;
+        return ret;
+    }
+
+    /* The file is ended with '\n' */
+    if (buf[len - 1] == '\n') {
+        buf[len - 1] = '\0';
+    }
+
+    if (!strncpy(*val, buf, len)) {
+        ret = -errno;
+        return ret;
+    }
+    g_free(buf);
+    return 0;
+#else
+    return -ENOTSUP;
+#endif
+}
+
+static int get_sysfs_zoned_model(int fd, struct stat *st,
+                                 BlockZoneModel *zoned) {
+    g_autofree char *val = NULL;
+    val = g_malloc(32);
+    get_sysfs_str_val(fd, st, "zoned", &val);
+    if (!val) {
+        return -ENOTSUP;
+    }
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
 static int hdev_get_max_segments(int fd, struct stat *st) {
     int ret;
     if (S_ISCHR(st->st_mode)) {
@@ -1279,6 +1341,8 @@ static void raw_refresh_limits(BlockDriverState *bs, Error **errp)
 {
     BDRVRawState *s = bs->opaque;
     struct stat st;
+    int ret;
+    BlockZoneModel zoned;
 
     s->needs_alignment = raw_needs_alignment(bs);
     raw_probe_alignment(bs, s->fd, errp);
@@ -1316,6 +1380,12 @@ static void raw_refresh_limits(BlockDriverState *bs, Error **errp)
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


