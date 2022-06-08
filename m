Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FC285430E5
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 14:57:47 +0200 (CEST)
Received: from localhost ([::1]:59274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyvFq-0000TM-HF
	for lists+qemu-devel@lfdr.de; Wed, 08 Jun 2022 08:57:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yi.l.liu@intel.com>)
 id 1nyuqu-0000T8-Su
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 08:32:00 -0400
Received: from mga05.intel.com ([192.55.52.43]:56958)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yi.l.liu@intel.com>)
 id 1nyuqq-0005ks-9K
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 08:31:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654691516; x=1686227516;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MGTE2TVi4Z/OLr5qovQ9Ivt4dKH7Id4WEAoyPHQsjKw=;
 b=H2UDP1Im+2WxP9CLJoQa2G62H0wMrY/UejRRIQL2CUXiiiik4Gb7941W
 Uxw0dFSk8rrFVJ0tWGHHU9CxKds7N+KBnTyRZ/vcBpI1BxDPMxuBi9X5E
 pQhVJIEel0Y8VJtz+pD+Gs3vX5UZjxF41+wpH6qHK3lYU5EWHrQJcX8WI
 nXxal5xpOLvJ4Do++KNbF9rkEKszT9Ijpx95sZet93vBHPevosasKodUR
 STq8wv6qfWPrgw9qst1Ksq+nCVYqItBUpQgbQMfcPvy42yamUoKj2BYZE
 0hWNC/dnTaQFCmCITqWE1AaqD5eeoS2wMgl3nw0+qHDlXEYook2RJ0w81 w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10371"; a="363210150"
X-IronPort-AV: E=Sophos;i="5.91,286,1647327600"; d="scan'208";a="363210150"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2022 05:31:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,286,1647327600"; d="scan'208";a="670529839"
Received: from 984fee00a4c6.jf.intel.com ([10.165.58.231])
 by FMSMGA003.fm.intel.com with ESMTP; 08 Jun 2022 05:31:46 -0700
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
Subject: [RFC v2 09/15] vfio/container-base: Introduce [attach/detach]_device
 container callbacks
Date: Wed,  8 Jun 2022 05:31:33 -0700
Message-Id: <20220608123139.19356-10-yi.l.liu@intel.com>
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

Let's turn attach/detach_device as container callbacks. That way,
their implementation can be easily customized for a given backend.

For the time being, only the legacy container is supported.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Yi Liu <yi.l.liu@intel.com>
---
 hw/vfio/as.c                          | 30 +++++++++++++++++++++++++++
 hw/vfio/container.c                   |  9 ++++++--
 hw/vfio/pci.c                         |  2 +-
 include/hw/vfio/vfio-common.h         |  7 +++++++
 include/hw/vfio/vfio-container-base.h |  4 ++++
 5 files changed, 49 insertions(+), 3 deletions(-)

diff --git a/hw/vfio/as.c b/hw/vfio/as.c
index ec58914001..2c83b8e1fe 100644
--- a/hw/vfio/as.c
+++ b/hw/vfio/as.c
@@ -899,3 +899,33 @@ void vfio_put_address_space(VFIOAddressSpace *space)
         g_free(space);
     }
 }
+
+static const VFIOContainerOps *
+vfio_get_container_ops(VFIOIOMMUBackendType be)
+{
+    switch (be) {
+    case VFIO_IOMMU_BACKEND_TYPE_LEGACY:
+        return &legacy_container_ops;
+    default:
+        return NULL;
+    }
+}
+
+int vfio_attach_device(VFIODevice *vbasedev, AddressSpace *as, Error **errp)
+{
+    const VFIOContainerOps *ops;
+
+    ops = vfio_get_container_ops(VFIO_IOMMU_BACKEND_TYPE_LEGACY);
+    if (!ops) {
+        return -ENOENT;
+    }
+    return ops->attach_device(vbasedev, as, errp);
+}
+
+void vfio_detach_device(VFIODevice *vbasedev)
+{
+    if (!vbasedev->container) {
+        return;
+    }
+    vbasedev->container->ops->detach_device(vbasedev);
+}
diff --git a/hw/vfio/container.c b/hw/vfio/container.c
index fbde5b0d31..f303c08aa5 100644
--- a/hw/vfio/container.c
+++ b/hw/vfio/container.c
@@ -1244,7 +1244,8 @@ static int vfio_device_groupid(VFIODevice *vbasedev, Error **errp)
     return groupid;
 }
 
