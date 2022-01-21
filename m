Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C5BF4966A7
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 21:54:37 +0100 (CET)
Received: from localhost ([::1]:34620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nB0vb-0006K0-Vb
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 15:54:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nB0Zv-0006Ze-L4
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 15:32:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23437)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nB0Zt-0003hI-Gi
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 15:32:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642797129;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=idsA5O6IQeCAKLfC1zd6O9SVzjV/Vf6dX/YAqdkQnVg=;
 b=O1OgnSAYjBkCxWPor0sFhVoDw85yLe8h5jYnoB3rH4tMRZ/L+h8y4vPDfRozJnvetWDGHb
 HsIMN+FOjoFE7LO2MbG4BJZYpiPvMbCWDGYBxd33pMPoy3nPUuMlK7jtruYT1/g6vJ+/6h
 BIMcOCu6ElxmxYkCYSrlyj6WIZLYDgI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-445-Cg96zclgNViCv_TfrMrgPA-1; Fri, 21 Jan 2022 15:32:07 -0500
X-MC-Unique: Cg96zclgNViCv_TfrMrgPA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8E6FD1091DA1;
 Fri, 21 Jan 2022 20:32:05 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.193.239])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9CDAD16A31;
 Fri, 21 Jan 2022 20:32:00 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 06/31] vhost: Route guest->host notification through shadow
 virtqueue
Date: Fri, 21 Jan 2022 21:27:08 +0100
Message-Id: <20220121202733.404989-7-eperezma@redhat.com>
In-Reply-To: <20220121202733.404989-1-eperezma@redhat.com>
References: <20220121202733.404989-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Jason Wang <jasowang@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Gautam Dawar <gdawar@xilinx.com>,
 virtualization@lists.linux-foundation.org,
 Eduardo Habkost <ehabkost@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Peter Xu <peterx@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Eli Cohen <eli@mellanox.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, Eric Blake <eblake@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

At this moment no buffer forwarding will be performed in SVQ mode: Qemu
just forward the guest's kicks to the device. This commit also set up
SVQs in the vhost device.

