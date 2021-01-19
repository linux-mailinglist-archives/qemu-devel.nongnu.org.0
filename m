Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CA6A2FC18B
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 21:49:51 +0100 (CET)
Received: from localhost ([::1]:33570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1xwk-0006IB-0m
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 15:49:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1l1xro-0002dS-B0; Tue, 19 Jan 2021 15:44:44 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:14066)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1l1xrl-0002Qo-W4; Tue, 19 Jan 2021 15:44:44 -0500
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10JKd4Xt193606; Tue, 19 Jan 2021 15:44:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references; s=pp1;
 bh=WPV+sC9tCdjpb+ODxOpD9b+CGs65jOLbKk4whzUrAPI=;
 b=UgQzkyzYC5uvM8jaez9ISX9gogICf3aTxTSOZncJdHftCAtNElBSJpLDRz6Y6KysI3DR
 9u64koC3bjMID78w7seQS4s0JvQylLdVquMVnAZa28a4UkAaAuOx5eK9eq+bQ8/1KisP
 JGYRyZud/u3yyA7NVnXUrBp7hrgJriKe855zOhfQNaC4je+08cacP/Zsf1Q37V4g1573
 AOKCNDMsRnb1JCb/Mus6CXic/eeBlJFdddlBt9nQXW255rzp7qywjDdxcPdKevdJHWKK
 UOFsmrWMzdqvXPhD6bwrKasI/cjqZ+5uCOEIIMi9sW5gDlMxMGx2eFZVmdKTjMJI/WrB Wg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3665wnh0j7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 Jan 2021 15:44:39 -0500
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 10JKetNw004738;
 Tue, 19 Jan 2021 15:44:39 -0500
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3665wnh0h9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 Jan 2021 15:44:39 -0500
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10JKaUFq006595;
 Tue, 19 Jan 2021 20:44:37 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma05wdc.us.ibm.com with ESMTP id 363qs90wwy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 Jan 2021 20:44:37 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 10JKiZIS35848648
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Jan 2021 20:44:36 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D1DCC136051;
 Tue, 19 Jan 2021 20:44:35 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E10DE13604F;
 Tue, 19 Jan 2021 20:44:33 +0000 (GMT)
Received: from oc4221205838.ibm.com (unknown [9.211.56.144])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 19 Jan 2021 20:44:33 +0000 (GMT)
From: Matthew Rosato <mjrosato@linux.ibm.com>
To: cohuck@redhat.com, thuth@redhat.com
Subject: [PATCH 6/8] s390x/pci: PCISTB via the vfio zPCI I/O region
Date: Tue, 19 Jan 2021 15:44:17 -0500
Message-Id: <1611089059-6468-7-git-send-email-mjrosato@linux.ibm.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1611089059-6468-1-git-send-email-mjrosato@linux.ibm.com>
References: <1611089059-6468-1-git-send-email-mjrosato@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-19_09:2021-01-18,
 2021-01-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 mlxlogscore=999 mlxscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101190114
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=mjrosato@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
 hw/s390x/s390-pci-bus.c          | 15 +++++++
 hw/s390x/s390-pci-inst.c         |  8 ++++
 hw/s390x/s390-pci-vfio.c         | 95 ++++++++++++++++++++++++++++++++++++++++
 include/hw/s390x/s390-pci-bus.h  |  5 +++
 include/hw/s390x/s390-pci-inst.h |  1 +
 include/hw/s390x/s390-pci-vfio.h | 15 +++++++
 6 files changed, 139 insertions(+)

diff --git a/hw/s390x/s390-pci-bus.c b/hw/s390x/s390-pci-bus.c
index 784ca65..9d5c2c5 100644
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
+             * For an ISM device, attempt to setup the special I/O region.  If
+             * this fails, the device cannot be passed through.
+             */
+            ret = 0;
+            if (pbdev->pft == ZPCI_PFT_ISM) {
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
index 67eb4a4..18a701f 100644
--- a/hw/s390x/s390-pci-inst.c
+++ b/hw/s390x/s390-pci-inst.c
@@ -19,6 +19,7 @@
 #include "sysemu/hw_accel.h"
 #include "hw/s390x/s390-pci-inst.h"
 #include "hw/s390x/s390-pci-bus.h"
+#include "hw/s390x/s390-pci-vfio.h"
 #include "hw/s390x/tod.h"
 
 #ifndef DEBUG_S390PCI_INST
@@ -1000,6 +1001,8 @@ int pcistb_service_call(S390CPU *cpu, uint8_t r1, uint8_t r3, uint64_t gaddr,
     ret = pbdev->ops.pcistb(pbdev, cpu, gaddr, ar, pcias, len, offset);
 
     switch (ret) {
+    case -EIO:
+        /* fall through */
     case -EINVAL:
         s390_program_interrupt(env, PGM_OPERAND, ra);
         return 0;
@@ -1488,3 +1491,8 @@ void zpci_assign_default_ops(S390PCIBusDevice *pbdev)
     pbdev->ops.pcilg = pcilg_default;
     pbdev->ops.pcistb = pcistb_default;
 }
+
+void zpci_assign_ops_vfio_io_region(S390PCIBusDevice *pbdev)
+{
+    pbdev->ops.pcistb = s390_pci_vfio_pcistb;
+}
diff --git a/hw/s390x/s390-pci-vfio.c b/hw/s390x/s390-pci-vfio.c
index 4cee640..33b24d4 100644
--- a/hw/s390x/s390-pci-vfio.c
+++ b/hw/s390x/s390-pci-vfio.c
@@ -18,6 +18,7 @@
 #include "trace.h"
 #include "hw/s390x/s390-pci-bus.h"
 #include "hw/s390x/s390-pci-clp.h"
+#include "hw/s390x/s390-pci-inst.h"
 #include "hw/s390x/s390-pci-vfio.h"
 #include "hw/vfio/pci.h"
 #include "hw/vfio/vfio-common.h"
@@ -279,3 +280,97 @@ retry:
 
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
+    int ret;
+
+    if (region == NULL) {
+        return -EIO;
+    }
+
+    vfio_pci = container_of(pbdev->pdev, VFIOPCIDevice, pdev);
+
+    if (s390_cpu_virt_mem_read(cpu, gaddr, ar, pbdev->pcistb_buf, len)) {
+        return -EACCES;
+    }
+
+    region->req.gaddr = (uint64_t)pbdev->pcistb_buf;
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
+    return ret;
+}
diff --git a/include/hw/s390x/s390-pci-bus.h b/include/hw/s390x/s390-pci-bus.h
index 7c34c5b..aaef890 100644
--- a/include/hw/s390x/s390-pci-bus.h
+++ b/include/hw/s390x/s390-pci-bus.h
@@ -43,6 +43,9 @@ OBJECT_DECLARE_SIMPLE_TYPE(S390PCIBus, S390_PCI_BUS)
 OBJECT_DECLARE_SIMPLE_TYPE(S390PCIBusDevice, S390_PCI_DEVICE)
 OBJECT_DECLARE_SIMPLE_TYPE(S390PCIIOMMU, S390_PCI_IOMMU)
 
+/* PCI Function Types */
+#define ZPCI_PFT_ISM 5
+
 #define HP_EVENT_TO_CONFIGURED        0x0301
 #define HP_EVENT_RESERVED_TO_STANDBY  0x0302
 #define HP_EVENT_DECONFIGURE_REQUEST  0x0303
@@ -355,6 +358,8 @@ struct S390PCIBusDevice {
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


