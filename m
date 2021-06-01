Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F7BF397BE3
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 23:51:06 +0200 (CEST)
Received: from localhost ([::1]:53882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loCHx-0000Ns-Do
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 17:51:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1loCEC-0001xE-2V; Tue, 01 Jun 2021 17:47:12 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:48310)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1loCE8-0004Oa-Tg; Tue, 01 Jun 2021 17:47:11 -0400
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 151LYbWl063153; Tue, 1 Jun 2021 17:47:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=Duopp7ZnRxVjEbc4qWoAY8IaVuAaEgpQHqlrLEa89YE=;
 b=qQSoOb3P9tkZUxcnB90NGUCaYROREh8zXV+1Zg3ujBdzlfAas+XfnX97/8D02WWUldyb
 e0lVMhkBSvBch96UvG61zEU31Nos5fZC3Cbqv+Yyekf9iig4od/l6qtfnSj9INmVSD34
 SHTkqRTHHWBGCy9dE3gfBqHfDmCGpTM5yI10PIKtqEH8BvJHF2a8Q9cKm7+K2n0umo0C
 qhsA3C5RWXXHFQDbtwAK4MSy2KHEoKrRXreeFr8ef3GD/82KwftnRC8R6nP7S2dbtrnA
 S97erKPoIATgnqpK8jzmPeeBxcUcN1TMq2O+1SyA/AwvhYJQFw5qUpI5T4emoxUPZDgp Fg== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38wu21u6ss-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Jun 2021 17:47:03 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 151LgoYW032033;
 Tue, 1 Jun 2021 21:47:02 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma03dal.us.ibm.com with ESMTP id 38ud8a1c5m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Jun 2021 21:47:02 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 151Ll1fM35324184
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 1 Jun 2021 21:47:01 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 74E557805F;
 Tue,  1 Jun 2021 21:47:01 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E4FF978064;
 Tue,  1 Jun 2021 21:46:59 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.142.192])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue,  1 Jun 2021 21:46:59 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 4/5] target/ppc: powerpc_excp: Standardize arguments to
 interrupt code
Date: Tue,  1 Jun 2021 18:46:48 -0300
Message-Id: <20210601214649.785647-5-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210601214649.785647-1-farosas@linux.ibm.com>
References: <20210601214649.785647-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: pHv9LtJ-YAfGneT5dvQEn4-L7aixISes
X-Proofpoint-ORIG-GUID: pHv9LtJ-YAfGneT5dvQEn4-L7aixISes
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-01_10:2021-06-01,
 2021-06-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 suspectscore=0 bulkscore=0 spamscore=0
 phishscore=0 mlxlogscore=999 impostorscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106010143
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farosas@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The next patches will split the big switch statement in powerpc_excp
into individual functions so it would be cleaner if all variables are
already grouped in a structure and their names consistent.

This patch makes it so that the old values for MSR and NIP (from env)
are saved at the beginning as regs.msr and regs.nip and all
modifications are done over this regs version. At the end of the
function regs.msr and regs.nip are saved in the SRRs and regs.new_msr
and regs.new_nip are written to env.

There are two points of interest here:

- The system call code has a particularity where it needs to use
env->nip because it might return early and the modification needs to
be seen by the virtual hypervisor hypercall code. I have added a
comment making this clear.

