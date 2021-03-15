Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8223F33C72F
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 20:55:45 +0100 (CET)
Received: from localhost ([::1]:36906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLtJY-00041M-HW
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 15:55:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1lLtDd-0005V3-Cw
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 15:49:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46102)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1lLtDV-00042R-Or
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 15:49:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615837767;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IGRHCQ56HK95AEfpMnbCCCYS62wrUulHvDBG+Q8C3Jw=;
 b=CD5HNv/stptUazRmDq78NIBfjrEpuQQKk/vUkRD0xZRsR0Io7CQhjkH0+hgUwG7IcMBMz9
 Vu1XWtPBApC8SvAAtl5l12ih7UJqUAVZtpC8UwyMor3JuViuerJWIqh2d38vrtX+VdbuFg
 zL+3o5XP36UbaIBELXMvUNzW/FCy91M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-571-V0QFJ42VPNyUhVRcfTJWXQ-1; Mon, 15 Mar 2021 15:49:24 -0400
X-MC-Unique: V0QFJ42VPNyUhVRcfTJWXQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6BCAE107ACCD;
 Mon, 15 Mar 2021 19:49:22 +0000 (UTC)
Received: from eperezma.remote.csb (ovpn-112-173.ams2.redhat.com
 [10.36.112.173])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 409651C4;
 Mon, 15 Mar 2021 19:49:15 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC v2 06/13] vhost: Route host->guest notification through shadow
 virtqueue
Date: Mon, 15 Mar 2021 20:48:35 +0100
Message-Id: <20210315194842.277740-7-eperezma@redhat.com>
In-Reply-To: <20210315194842.277740-1-eperezma@redhat.com>
References: <20210315194842.277740-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Parav Pandit <parav@mellanox.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Guru Prasad <guru.prasad@broadcom.com>, Jason Wang <jasowang@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 virtualization@lists.linux-foundation.org,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Eli Cohen <eli@mellanox.com>, Stefano Garzarella <sgarzare@redhat.com>,
 Michael Lilja <ml@napatech.com>, Jim Harford <jim.harford@broadcom.com>,
 Rob Miller <rob.miller@broadcom.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On one hand it uses a mutex to synchronize guest masking with SVQ start
and stop, because otherwise guest mask could race with the SVQ
stop code, sending an incorrect call notifier to vhost device. This
would prevent further communication.

On the other hand it needs to add an event to synchronize guest
unmasking with call handling. Not doing that way could cause the guest
to receive notifications after its unmask call. This could be done
through the mutex but the event solution is cheaper for the buffer
forwarding.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/virtio/vhost-shadow-virtqueue.h |   3 +
 include/hw/virtio/vhost.h          |   1 +
 hw/virtio/vhost-shadow-virtqueue.c | 127 +++++++++++++++++++++++++++++
 hw/virtio/vhost.c                  |  29 ++++++-
 4 files changed, 157 insertions(+), 3 deletions(-)

diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost-shadow-virtqueue.h
index c891c6510d..2ca4b92b12 100644
--- a/hw/virtio/vhost-shadow-virtqueue.h
+++ b/hw/virtio/vhost-shadow-virtqueue.h
@@ -17,6 +17,9 @@
 
 typedef struct VhostShadowVirtqueue VhostShadowVirtqueue;
 
+void vhost_shadow_vq_mask(VhostShadowVirtqueue *svq, EventNotifier *masked);
+void vhost_shadow_vq_unmask(VhostShadowVirtqueue *svq);
+
 bool vhost_shadow_vq_start(struct vhost_dev *dev,
                            unsigned idx,
                            VhostShadowVirtqueue *svq);
diff --git a/include/hw/virtio/vhost.h b/include/hw/virtio/vhost.h
index 7ffdf9aea0..2f556bd3d5 100644
--- a/include/hw/virtio/vhost.h
+++ b/include/hw/virtio/vhost.h
@@ -29,6 +29,7 @@ struct vhost_virtqueue {
     unsigned long long used_phys;
     unsigned used_size;
     bool notifier_is_masked;
+    QemuRecMutex masked_mutex;
     EventNotifier masked_notifier;
     struct vhost_dev *dev;
 };
diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
index 3e43399e9c..8f6ffa729a 100644
--- a/hw/virtio/vhost-shadow-virtqueue.c
+++ b/hw/virtio/vhost-shadow-virtqueue.c
@@ -32,8 +32,22 @@ typedef struct VhostShadowVirtqueue {
      */
     EventNotifier host_notifier;
 
+    /* (Possible) masked notifier */
+    struct {
+        EventNotifier *n;
+
+        /*
+         * Event to confirm unmasking.
+         * set when the masked notifier has no uses
+         */
+        QemuEvent is_free;
+    } masked_notifier;
+
     /* Virtio queue shadowing */
     VirtQueue *vq;
+
+    /* Virtio device */
+    VirtIODevice *vdev;
 } VhostShadowVirtqueue;
 
 /* Forward guest notifications */
