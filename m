Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 671F14FC01F
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Apr 2022 17:16:30 +0200 (CEST)
Received: from localhost ([::1]:41432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ndvmH-0004nB-GZ
	for lists+qemu-devel@lfdr.de; Mon, 11 Apr 2022 11:16:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1ndvOK-0006vD-Br
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 10:51:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42567)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1ndvOD-0007sB-RI
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 10:51:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649688695;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Wi9FawyPi4L6fRdHrLUNb9P/AF8WHvZY93cQmd8wvBk=;
 b=dSP5NRW+8kAfRl58Y+GoXu3pzKxlQFXXYZD3XZmtNx1Ag+yvrueWaBb4Tm1nmZHHSwdEp/
 nkiIhJhhG4WjANw1H6Kku3LQxFBzNO5JFzKbSF8Ju6ZM2xjcys8M1e/KMCO2r26KJ34Av3
 fl9OR2dOce7G02XAvgv9H8RVHyhpuzY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-256-2ffE_Fc-MkqMr3qQFKjzMw-1; Mon, 11 Apr 2022 10:51:19 -0400
X-MC-Unique: 2ffE_Fc-MkqMr3qQFKjzMw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B5B343C354C2;
 Mon, 11 Apr 2022 14:51:14 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.138])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A589854ACAF;
 Mon, 11 Apr 2022 14:51:12 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v6 16/23] vdpa: Add map/unmap operation callback to SVQ
Date: Mon, 11 Apr 2022 16:50:19 +0200
Message-Id: <20220411145026.1618035-17-eperezma@redhat.com>
In-Reply-To: <20220411145026.1618035-1-eperezma@redhat.com>
References: <20220411145026.1618035-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
 Paolo Bonzini <pbonzini@redhat.com>, Liuxiangdong <liuxiangdong5@huawei.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/virtio/vhost-shadow-virtqueue.h | 21 +++++++++++++++++++--
 hw/virtio/vhost-shadow-virtqueue.c |  8 +++++++-
 hw/virtio/vhost-vdpa.c             | 20 +++++++++++++++++++-
 3 files changed, 45 insertions(+), 4 deletions(-)

diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost-shadow-virtqueue.h
index 4ff6a0cda0..6e61d9bfef 100644
--- a/hw/virtio/vhost-shadow-virtqueue.h
+++ b/hw/virtio/vhost-shadow-virtqueue.h
@@ -26,6 +26,15 @@ typedef struct VhostShadowVirtqueueOps {
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
 /* Shadow virtqueue to relay notifications */
 typedef struct VhostShadowVirtqueue {
     /* Shadow vring */
@@ -67,6 +76,12 @@ typedef struct VhostShadowVirtqueue {
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
 
@@ -96,8 +111,10 @@ void vhost_svq_start(VhostShadowVirtqueue *svq, VirtIODevice *vdev,
                      VirtQueue *vq);
 void vhost_svq_stop(VhostShadowVirtqueue *svq);
 
-VhostShadowVirtqueue *vhost_svq_new(VhostIOVATree *iova_tree,
-                                    const VhostShadowVirtqueueOps *ops);
+VhostShadowVirtqueue *vhost_svq_new(VhostIOVATree *iova_map,
+                                    const VhostShadowVirtqueueOps *ops,
+                                    const VhostShadowVirtqueueMapOps *map_ops,
+                                    void *map_ops_opaque);
 
 void vhost_svq_free(gpointer vq);
 G_DEFINE_AUTOPTR_CLEANUP_FUNC(VhostShadowVirtqueue, vhost_svq_free);
diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
index 208832a698..15e6cbc5cb 100644
--- a/hw/virtio/vhost-shadow-virtqueue.c
+++ b/hw/virtio/vhost-shadow-virtqueue.c
@@ -610,13 +610,17 @@ void vhost_svq_stop(VhostShadowVirtqueue *svq)
  *
  * @iova_tree: Tree to perform descriptors translations
  * @ops: SVQ operations hooks
+ * @map_ops: SVQ mapping operation hooks
+ * @map_ops_opaque: Opaque data to pass to mapping operations
  *
  * Returns the new virtqueue or NULL.
  *
  * In case of error, reason is reported through error_report.
  */
 VhostShadowVirtqueue *vhost_svq_new(VhostIOVATree *iova_tree,
-                                    const VhostShadowVirtqueueOps *ops)
+                                    const VhostShadowVirtqueueOps *ops,
+                                    const VhostShadowVirtqueueMapOps *map_ops,
+                                    void *map_ops_opaque)
 {
     g_autofree VhostShadowVirtqueue *svq = g_new0(VhostShadowVirtqueue, 1);
     int r;
@@ -639,6 +643,8 @@ VhostShadowVirtqueue *vhost_svq_new(VhostIOVATree *iova_tree,
     event_notifier_set_handler(&svq->hdev_call, vhost_svq_handle_call);
     svq->iova_tree = iova_tree;
     svq->ops = ops;
+    svq->map_ops = map_ops;
+    svq->map_ops_opaque = map_ops_opaque;
     return g_steal_pointer(&svq);
 
 err_init_hdev_call:
diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index 421eddf8ca..d09e06d212 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -385,6 +385,22 @@ static int vhost_vdpa_get_dev_features(struct vhost_dev *dev,
     return ret;
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
@@ -412,7 +428,9 @@ static int vhost_vdpa_init_svq(struct vhost_dev *hdev, struct vhost_vdpa *v,
     shadow_vqs = g_ptr_array_new_full(hdev->nvqs, vhost_svq_free);
     for (unsigned n = 0; n < hdev->nvqs; ++n) {
         g_autoptr(VhostShadowVirtqueue) svq = vhost_svq_new(v->iova_tree,
-                                                            v->shadow_vq_ops);
+                                                       v->shadow_vq_ops,
+                                                       &vhost_vdpa_svq_map_ops,
+                                                       v);
 
         if (unlikely(!svq)) {
             error_setg(errp, "Cannot create svq %u", n);
-- 
2.27.0


