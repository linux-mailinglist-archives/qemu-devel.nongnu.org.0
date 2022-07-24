Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C069B57F389
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Jul 2022 08:57:39 +0200 (CEST)
Received: from localhost ([::1]:43424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oFVYY-0006dc-TF
	for lists+qemu-devel@lfdr.de; Sun, 24 Jul 2022 02:57:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1oFVMV-0004Pv-9D
 for qemu-devel@nongnu.org; Sun, 24 Jul 2022 02:45:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56617)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1oFVMT-0003N7-Gj
 for qemu-devel@nongnu.org; Sun, 24 Jul 2022 02:45:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658645108;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=i6mN44fkdddLIPK1oj9Nw2c5VmWN2IOoaODCpqqcQhk=;
 b=B/cOOfCShNK1NVXv//or1vlIqQGtP9R6jthZ5qekuHZo2Pq4UTw42rh9Ecl4VPDZ839OkO
 Lh88+37SzS7FwZDCWXF6ZQjydLeAaTbrGELclYqZOCgqPIiVICVSUrtENgPHvbOc0srON0
 r65J27fiB74537HVJxqsuQCD/qwD50E=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-227-2YibO4R7MFeVlfWVL4ghQA-1; Sun, 24 Jul 2022 02:45:05 -0400
X-MC-Unique: 2YibO4R7MFeVlfWVL4ghQA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 200A6280048C;
 Sun, 24 Jul 2022 06:45:05 +0000 (UTC)
Received: from server.redhat.com (ovpn-12-73.pek2.redhat.com [10.72.12.73])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4E9F91415118;
 Sun, 24 Jul 2022 06:45:01 +0000 (UTC)
From: Cindy Lu <lulu@redhat.com>
To: qemu-devel@nongnu.org,
	lulu@redhat.com
Cc: Stefan Hajnoczi <stefanha@redhat.com>, virtio-fs@redhat.com,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Jason Wang <jasowang@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Subject: [PATCH v15 01/10] virtio: introduce macro VIRTIO_CONFIG_IRQ_IDX
Date: Sun, 24 Jul 2022 14:44:45 +0800
Message-Id: <20220724064454.875882-2-lulu@redhat.com>
In-Reply-To: <20220724064454.875882-1-lulu@redhat.com>
References: <20220724064454.875882-1-lulu@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=lulu@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

To support configure interrupt for vhost-vdpa
Introduce VIRTIO_CONFIG_IRQ_IDX -1 as configure interrupt's queue index,
Then we can reuse the functions guest_notifier_mask and guest_notifier_pending.
Add the check of queue index in these drivers, if the driver does not support
configure interrupt, the function will just return

Signed-off-by: Cindy Lu <lulu@redhat.com>
---
 hw/display/vhost-user-gpu.c    | 15 +++++++++++++++
 hw/net/virtio-net.c            | 20 ++++++++++++++++++--
 hw/virtio/vhost-user-fs.c      | 16 ++++++++++++++++
 hw/virtio/vhost-vsock-common.c | 16 ++++++++++++++++
 hw/virtio/virtio-crypto.c      | 16 ++++++++++++++++
 include/hw/virtio/virtio.h     |  3 +++
 6 files changed, 84 insertions(+), 2 deletions(-)

diff --git a/hw/display/vhost-user-gpu.c b/hw/display/vhost-user-gpu.c
index 3340ef9e5f..8454514da5 100644
--- a/hw/display/vhost-user-gpu.c
+++ b/hw/display/vhost-user-gpu.c
@@ -485,6 +485,13 @@ vhost_user_gpu_guest_notifier_pending(VirtIODevice *vdev, int idx)
 {
     VhostUserGPU *g = VHOST_USER_GPU(vdev);
 
+    /* Add the check for configure interrupt, we use VIRTIO_CONFIG_IRQ_IDX -1
+     * as the Marco of configure interrupt, If this driver does not
+     * support, the function will just return false
+     */
+    if (idx == VIRTIO_CONFIG_IRQ_IDX) {
+        return false;
+    }
     return vhost_virtqueue_pending(&g->vhost->dev, idx);
 }
 
@@ -493,6 +500,14 @@ vhost_user_gpu_guest_notifier_mask(VirtIODevice *vdev, int idx, bool mask)
 {
     VhostUserGPU *g = VHOST_USER_GPU(vdev);
 
+    /* Add the check for configure interrupt,Here use VIRTIO_CONFIG_IRQ_IDX -1
+     * as the Marco of configure interrupt, If this driver does not
+     * support, the function will return
+     */
+
+    if (idx == VIRTIO_CONFIG_IRQ_IDX) {
+        return;
+    }
     vhost_virtqueue_mask(&g->vhost->dev, vdev, idx, mask);
 }
 
diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index dd0d056fde..b6d36b034c 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -3215,6 +3215,14 @@ static bool virtio_net_guest_notifier_pending(VirtIODevice *vdev, int idx)
     } else {
         nc = qemu_get_subqueue(n->nic, vq2q(idx));
     }
