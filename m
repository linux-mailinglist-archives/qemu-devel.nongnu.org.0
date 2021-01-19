Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77B392FC22D
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 22:25:06 +0100 (CET)
Received: from localhost ([::1]:42734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1yUr-00020l-JO
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 16:25:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1l1xro-0002eZ-Ps; Tue, 19 Jan 2021 15:44:44 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:18414)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1l1xrm-0002Qz-Jx; Tue, 19 Jan 2021 15:44:44 -0500
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10JKiftI159957; Tue, 19 Jan 2021 15:44:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references; s=pp1;
 bh=emT38rsL3XqYeCc86K0uyXHl0+ALryDj/Zx3ZP3U8bU=;
 b=JoLiWspNozfLbwJo4s7MnFRkHEPeCDYvpKIW1QtBpNlhTC28Bjh05YSugfqFx7aByxmw
 Vt7p3O7AFP9haos+ydtptVAkhw6DoB5fEqKRXrRkd3J1kIUgFSyjzCX1Rm1swV6R+oP3
 SxYvwG4ZGyc9ztb0esPphO+E2ZUVZDx1k55LW6TJhcZLVSf6oUJRU8vjqIiLKrZAqKqL
 vw9gYmckg0TeW/XcBi7oygSDesFM7oyNO3xBNODIjfg8y+rb0Ov8KWIkpcXd2UjrrhlC
 Mdon64d5D2z3Fw88HK0rVkTZ2H8qEas8OD+h+2mhFMs451M9KVhOpnbyEpcK8vILU+VX WQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3666qw801k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 Jan 2021 15:44:40 -0500
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 10JKieqr159931;
 Tue, 19 Jan 2021 15:44:40 -0500
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3666qw801a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 Jan 2021 15:44:40 -0500
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10JKaYo4008090;
 Tue, 19 Jan 2021 20:44:39 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma01wdc.us.ibm.com with ESMTP id 363qs90xe6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 Jan 2021 20:44:39 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 10JKic7P12911248
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Jan 2021 20:44:38 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0AFB4136053;
 Tue, 19 Jan 2021 20:44:38 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 21EFF13604F;
 Tue, 19 Jan 2021 20:44:36 +0000 (GMT)
Received: from oc4221205838.ibm.com (unknown [9.211.56.144])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 19 Jan 2021 20:44:35 +0000 (GMT)
From: Matthew Rosato <mjrosato@linux.ibm.com>
To: cohuck@redhat.com, thuth@redhat.com
Subject: [PATCH 7/8] s390x/pci: PCILG via the vfio zPCI I/O region
Date: Tue, 19 Jan 2021 15:44:18 -0500
Message-Id: <1611089059-6468-8-git-send-email-mjrosato@linux.ibm.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1611089059-6468-1-git-send-email-mjrosato@linux.ibm.com>
References: <1611089059-6468-1-git-send-email-mjrosato@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-19_09:2021-01-18,
 2021-01-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 malwarescore=0
 mlxlogscore=999 impostorscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 mlxscore=0 bulkscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101190110
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=mjrosato@linux.ibm.com; helo=mx0b-001b2d01.pphosted.com
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

For ISM devices, use the vfio region to handle intercepted PCILG
instructions.  This will allow read I/Os intercepted from the guest to be
performed as single operations that ensure the same non-MIO PCI instruction
is used on the host as specified in the guest.

Signed-off-by: Matthew Rosato <mjrosato@linux.ibm.com>
---
 hw/s390x/s390-pci-inst.c         |  3 ++-
 hw/s390x/s390-pci-vfio.c         | 53 ++++++++++++++++++++++++++++++++++++++++
 include/hw/s390x/s390-pci-inst.h |  1 +
 include/hw/s390x/s390-pci-vfio.h |  8 ++++++
 4 files changed, 64 insertions(+), 1 deletion(-)

diff --git a/hw/s390x/s390-pci-inst.c b/hw/s390x/s390-pci-inst.c
index 18a701f..97e9a7a 100644
--- a/hw/s390x/s390-pci-inst.c
+++ b/hw/s390x/s390-pci-inst.c
@@ -352,7 +352,7 @@ out:
  * @ptr: a pointer to a uint64_t data field
  * @len: the length of the valid data, must be 1,2,4 or 8
  */
-static int zpci_endian_swap(uint64_t *ptr, uint8_t len)
+int zpci_endian_swap(uint64_t *ptr, uint8_t len)
 {
     uint64_t data = *ptr;
 
@@ -1494,5 +1494,6 @@ void zpci_assign_default_ops(S390PCIBusDevice *pbdev)
 
 void zpci_assign_ops_vfio_io_region(S390PCIBusDevice *pbdev)
 {
+    pbdev->ops.pcilg = s390_pci_vfio_pcilg;
     pbdev->ops.pcistb = s390_pci_vfio_pcistb;
 }
diff --git a/hw/s390x/s390-pci-vfio.c b/hw/s390x/s390-pci-vfio.c
index 33b24d4..6778ba4 100644
--- a/hw/s390x/s390-pci-vfio.c
+++ b/hw/s390x/s390-pci-vfio.c
@@ -339,6 +339,59 @@ int s390_pci_get_zpci_io_region(S390PCIBusDevice *pbdev)
     return ret;
 }
 
