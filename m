Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A403F4ED6E1
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 11:28:45 +0200 (CEST)
Received: from localhost ([::1]:39988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZr6i-0004v6-EQ
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 05:28:44 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qiudayu@archeros.com>)
 id 1nZr4Y-0003Uz-I0
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 05:26:30 -0400
Received: from smtpbg516.qq.com ([203.205.250.54]:57482)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qiudayu@archeros.com>)
 id 1nZr4U-0002pT-Cr
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 05:26:30 -0400
X-QQ-mid: bizesmtp63t1648718779tp223fay
Received: from localhost.localdomain.localdoma ( [116.228.45.98])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Thu, 31 Mar 2022 17:26:17 +0800 (CST)
X-QQ-SSF: 01000000000000702000000A0000000
X-QQ-GoodBg: 0
From: qiudayu@archeros.com
To: jasowang@redhat.com,
	mst@redhat.com,
	si-wei.liu@oracle.com
Subject: [PATCH RESEND v3] vdpa: reset the backend device in the end of
 vhost_net_stop() 
Date: Thu, 31 Mar 2022 05:25:13 -0400
Message-Id: <1648718713-7637-1-git-send-email-qiudayu@archeros.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1648634561-12504-1-git-send-email-08005325@163.com>
References: <1648634561-12504-1-git-send-email-08005325@163.com>
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:archeros.com:qybgforeign:qybgforeign8
X-QQ-Bgrelay: 1
Received-SPF: none client-ip=203.205.250.54; envelope-from=qiudayu@archeros.com;
 helo=smtpbg516.qq.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Michael Qiu <qiudayu@archeros.com>, eperezma@redhat.com,
 lingshan.zhu@intel.com, qemu-devel@nongnu.org, lulu@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Michael Qiu <qiudayu@archeros.com>

Currently, when VM poweroff, it will trigger vdpa
device(such as mlx bluefield2 VF) reset many times(with 1 datapath
queue pair and one control queue, triggered 3 times), this
leads to below issue:

vhost VQ 2 ring restore failed: -22: Invalid argument (22)

This because in vhost_net_stop(), it will stop all vhost device bind to
this virtio device, and in vhost_dev_stop(), qemu tries to stop the device
, then stop the queue: vhost_virtqueue_stop().

In vhost_dev_stop(), it resets the device, which clear some flags
in low level driver, and in next loop(stop other vhost backends),
qemu try to stop the queue corresponding to the vhost backend,
 the driver finds that the VQ is invalied, this is the root cause.

To solve the issue, vdpa should set vring unready, and
remove reset ops in device stop: vhost_dev_start(hdev, false).

and implement a new function vhost_dev_reset, only reset backend
device after all vhost(per-queue) stoped.

Signed-off-by: Michael Qiu<qiudayu@archeros.com>
Acked-by: Jason Wang <jasowang@redhat.com>
---
v3 --> v2:
    Call vhost_dev_reset() at the end of vhost_net_stop().

    Since the vDPA device need re-add the status bit 
    VIRTIO_CONFIG_S_ACKNOWLEDGE and VIRTIO_CONFIG_S_DRIVER,
    simply, add them inside vhost_vdpa_reset_device, and
    the only way calling vhost_vdpa_reset_device is in
    vhost_net_stop(), so it keeps the same behavior as before.

v2 --> v1:
   Implement a new function vhost_dev_reset,
   reset the backend kernel device at last.
---
 hw/net/vhost_net.c        | 24 +++++++++++++++++++++---
 hw/virtio/vhost-vdpa.c    | 15 +++++++++------
 hw/virtio/vhost.c         | 15 ++++++++++++++-
 include/hw/virtio/vhost.h |  1 +
 4 files changed, 45 insertions(+), 10 deletions(-)

diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
index 30379d2..422c9bf 100644
--- a/hw/net/vhost_net.c
+++ b/hw/net/vhost_net.c
@@ -325,7 +325,7 @@ int vhost_net_start(VirtIODevice *dev, NetClientState *ncs,
     int total_notifiers = data_queue_pairs * 2 + cvq;
     VirtIONet *n = VIRTIO_NET(dev);
     int nvhosts = data_queue_pairs + cvq;
-    struct vhost_net *net;
+    struct vhost_net *net = NULL;
     int r, e, i, index_end = data_queue_pairs * 2;
     NetClientState *peer;
 
@@ -391,8 +391,17 @@ int vhost_net_start(VirtIODevice *dev, NetClientState *ncs,
 err_start:
     while (--i >= 0) {
         peer = qemu_get_peer(ncs , i);
-        vhost_net_stop_one(get_vhost_net(peer), dev);
+
+        net = get_vhost_net(peer);
+
+        vhost_net_stop_one(net, dev);
     }
+
+    /* We only reset backend vdpa device */
+    if (net && net->dev.vhost_ops->backend_type == VHOST_BACKEND_TYPE_VDPA) {
+        vhost_dev_reset(&net->dev);
+    }
+
     e = k->set_guest_notifiers(qbus->parent, total_notifiers, false);
     if (e < 0) {
         fprintf(stderr, "vhost guest notifier cleanup failed: %d\n", e);
@@ -410,6 +419,7 @@ void vhost_net_stop(VirtIODevice *dev, NetClientState *ncs,
     VirtioBusClass *k = VIRTIO_BUS_GET_CLASS(vbus);
     VirtIONet *n = VIRTIO_NET(dev);
     NetClientState *peer;
+    struct vhost_net *net = NULL;
     int total_notifiers = data_queue_pairs * 2 + cvq;
     int nvhosts = data_queue_pairs + cvq;
     int i, r;
@@ -420,7 +430,15 @@ void vhost_net_stop(VirtIODevice *dev, NetClientState *ncs,
         } else {
             peer = qemu_get_peer(ncs, n->max_queue_pairs);
         }
-        vhost_net_stop_one(get_vhost_net(peer), dev);
+
+        net = get_vhost_net(peer);
+
+        vhost_net_stop_one(net, dev);
+    }
+
+    /* We only reset backend vdpa device */
+    if (net && net->dev.vhost_ops->backend_type == VHOST_BACKEND_TYPE_VDPA) {
+        vhost_dev_reset(&net->dev);
     }
 
     r = k->set_guest_notifiers(qbus->parent, total_notifiers, false);
diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index c5ed7a3..3ef0199 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -708,6 +708,11 @@ static int vhost_vdpa_reset_device(struct vhost_dev *dev)
 
     ret = vhost_vdpa_call(dev, VHOST_VDPA_SET_STATUS, &status);
     trace_vhost_vdpa_reset_device(dev, status);
+
+    /* Add back this status, so that the device could work next time*/
+    vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_ACKNOWLEDGE |
+                               VIRTIO_CONFIG_S_DRIVER);
+
     return ret;
 }
 
@@ -719,14 +724,14 @@ static int vhost_vdpa_get_vq_index(struct vhost_dev *dev, int idx)
     return idx;
 }
 
-static int vhost_vdpa_set_vring_ready(struct vhost_dev *dev)
+static int vhost_vdpa_set_vring_ready(struct vhost_dev *dev, unsigned int ready)
 {
     int i;
     trace_vhost_vdpa_set_vring_ready(dev);
     for (i = 0; i < dev->nvqs; ++i) {
         struct vhost_vring_state state = {
             .index = dev->vq_index + i,
-            .num = 1,
+            .num = ready,
         };
         vhost_vdpa_call(dev, VHOST_VDPA_SET_VRING_ENABLE, &state);
     }
@@ -1088,8 +1093,9 @@ static int vhost_vdpa_dev_start(struct vhost_dev *dev, bool started)
         if (unlikely(!ok)) {
             return -1;
         }
-        vhost_vdpa_set_vring_ready(dev);
+        vhost_vdpa_set_vring_ready(dev, 1);
     } else {
+        vhost_vdpa_set_vring_ready(dev, 0);
         ok = vhost_vdpa_svqs_stop(dev);
         if (unlikely(!ok)) {
             return -1;
@@ -1105,9 +1111,6 @@ static int vhost_vdpa_dev_start(struct vhost_dev *dev, bool started)
         memory_listener_register(&v->listener, &address_space_memory);
         return vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_DRIVER_OK);
     } else {
-        vhost_vdpa_reset_device(dev);
-        vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_ACKNOWLEDGE |
-                                   VIRTIO_CONFIG_S_DRIVER);
         memory_listener_unregister(&v->listener);
 
         return 0;
diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
index b643f42..7e0cdb6 100644
--- a/hw/virtio/vhost.c
+++ b/hw/virtio/vhost.c
@@ -1820,7 +1820,6 @@ fail_features:
 void vhost_dev_stop(struct vhost_dev *hdev, VirtIODevice *vdev)
 {
     int i;
-
     /* should only be called after backend is connected */
     assert(hdev->vhost_ops);
 
@@ -1854,3 +1853,17 @@ int vhost_net_set_backend(struct vhost_dev *hdev,
 
     return -ENOSYS;
 }
+
+int vhost_dev_reset(struct vhost_dev *hdev)
+{
+    int ret = 0;
+
+    /* should only be called after backend is connected */
+    assert(hdev->vhost_ops);
+
+    if (hdev->vhost_ops->vhost_reset_device) {
+        ret = hdev->vhost_ops->vhost_reset_device(hdev);
+    }
+
+    return ret;
+}
diff --git a/include/hw/virtio/vhost.h b/include/hw/virtio/vhost.h
index 58a73e7..b8b7c20 100644
--- a/include/hw/virtio/vhost.h
+++ b/include/hw/virtio/vhost.h
@@ -114,6 +114,7 @@ int vhost_dev_init(struct vhost_dev *hdev, void *opaque,
 void vhost_dev_cleanup(struct vhost_dev *hdev);
 int vhost_dev_start(struct vhost_dev *hdev, VirtIODevice *vdev);
 void vhost_dev_stop(struct vhost_dev *hdev, VirtIODevice *vdev);
+int vhost_dev_reset(struct vhost_dev *hdev);
 int vhost_dev_enable_notifiers(struct vhost_dev *hdev, VirtIODevice *vdev);
 void vhost_dev_disable_notifiers(struct vhost_dev *hdev, VirtIODevice *vdev);
 
-- 
1.8.3.1