- The MSR filter at the beginning is being applied to the old MSR value
only, i.e. the one that goes into SRR1. The new_msr is taken from
env->msr without filtering the reserved bits. This might be a bug in
the existing code. I'm also adding a comment to point that out.

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
---
 target/ppc/excp_helper.c | 231 +++++++++++++++++++++------------------
 1 file changed, 125 insertions(+), 106 deletions(-)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index fd147e2a37..12bf829c8f 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -186,7 +186,7 @@ static int powerpc_reset_wakeup(CPUState *cs, CPUPPCState *env, int excp,
 static inline void ppc_excp_apply_ail(PowerPCCPU *cpu, int excp_model, int excp,
                                       target_ulong msr,
                                       target_ulong *new_msr,
-                                      target_ulong *vector)
+                                      target_ulong *new_nip)
 {
 #if defined(TARGET_PPC64)
     CPUPPCState *env = &cpu->env;
@@ -263,9 +263,9 @@ static inline void ppc_excp_apply_ail(PowerPCCPU *cpu, int excp_model, int excp,
 
     if (excp != POWERPC_EXCP_SYSCALL_VECTORED) {
         if (ail == 2) {
-            *vector |= 0x0000000000018000ull;
+            *new_nip |= 0x0000000000018000ull;
         } else if (ail == 3) {
-            *vector |= 0xc000000000004000ull;
+            *new_nip |= 0xc000000000004000ull;
         }
     } else {
         /*
@@ -273,15 +273,15 @@ static inline void ppc_excp_apply_ail(PowerPCCPU *cpu, int excp_model, int excp,
          * only the MSR. AIL=3 replaces the 0x17000 base with 0xc...3000.
          */
         if (ail == 3) {
-            *vector &= ~0x0000000000017000ull; /* Un-apply the base offset */
-            *vector |= 0xc000000000003000ull; /* Apply scv's AIL=3 offset */
+            *new_nip &= ~0x0000000000017000ull; /* Un-apply the base offset */
+            *new_nip |= 0xc000000000003000ull; /* Apply scv's AIL=3 offset */
         }
     }
 #endif
 }
 
-static inline void powerpc_set_excp_state(PowerPCCPU *cpu,
-                                          target_ulong vector, target_ulong msr)
+static inline void powerpc_set_excp_state(PowerPCCPU *cpu, target_ulong new_nip,
+                                          target_ulong new_msr)
 {
     CPUState *cs = CPU(cpu);
     CPUPPCState *env = &cpu->env;
@@ -294,9 +294,9 @@ static inline void powerpc_set_excp_state(PowerPCCPU *cpu,
      * will prevent setting of the HV bit which some exceptions might need
      * to do.
      */
-    env->msr = msr & env->msr_mask;
+    env->msr = new_msr & env->msr_mask;
     hreg_compute_hflags(env);
-    env->nip = vector;
+    env->nip = new_nip;
     /* Reset exception state */
     cs->exception_index = POWERPC_EXCP_NONE;
     env->error_code = 0;
@@ -311,6 +311,17 @@ static inline void powerpc_set_excp_state(PowerPCCPU *cpu,
     check_tlb_flush(env, false);
 }
 
+struct ppc_intr_args {
+    target_ulong nip;
+    target_ulong msr;
+    target_ulong new_nip;
+    target_ulong new_msr;
+    int sprn_srr0;
+    int sprn_srr1;
+    int sprn_asrr0;
+    int sprn_asrr1;
+};
+
 /*
  * Note that this function should be greatly optimized when called
  * with a constant excp, from ppc_hw_interrupt
@@ -319,37 +330,40 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp)
 {
     CPUState *cs = CPU(cpu);
     CPUPPCState *env = &cpu->env;
-    target_ulong msr, new_msr, vector;
-    int srr0, srr1, asrr0, asrr1, lev = -1;
+    struct ppc_intr_args regs;
+    int lev = -1;
 
     qemu_log_mask(CPU_LOG_INT, "Raise exception at " TARGET_FMT_lx
                   " => %08x (%02x)\n", env->nip, excp, env->error_code);
 
     /* new srr1 value excluding must-be-zero bits */
     if (excp_model == POWERPC_EXCP_BOOKE) {
-        msr = env->msr;
+        regs.msr = env->msr;
     } else {
-        msr = env->msr & ~0x783f0000ULL;
+        regs.msr = env->msr & ~0x783f0000ULL;
     }
+    regs.nip = env->nip;
 
     /*
      * new interrupt handler msr preserves existing HV and ME unless
      * explicitly overriden
+     *
+     * XXX: should this use the filtered MSR (regs.msr) from above
+     * instead of the unfiltered env->msr?
      */
-    new_msr = env->msr & (((target_ulong)1 << MSR_ME) | MSR_HVB);
+    regs.new_msr = env->msr & (((target_ulong)1 << MSR_ME) | MSR_HVB);
 
-    /* target registers */
-    srr0 = SPR_SRR0;
-    srr1 = SPR_SRR1;
-    asrr0 = -1;
-    asrr1 = -1;
+    regs.sprn_srr0 = SPR_SRR0;
+    regs.sprn_srr1 = SPR_SRR1;
+    regs.sprn_asrr0 = -1;
+    regs.sprn_asrr1 = -1;
 
     /*
      * check for special resume at 0x100 from doze/nap/sleep/winkle on
      * P7/P8/P9
      */
     if (env->resume_as_sreset) {
-        excp = powerpc_reset_wakeup(cs, env, excp, &msr);
+        excp = powerpc_reset_wakeup(cs, env, excp, &regs.msr);
     }
 
     /*
@@ -373,12 +387,12 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp)
     case POWERPC_EXCP_CRITICAL:    /* Critical input                         */
         switch (excp_model) {
         case POWERPC_EXCP_40x:
-            srr0 = SPR_40x_SRR2;
-            srr1 = SPR_40x_SRR3;
+            regs.sprn_srr0 = SPR_40x_SRR2;
+            regs.sprn_srr1 = SPR_40x_SRR3;
             break;
         case POWERPC_EXCP_BOOKE:
-            srr0 = SPR_BOOKE_CSRR0;
-            srr1 = SPR_BOOKE_CSRR1;
+            regs.sprn_srr0 = SPR_BOOKE_CSRR0;
+            regs.sprn_srr1 = SPR_BOOKE_CSRR1;
             break;
         case POWERPC_EXCP_G2:
             break;
@@ -406,24 +420,24 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp)
              * ISA specifies HV, but can be delivered to guest with HV
              * clear (e.g., see FWNMI in PAPR).
              */
-            new_msr |= (target_ulong)MSR_HVB;
+            regs.new_msr |= (target_ulong)MSR_HVB;
         }
 
         /* machine check exceptions don't have ME set */
-        new_msr &= ~((target_ulong)1 << MSR_ME);
+        regs.new_msr &= ~((target_ulong)1 << MSR_ME);
 
         /* XXX: should also have something loaded in DAR / DSISR */
         switch (excp_model) {
         case POWERPC_EXCP_40x:
-            srr0 = SPR_40x_SRR2;
-            srr1 = SPR_40x_SRR3;
+            regs.sprn_srr0 = SPR_40x_SRR2;
+            regs.sprn_srr1 = SPR_40x_SRR3;
             break;
         case POWERPC_EXCP_BOOKE:
             /* FIXME: choose one or the other based on CPU type */
-            srr0 = SPR_BOOKE_MCSRR0;
-            srr1 = SPR_BOOKE_MCSRR1;
-            asrr0 = SPR_BOOKE_CSRR0;
-            asrr1 = SPR_BOOKE_CSRR1;
+            regs.sprn_srr0 = SPR_BOOKE_MCSRR0;
+            regs.sprn_srr1 = SPR_BOOKE_MCSRR1;
+            regs.sprn_asrr0 = SPR_BOOKE_CSRR0;
+            regs.sprn_asrr1 = SPR_BOOKE_CSRR1;
             break;
         default:
             break;
@@ -435,8 +449,8 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp)
         break;
     case POWERPC_EXCP_ISI:       /* Instruction storage exception            */
         LOG_EXCP("ISI exception: msr=" TARGET_FMT_lx ", nip=" TARGET_FMT_lx
-                 "\n", msr, env->nip);
-        msr |= env->error_code;
+                 "\n", regs.msr, regs.nip);
+        regs.msr |= env->error_code;
         break;
     case POWERPC_EXCP_EXTERNAL:  /* External input                           */
     {
@@ -466,10 +480,10 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp)
         }
 
         if (!lpes0) {
-            new_msr |= (target_ulong)MSR_HVB;
-            new_msr |= env->msr & ((target_ulong)1 << MSR_RI);
-            srr0 = SPR_HSRR0;
-            srr1 = SPR_HSRR1;
+            regs.new_msr |= (target_ulong)MSR_HVB;
+            regs.new_msr |= env->msr & ((target_ulong)1 << MSR_RI);
+            regs.sprn_srr0 = SPR_HSRR0;
+            regs.sprn_srr1 = SPR_HSRR1;
         }
         if (env->mpic_proxy) {
             /* IACK the IRQ on delivery */
@@ -501,20 +515,20 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp)
              * instruction, so always use store_next and claim we are
              * precise in the MSR.
              */
