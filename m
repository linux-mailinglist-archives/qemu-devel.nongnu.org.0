Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CCE838942B
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 18:53:42 +0200 (CEST)
Received: from localhost ([::1]:52328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljPS1-00079A-5D
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 12:53:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1ljP6g-0005u6-De
 for qemu-devel@nongnu.org; Wed, 19 May 2021 12:31:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58794)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1ljP6d-0005vN-5n
 for qemu-devel@nongnu.org; Wed, 19 May 2021 12:31:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621441894;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eNwtx5EEHBP81WChXzxc5VnAMW2cP+sOPItLL048mGw=;
 b=fgLJ+r0kG/OBaH+rpW6D7q6Le7dzLyy7/XOu7NOZ0OFlCSEGVuuhR4Azji6SADwKDC0AJV
 qADCwsakNV/s+6aPeIp97la7eGlSscIgwFi9t+khaeYBIfE0GojVaz3KeSbSdt624wOv1E
 a+Swv/yjqVuqCeJ3NxibFyRCdHTZzi4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-601--gC4mgEBPsKU5tR2yJzU5g-1; Wed, 19 May 2021 12:31:30 -0400
X-MC-Unique: -gC4mgEBPsKU5tR2yJzU5g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4E7E3801817;
 Wed, 19 May 2021 16:31:28 +0000 (UTC)
Received: from eperezma.remote.csb (ovpn-113-65.ams2.redhat.com [10.36.113.65])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 310BE5D6AC;
 Wed, 19 May 2021 16:31:25 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC v3 17/29] vhost: Shadow virtqueue buffers forwarding
Date: Wed, 19 May 2021 18:28:51 +0200
Message-Id: <20210519162903.1172366-18-eperezma@redhat.com>
In-Reply-To: <20210519162903.1172366-1-eperezma@redhat.com>
References: <20210519162903.1172366-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Parav Pandit <parav@mellanox.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 virtualization@lists.linux-foundation.org,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Michael Lilja <ml@napatech.com>, Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Initial version of shadow virtqueue that actually forward buffers. The
exposed addresses are the qemu's virtual address, so devices with IOMMU
that does not allow full mapping of qemu's address space does not work
at the moment.

Also for simplicity it only supports modern devices, that expects vring
in little endian, with split ring and no event idx or indirect
descriptors.

It reuses the VirtQueue code for the device part. The driver part is
based on Linux's virtio_ring driver, but with stripped functionality
and optimizations so it's easier to review.

Later commits will solve some of these concerns.

Code also need to map used ring (device part) as RW in, and only in,
vhost-net. To map (or call vhost_device_iotlb_miss) inconditionally
would print an error in case of vhost devices with its own mapping
(vdpa).

To know if this call is needed, vhost_sw_live_migration_start_vq and
vhost_sw_live_migration_stop copy the test performed in
vhost_dev_start. Testing for the actual backend type could be cleaner,
or checking for non-NULL vhost_force_iommu, enable_custom_iommu, or
another vhostOp. We could extract this test in its own function too,
so its name could give a better hint. Just copy the vhost_dev_start
check at the moment.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/virtio/vhost-shadow-virtqueue.c | 205 +++++++++++++++++++++++++++--
 hw/virtio/vhost.c                  | 134 ++++++++++++++++++-
 2 files changed, 325 insertions(+), 14 deletions(-)

diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
index ff50f12410..6d767fe248 100644
--- a/hw/virtio/vhost-shadow-virtqueue.c
+++ b/hw/virtio/vhost-shadow-virtqueue.c
@@ -9,6 +9,7 @@
 
 #include "hw/virtio/vhost-shadow-virtqueue.h"
 #include "hw/virtio/vhost.h"
+#include "hw/virtio/virtio-access.h"
 
 #include "standard-headers/linux/vhost_types.h"
 
@@ -48,9 +49,93 @@ typedef struct VhostShadowVirtqueue {
 
     /* Virtio device */
     VirtIODevice *vdev;
+
+    /* Map for returning guest's descriptors */
+    VirtQueueElement **ring_id_maps;
+
+    /* Next head to expose to device */
+    uint16_t avail_idx_shadow;
+
+    /* Next free descriptor */
+    uint16_t free_head;
+
+    /* Last seen used idx */
+    uint16_t shadow_used_idx;
+
+    /* Next head to consume from device */
+    uint16_t used_idx;
 } VhostShadowVirtqueue;
 
