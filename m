Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCCBA496680
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 21:43:23 +0100 (CET)
Received: from localhost ([::1]:45892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nB0kk-0002s1-Ti
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 15:43:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nB0Z3-0005Qw-G9
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 15:31:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45365)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nB0Yz-0003O0-BI
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 15:31:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642797045;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j67t6TpSga7nlGJsFIRGFk0h9tdDgayDDsYv/VIxliQ=;
 b=P3r7RbeF7H2DeH32+dAdmbeSb8dx28gZlfSSAs6TWU9wCySXk07wm52cpF0Ko3quzYT32B
 /OU687y+5hnoTnmUJvWGUSIuj+ZG9KQ7GgAfnZnoX1uGUWsjbT5jYG0vRHAbdmdeTQt2lg
 7aEIcCCz4qUY9ylr6OUmAgd90YvPuwg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-313-QxYGyxqYP52AXUDqK_tzCw-1; Fri, 21 Jan 2022 15:29:36 -0500
X-MC-Unique: QxYGyxqYP52AXUDqK_tzCw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0AFA3193578C;
 Fri, 21 Jan 2022 20:29:35 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.193.239])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D9E3116A31;
 Fri, 21 Jan 2022 20:28:50 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 01/31] vdpa: Reorder virtio/vhost-vdpa.c functions
Date: Fri, 21 Jan 2022 21:27:03 +0100
Message-Id: <20220121202733.404989-2-eperezma@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
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

vhost_vdpa_set_features and vhost_vdpa_init need to use
vhost_vdpa_get_features in svq mode.

vhost_vdpa_dev_start needs to use almost all _set_ functions:
vhost_vdpa_set_vring_dev_kick, vhost_vdpa_set_vring_dev_call,
vhost_vdpa_set_dev_vring_base and vhost_vdpa_set_dev_vring_num.

No functional change intended.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/virtio/vhost-vdpa.c | 164 ++++++++++++++++++++---------------------
 1 file changed, 82 insertions(+), 82 deletions(-)

diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index 04ea43704f..6c10a7f05f 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -342,41 +342,6 @@ static bool vhost_vdpa_one_time_request(struct vhost_dev *dev)
     return v->index != 0;
 }
 
