Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A35342FD54
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 23:19:51 +0200 (CEST)
Received: from localhost ([::1]:45436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbUcI-0005JQ-L8
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 17:19:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mbUTF-0007Tz-7L
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 17:10:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43427)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mbUTA-0000dZ-HP
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 17:10:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634332221;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ttl6zmk7BedN8TtODJVW+CBtgvw3GFAXOGNMHkGFQ2A=;
 b=QCouXzog63avV6P/0tRkVmcMJ97ncr47BSf0dH376XOpRH6qotfWtN2tk/mzf6ow7/5aUo
 UPA4+5KRdk5Gds1mVkJ2jl8owdrGr0SZKUWQgPoEI2QX4SdRTyZM4SWOMDH+rGGRh2ZeJV
 WS6bbXTKNskUZTLtFoYuamP5CbYqcMk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-185-ApE9EVfHPH6QvTGbVJaflw-1; Fri, 15 Oct 2021 17:10:19 -0400
X-MC-Unique: ApE9EVfHPH6QvTGbVJaflw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C049E10A8E02;
 Fri, 15 Oct 2021 21:10:18 +0000 (UTC)
Received: from blue.redhat.com (ovpn-114-130.phx2.redhat.com [10.3.114.130])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5017619739;
 Fri, 15 Oct 2021 21:10:18 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 06/15] block-backend: rename _do_ helper functions to _co_do_
Date: Fri, 15 Oct 2021 16:10:01 -0500
Message-Id: <20211015211011.1272011-7-eblake@redhat.com>
In-Reply-To: <20211015211011.1272011-1-eblake@redhat.com>
References: <20211015211011.1272011-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

This is a preparation to the following commit, to use automatic
coroutine wrapper generation.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20211006131718.214235-6-vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 block/block-backend.c | 52 +++++++++++++++++++++----------------------
 1 file changed, 26 insertions(+), 26 deletions(-)

diff --git a/block/block-backend.c b/block/block-backend.c
index 1e21498b2c4a..cecac6748593 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -1205,8 +1205,8 @@ static void coroutine_fn blk_wait_while_drained(BlockBackend *blk)

 /* To be called between exactly one pair of blk_inc/dec_in_flight() */
 static int coroutine_fn
-blk_do_preadv(BlockBackend *blk, int64_t offset, int64_t bytes,
-              QEMUIOVector *qiov, BdrvRequestFlags flags)
+blk_co_do_preadv(BlockBackend *blk, int64_t offset, int64_t bytes,
+                 QEMUIOVector *qiov, BdrvRequestFlags flags)
 {
     int ret;
     BlockDriverState *bs;
@@ -1242,7 +1242,7 @@ int coroutine_fn blk_co_preadv(BlockBackend *blk, int64_t offset,
     int ret;

     blk_inc_in_flight(blk);
-    ret = blk_do_preadv(blk, offset, bytes, qiov, flags);
+    ret = blk_co_do_preadv(blk, offset, bytes, qiov, flags);
     blk_dec_in_flight(blk);

     return ret;
@@ -1250,9 +1250,9 @@ int coroutine_fn blk_co_preadv(BlockBackend *blk, int64_t offset,

 /* To be called between exactly one pair of blk_inc/dec_in_flight() */
 static int coroutine_fn
-blk_do_pwritev_part(BlockBackend *blk, int64_t offset, int64_t bytes,
-                    QEMUIOVector *qiov, size_t qiov_offset,
-                    BdrvRequestFlags flags)
+blk_co_do_pwritev_part(BlockBackend *blk, int64_t offset, int64_t bytes,
+                       QEMUIOVector *qiov, size_t qiov_offset,
+                       BdrvRequestFlags flags)
 {
     int ret;
     BlockDriverState *bs;
@@ -1293,7 +1293,7 @@ int coroutine_fn blk_co_pwritev_part(BlockBackend *blk, int64_t offset,
     int ret;

     blk_inc_in_flight(blk);
-    ret = blk_do_pwritev_part(blk, offset, bytes, qiov, qiov_offset, flags);
+    ret = blk_co_do_pwritev_part(blk, offset, bytes, qiov, qiov_offset, flags);
     blk_dec_in_flight(blk);

     return ret;
@@ -1319,8 +1319,8 @@ static void blk_read_entry(void *opaque)
     BlkRwCo *rwco = opaque;
     QEMUIOVector *qiov = rwco->iobuf;

-    rwco->ret = blk_do_preadv(rwco->blk, rwco->offset, qiov->size,
-                              qiov, rwco->flags);
+    rwco->ret = blk_co_do_preadv(rwco->blk, rwco->offset, qiov->size,
+                                 qiov, rwco->flags);
     aio_wait_kick();
 }

@@ -1329,8 +1329,8 @@ static void blk_write_entry(void *opaque)
     BlkRwCo *rwco = opaque;
     QEMUIOVector *qiov = rwco->iobuf;

-    rwco->ret = blk_do_pwritev_part(rwco->blk, rwco->offset, qiov->size,
-                                    qiov, 0, rwco->flags);
+    rwco->ret = blk_co_do_pwritev_part(rwco->blk, rwco->offset, qiov->size,
+                                       qiov, 0, rwco->flags);
     aio_wait_kick();
 }

@@ -1483,8 +1483,8 @@ static void blk_aio_read_entry(void *opaque)
     QEMUIOVector *qiov = rwco->iobuf;

     assert(qiov->size == acb->bytes);
-    rwco->ret = blk_do_preadv(rwco->blk, rwco->offset, acb->bytes,
-                              qiov, rwco->flags);
+    rwco->ret = blk_co_do_preadv(rwco->blk, rwco->offset, acb->bytes,
+                                 qiov, rwco->flags);
     blk_aio_complete(acb);
 }

@@ -1495,8 +1495,8 @@ static void blk_aio_write_entry(void *opaque)
     QEMUIOVector *qiov = rwco->iobuf;

     assert(!qiov || qiov->size == acb->bytes);
-    rwco->ret = blk_do_pwritev_part(rwco->blk, rwco->offset, acb->bytes,
-                                    qiov, 0, rwco->flags);
+    rwco->ret = blk_co_do_pwritev_part(rwco->blk, rwco->offset, acb->bytes,
+                                       qiov, 0, rwco->flags);
     blk_aio_complete(acb);
 }

@@ -1583,7 +1583,7 @@ void blk_aio_cancel_async(BlockAIOCB *acb)

 /* To be called between exactly one pair of blk_inc/dec_in_flight() */
 static int coroutine_fn
-blk_do_ioctl(BlockBackend *blk, unsigned long int req, void *buf)
+blk_co_do_ioctl(BlockBackend *blk, unsigned long int req, void *buf)
 {
     blk_wait_while_drained(blk);

@@ -1599,7 +1599,7 @@ static void blk_ioctl_entry(void *opaque)
     BlkRwCo *rwco = opaque;
     QEMUIOVector *qiov = rwco->iobuf;

-    rwco->ret = blk_do_ioctl(rwco->blk, rwco->offset, qiov->iov[0].iov_base);
+    rwco->ret = blk_co_do_ioctl(rwco->blk, rwco->offset, qiov->iov[0].iov_base);
     aio_wait_kick();
 }

@@ -1613,7 +1613,7 @@ static void blk_aio_ioctl_entry(void *opaque)
     BlkAioEmAIOCB *acb = opaque;
     BlkRwCo *rwco = &acb->rwco;

-    rwco->ret = blk_do_ioctl(rwco->blk, rwco->offset, rwco->iobuf);
+    rwco->ret = blk_co_do_ioctl(rwco->blk, rwco->offset, rwco->iobuf);

     blk_aio_complete(acb);
 }
