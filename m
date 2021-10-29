Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80DC84402F8
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 21:14:11 +0200 (CEST)
Received: from localhost ([::1]:55608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgXKM-0000aB-K7
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 15:14:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mgWrS-0005oX-Ee
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 14:44:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45474)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mgWrP-00031W-E0
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 14:44:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635533054;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f5rA2YSg8fVGdOk1GRK/mLZSUPgPWmKXUwr9s5PeuVc=;
 b=TAYcHr4hcrdAbxD+LapFGvwQytLAcO0yX/k58jBx+kdNhJlgt4eyhhI3bygAs0EK6hmd9W
 lBhVHmLAPyQX60md98YzegCU058R2vASG4+Fhr5ZgBmHYPRjSNo0Q0esRbw5CeZ0qCTA7V
 EHfQ584f2BfCXCXck2IOzMIfbsma4M0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-457-Gk4-UrNFOGaS_fWLgG00Cw-1; Fri, 29 Oct 2021 14:44:13 -0400
X-MC-Unique: Gk4-UrNFOGaS_fWLgG00Cw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CC88C18125D1;
 Fri, 29 Oct 2021 18:44:11 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.75])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8AC0C5F4E1;
 Fri, 29 Oct 2021 18:44:07 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v5 22/26] vhost: Shadow virtqueue buffers forwarding
Date: Fri, 29 Oct 2021 20:35:21 +0200
Message-Id: <20211029183525.1776416-23-eperezma@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eperezma@redhat.com;
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

Initial version of shadow virtqueue that actually forward buffers. There
are no iommu support at the moment, and that will be addressed in future
patches of this series. Since all vhost-vdpa devices uses forced IOMMU,
this means that SVQ is not usable at this point of the series on any
device.

For simplicity it only supports modern devices, that expects vring
in little endian, with split ring and no event idx or indirect
descriptors. Support for them will not be added in this series.

It reuses the VirtQueue code for the device part. The driver part is
based on Linux's virtio_ring driver, but with stripped functionality
and optimizations so it's easier to review. Later commits add simpler
ones.

However to forwarding buffers have some particular pieces: One of the
most unexpected ones is that a guest's buffer can expand through more
than one descriptor in SVQ. While this is handled gracefully by qemu's
emulated virtio devices, it may cause unexpected SVQ queue full. This
patch also solves it checking for this condition at both guest's kicks
and device's calls. The code may be more elegant in the future if SVQ
code runs in its own iocontext.

Note that vhost_vdpa_get_vq_state trust the device to write its status
to used_idx at pause(), finishing all in-flight descriptors. This may
not be enough for complex devices, but other development like usage of
inflight_fd on top of this solution may extend the usage in the future.

In particular, SVQ trust it to recover guest's virtqueue at start, and
to mark as used the latest descriptors used by the device in the
meantime.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 qapi/net.json                      |   5 +-
 hw/virtio/vhost-shadow-virtqueue.c | 400 +++++++++++++++++++++++++++--
 hw/virtio/vhost-vdpa.c             | 144 ++++++++++-
 3 files changed, 521 insertions(+), 28 deletions(-)

diff --git a/qapi/net.json b/qapi/net.json
index fca2f6ebca..1c6d3b2179 100644
--- a/qapi/net.json
+++ b/qapi/net.json
@@ -84,12 +84,9 @@
 #
 # Use vhost shadow virtqueue.
 #
-# SVQ can just forward notifications between the device and the guest at this
-# moment. This will expand in future changes.
-#
 # @name: the device name of the VirtIO device
 #
-# @set: true to use the alternate shadow VQ notifications
+# @set: true to use the alternate shadow VQ
 #
 # Since: 6.2
 #
diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
index cb9ffcb015..ad1b2342be 100644
--- a/hw/virtio/vhost-shadow-virtqueue.c
+++ b/hw/virtio/vhost-shadow-virtqueue.c
@@ -9,6 +9,9 @@
 
 #include "qemu/osdep.h"
 #include "hw/virtio/vhost-shadow-virtqueue.h"
+#include "hw/virtio/vhost.h"
+#include "hw/virtio/virtio-access.h"
+
 #include "standard-headers/linux/vhost_types.h"
 
 #include "qemu/error-report.h"
