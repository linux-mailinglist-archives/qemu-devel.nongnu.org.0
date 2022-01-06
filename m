Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E4FD486544
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 14:28:03 +0100 (CET)
Received: from localhost ([::1]:60636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5SoE-0007B6-E6
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 08:28:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5Sd7-00041T-Gq
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 08:16:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21870)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5Sd5-0000mp-Km
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 08:16:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641474990;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4xF0oyxSEx4yZpu2UWzU3ZDgd5LpH3STc2xOOd8w1GU=;
 b=Odya/Hajzv384fDJJfOf901tGX5a5ysIYwoVzHRnOefstEMba+E5u9O1M3rg7vQzDFBmvJ
 ILxnrr5KORqyGz32P74oYY4dvgwZZsA3Av2hzpWkYfxWNe/c+bBCN8iiB+HyUb0v2gpFmz
 W/nuHNR6xkAjoSi8rZJFdDgAwpi1/Xc=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-507-PtVDgtunNDeFF_t-V6THhA-1; Thu, 06 Jan 2022 08:16:29 -0500
X-MC-Unique: PtVDgtunNDeFF_t-V6THhA-1
Received: by mail-wr1-f71.google.com with SMTP id
 t26-20020adfa2da000000b001a585909b5dso99245wra.6
 for <qemu-devel@nongnu.org>; Thu, 06 Jan 2022 05:16:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=4xF0oyxSEx4yZpu2UWzU3ZDgd5LpH3STc2xOOd8w1GU=;
 b=GwQDVmVk5qCBvfA3yT5ZryzdwxwQSSHrUd6DJ60b+TqdiLwOE1oGBkGw8vFaZX6u0s
 Tk2zJ95OJB0TIp4kS2X4zI8WS7I6Mtqd7pF9lXTKzU2prs9294MPZsfQiimzo6H1MY06
 hMWpowQLA3TBUle3O1vBDcj56NPI+xLoWyFBRtrDIBA0nVp10a8LCu0h2P23DkXQsmpD
 JsdtLSBKxf+JylmZG8fIPQvzuUQTmP8W/NgnoKqYmA5YT5oxkclDnQ3ggFcgBXrUZWiU
 DaaGQZ+quiAWqYJvT43r0af9OUFP0oAzy33FnB2po3Dq63qvdiILmxf5yXNwjjHgO2/L
 +UTA==
X-Gm-Message-State: AOAM530q4/sJg9PQKqH8g7qQ8uUQSDILfWpzZkqgH5leUqAKFEXOqkk3
 6A42fr640eHbg1IiF8LAcUIdV72YgAj7shrIP8Gh+nwYBhsTudViSLlTQ2mpAy+6hFT7DL8F9Np
 fpFN1TU496jlig+nOa24b0N09Uf4hUczZBpdpK5kYv+jA+qlF1Bq7Dg+oLj5Q
X-Received: by 2002:a1c:f414:: with SMTP id z20mr7063753wma.17.1641474986639; 
 Thu, 06 Jan 2022 05:16:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyavRknoFrp8+NvBMCQ1BfuY6iASLVZk1xSmc0lQUPnbiUNFzV+8byfSfN+uJDpMhbLCd+4VQ==
X-Received: by 2002:a1c:f414:: with SMTP id z20mr7063721wma.17.1641474986362; 
 Thu, 06 Jan 2022 05:16:26 -0800 (PST)
Received: from redhat.com ([2a03:c5c0:207e:991b:6857:5652:b903:a63b])
 by smtp.gmail.com with ESMTPSA id b1sm2291915wrd.92.2022.01.06.05.16.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jan 2022 05:16:25 -0800 (PST)
Date: Thu, 6 Jan 2022 08:16:23 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 03/52] virtio: introduce macro IRTIO_CONFIG_IRQ_IDX
Message-ID: <20220106131534.423671-4-mst@redhat.com>
References: <20220106131534.423671-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220106131534.423671-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Cindy Lu <lulu@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, virtio-fs@redhat.com,
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Cindy Lu <lulu@redhat.com>

To support configure interrupt for vhost-vdpa
Introduce VIRTIO_CONFIG_IRQ_IDX -1 as configure interrupt's queue index,
Then we can reuse the functions guest_notifier_mask and guest_notifier_pending.
Add the check of queue index in these drivers, if the driver does not support
configure interrupt, the function will just return

Signed-off-by: Cindy Lu <lulu@redhat.com>
Message-Id: <20211104164827.21911-2-lulu@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/virtio/virtio.h     |  3 +++
 hw/display/vhost-user-gpu.c    |  6 ++++++
 hw/net/virtio-net.c            | 10 ++++++++--
 hw/virtio/vhost-user-fs.c      |  6 ++++++
 hw/virtio/vhost-vsock-common.c |  6 ++++++
 hw/virtio/virtio-crypto.c      |  6 ++++++
 6 files changed, 35 insertions(+), 2 deletions(-)

diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
index 8bab9cfb75..605ea79c90 100644
--- a/include/hw/virtio/virtio.h
+++ b/include/hw/virtio/virtio.h
@@ -67,6 +67,9 @@ typedef struct VirtQueueElement
 
 #define VIRTIO_NO_VECTOR 0xffff
 
+/* special index value used internally for config irqs */
+#define VIRTIO_CONFIG_IRQ_IDX -1
+
 #define TYPE_VIRTIO_DEVICE "virtio-device"
 OBJECT_DECLARE_TYPE(VirtIODevice, VirtioDeviceClass, VIRTIO_DEVICE)
 
