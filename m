Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A01456B7FF
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jul 2022 13:08:38 +0200 (CEST)
Received: from localhost ([::1]:45846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9lqf-0001gS-6K
	for lists+qemu-devel@lfdr.de; Fri, 08 Jul 2022 07:08:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1o9lZz-0000sm-UJ
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 06:51:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47061)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1o9lZx-0008Bv-5v
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 06:51:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657277480;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MaszvH9AFNHIShUJoDGIAKw0WaHOzCEA12k/sZppr4U=;
 b=Ol+6xWfGdWcBO/sgyBI59qxECIy0LMmt3n9kwAo4qYnbmqzVR6VIQbqDZkVcBBKEVJ6aoO
 f5OB070YZrZMncuew46HH1pzCeD0jKlos+zvmjw0bPZkMPJukh+63ugaYF0m1IxXiqUfnP
 A7tRYCYd8d17JrLGVx9t9jpEw44IcfQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-468-R8Pj8WMuMi2-IDrax0tWmQ-1; Fri, 08 Jul 2022 06:51:04 -0400
X-MC-Unique: R8Pj8WMuMi2-IDrax0tWmQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4692C85A584;
 Fri,  8 Jul 2022 10:51:04 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.172])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 788831121314;
 Fri,  8 Jul 2022 10:51:01 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>, Cindy Lu <lulu@redhat.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Laurent Vivier <lvivier@redhat.com>, Gautam Dawar <gdawar@xilinx.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Jason Wang <jasowang@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Parav Pandit <parav@mellanox.com>, Cornelia Huck <cohuck@redhat.com>
Subject: [PATCH 15/22] vhost: Add svq avail_handler callback
Date: Fri,  8 Jul 2022 12:50:06 +0200
Message-Id: <20220708105013.1899854-16-eperezma@redhat.com>
In-Reply-To: <20220708105013.1899854-1-eperezma@redhat.com>
References: <20220708105013.1899854-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

This allows external handlers to be aware of new buffers that the guest
places in the virtqueue.

When this callback is defined the ownership of guest's virtqueue element
is transferred to the callback. This means that if the user wants to
forward the descriptor it needs to manually inject it. The callback is
also free to process the command by itself and use the element with
svq_push.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/virtio/vhost-shadow-virtqueue.h | 23 ++++++++++++++++++++++-
 hw/virtio/vhost-shadow-virtqueue.c | 13 +++++++++++--
 hw/virtio/vhost-vdpa.c             |  2 +-
 3 files changed, 34 insertions(+), 4 deletions(-)

diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost-shadow-virtqueue.h
index 96ce7aa62e..cfc891e2e8 100644
--- a/hw/virtio/vhost-shadow-virtqueue.h
+++ b/hw/virtio/vhost-shadow-virtqueue.h
@@ -24,11 +24,28 @@ typedef struct SVQElement {
 } SVQElement;
 
 typedef struct VhostShadowVirtqueue VhostShadowVirtqueue;
+
+/**
+ * Callback to handle an avail buffer.
+ *
+ * @svq:  Shadow virtqueue
+ * @elem:  Element placed in the queue by the guest
+ * @vq_callback_opaque:  Opaque
+ *
+ * Returns true if the vq is running as expected, false otherwise.
+ *
+ * Note that ownership of elem is transferred to the callback.
+ */
+typedef bool (*VirtQueueAvailCallback)(VhostShadowVirtqueue *svq,
+                                       VirtQueueElement *elem,
+                                       void *vq_callback_opaque);
+
 typedef void (*VirtQueueUsedCallback)(VhostShadowVirtqueue *svq,
                                       void *used_elem_opaque,
                                       uint32_t written);
 
 typedef struct VhostShadowVirtqueueOps {
+    VirtQueueAvailCallback avail_handler;
     VirtQueueUsedCallback used_handler;
 } VhostShadowVirtqueueOps;
 
@@ -79,6 +96,9 @@ typedef struct VhostShadowVirtqueue {
     /* Caller callbacks */
     const VhostShadowVirtqueueOps *ops;
 
+    /* Caller callbacks opaque */
+    void *ops_opaque;
+
     /* Next head to expose to the device */
     uint16_t shadow_avail_idx;
 
@@ -111,7 +131,8 @@ void vhost_svq_start(VhostShadowVirtqueue *svq, VirtIODevice *vdev,
 void vhost_svq_stop(VhostShadowVirtqueue *svq);
 
 VhostShadowVirtqueue *vhost_svq_new(VhostIOVATree *iova_tree,
-                                    const VhostShadowVirtqueueOps *ops);
+                                    const VhostShadowVirtqueueOps *ops,
+                                    void *ops_opaque);
 
 void vhost_svq_free(gpointer vq);
 G_DEFINE_AUTOPTR_CLEANUP_FUNC(VhostShadowVirtqueue, vhost_svq_free);
diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
index 40183f8afd..78579b9e0b 100644
--- a/hw/virtio/vhost-shadow-virtqueue.c
+++ b/hw/virtio/vhost-shadow-virtqueue.c
@@ -374,7 +374,13 @@ static void vhost_handle_guest_kick(VhostShadowVirtqueue *svq)
                 return;
             }
 
-            ok = vhost_svq_add_element(svq, g_steal_pointer(&elem));
+            if (svq->ops) {
+                ok = svq->ops->avail_handler(svq, g_steal_pointer(&elem),
+                                             svq->ops_opaque);
+            } else {
+                ok = vhost_svq_add_element(svq, g_steal_pointer(&elem));
+            }
+
             if (unlikely(!ok)) {
                 /* VQ is broken, just return and ignore any other kicks */
                 return;
@@ -766,13 +772,15 @@ void vhost_svq_stop(VhostShadowVirtqueue *svq)
  *
  * @iova_tree: Tree to perform descriptors translations
  * @ops: SVQ owner callbacks
+ * @ops_opaque: ops opaque pointer
  *
  * Returns the new virtqueue or NULL.
  *
  * In case of error, reason is reported through error_report.
  */
 VhostShadowVirtqueue *vhost_svq_new(VhostIOVATree *iova_tree,
-                                    const VhostShadowVirtqueueOps *ops)
+                                    const VhostShadowVirtqueueOps *ops,
+                                    void *ops_opaque)
 {
     g_autofree VhostShadowVirtqueue *svq = g_new0(VhostShadowVirtqueue, 1);
     int r;
@@ -795,6 +803,7 @@ VhostShadowVirtqueue *vhost_svq_new(VhostIOVATree *iova_tree,
     event_notifier_set_handler(&svq->hdev_call, vhost_svq_handle_call);
     svq->iova_tree = iova_tree;
     svq->ops = ops;
+    svq->ops_opaque = ops_opaque;
     return g_steal_pointer(&svq);
 
 err_init_hdev_call:
diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index 25f7146fe4..9a4f00c114 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -420,7 +420,7 @@ static int vhost_vdpa_init_svq(struct vhost_dev *hdev, struct vhost_vdpa *v,
     for (unsigned n = 0; n < hdev->nvqs; ++n) {
         g_autoptr(VhostShadowVirtqueue) svq;
 
-        svq = vhost_svq_new(v->iova_tree, NULL);
+        svq = vhost_svq_new(v->iova_tree, NULL, NULL);
         if (unlikely(!svq)) {
             error_setg(errp, "Cannot create svq %u", n);
             return -1;
-- 
2.31.1


