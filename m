Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E2A74B5AA9
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 20:49:00 +0100 (CET)
Received: from localhost ([::1]:52348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJhLH-0004o6-Lj
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 14:48:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nJgqb-00030F-6C
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 14:17:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51517)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nJgqZ-0001G1-8q
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 14:17:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644866234;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4nC/+Y70sZV5Uy/nObARUYpq/gu5ySxHHcr4Yrw/TaI=;
 b=fpT2302X5Kcd8uO4Zb26D5bFiXuEm40c0CQ0lLCJ1pVu4vMsewzp16bKovtX9zbQ2TS+QY
 nrI/RGAAa+teU9VaUel+BaJXhuIJCj0eQ8DqoKTPe8JFMx63jxBSlW9IMw3BTaKg6JzdoC
 OP9GcQGMPI01cegU/FfQetslidbhewg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-403-gBBsceClO3yvKNCqTEmlpQ-1; Mon, 14 Feb 2022 14:17:11 -0500
X-MC-Unique: gBBsceClO3yvKNCqTEmlpQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3F808814243;
 Mon, 14 Feb 2022 19:17:10 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.195.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A61545FC08;
 Mon, 14 Feb 2022 19:17:07 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 6/9] vdpa: Add map/unmap operation callback to SVQ
Date: Mon, 14 Feb 2022 20:16:32 +0100
Message-Id: <20220214191635.1604932-7-eperezma@redhat.com>
In-Reply-To: <20220214191635.1604932-1-eperezma@redhat.com>
References: <20220214191635.1604932-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Parav Pandit <parav@mellanox.com>,
 Cindy Lu <lulu@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Gautam Dawar <gdawar@xilinx.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Eli Cohen <eli@mellanox.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/virtio/vhost-shadow-virtqueue.h | 13 ++++++++++++-
 hw/virtio/vhost-shadow-virtqueue.c | 12 +++++++++++-
 hw/virtio/vhost-vdpa.c             | 20 +++++++++++++++++++-
 3 files changed, 42 insertions(+), 3 deletions(-)

diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost-shadow-virtqueue.h
index f23fb93c20..bf3b658889 100644
--- a/hw/virtio/vhost-shadow-virtqueue.h
+++ b/hw/virtio/vhost-shadow-virtqueue.h
@@ -23,6 +23,15 @@ typedef struct VhostShadowVirtqueueOps {
     VirtQueueElementCallback used_elem_handler;
 } VhostShadowVirtqueueOps;
 
+typedef int (*vhost_svq_map_op)(hwaddr iova, hwaddr size, void *vaddr,
+                                bool readonly, void *opaque);
+typedef int (*vhost_svq_unmap_op)(hwaddr iova, hwaddr size, void *opaque);
+
+typedef struct VhostShadowVirtqueueMapOps {
+    vhost_svq_map_op map;
+    vhost_svq_unmap_op unmap;
+} VhostShadowVirtqueueMapOps;
+
 bool vhost_svq_valid_device_features(uint64_t *features);
 bool vhost_svq_valid_guest_features(uint64_t *features);
 bool vhost_svq_ack_guest_features(uint64_t dev_features,
@@ -47,7 +56,9 @@ void vhost_svq_start(VhostShadowVirtqueue *svq, VirtIODevice *vdev,
 void vhost_svq_stop(VhostShadowVirtqueue *svq);
 
 VhostShadowVirtqueue *vhost_svq_new(uint16_t qsize, VhostIOVATree *iova_map,
-                                    const VhostShadowVirtqueueOps *ops);
+                                    const VhostShadowVirtqueueOps *ops,
+                                    const VhostShadowVirtqueueMapOps *map_ops,
+                                    void *map_ops_opaque);
 
 void vhost_svq_free(VhostShadowVirtqueue *vq);
 
diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
index 5665947d1a..2ba3c2966a 100644
--- a/hw/virtio/vhost-shadow-virtqueue.c
+++ b/hw/virtio/vhost-shadow-virtqueue.c
@@ -62,6 +62,12 @@ struct VhostShadowVirtqueue {
     /* Optional callbacks */
     const VhostShadowVirtqueueOps *ops;
 
+    /* Device memory mapping callbacks */
+    const VhostShadowVirtqueueMapOps *map_ops;
+
+    /* Device memory mapping callbacks opaque */
+    void *map_ops_opaque;
+
     /* Optional custom used virtqueue element handler */
     VirtQueueElementCallback used_elem_cb;
 
@@ -724,7 +730,9 @@ void vhost_svq_stop(VhostShadowVirtqueue *svq)
  * In case of error, reason is reported through error_report.
  */
 VhostShadowVirtqueue *vhost_svq_new(uint16_t qsize, VhostIOVATree *iova_tree,
-                                    const VhostShadowVirtqueueOps *ops)
+                                    const VhostShadowVirtqueueOps *ops,
+                                    const VhostShadowVirtqueueMapOps *map_ops,
+                                    void *map_ops_opaque)
 {
     size_t desc_size = sizeof(vring_desc_t) * qsize;
     size_t device_size, driver_size;
@@ -760,6 +768,8 @@ VhostShadowVirtqueue *vhost_svq_new(uint16_t qsize, VhostIOVATree *iova_tree,
     svq->ring_id_maps = g_new0(SVQElement *, qsize);
     event_notifier_set_handler(&svq->hdev_call, vhost_svq_handle_call);
     svq->ops = ops;
+    svq->map_ops = map_ops;
+    svq->map_ops_opaque = map_ops_opaque;
     return g_steal_pointer(&svq);
 
 err_init_hdev_call:
diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index 5707b1952d..4142a1ce5d 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -1178,6 +1178,22 @@ static int vhost_vdpa_get_max_queue_size(struct vhost_dev *dev,
     return vhost_vdpa_call(dev, VHOST_VDPA_GET_VRING_NUM, qsize);
 }
 
+static int vhost_vdpa_svq_map(hwaddr iova, hwaddr size, void *vaddr,
+                              bool readonly, void *opaque)
+{
+    return vhost_vdpa_dma_map(opaque, iova, size, vaddr, readonly);
+}
+
+static int vhost_vdpa_svq_unmap(hwaddr iova, hwaddr size, void *opaque)
+{
+    return vhost_vdpa_dma_unmap(opaque, iova, size);
+}
+
+static const VhostShadowVirtqueueMapOps vhost_vdpa_svq_map_ops = {
+    .map = vhost_vdpa_svq_map,
+    .unmap = vhost_vdpa_svq_unmap,
+};
+
 static int vhost_vdpa_init_svq(struct vhost_dev *hdev, struct vhost_vdpa *v,
                                Error **errp)
 {
@@ -1219,7 +1235,9 @@ static int vhost_vdpa_init_svq(struct vhost_dev *hdev, struct vhost_vdpa *v,
         DMAMap device_region, driver_region;
         struct vhost_vring_addr addr;
         VhostShadowVirtqueue *svq = vhost_svq_new(qsize, v->iova_tree,
-                                                  v->shadow_vq_ops);
+                                                  v->shadow_vq_ops,
+                                                  &vhost_vdpa_svq_map_ops,
+                                                  v);
         if (unlikely(!svq)) {
             error_setg(errp, "Cannot create svq %u", n);
             return -1;
-- 
2.27.0


