Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CEC89D699
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Aug 2019 21:27:32 +0200 (CEST)
Received: from localhost ([::1]:56904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i2KeI-0002f4-QZ
	for lists+qemu-devel@lfdr.de; Mon, 26 Aug 2019 15:27:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39472)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwankhede@nvidia.com>) id 1i2Kbv-0000nM-Mc
 for qemu-devel@nongnu.org; Mon, 26 Aug 2019 15:25:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwankhede@nvidia.com>) id 1i2Kbu-0000cv-HW
 for qemu-devel@nongnu.org; Mon, 26 Aug 2019 15:25:03 -0400
Received: from hqemgate14.nvidia.com ([216.228.121.143]:15390)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwankhede@nvidia.com>)
 id 1i2Kbu-0000cX-9s
 for qemu-devel@nongnu.org; Mon, 26 Aug 2019 15:25:02 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5d64320d0000>; Mon, 26 Aug 2019 12:25:01 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Mon, 26 Aug 2019 12:25:01 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Mon, 26 Aug 2019 12:25:01 -0700
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 26 Aug
 2019 19:25:00 +0000
Received: from kwankhede-dev.nvidia.com (10.124.1.5) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Mon, 26 Aug 2019 19:24:54 +0000
From: Kirti Wankhede <kwankhede@nvidia.com>
To: <alex.williamson@redhat.com>, <cjia@nvidia.com>
Date: Tue, 27 Aug 2019 00:25:53 +0530
Message-ID: <1566845753-18993-14-git-send-email-kwankhede@nvidia.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <1566845753-18993-1-git-send-email-kwankhede@nvidia.com>
References: <1566845753-18993-1-git-send-email-kwankhede@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1566847501; bh=df14Ft0qKWquEK21v/PWdhV5l0TbCulk9wDlfK2gtyo=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:X-NVConfidentiality:MIME-Version:
 Content-Type;
 b=p2T4AzPjftQ+sF+bVdXOSzCUkdt+/kAMWuZQL1KKgNjt9G2TEhx/M87/NOgHsQUEE
 BjbF5Rq4wduQsKFonAeU1E7lP8lJiI+g3uuRsY9VSlXvVTlDw3mrRL4twtxTCEaXQO
 4fDWEgfjXR+/3LU3Yo0rDn9UY4fRTLSVHc5rHB/kU1tX08OMs8P7bYBmyT9fvOUMVG
 8Kx92LIUzZONYa74iWMOu/b6Ioghqc8cslHWJgnOSUY5HG9PI80oaRrx2yl6brVyEa
 SxiaCxYSjomV/wLXt1yvfDIAvQWkfjmNJycn4/f2j3nWi4CxNDFHS7mf3NtNF628qZ
 3VntWhhlpZu1A==
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8
X-Received-From: 216.228.121.143
Subject: [Qemu-devel] [PATCH v8 13/13] vfio: Make vfio-pci device migration
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
Cc: Zhengxiao.zx@Alibaba-inc.com, kevin.tian@intel.com, yi.l.liu@intel.com,
 yan.y.zhao@intel.com, eskultet@redhat.com, ziye.yang@intel.com,
 qemu-devel@nongnu.org, cohuck@redhat.com, shuangtai.tst@alibaba-inc.com,
 dgilbert@redhat.com, zhi.a.wang@intel.com, mlevitsk@redhat.com,
 pasic@linux.ibm.com, aik@ozlabs.ru, Kirti Wankhede <kwankhede@nvidia.com>,
 eauger@redhat.com, felipe@nutanix.com, jonathan.davies@nutanix.com,
 changpeng.liu@intel.com, Ken.Xue@amd.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Call vfio_migration_probe() and vfio_migration_finalize() functions for
vfio-pci device to enable migration for vfio PCI device.
Removed vfio_pci_vmstate structure.

Signed-off-by: Kirti Wankhede <kwankhede@nvidia.com>
Reviewed-by: Neo Jia <cjia@nvidia.com>
---
 hw/vfio/pci.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 161068286592..514cf1b0ce16 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -2911,6 +2911,7 @@ static void vfio_realize(PCIDevice *pdev, Error **errp)
     vdev->vbasedev.ops = &vfio_pci_ops;
     vdev->vbasedev.type = VFIO_DEVICE_TYPE_PCI;
     vdev->vbasedev.dev = DEVICE(vdev);
+    vdev->vbasedev.device_state = 0;
 
     tmp = g_strdup_printf("%s/iommu_group", vdev->vbasedev.sysfsdev);
     len = readlink(tmp, group_path, sizeof(group_path));
@@ -3171,6 +3172,12 @@ static void vfio_realize(PCIDevice *pdev, Error **errp)
         }
     }
 
+    ret = vfio_migration_probe(&vdev->vbasedev, errp);
+    if (ret) {
+            error_report("%s: Failed to setup for migration",
+                         vdev->vbasedev.name);
+    }
+
     vfio_register_err_notifier(vdev);
     vfio_register_req_notifier(vdev);
     vfio_setup_resetfn_quirk(vdev);
@@ -3190,6 +3197,7 @@ static void vfio_instance_finalize(Object *obj)
     VFIOPCIDevice *vdev = PCI_VFIO(obj);
     VFIOGroup *group = vdev->vbasedev.group;
 
+    vdev->vbasedev.device_state = 0;
     vfio_display_finalize(vdev);
     vfio_bars_finalize(vdev);
     g_free(vdev->emulated_config_bits);
@@ -3218,6 +3226,7 @@ static void vfio_exitfn(PCIDevice *pdev)
     }
     vfio_teardown_msi(vdev);
     vfio_bars_exit(vdev);
+    vfio_migration_finalize(&vdev->vbasedev);
 }
 
 static void vfio_pci_reset(DeviceState *dev)
@@ -3326,11 +3335,6 @@ static Property vfio_pci_dev_properties[] = {
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
@@ -3338,7 +3342,6 @@ static void vfio_pci_dev_class_init(ObjectClass *klass, void *data)
 
     dc->reset = vfio_pci_reset;
     dc->props = vfio_pci_dev_properties;
-    dc->vmsd = &vfio_pci_vmstate;
     dc->desc = "VFIO-based PCI device assignment";
     set_bit(DEVICE_CATEGORY_MISC, dc->categories);
     pdc->realize = vfio_realize;
-- 
2.7.0


