Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8CC42FC223
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 22:23:33 +0100 (CET)
Received: from localhost ([::1]:40492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1yTM-00014y-Qx
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 16:23:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1l1xrl-0002V6-52; Tue, 19 Jan 2021 15:44:41 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:54746)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1l1xri-0002QX-VF; Tue, 19 Jan 2021 15:44:40 -0500
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10JKXTQq131384; Tue, 19 Jan 2021 15:44:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references; s=pp1;
 bh=VmzqrQhnsPDqK9tPpEnm7+0p0HmurgymDrI7eoZETM4=;
 b=Xd3+Iw8IftJZKgZtdGMw6BhX2ymLV01LtbaWTvVaxSoYgFY4QJXuiZTxjOzwyk/xRH4q
 FSPUgj6ONU2GAlZS4QnDY6E579yExbwwFlTUJLh5CIP/cU7ODZZ37jcF7uKAHOXnvLgM
 0guB+UTRifOkMaHkozU6LaN4yNcMqQ2v3gT2xb8wJasYHv7GUiebVMF5A2D0InskU375
 pO5hRMmeCrnZEoQpOsdGurIF9uX8mOc1bBQBwxZUIMutL+7NkCrrYbDxAH2nqGT0knEV
 NW8IOL+FQpIGTDmX0vTS00PfDIsbJnxD1T9DsX1u9Xc117Hm1q5KDI/fXdiQPytcB0oF tg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3665y31cas-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 Jan 2021 15:44:36 -0500
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 10JKYUAl137153;
 Tue, 19 Jan 2021 15:44:36 -0500
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3665y31c9t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 Jan 2021 15:44:36 -0500
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10JKaNVp030702;
 Tue, 19 Jan 2021 20:44:35 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma02dal.us.ibm.com with ESMTP id 363qs974jq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 Jan 2021 20:44:35 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 10JKiXgJ27918780
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Jan 2021 20:44:33 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id ADF6613604F;
 Tue, 19 Jan 2021 20:44:33 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F008E136051;
 Tue, 19 Jan 2021 20:44:31 +0000 (GMT)
Received: from oc4221205838.ibm.com (unknown [9.211.56.144])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 19 Jan 2021 20:44:31 +0000 (GMT)
From: Matthew Rosato <mjrosato@linux.ibm.com>
To: cohuck@redhat.com, thuth@redhat.com
Subject: [PATCH 5/8] s390x/pci: Handle devices that support relaxed alignment
Date: Tue, 19 Jan 2021 15:44:16 -0500
Message-Id: <1611089059-6468-6-git-send-email-mjrosato@linux.ibm.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1611089059-6468-1-git-send-email-mjrosato@linux.ibm.com>
References: <1611089059-6468-1-git-send-email-mjrosato@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-19_09:2021-01-18,
 2021-01-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 impostorscore=0 mlxscore=0 adultscore=0 phishscore=0 bulkscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
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

Certain zPCI device types (e.g. ISM) allow for a different set of address
alignment rules for PCISTB instructions.  Recognize this distinction and
perform only a subset of alignment checks for intercepted PCISTB
instructions.  Furthermore for the default path, handle the potential for
writes that are not aligned and sized to 8B chunks.

Signed-off-by: Matthew Rosato <mjrosato@linux.ibm.com>
---
 hw/s390x/s390-pci-inst.c        | 152 +++++++++++++++++++++++++++++++++-------
 hw/s390x/s390-pci-vfio.c        |   3 +
 include/hw/s390x/s390-pci-clp.h |   1 +
 3 files changed, 132 insertions(+), 24 deletions(-)

diff --git a/hw/s390x/s390-pci-inst.c b/hw/s390x/s390-pci-inst.c
index 2d440a3..67eb4a4 100644
--- a/hw/s390x/s390-pci-inst.c
+++ b/hw/s390x/s390-pci-inst.c
@@ -784,6 +784,92 @@ err:
     return 0;
 }
 
+static int pcistb_write_validate(MemoryRegion *mr, uint64_t offset,
+                                 uint16_t len)
+{
+    uint8_t size;
+
+    switch (offset & 0x07UL) {
+    case 0:
+        size = 8;
+        if (size <= len) {
+            break;
+        }
+        /* fall through */
+    case 4:
+        size = 4;
+        if (size <= len) {
+            break;
+        }
+        /* fall through */
+    case 6:
+    case 2:
+        size = 2;
+        if (size <= len) {
+            break;
+        }
+        /* fall through */
+    default:
+        size = 1;
+    }
+
+    if (!memory_region_access_valid(mr, offset, size, true,
+                                    MEMTXATTRS_UNSPECIFIED)) {
+        return -EINVAL;
+    }
+
+    return size;
+}
+
+static int pcistb_write(MemoryRegion *mr, uint8_t *buffer, uint64_t offset,
+                        uint16_t len)
+{
+    MemTxResult result;
+    uint64_t size;
+    uint64_t data;
+    MemOp opsize;
+
+    switch (offset & 0x07UL) {
+    case 0:
+        size = 8;
+        if (size <= len) {
+            opsize = MO_64;
+            data = ldq_p(buffer);
+            break;
+        }
+        /* fall through */
+    case 4:
+        size = 4;
+        if (size <= len) {
+            opsize = MO_32;
+            data = ldl_p(buffer);
+            break;
+        }
+        /* fall through */
+    case 6:
+    case 2:
+        size = 2;
+        if (size <= len) {
+            opsize = MO_16;
+            data = lduw_p(buffer);
+            break;
+        }
+        /* fall through */
+    default:
+        size = 1;
+        opsize = MO_8;
+        data = ldub_p(buffer);
+    }
+
+    result = memory_region_dispatch_write(mr, offset, data, opsize,
+                                          MEMTXATTRS_UNSPECIFIED);
+    if (result != MEMTX_OK) {
+        return -EINVAL;
+    }
+
+    return size;
+}
+
 /*
  * The default PCISTB handler will break PCISTB instructions into a series of
  * 8B memory operations.
@@ -792,32 +878,44 @@ static int pcistb_default(S390PCIBusDevice *pbdev, S390CPU *cpu,
                            uint64_t gaddr, uint8_t ar, uint8_t pcias,
                            uint16_t len, uint64_t offset)
 {
-    MemTxResult result;
     MemoryRegion *mr;
-    int i;
+    uint64_t curroff;
+    uint16_t currlen;
+    uint8_t *currbuff;
+    int size;
 
     mr = pbdev->pdev->io_regions[pcias].memory;
     mr = s390_get_subregion(mr, offset, len);
     offset -= mr->addr;
 
-    for (i = 0; i < len; i += 8) {
-        if (!memory_region_access_valid(mr, offset + i, 8, true,
-                                        MEMTXATTRS_UNSPECIFIED)) {
+    /* Loop over the proposed area and validate that writes will work. */
+    curroff = offset;
+    currlen = len;
+    while (currlen > 0) {
+        size = pcistb_write_validate(mr, curroff, currlen);
+        if (size <= 0) {
             return -EINVAL;
         }
+        curroff += size;
+        currlen -= size;
     }
 
     if (s390_cpu_virt_mem_read(cpu, gaddr, ar, pbdev->pcistb_buf, len)) {
         return -EACCES;
     }
 
