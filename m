Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38A6D38743F
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 10:44:37 +0200 (CEST)
Received: from localhost ([::1]:58866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1livLA-0003fB-8r
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 04:44:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1livFq-0003Xg-8z; Tue, 18 May 2021 04:39:06 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:41951)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1livFo-00047E-J9; Tue, 18 May 2021 04:39:06 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 o6-20020a05600c4fc6b029015ec06d5269so1012469wmq.0; 
 Tue, 18 May 2021 01:39:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bXssOFtwQI3r6hP5tP3UWXJ1+o0S9QmsQBbP86KdnTE=;
 b=eu/37W0Ty7k/UltkaPHmEK1FySh0HcBao0VQnbOJ0aKzxT+7qSb+Hn4HzjXmOz8if/
 dXH1F9TGYDSH3EMMtHMMjDgbe8X9IipzCv8KApWbZ5fgyWvDSVQEaqK/S62mkMNKt0+7
 ylDtYvDmTTzye0JEJk5drKEp33D3FfTJ+yhcx/h+GjfmuG7Z16u4WjCuIZvlCqdOvx2F
 kDEnJrZB112YRHIyTO4wv3688+jGqrtxfV2B38sBXwFvwvKZnT/Rm5VvZLW+FWHHyG70
 tBNFyHfY+DQjmEmVVZUQ8X8DFehTJzmdmiTSc9IQ2hZA0igAllq26EwVAeAdKUtEV0eu
 znHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=bXssOFtwQI3r6hP5tP3UWXJ1+o0S9QmsQBbP86KdnTE=;
 b=H8+D0DARrPMwoOjBAi2gzo4yG8+FCQi4v2SabcTBDNsw2CldPq1Wov6AdrUZXGWIpA
 KsqOHMsR/LFUH6RKN421IfFXlGyBjrwGVlMw9R6K2yBSV8bg4GghCH0paK/dq3QAvY5h
 x6b+/ndBGy3RreNONVi3PsvDBiPGNsh8JAoG6GrbRQWntqZ7UUqy25j27yqxYV2ZZqQ5
 Q4BKkpyiJalSHInDOzBjoNGgbp/6t6t7fdyQc6ZK8Wtqx4XhK0HEGJ/d5u1/X2mL35YU
 rgM95fVqeVvy2Fvyi5RZZlJO0eWKMJqhzDxFbhdR05xjcD04puJZqIuwMepBoZCIBcUY
 Qafw==
X-Gm-Message-State: AOAM531QT2Yp1fjUz+Ai5zKVSjNFsupiVAdtSHGgVyHwOJ/DfVBxu/ZE
 2Pml+TITh4JvvX+kiQYwDeTLZwOO92o6Lg==
X-Google-Smtp-Source: ABdhPJyMAM1gO9uxzZzS/D4a9voN4KteMSRWS+dzJEc2Sync72J34cU/h7YU1rbYPbxfYancfymkyQ==
X-Received: by 2002:a1c:b4c6:: with SMTP id d189mr4068783wmf.39.1621327142787; 
 Tue, 18 May 2021 01:39:02 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id y6sm70959wmy.23.2021.05.18.01.39.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 01:39:02 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/5] file-posix: try BLKSECTGET on block devices too,
 do not round to power of 2
Date: Tue, 18 May 2021 10:38:57 +0200
Message-Id: <20210518083901.97369-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210518083901.97369-1-pbonzini@redhat.com>
References: <20210518083901.97369-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

bs->sg is only true for character devices, but block devices can also
be used with scsi-block and scsi-generic.  Unfortunately BLKSECTGET
returns bytes in an int for /dev/sgN devices, and sectors in a short
for block devices, so account for that in the code.

The maximum transfer also need not be a power of 2 (for example I have
seen disks with 1280 KiB maximum transfer) so there's no need to pass
the result through pow2floor.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block/file-posix.c | 40 ++++++++++++++++++++++------------------
 1 file changed, 22 insertions(+), 18 deletions(-)

diff --git a/block/file-posix.c b/block/file-posix.c
index 59c889d5a7..e5ef006aee 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -1149,22 +1149,27 @@ static void raw_reopen_abort(BDRVReopenState *state)
     s->reopen_state = NULL;
 }
 
-static int sg_get_max_transfer_length(int fd)
+static int sg_get_max_transfer_length(int fd, struct stat *st)
 {
 #ifdef BLKSECTGET
-    int max_bytes = 0;
-
-    if (ioctl(fd, BLKSECTGET, &max_bytes) == 0) {
-        return max_bytes;
+    if (S_ISBLK(st->st_mode)) {
+        unsigned short max_sectors = 0;
+        if (ioctl(fd, BLKSECTGET, &max_sectors) == 0) {
+            return max_sectors * 512;
+        }
     } else {
-        return -errno;
+        int max_bytes = 0;
+        if (ioctl(fd, BLKSECTGET, &max_bytes) == 0) {
+            return max_bytes;
+        }
     }
+    return -errno;
 #else
     return -ENOSYS;
 #endif
 }
 
-static int sg_get_max_segments(int fd)
+static int sg_get_max_segments(int fd, struct stat *st)
 {
 #ifdef CONFIG_LINUX
     char buf[32];
@@ -1173,15 +1178,9 @@ static int sg_get_max_segments(int fd)
     int ret;
     int sysfd = -1;
     long max_segments;
-    struct stat st;
-
-    if (fstat(fd, &st)) {
-        ret = -errno;
-        goto out;
-    }
 
     sysfspath = g_strdup_printf("/sys/dev/block/%u:%u/queue/max_segments",
-                                major(st.st_rdev), minor(st.st_rdev));
+                                major(st->st_rdev), minor(st->st_rdev));
     sysfd = open(sysfspath, O_RDONLY);
     if (sysfd == -1) {
         ret = -errno;
@@ -1218,15 +1217,20 @@ out:
 static void raw_refresh_limits(BlockDriverState *bs, Error **errp)
 {
     BDRVRawState *s = bs->opaque;
+    struct stat st;
+
+    if (fstat(s->fd, &st)) {
+        return;
+    }
 
-    if (bs->sg) {
-        int ret = sg_get_max_transfer_length(s->fd);
+    if (bs->sg || S_ISBLK(st.st_mode)) {
+        int ret = sg_get_max_transfer_length(s->fd, &st);
 
         if (ret > 0 && ret <= BDRV_REQUEST_MAX_BYTES) {
-            bs->bl.max_transfer = pow2floor(ret);
+            bs->bl.max_transfer = ret;
         }
 
-        ret = sg_get_max_segments(s->fd);
+        ret = sg_get_max_segments(s->fd, &st);
         if (ret > 0) {
             bs->bl.max_iov = ret;
         }
-- 
2.31.1



