Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0988E36BDFF
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 05:50:39 +0200 (CEST)
Received: from localhost ([::1]:60226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbEkA-00081H-5F
	for lists+qemu-devel@lfdr.de; Mon, 26 Apr 2021 23:50:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1lbEaQ-00065G-BM
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 23:40:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1lbEaL-00065K-RX
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 23:40:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619494829;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7Z5RaOlD7rdX4XROV7V3gHNn51grnFQ52zIxx1WTXlA=;
 b=ifOjlDpd5QRbyXrDVEkrkkZdtVydd3DM+TL5nFM8r7KnnUJ+WPma5JoJZ4gasafKcEhUhj
 wGUVpDNVVZNrr0c/QPE9tg7m4Ua4Q5mkSDWGj8fI37NLPLE8h53kspQkQ2J+Kppqpr3H95
 fdkkwRw9oSsNxRFXGtsFw9ZCFXFPU/U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-541-6iYJicaCPo2WU6y71BTHnQ-1; Mon, 26 Apr 2021 23:40:27 -0400
X-MC-Unique: 6iYJicaCPo2WU6y71BTHnQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 964678030B5
 for <qemu-devel@nongnu.org>; Tue, 27 Apr 2021 03:40:26 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-13-211.pek2.redhat.com [10.72.13.211])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E9EBF5D9C0;
 Tue, 27 Apr 2021 03:40:24 +0000 (UTC)
From: Cindy Lu <lulu@redhat.com>
To: lulu@redhat.com, mst@redhat.com, jasowang@redhat.com, qemu-devel@nongnu.org
Subject: [PATCH v6 5/9] vhost:add support for configure interrupt
Date: Tue, 27 Apr 2021 11:39:47 +0800
Message-Id: <20210427033951.29805-6-lulu@redhat.com>
In-Reply-To: <20210427033951.29805-1-lulu@redhat.com>
References: <20210427033951.29805-1-lulu@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lulu@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=lulu@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.219,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add configure notifier support in vhost and related driver
When backend support VIRTIO_NET_F_STATUS,setup the configure
interrupt function in vhost_dev_start and release the related
resource when vhost_dev_stop

Signed-off-by: Cindy Lu <lulu@redhat.com>
---
 hw/net/vhost_net.c         |  9 +++++
 hw/net/virtio-net.c        |  6 ++++
 hw/virtio/vhost.c          | 70 ++++++++++++++++++++++++++++++++++++--
 hw/virtio/virtio.c         | 22 ++++++++++++
 include/hw/virtio/vhost.h  |  3 ++
 include/hw/virtio/virtio.h |  4 +++
 include/net/vhost_net.h    |  3 ++
 7 files changed, 115 insertions(+), 2 deletions(-)

diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
index 24d555e764..12e30dc25e 100644
--- a/hw/net/vhost_net.c
+++ b/hw/net/vhost_net.c
@@ -426,6 +426,15 @@ void vhost_net_virtqueue_mask(VHostNetState *net, VirtIODevice *dev,
     vhost_virtqueue_mask(&net->dev, dev, idx, mask);
 }
 
+bool vhost_net_config_pending(VHostNetState *net, int idx)
+{
+    return vhost_config_pending(&net->dev, idx);
+}
+void vhost_net_config_mask(VHostNetState *net, VirtIODevice *dev,
+                              bool mask)
+{
+    vhost_config_mask(&net->dev, dev,  mask);
+}
 VHostNetState *get_vhost_net(NetClientState *nc)
 {
     VHostNetState *vhost_net = 0;
diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 78ccaa228c..43b912453a 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -3063,6 +3063,9 @@ static bool virtio_net_guest_notifier_pending(VirtIODevice *vdev, int idx)
     if (idx != -1) {
         return vhost_net_virtqueue_pending(get_vhost_net(nc->peer), idx);
     }
+    if (idx == -1) {
+        return vhost_net_config_pending(get_vhost_net(nc->peer), idx);
+   }
     return false;
 }
 
