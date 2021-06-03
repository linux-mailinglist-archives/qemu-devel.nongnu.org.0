Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDF3939A25E
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 15:40:58 +0200 (CEST)
Received: from localhost ([::1]:60702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lonai-0001P6-BQ
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 09:40:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lonXW-0002yF-80; Thu, 03 Jun 2021 09:37:38 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:40702)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lonXU-00007m-LK; Thu, 03 Jun 2021 09:37:37 -0400
Received: by mail-ed1-x52a.google.com with SMTP id t3so7142808edc.7;
 Thu, 03 Jun 2021 06:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7UAZdz5dQs7FMRLCi+6byKh+otX+O5RQQ9i+ZxcAI5g=;
 b=lrvGRs/lggaUJjrVirwjaik3/uHYyeye0NG36RG41WzzH747K12ANbXBlFIL3YCmBc
 6PbS1tWA7nw4XKasH7vqrdmq3HbEX7ChgcV2cWvxm73D7NEUikRRQ/bHJXjIujmnKM+3
 0PGrWb2aFLfuc9J/R9dc5sGqCbgtmW9kntN46PvTqeLCttI0iwmeM4TYWafgjNUpjDs6
 heEsiiNE3Qqvgg0SuBGj+2stnbEcHAHNKcDQCn6U+AjZ6EX5TTLPCIXpxbmWS1s3xLsh
 ojGaK1eWyHpcptJU+eTgICXc4XN3v2/AVr7WPmtUjLWWI3D3AkbfM/vwAlQC/+8cmuG6
 XEMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=7UAZdz5dQs7FMRLCi+6byKh+otX+O5RQQ9i+ZxcAI5g=;
 b=syPIgWzwFS3oTu4XgFJ3lm+DuaTws3es7RdVHLb/6Vg60n6c3JMhFyacQk3cInPrtw
 yKee+/jbU6qf+c666++TqnhtzCJgzYReALExe+wcRS4qIwOhCm96GjfSFDe74xvvvfHj
 jMLd8NQnIzMkRNw9zXtrNJvlEA7+giNdl0Fc7t1g3wtp/SQosfLu/9deRZsjDCSka1QS
 gVVzR5qcrkBwPat5yiCpFAtUDnDVod7rQ0N1wWh/JBzbB2Gu4zyaV7Qp6JCka5ihNGeu
 +zPWP37whgK5yUgMSZnSRDXFFrSAVImh+tFNOFkBzl7q7ykS2M3nPuw+HKu/DooaAQy5
 dIww==
X-Gm-Message-State: AOAM530NFrgx8lOZ95WXegHp4zJ5SuEFcNxFARjxYU/pb/yIwLbiDfkM
 a2t+5jfkZ3kIw+umb40cpMQUayKDG/dM2Q==
X-Google-Smtp-Source: ABdhPJxtdMlhkmLdTI4RHhf8hCkvuwwhmA75nzvXjAmRKSl1sig5gL9TR6sLpSPoo2sTRjARKXfB/A==
X-Received: by 2002:a50:eb08:: with SMTP id y8mr44358794edp.89.1622727454781; 
 Thu, 03 Jun 2021 06:37:34 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id e24sm1555369ejb.52.2021.06.03.06.37.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 06:37:34 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 4/7] file-posix: try BLKSECTGET on block devices too,
 do not round to power of 2
Date: Thu,  3 Jun 2021 15:37:19 +0200
Message-Id: <20210603133722.218465-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210603133722.218465-1-pbonzini@redhat.com>
References: <20210603133722.218465-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
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
Cc: kwolf@redhat.com, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

bs->sg is only true for character devices, but block devices can also
be used with scsi-block and scsi-generic.  Unfortunately BLKSECTGET
returns bytes in an int for /dev/sgN devices, and sectors in a short
for block devices, so account for that in the code.

The maximum transfer also need not be a power of 2 (for example I have
seen disks with 1280 KiB maximum transfer) so there's no need to pass
the result through pow2floor.

This patch reintroduces the logic that was removed in commit 867eccfed8
("file-posix: Use max transfer length/segment count only for SCSI
passthrough", 2019-07-12).  The removal was motivated by the performance
regression when using a block device's max_transfer with kernel I/O;
the new, separate max_hw_transfer limit avoids reintroducing the same
regression.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block/file-posix.c | 40 ++++++++++++++++++++++------------------
 1 file changed, 22 insertions(+), 18 deletions(-)

diff --git a/block/file-posix.c b/block/file-posix.c
index f55f92d0f5..1439293f63 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -1149,22 +1149,27 @@ static void raw_reopen_abort(BDRVReopenState *state)
     s->reopen_state = NULL;
 }
 
-static int sg_get_max_transfer_length(int fd)
+static int hdev_get_max_hw_transfer(int fd, struct stat *st)
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
+static int hdev_get_max_segments(int fd, struct stat *st)
 {
 #ifdef CONFIG_LINUX
     char buf[32];
@@ -1173,12 +1178,6 @@ static int sg_get_max_segments(int fd)
     int ret;
     int sysfd = -1;
     long max_segments;
-    struct stat st;
-
-    if (fstat(fd, &st)) {
-        ret = -errno;
-        goto out;
-    }
 
     if (S_ISCHR(st->st_mode)) {
         if (ioctl(fd, SG_GET_SG_TABLESIZE, &ret) == 0) {
@@ -1192,7 +1191,7 @@ static int sg_get_max_segments(int fd)
     }
 
     sysfspath = g_strdup_printf("/sys/dev/block/%u:%u/queue/max_segments",
-                                major(st.st_rdev), minor(st.st_rdev));
+                                major(st->st_rdev), minor(st->st_rdev));
     sysfd = open(sysfspath, O_RDONLY);
     if (sysfd == -1) {
         ret = -errno;
@@ -1229,15 +1228,20 @@ out:
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
+        int ret = hdev_get_max_hw_transfer(s->fd, &st);
 
         if (ret > 0 && ret <= BDRV_REQUEST_MAX_BYTES) {
-            bs->bl.max_hw_transfer = pow2floor(ret);
+            bs->bl.max_hw_transfer = ret;
         }
 
-        ret = sg_get_max_segments(s->fd);
+        ret = hdev_get_max_segments(s->fd, &st);
         if (ret > 0) {
             bs->bl.max_iov = ret;
         }
-- 
2.31.1



