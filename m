Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34FF14B7A25
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 23:02:47 +0100 (CET)
Received: from localhost ([::1]:51050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nK5uI-0001rx-9Q
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 17:02:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nK5az-00045Y-KM; Tue, 15 Feb 2022 16:42:50 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:47882)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nK5av-0002YF-21; Tue, 15 Feb 2022 16:42:49 -0500
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21FKDWRh014536; 
 Tue, 15 Feb 2022 21:42:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=68q7X/O34r4TRNRdQaRgtosceUUhKUEOv1LnQ7Kd/Po=;
 b=rWBnaL8G6veUDl8KATrPyRv4oVScO8u38IeMC+4PwzrI7Fym14/Rk4S/t1N2Qv+e3VQf
 Bf3ICbs6wIMSxotRb++qpOUKgCx8F6WVnq0yl8E0UM1j+H+jMBKHldVUGeTuYVPj/cjt
 DGfZvXtvQmfTb4v60lOlBHzFk8l65OAfQc5wqCQ+rCtRx0gT+EpYA/XawkzgFLTxFqcu
 hVrSA2lrOX2TdgKey/IOqV4AAD6vjiDyf54fsvOZqHExnnNQVGIYKZUezEZERRSNpf4d
 T9PFlGO/0EK/STSrYeyHfv/yKOnASAO35AjihVCOwgOwuNgCoa4RioNdthhUBouSwJWw EQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e8k1aa4kq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Feb 2022 21:42:34 +0000
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21FLex5A018989;
 Tue, 15 Feb 2022 21:42:34 GMT
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e8k1aa4k9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Feb 2022 21:42:34 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21FLgIIo016085;
 Tue, 15 Feb 2022 21:42:32 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma03wdc.us.ibm.com with ESMTP id 3e64hb2peb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Feb 2022 21:42:32 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21FLgVTY13173074
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 15 Feb 2022 21:42:31 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B89F5BE058;
 Tue, 15 Feb 2022 21:42:31 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 52791BE04F;
 Tue, 15 Feb 2022 21:42:30 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.143.123])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 15 Feb 2022 21:42:30 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 18/27] target/ppc: cpu_init: Reuse init_proc_603 for the e300
Date: Tue, 15 Feb 2022 18:41:39 -0300
Message-Id: <20220215214148.1848266-19-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220215214148.1848266-1-farosas@linux.ibm.com>
References: <20220215214148.1848266-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: u0I45jOMBl-5CBMBOa-gEi3fNzIQaefH
X-Proofpoint-ORIG-GUID: ur2hsQDUf12eYVMH-2zNS-xmriyXSN5E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-15_06,2022-02-14_04,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 clxscore=1015
 malwarescore=0 priorityscore=1501 adultscore=0 mlxscore=0 suspectscore=0
 impostorscore=0 phishscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202150122
Received-SPF: pass client-ip=148.163.156.1; envelope-from=farosas@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: danielhb413@gmail.com, qemu-ppc@nongnu.org, clg@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

init_proc_603 is defined after init_proc_e300, so I had to move some
code around to make it work.

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
---
 target/ppc/cpu_init.c | 104 +++++++++++++++++++-----------------------
 1 file changed, 46 insertions(+), 58 deletions(-)

diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index baf6be5b0d..8fbd205699 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -3269,64 +3269,6 @@ POWERPC_FAMILY(e200)(ObjectClass *oc, void *data)
                  POWERPC_FLAG_BUS_CLK;
 }
 
