Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BAFF667C8A
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 18:31:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pG1K4-0006cJ-A1; Thu, 12 Jan 2023 12:25:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pG1K1-0006aK-SR
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 12:25:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pG1K0-0008Fh-0p
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 12:25:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673544299;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nYcFDZQuxT8/AMv4CeTT3PJQmkzddtBExbKUq1RE9cQ=;
 b=COhb8+mAy+ULZDZYWVp3oJo79elh292tGv/MBe0bi5OcPKs5ne7m4aTneVEh7SnTrJPc3A
 Nx3DUIl8sJ0WjSdk/KXzCg4Xuv91zOp4JczSr0bU0+uoBE9kebzA2DlImD7BbNR+Q2/CnN
 88gphvU/FtY8gvtaXtBFspqIw3oY4FQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-227-IxgshAdMOluuqX5IwncfsQ-1; Thu, 12 Jan 2023 12:24:54 -0500
X-MC-Unique: IxgshAdMOluuqX5IwncfsQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E84F71C0512F;
 Thu, 12 Jan 2023 17:24:53 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C6A404078903;
 Thu, 12 Jan 2023 17:24:50 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: si-wei.liu@oracle.com, Liuxiangdong <liuxiangdong5@huawei.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, alvaro.karsz@solid-run.com,
 Shannon Nelson <snelson@pensando.io>, Laurent Vivier <lvivier@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Gautam Dawar <gdawar@xilinx.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Cindy Lu <lulu@redhat.com>,
 Eli Cohen <eli@mellanox.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Parav Pandit <parav@mellanox.com>
Subject: [RFC v2 04/13] vdpa: rewind at get_base, not set_base
Date: Thu, 12 Jan 2023 18:24:25 +0100
Message-Id: <20230112172434.760850-5-eperezma@redhat.com>
In-Reply-To: <20230112172434.760850-1-eperezma@redhat.com>
References: <20230112172434.760850-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

At this moment it is only possible to migrate to a vdpa device running
with x-svq=on. As a protective measure, the rewind of the inflight
descriptors was done at the destination. That way if the source sent a
virtqueue with inuse descriptors they are always discarded.

Since this series allows to migrate also to passthrough devices with no
SVQ, the right thing to do is to rewind at the source so base of vrings
are correct.

Support for inflight descriptors may be added in the future.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 include/hw/virtio/vhost-backend.h |  4 +++
 hw/virtio/vhost-vdpa.c            | 46 +++++++++++++++++++------------
 hw/virtio/vhost.c                 |  3 ++
 3 files changed, 36 insertions(+), 17 deletions(-)

diff --git a/include/hw/virtio/vhost-backend.h b/include/hw/virtio/vhost-backend.h
index c5ab49051e..ec3fbae58d 100644
--- a/include/hw/virtio/vhost-backend.h
+++ b/include/hw/virtio/vhost-backend.h
@@ -130,6 +130,9 @@ typedef bool (*vhost_force_iommu_op)(struct vhost_dev *dev);
 
 typedef int (*vhost_set_config_call_op)(struct vhost_dev *dev,
                                        int fd);
+
+typedef void (*vhost_reset_status_op)(struct vhost_dev *dev);
+
 typedef struct VhostOps {
     VhostBackendType backend_type;
     vhost_backend_init vhost_backend_init;
@@ -177,6 +180,7 @@ typedef struct VhostOps {
     vhost_get_device_id_op vhost_get_device_id;
     vhost_force_iommu_op vhost_force_iommu;
     vhost_set_config_call_op vhost_set_config_call;
+    vhost_reset_status_op vhost_reset_status;
 } VhostOps;
 
 int vhost_backend_update_device_iotlb(struct vhost_dev *dev,
diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index 542e003101..28a52ddc78 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -1132,14 +1132,23 @@ static int vhost_vdpa_dev_start(struct vhost_dev *dev, bool started)
     if (started) {
         memory_listener_register(&v->listener, &address_space_memory);
         return vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_DRIVER_OK);
-    } else {
-        vhost_vdpa_reset_device(dev);
-        vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_ACKNOWLEDGE |
-                                   VIRTIO_CONFIG_S_DRIVER);
-        memory_listener_unregister(&v->listener);
+    }
 
-        return 0;
+    return 0;
+}
+
+static void vhost_vdpa_reset_status(struct vhost_dev *dev)
+{
+    struct vhost_vdpa *v = dev->opaque;
+
+    if (dev->vq_index + dev->nvqs != dev->vq_index_end) {
+        return;
     }
+
+    vhost_vdpa_reset_device(dev);
+    vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_ACKNOWLEDGE |
+                                VIRTIO_CONFIG_S_DRIVER);
+    memory_listener_unregister(&v->listener);
 }
 
 static int vhost_vdpa_set_log_base(struct vhost_dev *dev, uint64_t base,
@@ -1182,18 +1191,7 @@ static int vhost_vdpa_set_vring_base(struct vhost_dev *dev,
                                        struct vhost_vring_state *ring)
 {
     struct vhost_vdpa *v = dev->opaque;
-    VirtQueue *vq = virtio_get_queue(dev->vdev, ring->index);
 
-    /*
-     * vhost-vdpa devices does not support in-flight requests. Set all of them
-     * as available.
-     *
-     * TODO: This is ok for networking, but other kinds of devices might
-     * have problems with these retransmissions.
-     */
-    while (virtqueue_rewind(vq, 1)) {
-        continue;
-    }
     if (v->shadow_vqs_enabled) {
         /*
          * Device vring base was set at device start. SVQ base is handled by
@@ -1212,6 +1210,19 @@ static int vhost_vdpa_get_vring_base(struct vhost_dev *dev,
     int ret;
 
     if (v->shadow_vqs_enabled) {
+        VirtQueue *vq = virtio_get_queue(dev->vdev, ring->index);
+
+        /*
+         * vhost-vdpa devices does not support in-flight requests. Set all of
+         * them as available.
+         *
+         * TODO: This is ok for networking, but other kinds of devices might
+         * have problems with these retransmissions.
+         */
+        while (virtqueue_rewind(vq, 1)) {
+            continue;
+        }
+
         ring->num = virtio_queue_get_last_avail_idx(dev->vdev, ring->index);
         return 0;
     }
@@ -1326,4 +1337,5 @@ const VhostOps vdpa_ops = {
         .vhost_vq_get_addr = vhost_vdpa_vq_get_addr,
         .vhost_force_iommu = vhost_vdpa_force_iommu,
         .vhost_set_config_call = vhost_vdpa_set_config_call,
+        .vhost_reset_status = vhost_vdpa_reset_status,
 };
diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
index eb8c4c378c..a266396576 100644
--- a/hw/virtio/vhost.c
+++ b/hw/virtio/vhost.c
@@ -2049,6 +2049,9 @@ void vhost_dev_stop(struct vhost_dev *hdev, VirtIODevice *vdev, bool vrings)
                              hdev->vqs + i,
                              hdev->vq_index + i);
     }
+    if (hdev->vhost_ops->vhost_reset_status) {
+        hdev->vhost_ops->vhost_reset_status(hdev);
+    }
 
     if (vhost_dev_has_iommu(hdev)) {
         if (hdev->vhost_ops->vhost_set_iotlb_callback) {
-- 
2.31.1


