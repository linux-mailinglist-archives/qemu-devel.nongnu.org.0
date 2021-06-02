Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3830739846D
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 10:43:42 +0200 (CEST)
Received: from localhost ([::1]:56776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loMTV-0001cv-BI
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 04:43:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1loMRO-0006XY-7D
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 04:41:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24039)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1loMRM-0003hj-Ed
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 04:41:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622623287;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EcCzrKSJCUwPbt76tLp4aCJ/tjnA4Nnzfj4IZ9JFgvQ=;
 b=NPtC0OsIEcuZqSNDKVtjEpWe/Uko4NioHQqRUH7obrrSFOQo1ZP5TlNOTbDx/2tee6NlGO
 W7y3EIRJ/FnVrvcJbnwk2fALTZopVEmRKr45m6/6HxzVkJb1bAN60FRsH5PEnOGFlHaTzC
 ej97+d69o+sbbFqBxY4fKWDuGATsmME=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-213-gGWxmnwOPaeGaElRrozrYQ-1; Wed, 02 Jun 2021 04:41:26 -0400
X-MC-Unique: gGWxmnwOPaeGaElRrozrYQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E3D771009446;
 Wed,  2 Jun 2021 08:41:24 +0000 (UTC)
Received: from localhost.localdomain (ovpn-12-208.pek2.redhat.com
 [10.72.12.208])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CCB115C6DE;
 Wed,  2 Jun 2021 08:41:22 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com,
	qemu-devel@nongnu.org
Subject: [PATCH V2 2/2] vhost-vdpa: map virtqueue notification area if possible
Date: Wed,  2 Jun 2021 16:41:06 +0800
Message-Id: <20210602084106.43186-3-jasowang@redhat.com>
In-Reply-To: <20210602084106.43186-1-jasowang@redhat.com>
References: <20210602084106.43186-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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
Cc: si-wei.liu@oracle.com, elic@nvidia.com, lingshan.zhu@intel.com,
 Jason Wang <jasowang@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch implements the vq notification mapping support for
vhost-vDPA. This is simply done by using mmap()/munmap() for the
vhost-vDPA fd during device start/stop. For the device without
notification mapping support, we fall back to eventfd based
notification gracefully.

Signed-off-by: Jason Wang <jasowang@redhat.com>
---
Changes since v1:
- use dev->vq_index to calculate the virtqueue index
- remove the unused host_notifier_set
---
 hw/virtio/vhost-vdpa.c         | 85 ++++++++++++++++++++++++++++++++++
 include/hw/virtio/vhost-vdpa.h |  6 +++
 2 files changed, 91 insertions(+)

diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index dd4321bac2..f9a86afe64 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -285,12 +285,95 @@ static int vhost_vdpa_init(struct vhost_dev *dev, void *opaque)
     return 0;
 }
 
+static void vhost_vdpa_host_notifier_uninit(struct vhost_dev *dev,
+                                            int queue_index)
+{
+    size_t page_size = qemu_real_host_page_size;
+    struct vhost_vdpa *v = dev->opaque;
+    VirtIODevice *vdev = dev->vdev;
+    VhostVDPAHostNotifier *n;
+
+    n = &v->notifier[queue_index];
+
+    if (n->addr) {
+        virtio_queue_set_host_notifier_mr(vdev, queue_index, &n->mr, false);
+        object_unparent(OBJECT(&n->mr));
+        munmap(n->addr, page_size);
+        n->addr = NULL;
+    }
+}
+
+static void vhost_vdpa_host_notifiers_uninit(struct vhost_dev *dev, int n)
+{
+    int i;
+
+    for (i = 0; i < n; i++) {
+        vhost_vdpa_host_notifier_uninit(dev, i);
+    }
+}
+
+static int vhost_vdpa_host_notifier_init(struct vhost_dev *dev, int queue_index)
+{
+    size_t page_size = qemu_real_host_page_size;
+    struct vhost_vdpa *v = dev->opaque;
+    VirtIODevice *vdev = dev->vdev;
+    VhostVDPAHostNotifier *n;
+    int fd = v->device_fd;
+    void *addr;
+    char *name;
+
+    vhost_vdpa_host_notifier_uninit(dev, queue_index);
+
+    n = &v->notifier[queue_index];
+
+    addr = mmap(NULL, page_size, PROT_WRITE, MAP_SHARED, fd,
+                queue_index * page_size);
+    if (addr == MAP_FAILED) {
+        goto err;
+    }
+
+    name = g_strdup_printf("vhost-vdpa/host-notifier@%p mmaps[%d]",
+                           v, queue_index);
+    memory_region_init_ram_device_ptr(&n->mr, OBJECT(vdev), name,
+                                      page_size, addr);
+    g_free(name);
+
+    if (virtio_queue_set_host_notifier_mr(vdev, queue_index, &n->mr, true)) {
+        munmap(addr, page_size);
+        goto err;
+    }
+    n->addr = addr;
+
+    return 0;
+
+err:
+    return -1;
+}
+
+static void vhost_vdpa_host_notifiers_init(struct vhost_dev *dev)
+{
+    int i;
+
+    for (i = dev->vq_index; i < dev->vq_index + dev->nvqs; i++) {
+        if (vhost_vdpa_host_notifier_init(dev, i)) {
+            goto err;
+        }
+    }
+
+    return;
+
+err:
+    vhost_vdpa_host_notifiers_uninit(dev, i);
+    return;
+}
+
 static int vhost_vdpa_cleanup(struct vhost_dev *dev)
 {
     struct vhost_vdpa *v;
     assert(dev->vhost_ops->backend_type == VHOST_BACKEND_TYPE_VDPA);
     v = dev->opaque;
     trace_vhost_vdpa_cleanup(dev, v);
+    vhost_vdpa_host_notifiers_uninit(dev, dev->nvqs);
     memory_listener_unregister(&v->listener);
 
     dev->opaque = NULL;
@@ -467,6 +550,7 @@ static int vhost_vdpa_dev_start(struct vhost_dev *dev, bool started)
     if (started) {
         uint8_t status = 0;
         memory_listener_register(&v->listener, &address_space_memory);
+        vhost_vdpa_host_notifiers_init(dev);
         vhost_vdpa_set_vring_ready(dev);
         vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_DRIVER_OK);
         vhost_vdpa_call(dev, VHOST_VDPA_GET_STATUS, &status);
@@ -476,6 +560,7 @@ static int vhost_vdpa_dev_start(struct vhost_dev *dev, bool started)
         vhost_vdpa_reset_device(dev);
         vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_ACKNOWLEDGE |
                                    VIRTIO_CONFIG_S_DRIVER);
+        vhost_vdpa_host_notifiers_uninit(dev, dev->nvqs);
         memory_listener_unregister(&v->listener);
 
         return 0;
diff --git a/include/hw/virtio/vhost-vdpa.h b/include/hw/virtio/vhost-vdpa.h
index 9b81a409da..56bef30ec2 100644
--- a/include/hw/virtio/vhost-vdpa.h
+++ b/include/hw/virtio/vhost-vdpa.h
@@ -14,11 +14,17 @@
 
 #include "hw/virtio/virtio.h"
 
+typedef struct VhostVDPAHostNotifier {
+    MemoryRegion mr;
+    void *addr;
+} VhostVDPAHostNotifier;
+
 typedef struct vhost_vdpa {
     int device_fd;
     uint32_t msg_type;
     MemoryListener listener;
     struct vhost_dev *dev;
+    VhostVDPAHostNotifier notifier[VIRTIO_QUEUE_MAX];
 } VhostVDPA;
 
 extern AddressSpace address_space_memory;
-- 
2.25.1


