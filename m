Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 441214641EF
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Dec 2021 00:05:01 +0100 (CET)
Received: from localhost ([::1]:41148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msCBH-0004Y2-Du
	for lists+qemu-devel@lfdr.de; Tue, 30 Nov 2021 18:04:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1msC8X-00012T-6I; Tue, 30 Nov 2021 18:02:09 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:62522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1msC8V-0000L4-3h; Tue, 30 Nov 2021 18:02:08 -0500
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AUMqNPN040378; 
 Tue, 30 Nov 2021 23:01:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : content-transfer-encoding
 : mime-version; s=pp1; bh=MmHuhmBKRpKqf+7NrjjWq5Qs7QQhfsEXVMa7uWt0u0U=;
 b=VJLNSWBA+pgy8PVmz2RZg4k+lmXH6sXXnKuPD0EhoNAqATlnZykwGNG/Oi05nnR9gKft
 ULdlHzzFn/S3R9N5Sufom2RQ2Np5AFiH9bqeXwQ97vhinmcDffsB5s3TTotdNabH1Y4X
 hhdcYd/XEOHalQxGcwHoPT1wu/P217P19ROY74rbvGm9gygkTgPM2ACAhqVd0ELnDEYv
 lIQOMqfcBh9WwVLNIjaawcpJ0BuMbld/5fCBpUQUEfVBoPuWZJBr4lfT9gOsFHovTj6E
 zEPU2+3pHnhuciB5SRjWPca7qQzLEZ74qQU57MVKhoW3qXLb2l/B2RM/dOyA9rGj38Zm cg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cnw4s04w6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Nov 2021 23:01:37 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1AUMrjDM002099;
 Tue, 30 Nov 2021 23:01:37 GMT
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cnw4s04vs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Nov 2021 23:01:37 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1AUMlaEJ018265;
 Tue, 30 Nov 2021 23:01:36 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma01wdc.us.ibm.com with ESMTP id 3ckcab79ux-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Nov 2021 23:01:36 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1AUN1ZtH54067634
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 30 Nov 2021 23:01:35 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 509B8BE051;
 Tue, 30 Nov 2021 23:01:35 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BBA29BE056;
 Tue, 30 Nov 2021 23:01:32 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.34.87])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 30 Nov 2021 23:01:32 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 1/4] target/ppc: Disable software TLB for the 7450
 family
Date: Tue, 30 Nov 2021 20:01:20 -0300
Message-Id: <20211130230123.781844-2-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211130230123.781844-1-farosas@linux.ibm.com>
References: <20211130230123.781844-1-farosas@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: iNVyu2TUZP7G-95yD4J7VM6GHOkrACUi
X-Proofpoint-ORIG-GUID: 74iQUJzRp17hdKlnCPILAROkP86unlYD
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-30_10,2021-11-28_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 adultscore=0
 mlxlogscore=999 mlxscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111300112
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farosas@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
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
Cc: richard.henderson@linaro.org, danielhb413@gmail.com,
 mark.cave-ayland@ilande.co.uk, qemu-ppc@nongnu.org, clg@kaod.org,
 openbios@openbios.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

(Applies to 7441, 7445, 7450, 7451, 7455, 7457, 7447 and 7447a)*

We have since 2011 [1] been unable to run OpenBIOS in the 7450s and
have not heard of any other software that is used with those CPUs in
QEMU. A current discussion [2] shows that the 7450 software TLB is
unsupported in Linux 5.15, FreeBSD 13, MacOS9, MacOSX and MorphOS
3.15. With no known support in firmware or OS, this means that no code
for any of the 7450 CPUs is ever ran in QEMU.

Since the implementation in QEMU of the 7400 MMU is the same as the
7450, except for the software TLB vs. hardware TLB search, this patch
changes all 7450 cpus to the 7400 MMU model. This has the practical
effect of disabling the software TLB feature while keeping other
aspects of address translation working as expected.

This allow us to run software on the 7450 family again.

*- note that the 7448 is currently aliased in QEMU for a 7400, so it
   is unaffected by this change.

1- https://bugs.launchpad.net/qemu/+bug/812398
   https://gitlab.com/qemu-project/qemu/-/issues/86

