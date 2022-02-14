Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 861374B5A92
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 20:36:05 +0100 (CET)
Received: from localhost ([::1]:52712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJh8l-0002U9-Bz
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 14:36:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nJgqV-0002wR-PH
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 14:17:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47317)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nJgqT-0001FW-Kr
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 14:17:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644866229;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4eHPTaikCQbJVrEmx1ahQ35mWO0n70e57bZoijuIK14=;
 b=A2Nfd0oVMbc32ojtSZDFW+4V6VSzzFZ6n1Ayqz+BFUnP7EfkQt8f0OSLRWiSc72F/6wRxr
 1vMc5V8pyyqzx26svLTFjyw0mQFQuuSHtbKjiX685ywTVZoB3QZkLm7aBWU/wx1i0SbzdR
 6AH329op6ju+y8UlFCBN9Q1Fag2Mq7Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-83-JCpfY3zkN8etghK73UaSaw-1; Mon, 14 Feb 2022 14:17:05 -0500
X-MC-Unique: JCpfY3zkN8etghK73UaSaw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 49D4F18397A7;
 Mon, 14 Feb 2022 19:17:04 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.195.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 056C25F9B0;
 Mon, 14 Feb 2022 19:16:56 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 4/9] vhost: Add SVQElement
Date: Mon, 14 Feb 2022 20:16:30 +0100
Message-Id: <20220214191635.1604932-5-eperezma@redhat.com>
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

This allows SVQ to add metadata to the different queue elements

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/virtio/vhost-shadow-virtqueue.c | 52 ++++++++++++++++++------------
 1 file changed, 31 insertions(+), 21 deletions(-)

diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
index 873e39e9cf..ea32b7ae7f 100644
--- a/hw/virtio/vhost-shadow-virtqueue.c
+++ b/hw/virtio/vhost-shadow-virtqueue.c
@@ -17,6 +17,10 @@
 #include "qemu/error-report.h"
 #include "qemu/main-loop.h"
 
