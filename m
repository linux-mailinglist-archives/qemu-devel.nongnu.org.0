Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE6AD58623B
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Aug 2022 03:38:39 +0200 (CEST)
Received: from localhost ([::1]:53320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIKOE-0000Wp-Tv
	for lists+qemu-devel@lfdr.de; Sun, 31 Jul 2022 21:38:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oIKIq-0003Dm-OA; Sun, 31 Jul 2022 21:33:17 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:36755)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oIKIn-0000c0-KP; Sun, 31 Jul 2022 21:33:03 -0400
Received: by mail-pl1-x635.google.com with SMTP id x10so8449556plb.3;
 Sun, 31 Jul 2022 18:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=i/cL+iZ/k30GZKkjoXM9xlnXK50965f4sgRoxMSddsU=;
 b=MKopE3Yap3lf88bmdU5peqyQ6GtxVI7tFEbBRE2m083idm4xzXms61l+B7XyxjiXhe
 MR3NAUEt5/jqI8CX0RKxr4K+PODLZ7Dn5/RrJoB5ZJgB1QdyboI0h/sa91D9v5lC24HE
 PFFnUBhwWS53foP8EZ2mk3KJEguO9qP8XonbrAtAAB9CmYqKDGGKaUtZO2IMfSQwKCY/
 HkS3akGQzTvJAlCpr1mnZXMX528/3RdcL6UHEg1LfHsT5/CV70f1Vcu2USVIFBkTzrka
 kqZLCE7v0aQsjt5K1hYOATrENGDflg4IsK/speaA7JBElornhxaSWrbfK+g5q8QJGBQM
 0GMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=i/cL+iZ/k30GZKkjoXM9xlnXK50965f4sgRoxMSddsU=;
 b=X6q01ud/v7KnHCP0sO+B+RjjAi+Ls0rvXayF7pmFE8F3sWloaGVsJM52LR7QtQuvcC
 UMBSHUuMKhyISHQfNOI3k+6Sak3dS9YgJy1P8WS/EQSqfEMuZIMRqwfz+x8VALZ0803i
 dx+8zMUyWotSdxFN2yojPuhueqUxD3gPRSHEW5tcCP/Zd5rjMFMfk4MREwnXqzj2RPuG
 maFKia76MG0SbisL6v6flSiZ+qbVEzbaJmLXybjKwJJtW7xntwg+DHgRqGbs/QcBh1KM
 xiR+qqeBSB7spQkQaSA0ZYFu71uX8reiC/CE8lrYsXJwzl+LfuxpCoLW6wA3NHGA4D3T
 NnTg==
X-Gm-Message-State: ACgBeo2iYaNWo5hGfBflvVNsTrH4JlEQ3lUXOfPigTT+EdNJnmM/KiJb
 zcKTc5delCpj62bEpgR6S4i9EZrbd7O83tcT
X-Google-Smtp-Source: AA6agR6vPYi6JwRQ17wQw2FgOLf4OaAvuWWUA/0M+vJ2zmjfbv7bYFOn9rFWWd19DAildGTQTYnTBQ==
X-Received: by 2002:a17:902:d50e:b0:16d:6113:7666 with SMTP id
 b14-20020a170902d50e00b0016d61137666mr14373943plg.17.1659317578802; 
 Sun, 31 Jul 2022 18:32:58 -0700 (PDT)
Received: from roots.. ([106.84.131.7]) by smtp.gmail.com with ESMTPSA id
 e14-20020a17090301ce00b0016ef05d4110sm636470plh.108.2022.07.31.18.32.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Jul 2022 18:32:58 -0700 (PDT)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: damien.lemoal@opensource.wdc.com, dmitry.fomichev@wdc.com, hare@suse.de,
 stefanha@redhat.com, mst@redhat.com, armbru@redhat.com,
 qemu-block@nongnu.org, fam@euphon.net, kwolf@redhat.com, hreitz@redhat.com,
 eblake@redhat.com, Sam Li <faithilikerun@gmail.com>
Subject: [RFC v5 04/11] file-posix: introduce get_sysfs_str_val for device
 zoned model
Date: Mon,  1 Aug 2022 09:32:48 +0800
Message-Id: <20220801013248.10468-1-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=faithilikerun@gmail.com; helo=mail-pl1-x635.google.com
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
---
 block/file-posix.c               | 86 ++++++++++++++++++++++++++++++++
 include/block/block_int-common.h |  3 ++
 2 files changed, 89 insertions(+)

diff --git a/block/file-posix.c b/block/file-posix.c
index bcf898f0cb..0d8b4acdc7 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -1271,6 +1271,85 @@ out:
 #endif
 }
 
+/*
+ * Convert the zoned attribute file in sysfs to internal value.
+ */
+static int get_sysfs_str_val(int fd, struct stat *st,
+                              const char *attribute,
+                              char **val) {
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
+    sysfspath = g_strdup_printf("/sys/dev/block/%u:%u/queue/%s",
+                                major(st->st_rdev), minor(st->st_rdev),
+                                attribute);
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
+    if (!strncpy(*val, buf, ret)) {
+        goto out;
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
     return get_sysfs_long_val(fd, st, "max_segments");
 }
@@ -1279,6 +1358,8 @@ static void raw_refresh_limits(BlockDriverState *bs, Error **errp)
 {
     BDRVRawState *s = bs->opaque;
     struct stat st;
+    int ret;
+    BlockZoneModel zoned;
 
     s->needs_alignment = raw_needs_alignment(bs);
     raw_probe_alignment(bs, s->fd, errp);
@@ -1316,6 +1397,11 @@ static void raw_refresh_limits(BlockDriverState *bs, Error **errp)
             bs->bl.max_hw_iov = ret;
         }
     }
+
+    ret = get_sysfs_zoned_model(s->fd, &st, &zoned);
+    if (ret < 0)
+        zoned = BLK_Z_NONE;
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