@@ -45,6 +48,27 @@ typedef struct VhostShadowVirtqueue {
 
     /* Virtio device */
     VirtIODevice *vdev;
+
+    /* Map for returning guest's descriptors */
+    VirtQueueElement **ring_id_maps;
+
+    /* Next VirtQueue element that guest made available */
+    VirtQueueElement *next_guest_avail_elem;
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
+    uint16_t last_used_idx;
+
+    /* Cache for the exposed notification flag */
+    bool notification;
 } VhostShadowVirtqueue;
 
 /**
@@ -56,25 +80,174 @@ const EventNotifier *vhost_svq_get_dev_kick_notifier(
     return &svq->hdev_kick;
 }
 
-/* If the device is using some of these, SVQ cannot communicate */
+/**
+ * VirtIO transport device feature acknowledge
+ *
+ * @dev_features  The device features. If success, the acknowledged features.
+ *
+ * Returns true if SVQ can go with a subset of these, false otherwise.
+ */
 bool vhost_svq_valid_device_features(uint64_t *dev_features)
 {
-    return true;
+    uint64_t b;
+    bool r = true;
+
+    for (b = VIRTIO_TRANSPORT_F_START; b <= VIRTIO_TRANSPORT_F_END; ++b) {
+        switch (b) {
+        case VIRTIO_F_NOTIFY_ON_EMPTY:
+        case VIRTIO_F_ANY_LAYOUT:
+            continue;
+
+        case VIRTIO_F_ACCESS_PLATFORM:
+            /* SVQ does not know how to translate addresses */
+            if (*dev_features & BIT_ULL(b)) {
+                clear_bit(b, dev_features);
+                r = false;
+            }
+            break;
+
+        case VIRTIO_F_VERSION_1:
+            /* SVQ trust that guest vring is little endian */
+            if (!(*dev_features & BIT_ULL(b))) {
+                set_bit(b, dev_features);
+                r = false;
+            }
+            continue;
+
+        default:
+            if (*dev_features & BIT_ULL(b)) {
+                clear_bit(b, dev_features);
+            }
+        }
+    }
+
+    return r;
 }
 
-/* If the guest is using some of these, SVQ cannot communicate */
+/**
+ * Check of guest's acknowledge features.
+ *
+ * @guest_features  The guest's acknowledged features
+ *
+ * Returns true if SVQ can handle them, false otherwise.
+ */
 bool vhost_svq_valid_guest_features(uint64_t *guest_features)
 {
-    return true;
+    static const uint64_t transport = MAKE_64BIT_MASK(VIRTIO_TRANSPORT_F_START,
+                            VIRTIO_TRANSPORT_F_END - VIRTIO_TRANSPORT_F_START);
+
+    /* These transport features are handled by VirtQueue */
+    static const uint64_t valid = (BIT_ULL(VIRTIO_RING_F_INDIRECT_DESC) |
+                                   BIT_ULL(VIRTIO_F_VERSION_1));
+
+    /* We are only interested in transport-related feature bits */
+    uint64_t guest_transport_features = (*guest_features) & transport;
+
+    *guest_features &= (valid | ~transport);
+    return !(guest_transport_features & (transport ^ valid));
 }
 
-/* Forward guest notifications */
-static void vhost_handle_guest_kick(EventNotifier *n)
+/**
+ * Number of descriptors that SVQ can make available from the guest.
+ *
+ * @svq   The svq
+ */
+static uint16_t vhost_svq_available_slots(const VhostShadowVirtqueue *svq)
 {
-    VhostShadowVirtqueue *svq = container_of(n, VhostShadowVirtqueue,
-                                             svq_kick);
+    return svq->vring.num - (svq->avail_idx_shadow - svq->shadow_used_idx);
+}
 
