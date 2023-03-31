Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3913B6D256A
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Mar 2023 18:25:27 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1piHXe-0005gE-Mh; Fri, 31 Mar 2023 12:23:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1piHXa-0005fu-CJ
 for qemu-devel@nongnu.org; Fri, 31 Mar 2023 12:23:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1piHXT-0004K2-HP
 for qemu-devel@nongnu.org; Fri, 31 Mar 2023 12:23:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680279819;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Z3010CIVo8Dmj3AUBg3E7k8iXmYW2uvFUFnR/lPJqOk=;
 b=M4uad3TsWRZYDCPV6Spvqapv6UrqBUdADqgYB+nQNOguD05eghFiqjwZKl7vn6ylY5cvL5
 Zh5pEv2+6+UHkXmE3kyabqpWp621I3qieX+AR8fIV3fJZ3oKSYfcjYsvij72SWTIU9SpF2
 XYzvT4IU+PqrRbBWZVM/H7vqAMwxYwM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-152-OU8Q6TgQNjSu5nXz55DfSw-1; Fri, 31 Mar 2023 12:23:37 -0400
X-MC-Unique: OU8Q6TgQNjSu5nXz55DfSw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 38838885627;
 Fri, 31 Mar 2023 16:23:37 +0000 (UTC)
Received: from localhost (unknown [10.39.193.254])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B86112166B33;
 Fri, 31 Mar 2023 16:23:36 +0000 (UTC)
From: Hanna Czenczek <hreitz@redhat.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, Hanna Czenczek <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Fiona Ebner <f.ebner@proxmox.com>, John Snow <jsnow@redhat.com>
Subject: [PATCH v2] block-backend: Add new bds_io_in_flight counter
Date: Fri, 31 Mar 2023 18:23:35 +0200
Message-Id: <20230331162335.27518-1-hreitz@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

IDE TRIM is a BB user that wants to elevate its BB's in-flight counter
for a "macro" operation that consists of several actual I/O operations.
Each of those operations is individually started and awaited.  It does
this so that blk_drain() will drain the whole TRIM, and not just a
single one of the many discard operations it may encompass.

When request queuing is enabled, this leads to a deadlock: The currently
ongoing discard is drained, and the next one is queued, waiting for the
drain to stop.  Meanwhile, TRIM still keeps the in-flight counter
elevated, waiting for all discards to stop -- which will never happen,
because with the in-flight counter elevated, the BB is never considered
drained, so the drained section does not begin and cannot end.

There are two separate cases to look at here, namely bdrv_drain*() and
blk_drain*().  As said above, we do want blk_drain*() to settle the
whole operation: The only way to do so is to disable request queuing,
then.  So, we do that: Have blk_drain() and blk_drain_all() temporarily
disable request queuing, which prevents the deadlock.

(The devil's in the details, though: blk_drain_all() runs
bdrv_drain_all_begin() first, so when we get to the individual BB, there
may already be queued requests.  Therefore, we have to not only disable
request queuing then, but resume all already-queued requests, too.)

For bdrv_drain*(), we want request queuing -- and macro requests such as
IDE's TRIM request do not matter.  bdrv_drain*() wants to keep I/O
requests from BDS nodes, and the TRIM does not issue such requests; it
instead does so through blk_*() functions, which themselves elevate the
BB's in-flight counter.  So the idea is to drain (and potentially queue)
those blk_*() requests, but completely ignore the TRIM.

We can do that by splitting a new counter off of the existing BB
counter: The new bds_io_in_flight counter counts all those blk_*()
requests that can issue I/O to a BDS (so must be drained by
bdrv_drain*()), but will never block waiting on another request on the
BB.

In blk_drain*(), we disable request queuing and settle all requests (the
full in_flight count).  In bdrv_drain*() (i.e. blk_root_drained_poll()),
we only settle bds_io_in_flight_count, ignoring all requests that will
not directly issue I/O requests to BDS nodes.

Reported-by: Fiona Ebner <f.ebner@proxmox.com>
Fixes: 7e5cdb345f77d76cb4877fe6230c4e17a7d0d0ca
       ("ide: Increment BB in-flight counter for TRIM BH")
Signed-off-by: Hanna Czenczek <hreitz@redhat.com>
---
 block/block-backend.c | 157 ++++++++++++++++++++++++++++++++++--------
 1 file changed, 130 insertions(+), 27 deletions(-)

