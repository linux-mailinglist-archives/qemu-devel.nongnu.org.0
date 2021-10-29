Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 014944402E5
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 21:09:00 +0200 (CEST)
Received: from localhost ([::1]:43676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgXFK-0000oJ-RQ
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 15:08:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mgWrm-0006bQ-5b
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 14:44:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47441)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mgWrj-00034o-Vs
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 14:44:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635533074;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1LVxG3kH5/l5zYFbZvNOuy5iveaPCDv0YsOE7we2KI4=;
 b=XXqtC9ZNA9OFfgOxS2lTY2gIFvVjD+J4QcPtGwO+FPtxK4Al4mh+6hAtGyqs0wfeCA3sgN
 8jXo9FtrpnUUHB3r1Bl8V3e2ZeNfOxDIQbzoqtXAUVnF8kbu8ycsRBANNixz8x/Xwutq97
 K8ume/aNaqVeN6gGxv0JUeDKMHas9ik=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-588-lH-zJimNPq-DqGmDYcr4Mw-1; Fri, 29 Oct 2021 14:44:31 -0400
X-MC-Unique: lH-zJimNPq-DqGmDYcr4Mw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B1E6618414A0;
 Fri, 29 Oct 2021 18:44:29 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.75])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A2A475D6CF;
 Fri, 29 Oct 2021 18:44:25 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v5 26/26] vdpa: Add custom IOTLB translations to SVQ
Date: Fri, 29 Oct 2021 20:35:25 +0200
Message-Id: <20211029183525.1776416-27-eperezma@redhat.com>
In-Reply-To: <20211029183525.1776416-1-eperezma@redhat.com>
References: <20211029183525.1776416-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Peter Xu <peterx@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Eli Cohen <eli@mellanox.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Eric Blake <eblake@redhat.com>,
 virtualization@lists.linux-foundation.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use translations added in VhostIOVATree in SVQ.

Now every element needs to remember the iova / GPA address also, so
VirtQueue can consume the elements properly. This adds a little
overhead per VQ element, having to allocate more memory to stash them.

As a possible optimization, this allocation could be avoided if the
descriptor is not a chain but a single one, but this is left undone.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/virtio/vhost-shadow-virtqueue.h |   4 +-
 hw/virtio/vhost-shadow-virtqueue.c | 156 ++++++++++++++++++++++-------
 hw/virtio/vhost-vdpa.c             |  35 ++++++-
 3 files changed, 159 insertions(+), 36 deletions(-)

diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost-shadow-virtqueue.h
index ac55588009..903b9f7a14 100644
--- a/hw/virtio/vhost-shadow-virtqueue.h
+++ b/hw/virtio/vhost-shadow-virtqueue.h
@@ -12,6 +12,7 @@
 
 #include "hw/virtio/vhost.h"
 #include "qemu/event_notifier.h"
+#include "hw/virtio/vhost-iova-tree.h"
 
 typedef struct VhostShadowVirtqueue VhostShadowVirtqueue;
 
