Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1C273893DD
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 18:35:56 +0200 (CEST)
Received: from localhost ([::1]:36536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljPAq-00024T-1k
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 12:35:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1ljP5L-0003B3-C6
 for qemu-devel@nongnu.org; Wed, 19 May 2021 12:30:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43368)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1ljP5H-0005Jw-Ka
 for qemu-devel@nongnu.org; Wed, 19 May 2021 12:30:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621441811;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wndRUAl0yqcDZHg+lrz+7s4nniC0MTgzWuOP5HXK5QE=;
 b=OvUIwfMy5i/9UaCPAX4RK73yO49Y27ButvR3Ib+ALCwwrqc7gW6j/SxSVjqzGtJgqjMoVG
 utDKMSlHMDBQEM2VBI+f3Atlb1CMDvNVqJpvKC9blFl0YfBVjdpgroQxhtMa+fz6NwJ/vL
 m3zF6i/Xqgn/bIXWx/GyI26mNvnuxQ0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-324-RCiFpXrDOLO-U8uNDQBAxA-1; Wed, 19 May 2021 12:30:09 -0400
X-MC-Unique: RCiFpXrDOLO-U8uNDQBAxA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 80EB0100747B;
 Wed, 19 May 2021 16:30:08 +0000 (UTC)
Received: from eperezma.remote.csb (ovpn-113-65.ams2.redhat.com [10.36.113.65])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EDC1A5D6AC;
 Wed, 19 May 2021 16:30:04 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC v3 08/29] vhost: Route host->guest notification through shadow
 virtqueue
Date: Wed, 19 May 2021 18:28:42 +0200
Message-Id: <20210519162903.1172366-9-eperezma@redhat.com>
In-Reply-To: <20210519162903.1172366-1-eperezma@redhat.com>
References: <20210519162903.1172366-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 Jason Wang <jasowang@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 virtualization@lists.linux-foundation.org,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Michael Lilja <ml@napatech.com>, Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/virtio/vhost-shadow-virtqueue.h |  3 +
 include/hw/virtio/vhost.h          |  1 +
 hw/virtio/vhost-shadow-virtqueue.c | 95 ++++++++++++++++++++++++++++++
 hw/virtio/vhost.c                  | 15 +++++
 4 files changed, 114 insertions(+)

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
index 7ffdf9aea0..67cedf83da 100644
--- a/include/hw/virtio/vhost.h
+++ b/include/hw/virtio/vhost.h
@@ -28,6 +28,7 @@ struct vhost_virtqueue {
     unsigned avail_size;
     unsigned long long used_phys;
     unsigned used_size;
+    /* Access/writing to notifier_is_masked is protected by BQL */
     bool notifier_is_masked;
     EventNotifier masked_notifier;
     struct vhost_dev *dev;
diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
index 3e43399e9c..7d76e271a5 100644
--- a/hw/virtio/vhost-shadow-virtqueue.c
+++ b/hw/virtio/vhost-shadow-virtqueue.c
@@ -32,8 +32,16 @@ typedef struct VhostShadowVirtqueue {
      */
     EventNotifier host_notifier;
 
+    /* (Possible) masked notifier */
+    struct {
+        EventNotifier *n;
+    } masked_notifier;
+
     /* Virtio queue shadowing */
     VirtQueue *vq;
+
+    /* Virtio device */
+    VirtIODevice *vdev;
 } VhostShadowVirtqueue;
 
 /* Forward guest notifications */
@@ -49,6 +57,58 @@ static void vhost_handle_guest_kick(EventNotifier *n)
     event_notifier_set(&svq->kick_notifier);
 }
 
+/* Forward vhost notifications */
+static void vhost_shadow_vq_handle_call_no_test(EventNotifier *n)
+{
+    VhostShadowVirtqueue *svq = container_of(n, VhostShadowVirtqueue,
+                                             call_notifier);
+    EventNotifier *masked_notifier;
+
+    masked_notifier = svq->masked_notifier.n;
+
+    if (!masked_notifier) {
+        unsigned n = virtio_get_queue_index(svq->vq);
+        virtio_queue_invalidate_signalled_used(svq->vdev, n);
+        virtio_notify_irqfd(svq->vdev, svq->vq);
+    } else {
+        event_notifier_set(svq->masked_notifier.n);
+    }
+}
+
+static void vhost_shadow_vq_handle_call(EventNotifier *n)
+{
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
+    svq->masked_notifier.n = masked;
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
+    svq->masked_notifier.n = NULL;
+}
+
 /*
  * Restore the vhost guest to host notifier, i.e., disables svq effect.
  */
@@ -103,8 +163,33 @@ bool vhost_shadow_vq_start(struct vhost_dev *dev,
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
 
@@ -126,7 +211,13 @@ void vhost_shadow_vq_stop(struct vhost_dev *dev,
         error_report("Couldn't restore vq kick fd: %s", strerror(-r));
     }
 
+    assert(!dev->shadow_vqs_enabled);
+
     event_notifier_set_handler(&svq->host_notifier, NULL);
+
+    /* Restore vhost call */
+    vhost_virtqueue_mask(dev, dev->vdev, dev->vq_index + idx,
+                         dev->vqs[idx].notifier_is_masked);
 }
 
 /*
@@ -154,6 +245,9 @@ VhostShadowVirtqueue *vhost_shadow_vq_new(struct vhost_dev *dev, int idx)
     }
 
     svq->vq = virtio_get_queue(dev->vdev, vq_idx);
+    svq->vdev = dev->vdev;
+    event_notifier_set_handler(&svq->call_notifier,
+                               vhost_shadow_vq_handle_call);
     return g_steal_pointer(&svq);
 
 err_init_call_notifier:
@@ -169,6 +263,7 @@ err_init_kick_notifier:
 void vhost_shadow_vq_free(VhostShadowVirtqueue *vq)
 {
     event_notifier_cleanup(&vq->kick_notifier);
+    event_notifier_set_handler(&vq->call_notifier, NULL);
     event_notifier_cleanup(&vq->call_notifier);
     g_free(vq);
 }
diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
index 84091b5251..9c9c63345b 100644
--- a/hw/virtio/vhost.c
+++ b/hw/virtio/vhost.c
@@ -1591,6 +1591,21 @@ void vhost_virtqueue_mask(struct vhost_dev *hdev, VirtIODevice *vdev, int n,
     /* should only be called after backend is connected */
     assert(hdev->vhost_ops);
 
+    if (hdev->shadow_vqs_enabled) {
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