-    if (unlikely(!event_notifier_test_and_clear(n))) {
+static void vhost_svq_set_notification(VhostShadowVirtqueue *svq, bool enable)
+{
+    uint16_t notification_flag;
+
+    if (svq->notification == enable) {
+        return;
+    }
+
+    notification_flag = cpu_to_le16(VRING_AVAIL_F_NO_INTERRUPT);
+
+    svq->notification = enable;
+    if (enable) {
+        svq->vring.avail->flags &= ~notification_flag;
+    } else {
+        svq->vring.avail->flags |= notification_flag;
+    }
+}
+
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
+static unsigned vhost_svq_add_split(VhostShadowVirtqueue *svq,
+                                    VirtQueueElement *elem)
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
+    /* Update avail index after the descriptor is wrote */
+    smp_wmb();
+    avail->idx = cpu_to_le16(svq->avail_idx_shadow);
+
+    return head;
+
+}
+
+static void vhost_svq_add(VhostShadowVirtqueue *svq, VirtQueueElement *elem)
+{
+    unsigned qemu_head = vhost_svq_add_split(svq, elem);
+
+    svq->ring_id_maps[qemu_head] = elem;
+}
+
+static void vhost_svq_kick(VhostShadowVirtqueue *svq)
+{
+    /* We need to expose available array entries before checking used flags */
+    smp_mb();
+    if (svq->vring.used->flags & VRING_USED_F_NO_NOTIFY) {
         return;
     }
 
@@ -86,25 +259,188 @@ static void vhost_handle_guest_kick(EventNotifier *n)
     }
 }
 
-/*
- * Set the device's memory region notifier. addr = NULL clear it.
+/**
+ * Forward available buffers.
+ *
+ * @svq Shadow VirtQueue
+ *
+ * Note that this function does not guarantee that all guest's available
+ * buffers are available to the device in SVQ avail ring. The guest may have
+ * exposed a GPA / GIOVA congiuous buffer, but it may not be contiguous in qemu
+ * vaddr.
+ *
+ * If that happens, guest's kick notifications will be disabled until device
+ * makes some buffers used.
  */
-void vhost_svq_set_host_mr_notifier(VhostShadowVirtqueue *svq, void *addr)
+static void vhost_handle_guest_kick(VhostShadowVirtqueue *svq)
 {
-    svq->host_notifier_mr = addr;
+    /* Clear event notifier */
+    event_notifier_test_and_clear(&svq->svq_kick);
+
+    /* Make available as many buffers as possible */
+    do {
+        if (virtio_queue_get_notification(svq->vq)) {
+            virtio_queue_set_notification(svq->vq, false);
+        }
+
+        while (true) {
+            VirtQueueElement *elem;
+
+            if (svq->next_guest_avail_elem) {
+                elem = g_steal_pointer(&svq->next_guest_avail_elem);
+            } else {
+                elem = virtqueue_pop(svq->vq, sizeof(*elem));
+            }
+
+            if (!elem) {
+                break;
+            }
+
+            if (elem->out_num + elem->in_num >
+                vhost_svq_available_slots(svq)) {
+                /*
+                 * This condition is possible since a contiguous buffer in GPA
+                 * does not imply a contiguous buffer in qemu's VA
+                 * scatter-gather segments. If that happen, the buffer exposed
+                 * to the device needs to be a chain of descriptors at this
+                 * moment.
+                 *
+                 * SVQ cannot hold more available buffers if we are here:
+                 * queue the current guest descriptor and ignore further kicks
+                 * until some elements are used.
+                 */
+                svq->next_guest_avail_elem = elem;
+                return;
+            }
+
+            vhost_svq_add(svq, elem);
+            vhost_svq_kick(svq);
+        }
+
+        virtio_queue_set_notification(svq->vq, true);
+    } while (!virtio_queue_empty(svq->vq));
+}
+
+/**
+ * Handle guest's kick.
+ *
+ * @n guest kick event notifier, the one that guest set to notify svq.
+ */
+static void vhost_handle_guest_kick_notifier(EventNotifier *n)
+{
+    VhostShadowVirtqueue *svq = container_of(n, VhostShadowVirtqueue,
+                                             svq_kick);
+    vhost_handle_guest_kick(svq);
+}
+
+static bool vhost_svq_more_used(VhostShadowVirtqueue *svq)
+{
+    if (svq->last_used_idx != svq->shadow_used_idx) {
+        return true;
+    }
+
+    svq->shadow_used_idx = cpu_to_le16(svq->vring.used->idx);
+
+    return svq->last_used_idx != svq->shadow_used_idx;
+}
+
+static VirtQueueElement *vhost_svq_get_buf(VhostShadowVirtqueue *svq)
+{
+    vring_desc_t *descs = svq->vring.desc;
+    const vring_used_t *used = svq->vring.used;
+    vring_used_elem_t used_elem;
+    uint16_t last_used;
+
+    if (!vhost_svq_more_used(svq)) {
+        return NULL;
+    }
+
+    /* Only get used array entries after they have been exposed by dev */
+    smp_rmb();
+    last_used = svq->last_used_idx & (svq->vring.num - 1);
+    used_elem.id = le32_to_cpu(used->ring[last_used].id);
+    used_elem.len = le32_to_cpu(used->ring[last_used].len);
+
+    svq->last_used_idx++;
+    if (unlikely(used_elem.id >= svq->vring.num)) {
+        error_report("Device %s says index %u is used", svq->vdev->name,
+                     used_elem.id);
+        return NULL;
+    }
+
+    if (unlikely(!svq->ring_id_maps[used_elem.id])) {
+        error_report(
+            "Device %s says index %u is used, but it was not available",
+            svq->vdev->name, used_elem.id);
+        return NULL;
+    }
+
+    descs[used_elem.id].next = svq->free_head;
+    svq->free_head = used_elem.id;
+
+    svq->ring_id_maps[used_elem.id]->len = used_elem.len;
+    return g_steal_pointer(&svq->ring_id_maps[used_elem.id]);
 }
 
