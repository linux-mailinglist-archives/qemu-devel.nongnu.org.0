Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB9E0687584
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 06:49:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNSPN-0008C1-08; Thu, 02 Feb 2023 00:45:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1pNSPL-0008BL-CZ
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 00:45:15 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1pNSPI-0007BP-4e
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 00:45:15 -0500
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3124i4Lu021779; Thu, 2 Feb 2023 05:45:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : in-reply-to :
 references; s=corp-2022-7-12;
 bh=wPJMDakUdlTl5Jo8KnT5A+Csdw+dktyZijLe2cdheac=;
 b=aXjYuLJ09hICVCEixTTDmN1Bxkb03JBQboh23NbpsacLdYx5vOng+8gILD7u9A9yecEy
 TLTuRO5V15IwNGW+5NEoJovIMZBfu2KF8eNgZN3LFB8w2p2zY6I2WfYOKfAdUj2fs5hZ
 0bnUZuf564fvAjAVce+vGMn8mYNQnmyWy2Ggh6ZSNLYQq0XoW26IpcsMEBFND9DFU3OV
 P1tEwvZOuMQqhzFq+uxojNDi78sgF/4XGRwsoFPnDQnBR5NXeKu6yNcGzqy0QuMqe2Ye
 G6Sx2b6bLUKJd921bjjDY3AwJrnudWtWyFrSAFYM5xguJQnnX0/JA3DRWE9QOcVZghIv LA== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3nfq28syxs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 02 Feb 2023 05:45:09 +0000
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 31254Ppm013015; Thu, 2 Feb 2023 05:45:08 GMT
Received: from bruckner.us.oracle.com (dhcp-10-65-133-23.vpn.oracle.com
 [10.65.133.23])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3nct5f5gb1-16
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Thu, 02 Feb 2023 05:45:08 +0000
From: John Johnson <john.g.johnson@oracle.com>
To: qemu-devel@nongnu.org
Cc: alex.williamson@redhat.com, clg@redhat.com, philmd@linaro.org
Subject: [PATCH v2 15/23] vfio-user: forward msix BAR accesses to server
Date: Wed,  1 Feb 2023 21:55:51 -0800
Message-Id: <0ad69e4ea3d1f37246ce5e32ba833d6c871e99b1.1675228037.git.john.g.johnson@oracle.com>
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
X-Proofpoint-GUID: EJAzeLGMLc-7bZWZIY3c7YrdOJJxPGbP
X-Proofpoint-ORIG-GUID: EJAzeLGMLc-7bZWZIY3c7YrdOJJxPGbP
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

Server holds device current device pending state
Use irq masking commands in socket case

Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 hw/vfio/pci.h                 |  1 +
 include/hw/vfio/vfio-common.h |  3 ++
 hw/vfio/ccw.c                 |  1 +
 hw/vfio/common.c              | 26 ++++++++++++++++++
 hw/vfio/pci.c                 | 23 +++++++++++++++-
 hw/vfio/platform.c            |  1 +
 hw/vfio/user-pci.c            | 64 +++++++++++++++++++++++++++++++++++++++++++
 7 files changed, 118 insertions(+), 1 deletion(-)