-/* Forward guest notifications */
+static void vhost_vring_write_descs(VhostShadowVirtqueue *svq,
+                                    const struct iovec *iovec,
+                                    size_t num, bool more_descs, bool write)
+{
+    uint16_t i = svq->free_head, last = svq->free_head;
+    unsigned n;
+    uint16_t flags = write ? cpu_to_le16(VRING_DESC_F_WRITE) : 0;
+    vring_desc_t *descs = svq->vring.desc;
+
+    if (num == 0) {
+        return;
+    }
+
+    for (n = 0; n < num; n++) {
+        if (more_descs || (n + 1 < num)) {
+            descs[i].flags = flags | cpu_to_le16(VRING_DESC_F_NEXT);
+        } else {
+            descs[i].flags = flags;
+        }
+        descs[i].addr = cpu_to_le64((hwaddr)iovec[n].iov_base);
+        descs[i].len = cpu_to_le32(iovec[n].iov_len);
+
+        last = i;
+        i = cpu_to_le16(descs[i].next);
+    }
+
+    svq->free_head = le16_to_cpu(descs[last].next);
+}
+
+static unsigned vhost_shadow_vq_add_split(VhostShadowVirtqueue *svq,
+                                          VirtQueueElement *elem)
+{
+    int head;
+    unsigned avail_idx;
+    vring_avail_t *avail = svq->vring.avail;
+
+    head = svq->free_head;
+
+    /* We need some descriptors here */
+    assert(elem->out_num || elem->in_num);
+
+    vhost_vring_write_descs(svq, elem->out_sg, elem->out_num,
+                            elem->in_num > 0, false);
+    vhost_vring_write_descs(svq, elem->in_sg, elem->in_num, false, true);
+
+    /*
+     * Put entry in available array (but don't update avail->idx until they
+     * do sync).
+     */
+    avail_idx = svq->avail_idx_shadow & (svq->vring.num - 1);
+    avail->ring[avail_idx] = cpu_to_le16(head);
+    svq->avail_idx_shadow++;
+
+    /* Expose descriptors to device */
+    smp_wmb();
+    avail->idx = cpu_to_le16(svq->avail_idx_shadow);
+
+    return head;
+
+}
+
+static void vhost_shadow_vq_add(VhostShadowVirtqueue *svq,
+                                VirtQueueElement *elem)
+{
+    unsigned qemu_head = vhost_shadow_vq_add_split(svq, elem);
+
+    svq->ring_id_maps[qemu_head] = elem;
+}
+
+/* Handle guest->device notifications */
 static void vhost_handle_guest_kick(EventNotifier *n)
 {
     VhostShadowVirtqueue *svq = container_of(n, VhostShadowVirtqueue,
@@ -60,7 +145,67 @@ static void vhost_handle_guest_kick(EventNotifier *n)
         return;
     }
 
-    event_notifier_set(&svq->kick_notifier);
+    /* Make available as many buffers as possible */
+    do {
+        if (virtio_queue_get_notification(svq->vq)) {
+            /* No more notifications until process all available */
+            virtio_queue_set_notification(svq->vq, false);
+        }
+
+        while (true) {
+            VirtQueueElement *elem = virtqueue_pop(svq->vq, sizeof(*elem));
+            if (!elem) {
+                break;
+            }
+
+            vhost_shadow_vq_add(svq, elem);
+            event_notifier_set(&svq->kick_notifier);
+        }
+
+        virtio_queue_set_notification(svq->vq, true);
+    } while (!virtio_queue_empty(svq->vq));
+}
+
+static bool vhost_shadow_vq_more_used(VhostShadowVirtqueue *svq)
+{
+    if (svq->used_idx != svq->shadow_used_idx) {
+        return true;
+    }
+
+    /* Get used idx must not be reordered */
+    smp_rmb();
+    svq->shadow_used_idx = cpu_to_le16(svq->vring.used->idx);
+
+    return svq->used_idx != svq->shadow_used_idx;
+}
+
+static VirtQueueElement *vhost_shadow_vq_get_buf(VhostShadowVirtqueue *svq)
+{
+    vring_desc_t *descs = svq->vring.desc;
+    const vring_used_t *used = svq->vring.used;
+    vring_used_elem_t used_elem;
+    uint16_t last_used;
+
+    if (!vhost_shadow_vq_more_used(svq)) {
+        return NULL;
+    }
+
+    last_used = svq->used_idx & (svq->vring.num - 1);
+    used_elem.id = le32_to_cpu(used->ring[last_used].id);
+    used_elem.len = le32_to_cpu(used->ring[last_used].len);
+
+    if (unlikely(used_elem.id >= svq->vring.num)) {
+        error_report("Device %s says index %u is available", svq->vdev->name,
+                     used_elem.id);
+        return NULL;
+    }
+
+    descs[used_elem.id].next = svq->free_head;
+    svq->free_head = used_elem.id;
+
+    svq->used_idx++;
+    svq->ring_id_maps[used_elem.id]->len = used_elem.len;
+    return g_steal_pointer(&svq->ring_id_maps[used_elem.id]);
 }
 
 /* Forward vhost notifications */
