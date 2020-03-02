Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E6731757F1
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Mar 2020 11:07:15 +0100 (CET)
Received: from localhost ([::1]:57844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j8hyk-0006Rl-K4
	for lists+qemu-devel@lfdr.de; Mon, 02 Mar 2020 05:07:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50789)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vsementsov@virtuozzo.com>) id 1j8hxV-0004WT-NW
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 05:05:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1j8hxU-0007lq-Ji
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 05:05:57 -0500
Received: from relay.sw.ru ([185.231.240.75]:48184)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1j8hxR-0007jH-ST; Mon, 02 Mar 2020 05:05:54 -0500
Received: from vovaso.qa.sw.ru ([10.94.3.0] helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.3)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1j8hxI-000350-Gj; Mon, 02 Mar 2020 13:05:44 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH 5/5] block/io: auto-no-fallback for write-zeroes
Date: Mon,  2 Mar 2020 13:05:37 +0300
Message-Id: <20200302100537.29058-6-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200302100537.29058-1-vsementsov@virtuozzo.com>
References: <20200302100537.29058-1-vsementsov@virtuozzo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 185.231.240.75
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
Cc: fam@euphon.net, kwolf@redhat.com, vsementsov@virtuozzo.com,
 qemu-devel@nongnu.org, mreitz@redhat.com, stefanha@redhat.com, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

NBD driver may has max_pwrite_zeroes but doesn't has
max_pwrite_zeroes_no_fallback limit. This means, that (when
BDRV_REQ_NO_FALLBACK is supported) it is beneficial to try send request
with BDRV_REQ_NO_FALLBACK instead of splitting the request accordingly
to max_pwrite_zeroes.

If failed, fallback to old behavior.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/io.c | 30 ++++++++++++++++++++++++++----
 1 file changed, 26 insertions(+), 4 deletions(-)

diff --git a/block/io.c b/block/io.c
index c64566b4cf..48d71b0883 100644
--- a/block/io.c
+++ b/block/io.c
@@ -1752,17 +1752,28 @@ static int coroutine_fn bdrv_co_do_pwrite_zeroes(BlockDriverState *bs,
     int head = 0;
     int tail = 0;
 
-    int max_write_zeroes = MIN_NON_ZERO((flags & BDRV_REQ_NO_FALLBACK) ?
-                                        bs->bl.max_pwrite_zeroes_no_fallback :
-                                        bs->bl.max_pwrite_zeroes, INT_MAX);
+    int max_write_zeroes;
     int alignment = MAX(bs->bl.pwrite_zeroes_alignment,
                         bs->bl.request_alignment);
     int max_transfer = MIN_NON_ZERO(bs->bl.max_transfer, MAX_BOUNCE_BUFFER);
+    bool auto_no_fallback;
 
     if (!drv) {
         return -ENOMEDIUM;
     }
 
+    if (!(flags & BDRV_REQ_NO_FALLBACK) &&
+        (bs->supported_zero_flags & BDRV_REQ_NO_FALLBACK) &&
+        bs->bl.max_pwrite_zeroes &&
+        bs->bl.max_pwrite_zeroes < bytes &&
+        (bs->bl.max_pwrite_zeroes < bs->bl.max_pwrite_zeroes_no_fallback ||
+         bs->bl.max_pwrite_zeroes_no_fallback == 0))
+    {
+        assert(drv->bdrv_co_pwrite_zeroes);
+        flags |= BDRV_REQ_NO_FALLBACK;
+        auto_no_fallback = true;
+    }
+
     if ((flags & ~bs->supported_zero_flags) & BDRV_REQ_NO_FALLBACK) {
         return -ENOTSUP;
     }
@@ -1770,7 +1781,11 @@ static int coroutine_fn bdrv_co_do_pwrite_zeroes(BlockDriverState *bs,
     assert(alignment % bs->bl.request_alignment == 0);
     head = offset % alignment;
     tail = (offset + bytes) % alignment;
-    max_write_zeroes = QEMU_ALIGN_DOWN(max_write_zeroes, alignment);
+    max_write_zeroes =
+        QEMU_ALIGN_DOWN(MIN_NON_ZERO((flags & BDRV_REQ_NO_FALLBACK) ?
+                                     bs->bl.max_pwrite_zeroes_no_fallback :
+                                     bs->bl.max_pwrite_zeroes, INT_MAX),
+                        alignment);
     assert(max_write_zeroes >= bs->bl.request_alignment);
 
     while (bytes > 0 && !ret) {
@@ -1801,6 +1816,13 @@ static int coroutine_fn bdrv_co_do_pwrite_zeroes(BlockDriverState *bs,
         if (drv->bdrv_co_pwrite_zeroes) {
             ret = drv->bdrv_co_pwrite_zeroes(bs, offset, num,
                                              flags & bs->supported_zero_flags);
+            if (ret == -ENOTSUP && auto_no_fallback) {
+                flags &= ~BDRV_REQ_NO_FALLBACK;
+                max_write_zeroes =
+                    QEMU_ALIGN_DOWN(MIN_NON_ZERO(bs->bl.max_pwrite_zeroes,
+                                                 INT_MAX), alignment);
+                continue;
+            }
             if (ret != -ENOTSUP && (flags & BDRV_REQ_FUA) &&
                 !(bs->supported_zero_flags & BDRV_REQ_FUA)) {
                 need_flush = true;
-- 
2.21.0