@@ -1626,7 +1626,7 @@ BlockAIOCB *blk_aio_ioctl(BlockBackend *blk, unsigned long int req, void *buf,

 /* To be called between exactly one pair of blk_inc/dec_in_flight() */
 static int coroutine_fn
-blk_do_pdiscard(BlockBackend *blk, int64_t offset, int64_t bytes)
+blk_co_do_pdiscard(BlockBackend *blk, int64_t offset, int64_t bytes)
 {
     int ret;

@@ -1645,7 +1645,7 @@ static void blk_aio_pdiscard_entry(void *opaque)
     BlkAioEmAIOCB *acb = opaque;
     BlkRwCo *rwco = &acb->rwco;

-    rwco->ret = blk_do_pdiscard(rwco->blk, rwco->offset, acb->bytes);
+    rwco->ret = blk_co_do_pdiscard(rwco->blk, rwco->offset, acb->bytes);
     blk_aio_complete(acb);
 }

@@ -1663,7 +1663,7 @@ int coroutine_fn blk_co_pdiscard(BlockBackend *blk, int64_t offset,
     int ret;

     blk_inc_in_flight(blk);
-    ret = blk_do_pdiscard(blk, offset, bytes);
+    ret = blk_co_do_pdiscard(blk, offset, bytes);
     blk_dec_in_flight(blk);

     return ret;
@@ -1674,7 +1674,7 @@ static void blk_pdiscard_entry(void *opaque)
     BlkRwCo *rwco = opaque;
     QEMUIOVector *qiov = rwco->iobuf;

-    rwco->ret = blk_do_pdiscard(rwco->blk, rwco->offset, qiov->size);
+    rwco->ret = blk_co_do_pdiscard(rwco->blk, rwco->offset, qiov->size);
     aio_wait_kick();
 }

@@ -1684,7 +1684,7 @@ int blk_pdiscard(BlockBackend *blk, int64_t offset, int bytes)
 }

 /* To be called between exactly one pair of blk_inc/dec_in_flight() */
-static int coroutine_fn blk_do_flush(BlockBackend *blk)
+static int coroutine_fn blk_co_do_flush(BlockBackend *blk)
 {
     blk_wait_while_drained(blk);

@@ -1700,7 +1700,7 @@ static void blk_aio_flush_entry(void *opaque)
     BlkAioEmAIOCB *acb = opaque;
     BlkRwCo *rwco = &acb->rwco;

-    rwco->ret = blk_do_flush(rwco->blk);
+    rwco->ret = blk_co_do_flush(rwco->blk);
     blk_aio_complete(acb);
 }

@@ -1715,7 +1715,7 @@ int coroutine_fn blk_co_flush(BlockBackend *blk)
     int ret;

     blk_inc_in_flight(blk);
-    ret = blk_do_flush(blk);
+    ret = blk_co_do_flush(blk);
     blk_dec_in_flight(blk);

     return ret;
@@ -1724,7 +1724,7 @@ int coroutine_fn blk_co_flush(BlockBackend *blk)
 static void blk_flush_entry(void *opaque)
 {
     BlkRwCo *rwco = opaque;
-    rwco->ret = blk_do_flush(rwco->blk);
+    rwco->ret = blk_co_do_flush(rwco->blk);
     aio_wait_kick();
 }

-- 
2.31.1


