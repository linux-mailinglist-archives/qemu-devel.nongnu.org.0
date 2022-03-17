Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D9A04DCDA3
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 19:36:16 +0100 (CET)
Received: from localhost ([::1]:40360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUuyt-0006fN-Ma
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 14:36:15 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nUunu-000120-A7
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 14:24:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45901)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nUunr-0006Bn-Bl
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 14:24:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647541490;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rSPwMl7ce3q3hZXbpaQpOMPEejyZEnd6DcIUI5eK2tM=;
 b=bTob6pOQ4WjxqHfj1pHg9oDBhTM0cMWXcgI72ugiS/TN4oUkDN6VOb9urOUamZiHtRXTLq
 gIDVt7AjaC0XHAE1/RI+8Mxm0U02IKcHm1RqzmBO3L3tTCfk/nRLnSctzupyNmwFTz9tav
 sZbeLNYcnZLxTcg6A98m7Iqhz103HBE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-426-h_RCY3ZdMkCTw-FAQWJWZQ-1; Thu, 17 Mar 2022 14:24:47 -0400
X-MC-Unique: h_RCY3ZdMkCTw-FAQWJWZQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1C742811E75;
 Thu, 17 Mar 2022 18:24:47 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.154])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1FB771454539;
 Thu, 17 Mar 2022 18:24:43 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 13/18] vhost: Add vhost_svq_inject
Date: Thu, 17 Mar 2022 19:23:54 +0100
Message-Id: <20220317182400.651508-14-eperezma@redhat.com>
In-Reply-To: <20220317182400.651508-1-eperezma@redhat.com>
References: <20220317182400.651508-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 Zhu Lingshan <lingshan.zhu@intel.com>, Liuxiangdong <liuxiangdong5@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This allows qemu to inject packets to the device without guest's notice.

This will be use to inject net CVQ messages to restore status in the destination

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/virtio/vhost-shadow-virtqueue.h |   5 +
 hw/virtio/vhost-shadow-virtqueue.c | 177 +++++++++++++++++++++++++----
 2 files changed, 158 insertions(+), 24 deletions(-)

diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost-shadow-virtqueue.h
index 6e61d9bfef..d82a64d566 100644
--- a/hw/virtio/vhost-shadow-virtqueue.h
+++ b/hw/virtio/vhost-shadow-virtqueue.h
@@ -17,6 +17,9 @@
 
 typedef struct SVQElement {
     VirtQueueElement elem;
+    hwaddr in_iova;
+    hwaddr out_iova;
+    bool not_from_guest;
 } SVQElement;
 
 typedef void (*VirtQueueElementCallback)(VirtIODevice *vdev,
@@ -100,6 +103,8 @@ typedef struct VhostShadowVirtqueue {
 
 bool vhost_svq_valid_features(uint64_t features, Error **errp);
 
+bool vhost_svq_inject(VhostShadowVirtqueue *svq, const struct iovec *iov,
+                      size_t out_num, size_t in_num);
 void vhost_svq_set_svq_kick_fd(VhostShadowVirtqueue *svq, int svq_kick_fd);
 void vhost_svq_set_svq_call_fd(VhostShadowVirtqueue *svq, int call_fd);
 void vhost_svq_get_vring_addr(const VhostShadowVirtqueue *svq,
diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
index 714c820698..be15fd86b5 100644
--- a/hw/virtio/vhost-shadow-virtqueue.c
+++ b/hw/virtio/vhost-shadow-virtqueue.c
@@ -16,6 +16,7 @@
 #include "qemu/log.h"
 #include "qemu/memalign.h"
 #include "linux-headers/linux/vhost.h"
+#include "qemu/iov.h"
 
 /**
  * Validate the transport device features that both guests can use with the SVQ
@@ -122,7 +123,8 @@ static bool vhost_svq_translate_addr(const VhostShadowVirtqueue *svq,
     return true;
 }
 
-static bool vhost_svq_vring_write_descs(VhostShadowVirtqueue *svq, hwaddr *sg,
+static bool vhost_svq_vring_write_descs(VhostShadowVirtqueue *svq,
+                                        SVQElement *svq_elem, hwaddr *sg,
                                         const struct iovec *iovec, size_t num,
                                         bool more_descs, bool write)
 {
@@ -130,15 +132,39 @@ static bool vhost_svq_vring_write_descs(VhostShadowVirtqueue *svq, hwaddr *sg,
     unsigned n;
     uint16_t flags = write ? cpu_to_le16(VRING_DESC_F_WRITE) : 0;
     vring_desc_t *descs = svq->vring.desc;
-    bool ok;
 
     if (num == 0) {
         return true;
     }
 
-    ok = vhost_svq_translate_addr(svq, sg, iovec, num);
-    if (unlikely(!ok)) {
-        return false;
+    if (svq_elem->not_from_guest) {
+        DMAMap map = {
+            .translated_addr = (hwaddr)iovec->iov_base,
+            .size = ROUND_UP(iovec->iov_len, 4096) - 1,
+            .perm = write ? IOMMU_RW : IOMMU_RO,
+        };
+        int r;
+
+        if (unlikely(num != 1)) {
+            error_report("Unexpected chain of element injected");
+            return false;
+        }
+        r = vhost_iova_tree_map_alloc(svq->iova_tree, &map);
+        if (unlikely(r != IOVA_OK)) {
+            error_report("Cannot map injected element");
+            return false;
+        }
+
+        r = svq->map_ops->map(map.iova, map.size + 1,
+                              (void *)map.translated_addr, !write,
+                              svq->map_ops_opaque);
+        assert(r == 0);
+        sg[0] = map.iova;
+    } else {
+        bool ok = vhost_svq_translate_addr(svq, sg, iovec, num);
+        if (unlikely(!ok)) {
+            return false;
+        }
     }
 
     for (n = 0; n < num; n++) {
@@ -165,7 +191,8 @@ static bool vhost_svq_add_split(VhostShadowVirtqueue *svq, SVQElement *svq_elem,
     unsigned avail_idx;
     vring_avail_t *avail = svq->vring.avail;
     bool ok;
-    g_autofree hwaddr *sgs = g_new(hwaddr, MAX(elem->out_num, elem->in_num));
+    g_autofree hwaddr *sgs = NULL;
+    hwaddr *in_sgs, *out_sgs;
 
     *head = svq->free_head;
 
@@ -176,15 +203,23 @@ static bool vhost_svq_add_split(VhostShadowVirtqueue *svq, SVQElement *svq_elem,
         return false;
     }
 
-    ok = vhost_svq_vring_write_descs(svq, sgs, elem->out_sg, elem->out_num,
-                                     elem->in_num > 0, false);
+    if (!svq_elem->not_from_guest) {
+        sgs = g_new(hwaddr, MAX(elem->out_num, elem->in_num));
+        in_sgs = out_sgs = sgs;
+    } else {
+        in_sgs = &svq_elem->in_iova;
+        out_sgs = &svq_elem->out_iova;
+    }
+    ok = vhost_svq_vring_write_descs(svq, svq_elem, out_sgs, elem->out_sg,
+                                     elem->out_num, elem->in_num > 0, false);
     if (unlikely(!ok)) {
         return false;
     }
 
-    ok = vhost_svq_vring_write_descs(svq, sgs, elem->in_sg, elem->in_num, false,
-                                     true);
+    ok = vhost_svq_vring_write_descs(svq, svq_elem, in_sgs, elem->in_sg,
+                                     elem->in_num, false, true);
     if (unlikely(!ok)) {
+        /* TODO unwind out_sg */
         return false;
     }
 
@@ -229,6 +264,43 @@ static void vhost_svq_kick(VhostShadowVirtqueue *svq)
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
+                 vhost_svq_available_slots(svq) < num_slots)) {
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
@@ -266,6 +338,7 @@ static void vhost_handle_guest_kick(VhostShadowVirtqueue *svq)
                 break;
             }
 
