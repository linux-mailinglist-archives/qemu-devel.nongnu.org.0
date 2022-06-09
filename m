Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8760E54505A
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 17:14:30 +0200 (CEST)
Received: from localhost ([::1]:59382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzJrh-0000yY-GD
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 11:14:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nzJI6-0002Nb-2l
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 10:37:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35492)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nzJI2-00071x-Lb
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 10:37:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654785457;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=c1UwygJ8YnIPm+pDdNgiVSqRTl6Qaq4CDead5RjXiU0=;
 b=b+NkeJV3odDTY3h3yf9fVyqXUHiyt3vFYzUEtvn+UFAxkjRwNM+fpUP3hypFgX4vgU6HZK
 RMh9luQZZwRrNI2e8uhaWdYjNDiVoywLxoauqvEb9eFP0raUK3ckhjpJI7n6rpcQ1rTpzB
 MHFrZoxsZmvxBvkzAHNeMqvnvQRmaMw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-295-7LFewbqIMcy8gySz9NqqwQ-1; Thu, 09 Jun 2022 10:37:34 -0400
X-MC-Unique: 7LFewbqIMcy8gySz9NqqwQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 41E4B800971;
 Thu,  9 Jun 2022 14:37:34 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 02668492C3B;
 Thu,  9 Jun 2022 14:37:33 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Fam Zheng <fam@euphon.net>, qemu-devel@nongnu.org,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: [PATCH 7/8] VirtIOBlock: protect rq with its own lock
Date: Thu,  9 Jun 2022 10:37:26 -0400
Message-Id: <20220609143727.1151816-8-eesposit@redhat.com>
In-Reply-To: <20220609143727.1151816-1-eesposit@redhat.com>
References: <20220609143727.1151816-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
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

s->rq is pointing to the the VirtIOBlockReq list, and this list is
read/written in:

virtio_blk_reset = main loop, but caller calls ->stop_ioeventfd() and
drains, so no iothread runs in parallel
virtio_blk_save_device = main loop, but VM is stopped (migration), so
iothread has no work on request list
virtio_blk_load_device = same as save_device
virtio_blk_device_realize = iothread is not created yet
virtio_blk_handle_rw_error = io, here is why we need synchronization.
s is device state and is shared accross all queues. Right now there
is no problem, because iothread and main loop never access it at
the same time, but if we introduce 1 iothread -> n virtqueue and
1 virtqueue -> 1 iothread mapping we might have two iothreads
accessing the list at the same time
virtio_blk_process_queued_requests: io, same problem as above.

Therefore we need a virtio-blk to protect s->rq list.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 hw/block/virtio-blk.c          | 38 ++++++++++++++++++++++++++--------
 include/hw/virtio/virtio-blk.h |  5 ++++-
 2 files changed, 33 insertions(+), 10 deletions(-)

