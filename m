Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4329611B2E
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 21:50:04 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooVM3-0000FY-RN; Fri, 28 Oct 2022 15:49:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1ooVKw-0007tB-Dn; Fri, 28 Oct 2022 15:48:15 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1ooVKu-00084B-JV; Fri, 28 Oct 2022 15:48:14 -0400
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29SJIq9i013678;
 Fri, 28 Oct 2022 19:48:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : content-transfer-encoding
 : mime-version; s=pp1; bh=nehj1xAdeOWrD81mNDca9EgI41WgI2JQMCBbw89hpOA=;
 b=tDfPQEGkFtXZLXc0Zaf5I9iCRg5AOFCeMnjRb8zeCOLROHtBOiUfgSFSoCyw8ZitM64T
 iX44Eo9/WwJzdmnC9ptCqp1g28DW0fq0moCwp0N8QC/6e74ckvIEWpO7mRmkhJpdzn6E
 RPzWhWgH4Od1g2kyHtL4/EcZmcWQLkgij/qlQ22zEjo0Vo6zqYkSn//EKtS9iUML0c07
 kUWcHcdao4407vZngR3lbkiBZK+9pBSlnIfXD7NhixqrM015IuToI52ytNjBPax4oio0
 rh53mbT68NzS+G/jAGzhdkzJvdF5fESOYoS9aD8gFhGP2hVPCs2XSRxvXSyn0EuRRSim Uw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3kgn4p0t3p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Oct 2022 19:48:04 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29SJIvq7013953;
 Fri, 28 Oct 2022 19:48:03 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3kgn4p0t2x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Oct 2022 19:48:03 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29SJZQjO020125;
 Fri, 28 Oct 2022 19:48:03 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma01dal.us.ibm.com with ESMTP id 3kfahyh3ge-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Oct 2022 19:48:03 +0000
Received: from smtpav03.dal12v.mail.ibm.com ([9.208.128.129])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 29SJm1q520578896
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 28 Oct 2022 19:48:01 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 373EF5806C;
 Fri, 28 Oct 2022 19:48:01 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 430CC58061;
 Fri, 28 Oct 2022 19:48:00 +0000 (GMT)
Received: from li-2311da4c-2e09-11b2-a85c-c003041e9174.ibm.com.com (unknown
 [9.160.93.208]) by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
 Fri, 28 Oct 2022 19:48:00 +0000 (GMT)
From: Matthew Rosato <mjrosato@linux.ibm.com>
To: qemu-s390x@nongnu.org
Cc: farman@linux.ibm.com, pmorel@linux.ibm.com, schnelle@linux.ibm.com,
 cohuck@redhat.com, thuth@redhat.com, pasic@linux.ibm.com,
 borntraeger@linux.ibm.com, richard.henderson@linaro.org,
 david@redhat.com, qemu-devel@nongnu.org
Subject: [PATCH 1/3] s390x/pci: RPCIT second pass when mappings exhausted
Date: Fri, 28 Oct 2022 15:47:56 -0400
Message-Id: <20221028194758.204007-2-mjrosato@linux.ibm.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221028194758.204007-1-mjrosato@linux.ibm.com>
References: <20221028194758.204007-1-mjrosato@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: GOY_y9PEW-AxouaCPZ6g-Q329jtVCpmk
X-Proofpoint-GUID: Cw42c96Nnz0YkYIVsHiICnybpSk9xVn4
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-28_10,2022-10-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0
 spamscore=0 malwarescore=0 mlxlogscore=999 clxscore=1011
 lowpriorityscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 phishscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2210170000 definitions=main-2210280123
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=mjrosato@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

If we encounter a new mapping while the number of available DMA entries
in vfio is 0, we are currently skipping that mapping which is a problem
if we manage to free up DMA space after that within the same RPCIT --
we will return to the guest with CC0 and have not mapped everything
within the specified range.  This issue was uncovered while testing
changes to the s390 linux kernel iommu/dma code, where a different
usage pattern was employed (new mappings start at the end of the
aperture and work back towards the front, making us far more likely
to encounter new mappings before invalidated mappings during a
global refresh).