2- https://lists.nongnu.org/archive/html/qemu-ppc/2021-11/msg00289.html
   message id: 20211119134431.406753-1-farosas@linux.ibm.com

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
---
 target/ppc/cpu_init.c | 25 ++++++++++---------------
 1 file changed, 10 insertions(+), 15 deletions(-)

diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 6695985e9b..509df35d09 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -5932,7 +5932,6 @@ static void init_proc_7440(CPUPPCState *env)
                  0x00000000);
     /* Memory management */
     register_low_BATs(env);
-    register_74xx_soft_tlb(env, 128, 2);
     init_excp_7450(env);
     env->dcache_line_size = 32;
     env->icache_line_size = 32;
@@ -5956,7 +5955,7 @@ POWERPC_FAMILY(7440)(ObjectClass *oc, void *data)
                        PPC_CACHE_DCBA | PPC_CACHE_DCBZ |
                        PPC_MEM_SYNC | PPC_MEM_EIEIO |
                        PPC_MEM_TLBIE | PPC_MEM_TLBSYNC |
-                       PPC_MEM_TLBIA | PPC_74xx_TLB |
+                       PPC_MEM_TLBIA |
                        PPC_SEGMENT | PPC_EXTERN |
                        PPC_ALTIVEC;
     pcc->msr_mask = (1ull << MSR_VR) |
@@ -5976,7 +5975,7 @@ POWERPC_FAMILY(7440)(ObjectClass *oc, void *data)
                     (1ull << MSR_PMM) |
                     (1ull << MSR_RI) |
                     (1ull << MSR_LE);
-    pcc->mmu_model = POWERPC_MMU_SOFT_74xx;
+    pcc->mmu_model = POWERPC_MMU_32B;
     pcc->excp_model = POWERPC_EXCP_74xx;
     pcc->bus_model = PPC_FLAGS_INPUT_6xx;
     pcc->bfd_mach = bfd_mach_ppc_7400;
@@ -6067,7 +6066,6 @@ static void init_proc_7450(CPUPPCState *env)
                  0x00000000);
     /* Memory management */
     register_low_BATs(env);
-    register_74xx_soft_tlb(env, 128, 2);
     init_excp_7450(env);
     env->dcache_line_size = 32;
     env->icache_line_size = 32;
@@ -6091,7 +6089,7 @@ POWERPC_FAMILY(7450)(ObjectClass *oc, void *data)
                        PPC_CACHE_DCBA | PPC_CACHE_DCBZ |
                        PPC_MEM_SYNC | PPC_MEM_EIEIO |
                        PPC_MEM_TLBIE | PPC_MEM_TLBSYNC |
-                       PPC_MEM_TLBIA | PPC_74xx_TLB |
+                       PPC_MEM_TLBIA |
                        PPC_SEGMENT | PPC_EXTERN |
                        PPC_ALTIVEC;
     pcc->msr_mask = (1ull << MSR_VR) |
@@ -6111,7 +6109,7 @@ POWERPC_FAMILY(7450)(ObjectClass *oc, void *data)
                     (1ull << MSR_PMM) |
                     (1ull << MSR_RI) |
                     (1ull << MSR_LE);
-    pcc->mmu_model = POWERPC_MMU_SOFT_74xx;
+    pcc->mmu_model = POWERPC_MMU_32B;
     pcc->excp_model = POWERPC_EXCP_74xx;
     pcc->bus_model = PPC_FLAGS_INPUT_6xx;
     pcc->bfd_mach = bfd_mach_ppc_7400;
@@ -6205,7 +6203,6 @@ static void init_proc_7445(CPUPPCState *env)
     /* Memory management */
     register_low_BATs(env);
     register_high_BATs(env);
-    register_74xx_soft_tlb(env, 128, 2);
     init_excp_7450(env);
     env->dcache_line_size = 32;
     env->icache_line_size = 32;
@@ -6229,7 +6226,7 @@ POWERPC_FAMILY(7445)(ObjectClass *oc, void *data)
                        PPC_CACHE_DCBA | PPC_CACHE_DCBZ |
                        PPC_MEM_SYNC | PPC_MEM_EIEIO |
                        PPC_MEM_TLBIE | PPC_MEM_TLBSYNC |