-            msr |= 0x00100000;
+            regs.msr |= 0x00100000;
             env->spr[SPR_BOOKE_ESR] = ESR_FP;
             break;
         case POWERPC_EXCP_INVAL:
-            LOG_EXCP("Invalid instruction at " TARGET_FMT_lx "\n", env->nip);
-            msr |= 0x00080000;
+            LOG_EXCP("Invalid instruction at " TARGET_FMT_lx "\n", regs.nip);
+            regs.msr |= 0x00080000;
             env->spr[SPR_BOOKE_ESR] = ESR_PIL;
             break;
         case POWERPC_EXCP_PRIV:
-            msr |= 0x00040000;
+            regs.msr |= 0x00040000;
             env->spr[SPR_BOOKE_ESR] = ESR_PPR;
             break;
         case POWERPC_EXCP_TRAP:
-            msr |= 0x00020000;
+            regs.msr |= 0x00020000;
             env->spr[SPR_BOOKE_ESR] = ESR_PTR;
             break;
         default:
@@ -535,9 +549,12 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp)
 
         /*
          * We need to correct the NIP which in this case is supposed
-         * to point to the next instruction
+         * to point to the next instruction. We also set env->nip here
+         * because the modification needs to be accessible by the
+         * virtual hypervisor code below.
          */
