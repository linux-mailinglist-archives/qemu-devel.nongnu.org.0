Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1844E4FC060
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Apr 2022 17:22:44 +0200 (CEST)
Received: from localhost ([::1]:52608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ndvsI-0004c5-VW
	for lists+qemu-devel@lfdr.de; Mon, 11 Apr 2022 11:22:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1ndvO4-0006mA-OK
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 10:51:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58581)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1ndvNz-0007on-UQ
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 10:51:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649688683;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y6sMK5av6SgTfEBF+xWQTA3ffG7GV1ORuW8fC48+Uy0=;
 b=NI1dmQ7Gydl/1KhXxrXtVWcpMNHxGwalQgeXogaq5DS7U+pc/S5ZJwvrte/h9jTUuRT03k
 +o9s1Rzy8cwG23W76uvlEe+SC41UskoA8NfeP1ONIusHcvzC3HgNJxpXG/mRF98y+VlVJr
 00BZgDJaGUQ21FbedshL+W8JmZdnwlA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-649-prpDye55N5CaJpoti6ghvA-1; Mon, 11 Apr 2022 10:51:14 -0400
X-MC-Unique: prpDye55N5CaJpoti6ghvA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 456468564EF;
 Mon, 11 Apr 2022 14:51:05 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.138])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 31B5A54ACB7;
 Mon, 11 Apr 2022 14:51:03 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v6 12/23] vhost: Add SVQElement
Date: Mon, 11 Apr 2022 16:50:15 +0200
Message-Id: <20220411145026.1618035-13-eperezma@redhat.com>
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
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

This allows SVQ to add metadata to the different queue elements

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/virtio/vhost-shadow-virtqueue.h |  8 ++++--
 hw/virtio/vhost-shadow-virtqueue.c | 42 ++++++++++++++++--------------
 2 files changed, 29 insertions(+), 21 deletions(-)

diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost-shadow-virtqueue.h
index e5e24c536d..72aadb0aec 100644
--- a/hw/virtio/vhost-shadow-virtqueue.h
+++ b/hw/virtio/vhost-shadow-virtqueue.h
@@ -15,6 +15,10 @@
 #include "standard-headers/linux/vhost_types.h"
 #include "hw/virtio/vhost-iova-tree.h"
 
