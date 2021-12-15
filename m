Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A138F4760A3
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 19:24:56 +0100 (CET)
Received: from localhost ([::1]:53074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxYxT-0003iR-PO
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 13:24:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mxXiH-0004tN-Rp; Wed, 15 Dec 2021 12:05:09 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:31428)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mxXiF-0004iO-7k; Wed, 15 Dec 2021 12:05:09 -0500
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BFGixJv016155; 
 Wed, 15 Dec 2021 17:04:36 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cx9rb714t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Dec 2021 17:04:36 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BFH2io5024823;
 Wed, 15 Dec 2021 17:04:34 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma06ams.nl.ibm.com with ESMTP id 3cy78e7kvh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Dec 2021 17:04:33 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 1BFGuW1j19464496
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Dec 2021 16:56:32 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 919E052052;
 Wed, 15 Dec 2021 17:04:31 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with SMTP id 5103F5204F;
 Wed, 15 Dec 2021 17:04:31 +0000 (GMT)
Received: from yukon.home (unknown [9.171.19.61])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 92956220295;
 Wed, 15 Dec 2021 18:04:30 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 054/102] target/ppc: Disable software TLB for the 7450 family
Date: Wed, 15 Dec 2021 18:03:09 +0100
Message-Id: <20211215170357.321643-42-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211215170357.321643-1-clg@kaod.org>
References: <20211215165847.321042-1-clg@kaod.org>
 <20211215170357.321643-1-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: qlxHajrAYpLp_gON9joBDboigiVBWKHO
X-Proofpoint-GUID: qlxHajrAYpLp_gON9joBDboigiVBWKHO
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-15_10,2021-12-14_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1034
 priorityscore=1501 bulkscore=0 phishscore=0 mlxlogscore=999 mlxscore=0
 adultscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2112150098
Received-SPF: softfail client-ip=148.163.156.1; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Fabiano Rosas <farosas@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Fabiano Rosas <farosas@linux.ibm.com>

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
Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
Message-Id: <20211130230123.781844-2-farosas@linux.ibm.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/cpu_init.c | 25 ++++++++++---------------
 1 file changed, 10 insertions(+), 15 deletions(-)

diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 6695985e9b56..509df35d0907 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -5932,7 +5932,6 @@ static void init_proc_7440(CPUPPCState *env)
                  0x00000000);
     /* Memory management */
     register_low_BATs(env);
-    register_74xx_soft_tlb(env, 128, 2);
     init_excp_7450(env);
     env->dcache_line_size =3D 32;
     env->icache_line_size =3D 32;
@@ -5956,7 +5955,7 @@ POWERPC_FAMILY(7440)(ObjectClass *oc, void *data)
                        PPC_CACHE_DCBA | PPC_CACHE_DCBZ |
                        PPC_MEM_SYNC | PPC_MEM_EIEIO |
                        PPC_MEM_TLBIE | PPC_MEM_TLBSYNC |
-                       PPC_MEM_TLBIA | PPC_74xx_TLB |
+                       PPC_MEM_TLBIA |
                        PPC_SEGMENT | PPC_EXTERN |
                        PPC_ALTIVEC;
     pcc->msr_mask =3D (1ull << MSR_VR) |
@@ -5976,7 +5975,7 @@ POWERPC_FAMILY(7440)(ObjectClass *oc, void *data)
                     (1ull << MSR_PMM) |
                     (1ull << MSR_RI) |
                     (1ull << MSR_LE);
-    pcc->mmu_model =3D POWERPC_MMU_SOFT_74xx;
+    pcc->mmu_model =3D POWERPC_MMU_32B;
     pcc->excp_model =3D POWERPC_EXCP_74xx;
     pcc->bus_model =3D PPC_FLAGS_INPUT_6xx;
     pcc->bfd_mach =3D bfd_mach_ppc_7400;
@@ -6067,7 +6066,6 @@ static void init_proc_7450(CPUPPCState *env)
                  0x00000000);
     /* Memory management */
     register_low_BATs(env);
-    register_74xx_soft_tlb(env, 128, 2);
     init_excp_7450(env);
     env->dcache_line_size =3D 32;
     env->icache_line_size =3D 32;
@@ -6091,7 +6089,7 @@ POWERPC_FAMILY(7450)(ObjectClass *oc, void *data)
                        PPC_CACHE_DCBA | PPC_CACHE_DCBZ |
                        PPC_MEM_SYNC | PPC_MEM_EIEIO |
                        PPC_MEM_TLBIE | PPC_MEM_TLBSYNC |
-                       PPC_MEM_TLBIA | PPC_74xx_TLB |
+                       PPC_MEM_TLBIA |
                        PPC_SEGMENT | PPC_EXTERN |
                        PPC_ALTIVEC;
     pcc->msr_mask =3D (1ull << MSR_VR) |
@@ -6111,7 +6109,7 @@ POWERPC_FAMILY(7450)(ObjectClass *oc, void *data)
                     (1ull << MSR_PMM) |
                     (1ull << MSR_RI) |
                     (1ull << MSR_LE);