-        env->nip += 4;
+        regs.nip += 4;
+        env->nip = regs.nip;
 
         /* "PAPR mode" built-in hypercall emulation */
         if ((lev == 1) && cpu->vhyp) {
@@ -546,16 +563,17 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp)
             vhc->hypercall(cpu->vhyp, cpu);
             return;
         }
+
         if (lev == 1) {
-            new_msr |= (target_ulong)MSR_HVB;
+            regs.new_msr |= (target_ulong)MSR_HVB;
         }
         break;
     case POWERPC_EXCP_SYSCALL_VECTORED: /* scv exception                     */
         lev = env->error_code;
         dump_syscall(env);
-        env->nip += 4;
-        new_msr |= env->msr & ((target_ulong)1 << MSR_EE);
-        new_msr |= env->msr & ((target_ulong)1 << MSR_RI);
+        regs.nip += 4;
+        regs.new_msr |= env->msr & ((target_ulong)1 << MSR_EE);
+        regs.new_msr |= env->msr & ((target_ulong)1 << MSR_RI);
         break;
     case POWERPC_EXCP_FPU:       /* Floating-point unavailable exception     */
     case POWERPC_EXCP_APU:       /* Auxiliary processor unavailable          */
@@ -569,8 +587,8 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp)
         LOG_EXCP("WDT exception\n");
         switch (excp_model) {
         case POWERPC_EXCP_BOOKE:
-            srr0 = SPR_BOOKE_CSRR0;
-            srr1 = SPR_BOOKE_CSRR1;
+            regs.sprn_srr0 = SPR_BOOKE_CSRR0;
+            regs.sprn_srr1 = SPR_BOOKE_CSRR1;
             break;
         default:
             break;
@@ -582,10 +600,10 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp)
     case POWERPC_EXCP_DEBUG:     /* Debug interrupt                          */
         if (env->flags & POWERPC_FLAG_DE) {
             /* FIXME: choose one or the other based on CPU type */
-            srr0 = SPR_BOOKE_DSRR0;
-            srr1 = SPR_BOOKE_DSRR1;
-            asrr0 = SPR_BOOKE_CSRR0;
-            asrr1 = SPR_BOOKE_CSRR1;
+            regs.sprn_srr0 = SPR_BOOKE_DSRR0;
+            regs.sprn_srr1 = SPR_BOOKE_DSRR1;
+            regs.sprn_asrr0 = SPR_BOOKE_CSRR0;
+            regs.sprn_asrr1 = SPR_BOOKE_CSRR1;
             /* DBSR already modified by caller */
         } else {
             cpu_abort(cs, "Debug exception triggered on unsupported model\n");
@@ -614,22 +632,22 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp)
     case POWERPC_EXCP_DOORI:     /* Embedded doorbell interrupt              */
         break;
     case POWERPC_EXCP_DOORCI:    /* Embedded doorbell critical interrupt     */
