Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D87B4649549
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Dec 2022 18:23:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4Q0l-0003jT-Si; Sun, 11 Dec 2022 12:21:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1p4Q0i-0003ir-79
 for qemu-devel@nongnu.org; Sun, 11 Dec 2022 12:21:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1p4Q0a-0004mu-37
 for qemu-devel@nongnu.org; Sun, 11 Dec 2022 12:21:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670779259;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1aIW/mUDvUNgzo0lKwJ3zDDC79kT09Q2RMxY5h2kXrw=;
 b=BQh8rdl+vCeBZUUcFFpdq5fu8CJxFop1/A5uW/0x16D75z/+hBkkRh4VdWguxNCHSUeuea
 PYL6hMMg0wqKjgyiG9SvDQts8fW4WCinI6Xg/Zw/ovEGtdJ3BRiTcuH8X52D4BPKaz44ps
 d95nq8I/k8yl2QiqgxMAA2ERRPweKAQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-395-0rtKw6pAMi2QX1Oj_6EIRw-1; Sun, 11 Dec 2022 12:20:57 -0500
X-MC-Unique: 0rtKw6pAMi2QX1Oj_6EIRw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 669FC2A59543
 for <qemu-devel@nongnu.org>; Sun, 11 Dec 2022 17:20:57 +0000 (UTC)
Received: from server.redhat.com (ovpn-12-92.pek2.redhat.com [10.72.12.92])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 70C692024CC8;
 Sun, 11 Dec 2022 17:20:55 +0000 (UTC)
From: Cindy Lu <lulu@redhat.com>
To: lulu@redhat.com, mst@redhat.com, jasowang@redhat.com, qemu-devel@nongnu.org
Subject: [PATCH v20 01/10] virtio: introduce macro VIRTIO_CONFIG_IRQ_IDX
Date: Mon, 12 Dec 2022 01:20:33 +0800
Message-Id: <20221211172042.3969410-2-lulu@redhat.com>
In-Reply-To: <20221211172042.3969410-1-lulu@redhat.com>
References: <20221211172042.3969410-1-lulu@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=lulu@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

To support configure interrupt for vhost-vdpa
Introduce VIRTIO_CONFIG_IRQ_IDX -1 as configure interrupt's queue index,
Then we can reuse the functions guest_notifier_mask and guest_notifier_pending.
Add the check of queue index in these drivers, if the driver does not support
configure interrupt, the function will just return

Signed-off-by: Cindy Lu <lulu@redhat.com>
---
 hw/display/vhost-user-gpu.c    | 18 ++++++++++++++++++
 hw/net/virtio-net.c            | 22 ++++++++++++++++++++--
 hw/virtio/vhost-user-fs.c      | 18 ++++++++++++++++++
 hw/virtio/vhost-user-gpio.c    | 10 ++++++++++
 hw/virtio/vhost-vsock-common.c | 18 ++++++++++++++++++
 hw/virtio/virtio-crypto.c      | 18 ++++++++++++++++++
 include/hw/virtio/virtio.h     |  3 +++
 7 files changed, 105 insertions(+), 2 deletions(-)

diff --git a/hw/display/vhost-user-gpu.c b/hw/display/vhost-user-gpu.c
index 19c0e20103..4380a5e672 100644
--- a/hw/display/vhost-user-gpu.c
+++ b/hw/display/vhost-user-gpu.c
@@ -486,6 +486,15 @@ vhost_user_gpu_guest_notifier_pending(VirtIODevice *vdev, int idx)
 {
     VhostUserGPU *g = VHOST_USER_GPU(vdev);
 
+    /*
+     * Add the check for configure interrupt, Use VIRTIO_CONFIG_IRQ_IDX -1
+     * as the Marco of configure interrupt's IDX, If this driver does not
+     * support, the function will return
+     */
+
+    if (idx == VIRTIO_CONFIG_IRQ_IDX) {
+        return false;
+    }
     return vhost_virtqueue_pending(&g->vhost->dev, idx);
 }
 
