Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7823F345530
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 02:59:01 +0100 (CET)
Received: from localhost ([::1]:59790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOWJw-00018b-HU
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 21:59:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1lOWI4-0008WN-4J
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 21:57:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28501)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1lOWI0-0005sC-Us
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 21:57:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616464619;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vgCO3oBxYJNjf7H7UfVf1DoP7nt5HaZeCRMFci8NTw8=;
 b=MRKiGBCbQ1RHQy3pvFknY89qT7VcEFSjQ2GgyR6m5U7vJS406O2fclMfP0lLtLCLgglEaG
 rRVoIVt0lCk8RKpZ3m5n7SZm5q8pNK/ltRE9Lfc8D6s53OhldpoBL4RyRRBW79WcHE/Wjn
 +ZMFnBfo+CZwPNdx9WlPWq5abexzui0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-477-Zl9LiY_NMgGqHIEueqWw3Q-1; Mon, 22 Mar 2021 21:56:57 -0400
X-MC-Unique: Zl9LiY_NMgGqHIEueqWw3Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C65CC81744F
 for <qemu-devel@nongnu.org>; Tue, 23 Mar 2021 01:56:56 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-12-88.pek2.redhat.com [10.72.12.88])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D4A3E62A6F;
 Tue, 23 Mar 2021 01:56:54 +0000 (UTC)
From: Cindy Lu <lulu@redhat.com>
To: lulu@redhat.com, mst@redhat.com, jasowang@redhat.com, qemu-devel@nongnu.org
Subject: [PATCH v4 1/4] virtio:add support in configure interrupt
Date: Tue, 23 Mar 2021 09:56:38 +0800
Message-Id: <20210323015641.10820-2-lulu@redhat.com>
In-Reply-To: <20210323015641.10820-1-lulu@redhat.com>
References: <20210323015641.10820-1-lulu@redhat.com>
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
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

Add configure notifier support in virtio and related driver
When peer is vhost vdpa, setup the configure interrupt function
vhost_net_start and release the resource when vhost_net_stop

Signed-off-by: Cindy Lu <lulu@redhat.com>
---
 hw/display/vhost-user-gpu.c    | 14 +++++++----
 hw/net/vhost_net.c             | 16 +++++++++++--
 hw/net/virtio-net.c            | 24 +++++++++++++++----
 hw/s390x/virtio-ccw.c          |  6 ++---
 hw/virtio/vhost-user-fs.c      | 12 ++++++----
 hw/virtio/vhost-vsock-common.c | 12 ++++++----
 hw/virtio/vhost.c              | 44 ++++++++++++++++++++++++++++++++--
 hw/virtio/virtio-crypto.c      | 13 ++++++----
 hw/virtio/virtio.c             | 28 ++++++++++++++++++++++
 include/hw/virtio/vhost.h      |  4 ++++
 include/hw/virtio/virtio.h     | 23 ++++++++++++++++--
 include/net/vhost_net.h        |  3 +++
 12 files changed, 169 insertions(+), 30 deletions(-)

diff --git a/hw/display/vhost-user-gpu.c b/hw/display/vhost-user-gpu.c
index 51f1747c4a..959ad115b6 100644
--- a/hw/display/vhost-user-gpu.c
+++ b/hw/display/vhost-user-gpu.c
@@ -487,18 +487,24 @@ vhost_user_gpu_set_status(VirtIODevice *vdev, uint8_t val)
 }
 
 static bool
-vhost_user_gpu_guest_notifier_pending(VirtIODevice *vdev, int idx)
+vhost_user_gpu_guest_notifier_pending(VirtIODevice *vdev, int idx,
+                                            int type)
 {
     VhostUserGPU *g = VHOST_USER_GPU(vdev);
-
+    if (type != VIRTIO_VQ_VECTOR) {
+        return false;
+    }
     return vhost_virtqueue_pending(&g->vhost->dev, idx);
 }
 
 static void