-        srr0 = SPR_BOOKE_CSRR0;
-        srr1 = SPR_BOOKE_CSRR1;
+        regs.sprn_srr0 = SPR_BOOKE_CSRR0;
+        regs.sprn_srr1 = SPR_BOOKE_CSRR1;
         break;
     case POWERPC_EXCP_RESET:     /* System reset exception                   */
         /* A power-saving exception sets ME, otherwise it is unchanged */
         if (msr_pow) {
             /* indicate that we resumed from power save mode */
-            msr |= 0x10000;
-            new_msr |= ((target_ulong)1 << MSR_ME);
+            regs.msr |= 0x10000;
+            regs.new_msr |= ((target_ulong)1 << MSR_ME);
         }
         if (env->msr_mask & MSR_HVB) {
             /*
              * ISA specifies HV, but can be delivered to guest with HV
              * clear (e.g., see FWNMI in PAPR, NMI injection in QEMU).
              */
-            new_msr |= (target_ulong)MSR_HVB;
+            regs.new_msr |= (target_ulong)MSR_HVB;
         } else {
             if (msr_pow) {
                 cpu_abort(cs, "Trying to deliver power-saving system reset "
@@ -642,7 +660,7 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp)
     case POWERPC_EXCP_TRACE:     /* Trace exception                          */
         break;
     case POWERPC_EXCP_HISI:      /* Hypervisor instruction storage exception */
-        msr |= env->error_code;
+        regs.msr |= env->error_code;
         /* fall through */
     case POWERPC_EXCP_HDECR:     /* Hypervisor decrementer exception         */
     case POWERPC_EXCP_HDSI:      /* Hypervisor data storage exception        */
@@ -651,10 +669,10 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp)
     case POWERPC_EXCP_SDOOR_HV:  /* Hypervisor Doorbell interrupt            */
     case POWERPC_EXCP_HV_EMU:
     case POWERPC_EXCP_HVIRT:     /* Hypervisor virtualization                */
-        srr0 = SPR_HSRR0;
-        srr1 = SPR_HSRR1;
-        new_msr |= (target_ulong)MSR_HVB;
-        new_msr |= env->msr & ((target_ulong)1 << MSR_RI);
+        regs.sprn_srr0 = SPR_HSRR0;
+        regs.sprn_srr1 = SPR_HSRR1;
+        regs.new_msr |= (target_ulong)MSR_HVB;
+        regs.new_msr |= env->msr & ((target_ulong)1 << MSR_RI);
         break;
     case POWERPC_EXCP_VPU:       /* Vector unavailable exception             */
     case POWERPC_EXCP_VSXU:       /* VSX unavailable exception               */
@@ -666,10 +684,10 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp)
     case POWERPC_EXCP_HV_FU:     /* Hypervisor Facility Unavailable Exception */
 #ifdef TARGET_PPC64
         env->spr[SPR_HFSCR] |= ((target_ulong)env->error_code << FSCR_IC_POS);