@@ -69,17 +214,33 @@ static void vhost_shadow_vq_handle_call_no_test(EventNotifier *n)
     VhostShadowVirtqueue *svq = container_of(n, VhostShadowVirtqueue,
                                              call_notifier);
     EventNotifier *masked_notifier;
+    VirtQueue *vq = svq->vq;
 
     masked_notifier = svq->masked_notifier.n;
 
-    if (!masked_notifier) {
-        unsigned n = virtio_get_queue_index(svq->vq);
-        virtio_queue_invalidate_signalled_used(svq->vdev, n);
-        virtio_notify_irqfd(svq->vdev, svq->vq);
-    } else if (!svq->masked_notifier.signaled) {
-        svq->masked_notifier.signaled = true;
-        event_notifier_set(svq->masked_notifier.n);
-    }
+    /* Make as many buffers as possible used. */
+    do {
+        unsigned i = 0;
+
+        /* TODO: Use VRING_AVAIL_F_NO_INTERRUPT */
+        while (true) {
+            g_autofree VirtQueueElement *elem = vhost_shadow_vq_get_buf(svq);
+            if (!elem) {
+                break;
+            }
+
+            assert(i < svq->vring.num);
+            virtqueue_fill(vq, elem, elem->len, i++);
+        }
+
+        virtqueue_flush(vq, i);
+        if (!masked_notifier) {
+            virtio_notify_irqfd(svq->vdev, svq->vq);
+        } else if (!svq->masked_notifier.signaled) {
+            svq->masked_notifier.signaled = true;
+            event_notifier_set(svq->masked_notifier.n);
+        }
+    } while (vhost_shadow_vq_more_used(svq));
 }
 
 static void vhost_shadow_vq_handle_call(EventNotifier *n)