@@ -3075,6 +3078,9 @@ static void virtio_net_guest_notifier_mask(VirtIODevice *vdev, int idx,
     if (idx != -1) {
         vhost_net_virtqueue_mask(get_vhost_net(nc->peer), vdev, idx, mask);
      }
+    if (idx == -1) {
+        vhost_net_config_mask(get_vhost_net(nc->peer), vdev, mask);
+     }
 }
 
 static void virtio_net_set_config_size(VirtIONet *n, uint64_t host_features)
diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
index 614ccc2bcb..162a5dd90c 100644
--- a/hw/virtio/vhost.c
+++ b/hw/virtio/vhost.c
@@ -21,6 +21,7 @@
 #include "qemu/error-report.h"
 #include "qemu/memfd.h"
 #include "standard-headers/linux/vhost_types.h"
+#include "standard-headers/linux/virtio_net.h"
 #include "exec/address-spaces.h"
 #include "hw/virtio/virtio-bus.h"
 #include "hw/virtio/virtio-access.h"
@@ -1313,6 +1314,10 @@ int vhost_dev_init(struct vhost_dev *hdev, void *opaque,
             goto fail;
         }
     }
+    r = event_notifier_init(&hdev->masked_config_notifier, 0);
+    if (r < 0) {
+        return r;
+    }
 
     if (busyloop_timeout) {
         for (i = 0; i < hdev->nvqs; ++i) {
@@ -1405,6 +1410,7 @@ void vhost_dev_cleanup(struct vhost_dev *hdev)
     for (i = 0; i < hdev->nvqs; ++i) {
         vhost_virtqueue_cleanup(hdev->vqs + i);
     }
+    event_notifier_cleanup(&hdev->masked_config_notifier);
     if (hdev->mem) {
         /* those are only safe after successful init */
         memory_listener_unregister(&hdev->memory_listener);
@@ -1498,6 +1504,16 @@ bool vhost_virtqueue_pending(struct vhost_dev *hdev, int n)
     return event_notifier_test_and_clear(&vq->masked_notifier);
 }
 
+bool vhost_config_pending(struct vhost_dev *hdev, int n)
+{
+    assert(hdev->vhost_ops);
+
+    if ((hdev->started == false) ||
+        (hdev->vhost_ops->vhost_set_config_call == NULL)) {
+        return false;
+    }
+    return event_notifier_test_and_clear(&hdev->masked_config_notifier);
+}
 /* Mask/unmask events from this vq. */
 void vhost_virtqueue_mask(struct vhost_dev *hdev, VirtIODevice *vdev, int n,
                          bool mask)
@@ -1522,6 +1538,30 @@ void vhost_virtqueue_mask(struct vhost_dev *hdev, VirtIODevice *vdev, int n,
         VHOST_OPS_DEBUG("vhost_set_vring_call failed");
     }
 }
+void vhost_config_mask(struct vhost_dev *hdev, VirtIODevice *vdev,
+                         bool mask)
+{
+   int fd;
+   int r;
+   EventNotifier *masked_config_notifier = &hdev->masked_config_notifier;
+   EventNotifier *config_notifier = &vdev->config_notifier;
+   assert(hdev->vhost_ops);
+
+   if ((hdev->started == false) ||
+        (hdev->vhost_ops->vhost_set_config_call == NULL)) {
+        return ;
+    }
+    if (mask) {
+        assert(vdev->use_guest_notifier_mask);
+        fd = event_notifier_get_fd(masked_config_notifier);
+    } else {
+        fd = event_notifier_get_fd(config_notifier);
+    }
+   r = hdev->vhost_ops->vhost_set_config_call(hdev, &fd);
+   if (r < 0) {
+        error_report("vhost_set_config_call failed");
+    }
+}
 
 uint64_t vhost_get_features(struct vhost_dev *hdev, const int *feature_bits,
                             uint64_t features)
@@ -1701,6 +1741,7 @@ int vhost_dev_get_inflight(struct vhost_dev *dev, uint16_t queue_size,
 int vhost_dev_start(struct vhost_dev *hdev, VirtIODevice *vdev)
 {
     int i, r;
+    int fd = 0;
 
     /* should only be called after backend is connected */
     assert(hdev->vhost_ops);
@@ -1732,7 +1773,10 @@ int vhost_dev_start(struct vhost_dev *hdev, VirtIODevice *vdev)
             goto fail_vq;
         }
     }
-
+    event_notifier_test_and_clear(&hdev->masked_config_notifier);
+    if (!vdev->use_guest_notifier_mask) {
+        vhost_config_mask(hdev, vdev,  true);
+    }
     if (hdev->log_enabled) {
         uint64_t log_base;
 
@@ -1749,6 +1793,7 @@ int vhost_dev_start(struct vhost_dev *hdev, VirtIODevice *vdev)
             goto fail_log;
         }
     }
