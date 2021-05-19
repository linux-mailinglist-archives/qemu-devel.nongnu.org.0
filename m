Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45B123893DF
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 18:36:08 +0200 (CEST)
Received: from localhost ([::1]:37650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljPB1-0002pT-8c
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 12:36:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1ljP5H-00037l-B3
 for qemu-devel@nongnu.org; Wed, 19 May 2021 12:30:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46514)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1ljP5E-0005Ix-LA
 for qemu-devel@nongnu.org; Wed, 19 May 2021 12:30:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621441808;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/nDkxBDtSYmLMz+5vg4uCbwepfBk8wkLkW97MdIYV4Y=;
 b=D8L7JTY3ssURct4a8YndakfxlUmax8hGS2t40Qqp97L5jshHVcFZztLeQwaEtixb5I0+9o
 h698G9sVqsvqu4LeW3rZiL8wHD6WPpWR4V4FXk7w8jhqUndVrTw2zJpO1nexvG5DJMOwEp
 DQiUeXWcdIQd3MwItyTV2VylYpE0M7E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-61-nflRJF1DNla5xrJ-BBYlxQ-1; Wed, 19 May 2021 12:30:06 -0400
X-MC-Unique: nflRJF1DNla5xrJ-BBYlxQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8DCA7180FD69;
 Wed, 19 May 2021 16:30:04 +0000 (UTC)
Received: from eperezma.remote.csb (ovpn-113-65.ams2.redhat.com [10.36.113.65])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 569AB5D6D5;
 Wed, 19 May 2021 16:29:57 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC v3 07/29] vhost: Route guest->host notification through shadow
 virtqueue
Date: Wed, 19 May 2021 18:28:41 +0200
Message-Id: <20210519162903.1172366-8-eperezma@redhat.com>
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

Shadow virtqueue notifications forwarding is disabled when vhost_dev
stops, so code flow follows usual cleanup.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/virtio/vhost-shadow-virtqueue.h |   7 ++
 include/hw/virtio/vhost.h          |   4 +
 hw/virtio/vhost-shadow-virtqueue.c | 113 ++++++++++++++++++++++-
 hw/virtio/vhost.c                  | 143 ++++++++++++++++++++++++++++-
 4 files changed, 265 insertions(+), 2 deletions(-)

diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost-shadow-virtqueue.h
index 6cc18d6acb..c891c6510d 100644
--- a/hw/virtio/vhost-shadow-virtqueue.h
+++ b/hw/virtio/vhost-shadow-virtqueue.h
@@ -17,6 +17,13 @@
 
 typedef struct VhostShadowVirtqueue VhostShadowVirtqueue;
 
+bool vhost_shadow_vq_start(struct vhost_dev *dev,
+                           unsigned idx,
+                           VhostShadowVirtqueue *svq);
+void vhost_shadow_vq_stop(struct vhost_dev *dev,
+                          unsigned idx,
+                          VhostShadowVirtqueue *svq);
+
 VhostShadowVirtqueue *vhost_shadow_vq_new(struct vhost_dev *dev, int idx);
 
 void vhost_shadow_vq_free(VhostShadowVirtqueue *vq);
diff --git a/include/hw/virtio/vhost.h b/include/hw/virtio/vhost.h
index ac963bf23d..7ffdf9aea0 100644
--- a/include/hw/virtio/vhost.h
+++ b/include/hw/virtio/vhost.h
@@ -55,6 +55,8 @@ struct vhost_iommu {
     QLIST_ENTRY(vhost_iommu) iommu_next;
 };
 
