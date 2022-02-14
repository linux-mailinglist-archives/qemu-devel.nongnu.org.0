Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 656CD4B5A91
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 20:35:22 +0100 (CET)
Received: from localhost ([::1]:48980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJh83-00087u-7U
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 14:35:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nJgqx-0003Qa-Vw
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 14:17:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26635)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nJgqw-0001He-3p
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 14:17:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644866256;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tQ8hPeVchH2aT6nlPl35E32wEaoIsr8R6UjyIin+qrU=;
 b=KI3rowqmezbKPsL1hwgdbDq0DLYm2k+ptAREUPxddTx1PNAnB2DtbebbPIdqdhXLUJ2/Zt
 Rxmj97N+Q2cA3wu3TnaPZgXFS9AteAMDUzab8RCTdyIFrlxQexVhARbw//IWfNjiyex0OS
 siGkGLP66uYnlWamAK0YqX++8SOS8B8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-31-OtrFytqOOh69Xwmf6qpzbQ-1; Mon, 14 Feb 2022 14:17:33 -0500
X-MC-Unique: OtrFytqOOh69Xwmf6qpzbQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 46CA2801B0E;
 Mon, 14 Feb 2022 19:17:32 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.195.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A22524BC45;
 Mon, 14 Feb 2022 19:17:10 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 7/9] vhost: Add vhost_svq_inject
Date: Mon, 14 Feb 2022 20:16:33 +0100
Message-Id: <20220214191635.1604932-8-eperezma@redhat.com>
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

This allows qemu to inject packets to the device without guest's notice.

This will be use to inject net CVQ messages to restore status in the destination

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/virtio/vhost-shadow-virtqueue.h |   2 +
 hw/virtio/vhost-shadow-virtqueue.c | 142 ++++++++++++++++++++++++-----
 2 files changed, 123 insertions(+), 21 deletions(-)

diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost-shadow-virtqueue.h
index bf3b658889..767b0a82ba 100644
--- a/hw/virtio/vhost-shadow-virtqueue.h
+++ b/hw/virtio/vhost-shadow-virtqueue.h
@@ -38,6 +38,8 @@ bool vhost_svq_ack_guest_features(uint64_t dev_features,
                                   uint64_t guest_features,
                                   uint64_t *acked_features);
 