+    /* Add the check for configure interrupt, Use VIRTIO_CONFIG_IRQ_IDX -1
+     * as the Marco of configure interrupt's IDX, If this driver does not
+     * support, the function will return false
+     */
+
+    if (idx == VIRTIO_CONFIG_IRQ_IDX) {
+        return false;
+    }
     return vhost_net_virtqueue_pending(get_vhost_net(nc->peer), idx);
 }
 
@@ -3238,8 +3246,16 @@ static void virtio_net_guest_notifier_mask(VirtIODevice *vdev, int idx,
     } else {
         nc = qemu_get_subqueue(n->nic, vq2q(idx));
     }
-    vhost_net_virtqueue_mask(get_vhost_net(nc->peer),
-                             vdev, idx, mask);
+    /* Add the check for configure interrupt, Use VIRTIO_CONFIG_IRQ_IDX -1
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
index e513e4fdda..806c7680f0 100644
--- a/hw/virtio/vhost-user-fs.c
+++ b/hw/virtio/vhost-user-fs.c
@@ -161,6 +161,14 @@ static void vuf_guest_notifier_mask(VirtIODevice *vdev, int idx,
 {
     VHostUserFS *fs = VHOST_USER_FS(vdev);
 
+    /* Add the check for configure interrupt, Use VIRTIO_CONFIG_IRQ_IDX -1
+     * as the Marco of configure interrupt's IDX, If this driver does not
+     * support, the function will return
+     */
+
+    if (idx == VIRTIO_CONFIG_IRQ_IDX) {
+        return;
+    }
     vhost_virtqueue_mask(&fs->vhost_dev, vdev, idx, mask);
 }
 
@@ -168,6 +176,14 @@ static bool vuf_guest_notifier_pending(VirtIODevice *vdev, int idx)
 {
     VHostUserFS *fs = VHOST_USER_FS(vdev);
 
+    /* Add the check for configure interrupt, Use VIRTIO_CONFIG_IRQ_IDX -1
+     * as the Marco of configure interrupt's IDX, If this driver does not
+     * support, the function will return
+     */
+
+    if (idx == VIRTIO_CONFIG_IRQ_IDX) {
+        return false;
+    }
     return vhost_virtqueue_pending(&fs->vhost_dev, idx);
 }
 
diff --git a/hw/virtio/vhost-vsock-common.c b/hw/virtio/vhost-vsock-common.c
index 7394818e00..37a20ffe8a 100644
--- a/hw/virtio/vhost-vsock-common.c
+++ b/hw/virtio/vhost-vsock-common.c
@@ -125,6 +125,14 @@ static void vhost_vsock_common_guest_notifier_mask(VirtIODevice *vdev, int idx,
 {
     VHostVSockCommon *vvc = VHOST_VSOCK_COMMON(vdev);
 
+    /* Add the check for configure interrupt, Use VIRTIO_CONFIG_IRQ_IDX -1
+     * as the Marco of configure interrupt's IDX, If this driver does not
+     * support, the function will return
+     */
+
+    if (idx == VIRTIO_CONFIG_IRQ_IDX) {
+        return;
+    }
     vhost_virtqueue_mask(&vvc->vhost_dev, vdev, idx, mask);
 }
 
@@ -133,6 +141,14 @@ static bool vhost_vsock_common_guest_notifier_pending(VirtIODevice *vdev,
 {
     VHostVSockCommon *vvc = VHOST_VSOCK_COMMON(vdev);
 
+    /* Add the check for configure interrupt, Use VIRTIO_CONFIG_IRQ_IDX -1
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
index c1243c3f93..fbf37e140d 100644
--- a/hw/virtio/virtio-crypto.c
+++ b/hw/virtio/virtio-crypto.c
@@ -1139,6 +1139,14 @@ static void virtio_crypto_guest_notifier_mask(VirtIODevice *vdev, int idx,
 
     assert(vcrypto->vhost_started);
 
+    /* Add the check for configure interrupt, Use VIRTIO_CONFIG_IRQ_IDX -1
+     * as the Marco of configure interrupt's IDX, If this driver does not
+     * support, the function will return
+     */
+
+    if (idx == VIRTIO_CONFIG_IRQ_IDX) {
+        return;
+    }
     cryptodev_vhost_virtqueue_mask(vdev, queue, idx, mask);
 }
 
@@ -1149,6 +1157,14 @@ static bool virtio_crypto_guest_notifier_pending(VirtIODevice *vdev, int idx)
 
     assert(vcrypto->vhost_started);
 
+    /* Add the check for configure interrupt, Use VIRTIO_CONFIG_IRQ_IDX -1
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
index db1c0ddf6b..e985ef133f 100644
--- a/include/hw/virtio/virtio.h
+++ b/include/hw/virtio/virtio.h
@@ -68,6 +68,9 @@ typedef struct VirtQueueElement
 
 #define VIRTIO_NO_VECTOR 0xffff
 
+/* special index value used internally for config irqs */
+#define VIRTIO_CONFIG_IRQ_IDX -1
+
 #define TYPE_VIRTIO_DEVICE "virtio-device"
 OBJECT_DECLARE_TYPE(VirtIODevice, VirtioDeviceClass, VIRTIO_DEVICE)
 
-- 
2.34.3