diff --git a/hw/vfio/pci.h b/hw/vfio/pci.h
index 4f70664..d3e5d5f 100644
--- a/hw/vfio/pci.h
+++ b/hw/vfio/pci.h
@@ -113,6 +113,7 @@ typedef struct VFIOMSIXInfo {
     uint32_t table_offset;
     uint32_t pba_offset;
     unsigned long *pending;
+    MemoryRegion *pba_region;
 } VFIOMSIXInfo;
 
 /*
diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
index bbc4b15..2c58d7d 100644
--- a/include/hw/vfio/vfio-common.h
+++ b/include/hw/vfio/vfio-common.h
@@ -143,6 +143,7 @@ typedef struct VFIODevice {
     bool ram_block_discard_allowed;
     bool enable_migration;
     bool use_regfds;
+    bool can_mask_irq;
     VFIODeviceOps *ops;
     VFIODeviceIO *io;
     unsigned int num_irqs;
@@ -239,6 +240,8 @@ void vfio_put_base_device(VFIODevice *vbasedev);
 void vfio_disable_irqindex(VFIODevice *vbasedev, int index);
 void vfio_unmask_single_irqindex(VFIODevice *vbasedev, int index);
 void vfio_mask_single_irqindex(VFIODevice *vbasedev, int index);
+void vfio_unmask_single_irq(VFIODevice *vbasedev, int index, int irq);
+void vfio_mask_single_irq(VFIODevice *vbasedev, int index, int irq);
 int vfio_set_irq_signaling(VFIODevice *vbasedev, int index, int subindex,
                            int action, int fd, Error **errp);
 void vfio_region_write(void *opaque, hwaddr addr,
diff --git a/hw/vfio/ccw.c b/hw/vfio/ccw.c
index 00605bd..bf67670 100644
--- a/hw/vfio/ccw.c
+++ b/hw/vfio/ccw.c
@@ -616,6 +616,7 @@ static void vfio_ccw_get_device(VFIOGroup *group, VFIOCCWDevice *vcdev,
     vcdev->vdev.dev = &vcdev->cdev.parent_obj.parent_obj;
     vcdev->vdev.io = &vfio_dev_io_ioctl;
     vcdev->vdev.use_regfds = false;
+    vcdev->vdev.can_mask_irq = false;
 
     return;
 
diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index de64e53..0c1cb21 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -102,6 +102,32 @@ void vfio_mask_single_irqindex(VFIODevice *vbasedev, int index)
     vbasedev->io->set_irqs(vbasedev, &irq_set);
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
+    vbasedev->io->set_irqs(vbasedev, &irq_set);
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
+    vbasedev->io->set_irqs(vbasedev, &irq_set);
+}
+
 static inline const char *action_to_str(int action)
 {
     switch (action) {
diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 42e7c82..7b16f8f 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -477,6 +477,7 @@ static int vfio_msix_vector_do_use(PCIDevice *pdev, unsigned int nr,
 {
     VFIOPCIDevice *vdev = VFIO_PCI_BASE(pdev);
     VFIOMSIVector *vector;
+    bool new_vec = false;
     int ret;
 
     trace_vfio_msix_vector_do_use(vdev->vbasedev.name, nr);
@@ -490,6 +491,7 @@ static int vfio_msix_vector_do_use(PCIDevice *pdev, unsigned int nr,
             error_report("vfio: Error: event_notifier_init failed");
         }
         vector->use = true;
+        new_vec = true;
         msix_vector_use(pdev, nr);
     }
 
@@ -516,6 +518,7 @@ static int vfio_msix_vector_do_use(PCIDevice *pdev, unsigned int nr,
                 kvm_irqchip_commit_route_changes(&vfio_route_change);
                 vfio_connect_kvm_msi_virq(vector);
             }
+            new_vec = true;
         }
     }
 
@@ -523,6 +526,8 @@ static int vfio_msix_vector_do_use(PCIDevice *pdev, unsigned int nr,
      * We don't want to have the host allocate all possible MSI vectors
      * for a device if they're not in use, so we shutdown and incrementally
      * increase them as needed.
+     * Otherwise, unmask the vector if the vector is already setup (and we can
+     * do so) or send the fd if not.
      */
     if (vdev->nr_vectors < nr + 1) {
         vdev->nr_vectors = nr + 1;
@@ -533,6 +538,8 @@ static int vfio_msix_vector_do_use(PCIDevice *pdev, unsigned int nr,
                 error_report("vfio: failed to enable vectors, %d", ret);
             }
         }
