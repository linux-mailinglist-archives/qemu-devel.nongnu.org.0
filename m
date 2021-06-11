Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3D9D3A3B95
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Jun 2021 08:02:42 +0200 (CEST)
Received: from localhost ([::1]:56232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lraFd-0006Kk-IZ
	for lists+qemu-devel@lfdr.de; Fri, 11 Jun 2021 02:02:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lraDh-0003S5-5I
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 02:00:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45777)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lraDf-00022i-B9
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 02:00:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623391238;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rGd5XoAYgg/pbnpWwiGpgjvwU/VaMwQUiOlIVW8/TCc=;
 b=F/2/knGXFQf8CDAUn9GHSLabAnrA6lAL2N5eRAlfj8E9L1sfH8zjlr2f+K2+C8XaqfEoc3
 3PgREjy1kuQ9pifIBb4ovDPtSp7gW7kFvezJBIMQRuNczHWZIHdjkVTWIr+p2thh5ktHyd
 RzebM9efGWMifxRp8tmH8WxbkBaE5QM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-303-3IcDdZk5NoKZHS-50ozcSg-1; Fri, 11 Jun 2021 02:00:35 -0400
X-MC-Unique: 3IcDdZk5NoKZHS-50ozcSg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 131BA1084F48;
 Fri, 11 Jun 2021 06:00:34 +0000 (UTC)
Received: from localhost.localdomain (ovpn-13-78.pek2.redhat.com [10.72.13.78])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 597126060F;
 Fri, 11 Jun 2021 06:00:31 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PULL 02/12] vhost-vdpa: map virtqueue notification area if possible
Date: Fri, 11 Jun 2021 14:00:14 +0800
Message-Id: <20210611060024.46763-3-jasowang@redhat.com>
In-Reply-To: <20210611060024.46763-1-jasowang@redhat.com>
References: <20210611060024.46763-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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
Cc: Si-Wei Liu <si-wei.liu@oracle.com>, Jason Wang <jasowang@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch implements the vq notification mapping support for
vhost-vDPA. This is simply done by using mmap()/munmap() for the
vhost-vDPA fd during device start/stop. For the device without
notification mapping support, we fall back to eventfd based
notification gracefully.

Reviewed-by: Si-Wei Liu <si-wei.liu@oracle.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 hw/virtio/vhost-vdpa.c         | 85 ++++++++++++++++++++++++++++++++++++++++++
 include/hw/virtio/vhost-vdpa.h |  6 +++
 2 files changed, 91 insertions(+)

diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index aef5055..7bcccf1 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -286,12 +286,95 @@ static int vhost_vdpa_init(struct vhost_dev *dev, void *opaque)
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
@@ -468,6 +551,7 @@ static int vhost_vdpa_dev_start(struct vhost_dev *dev, bool started)
     if (started) {
         uint8_t status = 0;
         memory_listener_register(&v->listener, &address_space_memory);
+        vhost_vdpa_host_notifiers_init(dev);
         vhost_vdpa_set_vring_ready(dev);
         vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_DRIVER_OK);
         vhost_vdpa_call(dev, VHOST_VDPA_GET_STATUS, &status);
@@ -477,6 +561,7 @@ static int vhost_vdpa_dev_start(struct vhost_dev *dev, bool started)
         vhost_vdpa_reset_device(dev);
         vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_ACKNOWLEDGE |
                                    VIRTIO_CONFIG_S_DRIVER);
+        vhost_vdpa_host_notifiers_uninit(dev, dev->nvqs);
         memory_listener_unregister(&v->listener);
 
         return 0;
diff --git a/include/hw/virtio/vhost-vdpa.h b/include/hw/virtio/vhost-vdpa.h
index ae9ee7a..9188226 100644
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
 
 #endif
-- 
2.7.4