-vhost_user_gpu_guest_notifier_mask(VirtIODevice *vdev, int idx, bool mask)
+vhost_user_gpu_guest_notifier_mask(VirtIODevice *vdev, int idx, bool mask,
+                                        int type)
 {
     VhostUserGPU *g = VHOST_USER_GPU(vdev);
-
+    if (type != VIRTIO_VQ_VECTOR) {
+        return;
+    }
     vhost_virtqueue_mask(&g->vhost->dev, vdev, idx, mask);
 }
 
diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
index 24d555e764..2ef8cc608e 100644
--- a/hw/net/vhost_net.c
+++ b/hw/net/vhost_net.c
@@ -339,7 +339,9 @@ int vhost_net_start(VirtIODevice *dev, NetClientState *ncs,
             dev->use_guest_notifier_mask = false;
         }
      }
-
+    if (ncs->peer && ncs->peer->info->type == NET_CLIENT_DRIVER_VHOST_VDPA) {
+        dev->use_config_notifier = VIRTIO_CONFIG_SUPPORT;
+    }
     r = k->set_guest_notifiers(qbus->parent, total_queues * 2, true);
     if (r < 0) {
         error_report("Error binding guest notifier: %d", -r);
@@ -391,7 +393,6 @@ void vhost_net_stop(VirtIODevice *dev, NetClientState *ncs,
     for (i = 0; i < total_queues; i++) {
         vhost_net_stop_one(get_vhost_net(ncs[i].peer), dev);
     }
-
     r = k->set_guest_notifiers(qbus->parent, total_queues * 2, false);
     if (r < 0) {
         fprintf(stderr, "vhost guest notifier cleanup failed: %d\n", r);
@@ -426,6 +427,17 @@ void vhost_net_virtqueue_mask(VHostNetState *net, VirtIODevice *dev,
     vhost_virtqueue_mask(&net->dev, dev, idx, mask);
 }
 
+bool vhost_net_config_pending(VHostNetState *net, int idx)
+{
+    return vhost_config_pending(&net->dev, idx);
+}
+
+void vhost_net_config_mask(VHostNetState *net, VirtIODevice *dev,
+                              bool mask)
+{
+    vhost_config_mask(&net->dev, dev,  mask);
+}
+
 VHostNetState *get_vhost_net(NetClientState *nc)
 {
     VHostNetState *vhost_net = 0;
diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 9179013ac4..b84427fe99 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -3055,22 +3055,36 @@ static NetClientInfo net_virtio_info = {
     .announce = virtio_net_announce,
 };
 
-static bool virtio_net_guest_notifier_pending(VirtIODevice *vdev, int idx)
+
+static bool virtio_net_guest_notifier_pending(VirtIODevice *vdev, int idx,
+                                int type)
 {
     VirtIONet *n = VIRTIO_NET(vdev);
     NetClientState *nc = qemu_get_subqueue(n->nic, vq2q(idx));
     assert(n->vhost_started);
-    return vhost_net_virtqueue_pending(get_vhost_net(nc->peer), idx);
+
+    if (type == VIRTIO_VQ_VECTOR) {
+        return vhost_net_virtqueue_pending(get_vhost_net(nc->peer), idx);
+    }
+    if (type == VIRTIO_CONFIG_VECTOR) {
+        return vhost_net_config_pending(get_vhost_net(nc->peer), idx);
+    }
+    return false;
 }
 
 static void virtio_net_guest_notifier_mask(VirtIODevice *vdev, int idx,
-                                           bool mask)
+                                           bool mask, int type)
 {
     VirtIONet *n = VIRTIO_NET(vdev);
     NetClientState *nc = qemu_get_subqueue(n->nic, vq2q(idx));
     assert(n->vhost_started);
-    vhost_net_virtqueue_mask(get_vhost_net(nc->peer),
-                             vdev, idx, mask);
+
+    if (type == VIRTIO_VQ_VECTOR) {
+        vhost_net_virtqueue_mask(get_vhost_net(nc->peer), vdev, idx, mask);
+     }
+    if (type == VIRTIO_CONFIG_VECTOR) {
+        vhost_net_config_mask(get_vhost_net(nc->peer), vdev, mask);
+    }
 }
 
 static void virtio_net_set_config_size(VirtIONet *n, uint64_t host_features)
diff --git a/hw/s390x/virtio-ccw.c b/hw/s390x/virtio-ccw.c
index 4582e94ae7..234f749548 100644
--- a/hw/s390x/virtio-ccw.c
+++ b/hw/s390x/virtio-ccw.c
@@ -1003,16 +1003,16 @@ static int virtio_ccw_set_guest_notifier(VirtioCcwDevice *dev, int n,
          * need to manually trigger any guest masking callbacks here.
          */
         if (k->guest_notifier_mask && vdev->use_guest_notifier_mask) {
-            k->guest_notifier_mask(vdev, n, false);
+            k->guest_notifier_mask(vdev, n, false, VIRTIO_VQ_VECTOR);
         }
         /* get lost events and re-inject */
         if (k->guest_notifier_pending &&
-            k->guest_notifier_pending(vdev, n)) {
+            k->guest_notifier_pending(vdev, n, VIRTIO_VQ_VECTOR)) {
             event_notifier_set(notifier);
         }
     } else {
         if (k->guest_notifier_mask && vdev->use_guest_notifier_mask) {
-            k->guest_notifier_mask(vdev, n, true);
+            k->guest_notifier_mask(vdev, n, true, VIRTIO_VQ_VECTOR);
         }
         if (with_irqfd) {
             virtio_ccw_remove_irqfd(dev, n);
diff --git a/hw/virtio/vhost-user-fs.c b/hw/virtio/vhost-user-fs.c
index 1bc5d03a00..22358767f1 100644
--- a/hw/virtio/vhost-user-fs.c
+++ b/hw/virtio/vhost-user-fs.c
@@ -143,17 +143,21 @@ static void vuf_handle_output(VirtIODevice *vdev, VirtQueue *vq)
 }
 
 static void vuf_guest_notifier_mask(VirtIODevice *vdev, int idx,
-                                            bool mask)
+                                            bool mask, int type)
 {
     VHostUserFS *fs = VHOST_USER_FS(vdev);
-
+    if (type != VIRTIO_VQ_VECTOR) {
+        return;
+    }
     vhost_virtqueue_mask(&fs->vhost_dev, vdev, idx, mask);
 }
 
-static bool vuf_guest_notifier_pending(VirtIODevice *vdev, int idx)
+static bool vuf_guest_notifier_pending(VirtIODevice *vdev, int idx, int type)
 {
     VHostUserFS *fs = VHOST_USER_FS(vdev);
-
+    if (type != VIRTIO_VQ_VECTOR) {
+        return false;
+     }
     return vhost_virtqueue_pending(&fs->vhost_dev, idx);
 }
 
diff --git a/hw/virtio/vhost-vsock-common.c b/hw/virtio/vhost-vsock-common.c
index 5b2ebf3496..92c133c54c 100644
--- a/hw/virtio/vhost-vsock-common.c
+++ b/hw/virtio/vhost-vsock-common.c
@@ -97,18 +97,22 @@ static void vhost_vsock_common_handle_output(VirtIODevice *vdev, VirtQueue *vq)
 }
 
 static void vhost_vsock_common_guest_notifier_mask(VirtIODevice *vdev, int idx,
-                                            bool mask)
+                                            bool mask, int type)
 {
     VHostVSockCommon *vvc = VHOST_VSOCK_COMMON(vdev);
-
+    if (type != VIRTIO_VQ_VECTOR) {
+        return;
+    }
     vhost_virtqueue_mask(&vvc->vhost_dev, vdev, idx, mask);
 }
 
 static bool vhost_vsock_common_guest_notifier_pending(VirtIODevice *vdev,
-                                               int idx)
+                                               int idx, int type)
 {
     VHostVSockCommon *vvc = VHOST_VSOCK_COMMON(vdev);
-
+    if (type != VIRTIO_VQ_VECTOR) {
+        return false;
+    }
     return vhost_virtqueue_pending(&vvc->vhost_dev, idx);
 }
 
diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
index 614ccc2bcb..02e4d37dc0 100644
--- a/hw/virtio/vhost.c
+++ b/hw/virtio/vhost.c
@@ -1255,8 +1255,8 @@ static int vhost_virtqueue_init(struct vhost_dev *dev,
     if (r < 0) {
         return r;
     }
-
     file.fd = event_notifier_get_fd(&vq->masked_notifier);
+
     r = dev->vhost_ops->vhost_set_vring_call(dev, &file);
     if (r) {
         VHOST_OPS_DEBUG("vhost_set_vring_call failed");
@@ -1313,6 +1313,10 @@ int vhost_dev_init(struct vhost_dev *hdev, void *opaque,
             goto fail;
         }
     }
+    r = event_notifier_init(&hdev->masked_config_notifier, 0);
+    if (r < 0) {
+        return r;
+    }
 
     if (busyloop_timeout) {
         for (i = 0; i < hdev->nvqs; ++i) {
@@ -1405,6 +1409,8 @@ void vhost_dev_cleanup(struct vhost_dev *hdev)
     for (i = 0; i < hdev->nvqs; ++i) {
         vhost_virtqueue_cleanup(hdev->vqs + i);
     }
+    event_notifier_cleanup(&hdev->masked_config_notifier);
+
     if (hdev->mem) {
         /* those are only safe after successful init */
         memory_listener_unregister(&hdev->memory_listener);
@@ -1498,6 +1504,10 @@ bool vhost_virtqueue_pending(struct vhost_dev *hdev, int n)
     return event_notifier_test_and_clear(&vq->masked_notifier);
 }
 
+bool vhost_config_pending(struct vhost_dev *hdev, int n)
+{
+    return event_notifier_test_and_clear(&hdev->masked_config_notifier);
+}
 /* Mask/unmask events from this vq. */
 void vhost_virtqueue_mask(struct vhost_dev *hdev, VirtIODevice *vdev, int n,
                          bool mask)
@@ -1523,6 +1533,31 @@ void vhost_virtqueue_mask(struct vhost_dev *hdev, VirtIODevice *vdev, int n,
     }
 }
 
+/* Mask/unmask events from this config. */
+void vhost_config_mask(struct vhost_dev *hdev, VirtIODevice *vdev,
+                         bool mask)
+{
+    int fd;
+    int r;
+   EventNotifier *masked_config_notifier = &hdev->masked_config_notifier;
+   EventNotifier *config_notifier = &vdev->config_notifier;
+   if (vdev->use_config_notifier != VIRTIO_CONFIG_WORK) {
+        return;
+    }
+    /* should only be called after backend is connected */
+    assert(hdev->vhost_ops);
+    if (mask) {
+        assert(vdev->use_guest_notifier_mask);
+        fd = event_notifier_get_fd(masked_config_notifier);
+    } else {
+        fd = event_notifier_get_fd(config_notifier);
+    }
+   r = hdev->vhost_ops->vhost_set_config_call(hdev, &fd);
+    if (r < 0) {
+        error_report("vhost_set_config_call failed");
+    }
+}
+
 uint64_t vhost_get_features(struct vhost_dev *hdev, const int *feature_bits,
                             uint64_t features)
 {
@@ -1732,7 +1767,12 @@ int vhost_dev_start(struct vhost_dev *hdev, VirtIODevice *vdev)
             goto fail_vq;
         }
     }
-
+    if (vdev->use_config_notifier == VIRTIO_CONFIG_WORK) {
+        event_notifier_test_and_clear(&hdev->masked_config_notifier);
+        if (!vdev->use_guest_notifier_mask) {
+            vhost_config_mask(hdev, vdev,  false);
+        }
+    }
     if (hdev->log_enabled) {
         uint64_t log_base;
 
diff --git a/hw/virtio/virtio-crypto.c b/hw/virtio/virtio-crypto.c
index 54f9bbb789..ab7958465c 100644
--- a/hw/virtio/virtio-crypto.c
+++ b/hw/virtio/virtio-crypto.c
@@ -941,23 +941,28 @@ static void virtio_crypto_set_status(VirtIODevice *vdev, uint8_t status)
 }
 
 static void virtio_crypto_guest_notifier_mask(VirtIODevice *vdev, int idx,
-                                           bool mask)
+                                           bool mask, int type)
 {
     VirtIOCrypto *vcrypto = VIRTIO_CRYPTO(vdev);
     int queue = virtio_crypto_vq2q(idx);
 
     assert(vcrypto->vhost_started);
-
+    if (type != VIRTIO_VQ_VECTOR) {
+        return;
+    }
     cryptodev_vhost_virtqueue_mask(vdev, queue, idx, mask);
 }
 