-    pcc->mmu_model =3D POWERPC_MMU_SOFT_74xx;
+    pcc->mmu_model =3D POWERPC_MMU_32B;
     pcc->excp_model =3D POWERPC_EXCP_74xx;
     pcc->bus_model =3D PPC_FLAGS_INPUT_6xx;
     pcc->bfd_mach =3D bfd_mach_ppc_7400;
@@ -6205,7 +6203,6 @@ static void init_proc_7445(CPUPPCState *env)
     /* Memory management */
     register_low_BATs(env);
     register_high_BATs(env);
-    register_74xx_soft_tlb(env, 128, 2);
     init_excp_7450(env);
     env->dcache_line_size =3D 32;
     env->icache_line_size =3D 32;
@@ -6229,7 +6226,7 @@ POWERPC_FAMILY(7445)(ObjectClass *oc, void *data)
                        PPC_CACHE_DCBA | PPC_CACHE_DCBZ |
                        PPC_MEM_SYNC | PPC_MEM_EIEIO |
                        PPC_MEM_TLBIE | PPC_MEM_TLBSYNC |
-                       PPC_MEM_TLBIA | PPC_74xx_TLB |
+                       PPC_MEM_TLBIA |
                        PPC_SEGMENT | PPC_EXTERN |
                        PPC_ALTIVEC;
     pcc->msr_mask =3D (1ull << MSR_VR) |
@@ -6249,7 +6246,7 @@ POWERPC_FAMILY(7445)(ObjectClass *oc, void *data)
                     (1ull << MSR_PMM) |
                     (1ull << MSR_RI) |
                     (1ull << MSR_LE);
-    pcc->mmu_model =3D POWERPC_MMU_SOFT_74xx;
+    pcc->mmu_model =3D POWERPC_MMU_32B;
     pcc->excp_model =3D POWERPC_EXCP_74xx;
     pcc->bus_model =3D PPC_FLAGS_INPUT_6xx;
     pcc->bfd_mach =3D bfd_mach_ppc_7400;
@@ -6345,7 +6342,6 @@ static void init_proc_7455(CPUPPCState *env)
     /* Memory management */
     register_low_BATs(env);
     register_high_BATs(env);
-    register_74xx_soft_tlb(env, 128, 2);
     init_excp_7450(env);
     env->dcache_line_size =3D 32;
     env->icache_line_size =3D 32;
@@ -6369,7 +6365,7 @@ POWERPC_FAMILY(7455)(ObjectClass *oc, void *data)
                        PPC_CACHE_DCBA | PPC_CACHE_DCBZ |
                        PPC_MEM_SYNC | PPC_MEM_EIEIO |
                        PPC_MEM_TLBIE | PPC_MEM_TLBSYNC |
-                       PPC_MEM_TLBIA | PPC_74xx_TLB |
+                       PPC_MEM_TLBIA |
                        PPC_SEGMENT | PPC_EXTERN |
                        PPC_ALTIVEC;
     pcc->msr_mask =3D (1ull << MSR_VR) |
@@ -6389,7 +6385,7 @@ POWERPC_FAMILY(7455)(ObjectClass *oc, void *data)
                     (1ull << MSR_PMM) |
                     (1ull << MSR_RI) |
                     (1ull << MSR_LE);
-    pcc->mmu_model =3D POWERPC_MMU_SOFT_74xx;
+    pcc->mmu_model =3D POWERPC_MMU_32B;
     pcc->excp_model =3D POWERPC_EXCP_74xx;
     pcc->bus_model =3D PPC_FLAGS_INPUT_6xx;
     pcc->bfd_mach =3D bfd_mach_ppc_7400;
@@ -6509,7 +6505,6 @@ static void init_proc_7457(CPUPPCState *env)
     /* Memory management */
     register_low_BATs(env);
     register_high_BATs(env);
-    register_74xx_soft_tlb(env, 128, 2);
     init_excp_7450(env);
     env->dcache_line_size =3D 32;
     env->icache_line_size =3D 32;
@@ -6533,7 +6528,7 @@ POWERPC_FAMILY(7457)(ObjectClass *oc, void *data)
                        PPC_CACHE_DCBA | PPC_CACHE_DCBZ |
                        PPC_MEM_SYNC | PPC_MEM_EIEIO |
                        PPC_MEM_TLBIE | PPC_MEM_TLBSYNC |
-                       PPC_MEM_TLBIA | PPC_74xx_TLB |
+                       PPC_MEM_TLBIA |
                        PPC_SEGMENT | PPC_EXTERN |
                        PPC_ALTIVEC;
     pcc->msr_mask =3D (1ull << MSR_VR) |
@@ -6553,7 +6548,7 @@ POWERPC_FAMILY(7457)(ObjectClass *oc, void *data)
                     (1ull << MSR_PMM) |
                     (1ull << MSR_RI) |
                     (1ull << MSR_LE);
-    pcc->mmu_model =3D POWERPC_MMU_SOFT_74xx;
+    pcc->mmu_model =3D POWERPC_MMU_32B;
     pcc->excp_model =3D POWERPC_EXCP_74xx;
     pcc->bus_model =3D PPC_FLAGS_INPUT_6xx;
     pcc->bfd_mach =3D bfd_mach_ppc_7400;
--=20
2.31.1