Fix this by tracking whether any mappings were skipped due to vfio
DMA limit hitting 0; when this occurs, we still continue the range
and unmap/map anything we can - then we must re-run the range again
to pickup anything that was missed.  This must occur in a loop until
all requests are satisfied (success) or we detect that we are still
unable to complete all mappings (return ZPCI_RPCIT_ST_INSUFF_RES).

Link: https://lore.kernel.org/linux-s390/20221019144435.369902-1-schnelle@linux.ibm.com/
Fixes: 37fa32de70 ("s390x/pci: Honor DMA limits set by vfio")
Reported-by: Niklas Schnelle <schnelle@linux.ibm.com>
Signed-off-by: Matthew Rosato <mjrosato@linux.ibm.com>
---
 hw/s390x/s390-pci-inst.c | 29 ++++++++++++++++++++++-------
 1 file changed, 22 insertions(+), 7 deletions(-)

diff --git a/hw/s390x/s390-pci-inst.c b/hw/s390x/s390-pci-inst.c
index 20a9bcc7af..7cc4bcf850 100644
--- a/hw/s390x/s390-pci-inst.c
+++ b/hw/s390x/s390-pci-inst.c
@@ -677,8 +677,9 @@ int rpcit_service_call(S390CPU *cpu, uint8_t r1, uint8_t r2, uintptr_t ra)
     S390PCIBusDevice *pbdev;
     S390PCIIOMMU *iommu;
     S390IOTLBEntry entry;
-    hwaddr start, end;
+    hwaddr start, end, sstart;
     uint32_t dma_avail;
+    bool again;
 
     if (env->psw.mask & PSW_MASK_PSTATE) {
         s390_program_interrupt(env, PGM_PRIVILEGED, ra);
@@ -691,7 +692,7 @@ int rpcit_service_call(S390CPU *cpu, uint8_t r1, uint8_t r2, uintptr_t ra)
     }
 
     fh = env->regs[r1] >> 32;
-    start = env->regs[r2];
+    sstart = start = env->regs[r2];
     end = start + env->regs[r2 + 1];
 
     pbdev = s390_pci_find_dev_by_fh(s390_get_phb(), fh);
@@ -732,6 +733,9 @@ int rpcit_service_call(S390CPU *cpu, uint8_t r1, uint8_t r2, uintptr_t ra)
         goto err;
     }
 
+ retry:
+    start = sstart;
+    again = false;
     while (start < end) {
         error = s390_guest_io_table_walk(iommu->g_iota, start, &entry);
         if (error) {
@@ -739,13 +743,24 @@ int rpcit_service_call(S390CPU *cpu, uint8_t r1, uint8_t r2, uintptr_t ra)
         }
 
         start += entry.len;
-        while (entry.iova < start && entry.iova < end &&
-               (dma_avail > 0 || entry.perm == IOMMU_NONE)) {
-            dma_avail = s390_pci_update_iotlb(iommu, &entry);
-            entry.iova += TARGET_PAGE_SIZE;
-            entry.translated_addr += TARGET_PAGE_SIZE;
+        while (entry.iova < start && entry.iova < end) {
+            if (dma_avail > 0 || entry.perm == IOMMU_NONE) {
+                dma_avail = s390_pci_update_iotlb(iommu, &entry);
+                entry.iova += TARGET_PAGE_SIZE;
+                entry.translated_addr += TARGET_PAGE_SIZE;
+            } else {
+                /*
+                 * We are unable to make a new mapping at this time, continue
+                 * on and hopefully free up more space.  Then attempt another
+                 * pass.
+                 */
+                again = true;
+                break;
+            }
         }
     }
+    if (again && dma_avail > 0)
+        goto retry;
 err:
     if (error) {
         pbdev->state = ZPCI_FS_ERROR;
-- 
2.37.3


