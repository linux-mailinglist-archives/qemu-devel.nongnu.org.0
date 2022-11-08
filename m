Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC9EF621E75
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 22:21:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osW18-0005Si-Fy; Tue, 08 Nov 2022 16:20:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1osW0r-0005Dz-Lm
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 16:20:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1osW0o-0008Mx-Vl
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 16:20:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667942401;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9RCY8Qz/qZyTFpAQA++gtBamJYUsGWxTVCobEBscDbs=;
 b=KUqdXqVWeRSgxhSAoFH0EfuvHBA+SBUVBTT6/PRi7ssii8767VBcaqI21dqQPL9+2ptMrX
 e6nK+rb9fNKRbUN4IDO7npYqbI3V7uR/lZTxisOE+D/uc4Cpn9oolLPnnoS9TspgUsVD7F
 zJ9+WwkDJlmGjfn5Rvmmmx93abkNshE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-104-DX-b4_vCOTCD5GiHhMpVFg-1; Tue, 08 Nov 2022 16:19:58 -0500
X-MC-Unique: DX-b4_vCOTCD5GiHhMpVFg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 65FEC3C0E21A;
 Tue,  8 Nov 2022 21:19:56 +0000 (UTC)
Received: from localhost (unknown [10.39.192.85])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D7E232028CE4;
 Tue,  8 Nov 2022 21:19:55 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-block@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>,
 Stefan Hajnoczi <stefanha@redhat.com>
Subject: [PATCH 5/8] virtio-blk: mark IO_CODE functions
Date: Tue,  8 Nov 2022 16:19:27 -0500
Message-Id: <20221108211930.876142-6-stefanha@redhat.com>
In-Reply-To: <20221108211930.876142-1-stefanha@redhat.com>
References: <20221108211930.876142-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
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

From: Emanuele Giuseppe Esposito <eesposit@redhat.com>

Just as done in the block API, mark functions in virtio-blk
that are called also from iothread(s).

We know such functions are IO because many are blk_* callbacks,
running always in the device iothread, and remaining are propagated
from the leaf IO functions (if a function calls a IO_CODE function,
itself is categorized as IO_CODE too).

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20220609143727.1151816-7-eesposit@redhat.com>
---
 hw/block/dataplane/virtio-blk.c |  4 +++
 hw/block/virtio-blk.c           | 45 ++++++++++++++++++++++++++++-----
 2 files changed, 43 insertions(+), 6 deletions(-)

diff --git a/hw/block/dataplane/virtio-blk.c b/hw/block/dataplane/virtio-blk.c
index 728c9cd86c..3593ac0e7b 100644
--- a/hw/block/dataplane/virtio-blk.c
+++ b/hw/block/dataplane/virtio-blk.c
@@ -63,6 +63,8 @@ static void notify_guest_bh(void *opaque)
     unsigned long bitmap[BITS_TO_LONGS(nvqs)];
     unsigned j;
 
+    IO_CODE();
+
     memcpy(bitmap, s->batch_notify_vqs, sizeof(bitmap));
     memset(s->batch_notify_vqs, 0, sizeof(bitmap));
 
@@ -288,6 +290,8 @@ static void virtio_blk_data_plane_stop_bh(void *opaque)
     VirtIOBlockDataPlane *s = opaque;
     unsigned i;
 
