Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3A9D3BC70C
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 09:22:47 +0200 (CEST)
Received: from localhost ([::1]:48184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0fPq-0001OP-Tg
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 03:22:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1m0fO2-0006yo-DU
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 03:20:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30244)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1m0fO0-00047t-2H
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 03:20:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625556051;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7Ucn0YtNhPI/nR/mKXayTZTffhWRtw/iMY6656SWtqk=;
 b=C+blCbzqfivN+4BfzVv09bqBH9ju5WtRJ2m4YrUidNfdy9kbAOwsluz7NJj/hJW9jRd7xe
 rwsZCGBBBk7py1/sFn88H94rqW5sh/i0EZaS2ORM67/GrHZRVszWt6w0hDiKvWTvEX2ZIl
 e5hDVgKM+2DwEVcqtBWI3Kz8cSNrWLM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-227-8_xJrDuSMkexT2rPYcoslA-1; Tue, 06 Jul 2021 03:20:50 -0400
X-MC-Unique: 8_xJrDuSMkexT2rPYcoslA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 418FF1005CBC
 for <qemu-devel@nongnu.org>; Tue,  6 Jul 2021 07:20:49 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-13-123.pek2.redhat.com [10.72.13.123])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9270F5C1D0;
 Tue,  6 Jul 2021 07:20:47 +0000 (UTC)
From: Cindy Lu <lulu@redhat.com>
To: lulu@redhat.com, mst@redhat.com, jasowang@redhat.com, qemu-devel@nongnu.org
Subject: [PATCH v8 5/9] vhost-net:add support for configure interrupt
Date: Tue,  6 Jul 2021 15:20:26 +0800
Message-Id: <20210706072030.32365-6-lulu@redhat.com>
In-Reply-To: <20210706072030.32365-1-lulu@redhat.com>
References: <20210706072030.32365-1-lulu@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lulu@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=lulu@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.442,
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
interrupt function in vhost_net_start and release the related
resource when vhost_net_stop

Signed-off-by: Cindy Lu <lulu@redhat.com>
---
 hw/net/vhost_net.c         | 36 +++++++++++++++++++++++++++++++
 hw/net/virtio-net.c        |  6 ++++++
 hw/virtio/vhost.c          | 44 ++++++++++++++++++++++++++++++++++++++
 hw/virtio/virtio.c         | 33 ++++++++++++++++++++++++++--
 include/hw/virtio/vhost.h  |  2 ++
 include/hw/virtio/virtio.h |  5 +++++
 include/net/vhost_net.h    |  3 +++
 7 files changed, 127 insertions(+), 2 deletions(-)

diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
index 24d555e764..be453717c4 100644
--- a/hw/net/vhost_net.c
+++ b/hw/net/vhost_net.c
@@ -310,6 +310,31 @@ static void vhost_net_stop_one(struct vhost_net *net,
     vhost_dev_disable_notifiers(&net->dev, dev);
 }
 
+static void vhost_net_stop_config_intr(struct vhost_net *net)
+{
+    struct vhost_dev *dev = &net->dev;
+    if (dev->features & (0x1ULL << VIRTIO_NET_F_STATUS)) {
+        if (dev->vhost_ops->vhost_set_config_call) {
+            int fd = -1;
+            dev->vhost_ops->vhost_set_config_call(dev, fd);
+        }
+    }
+}
+
+static void vhost_net_start_config_intr(struct vhost_net *net)
+{
+    struct vhost_dev *dev = &net->dev;
+    if (!(dev->features & (0x1ULL << VIRTIO_NET_F_STATUS))) {
+        return;
+    }
+    if (dev->vhost_ops->vhost_set_config_call) {
+        int fd = event_notifier_get_fd(&dev->vdev->config_notifier);
+        int r = dev->vhost_ops->vhost_set_config_call(dev, fd);
+        if (!r) {
+            event_notifier_set(&dev->vdev->config_notifier);
+        }
+    }
+}
 int vhost_net_start(VirtIODevice *dev, NetClientState *ncs,
                     int total_queues)
 {
@@ -364,6 +389,7 @@ int vhost_net_start(VirtIODevice *dev, NetClientState *ncs,
         }
     }
 
+    vhost_net_start_config_intr(get_vhost_net(ncs[0].peer));
     return 0;
 
 err_start:
@@ -397,6 +423,7 @@ void vhost_net_stop(VirtIODevice *dev, NetClientState *ncs,
         fprintf(stderr, "vhost guest notifier cleanup failed: %d\n", r);
         fflush(stderr);
     }
