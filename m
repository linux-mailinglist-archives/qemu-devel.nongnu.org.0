Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26983622014
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Nov 2022 00:08:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osXbu-0005Aj-PQ; Tue, 08 Nov 2022 18:02:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1osXbp-00055t-OC
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 18:02:21 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1osXbY-0003fp-G5
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 18:02:21 -0500
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2A8MtnV3007240
 for <qemu-devel@nongnu.org>; Tue, 8 Nov 2022 23:01:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : subject :
 date : message-id : in-reply-to : references : in-reply-to : references;
 s=corp-2022-7-12; bh=u4td2YSnAGAhvqx717lmtJ5WBU//09BZ8sZAX/vNeGU=;
 b=s8dhzAzvF3iCRSwUYy/e5FlZNr5sgaDie864zOCo3QlfVAjyEH1Aa/X7nVbX5VVOJBqd
 pSa3o0ZtL+2NVk9n3hGLb9+gTHy9Kx2Qcmvk75aDkidPWYEkBJBLfN1SeR3cCw9x8RE2
 h12u4e6/sOrzx0q93GL04Na0seE7AEMRKYfTEr+Fg7jr3P2E3QwAun/X8qs6eyRrZfT9
 Iyx2MBeRti0bRveZFUjgom7ygzC7wUj7ts4/ug5cYsE/IfTnuGB0Bie3TfsiVwFQ2+Ps
 38Fe4xqUtxpV4OfudngKm+8b64BBnb5fvv+spPc8E5zgyYJPoXGW+BZOMdAu80GGVrXi Hw== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3kqyy18462-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <qemu-devel@nongnu.org>; Tue, 08 Nov 2022 23:01:50 +0000
Received: from pps.filterd
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 2A8LjK6U004437
 for <qemu-devel@nongnu.org>; Tue, 8 Nov 2022 23:01:49 GMT
Received: from bruckner.us.oracle.com (dhcp-10-65-143-202.vpn.oracle.com
 [10.65.143.202])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3kpcq2k0b9-16
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO)
 for <qemu-devel@nongnu.org>; Tue, 08 Nov 2022 23:01:48 +0000
From: John Johnson <john.g.johnson@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 15/24] vfio-user: forward msix BAR accesses to server
Date: Tue,  8 Nov 2022 15:13:37 -0800
Message-Id: <440467975afbc80a97caaead3222199397c0698e.1667542066.git.john.g.johnson@oracle.com>
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
X-Proofpoint-GUID: 9Go-UoEuxTCccy2vNEYQsZKRvQLCIT4Y
X-Proofpoint-ORIG-GUID: 9Go-UoEuxTCccy2vNEYQsZKRvQLCIT4Y
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=john.g.johnson@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Server holds device current device pending state
Use irq masking commands in socket case

Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 hw/vfio/ccw.c                 |  1 +
 hw/vfio/common.c              | 26 +++++++++++++
 hw/vfio/pci.c                 | 87 ++++++++++++++++++++++++++++++++++++++++++-
 hw/vfio/pci.h                 |  1 +
 hw/vfio/platform.c            |  1 +
 include/hw/vfio/vfio-common.h |  3 ++
 6 files changed, 118 insertions(+), 1 deletion(-)

diff --git a/hw/vfio/ccw.c b/hw/vfio/ccw.c
index cbd1c25..830ca53 100644
--- a/hw/vfio/ccw.c
+++ b/hw/vfio/ccw.c
@@ -615,6 +615,7 @@ static void vfio_ccw_get_device(VFIOGroup *group, VFIOCCWDevice *vcdev,
     vcdev->vdev.name = name;
     vcdev->vdev.dev = &vcdev->cdev.parent_obj.parent_obj;
     vcdev->vdev.io_ops = &vfio_dev_io_ioctl;
+    vcdev->vdev.irq_mask_works = false;
 
     return;
 
diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 87cd1d1..b540195 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -101,6 +101,32 @@ void vfio_mask_single_irqindex(VFIODevice *vbasedev, int index)
     VDEV_SET_IRQS(vbasedev, &irq_set);
 }
 