+typedef struct SVQElement {
+    VirtQueueElement elem;
+} SVQElement;
+
 /* Shadow virtqueue to relay notifications */
 struct VhostShadowVirtqueue {
     /* Shadow vring */
@@ -50,10 +54,10 @@ struct VhostShadowVirtqueue {
     VhostIOVATree *iova_tree;
 
     /* Map for returning guest's descriptors */
-    VirtQueueElement **ring_id_maps;
+    SVQElement **ring_id_maps;
 
     /* Next VirtQueue element that guest made available */
-    VirtQueueElement *next_guest_avail_elem;
+    SVQElement *next_guest_avail_elem;
 
     /* Next head to expose to device */
     uint16_t avail_idx_shadow;
@@ -281,9 +285,10 @@ static void vhost_vring_write_descs(VhostShadowVirtqueue *svq,
 }
 
 static bool vhost_svq_add_split(VhostShadowVirtqueue *svq,
-                                VirtQueueElement *elem,
+                                SVQElement *svq_elem,
                                 unsigned *head)
 {
+    const VirtQueueElement *elem = &svq_elem->elem;
     unsigned avail_idx;
     vring_avail_t *avail = svq->vring.avail;
     bool ok;
@@ -324,7 +329,7 @@ static bool vhost_svq_add_split(VhostShadowVirtqueue *svq,
     return true;
 }
 
-static bool vhost_svq_add(VhostShadowVirtqueue *svq, VirtQueueElement *elem)
+static bool vhost_svq_add(VhostShadowVirtqueue *svq, SVQElement *elem)
 {
     unsigned qemu_head;
     bool ok = vhost_svq_add_split(svq, elem, &qemu_head);
@@ -372,19 +377,21 @@ static void vhost_handle_guest_kick(VhostShadowVirtqueue *svq)
         }
 
         while (true) {
+            SVQElement *svq_elem;
             VirtQueueElement *elem;
             bool ok;
 
             if (svq->next_guest_avail_elem) {
-                elem = g_steal_pointer(&svq->next_guest_avail_elem);
+                svq_elem = g_steal_pointer(&svq->next_guest_avail_elem);
             } else {
-                elem = virtqueue_pop(svq->vq, sizeof(*elem));
+                svq_elem = virtqueue_pop(svq->vq, sizeof(*elem));
             }
 
-            if (!elem) {
+            if (!svq_elem) {
                 break;
             }
 
+            elem = &svq_elem->elem;
             if (elem->out_num + elem->in_num >
                 vhost_svq_available_slots(svq)) {
                 /*
@@ -398,11 +405,11 @@ static void vhost_handle_guest_kick(VhostShadowVirtqueue *svq)
                  * queue the current guest descriptor and ignore further kicks
                  * until some elements are used.
                  */
-                svq->next_guest_avail_elem = elem;
+                svq->next_guest_avail_elem = svq_elem;
                 return;
             }
 
-            ok = vhost_svq_add(svq, elem);
+            ok = vhost_svq_add(svq, svq_elem);
             if (unlikely(!ok)) {
                 /* VQ is broken, just return and ignore any other kicks */
                 return;
@@ -437,7 +444,7 @@ static bool vhost_svq_more_used(VhostShadowVirtqueue *svq)
     return svq->last_used_idx != svq->shadow_used_idx;
 }
 
-static VirtQueueElement *vhost_svq_get_buf(VhostShadowVirtqueue *svq)
+static SVQElement *vhost_svq_get_buf(VhostShadowVirtqueue *svq)
 {
     vring_desc_t *descs = svq->vring.desc;
     const vring_used_t *used = svq->vring.used;
@@ -471,7 +478,7 @@ static VirtQueueElement *vhost_svq_get_buf(VhostShadowVirtqueue *svq)
     descs[used_elem.id].next = svq->free_head;
     svq->free_head = used_elem.id;
 
-    svq->ring_id_maps[used_elem.id]->len = used_elem.len;
+    svq->ring_id_maps[used_elem.id]->elem.len = used_elem.len;
     return g_steal_pointer(&svq->ring_id_maps[used_elem.id]);
 }
 
@@ -486,11 +493,13 @@ static void vhost_svq_flush(VhostShadowVirtqueue *svq,
 
         vhost_svq_set_notification(svq, false);
         while (true) {
-            g_autofree VirtQueueElement *elem = vhost_svq_get_buf(svq);
-            if (!elem) {
+            g_autofree SVQElement *svq_elem = vhost_svq_get_buf(svq);
+            VirtQueueElement *elem;
+            if (!svq_elem) {
                 break;
             }
 
+            elem = &svq_elem->elem;
             if (unlikely(i >= svq->vring.num)) {
                 virtio_error(svq->vdev,
                          "More than %u used buffers obtained in a %u size SVQ",
@@ -667,7 +676,7 @@ void vhost_svq_start(VhostShadowVirtqueue *svq, VirtIODevice *vdev,
 void vhost_svq_stop(VhostShadowVirtqueue *svq)
 {
     event_notifier_set_handler(&svq->svq_kick, NULL);
-    g_autofree VirtQueueElement *next_avail_elem = NULL;
+    g_autofree SVQElement *next_avail_elem = NULL;
 
     if (!svq->vq) {
         return;
@@ -677,17 +686,18 @@ void vhost_svq_stop(VhostShadowVirtqueue *svq)
     vhost_svq_flush(svq, false);
 
     for (unsigned i = 0; i < svq->vring.num; ++i) {
-        g_autofree VirtQueueElement *elem = NULL;
-        elem = g_steal_pointer(&svq->ring_id_maps[i]);
-        if (elem) {
-            virtqueue_detach_element(svq->vq, elem, elem->len);
+        g_autofree SVQElement *svq_elem = NULL;
+        svq_elem = g_steal_pointer(&svq->ring_id_maps[i]);
+        if (svq_elem)  {
+            virtqueue_detach_element(svq->vq, &svq_elem->elem,
+                                     svq_elem->elem.len);
         }
     }
 
     next_avail_elem = g_steal_pointer(&svq->next_guest_avail_elem);
     if (next_avail_elem) {
-        virtqueue_detach_element(svq->vq, next_avail_elem,
-                                 next_avail_elem->len);
+        virtqueue_detach_element(svq->vq, &next_avail_elem->elem,
+                                 next_avail_elem->elem.len);
     }
 }
 
@@ -735,7 +745,7 @@ VhostShadowVirtqueue *vhost_svq_new(uint16_t qsize, VhostIOVATree *iova_tree)
     svq->vring.used = qemu_memalign(qemu_real_host_page_size, device_size);
     memset(svq->vring.used, 0, device_size);
     svq->iova_tree = iova_tree;
-    svq->ring_id_maps = g_new0(VirtQueueElement *, qsize);
+    svq->ring_id_maps = g_new0(SVQElement *, qsize);
     event_notifier_set_handler(&svq->hdev_call, vhost_svq_handle_call);
     return g_steal_pointer(&svq);
 
-- 
2.27.0


