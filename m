Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 972632D4C22
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 21:44:36 +0100 (CET)
Received: from localhost ([::1]:51394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn6KB-0003AA-Kc
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 15:44:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1kn6Av-0000Gz-9K; Wed, 09 Dec 2020 15:35:01 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:46324)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1kn6As-0005su-4P; Wed, 09 Dec 2020 15:35:00 -0500
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0B9KXhEc079244; Wed, 9 Dec 2020 15:34:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references; s=pp1;
 bh=ufIbCzqUWz2XGJ1ioiCfhTbGRneo/t1YxF6E6SX5Xn8=;
 b=TpUhYhat8ii5f7lLk/oCBTutfDTKlCiEoYfa9Kt/eJooGt7etjkwwfDJuRG9hI2aXloW
 Jt6x8zR/DLAJvKP7NWOjfQacJSkc6r4q1ZafpSTQ4cCzXwoE9husWwqtOT0txKJAh6yZ
 UdCjCctX1NIc85VSIHmz7SBNVMuoRzNhQrpdvW3tEIOdLmZibwyuKenSqcofuP09TboW
 61wv0Vl8A6qWItTqTLSMFkyGc/HH6BnalVIdiK9LZdMddSgmL2PUKSqp7iBNx9lO2bhf
 wr3KNcumGdjmIE1CEz5fQh3xBF8vAhFeYt/TjS/u6hDJN+Tm5xzCam1fwdRlAcqWEbBU Ug== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35b5b9gkm8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Dec 2020 15:34:56 -0500
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0B9KY2Q8080533;
 Wed, 9 Dec 2020 15:34:55 -0500
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35b5b9gkkn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Dec 2020 15:34:55 -0500
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0B9KVg93012897;
 Wed, 9 Dec 2020 20:34:54 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma03wdc.us.ibm.com with ESMTP id 3581u9a9n7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Dec 2020 20:34:54 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0B9KYrtT12059066
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 9 Dec 2020 20:34:53 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C4942124054;
 Wed,  9 Dec 2020 20:34:53 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3AB2D124053;
 Wed,  9 Dec 2020 20:34:51 +0000 (GMT)
Received: from oc4221205838.ibm.com (unknown [9.163.37.122])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed,  9 Dec 2020 20:34:50 +0000 (GMT)
From: Matthew Rosato <mjrosato@linux.ibm.com>
To: cohuck@redhat.com, thuth@redhat.com
Subject: [RFC 8/8] s390x/pci: PCILG via the vfio zPCI I/O region
Date: Wed,  9 Dec 2020 15:34:26 -0500
Message-Id: <1607546066-2240-9-git-send-email-mjrosato@linux.ibm.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1607546066-2240-1-git-send-email-mjrosato@linux.ibm.com>
References: <1607546066-2240-1-git-send-email-mjrosato@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-09_16:2020-12-09,
 2020-12-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0
 mlxlogscore=999 impostorscore=0 suspectscore=0 phishscore=0 adultscore=0
 mlxscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012090143
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
index d4c79f6..33186dc 100644
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
 
@@ -1392,5 +1392,6 @@ void zpci_assign_default_ops(S390PCIBusDevice *pbdev)
 
 void zpci_assign_ops_vfio_io_region(S390PCIBusDevice *pbdev)
 {
+    pbdev->ops.pcilg = s390_pci_vfio_pcilg;
     pbdev->ops.pcistb = s390_pci_vfio_pcistb;
 }
diff --git a/hw/s390x/s390-pci-vfio.c b/hw/s390x/s390-pci-vfio.c
index ad50a62..baba6b0 100644
--- a/hw/s390x/s390-pci-vfio.c
+++ b/hw/s390x/s390-pci-vfio.c
@@ -337,6 +337,59 @@ int s390_pci_get_zpci_io_region(S390PCIBusDevice *pbdev)
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


