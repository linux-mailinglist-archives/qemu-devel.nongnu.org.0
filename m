Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 590DE38F1C3
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 18:50:05 +0200 (CEST)
Received: from localhost ([::1]:40494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llDmG-000575-3O
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 12:50:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1llDZU-00079P-Gu; Mon, 24 May 2021 12:36:52 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:34434)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1llDZR-0002l5-Qt; Mon, 24 May 2021 12:36:52 -0400
Received: by mail-ed1-x52a.google.com with SMTP id w12so24952935edx.1;
 Mon, 24 May 2021 09:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bXssOFtwQI3r6hP5tP3UWXJ1+o0S9QmsQBbP86KdnTE=;
 b=JM/r/QhGlSJGNaVdHuJ1OceasQBm8yD0QDfPGexGJ86fEKYV3/zyVVhUCtBpkY6dBw
 Ala0C7NnSnNfW68vBUzhyuKa/zFquIYd3ANIhcvz1X+PvDnEMktEVouJiLHqjTgSN+TB
 2in/VyVxslutphvG4hfd3FQT86vquk6bexEPfVHZJIaQAvt4uKCfmK36hWdiOQKZZVRd
 xpFz56nRKiRSgYiQ06eAg4kguyeemUuvgfvVlOa30hYp24pTiSpMAW2Mt5DH/JYsdd86
 F+WRHm6DE8lmE9nAsqDNTfKkO//ZraAuTnY6kryyW91gNp430hRdMtFKVK8pPy2dxBTu
 fjTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=bXssOFtwQI3r6hP5tP3UWXJ1+o0S9QmsQBbP86KdnTE=;
 b=B3afOuO6f3Al7W2R7k5AGLiUPGAWigOhqQcOHHDPG5cyQ6nNEgiQ1KUnMkBXee0AMU
 /2Hy3G9JMiofqZxDDX6p4BzIXgDwj6ysnq0JrT7OLPtkDd11dTd8QQgiq9MihKbn8eKR
 Ry189CYYJecKNr+TRDfEBu+0SFQDnH4bHtxN9v7ZwduSOzVkbNrI0F3g6oqA06vuUy6y
 z76NOIQ0VII0FvWiJd8Wm/Sb5HRx+Ez6syNXgZJlUWaaeogVCfe73LMb6KaVOsRW+6kq
 RxAjtqJO5EtgjG2437ntjGbP3y4hybGi/gSqLXk1dyjyf2LDIQ6944+d+4fsqOGrB9li
 374w==
X-Gm-Message-State: AOAM530VdFUJ3W6/btwKE3gBZ/kJDWHJYjp3qU9X85ImSkV3MZLr1Hmr
 CRxubg3wQKIc7SBmehig02u43wJ+kIYNwg==
X-Google-Smtp-Source: ABdhPJy1mS3AY5eMRZLIfopr7BVuyL/UM2uPboPgU/bImWH+5wJY/Yv4eN0Ci72NCCCGqyQX43wyEw==
X-Received: by 2002:aa7:ccc6:: with SMTP id y6mr26934016edt.303.1621874208217; 
 Mon, 24 May 2021 09:36:48 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 n8sm7967684ejl.0.2021.05.24.09.36.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 09:36:47 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/6] file-posix: try BLKSECTGET on block devices too,
 do not round to power of 2
Date: Mon, 24 May 2021 18:36:41 +0200
Message-Id: <20210524163645.382940-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210524163645.382940-1-pbonzini@redhat.com>
References: <20210524163645.382940-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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