+
     if (hdev->vhost_ops->vhost_dev_start) {
         r = hdev->vhost_ops->vhost_dev_start(hdev, true);
         if (r) {
@@ -1766,6 +1811,19 @@ int vhost_dev_start(struct vhost_dev *hdev, VirtIODevice *vdev)
             vhost_device_iotlb_miss(hdev, vq->used_phys, true);
         }
     }
+   if (!(hdev->features & (0x1ULL << VIRTIO_NET_F_STATUS))) {
+        return 0;
+    }
+    if (hdev->vhost_ops->vhost_set_config_call) {
+        fd = event_notifier_get_fd(&vdev->config_notifier);
+        r = hdev->vhost_ops->vhost_set_config_call(hdev, &fd);
+        if (!r) {
+            event_notifier_set(&vdev->config_notifier);
+        }
+        if (r) {
+            goto fail_log;
+         }
+    }
     return 0;
 fail_log:
     vhost_log_put(hdev, false);
@@ -1788,10 +1846,18 @@ fail_features:
 void vhost_dev_stop(struct vhost_dev *hdev, VirtIODevice *vdev)
 {
     int i;
+    int fd;
 
     /* should only be called after backend is connected */
     assert(hdev->vhost_ops);
-
+    event_notifier_test_and_clear(&hdev->masked_config_notifier);
+    event_notifier_test_and_clear(&vdev->config_notifier);
+    if ((hdev->features & (0x1ULL << VIRTIO_NET_F_STATUS))) {
+        if (hdev->vhost_ops->vhost_set_config_call) {
+            fd = -1;
+            hdev->vhost_ops->vhost_set_config_call(hdev, &fd);
+        }
+    }
     if (hdev->vhost_ops->vhost_dev_start) {
         hdev->vhost_ops->vhost_dev_start(hdev, false);
     }
diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index ceb58fda6c..5dff29c981 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -3502,6 +3502,14 @@ static void virtio_queue_guest_notifier_read(EventNotifier *n)
     }
 }
 
+static void virtio_config_read(EventNotifier *n)
+{
+    VirtIODevice *vdev = container_of(n, VirtIODevice, config_notifier);
+
+    if (event_notifier_test_and_clear(n)) {
+        virtio_notify_config(vdev);
+    }
+}
 void virtio_queue_set_guest_notifier_fd_handler(VirtQueue *vq, bool assign,
                                                 bool with_irqfd)
 {
@@ -3517,6 +3525,16 @@ void virtio_queue_set_guest_notifier_fd_handler(VirtQueue *vq, bool assign,
         virtio_queue_guest_notifier_read(&vq->guest_notifier);
     }
 }
+void virtio_set_config_notifier_fd_handler(VirtIODevice *vdev, bool assign,
+                                                bool with_irqfd)
+{
+    if (assign && !with_irqfd) {
+        event_notifier_set_handler(&vdev->config_notifier,
+                                   virtio_config_read);
+    } else {
+       event_notifier_set_handler(&vdev->config_notifier, NULL);
+    }
+}
 
 EventNotifier *virtio_queue_get_guest_notifier(VirtQueue *vq)
 {
@@ -3591,6 +3609,10 @@ EventNotifier *virtio_queue_get_host_notifier(VirtQueue *vq)
     return &vq->host_notifier;
 }
 
