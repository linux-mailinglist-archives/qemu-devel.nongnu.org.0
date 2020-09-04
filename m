Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5B9225CF4C
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Sep 2020 04:10:06 +0200 (CEST)
Received: from localhost ([::1]:55610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kE1Az-0005qp-6e
	for lists+qemu-devel@lfdr.de; Thu, 03 Sep 2020 22:10:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tom.ty89@gmail.com>)
 id 1kE1AF-0005P7-6E; Thu, 03 Sep 2020 22:09:19 -0400
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:41357)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tom.ty89@gmail.com>)
 id 1kE1AD-0002ca-EO; Thu, 03 Sep 2020 22:09:18 -0400
Received: by mail-pf1-x442.google.com with SMTP id z19so1594202pfn.8;
 Thu, 03 Sep 2020 19:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2cmIe8bj5qFIf+leFitAFw5LSQqz3ieI5IUOcxpj1NU=;
 b=CXyl+rOgxEJTIHBn5aBjN9mtU1UL/2UoLmj4LO0Vc9X7Gg1q43H9dsOWG/+A6wRiCV
 Tv6fQf5jkpqUlC49px4uAKfJLp67H1iR3fASSENig1ZK/v0uiTsvGYXsRqDGN4EbaL9R
 07f4ghQRnm/fUCc3mTPDimarFDYlNM6dTXwQ3MmJbA0/ap/y8lmGYHN9ZjrVrtFl4noe
 VpdEbpdcHe7WRXprypbtyaA7cVajqWaTWOjmyBWerUpQ8G0SW6cTUL658FjHnb6WMJk4
 yr1MRfaygvYTwinuk4TgGR4gh3EXQWxzMk1I2Om/stCwRnj5Iz2XvGTjZGnHWgpqI/Lz
 APaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2cmIe8bj5qFIf+leFitAFw5LSQqz3ieI5IUOcxpj1NU=;
 b=SfKAhcGfhzEo7Xr4mw0+vQEDw/yvb2HgqLctqONQd7z+KnYpCw8hUGeMMj2lwGLKXH
 QXcWK1/E+QNBNzsEuG0oiIIMNz9r2jWJQfoZVkEp4HEBCF4rvNohOW6TqiN+RAbcUb6Y
 oZNzdAT3dEGMDIfguwhdFqbDS+CQtrTaCsJWJdeEOJQMqm9GSMvMpAngulLrZ26HM4s3
 070wedG3su+otHbrLBmG6yV6KRlnH1PqTRZnNfdCTrr3SMF6O1IGTUa9bswEnM8G0GL4
 Vd81SPX5bXZKiPH7YfWlrDfKXbMd37PZ0p6HGLpHIwolkhNBtw2C1eVYiyAlhFGzNOUD
 lABg==
X-Gm-Message-State: AOAM531AD2zCZj5RodhjcerKwtmXF8+cyMogEFuqLHEW0My1RUH6AHWZ
 j1uC1NGh/8OfDPOvxcyeCLH0ULQJo2Y=
X-Google-Smtp-Source: ABdhPJwK/3T6as0sy9kjo/HzZdMarl65xNX2YNgqXHPsp6M/U1BSaLZFSXMG39dGeq3m2ImfRS+k+w==
X-Received: by 2002:a05:6a00:847:: with SMTP id
 q7mr6606141pfk.172.1599185355189; 
 Thu, 03 Sep 2020 19:09:15 -0700 (PDT)
Received: from localhost.localdomain ([161.81.62.213])
 by smtp.gmail.com with ESMTPSA id n11sm4047178pgd.2.2020.09.03.19.09.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Sep 2020 19:09:14 -0700 (PDT)
From: Tom Yan <tom.ty89@gmail.com>
To: qemu-block@nongnu.org, kwolf@redhat.com, mreitz@redhat.com,
 qemu-devel@nongnu.org
Subject: [PATCH v4 1/2] file-posix: split hdev_refresh_limits from
 raw_refresh_limits
Date: Fri,  4 Sep 2020 10:09:06 +0800
Message-Id: <20200904020907.241550-1-tom.ty89@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::442;
 envelope-from=tom.ty89@gmail.com; helo=mail-pf1-x442.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Tom Yan <tom.ty89@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We can and should get max transfer length and max segments for all host
devices / cdroms (on Linux).

Also use MIN_NON_ZERO instead when we clamp max transfer length against
max segments.

