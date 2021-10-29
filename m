Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B88B4402A4
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 20:59:03 +0200 (CEST)
Received: from localhost ([::1]:45298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgX5i-0007zr-11
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 14:59:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mgWmC-0004bL-7P
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 14:38:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30738)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mgWm9-0000gw-N7
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 14:38:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635532728;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K6ejgnOcL/Ooyo7TaWZcM2KXGoXIn+m4eMhazrdfuM0=;
 b=E19IMLgKc1MmYg6bhexCQbzln2wgIhVJIMioTjnstoNVmyy2PbX/kV5kvmV6lKWdyk4Ubu
 ItF+b8ermRfrhd0Hv+A0BW8XbO/63Yq6R4XMRhil24BVkNSjQAqGYwxHhxL0mJqSl/Y2tG
 eCSQO7AGIRSYvft7KUwl6xqtc6enZLU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-131-NJxm0sGcPkyZHA9fPP5y-g-1; Fri, 29 Oct 2021 14:38:45 -0400
X-MC-Unique: NJxm0sGcPkyZHA9fPP5y-g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 01F8D10A8E06;
 Fri, 29 Oct 2021 18:38:44 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.75])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E9C295D6CF;
 Fri, 29 Oct 2021 18:38:19 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v5 12/26] vhost: Route guest->host notification through
 shadow virtqueue
Date: Fri, 29 Oct 2021 20:35:11 +0200
Message-Id: <20211029183525.1776416-13-eperezma@redhat.com>
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
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

At this mode no buffer forwarding will be performed in SVQ mode: Qemu
just forward the guest's kicks to the device.

Shadow virtqueue notifications forwarding is disabled when vhost_dev
stops, so code flow follows usual cleanup.

Also, host notifiers must be disabled at SVQ start, and they will not
start if SVQ has been enabled when device is stopped. This is trivial
to address, but it is left out for simplicity at this moment.

This is an intermediate step before introduce the full SVQ mode, useful
to test if the device is playing well with notifications forwarding.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 qapi/net.json                  |   5 +-
 include/hw/virtio/vhost-vdpa.h |   6 ++
 hw/virtio/vhost-vdpa.c         | 183 ++++++++++++++++++++++++++++++++-
 net/vhost-vdpa.c               |  24 ++++-
 4 files changed, 210 insertions(+), 8 deletions(-)

diff --git a/qapi/net.json b/qapi/net.json
index b191b6787b..fca2f6ebca 100644
--- a/qapi/net.json
+++ b/qapi/net.json
@@ -84,12 +84,13 @@
 #
 # Use vhost shadow virtqueue.
 #
+# SVQ can just forward notifications between the device and the guest at this
+# moment. This will expand in future changes.
+#
 # @name: the device name of the VirtIO device
 #
 # @set: true to use the alternate shadow VQ notifications
 #
-# Returns: Always error, since SVQ is not implemented at the moment.
-#
 # Since: 6.2
 #
 # Example:
diff --git a/include/hw/virtio/vhost-vdpa.h b/include/hw/virtio/vhost-vdpa.h
index c79a21c3c8..6d60092c96 100644
--- a/include/hw/virtio/vhost-vdpa.h
+++ b/include/hw/virtio/vhost-vdpa.h
@@ -12,6 +12,8 @@
 #ifndef HW_VIRTIO_VHOST_VDPA_H
 #define HW_VIRTIO_VHOST_VDPA_H
 
+#include <gmodule.h>
+
 #include "hw/virtio/virtio.h"
 #include "standard-headers/linux/vhost_types.h"
 
@@ -27,9 +29,13 @@ typedef struct vhost_vdpa {
     bool iotlb_batch_begin_sent;
     MemoryListener listener;
     struct vhost_vdpa_iova_range iova_range;
+    bool shadow_vqs_enabled;
+    GPtrArray *shadow_vqs;
     struct vhost_dev *dev;
     int kick_fd[VIRTIO_QUEUE_MAX];
     VhostVDPAHostNotifier notifier[VIRTIO_QUEUE_MAX];
 } VhostVDPA;
 
+void vhost_vdpa_enable_svq(struct vhost_vdpa *v, bool enable, Error **errp);
+
 #endif
diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index e6ee227385..c388705e73 100644
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
@@ -326,6 +328,16 @@ static bool vhost_vdpa_one_time_request(struct vhost_dev *dev)
     return v->index != 0;
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
@@ -337,6 +349,7 @@ static int vhost_vdpa_init(struct vhost_dev *dev, void *opaque, Error **errp)
     dev->opaque =  opaque ;
     v->listener = vhost_vdpa_memory_listener;
     v->msg_type = VHOST_IOTLB_MSG_V2;