-int vfio_attach_device(VFIODevice *vbasedev, AddressSpace *as, Error **errp)
+static int
+legacy_attach_device(VFIODevice *vbasedev, AddressSpace *as, Error **errp)
 {
     int groupid = vfio_device_groupid(vbasedev, errp);
     VFIODevice *vbasedev_iter;
@@ -1273,14 +1274,16 @@ int vfio_attach_device(VFIODevice *vbasedev, AddressSpace *as, Error **errp)
         vfio_put_group(group);
         return -1;
     }
+    vbasedev->container = &group->container->bcontainer;
 
     return 0;
 }
 
-void vfio_detach_device(VFIODevice *vbasedev)
+static void legacy_detach_device(VFIODevice *vbasedev)
 {
     vfio_put_base_device(vbasedev);
     vfio_put_group(vbasedev->group);
+    vbasedev->container = NULL;
 }
 
 const VFIOContainerOps legacy_container_ops = {
@@ -1292,4 +1295,6 @@ const VFIOContainerOps legacy_container_ops = {
     .add_window = vfio_legacy_container_add_section_window,
     .del_window = vfio_legacy_container_del_section_window,
     .check_extension = vfio_legacy_container_check_extension,
+    .attach_device = legacy_attach_device,
+    .detach_device = legacy_detach_device,
 };
diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 9856d81819..07361a6fcd 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -3106,7 +3106,7 @@ static void vfio_realize(PCIDevice *pdev, Error **errp)
     }
 
     if (!pdev->failover_pair_id &&
-        vfio_container_check_extension(&vbasedev->group->container->bcontainer,
+        vfio_container_check_extension(vbasedev->container,
                                        VFIO_FEAT_LIVE_MIGRATION)) {
         ret = vfio_migration_probe(vbasedev, errp);
         if (ret) {
diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
index 669d761728..635397d391 100644
--- a/include/hw/vfio/vfio-common.h
+++ b/include/hw/vfio/vfio-common.h
@@ -84,9 +84,15 @@ typedef struct VFIOLegacyContainer {
 
 typedef struct VFIODeviceOps VFIODeviceOps;
 
+typedef enum VFIOIOMMUBackendType {
+    VFIO_IOMMU_BACKEND_TYPE_LEGACY = 0,
+    VFIO_IOMMU_BACKEND_TYPE_IOMMUFD = 1,
+} VFIOIOMMUBackendType;
+
 typedef struct VFIODevice {
     QLIST_ENTRY(VFIODevice) next;
     struct VFIOGroup *group;
+    VFIOContainer *container;
     char *sysfsdev;
     char *name;
     DeviceState *dev;
@@ -98,6 +104,7 @@ typedef struct VFIODevice {
     bool ram_block_discard_allowed;
     bool enable_migration;
     VFIODeviceOps *ops;
+    VFIOIOMMUBackendType be;
     unsigned int num_irqs;
     unsigned int num_regions;
     unsigned int flags;
diff --git a/include/hw/vfio/vfio-container-base.h b/include/hw/vfio/vfio-container-base.h
index fa5d7fcb85..71df8743fb 100644
--- a/include/hw/vfio/vfio-container-base.h
+++ b/include/hw/vfio/vfio-container-base.h
@@ -66,6 +66,8 @@ typedef struct VFIOHostDMAWindow {
     QLIST_ENTRY(VFIOHostDMAWindow) hostwin_next;
 } VFIOHostDMAWindow;
 
+typedef struct VFIODevice VFIODevice;
+
 typedef struct VFIOContainerOps {
     /* required */
     bool (*check_extension)(VFIOContainer *container,
@@ -88,6 +90,8 @@ typedef struct VFIOContainerOps {
                       Error **errp);
     void (*del_window)(VFIOContainer *container,
                        MemoryRegionSection *section);
+    int (*attach_device)(VFIODevice *vbasedev, AddressSpace *as, Error **errp);
+    void (*detach_device)(VFIODevice *vbasedev);
 } VFIOContainerOps;
 
 /*
-- 
2.27.0


