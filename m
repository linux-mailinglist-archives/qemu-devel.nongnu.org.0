Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F22115752F9
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 18:39:44 +0200 (CEST)
Received: from localhost ([::1]:47452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oC1sO-0002SV-4M
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 12:39:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oC1lL-0007YV-Cl
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 12:32:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21518)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oC1lJ-0003Lz-FT
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 12:32:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657816344;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hKq2YAk9fNcaFJ8TwjenxdE4lwtqYY/nCPcPaPP+diQ=;
 b=Q4znCHj9kYwpgZ/rL8lOmxPNhAuSBct4lnQR4S21kDI6ZYJcLKyv6vJalr+yOzBLEugaUb
 ckHwADiumGXHEGHlwXlq7zOXXtG41cC99VZiyz2c32rXmMJj0iifpm80UBpVtBg5hasruc
 QaoNM8QISeG2IUdzFioFjLgLaVRAjjg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-631-rDvMj-M5Oa-EZoaPLU33fA-1; Thu, 14 Jul 2022 12:32:21 -0400
X-MC-Unique: rDvMj-M5Oa-EZoaPLU33fA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B47D63802B9C;
 Thu, 14 Jul 2022 16:32:20 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.102])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DE7A41121315;
 Thu, 14 Jul 2022 16:32:17 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Gautam Dawar <gdawar@xilinx.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Eric Blake <eblake@redhat.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Parav Pandit <parav@mellanox.com>, Laurent Vivier <lvivier@redhat.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>, Eli Cohen <eli@mellanox.com>,
 Cindy Lu <lulu@redhat.com>, Harpreet Singh Anand <hanand@xilinx.com>,
 Jason Wang <jasowang@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>
Subject: [PATCH v2 08/19] vhost: Add SVQElement
Date: Thu, 14 Jul 2022 18:31:39 +0200
Message-Id: <20220714163150.2536327-9-eperezma@redhat.com>
In-Reply-To: <20220714163150.2536327-1-eperezma@redhat.com>
References: <20220714163150.2536327-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
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

This will allow SVQ to add context to the different queue elements.

This patch only store the actual element, no functional change intended.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/virtio/vhost-shadow-virtqueue.h |  8 ++++++--
 hw/virtio/vhost-shadow-virtqueue.c | 32 ++++++++++++++++--------------
 2 files changed, 23 insertions(+), 17 deletions(-)

diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost-shadow-virtqueue.h
index c132c994e9..f35d4b8f90 100644
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
 
     /*
      * Backup next field for each descriptor so we can recover securely, not
diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
index b005a457c6..442ca3cbd3 100644
--- a/hw/virtio/vhost-shadow-virtqueue.c
+++ b/hw/virtio/vhost-shadow-virtqueue.c
@@ -240,7 +240,7 @@ static void vhost_svq_kick(VhostShadowVirtqueue *svq)
  */
 static int vhost_svq_add(VhostShadowVirtqueue *svq, const struct iovec *out_sg,
                           size_t out_num, const struct iovec *in_sg,
-                          size_t in_num, VirtQueueElement *elem)
+                          size_t in_num, SVQElement *svq_elem)
 {
     unsigned qemu_head;
     unsigned ndescs = in_num + out_num;
@@ -252,21 +252,22 @@ static int vhost_svq_add(VhostShadowVirtqueue *svq, const struct iovec *out_sg,
 
     ok = vhost_svq_add_split(svq, out_sg, out_num, in_sg, in_num, &qemu_head);
     if (unlikely(!ok)) {
-        g_free(elem);
+        g_free(svq_elem);
         return -EINVAL;
     }
 
-    svq->ring_id_maps[qemu_head] = elem;
+    svq->ring_id_maps[qemu_head] = svq_elem;
     vhost_svq_kick(svq);
     return 0;
 }
 
 /* Convenience wrapper to add a guest's element to SVQ */
 static int vhost_svq_add_element(VhostShadowVirtqueue *svq,
-                                 VirtQueueElement *elem)
+                                 SVQElement *svq_elem)
 {
+    VirtQueueElement *elem = &svq_elem->elem;
     return vhost_svq_add(svq, elem->out_sg, elem->out_num, elem->in_sg,
-                         elem->in_num, elem);
+                         elem->in_num, svq_elem);
 }
 
 /**
@@ -292,7 +293,7 @@ static void vhost_handle_guest_kick(VhostShadowVirtqueue *svq)
         virtio_queue_set_notification(svq->vq, false);
 
         while (true) {
-            VirtQueueElement *elem;
+            SVQElement *elem;
             int r;
 
             if (svq->next_guest_avail_elem) {
@@ -386,9 +387,10 @@ static uint16_t vhost_svq_last_desc_of_chain(const VhostShadowVirtqueue *svq,
     return i;
 }
 
-static VirtQueueElement *vhost_svq_get_buf(VhostShadowVirtqueue *svq,
-                                           uint32_t *len)
+static SVQElement *vhost_svq_get_buf(VhostShadowVirtqueue *svq,
+                                     uint32_t *len)
 {
+    SVQElement *elem;
     const vring_used_t *used = svq->vring.used;
     vring_used_elem_t used_elem;
     uint16_t last_used, last_used_chain, num;
@@ -417,8 +419,8 @@ static VirtQueueElement *vhost_svq_get_buf(VhostShadowVirtqueue *svq,
         return NULL;
     }
 
-    num = svq->ring_id_maps[used_elem.id]->in_num +
-          svq->ring_id_maps[used_elem.id]->out_num;
+    elem = svq->ring_id_maps[used_elem.id];
+    num = elem->elem.in_num + elem->elem.out_num;
     last_used_chain = vhost_svq_last_desc_of_chain(svq, num, used_elem.id);
     svq->desc_next[last_used_chain] = svq->free_head;
     svq->free_head = used_elem.id;
@@ -439,8 +441,8 @@ static void vhost_svq_flush(VhostShadowVirtqueue *svq,
         vhost_svq_disable_notification(svq);
         while (true) {
             uint32_t len;
-            g_autofree VirtQueueElement *elem = vhost_svq_get_buf(svq, &len);
-            if (!elem) {
+            g_autofree SVQElement *svq_elem = vhost_svq_get_buf(svq, &len);
+            if (!svq_elem) {
                 break;
             }
 
@@ -448,11 +450,11 @@ static void vhost_svq_flush(VhostShadowVirtqueue *svq,
                 qemu_log_mask(LOG_GUEST_ERROR,
                          "More than %u used buffers obtained in a %u size SVQ",
                          i, svq->vring.num);
-                virtqueue_fill(vq, elem, len, i);
+                virtqueue_fill(vq, &svq_elem->elem, len, i);
                 virtqueue_flush(vq, i);
                 return;
             }
-            virtqueue_fill(vq, elem, len, i++);
+            virtqueue_fill(vq, &svq_elem->elem, len, i++);
         }
 
         virtqueue_flush(vq, i);
@@ -594,7 +596,7 @@ void vhost_svq_start(VhostShadowVirtqueue *svq, VirtIODevice *vdev,
     memset(svq->vring.desc, 0, driver_size);
     svq->vring.used = qemu_memalign(qemu_real_host_page_size(), device_size);
     memset(svq->vring.used, 0, device_size);
-    svq->ring_id_maps = g_new0(VirtQueueElement *, svq->vring.num);
+    svq->ring_id_maps = g_new0(SVQElement *, svq->vring.num);
     svq->desc_next = g_new0(uint16_t, svq->vring.num);
     for (unsigned i = 0; i < svq->vring.num - 1; i++) {
         svq->desc_next[i] = cpu_to_le16(i + 1);
-- 
2.31.1