+int s390_pci_vfio_pcilg(S390PCIBusDevice *pbdev, uint64_t *data, uint8_t pcias,
+                        uint16_t len, uint64_t offset)
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
+    /* Perform Length/Alignment checks */
+    switch (pcias) {
+    case ZPCI_IO_BAR_MIN...ZPCI_IO_BAR_MAX:
+        if (!len || (len > (8 - (offset & 0x7)))) {
+            return -EINVAL;
+        }
+        region->req.gaddr = (uint64_t)data;
+        region->req.offset = offset;
+        region->req.len = len;
+        region->req.pcias = pcias;
+        region->req.flags = VFIO_ZPCI_IO_FLAG_READ;
+
+        ret = pwrite(vfio_pci->vbasedev.fd, &region->req,
+                     sizeof(struct vfio_zpci_io_req),
+                     pbdev->io_region_op_offset);
+        if (ret != sizeof(struct vfio_zpci_io_req)) {
+            ret = -EIO;
+        } else {
+            ret = 0;
+        }
+        break;
+    case ZPCI_CONFIG_BAR:
+        if (!len || (len > (4 - (offset & 0x3))) || len == 3) {
+            return -EINVAL;
+        }
+        *data = pci_host_config_read_common(
+                       pbdev->pdev, offset, pci_config_size(pbdev->pdev), len);
+
+        if (zpci_endian_swap(data, len)) {
+            ret = -EINVAL;
+        }
+        ret = 0;
+        break;
+    default:
+        return -EFAULT;
+    }
+
+    return ret;
+}
+
 int s390_pci_vfio_pcistb(S390PCIBusDevice *pbdev, S390CPU *cpu, uint64_t gaddr,
                          uint8_t ar, uint8_t pcias, uint16_t len,
                          uint64_t offset)
diff --git a/include/hw/s390x/s390-pci-inst.h b/include/hw/s390x/s390-pci-inst.h
index 7ed6175..fe368fb 100644
--- a/include/hw/s390x/s390-pci-inst.h
+++ b/include/hw/s390x/s390-pci-inst.h
@@ -101,6 +101,7 @@ typedef struct ZpciFib {
 int pci_dereg_irqs(S390PCIBusDevice *pbdev);
 void pci_dereg_ioat(S390PCIIOMMU *iommu);
 int clp_service_call(S390CPU *cpu, uint8_t r2, uintptr_t ra);
+int zpci_endian_swap(uint64_t *ptr, uint8_t len);
 int pcilg_service_call(S390CPU *cpu, uint8_t r1, uint8_t r2, uintptr_t ra);
 int pcistg_service_call(S390CPU *cpu, uint8_t r1, uint8_t r2, uintptr_t ra);
 int rpcit_service_call(S390CPU *cpu, uint8_t r1, uint8_t r2, uintptr_t ra);
diff --git a/include/hw/s390x/s390-pci-vfio.h b/include/hw/s390x/s390-pci-vfio.h
index f0a994f..d9fb3a4 100644
--- a/include/hw/s390x/s390-pci-vfio.h
+++ b/include/hw/s390x/s390-pci-vfio.h
@@ -22,6 +22,8 @@ S390PCIDMACount *s390_pci_start_dma_count(S390pciState *s,
 void s390_pci_end_dma_count(S390pciState *s, S390PCIDMACount *cnt);
 void s390_pci_get_clp_info(S390PCIBusDevice *pbdev);
 int s390_pci_get_zpci_io_region(S390PCIBusDevice *pbdev);
+int s390_pci_vfio_pcilg(S390PCIBusDevice *pbdev, uint64_t *data, uint8_t pcias,
+                        uint16_t len, uint64_t offset);
 int s390_pci_vfio_pcistb(S390PCIBusDevice *pbdev, S390CPU *cpu, uint64_t gaddr,
                          uint8_t ar, uint8_t pcias, uint16_t len,
                          uint64_t offset);
@@ -42,6 +44,12 @@ static inline int s390_pci_get_zpci_io_region(S390PCIBusDevice *pbdev)
 {
     return -EINVAL;
 }
+static inline int s390_pci_vfio_pcilg(S390PCIBusDevice *pbdev, uint64_t *data,
+                                      uint8_t pcias, uint16_t len,
+                                      uint64_t offset)
+{
+    return -EIO;
+}
 static inline int s390_pci_vfio_pcistb(S390PCIBusDevice *pbdev, S390CPU *cpu,
                                        uint64_t gaddr, uint8_t ar,
                                        uint8_t pcias, uint16_t len,
-- 
1.8.3.1


