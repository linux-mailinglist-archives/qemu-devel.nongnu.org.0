Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3339558C5D3
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Aug 2022 11:45:52 +0200 (CEST)
Received: from localhost ([::1]:40648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oKzKZ-0006B1-4P
	for lists+qemu-devel@lfdr.de; Mon, 08 Aug 2022 05:45:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oKzGq-0002Hr-ME
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 05:42:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45476)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oKzGl-00028F-Eh
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 05:42:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659951714;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xAYak5xISBrG0fzjtt9l9bbKj5pcVt7y3boV/Ob/Jt4=;
 b=NC/amDy4S7uV+KoBj5LGnji+eVm87LKG7cGngmIpLlUOFzMZuN8pc3N+FAfQA6sWprB1gl
 CWZ2vdgWcSAxTcKUNFp4ZEHheav8hBmCageXysxjy1vZvnB29W52bxssqacYmHgLci1vM1
 P+sPdqRrPlYfQ9zoumMNslDgTHQLNu4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-492-0dE4w5ZRONGDIpiG0tGrwg-1; Mon, 08 Aug 2022 05:41:51 -0400
X-MC-Unique: 0dE4w5ZRONGDIpiG0tGrwg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 69E88801585;
 Mon,  8 Aug 2022 09:41:49 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2C9E91121315;
 Mon,  8 Aug 2022 09:41:49 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-devel@nongnu.org, Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: [PATCH 1/2] virtio-scsi: replace VirtIOBlock
 dataplane_{start/starting/stopped} with enum
Date: Mon,  8 Aug 2022 05:41:46 -0400
Message-Id: <20220808094147.612472-2-eesposit@redhat.com>
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

Simplify the various dataplane stages in dataplane_start/stop by using
a single enum instead of having multiple flags.

Read/write the enum atomically, as it can be read also by iothread
callbacks.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 hw/scsi/virtio-scsi-dataplane.c | 21 +++++++++------------
 hw/scsi/virtio-scsi.c           | 10 ++++++----
 include/hw/virtio/virtio-scsi.h |  5 ++---
 include/hw/virtio/virtio.h      |  7 +++++++
 4 files changed, 24 insertions(+), 19 deletions(-)

diff --git a/hw/scsi/virtio-scsi-dataplane.c b/hw/scsi/virtio-scsi-dataplane.c
index a575c3f0cd..9ad73e3e19 100644
--- a/hw/scsi/virtio-scsi-dataplane.c
+++ b/hw/scsi/virtio-scsi-dataplane.c
@@ -106,13 +106,12 @@ int virtio_scsi_dataplane_start(VirtIODevice *vdev)
     VirtIOSCSICommon *vs = VIRTIO_SCSI_COMMON(vdev);
     VirtIOSCSI *s = VIRTIO_SCSI(vdev);
 
-    if (s->dataplane_started ||
-        s->dataplane_starting ||
+    if (qatomic_read(&s->dataplane_state) <= DATAPLANE_STARTED ||
         s->dataplane_fenced) {
         return 0;
     }
 
-    s->dataplane_starting = true;
+    qatomic_set(&s->dataplane_state, DATAPLANE_STARTING);
 
     /* Set up guest notifier (irq) */
     rc = k->set_guest_notifiers(qbus->parent, vs->conf.num_queues + 2, true);
@@ -151,8 +150,7 @@ int virtio_scsi_dataplane_start(VirtIODevice *vdev)
 
     memory_region_transaction_commit();
 
-    s->dataplane_starting = false;
-    s->dataplane_started = true;
+    qatomic_set(&s->dataplane_state, DATAPLANE_STARTED);
 
     /*
      * Attach notifiers from within the IOThread. It's possible to attach
@@ -183,8 +181,8 @@ fail_host_notifiers:
     k->set_guest_notifiers(qbus->parent, vs->conf.num_queues + 2, false);
 fail_guest_notifiers:
     s->dataplane_fenced = true;
-    s->dataplane_starting = false;
-    s->dataplane_started = true;
+    qatomic_set(&s->dataplane_state, DATAPLANE_STARTED);
+
     return -ENOSYS;
 }
 
@@ -197,17 +195,17 @@ void virtio_scsi_dataplane_stop(VirtIODevice *vdev)
     VirtIOSCSI *s = VIRTIO_SCSI(vdev);
     int i;
 
-    if (!s->dataplane_started || s->dataplane_stopping) {
+    if (qatomic_read(&s->dataplane_state) != DATAPLANE_STARTED) {
         return;
     }
 
     /* Better luck next time. */
     if (s->dataplane_fenced) {
         s->dataplane_fenced = false;
-        s->dataplane_started = false;
+        qatomic_set(&s->dataplane_state, DATAPLANE_STOPPED);
         return;
     }
-    s->dataplane_stopping = true;
+    qatomic_set(&s->dataplane_state, DATAPLANE_STOPPING);
 
     aio_context_acquire(s->ctx);
     aio_wait_bh_oneshot(s->ctx, virtio_scsi_dataplane_stop_bh, s);
@@ -237,6 +235,5 @@ void virtio_scsi_dataplane_stop(VirtIODevice *vdev)
 
     /* Clean up guest notifier (irq) */
     k->set_guest_notifiers(qbus->parent, vs->conf.num_queues + 2, false);
-    s->dataplane_stopping = false;
-    s->dataplane_started = false;
+    qatomic_set(&s->dataplane_state, DATAPLANE_STOPPED);
 }
