Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B7D868758A
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 06:51:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNSPE-000882-Bj; Thu, 02 Feb 2023 00:45:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1pNSPB-00087J-HU
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 00:45:05 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1pNSP8-0006y1-Py
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 00:45:05 -0500
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3124ipUu027511; Thu, 2 Feb 2023 05:45:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : in-reply-to :
 references; s=corp-2022-7-12;
 bh=FuJnF2nuDCYKxxkivwiPAVRu9Zh3w0ih6f2xXe3nabo=;
 b=cilcGlj8lu/6nT+U5vpne2xGWgF02iN70lDtF1N+VoRW1ZE3tmw2uv4d8kw9AEL8HueB
 /JhhAPlhCuIYHzKVGeAP+Cnf/9isYzFoUgSwbk733C57LHvobNK6vr4gYAGIrGnitnOk
 9Q+ZeC8a4zb3Ej01Zk053y6f8Q1GO7RC2MEn8ZH5OYB1shJBFMXwJA8pRxvh8nhpe3vX
 7LyTKNyS/0cSHN35OFqgZ1NoH34s+LnOw18bx316TY38BdPurG7w8bmUXGEA3XNSkYAN
 8i/fXaoRhGRz6Tf1TG4nWKRjwJiepgGCZ7osVVStlDUknW7kt2l5Gz1unE8jHcExrgmp Cw== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3nfpywj0vu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 02 Feb 2023 05:45:00 +0000
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 31254PpY013015; Thu, 2 Feb 2023 05:44:58 GMT
Received: from bruckner.us.oracle.com (dhcp-10-65-133-23.vpn.oracle.com
 [10.65.133.23])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3nct5f5gb1-6
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Thu, 02 Feb 2023 05:44:58 +0000
From: John Johnson <john.g.johnson@oracle.com>
To: qemu-devel@nongnu.org
Cc: alex.williamson@redhat.com, clg@redhat.com, philmd@linaro.org
Subject: [PATCH v2 05/23] vfio-user: add device IO ops vector
Date: Wed,  1 Feb 2023 21:55:41 -0800
Message-Id: <ca3da31c5bde8460327e4017a7285b47ca390e5f.1675228037.git.john.g.johnson@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1675228037.git.john.g.johnson@oracle.com>
References: <cover.1675228037.git.john.g.johnson@oracle.com>
In-Reply-To: <cover.1675228037.git.john.g.johnson@oracle.com>
References: <cover.1675228037.git.john.g.johnson@oracle.com>
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-01_15,2023-01-31_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 phishscore=0 malwarescore=0
 adultscore=0 bulkscore=0 mlxscore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302020053
X-Proofpoint-GUID: 75XSaaLHB_o16j6Bs79hRYFlwC6FOGdY
X-Proofpoint-ORIG-GUID: 75XSaaLHB_o16j6Bs79hRYFlwC6FOGdY
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=john.g.johnson@oracle.com; helo=mx0a-00069f02.pphosted.com
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

Used for communication with VFIO driver
(prep work for vfio-user, which will communicate over a socket)

Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
---
 include/hw/vfio/vfio-common.h |  14 +++++
 hw/vfio/ap.c                  |   1 +
 hw/vfio/ccw.c                 |   1 +
 hw/vfio/common.c              |  85 +++++++++++++++++++++----
 hw/vfio/pci.c                 | 140 ++++++++++++++++++++++++++----------------
 hw/vfio/platform.c            |   1 +
 6 files changed, 178 insertions(+), 64 deletions(-)

diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
index 7779cc7..c2ff9ea 100644
--- a/include/hw/vfio/vfio-common.h
+++ b/include/hw/vfio/vfio-common.h
@@ -124,6 +124,7 @@ typedef struct VFIOHostDMAWindow {
 } VFIOHostDMAWindow;
 
 typedef struct VFIODeviceOps VFIODeviceOps;