@@ -49,6 +63,70 @@ static void vhost_handle_guest_kick(EventNotifier *n)
     event_notifier_set(&svq->kick_notifier);
 }
 
+/* Forward vhost notifications */
+static void vhost_shadow_vq_handle_call_no_test(EventNotifier *n)
+{
+    VhostShadowVirtqueue *svq = container_of(n, VhostShadowVirtqueue,
+                                             call_notifier);
+    EventNotifier *masked_notifier;
+
+    /* Signal start of using masked notifier */
+    qemu_event_reset(&svq->masked_notifier.is_free);
+    masked_notifier = qatomic_load_acquire(&svq->masked_notifier.n);
+    if (!masked_notifier) {
+        qemu_event_set(&svq->masked_notifier.is_free);
+    }
+
+    if (!masked_notifier) {
+        unsigned n = virtio_get_queue_index(svq->vq);
+        virtio_queue_invalidate_signalled_used(svq->vdev, n);
+        virtio_notify_irqfd(svq->vdev, svq->vq);
+    } else {
+        event_notifier_set(svq->masked_notifier.n);
+    }
+
+    if (masked_notifier) {
+        /* Signal not using it anymore */
+        qemu_event_set(&svq->masked_notifier.is_free);
+    }
+}
+
+static void vhost_shadow_vq_handle_call(EventNotifier *n)
+{
+
+    if (likely(event_notifier_test_and_clear(n))) {
+        vhost_shadow_vq_handle_call_no_test(n);
+    }
+}
+
+/*
+ * Mask the shadow virtqueue.
+ *
+ * It can be called from a guest masking vmexit or shadow virtqueue start
+ * through QMP.
+ *
+ * @vq Shadow virtqueue
+ * @masked Masked notifier to signal instead of guest
+ */
+void vhost_shadow_vq_mask(VhostShadowVirtqueue *svq, EventNotifier *masked)
+{
+    qatomic_store_release(&svq->masked_notifier.n, masked);
+}
+
+/*
+ * Unmask the shadow virtqueue.
+ *
+ * It can be called from a guest unmasking vmexit or shadow virtqueue start
+ * through QMP.
+ *
+ * @vq Shadow virtqueue
+ */
+void vhost_shadow_vq_unmask(VhostShadowVirtqueue *svq)
+{
+    qatomic_store_release(&svq->masked_notifier.n, NULL);
+    qemu_event_wait(&svq->masked_notifier.is_free);
+}
+
 /*
  * Restore the vhost guest to host notifier, i.e., disables svq effect.
  */
@@ -103,8 +181,39 @@ bool vhost_shadow_vq_start(struct vhost_dev *dev,
         goto err_set_vring_kick;
     }
 
+    /* Set vhost call */
+    file.fd = event_notifier_get_fd(&svq->call_notifier),
+    r = dev->vhost_ops->vhost_set_vring_call(dev, &file);
+    if (unlikely(r != 0)) {
+        error_report("Couldn't set call fd: %s", strerror(errno));
+        goto err_set_vring_call;
+    }
+
+
+    /*
+     * Lock to avoid a race condition between guest setting masked status and
+     * us.
+     */
+    QEMU_LOCK_GUARD(&dev->vqs[idx].masked_mutex);
+    /* Set shadow vq -> guest notifier */
+    assert(dev->shadow_vqs_enabled);
+    vhost_virtqueue_mask(dev, dev->vdev, dev->vq_index + idx,
+                         dev->vqs[idx].notifier_is_masked);
+
+    if (dev->vqs[idx].notifier_is_masked &&
+               event_notifier_test_and_clear(&dev->vqs[idx].masked_notifier)) {
+        /* Check for pending notifications from the device */
+        vhost_shadow_vq_handle_call_no_test(&svq->call_notifier);
+    }
+
     return true;
 
+err_set_vring_call:
+    r = vhost_shadow_vq_restore_vdev_host_notifier(dev, idx, svq);
+    if (unlikely(r < 0)) {
+        error_report("Couldn't restore vq kick fd: %s", strerror(-r));
+    }
+
 err_set_vring_kick:
     event_notifier_set_handler(&svq->host_notifier, NULL);
 
@@ -126,7 +235,19 @@ void vhost_shadow_vq_stop(struct vhost_dev *dev,
         error_report("Couldn't restore vq kick fd: %s", strerror(-r));
     }
 
+    assert(!dev->shadow_vqs_enabled);
+
     event_notifier_set_handler(&svq->host_notifier, NULL);