+typedef struct SVQElement {
+    VirtQueueElement elem;
+} SVQElement;
+
 /* Shadow virtqueue to relay notifications */
 typedef struct VhostShadowVirtqueue {
     /* Shadow vring */
@@ -48,10 +52,10 @@ typedef struct VhostShadowVirtqueue {
     VhostIOVATree *iova_tree;
 
     /* Map for use the guest's descriptors */
-    VirtQueueElement **ring_id_maps;
+    SVQElement **ring_id_maps;
 
     /* Next VirtQueue element that guest made available */
-    VirtQueueElement *next_guest_avail_elem;
+    SVQElement *next_guest_avail_elem;
 
     /* Next head to expose to the device */
     uint16_t shadow_avail_idx;
diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
index bcb5f3aae9..cf701576d1 100644
--- a/hw/virtio/vhost-shadow-virtqueue.c
+++ b/hw/virtio/vhost-shadow-virtqueue.c
@@ -158,9 +158,10 @@ static bool vhost_svq_vring_write_descs(VhostShadowVirtqueue *svq, hwaddr *sg,
     return true;
 }
 
-static bool vhost_svq_add_split(VhostShadowVirtqueue *svq,
-                                VirtQueueElement *elem, unsigned *head)
+static bool vhost_svq_add_split(VhostShadowVirtqueue *svq, SVQElement *svq_elem,
+                                unsigned *head)
 {
+    const VirtQueueElement *elem = &svq_elem->elem;
     unsigned avail_idx;
     vring_avail_t *avail = svq->vring.avail;
     bool ok;
@@ -202,7 +203,7 @@ static bool vhost_svq_add_split(VhostShadowVirtqueue *svq,
     return true;
 }
 
-static bool vhost_svq_add(VhostShadowVirtqueue *svq, VirtQueueElement *elem)
+static bool vhost_svq_add(VhostShadowVirtqueue *svq, SVQElement *elem)
 {
     unsigned qemu_head;
     bool ok = vhost_svq_add_split(svq, elem, &qemu_head);
@@ -251,19 +252,21 @@ static void vhost_handle_guest_kick(VhostShadowVirtqueue *svq)
         virtio_queue_set_notification(svq->vq, false);
 
         while (true) {
+            SVQElement *svq_elem;
             VirtQueueElement *elem;
             bool ok;
 
             if (svq->next_guest_avail_elem) {
-                elem = g_steal_pointer(&svq->next_guest_avail_elem);
+                svq_elem = g_steal_pointer(&svq->next_guest_avail_elem);
             } else {
-                elem = virtqueue_pop(svq->vq, sizeof(*elem));
+                svq_elem = virtqueue_pop(svq->vq, sizeof(*svq_elem));
             }
 
-            if (!elem) {
+            if (!svq_elem) {
                 break;
             }
 
+            elem = &svq_elem->elem;
             if (elem->out_num + elem->in_num > vhost_svq_available_slots(svq)) {
                 /*
                  * This condition is possible since a contiguous buffer in GPA
@@ -276,11 +279,11 @@ static void vhost_handle_guest_kick(VhostShadowVirtqueue *svq)
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
@@ -349,8 +352,7 @@ static uint16_t vhost_svq_last_desc_of_chain(VhostShadowVirtqueue *svq,
     return i;
 }
 
-static VirtQueueElement *vhost_svq_get_buf(VhostShadowVirtqueue *svq,
-                                           uint32_t *len)
+static SVQElement *vhost_svq_get_buf(VhostShadowVirtqueue *svq, uint32_t *len)
 {
     vring_desc_t *descs = svq->vring.desc;
     const vring_used_t *used = svq->vring.used;
@@ -401,11 +403,13 @@ static void vhost_svq_flush(VhostShadowVirtqueue *svq,
         vhost_svq_disable_notification(svq);
         while (true) {
             uint32_t len;
-            g_autofree VirtQueueElement *elem = vhost_svq_get_buf(svq, &len);
-            if (!elem) {
+            g_autofree SVQElement *svq_elem = vhost_svq_get_buf(svq, &len);
+            VirtQueueElement *elem;
+            if (!svq_elem) {
                 break;
             }
 
+            elem = &svq_elem->elem;
             if (unlikely(i >= svq->vring.num)) {
                 qemu_log_mask(LOG_GUEST_ERROR,
                          "More than %u used buffers obtained in a %u size SVQ",
@@ -556,7 +560,7 @@ void vhost_svq_start(VhostShadowVirtqueue *svq, VirtIODevice *vdev,
     memset(svq->vring.desc, 0, driver_size);
     svq->vring.used = qemu_memalign(qemu_real_host_page_size, device_size);
     memset(svq->vring.used, 0, device_size);
-    svq->ring_id_maps = g_new0(VirtQueueElement *, svq->vring.num);
+    svq->ring_id_maps = g_new0(SVQElement *, svq->vring.num);
     for (unsigned i = 0; i < svq->vring.num - 1; i++) {
         svq->vring.desc[i].next = cpu_to_le16(i + 1);
     }
@@ -569,7 +573,7 @@ void vhost_svq_start(VhostShadowVirtqueue *svq, VirtIODevice *vdev,
 void vhost_svq_stop(VhostShadowVirtqueue *svq)
 {
     event_notifier_set_handler(&svq->svq_kick, NULL);
-    g_autofree VirtQueueElement *next_avail_elem = NULL;
+    g_autofree SVQElement *next_avail_elem = NULL;
 
     if (!svq->vq) {
         return;
@@ -579,16 +583,16 @@ void vhost_svq_stop(VhostShadowVirtqueue *svq)
     vhost_svq_flush(svq, false);
 
     for (unsigned i = 0; i < svq->vring.num; ++i) {
-        g_autofree VirtQueueElement *elem = NULL;
-        elem = g_steal_pointer(&svq->ring_id_maps[i]);
-        if (elem) {
-            virtqueue_detach_element(svq->vq, elem, 0);
+        g_autofree SVQElement *svq_elem = NULL;
+        svq_elem = g_steal_pointer(&svq->ring_id_maps[i]);
+        if (svq_elem) {
+            virtqueue_detach_element(svq->vq, &svq_elem->elem, 0);
         }
     }
 
     next_avail_elem = g_steal_pointer(&svq->next_guest_avail_elem);
     if (next_avail_elem) {
-        virtqueue_detach_element(svq->vq, next_avail_elem, 0);
+        virtqueue_detach_element(svq->vq, &next_avail_elem->elem, 0);
     }
     svq->vq = NULL;
     g_free(svq->ring_id_maps);
-- 
2.27.0


