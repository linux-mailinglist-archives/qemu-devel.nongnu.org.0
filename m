Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84DEE36BDD2
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 05:42:48 +0200 (CEST)
Received: from localhost ([::1]:38346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbEcZ-0007WB-JI
	for lists+qemu-devel@lfdr.de; Mon, 26 Apr 2021 23:42:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1lbEaA-0005hC-0S
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 23:40:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20524)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1lbEa7-0005xq-Q8
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 23:40:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619494813;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q9+cvfM22Mwi6fpKnZdG+Ie0aZ0z7ddga4ndJn2CKYU=;
 b=jCazy0aNV0murkTfKjKPV27K/NuOxSmrKlS+6ltmFWOEY5VZglnE2QceUmkRZESbKVtEuO
 a7wjGb0dY/JaUsMBEHxWl9vZCpacZ/1CzOXRWa7VQbcP67xKGmNj9d/z8yon/ERhrZ2JRi
 5cMpPvneVCcVwzIU3+vcn5YProLFvYA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-238-B24IUpsNONKoRKuVF3JBOw-1; Mon, 26 Apr 2021 23:40:11 -0400
X-MC-Unique: B24IUpsNONKoRKuVF3JBOw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2DC4F343A9
 for <qemu-devel@nongnu.org>; Tue, 27 Apr 2021 03:40:11 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-13-211.pek2.redhat.com [10.72.13.211])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 853A85D9C0;
 Tue, 27 Apr 2021 03:40:09 +0000 (UTC)
From: Cindy Lu <lulu@redhat.com>
To: lulu@redhat.com, mst@redhat.com, jasowang@redhat.com, qemu-devel@nongnu.org
Subject: [PATCH v6 1/9] hw: Add check for queue number
Date: Tue, 27 Apr 2021 11:39:43 +0800
Message-Id: <20210427033951.29805-2-lulu@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lulu@redhat.com;
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

In order to support configure interrupt. we will use queue number -1
as configure interrupt
since all these device are not support the configure interrupt
So we will add an check here, if the idx is -1, the function
will return;

Signed-off-by: Cindy Lu <lulu@redhat.com>
---
 hw/display/vhost-user-gpu.c    |  8 ++++++--
 hw/net/virtio-net.c            | 10 +++++++---
 hw/virtio/vhost-user-fs.c      | 11 +++++++----
 hw/virtio/vhost-vsock-common.c |  8 ++++++--
 hw/virtio/virtio-crypto.c      |  8 ++++++--
 5 files changed, 32 insertions(+), 13 deletions(-)

diff --git a/hw/display/vhost-user-gpu.c b/hw/display/vhost-user-gpu.c
index 51f1747c4a..d8e26cedf1 100644
--- a/hw/display/vhost-user-gpu.c
+++ b/hw/display/vhost-user-gpu.c
@@ -490,7 +490,9 @@ static bool
 vhost_user_gpu_guest_notifier_pending(VirtIODevice *vdev, int idx)
 {
     VhostUserGPU *g = VHOST_USER_GPU(vdev);
-
+    if (idx == -1) {
+        return false;
+    }
     return vhost_virtqueue_pending(&g->vhost->dev, idx);
 }
 
@@ -498,7 +500,9 @@ static void
 vhost_user_gpu_guest_notifier_mask(VirtIODevice *vdev, int idx, bool mask)
 {
     VhostUserGPU *g = VHOST_USER_GPU(vdev);
-
+    if (idx == -1) {
+        return;
+    }
     vhost_virtqueue_mask(&g->vhost->dev, vdev, idx, mask);
 }
 
diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 9179013ac4..78ccaa228c 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -3060,7 +3060,10 @@ static bool virtio_net_guest_notifier_pending(VirtIODevice *vdev, int idx)
     VirtIONet *n = VIRTIO_NET(vdev);
     NetClientState *nc = qemu_get_subqueue(n->nic, vq2q(idx));
     assert(n->vhost_started);