+bool vhost_svq_inject(VhostShadowVirtqueue *svq, const struct iovec *iov,
+                      size_t out_num, size_t in_num);
 void vhost_svq_set_svq_kick_fd(VhostShadowVirtqueue *svq, int svq_kick_fd);
 void vhost_svq_set_guest_call_notifier(VhostShadowVirtqueue *svq, int call_fd);
 const EventNotifier *vhost_svq_get_dev_kick_notifier(
diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
index 2ba3c2966a..26938b059c 100644
--- a/hw/virtio/vhost-shadow-virtqueue.c
+++ b/hw/virtio/vhost-shadow-virtqueue.c
@@ -16,9 +16,11 @@
 
 #include "qemu/error-report.h"
 #include "qemu/main-loop.h"
+#include "qemu/iov.h"
 
 typedef struct SVQElement {
     VirtQueueElement elem;
+    bool not_from_guest;
 } SVQElement;
 
 /* Shadow virtqueue to relay notifications */
@@ -311,19 +313,53 @@ static bool vhost_svq_add_split(VhostShadowVirtqueue *svq,
     /* We need some descriptors here */
     assert(elem->out_num || elem->in_num);
 
-    ok = vhost_svq_translate_addr(svq, sgs, elem->out_sg, elem->out_num);
-    if (unlikely(!ok)) {
-        return false;
+    if (elem->out_sg && svq_elem->not_from_guest) {
+        DMAMap map = {
+            .translated_addr = (hwaddr)svq_elem->elem.out_sg->iov_base,
+            .size = ROUND_UP(elem->out_sg->iov_len, 4096) - 1,
+            .perm = IOMMU_RO,
+        };
+        int r = vhost_iova_tree_map_alloc(svq->iova_tree, &map);
+
+        elem->out_addr[0] = map.iova;
+        assert(elem->out_num == 1);
+        assert(r == IOVA_OK);
+
+        r = svq->map_ops->map(map.iova, map.size, (void *)map.translated_addr,
+                              true, svq->map_ops_opaque);
+        assert(r == 0);
+        sgs[0] = (void *)map.iova;
+    } else {
+        ok = vhost_svq_translate_addr(svq, sgs, elem->out_sg, elem->out_num);
+        if (unlikely(!ok)) {
+            return false;
+        }
     }
     vhost_vring_write_descs(svq, sgs, elem->out_sg, elem->out_num,
                             elem->in_num > 0, false);
 
+    if (elem->in_sg && svq_elem->not_from_guest) {
+        DMAMap map = {
+            .translated_addr = (hwaddr)svq_elem->elem.in_sg->iov_base,
+            .size = ROUND_UP(elem->in_sg->iov_len, 4096) - 1,
+            .perm = IOMMU_RW,
+        };
+        int r = vhost_iova_tree_map_alloc(svq->iova_tree, &map);
 
-    ok = vhost_svq_translate_addr(svq, sgs, elem->in_sg, elem->in_num);
-    if (unlikely(!ok)) {
-        return false;
-    }
+        elem->in_addr[0] = map.iova;
+        assert(elem->out_num == 1);
+        assert(r == IOVA_OK);
 
+        r = svq->map_ops->map(map.iova, map.size, (void *)map.translated_addr,
+                              false, svq->map_ops_opaque);
+        assert(r == 0);
+        sgs[0] = (void *)map.iova;
+    } else {
+        ok = vhost_svq_translate_addr(svq, sgs, elem->in_sg, elem->in_num);
+        if (unlikely(!ok)) {
+            return false;
+        }
+    }
     vhost_vring_write_descs(svq, sgs, elem->in_sg, elem->in_num, false, true);
 
     /*
@@ -364,6 +400,43 @@ static void vhost_svq_kick(VhostShadowVirtqueue *svq)
     event_notifier_set(&svq->hdev_kick);
 }
 
+bool vhost_svq_inject(VhostShadowVirtqueue *svq, const struct iovec *iov,
+                      size_t out_num, size_t in_num)
+{
+    size_t out_size = iov_size(iov, out_num);
+    size_t out_buf_size = ROUND_UP(out_size, 4096);
+    size_t in_size = iov_size(iov + out_num, in_num);
+    size_t in_buf_size = ROUND_UP(in_size, 4096);
+    SVQElement *svq_elem;
+    uint16_t num_slots = (in_num ? 1 : 0) + (out_num ? 1 : 0);
+
+    if (unlikely(num_slots == 0 || svq->next_guest_avail_elem ||
+        vhost_svq_available_slots(svq) < num_slots)) {
+        return false;
+    }
+
+    svq_elem = virtqueue_alloc_element(sizeof(SVQElement), 1, 1);
+    if (out_num) {
+        void *out = qemu_memalign(4096, out_buf_size);
+        svq_elem->elem.out_sg[0].iov_base = out;
+        svq_elem->elem.out_sg[0].iov_len = out_size;
+        iov_to_buf(iov, out_num, 0, out, out_size);
+        memset(out + out_size, 0, out_buf_size - out_size);
+    }
+    if (in_num) {
+        void *in = qemu_memalign(4096, in_buf_size);
+        svq_elem->elem.in_sg[0].iov_base = in;
+        svq_elem->elem.in_sg[0].iov_len = in_size;
+        memset(in, 0, in_buf_size);
+    }
+
+    svq_elem->not_from_guest = true;
+    vhost_svq_add(svq, svq_elem);
+    vhost_svq_kick(svq);
+
+    return true;
+}
+
 /**
  * Forward available buffers.
  *
@@ -512,23 +585,50 @@ static void vhost_svq_flush(VhostShadowVirtqueue *svq,
             }
 
             elem = &svq_elem->elem;
-            if (unlikely(i >= svq->vring.num)) {
-                virtio_error(svq->vdev,
-                         "More than %u used buffers obtained in a %u size SVQ",
-                         i, svq->vring.num);
-                virtqueue_fill(vq, elem, elem->len, i);
-                virtqueue_flush(vq, i);
-                i = 0;
-            }
-            virtqueue_fill(vq, elem, elem->len, i++);
-
             if (svq->ops && svq->ops->used_elem_handler) {
                 svq->ops->used_elem_handler(svq->vdev, elem);
             }
+
+            if (svq_elem->not_from_guest) {
+                const DMAMap out_map = {
+                    .iova = elem->out_addr[0],
+                    .translated_addr = (hwaddr)elem->out_sg[0].iov_base,
+                    .size = elem->out_sg[0].iov_len,
+                };
+                const DMAMap in_map = {
+                    .iova = elem->in_addr[0],
+                    .translated_addr = (hwaddr)elem->in_sg[0].iov_base,
+                    .size = elem->in_sg[0].iov_len,
+                };
+                vhost_iova_tree_remove(svq->iova_tree, &out_map);
+                if (svq->map_ops->unmap) {
+                    svq->map_ops->unmap(out_map.iova, in_map.size,
+                                        svq->map_ops_opaque);
+                }
+                qemu_vfree(elem->out_sg[0].iov_base);
+                vhost_iova_tree_remove(svq->iova_tree, &in_map);
+                if (svq->map_ops->unmap) {
+                    svq->map_ops->unmap(out_map.iova, out_map.size,
+                                        svq->map_ops_opaque);
+                }
+                qemu_vfree(elem->in_sg[0].iov_base);
+            } else {
+                if (unlikely(i >= svq->vring.num)) {
+                    virtio_error(svq->vdev,
+                        "More than %u used buffers obtained in a %u size SVQ",
+                        i, svq->vring.num);
+                    virtqueue_fill(vq, elem, elem->len, i);
+                    virtqueue_flush(vq, i);
+                    i = 0;
+                }
+                virtqueue_fill(vq, elem, elem->len, i++);
+            }
         }
 
-        virtqueue_flush(vq, i);
-        event_notifier_set(&svq->svq_call);
+        if (i > 0) {
+            virtqueue_flush(vq, i);
+            event_notifier_set(&svq->svq_call);
+        }
 
         if (check_for_avail_queue && svq->next_guest_avail_elem) {
             /*
@@ -704,14 +804,14 @@ void vhost_svq_stop(VhostShadowVirtqueue *svq)
     for (unsigned i = 0; i < svq->vring.num; ++i) {
         g_autofree SVQElement *svq_elem = NULL;
         svq_elem = g_steal_pointer(&svq->ring_id_maps[i]);
-        if (svq_elem)  {
+        if (svq_elem && !svq_elem->not_from_guest)  {
             virtqueue_detach_element(svq->vq, &svq_elem->elem,
                                      svq_elem->elem.len);
         }
     }
 
     next_avail_elem = g_steal_pointer(&svq->next_guest_avail_elem);
-    if (next_avail_elem) {
+    if (next_avail_elem && !next_avail_elem->not_from_guest) {
         virtqueue_detach_element(svq->vq, &next_avail_elem->elem,
                                  next_avail_elem->elem.len);
     }
-- 
2.27.0