+    } else if (vdev->vbasedev.can_mask_irq && !new_vec) {
+        vfio_unmask_single_irq(&vdev->vbasedev, VFIO_PCI_MSIX_IRQ_INDEX, nr);
     } else {
         Error *err = NULL;
         int32_t fd;
@@ -574,6 +581,12 @@ static void vfio_msix_vector_release(PCIDevice *pdev, unsigned int nr)
 
     trace_vfio_msix_vector_release(vdev->vbasedev.name, nr);
 
+    /* just mask vector if peer supports it */
+    if (vdev->vbasedev.can_mask_irq) {
+        vfio_mask_single_irq(&vdev->vbasedev, VFIO_PCI_MSIX_IRQ_INDEX, nr);
+        return;
+    }
+
     /*
      * There are still old guests that mask and unmask vectors on every
      * interrupt.  If we're using QEMU bypass with a KVM irqfd, leave all of
@@ -644,7 +657,7 @@ static void vfio_msix_enable(VFIOPCIDevice *vdev)
         if (ret) {
             error_report("vfio: failed to enable vectors, %d", ret);
         }
-    } else {
+    } else if (!vdev->vbasedev.can_mask_irq) {
         /*
          * Some communication channels between VF & PF or PF & fw rely on the
          * physical state of the device and expect that enabling MSI-X from the
@@ -660,6 +673,13 @@ static void vfio_msix_enable(VFIOPCIDevice *vdev)
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
@@ -3040,6 +3060,7 @@ static void vfio_realize(PCIDevice *pdev, Error **errp)
     vbasedev->dev = DEVICE(vdev);
     vbasedev->io = &vfio_dev_io_ioctl;
     vbasedev->use_regfds = false;
+    vbasedev->can_mask_irq = false;
 
     tmp = g_strdup_printf("%s/iommu_group", vbasedev->sysfsdev);
     len = readlink(tmp, group_path, sizeof(group_path));
diff --git a/hw/vfio/platform.c b/hw/vfio/platform.c
index 8ddfcca..3387ec4 100644
--- a/hw/vfio/platform.c
+++ b/hw/vfio/platform.c
@@ -623,6 +623,7 @@ static void vfio_platform_realize(DeviceState *dev, Error **errp)
     vbasedev->ops = &vfio_platform_ops;
     vbasedev->io = &vfio_dev_io_ioctl;
     vbasedev->use_regfds = false;
+    vbasedev->can_mask_irq = false;
 
     qemu_mutex_init(&vdev->intp_mutex);
 
diff --git a/hw/vfio/user-pci.c b/hw/vfio/user-pci.c
index 55ffe7f..bc1d01a 100644
--- a/hw/vfio/user-pci.c
+++ b/hw/vfio/user-pci.c
@@ -45,6 +45,62 @@ struct VFIOUserPCIDevice {
 };
 
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
@@ -122,6 +178,7 @@ static void vfio_user_pci_realize(PCIDevice *pdev, Error **errp)
     vbasedev->dev = DEVICE(vdev);
     vbasedev->io = &vfio_dev_io_sock;
     vbasedev->use_regfds = true;
+    vbasedev->can_mask_irq = true;
 
     ret = vfio_user_get_device(vbasedev, errp);
     if (ret) {
@@ -159,6 +216,9 @@ static void vfio_user_pci_realize(PCIDevice *pdev, Error **errp)
     if (ret) {
         goto out_teardown;
     }
+    if (vdev->msix != NULL) {
+        vfio_user_msix_setup(vdev);
+    }
 
     ret = vfio_interrupt_setup(vdev, errp);
     if (ret) {
@@ -186,6 +246,10 @@ static void vfio_user_instance_finalize(Object *obj)
     g_free(vdev->emulated_config_bits);
     g_free(vdev->rom);
 
+    if (vdev->msix != NULL) {
+        vfio_user_msix_teardown(vdev);
+    }
+
     vfio_put_device(vdev);
 
     if (vbasedev->proxy != NULL) {
-- 
1.9.4