diff --git a/hw/display/vhost-user-gpu.c b/hw/display/vhost-user-gpu.c
index 09818231bd..d4a440e815 100644
--- a/hw/display/vhost-user-gpu.c
+++ b/hw/display/vhost-user-gpu.c
@@ -485,6 +485,9 @@ vhost_user_gpu_guest_notifier_pending(VirtIODevice *vdev, int idx)
 {
     VhostUserGPU *g = VHOST_USER_GPU(vdev);
 
+    if (idx == VIRTIO_CONFIG_IRQ_IDX) {
+        return false;
+    }
     return vhost_virtqueue_pending(&g->vhost->dev, idx);
 }
 
@@ -493,6 +496,9 @@ vhost_user_gpu_guest_notifier_mask(VirtIODevice *vdev, int idx, bool mask)
 {
     VhostUserGPU *g = VHOST_USER_GPU(vdev);
 
+    if (idx == VIRTIO_CONFIG_IRQ_IDX) {
+        return;
+    }
     vhost_virtqueue_mask(&g->vhost->dev, vdev, idx, mask);
 }
 
diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index cf8ab0f8af..5e03c0dd14 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -3168,6 +3168,9 @@ static bool virtio_net_guest_notifier_pending(VirtIODevice *vdev, int idx)
     VirtIONet *n = VIRTIO_NET(vdev);
     NetClientState *nc = qemu_get_subqueue(n->nic, vq2q(idx));
     assert(n->vhost_started);
+    if (idx == VIRTIO_CONFIG_IRQ_IDX) {
+        return false;
+    }
     return vhost_net_virtqueue_pending(get_vhost_net(nc->peer), idx);
 }
 
@@ -3177,8 +3180,11 @@ static void virtio_net_guest_notifier_mask(VirtIODevice *vdev, int idx,
     VirtIONet *n = VIRTIO_NET(vdev);
     NetClientState *nc = qemu_get_subqueue(n->nic, vq2q(idx));
     assert(n->vhost_started);
-    vhost_net_virtqueue_mask(get_vhost_net(nc->peer),
-                             vdev, idx, mask);
+    if (idx == VIRTIO_CONFIG_IRQ_IDX) {
+        return;
+    }
+
+    vhost_net_virtqueue_mask(get_vhost_net(nc->peer), vdev, idx, mask);
 }
 
 static void virtio_net_set_config_size(VirtIONet *n, uint64_t host_features)
diff --git a/hw/virtio/vhost-user-fs.c b/hw/virtio/vhost-user-fs.c
index c595957983..9b0349922e 100644
--- a/hw/virtio/vhost-user-fs.c
+++ b/hw/virtio/vhost-user-fs.c
@@ -161,6 +161,9 @@ static void vuf_guest_notifier_mask(VirtIODevice *vdev, int idx,
 {
     VHostUserFS *fs = VHOST_USER_FS(vdev);
 
+    if (idx == VIRTIO_CONFIG_IRQ_IDX) {
+        return;
+    }
     vhost_virtqueue_mask(&fs->vhost_dev, vdev, idx, mask);
 }
 
@@ -168,6 +171,9 @@ static bool vuf_guest_notifier_pending(VirtIODevice *vdev, int idx)
 {
     VHostUserFS *fs = VHOST_USER_FS(vdev);
 
+    if (idx == VIRTIO_CONFIG_IRQ_IDX) {
+        return false;
+    }
     return vhost_virtqueue_pending(&fs->vhost_dev, idx);
 }
 
diff --git a/hw/virtio/vhost-vsock-common.c b/hw/virtio/vhost-vsock-common.c
index 3f3771274e..d1b9c027b6 100644
--- a/hw/virtio/vhost-vsock-common.c
+++ b/hw/virtio/vhost-vsock-common.c
@@ -125,6 +125,9 @@ static void vhost_vsock_common_guest_notifier_mask(VirtIODevice *vdev, int idx,
 {
     VHostVSockCommon *vvc = VHOST_VSOCK_COMMON(vdev);
 
+    if (idx == VIRTIO_CONFIG_IRQ_IDX) {
+        return;
+    }
     vhost_virtqueue_mask(&vvc->vhost_dev, vdev, idx, mask);
 }
 
@@ -133,6 +136,9 @@ static bool vhost_vsock_common_guest_notifier_pending(VirtIODevice *vdev,
 {
     VHostVSockCommon *vvc = VHOST_VSOCK_COMMON(vdev);
 
+    if (idx == VIRTIO_CONFIG_IRQ_IDX) {
+        return false;
+    }
     return vhost_virtqueue_pending(&vvc->vhost_dev, idx);
 }
 
diff --git a/hw/virtio/virtio-crypto.c b/hw/virtio/virtio-crypto.c
index 54f9bbb789..1d5192f8b4 100644
--- a/hw/virtio/virtio-crypto.c
+++ b/hw/virtio/virtio-crypto.c
@@ -948,6 +948,9 @@ static void virtio_crypto_guest_notifier_mask(VirtIODevice *vdev, int idx,
 
     assert(vcrypto->vhost_started);
 
+    if (idx == VIRTIO_CONFIG_IRQ_IDX) {
+        return;
+    }
     cryptodev_vhost_virtqueue_mask(vdev, queue, idx, mask);
 }
 
@@ -958,6 +961,9 @@ static bool virtio_crypto_guest_notifier_pending(VirtIODevice *vdev, int idx)
 
     assert(vcrypto->vhost_started);
 
+    if (idx == VIRTIO_CONFIG_IRQ_IDX) {
+        return false;
+    }
     return cryptodev_vhost_virtqueue_pending(vdev, queue, idx);
 }
 
-- 
MST


