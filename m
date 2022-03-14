Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41E1C4D8B01
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 18:44:05 +0100 (CET)
Received: from localhost ([::1]:33266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTojk-0006Fn-9S
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 13:44:04 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nTobJ-0005hy-1S
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 13:35:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34059)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nTobB-0007cL-D5
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 13:35:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647279303;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3V4tkmM9/rK3dllItlBvbFFgHBWQs+y5F9ByohU0QKM=;
 b=JkHtBgC2gU5G3j0+WmpSW8bHLgLMJ5XUtSpm+2MJ2sxCKOhm+zwf1TCu3epLB8ePJx5QFq
 yPPctLy5ctQ1pZ+YQSmMsm7NW5vrbk2Gbvhv3CDCVP2+svUgyh8tCjvZcogfRzuc1cj19z
 wGn/NYR9wBNZliauABjyMk1XN7pOdB0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-471-yvv1P-d1PA2jC_JRN19ilg-1; Mon, 14 Mar 2022 13:35:01 -0400
X-MC-Unique: yvv1P-d1PA2jC_JRN19ilg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A7B963C01BB2
 for <qemu-devel@nongnu.org>; Mon, 14 Mar 2022 17:35:01 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.194.201])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E93864B8D5B;
 Mon, 14 Mar 2022 17:35:00 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 02/15] vhost: Add Shadow VirtQueue kick forwarding
 capabilities
Date: Mon, 14 Mar 2022 18:34:42 +0100
Message-Id: <20220314173455.200342-3-eperezma@redhat.com>
In-Reply-To: <20220314173455.200342-1-eperezma@redhat.com>
References: <20220314173455.200342-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
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
Cc: Jason Wang <jasowang@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

At this mode no buffer forwarding will be performed in SVQ mode: Qemu
will just forward the guest's kicks to the device.

Host memory notifiers regions are left out for simplicity, and they will
not be addressed in this series.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/virtio/vhost-shadow-virtqueue.h |  14 +++
 include/hw/virtio/vhost-vdpa.h     |   4 +
 hw/virtio/vhost-shadow-virtqueue.c |  55 +++++++++++
 hw/virtio/vhost-vdpa.c             | 144 ++++++++++++++++++++++++++++-
 4 files changed, 215 insertions(+), 2 deletions(-)

diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost-shadow-virtqueue.h
index f1519e3c7b..1cbc87d5d8 100644
--- a/hw/virtio/vhost-shadow-virtqueue.h
+++ b/hw/virtio/vhost-shadow-virtqueue.h
@@ -18,8 +18,22 @@ typedef struct VhostShadowVirtqueue {
     EventNotifier hdev_kick;
     /* Shadow call notifier, sent to vhost */
     EventNotifier hdev_call;
+
+    /*
+     * Borrowed virtqueue's guest to host notifier. To borrow it in this event
+     * notifier allows to recover the VhostShadowVirtqueue from the event loop
+     * easily. If we use the VirtQueue's one, we don't have an easy way to
+     * retrieve VhostShadowVirtqueue.
+     *
+     * So shadow virtqueue must not clean it, or we would lose VirtQueue one.
+     */
+    EventNotifier svq_kick;
 } VhostShadowVirtqueue;
 
+void vhost_svq_set_svq_kick_fd(VhostShadowVirtqueue *svq, int svq_kick_fd);
+
+void vhost_svq_stop(VhostShadowVirtqueue *svq);
+
 VhostShadowVirtqueue *vhost_svq_new(void);
 
 void vhost_svq_free(gpointer vq);
diff --git a/include/hw/virtio/vhost-vdpa.h b/include/hw/virtio/vhost-vdpa.h
index 3ce79a646d..009a9f3b6b 100644
--- a/include/hw/virtio/vhost-vdpa.h
+++ b/include/hw/virtio/vhost-vdpa.h
@@ -12,6 +12,8 @@
 #ifndef HW_VIRTIO_VHOST_VDPA_H
 #define HW_VIRTIO_VHOST_VDPA_H
 
+#include <gmodule.h>
+
 #include "hw/virtio/virtio.h"
 #include "standard-headers/linux/vhost_types.h"
 