+    vhost_net_stop_config_intr(get_vhost_net(ncs[0].peer));
     assert(r >= 0);
 }
 
@@ -426,6 +453,15 @@ void vhost_net_virtqueue_mask(VHostNetState *net, VirtIODevice *dev,
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
index e2163a0d63..6716109448 100644
--- a/hw/virtio/vhost.c
+++ b/hw/virtio/vhost.c
@@ -1505,6 +1505,16 @@ bool vhost_virtqueue_pending(struct vhost_dev *hdev, int n)
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
@@ -1529,6 +1539,30 @@ void vhost_virtqueue_mask(struct vhost_dev *hdev, VirtIODevice *vdev, int n,
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
+   r = hdev->vhost_ops->vhost_set_config_call(hdev, fd);
+   if (r < 0) {
+        VHOST_OPS_DEBUG("vhost_set_config_call failed");
+    }
+}
 
 uint64_t vhost_get_features(struct vhost_dev *hdev, const int *feature_bits,
                             uint64_t features)
@@ -1740,6 +1774,14 @@ int vhost_dev_start(struct vhost_dev *hdev, VirtIODevice *vdev)
         }
     }
 
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
 
@@ -1798,6 +1840,8 @@ void vhost_dev_stop(struct vhost_dev *hdev, VirtIODevice *vdev)
 
     /* should only be called after backend is connected */
     assert(hdev->vhost_ops);
+    event_notifier_test_and_clear(&vdev->masked_config_notifier);
+    event_notifier_test_and_clear(&vdev->config_notifier);
 
     if (hdev->vhost_ops->vhost_dev_start) {
         hdev->vhost_ops->vhost_dev_start(hdev, false);
diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index 07f4e60b30..dbd2e36403 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -3504,10 +3504,18 @@ static void virtio_queue_guest_notifier_read(EventNotifier *n)
         virtio_irq(vq);
     }
 }
+static void virtio_config_read(EventNotifier *n)
+{
+    VirtIODevice *vdev = container_of(n, VirtIODevice, config_notifier);
 
+    if (event_notifier_test_and_clear(n)) {
+        virtio_notify_config(vdev);
+    }
+}
 void virtio_queue_set_guest_notifier_fd_handler(VirtQueue *vq, bool assign,
                                                 bool with_irqfd)
 {
+
     if (assign && !with_irqfd) {
         event_notifier_set_handler(&vq->guest_notifier,
                                    virtio_queue_guest_notifier_read);
@@ -3515,12 +3523,29 @@ void virtio_queue_set_guest_notifier_fd_handler(VirtQueue *vq, bool assign,
         event_notifier_set_handler(&vq->guest_notifier, NULL);
     }
     if (!assign) {
-        /* Test and clear notifier before closing it,
-         * in case poll callback didn't have time to run. */
+        /* Test and clear notifier before closing it,*/
+        /* in case poll callback didn't have time to run. */
         virtio_queue_guest_notifier_read(&vq->guest_notifier);
     }
 }
 
+void virtio_set_config_notifier_fd_handler(VirtIODevice *vdev, bool assign,
+                                              bool with_irqfd)
+{
+    EventNotifier *n;
+    n = &vdev->config_notifier;
+    if (assign && !with_irqfd) {
+        event_notifier_set_handler(n, virtio_config_read);
+    } else {
+        event_notifier_set_handler(n, NULL);
+    }
+    if (!assign) {
+        /* Test and clear notifier before closing it,*/
+        /* in case poll callback didn't have time to run. */
+        virtio_config_read(n);
+    }
+}
+
 EventNotifier *virtio_queue_get_guest_notifier(VirtQueue *vq)
 {
     return &vq->guest_notifier;
@@ -3594,6 +3619,10 @@ EventNotifier *virtio_queue_get_host_notifier(VirtQueue *vq)
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
index 63cb9455ed..3bfd0692a4 100644
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
@@ -312,11 +314,14 @@ uint16_t virtio_get_queue_index(VirtQueue *vq);
 EventNotifier *virtio_queue_get_guest_notifier(VirtQueue *vq);
 void virtio_queue_set_guest_notifier_fd_handler(VirtQueue *vq, bool assign,
                                                 bool with_irqfd);
+ void virtio_set_config_notifier_fd_handler(VirtIODevice *vdev, bool assign,
+                                            bool with_irqfd);
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


