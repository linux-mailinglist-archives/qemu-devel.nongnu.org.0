Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB0F7329FA3
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 13:58:15 +0100 (CET)
Received: from localhost ([::1]:56180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH4bO-0003Gr-RA
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 07:58:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yi.l.liu@intel.com>)
 id 1lH4KG-0007sh-O8
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 07:40:32 -0500
Received: from mga05.intel.com ([192.55.52.43]:62468)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yi.l.liu@intel.com>)
 id 1lH4KE-0002nT-CB
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 07:40:32 -0500
IronPort-SDR: 8wC4Z6XACe+XY47Sq2mfk2GtnvQakkmx7AXxdFasE4noT+5FaLCjrFYsmtzuF3UtAyVL+m9pM6
 hoOfjRDL3QTQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9910"; a="271803131"
X-IronPort-AV: E=Sophos;i="5.81,216,1610438400"; d="scan'208";a="271803131"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2021 04:40:29 -0800
IronPort-SDR: 2rBwXi9CGAqzBAfgjGa2/z9Z7RLcfK9+aaBOHTgVIBWhWDpMD0yV419aGiITwQLR0Jexxae9Nv
 r47dGVFbNZGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,216,1610438400"; d="scan'208";a="427472958"
Received: from yiliu-dev.bj.intel.com (HELO dual-ub.bj.intel.com)
 ([10.238.156.135])
 by fmsmga004.fm.intel.com with ESMTP; 02 Mar 2021 04:40:25 -0800
From: Liu Yi L <yi.l.liu@intel.com>
To: qemu-devel@nongnu.org, alex.williamson@redhat.com, peterx@redhat.com,
 jasowang@redhat.com
Subject: [RFC v11 13/25] vfio: init HostIOMMUContext per-container
Date: Wed,  3 Mar 2021 04:38:15 +0800
Message-Id: <20210302203827.437645-14-yi.l.liu@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210302203827.437645-1-yi.l.liu@intel.com>
References: <20210302203827.437645-1-yi.l.liu@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.43; envelope-from=yi.l.liu@intel.com;
 helo=mga05.intel.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DATE_IN_FUTURE_06_12=1.947,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: jean-philippe@linaro.org, kevin.tian@intel.com, yi.l.liu@intel.com,
 Yi Sun <yi.y.sun@linux.intel.com>, kvm@vger.kernel.org, mst@redhat.com,
 jun.j.tian@intel.com, eric.auger@redhat.com, yi.y.sun@intel.com,
 Jacob Pan <jacob.jun.pan@linux.intel.com>, pbonzini@redhat.com,
 Lingshan.Zhu@intel.com, hao.wu@intel.com, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In this patch, QEMU firstly gets iommu info from kernel to check the
supported capabilities by a VFIO_IOMMU_TYPE1_NESTING iommu. And inits
HostIOMMUContet instance.

For vfio-pci devices, it could use pci_device_set/unset_iommu() to
expose host iommu context to vIOMMU emulators. vIOMMU emulators
could make use of the methods provided by host iommu context. e.g.
propagate requests to host iommu.

Cc: Kevin Tian <kevin.tian@intel.com>
Cc: Jacob Pan <jacob.jun.pan@linux.intel.com>
Cc: Peter Xu <peterx@redhat.com>
Cc: Eric Auger <eric.auger@redhat.com>
Cc: Yi Sun <yi.y.sun@linux.intel.com>
Cc: David Gibson <david@gibson.dropbear.id.au>
Cc: Alex Williamson <alex.williamson@redhat.com>
Signed-off-by: Liu Yi L <yi.l.liu@intel.com>
---
 hw/vfio/common.c              | 135 +++++++++++++++++++++++++---------
 hw/vfio/pci.c                 |  17 +++++
 include/hw/vfio/vfio-common.h |   1 +
 3 files changed, 118 insertions(+), 35 deletions(-)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 433938c245..a12708bcb7 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -1623,41 +1623,11 @@ static int vfio_host_iommu_ctx_unbind_stage1_pgtbl(HostIOMMUContext *iommu_ctx,
     return ret;
 }
 
