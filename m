Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0B594D94BA
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 07:42:17 +0100 (CET)
Received: from localhost ([::1]:34346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nU0sr-0004lb-1K
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 02:42:17 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nU0SV-00013M-B7
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 02:15:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40787)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nU0SS-0004Nh-FG
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 02:15:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647324899;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wtfnzU8Qmpws/RP6vzq9R1nYkatqCyhdEzdvA1T7HB8=;
 b=YJsU8GWMxaDcy9FZXaGcqHDOiQRAegqI3scb67sgQY4xVVxXv6B6T70SuQA4JxAbsA+RdC
 PrddqScspCRsW4dPKF/C7u/lplgiVywusToVarOu+msRrV4demWNxn9JMYQ3GXDrI+1Lp2
 ckM4QEWE6rUCKUrn62sjjFascQDqiL4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-341-lpSCQV99O9--IwzmTDyobQ-1; Tue, 15 Mar 2022 02:14:56 -0400
X-MC-Unique: lpSCQV99O9--IwzmTDyobQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8D098800960;
 Tue, 15 Mar 2022 06:14:56 +0000 (UTC)
Received: from localhost.localdomain (ovpn-14-38.pek2.redhat.com [10.72.14.38])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4E73640C128B;
 Tue, 15 Mar 2022 06:14:54 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PULL V3 08/15] vhost: Shadow virtqueue buffers forwarding
Date: Tue, 15 Mar 2022 14:14:13 +0800
Message-Id: <20220315061420.31910-9-jasowang@redhat.com>
In-Reply-To: <20220315061420.31910-1-jasowang@redhat.com>
References: <20220315061420.31910-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
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
Cc: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
 Jason Wang <jasowang@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Eugenio Pérez <eperezma@redhat.com>

Initial version of shadow virtqueue that actually forward buffers. There
is no iommu support at the moment, and that will be addressed in future
patches of this series. Since all vhost-vdpa devices use forced IOMMU,
this means that SVQ is not usable at this point of the series on any
device.

For simplicity it only supports modern devices, that expects vring
in little endian, with split ring and no event idx or indirect
descriptors. Support for them will not be added in this series.

It reuses the VirtQueue code for the device part. The driver part is
based on Linux's virtio_ring driver, but with stripped functionality
and optimizations so it's easier to review.

However, forwarding buffers have some particular pieces: One of the most
unexpected ones is that a guest's buffer can expand through more than
one descriptor in SVQ. While this is handled gracefully by qemu's
emulated virtio devices, it may cause unexpected SVQ queue full. This
patch also solves it by checking for this condition at both guest's
kicks and device's calls. The code may be more elegant in the future if
SVQ code runs in its own iocontext.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 hw/virtio/vhost-shadow-virtqueue.c | 352 ++++++++++++++++++++++++++++++++++++-
 hw/virtio/vhost-shadow-virtqueue.h |  26 +++
 hw/virtio/vhost-vdpa.c             | 155 +++++++++++++++-
 3 files changed, 522 insertions(+), 11 deletions(-)

diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
index 573ac0d..ece50b8 100644
--- a/hw/virtio/vhost-shadow-virtqueue.c
+++ b/hw/virtio/vhost-shadow-virtqueue.c
@@ -13,6 +13,8 @@
 #include "qemu/error-report.h"
 #include "qapi/error.h"
 #include "qemu/main-loop.h"
