Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C33E586254
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Aug 2022 03:41:22 +0200 (CEST)
Received: from localhost ([::1]:33252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIKQr-0005zO-MD
	for lists+qemu-devel@lfdr.de; Sun, 31 Jul 2022 21:41:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oIKIJ-0002qD-F7; Sun, 31 Jul 2022 21:32:31 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:41912)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oIKIH-0000Uk-KF; Sun, 31 Jul 2022 21:32:31 -0400
Received: by mail-pl1-x630.google.com with SMTP id v18so9128116plo.8;
 Sun, 31 Jul 2022 18:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=H+3MOlJ49zk3LYKUyWss63wjcn3CnNQ+m/3YAsYv/dY=;
 b=IVpjQ3UO+b52dGP3F3pSzLMl2cTb0MAWaOhnpeJcGrZbG5Ulo7UFL4kJZEc/gUNxzB
 N27fEg+K5EubwZB9VKuKvGRfBbJA2tOtGzkHQ/HvJiV1JgMq6/tP+INlD3v3AmMvqzfj
 5MBZfeuBKO/ksQBbweRap89qA5zRH/d+htCG4UbZHgiPBe5k+xziGCqt7wZ3uvaruB5G
 THrSJpZcxUTFHNwr1yL3bXZFxiURSaPTiqrcfYcdQoct8I4R/bS7+Ppcs5c/FC9MAL/c
 HCBlF6Xfj2V8IzzjZW7gzmY+OoIUSodEC0mRmf//4OfUqz2HfX3JYIdDdd57lWmPMyma
 xbJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=H+3MOlJ49zk3LYKUyWss63wjcn3CnNQ+m/3YAsYv/dY=;
 b=qrFvwxiOUtUg6nWrOudAO+gEHSdifBYftFbkaFbtOgzPUYist9iNCc+o+DI/qKgJm2
 QNiLtSfqgndo9KvB/M7GqVeO5j/XGK2V25hNvODSt9A8IyoD5ybqA+iIRMrShIzPHKJl
 GCwSPhOURXqWIyWwgWVZa9dCDr1J95y1OBPsiNH2gW0AGfSJDR3EhApKopSjISC7SieD
 OcyA1PRs52ZDHBCtK9DuQ5SdnsWbIQpR5+Sy7WfEHg4Q3rwVDqpoWJiyvt+UJzpCBz+7
 mz0fFZes5UoLC84AJe5Vgaypw0xIr4/4T9xqjQ6e3luql2E6gVlN0gjOXWAaL+PoVRcW
 TrwA==
X-Gm-Message-State: ACgBeo1gcPYfaJqFXE7GrUeicSavn5Q70WV9w05xkeg5wC/4059jQAsz
 dMLhXORfnv13iDz9k0y/A4u9XXQAhizGkcPA
X-Google-Smtp-Source: AA6agR79sCz+mzJZY3HKIWQL65VvvoPvpe7OoVHDUAJfNRgcbuTAo/OcQTOpoo11exsLMnbzoBWKgA==
X-Received: by 2002:a17:902:f792:b0:168:e97b:3c05 with SMTP id
 q18-20020a170902f79200b00168e97b3c05mr14166857pln.94.1659317547570; 
 Sun, 31 Jul 2022 18:32:27 -0700 (PDT)
Received: from roots.. ([106.84.131.7]) by smtp.gmail.com with ESMTPSA id
 hi7-20020a17090b30c700b001f2fa09786asm7482755pjb.19.2022.07.31.18.32.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Jul 2022 18:32:27 -0700 (PDT)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: damien.lemoal@opensource.wdc.com, dmitry.fomichev@wdc.com, hare@suse.de,
 stefanha@redhat.com, mst@redhat.com, armbru@redhat.com,
 qemu-block@nongnu.org, fam@euphon.net, kwolf@redhat.com, hreitz@redhat.com,
 eblake@redhat.com, Sam Li <faithilikerun@gmail.com>
Subject: [RFC v5 03/11] file-posix: introduce get_sysfs_long_val for the long
 sysfs attribute
Date: Mon,  1 Aug 2022 09:32:21 +0800
Message-Id: <20220801013221.10427-1-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.37.1
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

Use sysfs attribute files to get the long value of zoned device
information.

Signed-off-by: Sam Li <faithilikerun@gmail.com>
---
 block/file-posix.c | 23 ++++++++++++++++-------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/block/file-posix.c b/block/file-posix.c
index 48cd096624..bcf898f0cb 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -1210,15 +1210,19 @@ static int hdev_get_max_hw_transfer(int fd, struct stat *st)
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
@@ -1231,8 +1235,9 @@ static int hdev_get_max_segments(int fd, struct stat *st)
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
@@ -1250,9 +1255,9 @@ static int hdev_get_max_segments(int fd, struct stat *st)
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
@@ -1266,6 +1271,10 @@ out:
 #endif
 }
 
+static int hdev_get_max_segments(int fd, struct stat *st) {
+    return get_sysfs_long_val(fd, st, "max_segments");
+}
+
 static void raw_refresh_limits(BlockDriverState *bs, Error **errp)
 {
     BDRVRawState *s = bs->opaque;
-- 
2.37.1