diff --git a/block/block-backend.c b/block/block-backend.c
index 2ee39229e4..6b9cf1c8c4 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -91,8 +91,27 @@ struct BlockBackend {
      * in-flight requests but aio requests can exist even when blk->root is
      * NULL, so we cannot rely on its counter for that case.
      * Accessed with atomic ops.
+     *
+     * bds_io_in_flight is the subset of in-flight requests that may directly
+     * issue I/O to a BDS node.  Polling the BB's AioContext, these requests
+     * must always make progress, eventually leading to bds_io_in_flight being
+     * decremented again (either when they request is settled, or when it is
+     * queued because of request queuing).
+     * In contrast to these, there are more abstract requests, which will not
+     * themselves issue I/O to a BDS node, but instead, when necessary, create
+     * specific BDS I/O requests that do so on their behalf, and then they block
+     * waiting for those subordinate requests.
+     * While request queuing is enabled, we must not have drained_poll wait on
+     * such abstract requests, because if one of its subordinate requests is
+     * queued, it will block and cannot progress until the drained section ends,
+     * which leads to a deadlock.  Luckily, it is safe to ignore such requests
+     * when draining BDS nodes: After all, they themselves do not issue I/O to
+     * BDS nodes.
+     * Finally, when draining a BB (blk_drain(), blk_drain_all()), we simply
+     * disable request queuing and can thus safely await all in-flight requests.
      */
     unsigned int in_flight;
+    unsigned int bds_io_in_flight;
 };
 
 typedef struct BlockBackendAIOCB {
@@ -138,6 +157,9 @@ static bool blk_root_change_aio_ctx(BdrvChild *child, AioContext *ctx,
                                     GHashTable *visited, Transaction *tran,
                                     Error **errp);
 
+static void blk_inc_bds_io_in_flight(BlockBackend *blk);
+static void blk_dec_bds_io_in_flight(BlockBackend *blk);
+
 static char *blk_root_get_parent_desc(BdrvChild *child)
 {
     BlockBackend *blk = child->opaque;
@@ -1266,15 +1288,15 @@ blk_check_byte_request(BlockBackend *blk, int64_t offset, int64_t bytes)
     return 0;
 }
 
-/* To be called between exactly one pair of blk_inc/dec_in_flight() */
+/* To be called between exactly one pair of blk_inc/dec_bds_io_in_flight() */
 static void coroutine_fn blk_wait_while_drained(BlockBackend *blk)
 {
-    assert(blk->in_flight > 0);
+    assert(blk->in_flight > 0 && blk->bds_io_in_flight > 0);
 
     if (blk->quiesce_counter && !blk->disable_request_queuing) {
-        blk_dec_in_flight(blk);
+        blk_dec_bds_io_in_flight(blk);
         qemu_co_queue_wait(&blk->queued_requests, NULL);
-        blk_inc_in_flight(blk);
+        blk_inc_bds_io_in_flight(blk);
     }
 }
 
@@ -1332,9 +1354,9 @@ int coroutine_fn blk_co_preadv(BlockBackend *blk, int64_t offset,
     int ret;
     IO_OR_GS_CODE();
 
-    blk_inc_in_flight(blk);
+    blk_inc_bds_io_in_flight(blk);
     ret = blk_co_do_preadv_part(blk, offset, bytes, qiov, 0, flags);
-    blk_dec_in_flight(blk);
+    blk_dec_bds_io_in_flight(blk);
 
     return ret;
 }
@@ -1346,9 +1368,9 @@ int coroutine_fn blk_co_preadv_part(BlockBackend *blk, int64_t offset,
     int ret;
     IO_OR_GS_CODE();
 
-    blk_inc_in_flight(blk);
+    blk_inc_bds_io_in_flight(blk);
     ret = blk_co_do_preadv_part(blk, offset, bytes, qiov, qiov_offset, flags);
-    blk_dec_in_flight(blk);
+    blk_dec_bds_io_in_flight(blk);
 
     return ret;
 }
@@ -1400,9 +1422,9 @@ int coroutine_fn blk_co_pwritev_part(BlockBackend *blk, int64_t offset,
     int ret;
     IO_OR_GS_CODE();
 
-    blk_inc_in_flight(blk);
+    blk_inc_bds_io_in_flight(blk);
     ret = blk_co_do_pwritev_part(blk, offset, bytes, qiov, qiov_offset, flags);
-    blk_dec_in_flight(blk);
+    blk_dec_bds_io_in_flight(blk);
 
     return ret;
 }
@@ -1463,6 +1485,37 @@ int blk_make_zero(BlockBackend *blk, BdrvRequestFlags flags)
     return bdrv_make_zero(blk->root, flags);
 }
 