+#include "qemu/log.h"
+#include "qemu/memalign.h"
 #include "linux-headers/linux/vhost.h"
 
 /**
@@ -59,28 +61,307 @@ bool vhost_svq_valid_features(uint64_t features, Error **errp)
 }
 
 /**
- * Forward guest notifications.
+ * Number of descriptors that the SVQ can make available from the guest.
+ *
+ * @svq: The svq
+ */
+static uint16_t vhost_svq_available_slots(const VhostShadowVirtqueue *svq)
+{
+    return svq->vring.num - (svq->shadow_avail_idx - svq->shadow_used_idx);
+}
+
+static void vhost_vring_write_descs(VhostShadowVirtqueue *svq,
+                                    const struct iovec *iovec, size_t num,
+                                    bool more_descs, bool write)
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
+        descs[i].addr = cpu_to_le64((hwaddr)(intptr_t)iovec[n].iov_base);
+        descs[i].len = cpu_to_le32(iovec[n].iov_len);
+
+        last = i;
+        i = cpu_to_le16(descs[i].next);
+    }
+
+    svq->free_head = le16_to_cpu(descs[last].next);
+}
+
+static bool vhost_svq_add_split(VhostShadowVirtqueue *svq,
+                                VirtQueueElement *elem, unsigned *head)
+{
+    unsigned avail_idx;
+    vring_avail_t *avail = svq->vring.avail;
+
+    *head = svq->free_head;
+
+    /* We need some descriptors here */
+    if (unlikely(!elem->out_num && !elem->in_num)) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "Guest provided element with no descriptors");
+        return false;
+    }
+
+    vhost_vring_write_descs(svq, elem->out_sg, elem->out_num, elem->in_num > 0,
+                            false);
+    vhost_vring_write_descs(svq, elem->in_sg, elem->in_num, false, true);
+
+    /*
+     * Put the entry in the available array (but don't update avail->idx until
+     * they do sync).
+     */
+    avail_idx = svq->shadow_avail_idx & (svq->vring.num - 1);
+    avail->ring[avail_idx] = cpu_to_le16(*head);
+    svq->shadow_avail_idx++;
+
+    /* Update the avail index after write the descriptor */
+    smp_wmb();
+    avail->idx = cpu_to_le16(svq->shadow_avail_idx);
+
+    return true;
+}
+
+static bool vhost_svq_add(VhostShadowVirtqueue *svq, VirtQueueElement *elem)
+{
+    unsigned qemu_head;
+    bool ok = vhost_svq_add_split(svq, elem, &qemu_head);
+    if (unlikely(!ok)) {
+        return false;
+    }
+
+    svq->ring_id_maps[qemu_head] = elem;
+    return true;
+}
+
+static void vhost_svq_kick(VhostShadowVirtqueue *svq)
+{
+    /*
+     * We need to expose the available array entries before checking the used
+     * flags
+     */
+    smp_mb();
+    if (svq->vring.used->flags & VRING_USED_F_NO_NOTIFY) {
+        return;
+    }
+
+    event_notifier_set(&svq->hdev_kick);
+}
+
+/**
+ * Forward available buffers.
+ *
+ * @svq: Shadow VirtQueue
+ *
+ * Note that this function does not guarantee that all guest's available
+ * buffers are available to the device in SVQ avail ring. The guest may have
+ * exposed a GPA / GIOVA contiguous buffer, but it may not be contiguous in
+ * qemu vaddr.
+ *
+ * If that happens, guest's kick notifications will be disabled until the
+ * device uses some buffers.
+ */
+static void vhost_handle_guest_kick(VhostShadowVirtqueue *svq)
+{
+    /* Clear event notifier */
+    event_notifier_test_and_clear(&svq->svq_kick);
+
+    /* Forward to the device as many available buffers as possible */
+    do {
+        virtio_queue_set_notification(svq->vq, false);
+
+        while (true) {
+            VirtQueueElement *elem;
+            bool ok;
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
+            if (elem->out_num + elem->in_num > vhost_svq_available_slots(svq)) {
+                /*
+                 * This condition is possible since a contiguous buffer in GPA
+                 * does not imply a contiguous buffer in qemu's VA
+                 * scatter-gather segments. If that happens, the buffer exposed
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
+            ok = vhost_svq_add(svq, elem);
+            if (unlikely(!ok)) {
+                /* VQ is broken, just return and ignore any other kicks */
+                return;
+            }
+            vhost_svq_kick(svq);
+        }
+
+        virtio_queue_set_notification(svq->vq, true);
+    } while (!virtio_queue_empty(svq->vq));
+}
+
+/**
+ * Handle guest's kick.
  *
  * @n: guest kick event notifier, the one that guest set to notify svq.
  */
