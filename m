Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C404858C5F0
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Aug 2022 11:53:48 +0200 (CEST)
Received: from localhost ([::1]:45764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oKzSF-0001Xo-Qs
	for lists+qemu-devel@lfdr.de; Mon, 08 Aug 2022 05:53:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oKzGo-0002E4-Te
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 05:41:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50903)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oKzGl-000285-2R
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 05:41:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659951714;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OiYqv0dTU+JJ31cB+P9SZi08XvbAsBISvQaWnLq0FWQ=;
 b=hLXdI+0WhlGbjorfQ/0P3XSZUffjxpYNs7vnom026K0sRnhDfMub3Vl8eaTeIqu923i/yM
 s4DTEoG4qX++F1KYiW1K22FCIcIXRJxB8q26NnIt0RIFJJ8EP7694vtH/sx6MirBx13xCW
 DH0G9Mm2sIQlqXppfJKetHqJgxzB2xo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-548-TemyiL8tNo-JqJfiWOpnww-1; Mon, 08 Aug 2022 05:41:52 -0400
X-MC-Unique: TemyiL8tNo-JqJfiWOpnww-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B23C53C1C03D;
 Mon,  8 Aug 2022 09:41:49 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7208A1121314;
 Mon,  8 Aug 2022 09:41:49 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-devel@nongnu.org, Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: [PATCH 2/2] virtio-blk: replace dataplane_start/stopping/started with
 enum
Date: Mon,  8 Aug 2022 05:41:47 -0400
Message-Id: <20220808094147.612472-3-eesposit@redhat.com>
In-Reply-To: <20220808094147.612472-1-eesposit@redhat.com>
References: <20220808094147.612472-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
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

Virtio-blk uses VirtIOBlockDataPlane and VirtIOBlock to keep track of
the dataplane flags. This is completely unnecessary, as both structures
are always accessed together and we can simplify the sages with an enum.

Read/write the enum atomically, as it can be read also by iothread
callbacks.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 hw/block/dataplane/virtio-blk.c | 24 +++++++++---------------
 hw/block/virtio-blk.c           |  9 +++++----
 include/hw/virtio/virtio-blk.h  |  2 +-
 3 files changed, 15 insertions(+), 20 deletions(-)

diff --git a/hw/block/dataplane/virtio-blk.c b/hw/block/dataplane/virtio-blk.c
index 49276e46f2..427f946859 100644
--- a/hw/block/dataplane/virtio-blk.c
+++ b/hw/block/dataplane/virtio-blk.c
@@ -27,9 +27,6 @@
 #include "qom/object_interfaces.h"
 
 struct VirtIOBlockDataPlane {
-    bool starting;
-    bool stopping;
-
     VirtIOBlkConf *conf;
     VirtIODevice *vdev;
     QEMUBH *bh;                     /* bh for guest notification */
@@ -145,7 +142,7 @@ void virtio_blk_data_plane_destroy(VirtIOBlockDataPlane *s)
     }
 
     vblk = VIRTIO_BLK(s->vdev);
