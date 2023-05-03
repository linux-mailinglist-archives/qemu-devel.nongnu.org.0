Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA4A36F5461
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 11:17:23 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu8av-0007VT-EO; Wed, 03 May 2023 05:16:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1pu8as-0007Tm-Vc
 for qemu-devel@nongnu.org; Wed, 03 May 2023 05:16:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1pu8aq-0008Hs-SH
 for qemu-devel@nongnu.org; Wed, 03 May 2023 05:16:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683105372;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8tXpMpIWR7EehLxorBcS/d7hy6TsGogWnQ3nyCwcUeM=;
 b=SbvR9wnH5WT2BytxjmljfR14pR9pUO7hW0Ft6BvC1wOZ4Ml5yO70mXttm7uVdEBO5Zuaz9
 FNXUYnZfR2yRRaPY5KMVMx0/C8RfzgNnRWLP4tUG9hpQkeRWIar/aEpZ6uvSJdTKbGJ0BE
 u8TP5Btsa0k70FVeMpdvbvRHtoWQZE8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-48-pANSXla8M0i9qP61dGFRnA-1; Wed, 03 May 2023 05:14:22 -0400
X-MC-Unique: pANSXla8M0i9qP61dGFRnA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C38F7A0F385
 for <qemu-devel@nongnu.org>; Wed,  3 May 2023 09:14:21 +0000 (UTC)
Received: from server.redhat.com (ovpn-12-29.pek2.redhat.com [10.72.12.29])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D35171121331;
 Wed,  3 May 2023 09:14:19 +0000 (UTC)
From: Cindy Lu <lulu@redhat.com>
To: lulu@redhat.com, mst@redhat.com, jasowang@redhat.com, qemu-devel@nongnu.org
Subject: [RFC 7/7] vhost-vdpa-iommufd: Add iommufd support for vdpa
Date: Wed,  3 May 2023 17:13:37 +0800
Message-Id: <20230503091337.2130631-8-lulu@redhat.com>
In-Reply-To: <20230503091337.2130631-1-lulu@redhat.com>
References: <20230503091337.2130631-1-lulu@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=lulu@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

This file is support iommufd for vdpa, including the function:

1> iommufd bind/unbind the iommufd device 
   bind the vdpa device to iommufd and attach the ASID 0 to iommufd

2> iommufd map/unmap function.The map function working process is
   a. Check if the asid was used before.
   b. If this is the new asid,  get the new ioas_id and attach it to iommufd.
       save this information in vdpa_iommufd.
   c. Use the ioas_id for mapping
   The unmap logic is the same

Signed-off-by: Cindy Lu <lulu@redhat.com>
---
 hw/virtio/meson.build          |   2 +-
 hw/virtio/vhost-vdpa-iommufd.c | 240 +++++++++++++++++++++++++++++++++
 2 files changed, 241 insertions(+), 1 deletion(-)
 create mode 100644 hw/virtio/vhost-vdpa-iommufd.c

diff --git a/hw/virtio/meson.build b/hw/virtio/meson.build
index f93be2e137..848fdb18eb 100644
--- a/hw/virtio/meson.build
+++ b/hw/virtio/meson.build
@@ -13,7 +13,7 @@ if have_vhost
     specific_virtio_ss.add(files('vhost-user.c'))
   endif
   if have_vhost_vdpa
-    specific_virtio_ss.add(files('vhost-vdpa.c', 'vhost-shadow-virtqueue.c'))
+    specific_virtio_ss.add(files('vhost-vdpa.c', 'vhost-shadow-virtqueue.c','vhost-vdpa-iommufd.c'))
   endif
 else
   softmmu_virtio_ss.add(files('vhost-stub.c'))
