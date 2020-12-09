Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BCFB2D4C1B
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 21:42:41 +0100 (CET)
Received: from localhost ([::1]:43774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn6IK-0008RH-DA
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 15:42:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1kn6As-0000CZ-8Q; Wed, 09 Dec 2020 15:34:58 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:50554)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1kn6Ai-0005pT-09; Wed, 09 Dec 2020 15:34:58 -0500
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0B9KX9iR151555; Wed, 9 Dec 2020 15:34:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references; s=pp1;
 bh=4wfYD8ldZSphZzUrnY0nzOTFXMq2nKGe3iUC6aQVaN4=;
 b=hNs9VZCTnPSb+ewH3ZpyT3XpSWvJZjDM19+GCVv3rxG0juXCvo0c+U0P1rMF2XDnM95O
 lDl9P+/yby31cgcK5gVrovsqWGcjdRhEhRmUHnC9LIGSclBp9pK35x00U0uo4JCBg6pk
 B7LxqrFzsdSried7iteA0HkY7VOTvyevQ8EDvVJfrito+w4XLYh1n/QEhN+Asef8IW84
 OEnay65G+vcbVkWaAHvO6MxYBtTg7fgxSCMH9dn+GQesfXpPaD9pKHChMWw+eYuwQuiH
 20wXw6TwFKKjBp8AkB+XQVeYI/z/Yt/zlmneVti2zkarYspkk0cKcpb5Z/GDcB6Q33N7 xg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35b444as7r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Dec 2020 15:34:45 -0500
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0B9KXRN3155490;
 Wed, 9 Dec 2020 15:34:44 -0500
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35b444as7a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Dec 2020 15:34:44 -0500
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0B9KW5Sf002121;
 Wed, 9 Dec 2020 20:34:43 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma01dal.us.ibm.com with ESMTP id 3581u9jtj1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Dec 2020 20:34:43 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0B9KYgSL10945018
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 9 Dec 2020 20:34:42 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BA90912405B;
 Wed,  9 Dec 2020 20:34:42 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7B425124058;
 Wed,  9 Dec 2020 20:34:40 +0000 (GMT)
Received: from oc4221205838.ibm.com (unknown [9.163.37.122])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed,  9 Dec 2020 20:34:40 +0000 (GMT)
From: Matthew Rosato <mjrosato@linux.ibm.com>
To: cohuck@redhat.com, thuth@redhat.com
Subject: [RFC 4/8] s390x/pci: Introduce the ZpciOps structure
Date: Wed,  9 Dec 2020 15:34:22 -0500
Message-Id: <1607546066-2240-5-git-send-email-mjrosato@linux.ibm.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1607546066-2240-1-git-send-email-mjrosato@linux.ibm.com>
References: <1607546066-2240-1-git-send-email-mjrosato@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-09_16:2020-12-09,
 2020-12-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=2 bulkscore=0
 adultscore=0 impostorscore=0 mlxscore=0 malwarescore=0 mlxlogscore=999
 phishscore=0 spamscore=0 priorityscore=1501 clxscore=1015
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

As inftrastructure to introduce different PCI instruction handlers,
introduce the ZpciOps structure to contain function pointers for the
handlers.  Add default handlers for the PCISTG, PCILG and PCISTB
instructions.

Signed-off-by: Matthew Rosato <mjrosato@linux.ibm.com>
---
 hw/s390x/s390-pci-bus.c          |   3 +
 hw/s390x/s390-pci-inst.c         | 238 ++++++++++++++++++++++++++-------------
 include/hw/s390x/s390-pci-bus.h  |  22 ++++
 include/hw/s390x/s390-pci-inst.h |   1 +
 4 files changed, 185 insertions(+), 79 deletions(-)

diff --git a/hw/s390x/s390-pci-bus.c b/hw/s390x/s390-pci-bus.c
index afad048..7d31ded 100644
--- a/hw/s390x/s390-pci-bus.c
+++ b/hw/s390x/s390-pci-bus.c
@@ -1020,6 +1020,7 @@ static void s390_pcihost_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
         pbdev->iommu->pbdev = pbdev;
         pbdev->state = ZPCI_FS_DISABLED;
         set_pbdev_info(pbdev);