-        srr0 = SPR_HSRR0;
-        srr1 = SPR_HSRR1;
-        new_msr |= (target_ulong)MSR_HVB;
-        new_msr |= env->msr & ((target_ulong)1 << MSR_RI);
+        regs.sprn_srr0 = SPR_HSRR0;
+        regs.sprn_srr1 = SPR_HSRR1;
+        regs.new_msr |= (target_ulong)MSR_HVB;
+        regs.new_msr |= env->msr & ((target_ulong)1 << MSR_RI);
 #endif
         break;
     case POWERPC_EXCP_PIT:       /* Programmable interval timer interrupt    */
@@ -697,8 +715,8 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp)
         case POWERPC_EXCP_603E:
         case POWERPC_EXCP_G2:
             /* Swap temporary saved registers with GPRs */
-            if (!(new_msr & ((target_ulong)1 << MSR_TGPR))) {
-                new_msr |= (target_ulong)1 << MSR_TGPR;
+            if (!(regs.new_msr & ((target_ulong)1 << MSR_TGPR))) {
+                regs.new_msr |= (target_ulong)1 << MSR_TGPR;
                 hreg_swap_gpr_tgpr(env);
             }
             /* fall through */
@@ -731,10 +749,10 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp)
                          env->error_code);
             }
 #endif
-            msr |= env->crf[0] << 28;
-            msr |= env->error_code; /* key, D/I, S/L bits */
+            regs.msr |= env->crf[0] << 28;
+            regs.msr |= env->error_code; /* key, D/I, S/L bits */
             /* Set way using a LRU mechanism */
-            msr |= ((env->last_way + 1) & (env->nb_ways - 1)) << 17;
+            regs.msr |= ((env->last_way + 1) & (env->nb_ways - 1)) << 17;
             break;
         case POWERPC_EXCP_74xx:
 #if defined(DEBUG_SOFTWARE_TLB)
@@ -763,7 +781,7 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp)
                          env->error_code);
             }
 #endif
-            msr |= env->error_code; /* key bit */
+            regs.msr |= env->error_code; /* key bit */
             break;
         default:
             cpu_abort(cs, "Invalid TLB miss exception\n");
