Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DA5A545131
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 17:47:28 +0200 (CEST)
Received: from localhost ([::1]:42488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzKNb-0008VR-Hq
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 11:47:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nzJI6-0002NZ-2B
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 10:37:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48248)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nzJI2-00071j-1n
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 10:37:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654785457;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=56RDwimlowcod/O5Db9ZCFURPLNvheu/kk7txq6LWVI=;
 b=dt+5kvfSjVnHmsc1B84kF5MpB27sTXJ59bGoWYXGf4ZZq3i3cijvXcJ4t9w6Ks90ZywnUu
 zhquW9zCEy9YXCtzfjqL4QVdtW0e0U7if1R9Tr7PWJ4fAROsMj0fqBk2OybIdBQ0gm/FwX
 rmMb3gJFn2lkp9VMWKn6qyx8uED0Ctk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-136-D2COB63SNYefyrI3caRWpg-1; Thu, 09 Jun 2022 10:37:34 -0400
X-MC-Unique: D2COB63SNYefyrI3caRWpg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EEB01294EDE2;
 Thu,  9 Jun 2022 14:37:33 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AEB00492C3B;
 Thu,  9 Jun 2022 14:37:33 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Fam Zheng <fam@euphon.net>, qemu-devel@nongnu.org,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: [PATCH 6/8] virtio-blk: mark IO_CODE functions
Date: Thu,  9 Jun 2022 10:37:25 -0400
Message-Id: <20220609143727.1151816-7-eesposit@redhat.com>
In-Reply-To: <20220609143727.1151816-1-eesposit@redhat.com>
References: <20220609143727.1151816-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Just as done in the block API, mark functions in virtio-blk
that are called also from iothread(s).

We know such functions are IO because many are blk_* callbacks,
running always in the device iothread, and remaining are propagated
from the leaf IO functions (if a function calls a IO_CODE function,
itself is categorized as IO_CODE too).

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 hw/block/dataplane/virtio-blk.c |  4 ++++
 hw/block/virtio-blk.c           | 35 +++++++++++++++++++++++++++++++++
 2 files changed, 39 insertions(+)

diff --git a/hw/block/dataplane/virtio-blk.c b/hw/block/dataplane/virtio-blk.c
index bda6b3e8de..9dc6347350 100644
--- a/hw/block/dataplane/virtio-blk.c
+++ b/hw/block/dataplane/virtio-blk.c
@@ -63,6 +63,8 @@ static void notify_guest_bh(void *opaque)
     unsigned long bitmap[BITS_TO_LONGS(nvqs)];
     unsigned j;
 
+    IO_CODE();
+
     memcpy(bitmap, s->batch_notify_vqs, sizeof(bitmap));
     memset(s->batch_notify_vqs, 0, sizeof(bitmap));
 
@@ -299,6 +301,8 @@ static void virtio_blk_data_plane_stop_bh(void *opaque)
     VirtIOBlockDataPlane *s = opaque;
     unsigned i;
 