+
+    /*
+     * Lock to avoid a race condition between guest setting masked status and
+     * us.
+     */
+    QEMU_LOCK_GUARD(&dev->vqs[idx].masked_mutex);
+
+    /* Restore vhost call */
+    vhost_virtqueue_mask(dev, dev->vdev, dev->vq_index + idx,
+                         dev->vqs[idx].notifier_is_masked);
 }
 
 /*
@@ -154,6 +275,10 @@ VhostShadowVirtqueue *vhost_shadow_vq_new(struct vhost_dev *dev, int idx)
     }
 
     svq->vq = virtio_get_queue(dev->vdev, vq_idx);
+    svq->vdev = dev->vdev;
+    event_notifier_set_handler(&svq->call_notifier,
+                               vhost_shadow_vq_handle_call);
+    qemu_event_init(&svq->masked_notifier.is_free, true);
     return g_steal_pointer(&svq);
 
 err_init_call_notifier:
@@ -168,7 +293,9 @@ err_init_kick_notifier:
  */
 void vhost_shadow_vq_free(VhostShadowVirtqueue *vq)
 {
+    qemu_event_destroy(&vq->masked_notifier.is_free);
     event_notifier_cleanup(&vq->kick_notifier);
+    event_notifier_set_handler(&vq->call_notifier, NULL);
     event_notifier_cleanup(&vq->call_notifier);
     g_free(vq);
 }
diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
index 4858a35df6..eab3e334f2 100644
--- a/hw/virtio/vhost.c
+++ b/hw/virtio/vhost.c
@@ -1224,7 +1224,8 @@ static int vhost_sw_live_migration_stop(struct vhost_dev *dev)
 {
     int idx;
 
-    dev->shadow_vqs_enabled = false;
+    /* Can be read by vhost_virtqueue_mask, from vm exit */
+    qatomic_store_release(&dev->shadow_vqs_enabled, false);
 
     for (idx = 0; idx < dev->nvqs; ++idx) {
         vhost_shadow_vq_stop(dev, idx, dev->shadow_vqs[idx]);
@@ -1248,7 +1249,8 @@ static int vhost_sw_live_migration_start(struct vhost_dev *dev)
         }
     }
 
-    dev->shadow_vqs_enabled = true;
+    /* Can be read by vhost_virtqueue_mask, from vm exit */
+    qatomic_store_release(&dev->shadow_vqs_enabled, true);
     for (idx = 0; idx < dev->nvqs; ++idx) {
         bool ok = vhost_shadow_vq_start(dev, idx, dev->shadow_vqs[idx]);
         if (unlikely(!ok)) {
@@ -1259,7 +1261,7 @@ static int vhost_sw_live_migration_start(struct vhost_dev *dev)
     return 0;
 
 err_start:
-    dev->shadow_vqs_enabled = false;
+    qatomic_store_release(&dev->shadow_vqs_enabled, false);
     for (stop_idx = 0; stop_idx < idx; stop_idx++) {
         vhost_shadow_vq_stop(dev, idx, dev->shadow_vqs[stop_idx]);
     }
@@ -1343,6 +1345,7 @@ static int vhost_virtqueue_init(struct vhost_dev *dev,
         goto fail_call;
     }
 
+    qemu_rec_mutex_init(&vq->masked_mutex);
     vq->dev = dev;
 
     return 0;
@@ -1353,6 +1356,7 @@ fail_call:
 
 static void vhost_virtqueue_cleanup(struct vhost_virtqueue *vq)
 {
+    qemu_rec_mutex_destroy(&vq->masked_mutex);
     event_notifier_cleanup(&vq->masked_notifier);
 }
 
@@ -1591,6 +1595,25 @@ void vhost_virtqueue_mask(struct vhost_dev *hdev, VirtIODevice *vdev, int n,
     /* should only be called after backend is connected */
     assert(hdev->vhost_ops);
 
+    /* Avoid race condition with shadow virtqueue stop/start */
+    QEMU_LOCK_GUARD(&hdev->vqs[index].masked_mutex);
+
+    /* Set by QMP thread, so using acquire semantics */
+    if (qatomic_load_acquire(&hdev->shadow_vqs_enabled)) {
+        if (mask) {
+            vhost_shadow_vq_mask(hdev->shadow_vqs[index],
+                                 &hdev->vqs[index].masked_notifier);
+        } else {
+            vhost_shadow_vq_unmask(hdev->shadow_vqs[index]);
+        }
+
+        /*
+         * Vhost call fd must remain the same since shadow vq is not polling
+         * for changes
+         */
+        return;
+    }
+
     if (mask) {
         assert(vdev->use_guest_notifier_mask);
         file.fd = event_notifier_get_fd(&hdev->vqs[index].masked_notifier);
-- 
2.27.0