-static void init_proc_e300(CPUPPCState *env)
-{
-    register_ne_601_sprs(env);
-    register_sdr1_sprs(env);
-    register_603_sprs(env);
-    register_e300_sprs(env);
-
-    /* Memory management */
-    register_low_BATs(env);
-    register_high_BATs(env);
-    register_6xx_7xx_soft_tlb(env, 64, 2);
-    init_excp_603(env);
-    env->dcache_line_size = 32;
-    env->icache_line_size = 32;
-    /* Allocate hardware IRQ controller */
-    ppc6xx_irq_init(env_archcpu(env));
-}
-
-POWERPC_FAMILY(e300)(ObjectClass *oc, void *data)
-{
-    DeviceClass *dc = DEVICE_CLASS(oc);
-    PowerPCCPUClass *pcc = POWERPC_CPU_CLASS(oc);
-
-    dc->desc = "e300 core";
-    pcc->init_proc = init_proc_e300;
-    pcc->check_pow = check_pow_hid0;
-    pcc->insns_flags = PPC_INSNS_BASE | PPC_STRING | PPC_MFTB |
-                       PPC_FLOAT | PPC_FLOAT_FSEL | PPC_FLOAT_FRES |
-                       PPC_FLOAT_STFIWX |
-                       PPC_CACHE | PPC_CACHE_ICBI | PPC_CACHE_DCBZ |
-                       PPC_MEM_SYNC | PPC_MEM_EIEIO |
-                       PPC_MEM_TLBIE | PPC_MEM_TLBSYNC | PPC_6xx_TLB |
-                       PPC_SEGMENT | PPC_EXTERN;
-    pcc->msr_mask = (1ull << MSR_POW) |
-                    (1ull << MSR_TGPR) |
-                    (1ull << MSR_ILE) |
-                    (1ull << MSR_EE) |
-                    (1ull << MSR_PR) |
-                    (1ull << MSR_FP) |
-                    (1ull << MSR_ME) |
-                    (1ull << MSR_FE0) |
-                    (1ull << MSR_SE) |
-                    (1ull << MSR_DE) |
-                    (1ull << MSR_FE1) |
-                    (1ull << MSR_AL) |
-                    (1ull << MSR_EP) |
-                    (1ull << MSR_IR) |
-                    (1ull << MSR_DR) |
-                    (1ull << MSR_RI) |
-                    (1ull << MSR_LE);
-    pcc->mmu_model = POWERPC_MMU_SOFT_6xx;
-    pcc->excp_model = POWERPC_EXCP_6xx;
-    pcc->bus_model = PPC_FLAGS_INPUT_6xx;
-    pcc->bfd_mach = bfd_mach_ppc_603;
-    pcc->flags = POWERPC_FLAG_TGPR | POWERPC_FLAG_SE |
-                 POWERPC_FLAG_BE | POWERPC_FLAG_BUS_CLK;
-}
-
 enum fsl_e500_version {
     fsl_e500v1,
     fsl_e500v2,
@@ -3882,6 +3824,52 @@ POWERPC_FAMILY(603E)(ObjectClass *oc, void *data)
                  POWERPC_FLAG_BE | POWERPC_FLAG_BUS_CLK;
 }
 
+static void init_proc_e300(CPUPPCState *env)
+{
+    init_proc_603(env);
+    register_e300_sprs(env);
+}
+
+POWERPC_FAMILY(e300)(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+    PowerPCCPUClass *pcc = POWERPC_CPU_CLASS(oc);
+
+    dc->desc = "e300 core";
+    pcc->init_proc = init_proc_e300;
+    pcc->check_pow = check_pow_hid0;
+    pcc->insns_flags = PPC_INSNS_BASE | PPC_STRING | PPC_MFTB |
+                       PPC_FLOAT | PPC_FLOAT_FSEL | PPC_FLOAT_FRES |
+                       PPC_FLOAT_STFIWX |
+                       PPC_CACHE | PPC_CACHE_ICBI | PPC_CACHE_DCBZ |
+                       PPC_MEM_SYNC | PPC_MEM_EIEIO |
+                       PPC_MEM_TLBIE | PPC_MEM_TLBSYNC | PPC_6xx_TLB |
+                       PPC_SEGMENT | PPC_EXTERN;
+    pcc->msr_mask = (1ull << MSR_POW) |
+                    (1ull << MSR_TGPR) |
+                    (1ull << MSR_ILE) |
+                    (1ull << MSR_EE) |
+                    (1ull << MSR_PR) |
+                    (1ull << MSR_FP) |
+                    (1ull << MSR_ME) |
+                    (1ull << MSR_FE0) |
+                    (1ull << MSR_SE) |
+                    (1ull << MSR_DE) |
+                    (1ull << MSR_FE1) |
+                    (1ull << MSR_AL) |
+                    (1ull << MSR_EP) |
+                    (1ull << MSR_IR) |
+                    (1ull << MSR_DR) |
+                    (1ull << MSR_RI) |
+                    (1ull << MSR_LE);
+    pcc->mmu_model = POWERPC_MMU_SOFT_6xx;
+    pcc->excp_model = POWERPC_EXCP_6xx;
+    pcc->bus_model = PPC_FLAGS_INPUT_6xx;
+    pcc->bfd_mach = bfd_mach_ppc_603;
+    pcc->flags = POWERPC_FLAG_TGPR | POWERPC_FLAG_SE |
+                 POWERPC_FLAG_BE | POWERPC_FLAG_BUS_CLK;
+}
+
 static void init_proc_604(CPUPPCState *env)
 {
     register_ne_601_sprs(env);
-- 
2.34.1


