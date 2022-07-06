Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A1A56921B
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 20:47:06 +0200 (CEST)
Received: from localhost ([::1]:50304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9A3E-000172-Ui
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 14:47:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1o99x1-00056a-Pn
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 14:40:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52018)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1o99wy-0000ok-1c
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 14:40:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657132831;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cAyt1nJZiM/sAoSUDasg3aQN7DmNjuZNX44aTSHb5+M=;
 b=DwpYzhBOZ0YE2drVkDDRj+PVvH/fH/Kzka2kvl4PAN+VKXIHkSfX67Xz6v2CyAOjZUixtj
 JiAesnX/Qm4Lzg/NzMuTDki+qEgsKptqJlbzwuXBhSWO47DYzQkrwC/dKNgefFUL5SxELy
 zlj2cVBThgFQxwuW7GSZG7Vp0hlMS2Y=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-39-64qFTm0RP3m1Vxrm721_Lg-1; Wed, 06 Jul 2022 14:40:28 -0400
X-MC-Unique: 64qFTm0RP3m1Vxrm721_Lg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 903B2804196;
 Wed,  6 Jul 2022 18:40:27 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.119])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0C89A1415116;
 Wed,  6 Jul 2022 18:40:24 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Liuxiangdong <liuxiangdong5@huawei.com>,
 Markus Armbruster <armbru@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Eric Blake <eblake@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Parav Pandit <parav@mellanox.com>,
 Cornelia Huck <cohuck@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Gautam Dawar <gdawar@xilinx.com>, Eli Cohen <eli@mellanox.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Cindy Lu <lulu@redhat.com>,
 Jason Wang <jasowang@redhat.com>
Subject: [RFC PATCH v9 05/23] vhost: Add ShadowVirtQueueStart operation
Date: Wed,  6 Jul 2022 20:39:50 +0200
Message-Id: <20220706184008.1649478-6-eperezma@redhat.com>
In-Reply-To: <20220706184008.1649478-1-eperezma@redhat.com>
References: <20220706184008.1649478-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
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

It allows to run commands at SVQ start.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/virtio/vhost-shadow-virtqueue.h | 18 +++++++++++++++++-
 hw/virtio/vhost-shadow-virtqueue.c |  8 +++++++-
 hw/virtio/vhost-vdpa.c             | 17 ++++++++++++++++-
 3 files changed, 40 insertions(+), 3 deletions(-)

diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost-shadow-virtqueue.h
index c132c994e9..91c31715d9 100644
--- a/hw/virtio/vhost-shadow-virtqueue.h
+++ b/hw/virtio/vhost-shadow-virtqueue.h
@@ -15,6 +15,14 @@
 #include "standard-headers/linux/vhost_types.h"
 #include "hw/virtio/vhost-iova-tree.h"
 
+typedef struct VhostShadowVirtqueue VhostShadowVirtqueue;
+typedef int (*ShadowVirtQueueStart)(VhostShadowVirtqueue *svq,
+                                    void *opaque);
+
+typedef struct VhostShadowVirtqueueOps {
+    ShadowVirtQueueStart start;
+} VhostShadowVirtqueueOps;
+
 /* Shadow virtqueue to relay notifications */
 typedef struct VhostShadowVirtqueue {
     /* Shadow vring */
@@ -59,6 +67,12 @@ typedef struct VhostShadowVirtqueue {
      */
     uint16_t *desc_next;
 
+    /* Caller callbacks */
+    const VhostShadowVirtqueueOps *ops;
+
+    /* Caller callbacks opaque */
+    void *ops_opaque;
+
     /* Next head to expose to the device */
     uint16_t shadow_avail_idx;
 
@@ -85,7 +99,9 @@ void vhost_svq_start(VhostShadowVirtqueue *svq, VirtIODevice *vdev,
                      VirtQueue *vq);
 void vhost_svq_stop(VhostShadowVirtqueue *svq);
 
-VhostShadowVirtqueue *vhost_svq_new(VhostIOVATree *iova_tree);
+VhostShadowVirtqueue *vhost_svq_new(VhostIOVATree *iova_tree,
+                                    const VhostShadowVirtqueueOps *ops,
+                                    void *ops_opaque);
 
 void vhost_svq_free(gpointer vq);
 G_DEFINE_AUTOPTR_CLEANUP_FUNC(VhostShadowVirtqueue, vhost_svq_free);
diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
index 2939f4a243..be64e0b85c 100644
--- a/hw/virtio/vhost-shadow-virtqueue.c
+++ b/hw/virtio/vhost-shadow-virtqueue.c
@@ -626,12 +626,16 @@ void vhost_svq_stop(VhostShadowVirtqueue *svq)
  * shadow methods and file descriptors.
  *
  * @iova_tree: Tree to perform descriptors translations
+ * @ops: SVQ owner callbacks
+ * @ops_opaque: ops opaque pointer
  *
  * Returns the new virtqueue or NULL.
  *
  * In case of error, reason is reported through error_report.
  */
-VhostShadowVirtqueue *vhost_svq_new(VhostIOVATree *iova_tree)
+VhostShadowVirtqueue *vhost_svq_new(VhostIOVATree *iova_tree,
+                                    const VhostShadowVirtqueueOps *ops,
+                                    void *ops_opaque)
 {
     g_autofree VhostShadowVirtqueue *svq = g_new0(VhostShadowVirtqueue, 1);
     int r;
@@ -653,6 +657,8 @@ VhostShadowVirtqueue *vhost_svq_new(VhostIOVATree *iova_tree)
     event_notifier_init_fd(&svq->svq_kick, VHOST_FILE_UNBIND);
     event_notifier_set_handler(&svq->hdev_call, vhost_svq_handle_call);
     svq->iova_tree = iova_tree;
+    svq->ops = ops;
+    svq->ops_opaque = ops_opaque;
     return g_steal_pointer(&svq);
 
 err_init_hdev_call:
diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index de76128030..69cfaf05d6 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -418,7 +418,8 @@ static int vhost_vdpa_init_svq(struct vhost_dev *hdev, struct vhost_vdpa *v,
 
     shadow_vqs = g_ptr_array_new_full(hdev->nvqs, vhost_svq_free);
     for (unsigned n = 0; n < hdev->nvqs; ++n) {
-        g_autoptr(VhostShadowVirtqueue) svq = vhost_svq_new(v->iova_tree);
+        g_autoptr(VhostShadowVirtqueue) svq = vhost_svq_new(v->iova_tree, NULL,
+                                                            NULL);
 
         if (unlikely(!svq)) {
             error_setg(errp, "Cannot create svq %u", n);
@@ -1122,6 +1123,20 @@ static int vhost_vdpa_dev_start(struct vhost_dev *dev, bool started)
         if (unlikely(r)) {
             return r;
         }
+
+        if (v->shadow_vqs_enabled) {
+            for (unsigned i = 0; i < v->shadow_vqs->len; ++i) {
+                VhostShadowVirtqueue *svq = g_ptr_array_index(v->shadow_vqs,
+                                                              i);
+                if (svq->ops) {
+                    r = svq->ops->start(svq, svq->ops_opaque);
+                    if (unlikely(r)) {
+                        return r;
+                    }
+                }
+            }
+        }
+
         vhost_vdpa_set_vring_ready(dev);
     } else {
         vhost_vdpa_reset_device(dev);
-- 
2.31.1