@@ -494,6 +503,15 @@ vhost_user_gpu_guest_notifier_mask(VirtIODevice *vdev, int idx, bool mask)
 {
     VhostUserGPU *g = VHOST_USER_GPU(vdev);
 
+    /*
+     * Add the check for configure interrupt, Use VIRTIO_CONFIG_IRQ_IDX -1
+     * as the Marco of configure interrupt's IDX, If this driver does not
+     * support, the function will return
+     */
+
+    if (idx == VIRTIO_CONFIG_IRQ_IDX) {
+        return;
+    }
     vhost_virtqueue_mask(&g->vhost->dev, vdev, idx, mask);
 }
 
diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index aba12759d5..bee35d6f9f 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -3316,6 +3316,15 @@ static bool virtio_net_guest_notifier_pending(VirtIODevice *vdev, int idx)
     } else {
         nc = qemu_get_subqueue(n->nic, vq2q(idx));
     }
+    /*
+     * Add the check for configure interrupt, Use VIRTIO_CONFIG_IRQ_IDX -1
+     * as the Marco of configure interrupt's IDX, If this driver does not
+     * support, the function will return false
+     */
+
+    if (idx == VIRTIO_CONFIG_IRQ_IDX) {
+        return false;
+    }
     return vhost_net_virtqueue_pending(get_vhost_net(nc->peer), idx);
 }
 
@@ -3339,8 +3348,17 @@ static void virtio_net_guest_notifier_mask(VirtIODevice *vdev, int idx,
     } else {
         nc = qemu_get_subqueue(n->nic, vq2q(idx));
     }
-    vhost_net_virtqueue_mask(get_vhost_net(nc->peer),
-                             vdev, idx, mask);
+    /*
+     *Add the check for configure interrupt, Use VIRTIO_CONFIG_IRQ_IDX -1
+     * as the Marco of configure interrupt's IDX, If this driver does not
+     * support, the function will return
+     */
+
+    if (idx == VIRTIO_CONFIG_IRQ_IDX) {
+        return;
+    }
+
+    vhost_net_virtqueue_mask(get_vhost_net(nc->peer), vdev, idx, mask);
 }
 
 static void virtio_net_set_config_size(VirtIONet *n, uint64_t host_features)