@@ -829,11 +847,11 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp)
 
     /* Sanity check */
     if (!(env->msr_mask & MSR_HVB)) {
-        if (new_msr & MSR_HVB) {
+        if (regs.new_msr & MSR_HVB) {
             cpu_abort(cs, "Trying to deliver HV exception (MSR) %d with "
                       "no HV support\n", excp);
         }
-        if (srr0 == SPR_HSRR0) {
+        if (regs.sprn_srr0 == SPR_HSRR0) {
             cpu_abort(cs, "Trying to deliver HV exception (HSRR) %d with "
                       "no HV support\n", excp);
         }
@@ -845,88 +863,89 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp)
      */
 #ifdef TARGET_PPC64
     if (excp_model == POWERPC_EXCP_POWER7) {
-        if (!(new_msr & MSR_HVB) && (env->spr[SPR_LPCR] & LPCR_ILE)) {
-            new_msr |= (target_ulong)1 << MSR_LE;
+        if (!(regs.new_msr & MSR_HVB) && (env->spr[SPR_LPCR] & LPCR_ILE)) {
+            regs.new_msr |= (target_ulong)1 << MSR_LE;
         }
     } else if (excp_model == POWERPC_EXCP_POWER8) {
-        if (new_msr & MSR_HVB) {
+        if (regs.new_msr & MSR_HVB) {
             if (env->spr[SPR_HID0] & HID0_HILE) {
-                new_msr |= (target_ulong)1 << MSR_LE;
+                regs.new_msr |= (target_ulong)1 << MSR_LE;
             }
         } else if (env->spr[SPR_LPCR] & LPCR_ILE) {
-            new_msr |= (target_ulong)1 << MSR_LE;
+            regs.new_msr |= (target_ulong)1 << MSR_LE;
         }
     } else if (excp_model == POWERPC_EXCP_POWER9 ||
                excp_model == POWERPC_EXCP_POWER10) {
-        if (new_msr & MSR_HVB) {
+        if (regs.new_msr & MSR_HVB) {
             if (env->spr[SPR_HID0] & HID0_POWER9_HILE) {
-                new_msr |= (target_ulong)1 << MSR_LE;
+                regs.new_msr |= (target_ulong)1 << MSR_LE;
             }
         } else if (env->spr[SPR_LPCR] & LPCR_ILE) {
-            new_msr |= (target_ulong)1 << MSR_LE;
+            regs.new_msr |= (target_ulong)1 << MSR_LE;
         }
     } else if (msr_ile) {
-        new_msr |= (target_ulong)1 << MSR_LE;
+        regs.new_msr |= (target_ulong)1 << MSR_LE;
     }
 #else
     if (msr_ile) {
-        new_msr |= (target_ulong)1 << MSR_LE;
+        regs.new_msr |= (target_ulong)1 << MSR_LE;
     }
 #endif
 
-    vector = env->excp_vectors[excp];
-    if (vector == (target_ulong)-1ULL) {
+    regs.new_nip = env->excp_vectors[excp];
+    if (regs.new_nip == (target_ulong)-1ULL) {
         cpu_abort(cs, "Raised an exception without defined vector %d\n",
                   excp);
     }
 
-    vector |= env->excp_prefix;
+    regs.new_nip |= env->excp_prefix;
 
     /* If any alternate SRR register are defined, duplicate saved values */
-    if (asrr0 != -1) {
-        env->spr[asrr0] = env->nip;
+    if (regs.sprn_asrr0 != -1) {
+        env->spr[regs.sprn_asrr0] = regs.nip;
     }
-    if (asrr1 != -1) {
-        env->spr[asrr1] = msr;
+    if (regs.sprn_asrr1 != -1) {
+        env->spr[regs.sprn_asrr1] = regs.msr;
     }
 
 #if defined(TARGET_PPC64)
     if (excp_model == POWERPC_EXCP_BOOKE) {
         if (env->spr[SPR_BOOKE_EPCR] & EPCR_ICM) {
             /* Cat.64-bit: EPCR.ICM is copied to MSR.CM */
-            new_msr |= (target_ulong)1 << MSR_CM;
+            regs.new_msr |= (target_ulong)1 << MSR_CM;
         } else {
-            vector = (uint32_t)vector;
+            regs.new_nip = (uint32_t)regs.new_nip;
         }
     } else {
         if (!msr_isf && !mmu_is_64bit(env->mmu_model)) {
-            vector = (uint32_t)vector;
+            regs.new_nip = (uint32_t)regs.new_nip;
         } else {
-            new_msr |= (target_ulong)1 << MSR_SF;
+            regs.new_msr |= (target_ulong)1 << MSR_SF;
         }
     }
 #endif
 
     if (excp != POWERPC_EXCP_SYSCALL_VECTORED) {
         /* Save PC */
-        env->spr[srr0] = env->nip;
+        env->spr[regs.sprn_srr0] = regs.nip;
 
         /* Save MSR */
-        env->spr[srr1] = msr;
+        env->spr[regs.sprn_srr1] = regs.msr;
 
 #if defined(TARGET_PPC64)
     } else {
-        vector += lev * 0x20;
+        regs.new_nip += lev * 0x20;
 
-        env->lr = env->nip;
-        env->ctr = msr;
+        env->lr = regs.nip;
+        env->ctr = regs.msr;
 #endif
     }
 
-    /* This can update new_msr and vector if AIL applies */
-    ppc_excp_apply_ail(cpu, excp_model, excp, msr, &new_msr, &vector);
+    /* This can update regs.new_msr and regs.new_nip if AIL applies */
+    ppc_excp_apply_ail(cpu, excp_model, excp, regs.msr, &regs.new_msr,
+                       &regs.new_nip);
 
-    powerpc_set_excp_state(cpu, vector, new_msr);
+    powerpc_set_excp_state(cpu, regs.new_nip, regs.new_msr);
 }
 
 void ppc_cpu_do_interrupt(CPUState *cs)
-- 
2.29.2