+/*
+ * Increments both the general in-flight counter, and the BDS I/O in-flight
+ * counter.  This must be used by requests that can directly issue BDS I/O
+ * requests, so that blk_root_drained_poll() will properly drain them.
+ * Requests wrapped in this must continuously make progress when polled by
+ * blk_root_drained_poll(), i.e. must eventually reach
+ * blk_dec_bds_io_in_flight().  Notably, they must not launch other BB requests
+ * and block waiting on them to complete, because those might be queued, and
+ * then they will not make progress until the drained section ends.
+ */
+static void blk_inc_bds_io_in_flight(BlockBackend *blk)
+{
+    IO_CODE();
+    blk_inc_in_flight(blk);
+    qatomic_inc(&blk->bds_io_in_flight);
+}
+
+static void blk_dec_bds_io_in_flight(BlockBackend *blk)
+{
+    IO_CODE();
+    qatomic_dec(&blk->bds_io_in_flight);
+    blk_dec_in_flight(blk);
+}
+
+/*
+ * Increments the general in-flight counter, but not the BDS I/O in-flight
+ * counter.  This is an externally visible function, and external users must not
+ * directly issue I/O to BDS nodes, instead going through BB functions (which
+ * then are the BDS I/O in-flight requests), so those users cannot create what
+ * counts as "BDS I/O requests" for the purpose of bds_io_in_flight.
+ */
 void blk_inc_in_flight(BlockBackend *blk)
 {
     IO_CODE();
@@ -1480,7 +1533,7 @@ static void error_callback_bh(void *opaque)
 {
     struct BlockBackendAIOCB *acb = opaque;
 
-    blk_dec_in_flight(acb->blk);
+    blk_dec_bds_io_in_flight(acb->blk);
     acb->common.cb(acb->common.opaque, acb->ret);
     qemu_aio_unref(acb);
 }
@@ -1492,7 +1545,12 @@ BlockAIOCB *blk_abort_aio_request(BlockBackend *blk,
     struct BlockBackendAIOCB *acb;
     IO_CODE();
 
-    blk_inc_in_flight(blk);
+    /*
+     * Will not actually submit BDS I/O, but will also not depend on queued
+     * requests, so treating it as a BDS I/O request is fine (and will allow the
+     * BH to be run when the BDS is drained, which some users may expect)
+     */
+    blk_inc_bds_io_in_flight(blk);
     acb = blk_aio_get(&block_backend_aiocb_info, blk, cb, opaque);
     acb->blk = blk;
     acb->ret = ret;
@@ -1524,8 +1582,16 @@ static const AIOCBInfo blk_aio_em_aiocb_info = {
 static void blk_aio_complete(BlkAioEmAIOCB *acb)
 {
     if (acb->has_returned) {
+        /*
+         * Calling blk_dec_bds_io_in_flight() after invoking the CB is a bit
+         * dangerous: We do not know what the CB does, so if it blocks waiting
+         * for a queued BB request, we can end up in a deadlock.  We just hope
+         * it will not do that.
+         * Some callers (test-bdrv-drain) expect that draining a BDS will lead
+         * to the completion CB being fully run, which is why we do this.
+         */
         acb->common.cb(acb->common.opaque, acb->rwco.ret);
-        blk_dec_in_flight(acb->rwco.blk);
+        blk_dec_bds_io_in_flight(acb->rwco.blk);
         qemu_aio_unref(acb);
     }
 }
@@ -1546,7 +1612,7 @@ static BlockAIOCB *blk_aio_prwv(BlockBackend *blk, int64_t offset,
     BlkAioEmAIOCB *acb;
     Coroutine *co;
 
-    blk_inc_in_flight(blk);
+    blk_inc_bds_io_in_flight(blk);
     acb = blk_aio_get(&blk_aio_em_aiocb_info, blk, cb, opaque);
     acb->rwco = (BlkRwCo) {
         .blk    = blk,
@@ -1672,7 +1738,7 @@ void blk_aio_cancel_async(BlockAIOCB *acb)
     bdrv_aio_cancel_async(acb);
 }
 
-/* To be called between exactly one pair of blk_inc/dec_in_flight() */
+/* To be called between exactly one pair of blk_inc/dec_bds_io_in_flight() */
 static int coroutine_fn
 blk_co_do_ioctl(BlockBackend *blk, unsigned long int req, void *buf)
 {
@@ -1694,9 +1760,9 @@ int coroutine_fn blk_co_ioctl(BlockBackend *blk, unsigned long int req,
     int ret;
     IO_OR_GS_CODE();
 
-    blk_inc_in_flight(blk);
+    blk_inc_bds_io_in_flight(blk);
     ret = blk_co_do_ioctl(blk, req, buf);
-    blk_dec_in_flight(blk);
+    blk_dec_bds_io_in_flight(blk);
 
     return ret;
 }
@@ -1718,7 +1784,7 @@ BlockAIOCB *blk_aio_ioctl(BlockBackend *blk, unsigned long int req, void *buf,
     return blk_aio_prwv(blk, req, 0, buf, blk_aio_ioctl_entry, 0, cb, opaque);
 }
 
-/* To be called between exactly one pair of blk_inc/dec_in_flight() */
+/* To be called between exactly one pair of blk_inc/dec_bds_io_in_flight() */
 static int coroutine_fn
 blk_co_do_pdiscard(BlockBackend *blk, int64_t offset, int64_t bytes)
 {
@@ -1760,14 +1826,14 @@ int coroutine_fn blk_co_pdiscard(BlockBackend *blk, int64_t offset,
     int ret;
     IO_OR_GS_CODE();
 
-    blk_inc_in_flight(blk);
+    blk_inc_bds_io_in_flight(blk);
     ret = blk_co_do_pdiscard(blk, offset, bytes);
-    blk_dec_in_flight(blk);
+    blk_dec_bds_io_in_flight(blk);
 
     return ret;
 }
 
-/* To be called between exactly one pair of blk_inc/dec_in_flight() */
+/* To be called between exactly one pair of blk_inc/dec_bds_io_in_flight() */
 static int coroutine_fn blk_co_do_flush(BlockBackend *blk)
 {
     IO_CODE();
@@ -1802,16 +1868,26 @@ int coroutine_fn blk_co_flush(BlockBackend *blk)
     int ret;
     IO_OR_GS_CODE();
 
-    blk_inc_in_flight(blk);
+    blk_inc_bds_io_in_flight(blk);
     ret = blk_co_do_flush(blk);
-    blk_dec_in_flight(blk);
+    blk_dec_bds_io_in_flight(blk);
 
     return ret;
 }
 
+static void blk_resume_queued_requests(BlockBackend *blk)
+{
+    assert(blk->quiesce_counter == 0 || blk->disable_request_queuing);
+
+    while (qemu_co_enter_next(&blk->queued_requests, NULL)) {
+        /* Resume all queued requests */
+    }
+}
+
 void blk_drain(BlockBackend *blk)
 {
     BlockDriverState *bs = blk_bs(blk);
+    bool disable_request_queuing;
     GLOBAL_STATE_CODE();
 
     if (bs) {
@@ -1819,10 +1895,21 @@ void blk_drain(BlockBackend *blk)
         bdrv_drained_begin(bs);
     }
 
+    /*
+     * We want blk_drain() to await all in-flight requests, including those that
+     * encompass and block on other potentially queuable requests.  Disable
+     * request queuing temporarily so we will not end in a deadlock.
+     */
+    disable_request_queuing = blk->disable_request_queuing;
+    blk_set_disable_request_queuing(blk, true);
+    blk_resume_queued_requests(blk);
+
     /* We may have -ENOMEDIUM completions in flight */
     AIO_WAIT_WHILE(blk_get_aio_context(blk),
                    qatomic_mb_read(&blk->in_flight) > 0);
 
+    blk_set_disable_request_queuing(blk, disable_request_queuing);
+
     if (bs) {
         bdrv_drained_end(bs);
         bdrv_unref(bs);
@@ -1839,12 +1926,25 @@ void blk_drain_all(void)
 
     while ((blk = blk_all_next(blk)) != NULL) {
         AioContext *ctx = blk_get_aio_context(blk);
+        bool disable_request_queuing;
 
         aio_context_acquire(ctx);
 
+        /*
+         * We want blk_drain_all() to await all in-flight requests, including
+         * those that encompass and block on other potentially queuable
+         * requests.  Disable request queuing temporarily so we will not end in
+         * a deadlock.
+         */
+        disable_request_queuing = blk->disable_request_queuing;
+        blk_set_disable_request_queuing(blk, true);
+        blk_resume_queued_requests(blk);
+
         /* We may have -ENOMEDIUM completions in flight */
         AIO_WAIT_WHILE(ctx, qatomic_mb_read(&blk->in_flight) > 0);
 
+        blk_set_disable_request_queuing(blk, disable_request_queuing);
+
         aio_context_release(ctx);
     }
 
@@ -2594,7 +2694,12 @@ static bool blk_root_drained_poll(BdrvChild *child)
     if (blk->dev_ops && blk->dev_ops->drained_poll) {
         busy = blk->dev_ops->drained_poll(blk->dev_opaque);
     }
-    return busy || !!blk->in_flight;
+
+    /*
+     * This is BdrvChild.drained_poll(), i.e. only invoked for BDS drains, so
+     * we must only await requests that may actually directly submit BDS I/O.
+     */
+    return busy || !!blk->bds_io_in_flight;
 }
 
 static void blk_root_drained_end(BdrvChild *child)
@@ -2609,9 +2714,7 @@ static void blk_root_drained_end(BdrvChild *child)
         if (blk->dev_ops && blk->dev_ops->drained_end) {
             blk->dev_ops->drained_end(blk->dev_opaque);
         }
-        while (qemu_co_enter_next(&blk->queued_requests, NULL)) {
-            /* Resume all queued requests */
-        }
+        blk_resume_queued_requests(blk);
     }
 }
 
-- 
2.39.1