diff --git a/hw/scsi/virtio-scsi.c b/hw/scsi/virtio-scsi.c
index 4141dddd51..e6ff667e86 100644
--- a/hw/scsi/virtio-scsi.c
+++ b/hw/scsi/virtio-scsi.c
@@ -110,7 +110,8 @@ static void virtio_scsi_complete_req(VirtIOSCSIReq *req)
 
     qemu_iovec_from_buf(&req->resp_iov, 0, &req->resp, req->resp_size);
     virtqueue_push(vq, &req->elem, req->qsgl.size + req->resp_iov.size);
-    if (s->dataplane_started && !s->dataplane_fenced) {
+    if (qatomic_read(&s->dataplane_state) == DATAPLANE_STARTED &&
+        !s->dataplane_fenced) {
         virtio_notify_irqfd(vdev, vq);
     } else {
         virtio_notify(vdev, vq);
@@ -288,7 +289,8 @@ static void virtio_scsi_cancel_notify(Notifier *notifier, void *data)
 
 static inline void virtio_scsi_ctx_check(VirtIOSCSI *s, SCSIDevice *d)
 {
-    if (s->dataplane_started && d && blk_is_available(d->conf.blk)) {
+    if (qatomic_read(&s->dataplane_state) == DATAPLANE_STARTED && d &&
+        blk_is_available(d->conf.blk)) {
         assert(blk_get_aio_context(d->conf.blk) == s->ctx);
     }
 }
@@ -516,7 +518,7 @@ static void virtio_scsi_handle_ctrl_vq(VirtIOSCSI *s, VirtQueue *vq)
  */
 static bool virtio_scsi_defer_to_dataplane(VirtIOSCSI *s)
 {
-    if (!s->ctx || s->dataplane_started) {
+    if (!s->ctx || qatomic_read(&s->dataplane_state) <= DATAPLANE_STARTED) {
         return false;
     }
 
@@ -828,7 +830,7 @@ static void virtio_scsi_reset(VirtIODevice *vdev)
     VirtIOSCSI *s = VIRTIO_SCSI(vdev);
     VirtIOSCSICommon *vs = VIRTIO_SCSI_COMMON(vdev);
 
-    assert(!s->dataplane_started);
+    assert(qatomic_read(&s->dataplane_state) != DATAPLANE_STARTED);
     s->resetting++;
     qbus_reset_all(BUS(&s->bus));
     s->resetting--;
diff --git a/include/hw/virtio/virtio-scsi.h b/include/hw/virtio/virtio-scsi.h
index a36aad9c86..e9e922dff4 100644
--- a/include/hw/virtio/virtio-scsi.h
+++ b/include/hw/virtio/virtio-scsi.h
@@ -85,9 +85,8 @@ struct VirtIOSCSI {
     /* Fields for dataplane below */
     AioContext *ctx; /* one iothread per virtio-scsi-pci for now */
 
-    bool dataplane_started;
-    bool dataplane_starting;
-    bool dataplane_stopping;
+    enum VirtIODataplaneStates dataplane_state;
+
     bool dataplane_fenced;
     uint32_t host_features;
 };
diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
index db1c0ddf6b..25d1515570 100644
--- a/include/hw/virtio/virtio.h
+++ b/include/hw/virtio/virtio.h
@@ -71,6 +71,13 @@ typedef struct VirtQueueElement
 #define TYPE_VIRTIO_DEVICE "virtio-device"
 OBJECT_DECLARE_TYPE(VirtIODevice, VirtioDeviceClass, VIRTIO_DEVICE)
 
+enum VirtIODataplaneStates {
+    DATAPLANE_STARTING, /* dataplane is being initialized */
+    DATAPLANE_STARTED,  /* dataplane has been intialized */
+    DATAPLANE_STOPPING, /* dataplane is being stopped */
+    DATAPLANE_STOPPED,  /* dataplane is stopped */
+};
+
 enum virtio_device_endian {
     VIRTIO_DEVICE_ENDIAN_UNKNOWN,
     VIRTIO_DEVICE_ENDIAN_LITTLE,
-- 
2.31.1


