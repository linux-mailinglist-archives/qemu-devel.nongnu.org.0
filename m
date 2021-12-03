Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05097467975
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Dec 2021 15:32:25 +0100 (CET)
Received: from localhost ([::1]:36858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mt9bq-0003aU-SF
	for lists+qemu-devel@lfdr.de; Fri, 03 Dec 2021 09:32:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1mt9X1-00063y-4G; Fri, 03 Dec 2021 09:27:23 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:43624
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1mt9Wy-0004q4-8w; Fri, 03 Dec 2021 09:27:22 -0500
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B3EGt3s015966; 
 Fri, 3 Dec 2021 14:27:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=q2r4kT5kVauZyfUOKtTlIY9TSfamcawhFp19KQaysQU=;
 b=SpVLhc75phCKFO6jKFlZ7aE7DCZB8E5ESeaAeXPNJYSTPRjlTz+Pz2vQItP4/NkP4HnW
 gIaFbiwXafLTJpWx1+DSszQ1sQDluCCaITVnywlv1skVUmU/GtOf9j3i5bY7fKXC7jnp
 GuNgWpQMPv4Ko7m5oDAtTm0r1B9VjbJ/3i04aArSuBvg0kRFqULBPLPaSStQUE6r2WI3
 6PzTmXByFOosWbTxfsUYHb50Z3p/zhFb8XRRTrE4rM5BrcU7YEYGWbrUZ3kTE+Aftv3G
 hCZeIqOvJo56Fzmv0caA/9xqxFvOovlc5AiPwz/itXe8rMXsT3Wfo8f7RV5+1AkBiDqe fQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3cqmv4g6sr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Dec 2021 14:27:18 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1B3EIAX7018088;
 Fri, 3 Dec 2021 14:27:17 GMT
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3cqmv4g6sc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Dec 2021 14:27:17 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1B3EM9aN014681;
 Fri, 3 Dec 2021 14:27:17 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma03wdc.us.ibm.com with ESMTP id 3cn3k3vxqw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Dec 2021 14:27:17 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1B3ERF5I28508642
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 3 Dec 2021 14:27:15 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3A3556E052;
 Fri,  3 Dec 2021 14:27:15 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E35986E062;
 Fri,  3 Dec 2021 14:27:13 +0000 (GMT)
Received: from li-c92d2ccc-254b-11b2-a85c-a700b5bfb098.ibm.com.com (unknown
 [9.211.96.25])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri,  3 Dec 2021 14:27:13 +0000 (GMT)
From: Matthew Rosato <mjrosato@linux.ibm.com>
To: thuth@redhat.com, qemu-s390x@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v3 2/4] s390x/pci: don't use hard-coded dma range in reg_ioat
Date: Fri,  3 Dec 2021 09:27:04 -0500
Message-Id: <20211203142706.427279-3-mjrosato@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20211203142706.427279-1-mjrosato@linux.ibm.com>
References: <20211203142706.427279-1-mjrosato@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: OHeMgGE9fGV-1jmn-hfFKO_7pFIMRjd5
X-Proofpoint-ORIG-GUID: gzVGytGcW4OOo3cPrCAb-IQhkdbc2mfJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-03_06,2021-12-02_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 lowpriorityscore=0 mlxlogscore=626 mlxscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112030088
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=mjrosato@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: farman@linux.ibm.com, pmorel@linux.ibm.com, david@redhat.com,
 cohuck@redhat.com, richard.henderson@linaro.org, pasic@linux.ibm.com,
 borntraeger@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Instead use the values from clp info, they will either be the hard-coded
values or what came from the host driver via vfio.

Fixes: 9670ee752727 ("s390x/pci: use a PCI Function structure")
Reviewed-by: Eric Farman <farman@linux.ibm.com>
Reviewed-by: Pierre Morel <pmorel@linux.ibm.com>
Signed-off-by: Matthew Rosato <mjrosato@linux.ibm.com>
---
 hw/s390x/s390-pci-inst.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/hw/s390x/s390-pci-inst.c b/hw/s390x/s390-pci-inst.c
index 1c8ad91175..11b7f6bfa1 100644
--- a/hw/s390x/s390-pci-inst.c
+++ b/hw/s390x/s390-pci-inst.c
@@ -916,9 +916,10 @@ int pci_dereg_irqs(S390PCIBusDevice *pbdev)
     return 0;
 }
 
-static int reg_ioat(CPUS390XState *env, S390PCIIOMMU *iommu, ZpciFib fib,
+static int reg_ioat(CPUS390XState *env, S390PCIBusDevice *pbdev, ZpciFib fib,
                     uintptr_t ra)
 {
+    S390PCIIOMMU *iommu = pbdev->iommu;
     uint64_t pba = ldq_p(&fib.pba);
     uint64_t pal = ldq_p(&fib.pal);
     uint64_t g_iota = ldq_p(&fib.iota);
@@ -927,7 +928,7 @@ static int reg_ioat(CPUS390XState *env, S390PCIIOMMU *iommu, ZpciFib fib,
 
     pba &= ~0xfff;
     pal |= 0xfff;
-    if (pba > pal || pba < ZPCI_SDMA_ADDR || pal > ZPCI_EDMA_ADDR) {
+    if (pba > pal || pba < pbdev->zpci_fn.sdma || pal > pbdev->zpci_fn.edma) {
         s390_program_interrupt(env, PGM_OPERAND, ra);
         return -EINVAL;
     }
@@ -1125,7 +1126,7 @@ int mpcifc_service_call(S390CPU *cpu, uint8_t r1, uint64_t fiba, uint8_t ar,
         } else if (pbdev->iommu->enabled) {
             cc = ZPCI_PCI_LS_ERR;
             s390_set_status_code(env, r1, ZPCI_MOD_ST_SEQUENCE);
-        } else if (reg_ioat(env, pbdev->iommu, fib, ra)) {
+        } else if (reg_ioat(env, pbdev, fib, ra)) {
             cc = ZPCI_PCI_LS_ERR;
             s390_set_status_code(env, r1, ZPCI_MOD_ST_INSUF_RES);
         }
@@ -1150,7 +1151,7 @@ int mpcifc_service_call(S390CPU *cpu, uint8_t r1, uint64_t fiba, uint8_t ar,
             s390_set_status_code(env, r1, ZPCI_MOD_ST_SEQUENCE);
         } else {
             pci_dereg_ioat(pbdev->iommu);
-            if (reg_ioat(env, pbdev->iommu, fib, ra)) {
+            if (reg_ioat(env, pbdev, fib, ra)) {
                 cc = ZPCI_PCI_LS_ERR;
                 s390_set_status_code(env, r1, ZPCI_MOD_ST_INSUF_RES);
             }
-- 
2.27.0