-/* Forward vhost notifications */
+static void vhost_svq_flush(VhostShadowVirtqueue *svq,
+                            bool check_for_avail_queue)
+{
+    VirtQueue *vq = svq->vq;
+
+    /* Make as many buffers as possible used. */
+    do {
+        unsigned i = 0;
+
+        vhost_svq_set_notification(svq, false);
+        while (true) {
+            g_autofree VirtQueueElement *elem = vhost_svq_get_buf(svq);
+            if (!elem) {
+                break;
+            }
+
+            if (unlikely(i >= svq->vring.num)) {
+                virtio_error(svq->vdev,
+                         "More than %u used buffers obtained in a %u size SVQ",
+                         i, svq->vring.num);
+                virtqueue_fill(vq, elem, elem->len, i);
+                virtqueue_flush(vq, i);
+                i = 0;
+            }
+            virtqueue_fill(vq, elem, elem->len, i++);
+        }
+
+        virtqueue_flush(vq, i);
+        event_notifier_set(&svq->svq_call);
+
+        if (check_for_avail_queue && svq->next_guest_avail_elem) {
+            /*
+             * Avail ring was full when vhost_svq_flush was called, so it's a
+             * good moment to make more descriptors available if possible
+             */
+            vhost_handle_guest_kick(svq);
+        }
+
+        vhost_svq_set_notification(svq, true);
+    } while (vhost_svq_more_used(svq));
+}
+
+/**
+ * Forward used buffers.
+ *
+ * @n hdev call event notifier, the one that device set to notify svq.
+ *
+ * Note that we are not making any buffers available in the loop, there is no
+ * way that it runs more than virtqueue size times.
+ */
 static void vhost_svq_handle_call(EventNotifier *n)
 {
     VhostShadowVirtqueue *svq = container_of(n, VhostShadowVirtqueue,
                                              hdev_call);
 
-    if (unlikely(!event_notifier_test_and_clear(n))) {
-        return;
-    }
+    /* Clear event notifier */
+    event_notifier_test_and_clear(n);
 
-    event_notifier_set(&svq->svq_call);
+    vhost_svq_flush(svq, true);
 }
 
 /*
@@ -132,6 +468,14 @@ void vhost_svq_set_guest_call_notifier(VhostShadowVirtqueue *svq, int call_fd)
     event_notifier_init_fd(&svq->svq_call, call_fd);
 }
 
+/*
+ * Set the device's memory region notifier. addr = NULL clear it.
+ */
+void vhost_svq_set_host_mr_notifier(VhostShadowVirtqueue *svq, void *addr)
+{
+    svq->host_notifier_mr = addr;
+}
+
 /*
  * Get the shadow vq vring address.
  * @svq Shadow virtqueue
@@ -185,7 +529,8 @@ static void vhost_svq_set_svq_kick_fd_internal(VhostShadowVirtqueue *svq,
      * need to explicitely check for them.
      */
     event_notifier_init_fd(&svq->svq_kick, svq_kick_fd);