-static int vhost_vdpa_init(struct vhost_dev *dev, void *opaque, Error **errp)
-{
-    struct vhost_vdpa *v;
-    assert(dev->vhost_ops->backend_type == VHOST_BACKEND_TYPE_VDPA);
-    trace_vhost_vdpa_init(dev, opaque);
-    int ret;
-
-    /*
-     * Similar to VFIO, we end up pinning all guest memory and have to
-     * disable discarding of RAM.
-     */
-    ret = ram_block_discard_disable(true);
-    if (ret) {
-        error_report("Cannot set discarding of RAM broken");
-        return ret;
-    }
-
-    v = opaque;
-    v->dev = dev;
-    dev->opaque =  opaque ;
-    v->listener = vhost_vdpa_memory_listener;
-    v->msg_type = VHOST_IOTLB_MSG_V2;
-
-    vhost_vdpa_get_iova_range(v);
-
-    if (vhost_vdpa_one_time_request(dev)) {
-        return 0;
-    }
-
-    vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_ACKNOWLEDGE |
-                               VIRTIO_CONFIG_S_DRIVER);
-
-    return 0;
-}
-
 static void vhost_vdpa_host_notifier_uninit(struct vhost_dev *dev,
                                             int queue_index)
 {
@@ -506,24 +471,6 @@ static int vhost_vdpa_set_mem_table(struct vhost_dev *dev,
     return 0;
 }
 
-static int vhost_vdpa_set_features(struct vhost_dev *dev,
-                                   uint64_t features)
-{
-    int ret;
-
-    if (vhost_vdpa_one_time_request(dev)) {
-        return 0;
-    }
-
-    trace_vhost_vdpa_set_features(dev, features);
-    ret = vhost_vdpa_call(dev, VHOST_SET_FEATURES, &features);
-    if (ret) {
-        return ret;
-    }
-
-    return vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_FEATURES_OK);
-}
-
 static int vhost_vdpa_set_backend_cap(struct vhost_dev *dev)
 {
     uint64_t features;
@@ -646,35 +593,6 @@ static int vhost_vdpa_get_config(struct vhost_dev *dev, uint8_t *config,
     return ret;
  }
 
-static int vhost_vdpa_dev_start(struct vhost_dev *dev, bool started)
-{
-    struct vhost_vdpa *v = dev->opaque;
-    trace_vhost_vdpa_dev_start(dev, started);
-
-    if (started) {
-        vhost_vdpa_host_notifiers_init(dev);
-        vhost_vdpa_set_vring_ready(dev);
-    } else {
-        vhost_vdpa_host_notifiers_uninit(dev, dev->nvqs);
-    }
-
-    if (dev->vq_index + dev->nvqs != dev->vq_index_end) {
-        return 0;
-    }
-
-    if (started) {
-        memory_listener_register(&v->listener, &address_space_memory);
-        return vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_DRIVER_OK);
-    } else {
-        vhost_vdpa_reset_device(dev);
-        vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_ACKNOWLEDGE |
-                                   VIRTIO_CONFIG_S_DRIVER);
-        memory_listener_unregister(&v->listener);
-
-        return 0;
-    }
-}
-
 static int vhost_vdpa_set_log_base(struct vhost_dev *dev, uint64_t base,
                                      struct vhost_log *log)
 {
@@ -735,6 +653,35 @@ static int vhost_vdpa_set_vring_call(struct vhost_dev *dev,
     return vhost_vdpa_call(dev, VHOST_SET_VRING_CALL, file);
 }
 
+static int vhost_vdpa_dev_start(struct vhost_dev *dev, bool started)
+{
+    struct vhost_vdpa *v = dev->opaque;
+    trace_vhost_vdpa_dev_start(dev, started);
+
+    if (started) {
+        vhost_vdpa_host_notifiers_init(dev);
+        vhost_vdpa_set_vring_ready(dev);
+    } else {
+        vhost_vdpa_host_notifiers_uninit(dev, dev->nvqs);
+    }
+
+    if (dev->vq_index + dev->nvqs != dev->vq_index_end) {
+        return 0;
+    }
+
+    if (started) {
+        memory_listener_register(&v->listener, &address_space_memory);
+        return vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_DRIVER_OK);
+    } else {
+        vhost_vdpa_reset_device(dev);
+        vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_ACKNOWLEDGE |
+                                   VIRTIO_CONFIG_S_DRIVER);
+        memory_listener_unregister(&v->listener);
+
+        return 0;
+    }
+}
+
 static int vhost_vdpa_get_features(struct vhost_dev *dev,
                                      uint64_t *features)
 {
@@ -745,6 +692,24 @@ static int vhost_vdpa_get_features(struct vhost_dev *dev,
     return ret;
 }
 
+static int vhost_vdpa_set_features(struct vhost_dev *dev,
+                                   uint64_t features)
+{
+    int ret;
+
+    if (vhost_vdpa_one_time_request(dev)) {
+        return 0;
+    }
+
+    trace_vhost_vdpa_set_features(dev, features);
+    ret = vhost_vdpa_call(dev, VHOST_SET_FEATURES, &features);
+    if (ret) {
+        return ret;
+    }
+
+    return vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_FEATURES_OK);
+}
+
 static int vhost_vdpa_set_owner(struct vhost_dev *dev)
 {
     if (vhost_vdpa_one_time_request(dev)) {
@@ -772,6 +737,41 @@ static bool  vhost_vdpa_force_iommu(struct vhost_dev *dev)
     return true;
 }
 
+static int vhost_vdpa_init(struct vhost_dev *dev, void *opaque, Error **errp)
+{
+    struct vhost_vdpa *v;
+    assert(dev->vhost_ops->backend_type == VHOST_BACKEND_TYPE_VDPA);
+    trace_vhost_vdpa_init(dev, opaque);
+    int ret;
+
+    /*
+     * Similar to VFIO, we end up pinning all guest memory and have to
+     * disable discarding of RAM.
+     */
+    ret = ram_block_discard_disable(true);
+    if (ret) {
+        error_report("Cannot set discarding of RAM broken");
+        return ret;
+    }
+
+    v = opaque;
+    v->dev = dev;
+    dev->opaque =  opaque ;
+    v->listener = vhost_vdpa_memory_listener;
+    v->msg_type = VHOST_IOTLB_MSG_V2;
+
+    vhost_vdpa_get_iova_range(v);
+
+    if (vhost_vdpa_one_time_request(dev)) {
+        return 0;
+    }
+
+    vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_ACKNOWLEDGE |
+                               VIRTIO_CONFIG_S_DRIVER);
+
+    return 0;
+}
+
 const VhostOps vdpa_ops = {
         .backend_type = VHOST_BACKEND_TYPE_VDPA,
         .vhost_backend_init = vhost_vdpa_init,
-- 
2.27.0