diff --git a/hw/virtio/vhost-user-fs.c b/hw/virtio/vhost-user-fs.c
index d97b179e6f..f5049735ac 100644
--- a/hw/virtio/vhost-user-fs.c
+++ b/hw/virtio/vhost-user-fs.c
@@ -159,6 +159,15 @@ static void vuf_guest_notifier_mask(VirtIODevice *vdev, int idx,
 {
     VHostUserFS *fs = VHOST_USER_FS(vdev);
 
+    /*
+     * Add the check for configure interrupt, Use VIRTIO_CONFIG_IRQ_IDX -1
+     * as the Marco of configure interrupt's IDX, If this driver does not
+     * support, the function will return
+     */
+
+    if (idx == VIRTIO_CONFIG_IRQ_IDX) {
+        return;
+    }
     vhost_virtqueue_mask(&fs->vhost_dev, vdev, idx, mask);
 }
 
@@ -166,6 +175,15 @@ static bool vuf_guest_notifier_pending(VirtIODevice *vdev, int idx)
 {
     VHostUserFS *fs = VHOST_USER_FS(vdev);
 
+    /*
+     * Add the check for configure interrupt, Use VIRTIO_CONFIG_IRQ_IDX -1
+     * as the Marco of configure interrupt's IDX, If this driver does not
+     * support, the function will return
+     */
+
+    if (idx == VIRTIO_CONFIG_IRQ_IDX) {
+        return false;
+    }
     return vhost_virtqueue_pending(&fs->vhost_dev, idx);
 }
 
diff --git a/hw/virtio/vhost-user-gpio.c b/hw/virtio/vhost-user-gpio.c
index b7b82a1099..fe3da32c74 100644
--- a/hw/virtio/vhost-user-gpio.c
+++ b/hw/virtio/vhost-user-gpio.c
@@ -191,6 +191,16 @@ static void vu_gpio_guest_notifier_mask(VirtIODevice *vdev, int idx, bool mask)
 {
     VHostUserGPIO *gpio = VHOST_USER_GPIO(vdev);
 
+    /*
+     * Add the check for configure interrupt, Use VIRTIO_CONFIG_IRQ_IDX -1
+     * as the Marco of configure interrupt's IDX, If this driver does not
+     * support, the function will return
+     */
+
+    if (idx == VIRTIO_CONFIG_IRQ_IDX) {
+        return;
+    }
+
     vhost_virtqueue_mask(&gpio->vhost_dev, vdev, idx, mask);
 }
 
diff --git a/hw/virtio/vhost-vsock-common.c b/hw/virtio/vhost-vsock-common.c
index d21c72b401..d2b5519d5a 100644
--- a/hw/virtio/vhost-vsock-common.c
+++ b/hw/virtio/vhost-vsock-common.c
@@ -127,6 +127,15 @@ static void vhost_vsock_common_guest_notifier_mask(VirtIODevice *vdev, int idx,
 {
     VHostVSockCommon *vvc = VHOST_VSOCK_COMMON(vdev);
 
+    /*
+     * Add the check for configure interrupt, Use VIRTIO_CONFIG_IRQ_IDX -1
+     * as the Marco of configure interrupt's IDX, If this driver does not
+     * support, the function will return
+     */
+
+    if (idx == VIRTIO_CONFIG_IRQ_IDX) {
+        return;
+    }
     vhost_virtqueue_mask(&vvc->vhost_dev, vdev, idx, mask);
 }
 
@@ -135,6 +144,15 @@ static bool vhost_vsock_common_guest_notifier_pending(VirtIODevice *vdev,
 {
     VHostVSockCommon *vvc = VHOST_VSOCK_COMMON(vdev);
 
+    /*
+     * Add the check for configure interrupt, Use VIRTIO_CONFIG_IRQ_IDX -1
+     * as the Marco of configure interrupt's IDX, If this driver does not
+     * support, the function will return
+     */
+
+    if (idx == VIRTIO_CONFIG_IRQ_IDX) {
+        return false;
+    }
     return vhost_virtqueue_pending(&vvc->vhost_dev, idx);
 }
 
diff --git a/hw/virtio/virtio-crypto.c b/hw/virtio/virtio-crypto.c
index 97da74e719..516425e26a 100644
--- a/hw/virtio/virtio-crypto.c
+++ b/hw/virtio/virtio-crypto.c
@@ -1182,6 +1182,15 @@ static void virtio_crypto_guest_notifier_mask(VirtIODevice *vdev, int idx,
 
     assert(vcrypto->vhost_started);
 
+    /*
+     * Add the check for configure interrupt, Use VIRTIO_CONFIG_IRQ_IDX -1
+     * as the Marco of configure interrupt's IDX, If this driver does not
+     * support, the function will return
+     */
+
+    if (idx == VIRTIO_CONFIG_IRQ_IDX) {
+        return;
+    }
     cryptodev_vhost_virtqueue_mask(vdev, queue, idx, mask);
 }
 
@@ -1192,6 +1201,15 @@ static bool virtio_crypto_guest_notifier_pending(VirtIODevice *vdev, int idx)
 
     assert(vcrypto->vhost_started);
 
+    /*
+     * Add the check for configure interrupt, Use VIRTIO_CONFIG_IRQ_IDX -1
+     * as the Marco of configure interrupt's IDX, If this driver does not
+     * support, the function will return
+     */
+
+    if (idx == VIRTIO_CONFIG_IRQ_IDX) {
+        return false;
+    }
     return cryptodev_vhost_virtqueue_pending(vdev, queue, idx);
 }
 
diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
index acfd4df125..1f4a41b958 100644
--- a/include/hw/virtio/virtio.h
+++ b/include/hw/virtio/virtio.h
@@ -79,6 +79,9 @@ typedef struct VirtQueueElement
 
 #define VIRTIO_NO_VECTOR 0xffff
 
+/* special index value used internally for config irqs */
+#define VIRTIO_CONFIG_IRQ_IDX -1
+
 #define TYPE_VIRTIO_DEVICE "virtio-device"
 OBJECT_DECLARE_TYPE(VirtIODevice, VirtioDeviceClass, VIRTIO_DEVICE)
 
-- 
2.34.3