-    for (i = 0; i < len; i += 8) {
-        result = memory_region_dispatch_write(mr, offset + i,
-                                              ldq_p(pbdev->pcistb_buf + i),
-                                              MO_64, MEMTXATTRS_UNSPECIFIED);
-        if (result != MEMTX_OK) {
+    /* Perform the chain of previously-validated writes */
+    currbuff = pbdev->pcistb_buf;
+    curroff = offset;
+    currlen = len;
+    while (currlen > 0) {
+        size = pcistb_write(mr, currbuff, curroff, currlen);
+        if (size < 0) {
             return -EINVAL;
         }
+        currbuff += size;
+        curroff += size;
+        currlen -= size;
     }
 
     return 0;
@@ -873,25 +971,31 @@ int pcistb_service_call(S390CPU *cpu, uint8_t r1, uint8_t r3, uint64_t gaddr,
         return 0;
     }
 
-    /* Verify the address, offset and length */
-    /* offset must be a multiple of 8 */
-    if (offset % 8) {
-        goto specification_error;
-    }
-    /* Length must be greater than 8, a multiple of 8 */
-    /* and not greater than maxstbl */
-    if ((len <= 8) || (len % 8) ||
-        (len > pbdev->pci_group->zpci_group.maxstbl)) {
-        goto specification_error;
+    /*
+     * If the specified device supports relaxed alignment, some checks can
+     * be skipped.
+     */
+    if (!(pbdev->pci_group->zpci_group.fr & CLP_RSP_QPCIG_MASK_RELAXED)) {
+        /* Verify the address, offset and length */
+        /* offset must be a multiple of 8 */
+        if (offset % 8) {
+            goto specification_error;
+        }
+        /* Length must be greater than 8, a multiple of 8 */
+        /* and not greater than maxstbl */
+        if ((len <= 8) || (len % 8) ||
+            (len > pbdev->pci_group->zpci_group.maxstbl)) {
+            goto specification_error;
+        }
+        /* Guest address must be double word aligned */
+        if (gaddr & 0x07UL) {
+            goto specification_error;
+        }
     }
     /* Do not cross a 4K-byte boundary */
     if (((offset & 0xfff) + len) > 0x1000) {
         goto specification_error;
     }
-    /* Guest address must be double word aligned */
-    if (gaddr & 0x07UL) {
-        goto specification_error;
-    }
 
     ret = pbdev->ops.pcistb(pbdev, cpu, gaddr, ar, pcias, len, offset);
 
diff --git a/hw/s390x/s390-pci-vfio.c b/hw/s390x/s390-pci-vfio.c
index cb59e98..4cee640 100644
--- a/hw/s390x/s390-pci-vfio.c
+++ b/hw/s390x/s390-pci-vfio.c
@@ -158,6 +158,9 @@ static void s390_pci_read_group(S390PCIBusDevice *pbdev,
         if (cap->flags & VFIO_DEVICE_INFO_ZPCI_FLAG_REFRESH) {
             resgrp->fr = 1;
         }
+        if (cap->flags & VFIO_DEVICE_INFO_ZPCI_FLAG_RELAXED) {
+            resgrp->fr |= CLP_RSP_QPCIG_MASK_RELAXED;
+        }
         resgrp->dasm = cap->dasm;
         resgrp->msia = cap->msi_addr;
         resgrp->mui = cap->mui;
diff --git a/include/hw/s390x/s390-pci-clp.h b/include/hw/s390x/s390-pci-clp.h
index 96b8e3f..73a28a0 100644
--- a/include/hw/s390x/s390-pci-clp.h
+++ b/include/hw/s390x/s390-pci-clp.h
@@ -158,6 +158,7 @@ typedef struct ClpRspQueryPciGrp {
 #define CLP_RSP_QPCIG_MASK_NOI 0xfff
     uint16_t i;
     uint8_t version;
+#define CLP_RSP_QPCIG_MASK_RELAXED 0x8
 #define CLP_RSP_QPCIG_MASK_FRAME   0x2
 #define CLP_RSP_QPCIG_MASK_REFRESH 0x1
     uint8_t fr;
-- 
1.8.3.1


