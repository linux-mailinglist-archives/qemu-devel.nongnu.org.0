Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D35B6397FB1
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 05:50:11 +0200 (CEST)
Received: from localhost ([::1]:46434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loHtS-0001Vg-QP
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 23:50:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1loHrq-00074h-27
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 23:48:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50347)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1loHrn-0006g9-Ef
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 23:48:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622605706;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FfFFDsdpxsfkRMKpeBRM/US3nlApuTtgO75rvyDJzKY=;
 b=Ok+3QNSH2WESjdcIhvLZ+mFSfkg6Hwvbm7IEKS4hWgelArejuwhCDOlYLxnJEHiEZu/54c
 KZcxe58Ou0fpYK2TFIS20vDA8gybtyQwQAP4Rj/fqG9cHARan9xZkLhE78/9tax/8fseda
 SbZh6ykLaUnNBAbpOixXhA3Kv6X56iE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-579-FOdkJgF_N3OO8JjCxWJqeA-1; Tue, 01 Jun 2021 23:48:25 -0400
X-MC-Unique: FOdkJgF_N3OO8JjCxWJqeA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C5CAF101371B
 for <qemu-devel@nongnu.org>; Wed,  2 Jun 2021 03:48:24 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-13-199.pek2.redhat.com [10.72.13.199])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 383845D6D5;
 Wed,  2 Jun 2021 03:48:21 +0000 (UTC)
From: Cindy Lu <lulu@redhat.com>
To: lulu@redhat.com, mst@redhat.com, jasowang@redhat.com, qemu-devel@nongnu.org
Subject: [PATCH v7 06/10] vhost:add support for configure interrupt
Date: Wed,  2 Jun 2021 11:47:46 +0800
Message-Id: <20210602034750.23377-7-lulu@redhat.com>
In-Reply-To: <20210602034750.23377-1-lulu@redhat.com>
References: <20210602034750.23377-1-lulu@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lulu@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=lulu@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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

Add configure notifier support in vhost and virtio driver
When backend support VIRTIO_NET_F_STATUS,setup the configure
interrupt function in vhost_dev_start and release the related
resource when vhost_dev_stop

Signed-off-by: Cindy Lu <lulu@redhat.com>
---
 hw/net/vhost_net.c         |  9 +++++
 hw/net/virtio-net.c        |  6 ++++
 hw/virtio/vhost.c          | 68 ++++++++++++++++++++++++++++++++++++--
 hw/virtio/virtio.c         | 23 +++++++++++--
 include/hw/virtio/vhost.h  |  2 ++
 include/hw/virtio/virtio.h |  3 ++
 include/net/vhost_net.h    |  3 ++
 7 files changed, 109 insertions(+), 5 deletions(-)

diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
index 24d555e764..5d0c35f18d 100644
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
+    vhost_config_mask(&net->dev, dev, mask);
+}
 VHostNetState *get_vhost_net(NetClientState *nc)
 {
     VHostNetState *vhost_net = 0;
diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index f50235b5d6..02033be748 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -3055,6 +3055,9 @@ static bool virtio_net_guest_notifier_pending(VirtIODevice *vdev, int idx)
     if (idx != VIRTIO_CONFIG_IRQ_IDX) {
         return vhost_net_virtqueue_pending(get_vhost_net(nc->peer), idx);
     }
+    if (idx == VIRTIO_CONFIG_IRQ_IDX) {
+        return vhost_net_config_pending(get_vhost_net(nc->peer), idx);
+   }
     return false;
 }
 
@@ -3067,6 +3070,9 @@ static void virtio_net_guest_notifier_mask(VirtIODevice *vdev, int idx,
     if (idx != VIRTIO_CONFIG_IRQ_IDX) {
         vhost_net_virtqueue_mask(get_vhost_net(nc->peer), vdev, idx, mask);
     }
+    if (idx == VIRTIO_CONFIG_IRQ_IDX) {
+        vhost_net_config_mask(get_vhost_net(nc->peer), vdev, mask);
+     }
 }
 
 static void virtio_net_set_config_size(VirtIONet *n, uint64_t host_features)
diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
index e2163a0d63..3b05f09d98 100644
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
@@ -1505,6 +1506,16 @@ bool vhost_virtqueue_pending(struct vhost_dev *hdev, int n)
     return event_notifier_test_and_clear(&vq->masked_notifier);
 }
 
+bool vhost_config_pending(struct vhost_dev *hdev, int n)
+{
+    assert(hdev->vhost_ops);
+    VirtIODevice *vdev = hdev->vdev;
+    if ((hdev->started == false) ||
+        (hdev->vhost_ops->vhost_set_config_call == NULL)) {
+        return false;
+    }
+    return event_notifier_test_and_clear(&vdev->masked_config_notifier);
+}
 /* Mask/unmask events from this vq. */
 void vhost_virtqueue_mask(struct vhost_dev *hdev, VirtIODevice *vdev, int n,
                          bool mask)