@@ -27,6 +29,8 @@ typedef struct vhost_vdpa {
     bool iotlb_batch_begin_sent;
     MemoryListener listener;
     struct vhost_vdpa_iova_range iova_range;
+    bool shadow_vqs_enabled;
+    GPtrArray *shadow_vqs;
     struct vhost_dev *dev;
     VhostVDPAHostNotifier notifier[VIRTIO_QUEUE_MAX];
 } VhostVDPA;
diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
index c1db02c53e..e5da907b8e 100644
--- a/hw/virtio/vhost-shadow-virtqueue.c
+++ b/hw/virtio/vhost-shadow-virtqueue.c
@@ -11,6 +11,59 @@
 #include "hw/virtio/vhost-shadow-virtqueue.h"
 
 #include "qemu/error-report.h"
+#include "qemu/main-loop.h"
+#include "linux-headers/linux/vhost.h"
+
+/**
+ * Forward guest notifications.
+ *
+ * @n: guest kick event notifier, the one that guest set to notify svq.
+ */
+static void vhost_handle_guest_kick(EventNotifier *n)
+{
+    VhostShadowVirtqueue *svq = container_of(n, VhostShadowVirtqueue, svq_kick);
+    event_notifier_test_and_clear(n);
+    event_notifier_set(&svq->hdev_kick);
+}
+
+/**
+ * Set a new file descriptor for the guest to kick the SVQ and notify for avail
+ *
+ * @svq: The svq
+ * @svq_kick_fd: The svq kick fd
+ *
+ * Note that the SVQ will never close the old file descriptor.
+ */
+void vhost_svq_set_svq_kick_fd(VhostShadowVirtqueue *svq, int svq_kick_fd)
+{
+    EventNotifier *svq_kick = &svq->svq_kick;
+    bool poll_stop = VHOST_FILE_UNBIND != event_notifier_get_fd(svq_kick);
+    bool poll_start = svq_kick_fd != VHOST_FILE_UNBIND;
+
+    if (poll_stop) {
+        event_notifier_set_handler(svq_kick, NULL);
+    }
+
+    /*
+     * event_notifier_set_handler already checks for guest's notifications if
+     * they arrive at the new file descriptor in the switch, so there is no
+     * need to explicitly check for them.
+     */
+    if (poll_start) {
+        event_notifier_init_fd(svq_kick, svq_kick_fd);
+        event_notifier_set(svq_kick);
+        event_notifier_set_handler(svq_kick, vhost_handle_guest_kick);
+    }
+}
+
+/**
+ * Stop the shadow virtqueue operation.
+ * @svq: Shadow Virtqueue
+ */
+void vhost_svq_stop(VhostShadowVirtqueue *svq)
+{
+    event_notifier_set_handler(&svq->svq_kick, NULL);
+}
 
 /**
  * Creates vhost shadow virtqueue, and instructs the vhost device to use the
@@ -39,6 +92,7 @@ VhostShadowVirtqueue *vhost_svq_new(void)
         goto err_init_hdev_call;
     }
 
+    event_notifier_init_fd(&svq->svq_kick, VHOST_FILE_UNBIND);
     return g_steal_pointer(&svq);
 
 err_init_hdev_call:
@@ -56,6 +110,7 @@ err_init_hdev_kick:
 void vhost_svq_free(gpointer pvq)
 {
     VhostShadowVirtqueue *vq = pvq;
+    vhost_svq_stop(vq);
     event_notifier_cleanup(&vq->hdev_kick);
     event_notifier_cleanup(&vq->hdev_call);
     g_free(vq);
diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index 6c67d5f034..9c7cb32bdd 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -17,12 +17,14 @@
 #include "hw/virtio/vhost.h"
 #include "hw/virtio/vhost-backend.h"
 #include "hw/virtio/virtio-net.h"
+#include "hw/virtio/vhost-shadow-virtqueue.h"
 #include "hw/virtio/vhost-vdpa.h"
 #include "exec/address-spaces.h"
 #include "qemu/main-loop.h"
 #include "cpu.h"
 #include "trace.h"
 #include "qemu-common.h"
+#include "qapi/error.h"
 
 /*
  * Return one past the end of the end of section. Be careful with uint64_t
@@ -342,6 +344,30 @@ static bool vhost_vdpa_one_time_request(struct vhost_dev *dev)
     return v->index != 0;
 }
 
+static int vhost_vdpa_init_svq(struct vhost_dev *hdev, struct vhost_vdpa *v,
+                               Error **errp)
+{
+    g_autoptr(GPtrArray) shadow_vqs = NULL;
+
+    if (!v->shadow_vqs_enabled) {
+        return 0;
+    }
+
+    shadow_vqs = g_ptr_array_new_full(hdev->nvqs, vhost_svq_free);
+    for (unsigned n = 0; n < hdev->nvqs; ++n) {
+        g_autoptr(VhostShadowVirtqueue) svq = vhost_svq_new();
+
+        if (unlikely(!svq)) {
+            error_setg(errp, "Cannot create svq %u", n);
+            return -1;
+        }
+        g_ptr_array_add(shadow_vqs, g_steal_pointer(&svq));
+    }
+
+    v->shadow_vqs = g_steal_pointer(&shadow_vqs);
+    return 0;
+}
+
 static int vhost_vdpa_init(struct vhost_dev *dev, void *opaque, Error **errp)
 {
     struct vhost_vdpa *v;
@@ -364,6 +390,10 @@ static int vhost_vdpa_init(struct vhost_dev *dev, void *opaque, Error **errp)
     dev->opaque =  opaque ;
     v->listener = vhost_vdpa_memory_listener;
     v->msg_type = VHOST_IOTLB_MSG_V2;
+    ret = vhost_vdpa_init_svq(dev, v, errp);
+    if (ret) {
+        goto err;
+    }
 
     vhost_vdpa_get_iova_range(v);
 
@@ -375,6 +405,10 @@ static int vhost_vdpa_init(struct vhost_dev *dev, void *opaque, Error **errp)
                                VIRTIO_CONFIG_S_DRIVER);
 
     return 0;
+
+err:
+    ram_block_discard_disable(false);
+    return ret;
 }
 
 static void vhost_vdpa_host_notifier_uninit(struct vhost_dev *dev,
@@ -445,8 +479,14 @@ static void vhost_vdpa_host_notifiers_uninit(struct vhost_dev *dev, int n)
 
 static void vhost_vdpa_host_notifiers_init(struct vhost_dev *dev)
 {
+    struct vhost_vdpa *v = dev->opaque;
     int i;
 
+    if (v->shadow_vqs_enabled) {
+        /* FIXME SVQ is not compatible with host notifiers mr */
+        return;
+    }
+
     for (i = dev->vq_index; i < dev->vq_index + dev->nvqs; i++) {
         if (vhost_vdpa_host_notifier_init(dev, i)) {
             goto err;
@@ -460,6 +500,21 @@ err:
     return;
 }
 
+static void vhost_vdpa_svq_cleanup(struct vhost_dev *dev)
+{
+    struct vhost_vdpa *v = dev->opaque;
+    size_t idx;
+
+    if (!v->shadow_vqs) {
+        return;
+    }
+
+    for (idx = 0; idx < v->shadow_vqs->len; ++idx) {
+        vhost_svq_stop(g_ptr_array_index(v->shadow_vqs, idx));
+    }
+    g_ptr_array_free(v->shadow_vqs, true);
+}
+
 static int vhost_vdpa_cleanup(struct vhost_dev *dev)
 {
     struct vhost_vdpa *v;
@@ -468,6 +523,7 @@ static int vhost_vdpa_cleanup(struct vhost_dev *dev)
     trace_vhost_vdpa_cleanup(dev, v);
     vhost_vdpa_host_notifiers_uninit(dev, dev->nvqs);
     memory_listener_unregister(&v->listener);
+    vhost_vdpa_svq_cleanup(dev);
 
     dev->opaque = NULL;
     ram_block_discard_disable(false);
@@ -559,11 +615,26 @@ static int vhost_vdpa_get_device_id(struct vhost_dev *dev,
     return ret;
 }
 
+static void vhost_vdpa_reset_svq(struct vhost_vdpa *v)
+{
+    if (!v->shadow_vqs_enabled) {
+        return;
+    }
+
+    for (unsigned i = 0; i < v->shadow_vqs->len; ++i) {
+        VhostShadowVirtqueue *svq = g_ptr_array_index(v->shadow_vqs, i);
+        vhost_svq_stop(svq);
+    }
+}
+
 static int vhost_vdpa_reset_device(struct vhost_dev *dev)
 {
+    struct vhost_vdpa *v = dev->opaque;
     int ret;
     uint8_t status = 0;
 
+    vhost_vdpa_reset_svq(v);
+
     ret = vhost_vdpa_call(dev, VHOST_VDPA_SET_STATUS, &status);
     trace_vhost_vdpa_reset_device(dev, status);
     return ret;
@@ -647,13 +718,74 @@ static int vhost_vdpa_get_config(struct vhost_dev *dev, uint8_t *config,
     return ret;
  }
 
+static int vhost_vdpa_set_vring_dev_kick(struct vhost_dev *dev,
+                                         struct vhost_vring_file *file)
+{
+    trace_vhost_vdpa_set_vring_kick(dev, file->index, file->fd);
+    return vhost_vdpa_call(dev, VHOST_SET_VRING_KICK, file);
+}
+
+/**
+ * Set the shadow virtqueue descriptors to the device
+ *
+ * @dev: The vhost device model
+ * @svq: The shadow virtqueue
+ * @idx: The index of the virtqueue in the vhost device
+ * @errp: Error
+ */
+static bool vhost_vdpa_svq_setup(struct vhost_dev *dev,
+                                 VhostShadowVirtqueue *svq, unsigned idx,
+                                 Error **errp)
+{
+    struct vhost_vring_file file = {
+        .index = dev->vq_index + idx,
+    };
+    const EventNotifier *event_notifier = &svq->hdev_kick;
+    int r;
+
+    file.fd = event_notifier_get_fd(event_notifier);
+    r = vhost_vdpa_set_vring_dev_kick(dev, &file);
+    if (unlikely(r != 0)) {
+        error_setg_errno(errp, -r, "Can't set device kick fd");
+    }
+
+    return r == 0;
+}
+
+static bool vhost_vdpa_svqs_start(struct vhost_dev *dev)
+{
+    struct vhost_vdpa *v = dev->opaque;
+    Error *err = NULL;
+    unsigned i;
+
+    if (!v->shadow_vqs) {
+        return true;
+    }
+
+    for (i = 0; i < v->shadow_vqs->len; ++i) {
+        VhostShadowVirtqueue *svq = g_ptr_array_index(v->shadow_vqs, i);
+        bool ok = vhost_vdpa_svq_setup(dev, svq, i, &err);
+        if (unlikely(!ok)) {
+            error_reportf_err(err, "Cannot setup SVQ %u: ", i);
+            return false;
+        }
+    }
+
+    return true;
+}
+
 static int vhost_vdpa_dev_start(struct vhost_dev *dev, bool started)
 {
     struct vhost_vdpa *v = dev->opaque;
+    bool ok;
     trace_vhost_vdpa_dev_start(dev, started);
 
     if (started) {
         vhost_vdpa_host_notifiers_init(dev);
+        ok = vhost_vdpa_svqs_start(dev);
+        if (unlikely(!ok)) {
+            return -1;
+        }
         vhost_vdpa_set_vring_ready(dev);
     } else {
         vhost_vdpa_host_notifiers_uninit(dev, dev->nvqs);
@@ -725,8 +857,16 @@ static int vhost_vdpa_get_vring_base(struct vhost_dev *dev,
 static int vhost_vdpa_set_vring_kick(struct vhost_dev *dev,
                                        struct vhost_vring_file *file)
 {
-    trace_vhost_vdpa_set_vring_kick(dev, file->index, file->fd);
-    return vhost_vdpa_call(dev, VHOST_SET_VRING_KICK, file);
+    struct vhost_vdpa *v = dev->opaque;
+    int vdpa_idx = file->index - dev->vq_index;
+
+    if (v->shadow_vqs_enabled) {
+        VhostShadowVirtqueue *svq = g_ptr_array_index(v->shadow_vqs, vdpa_idx);
+        vhost_svq_set_svq_kick_fd(svq, file->fd);
+        return 0;
+    } else {
+        return vhost_vdpa_set_vring_dev_kick(dev, file);
+    }
 }
 
 static int vhost_vdpa_set_vring_call(struct vhost_dev *dev,
-- 
2.27.0


