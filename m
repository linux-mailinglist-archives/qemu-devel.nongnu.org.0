Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82C93678727
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Jan 2023 21:05:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pK33a-0003sD-Rp; Mon, 23 Jan 2023 15:04:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pK33P-0003ns-5K
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 15:04:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pK33M-0005ip-1c
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 15:04:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674504265;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a38ePrpO98d+EwnW67WNcaJdZ+64WIiOIuLVudDG1eI=;
 b=ELbrxuN4vGDwEGLSLz/Ar1DwRwPhWAUCscH+fdu779oHMau9NDXcks2MKWKge7DqW3V1jS
 8Cu3vUaK6Rtg7ltvbxnvpstpNeTNQQYSmYHnC3DrLt7pVxiOtt8DIOinz7pRDKWW9dYWYd
 hOaS26yYop1iGubugeMvZ3i27hWri6M=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-453-GHs0CYxROK6GCHDy11MXMg-1; Mon, 23 Jan 2023 15:04:24 -0500
X-MC-Unique: GHs0CYxROK6GCHDy11MXMg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4707885C064;
 Mon, 23 Jan 2023 20:04:24 +0000 (UTC)
Received: from localhost (unknown [10.39.193.206])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A04D9401530E;
 Mon, 23 Jan 2023 20:04:23 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: Hanna Reitz <hreitz@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Fam Zheng <fam@euphon.net>, qemu-block@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Sergio Lopez <slp@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: [PULL 2/3] virtio-blk: simplify virtio_blk_dma_restart_cb()
Date: Mon, 23 Jan 2023 15:04:16 -0500
Message-Id: <20230123200417.169053-3-stefanha@redhat.com>
In-Reply-To: <20230123200417.169053-1-stefanha@redhat.com>
References: <20230123200417.169053-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
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

virtio_blk_dma_restart_cb() is tricky because the BH must deal with
virtio_blk_data_plane_start()/virtio_blk_data_plane_stop() being called.

There are two issues with the code:

1. virtio_blk_realize() should use qdev_add_vm_change_state_handler()
   instead of qemu_add_vm_change_state_handler(). This ensures the
   ordering with virtio_init()'s vm change state handler that calls
   virtio_blk_data_plane_start()/virtio_blk_data_plane_stop() is
   well-defined. Then blk's AioContext is guaranteed to be up-to-date in
   virtio_blk_dma_restart_cb() and it's no longer necessary to have a
   special case for virtio_blk_data_plane_start().

2. Only blk_drain() waits for virtio_blk_dma_restart_cb()'s
   blk_inc_in_flight() to be decremented. The bdrv_drain() family of
   functions do not wait for BlockBackend's in_flight counter to reach
   zero. virtio_blk_data_plane_stop() relies on blk_set_aio_context()'s
   implicit drain, but that's a bdrv_drain() and not a blk_drain().
   Note that virtio_blk_reset() already correctly relies on blk_drain().
   If virtio_blk_data_plane_stop() switches to blk_drain() then we can
   properly wait for pending virtio_blk_dma_restart_bh() calls.

Once these issues are taken care of the code becomes simpler. This
change is in preparation for multiple IOThreads in virtio-blk where we
need to clean up the multi-threading behavior.