@@ -1529,6 +1540,30 @@ void vhost_virtqueue_mask(struct vhost_dev *hdev, VirtIODevice *vdev, int n,
         VHOST_OPS_DEBUG("vhost_set_vring_call failed");
     }
 }
+void vhost_config_mask(struct vhost_dev *hdev, VirtIODevice *vdev,
+                         bool mask)
+{
+   int fd;
+   int r;
+   EventNotifier *masked_config_notifier = &vdev->masked_config_notifier;
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
@@ -1708,6 +1743,7 @@ int vhost_dev_get_inflight(struct vhost_dev *dev, uint16_t queue_size,
 int vhost_dev_start(struct vhost_dev *hdev, VirtIODevice *vdev)
 {
     int i, r;
+    int fd = 0;
 
     /* should only be called after backend is connected */
     assert(hdev->vhost_ops);
@@ -1739,7 +1775,14 @@ int vhost_dev_start(struct vhost_dev *hdev, VirtIODevice *vdev)
             goto fail_vq;
         }
     }
-
+    r = event_notifier_init(&vdev->masked_config_notifier, 0);
+    if (r < 0) {
+        return r;
+    }
+    event_notifier_test_and_clear(&vdev->masked_config_notifier);
+    if (!vdev->use_guest_notifier_mask) {
+        vhost_config_mask(hdev, vdev, true);
+    }
     if (hdev->log_enabled) {
         uint64_t log_base;
 
@@ -1773,6 +1816,19 @@ int vhost_dev_start(struct vhost_dev *hdev, VirtIODevice *vdev)
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
+        }
+    }
     return 0;
 fail_log:
     vhost_log_put(hdev, false);
@@ -1795,10 +1851,18 @@ fail_features:
 void vhost_dev_stop(struct vhost_dev *hdev, VirtIODevice *vdev)
 {
     int i;
+    int fd;
 
     /* should only be called after backend is connected */
     assert(hdev->vhost_ops);
-
+    event_notifier_test_and_clear(&vdev->masked_config_notifier);
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
index c5d786bb5e..09ed3f67d9 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -3506,14 +3506,27 @@ static void virtio_queue_guest_notifier_read(EventNotifier *n)
 }
 
 
+static void virtio_config_read(EventNotifier *n)
+{
+    VirtIODevice *vdev = container_of(n, VirtIODevice, config_notifier);
+
+    if (event_notifier_test_and_clear(n)) {
+        virtio_notify_config(vdev);
+    }
+}
 void virtio_set_notifier_fd_handler(VirtIODevice *vdev, int queue_no,
                                bool assign, bool with_irqfd)
 {
     EventNotifier *e ;
     EventNotifierHandler *handler;
-    VirtQueue *vq = virtio_get_queue(vdev, queue_no);
-    e = &vq->guest_notifier;
-    handler = virtio_queue_guest_notifier_read;
+    if (queue_no != VIRTIO_CONFIG_IRQ_IDX) {
+        VirtQueue *vq = virtio_get_queue(vdev, queue_no);
+        e = &vq->guest_notifier;
+        handler = virtio_queue_guest_notifier_read;
+    } else {
+        e = &vdev->config_notifier;
+        handler = virtio_config_read;
+    }
     if (assign && !with_irqfd) {
         event_notifier_set_handler(e, handler);
     } else {
@@ -3599,6 +3612,10 @@ EventNotifier *virtio_queue_get_host_notifier(VirtQueue *vq)
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
index 4a8bc75415..b8814ece32 100644
--- a/include/hw/virtio/vhost.h
+++ b/include/hw/virtio/vhost.h
@@ -108,6 +108,8 @@ int vhost_dev_start(struct vhost_dev *hdev, VirtIODevice *vdev);
 void vhost_dev_stop(struct vhost_dev *hdev, VirtIODevice *vdev);
 int vhost_dev_enable_notifiers(struct vhost_dev *hdev, VirtIODevice *vdev);
 void vhost_dev_disable_notifiers(struct vhost_dev *hdev, VirtIODevice *vdev);
+bool vhost_config_pending(struct vhost_dev *hdev, int n);
+void vhost_config_mask(struct vhost_dev *hdev, VirtIODevice *vdev, bool mask);
 
 /* Test and clear masked event pending status.
  * Should be called after unmask to avoid losing events.
diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
index 447899dea5..5856517d43 100644
--- a/include/hw/virtio/virtio.h
+++ b/include/hw/virtio/virtio.h
@@ -110,6 +110,8 @@ struct VirtIODevice
     bool use_guest_notifier_mask;
     AddressSpace *dma_as;
     QLIST_HEAD(, VirtQueue) *vector_queues;
+    EventNotifier config_notifier;
+    EventNotifier masked_config_notifier;
 };
 
 struct VirtioDeviceClass {
@@ -317,6 +319,7 @@ int virtio_device_grab_ioeventfd(VirtIODevice *vdev);
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


