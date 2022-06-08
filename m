Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65BD15430F4
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 15:04:06 +0200 (CEST)
Received: from localhost ([::1]:38158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyvLw-00060n-Vd
	for lists+qemu-devel@lfdr.de; Wed, 08 Jun 2022 09:04:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yi.l.liu@intel.com>)
 id 1nyurP-0001NA-2Y
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 08:32:31 -0400
Received: from mga05.intel.com ([192.55.52.43]:56952)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yi.l.liu@intel.com>)
 id 1nyurN-0005kl-56
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 08:32:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654691549; x=1686227549;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Wbr6N/45Rts/aHBvR6LbIKg6keUVNwa4C9q2Z+KpQtw=;
 b=alzXnTrllnanHfO/agbpk0B+Cl24JtsHlhTrS1UU/Vi3FUEIJbam7Y9a
 fx7Y64LR6zwLa9XvSuHJob8K+/YWtwuDafleqOCN9CQMSMl/ABx2ZQq6A
 bX02gJ2xKWLH4wGPiQYGgLl+rnoMgXzP/PvrsSHBmWt9O2HbrmzDVmZYQ
 go2i9BPzBkuPPDVZ2qWZgAg+YTsrKbZsXPeoBtvNHX5EjJfOh29JM4mQS
 bdwAv/O56E70m2APk5pbtCIWKMP+OJ1tR95Ehm9NC90MR1o29Jmj8NW3x
 dcukw6qX+JffhpA5Pyp6GLbLwlDQyYp6Ed5n0c/Jxennl+eoJrMSTpUAa w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10371"; a="363210177"
X-IronPort-AV: E=Sophos;i="5.91,286,1647327600"; d="scan'208";a="363210177"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2022 05:31:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,286,1647327600"; d="scan'208";a="670529911"
Received: from 984fee00a4c6.jf.intel.com ([10.165.58.231])
 by FMSMGA003.fm.intel.com with ESMTP; 08 Jun 2022 05:31:50 -0700
From: Yi Liu <yi.l.liu@intel.com>
To: alex.williamson@redhat.com,
	cohuck@redhat.com,
	qemu-devel@nongnu.org
Cc: david@gibson.dropbear.id.au, thuth@redhat.com, farman@linux.ibm.com,
 mjrosato@linux.ibm.com, akrowiak@linux.ibm.com, pasic@linux.ibm.com,
 jjherne@linux.ibm.com, jasowang@redhat.com, kvm@vger.kernel.org,
 jgg@nvidia.com, nicolinc@nvidia.com, eric.auger@redhat.com,
 eric.auger.pro@gmail.com, kevin.tian@intel.com, yi.l.liu@intel.com,
 chao.p.peng@intel.com, yi.y.sun@intel.com, peterx@redhat.com,
 shameerali.kolothum.thodi@huawei.com, zhangfei.gao@linaro.org,
 berrange@redhat.com
Subject: [RFC v2 15/15] vfio/as: Allow the selection of a given iommu backend
Date: Wed,  8 Jun 2022 05:31:39 -0700
Message-Id: <20220608123139.19356-16-yi.l.liu@intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220608123139.19356-1-yi.l.liu@intel.com>
References: <20220608123139.19356-1-yi.l.liu@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.43; envelope-from=yi.l.liu@intel.com;
 helo=mga05.intel.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Eric Auger <eric.auger@redhat.com>

Now we support two types of iommu backends, let's add the capability
to select one of them. This depends on whether an iommufd object has
been linked with the vfio-pci device:

if the user wants to use the legacy backend, it shall not
link the vfio-pci device with any iommufd object:

-device vfio-pci,host=0000:02:00.0

This is called the legacy mode/backend.

If the user wants to use the iommufd backend (/dev/iommu) it
shall pass an iommufd object id in the vfio-pci device options:

 -object iommufd,id=iommufd0
 -device vfio-pci,host=0000:02:00.0,iommufd=iommufd0

