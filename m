Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6910B68EC02
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 10:48:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPgz7-0005BV-FJ; Wed, 08 Feb 2023 04:43:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pPgz4-00054f-Eu
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 04:43:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pPgz2-0005ZU-86
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 04:43:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675849398;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NevxBDK/JYdlvXhbSXgzQErdEIElTbJBGsHTJTN+zX0=;
 b=DVx0vgOuO2bMCg1ZNQ5Prb7v6Lg+YhpXCJPhXqlwKaWj67TniXYRiyIgHUvEpjvvX4ssrv
 TZaaDbnbNtfLv+LZJabOk6E3Kz0TD+ZtN4WX2n74y1wbIPYE/CEAaxU3ZMrBVTS2AXZiXG
 Y/SirRIGK/bUhKy1anL2b2jqwL829rI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-515-kjZG_jbwMiy2eSkjBs6opQ-1; Wed, 08 Feb 2023 04:43:13 -0500
X-MC-Unique: kjZG_jbwMiy2eSkjBs6opQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 84EDC885626;
 Wed,  8 Feb 2023 09:43:12 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.190])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 841182166B29;
 Wed,  8 Feb 2023 09:43:09 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Harpreet Singh Anand <hanand@xilinx.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Cindy Lu <lulu@redhat.com>, alvaro.karsz@solid-run.com,
 Zhu Lingshan <lingshan.zhu@intel.com>, Lei Yang <leiyang@redhat.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>,
 Shannon Nelson <snelson@pensando.io>, Parav Pandit <parav@mellanox.com>,
 Gautam Dawar <gdawar@xilinx.com>, Eli Cohen <eli@mellanox.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 longpeng2@huawei.com, virtualization@lists.linux-foundation.org,
 Stefano Garzarella <sgarzare@redhat.com>, si-wei.liu@oracle.com
Subject: [PATCH v2 04/13] vdpa: move vhost reset after get vring base
Date: Wed,  8 Feb 2023 10:42:44 +0100
Message-Id: <20230208094253.702672-5-eperezma@redhat.com>
In-Reply-To: <20230208094253.702672-1-eperezma@redhat.com>
References: <20230208094253.702672-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
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

The function vhost.c:vhost_dev_stop calls vhost operation
vhost_dev_start(false). In the case of vdpa it totally reset and wipes
the device, making the fetching of the vring base (virtqueue state) totally
useless.

The kernel backend does not use vhost_dev_start vhost op callback, but
vhost-user do. A patch to make vhost_user_dev_start more similar to vdpa
is desirable, but it can be added on top.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 include/hw/virtio/vhost-backend.h |  4 ++++
 hw/virtio/vhost-vdpa.c            | 22 ++++++++++++++++------
 hw/virtio/vhost.c                 |  3 +++
 3 files changed, 23 insertions(+), 6 deletions(-)

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
index cbbe92ffe8..26e38a6aab 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -1152,14 +1152,23 @@ static int vhost_vdpa_dev_start(struct vhost_dev *dev, bool started)
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
@@ -1346,4 +1355,5 @@ const VhostOps vdpa_ops = {
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