-static bool virtio_crypto_guest_notifier_pending(VirtIODevice *vdev, int idx)
+static bool virtio_crypto_guest_notifier_pending(VirtIODevice *vdev, int idx,
+                                           int type)
 {
     VirtIOCrypto *vcrypto = VIRTIO_CRYPTO(vdev);
     int queue = virtio_crypto_vq2q(idx);
 
     assert(vcrypto->vhost_started);
-
+    if (type != VIRTIO_VQ_VECTOR) {
+        return false;
+    }
     return cryptodev_vhost_virtqueue_pending(vdev, queue, idx);
 }
 
diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index ceb58fda6c..7d1a68c87a 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -3278,6 +3278,8 @@ void virtio_init(VirtIODevice *vdev, const char *name,
             virtio_vmstate_change, vdev);
     vdev->device_endian = virtio_default_endian();
     vdev->use_guest_notifier_mask = true;
+    vdev->use_config_notifier = VIRTIO_CONFIG_STATUS_UNKNOWN;
+
 }
 
 /*
@@ -3502,6 +3504,16 @@ static void virtio_queue_guest_notifier_read(EventNotifier *n)
     }
 }
 
+static void virtio_config_read(EventNotifier *n)
+{
+    VirtIODevice *vdev = container_of(n, VirtIODevice, config_notifier);
+    if (vdev->use_config_notifier != VIRTIO_CONFIG_WORK) {
+        return;
+    }
+    if (event_notifier_test_and_clear(n)) {
+        virtio_notify_config(vdev);
+    }
+}
 void virtio_queue_set_guest_notifier_fd_handler(VirtQueue *vq, bool assign,
                                                 bool with_irqfd)
 {
@@ -3518,6 +3530,17 @@ void virtio_queue_set_guest_notifier_fd_handler(VirtQueue *vq, bool assign,
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
+
 EventNotifier *virtio_queue_get_guest_notifier(VirtQueue *vq)
 {
     return &vq->guest_notifier;
@@ -3591,6 +3614,11 @@ EventNotifier *virtio_queue_get_host_notifier(VirtQueue *vq)
     return &vq->host_notifier;
 }
 
+EventNotifier *virtio_get_config_notifier(VirtIODevice *vdev)
+{
+    return &vdev->config_notifier;
+
+}
 void virtio_queue_set_host_notifier_enabled(VirtQueue *vq, bool enabled)
 {
     vq->host_notifier_enabled = enabled;
diff --git a/include/hw/virtio/vhost.h b/include/hw/virtio/vhost.h
index 4a8bc75415..75bbc1a4fa 100644
--- a/include/hw/virtio/vhost.h
+++ b/include/hw/virtio/vhost.h
@@ -91,6 +91,8 @@ struct vhost_dev {
     QLIST_HEAD(, vhost_iommu) iommu_list;
     IOMMUNotifier n;
     const VhostDevConfigOps *config_ops;
+   EventNotifier masked_config_notifier;
+
 };
 
 struct vhost_net {
@@ -108,6 +110,8 @@ int vhost_dev_start(struct vhost_dev *hdev, VirtIODevice *vdev);
 void vhost_dev_stop(struct vhost_dev *hdev, VirtIODevice *vdev);
 int vhost_dev_enable_notifiers(struct vhost_dev *hdev, VirtIODevice *vdev);
 void vhost_dev_disable_notifiers(struct vhost_dev *hdev, VirtIODevice *vdev);
+bool vhost_config_pending(struct vhost_dev *hdev, int n);
+void vhost_config_mask(struct vhost_dev *hdev, VirtIODevice *vdev,  bool mask);
 
 /* Test and clear masked event pending status.
  * Should be called after unmask to avoid losing events.
diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
index b7ece7a6a8..24e5bfae61 100644
--- a/include/hw/virtio/virtio.h
+++ b/include/hw/virtio/virtio.h
@@ -67,6 +67,19 @@ typedef struct VirtQueueElement
 
 #define VIRTIO_NO_VECTOR 0xffff
 
+enum virtio_vector_type {
+    VIRTIO_VQ_VECTOR,
+    VIRTIO_CONFIG_VECTOR,
+    VIRTIO_VECTOR_UNKNOWN,
+};
+
+enum virtio_config_status {
+    VIRTIO_CONFIG_SUPPORT,
+    VIRTIO_CONFIG_WORK,
+    VIRTIO_CONFIG_STOP,
+    VIRTIO_CONFIG_STATUS_UNKNOWN,
+};
+
 #define TYPE_VIRTIO_DEVICE "virtio-device"
 OBJECT_DECLARE_TYPE(VirtIODevice, VirtioDeviceClass, VIRTIO_DEVICE)
 
@@ -108,6 +121,8 @@ struct VirtIODevice
     bool use_guest_notifier_mask;
     AddressSpace *dma_as;
     QLIST_HEAD(, VirtQueue) *vector_queues;
+    EventNotifier config_notifier;
+    enum virtio_config_status use_config_notifier;
 };
 
 struct VirtioDeviceClass {
@@ -138,13 +153,13 @@ struct VirtioDeviceClass {
      * If backend does not support masking,
      * must check in frontend instead.
      */
-    bool (*guest_notifier_pending)(VirtIODevice *vdev, int n);
+    bool (*guest_notifier_pending)(VirtIODevice *vdev, int n, int type);
     /* Mask/unmask events from this vq. Any events reported
      * while masked will become pending.
      * If backend does not support masking,
      * must mask in frontend instead.
      */
-    void (*guest_notifier_mask)(VirtIODevice *vdev, int n, bool mask);
+    void (*guest_notifier_mask)(VirtIODevice *vdev, int n, bool mask, int type);
     int (*start_ioeventfd)(VirtIODevice *vdev);
     void (*stop_ioeventfd)(VirtIODevice *vdev);
     /* Saving and loading of a device; trying to deprecate save/load
@@ -310,11 +325,15 @@ uint16_t virtio_get_queue_index(VirtQueue *vq);
 EventNotifier *virtio_queue_get_guest_notifier(VirtQueue *vq);
 void virtio_queue_set_guest_notifier_fd_handler(VirtQueue *vq, bool assign,
                                                 bool with_irqfd);
+void virtio_set_config_notifier_fd_handler(VirtIODevice *vdev, bool assign,
+                                                bool with_irqfd);
+
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