@@ -243,7 +404,11 @@ void vhost_shadow_vq_stop(struct vhost_dev *dev,
                           unsigned idx,
                           VhostShadowVirtqueue *svq)
 {
+    int i;
     int r = vhost_shadow_vq_restore_vdev_host_notifier(dev, idx, svq);
+
+    assert(!dev->shadow_vqs_enabled);
+
     if (unlikely(r < 0)) {
         error_report("Couldn't restore vq kick fd: %s", strerror(-r));
     }
@@ -255,6 +420,18 @@ void vhost_shadow_vq_stop(struct vhost_dev *dev,
     /* Restore vhost call */
     vhost_virtqueue_mask(dev, dev->vdev, dev->vq_index + idx,
                          dev->vqs[idx].notifier_is_masked);
+
+
+    for (i = 0; i < svq->vring.num; ++i) {
+        g_autofree VirtQueueElement *elem = svq->ring_id_maps[i];
+        /*
+         * Although the doc says we must unpop in order, it's ok to unpop
+         * everything.
+         */
+        if (elem) {
+            virtqueue_unpop(svq->vq, elem, elem->len);
+        }
+    }
 }
 
 /*
@@ -269,7 +446,7 @@ VhostShadowVirtqueue *vhost_shadow_vq_new(struct vhost_dev *dev, int idx)
     size_t driver_size;
     size_t device_size;
     g_autofree VhostShadowVirtqueue *svq = g_new0(VhostShadowVirtqueue, 1);
-    int r;
+    int r, i;
 
     r = event_notifier_init(&svq->kick_notifier, 0);
     if (r != 0) {
@@ -295,6 +472,11 @@ VhostShadowVirtqueue *vhost_shadow_vq_new(struct vhost_dev *dev, int idx)
     memset(svq->vring.desc, 0, driver_size);
     svq->vring.used = qemu_memalign(qemu_real_host_page_size, device_size);
     memset(svq->vring.used, 0, device_size);
+    for (i = 0; i < num - 1; i++) {
+        svq->vring.desc[i].next = cpu_to_le16(i + 1);
+    }
+
+    svq->ring_id_maps = g_new0(VirtQueueElement *, num);
     event_notifier_set_handler(&svq->call_notifier,
                                vhost_shadow_vq_handle_call);
     return g_steal_pointer(&svq);
@@ -314,6 +496,7 @@ void vhost_shadow_vq_free(VhostShadowVirtqueue *vq)
     event_notifier_cleanup(&vq->kick_notifier);
     event_notifier_set_handler(&vq->call_notifier, NULL);
     event_notifier_cleanup(&vq->call_notifier);
+    g_free(vq->ring_id_maps);
     qemu_vfree(vq->vring.desc);
     qemu_vfree(vq->vring.used);
     g_free(vq);
diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
index 333877ca3b..5b5001a08a 100644
--- a/hw/virtio/vhost.c
+++ b/hw/virtio/vhost.c
@@ -1021,6 +1021,19 @@ int vhost_device_iotlb_miss(struct vhost_dev *dev, uint64_t iova, int write)
 
     trace_vhost_iotlb_miss(dev, 1);
 
+    if (dev->shadow_vqs_enabled) {
+        uaddr = iova;
+        len = 4096;
+        ret = vhost_backend_update_device_iotlb(dev, iova, uaddr, len,
+                                                IOMMU_RW);
+        if (ret) {
+            trace_vhost_iotlb_miss(dev, 2);
+            error_report("Fail to update device iotlb");
+        }
+
+        return ret;
+    }
+
     iotlb = address_space_get_iotlb_entry(dev->vdev->dma_as,
                                           iova, write,
                                           MEMTXATTRS_UNSPECIFIED);
@@ -1222,12 +1235,37 @@ static void vhost_virtqueue_stop(struct vhost_dev *dev,
 
 static int vhost_sw_live_migration_stop(struct vhost_dev *dev)
 {
-    int idx;
+    int idx, r;
 
     dev->shadow_vqs_enabled = false;
 
+    r = dev->vhost_ops->vhost_vring_pause(dev);
+    assert(r == 0);
+    if (vhost_backend_invalidate_device_iotlb(dev, 0, -1ULL)) {
+        error_report("Fail to invalidate device iotlb");
+    }
+
     for (idx = 0; idx < dev->nvqs; ++idx) {
+        struct vhost_virtqueue *vq = dev->vqs + idx;
+        if (vhost_dev_has_iommu(dev) &&
+            dev->vhost_ops->vhost_set_iotlb_callback) {
+            /*
+             * Update used ring information for IOTLB to work correctly,
+             * vhost-kernel code requires for this.
+             */
+            vhost_device_iotlb_miss(dev, vq->used_phys, true);
+        }
+
         vhost_shadow_vq_stop(dev, idx, dev->shadow_vqs[idx]);
+        vhost_virtqueue_start(dev, dev->vdev, &dev->vqs[idx],
+                              dev->vq_index + idx);
+    }
+
+    /* Enable guest's vq vring */
+    r = dev->vhost_ops->vhost_dev_start(dev, true);
+    assert(r == 0);
+
+    for (idx = 0; idx < dev->nvqs; ++idx) {
         vhost_shadow_vq_free(dev->shadow_vqs[idx]);
     }
 
@@ -1236,9 +1274,64 @@ static int vhost_sw_live_migration_stop(struct vhost_dev *dev)
     return 0;
 }
 
