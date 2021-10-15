Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9FC442FD5F
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 23:24:15 +0200 (CEST)
Received: from localhost ([::1]:60810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbUgY-0007Cu-V2
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 17:24:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mbUTL-0007Vr-E2
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 17:10:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29372)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mbUTC-0000gn-R2
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 17:10:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634332224;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VLxHDhUAe3UjcGz/3UrRSJMxMh1ynALQIwoudXx/avU=;
 b=ZuEPihPXo03srG1l1Nfj4/xvE0rscO03EIvC85pgsV30jytmrXOgYSeKZzmI1OoMUvHgZo
 5J2WxcB9LAXKPnq3sekUBngiglN91D1Fi7khr4q96S4BbdhNOsiCPTgJXr9ejRcl8Vt95D
 HhXgWUpSwCAhY+HTNzxo2ZBya9Nzxf0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-170-650NWoK_MdiBQj5Q5cofzQ-1; Fri, 15 Oct 2021 17:10:21 -0400
X-MC-Unique: 650NWoK_MdiBQj5Q5cofzQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 37498DF8A4;
 Fri, 15 Oct 2021 21:10:20 +0000 (UTC)
Received: from blue.redhat.com (ovpn-114-130.phx2.redhat.com [10.3.114.130])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BE4EA196E2;
 Fri, 15 Oct 2021 21:10:19 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 08/15] block-backend: drop blk_prw, use block-coroutine-wrapper
Date: Fri, 15 Oct 2021 16:10:03 -0500
Message-Id: <20211015211011.1272011-9-eblake@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
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

Let's drop hand-made coroutine wrappers and use coroutine wrapper
generation like in block/io.c.

Now, blk_foo() functions are written in same way as blk_co_foo() ones,
but wrap blk_do_foo() instead of blk_co_do_foo().

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20211006131718.214235-8-vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
[eblake: spelling fix]
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 block/coroutines.h    |  30 ++++++++
 block/block-backend.c | 155 ++++++++++++++++--------------------------
 2 files changed, 90 insertions(+), 95 deletions(-)

diff --git a/block/coroutines.h b/block/coroutines.h
index 35a6c4985782..c8c14a29c834 100644
--- a/block/coroutines.h
+++ b/block/coroutines.h
@@ -75,4 +75,34 @@ int coroutine_fn
 nbd_co_do_establish_connection(BlockDriverState *bs, Error **errp);


+int generated_co_wrapper
+blk_do_preadv(BlockBackend *blk, int64_t offset, int64_t bytes,
+              QEMUIOVector *qiov, BdrvRequestFlags flags);
+int coroutine_fn
+blk_co_do_preadv(BlockBackend *blk, int64_t offset, int64_t bytes,
+                 QEMUIOVector *qiov, BdrvRequestFlags flags);
+
+
+int generated_co_wrapper
+blk_do_pwritev_part(BlockBackend *blk, int64_t offset, int64_t bytes,
+                    QEMUIOVector *qiov, size_t qiov_offset,
+                    BdrvRequestFlags flags);
+int coroutine_fn
+blk_co_do_pwritev_part(BlockBackend *blk, int64_t offset, int64_t bytes,
+                       QEMUIOVector *qiov, size_t qiov_offset,
+                       BdrvRequestFlags flags);
+
+int generated_co_wrapper
+blk_do_ioctl(BlockBackend *blk, unsigned long int req, void *buf);
+int coroutine_fn
+blk_co_do_ioctl(BlockBackend *blk, unsigned long int req, void *buf);
+
+int generated_co_wrapper
+blk_do_pdiscard(BlockBackend *blk, int64_t offset, int64_t bytes);
+int coroutine_fn
+blk_co_do_pdiscard(BlockBackend *blk, int64_t offset, int64_t bytes);
+
+int generated_co_wrapper blk_do_flush(BlockBackend *blk);
+int coroutine_fn blk_co_do_flush(BlockBackend *blk);
+
 #endif /* BLOCK_COROUTINES_INT_H */
diff --git a/block/block-backend.c b/block/block-backend.c
index cecac6748593..2e6ccce7ef2d 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -14,6 +14,7 @@
 #include "sysemu/block-backend.h"
 #include "block/block_int.h"
 #include "block/blockjob.h"
+#include "block/coroutines.h"
 #include "block/throttle-groups.h"
 #include "hw/qdev-core.h"
 #include "sysemu/blockdev.h"
@@ -1204,7 +1205,7 @@ static void coroutine_fn blk_wait_while_drained(BlockBackend *blk)
 }

 /* To be called between exactly one pair of blk_inc/dec_in_flight() */