-    assert(!vblk->dataplane_started);
+    assert(qatomic_read(&vblk->dataplane_state) != DATAPLANE_STARTED);
     g_free(s->batch_notify_vqs);
     qemu_bh_delete(s->bh);
     if (s->iothread) {
@@ -167,11 +164,11 @@ int virtio_blk_data_plane_start(VirtIODevice *vdev)
     Error *local_err = NULL;
     int r;
 
-    if (vblk->dataplane_started || s->starting) {
+    if (qatomic_read(&vblk->dataplane_state) <= DATAPLANE_STARTED) {
         return 0;
     }
 
-    s->starting = true;
+    qatomic_set(&vblk->dataplane_state, DATAPLANE_STARTING);
 
     if (!virtio_vdev_has_feature(vdev, VIRTIO_RING_F_EVENT_IDX)) {
         s->batch_notifications = true;
@@ -219,8 +216,7 @@ int virtio_blk_data_plane_start(VirtIODevice *vdev)
 
     memory_region_transaction_commit();
 
-    s->starting = false;
-    vblk->dataplane_started = true;
+    qatomic_set(&vblk->dataplane_state, DATAPLANE_STARTED);
     trace_virtio_blk_data_plane_start(s);
 
     old_context = blk_get_aio_context(s->conf->conf.blk);
@@ -273,8 +269,7 @@ int virtio_blk_data_plane_start(VirtIODevice *vdev)
      */
     virtio_blk_process_queued_requests(vblk, false);
     vblk->dataplane_disabled = true;
-    s->starting = false;
-    vblk->dataplane_started = true;
+    qatomic_set(&vblk->dataplane_state, DATAPLANE_STARTED);
     return -ENOSYS;
 }
 
@@ -304,17 +299,17 @@ void virtio_blk_data_plane_stop(VirtIODevice *vdev)
     unsigned i;
     unsigned nvqs = s->conf->num_queues;
 
-    if (!vblk->dataplane_started || s->stopping) {
+    if (qatomic_read(&vblk->dataplane_state) != DATAPLANE_STARTED) {
         return;
     }
 
     /* Better luck next time. */
     if (vblk->dataplane_disabled) {
         vblk->dataplane_disabled = false;
-        vblk->dataplane_started = false;
+        qatomic_set(&vblk->dataplane_state, DATAPLANE_STOPPED);
         return;
     }
-    s->stopping = true;
+    qatomic_set(&vblk->dataplane_state, DATAPLANE_STOPPING);
     trace_virtio_blk_data_plane_stop(s);
 
     aio_context_acquire(s->ctx);
@@ -352,6 +347,5 @@ void virtio_blk_data_plane_stop(VirtIODevice *vdev)
     /* Clean up guest notifier (irq) */
     k->set_guest_notifiers(qbus->parent, nvqs, false);
 
-    vblk->dataplane_started = false;
-    s->stopping = false;
+    qatomic_set(&vblk->dataplane_state, DATAPLANE_STOPPED);
 }
diff --git a/hw/block/virtio-blk.c b/hw/block/virtio-blk.c
index e9ba752f6b..a53c4a1063 100644
--- a/hw/block/virtio-blk.c
+++ b/hw/block/virtio-blk.c
@@ -84,7 +84,8 @@ static void virtio_blk_req_complete(VirtIOBlockReq *req, unsigned char status)
     iov_discard_undo(&req->inhdr_undo);
     iov_discard_undo(&req->outhdr_undo);
     virtqueue_push(req->vq, &req->elem, req->in_len);
-    if (s->dataplane_started && !s->dataplane_disabled) {
+    if (qatomic_read(&s->dataplane_state) == DATAPLANE_STARTED &&
+        !s->dataplane_disabled) {
         virtio_blk_data_plane_notify(s->dataplane, req->vq);
     } else {
         virtio_notify(vdev, req->vq);
@@ -807,7 +808,7 @@ static void virtio_blk_handle_output(VirtIODevice *vdev, VirtQueue *vq)
 {
     VirtIOBlock *s = (VirtIOBlock *)vdev;
 
-    if (s->dataplane && !s->dataplane_started) {
+    if (s->dataplane && qatomic_read(&s->dataplane_state) > DATAPLANE_STARTED) {
         /* Some guests kick before setting VIRTIO_CONFIG_S_DRIVER_OK so start
          * dataplane here instead of waiting for .set_status().
          */
@@ -907,7 +908,7 @@ static void virtio_blk_reset(VirtIODevice *vdev)
 
     aio_context_release(ctx);
 
-    assert(!s->dataplane_started);
+    assert(qatomic_read(&s->dataplane_state) != DATAPLANE_STARTED);
     blk_set_enable_write_cache(s->blk, s->original_wce);
 }
 
@@ -1033,7 +1034,7 @@ static void virtio_blk_set_status(VirtIODevice *vdev, uint8_t status)
     VirtIOBlock *s = VIRTIO_BLK(vdev);
 
     if (!(status & (VIRTIO_CONFIG_S_DRIVER | VIRTIO_CONFIG_S_DRIVER_OK))) {
-        assert(!s->dataplane_started);
+        assert(qatomic_read(&s->dataplane_state) != DATAPLANE_STARTED);
     }
 
     if (!(status & VIRTIO_CONFIG_S_DRIVER_OK)) {
diff --git a/include/hw/virtio/virtio-blk.h b/include/hw/virtio/virtio-blk.h
index d311c57cca..3ac66a1f77 100644
--- a/include/hw/virtio/virtio-blk.h
+++ b/include/hw/virtio/virtio-blk.h
@@ -60,7 +60,7 @@ struct VirtIOBlock {
     bool original_wce;
     VMChangeStateEntry *change;
     bool dataplane_disabled;
-    bool dataplane_started;
+    enum VirtIODataplaneStates dataplane_state;
     struct VirtIOBlockDataPlane *dataplane;
     uint64_t host_features;
     size_t config_size;
-- 
2.31.1