+/*
+ * Start shadow virtqueue in a given queue.
+ * In failure case, this function leaves queue working as regular vhost mode.
+ */
+static bool vhost_sw_live_migration_start_vq(struct vhost_dev *dev,
+                                             unsigned idx)
+{
+    struct vhost_vring_addr addr = {
+        .index = idx,
+    };
+    struct vhost_vring_state s = {
+        .index = idx,
+    };
+    int r;
+    bool ok;
+
+    vhost_virtqueue_stop(dev, dev->vdev, &dev->vqs[idx], dev->vq_index + idx);
+    ok = vhost_shadow_vq_start(dev, idx, dev->shadow_vqs[idx]);
+    if (unlikely(!ok)) {
+        return false;
+    }
+
+    /* From this point, vhost_virtqueue_start can reset these changes */
+    vhost_shadow_vq_get_vring_addr(dev->shadow_vqs[idx], &addr);
+    r = dev->vhost_ops->vhost_set_vring_addr(dev, &addr);
+    if (unlikely(r != 0)) {
+        VHOST_OPS_DEBUG("vhost_set_vring_addr for shadow vq failed");
+        goto err;
+    }
+
+    r = dev->vhost_ops->vhost_set_vring_base(dev, &s);
+    if (unlikely(r != 0)) {
+        VHOST_OPS_DEBUG("vhost_set_vring_base for shadow vq failed");
+        goto err;
+    }
+
+    if (vhost_dev_has_iommu(dev) && dev->vhost_ops->vhost_set_iotlb_callback) {
+        /*
+         * Update used ring information for IOTLB to work correctly,
+         * vhost-kernel code requires for this.
+         */
+        r = vhost_device_iotlb_miss(dev, addr.used_user_addr, true);
+        if (unlikely(r != 0)) {
+            /* Debug message already printed */
+            goto err;
+        }
+    }
+
+    return true;
+
+err:
+    vhost_virtqueue_start(dev, dev->vdev, &dev->vqs[idx], dev->vq_index + idx);
+    return false;
+}
+
 static int vhost_sw_live_migration_start(struct vhost_dev *dev)
 {
-    int idx, stop_idx;
+    int r, idx, stop_idx;
 
     dev->shadow_vqs = g_new0(VhostShadowVirtqueue *, dev->nvqs);
     for (idx = 0; idx < dev->nvqs; ++idx) {
@@ -1248,23 +1341,37 @@ static int vhost_sw_live_migration_start(struct vhost_dev *dev)
         }
     }
 
+    r = dev->vhost_ops->vhost_vring_pause(dev);
+    assert(r == 0);
+    if (vhost_backend_invalidate_device_iotlb(dev, 0, -1ULL)) {
+        error_report("Fail to invalidate device iotlb");
+    }
+
+    /* Can be read by vhost_virtqueue_mask, from vm exit */
     dev->shadow_vqs_enabled = true;
     for (idx = 0; idx < dev->nvqs; ++idx) {
-        bool ok = vhost_shadow_vq_start(dev, idx, dev->shadow_vqs[idx]);
+        bool ok = vhost_sw_live_migration_start_vq(dev, idx);
         if (unlikely(!ok)) {
             goto err_start;
         }
     }
 
+    /* Enable shadow vq vring */
+    r = dev->vhost_ops->vhost_dev_start(dev, true);
+    assert(r == 0);
     return 0;
 
 err_start:
     dev->shadow_vqs_enabled = false;
     for (stop_idx = 0; stop_idx < idx; stop_idx++) {
         vhost_shadow_vq_stop(dev, idx, dev->shadow_vqs[stop_idx]);
+        vhost_virtqueue_start(dev, dev->vdev, &dev->vqs[idx],
+                              dev->vq_index + stop_idx);
     }
 
 err_new:
+    /* Enable guest's vring */
+    dev->vhost_ops->vhost_set_vring_enable(dev, true);
     for (idx = 0; idx < dev->nvqs; ++idx) {
         vhost_shadow_vq_free(dev->shadow_vqs[idx]);
     }
@@ -1979,6 +2086,27 @@ void qmp_x_vhost_enable_shadow_vq(const char *name, bool enable, Error **errp)
 
         if (!hdev->started) {
             err_cause = "Device is not started";
+        } else if (!vhost_dev_has_iommu(hdev)) {
+            err_cause = "Does not support iommu";
+        } else if (hdev->acked_features & BIT_ULL(VIRTIO_F_RING_PACKED)) {
+            err_cause = "Is packed";
+        } else if (hdev->acked_features & BIT_ULL(VIRTIO_RING_F_EVENT_IDX)) {
+            err_cause = "Have event idx";
+        } else if (hdev->acked_features &
+                   BIT_ULL(VIRTIO_RING_F_INDIRECT_DESC)) {
+            err_cause = "Supports indirect descriptors";
+        } else if (!hdev->vhost_ops->vhost_vring_pause ||
+                   !hdev->vhost_ops->vhost_dev_start) {
+            err_cause = "Cannot pause device";
+        } else if (hdev->vhost_ops->vhost_get_iova_range) {
+            err_cause = "Device may not support all iova range";
+        } else if (hdev->vhost_ops->vhost_enable_custom_iommu) {
+            err_cause = "Device does not use regular IOMMU";
+        } else if (!virtio_vdev_has_feature(hdev->vdev, VIRTIO_F_VERSION_1)) {
+            err_cause = "Legacy VirtIO device";
+        }
+
+        if (err_cause) {
             goto err;
         }
 
-- 
2.27.0


