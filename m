Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90DA041E839
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Oct 2021 09:20:03 +0200 (CEST)
Received: from localhost ([::1]:36986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWCpu-0008IF-IK
	for lists+qemu-devel@lfdr.de; Fri, 01 Oct 2021 03:20:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mWCfv-0007C1-AB
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 03:09:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22712)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mWCft-0002tj-4h
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 03:09:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633072180;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Xl2hd1UexJOmNm81T+0SxgNCwG4G9PPSF2XXnl/ztVg=;
 b=NGpzyMnbCFq2tlUFjaWO6x1thGtpLQzH2HpLq8b9mfDvLzdOUGlF7Vrant5aWCWcoK93D3
 DMDIp5f0r5i34lHRekO/zv8IhHab38U8x92HbxU9bZTZCBu3ECeSN+MDOE25AZvrMVZuut
 wi6evz8WTrJapxYXHChL8tkpW89Xxbw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-603-Q_kwPjGEM0a1F_UT4EldZA-1; Fri, 01 Oct 2021 03:09:39 -0400
X-MC-Unique: Q_kwPjGEM0a1F_UT4EldZA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4F4151868417;
 Fri,  1 Oct 2021 07:09:38 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.193.2])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 313F0652AE;
 Fri,  1 Oct 2021 07:09:35 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v4 08/20] vhost: Route guest->host notification through
 shadow virtqueue
Date: Fri,  1 Oct 2021 09:05:51 +0200
Message-Id: <20211001070603.307037-9-eperezma@redhat.com>
In-Reply-To: <20211001070603.307037-1-eperezma@redhat.com>
References: <20211001070603.307037-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
Cc: Parav Pandit <parav@mellanox.com>, Juan Quintela <quintela@redhat.com>,
 Jason Wang <jasowang@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 virtualization@lists.linux-foundation.org,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Eric Blake <eblake@redhat.com>, Michael Lilja <ml@napatech.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Shadow virtqueue notifications forwarding is disabled when vhost_dev
stops, so code flow follows usual cleanup.

Also, host notifiers must be disabled at SVQ start, and they will not
start if SVQ has been enabled when device is stopped. This is trivial
to address, but it is left out for simplicity at this moment.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 qapi/net.json                      |   2 +-
 hw/virtio/vhost-shadow-virtqueue.h |   8 ++
 include/hw/virtio/vhost-vdpa.h     |   4 +
 hw/virtio/vhost-shadow-virtqueue.c | 138 ++++++++++++++++++++++++++++-
 hw/virtio/vhost-vdpa.c             | 116 +++++++++++++++++++++++-
 5 files changed, 264 insertions(+), 4 deletions(-)

diff --git a/qapi/net.json b/qapi/net.json
index a2c30fd455..fe546b0e7c 100644
--- a/qapi/net.json
+++ b/qapi/net.json
@@ -88,7 +88,7 @@
 #
 # @enable: true to use the alternate shadow VQ notifications
 #
-# Returns: Always error, since SVQ is not implemented at the moment.
+# Returns: Error if failure, or 'no error' for success.
 #
 # Since: 6.2
 #
diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost-shadow-virtqueue.h
index 27ac6388fa..237cfceb9c 100644
--- a/hw/virtio/vhost-shadow-virtqueue.h
+++ b/hw/virtio/vhost-shadow-virtqueue.h
@@ -14,6 +14,14 @@
 
 typedef struct VhostShadowVirtqueue VhostShadowVirtqueue;
 
+EventNotifier *vhost_svq_get_svq_call_notifier(VhostShadowVirtqueue *svq);
+void vhost_svq_set_guest_call_notifier(VhostShadowVirtqueue *svq, int call_fd);
+
+bool vhost_svq_start(struct vhost_dev *dev, unsigned idx,
+                     VhostShadowVirtqueue *svq);
+void vhost_svq_stop(struct vhost_dev *dev, unsigned idx,
+                    VhostShadowVirtqueue *svq);
+
 VhostShadowVirtqueue *vhost_svq_new(struct vhost_dev *dev, int idx);
 
 void vhost_svq_free(VhostShadowVirtqueue *vq);
diff --git a/include/hw/virtio/vhost-vdpa.h b/include/hw/virtio/vhost-vdpa.h
index 0d565bb5bd..48aae59d8e 100644
--- a/include/hw/virtio/vhost-vdpa.h
+++ b/include/hw/virtio/vhost-vdpa.h
@@ -12,6 +12,8 @@
 #ifndef HW_VIRTIO_VHOST_VDPA_H
 #define HW_VIRTIO_VHOST_VDPA_H
 
