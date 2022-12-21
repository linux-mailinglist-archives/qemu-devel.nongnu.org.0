Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8906D65314A
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 14:06:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7ymy-0005PO-PI; Wed, 21 Dec 2022 08:05:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p7ymh-0005HR-Io
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 08:05:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p7ymf-0004Co-K0
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 08:05:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671627921;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z6uUZJM76yhW3oPMiyBoT3M7CjW+zFWDbNucvFBesEk=;
 b=f6rRq9N89+qjnZIQm4d/hhoibaJwZ/eOwQLuTxQuv9yciTV1KoqHZSFAG23PdtjLQxF3X3
 6MsxSIIkoHwdj9zHmZMPYkr9hvs+gxPrjLOJzPcpiFfMpenMpsgfghORp3AnUC2GOLxr5u
 AEtZjRVapsch71YEMoh15mCntaKYpCs=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-290-UfU8sQpNN2ih3qP5xvTCDg-1; Wed, 21 Dec 2022 08:05:19 -0500
X-MC-Unique: UfU8sQpNN2ih3qP5xvTCDg-1
Received: by mail-wm1-f72.google.com with SMTP id
 r129-20020a1c4487000000b003d153a83d27so7940056wma.0
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 05:05:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=z6uUZJM76yhW3oPMiyBoT3M7CjW+zFWDbNucvFBesEk=;
 b=sr0n7bbqOVyzD0TCvOuKeFBrIhcIV3oouDCt2fsQg7Y+v/2AXOxIZ6BDlkSsAiW0w/
 oD/twhxqDhC31Slev2Sjj8zeWsrG5eQerWwrbzeXnKLWtY+k25IcHJBJ1iDMDzeyD1em
 xrRyBaGcbDaM/0rVXCFUU5d4iuUwMPrrdPKhx+7XkA3yFkveQHGz+dCSmgBpGPq2b03f
 pLGCVMz+Ov1iC0fDKjk8AWT5dFnLugPRdsRkqFAkC285usF8NdcU2IBu8I9Uc10WmM3D
 5A7dZ84huCY4nyjUBYprlt5pbPJ6/A2U4p8Xi14hcqw0xjNX4pV68BUaps/uoS23B93P
 n43g==
X-Gm-Message-State: AFqh2kpy8RgygIFh7OFTFDZKe8upMhqaI2W+NtO4J34jiIOa+V/KMFRB
 CJYwHHip0HAfw6vIT79jqeujqO7V15p3W75QLUR3n+0mq+1J1Xxtod84CpZGq7dMr3CC2f8iWbm
 /rtXQKOvE35Nu5nynvUbMwdMqGopT2Zd3ke5lPudYIhNBw1vPN6HHjSCanwFE
X-Received: by 2002:a05:600c:3789:b0:3d1:f234:12cc with SMTP id
 o9-20020a05600c378900b003d1f23412ccmr1349636wmr.33.1671627916971; 
 Wed, 21 Dec 2022 05:05:16 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvj9x8+3y6+9Af606sNFlHRiL4E9cSWhD4I27Kx5h9XzctVM6Z2+C9RRmx6TaZd4Yf4Ta8y/Q==
X-Received: by 2002:a05:600c:3789:b0:3d1:f234:12cc with SMTP id
 o9-20020a05600c378900b003d1f23412ccmr1349613wmr.33.1671627916682; 
 Wed, 21 Dec 2022 05:05:16 -0800 (PST)
Received: from redhat.com ([2.52.8.61]) by smtp.gmail.com with ESMTPSA id
 az29-20020adfe19d000000b0024246991121sm15304337wrb.116.2022.12.21.05.05.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Dec 2022 05:05:15 -0800 (PST)
Date: Wed, 21 Dec 2022 08:05:13 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>,
 Jason Wang <jasowang@redhat.com>
Subject: [PULL 15/41] vhost: move iova_tree set to vhost_svq_start
Message-ID: <20221221130339.1234592-16-mst@redhat.com>
References: <20221221130339.1234592-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221221130339.1234592-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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

From: Eugenio Pérez <eperezma@redhat.com>

Since we don't know if we will use SVQ at qemu initialization, let's
allocate iova_tree only if needed. To do so, accept it at SVQ start, not
at initialization.

This will avoid to create it if the device does not support SVQ.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
Acked-by: Jason Wang <jasowang@redhat.com>
Message-Id: <20221215113144.322011-5-eperezma@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/virtio/vhost-shadow-virtqueue.h | 5 ++---
 hw/virtio/vhost-shadow-virtqueue.c | 9 ++++-----
 hw/virtio/vhost-vdpa.c             | 5 ++---
 3 files changed, 8 insertions(+), 11 deletions(-)

diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost-shadow-virtqueue.h
index d04c34a589..926a4897b1 100644
--- a/hw/virtio/vhost-shadow-virtqueue.h
+++ b/hw/virtio/vhost-shadow-virtqueue.h
@@ -126,11 +126,10 @@ size_t vhost_svq_driver_area_size(const VhostShadowVirtqueue *svq);
 size_t vhost_svq_device_area_size(const VhostShadowVirtqueue *svq);
 
 void vhost_svq_start(VhostShadowVirtqueue *svq, VirtIODevice *vdev,
-                     VirtQueue *vq);
+                     VirtQueue *vq, VhostIOVATree *iova_tree);
 void vhost_svq_stop(VhostShadowVirtqueue *svq);
 
-VhostShadowVirtqueue *vhost_svq_new(VhostIOVATree *iova_tree,
-                                    const VhostShadowVirtqueueOps *ops,
+VhostShadowVirtqueue *vhost_svq_new(const VhostShadowVirtqueueOps *ops,
                                     void *ops_opaque);
 
 void vhost_svq_free(gpointer vq);
diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
index 3b05bab44d..4307296358 100644
--- a/hw/virtio/vhost-shadow-virtqueue.c
+++ b/hw/virtio/vhost-shadow-virtqueue.c
@@ -642,9 +642,10 @@ void vhost_svq_set_svq_kick_fd(VhostShadowVirtqueue *svq, int svq_kick_fd)
  * @svq: Shadow Virtqueue
  * @vdev: VirtIO device
  * @vq: Virtqueue to shadow
+ * @iova_tree: Tree to perform descriptors translations
  */
 void vhost_svq_start(VhostShadowVirtqueue *svq, VirtIODevice *vdev,
-                     VirtQueue *vq)
+                     VirtQueue *vq, VhostIOVATree *iova_tree)
 {
     size_t desc_size, driver_size, device_size;
 
@@ -655,6 +656,7 @@ void vhost_svq_start(VhostShadowVirtqueue *svq, VirtIODevice *vdev,
     svq->last_used_idx = 0;
     svq->vdev = vdev;
     svq->vq = vq;
+    svq->iova_tree = iova_tree;
 
     svq->vring.num = virtio_queue_get_num(vdev, virtio_get_queue_index(vq));
     driver_size = vhost_svq_driver_area_size(svq);
@@ -712,18 +714,15 @@ void vhost_svq_stop(VhostShadowVirtqueue *svq)
  * Creates vhost shadow virtqueue, and instructs the vhost device to use the
  * shadow methods and file descriptors.
  *
- * @iova_tree: Tree to perform descriptors translations
  * @ops: SVQ owner callbacks
  * @ops_opaque: ops opaque pointer
  */
-VhostShadowVirtqueue *vhost_svq_new(VhostIOVATree *iova_tree,
-                                    const VhostShadowVirtqueueOps *ops,
+VhostShadowVirtqueue *vhost_svq_new(const VhostShadowVirtqueueOps *ops,
                                     void *ops_opaque)
 {
     VhostShadowVirtqueue *svq = g_new0(VhostShadowVirtqueue, 1);
 
     event_notifier_init_fd(&svq->svq_kick, VHOST_FILE_UNBIND);
-    svq->iova_tree = iova_tree;
     svq->ops = ops;
     svq->ops_opaque = ops_opaque;
     return svq;
diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index 65f896314b..014c69a475 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -430,8 +430,7 @@ static int vhost_vdpa_init_svq(struct vhost_dev *hdev, struct vhost_vdpa *v,
     for (unsigned n = 0; n < hdev->nvqs; ++n) {
         VhostShadowVirtqueue *svq;
 
-        svq = vhost_svq_new(v->iova_tree, v->shadow_vq_ops,
-                            v->shadow_vq_ops_opaque);
+        svq = vhost_svq_new(v->shadow_vq_ops, v->shadow_vq_ops_opaque);
         g_ptr_array_add(shadow_vqs, svq);
     }
 
@@ -1063,7 +1062,7 @@ static bool vhost_vdpa_svqs_start(struct vhost_dev *dev)
             goto err;
         }
 
-        vhost_svq_start(svq, dev->vdev, vq);
+        vhost_svq_start(svq, dev->vdev, vq, v->iova_tree);
         ok = vhost_vdpa_svq_map_rings(dev, svq, &addr, &err);
         if (unlikely(!ok)) {
             goto err_map;
-- 
MST