Host memory notifiers regions are left out for simplicity, and they will
not be addressed in this series.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 include/hw/virtio/vhost-vdpa.h |   4 ++
 hw/virtio/vhost-vdpa.c         | 122 ++++++++++++++++++++++++++++++++-
 2 files changed, 124 insertions(+), 2 deletions(-)

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
diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index 6c10a7f05f..18de14f0fb 100644
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
@@ -409,8 +411,14 @@ err:
 
 static void vhost_vdpa_host_notifiers_init(struct vhost_dev *dev)
 {
+    struct vhost_vdpa *v = dev->opaque;
     int i;
 
+    if (v->shadow_vqs_enabled) {
+        /* SVQ is not compatible with host notifiers mr */
+        return;
+    }
+
     for (i = dev->vq_index; i < dev->vq_index + dev->nvqs; i++) {
         if (vhost_vdpa_host_notifier_init(dev, i)) {
             goto err;
@@ -424,6 +432,17 @@ err:
     return;
 }
 
+static void vhost_vdpa_svq_cleanup(struct vhost_dev *dev)
+{
+    struct vhost_vdpa *v = dev->opaque;
+    size_t idx;
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
@@ -432,6 +451,7 @@ static int vhost_vdpa_cleanup(struct vhost_dev *dev)
     trace_vhost_vdpa_cleanup(dev, v);
     vhost_vdpa_host_notifiers_uninit(dev, dev->nvqs);
     memory_listener_unregister(&v->listener);
+    vhost_vdpa_svq_cleanup(dev);
 
     dev->opaque = NULL;
     ram_block_discard_disable(false);
@@ -507,9 +527,15 @@ static int vhost_vdpa_get_device_id(struct vhost_dev *dev,
 
 static int vhost_vdpa_reset_device(struct vhost_dev *dev)
 {
+    struct vhost_vdpa *v = dev->opaque;
     int ret;
     uint8_t status = 0;
 
+    for (unsigned i = 0; i < v->shadow_vqs->len; ++i) {
+        VhostShadowVirtqueue *svq = g_ptr_array_index(v->shadow_vqs, i);
+        vhost_svq_stop(svq);
+    }
+
     ret = vhost_vdpa_call(dev, VHOST_VDPA_SET_STATUS, &status);
     trace_vhost_vdpa_reset_device(dev, status);
     return ret;
@@ -639,13 +665,28 @@ static int vhost_vdpa_get_vring_base(struct vhost_dev *dev,
     return ret;
 }
 
-static int vhost_vdpa_set_vring_kick(struct vhost_dev *dev,
-                                       struct vhost_vring_file *file)
+static int vhost_vdpa_set_vring_dev_kick(struct vhost_dev *dev,
+                                         struct vhost_vring_file *file)
 {
     trace_vhost_vdpa_set_vring_kick(dev, file->index, file->fd);
     return vhost_vdpa_call(dev, VHOST_SET_VRING_KICK, file);
 }
 
+static int vhost_vdpa_set_vring_kick(struct vhost_dev *dev,
+                                       struct vhost_vring_file *file)
+{
+    struct vhost_vdpa *v = dev->opaque;
+    int vdpa_idx = vhost_vdpa_get_vq_index(dev, file->index);
+
+    if (v->shadow_vqs_enabled) {
+        VhostShadowVirtqueue *svq = g_ptr_array_index(v->shadow_vqs, vdpa_idx);
+        vhost_svq_set_svq_kick_fd(svq, file->fd);
+        return 0;
+    } else {
+        return vhost_vdpa_set_vring_dev_kick(dev, file);
+    }
+}
+
 static int vhost_vdpa_set_vring_call(struct vhost_dev *dev,
                                        struct vhost_vring_file *file)
 {
@@ -653,6 +694,33 @@ static int vhost_vdpa_set_vring_call(struct vhost_dev *dev,
     return vhost_vdpa_call(dev, VHOST_SET_VRING_CALL, file);
 }
 
+/**
+ * Set shadow virtqueue descriptors to the device
+ *
+ * @dev   The vhost device model
+ * @svq   The shadow virtqueue
+ * @idx   The index of the virtqueue in the vhost device
+ */
+static bool vhost_vdpa_svq_setup(struct vhost_dev *dev,
+                                VhostShadowVirtqueue *svq,
+                                unsigned idx)
+{
+    struct vhost_vring_file file = {
+        .index = dev->vq_index + idx,
+    };
+    const EventNotifier *event_notifier;
+    int r;
+
+    event_notifier = vhost_svq_get_dev_kick_notifier(svq);
+    file.fd = event_notifier_get_fd(event_notifier);
+    r = vhost_vdpa_set_vring_dev_kick(dev, &file);
+    if (unlikely(r != 0)) {
+        error_report("Can't set device kick fd (%d)", -r);
+    }
+
+    return r == 0;
+}
+
 static int vhost_vdpa_dev_start(struct vhost_dev *dev, bool started)
 {
     struct vhost_vdpa *v = dev->opaque;
@@ -660,6 +728,13 @@ static int vhost_vdpa_dev_start(struct vhost_dev *dev, bool started)
 
     if (started) {
         vhost_vdpa_host_notifiers_init(dev);
+        for (unsigned i = 0; i < v->shadow_vqs->len; ++i) {
+            VhostShadowVirtqueue *svq = g_ptr_array_index(v->shadow_vqs, i);
+            bool ok = vhost_vdpa_svq_setup(dev, svq, i);
+            if (unlikely(!ok)) {
+                return -1;
+            }
+        }
         vhost_vdpa_set_vring_ready(dev);
     } else {
         vhost_vdpa_host_notifiers_uninit(dev, dev->nvqs);
@@ -737,6 +812,41 @@ static bool  vhost_vdpa_force_iommu(struct vhost_dev *dev)
     return true;
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
+static int vhost_vdpa_init_svq(struct vhost_dev *hdev, struct vhost_vdpa *v,
+                               Error **errp)
+{
+    size_t n_svqs = v->shadow_vqs_enabled ? hdev->nvqs : 0;
+    g_autoptr(GPtrArray) shadow_vqs = g_ptr_array_new_full(n_svqs,
+                                                           vhost_psvq_free);
+    if (!v->shadow_vqs_enabled) {
+        goto out;
+    }
+
+    for (unsigned n = 0; n < hdev->nvqs; ++n) {
+        VhostShadowVirtqueue *svq = vhost_svq_new();
+
+        if (unlikely(!svq)) {
+            error_setg(errp, "Cannot create svq %u", n);
+            return -1;
+        }
+        g_ptr_array_add(v->shadow_vqs, svq);
+    }
+
+out:
+    v->shadow_vqs = g_steal_pointer(&shadow_vqs);
+    return 0;
+}
+
 static int vhost_vdpa_init(struct vhost_dev *dev, void *opaque, Error **errp)
 {
     struct vhost_vdpa *v;
@@ -759,6 +869,10 @@ static int vhost_vdpa_init(struct vhost_dev *dev, void *opaque, Error **errp)
     dev->opaque =  opaque ;
     v->listener = vhost_vdpa_memory_listener;
     v->msg_type = VHOST_IOTLB_MSG_V2;
+    ret = vhost_vdpa_init_svq(dev, v, errp);
+    if (ret) {
+        goto err;
+    }
 
     vhost_vdpa_get_iova_range(v);
 
@@ -770,6 +884,10 @@ static int vhost_vdpa_init(struct vhost_dev *dev, void *opaque, Error **errp)
                                VIRTIO_CONFIG_S_DRIVER);
 
     return 0;
+
+err:
+    ram_block_discard_disable(false);
+    return ret;
 }
 
 const VhostOps vdpa_ops = {
-- 
2.27.0


