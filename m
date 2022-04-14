Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4585D500B92
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Apr 2022 12:53:34 +0200 (CEST)
Received: from localhost ([::1]:59104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nex6T-0004AA-BY
	for lists+qemu-devel@lfdr.de; Thu, 14 Apr 2022 06:53:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yi.l.liu@intel.com>)
 id 1nex0p-0002Xx-JF
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 06:47:43 -0400
Received: from mga12.intel.com ([192.55.52.136]:34768)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yi.l.liu@intel.com>)
 id 1nex0k-0005Ka-Jp
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 06:47:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649933258; x=1681469258;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0YDGzdA0v7DGQjpQ43n6QGUsR6hhCiY+JzhRyO8LL5g=;
 b=ikrRcRcUZ5Pi1VowrbCc3rgph/TJrYd9Rce2gKVfinFfITVnstckLA0A
 QcpW1nljIiJguFdqG4JfJflpVI5q4o1BpKNgIZo45lYE1AgrKI4JdKmMy
 /yRdGGTxJlpXIuj6BEc/h5SuAlXZRIlN1tto+90NDJGXmVZES9mXdHRDe
 h3R06e9ubysByCFjjSQBFAXn/GNRvHuskMZInY6dfIugND1DWslKtQZJx
 pWZ8WErV3xyDSoWZFzfrV2OPdUJ9z721FQrzeEPJSFo0koPbg1jnZkvIw
 ZwEZXDthRSLzBYT8eoEHvlXtaCP+VQ4nzEyLcgPmB/3fGjw7J3Rk6Rk8J A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10316"; a="242836508"
X-IronPort-AV: E=Sophos;i="5.90,259,1643702400"; d="scan'208";a="242836508"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2022 03:47:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,259,1643702400"; d="scan'208";a="803091238"
Received: from 984fee00a4c6.jf.intel.com ([10.165.58.231])
 by fmsmga006.fm.intel.com with ESMTP; 14 Apr 2022 03:47:19 -0700
From: Yi Liu <yi.l.liu@intel.com>
To: alex.williamson@redhat.com,
	cohuck@redhat.com,
	qemu-devel@nongnu.org
Subject: [RFC 12/18] vfio/container-obj: Introduce [attach/detach]_device
 container callbacks
Date: Thu, 14 Apr 2022 03:47:04 -0700
Message-Id: <20220414104710.28534-13-yi.l.liu@intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220414104710.28534-1-yi.l.liu@intel.com>
References: <20220414104710.28534-1-yi.l.liu@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.136; envelope-from=yi.l.liu@intel.com;
 helo=mga12.intel.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Cc: akrowiak@linux.ibm.com, jjherne@linux.ibm.com, thuth@redhat.com,
 yi.l.liu@intel.com, kvm@vger.kernel.org, mjrosato@linux.ibm.com,
 jasowang@redhat.com, farman@linux.ibm.com, peterx@redhat.com,
 pasic@linux.ibm.com, eric.auger@redhat.com, yi.y.sun@intel.com,
 chao.p.peng@intel.com, nicolinc@nvidia.com, kevin.tian@intel.com,
 jgg@nvidia.com, eric.auger.pro@gmail.com, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Eric Auger <eric.auger@redhat.com>

Let's turn attach/detach_device as container callbacks. That way,
their implementation can be easily customized for a given backend.

For the time being, only the legacy container is supported.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Yi Liu <yi.l.liu@intel.com>
---
 hw/vfio/as.c                         | 36 ++++++++++++++++++++++++++++
 hw/vfio/container.c                  | 11 +++++----
 hw/vfio/pci.c                        |  2 +-
 include/hw/vfio/vfio-common.h        |  7 ++++++
 include/hw/vfio/vfio-container-obj.h |  6 +++++
 5 files changed, 57 insertions(+), 5 deletions(-)

diff --git a/hw/vfio/as.c b/hw/vfio/as.c
index 37423d2c89..30e86f6833 100644
--- a/hw/vfio/as.c
+++ b/hw/vfio/as.c
@@ -874,3 +874,39 @@ void vfio_put_address_space(VFIOAddressSpace *space)
         g_free(space);
     }
 }
+
+static VFIOContainerClass *
+vfio_get_container_class(VFIOIOMMUBackendType be)
+{
+    ObjectClass *klass;
+
+    switch (be) {
+    case VFIO_IOMMU_BACKEND_TYPE_LEGACY:
+        klass = object_class_by_name(TYPE_VFIO_LEGACY_CONTAINER);
+        return VFIO_CONTAINER_OBJ_CLASS(klass);
+    default:
+        return NULL;
+    }
+}
+
+int vfio_attach_device(VFIODevice *vbasedev, AddressSpace *as, Error **errp)
+{
+    VFIOContainerClass *vccs;
+
+    vccs = vfio_get_container_class(VFIO_IOMMU_BACKEND_TYPE_LEGACY);
+    if (!vccs) {
+        return -ENOENT;
+    }
+    return vccs->attach_device(vbasedev, as, errp);
+}
+
+void vfio_detach_device(VFIODevice *vbasedev)
+{
+    VFIOContainerClass *vccs;
+
+    if (!vbasedev->container) {
+        return;
+    }
+    vccs = VFIO_CONTAINER_OBJ_GET_CLASS(vbasedev->container);
+    vccs->detach_device(vbasedev);
+}
diff --git a/hw/vfio/container.c b/hw/vfio/container.c
index 5d73f8285e..74febc1567 100644
--- a/hw/vfio/container.c
+++ b/hw/vfio/container.c
@@ -50,8 +50,6 @@
 static int vfio_kvm_device_fd = -1;
 #endif
 