Signed-off-by: Tom Yan <tom.ty89@gmail.com>
---
v2: fix get_max_transfer_length for non-sg devices; also add/fix
sg_get_max_segments for sg devices
v3: fix typo in get_max_transfer_length
v4: fix accidental .orig inclusion
 block/file-posix.c | 57 +++++++++++++++++++++++++++++++++-------------
 1 file changed, 41 insertions(+), 16 deletions(-)

diff --git a/block/file-posix.c b/block/file-posix.c
index 9a00d4190a..411a23cf99 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -1178,7 +1178,24 @@ static int sg_get_max_transfer_length(int fd)
 #endif
 }
 
-static int sg_get_max_segments(int fd)
+static int get_max_transfer_length(int fd)
+{
+#if defined(BLKSECTGET) && defined(BLKSSZGET)
+    int sect = 0;
+    int ssz = 0;
+
+    if (ioctl(fd, BLKSECTGET, &sect) == 0 &&
+        ioctl(fd, BLKSSZGET, &ssz) == 0) {
+        return sect * ssz;
+    } else {
+        return -errno;
+    }
+#else
+    return -ENOSYS;
+#endif
+}
+
+static int get_max_segments(int fd)
 {
 #ifdef CONFIG_LINUX
     char buf[32];
@@ -1233,23 +1250,31 @@ static void raw_refresh_limits(BlockDriverState *bs, Error **errp)
 {
     BDRVRawState *s = bs->opaque;
 
-    if (bs->sg) {
-        int ret = sg_get_max_transfer_length(s->fd);
+    raw_probe_alignment(bs, s->fd, errp);
+    bs->bl.min_mem_alignment = s->buf_align;
+    bs->bl.opt_mem_alignment = MAX(s->buf_align, qemu_real_host_page_size);
+}
+
+static void hdev_refresh_limits(BlockDriverState *bs, Error **errp)
+{
+    BDRVRawState *s = bs->opaque;
+
+    /* BLKSECTGET has always been implemented wrongly in the sg driver
+       and BLKSSZGET has never been supported by it*/
+    int ret = bs->sg ? sg_get_max_transfer_length(s->fd) :
+                       get_max_transfer_length(s->fd);
 
-        if (ret > 0 && ret <= BDRV_REQUEST_MAX_BYTES) {
-            bs->bl.max_transfer = pow2floor(ret);
-        }
+    if (ret > 0 && ret <= BDRV_REQUEST_MAX_BYTES) {
+        bs->bl.max_transfer = pow2floor(ret);
+    }
 
-        ret = sg_get_max_segments(s->fd);
-        if (ret > 0) {
-            bs->bl.max_transfer = MIN(bs->bl.max_transfer,
-                                      ret * qemu_real_host_page_size);
-        }
+    ret = get_max_segments(s->fd);
+    if (ret > 0) {
+        bs->bl.max_transfer = MIN_NON_ZERO(bs->bl.max_transfer,
+                                           ret * qemu_real_host_page_size);
     }
 
-    raw_probe_alignment(bs, s->fd, errp);
-    bs->bl.min_mem_alignment = s->buf_align;
-    bs->bl.opt_mem_alignment = MAX(s->buf_align, qemu_real_host_page_size);
+    raw_refresh_limits(bs, errp);
 }
 
 static int check_for_dasd(int fd)
@@ -3604,7 +3629,7 @@ static BlockDriver bdrv_host_device = {
     .bdrv_co_pdiscard       = hdev_co_pdiscard,
     .bdrv_co_copy_range_from = raw_co_copy_range_from,
     .bdrv_co_copy_range_to  = raw_co_copy_range_to,
-    .bdrv_refresh_limits = raw_refresh_limits,
+    .bdrv_refresh_limits = hdev_refresh_limits,
     .bdrv_io_plug = raw_aio_plug,
     .bdrv_io_unplug = raw_aio_unplug,
     .bdrv_attach_aio_context = raw_aio_attach_aio_context,
@@ -3728,7 +3753,7 @@ static BlockDriver bdrv_host_cdrom = {
     .bdrv_co_preadv         = raw_co_preadv,
     .bdrv_co_pwritev        = raw_co_pwritev,
     .bdrv_co_flush_to_disk  = raw_co_flush_to_disk,
-    .bdrv_refresh_limits = raw_refresh_limits,
+    .bdrv_refresh_limits = hdev_refresh_limits,
     .bdrv_io_plug = raw_aio_plug,
     .bdrv_io_unplug = raw_aio_unplug,
     .bdrv_attach_aio_context = raw_aio_attach_aio_context,
-- 
2.28.0