Note the /dev/iommu device may have been pre-opened by a
management tool such as libvirt. This mode is no more considered
for the legacy backend. So let's remove the "TODO" comment.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Yi Liu <yi.l.liu@intel.com>
Suggested-by: Alex Williamson <alex.williamson@redhat.com>
---
 hw/vfio/as.c  |  9 ++++++---
 hw/vfio/pci.c | 19 ++++++++++++++-----
 2 files changed, 20 insertions(+), 8 deletions(-)

diff --git a/hw/vfio/as.c b/hw/vfio/as.c
index 56485f9299..e799750104 100644
--- a/hw/vfio/as.c
+++ b/hw/vfio/as.c
@@ -1007,6 +1007,8 @@ vfio_get_container_ops(VFIOIOMMUBackendType be)
     switch (be) {
     case VFIO_IOMMU_BACKEND_TYPE_LEGACY:
         return &legacy_container_ops;
+    case VFIO_IOMMU_BACKEND_TYPE_IOMMUFD:
+        return &iommufd_container_ops;
     default:
         return NULL;
     }
@@ -1016,9 +1018,10 @@ int vfio_attach_device(VFIODevice *vbasedev, AddressSpace *as, Error **errp)
 {
     const VFIOContainerOps *ops;
 
-    ops = vfio_get_container_ops(VFIO_IOMMU_BACKEND_TYPE_LEGACY);
-    if (!ops) {
-        return -ENOENT;
+    if (vbasedev->iommufd) {
+        ops = vfio_get_container_ops(VFIO_IOMMU_BACKEND_TYPE_IOMMUFD);
+    } else {
+        ops = vfio_get_container_ops(VFIO_IOMMU_BACKEND_TYPE_LEGACY);
     }
     return ops->attach_device(vbasedev, as, errp);
 }
diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 6d10e86331..7efd3382ca 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -42,6 +42,7 @@
 #include "qapi/error.h"
 #include "migration/blocker.h"
 #include "migration/qemu-file.h"
+#include "sysemu/iommufd.h"
 
 #define TYPE_VFIO_PCI_NOHOTPLUG "vfio-pci-nohotplug"
 
@@ -2852,6 +2853,13 @@ static void vfio_realize(PCIDevice *pdev, Error **errp)
     int i, ret;
     bool is_mdev;
 
+    if (vbasedev->iommufd) {
+        iommufd_backend_connect(vbasedev->iommufd, errp);
+        if (*errp) {
+            return;
+        }
+    }
+
     if (!vbasedev->sysfsdev) {
         if (!(~vdev->host.domain || ~vdev->host.bus ||
               ~vdev->host.slot || ~vdev->host.function)) {
@@ -3134,6 +3142,7 @@ error:
 static void vfio_instance_finalize(Object *obj)
 {
     VFIOPCIDevice *vdev = VFIO_PCI(obj);
+    VFIODevice *vbasedev = &vdev->vbasedev;
 
     vfio_display_finalize(vdev);
     vfio_bars_finalize(vdev);
@@ -3146,6 +3155,9 @@ static void vfio_instance_finalize(Object *obj)
      *
      * g_free(vdev->igd_opregion);
      */
+    if (vbasedev->iommufd) {
+        iommufd_backend_disconnect(vbasedev->iommufd);
+    }
     vfio_put_device(vdev);
 }
 
@@ -3281,11 +3293,8 @@ static Property vfio_pci_dev_properties[] = {
                                    qdev_prop_nv_gpudirect_clique, uint8_t),
     DEFINE_PROP_OFF_AUTO_PCIBAR("x-msix-relocation", VFIOPCIDevice, msix_relo,
                                 OFF_AUTOPCIBAR_OFF),
-    /*
-     * TODO - support passed fds... is this necessary?
-     * DEFINE_PROP_STRING("vfiofd", VFIOPCIDevice, vfiofd_name),
-     * DEFINE_PROP_STRING("vfiogroupfd, VFIOPCIDevice, vfiogroupfd_name),
-     */
+    DEFINE_PROP_LINK("iommufd", VFIOPCIDevice, vbasedev.iommufd,
+                     TYPE_IOMMUFD_BACKEND, IOMMUFDBackend *),
     DEFINE_PROP_END_OF_LIST(),
 };
 
-- 
2.27.0