+EventNotifier *virtio_get_config_notifier(VirtIODevice *vdev)
+{
+    return &vdev->config_notifier;
+}
 void virtio_queue_set_host_notifier_enabled(VirtQueue *vq, bool enabled)
 {
     vq->host_notifier_enabled = enabled;
diff --git a/include/hw/virtio/vhost.h b/include/hw/virtio/vhost.h
index 4a8bc75415..22efa7008e 100644
--- a/include/hw/virtio/vhost.h
+++ b/include/hw/virtio/vhost.h
@@ -91,6 +91,7 @@ struct vhost_dev {
     QLIST_HEAD(, vhost_iommu) iommu_list;
     IOMMUNotifier n;
     const VhostDevConfigOps *config_ops;
+    EventNotifier masked_config_notifier;
 };
 
 struct vhost_net {
@@ -108,6 +109,8 @@ int vhost_dev_start(struct vhost_dev *hdev, VirtIODevice *vdev);
 void vhost_dev_stop(struct vhost_dev *hdev, VirtIODevice *vdev);
 int vhost_dev_enable_notifiers(struct vhost_dev *hdev, VirtIODevice *vdev);
 void vhost_dev_disable_notifiers(struct vhost_dev *hdev, VirtIODevice *vdev);
+bool vhost_config_pending(struct vhost_dev *hdev, int n);
+void vhost_config_mask(struct vhost_dev *hdev, VirtIODevice *vdev,  bool mask);
 
 /* Test and clear masked event pending status.
  * Should be called after unmask to avoid losing events.
diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
index b7ece7a6a8..b0b714f6d4 100644
--- a/include/hw/virtio/virtio.h
+++ b/include/hw/virtio/virtio.h
@@ -108,6 +108,7 @@ struct VirtIODevice
     bool use_guest_notifier_mask;
     AddressSpace *dma_as;
     QLIST_HEAD(, VirtQueue) *vector_queues;
+    EventNotifier config_notifier;
 };
 
 struct VirtioDeviceClass {
@@ -310,11 +311,14 @@ uint16_t virtio_get_queue_index(VirtQueue *vq);
 EventNotifier *virtio_queue_get_guest_notifier(VirtQueue *vq);
 void virtio_queue_set_guest_notifier_fd_handler(VirtQueue *vq, bool assign,
                                                 bool with_irqfd);
+void virtio_set_config_notifier_fd_handler(VirtIODevice *vdev, bool assign,
+                                                bool with_irqfd);
 int virtio_device_start_ioeventfd(VirtIODevice *vdev);
 int virtio_device_grab_ioeventfd(VirtIODevice *vdev);
 void virtio_device_release_ioeventfd(VirtIODevice *vdev);
 bool virtio_device_ioeventfd_enabled(VirtIODevice *vdev);
 EventNotifier *virtio_queue_get_host_notifier(VirtQueue *vq);
+EventNotifier *virtio_get_config_notifier(VirtIODevice *vdev);
 void virtio_queue_set_host_notifier_enabled(VirtQueue *vq, bool enabled);
 void virtio_queue_host_notifier_read(EventNotifier *n);
 void virtio_queue_aio_set_host_notifier_handler(VirtQueue *vq, AioContext *ctx,
diff --git a/include/net/vhost_net.h b/include/net/vhost_net.h
index 172b0051d8..0d38c97c94 100644
--- a/include/net/vhost_net.h
+++ b/include/net/vhost_net.h
@@ -36,6 +36,9 @@ int vhost_net_set_config(struct vhost_net *net, const uint8_t *data,
 bool vhost_net_virtqueue_pending(VHostNetState *net, int n);
 void vhost_net_virtqueue_mask(VHostNetState *net, VirtIODevice *dev,
                               int idx, bool mask);
+bool vhost_net_config_pending(VHostNetState *net, int n);
+void vhost_net_config_mask(VHostNetState *net, VirtIODevice *dev,
+                              bool mask);
 int vhost_net_notify_migration_done(VHostNetState *net, char* mac_addr);
 VHostNetState *get_vhost_net(NetClientState *nc);
 
-- 
2.21.3