-static void vhost_handle_guest_kick(EventNotifier *n)
+static void vhost_handle_guest_kick_notifier(EventNotifier *n)
 {
     VhostShadowVirtqueue *svq = container_of(n, VhostShadowVirtqueue, svq_kick);
     event_notifier_test_and_clear(n);
-    event_notifier_set(&svq->hdev_kick);
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
 }
 
 /**
- * Forward vhost notifications
+ * Enable vhost device calls after disable them.
+ *
+ * @svq: The svq
+ *
+ * It returns false if there are pending used buffers from the vhost device,
+ * avoiding the possible races between SVQ checking for more work and enabling
+ * callbacks. True if SVQ used vring has no more pending buffers.
+ */
+static bool vhost_svq_enable_notification(VhostShadowVirtqueue *svq)
+{
+    svq->vring.avail->flags &= ~cpu_to_le16(VRING_AVAIL_F_NO_INTERRUPT);
+    /* Make sure the flag is written before the read of used_idx */
+    smp_mb();
+    return !vhost_svq_more_used(svq);
+}
+
+static void vhost_svq_disable_notification(VhostShadowVirtqueue *svq)
+{
+    svq->vring.avail->flags |= cpu_to_le16(VRING_AVAIL_F_NO_INTERRUPT);
+}
+
+static VirtQueueElement *vhost_svq_get_buf(VhostShadowVirtqueue *svq,
+                                           uint32_t *len)
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
+        qemu_log_mask(LOG_GUEST_ERROR, "Device %s says index %u is used",
+                      svq->vdev->name, used_elem.id);
+        return NULL;
+    }
+
+    if (unlikely(!svq->ring_id_maps[used_elem.id])) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+            "Device %s says index %u is used, but it was not available",
+            svq->vdev->name, used_elem.id);
+        return NULL;
+    }
+
+    descs[used_elem.id].next = svq->free_head;
+    svq->free_head = used_elem.id;
+
+    *len = used_elem.len;
+    return g_steal_pointer(&svq->ring_id_maps[used_elem.id]);
+}
+
+static void vhost_svq_flush(VhostShadowVirtqueue *svq,
+                            bool check_for_avail_queue)
+{
+    VirtQueue *vq = svq->vq;
+
+    /* Forward as many used buffers as possible. */
+    do {
+        unsigned i = 0;
+
+        vhost_svq_disable_notification(svq);
+        while (true) {
+            uint32_t len;
+            g_autofree VirtQueueElement *elem = vhost_svq_get_buf(svq, &len);
+            if (!elem) {
+                break;
+            }
+
+            if (unlikely(i >= svq->vring.num)) {
+                qemu_log_mask(LOG_GUEST_ERROR,
+                         "More than %u used buffers obtained in a %u size SVQ",
+                         i, svq->vring.num);
+                virtqueue_fill(vq, elem, len, i);
+                virtqueue_flush(vq, i);
+                return;
+            }
+            virtqueue_fill(vq, elem, len, i++);
+        }
+
+        virtqueue_flush(vq, i);
+        event_notifier_set(&svq->svq_call);
+
+        if (check_for_avail_queue && svq->next_guest_avail_elem) {
+            /*
+             * Avail ring was full when vhost_svq_flush was called, so it's a
+             * good moment to make more descriptors available if possible.
+             */
+            vhost_handle_guest_kick(svq);
+        }
+    } while (!vhost_svq_enable_notification(svq));
+}
+
+/**
+ * Forward used buffers.
  *
  * @n: hdev call event notifier, the one that device set to notify svq.
+ *
+ * Note that we are not making any buffers available in the loop, there is no
+ * way that it runs more than virtqueue size times.
  */
 static void vhost_svq_handle_call(EventNotifier *n)
 {
     VhostShadowVirtqueue *svq = container_of(n, VhostShadowVirtqueue,
                                              hdev_call);
     event_notifier_test_and_clear(n);
-    event_notifier_set(&svq->svq_call);
+    vhost_svq_flush(svq, true);
 }
 
 /**
@@ -161,7 +442,41 @@ void vhost_svq_set_svq_kick_fd(VhostShadowVirtqueue *svq, int svq_kick_fd)
     if (poll_start) {
         event_notifier_init_fd(svq_kick, svq_kick_fd);
         event_notifier_set(svq_kick);
-        event_notifier_set_handler(svq_kick, vhost_handle_guest_kick);
+        event_notifier_set_handler(svq_kick, vhost_handle_guest_kick_notifier);
+    }
+}
+
+/**
+ * Start the shadow virtqueue operation.
+ *
+ * @svq: Shadow Virtqueue
+ * @vdev: VirtIO device
+ * @vq: Virtqueue to shadow
+ */
+void vhost_svq_start(VhostShadowVirtqueue *svq, VirtIODevice *vdev,
+                     VirtQueue *vq)
+{
+    size_t desc_size, driver_size, device_size;
+
+    svq->next_guest_avail_elem = NULL;
+    svq->shadow_avail_idx = 0;
+    svq->shadow_used_idx = 0;
+    svq->last_used_idx = 0;
+    svq->vdev = vdev;
+    svq->vq = vq;
+
+    svq->vring.num = virtio_queue_get_num(vdev, virtio_get_queue_index(vq));
+    driver_size = vhost_svq_driver_area_size(svq);
+    device_size = vhost_svq_device_area_size(svq);
+    svq->vring.desc = qemu_memalign(qemu_real_host_page_size, driver_size);
+    desc_size = sizeof(vring_desc_t) * svq->vring.num;
+    svq->vring.avail = (void *)((char *)svq->vring.desc + desc_size);
+    memset(svq->vring.desc, 0, driver_size);
+    svq->vring.used = qemu_memalign(qemu_real_host_page_size, device_size);
+    memset(svq->vring.used, 0, device_size);
+    svq->ring_id_maps = g_new0(VirtQueueElement *, svq->vring.num);
+    for (unsigned i = 0; i < svq->vring.num - 1; i++) {
+        svq->vring.desc[i].next = cpu_to_le16(i + 1);
     }
 }
 
