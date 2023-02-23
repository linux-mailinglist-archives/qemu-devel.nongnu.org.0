Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 496036A0FD9
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 19:55:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVGhm-00076G-91; Thu, 23 Feb 2023 13:52:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pVGhZ-0006zB-7C
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 13:52:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pVGhW-0003EV-PH
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 13:52:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677178338;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YkCmyw0pDtYMagunRFX0qUCfWPHTOPKsHXude52+u7Y=;
 b=h3U5+713w8BcEq+eTawwYCeX3qdqxT5Gg6SROM39ZRO6/Pvwx2xxKbQkWN8y7k8uHMvPT3
 QIal2CucwaFmNbVmPna+WMKefA+JgYRYs3LylljrYl62yCeaUgp7lK8QdIZFsNy8VmpG7l
 jXCTydBLkDiQN/jBzTcZbfq+CPaafkk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-490-OKjnTxW0MASuz0JzWcTuQA-1; Thu, 23 Feb 2023 13:52:15 -0500
X-MC-Unique: OKjnTxW0MASuz0JzWcTuQA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A27171816EC0;
 Thu, 23 Feb 2023 18:52:14 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.192.128])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ECB691121314;
 Thu, 23 Feb 2023 18:52:13 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 25/29] dma-helpers: prevent dma_blk_cb() vs dma_aio_cancel()
 race
Date: Thu, 23 Feb 2023 19:51:42 +0100
Message-Id: <20230223185146.306454-26-kwolf@redhat.com>
In-Reply-To: <20230223185146.306454-1-kwolf@redhat.com>
References: <20230223185146.306454-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

From: Stefan Hajnoczi <stefanha@redhat.com>

dma_blk_cb() only takes the AioContext lock around ->io_func(). That
means the rest of dma_blk_cb() is not protected. In particular, the
DMAAIOCB field accesses happen outside the lock.

There is a race when the main loop thread holds the AioContext lock and
invokes scsi_device_purge_requests() -> bdrv_aio_cancel() ->
dma_aio_cancel() while an IOThread executes dma_blk_cb(). The dbs->acb
field determines how cancellation proceeds. If dma_aio_cancel() sees
dbs->acb == NULL while dma_blk_cb() is still running, the request can be
completed twice (-ECANCELED and the actual return value).

The following assertion can occur with virtio-scsi when an IOThread is
used:

  ../hw/scsi/scsi-disk.c:368: scsi_dma_complete: Assertion `r->req.aiocb != NULL' failed.

Fix the race by holding the AioContext across dma_blk_cb(). Now
dma_aio_cancel() under the AioContext lock will not see
inconsistent/intermediate states.

Cc: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20230221212218.1378734-3-stefanha@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 hw/scsi/scsi-disk.c   |  4 +---
 softmmu/dma-helpers.c | 12 +++++++-----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/hw/scsi/scsi-disk.c b/hw/scsi/scsi-disk.c
index 115584f8b9..97c9b1c8cd 100644
--- a/hw/scsi/scsi-disk.c
+++ b/hw/scsi/scsi-disk.c
@@ -354,13 +354,12 @@ done:
     scsi_req_unref(&r->req);
 }
 
+/* Called with AioContext lock held */
 static void scsi_dma_complete(void *opaque, int ret)
 {
     SCSIDiskReq *r = (SCSIDiskReq *)opaque;
     SCSIDiskState *s = DO_UPCAST(SCSIDiskState, qdev, r->req.dev);
 
-    aio_context_acquire(blk_get_aio_context(s->qdev.conf.blk));
-
     assert(r->req.aiocb != NULL);
     r->req.aiocb = NULL;
 
@@ -370,7 +369,6 @@ static void scsi_dma_complete(void *opaque, int ret)
         block_acct_done(blk_get_stats(s->qdev.conf.blk), &r->acct);
     }
     scsi_dma_complete_noio(r, ret);
-    aio_context_release(blk_get_aio_context(s->qdev.conf.blk));
 }
 
 static void scsi_read_complete_noio(SCSIDiskReq *r, int ret)
diff --git a/softmmu/dma-helpers.c b/softmmu/dma-helpers.c
index 7820fec54c..2463964805 100644
--- a/softmmu/dma-helpers.c
+++ b/softmmu/dma-helpers.c
@@ -113,17 +113,19 @@ static void dma_complete(DMAAIOCB *dbs, int ret)
 static void dma_blk_cb(void *opaque, int ret)
 {
     DMAAIOCB *dbs = (DMAAIOCB *)opaque;
+    AioContext *ctx = dbs->ctx;
     dma_addr_t cur_addr, cur_len;
     void *mem;
 
     trace_dma_blk_cb(dbs, ret);
 
+    aio_context_acquire(ctx);
     dbs->acb = NULL;
     dbs->offset += dbs->iov.size;
 
     if (dbs->sg_cur_index == dbs->sg->nsg || ret < 0) {
         dma_complete(dbs, ret);
-        return;
+        goto out;
     }
     dma_blk_unmap(dbs);
 
@@ -164,9 +166,9 @@ static void dma_blk_cb(void *opaque, int ret)
 
     if (dbs->iov.size == 0) {
         trace_dma_map_wait(dbs);
-        dbs->bh = aio_bh_new(dbs->ctx, reschedule_dma, dbs);
+        dbs->bh = aio_bh_new(ctx, reschedule_dma, dbs);
         cpu_register_map_client(dbs->bh);
-        return;
+        goto out;
     }
 
     if (!QEMU_IS_ALIGNED(dbs->iov.size, dbs->align)) {
@@ -174,11 +176,11 @@ static void dma_blk_cb(void *opaque, int ret)
                                 QEMU_ALIGN_DOWN(dbs->iov.size, dbs->align));
     }
 
-    aio_context_acquire(dbs->ctx);
     dbs->acb = dbs->io_func(dbs->offset, &dbs->iov,
                             dma_blk_cb, dbs, dbs->io_func_opaque);
-    aio_context_release(dbs->ctx);
     assert(dbs->acb);
+out:
+    aio_context_release(ctx);
 }
 
 static void dma_aio_cancel(BlockAIOCB *acb)
-- 
2.39.2