+typedef struct VhostShadowVirtqueue VhostShadowVirtqueue;
+
 typedef struct VhostDevConfigOps {
     /* Vhost device config space changed callback
      */
@@ -83,7 +85,9 @@ struct vhost_dev {
     uint64_t backend_cap;
     bool started;
     bool log_enabled;
+    bool shadow_vqs_enabled;
     uint64_t log_size;
+    VhostShadowVirtqueue **shadow_vqs;
     Error *migration_blocker;
     const VhostOps *vhost_ops;
     void *opaque;
diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
index 4512e5b058..3e43399e9c 100644
--- a/hw/virtio/vhost-shadow-virtqueue.c
+++ b/hw/virtio/vhost-shadow-virtqueue.c
@@ -8,9 +8,12 @@
  */
 
 #include "hw/virtio/vhost-shadow-virtqueue.h"
+#include "hw/virtio/vhost.h"
+
+#include "standard-headers/linux/vhost_types.h"
 
 #include "qemu/error-report.h"
-#include "qemu/event_notifier.h"
+#include "qemu/main-loop.h"
 
 /* Shadow virtqueue to relay notifications */
 typedef struct VhostShadowVirtqueue {
@@ -18,14 +21,121 @@ typedef struct VhostShadowVirtqueue {
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
+ * Restore the vhost guest to host notifier, i.e., disables svq effect.
+ */
+static int vhost_shadow_vq_restore_vdev_host_notifier(struct vhost_dev *dev,
+                                                     unsigned vhost_index,
+                                                     VhostShadowVirtqueue *svq)
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
+bool vhost_shadow_vq_start(struct vhost_dev *dev,
+                           unsigned idx,
+                           VhostShadowVirtqueue *svq)
+{
+    EventNotifier *vq_host_notifier = virtio_queue_get_host_notifier(svq->vq);
+    struct vhost_vring_file file = {
+        .index = idx,
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
+void vhost_shadow_vq_stop(struct vhost_dev *dev,
+                          unsigned idx,
+                          VhostShadowVirtqueue *svq)
+{
+    int r = vhost_shadow_vq_restore_vdev_host_notifier(dev, idx, svq);
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
 VhostShadowVirtqueue *vhost_shadow_vq_new(struct vhost_dev *dev, int idx)
 {
+    int vq_idx = dev->vq_index + idx;
     g_autofree VhostShadowVirtqueue *svq = g_new0(VhostShadowVirtqueue, 1);
     int r;
 
@@ -43,6 +153,7 @@ VhostShadowVirtqueue *vhost_shadow_vq_new(struct vhost_dev *dev, int idx)
         goto err_init_call_notifier;
     }
 
+    svq->vq = virtio_get_queue(dev->vdev, vq_idx);
     return g_steal_pointer(&svq);
 
 err_init_call_notifier:
diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
index c4c1f80661..84091b5251 100644
--- a/hw/virtio/vhost.c
+++ b/hw/virtio/vhost.c
@@ -25,6 +25,7 @@
 #include "exec/address-spaces.h"
 #include "hw/virtio/virtio-bus.h"
 #include "hw/virtio/virtio-access.h"
+#include "hw/virtio/vhost-shadow-virtqueue.h"
 #include "migration/blocker.h"
 #include "migration/qemu-file-types.h"
 #include "sysemu/dma.h"
@@ -1219,6 +1220,74 @@ static void vhost_virtqueue_stop(struct vhost_dev *dev,
                        0, virtio_queue_get_desc_size(vdev, idx));
 }
 
+static int vhost_sw_live_migration_stop(struct vhost_dev *dev)
+{
+    int idx;
+
+    dev->shadow_vqs_enabled = false;
+
+    for (idx = 0; idx < dev->nvqs; ++idx) {
+        vhost_shadow_vq_stop(dev, idx, dev->shadow_vqs[idx]);
+        vhost_shadow_vq_free(dev->shadow_vqs[idx]);
+    }
+
+    g_free(dev->shadow_vqs);
+    dev->shadow_vqs = NULL;
+    return 0;
+}
+
+static int vhost_sw_live_migration_start(struct vhost_dev *dev)
+{
+    int idx, stop_idx;
+
+    dev->shadow_vqs = g_new0(VhostShadowVirtqueue *, dev->nvqs);
+    for (idx = 0; idx < dev->nvqs; ++idx) {
+        dev->shadow_vqs[idx] = vhost_shadow_vq_new(dev, idx);
+        if (unlikely(dev->shadow_vqs[idx] == NULL)) {
+            goto err_new;
+        }
+    }
+
+    dev->shadow_vqs_enabled = true;
+    for (idx = 0; idx < dev->nvqs; ++idx) {
+        bool ok = vhost_shadow_vq_start(dev, idx, dev->shadow_vqs[idx]);
+        if (unlikely(!ok)) {
+            goto err_start;
+        }
+    }
+
+    return 0;
+
+err_start:
+    dev->shadow_vqs_enabled = false;
+    for (stop_idx = 0; stop_idx < idx; stop_idx++) {
+        vhost_shadow_vq_stop(dev, idx, dev->shadow_vqs[stop_idx]);
+    }
+
+err_new:
+    for (idx = 0; idx < dev->nvqs; ++idx) {
+        vhost_shadow_vq_free(dev->shadow_vqs[idx]);
+    }
+    g_free(dev->shadow_vqs);
+
+    return -1;
+}
+
+static int vhost_sw_live_migration_enable(struct vhost_dev *dev,
+                                          bool enable_lm)
+{
+    int r;
+
+    if (enable_lm == dev->shadow_vqs_enabled) {
+        return 0;
+    }
+
+    r = enable_lm ? vhost_sw_live_migration_start(dev)
+                  : vhost_sw_live_migration_stop(dev);
+
+    return r;
+}
+
 static void vhost_eventfd_add(MemoryListener *listener,
                               MemoryRegionSection *section,
                               bool match_data, uint64_t data, EventNotifier *e)
@@ -1381,6 +1450,7 @@ int vhost_dev_init(struct vhost_dev *hdev, void *opaque,
     hdev->log = NULL;
     hdev->log_size = 0;
     hdev->log_enabled = false;
+    hdev->shadow_vqs_enabled = false;
     hdev->started = false;
     memory_listener_register(&hdev->memory_listener, &address_space_memory);
     QLIST_INSERT_HEAD(&vhost_devices, hdev, entry);
@@ -1484,6 +1554,10 @@ void vhost_dev_disable_notifiers(struct vhost_dev *hdev, VirtIODevice *vdev)
     BusState *qbus = BUS(qdev_get_parent_bus(DEVICE(vdev)));
     int i, r;
 
+    if (hdev->shadow_vqs_enabled) {
+        vhost_sw_live_migration_enable(hdev, false);
+    }
+
     for (i = 0; i < hdev->nvqs; ++i) {
         r = virtio_bus_set_host_notifier(VIRTIO_BUS(qbus), hdev->vq_index + i,
                                          false);
@@ -1798,6 +1872,7 @@ fail_features:
 void vhost_dev_stop(struct vhost_dev *hdev, VirtIODevice *vdev)
 {
     int i;
+    bool is_shadow_vqs_enabled = hdev->shadow_vqs_enabled;
 
     /* should only be called after backend is connected */
     assert(hdev->vhost_ops);
@@ -1805,7 +1880,16 @@ void vhost_dev_stop(struct vhost_dev *hdev, VirtIODevice *vdev)
     if (hdev->vhost_ops->vhost_dev_start) {
         hdev->vhost_ops->vhost_dev_start(hdev, false);
     }
+    if (is_shadow_vqs_enabled) {
+        /* Shadow virtqueue will be stopped */
+        hdev->shadow_vqs_enabled = false;
+    }
     for (i = 0; i < hdev->nvqs; ++i) {
+        if (is_shadow_vqs_enabled) {
+            vhost_shadow_vq_stop(hdev, i, hdev->shadow_vqs[i]);
+            vhost_shadow_vq_free(hdev->shadow_vqs[i]);
+        }
+
         vhost_virtqueue_stop(hdev,
                              vdev,
                              hdev->vqs + i,
@@ -1819,6 +1903,8 @@ void vhost_dev_stop(struct vhost_dev *hdev, VirtIODevice *vdev)
         memory_listener_unregister(&hdev->iommu_listener);
     }
     vhost_log_put(hdev, true);
+    g_free(hdev->shadow_vqs);
+    hdev->shadow_vqs_enabled = false;
     hdev->started = false;
     hdev->vdev = NULL;
 }
@@ -1835,5 +1921,60 @@ int vhost_net_set_backend(struct vhost_dev *hdev,
 
 void qmp_x_vhost_enable_shadow_vq(const char *name, bool enable, Error **errp)
 {
-    error_setg(errp, "Shadow virtqueue still not implemented");
+    struct vhost_dev *hdev, *hdev_err;
+    VirtIODevice *vdev;
+    const char *err_cause = NULL;
+    int r;
+    ErrorClass err_class = ERROR_CLASS_GENERIC_ERROR;
+
+    QLIST_FOREACH(hdev, &vhost_devices, entry) {
+        if (hdev->vdev && 0 == strcmp(hdev->vdev->name, name)) {
+            vdev = hdev->vdev;
+            break;
+        }
+    }
+
+    if (!hdev) {
+        err_class = ERROR_CLASS_DEVICE_NOT_FOUND;
+        err_cause = "Device not found";
+        goto not_found_err;
+    }
+
+    for ( ; hdev; hdev = QLIST_NEXT(hdev, entry)) {
+        if (vdev != hdev->vdev) {
+            continue;
+        }
+
+        if (!hdev->started) {
+            err_cause = "Device is not started";
+            goto err;
+        }
+
+        r = vhost_sw_live_migration_enable(hdev, enable);
+        if (unlikely(r)) {
+            err_cause = "Error enabling (see monitor)";
+            goto err;
+        }
+    }
+
+    return;
+
+err:
+    QLIST_FOREACH(hdev_err, &vhost_devices, entry) {
+        if (hdev_err == hdev) {
+            break;
+        }
+
+        if (vdev != hdev->vdev) {
+            continue;
+        }
+
+        vhost_sw_live_migration_enable(hdev, !enable);
+    }
+
+not_found_err:
+    if (err_cause) {
+        error_set(errp, err_class,
+                  "Can't enable shadow vq on %s: %s", name, err_cause);
+    }
 }
-- 
2.27.0