-                       PPC_MEM_TLBIA | PPC_74xx_TLB |
+                       PPC_MEM_TLBIA |
                        PPC_SEGMENT | PPC_EXTERN |
                        PPC_ALTIVEC;
     pcc->msr_mask = (1ull << MSR_VR) |
@@ -6249,7 +6246,7 @@ POWERPC_FAMILY(7445)(ObjectClass *oc, void *data)
                     (1ull << MSR_PMM) |
                     (1ull << MSR_RI) |
                     (1ull << MSR_LE);
-    pcc->mmu_model = POWERPC_MMU_SOFT_74xx;
+    pcc->mmu_model = POWERPC_MMU_32B;
     pcc->excp_model = POWERPC_EXCP_74xx;
     pcc->bus_model = PPC_FLAGS_INPUT_6xx;
     pcc->bfd_mach = bfd_mach_ppc_7400;
@@ -6345,7 +6342,6 @@ static void init_proc_7455(CPUPPCState *env)
     /* Memory management */
     register_low_BATs(env);
     register_high_BATs(env);
-    register_74xx_soft_tlb(env, 128, 2);
     init_excp_7450(env);
     env->dcache_line_size = 32;
     env->icache_line_size = 32;
@@ -6369,7 +6365,7 @@ POWERPC_FAMILY(7455)(ObjectClass *oc, void *data)
                        PPC_CACHE_DCBA | PPC_CACHE_DCBZ |
                        PPC_MEM_SYNC | PPC_MEM_EIEIO |
                        PPC_MEM_TLBIE | PPC_MEM_TLBSYNC |
-                       PPC_MEM_TLBIA | PPC_74xx_TLB |
+                       PPC_MEM_TLBIA |
                        PPC_SEGMENT | PPC_EXTERN |
                        PPC_ALTIVEC;
     pcc->msr_mask = (1ull << MSR_VR) |
@@ -6389,7 +6385,7 @@ POWERPC_FAMILY(7455)(ObjectClass *oc, void *data)
                     (1ull << MSR_PMM) |
                     (1ull << MSR_RI) |
                     (1ull << MSR_LE);
-    pcc->mmu_model = POWERPC_MMU_SOFT_74xx;
+    pcc->mmu_model = POWERPC_MMU_32B;
     pcc->excp_model = POWERPC_EXCP_74xx;
     pcc->bus_model = PPC_FLAGS_INPUT_6xx;
     pcc->bfd_mach = bfd_mach_ppc_7400;
@@ -6509,7 +6505,6 @@ static void init_proc_7457(CPUPPCState *env)
     /* Memory management */
     register_low_BATs(env);
     register_high_BATs(env);
-    register_74xx_soft_tlb(env, 128, 2);
     init_excp_7450(env);
     env->dcache_line_size = 32;
     env->icache_line_size = 32;
@@ -6533,7 +6528,7 @@ POWERPC_FAMILY(7457)(ObjectClass *oc, void *data)
                        PPC_CACHE_DCBA | PPC_CACHE_DCBZ |
                        PPC_MEM_SYNC | PPC_MEM_EIEIO |
                        PPC_MEM_TLBIE | PPC_MEM_TLBSYNC |
-                       PPC_MEM_TLBIA | PPC_74xx_TLB |
+                       PPC_MEM_TLBIA |
                        PPC_SEGMENT | PPC_EXTERN |
                        PPC_ALTIVEC;
     pcc->msr_mask = (1ull << MSR_VR) |
@@ -6553,7 +6548,7 @@ POWERPC_FAMILY(7457)(ObjectClass *oc, void *data)
                     (1ull << MSR_PMM) |
                     (1ull << MSR_RI) |
                     (1ull << MSR_LE);
-    pcc->mmu_model = POWERPC_MMU_SOFT_74xx;
+    pcc->mmu_model = POWERPC_MMU_32B;
     pcc->excp_model = POWERPC_EXCP_74xx;
     pcc->bus_model = PPC_FLAGS_INPUT_6xx;
     pcc->bfd_mach = bfd_mach_ppc_7400;
-- 
2.33.1