-static int vfio_init_container(VFIOContainer *container, int group_fd,
-                               bool want_nested, Error **errp)
-{
-    int iommu_type, ret;
-
-    iommu_type = vfio_get_iommu_type(container, want_nested, errp);
-    if (iommu_type < 0) {
-        return iommu_type;
-    }
-
-    ret = ioctl(group_fd, VFIO_GROUP_SET_CONTAINER, &container->fd);
-    if (ret) {
-        error_setg_errno(errp, errno, "Failed to set group container");
-        return -errno;
-    }
-
-    while (ioctl(container->fd, VFIO_SET_IOMMU, iommu_type)) {
-        if (iommu_type == VFIO_SPAPR_TCE_v2_IOMMU) {
-            /*
-             * On sPAPR, despite the IOMMU subdriver always advertises v1 and
-             * v2, the running platform may not support v2 and there is no
-             * way to guess it until an IOMMU group gets added to the container.
-             * So in case it fails with v2, try v1 as a fallback.
-             */
-            iommu_type = VFIO_SPAPR_TCE_IOMMU;
-            continue;
-        }
-        error_setg_errno(errp, errno, "Failed to set iommu for container");
-        return -errno;
-    }
-
-    container->iommu_type = iommu_type;
-    return 0;
-}
-
+/**
+ * Get iommu info from host. Caller of this funcion should free
+ * the memory pointed by the returned pointer stored in @info
+ * after a successful calling when finished its usage.
+ */
 static int vfio_get_iommu_info(VFIOContainer *container,
                                struct vfio_iommu_type1_info **info)
 {
@@ -1702,6 +1672,101 @@ vfio_get_iommu_info_cap(struct vfio_iommu_type1_info *info, uint16_t id)
     return NULL;
 }
 
