Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F24AB315328
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 16:50:15 +0100 (CET)
Received: from localhost ([::1]:38370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9VHL-0003fe-1x
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 10:50:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1l9V6J-0003kj-PM
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 10:38:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25529)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1l9V6F-0008Kr-S8
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 10:38:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612885125;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gpifSbnjYPCdwCNzWIyzHdufTbFFRRTIJ6we5pSJcKY=;
 b=JdT5dXnJ1a+uV7llNmTxifklaXovoas3UiGx+rXTQnupOoobB6RZH7EbQtHvuPdGwAHh7N
 Rs+dKxhuOaBE1oi2qBqkizKxpA4XJmislneJnSNHvR7SVoHEtPeKuOYIdP3lrXoKyomrHk
 imQif8q4DEhmnusLjYvjHbxaxyyaet4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-237-qwUDRcXxPt6kt1KNItsPIw-1; Tue, 09 Feb 2021 10:38:41 -0500
X-MC-Unique: qwUDRcXxPt6kt1KNItsPIw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E48A080197B;
 Tue,  9 Feb 2021 15:38:39 +0000 (UTC)
Received: from eperezma.remote.csb (ovpn-113-210.ams2.redhat.com
 [10.36.113.210])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8592760861;
 Tue,  9 Feb 2021 15:38:36 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC v2 6/7] vhost: Route guest->host notification through shadow
 virtqueue
Date: Tue,  9 Feb 2021 16:37:56 +0100
Message-Id: <20210209153757.1653598-7-eperezma@redhat.com>
In-Reply-To: <20210209153757.1653598-1-eperezma@redhat.com>
References: <20210209153757.1653598-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 Rob Miller <rob.miller@broadcom.com>, Michael Lilja <ml@napatech.com>,
 Jim Harford <jim.harford@broadcom.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Shadow virtqueue notifications forwarding is disabled when vhost_dev
stops.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/virtio/vhost-shadow-virtqueue.h |   7 ++
 include/hw/virtio/vhost.h          |   4 +
 hw/virtio/vhost-shadow-virtqueue.c |  97 ++++++++++++++++++-
 hw/virtio/vhost.c                  | 148 ++++++++++++++++++++++++++++-
 4 files changed, 253 insertions(+), 3 deletions(-)

diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost-shadow-virtqueue.h
index 6cc18d6acb..c45035c4b7 100644
--- a/hw/virtio/vhost-shadow-virtqueue.h
+++ b/hw/virtio/vhost-shadow-virtqueue.h
@@ -17,6 +17,13 @@
 
 typedef struct VhostShadowVirtqueue VhostShadowVirtqueue;
 
+bool vhost_shadow_vq_start_rcu(struct vhost_dev *dev,
+                               unsigned idx,
+                               VhostShadowVirtqueue *svq);
+void vhost_shadow_vq_stop_rcu(struct vhost_dev *dev,
+                              unsigned idx,
+                              VhostShadowVirtqueue *svq);
+
 VhostShadowVirtqueue *vhost_shadow_vq_new(struct vhost_dev *dev, int idx);
 
 void vhost_shadow_vq_free(VhostShadowVirtqueue *vq);
diff --git a/include/hw/virtio/vhost.h b/include/hw/virtio/vhost.h
index ac963bf23d..884818b109 100644
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
+    bool sw_lm_enabled;
     uint64_t log_size;
+    VhostShadowVirtqueue **shadow_vqs;
     Error *migration_blocker;
     const VhostOps *vhost_ops;
     void *opaque;
diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
index b5d2645ae0..01f282d434 100644
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
@@ -18,8 +21,95 @@ typedef struct VhostShadowVirtqueue {
     EventNotifier kick_notifier;
     /* Shadow call notifier, sent to vhost */
     EventNotifier call_notifier;
+
+    /* Borrowed virtqueue's guest to host notifier. */
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
+    if (event_notifier_test_and_clear(n)) {
+        event_notifier_set(&svq->kick_notifier);
+    }
+}
+
+/*
+ * Start shadow virtqueue operation.
+ * @dev vhost device
+ * @hidx vhost virtqueue index
+ * @svq Shadow Virtqueue
+ *
+ * Run in RCU context
+ */
+bool vhost_shadow_vq_start_rcu(struct vhost_dev *dev,
+                               unsigned idx,
+                               VhostShadowVirtqueue *svq)
+{
+    EventNotifier *vq_host_notifier = virtio_queue_get_host_notifier(svq->vq);
+    struct vhost_vring_file kick_file = {
+        .index = idx,
+        .fd = event_notifier_get_fd(&svq->kick_notifier),
+    };
+    int r;
+
+    /* Check that notifications are still going directly to vhost dev */
+    assert(virtio_queue_host_notifier_status(svq->vq));
+
+    event_notifier_init_fd(&svq->host_notifier,
+                           event_notifier_get_fd(vq_host_notifier));
+    event_notifier_set_handler(&svq->host_notifier, vhost_handle_guest_kick);
+
+    r = dev->vhost_ops->vhost_set_vring_kick(dev, &kick_file);
+    if (unlikely(r != 0)) {
+        error_report("Couldn't set kick fd: %s", strerror(errno));
+        goto err_set_vring_kick;
+    }
+
+    /* Check for pending notifications from the guest */
+    vhost_handle_guest_kick(&svq->host_notifier);
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
+ *
+ * Run in RCU context
+ */
+void vhost_shadow_vq_stop_rcu(struct vhost_dev *dev,
+                              unsigned idx,
+                              VhostShadowVirtqueue *svq)
+{
+    EventNotifier *vq_host_notifier = virtio_queue_get_host_notifier(svq->vq);
+    struct vhost_vring_file kick_file = {
+        .index = idx,
+        .fd = event_notifier_get_fd(vq_host_notifier),
+    };
+    int r;
+
+    /* Restore vhost kick */
+    r = dev->vhost_ops->vhost_set_vring_kick(dev, &kick_file);
+    /* Cannot do a lot of things */
+    assert(r == 0);
+
+    event_notifier_set_handler(&svq->host_notifier, NULL);
+}
+
 /*
  * Creates vhost shadow virtqueue, and instruct vhost device to use the shadow
  * methods and file descriptors.
@@ -27,8 +117,11 @@ typedef struct VhostShadowVirtqueue {
 VhostShadowVirtqueue *vhost_shadow_vq_new(struct vhost_dev *dev, int idx)
 {
     g_autofree VhostShadowVirtqueue *svq = g_new0(VhostShadowVirtqueue, 1);
+    int vq_idx = dev->vq_index + idx;
     int r;
 
+    svq->vq = virtio_get_queue(dev->vdev, vq_idx);
+
     r = event_notifier_init(&svq->kick_notifier, 0);
     if (r != 0) {
         error_report("Couldn't create kick event notifier: %s",
@@ -43,7 +136,7 @@ VhostShadowVirtqueue *vhost_shadow_vq_new(struct vhost_dev *dev, int idx)
         goto err_init_call_notifier;
     }
 
-    return svq;
+    return g_steal_pointer(&svq);
 
 err_init_call_notifier:
     event_notifier_cleanup(&svq->kick_notifier);
diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
index 8fbf14385e..9d4728e545 100644
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
@@ -937,6 +938,84 @@ static void vhost_log_global_stop(MemoryListener *listener)
     }
 }
 
+static int vhost_sw_live_migration_stop(struct vhost_dev *dev)
+{
+    int idx;
+
+    WITH_RCU_READ_LOCK_GUARD() {
+        dev->sw_lm_enabled = false;
+
+        for (idx = 0; idx < dev->nvqs; ++idx) {
+            vhost_shadow_vq_stop_rcu(dev, idx, dev->shadow_vqs[idx]);
+        }
+    }
+
+    for (idx = 0; idx < dev->nvqs; ++idx) {
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
+    int idx;
+
+    dev->shadow_vqs = g_new0(VhostShadowVirtqueue *, dev->nvqs);
+    for (idx = 0; idx < dev->nvqs; ++idx) {
+        dev->shadow_vqs[idx] = vhost_shadow_vq_new(dev, idx);
+        if (unlikely(dev->shadow_vqs[idx] == NULL)) {
+            goto err;
+        }
+    }
+
+    WITH_RCU_READ_LOCK_GUARD() {
+        for (idx = 0; idx < dev->nvqs; ++idx) {
+            bool ok = vhost_shadow_vq_start_rcu(dev, idx,
+                                                dev->shadow_vqs[idx]);
+
+            if (!ok) {
+                int stop_idx = idx;
+
+                while (--stop_idx >= 0) {
+                    vhost_shadow_vq_stop_rcu(dev, idx,
+                                             dev->shadow_vqs[stop_idx]);
+                }
+
+                goto err;
+            }
+        }
+    }
+
+    dev->sw_lm_enabled = true;
+    return 0;
+
+err:
+    for (; idx >= 0; --idx) {
+        vhost_shadow_vq_free(dev->shadow_vqs[idx]);
+    }
+    g_free(dev->shadow_vqs[idx]);
+
+    return -1;
+}
+
+static int vhost_sw_live_migration_enable(struct vhost_dev *dev,
+                                          bool enable_lm)
+{
+    int r;
+
+    if (enable_lm == dev->sw_lm_enabled) {
+        return 0;
+    }
+
+    r = enable_lm ? vhost_sw_live_migration_start(dev)
+                  : vhost_sw_live_migration_stop(dev);
+
+    return r;
+}
+
 static void vhost_log_start(MemoryListener *listener,
                             MemoryRegionSection *section,
                             int old, int new)
@@ -1381,6 +1460,7 @@ int vhost_dev_init(struct vhost_dev *hdev, void *opaque,
     hdev->log = NULL;
     hdev->log_size = 0;
     hdev->log_enabled = false;
+    hdev->sw_lm_enabled = false;
     hdev->started = false;
     memory_listener_register(&hdev->memory_listener, &address_space_memory);
     QLIST_INSERT_HEAD(&vhost_devices, hdev, entry);
@@ -1486,6 +1566,10 @@ void vhost_dev_disable_notifiers(struct vhost_dev *hdev, VirtIODevice *vdev)
     BusState *qbus = BUS(qdev_get_parent_bus(DEVICE(vdev)));
     int i, r;
 
+    if (hdev->sw_lm_enabled) {
+        vhost_sw_live_migration_enable(hdev, false);
+    }
+
     for (i = 0; i < hdev->nvqs; ++i) {
         r = virtio_bus_set_host_notifier(VIRTIO_BUS(qbus), hdev->vq_index + i,
                                          false);
@@ -1808,6 +1892,11 @@ void vhost_dev_stop(struct vhost_dev *hdev, VirtIODevice *vdev)
         hdev->vhost_ops->vhost_dev_start(hdev, false);
     }
     for (i = 0; i < hdev->nvqs; ++i) {
+        if (hdev->sw_lm_enabled) {
+            vhost_shadow_vq_stop_rcu(hdev, i, hdev->shadow_vqs[i]);
+            vhost_shadow_vq_free(hdev->shadow_vqs[i]);
+        }
+
         vhost_virtqueue_stop(hdev,
                              vdev,
                              hdev->vqs + i,
@@ -1821,6 +1910,8 @@ void vhost_dev_stop(struct vhost_dev *hdev, VirtIODevice *vdev)
         memory_listener_unregister(&hdev->iommu_listener);
     }
     vhost_log_put(hdev, true);
+    g_free(hdev->shadow_vqs);
+    hdev->sw_lm_enabled = false;
     hdev->started = false;
     hdev->vdev = NULL;
 }
@@ -1837,5 +1928,60 @@ int vhost_net_set_backend(struct vhost_dev *hdev,
 
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