+    IO_CODE();
+
     for (i = 0; i < s->conf->num_queues; i++) {
         VirtQueue *vq = virtio_get_queue(s->vdev, i);
 
diff --git a/hw/block/virtio-blk.c b/hw/block/virtio-blk.c
index 02b213a140..f8fcf25292 100644
--- a/hw/block/virtio-blk.c
+++ b/hw/block/virtio-blk.c
@@ -39,6 +39,8 @@
 static void virtio_blk_init_request(VirtIOBlock *s, VirtQueue *vq,
                                     VirtIOBlockReq *req)
 {
+    IO_CODE();
+
     req->dev = s;
     req->vq = vq;
     req->qiov.size = 0;
@@ -57,6 +59,8 @@ static void virtio_blk_req_complete(VirtIOBlockReq *req, unsigned char status)
     VirtIOBlock *s = req->dev;
     VirtIODevice *vdev = VIRTIO_DEVICE(s);
 
+    IO_CODE();
+
     trace_virtio_blk_req_complete(vdev, req, status);
 
     stb_p(&req->in->status, status);
@@ -76,6 +80,8 @@ static int virtio_blk_handle_rw_error(VirtIOBlockReq *req, int error,
     VirtIOBlock *s = req->dev;
     BlockErrorAction action = blk_get_error_action(s->blk, is_read, error);
 
+    IO_CODE();
+
     if (action == BLOCK_ERROR_ACTION_STOP) {
         /* Break the link as the next request is going to be parsed from the
          * ring again. Otherwise we may end up doing a double completion! */
@@ -143,7 +149,9 @@ static void virtio_blk_flush_complete(void *opaque, int ret)
     VirtIOBlockReq *req = opaque;
     VirtIOBlock *s = req->dev;
 
+    IO_CODE();
     aio_context_acquire(blk_get_aio_context(s->conf.conf.blk));
+
     if (ret) {
         if (virtio_blk_handle_rw_error(req, -ret, 0, true)) {
             goto out;
@@ -165,7 +173,9 @@ static void virtio_blk_discard_write_zeroes_complete(void *opaque, int ret)
     bool is_write_zeroes = (virtio_ldl_p(VIRTIO_DEVICE(s), &req->out.type) &
                             ~VIRTIO_BLK_T_BARRIER) == VIRTIO_BLK_T_WRITE_ZEROES;
 
+    IO_CODE();
     aio_context_acquire(blk_get_aio_context(s->conf.conf.blk));
+
     if (ret) {
         if (virtio_blk_handle_rw_error(req, -ret, false, is_write_zeroes)) {
             goto out;
@@ -198,6 +208,8 @@ static void virtio_blk_ioctl_complete(void *opaque, int status)
     struct virtio_scsi_inhdr *scsi;
     struct sg_io_hdr *hdr;
 
+    IO_CODE();
+
     scsi = (void *)req->elem.in_sg[req->elem.in_num - 2].iov_base;
 
     if (status) {
@@ -239,6 +251,8 @@ static VirtIOBlockReq *virtio_blk_get_request(VirtIOBlock *s, VirtQueue *vq)
 {
     VirtIOBlockReq *req = virtqueue_pop(vq, sizeof(VirtIOBlockReq));
 
+    IO_CODE();
+
     if (req) {
         virtio_blk_init_request(s, vq, req);
     }
@@ -259,6 +273,8 @@ static int virtio_blk_handle_scsi_req(VirtIOBlockReq *req)
     BlockAIOCB *acb;
 #endif
 
+    IO_CODE();
+
     /*
      * We require at least one output segment each for the virtio_blk_outhdr
      * and the SCSI command block.
@@ -357,6 +373,7 @@ fail:
 static void virtio_blk_handle_scsi(VirtIOBlockReq *req)
 {
     int status;
+    IO_CODE();
 
     status = virtio_blk_handle_scsi_req(req);
     if (status != -EINPROGRESS) {
@@ -374,6 +391,8 @@ static inline void submit_requests(VirtIOBlock *s, MultiReqBuffer *mrb,
     bool is_write = mrb->is_write;
     BdrvRequestFlags flags = 0;
 
+    IO_CODE();
+
     if (num_reqs > 1) {
         int i;
         struct iovec *tmp_iov = qiov->iov;
@@ -423,6 +442,8 @@ static int multireq_compare(const void *a, const void *b)
     const VirtIOBlockReq *req1 = *(VirtIOBlockReq **)a,
                          *req2 = *(VirtIOBlockReq **)b;
 
+    IO_CODE();
+
     /*
      * Note that we can't simply subtract sector_num1 from sector_num2
      * here as that could overflow the return value.
@@ -442,6 +463,8 @@ static void virtio_blk_submit_multireq(VirtIOBlock *s, MultiReqBuffer *mrb)
     uint32_t max_transfer;
     int64_t sector_num = 0;
 
+    IO_CODE();
+
     if (mrb->num_reqs == 1) {
         submit_requests(s, mrb, 0, 1, -1);
         mrb->num_reqs = 0;
@@ -491,6 +514,8 @@ static void virtio_blk_handle_flush(VirtIOBlockReq *req, MultiReqBuffer *mrb)
 {
     VirtIOBlock *s = req->dev;
 
+    IO_CODE();
+
     block_acct_start(blk_get_stats(s->blk), &req->acct, 0,
                      BLOCK_ACCT_FLUSH);
 
@@ -509,6 +534,8 @@ static bool virtio_blk_sect_range_ok(VirtIOBlock *dev,
     uint64_t nb_sectors = size >> BDRV_SECTOR_BITS;
     uint64_t total_sectors;
 
+    IO_CODE();
+
     if (nb_sectors > BDRV_REQUEST_MAX_SECTORS) {
         return false;
     }
@@ -535,6 +562,8 @@ static uint8_t virtio_blk_handle_discard_write_zeroes(VirtIOBlockReq *req,
     uint8_t err_status;
     int bytes;
 
+    IO_CODE();
+
     sector = virtio_ldq_p(vdev, &dwz_hdr->sector);
     num_sectors = virtio_ldl_p(vdev, &dwz_hdr->num_sectors);
     flags = virtio_ldl_p(vdev, &dwz_hdr->flags);
@@ -613,6 +642,8 @@ static int virtio_blk_handle_request(VirtIOBlockReq *req, MultiReqBuffer *mrb)
     VirtIOBlock *s = req->dev;
     VirtIODevice *vdev = VIRTIO_DEVICE(s);
 
+    IO_CODE();
+
     if (req->elem.out_num < 1 || req->elem.in_num < 1) {
         virtio_error(vdev, "virtio-blk missing headers");
         return -1;
@@ -763,6 +794,8 @@ void virtio_blk_handle_vq(VirtIOBlock *s, VirtQueue *vq)
     MultiReqBuffer mrb = {};
     bool suppress_notifications = virtio_queue_get_notification(vq);
 
+    IO_CODE();
+
     aio_context_acquire(blk_get_aio_context(s->blk));
     blk_io_plug(s->blk);
 
@@ -796,6 +829,8 @@ static void virtio_blk_handle_output(VirtIODevice *vdev, VirtQueue *vq)
 {
     VirtIOBlock *s = (VirtIOBlock *)vdev;
 
+    IO_CODE();
+
     if (s->dataplane && !s->dataplane_started) {
         /* Some guests kick before setting VIRTIO_CONFIG_S_DRIVER_OK so start
          * dataplane here instead of waiting for .set_status().
@@ -846,8 +881,9 @@ static void virtio_blk_dma_restart_bh(void *opaque)
 }
 
 /*
- * Only called when VM is started or stopped in cpus.c.
- * No iothread runs in parallel
+ * Only called when VM is started or stopped in cpus.c. When running is true
+ * ->start_ioeventfd() has already been called. When running is false
+ * ->stop_ioeventfd() has not yet been called.
  */
 static void virtio_blk_dma_restart_cb(void *opaque, bool running,
                                       RunState state)
@@ -867,6 +903,7 @@ static void virtio_blk_dma_restart_cb(void *opaque, bool running,
             virtio_blk_dma_restart_bh, s);
 }
 
+/* ->stop_ioeventfd() has already been called by virtio_bus_reset() */
 static void virtio_blk_reset(VirtIODevice *vdev)
 {
     VirtIOBlock *s = VIRTIO_BLK(vdev);
@@ -877,10 +914,6 @@ static void virtio_blk_reset(VirtIODevice *vdev)
 
     ctx = blk_get_aio_context(s->blk);
     aio_context_acquire(ctx);
-    /*
-     * This drain together with ->stop_ioeventfd() in virtio_pci_reset()
-     * stops all Iothreads.
-     */
     blk_drain(s->blk);
 
     /* We drop queued requests after blk_drain() because blk_drain() itself can
-- 
2.38.1