-    event_notifier_set_handler(&svq->svq_kick, vhost_handle_guest_kick);
+    event_notifier_set_handler(&svq->svq_kick,
+                               vhost_handle_guest_kick_notifier);
 
     /*
      * !check_old means that we are starting SVQ, taking the descriptor from
@@ -233,7 +578,16 @@ void vhost_svq_start(struct vhost_dev *dev, unsigned idx,
 void vhost_svq_stop(struct vhost_dev *dev, unsigned idx,
                     VhostShadowVirtqueue *svq)
 {
+    unsigned i;
     event_notifier_set_handler(&svq->svq_kick, NULL);
+    vhost_svq_flush(svq, false);
+
+    for (i = 0; i < svq->vring.num; ++i) {
+        g_autofree VirtQueueElement *elem = svq->ring_id_maps[i];
+        if (elem) {
+            virtqueue_detach_element(svq->vq, elem, elem->len);
+        }
+    }
 }
 
 /*
@@ -248,7 +602,7 @@ VhostShadowVirtqueue *vhost_svq_new(struct vhost_dev *dev, int idx)
     size_t driver_size;
     size_t device_size;
     g_autofree VhostShadowVirtqueue *svq = g_new0(VhostShadowVirtqueue, 1);
-    int r;
+    int r, i;
 
     r = event_notifier_init(&svq->hdev_kick, 0);
     if (r != 0) {
@@ -274,6 +628,11 @@ VhostShadowVirtqueue *vhost_svq_new(struct vhost_dev *dev, int idx)
     memset(svq->vring.desc, 0, driver_size);
     svq->vring.used = qemu_memalign(qemu_real_host_page_size, device_size);
     memset(svq->vring.used, 0, device_size);
+    for (i = 0; i < num - 1; i++) {
+        svq->vring.desc[i].next = cpu_to_le16(i + 1);
+    }
+
+    svq->ring_id_maps = g_new0(VirtQueueElement *, num);
     event_notifier_set_handler(&svq->hdev_call, vhost_svq_handle_call);
     return g_steal_pointer(&svq);
 
@@ -292,6 +651,7 @@ void vhost_svq_free(VhostShadowVirtqueue *vq)
     event_notifier_cleanup(&vq->hdev_kick);
     event_notifier_set_handler(&vq->hdev_call, NULL);
     event_notifier_cleanup(&vq->hdev_call);
+    g_free(vq->ring_id_maps);
     qemu_vfree(vq->vring.desc);
     qemu_vfree(vq->vring.used);
     g_free(vq);
diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index fc8396ba8a..e1c55e43e7 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -19,6 +19,7 @@
 #include "hw/virtio/virtio-net.h"
 #include "hw/virtio/vhost-shadow-virtqueue.h"
 #include "hw/virtio/vhost-vdpa.h"
+#include "hw/virtio/vhost-shadow-virtqueue.h"
 #include "exec/address-spaces.h"
 #include "qemu/main-loop.h"
 #include "cpu.h"
@@ -821,6 +822,19 @@ static bool  vhost_vdpa_force_iommu(struct vhost_dev *dev)
     return true;
 }
 
+static int vhost_vdpa_vring_pause(struct vhost_dev *dev)
+{
+    int r;
+    uint8_t status;
+
+    vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_DEVICE_STOPPED);
+    do {
+        r = vhost_vdpa_call(dev, VHOST_VDPA_GET_STATUS, &status);
+    } while (r == 0 && !(status & VIRTIO_CONFIG_S_DEVICE_STOPPED));
+
+    return 0;
+}
+
 /*
  * Start or stop a shadow virtqueue in a vdpa device
  *
@@ -844,7 +858,14 @@ static bool vhost_vdpa_svq_start_vq(struct vhost_dev *dev, unsigned idx,
         .index = vq_index,
     };
     struct vhost_vring_file vhost_call_file = {
-        .index = idx + dev->vq_index,
+        .index = vq_index,
+    };
+    struct vhost_vring_addr addr = {
+        .index = vq_index,
+    };
+    struct vhost_vring_state num = {
+        .index = vq_index,
+        .num = virtio_queue_get_num(dev->vdev, vq_index),
     };
     int r;
 
@@ -852,6 +873,7 @@ static bool vhost_vdpa_svq_start_vq(struct vhost_dev *dev, unsigned idx,
         const EventNotifier *vhost_kick = vhost_svq_get_dev_kick_notifier(svq);
         const EventNotifier *vhost_call = vhost_svq_get_svq_call_notifier(svq);
 
+        vhost_svq_get_vring_addr(svq, &addr);
         if (n->addr) {
             r = virtio_queue_set_host_notifier_mr(dev->vdev, idx, &n->mr,
                                                   false);
@@ -870,8 +892,20 @@ static bool vhost_vdpa_svq_start_vq(struct vhost_dev *dev, unsigned idx,
         vhost_kick_file.fd = event_notifier_get_fd(vhost_kick);
         vhost_call_file.fd = event_notifier_get_fd(vhost_call);
     } else {
+        struct vhost_vring_state state = {
+            .index = vq_index,
+        };
+
         vhost_svq_stop(dev, idx, svq);
 
+        state.num = virtio_queue_get_last_avail_idx(dev->vdev, idx);
+        r = vhost_vdpa_set_vring_base(dev, &state);
+        if (unlikely(r)) {
+            error_setg_errno(errp, -r, "vhost_set_vring_base failed");
+            return false;
+        }
+
+        vhost_vdpa_vq_get_addr(dev, &addr, &dev->vqs[idx]);
         if (n->addr) {
             r = virtio_queue_set_host_notifier_mr(dev->vdev, idx, &n->mr,
                                                   true);
@@ -885,6 +919,17 @@ static bool vhost_vdpa_svq_start_vq(struct vhost_dev *dev, unsigned idx,
         vhost_call_file.fd = v->call_fd[idx];
     }
 
+    r = vhost_vdpa_set_vring_addr(dev, &addr);
+    if (unlikely(r)) {
+        error_setg_errno(errp, -r, "vhost_set_vring_addr failed");
+        return false;
+    }
+    r = vhost_vdpa_set_vring_num(dev, &num);
+    if (unlikely(r)) {
+        error_setg_errno(errp, -r, "vhost_set_vring_num failed");
+        return false;
+    }
+
     r = vhost_vdpa_set_vring_dev_kick(dev, &vhost_kick_file);
     if (unlikely(r)) {
         error_setg_errno(errp, -r, "vhost_vdpa_set_vring_kick failed");
@@ -899,6 +944,50 @@ static bool vhost_vdpa_svq_start_vq(struct vhost_dev *dev, unsigned idx,
     return true;
 }
 
+static void vhost_vdpa_get_vq_state(struct vhost_dev *dev, unsigned idx)
+{
+    struct VirtIODevice *vdev = dev->vdev;
+
+    virtio_queue_restore_last_avail_idx(vdev, idx);
+    virtio_queue_invalidate_signalled_used(vdev, idx);
+    virtio_queue_update_used_idx(vdev, idx);
+}
+
+/**
+ * Validate device and guest features against SVQ capabilities
+ *
+ * @hdev  The vhost device @errp  The error
+ *
+ * @hdev          The hdev
+ * @svq_features  The subset of device features that svq supports.
+ * @errp          The errp
+ */
+static bool vhost_vdpa_valid_features(struct vhost_dev *hdev,
+                                      uint64_t *svq_features,
+                                      Error **errp)
+{
+    uint64_t acked_features = hdev->acked_features;
+    bool ok;
+
+    ok = vhost_svq_valid_device_features(svq_features);
+    if (unlikely(!ok)) {
+        error_setg(errp,
+            "Unexpected device feature flags, offered: %"PRIx64", ok: %"PRIx64,
+            hdev->features, *svq_features);
+        return false;
+    }
+
+    ok = vhost_svq_valid_guest_features(&acked_features);
+    if (unlikely(!ok)) {
+        error_setg(errp,
+            "Invalid guest acked feature flag, acked:%"PRIx64", ok: %"PRIx64,
+            hdev->acked_features, acked_features);
+        return false;
+    }
+
+    return true;
+}
+
 /**
  * Enable or disable shadow virtqueue in a vhost vdpa device.
  *
@@ -913,6 +1002,9 @@ void vhost_vdpa_enable_svq(struct vhost_vdpa *v, bool enable, Error **errp)
 {
     struct vhost_dev *hdev = v->dev;
     unsigned n;
+    int r;
+    uint64_t svq_features = hdev->features | BIT_ULL(VIRTIO_F_IOMMU_PLATFORM) |
+                            BIT_ULL(VIRTIO_F_QUEUE_STATE);
     ERRP_GUARD();
 
     if (enable == v->shadow_vqs_enabled) {
@@ -920,20 +1012,43 @@ void vhost_vdpa_enable_svq(struct vhost_vdpa *v, bool enable, Error **errp)
     }
 
     if (enable) {
+        bool ok = vhost_vdpa_valid_features(hdev, &svq_features, errp);
+        if (unlikely(!ok)) {
+            return;
+        }
+
         /* Allocate resources */
         assert(v->shadow_vqs->len == 0);
         for (n = 0; n < hdev->nvqs; ++n) {
             VhostShadowVirtqueue *svq = vhost_svq_new(hdev, n);
-            bool ok;
-
             if (unlikely(!svq)) {
                 error_setg(errp, "Cannot create svq");
                 enable = false;
                 goto err_svq_new;
             }
             g_ptr_array_add(v->shadow_vqs, svq);
+        }
+    }
+
+    r = vhost_vdpa_vring_pause(hdev);
+    if (unlikely(r)) {
+        error_setg_errno(errp, -r, "Cannot pause device");
+        enable = !enable;
+        goto err_pause;
+    }
+
+    for (n = 0; n < v->shadow_vqs->len; ++n) {
+        vhost_vdpa_get_vq_state(hdev, hdev->vq_index + n);
+    }
+
+    /* Reset device so it can be configured */
+    vhost_vdpa_dev_start(hdev, false);
+
+    if (enable) {
+        int r;
 
-            ok = vhost_vdpa_svq_start_vq(hdev, n, true, errp);
+        for (n = 0; n < v->shadow_vqs->len; ++n) {
+            bool ok = vhost_vdpa_svq_start_vq(hdev, n, true, errp);
             if (unlikely(!ok)) {
                 /* Free still not started svqs, and go with disable path */
                 g_ptr_array_set_size(v->shadow_vqs, n);
@@ -941,18 +1056,39 @@ void vhost_vdpa_enable_svq(struct vhost_vdpa *v, bool enable, Error **errp)
                 break;
             }
         }
+
+        /* Need to ack features to set state in vp_vdpa devices */
+        r = vhost_vdpa_set_features(hdev, svq_features);
+        if (unlikely(r && !(*errp))) {
+            error_setg_errno(errp, -r, "Fail to set guest features");
+
+            /* Go through disable SVQ path */
+            enable = false;
+        }
     }
 
     v->shadow_vqs_enabled = enable;
 
     if (!enable) {
+        r = vhost_vdpa_set_features(hdev, hdev->acked_features |
+                                          BIT_ULL(VIRTIO_F_QUEUE_STATE) |
+                                          BIT_ULL(VIRTIO_F_IOMMU_PLATFORM));
+        if (unlikely(r && (!(*errp)))) {
+            error_setg_errno(errp, -r, "Fail to set guest features");
+        }
+
         /* Disable all queues or clean up failed start */
         for (n = 0; n < v->shadow_vqs->len; ++n) {
             vhost_vdpa_svq_start_vq(hdev, n, false, *errp ? NULL : errp);
         }
+    }
 
+    r = vhost_vdpa_dev_start(hdev, true);
+    if (unlikely(r && !(*errp))) {
+        error_setg_errno(errp, -r, "Fail to start device");
     }
 
+err_pause:
 err_svq_new:
     if (!enable) {
         /* Resources cleanup */
-- 
2.27.0