+static int vfio_get_nesting_iommu_cap(VFIOContainer *container,
+                   struct vfio_iommu_type1_info_cap_nesting **cap_nesting)
+{
+    struct vfio_iommu_type1_info *info;
+    struct vfio_info_cap_header *hdr;
+    struct vfio_iommu_type1_info_cap_nesting *cap;
+    struct iommu_nesting_info *nest_info;
+    int ret;
+    uint32_t minsz, cap_size;
+
+    ret = vfio_get_iommu_info(container, &info);
+    if (ret) {
+        return ret;
+    }
+
+    hdr = vfio_get_iommu_info_cap(info,
+                        VFIO_IOMMU_TYPE1_INFO_CAP_NESTING);
+    if (!hdr) {
+        g_free(info);
+        return -EINVAL;
+    }
+
+    cap = container_of(hdr,
+                struct vfio_iommu_type1_info_cap_nesting, header);
+
+    nest_info = &cap->info;
+    minsz = offsetof(struct iommu_nesting_info, vendor);
+    if (nest_info->argsz < minsz) {
+        g_free(info);
+        return -EINVAL;
+    }
+
+    cap_size = offsetof(struct vfio_iommu_type1_info_cap_nesting, info) +
+               nest_info->argsz;
+    *cap_nesting = g_malloc0(cap_size);
+    memcpy(*cap_nesting, cap, cap_size);
+
+    g_free(info);
+    return 0;
+}
+
+static int vfio_init_container(VFIOContainer *container, int group_fd,
+                               bool want_nested, Error **errp)
+{
+    int iommu_type, ret;
+
+    iommu_type = vfio_get_iommu_type(container, want_nested, errp);
+    if (iommu_type < 0) {
+        return iommu_type;
+    }
+
+    ret = ioctl(group_fd, VFIO_GROUP_SET_CONTAINER, &container->fd);
+    if (ret) {
+        error_setg_errno(errp, errno, "Failed to set group container");
+        return -errno;
+    }
+
+    while (ioctl(container->fd, VFIO_SET_IOMMU, iommu_type)) {
+        if (iommu_type == VFIO_SPAPR_TCE_v2_IOMMU) {
+            /*
+             * On sPAPR, despite the IOMMU subdriver always advertises v1 and
+             * v2, the running platform may not support v2 and there is no
+             * way to guess it until an IOMMU group gets added to the container.
+             * So in case it fails with v2, try v1 as a fallback.
+             */
+            iommu_type = VFIO_SPAPR_TCE_IOMMU;
+            continue;
+        }
+        error_setg_errno(errp, errno, "Failed to set iommu for container");
+        return -errno;
+    }
+
+    if (iommu_type == VFIO_TYPE1_NESTING_IOMMU) {
+        struct vfio_iommu_type1_info_cap_nesting *nesting = NULL;
+        struct iommu_nesting_info *nest_info;
+
+        ret = vfio_get_nesting_iommu_cap(container, &nesting);
+        if (ret) {
+            error_setg_errno(errp, -ret,
+                             "Failed to get nesting iommu cap");
+            return ret;
+        }
+
+        nest_info = (struct iommu_nesting_info *) &nesting->info;
+        host_iommu_ctx_init(&container->iommu_ctx,
+                            sizeof(container->iommu_ctx),
+                            TYPE_VFIO_HOST_IOMMU_CONTEXT,
+                            nest_info);
+        g_free(nesting);
+    }
+
+    container->iommu_type = iommu_type;
+    return 0;
+}
+
 static void vfio_get_iommu_info_migration(VFIOContainer *container,
                                          struct vfio_iommu_type1_info *info)
 {
diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 437f51338e..f5363589b6 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -2764,6 +2764,7 @@ static void vfio_realize(PCIDevice *pdev, Error **errp)
     VFIOPCIDevice *vdev = VFIO_PCI(pdev);
     VFIODevice *vbasedev_iter;
     VFIOGroup *group;
+    VFIOContainer *container;
     char *tmp, *subsys, group_path[PATH_MAX], *group_name;
     Error *err = NULL;
     ssize_t len;
@@ -2829,6 +2830,15 @@ static void vfio_realize(PCIDevice *pdev, Error **errp)
         goto error;
     }
 
+    container = group->container;
+    if (container->iommu_ctx.initialized &&
+        pci_device_set_iommu_context(pdev, &container->iommu_ctx)) {
+        error_setg(errp, "device attachment is denied by vIOMMU, "
+                   "please check host IOMMU nesting capability");
+        vfio_put_group(group);
+        goto error;
+    }
+
     QLIST_FOREACH(vbasedev_iter, &group->device_list, next) {
         if (strcmp(vbasedev_iter->name, vdev->vbasedev.name) == 0) {
             error_setg(errp, "device is already attached");
@@ -3112,9 +3122,16 @@ static void vfio_instance_finalize(Object *obj)
 static void vfio_exitfn(PCIDevice *pdev)
 {
     VFIOPCIDevice *vdev = VFIO_PCI(pdev);
+    VFIOContainer *container;
 
     vfio_unregister_req_notifier(vdev);
     vfio_unregister_err_notifier(vdev);
+
+    container = vdev->vbasedev.group->container;
+    if (container->iommu_ctx.initialized) {
+        pci_device_unset_iommu_context(pdev);
+    }
+
     pci_device_set_intx_routing_notifier(&vdev->pdev, NULL);
     if (vdev->irqchip_change_notifier.notify) {
         kvm_irqchip_remove_change_notifier(&vdev->irqchip_change_notifier);
diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
index 55241ee270..5a9f2b6325 100644
--- a/include/hw/vfio/vfio-common.h
+++ b/include/hw/vfio/vfio-common.h
@@ -85,6 +85,7 @@ typedef struct VFIOContainer {
     MemoryListener listener;
     MemoryListener prereg_listener;
     unsigned iommu_type;
+    HostIOMMUContext iommu_ctx;
     Error *error;
     bool initialized;
     bool dirty_pages_supported;
-- 
2.25.1