-    return vhost_net_virtqueue_pending(get_vhost_net(nc->peer), idx);
+    if (idx != -1) {
+        return vhost_net_virtqueue_pending(get_vhost_net(nc->peer), idx);
+    }
+    return false;
 }
 
 static void virtio_net_guest_notifier_mask(VirtIODevice *vdev, int idx,
@@ -3069,8 +3072,9 @@ static void virtio_net_guest_notifier_mask(VirtIODevice *vdev, int idx,
     VirtIONet *n = VIRTIO_NET(vdev);
     NetClientState *nc = qemu_get_subqueue(n->nic, vq2q(idx));
     assert(n->vhost_started);
-    vhost_net_virtqueue_mask(get_vhost_net(nc->peer),
-                             vdev, idx, mask);
+    if (idx != -1) {
+        vhost_net_virtqueue_mask(get_vhost_net(nc->peer), vdev, idx, mask);
+     }
 }
 
 static void virtio_net_set_config_size(VirtIONet *n, uint64_t host_features)
diff --git a/hw/virtio/vhost-user-fs.c b/hw/virtio/vhost-user-fs.c
index 1bc5d03a00..37424c2193 100644
--- a/hw/virtio/vhost-user-fs.c
+++ b/hw/virtio/vhost-user-fs.c
@@ -142,18 +142,21 @@ static void vuf_handle_output(VirtIODevice *vdev, VirtQueue *vq)
      */
 }
 
-static void vuf_guest_notifier_mask(VirtIODevice *vdev, int idx,
-                                            bool mask)
+static void vuf_guest_notifier_mask(VirtIODevice *vdev, int idx, bool mask)
 {
     VHostUserFS *fs = VHOST_USER_FS(vdev);
-
+    if (idx == -1) {
+        return;
+    }
     vhost_virtqueue_mask(&fs->vhost_dev, vdev, idx, mask);
 }
 
 static bool vuf_guest_notifier_pending(VirtIODevice *vdev, int idx)
 {
     VHostUserFS *fs = VHOST_USER_FS(vdev);
-
+    if (idx == -1) {
+        return false;
+    }
     return vhost_virtqueue_pending(&fs->vhost_dev, idx);
 }
 
diff --git a/hw/virtio/vhost-vsock-common.c b/hw/virtio/vhost-vsock-common.c
index 5b2ebf3496..0adf823d37 100644
--- a/hw/virtio/vhost-vsock-common.c
+++ b/hw/virtio/vhost-vsock-common.c
@@ -100,7 +100,9 @@ static void vhost_vsock_common_guest_notifier_mask(VirtIODevice *vdev, int idx,
                                             bool mask)
 {
     VHostVSockCommon *vvc = VHOST_VSOCK_COMMON(vdev);
-
+    if (idx == -1) {
+        return;
+    }
     vhost_virtqueue_mask(&vvc->vhost_dev, vdev, idx, mask);
 }
 
@@ -108,7 +110,9 @@ static bool vhost_vsock_common_guest_notifier_pending(VirtIODevice *vdev,
                                                int idx)
 {
     VHostVSockCommon *vvc = VHOST_VSOCK_COMMON(vdev);
-
+    if (idx == -1) {
+        return false;
+    }
     return vhost_virtqueue_pending(&vvc->vhost_dev, idx);
 }
 
diff --git a/hw/virtio/virtio-crypto.c b/hw/virtio/virtio-crypto.c
index 54f9bbb789..c47f4ffb24 100644
--- a/hw/virtio/virtio-crypto.c
+++ b/hw/virtio/virtio-crypto.c
@@ -947,7 +947,9 @@ static void virtio_crypto_guest_notifier_mask(VirtIODevice *vdev, int idx,
     int queue = virtio_crypto_vq2q(idx);
 
     assert(vcrypto->vhost_started);
-
+    if (idx == -1) {
+        return;
+    }
     cryptodev_vhost_virtqueue_mask(vdev, queue, idx, mask);
 }
 
@@ -957,7 +959,9 @@ static bool virtio_crypto_guest_notifier_pending(VirtIODevice *vdev, int idx)
     int queue = virtio_crypto_vq2q(idx);
 
     assert(vcrypto->vhost_started);
-
+    if (idx == -1) {
+        return false;
+    }
     return cryptodev_vhost_virtqueue_pending(vdev, queue, idx);
 }
 
-- 
2.21.3