diff --git a/hw/block/virtio-blk.c b/hw/block/virtio-blk.c
index e1aaa606ba..88c61457e1 100644
--- a/hw/block/virtio-blk.c
+++ b/hw/block/virtio-blk.c
@@ -109,8 +109,10 @@ static int virtio_blk_handle_rw_error(VirtIOBlockReq *req, int error,
         /* Break the link as the next request is going to be parsed from the
          * ring again. Otherwise we may end up doing a double completion! */
         req->mr_next = NULL;
-        req->next = s->rq;
-        s->rq = req;
+        WITH_QEMU_LOCK_GUARD(&s->req_mutex) {
+            req->next = s->rq;
+            s->rq = req;
+        }
     } else if (action == BLOCK_ERROR_ACTION_REPORT) {
         virtio_blk_req_complete(req, VIRTIO_BLK_S_IOERR);
         if (acct_failed) {
@@ -860,10 +862,16 @@ static void virtio_blk_handle_output(VirtIODevice *vdev, VirtQueue *vq)
 
 void virtio_blk_process_queued_requests(VirtIOBlock *s, bool is_bh)
 {
-    VirtIOBlockReq *req = s->rq;
+    VirtIOBlockReq *req;
     MultiReqBuffer mrb = {};
 
-    s->rq = NULL;
+    IO_CODE();
+
+    /* Detach queue from s->rq and process everything here */
+    WITH_QEMU_LOCK_GUARD(&s->req_mutex) {
+        req = s->rq;
+        s->rq = NULL;
+    }
 
     aio_context_acquire(blk_get_aio_context(s->conf.conf.blk));
     while (req) {
@@ -896,6 +904,7 @@ void virtio_blk_restart_bh(void *opaque)
 {
     VirtIOBlock *s = opaque;
 
+    IO_CODE();
     qemu_bh_delete(s->bh);
     s->bh = NULL;
 
@@ -946,17 +955,20 @@ static void virtio_blk_reset(VirtIODevice *vdev)
      * stops all Iothreads.
      */
     blk_drain(s->blk);
+    aio_context_release(ctx);
 
     /* We drop queued requests after blk_drain() because blk_drain() itself can
      * produce them. */
+    qemu_mutex_lock(&s->req_mutex);
     while (s->rq) {
         req = s->rq;
         s->rq = req->next;
+        qemu_mutex_unlock(&s->req_mutex);
         virtqueue_detach_element(req->vq, &req->elem, 0);
         virtio_blk_free_request(req);
+        qemu_mutex_lock(&s->req_mutex);
     }
-
-    aio_context_release(ctx);
+    qemu_mutex_unlock(&s->req_mutex);
 
     assert(!s->dataplane_started);
     blk_set_enable_write_cache(s->blk, s->original_wce);
@@ -1120,10 +1132,14 @@ static void virtio_blk_set_status(VirtIODevice *vdev, uint8_t status)
 static void virtio_blk_save_device(VirtIODevice *vdev, QEMUFile *f)
 {
     VirtIOBlock *s = VIRTIO_BLK(vdev);
-    VirtIOBlockReq *req = s->rq;
+    VirtIOBlockReq *req;
 
     GLOBAL_STATE_CODE();
 
+    WITH_QEMU_LOCK_GUARD(&s->req_mutex) {
+        req = s->rq;
+    }
+
     while (req) {
         qemu_put_sbyte(f, 1);
 
@@ -1165,8 +1181,10 @@ static int virtio_blk_load_device(VirtIODevice *vdev, QEMUFile *f,
 
         req = qemu_get_virtqueue_element(vdev, f, sizeof(VirtIOBlockReq));
         virtio_blk_init_request(s, virtio_get_queue(vdev, vq_idx), req);
-        req->next = s->rq;
-        s->rq = req;
+        WITH_QEMU_LOCK_GUARD(&s->req_mutex) {
+            req->next = s->rq;
+            s->rq = req;
+        }
     }
 
     return 0;
@@ -1272,6 +1290,7 @@ static void virtio_blk_device_realize(DeviceState *dev, Error **errp)
 
     virtio_init(vdev, VIRTIO_ID_BLOCK, s->config_size);
 
+    qemu_mutex_init(&s->req_mutex);
     s->blk = conf->conf.blk;
     s->rq = NULL;
     s->sector_mask = (s->conf.conf.logical_block_size / BDRV_SECTOR_SIZE) - 1;
@@ -1318,6 +1337,7 @@ static void virtio_blk_device_unrealize(DeviceState *dev)
     qemu_coroutine_dec_pool_size(conf->num_queues * conf->queue_size / 2);
     qemu_del_vm_change_state_handler(s->change);
     blockdev_mark_auto_del(s->blk);
+    qemu_mutex_destroy(&s->req_mutex);
     virtio_cleanup(vdev);
 }
 
diff --git a/include/hw/virtio/virtio-blk.h b/include/hw/virtio/virtio-blk.h
index c334353b5a..5cb59994a8 100644
--- a/include/hw/virtio/virtio-blk.h
+++ b/include/hw/virtio/virtio-blk.h
@@ -53,7 +53,6 @@ struct VirtIOBlockReq;
 struct VirtIOBlock {
     VirtIODevice parent_obj;
     BlockBackend *blk;
-    void *rq;
     QEMUBH *bh;
     VirtIOBlkConf conf;
     unsigned short sector_mask;
@@ -64,6 +63,10 @@ struct VirtIOBlock {
     struct VirtIOBlockDataPlane *dataplane;
     uint64_t host_features;
     size_t config_size;
+
+    /* While the VM is running, req_mutex protects rq.  */
+    QemuMutex req_mutex;
+    struct VirtIOBlockReq *rq;
 };
 
 typedef struct VirtIOBlockReq {
-- 
2.31.1