-static int coroutine_fn
+int coroutine_fn
 blk_co_do_preadv(BlockBackend *blk, int64_t offset, int64_t bytes,
                  QEMUIOVector *qiov, BdrvRequestFlags flags)
 {
@@ -1249,7 +1250,7 @@ int coroutine_fn blk_co_preadv(BlockBackend *blk, int64_t offset,
 }

 /* To be called between exactly one pair of blk_inc/dec_in_flight() */
-static int coroutine_fn
+int coroutine_fn
 blk_co_do_pwritev_part(BlockBackend *blk, int64_t offset, int64_t bytes,
                        QEMUIOVector *qiov, size_t qiov_offset,
                        BdrvRequestFlags flags)
@@ -1306,6 +1307,20 @@ int coroutine_fn blk_co_pwritev(BlockBackend *blk, int64_t offset,
     return blk_co_pwritev_part(blk, offset, bytes, qiov, 0, flags);
 }

+static int coroutine_fn blk_pwritev_part(BlockBackend *blk, int64_t offset,
+                                         int64_t bytes,
+                                         QEMUIOVector *qiov, size_t qiov_offset,
+                                         BdrvRequestFlags flags)
+{
+    int ret;
+
+    blk_inc_in_flight(blk);
+    ret = blk_do_pwritev_part(blk, offset, bytes, qiov, qiov_offset, flags);
+    blk_dec_in_flight(blk);
+
+    return ret;
+}
+
 typedef struct BlkRwCo {
     BlockBackend *blk;
     int64_t offset;
@@ -1314,58 +1329,11 @@ typedef struct BlkRwCo {
     BdrvRequestFlags flags;
 } BlkRwCo;

-static void blk_read_entry(void *opaque)
-{
-    BlkRwCo *rwco = opaque;
-    QEMUIOVector *qiov = rwco->iobuf;
-
-    rwco->ret = blk_co_do_preadv(rwco->blk, rwco->offset, qiov->size,
-                                 qiov, rwco->flags);
-    aio_wait_kick();
-}
-
-static void blk_write_entry(void *opaque)
-{
-    BlkRwCo *rwco = opaque;
-    QEMUIOVector *qiov = rwco->iobuf;
-
-    rwco->ret = blk_co_do_pwritev_part(rwco->blk, rwco->offset, qiov->size,
-                                       qiov, 0, rwco->flags);
-    aio_wait_kick();
-}
-
-static int blk_prw(BlockBackend *blk, int64_t offset, uint8_t *buf,
-                   int64_t bytes, CoroutineEntry co_entry,
-                   BdrvRequestFlags flags)
-{
-    QEMUIOVector qiov = QEMU_IOVEC_INIT_BUF(qiov, buf, bytes);
-    BlkRwCo rwco = {
-        .blk    = blk,
-        .offset = offset,
-        .iobuf  = &qiov,
-        .flags  = flags,
-        .ret    = NOT_DONE,
-    };
-
-    blk_inc_in_flight(blk);
-    if (qemu_in_coroutine()) {
-        /* Fast-path if already in coroutine context */
-        co_entry(&rwco);
-    } else {
-        Coroutine *co = qemu_coroutine_create(co_entry, &rwco);
-        bdrv_coroutine_enter(blk_bs(blk), co);
-        BDRV_POLL_WHILE(blk_bs(blk), rwco.ret == NOT_DONE);
-    }
-    blk_dec_in_flight(blk);
-
-    return rwco.ret;
-}
-
 int blk_pwrite_zeroes(BlockBackend *blk, int64_t offset,
                       int bytes, BdrvRequestFlags flags)
 {
-    return blk_prw(blk, offset, NULL, bytes, blk_write_entry,
-                   flags | BDRV_REQ_ZERO_WRITE);
+    return blk_pwritev_part(blk, offset, bytes, NULL, 0,
+                            flags | BDRV_REQ_ZERO_WRITE);
 }

 int blk_make_zero(BlockBackend *blk, BdrvRequestFlags flags)
@@ -1510,22 +1478,25 @@ BlockAIOCB *blk_aio_pwrite_zeroes(BlockBackend *blk, int64_t offset,

 int blk_pread(BlockBackend *blk, int64_t offset, void *buf, int count)
 {
-    int ret = blk_prw(blk, offset, buf, count, blk_read_entry, 0);
-    if (ret < 0) {
-        return ret;
-    }
-    return count;
+    int ret;
+    QEMUIOVector qiov = QEMU_IOVEC_INIT_BUF(qiov, buf, count);
+
+    blk_inc_in_flight(blk);
+    ret = blk_do_preadv(blk, offset, count, &qiov, 0);
+    blk_dec_in_flight(blk);
+
+    return ret < 0 ? ret : count;
 }

 int blk_pwrite(BlockBackend *blk, int64_t offset, const void *buf, int count,
                BdrvRequestFlags flags)
 {
-    int ret = blk_prw(blk, offset, (void *) buf, count, blk_write_entry,
-                      flags);
-    if (ret < 0) {
-        return ret;
-    }
-    return count;
+    int ret;
+    QEMUIOVector qiov = QEMU_IOVEC_INIT_BUF(qiov, buf, count);
+
+    ret = blk_pwritev_part(blk, offset, count, &qiov, 0, flags);
+
+    return ret < 0 ? ret : count;
 }

 int64_t blk_getlength(BlockBackend *blk)
@@ -1582,7 +1553,7 @@ void blk_aio_cancel_async(BlockAIOCB *acb)
 }

 /* To be called between exactly one pair of blk_inc/dec_in_flight() */
-static int coroutine_fn
+int coroutine_fn
 blk_co_do_ioctl(BlockBackend *blk, unsigned long int req, void *buf)
 {
     blk_wait_while_drained(blk);
@@ -1594,18 +1565,15 @@ blk_co_do_ioctl(BlockBackend *blk, unsigned long int req, void *buf)
     return bdrv_co_ioctl(blk_bs(blk), req, buf);
 }

-static void blk_ioctl_entry(void *opaque)
-{
-    BlkRwCo *rwco = opaque;
-    QEMUIOVector *qiov = rwco->iobuf;
-
-    rwco->ret = blk_co_do_ioctl(rwco->blk, rwco->offset, qiov->iov[0].iov_base);
-    aio_wait_kick();
-}
-
 int blk_ioctl(BlockBackend *blk, unsigned long int req, void *buf)
 {
-    return blk_prw(blk, req, buf, 0, blk_ioctl_entry, 0);
+    int ret;
+
+    blk_inc_in_flight(blk);
+    ret = blk_do_ioctl(blk, req, buf);
+    blk_dec_in_flight(blk);
+
+    return ret;
 }

 static void blk_aio_ioctl_entry(void *opaque)
@@ -1625,7 +1593,7 @@ BlockAIOCB *blk_aio_ioctl(BlockBackend *blk, unsigned long int req, void *buf,
 }

 /* To be called between exactly one pair of blk_inc/dec_in_flight() */
-static int coroutine_fn
+int coroutine_fn
 blk_co_do_pdiscard(BlockBackend *blk, int64_t offset, int64_t bytes)
 {
     int ret;
@@ -1669,22 +1637,19 @@ int coroutine_fn blk_co_pdiscard(BlockBackend *blk, int64_t offset,
     return ret;
 }

-static void blk_pdiscard_entry(void *opaque)
-{
-    BlkRwCo *rwco = opaque;
-    QEMUIOVector *qiov = rwco->iobuf;
-
-    rwco->ret = blk_co_do_pdiscard(rwco->blk, rwco->offset, qiov->size);
-    aio_wait_kick();
-}
-
 int blk_pdiscard(BlockBackend *blk, int64_t offset, int bytes)
 {
-    return blk_prw(blk, offset, NULL, bytes, blk_pdiscard_entry, 0);
+    int ret;
+
+    blk_inc_in_flight(blk);
+    ret = blk_do_pdiscard(blk, offset, bytes);
+    blk_dec_in_flight(blk);
+
+    return ret;
 }

 /* To be called between exactly one pair of blk_inc/dec_in_flight() */
-static int coroutine_fn blk_co_do_flush(BlockBackend *blk)
+int coroutine_fn blk_co_do_flush(BlockBackend *blk)
 {
     blk_wait_while_drained(blk);

@@ -1721,16 +1686,15 @@ int coroutine_fn blk_co_flush(BlockBackend *blk)
     return ret;
 }

-static void blk_flush_entry(void *opaque)
-{
-    BlkRwCo *rwco = opaque;
-    rwco->ret = blk_co_do_flush(rwco->blk);
-    aio_wait_kick();
-}
-
 int blk_flush(BlockBackend *blk)
 {
-    return blk_prw(blk, 0, NULL, 0, blk_flush_entry, 0);
+    int ret;
+
+    blk_inc_in_flight(blk);
+    ret = blk_do_flush(blk);
+    blk_dec_in_flight(blk);
+
+    return ret;
 }

 void blk_drain(BlockBackend *blk)
@@ -2224,8 +2188,9 @@ int coroutine_fn blk_co_pwrite_zeroes(BlockBackend *blk, int64_t offset,
 int blk_pwrite_compressed(BlockBackend *blk, int64_t offset, const void *buf,
                           int count)
 {
-    return blk_prw(blk, offset, (void *) buf, count, blk_write_entry,
-                   BDRV_REQ_WRITE_COMPRESSED);
+    QEMUIOVector qiov = QEMU_IOVEC_INIT_BUF(qiov, buf, count);
+    return blk_pwritev_part(blk, offset, count, &qiov, 0,
+                            BDRV_REQ_WRITE_COMPRESSED);
 }

 int blk_truncate(BlockBackend *blk, int64_t offset, bool exact,
-- 
2.31.1