+void vfio_mask_single_irq(VFIODevice *vbasedev, int index, int irq)
+{
+    struct vfio_irq_set irq_set = {
+        .argsz = sizeof(irq_set),
+        .flags = VFIO_IRQ_SET_DATA_NONE | VFIO_IRQ_SET_ACTION_MASK,
+        .index = index,
+        .start = irq,
+        .count = 1,
+    };
+
+    VDEV_SET_IRQS(vbasedev, &irq_set);
+}
+
+void vfio_unmask_single_irq(VFIODevice *vbasedev, int index, int irq)
+{
+    struct vfio_irq_set irq_set = {
+        .argsz = sizeof(irq_set),
+        .flags = VFIO_IRQ_SET_DATA_NONE | VFIO_IRQ_SET_ACTION_UNMASK,
+        .index = index,
+        .start = irq,
+        .count = 1,
+    };
+
+    VDEV_SET_IRQS(vbasedev, &irq_set);
+}
+
 static inline const char *action_to_str(int action)
 {
     switch (action) {
diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index be39a4e..a1ae3fb 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -479,6 +479,7 @@ static int vfio_msix_vector_do_use(PCIDevice *pdev, unsigned int nr,
 {
     VFIOPCIDevice *vdev = VFIO_PCI_BASE(pdev);
     VFIOMSIVector *vector;
+    bool new_vec = false;
     int ret;
 
     trace_vfio_msix_vector_do_use(vdev->vbasedev.name, nr);
@@ -492,6 +493,7 @@ static int vfio_msix_vector_do_use(PCIDevice *pdev, unsigned int nr,
             error_report("vfio: Error: event_notifier_init failed");
         }
         vector->use = true;
+        new_vec = true;
         msix_vector_use(pdev, nr);
     }
 
@@ -518,6 +520,7 @@ static int vfio_msix_vector_do_use(PCIDevice *pdev, unsigned int nr,
                 kvm_irqchip_commit_route_changes(&vfio_route_change);
                 vfio_connect_kvm_msi_virq(vector);
             }
+            new_vec = true;
         }
     }
 
@@ -525,6 +528,8 @@ static int vfio_msix_vector_do_use(PCIDevice *pdev, unsigned int nr,
      * We don't want to have the host allocate all possible MSI vectors
      * for a device if they're not in use, so we shutdown and incrementally
      * increase them as needed.
+     * Otherwise, unmask the vector if the vector is already setup (and we can
+     * do so) or send the fd if not.
      */
     if (vdev->nr_vectors < nr + 1) {
         vdev->nr_vectors = nr + 1;
@@ -535,6 +540,8 @@ static int vfio_msix_vector_do_use(PCIDevice *pdev, unsigned int nr,
                 error_report("vfio: failed to enable vectors, %d", ret);
             }
         }
+    } else if (vdev->vbasedev.irq_mask_works && !new_vec) {
+        vfio_unmask_single_irq(&vdev->vbasedev, VFIO_PCI_MSIX_IRQ_INDEX, nr);
     } else {
         Error *err = NULL;
         int32_t fd;
@@ -576,6 +583,12 @@ static void vfio_msix_vector_release(PCIDevice *pdev, unsigned int nr)
 
     trace_vfio_msix_vector_release(vdev->vbasedev.name, nr);
 
+    /* just mask vector if peer supports it */
+    if (vdev->vbasedev.irq_mask_works) {
+        vfio_mask_single_irq(&vdev->vbasedev, VFIO_PCI_MSIX_IRQ_INDEX, nr);
+        return;
+    }
+
     /*
      * There are still old guests that mask and unmask vectors on every
      * interrupt.  If we're using QEMU bypass with a KVM irqfd, leave all of
@@ -646,7 +659,7 @@ static void vfio_msix_enable(VFIOPCIDevice *vdev)
         if (ret) {
             error_report("vfio: failed to enable vectors, %d", ret);
         }
-    } else {
+    } else if (!vdev->vbasedev.irq_mask_works) {
         /*
          * Some communication channels between VF & PF or PF & fw rely on the
          * physical state of the device and expect that enabling MSI-X from the
@@ -662,6 +675,13 @@ static void vfio_msix_enable(VFIOPCIDevice *vdev)
          */
         vfio_msix_vector_do_use(&vdev->pdev, 0, NULL, NULL);
         vfio_msix_vector_release(&vdev->pdev, 0);
+    } else {
+        /*
+         * If we can use irq masking, send an invalid fd on vector 0
+         * to enable MSI-X without any vectors enabled.
+         */
+        vfio_set_irq_signaling(&vdev->vbasedev, VFIO_PCI_MSIX_IRQ_INDEX, 0,
+                               VFIO_IRQ_SET_ACTION_TRIGGER, -1, NULL);
     }
 
     trace_vfio_msix_enable(vdev->vbasedev.name);
@@ -3042,6 +3062,7 @@ static void vfio_realize(PCIDevice *pdev, Error **errp)
     vbasedev->type = VFIO_DEVICE_TYPE_PCI;
     vbasedev->dev = DEVICE(vdev);
     vbasedev->io_ops = &vfio_dev_io_ioctl;
+    vbasedev->irq_mask_works = false;
 
     tmp = g_strdup_printf("%s/iommu_group", vbasedev->sysfsdev);
     len = readlink(tmp, group_path, sizeof(group_path));
@@ -3474,6 +3495,62 @@ type_init(register_vfio_pci_dev_type)
  */
 
 /*
+ * The server maintains the device's pending interrupts,
+ * via its MSIX table and PBA, so we treat these acceses
+ * like PCI config space and forward them.
+ */
+static uint64_t vfio_user_pba_read(void *opaque, hwaddr addr,
+                                   unsigned size)
+{
+    VFIOPCIDevice *vdev = opaque;
+    VFIORegion *region = &vdev->bars[vdev->msix->pba_bar].region;
+    uint64_t data;
+
+    /* server copy is what matters */
+    data = vfio_region_read(region, addr + vdev->msix->pba_offset, size);
+    return data;
+}
+
+static void vfio_user_pba_write(void *opaque, hwaddr addr,
+                                  uint64_t data, unsigned size)
+{
+    /* dropped */
+}
+
+static const MemoryRegionOps vfio_user_pba_ops = {
+    .read = vfio_user_pba_read,
+    .write = vfio_user_pba_write,
+    .endianness = DEVICE_LITTLE_ENDIAN,
+};
+
+static void vfio_user_msix_setup(VFIOPCIDevice *vdev)
+{
+    MemoryRegion *vfio_reg, *msix_reg, *pba_reg;
+
+    pba_reg = g_new0(MemoryRegion, 1);
+    vdev->msix->pba_region = pba_reg;
+
+    vfio_reg = vdev->bars[vdev->msix->pba_bar].mr;
+    msix_reg = &vdev->pdev.msix_pba_mmio;
+    memory_region_init_io(pba_reg, OBJECT(vdev), &vfio_user_pba_ops, vdev,
+                          "VFIO MSIX PBA", int128_get64(msix_reg->size));
+    memory_region_add_subregion_overlap(vfio_reg, vdev->msix->pba_offset,
+                                        pba_reg, 1);
+}
+
+static void vfio_user_msix_teardown(VFIOPCIDevice *vdev)
+{
+    MemoryRegion *mr, *sub;
+
+    mr = vdev->bars[vdev->msix->pba_bar].mr;
+    sub = vdev->msix->pba_region;
+    memory_region_del_subregion(mr, sub);
+
+    g_free(vdev->msix->pba_region);
+    vdev->msix->pba_region = NULL;
+}
+
+/*
  * Incoming request message callback.
  *
  * Runs off main loop, so BQL held.
@@ -3551,6 +3628,7 @@ static void vfio_user_pci_realize(PCIDevice *pdev, Error **errp)
     vbasedev->type = VFIO_DEVICE_TYPE_PCI;
     vbasedev->dev = DEVICE(vdev);
     vbasedev->io_ops = &vfio_dev_io_sock;
+    vdev->vbasedev.irq_mask_works = true;
 
     ret = VDEV_GET_INFO(vbasedev, &info);
     if (ret) {
@@ -3589,6 +3667,9 @@ static void vfio_user_pci_realize(PCIDevice *pdev, Error **errp)
     if (ret) {
         goto out_teardown;
     }
+    if (vdev->msix != NULL) {
+        vfio_user_msix_setup(vdev);
+    }
 
     ret = vfio_interrupt_setup(vdev, errp);
     if (ret) {
@@ -3612,6 +3693,10 @@ static void vfio_user_instance_finalize(Object *obj)
     VFIOPCIDevice *vdev = VFIO_PCI_BASE(obj);
     VFIODevice *vbasedev = &vdev->vbasedev;
 
+    if (vdev->msix != NULL) {
+        vfio_user_msix_teardown(vdev);
+    }
+
     vfio_put_device(vdev);
 
     if (vbasedev->proxy != NULL) {
diff --git a/hw/vfio/pci.h b/hw/vfio/pci.h
index ec17f2e..c04fa58 100644
--- a/hw/vfio/pci.h
+++ b/hw/vfio/pci.h
@@ -113,6 +113,7 @@ typedef struct VFIOMSIXInfo {
     uint32_t table_offset;
     uint32_t pba_offset;
     unsigned long *pending;
+    MemoryRegion *pba_region;
 } VFIOMSIXInfo;
 
 /*
diff --git a/hw/vfio/platform.c b/hw/vfio/platform.c
index c136b09..ccf1df7 100644
--- a/hw/vfio/platform.c
+++ b/hw/vfio/platform.c
@@ -622,6 +622,7 @@ static void vfio_platform_realize(DeviceState *dev, Error **errp)
     vbasedev->dev = dev;
     vbasedev->ops = &vfio_platform_ops;
     vbasedev->io_ops = &vfio_dev_io_ioctl;
+    vbasedev->irq_mask_works = false;
 
     qemu_mutex_init(&vdev->intp_mutex);
 
diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
index 6324132..793ca94 100644
--- a/include/hw/vfio/vfio-common.h
+++ b/include/hw/vfio/vfio-common.h
@@ -142,6 +142,7 @@ typedef struct VFIODevice {
     bool no_mmap;
     bool ram_block_discard_allowed;
     bool enable_migration;
+    bool irq_mask_works;
     VFIODeviceOps *ops;
     VFIODevIO *io_ops;
     unsigned int num_irqs;
@@ -260,6 +261,8 @@ void vfio_put_base_device(VFIODevice *vbasedev);
 void vfio_disable_irqindex(VFIODevice *vbasedev, int index);
 void vfio_unmask_single_irqindex(VFIODevice *vbasedev, int index);
 void vfio_mask_single_irqindex(VFIODevice *vbasedev, int index);
+void vfio_unmask_single_irq(VFIODevice *vbasedev, int index, int irq);
+void vfio_mask_single_irq(VFIODevice *vbasedev, int index, int irq);
 int vfio_set_irq_signaling(VFIODevice *vbasedev, int index, int subindex,
                            int action, int fd, Error **errp);
 void vfio_region_write(void *opaque, hwaddr addr,
-- 
1.8.3.1