@@ -172,6 +487,31 @@ void vhost_svq_set_svq_kick_fd(VhostShadowVirtqueue *svq, int svq_kick_fd)
 void vhost_svq_stop(VhostShadowVirtqueue *svq)
 {
     event_notifier_set_handler(&svq->svq_kick, NULL);
+    g_autofree VirtQueueElement *next_avail_elem = NULL;
+
+    if (!svq->vq) {
+        return;
+    }
+
+    /* Send all pending used descriptors to guest */
+    vhost_svq_flush(svq, false);
+
+    for (unsigned i = 0; i < svq->vring.num; ++i) {
+        g_autofree VirtQueueElement *elem = NULL;
+        elem = g_steal_pointer(&svq->ring_id_maps[i]);
+        if (elem) {
+            virtqueue_detach_element(svq->vq, elem, 0);
+        }
+    }
+
+    next_avail_elem = g_steal_pointer(&svq->next_guest_avail_elem);
+    if (next_avail_elem) {
+        virtqueue_detach_element(svq->vq, next_avail_elem, 0);
+    }
+    svq->vq = NULL;
+    g_free(svq->ring_id_maps);
+    qemu_vfree(svq->vring.desc);
+    qemu_vfree(svq->vring.used);
 }
 
 /**
diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost-shadow-virtqueue.h
index 82cea1c..38b3b91 100644
--- a/hw/virtio/vhost-shadow-virtqueue.h
+++ b/hw/virtio/vhost-shadow-virtqueue.h
@@ -36,6 +36,30 @@ typedef struct VhostShadowVirtqueue {
 
     /* Guest's call notifier, where the SVQ calls guest. */
     EventNotifier svq_call;
+
+    /* Virtio queue shadowing */
+    VirtQueue *vq;
+
+    /* Virtio device */
+    VirtIODevice *vdev;
+
+    /* Map for use the guest's descriptors */
+    VirtQueueElement **ring_id_maps;
+
+    /* Next VirtQueue element that guest made available */
+    VirtQueueElement *next_guest_avail_elem;
+
+    /* Next head to expose to the device */
+    uint16_t shadow_avail_idx;
+
+    /* Next free descriptor */
+    uint16_t free_head;
+
+    /* Last seen used idx */
+    uint16_t shadow_used_idx;
+
+    /* Next head to consume from the device */
+    uint16_t last_used_idx;
 } VhostShadowVirtqueue;
 
 bool vhost_svq_valid_features(uint64_t features, Error **errp);