+#include <gmodule.h>
+
 #include "qemu/queue.h"
 #include "hw/virtio/virtio.h"
 
@@ -24,6 +26,8 @@ typedef struct vhost_vdpa {
     int device_fd;
     uint32_t msg_type;
     MemoryListener listener;
+    bool shadow_vqs_enabled;
+    GPtrArray *shadow_vqs;
     struct vhost_dev *dev;
     QLIST_ENTRY(vhost_vdpa) entry;
     VhostVDPAHostNotifier notifier[VIRTIO_QUEUE_MAX];
diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
index c4826a1b56..21dc99ab5d 100644
--- a/hw/virtio/vhost-shadow-virtqueue.c
+++ b/hw/virtio/vhost-shadow-virtqueue.c
@@ -9,9 +9,12 @@
 
 #include "qemu/osdep.h"
 #include "hw/virtio/vhost-shadow-virtqueue.h"
+#include "hw/virtio/vhost.h"
+
+#include "standard-headers/linux/vhost_types.h"
 
 #include "qemu/error-report.h"
-#include "qemu/event_notifier.h"
+#include "qemu/main-loop.h"
 
 /* Shadow virtqueue to relay notifications */
 typedef struct VhostShadowVirtqueue {
@@ -19,14 +22,146 @@ typedef struct VhostShadowVirtqueue {
     EventNotifier kick_notifier;
     /* Shadow call notifier, sent to vhost */
     EventNotifier call_notifier;
+
+    /*
+     * Borrowed virtqueue's guest to host notifier.
+     * To borrow it in this event notifier allows to register on the event
+     * loop and access the associated shadow virtqueue easily. If we use the
+     * VirtQueue, we don't have an easy way to retrieve it.
+     *
+     * So shadow virtqueue must not clean it, or we would lose VirtQueue one.
+     */
+    EventNotifier host_notifier;
+
+    /* Guest's call notifier, where SVQ calls guest. */
+    EventNotifier guest_call_notifier;
+
+    /* Virtio queue shadowing */
+    VirtQueue *vq;
 } VhostShadowVirtqueue;
 
+/* Forward guest notifications */
+static void vhost_handle_guest_kick(EventNotifier *n)
+{
+    VhostShadowVirtqueue *svq = container_of(n, VhostShadowVirtqueue,
+                                             host_notifier);
+
+    if (unlikely(!event_notifier_test_and_clear(n))) {
+        return;
+    }
+
+    event_notifier_set(&svq->kick_notifier);
+}
+
+/*
+ * Obtain the SVQ call notifier, where vhost device notifies SVQ that there
+ * exists pending used buffers.
+ *
+ * @svq Shadow Virtqueue
+ */
+EventNotifier *vhost_svq_get_svq_call_notifier(VhostShadowVirtqueue *svq)
+{
+    return &svq->call_notifier;
+}
+
+/*
+ * Set the call notifier for the SVQ to call the guest
+ *
+ * @svq Shadow virtqueue
+ * @call_fd call notifier
+ *
+ * Called on BQL context.
+ */
+void vhost_svq_set_guest_call_notifier(VhostShadowVirtqueue *svq, int call_fd)
+{
+    event_notifier_init_fd(&svq->guest_call_notifier, call_fd);
+}
+
+/*
+ * Restore the vhost guest to host notifier, i.e., disables svq effect.
+ */
+static int vhost_svq_restore_vdev_host_notifier(struct vhost_dev *dev,
+                                                unsigned vhost_index,
+                                                VhostShadowVirtqueue *svq)
+{
+    EventNotifier *vq_host_notifier = virtio_queue_get_host_notifier(svq->vq);
+    struct vhost_vring_file file = {
+        .index = vhost_index,
+        .fd = event_notifier_get_fd(vq_host_notifier),
+    };
+    int r;
+
+    /* Restore vhost kick */
+    r = dev->vhost_ops->vhost_set_vring_kick(dev, &file);
+    return r ? -errno : 0;
+}
+
+/*
+ * Start shadow virtqueue operation.
+ * @dev vhost device
+ * @hidx vhost virtqueue index
+ * @svq Shadow Virtqueue
+ */
+bool vhost_svq_start(struct vhost_dev *dev, unsigned idx,
+                     VhostShadowVirtqueue *svq)
+{
+    EventNotifier *vq_host_notifier = virtio_queue_get_host_notifier(svq->vq);
+    struct vhost_vring_file file = {
+        .index = dev->vhost_ops->vhost_get_vq_index(dev, dev->vq_index + idx),
+        .fd = event_notifier_get_fd(&svq->kick_notifier),
+    };
+    int r;
+
+    /* Check that notifications are still going directly to vhost dev */
+    assert(virtio_queue_is_host_notifier_enabled(svq->vq));
+
+    /*
+     * event_notifier_set_handler already checks for guest's notifications if
+     * they arrive in the switch, so there is no need to explicitely check for
+     * them.
+     */
+    event_notifier_init_fd(&svq->host_notifier,
+                           event_notifier_get_fd(vq_host_notifier));
+    event_notifier_set_handler(&svq->host_notifier, vhost_handle_guest_kick);
+
+    r = dev->vhost_ops->vhost_set_vring_kick(dev, &file);
+    if (unlikely(r != 0)) {
+        error_report("Couldn't set kick fd: %s", strerror(errno));
+        goto err_set_vring_kick;
+    }
+
+    return true;
+
+err_set_vring_kick:
+    event_notifier_set_handler(&svq->host_notifier, NULL);
+
+    return false;
+}
+
+/*
+ * Stop shadow virtqueue operation.
+ * @dev vhost device
+ * @idx vhost queue index
+ * @svq Shadow Virtqueue
+ */
+void vhost_svq_stop(struct vhost_dev *dev, unsigned idx,
+                    VhostShadowVirtqueue *svq)
+{
+    int r = vhost_svq_restore_vdev_host_notifier(dev, idx, svq);
+    if (unlikely(r < 0)) {
+        error_report("Couldn't restore vq kick fd: %s", strerror(-r));
+    }
+
+    event_notifier_set_handler(&svq->host_notifier, NULL);
+}
+
 /*
  * Creates vhost shadow virtqueue, and instruct vhost device to use the shadow
  * methods and file descriptors.
  */
 VhostShadowVirtqueue *vhost_svq_new(struct vhost_dev *dev, int idx)
 {
+    int vq_idx = dev->vq_index + idx;
     g_autofree VhostShadowVirtqueue *svq = g_new0(VhostShadowVirtqueue, 1);
     int r;
 
@@ -44,6 +179,7 @@ VhostShadowVirtqueue *vhost_svq_new(struct vhost_dev *dev, int idx)
         goto err_init_call_notifier;
     }
 
+    svq->vq = virtio_get_queue(dev->vdev, vq_idx);
     return g_steal_pointer(&svq);
 
 err_init_call_notifier:
diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index e0dc7508c3..36c954a779 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -17,6 +17,7 @@
 #include "hw/virtio/vhost.h"
 #include "hw/virtio/vhost-backend.h"
 #include "hw/virtio/virtio-net.h"
+#include "hw/virtio/vhost-shadow-virtqueue.h"
 #include "hw/virtio/vhost-vdpa.h"
 #include "exec/address-spaces.h"
 #include "qemu/main-loop.h"
@@ -272,6 +273,16 @@ static void vhost_vdpa_add_status(struct vhost_dev *dev, uint8_t status)
     vhost_vdpa_call(dev, VHOST_VDPA_SET_STATUS, &s);
 }
 
+/**
+ * Adaptor function to free shadow virtqueue through gpointer
+ *
+ * @svq   The Shadow Virtqueue
+ */
+static void vhost_psvq_free(gpointer svq)
+{
+    vhost_svq_free(svq);
+}
+
 static int vhost_vdpa_init(struct vhost_dev *dev, void *opaque, Error **errp)
 {
     struct vhost_vdpa *v;
@@ -283,6 +294,7 @@ static int vhost_vdpa_init(struct vhost_dev *dev, void *opaque, Error **errp)
     dev->opaque =  opaque ;
     v->listener = vhost_vdpa_memory_listener;
     v->msg_type = VHOST_IOTLB_MSG_V2;
+    v->shadow_vqs = g_ptr_array_new_full(dev->nvqs, vhost_psvq_free);
     QLIST_INSERT_HEAD(&vhost_vdpa_devices, v, entry);
 
     vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_ACKNOWLEDGE |
@@ -373,6 +385,17 @@ err:
     return;
 }
 
+static void vhost_vdpa_svq_cleanup(struct vhost_dev *dev)
+{
+    struct vhost_vdpa *v = dev->opaque;
+    size_t idx;
+
+    for (idx = 0; idx < v->shadow_vqs->len; ++idx) {
+        vhost_svq_stop(dev, idx, g_ptr_array_index(v->shadow_vqs, idx));
+    }
+    g_ptr_array_free(v->shadow_vqs, true);
+}
+
 static int vhost_vdpa_cleanup(struct vhost_dev *dev)
 {
     struct vhost_vdpa *v;
@@ -381,6 +404,7 @@ static int vhost_vdpa_cleanup(struct vhost_dev *dev)
     trace_vhost_vdpa_cleanup(dev, v);
     vhost_vdpa_host_notifiers_uninit(dev, dev->nvqs);
     memory_listener_unregister(&v->listener);
+    vhost_vdpa_svq_cleanup(dev);
     QLIST_REMOVE(v, entry);
 
     dev->opaque = NULL;
@@ -557,7 +581,9 @@ static int vhost_vdpa_dev_start(struct vhost_dev *dev, bool started)
     if (started) {
         uint8_t status = 0;
         memory_listener_register(&v->listener, &address_space_memory);
-        vhost_vdpa_host_notifiers_init(dev);
+        if (!v->shadow_vqs_enabled) {
+            vhost_vdpa_host_notifiers_init(dev);
+        }
         vhost_vdpa_set_vring_ready(dev);
         vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_DRIVER_OK);
         vhost_vdpa_call(dev, VHOST_VDPA_GET_STATUS, &status);
@@ -663,10 +689,96 @@ static bool  vhost_vdpa_force_iommu(struct vhost_dev *dev)
     return true;
 }
 
+/*
+ * Start shadow virtqueue.
+ */
+static bool vhost_vdpa_svq_start_vq(struct vhost_dev *dev, unsigned idx)
+{
+    struct vhost_vdpa *v = dev->opaque;
+    VhostShadowVirtqueue *svq = g_ptr_array_index(v->shadow_vqs, idx);
+    return vhost_svq_start(dev, idx, svq);
+}
+
+static unsigned vhost_vdpa_enable_svq(struct vhost_vdpa *v, bool enable)
+{
+    struct vhost_dev *hdev = v->dev;
+    unsigned n;
+
+    if (enable == v->shadow_vqs_enabled) {
+        return hdev->nvqs;
+    }
+
+    if (enable) {
+        /* Allocate resources */
+        assert(v->shadow_vqs->len == 0);
+        for (n = 0; n < hdev->nvqs; ++n) {
+            VhostShadowVirtqueue *svq = vhost_svq_new(hdev, n);
+            bool ok;
+
+            if (unlikely(!svq)) {
+                g_ptr_array_set_size(v->shadow_vqs, 0);
+                return 0;
+            }
+            g_ptr_array_add(v->shadow_vqs, svq);
+
+            ok = vhost_vdpa_svq_start_vq(hdev, n);
+            if (unlikely(!ok)) {
+                /* Free still not started svqs */
+                g_ptr_array_set_size(v->shadow_vqs, n);
+                enable = false;
+                break;
+            }
+        }
+    }
+
+    v->shadow_vqs_enabled = enable;
+
+    if (!enable) {
+        /* Disable all queues or clean up failed start */
+        for (n = 0; n < v->shadow_vqs->len; ++n) {
+            unsigned vq_idx = vhost_vdpa_get_vq_index(hdev, n);
+            VhostShadowVirtqueue *svq = g_ptr_array_index(v->shadow_vqs, n);
+            vhost_svq_stop(hdev, n, svq);
+            vhost_virtqueue_start(hdev, hdev->vdev, &hdev->vqs[n], vq_idx);
+        }
+
+        /* Resources cleanup */
+        g_ptr_array_set_size(v->shadow_vqs, 0);
+    }
+
+    return n;
+}
 
 void qmp_x_vhost_enable_shadow_vq(const char *name, bool enable, Error **errp)
 {
-    error_setg(errp, "Shadow virtqueue still not implemented");
+    struct vhost_vdpa *v;
+    const char *err_cause = NULL;
+    bool r;
+
+    QLIST_FOREACH(v, &vhost_vdpa_devices, entry) {
+        if (v->dev->vdev && 0 == strcmp(v->dev->vdev->name, name)) {
+            break;
+        }
+    }
+
+    if (!v) {
+        err_cause = "Device not found";
+        goto err;
+    } else if (v->notifier[0].addr) {
+        err_cause = "Device has host notifiers enabled";
+        goto err;
+    }
+
+    r = vhost_vdpa_enable_svq(v, enable);
+    if (unlikely(!r)) {
+        err_cause = "Error enabling (see monitor)";
+        goto err;
+    }
+
+err:
+    if (err_cause) {
+        error_setg(errp, "Can't enable shadow vq on %s: %s", name, err_cause);
+    }
 }
 
 const VhostOps vdpa_ops = {
-- 
2.27.0