-#define TYPE_VFIO_LEGACY_CONTAINER "qemu:vfio-legacy-container"
-
 VFIOGroupList vfio_group_list =
     QLIST_HEAD_INITIALIZER(vfio_group_list);
 
@@ -1240,7 +1238,8 @@ static int vfio_device_groupid(VFIODevice *vbasedev, Error **errp)
     return groupid;
 }
 
-int vfio_attach_device(VFIODevice *vbasedev, AddressSpace *as, Error **errp)
+static int
+legacy_attach_device(VFIODevice *vbasedev, AddressSpace *as, Error **errp)
 {
     int groupid = vfio_device_groupid(vbasedev, errp);
     VFIODevice *vbasedev_iter;
@@ -1269,14 +1268,16 @@ int vfio_attach_device(VFIODevice *vbasedev, AddressSpace *as, Error **errp)
         vfio_put_group(group);
         return -1;
     }
+    vbasedev->container = &group->container->obj;
 
     return 0;
 }
 
-void vfio_detach_device(VFIODevice *vbasedev)
+static void legacy_detach_device(VFIODevice *vbasedev)
 {
     vfio_put_base_device(vbasedev);
     vfio_put_group(vbasedev->group);
+    vbasedev->container = NULL;
 }
 
 static void vfio_legacy_container_class_init(ObjectClass *klass,
@@ -1292,6 +1293,8 @@ static void vfio_legacy_container_class_init(ObjectClass *klass,
     vccs->add_window = vfio_legacy_container_add_section_window;
     vccs->del_window = vfio_legacy_container_del_section_window;
     vccs->check_extension = vfio_legacy_container_check_extension;
+    vccs->attach_device = legacy_attach_device;
+    vccs->detach_device = legacy_detach_device;
 }
 
 static const TypeInfo vfio_legacy_container_info = {
diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 0363f81017..e1ab6d339d 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -3063,7 +3063,7 @@ static void vfio_realize(PCIDevice *pdev, Error **errp)
     }
 
     if (!pdev->failover_pair_id &&
-        vfio_container_check_extension(&vbasedev->group->container->obj,
+        vfio_container_check_extension(vbasedev->container,
                                        VFIO_FEAT_LIVE_MIGRATION)) {
         ret = vfio_migration_probe(vbasedev, errp);
         if (ret) {
diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
index 7d7898717e..2040c27cda 100644
--- a/include/hw/vfio/vfio-common.h
+++ b/include/hw/vfio/vfio-common.h
@@ -83,9 +83,15 @@ typedef struct VFIOLegacyContainer {
 
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
@@ -97,6 +103,7 @@ typedef struct VFIODevice {
     bool ram_block_discard_allowed;
     bool enable_migration;
     VFIODeviceOps *ops;
+    VFIOIOMMUBackendType be;
     unsigned int num_irqs;
     unsigned int num_regions;
     unsigned int flags;
diff --git a/include/hw/vfio/vfio-container-obj.h b/include/hw/vfio/vfio-container-obj.h
index 7ffbbb299f..ebc1340530 100644
--- a/include/hw/vfio/vfio-container-obj.h
+++ b/include/hw/vfio/vfio-container-obj.h
@@ -42,6 +42,8 @@
         OBJECT_GET_CLASS(VFIOContainerClass, (obj), \
                          TYPE_VFIO_CONTAINER_OBJ)
 
+#define TYPE_VFIO_LEGACY_CONTAINER "qemu:vfio-legacy-container"
+
 typedef enum VFIOContainerFeature {
     VFIO_FEAT_LIVE_MIGRATION,
 } VFIOContainerFeature;
@@ -101,6 +103,8 @@ struct VFIOContainer {
     QLIST_ENTRY(VFIOContainer) next;
 };
 
+typedef struct VFIODevice VFIODevice;
+
 typedef struct VFIOContainerClass {
     /* private */
     ObjectClass parent_class;
@@ -126,6 +130,8 @@ typedef struct VFIOContainerClass {
                       Error **errp);
     void (*del_window)(VFIOContainer *container,
                        MemoryRegionSection *section);
+    int (*attach_device)(VFIODevice *vbasedev, AddressSpace *as, Error **errp);
+    void (*detach_device)(VFIODevice *vbasedev);
 } VFIOContainerClass;
 
 bool vfio_container_check_extension(VFIOContainer *container,
-- 
2.27.0