+    v->shadow_vqs = g_ptr_array_new_full(dev->nvqs, vhost_psvq_free);
 
     vhost_vdpa_get_iova_range(v);
 
@@ -361,7 +374,13 @@ static void vhost_vdpa_host_notifier_uninit(struct vhost_dev *dev,
     n = &v->notifier[queue_index];
 
     if (n->addr) {
-        virtio_queue_set_host_notifier_mr(vdev, queue_index, &n->mr, false);
+        if (v->shadow_vqs_enabled) {
+            VhostShadowVirtqueue *svq = g_ptr_array_index(v->shadow_vqs,
+                                                          queue_index);
+            vhost_svq_set_host_mr_notifier(svq, NULL);
+        } else {
+            virtio_queue_set_host_notifier_mr(vdev, queue_index, &n->mr, false);
+        }
         object_unparent(OBJECT(&n->mr));
         munmap(n->addr, page_size);
         n->addr = NULL;
@@ -403,7 +422,12 @@ static int vhost_vdpa_host_notifier_init(struct vhost_dev *dev, int queue_index)
                                       page_size, addr);
     g_free(name);
 
-    if (virtio_queue_set_host_notifier_mr(vdev, queue_index, &n->mr, true)) {
+    if (v->shadow_vqs_enabled) {
+        VhostShadowVirtqueue *svq = g_ptr_array_index(v->shadow_vqs,
+                                                      queue_index);
+        vhost_svq_set_host_mr_notifier(svq, addr);
+    } else if (virtio_queue_set_host_notifier_mr(vdev, queue_index, &n->mr,
+                                                 true)) {
         munmap(addr, page_size);
         goto err;
     }
@@ -432,6 +456,17 @@ err:
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
@@ -440,6 +475,7 @@ static int vhost_vdpa_cleanup(struct vhost_dev *dev)
     trace_vhost_vdpa_cleanup(dev, v);
     vhost_vdpa_host_notifiers_uninit(dev, dev->nvqs);
     memory_listener_unregister(&v->listener);
+    vhost_vdpa_svq_cleanup(dev);
 
     dev->opaque = NULL;
     return 0;
@@ -699,16 +735,27 @@ static int vhost_vdpa_get_vring_base(struct vhost_dev *dev,
     return ret;
 }
 
+static int vhost_vdpa_set_vring_dev_kick(struct vhost_dev *dev,
+                                         struct vhost_vring_file *file)
+{
+    trace_vhost_vdpa_set_vring_kick(dev, file->index, file->fd);
+    return vhost_vdpa_call(dev, VHOST_SET_VRING_KICK, file);
+}
+
 static int vhost_vdpa_set_vring_kick(struct vhost_dev *dev,
                                        struct vhost_vring_file *file)
 {
     struct vhost_vdpa *v = dev->opaque;
     int vdpa_idx = vhost_vdpa_get_vq_index(dev, file->index);
 
-    trace_vhost_vdpa_set_vring_kick(dev, file->index, file->fd);
-
     v->kick_fd[vdpa_idx] = file->fd;
-    return vhost_vdpa_call(dev, VHOST_SET_VRING_KICK, file);
+    if (v->shadow_vqs_enabled) {
+        VhostShadowVirtqueue *svq = g_ptr_array_index(v->shadow_vqs, vdpa_idx);
+        vhost_svq_set_svq_kick_fd(svq, file->fd);
+        return 0;
+    } else {
+        return vhost_vdpa_set_vring_dev_kick(dev, file);
+    }
 }
 
 static int vhost_vdpa_set_vring_call(struct vhost_dev *dev,
@@ -755,6 +802,132 @@ static bool  vhost_vdpa_force_iommu(struct vhost_dev *dev)
     return true;
 }
 
+/*
+ * Start or stop a shadow virtqueue in a vdpa device
+ *
+ * @dev Vhost device
+ * @idx Vhost device model queue index
+ * @svq_mode Shadow virtqueue mode
+ * @errp Error if any
+ *
+ * The function will not fall back previous values to vhost-vdpa device, so in
+ * case of a failure setting again the device properties calling this function
+ * with the negated svq_mode is needed.
+ */
+static bool vhost_vdpa_svq_start_vq(struct vhost_dev *dev, unsigned idx,
+                                    bool svq_mode, Error **errp)
+{
+    struct vhost_vdpa *v = dev->opaque;
+    VhostShadowVirtqueue *svq = g_ptr_array_index(v->shadow_vqs, idx);
+    VhostVDPAHostNotifier *n = &v->notifier[idx];
+    unsigned vq_index = idx + dev->vq_index;
+    struct vhost_vring_file vhost_kick_file = {
+        .index = vq_index,
+    };
+    int r;
+
+    if (svq_mode) {
+        const EventNotifier *vhost_kick = vhost_svq_get_dev_kick_notifier(svq);
+
+        if (n->addr) {
+            r = virtio_queue_set_host_notifier_mr(dev->vdev, idx, &n->mr,
+                                                  false);
+
+            /*
+             * vhost_vdpa_host_notifier_init already validated as a proper
+             * host notifier memory region
+             */
+            assert(r == 0);
+            vhost_svq_set_host_mr_notifier(svq, n->addr);
+        }
+        vhost_svq_start(dev, idx, svq, v->kick_fd[idx]);
+
+        vhost_kick_file.fd = event_notifier_get_fd(vhost_kick);
+    } else {
+        vhost_svq_stop(dev, idx, svq);
+
+        if (n->addr) {
+            r = virtio_queue_set_host_notifier_mr(dev->vdev, idx, &n->mr,
+                                                  true);
+            /*
+             * vhost_vdpa_host_notifier_init already validated as a proper
+             * host notifier memory region
+             */
+            assert(r == 0);
+        }
+        vhost_kick_file.fd = v->kick_fd[idx];
+    }
+
+    r = vhost_vdpa_set_vring_dev_kick(dev, &vhost_kick_file);
+    if (unlikely(r)) {
+        error_setg_errno(errp, -r, "vhost_vdpa_set_vring_kick failed");
+        return false;
+    }
+
+    return true;
+}
+
+/**
+ * Enable or disable shadow virtqueue in a vhost vdpa device.
+ *
+ * This function is idempotent, to call it many times with the same value for
+ * enable_svq will simply return success.
+ *
+ * @v       Vhost vdpa device
+ * @enable  True to set SVQ mode
+ * @errp    Error pointer
+ */
+void vhost_vdpa_enable_svq(struct vhost_vdpa *v, bool enable, Error **errp)
+{
+    struct vhost_dev *hdev = v->dev;
+    unsigned n;
+    ERRP_GUARD();
+
+    if (enable == v->shadow_vqs_enabled) {
+        return;
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
+                error_setg(errp, "Cannot create svq");
+                enable = false;
+                goto err_svq_new;
+            }
+            g_ptr_array_add(v->shadow_vqs, svq);
+
+            ok = vhost_vdpa_svq_start_vq(hdev, n, true, errp);
+            if (unlikely(!ok)) {
+                /* Free still not started svqs, and go with disable path */
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
+            vhost_vdpa_svq_start_vq(hdev, n, false, *errp ? NULL : errp);
+        }
+
+    }
+
+err_svq_new:
+    if (!enable) {
+        /* Resources cleanup */
+        g_ptr_array_set_size(v->shadow_vqs, 0);
+    }
+}
+
 const VhostOps vdpa_ops = {
         .backend_type = VHOST_BACKEND_TYPE_VDPA,
         .vhost_backend_init = vhost_vdpa_init,
diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index 3b360da27d..325971d8da 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -305,5 +305,27 @@ err:
 
 void qmp_x_vhost_set_shadow_vq(const char *name, bool set, Error **errp)
 {
-    error_setg(errp, "Shadow virtqueue still not implemented");
+    NetClientState *ncs;
+    int queues;
+    ERRP_GUARD();
+
+    queues = qemu_find_net_clients_except(name, &ncs,
+                                          NET_CLIENT_DRIVER_NIC, 1);
+
+    if (!queues) {
+        error_setg(errp, "Device not found");
+    } else if (ncs->info->type != NET_CLIENT_DRIVER_VHOST_VDPA) {
+        error_setg(errp, "Device type is not vdpa");
+    } else if (queues > 1) {
+        error_setg(errp, "Device has control virtqueue");
+    } else {
+        VhostVDPAState *s = DO_UPCAST(VhostVDPAState, nc, ncs);
+        struct vhost_vdpa *v = &s->vhost_vdpa;
+
+        vhost_vdpa_enable_svq(v, set, errp);
+    }
+
+    if (*errp) {
+        error_prepend(errp, "Can't set shadow vq on %s: ", name);
+    }
 }
-- 
2.27.0