+typedef struct VFIODeviceIO VFIODeviceIO;
 
 typedef struct VFIODevice {
     QLIST_ENTRY(VFIODevice) next;
@@ -139,6 +140,7 @@ typedef struct VFIODevice {
     bool ram_block_discard_allowed;
     bool enable_migration;
     VFIODeviceOps *ops;
+    VFIODeviceIO *io;
     unsigned int num_irqs;
     unsigned int num_regions;
     unsigned int flags;
@@ -165,6 +167,16 @@ struct VFIODeviceOps {
  * through ioctl() to the kernel VFIO driver, but vfio-user
  * can use a socket to a remote process.
  */
+struct VFIODeviceIO {
+    int (*get_region_info)(VFIODevice *vdev,
+                           struct vfio_region_info *info);
+    int (*get_irq_info)(VFIODevice *vdev, struct vfio_irq_info *irq);
+    int (*set_irqs)(VFIODevice *vdev, struct vfio_irq_set *irqs);
+    int (*region_read)(VFIODevice *vdev, uint8_t nr, off_t off, uint32_t size,
+                       void *data);
+    int (*region_write)(VFIODevice *vdev, uint8_t nr, off_t off, uint32_t size,
+                        void *data);
+};
 
 struct VFIOContainerIO {
     int (*dma_map)(VFIOContainer *container,
@@ -177,6 +189,8 @@ struct VFIOContainerIO {
                         struct vfio_iommu_type1_dirty_bitmap_get *range);
 };
 
+extern VFIODeviceIO vfio_dev_io_ioctl;
+
 #endif /* CONFIG_LINUX */
 
 typedef struct VFIOGroup {
diff --git a/hw/vfio/ap.c b/hw/vfio/ap.c
index e0dd561..c6638d5 100644
--- a/hw/vfio/ap.c
+++ b/hw/vfio/ap.c
@@ -102,6 +102,7 @@ static void vfio_ap_realize(DeviceState *dev, Error **errp)
     mdevid = basename(vapdev->vdev.sysfsdev);
     vapdev->vdev.name = g_strdup_printf("%s", mdevid);
     vapdev->vdev.dev = dev;
+    vapdev->vdev.io = &vfio_dev_io_ioctl;
 
     /*
      * vfio-ap devices operate in a way compatible with discarding of
diff --git a/hw/vfio/ccw.c b/hw/vfio/ccw.c
index 06b588c..e4d840d 100644
--- a/hw/vfio/ccw.c
+++ b/hw/vfio/ccw.c
@@ -614,6 +614,7 @@ static void vfio_ccw_get_device(VFIOGroup *group, VFIOCCWDevice *vcdev,
     vcdev->vdev.type = VFIO_DEVICE_TYPE_CCW;
     vcdev->vdev.name = name;
     vcdev->vdev.dev = &vcdev->cdev.parent_obj.parent_obj;
+    vcdev->vdev.io = &vfio_dev_io_ioctl;
 
     return;
 
diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index f895b51..45b950a 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -73,7 +73,7 @@ void vfio_disable_irqindex(VFIODevice *vbasedev, int index)
         .count = 0,
     };
 
-    ioctl(vbasedev->fd, VFIO_DEVICE_SET_IRQS, &irq_set);
+    vbasedev->io->set_irqs(vbasedev, &irq_set);
 }
 
 void vfio_unmask_single_irqindex(VFIODevice *vbasedev, int index)
@@ -86,7 +86,7 @@ void vfio_unmask_single_irqindex(VFIODevice *vbasedev, int index)
         .count = 1,
     };
 
-    ioctl(vbasedev->fd, VFIO_DEVICE_SET_IRQS, &irq_set);
+    vbasedev->io->set_irqs(vbasedev, &irq_set);
 }
 
 void vfio_mask_single_irqindex(VFIODevice *vbasedev, int index)
@@ -99,7 +99,7 @@ void vfio_mask_single_irqindex(VFIODevice *vbasedev, int index)
         .count = 1,
     };
 
-    ioctl(vbasedev->fd, VFIO_DEVICE_SET_IRQS, &irq_set);
+    vbasedev->io->set_irqs(vbasedev, &irq_set);
 }
 
 static inline const char *action_to_str(int action)
@@ -180,9 +180,7 @@ int vfio_set_irq_signaling(VFIODevice *vbasedev, int index, int subindex,
     pfd = (int32_t *)&irq_set->data;
     *pfd = fd;
 
-    if (ioctl(vbasedev->fd, VFIO_DEVICE_SET_IRQS, irq_set)) {
-        ret = -errno;
-    }
+    ret = vbasedev->io->set_irqs(vbasedev, irq_set);
     g_free(irq_set);
 
     if (!ret) {
@@ -217,6 +215,7 @@ void vfio_region_write(void *opaque, hwaddr addr,
         uint32_t dword;
         uint64_t qword;
     } buf;
+    int ret;
 
     switch (size) {
     case 1:
@@ -236,13 +235,13 @@ void vfio_region_write(void *opaque, hwaddr addr,
         break;
     }
 
-    if (pwrite(vbasedev->fd, &buf, size, region->fd_offset + addr) != size) {
+    ret = vbasedev->io->region_write(vbasedev, region->nr, addr, size, &buf);
+    if (ret != size) {
         error_report("%s(%s:region%d+0x%"HWADDR_PRIx", 0x%"PRIx64
                      ",%d) failed: %m",
                      __func__, vbasedev->name, region->nr,
                      addr, data, size);
     }
-
     trace_vfio_region_write(vbasedev->name, region->nr, addr, data, size);
 
     /*
@@ -268,13 +267,16 @@ uint64_t vfio_region_read(void *opaque,
         uint64_t qword;
     } buf;
     uint64_t data = 0;
+    int ret;
 
-    if (pread(vbasedev->fd, &buf, size, region->fd_offset + addr) != size) {
+    ret = vbasedev->io->region_read(vbasedev, region->nr, addr, size, &buf);
+    if (ret != size) {
         error_report("%s(%s:region%d+0x%"HWADDR_PRIx", %d) failed: %m",
                      __func__, vbasedev->name, region->nr,
                      addr, size);
         return (uint64_t)-1;
     }
+
     switch (size) {
     case 1:
         data = buf.byte;
@@ -2452,6 +2454,7 @@ int vfio_get_region_info(VFIODevice *vbasedev, int index,
                          struct vfio_region_info **info)
 {
     size_t argsz = sizeof(struct vfio_region_info);
+    int ret;
 
     /* create region cache */
     if (vbasedev->regions == NULL) {
@@ -2470,10 +2473,11 @@ int vfio_get_region_info(VFIODevice *vbasedev, int index,
 retry:
     (*info)->argsz = argsz;
 
-    if (ioctl(vbasedev->fd, VFIO_DEVICE_GET_REGION_INFO, *info)) {
+    ret = vbasedev->io->get_region_info(vbasedev, *info);
+    if (ret != 0) {
         g_free(*info);
         *info = NULL;
-        return -errno;
+        return ret;
     }
 
     if ((*info)->argsz > argsz) {
@@ -2634,6 +2638,65 @@ int vfio_eeh_as_op(AddressSpace *as, uint32_t op)
  * Traditional ioctl() based io
  */
 
+static int vfio_io_get_region_info(VFIODevice *vbasedev,
+                                   struct vfio_region_info *info)
+{
+    int ret;
+
+    ret = ioctl(vbasedev->fd, VFIO_DEVICE_GET_REGION_INFO, info);
+
+    return ret < 0 ? -errno : ret;
+}
+
+static int vfio_io_get_irq_info(VFIODevice *vbasedev,
+                                struct vfio_irq_info *info)
+{
+    int ret;
+
+    ret = ioctl(vbasedev->fd, VFIO_DEVICE_GET_IRQ_INFO, info);
+
+    return ret < 0 ? -errno : ret;
+}
+
+static int vfio_io_set_irqs(VFIODevice *vbasedev, struct vfio_irq_set *irqs)
+{
+    int ret;
+
+    ret = ioctl(vbasedev->fd, VFIO_DEVICE_SET_IRQS, irqs);
+
+    return ret < 0 ? -errno : ret;
+}
+
+static int vfio_io_region_read(VFIODevice *vbasedev, uint8_t index, off_t off,
+                               uint32_t size, void *data)
+{
+    struct vfio_region_info *info = vbasedev->regions[index];
+    int ret;
+
+    ret = pread(vbasedev->fd, data, size, info->offset + off);
+
+    return ret < 0 ? -errno : ret;
+}
+
+static int vfio_io_region_write(VFIODevice *vbasedev, uint8_t index, off_t off,
+                                uint32_t size, void *data)
+{
+    struct vfio_region_info *info = vbasedev->regions[index];
+    int ret;
+
+    ret = pwrite(vbasedev->fd, data, size, info->offset + off);
+
+    return ret < 0 ? -errno : ret;
+}
+
+VFIODeviceIO vfio_dev_io_ioctl = {
+    .get_region_info = vfio_io_get_region_info,
+    .get_irq_info = vfio_io_get_irq_info,
+    .set_irqs = vfio_io_set_irqs,
+    .region_read = vfio_io_region_read,
+    .region_write = vfio_io_region_write,
+};
+
 static int vfio_io_dma_map(VFIOContainer *container,
                            struct vfio_iommu_type1_dma_map *map)
 {
diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index b214a93..c3c2e76 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -43,6 +43,14 @@
 #include "migration/blocker.h"
 #include "migration/qemu-file.h"
 
+/* convenience macros for PCI config space */
+#define VDEV_CONFIG_READ(vbasedev, off, size, data) \
+    ((vbasedev)->io->region_read((vbasedev), VFIO_PCI_CONFIG_REGION_INDEX, \
+                                 (off), (size), (data)))
+#define VDEV_CONFIG_WRITE(vbasedev, off, size, data) \
+    ((vbasedev)->io->region_write((vbasedev), VFIO_PCI_CONFIG_REGION_INDEX, \
+                                  (off), (size), (data)))
+
 #define TYPE_VFIO_PCI_NOHOTPLUG "vfio-pci-nohotplug"
 
 /* Protected by BQL */
@@ -406,7 +414,7 @@ static int vfio_enable_vectors(VFIOPCIDevice *vdev, bool msix)
         fds[i] = fd;
     }
 
-    ret = ioctl(vdev->vbasedev.fd, VFIO_DEVICE_SET_IRQS, irq_set);
+    ret = vdev->vbasedev.io->set_irqs(&vdev->vbasedev, irq_set);
 
     g_free(irq_set);
 
@@ -818,14 +826,16 @@ static void vfio_update_msi(VFIOPCIDevice *vdev)
 
 static void vfio_pci_load_rom(VFIOPCIDevice *vdev)
 {
+    VFIODevice *vbasedev = &vdev->vbasedev;
     struct vfio_region_info *reg_info;
     uint64_t size;
     off_t off = 0;
     ssize_t bytes;
+    int ret;
 
-    if (vfio_get_region_info(&vdev->vbasedev,
-                             VFIO_PCI_ROM_REGION_INDEX, &reg_info)) {
-        error_report("vfio: Error getting ROM info: %m");
+    ret = vfio_get_region_info(vbasedev, VFIO_PCI_ROM_REGION_INDEX, &reg_info);
+    if (ret < 0) {
+        error_report("vfio: Error getting ROM info: %s", strerror(-ret));
         return;
     }
 
@@ -850,18 +860,19 @@ static void vfio_pci_load_rom(VFIOPCIDevice *vdev)
     memset(vdev->rom, 0xff, size);
 
     while (size) {
-        bytes = pread(vdev->vbasedev.fd, vdev->rom + off,
-                      size, vdev->rom_offset + off);
+        bytes = vbasedev->io->region_read(vbasedev, VFIO_PCI_ROM_REGION_INDEX,
+                                          off, size, vdev->rom + off);
         if (bytes == 0) {
             break;
         } else if (bytes > 0) {
             off += bytes;
             size -= bytes;
         } else {
-            if (errno == EINTR || errno == EAGAIN) {
+            if (bytes == -EINTR || bytes == -EAGAIN) {
                 continue;
             }
-            error_report("vfio: Error reading device ROM: %m");
+            error_report("vfio: Error reading device ROM: %s",
+                         strerror(-bytes));
             break;
         }
     }
@@ -949,11 +960,10 @@ static const MemoryRegionOps vfio_rom_ops = {
 
 static void vfio_pci_size_rom(VFIOPCIDevice *vdev)
 {
+    VFIODevice *vbasedev = &vdev->vbasedev;
     uint32_t orig, size = cpu_to_le32((uint32_t)PCI_ROM_ADDRESS_MASK);
-    off_t offset = vdev->config_offset + PCI_ROM_ADDRESS;
     DeviceState *dev = DEVICE(vdev);
     char *name;
-    int fd = vdev->vbasedev.fd;
 
     if (vdev->pdev.romfile || !vdev->pdev.rom_bar) {
         /* Since pci handles romfile, just print a message and return */
@@ -970,11 +980,12 @@ static void vfio_pci_size_rom(VFIOPCIDevice *vdev)
      * Use the same size ROM BAR as the physical device.  The contents
      * will get filled in later when the guest tries to read it.
      */
-    if (pread(fd, &orig, 4, offset) != 4 ||
-        pwrite(fd, &size, 4, offset) != 4 ||
-        pread(fd, &size, 4, offset) != 4 ||
-        pwrite(fd, &orig, 4, offset) != 4) {
-        error_report("%s(%s) failed: %m", __func__, vdev->vbasedev.name);
+    if (VDEV_CONFIG_READ(vbasedev, PCI_ROM_ADDRESS, 4, &orig) != 4 ||
+        VDEV_CONFIG_WRITE(vbasedev, PCI_ROM_ADDRESS, 4, &size) != 4 ||
+        VDEV_CONFIG_READ(vbasedev, PCI_ROM_ADDRESS, 4, &size) != 4 ||
+        VDEV_CONFIG_WRITE(vbasedev, PCI_ROM_ADDRESS, 4, &orig) != 4) {
+
+        error_report("%s(%s) ROM access failed", __func__, vbasedev->name);
         return;
     }
 
@@ -1154,6 +1165,7 @@ static void vfio_sub_page_bar_update_mapping(PCIDevice *pdev, int bar)
 uint32_t vfio_pci_read_config(PCIDevice *pdev, uint32_t addr, int len)
 {
     VFIOPCIDevice *vdev = VFIO_PCI_BASE(pdev);
+    VFIODevice *vbasedev = &vdev->vbasedev;
     uint32_t emu_bits = 0, emu_val = 0, phys_val = 0, val;
 
     memcpy(&emu_bits, vdev->emulated_config_bits + addr, len);
@@ -1166,12 +1178,13 @@ uint32_t vfio_pci_read_config(PCIDevice *pdev, uint32_t addr, int len)
     if (~emu_bits & (0xffffffffU >> (32 - len * 8))) {
         ssize_t ret;
 
-        ret = pread(vdev->vbasedev.fd, &phys_val, len,
-                    vdev->config_offset + addr);
+        ret = VDEV_CONFIG_READ(vbasedev, addr, len, &phys_val);
         if (ret != len) {
-            error_report("%s(%s, 0x%x, 0x%x) failed: %m",
-                         __func__, vdev->vbasedev.name, addr, len);
-            return -errno;
+            const char *err = ret < 0 ? strerror(-ret) : "short read";
+
+            error_report("%s(%s, 0x%x, 0x%x) failed: %s",
+                         __func__, vbasedev->name, addr, len, err);
+            return -1;
         }
         phys_val = le32_to_cpu(phys_val);
     }
@@ -1187,15 +1200,19 @@ void vfio_pci_write_config(PCIDevice *pdev,
                            uint32_t addr, uint32_t val, int len)
 {
     VFIOPCIDevice *vdev = VFIO_PCI_BASE(pdev);
+    VFIODevice *vbasedev = &vdev->vbasedev;
     uint32_t val_le = cpu_to_le32(val);
+    int ret;
 
     trace_vfio_pci_write_config(vdev->vbasedev.name, addr, val, len);
 
     /* Write everything to VFIO, let it filter out what we can't write */
-    if (pwrite(vdev->vbasedev.fd, &val_le, len, vdev->config_offset + addr)
-                != len) {
-        error_report("%s(%s, 0x%x, 0x%x, 0x%x) failed: %m",
-                     __func__, vdev->vbasedev.name, addr, val, len);
+    ret = VDEV_CONFIG_WRITE(vbasedev, addr, len, &val_le);
+    if (ret != len) {
+        const char *err = ret < 0 ? strerror(-ret) : "short write";
+
+        error_report("%s(%s, 0x%x, 0x%x, 0x%x) failed: %s",
+                     __func__, vbasedev->name, addr, val, len, err);
     }
 
     /* MSI/MSI-X Enabling/Disabling */
@@ -1283,10 +1300,13 @@ static int vfio_msi_setup(VFIOPCIDevice *vdev, int pos, Error **errp)
     int ret, entries;
     Error *err = NULL;
 
-    if (pread(vdev->vbasedev.fd, &ctrl, sizeof(ctrl),
-              vdev->config_offset + pos + PCI_CAP_FLAGS) != sizeof(ctrl)) {
-        error_setg_errno(errp, errno, "failed reading MSI PCI_CAP_FLAGS");
-        return -errno;
+    ret = VDEV_CONFIG_READ(&vdev->vbasedev, pos + PCI_CAP_FLAGS,
+                           sizeof(ctrl), &ctrl);
+    if (ret != sizeof(ctrl)) {
+        const char *err = ret < 0 ? strerror(-ret) : "short read";
+
+        error_setg(errp, "failed reading MSI PCI_CAP_FLAGS %s", err);
+        return ret;
     }
     ctrl = le16_to_cpu(ctrl);
 
@@ -1488,33 +1508,39 @@ static void vfio_pci_relocate_msix(VFIOPCIDevice *vdev, Error **errp)
  */
 static void vfio_msix_early_setup(VFIOPCIDevice *vdev, Error **errp)
 {
+    VFIODevice *vbasedev = &vdev->vbasedev;
     uint8_t pos;
     uint16_t ctrl;
     uint32_t table, pba;
-    int fd = vdev->vbasedev.fd;
     VFIOMSIXInfo *msix;
+    int ret;
 
     pos = pci_find_capability(&vdev->pdev, PCI_CAP_ID_MSIX);
     if (!pos) {
         return;
     }
 
-    if (pread(fd, &ctrl, sizeof(ctrl),
-              vdev->config_offset + pos + PCI_MSIX_FLAGS) != sizeof(ctrl)) {
-        error_setg_errno(errp, errno, "failed to read PCI MSIX FLAGS");
-        return;
+    ret = VDEV_CONFIG_READ(vbasedev, pos + PCI_MSIX_FLAGS,
+                           sizeof(ctrl), &ctrl);
+    if (ret != sizeof(ctrl)) {
+        const char *err = ret < 0 ? strerror(-ret) : "short read";
+
+        error_setg(errp, "failed to read PCI MSIX FLAGS %s", err);
     }
 
-    if (pread(fd, &table, sizeof(table),
-              vdev->config_offset + pos + PCI_MSIX_TABLE) != sizeof(table)) {
-        error_setg_errno(errp, errno, "failed to read PCI MSIX TABLE");
-        return;
+    ret = VDEV_CONFIG_READ(vbasedev, pos + PCI_MSIX_TABLE,
+                           sizeof(table), &table);
+    if (ret != sizeof(table)) {
+        const char *err = ret < 0 ? strerror(-ret) : "short read";
+
+        error_setg(errp, "failed to read PCI MSIX TABLE %s", err);
     }
 
-    if (pread(fd, &pba, sizeof(pba),
-              vdev->config_offset + pos + PCI_MSIX_PBA) != sizeof(pba)) {
-        error_setg_errno(errp, errno, "failed to read PCI MSIX PBA");
-        return;
+    ret = VDEV_CONFIG_READ(vbasedev, pos + PCI_MSIX_PBA, sizeof(pba), &pba);
+    if (ret != sizeof(pba)) {
+        const char *err = ret < 0 ? strerror(-ret) : "short read";
+
+        error_setg(errp, "failed to read PCI MSIX PBA %s", err);
     }
 
     ctrl = le16_to_cpu(ctrl);
@@ -1652,7 +1678,6 @@ static void vfio_mmap_set_enabled(VFIOPCIDevice *vdev, bool enabled)
 static void vfio_bar_prepare(VFIOPCIDevice *vdev, int nr)
 {
     VFIOBAR *bar = &vdev->bars[nr];
-
     uint32_t pci_bar;
     int ret;
 
@@ -1662,10 +1687,12 @@ static void vfio_bar_prepare(VFIOPCIDevice *vdev, int nr)
     }
 
     /* Determine what type of BAR this is for registration */
-    ret = pread(vdev->vbasedev.fd, &pci_bar, sizeof(pci_bar),
-                vdev->config_offset + PCI_BASE_ADDRESS_0 + (4 * nr));
+    ret = VDEV_CONFIG_READ(&vdev->vbasedev, PCI_BASE_ADDRESS_0 + (4 * nr),
+                           sizeof(pci_bar), &pci_bar);
     if (ret != sizeof(pci_bar)) {
-        error_report("vfio: Failed to read BAR %d (%m)", nr);
+        const char *err =  ret < 0 ? strerror(-ret) : "short read";
+
+        error_report("vfio: Failed to read BAR %d (%s)", nr, err);
         return;
     }
 
@@ -2213,8 +2240,9 @@ static void vfio_pci_pre_reset(VFIOPCIDevice *vdev)
 
 static void vfio_pci_post_reset(VFIOPCIDevice *vdev)
 {
+    VFIODevice *vbasedev = &vdev->vbasedev;
     Error *err = NULL;
-    int nr;
+    int ret, nr;
 
     vfio_intx_enable(vdev, &err);
     if (err) {
@@ -2222,13 +2250,16 @@ static void vfio_pci_post_reset(VFIOPCIDevice *vdev)
     }
 
     for (nr = 0; nr < PCI_NUM_REGIONS - 1; ++nr) {
-        off_t addr = vdev->config_offset + PCI_BASE_ADDRESS_0 + (4 * nr);
+        off_t addr = PCI_BASE_ADDRESS_0 + (4 * nr);
         uint32_t val = 0;
         uint32_t len = sizeof(val);
 
-        if (pwrite(vdev->vbasedev.fd, &val, len, addr) != len) {
-            error_report("%s(%s) reset bar %d failed: %m", __func__,
-                         vdev->vbasedev.name, nr);
+        ret = VDEV_CONFIG_WRITE(vbasedev, addr, len, &val);
+        if (ret != len) {
+            const char *err = ret < 0 ? strerror(-ret) : "short write";
+
+            error_report("%s(%s) reset bar %d failed: %s", __func__,
+                         vbasedev->name, nr, err);
         }
     }
 
@@ -2675,7 +2706,7 @@ static void vfio_populate_device(VFIOPCIDevice *vdev, Error **errp)
 
     irq_info.index = VFIO_PCI_ERR_IRQ_INDEX;
 
-    ret = ioctl(vdev->vbasedev.fd, VFIO_DEVICE_GET_IRQ_INFO, &irq_info);
+    ret = vbasedev->io->get_irq_info(vbasedev, &irq_info);
     if (ret) {
         /* This can fail for an old kernel or legacy PCI dev */
         trace_vfio_populate_device_get_irq_info_failure(strerror(errno));
@@ -2794,8 +2825,10 @@ static void vfio_register_req_notifier(VFIOPCIDevice *vdev)
         return;
     }
 
-    if (ioctl(vdev->vbasedev.fd,
-              VFIO_DEVICE_GET_IRQ_INFO, &irq_info) < 0 || irq_info.count < 1) {
+    if (vdev->vbasedev.io->get_irq_info(&vdev->vbasedev, &irq_info) < 0) {
+        return;
+    }
+    if (irq_info.count < 1) {
         return;
     }
 
@@ -2874,6 +2907,7 @@ static void vfio_realize(PCIDevice *pdev, Error **errp)
     vbasedev->ops = &vfio_pci_ops;
     vbasedev->type = VFIO_DEVICE_TYPE_PCI;
     vbasedev->dev = DEVICE(vdev);
+    vbasedev->io = &vfio_dev_io_ioctl;
 
     tmp = g_strdup_printf("%s/iommu_group", vbasedev->sysfsdev);
     len = readlink(tmp, group_path, sizeof(group_path));
diff --git a/hw/vfio/platform.c b/hw/vfio/platform.c
index 5af73f9..222405e 100644
--- a/hw/vfio/platform.c
+++ b/hw/vfio/platform.c
@@ -621,6 +621,7 @@ static void vfio_platform_realize(DeviceState *dev, Error **errp)
     vbasedev->type = VFIO_DEVICE_TYPE_PLATFORM;
     vbasedev->dev = dev;
     vbasedev->ops = &vfio_platform_ops;
+    vbasedev->io = &vfio_dev_io_ioctl;
 
     qemu_mutex_init(&vdev->intp_mutex);
 
-- 
1.9.4