+    IO_CODE();
+
     for (i = 0; i < s->conf->num_queues; i++) {
         VirtQueue *vq = virtio_get_queue(s->vdev, i);
 
diff --git a/hw/block/virtio-blk.c b/hw/block/virtio-blk.c
index 2eb0408f92..e1aaa606ba 100644
--- a/hw/block/virtio-blk.c
+++ b/hw/block/virtio-blk.c
@@ -62,6 +62,8 @@ static void virtio_blk_set_config_size(VirtIOBlock *s, uint64_t host_features)
 static void virtio_blk_init_request(VirtIOBlock *s, VirtQueue *vq,
                                     VirtIOBlockReq *req)
 {
+    IO_CODE();
+
     req->dev = s;
     req->vq = vq;
     req->qiov.size = 0;
@@ -80,6 +82,8 @@ static void virtio_blk_req_complete(VirtIOBlockReq *req, unsigned char status)
     VirtIOBlock *s = req->dev;
     VirtIODevice *vdev = VIRTIO_DEVICE(s);
 
+    IO_CODE();
+
     trace_virtio_blk_req_complete(vdev, req, status);
 
     stb_p(&req->in->status, status);
@@ -99,6 +103,8 @@ static int virtio_blk_handle_rw_error(VirtIOBlockReq *req, int error,
     VirtIOBlock *s = req->dev;
     BlockErrorAction action = blk_get_error_action(s->blk, is_read, error);
 
+    IO_CODE();
+
     if (action == BLOCK_ERROR_ACTION_STOP) {
         /* Break the link as the next request is going to be parsed from the
          * ring again. Otherwise we may end up doing a double completion! */
@@ -166,7 +172,9 @@ static void virtio_blk_flush_complete(void *opaque, int ret)
     VirtIOBlockReq *req = opaque;
     VirtIOBlock *s = req->dev;
 
+    IO_CODE();
     aio_context_acquire(blk_get_aio_context(s->conf.conf.blk));
+
     if (ret) {
         if (virtio_blk_handle_rw_error(req, -ret, 0, true)) {
             goto out;
@@ -188,7 +196,9 @@ static void virtio_blk_discard_write_zeroes_complete(void *opaque, int ret)
     bool is_write_zeroes = (virtio_ldl_p(VIRTIO_DEVICE(s), &req->out.type) &
                             ~VIRTIO_BLK_T_BARRIER) == VIRTIO_BLK_T_WRITE_ZEROES;
 
+    IO_CODE();
     aio_context_acquire(blk_get_aio_context(s->conf.conf.blk));
+
     if (ret) {
         if (virtio_blk_handle_rw_error(req, -ret, false, is_write_zeroes)) {
             goto out;
@@ -221,6 +231,8 @@ static void virtio_blk_ioctl_complete(void *opaque, int status)
     struct virtio_scsi_inhdr *scsi;
     struct sg_io_hdr *hdr;
 
+    IO_CODE();
+
     scsi = (void *)req->elem.in_sg[req->elem.in_num - 2].iov_base;
 
     if (status) {
@@ -262,6 +274,8 @@ static VirtIOBlockReq *virtio_blk_get_request(VirtIOBlock *s, VirtQueue *vq)
 {
     VirtIOBlockReq *req = virtqueue_pop(vq, sizeof(VirtIOBlockReq));
 
+    IO_CODE();
+
     if (req) {
         virtio_blk_init_request(s, vq, req);
     }
@@ -282,6 +296,8 @@ static int virtio_blk_handle_scsi_req(VirtIOBlockReq *req)
     BlockAIOCB *acb;
 #endif
 
+    IO_CODE();
+
     /*
      * We require at least one output segment each for the virtio_blk_outhdr
      * and the SCSI command block.
@@ -380,6 +396,7 @@ fail:
 static void virtio_blk_handle_scsi(VirtIOBlockReq *req)
 {
     int status;
+    IO_CODE();
 
     status = virtio_blk_handle_scsi_req(req);
     if (status != -EINPROGRESS) {
@@ -395,6 +412,8 @@ static inline void submit_requests(BlockBackend *blk, MultiReqBuffer *mrb,
     int64_t sector_num = mrb->reqs[start]->sector_num;
     bool is_write = mrb->is_write;
 
+    IO_CODE();
+
     if (num_reqs > 1) {
         int i;
         struct iovec *tmp_iov = qiov->iov;
@@ -438,6 +457,8 @@ static int multireq_compare(const void *a, const void *b)
     const VirtIOBlockReq *req1 = *(VirtIOBlockReq **)a,
                          *req2 = *(VirtIOBlockReq **)b;
 
+    IO_CODE();
+
     /*
      * Note that we can't simply subtract sector_num1 from sector_num2
      * here as that could overflow the return value.
@@ -457,6 +478,8 @@ static void virtio_blk_submit_multireq(BlockBackend *blk, MultiReqBuffer *mrb)
     uint32_t max_transfer;
     int64_t sector_num = 0;
 
+    IO_CODE();
+
     if (mrb->num_reqs == 1) {
         submit_requests(blk, mrb, 0, 1, -1);
         mrb->num_reqs = 0;
@@ -506,6 +529,8 @@ static void virtio_blk_handle_flush(VirtIOBlockReq *req, MultiReqBuffer *mrb)
 {
     VirtIOBlock *s = req->dev;
 
+    IO_CODE();
+
     block_acct_start(blk_get_stats(s->blk), &req->acct, 0,
                      BLOCK_ACCT_FLUSH);
 
@@ -524,6 +549,8 @@ static bool virtio_blk_sect_range_ok(VirtIOBlock *dev,
     uint64_t nb_sectors = size >> BDRV_SECTOR_BITS;
     uint64_t total_sectors;
 
+    IO_CODE();
+
     if (nb_sectors > BDRV_REQUEST_MAX_SECTORS) {
         return false;
     }
@@ -550,6 +577,8 @@ static uint8_t virtio_blk_handle_discard_write_zeroes(VirtIOBlockReq *req,
     uint8_t err_status;
     int bytes;
 
+    IO_CODE();
+
     sector = virtio_ldq_p(vdev, &dwz_hdr->sector);
     num_sectors = virtio_ldl_p(vdev, &dwz_hdr->num_sectors);
     flags = virtio_ldl_p(vdev, &dwz_hdr->flags);
@@ -628,6 +657,8 @@ static int virtio_blk_handle_request(VirtIOBlockReq *req, MultiReqBuffer *mrb)
     VirtIOBlock *s = req->dev;
     VirtIODevice *vdev = VIRTIO_DEVICE(s);
 
+    IO_CODE();
+
     if (req->elem.out_num < 1 || req->elem.in_num < 1) {
         virtio_error(vdev, "virtio-blk missing headers");
         return -1;
@@ -778,6 +809,8 @@ void virtio_blk_handle_vq(VirtIOBlock *s, VirtQueue *vq)
     MultiReqBuffer mrb = {};
     bool suppress_notifications = virtio_queue_get_notification(vq);
 
+    IO_CODE();
+
     aio_context_acquire(blk_get_aio_context(s->blk));
     blk_io_plug(s->blk);
 
@@ -811,6 +844,8 @@ static void virtio_blk_handle_output(VirtIODevice *vdev, VirtQueue *vq)
 {
     VirtIOBlock *s = (VirtIOBlock *)vdev;
 
+    IO_CODE();
+
     if (s->dataplane && !s->dataplane_started) {
         /* Some guests kick before setting VIRTIO_CONFIG_S_DRIVER_OK so start
          * dataplane here instead of waiting for .set_status().
-- 
2.31.1