@@ -35,7 +36,8 @@ void vhost_svq_start(struct vhost_dev *dev, unsigned idx,
 void vhost_svq_stop(struct vhost_dev *dev, unsigned idx,
                     VhostShadowVirtqueue *svq);
 
-VhostShadowVirtqueue *vhost_svq_new(struct vhost_dev *dev, int idx);
+VhostShadowVirtqueue *vhost_svq_new(struct vhost_dev *dev, int idx,
+                                    VhostIOVATree *iova_map);
 
 void vhost_svq_free(VhostShadowVirtqueue *vq);
 
diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
index ad1b2342be..7ab506f9e7 100644
--- a/hw/virtio/vhost-shadow-virtqueue.c
+++ b/hw/virtio/vhost-shadow-virtqueue.c
@@ -11,12 +11,19 @@
 #include "hw/virtio/vhost-shadow-virtqueue.h"
 #include "hw/virtio/vhost.h"
 #include "hw/virtio/virtio-access.h"
+#include "hw/virtio/vhost-iova-tree.h"
 
 #include "standard-headers/linux/vhost_types.h"
 
 #include "qemu/error-report.h"
 #include "qemu/main-loop.h"
 
+typedef struct SVQElement {
+    VirtQueueElement elem;
+    void **vaddr_in_sg;
+    void **vaddr_out_sg;
+} SVQElement;
+
 /* Shadow virtqueue to relay notifications */
 typedef struct VhostShadowVirtqueue {
     /* Shadow vring */
@@ -49,11 +56,14 @@ typedef struct VhostShadowVirtqueue {
     /* Virtio device */
     VirtIODevice *vdev;
 
+    /* IOVA mapping if used */
+    VhostIOVATree *iova_map;
+
     /* Map for returning guest's descriptors */
-    VirtQueueElement **ring_id_maps;
+    SVQElement **ring_id_maps;
 
-    /* Next VirtQueue element that guest made available */
-    VirtQueueElement *next_guest_avail_elem;
+    /* Next SVQ element that guest made available */
+    SVQElement *next_guest_avail_elem;
 
     /* Next head to expose to device */
     uint16_t avail_idx_shadow;
@@ -80,6 +90,14 @@ const EventNotifier *vhost_svq_get_dev_kick_notifier(
     return &svq->hdev_kick;
 }
 
+static void vhost_svq_elem_free(SVQElement *elem)
+{
+    g_free(elem->vaddr_in_sg);
+    g_free(elem->vaddr_out_sg);
+    g_free(elem);
+}
+G_DEFINE_AUTOPTR_CLEANUP_FUNC(SVQElement, vhost_svq_elem_free)
+
 /**
  * VirtIO transport device feature acknowledge
  *
@@ -99,13 +117,7 @@ bool vhost_svq_valid_device_features(uint64_t *dev_features)
             continue;
 
         case VIRTIO_F_ACCESS_PLATFORM:
-            /* SVQ does not know how to translate addresses */
-            if (*dev_features & BIT_ULL(b)) {
-                clear_bit(b, dev_features);
-                r = false;
-            }
-            break;
-
+            /* SVQ trust in host's IOMMU to translate addresses */
         case VIRTIO_F_VERSION_1:
             /* SVQ trust that guest vring is little endian */
             if (!(*dev_features & BIT_ULL(b))) {
@@ -175,7 +187,49 @@ static void vhost_svq_set_notification(VhostShadowVirtqueue *svq, bool enable)
     }
 }
 
+static bool vhost_svq_translate_addr(const VhostShadowVirtqueue *svq,
+                                     void ***vaddr, const struct iovec *iovec,
+                                     size_t num)
+{
+    size_t i;
+
+    if (num == 0) {
+        return true;
+    }
+
+    g_autofree void **addrs = g_new(void *, num);
+    for (i = 0; i < num; ++i) {
+        DMAMap needle = {
+            .translated_addr = (hwaddr)iovec[i].iov_base,
+            .size = iovec[i].iov_len,
+        };
+        size_t off;
+
+        const DMAMap *map = vhost_iova_tree_find_iova(svq->iova_map, &needle);
+        /*
+         * Map cannot be NULL since iova map contains all guest space and
+         * qemu already has a physical address mapped
+         */
+        if (unlikely(!map)) {
+            error_report("Invalid address 0x%"HWADDR_PRIx" given by guest",
+                         needle.translated_addr);
+            return false;
+        }
+
+        /*
+         * Map->iova chunk size is ignored. What to do if descriptor
+         * (addr, size) does not fit is delegated to the device.
+         */
+        off = needle.translated_addr - map->translated_addr;
+        addrs[i] = (void *)(map->iova + off);
+    }
+
+    *vaddr = g_steal_pointer(&addrs);
+    return true;
+}
+
 static void vhost_vring_write_descs(VhostShadowVirtqueue *svq,
+                                    void * const *vaddr_sg,
                                     const struct iovec *iovec,
                                     size_t num, bool more_descs, bool write)
 {
@@ -194,7 +248,7 @@ static void vhost_vring_write_descs(VhostShadowVirtqueue *svq,
         } else {
             descs[i].flags = flags;
         }
-        descs[i].addr = cpu_to_le64((hwaddr)iovec[n].iov_base);
+        descs[i].addr = cpu_to_le64((hwaddr)vaddr_sg[n]);
         descs[i].len = cpu_to_le32(iovec[n].iov_len);
 
         last = i;
@@ -204,43 +258,62 @@ static void vhost_vring_write_descs(VhostShadowVirtqueue *svq,
     svq->free_head = le16_to_cpu(descs[last].next);
 }
 
-static unsigned vhost_svq_add_split(VhostShadowVirtqueue *svq,
-                                    VirtQueueElement *elem)
+static bool vhost_svq_add_split(VhostShadowVirtqueue *svq,
+                                SVQElement *svq_elem,
+                                unsigned *head)
 {
-    int head;
+    VirtQueueElement *elem = &svq_elem->elem;
     unsigned avail_idx;
     vring_avail_t *avail = svq->vring.avail;
+    bool ok;
 
-    head = svq->free_head;
+    *head = svq->free_head;
 
     /* We need some descriptors here */
     assert(elem->out_num || elem->in_num);
 
-    vhost_vring_write_descs(svq, elem->out_sg, elem->out_num,
-                            elem->in_num > 0, false);
-    vhost_vring_write_descs(svq, elem->in_sg, elem->in_num, false, true);
+    ok = vhost_svq_translate_addr(svq, &svq_elem->vaddr_in_sg, elem->in_sg,
+                                  elem->in_num);
+    if (unlikely(!ok)) {
+        return false;
+    }
+    ok = vhost_svq_translate_addr(svq, &svq_elem->vaddr_out_sg, elem->out_sg,
+                                  elem->out_num);
+    if (unlikely(!ok)) {
+        return false;
+    }
+
+    vhost_vring_write_descs(svq, svq_elem->vaddr_out_sg, elem->out_sg,
+                            elem->out_num, elem->in_num > 0, false);
+    vhost_vring_write_descs(svq, svq_elem->vaddr_in_sg, elem->in_sg,
+                            elem->in_num, false, true);
 
     /*
      * Put entry in available array (but don't update avail->idx until they
      * do sync).
      */
     avail_idx = svq->avail_idx_shadow & (svq->vring.num - 1);
-    avail->ring[avail_idx] = cpu_to_le16(head);
+    avail->ring[avail_idx] = cpu_to_le16(*head);
     svq->avail_idx_shadow++;
 
     /* Update avail index after the descriptor is wrote */
     smp_wmb();
     avail->idx = cpu_to_le16(svq->avail_idx_shadow);
 
-    return head;
+    return true;
 
 }
 
-static void vhost_svq_add(VhostShadowVirtqueue *svq, VirtQueueElement *elem)
+static bool vhost_svq_add(VhostShadowVirtqueue *svq, SVQElement *elem)
 {
-    unsigned qemu_head = vhost_svq_add_split(svq, elem);
+    unsigned qemu_head;
+    bool ok = vhost_svq_add_split(svq, elem, &qemu_head);
+    if (unlikely(!ok)) {
+        return false;
+    }
 
     svq->ring_id_maps[qemu_head] = elem;
+    return true;
 }
 
 static void vhost_svq_kick(VhostShadowVirtqueue *svq)
@@ -284,7 +357,8 @@ static void vhost_handle_guest_kick(VhostShadowVirtqueue *svq)
         }
 
         while (true) {
-            VirtQueueElement *elem;
+            SVQElement *elem;
+            bool ok;
 
             if (svq->next_guest_avail_elem) {
                 elem = g_steal_pointer(&svq->next_guest_avail_elem);
@@ -296,7 +370,7 @@ static void vhost_handle_guest_kick(VhostShadowVirtqueue *svq)
                 break;
             }
 
-            if (elem->out_num + elem->in_num >
+            if (elem->elem.out_num + elem->elem.in_num >
                 vhost_svq_available_slots(svq)) {
                 /*
                  * This condition is possible since a contiguous buffer in GPA
@@ -313,7 +387,11 @@ static void vhost_handle_guest_kick(VhostShadowVirtqueue *svq)
                 return;
             }
 
-            vhost_svq_add(svq, elem);
+            ok = vhost_svq_add(svq, elem);
+            if (unlikely(!ok)) {
+                /* VQ is broken, just return and ignore any other kicks */
+                return;
+            }
             vhost_svq_kick(svq);
         }
 
@@ -344,7 +422,7 @@ static bool vhost_svq_more_used(VhostShadowVirtqueue *svq)
     return svq->last_used_idx != svq->shadow_used_idx;
 }
 
-static VirtQueueElement *vhost_svq_get_buf(VhostShadowVirtqueue *svq)
+static SVQElement *vhost_svq_get_buf(VhostShadowVirtqueue *svq)
 {
     vring_desc_t *descs = svq->vring.desc;
     const vring_used_t *used = svq->vring.used;
@@ -378,7 +456,7 @@ static VirtQueueElement *vhost_svq_get_buf(VhostShadowVirtqueue *svq)
     descs[used_elem.id].next = svq->free_head;
     svq->free_head = used_elem.id;
 
-    svq->ring_id_maps[used_elem.id]->len = used_elem.len;
+    svq->ring_id_maps[used_elem.id]->elem.len = used_elem.len;
     return g_steal_pointer(&svq->ring_id_maps[used_elem.id]);
 }
 
@@ -393,8 +471,9 @@ static void vhost_svq_flush(VhostShadowVirtqueue *svq,
 
         vhost_svq_set_notification(svq, false);
         while (true) {
-            g_autofree VirtQueueElement *elem = vhost_svq_get_buf(svq);
-            if (!elem) {
+            g_autofree SVQElement *svq_elem = vhost_svq_get_buf(svq);
+            VirtQueueElement *elem;
+            if (!svq_elem) {
                 break;
             }
 
@@ -406,6 +485,7 @@ static void vhost_svq_flush(VhostShadowVirtqueue *svq,
                 virtqueue_flush(vq, i);
                 i = 0;
             }
+            elem = &svq_elem->elem;
             virtqueue_fill(vq, elem, elem->len, i++);
         }
 
@@ -583,10 +663,15 @@ void vhost_svq_stop(struct vhost_dev *dev, unsigned idx,
     vhost_svq_flush(svq, false);
 
     for (i = 0; i < svq->vring.num; ++i) {
-        g_autofree VirtQueueElement *elem = svq->ring_id_maps[i];
-        if (elem) {
-            virtqueue_detach_element(svq->vq, elem, elem->len);
+        g_autofree SVQElement *svq_elem = svq->ring_id_maps[i];
+        VirtQueueElement *elem;
+
+        if (!svq_elem) {
+            continue;
         }
+
+        elem = &svq_elem->elem;
+        virtqueue_detach_element(svq->vq, elem, elem->len);
     }
 }
 
@@ -594,7 +679,8 @@ void vhost_svq_stop(struct vhost_dev *dev, unsigned idx,
  * Creates vhost shadow virtqueue, and instruct vhost device to use the shadow
  * methods and file descriptors.
  */
-VhostShadowVirtqueue *vhost_svq_new(struct vhost_dev *dev, int idx)
+VhostShadowVirtqueue *vhost_svq_new(struct vhost_dev *dev, int idx,
+                                    VhostIOVATree *iova_map)
 {
     int vq_idx = dev->vq_index + idx;
     unsigned num = virtio_queue_get_num(dev->vdev, vq_idx);
@@ -628,11 +714,13 @@ VhostShadowVirtqueue *vhost_svq_new(struct vhost_dev *dev, int idx)
     memset(svq->vring.desc, 0, driver_size);
     svq->vring.used = qemu_memalign(qemu_real_host_page_size, device_size);
     memset(svq->vring.used, 0, device_size);
+    svq->iova_map = iova_map;
+
     for (i = 0; i < num - 1; i++) {
         svq->vring.desc[i].next = cpu_to_le16(i + 1);
     }
 
-    svq->ring_id_maps = g_new0(VirtQueueElement *, num);
+    svq->ring_id_maps = g_new0(SVQElement *, num);
     event_notifier_set_handler(&svq->hdev_call, vhost_svq_handle_call);
     return g_steal_pointer(&svq);
 
diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index a827ecbe4f..8466580ae7 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -210,6 +210,18 @@ static void vhost_vdpa_listener_region_add(MemoryListener *listener,
                                          vaddr, section->readonly);
 
     llsize = int128_sub(llend, int128_make64(iova));
+    if (v->shadow_vqs_enabled) {
+        DMAMap mem_region = {
+            .translated_addr = (hwaddr)vaddr,
+            .size = int128_get64(llsize) - 1,
+            .perm = IOMMU_ACCESS_FLAG(true, section->readonly),
+        };
+
+        int r = vhost_iova_tree_map_alloc(v->iova_map, &mem_region);
+        assert(r == IOVA_OK);
+
+        iova = mem_region.iova;
+    }
 
     vhost_vdpa_iotlb_batch_begin_once(v);
     ret = vhost_vdpa_dma_map(v, iova, int128_get64(llsize),
@@ -262,6 +274,20 @@ static void vhost_vdpa_listener_region_del(MemoryListener *listener,
 
     llsize = int128_sub(llend, int128_make64(iova));
 
+    if (v->shadow_vqs_enabled) {
+        const DMAMap *result;
+        const void *vaddr = memory_region_get_ram_ptr(section->mr) +
+            section->offset_within_region +
+            (iova - section->offset_within_address_space);
+        DMAMap mem_region = {
+            .translated_addr = (hwaddr)vaddr,
+            .size = int128_get64(llsize) - 1,
+        };
+
+        result = vhost_iova_tree_find_iova(v->iova_map, &mem_region);
+        iova = result->iova;
+        vhost_iova_tree_remove(v->iova_map, &mem_region);
+    }
     vhost_vdpa_iotlb_batch_begin_once(v);
     ret = vhost_vdpa_dma_unmap(v, iova, int128_get64(llsize));
     if (ret) {
@@ -1067,7 +1093,7 @@ void vhost_vdpa_enable_svq(struct vhost_vdpa *v, bool enable, Error **errp)
         /* Allocate resources */
         assert(v->shadow_vqs->len == 0);
         for (n = 0; n < hdev->nvqs; ++n) {
-            VhostShadowVirtqueue *svq = vhost_svq_new(hdev, n);
+            VhostShadowVirtqueue *svq = vhost_svq_new(hdev, n, v->iova_map);
             if (unlikely(!svq)) {
                 error_setg(errp, "Cannot create svq");
                 enable = false;
@@ -1088,6 +1114,13 @@ void vhost_vdpa_enable_svq(struct vhost_vdpa *v, bool enable, Error **errp)
         vhost_vdpa_get_vq_state(hdev, hdev->vq_index + n);
     }
 
+    memory_listener_unregister(&v->listener);
+    r = vhost_vdpa_dma_unmap(v, iova_first,
+                            (iova_last - iova_first) & TARGET_PAGE_MASK);
+    if (unlikely(r)) {
+        error_setg_errno(errp, -r, "Fail to invalidate IOTLB");
+    }
+
     /* Reset device so it can be configured */
     vhost_vdpa_dev_start(hdev, false);
 
-- 
2.27.0


