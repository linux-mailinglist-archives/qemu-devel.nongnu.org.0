Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E723D4D1D8
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jun 2019 17:16:44 +0200 (CEST)
Received: from localhost ([::1]:49064 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hdynr-0004Bj-GM
	for lists+qemu-devel@lfdr.de; Thu, 20 Jun 2019 11:16:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38066)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <kwankhede@nvidia.com>) id 1hdyKa-0006DL-2x
 for qemu-devel@nongnu.org; Thu, 20 Jun 2019 10:46:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwankhede@nvidia.com>) id 1hdyKY-0006DK-SZ
 for qemu-devel@nongnu.org; Thu, 20 Jun 2019 10:46:27 -0400
Received: from hqemgate15.nvidia.com ([216.228.121.64]:6456)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwankhede@nvidia.com>)
 id 1hdyKY-0006Al-J7
 for qemu-devel@nongnu.org; Thu, 20 Jun 2019 10:46:26 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5d0b9b0f0002>; Thu, 20 Jun 2019 07:41:20 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Thu, 20 Jun 2019 07:41:18 -0700
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Thu, 20 Jun 2019 07:41:18 -0700
Received: from HQMAIL106.nvidia.com (172.18.146.12) by HQMAIL103.nvidia.com
 (172.20.187.11) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 20 Jun
 2019 14:41:18 +0000
Received: from kwankhede-dev.nvidia.com (172.20.13.39) by HQMAIL.nvidia.com
 (172.18.146.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Thu, 20 Jun 2019 14:41:12 +0000
From: Kirti Wankhede <kwankhede@nvidia.com>
To: <alex.williamson@redhat.com>, <cjia@nvidia.com>
Date: Thu, 20 Jun 2019 20:07:40 +0530
Message-ID: <1561041461-22326-13-git-send-email-kwankhede@nvidia.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <1561041461-22326-1-git-send-email-kwankhede@nvidia.com>
References: <1561041461-22326-1-git-send-email-kwankhede@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1561041680; bh=ppqMB6UfbPIBKPvs9O0vDjVXpwPZivlPc7fIHiWjiVM=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:X-NVConfidentiality:MIME-Version:
 Content-Type;
 b=X8Z09RjKoRqGKkpN+PGynLe4AKAuPaFecLTTuLg5XWFivMArbRnWqAA0RJJ8UHJob
 AF+jFtTPQbjxwYrWwFMResg0puXyZwRXDRP8l5LUv3uYjhmfhf6TI52Xs5ebzQ9gJ5
 prhmkMfl9ApQqfZWZjlJh0D2EvBLDP5V3R6BUOD7iiUVLDiyI8r4SK+tzyebDXRkKK
 9oWf/COY8lS8+6SEcz4bkTW+NlYT27WVMPL6A75uR0N/Hw+kITKz5RwahOVGttxhbZ
 boVEppw654g5R9kyw2BpIjH6tXbTyTg9/nxKLjQCb14q4yYsVX8iU0vDo+J1iUY4IG
 yQHRt+AICsBaQ==
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8
X-Received-From: 216.228.121.64
Subject: [Qemu-devel] [PATCH v4 12/13] vfio: Make vfio-pci device migration
 capable.
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
Cc: Kirti Wankhede <kwankhede@nvidia.com>, Zhengxiao.zx@Alibaba-inc.com,
 kevin.tian@intel.com, yi.l.liu@intel.com, yan.y.zhao@intel.com,
 eskultet@redhat.com, ziye.yang@intel.com, qemu-devel@nongnu.org,
 cohuck@redhat.com, shuangtai.tst@alibaba-inc.com, dgilbert@redhat.com,
 zhi.a.wang@intel.com, mlevitsk@redhat.com, pasic@linux.ibm.com, aik@ozlabs.ru,
 yulei.zhang@intel.com, eauger@redhat.com, felipe@nutanix.com,
 jonathan.davies@nutanix.com, changpeng.liu@intel.com, Ken.Xue@amd.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Call vfio_migration_probe() and vfio_migration_finalize() functions for
vfio-pci device to enable migration for vfio PCI device.
Removed vfio_pci_vmstate structure.

Signed-off-by: Kirti Wankhede <kwankhede@nvidia.com>
Reviewed-by: Neo Jia <cjia@nvidia.com>
---
 hw/vfio/pci.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 09a0821a5b1c..b230b0ab9282 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -2839,6 +2839,7 @@ static void vfio_realize(PCIDevice *pdev, Error **errp)
     vdev->vbasedev.ops = &vfio_pci_ops;
     vdev->vbasedev.type = VFIO_DEVICE_TYPE_PCI;
     vdev->vbasedev.dev = DEVICE(vdev);
+    vdev->vbasedev.device_state = VFIO_DEVICE_STATE_STOPPED;
 
     tmp = g_strdup_printf("%s/iommu_group", vdev->vbasedev.sysfsdev);
     len = readlink(tmp, group_path, sizeof(group_path));
@@ -3099,6 +3100,11 @@ static void vfio_realize(PCIDevice *pdev, Error **errp)
         }
     }
 
+    ret = vfio_migration_probe(&vdev->vbasedev, errp);
+    if (ret) {
+            error_report("Failed to setup migration region");
+    }
+
     vfio_register_err_notifier(vdev);
     vfio_register_req_notifier(vdev);
     vfio_setup_resetfn_quirk(vdev);
@@ -3118,6 +3124,7 @@ static void vfio_instance_finalize(Object *obj)
     VFIOPCIDevice *vdev = PCI_VFIO(obj);
     VFIOGroup *group = vdev->vbasedev.group;
 
+    vdev->vbasedev.device_state = VFIO_DEVICE_STATE_STOPPED;
     vfio_display_finalize(vdev);
     vfio_bars_finalize(vdev);
     g_free(vdev->emulated_config_bits);
@@ -3146,6 +3153,7 @@ static void vfio_exitfn(PCIDevice *pdev)
     }
     vfio_teardown_msi(vdev);
     vfio_bars_exit(vdev);
+    vfio_migration_finalize(&vdev->vbasedev);
 }
 
 static void vfio_pci_reset(DeviceState *dev)
@@ -3254,11 +3262,6 @@ static Property vfio_pci_dev_properties[] = {
     DEFINE_PROP_END_OF_LIST(),
 };
 
-static const VMStateDescription vfio_pci_vmstate = {
-    .name = "vfio-pci",
-    .unmigratable = 1,
-};
-
 static void vfio_pci_dev_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
@@ -3266,7 +3269,6 @@ static void vfio_pci_dev_class_init(ObjectClass *klass, void *data)
 
     dc->reset = vfio_pci_reset;
     dc->props = vfio_pci_dev_properties;
-    dc->vmsd = &vfio_pci_vmstate;
     dc->desc = "VFIO-based PCI device assignment";
     set_bit(DEVICE_CATEGORY_MISC, dc->categories);
     pdc->realize = vfio_realize;
-- 
2.7.0


