Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34FFF2D4C1D
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 21:42:54 +0100 (CET)
Received: from localhost ([::1]:44826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn6IX-0000Re-8k
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 15:42:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1kn6Au-0000Ez-CO; Wed, 09 Dec 2020 15:35:00 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:25732)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1kn6Ap-0005sH-OX; Wed, 09 Dec 2020 15:35:00 -0500
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0B9KXDhV057276; Wed, 9 Dec 2020 15:34:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references; s=pp1;
 bh=ofHxB8QcV7LwlQ3ZqO97RDGTsqphpEk0ru6/Cwn2OFY=;
 b=dC+mgLAU4RbuhSTpNKL2W1G7n0MPz1ND19oE5iD4BsheneXFX/A+Ej3H8OZm2cDxhV6Z
 iwTqsFy/wbEMy8MerbHCZNADZ0hNFk7RsZSU25vzWiEYXWcAqwYje9eCdE2h5lUE/AYg
 pFsV5WfUrhKhT+OEooAp5+0v5qgX7WFl1SblnpMJH7WAzYlh8EhbdBd4UgpRALb4NnV/
 DnJ/B+ZL5vJAb+ON7OyUHDw1/yGnduyfee+cmbgwjBUdTw0k4ugHUFu2lJHprayjrfyK
 KVYXBk8TzMnKVUzMlmpwQYxoh3ymxizeoLW25AX3D2VwPXBtz7YVxgpd2Dr+K6mXGwnx uA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35avw5hwpa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Dec 2020 15:34:53 -0500
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0B9KXVSA058219;
 Wed, 9 Dec 2020 15:34:53 -0500
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35avw5hwnj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Dec 2020 15:34:52 -0500
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0B9KWFo6029324;
 Wed, 9 Dec 2020 20:34:51 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma01wdc.us.ibm.com with ESMTP id 3581u9gf1r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Dec 2020 20:34:51 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0B9KYodZ33489392
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 9 Dec 2020 20:34:50 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D0D3C124058;
 Wed,  9 Dec 2020 20:34:50 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5B11D124054;
 Wed,  9 Dec 2020 20:34:48 +0000 (GMT)
Received: from oc4221205838.ibm.com (unknown [9.163.37.122])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed,  9 Dec 2020 20:34:48 +0000 (GMT)
From: Matthew Rosato <mjrosato@linux.ibm.com>
To: cohuck@redhat.com, thuth@redhat.com
Subject: [RFC 7/8] s390x/pci: PCISTB via the vfio zPCI I/O region
Date: Wed,  9 Dec 2020 15:34:25 -0500
Message-Id: <1607546066-2240-8-git-send-email-mjrosato@linux.ibm.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1607546066-2240-1-git-send-email-mjrosato@linux.ibm.com>
References: <1607546066-2240-1-git-send-email-mjrosato@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-09_16:2020-12-09,
 2020-12-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=2 malwarescore=0
 mlxlogscore=999 spamscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 mlxscore=0 bulkscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012090143
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=mjrosato@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: pmorel@linux.ibm.com, david@redhat.com, schnelle@linux.ibm.com,
 richard.henderson@linaro.org, qemu-s390x@nongnu.org, qemu-devel@nongnu.org,
 pasic@linux.ibm.com, borntraeger@de.ibm.com, alex.williamson@redhat.com,
 mst@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For ISM devices, use the vfio region to handle intercepted PCISTB
instructions.  This region will allow large block I/O instructions
intercepted from the guest to be performed as a single I/O instruction on
the host.  This ensure that proper write patterns that are expected by the
underlying device are respected and ensures that a non-MIO instruction is
used to perform the operation (as ISM devices do not support the MIO
instruction set).
Furthermore, add a requirement that the I/O region must be available in
order to pass the device through to the guest.

