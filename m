Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1B60621FE9
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Nov 2022 00:03:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osXbZ-0004s1-Af; Tue, 08 Nov 2022 18:02:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1osXbN-0004oP-3Z
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 18:02:01 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1osXbI-0003eT-Lc
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 18:01:52 -0500
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2A8Mx3cW026328
 for <qemu-devel@nongnu.org>; Tue, 8 Nov 2022 23:01:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : subject :
 date : message-id : in-reply-to : references : in-reply-to : references;
 s=corp-2022-7-12; bh=101dO0XePiqDoCCObYc7ZywMB2NbOW2iAUlv9Uos+rI=;
 b=fiUSwCkkZTlgb6aFUn7qVpamihA+fXNWfBYXKtRsP0Zk9guBsJl8xyLpKavPV7w940vN
 6/qzReaO67oXEaYsex7E4S8GQoe1x2ASl51eE1Ly7D0Z42pzZf6s2UHXS1Rnqk/7leHL
 NS+M12qzbvXRMxYopaALuMiNHuckhkgDal6HU+eSelcGDBH0c42M+3PbIfaYkEB5LlBM
 sbjrE7hI5Wc99ECHzZp5cMbBPkbVww1IB0RedcuW6Qb+dvdoLb4P203joalY2rgZfqOS
 khy+g+xtcHXVkBCMhRImNIdK4dk03b4pBhTrSaSN0HS79w3Y7wtpBu1gPyd5uvmiYU4G Zg== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3kqy68g7vu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <qemu-devel@nongnu.org>; Tue, 08 Nov 2022 23:01:44 +0000
Received: from pps.filterd
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 2A8LjK6E004437
 for <qemu-devel@nongnu.org>; Tue, 8 Nov 2022 23:01:43 GMT
Received: from bruckner.us.oracle.com (dhcp-10-65-143-202.vpn.oracle.com
 [10.65.143.202])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3kpcq2k0b9-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO)
 for <qemu-devel@nongnu.org>; Tue, 08 Nov 2022 23:01:43 +0000
From: John Johnson <john.g.johnson@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 02/24] vfio-user: add VFIO base abstract class
Date: Tue,  8 Nov 2022 15:13:24 -0800
Message-Id: <ef2ad700a3ad540febba3f935fedc23a50555d7c.1667542066.git.john.g.johnson@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1667542066.git.john.g.johnson@oracle.com>
References: <cover.1667542066.git.john.g.johnson@oracle.com>
In-Reply-To: <cover.1667542066.git.john.g.johnson@oracle.com>
References: <cover.1667542066.git.john.g.johnson@oracle.com>
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-07_11,2022-11-08_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 spamscore=0 adultscore=0
 malwarescore=0 mlxlogscore=999 mlxscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2211080151
X-Proofpoint-GUID: pYLRxRo49djbRpeVdRDi3jTarPOFv4js
X-Proofpoint-ORIG-GUID: pYLRxRo49djbRpeVdRDi3jTarPOFv4js
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=john.g.johnson@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

Add an abstract base class both the kernel driver
and user socket implementations can use to share code.

Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 hw/vfio/pci.c | 106 +++++++++++++++++++++++++++++++++++-----------------------
 hw/vfio/pci.h |  16 +++++++--
 2 files changed, 78 insertions(+), 44 deletions(-)

diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 939dcc3..60acde5 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -235,7 +235,7 @@ static void vfio_intx_update(VFIOPCIDevice *vdev, PCIINTxRoute *route)
 
 static void vfio_intx_routing_notifier(PCIDevice *pdev)
 {
-    VFIOPCIDevice *vdev = VFIO_PCI(pdev);
+    VFIOPCIDevice *vdev = VFIO_PCI_BASE(pdev);
     PCIINTxRoute route;
 
     if (vdev->interrupt != VFIO_INT_INTx) {
@@ -467,7 +467,7 @@ static void vfio_update_kvm_msi_virq(VFIOMSIVector *vector, MSIMessage msg,
 static int vfio_msix_vector_do_use(PCIDevice *pdev, unsigned int nr,
                                    MSIMessage *msg, IOHandler *handler)
 {
-    VFIOPCIDevice *vdev = VFIO_PCI(pdev);
+    VFIOPCIDevice *vdev = VFIO_PCI_BASE(pdev);
     VFIOMSIVector *vector;
     int ret;
 
@@ -561,7 +561,7 @@ static int vfio_msix_vector_use(PCIDevice *pdev,
 
 static void vfio_msix_vector_release(PCIDevice *pdev, unsigned int nr)
 {
-    VFIOPCIDevice *vdev = VFIO_PCI(pdev);
+    VFIOPCIDevice *vdev = VFIO_PCI_BASE(pdev);
     VFIOMSIVector *vector = &vdev->msi_vectors[nr];
 
     trace_vfio_msix_vector_release(vdev->vbasedev.name, nr);
@@ -1109,7 +1109,7 @@ static const MemoryRegionOps vfio_vga_ops = {
  */
 static void vfio_sub_page_bar_update_mapping(PCIDevice *pdev, int bar)
 {
-    VFIOPCIDevice *vdev = VFIO_PCI(pdev);
+    VFIOPCIDevice *vdev = VFIO_PCI_BASE(pdev);
     VFIORegion *region = &vdev->bars[bar].region;
     MemoryRegion *mmap_mr, *region_mr, *base_mr;
     PCIIORegion *r;
@@ -1155,7 +1155,7 @@ static void vfio_sub_page_bar_update_mapping(PCIDevice *pdev, int bar)
  */
 uint32_t vfio_pci_read_config(PCIDevice *pdev, uint32_t addr, int len)
 {
-    VFIOPCIDevice *vdev = VFIO_PCI(pdev);
+    VFIOPCIDevice *vdev = VFIO_PCI_BASE(pdev);
     uint32_t emu_bits = 0, emu_val = 0, phys_val = 0, val;
 
     memcpy(&emu_bits, vdev->emulated_config_bits + addr, len);
@@ -1188,7 +1188,7 @@ uint32_t vfio_pci_read_config(PCIDevice *pdev, uint32_t addr, int len)
 void vfio_pci_write_config(PCIDevice *pdev,
                            uint32_t addr, uint32_t val, int len)
 {
-    VFIOPCIDevice *vdev = VFIO_PCI(pdev);
+    VFIOPCIDevice *vdev = VFIO_PCI_BASE(pdev);
     uint32_t val_le = cpu_to_le32(val);
 
     trace_vfio_pci_write_config(vdev->vbasedev.name, addr, val, len);
@@ -2845,7 +2845,7 @@ static void vfio_unregister_req_notifier(VFIOPCIDevice *vdev)
 
 static void vfio_realize(PCIDevice *pdev, Error **errp)
 {
-    VFIOPCIDevice *vdev = VFIO_PCI(pdev);
+    VFIOPCIDevice *vdev = VFIO_PCI_BASE(pdev);
     VFIODevice *vbasedev = &vdev->vbasedev;
     VFIODevice *vbasedev_iter;
     VFIOGroup *group;
@@ -3169,7 +3169,7 @@ error:
 
 static void vfio_instance_finalize(Object *obj)
 {
-    VFIOPCIDevice *vdev = VFIO_PCI(obj);
+    VFIOPCIDevice *vdev = VFIO_PCI_BASE(obj);
     VFIOGroup *group = vdev->vbasedev.group;
 
     vfio_display_finalize(vdev);
@@ -3189,7 +3189,7 @@ static void vfio_instance_finalize(Object *obj)
 
 static void vfio_exitfn(PCIDevice *pdev)
 {
-    VFIOPCIDevice *vdev = VFIO_PCI(pdev);
+    VFIOPCIDevice *vdev = VFIO_PCI_BASE(pdev);
 
     vfio_unregister_req_notifier(vdev);
     vfio_unregister_err_notifier(vdev);
@@ -3208,7 +3208,7 @@ static void vfio_exitfn(PCIDevice *pdev)
 
 static void vfio_pci_reset(DeviceState *dev)
 {
-    VFIOPCIDevice *vdev = VFIO_PCI(dev);
+    VFIOPCIDevice *vdev = VFIO_PCI_BASE(dev);
 
     trace_vfio_pci_reset(vdev->vbasedev.name);
 
@@ -3248,7 +3248,7 @@ post_reset:
 static void vfio_instance_init(Object *obj)
 {
     PCIDevice *pci_dev = PCI_DEVICE(obj);
-    VFIOPCIDevice *vdev = VFIO_PCI(obj);
+    VFIOPCIDevice *vdev = VFIO_PCI_BASE(obj);
 
     device_add_bootindex_property(obj, &vdev->bootindex,
                                   "bootindex", NULL,
@@ -3265,24 +3265,12 @@ static void vfio_instance_init(Object *obj)
     pci_dev->cap_present |= QEMU_PCI_CAP_EXPRESS;
 }
 
-static Property vfio_pci_dev_properties[] = {
-    DEFINE_PROP_PCI_HOST_DEVADDR("host", VFIOPCIDevice, host),
-    DEFINE_PROP_STRING("sysfsdev", VFIOPCIDevice, vbasedev.sysfsdev),
+static Property vfio_pci_base_dev_properties[] = {
     DEFINE_PROP_ON_OFF_AUTO("x-pre-copy-dirty-page-tracking", VFIOPCIDevice,
                             vbasedev.pre_copy_dirty_page_tracking,
                             ON_OFF_AUTO_ON),
-    DEFINE_PROP_ON_OFF_AUTO("display", VFIOPCIDevice,
-                            display, ON_OFF_AUTO_OFF),
-    DEFINE_PROP_UINT32("xres", VFIOPCIDevice, display_xres, 0),
-    DEFINE_PROP_UINT32("yres", VFIOPCIDevice, display_yres, 0),
     DEFINE_PROP_UINT32("x-intx-mmap-timeout-ms", VFIOPCIDevice,
                        intx.mmap_timeout, 1100),
-    DEFINE_PROP_BIT("x-vga", VFIOPCIDevice, features,
-                    VFIO_FEATURE_ENABLE_VGA_BIT, false),
-    DEFINE_PROP_BIT("x-req", VFIOPCIDevice, features,
-                    VFIO_FEATURE_ENABLE_REQ_BIT, true),
-    DEFINE_PROP_BIT("x-igd-opregion", VFIOPCIDevice, features,
-                    VFIO_FEATURE_ENABLE_IGD_OPREGION_BIT, false),
     DEFINE_PROP_BOOL("x-enable-migration", VFIOPCIDevice,
                      vbasedev.enable_migration, false),
     DEFINE_PROP_BOOL("x-no-mmap", VFIOPCIDevice, vbasedev.no_mmap, false),
@@ -3291,8 +3279,6 @@ static Property vfio_pci_dev_properties[] = {
     DEFINE_PROP_BOOL("x-no-kvm-intx", VFIOPCIDevice, no_kvm_intx, false),
     DEFINE_PROP_BOOL("x-no-kvm-msi", VFIOPCIDevice, no_kvm_msi, false),
     DEFINE_PROP_BOOL("x-no-kvm-msix", VFIOPCIDevice, no_kvm_msix, false),
-    DEFINE_PROP_BOOL("x-no-geforce-quirks", VFIOPCIDevice,
-                     no_geforce_quirks, false),
     DEFINE_PROP_BOOL("x-no-kvm-ioeventfd", VFIOPCIDevice, no_kvm_ioeventfd,
                      false),
     DEFINE_PROP_BOOL("x-no-vfio-ioeventfd", VFIOPCIDevice, no_vfio_ioeventfd,
@@ -3303,10 +3289,6 @@ static Property vfio_pci_dev_properties[] = {
                        sub_vendor_id, PCI_ANY_ID),
     DEFINE_PROP_UINT32("x-pci-sub-device-id", VFIOPCIDevice,
                        sub_device_id, PCI_ANY_ID),
-    DEFINE_PROP_UINT32("x-igd-gms", VFIOPCIDevice, igd_gms, 0),
-    DEFINE_PROP_UNSIGNED_NODEFAULT("x-nv-gpudirect-clique", VFIOPCIDevice,
-                                   nv_gpudirect_clique,
-                                   qdev_prop_nv_gpudirect_clique, uint8_t),
     DEFINE_PROP_OFF_AUTO_PCIBAR("x-msix-relocation", VFIOPCIDevice, msix_relo,
                                 OFF_AUTOPCIBAR_OFF),
     /*
@@ -3317,28 +3299,25 @@ static Property vfio_pci_dev_properties[] = {
     DEFINE_PROP_END_OF_LIST(),
 };
 
-static void vfio_pci_dev_class_init(ObjectClass *klass, void *data)
+static void vfio_pci_base_dev_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
     PCIDeviceClass *pdc = PCI_DEVICE_CLASS(klass);
 
-    dc->reset = vfio_pci_reset;
-    device_class_set_props(dc, vfio_pci_dev_properties);
-    dc->desc = "VFIO-based PCI device assignment";
+    device_class_set_props(dc, vfio_pci_base_dev_properties);
+    dc->desc = "VFIO PCI base device";
     set_bit(DEVICE_CATEGORY_MISC, dc->categories);
-    pdc->realize = vfio_realize;
     pdc->exit = vfio_exitfn;
     pdc->config_read = vfio_pci_read_config;
     pdc->config_write = vfio_pci_write_config;
 }
 
-static const TypeInfo vfio_pci_dev_info = {
-    .name = TYPE_VFIO_PCI,
+static const TypeInfo vfio_pci_base_dev_info = {
+    .name = TYPE_VFIO_PCI_BASE,
     .parent = TYPE_PCI_DEVICE,
-    .instance_size = sizeof(VFIOPCIDevice),
-    .class_init = vfio_pci_dev_class_init,
-    .instance_init = vfio_instance_init,
-    .instance_finalize = vfio_instance_finalize,
+    .instance_size = 0,
+    .abstract = true,
+    .class_init = vfio_pci_base_dev_class_init,
     .interfaces = (InterfaceInfo[]) {
         { INTERFACE_PCIE_DEVICE },
         { INTERFACE_CONVENTIONAL_PCI_DEVICE },
@@ -3346,6 +3325,48 @@ static const TypeInfo vfio_pci_dev_info = {
     },
 };
 
+static Property vfio_pci_dev_properties[] = {
+    DEFINE_PROP_PCI_HOST_DEVADDR("host", VFIOPCIDevice, host),
+    DEFINE_PROP_STRING("sysfsdev", VFIOPCIDevice, vbasedev.sysfsdev),
+    DEFINE_PROP_ON_OFF_AUTO("display", VFIOPCIDevice,
+                            display, ON_OFF_AUTO_OFF),
+    DEFINE_PROP_UINT32("xres", VFIOPCIDevice, display_xres, 0),
+    DEFINE_PROP_UINT32("yres", VFIOPCIDevice, display_yres, 0),
+    DEFINE_PROP_BIT("x-vga", VFIOPCIDevice, features,
+                    VFIO_FEATURE_ENABLE_VGA_BIT, false),
+    DEFINE_PROP_BIT("x-req", VFIOPCIDevice, features,
+                    VFIO_FEATURE_ENABLE_REQ_BIT, true),
+    DEFINE_PROP_BIT("x-igd-opregion", VFIOPCIDevice, features,
+                    VFIO_FEATURE_ENABLE_IGD_OPREGION_BIT, false),
+    DEFINE_PROP_BOOL("x-no-geforce-quirks", VFIOPCIDevice,
+                     no_geforce_quirks, false),
+    DEFINE_PROP_UINT32("x-igd-gms", VFIOPCIDevice, igd_gms, 0),
+    DEFINE_PROP_UNSIGNED_NODEFAULT("x-nv-gpudirect-clique", VFIOPCIDevice,
+                                   nv_gpudirect_clique,
+                                   qdev_prop_nv_gpudirect_clique, uint8_t),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void vfio_pci_dev_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    PCIDeviceClass *pdc = PCI_DEVICE_CLASS(klass);
+
+    dc->reset = vfio_pci_reset;
+    device_class_set_props(dc, vfio_pci_dev_properties);
+    dc->desc = "VFIO-based PCI device assignment";
+    pdc->realize = vfio_realize;
+}
+
+static const TypeInfo vfio_pci_dev_info = {
+    .name = TYPE_VFIO_PCI,
+    .parent = TYPE_VFIO_PCI_BASE,
+    .instance_size = sizeof(VFIOKernPCIDevice),
+    .class_init = vfio_pci_dev_class_init,
+    .instance_init = vfio_instance_init,
+    .instance_finalize = vfio_instance_finalize,
+};
+
 static Property vfio_pci_dev_nohotplug_properties[] = {
     DEFINE_PROP_BOOL("ramfb", VFIOPCIDevice, enable_ramfb, false),
     DEFINE_PROP_END_OF_LIST(),
@@ -3362,12 +3383,13 @@ static void vfio_pci_nohotplug_dev_class_init(ObjectClass *klass, void *data)
 static const TypeInfo vfio_pci_nohotplug_dev_info = {
     .name = TYPE_VFIO_PCI_NOHOTPLUG,
     .parent = TYPE_VFIO_PCI,
-    .instance_size = sizeof(VFIOPCIDevice),
+    .instance_size = sizeof(VFIOKernPCIDevice),
     .class_init = vfio_pci_nohotplug_dev_class_init,
 };
 
 static void register_vfio_pci_dev_type(void)
 {
+    type_register_static(&vfio_pci_base_dev_info);
     type_register_static(&vfio_pci_dev_info);
     type_register_static(&vfio_pci_nohotplug_dev_info);
 }
diff --git a/hw/vfio/pci.h b/hw/vfio/pci.h
index 7c236a5..7c5c8ec 100644
--- a/hw/vfio/pci.h
+++ b/hw/vfio/pci.h
@@ -115,8 +115,13 @@ typedef struct VFIOMSIXInfo {
     unsigned long *pending;
 } VFIOMSIXInfo;
 
-#define TYPE_VFIO_PCI "vfio-pci"
-OBJECT_DECLARE_SIMPLE_TYPE(VFIOPCIDevice, VFIO_PCI)
+/*
+ * TYPE_VFIO_PCI_BASE is an abstract type used to share code
+ * between VFIO implementations that use a kernel driver
+ * with those that use user sockets.
+ */
+#define TYPE_VFIO_PCI_BASE "vfio-pci-base"
+OBJECT_DECLARE_SIMPLE_TYPE(VFIOPCIDevice, VFIO_PCI_BASE)
 
 struct VFIOPCIDevice {
     PCIDevice pdev;
@@ -177,6 +182,13 @@ struct VFIOPCIDevice {
     Notifier irqchip_change_notifier;
 };
 
+#define TYPE_VFIO_PCI "vfio-pci"
+OBJECT_DECLARE_SIMPLE_TYPE(VFIOKernPCIDevice, VFIO_PCI)
+
+struct VFIOKernPCIDevice {
+    VFIOPCIDevice device;
+};
+
 /* Use uin32_t for vendor & device so PCI_ANY_ID expands and cannot match hw */
 static inline bool vfio_pci_is(VFIOPCIDevice *vdev, uint32_t vendor, uint32_t device)
 {
-- 
1.8.3.1