@@ -47,6 +71,8 @@ void vhost_svq_get_vring_addr(const VhostShadowVirtqueue *svq,
 size_t vhost_svq_driver_area_size(const VhostShadowVirtqueue *svq);
 size_t vhost_svq_device_area_size(const VhostShadowVirtqueue *svq);
 
+void vhost_svq_start(VhostShadowVirtqueue *svq, VirtIODevice *vdev,
+                     VirtQueue *vq);
 void vhost_svq_stop(VhostShadowVirtqueue *svq);
 
 VhostShadowVirtqueue *vhost_svq_new(void);
diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index 3e2c181..297505f 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -777,9 +777,9 @@ static int vhost_vdpa_set_vring_dev_addr(struct vhost_dev *dev,
  * Note that this function does not rewind kick file descriptor if cannot set
  * call one.
  */
-static bool vhost_vdpa_svq_setup(struct vhost_dev *dev,
-                                 VhostShadowVirtqueue *svq, unsigned idx,
-                                 Error **errp)
+static int vhost_vdpa_svq_set_fds(struct vhost_dev *dev,
+                                  VhostShadowVirtqueue *svq, unsigned idx,
+                                  Error **errp)
 {
     struct vhost_vring_file file = {
         .index = dev->vq_index + idx,
@@ -791,7 +791,7 @@ static bool vhost_vdpa_svq_setup(struct vhost_dev *dev,
     r = vhost_vdpa_set_vring_dev_kick(dev, &file);
     if (unlikely(r != 0)) {
         error_setg_errno(errp, -r, "Can't set device kick fd");
-        return false;
+        return r;
     }
 
     event_notifier = &svq->hdev_call;
@@ -801,6 +801,95 @@ static bool vhost_vdpa_svq_setup(struct vhost_dev *dev,
         error_setg_errno(errp, -r, "Can't set device call fd");
     }
 
+    return r;
+}
+
+/**
+ * Unmap a SVQ area in the device
+ */
+static bool vhost_vdpa_svq_unmap_ring(struct vhost_vdpa *v, hwaddr iova,
+                                      hwaddr size)
+{
+    int r;
+
+    size = ROUND_UP(size, qemu_real_host_page_size);
+    r = vhost_vdpa_dma_unmap(v, iova, size);
+    return r == 0;
+}
+
+static bool vhost_vdpa_svq_unmap_rings(struct vhost_dev *dev,
+                                       const VhostShadowVirtqueue *svq)
+{
+    struct vhost_vdpa *v = dev->opaque;
+    struct vhost_vring_addr svq_addr;
+    size_t device_size = vhost_svq_device_area_size(svq);
+    size_t driver_size = vhost_svq_driver_area_size(svq);
+    bool ok;
+
+    vhost_svq_get_vring_addr(svq, &svq_addr);
+
+    ok = vhost_vdpa_svq_unmap_ring(v, svq_addr.desc_user_addr, driver_size);
+    if (unlikely(!ok)) {
+        return false;
+    }
+
+    return vhost_vdpa_svq_unmap_ring(v, svq_addr.used_user_addr, device_size);
+}
+
+/**
+ * Map the shadow virtqueue rings in the device
+ *
+ * @dev: The vhost device
+ * @svq: The shadow virtqueue
+ * @addr: Assigned IOVA addresses
+ * @errp: Error pointer
+ */
+static bool vhost_vdpa_svq_map_rings(struct vhost_dev *dev,
+                                     const VhostShadowVirtqueue *svq,
+                                     struct vhost_vring_addr *addr,
+                                     Error **errp)
+{
+    struct vhost_vdpa *v = dev->opaque;
+    size_t device_size = vhost_svq_device_area_size(svq);
+    size_t driver_size = vhost_svq_driver_area_size(svq);
+    int r;
+
+    ERRP_GUARD();
+    vhost_svq_get_vring_addr(svq, addr);
+
+    r = vhost_vdpa_dma_map(v, addr->desc_user_addr, driver_size,
+                           (void *)(uintptr_t)addr->desc_user_addr, true);
+    if (unlikely(r != 0)) {
+        error_setg_errno(errp, -r, "Cannot create vq driver region: ");
+        return false;
+    }
+
+    r = vhost_vdpa_dma_map(v, addr->used_user_addr, device_size,
+                           (void *)(intptr_t)addr->used_user_addr, false);
+    if (unlikely(r != 0)) {
+        error_setg_errno(errp, -r, "Cannot create vq device region: ");
+    }
+
+    return r == 0;
+}
+
+static bool vhost_vdpa_svq_setup(struct vhost_dev *dev,
+                                 VhostShadowVirtqueue *svq, unsigned idx,
+                                 Error **errp)
+{
+    uint16_t vq_index = dev->vq_index + idx;
+    struct vhost_vring_state s = {
+        .index = vq_index,
+    };
+    int r;
+
+    r = vhost_vdpa_set_dev_vring_base(dev, &s);
+    if (unlikely(r)) {
+        error_setg_errno(errp, -r, "Cannot set vring base");
+        return false;
+    }
+
+    r = vhost_vdpa_svq_set_fds(dev, svq, idx, errp);
     return r == 0;
 }
 
@@ -815,10 +904,62 @@ static bool vhost_vdpa_svqs_start(struct vhost_dev *dev)
     }
 
     for (i = 0; i < v->shadow_vqs->len; ++i) {
+        VirtQueue *vq = virtio_get_queue(dev->vdev, dev->vq_index + i);
         VhostShadowVirtqueue *svq = g_ptr_array_index(v->shadow_vqs, i);
+        struct vhost_vring_addr addr = {
+            .index = i,
+        };
+        int r;
         bool ok = vhost_vdpa_svq_setup(dev, svq, i, &err);
         if (unlikely(!ok)) {
-            error_reportf_err(err, "Cannot setup SVQ %u: ", i);
+            goto err;
+        }
+
+        vhost_svq_start(svq, dev->vdev, vq);
+        ok = vhost_vdpa_svq_map_rings(dev, svq, &addr, &err);
+        if (unlikely(!ok)) {
+            goto err_map;
+        }
+
+        /* Override vring GPA set by vhost subsystem */
+        r = vhost_vdpa_set_vring_dev_addr(dev, &addr);
+        if (unlikely(r != 0)) {
+            error_setg_errno(&err, -r, "Cannot set device address");
+            goto err_set_addr;
+        }
+    }
+
+    return true;
+
+err_set_addr:
+    vhost_vdpa_svq_unmap_rings(dev, g_ptr_array_index(v->shadow_vqs, i));
+
+err_map:
+    vhost_svq_stop(g_ptr_array_index(v->shadow_vqs, i));
+
+err:
+    error_reportf_err(err, "Cannot setup SVQ %u: ", i);
+    for (unsigned j = 0; j < i; ++j) {
+        VhostShadowVirtqueue *svq = g_ptr_array_index(v->shadow_vqs, j);
+        vhost_vdpa_svq_unmap_rings(dev, svq);
+        vhost_svq_stop(svq);
+    }
+
+    return false;
+}
+
+static bool vhost_vdpa_svqs_stop(struct vhost_dev *dev)
+{
+    struct vhost_vdpa *v = dev->opaque;
+
+    if (!v->shadow_vqs) {
+        return true;
+    }
+
+    for (unsigned i = 0; i < v->shadow_vqs->len; ++i) {
+        VhostShadowVirtqueue *svq = g_ptr_array_index(v->shadow_vqs, i);
+        bool ok = vhost_vdpa_svq_unmap_rings(dev, svq);
+        if (unlikely(!ok)) {
             return false;
         }
     }
@@ -840,6 +981,10 @@ static int vhost_vdpa_dev_start(struct vhost_dev *dev, bool started)
         }
         vhost_vdpa_set_vring_ready(dev);
     } else {
+        ok = vhost_vdpa_svqs_stop(dev);
+        if (unlikely(!ok)) {
+            return -1;
+        }
         vhost_vdpa_host_notifiers_uninit(dev, dev->nvqs);
     }
 
-- 
2.7.4