+            svq_elem->not_from_guest = false;
             elem = &svq_elem->elem;
             if (elem->out_num + elem->in_num > vhost_svq_available_slots(svq)) {
                 /*
@@ -378,6 +451,29 @@ static SVQElement *vhost_svq_get_buf(VhostShadowVirtqueue *svq, uint32_t *len)
     return g_steal_pointer(&svq->ring_id_maps[used_elem.id]);
 }
 
+static int vhost_svq_unmap(VhostShadowVirtqueue *svq, hwaddr iova, size_t size)
+{
+    DMAMap needle = {
+        .iova = iova,
+        .size = size,
+    };
+    const DMAMap *overlap;
+
+    while ((overlap = vhost_iova_tree_find(svq->iova_tree, &needle))) {
+        if (svq->map_ops->unmap) {
+            int r = svq->map_ops->unmap(overlap->iova, overlap->size + 1,
+                                        svq->map_ops_opaque);
+            if (unlikely(r != 0)) {
+                return r;
+            }
+        }
+        vhost_iova_tree_remove(svq->iova_tree, overlap);
+        qemu_vfree((void *)overlap->translated_addr);
+    }
+
+    return 0;
+}
+
 static void vhost_svq_flush(VhostShadowVirtqueue *svq,
                             bool check_for_avail_queue)
 {
@@ -397,23 +493,56 @@ static void vhost_svq_flush(VhostShadowVirtqueue *svq,
             }
 
             elem = &svq_elem->elem;
-            if (unlikely(i >= svq->vring.num)) {
-                qemu_log_mask(LOG_GUEST_ERROR,
-                         "More than %u used buffers obtained in a %u size SVQ",
-                         i, svq->vring.num);
-                virtqueue_fill(vq, elem, len, i);
-                virtqueue_flush(vq, i);
-                return;
-            }
-            virtqueue_fill(vq, elem, len, i++);
-
             if (svq->ops && svq->ops->used_elem_handler) {
                 svq->ops->used_elem_handler(svq->vdev, elem);
             }
+
+            if (svq_elem->not_from_guest) {
+                if (unlikely(!elem->out_num && elem->out_num != 1)) {
+                    error_report("Unexpected out_num > 1");
+                    return;
+                }
+
+                if (elem->out_num) {
+                    int r = vhost_svq_unmap(svq, svq_elem->out_iova,
+                                            elem->out_sg[0].iov_len);
+                    if (unlikely(r != 0)) {
+                        error_report("Cannot unmap out buffer");
+                        return;
+                    }
+                }
+
+                if (unlikely(!elem->in_num && elem->in_num != 1)) {
+                    error_report("Unexpected in_num > 1");
+                    return;
+                }
+
+                if (elem->in_num) {
+                    int r = vhost_svq_unmap(svq, svq_elem->in_iova,
+                                            elem->in_sg[0].iov_len);
+                    if (unlikely(r != 0)) {
+                        error_report("Cannot unmap out buffer");
+                        return;
+                    }
+                }
+            } else {
+                if (unlikely(i >= svq->vring.num)) {
+                    qemu_log_mask(
+                        LOG_GUEST_ERROR,
+                        "More than %u used buffers obtained in a %u size SVQ",
+                        i, svq->vring.num);
+                    virtqueue_fill(vq, elem, len, i);
+                    virtqueue_flush(vq, i);
+                    return;
+                }
+                virtqueue_fill(vq, elem, len, i++);
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
@@ -576,13 +705,13 @@ void vhost_svq_stop(VhostShadowVirtqueue *svq)
     for (unsigned i = 0; i < svq->vring.num; ++i) {
         g_autofree SVQElement *svq_elem = NULL;
         svq_elem = g_steal_pointer(&svq->ring_id_maps[i]);
-        if (svq_elem) {
+        if (svq_elem && !svq_elem->not_from_guest) {
             virtqueue_detach_element(svq->vq, &svq_elem->elem, 0);
         }
     }
 
     next_avail_elem = g_steal_pointer(&svq->next_guest_avail_elem);
-    if (next_avail_elem) {
+    if (next_avail_elem && !next_avail_elem->not_from_guest) {
         virtqueue_detach_element(svq->vq, &next_avail_elem->elem, 0);
     }
     svq->vq = NULL;
-- 
2.27.0