+        zpci_assign_default_ops(pbdev);
 
         if (object_dynamic_cast(OBJECT(dev), "vfio-pci")) {
             pbdev->fh |= FH_SHM_VFIO;
@@ -1079,6 +1080,8 @@ static void s390_pcihost_unplug(HotplugHandler *hotplug_dev, DeviceState *dev,
         s390_pci_iommu_free(s, bus, devfn);
         pbdev->pdev = NULL;
         pbdev->state = ZPCI_FS_RESERVED;
+        if (pbdev->pcistb_buf)
+            qemu_vfree(pbdev->pcistb_buf);
     } else if (object_dynamic_cast(OBJECT(dev), TYPE_S390_PCI_DEVICE)) {
         pbdev = S390_PCI_DEVICE(dev);
         pbdev->fid = 0;
diff --git a/hw/s390x/s390-pci-inst.c b/hw/s390x/s390-pci-inst.c
index db86f12..b07ef2a 100644
--- a/hw/s390x/s390-pci-inst.c
+++ b/hw/s390x/s390-pci-inst.c
@@ -404,16 +404,49 @@ static MemTxResult zpci_read_bar(S390PCIBusDevice *pbdev, uint8_t pcias,
                                        MEMTXATTRS_UNSPECIFIED);
 }
 
+static int pcilg_default(S390PCIBusDevice *pbdev, uint64_t *data, uint8_t pcias,
+                         uint16_t len, uint64_t offset)
+{
+    MemTxResult result;
+
+    switch (pcias) {
+    case ZPCI_IO_BAR_MIN...ZPCI_IO_BAR_MAX:
+        if (!len || (len > (8 - (offset & 0x7)))) {
+            return -EINVAL;
+        }
+        result = zpci_read_bar(pbdev, pcias, offset, data, len);
+        if (result != MEMTX_OK) {
+            return -EINVAL;
+        }
+        break;
+    case ZPCI_CONFIG_BAR:
+        if (!len || (len > (4 - (offset & 0x3))) || len == 3) {
+            return -EINVAL;
+        }
+        *data =  pci_host_config_read_common(
+                   pbdev->pdev, offset, pci_config_size(pbdev->pdev), len);
+
+        if (zpci_endian_swap(data, len)) {
+            return -EINVAL;
+        }
+        break;
+    default:
+        return -EFAULT;
+    }
+
+    return 0;
+}
+
 int pcilg_service_call(S390CPU *cpu, uint8_t r1, uint8_t r2, uintptr_t ra)
 {
     CPUS390XState *env = &cpu->env;
     S390PCIBusDevice *pbdev;
     uint64_t offset;
     uint64_t data;
-    MemTxResult result;
     uint8_t len;
     uint32_t fh;
     uint8_t pcias;
+    int ret;
 
     if (env->psw.mask & PSW_MASK_PSTATE) {
         s390_program_interrupt(env, PGM_PRIVILEGED, ra);
@@ -452,35 +485,21 @@ int pcilg_service_call(S390CPU *cpu, uint8_t r1, uint8_t r2, uintptr_t ra)
         break;
     }
 
-    switch (pcias) {
-    case ZPCI_IO_BAR_MIN...ZPCI_IO_BAR_MAX:
-        if (!len || (len > (8 - (offset & 0x7)))) {
-            s390_program_interrupt(env, PGM_OPERAND, ra);
-            return 0;
-        }
-        result = zpci_read_bar(pbdev, pcias, offset, &data, len);
-        if (result != MEMTX_OK) {
-            s390_program_interrupt(env, PGM_OPERAND, ra);
-            return 0;
-        }
-        break;
-    case ZPCI_CONFIG_BAR:
-        if (!len || (len > (4 - (offset & 0x3))) || len == 3) {
-            s390_program_interrupt(env, PGM_OPERAND, ra);
-            return 0;
-        }
-        data =  pci_host_config_read_common(
-                   pbdev->pdev, offset, pci_config_size(pbdev->pdev), len);
+    ret = pbdev->ops.pcilg(pbdev, &data, pcias, len, offset);
 
-        if (zpci_endian_swap(&data, len)) {
-            s390_program_interrupt(env, PGM_OPERAND, ra);
-            return 0;
-        }
-        break;
-    default:
+    switch (ret) {
+    case -EINVAL:
+        s390_program_interrupt(env, PGM_OPERAND, ra);
+        return 0;
+    case -EFAULT:
         DPRINTF("pcilg invalid space\n");
         setcc(cpu, ZPCI_PCI_LS_ERR);
         s390_set_status_code(env, r2, ZPCI_PCI_ST_INVAL_AS);
+    case 0:
+        break;
+    default:
+        DPRINTF("pcilg unexpected return %d from op\n", ret);
+        s390_program_interrupt(env, PGM_OPERAND, ra);
         return 0;
     }
 
@@ -504,15 +523,55 @@ static MemTxResult zpci_write_bar(S390PCIBusDevice *pbdev, uint8_t pcias,
                                         MEMTXATTRS_UNSPECIFIED);
 }
 
+static int pcistg_default(S390PCIBusDevice *pbdev, uint64_t data, uint8_t pcias,
+                          uint16_t len, uint64_t offset)
+{
+    MemTxResult result;
+
+    switch (pcias) {
+        /* A ZPCI PCI card may use any BAR from BAR 0 to BAR 5 */
+    case ZPCI_IO_BAR_MIN...ZPCI_IO_BAR_MAX:
+        /*
+         * Check length:
+         * A length of 0 is invalid and length should not cross a double word
+         */
+        if (!len || (len > (8 - (offset & 0x7)))) {
+            return -EINVAL;
+        }
+
+        result = zpci_write_bar(pbdev, pcias, offset, data, len);
+        if (result != MEMTX_OK) {
+            return -EINVAL;
+        }
+        break;
+    case ZPCI_CONFIG_BAR:
+        /* ZPCI uses the pseudo BAR number 15 as configuration space */
+        /* possible access lengths are 1,2,4 and must not cross a word */
+        if (!len || (len > (4 - (offset & 0x3))) || len == 3) {
+            return -EINVAL;
+        }
+        /* len = 1,2,4 so we do not need to test */
+        zpci_endian_swap(&data, len);
+        pci_host_config_write_common(pbdev->pdev, offset,
+                                     pci_config_size(pbdev->pdev),
+                                     data, len);
+        break;
+    default:
+        return -EFAULT;
+    }
+
+    return 0;
+}
+
 int pcistg_service_call(S390CPU *cpu, uint8_t r1, uint8_t r2, uintptr_t ra)
 {
     CPUS390XState *env = &cpu->env;
     uint64_t offset, data;
     S390PCIBusDevice *pbdev;
-    MemTxResult result;
     uint8_t len;
     uint32_t fh;
     uint8_t pcias;
+    int ret;
 
     if (env->psw.mask & PSW_MASK_PSTATE) {
         s390_program_interrupt(env, PGM_PRIVILEGED, ra);
@@ -555,40 +614,21 @@ int pcistg_service_call(S390CPU *cpu, uint8_t r1, uint8_t r2, uintptr_t ra)
         break;
     }
 
-    switch (pcias) {
-        /* A ZPCI PCI card may use any BAR from BAR 0 to BAR 5 */
-    case ZPCI_IO_BAR_MIN...ZPCI_IO_BAR_MAX:
-        /* Check length:
-         * A length of 0 is invalid and length should not cross a double word
-         */
-        if (!len || (len > (8 - (offset & 0x7)))) {
-            s390_program_interrupt(env, PGM_OPERAND, ra);
-            return 0;
-        }
+    ret = pbdev->ops.pcistg(pbdev, data, pcias, len, offset);
 
-        result = zpci_write_bar(pbdev, pcias, offset, data, len);
-        if (result != MEMTX_OK) {
-            s390_program_interrupt(env, PGM_OPERAND, ra);
-            return 0;
-        }
-        break;
-    case ZPCI_CONFIG_BAR:
-        /* ZPCI uses the pseudo BAR number 15 as configuration space */
-        /* possible access lengths are 1,2,4 and must not cross a word */
-        if (!len || (len > (4 - (offset & 0x3))) || len == 3) {
-            s390_program_interrupt(env, PGM_OPERAND, ra);
-            return 0;
-        }
-        /* len = 1,2,4 so we do not need to test */
-        zpci_endian_swap(&data, len);
-        pci_host_config_write_common(pbdev->pdev, offset,
-                                     pci_config_size(pbdev->pdev),
-                                     data, len);
-        break;
-    default:
+    switch (ret) {
+    case -EINVAL:
+        s390_program_interrupt(env, PGM_OPERAND, ra);
+        return 0;
+    case -EFAULT:
         DPRINTF("pcistg invalid space\n");
         setcc(cpu, ZPCI_PCI_LS_ERR);
         s390_set_status_code(env, r2, ZPCI_PCI_ST_INVAL_AS);
+    case 0:
+        break;
+    default:
+        DPRINTF("pcistg unexpected return %d from op\n", ret);
+        s390_program_interrupt(env, PGM_OPERAND, ra);
         return 0;
     }
 
@@ -739,19 +779,53 @@ err:
     return 0;
 }
 
+/*
+ * The default PCISTB handler will break PCISTB instructions into a series of
+ * 8B memory operations.
+ */
+static int pcistb_default(S390PCIBusDevice *pbdev, S390CPU *cpu,
+                           uint64_t gaddr, uint8_t ar, uint8_t pcias,
+                           uint16_t len, uint64_t offset)
+{
+    MemTxResult result;
+    MemoryRegion *mr;
+    int i;
+
+    mr = pbdev->pdev->io_regions[pcias].memory;
+    mr = s390_get_subregion(mr, offset, len);
+    offset -= mr->addr;
+
+    if (!memory_region_access_valid(mr, offset, len, true,
+                                    MEMTXATTRS_UNSPECIFIED)) {
+        return -EINVAL;
+    }
+
+    if (s390_cpu_virt_mem_read(cpu, gaddr, ar, pbdev->pcistb_buf, len)) {
+        return -EACCES;
+    }
+
+    for (i = 0; i < len / 8; i++) {
+        result = memory_region_dispatch_write(mr, offset + i * 8,
+                                              ldq_p(pbdev->pcistb_buf + i * 8),
+                                              MO_64, MEMTXATTRS_UNSPECIFIED);
+        if (result != MEMTX_OK) {
+            return -EINVAL;
+        }
+    }
+
+    return 0;
+}
+
 int pcistb_service_call(S390CPU *cpu, uint8_t r1, uint8_t r3, uint64_t gaddr,
                         uint8_t ar, uintptr_t ra)
 {
     CPUS390XState *env = &cpu->env;
     S390PCIBusDevice *pbdev;
-    MemoryRegion *mr;
-    MemTxResult result;
     uint64_t offset;
-    int i;
     uint32_t fh;
     uint8_t pcias;
     uint16_t len;
-    uint8_t buffer[128];
+    int ret;
 
     if (env->psw.mask & PSW_MASK_PSTATE) {
         s390_program_interrupt(env, PGM_PRIVILEGED, ra);
@@ -812,29 +886,21 @@ int pcistb_service_call(S390CPU *cpu, uint8_t r1, uint8_t r3, uint64_t gaddr,
         goto specification_error;
     }
 
-    mr = pbdev->pdev->io_regions[pcias].memory;
-    mr = s390_get_subregion(mr, offset, len);
-    offset -= mr->addr;
+    ret = pbdev->ops.pcistb(pbdev, cpu, gaddr, ar, pcias, len, offset);
 
-    if (!memory_region_access_valid(mr, offset, len, true,
-                                    MEMTXATTRS_UNSPECIFIED)) {
+    switch (ret) {
+    case -EINVAL:
         s390_program_interrupt(env, PGM_OPERAND, ra);
         return 0;
-    }
-
-    if (s390_cpu_virt_mem_read(cpu, gaddr, ar, buffer, len)) {
+    case -EACCES:
         s390_cpu_virt_mem_handle_exc(cpu, ra);
         return 0;
-    }
-
-    for (i = 0; i < len / 8; i++) {
-        result = memory_region_dispatch_write(mr, offset + i * 8,
-                                              ldq_p(buffer + i * 8),
-                                              MO_64, MEMTXATTRS_UNSPECIFIED);
-        if (result != MEMTX_OK) {
-            s390_program_interrupt(env, PGM_OPERAND, ra);
-            return 0;
-        }
+    case 0:
+        break;
+    default:
+        DPRINTF("pcistb unexpected return %d from op\n", ret);
+        s390_program_interrupt(env, PGM_OPERAND, ra);
+        return 0;
     }
 
     pbdev->fmb.counter[ZPCI_FMB_CNT_STB]++;
@@ -1298,3 +1364,17 @@ out:
     setcc(cpu, cc);
     return 0;
 }
+
+void zpci_assign_default_ops(S390PCIBusDevice *pbdev)
+{
+    /*
+     * As PCISTB operations are not allowed to cross a page boundary, use
+     * qemu_memalign to get a single page for all subseqent PCISTB
+     * operations.
+     */
+    pbdev->pcistb_buf = qemu_memalign(PAGE_SIZE, PAGE_SIZE);
+
+    pbdev->ops.pcistg = pcistg_default;
+    pbdev->ops.pcilg = pcilg_default;
+    pbdev->ops.pcistb = pcistb_default;
+}
diff --git a/include/hw/s390x/s390-pci-bus.h b/include/hw/s390x/s390-pci-bus.h
index 49ae9f0..bf0034f 100644
--- a/include/hw/s390x/s390-pci-bus.h
+++ b/include/hw/s390x/s390-pci-bus.h
@@ -325,6 +325,26 @@ typedef struct S390PCIGroup {
 S390PCIGroup *s390_group_create(int id);
 S390PCIGroup *s390_group_find(int id);
 
+typedef struct ZpciOps {
+    int (*pcistg)(S390PCIBusDevice *pbdev,
+                  uint64_t data,
+                  uint8_t pcias,
+                  uint16_t len,
+                  uint64_t offset);
+    int (*pcilg)(S390PCIBusDevice *pbdev,
+                 uint64_t *data,
+                 uint8_t pcias,
+                 uint16_t len,
+                 uint64_t offset);
+    int (*pcistb)(S390PCIBusDevice *pbdev,
+                  S390CPU *cpu,
+                  uint64_t gaddr,
+                  uint8_t ar,
+                  uint8_t pcias,
+                  uint16_t len,
+                  uint64_t offset);
+} ZpciOps;
+
 struct S390PCIBusDevice {
     DeviceState qdev;
     PCIDevice *pdev;
@@ -350,6 +370,8 @@ struct S390PCIBusDevice {
     MemoryRegion msix_notify_mr;
     IndAddr *summary_ind;
     IndAddr *indicator;
+    ZpciOps ops;
+    uint8_t *pcistb_buf;
     bool pci_unplug_request_processed;
     bool unplug_requested;
     QTAILQ_ENTRY(S390PCIBusDevice) link;
diff --git a/include/hw/s390x/s390-pci-inst.h b/include/hw/s390x/s390-pci-inst.h
index a55c448..c9fe3f1 100644
--- a/include/hw/s390x/s390-pci-inst.h
+++ b/include/hw/s390x/s390-pci-inst.h
@@ -111,6 +111,7 @@ int mpcifc_service_call(S390CPU *cpu, uint8_t r1, uint64_t fiba, uint8_t ar,
 int stpcifc_service_call(S390CPU *cpu, uint8_t r1, uint64_t fiba, uint8_t ar,
                          uintptr_t ra);
 void fmb_timer_free(S390PCIBusDevice *pbdev);
+void zpci_assign_default_ops(S390PCIBusDevice *pbdev);
 
 #define ZPCI_IO_BAR_MIN 0
 #define ZPCI_IO_BAR_MAX 5
-- 
1.8.3.1