I ran the reproducer from commit 49b44549ace7 ("virtio-blk: On restart,
process queued requests in the proper context") to check that there is
no regression.

Cc: Sergio Lopez <slp@redhat.com>
Cc: Kevin Wolf <kwolf@redhat.com>
Cc: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Message-id: 20221102182337.252202-1-stefanha@redhat.com
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 include/hw/virtio/virtio-blk.h  |  2 --
 hw/block/dataplane/virtio-blk.c | 17 +++++-------
 hw/block/virtio-blk.c           | 46 ++++++++++++++-------------------
 3 files changed, 26 insertions(+), 39 deletions(-)

diff --git a/include/hw/virtio/virtio-blk.h b/include/hw/virtio/virtio-blk.h
index 7f589b4146..dafec432ce 100644
--- a/include/hw/virtio/virtio-blk.h
+++ b/include/hw/virtio/virtio-blk.h
@@ -55,7 +55,6 @@ struct VirtIOBlock {
     VirtIODevice parent_obj;
     BlockBackend *blk;
     void *rq;
-    QEMUBH *bh;
     VirtIOBlkConf conf;
     unsigned short sector_mask;
     bool original_wce;
@@ -93,6 +92,5 @@ typedef struct MultiReqBuffer {
 } MultiReqBuffer;
 
 void virtio_blk_handle_vq(VirtIOBlock *s, VirtQueue *vq);
-void virtio_blk_process_queued_requests(VirtIOBlock *s, bool is_bh);
 
 #endif
diff --git a/hw/block/dataplane/virtio-blk.c b/hw/block/dataplane/virtio-blk.c
index 26f965cabc..b28d81737e 100644
--- a/hw/block/dataplane/virtio-blk.c
+++ b/hw/block/dataplane/virtio-blk.c
@@ -237,9 +237,6 @@ int virtio_blk_data_plane_start(VirtIODevice *vdev)
         goto fail_aio_context;
     }
 
-    /* Process queued requests before the ones in vring */
-    virtio_blk_process_queued_requests(vblk, false);
-
     /* Kick right away to begin processing requests already in vring */
     for (i = 0; i < nvqs; i++) {
         VirtQueue *vq = virtio_get_queue(s->vdev, i);
@@ -272,11 +269,6 @@ int virtio_blk_data_plane_start(VirtIODevice *vdev)
   fail_host_notifiers:
     k->set_guest_notifiers(qbus->parent, nvqs, false);
   fail_guest_notifiers:
-    /*
-     * If we failed to set up the guest notifiers queued requests will be
-     * processed on the main context.
-     */
-    virtio_blk_process_queued_requests(vblk, false);
     vblk->dataplane_disabled = true;
     s->starting = false;
     vblk->dataplane_started = true;
@@ -325,8 +317,13 @@ void virtio_blk_data_plane_stop(VirtIODevice *vdev)
     aio_context_acquire(s->ctx);
     aio_wait_bh_oneshot(s->ctx, virtio_blk_data_plane_stop_bh, s);
 
-    /* Drain and try to switch bs back to the QEMU main loop. If other users
-     * keep the BlockBackend in the iothread, that's ok */
+    /* Wait for virtio_blk_dma_restart_bh() and in flight I/O to complete */
+    blk_drain(s->conf->conf.blk);
+
+    /*
+     * Try to switch bs back to the QEMU main loop. If other users keep the
+     * BlockBackend in the iothread, that's ok
+     */
     blk_set_aio_context(s->conf->conf.blk, qemu_get_aio_context(), NULL);
 
     aio_context_release(s->ctx);
diff --git a/hw/block/virtio-blk.c b/hw/block/virtio-blk.c
index f717550fdc..1762517878 100644
--- a/hw/block/virtio-blk.c
+++ b/hw/block/virtio-blk.c
@@ -806,8 +806,10 @@ static void virtio_blk_handle_output(VirtIODevice *vdev, VirtQueue *vq)
     virtio_blk_handle_vq(s, vq);
 }
 
-void virtio_blk_process_queued_requests(VirtIOBlock *s, bool is_bh)
+static void virtio_blk_dma_restart_bh(void *opaque)
 {
+    VirtIOBlock *s = opaque;
+
     VirtIOBlockReq *req = s->rq;
     MultiReqBuffer mrb = {};
 
@@ -834,43 +836,27 @@ void virtio_blk_process_queued_requests(VirtIOBlock *s, bool is_bh)
     if (mrb.num_reqs) {
         virtio_blk_submit_multireq(s, &mrb);
     }
-    if (is_bh) {
-        blk_dec_in_flight(s->conf.conf.blk);
-    }
+
+    /* Paired with inc in virtio_blk_dma_restart_cb() */
+    blk_dec_in_flight(s->conf.conf.blk);
+
     aio_context_release(blk_get_aio_context(s->conf.conf.blk));
 }
 
-static void virtio_blk_dma_restart_bh(void *opaque)
-{
-    VirtIOBlock *s = opaque;
-
-    qemu_bh_delete(s->bh);
-    s->bh = NULL;
-
-    virtio_blk_process_queued_requests(s, true);
-}
-
 static void virtio_blk_dma_restart_cb(void *opaque, bool running,
                                       RunState state)
 {
     VirtIOBlock *s = opaque;
-    BusState *qbus = BUS(qdev_get_parent_bus(DEVICE(s)));
-    VirtioBusState *bus = VIRTIO_BUS(qbus);
 
     if (!running) {
         return;
     }
 
-    /*
-     * If ioeventfd is enabled, don't schedule the BH here as queued
-     * requests will be processed while starting the data plane.
-     */
-    if (!s->bh && !virtio_bus_ioeventfd_enabled(bus)) {
-        s->bh = aio_bh_new(blk_get_aio_context(s->conf.conf.blk),
-                           virtio_blk_dma_restart_bh, s);
-        blk_inc_in_flight(s->conf.conf.blk);
-        qemu_bh_schedule(s->bh);
-    }
+    /* Paired with dec in virtio_blk_dma_restart_bh() */
+    blk_inc_in_flight(s->conf.conf.blk);
+
+    aio_bh_schedule_oneshot(blk_get_aio_context(s->conf.conf.blk),
+            virtio_blk_dma_restart_bh, s);
 }
 
 static void virtio_blk_reset(VirtIODevice *vdev)
@@ -1213,7 +1199,13 @@ static void virtio_blk_device_realize(DeviceState *dev, Error **errp)
         return;
     }
 
-    s->change = qemu_add_vm_change_state_handler(virtio_blk_dma_restart_cb, s);
+    /*
+     * This must be after virtio_init() so virtio_blk_dma_restart_cb() gets
+     * called after ->start_ioeventfd() has already set blk's AioContext.
+     */
+    s->change =
+        qdev_add_vm_change_state_handler(dev, virtio_blk_dma_restart_cb, s);
+
     blk_ram_registrar_init(&s->blk_ram_registrar, s->blk);
     blk_set_dev_ops(s->blk, &virtio_block_ops, s);
 
-- 
2.39.0


