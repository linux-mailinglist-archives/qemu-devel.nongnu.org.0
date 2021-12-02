Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1935446688A
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Dec 2021 17:44:20 +0100 (CET)
Received: from localhost ([::1]:40814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mspBz-00016m-6Y
	for lists+qemu-devel@lfdr.de; Thu, 02 Dec 2021 11:44:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1msp9F-0006nq-QW; Thu, 02 Dec 2021 11:41:29 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:39340)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1msp9B-0002xB-Vt; Thu, 02 Dec 2021 11:41:29 -0500
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B2FrFOw007013; 
 Thu, 2 Dec 2021 16:41:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=jRLm/xU+duyg6opKrciZp03lySp9Wb/WjBpT6/vtPIc=;
 b=DuUvqFXtvBXJcuVOtqpWs59d1prgS0vTb2xuUFHMvkDpgPb/nFJvPvenTw0tENsKPfz9
 8fwLpaFdpV3VPzOg+hq/GiMlceskFNy5p5aDQtKycuTcZPvKKg7S2zQRAc7Zb86KOD8E
 8s/aOLEL4Lk8/UK6vbMVfvokp06vZ+SvXk1nE4f+99Pamesmuvsef8jflx6/uyN3dw6J
 RxGQNIdx2TYD/oQ17lqv5g/4dcwrDatX8O1DC16tNuJK1cmcdMhnDdhVtlE2sYKlioeh
 I3XAdR7bEP1zmNJGqkqVCRm1tu0QKVKvcFsBanPZqdhNov3J4Y+wrsyeWO3zgrVC2MR4 cw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cq15yh2s5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Dec 2021 16:41:22 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1B2GfLj0011953;
 Thu, 2 Dec 2021 16:41:21 GMT
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cq15yh2rw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Dec 2021 16:41:21 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1B2GT8sJ026115;
 Thu, 2 Dec 2021 16:41:20 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma03dal.us.ibm.com with ESMTP id 3ckcade8ep-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Dec 2021 16:41:20 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1B2GfJ9i57541004
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 2 Dec 2021 16:41:19 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 51202136061;
 Thu,  2 Dec 2021 16:41:19 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5CD9413605E;
 Thu,  2 Dec 2021 16:41:18 +0000 (GMT)
Received: from li-c92d2ccc-254b-11b2-a85c-a700b5bfb098.ibm.com.com (unknown
 [9.211.48.116])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu,  2 Dec 2021 16:41:18 +0000 (GMT)
From: Matthew Rosato <mjrosato@linux.ibm.com>
To: thuth@redhat.com, qemu-s390x@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH 2/4] s390x/pci: don't use hard-coded dma range in reg_ioat
Date: Thu,  2 Dec 2021 11:41:08 -0500
Message-Id: <20211202164110.326947-3-mjrosato@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20211202164110.326947-1-mjrosato@linux.ibm.com>
References: <20211202164110.326947-1-mjrosato@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: jkzAIJMJNDFzucCKthWH9TfYrjKV2sft
X-Proofpoint-GUID: jgRzvaxvp7Xy2EeJTX29EKB2Dv6o4C7d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-02_10,2021-12-02_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0
 clxscore=1015 suspectscore=0 mlxlogscore=616 impostorscore=0 bulkscore=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 mlxscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2112020109
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=mjrosato@linux.ibm.com; helo=mx0b-001b2d01.pphosted.com
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