Signed-off-by: Matthew Rosato <mjrosato@linux.ibm.com>
---
 hw/s390x/s390-pci-bus.c          |  15 ++++++
 hw/s390x/s390-pci-inst.c         |   8 +++
 hw/s390x/s390-pci-vfio.c         | 108 +++++++++++++++++++++++++++++++++++++++
 include/hw/s390x/s390-pci-bus.h  |   2 +
 include/hw/s390x/s390-pci-inst.h |   1 +
 include/hw/s390x/s390-pci-vfio.h |  15 ++++++
 6 files changed, 149 insertions(+)

diff --git a/hw/s390x/s390-pci-bus.c b/hw/s390x/s390-pci-bus.c
index 7d31ded..e77c448 100644
--- a/hw/s390x/s390-pci-bus.c
+++ b/hw/s390x/s390-pci-bus.c
@@ -977,6 +977,7 @@ static void s390_pcihost_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
     S390pciState *s = S390_PCI_HOST_BRIDGE(hotplug_dev);
     PCIDevice *pdev = NULL;
     S390PCIBusDevice *pbdev = NULL;
+    int ret;
 
     if (object_dynamic_cast(OBJECT(dev), TYPE_PCI_BRIDGE)) {
         PCIBridge *pb = PCI_BRIDGE(dev);
@@ -1027,6 +1028,20 @@ static void s390_pcihost_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
             pbdev->iommu->dma_limit = s390_pci_start_dma_count(s, pbdev);
             /* Fill in CLP information passed via the vfio region */
             s390_pci_get_clp_info(pbdev);
+
+            /*
+             * For a relaxed-alignment device, setup the special I/O region
+             * if available.  Otherwise, the device cannot be passed through.
+             */
+            ret = 0;
+            if (pbdev->pci_group->zpci_group.fr & CLP_RSP_QPCIG_MASK_RELAXED) {
+                ret = s390_pci_get_zpci_io_region(pbdev);
+            }
+            if (ret) {
+                error_setg(errp, "vfio zPCI I/O region support is mandatory "
+                           "for %02x:%02x.%01x", pci_dev_bus_num(pdev),
+                           PCI_SLOT(pdev->devfn), PCI_FUNC(pdev->devfn));
+            }
         } else {
             pbdev->fh |= FH_SHM_EMUL;
 
diff --git a/hw/s390x/s390-pci-inst.c b/hw/s390x/s390-pci-inst.c
index 30698e5..d4c79f6 100644
--- a/hw/s390x/s390-pci-inst.c
+++ b/hw/s390x/s390-pci-inst.c
@@ -19,6 +19,7 @@
 #include "sysemu/hw_accel.h"
 #include "hw/s390x/s390-pci-inst.h"
 #include "hw/s390x/s390-pci-bus.h"
+#include "hw/s390x/s390-pci-vfio.h"
 #include "hw/s390x/tod.h"
 
 #ifndef DEBUG_S390PCI_INST
@@ -897,6 +898,8 @@ int pcistb_service_call(S390CPU *cpu, uint8_t r1, uint8_t r3, uint64_t gaddr,
     ret = pbdev->ops.pcistb(pbdev, cpu, gaddr, ar, pcias, len, offset);
 
     switch (ret) {
+    case -EIO:
+        /* fall through */
     case -EINVAL:
         s390_program_interrupt(env, PGM_OPERAND, ra);
         return 0;
@@ -1386,3 +1389,8 @@ void zpci_assign_default_ops(S390PCIBusDevice *pbdev)
     pbdev->ops.pcilg = pcilg_default;
     pbdev->ops.pcistb = pcistb_default;
 }
+
+void zpci_assign_ops_vfio_io_region(S390PCIBusDevice *pbdev)
+{
+    pbdev->ops.pcistb = s390_pci_vfio_pcistb;
+}
diff --git a/hw/s390x/s390-pci-vfio.c b/hw/s390x/s390-pci-vfio.c
index 9439fe1..ad50a62 100644
--- a/hw/s390x/s390-pci-vfio.c
+++ b/hw/s390x/s390-pci-vfio.c
@@ -17,6 +17,7 @@
 #include "trace.h"
 #include "hw/s390x/s390-pci-bus.h"
 #include "hw/s390x/s390-pci-clp.h"
+#include "hw/s390x/s390-pci-inst.h"
 #include "hw/s390x/s390-pci-vfio.h"
 #include "hw/vfio/pci.h"
 #include "hw/vfio/vfio-common.h"
@@ -277,3 +278,110 @@ retry:
 
     return;
 }
+
+/*
+ * This function will look for the VFIO_REGION_SUBTYPE_IBM_ZPCI_IO vfio
+ * device region, which is used for performing block I/O operations.
+ */
+int s390_pci_get_zpci_io_region(S390PCIBusDevice *pbdev)
+{
+    VFIOPCIDevice *vfio_pci;
+    VFIODevice *vdev;
+    struct vfio_region_info *info;
+    int ret;
+
+    vfio_pci = container_of(pbdev->pdev, VFIOPCIDevice, pdev);
+    vdev = &vfio_pci->vbasedev;
+
+    if (vdev->num_regions < VFIO_PCI_NUM_REGIONS + 1) {
+        return -ENOENT;
+    }
+
+    /* Get the I/O region if it's available */
+    if (vfio_get_dev_region_info(vdev,
+                                 PCI_VENDOR_ID_IBM |
+                                 VFIO_REGION_TYPE_PCI_VENDOR_TYPE,
+                                 VFIO_REGION_SUBTYPE_IBM_ZPCI_IO, &info)) {
+        return -ENOENT;
+    }
+
+    /* If the size is unexpectedly small, don't use the region */
+    if (sizeof(*pbdev->io_region) > info->size) {
+        return -EINVAL;
+    }
+
+    pbdev->io_region = g_malloc0(info->size);
+
+    /* Check the header for setup information */
+    ret = pread(vfio_pci->vbasedev.fd, &pbdev->io_region->hdr,
+                sizeof(struct vfio_zpci_io_hdr), info->offset);
+    if (ret != sizeof(struct vfio_zpci_io_hdr)) {
+        g_free(pbdev->io_region);
+        pbdev->io_region = 0;
+        ret = -EINVAL;
+    } else {
+        pbdev->io_region_op_offset = info->offset +
+                                     offsetof(struct vfio_region_zpci_io, req);
+        /* All devices in this group will use the I/O region for PCISTB */
+        pbdev->pci_group->zpci_group.maxstbl = MIN(PAGE_SIZE,
+                                               pbdev->io_region->hdr.max);
+        ret = 0;
+    }
+    g_free(info);
+
+    /* Register the new handlers for the device if region available */
+    if (pbdev->io_region) {
+        zpci_assign_ops_vfio_io_region(pbdev);
+    }
+
+    return ret;
+}
+
+int s390_pci_vfio_pcistb(S390PCIBusDevice *pbdev, S390CPU *cpu, uint64_t gaddr,
+                         uint8_t ar, uint8_t pcias, uint16_t len,
+                         uint64_t offset)
+{
+    struct vfio_region_zpci_io *region = pbdev->io_region;
+    VFIOPCIDevice *vfio_pci;
+    uint8_t *buffer;
+    int ret;
+
+    if (region == NULL) {
+        return -EIO;
+    }
+
+    vfio_pci = container_of(pbdev->pdev, VFIOPCIDevice, pdev);
+
+    /*
+     * We've already ensured the input can be no larger than a page.  PCISTB
+     * requires that the operation payload does not cross a page boundary,
+     * otherwise the operation will be rejected.  Therefore, just get a single
+     * page for the write.
+     */
+    buffer = qemu_memalign(PAGE_SIZE, PAGE_SIZE);
+
+    if (s390_cpu_virt_mem_read(cpu, gaddr, ar, buffer, len)) {
+        ret = -EACCES;
+        goto out;
+    }
+
+    region->req.gaddr = (uint64_t)buffer;
+    region->req.offset = offset;
+    region->req.len = len;
+    region->req.pcias = pcias;
+    region->req.flags = VFIO_ZPCI_IO_FLAG_BLOCKW;
+
+    ret = pwrite(vfio_pci->vbasedev.fd, &region->req,
+                 sizeof(struct vfio_zpci_io_req),
+                 pbdev->io_region_op_offset);
+    if (ret != sizeof(struct vfio_zpci_io_req)) {
+        ret = -EIO;
+    } else {
+        ret = 0;
+    }
+
+out:
+    qemu_vfree(buffer);
+
+    return ret;
+}
diff --git a/include/hw/s390x/s390-pci-bus.h b/include/hw/s390x/s390-pci-bus.h
index bf0034f..8986a5f 100644
--- a/include/hw/s390x/s390-pci-bus.h
+++ b/include/hw/s390x/s390-pci-bus.h
@@ -355,6 +355,8 @@ struct S390PCIBusDevice {
     uint32_t fh;
     uint32_t fid;
     bool fid_defined;
+    uint64_t io_region_op_offset;
+    struct vfio_region_zpci_io *io_region;
     uint64_t fmb_addr;
     ZpciFmb fmb;
     QEMUTimer *fmb_timer;
diff --git a/include/hw/s390x/s390-pci-inst.h b/include/hw/s390x/s390-pci-inst.h
index c9fe3f1..7ed6175 100644
--- a/include/hw/s390x/s390-pci-inst.h
+++ b/include/hw/s390x/s390-pci-inst.h
@@ -112,6 +112,7 @@ int stpcifc_service_call(S390CPU *cpu, uint8_t r1, uint64_t fiba, uint8_t ar,
                          uintptr_t ra);
 void fmb_timer_free(S390PCIBusDevice *pbdev);
 void zpci_assign_default_ops(S390PCIBusDevice *pbdev);
+void zpci_assign_ops_vfio_io_region(S390PCIBusDevice *pbdev);
 
 #define ZPCI_IO_BAR_MIN 0
 #define ZPCI_IO_BAR_MAX 5
diff --git a/include/hw/s390x/s390-pci-vfio.h b/include/hw/s390x/s390-pci-vfio.h
index ff708ae..f0a994f 100644
--- a/include/hw/s390x/s390-pci-vfio.h
+++ b/include/hw/s390x/s390-pci-vfio.h
@@ -21,6 +21,10 @@ S390PCIDMACount *s390_pci_start_dma_count(S390pciState *s,
                                           S390PCIBusDevice *pbdev);
 void s390_pci_end_dma_count(S390pciState *s, S390PCIDMACount *cnt);
 void s390_pci_get_clp_info(S390PCIBusDevice *pbdev);
+int s390_pci_get_zpci_io_region(S390PCIBusDevice *pbdev);
+int s390_pci_vfio_pcistb(S390PCIBusDevice *pbdev, S390CPU *cpu, uint64_t gaddr,
+                         uint8_t ar, uint8_t pcias, uint16_t len,
+                         uint64_t offset);
 #else
 static inline bool s390_pci_update_dma_avail(int fd, unsigned int *avail)
 {
@@ -34,6 +38,17 @@ static inline S390PCIDMACount *s390_pci_start_dma_count(S390pciState *s,
 static inline void s390_pci_end_dma_count(S390pciState *s,
                                           S390PCIDMACount *cnt) { }
 static inline void s390_pci_get_clp_info(S390PCIBusDevice *pbdev) { }
+static inline int s390_pci_get_zpci_io_region(S390PCIBusDevice *pbdev)
+{
+    return -EINVAL;
+}
+static inline int s390_pci_vfio_pcistb(S390PCIBusDevice *pbdev, S390CPU *cpu,
+                                       uint64_t gaddr, uint8_t ar,
+                                       uint8_t pcias, uint16_t len,
+                                       uint64_t offset)
+{
+    return -EIO;
+}
 #endif
 
 #endif
-- 
1.8.3.1