diff --git a/hw/virtio/vhost-vdpa-iommufd.c b/hw/virtio/vhost-vdpa-iommufd.c
new file mode 100644
index 0000000000..6a0875c0a4
--- /dev/null
+++ b/hw/virtio/vhost-vdpa-iommufd.c
@@ -0,0 +1,240 @@
+
+#include "qemu/osdep.h"
+#include <sys/ioctl.h>
+#include <linux/vhost.h>
+#include <linux/vfio.h>
+#include <linux/iommufd.h>
+#include "sysemu/iommufd.h"
+#include "hw/virtio/vhost.h"
+
+#include "hw/virtio/vhost-vdpa.h"
+
+static int vdpa_device_attach_ioas(struct vhost_vdpa *dev,
+                                   VDPAIOMMUFDState *vdpa_iommufd)
+{
+    int ret;
+
+    struct vdpa_device_attach_iommufd_as attach_data = {
+        .argsz = sizeof(attach_data),
+        .flags = 0,
+        .ioas_id = vdpa_iommufd->ioas_id,
+    };
+    /* Attach device to an ioas within iommufd */
+    ret = ioctl(dev->device_fd, VDPA_DEVICE_ATTACH_IOMMUFD_AS, &attach_data);
+    if (ret) {
+        error_report("fail to bind device fd=%d to ioas_id=%d", dev->device_fd,
+                     vdpa_iommufd->ioas_id);
+        return ret;
+    }
+
+    return 0;
+}
+static VDPAIOMMUFDState *vdpa_get_ioas_by_asid(struct vhost_dev *hdev,
+                                               uint32_t asid)
+{
+    VDPAIOMMUFDState *vdpa_iommufd_ptr = hdev->vdev->iommufd_ptr;
+    while (vdpa_iommufd_ptr != NULL) {
+        if (asid == vdpa_iommufd_ptr->asid) {
+            return vdpa_iommufd_ptr;
+        }
+
+        vdpa_iommufd_ptr = vdpa_iommufd_ptr->next;
+    }
+
+    return NULL;
+}
+static VDPAIOMMUFDState *vdpa_add_new_ioas_id(struct vhost_dev *hdev,
+                                              uint32_t asid)
+{
+    int ret;
+    uint32_t ioas_id;
+
+    struct vhost_vdpa *v = hdev->opaque;
+    VDPAIOMMUFDState *vdpa_iommufd_ptr = hdev->vdev->iommufd_ptr;
+    VDPAIOMMUFDState *vdpa_iommufd_new = g_malloc(sizeof(VDPAIOMMUFDState));
+
+    vdpa_iommufd_new->dev = hdev;
+    vdpa_iommufd_new->asid = asid;
+    vdpa_iommufd_new->iommufd = vdpa_iommufd_ptr->iommufd;
+
+    ret = iommufd_backend_get_ioas(vdpa_iommufd_new->iommufd, &ioas_id);
+    if (ret < 0) {
+        error_report("Failed to alloc ioas (%s)", strerror(errno));
+        return NULL;
+    }
+
+    vdpa_iommufd_new->ioas_id = ioas_id;
+    /* this is new asid, attch to iommufd*/
+    ret = vdpa_device_attach_ioas(v, vdpa_iommufd_new);
+    if (ret < 0) {
+        error_report("Failed to attach ioas (%s)", strerror(errno));
+        return NULL;
+    }
+    while (vdpa_iommufd_ptr->next != NULL) {
+        vdpa_iommufd_ptr = vdpa_iommufd_ptr->next;
+    }
+    /*save this vdpa_iommufd in list */
+    vdpa_iommufd_ptr->next = vdpa_iommufd_new;
+    vdpa_iommufd_new->next = NULL;
+    return vdpa_iommufd_new;
+}
+static int vdpa_iommufd_map(struct vhost_dev *hdev, uint32_t asid, hwaddr iova,
+                            hwaddr size, void *vaddr, bool readonly)
+{
+    VDPAIOMMUFDState *vdpa_iommufd;
+
+    if (hdev->vdev == NULL) {
+        error_report("Failed to get vdev (%s)", strerror(errno));
+        return 0;
+    }
+    /*search if this asid have attach to iommufd before*/
+    vdpa_iommufd = vdpa_get_ioas_by_asid(hdev, asid);
+    if (vdpa_iommufd == NULL) {
+        /*this asid is first use, need to alloc and add to iommufd*/
+        vdpa_iommufd = vdpa_add_new_ioas_id(hdev, asid);
+    }
+    return iommufd_backend_map_dma(vdpa_iommufd->iommufd, vdpa_iommufd->ioas_id,
+                                   iova, size, vaddr, readonly);
+}
+
+
+static int vdpa_iommufd_unmap(struct vhost_dev *hdev, uint32_t asid,
+                              hwaddr iova, hwaddr size)
+{
+    VDPAIOMMUFDState *vdpa_iommufd;
+    if (hdev->vdev == NULL) {
+        error_report("Failed to get vdev (%s)", strerror(errno));
+        return 0;
+    }
+    /*search if this asid have attach to iommufd before*/
+
+    vdpa_iommufd = vdpa_get_ioas_by_asid(hdev, asid);
+    if (vdpa_iommufd == NULL) {
+        error_report("Failed to get ioas (%s)", strerror(errno));
+        return 0;
+    }
+    return iommufd_backend_unmap_dma(vdpa_iommufd->iommufd,
+                                     vdpa_iommufd->ioas_id, iova, size);
+}
+
+
+static void vdpa_device_detach_iommufd(struct vhost_vdpa *v,
+                                       VDPAIOMMUFDState *vdpa_iommufd,
+                                       Error **errp)
+{
+    struct vdpa_device_detach_iommufd_as detach_data = {
+        .argsz = sizeof(detach_data),
+        .flags = 0,
+    };
+
+    if (ioctl(v->device_fd, VDPA_DEVICE_DETACH_IOMMUFD_AS, &detach_data)) {
+        error_report("error bind device fd=%d ", v->device_fd);
+        return;
+    }
+}
+
+
+static int vdpa_device_bind_iommufd(struct vhost_vdpa *dev,
+                                    VDPAIOMMUFDState *vdpa_iommufd,
+                                    Error **errp)
+{
+    struct vhost_vdpa_set_iommufd bind = {
+        .iommufd = vdpa_iommufd->iommufd->fd,
+        .ioas_id = vdpa_iommufd->ioas_id,
+    };
+
+    int ret;
+    /* Bind device to iommufd */
+    ret = ioctl(dev->device_fd, VHOST_VDPA_SET_IOMMU_FD, &bind);
+    if (ret) {
+        error_report("error bind device fd=%d to iommufd=%d", dev->device_fd,
+                     bind.iommufd);
+        return ret;
+    }
+
+    vdpa_iommufd->devid = bind.out_devid;
+    vdpa_iommufd->hwptid = bind.out_hwptid;
+
+    return vdpa_device_attach_ioas(dev, vdpa_iommufd);
+}
+
+static void vdpa_iommufd_destroy(VDPAIOMMUFDState *vdpa_iommufd)
+{
+    g_free(vdpa_iommufd);
+}
+
+/*attach the device to iommufd */
+static int vdpa_iommufd_attach_device(struct vhost_vdpa *v, AddressSpace *as,
+                                      Error **errp)
+{
+    VDPAIOMMUFDState *vdpa_iommufd;
+    int ret;
+    uint32_t ioas_id;
+    Error *err = NULL;
+    struct vhost_dev *dev = v->dev;
+    vdpa_iommufd = dev->vdev->iommufd_ptr;
+
+    /*allocate a new IOAS */
+    ret = iommufd_backend_get_ioas(vdpa_iommufd->iommufd, &ioas_id);
+    if (ret < 0) {
+        close(v->device_fd);
+        error_report("Failed to alloc ioas (%s)", strerror(errno));
+        return ret;
+    }
+
+    vdpa_iommufd->ioas_id = ioas_id;
+    vdpa_iommufd->dev = dev;
+    /* use the default ASID*/
+    vdpa_iommufd->asid = VHOST_VDPA_GUEST_PA_ASID;
+    vdpa_iommufd->next = NULL;
+
+    vdpa_iommufd->as = as;
+    /*bind the default ASID to iommufd*/
+    ret = vdpa_device_bind_iommufd(v, vdpa_iommufd, &err);
+    if (ret) {
+        /* todo check if fail */
+        error_report("Failed to vdpa_device_bind_iommufd  (%s)",
+                     strerror(errno));
+        iommufd_backend_put_ioas(vdpa_iommufd->iommufd, ioas_id);
+
+        vdpa_iommufd_destroy(vdpa_iommufd);
+        return ret;
+    }
+
+    return ret;
+}
+
+static void vdpa_iommufd_detach_device(struct vhost_vdpa *v)
+{
+    VDPAIOMMUFDState *vdpa_iommufd;
+
+    VDPAIOMMUFDState *vdpa_iommufd_tmp;
+    Error *err = NULL;
+
+    struct vhost_dev *dev = v->dev;
+    if (!dev->vdev) {
+        return;
+    }
+    vdpa_iommufd = dev->vdev->iommufd_ptr;
+    vdpa_device_detach_iommufd(v, vdpa_iommufd, &err);
+
+    while (vdpa_iommufd != NULL) {
+        iommufd_backend_put_ioas(vdpa_iommufd->iommufd, vdpa_iommufd->ioas_id);
+        vdpa_iommufd_tmp = vdpa_iommufd;
+        vdpa_iommufd = vdpa_iommufd->next;
+
+        vdpa_iommufd_destroy(vdpa_iommufd_tmp);
+    }
+}
+
+struct vdpa_iommu_backend_ops iommufd_ops = {
+    .dma_map = vdpa_iommufd_map,
+    .dma_unmap = vdpa_iommufd_unmap,
+    .attach_device = vdpa_iommufd_attach_device,
+    .detach_device = vdpa_iommufd_detach_device,
+};
+
+void vdpa_backend_iommufd_ops_class_init(struct vhost_vdpa *v)
+{
+    v->ops = &iommufd_ops;
+}
-- 
2.34.3


