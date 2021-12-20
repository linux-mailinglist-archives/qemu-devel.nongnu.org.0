Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7660147B381
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 20:10:39 +0100 (CET)
Received: from localhost ([::1]:43890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzO3S-0001wJ-Jz
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 14:10:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1mzNG8-0002w7-3X; Mon, 20 Dec 2021 13:19:40 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:46932)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1mzNG4-0006kh-Pe; Mon, 20 Dec 2021 13:19:39 -0500
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BKGSAwr013992; 
 Mon, 20 Dec 2021 18:19:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=YK+PBR7lcRHGIWWc5NuByntqZRVK5PLWrAD32WYqXkw=;
 b=CaWEpWLFxhRfnt2chkZg9R8ZoLz2tJcY2MFJFodVtfxq1EMlnOeatZwZUAujLYMabqZB
 ujm4bbz2gALmPZBoOXaKKaNSUitXENgVfFKGEzus8DXU8O8P1gE3tAfGUOhkEZBEM5/m
 o2/zO+j3YPA9yRTjpdQ/k7wK7FpqlK1yvMtd2o4wjCu/WoDRMe0FDEpcbZr4wlKqT24m
 CXdySkAC7empqtbb66NpAxcWviZ1MQ1hHSMs/L4IrtA3pIdow5MHaQbDE3onegYFNm00
 HLDbJwuq3QR7T8UIyMip+wHTj1gmuvnVOlxXdycXzvKLw5D2Nq1h3NopB7/w2XyobuoG Gw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3d1s4wt2y4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Dec 2021 18:19:25 +0000
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1BKIIwW0024628;
 Mon, 20 Dec 2021 18:19:24 GMT
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3d1s4wt2xp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Dec 2021 18:19:24 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BKIHvcq011786;
 Mon, 20 Dec 2021 18:19:23 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma03wdc.us.ibm.com with ESMTP id 3d1799hx17-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Dec 2021 18:19:23 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1BKIJMbA28377420
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 20 Dec 2021 18:19:22 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5EEA2C6069;
 Mon, 20 Dec 2021 18:19:22 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 75E24C6067;
 Mon, 20 Dec 2021 18:19:20 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.60.53])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 20 Dec 2021 18:19:20 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [RFC v2 05/12] target/ppc: powerpc_excp: Standardize arguments to
 interrupt code
Date: Mon, 20 Dec 2021 15:18:56 -0300
Message-Id: <20211220181903.3456898-6-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211220181903.3456898-1-farosas@linux.ibm.com>
References: <20211220181903.3456898-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: FIuNCMkUa9imRZjNDjd4Ue4JzUpbwqr1
X-Proofpoint-GUID: xEC3y_NWZFmLsdet4juhZ2PzEALAT3mQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-20_08,2021-12-20_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015
 mlxscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 mlxlogscore=999 spamscore=0 impostorscore=0 suspectscore=0 phishscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112200101
Received-SPF: pass client-ip=148.163.156.1; envelope-from=farosas@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
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
Cc: danielhb413@gmail.com, qemu-ppc@nongnu.org, clg@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In preparation to moving the interrupt code into separate functions,
create a PPCIntrArgs structure to serve as a consistent API.

No functional change intended.

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
---
 target/ppc/excp_helper.c | 213 +++++++++++++++++++++------------------
 1 file changed, 113 insertions(+), 100 deletions(-)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index 45641f6d1d..f478ff8a87 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -164,7 +164,7 @@ static int powerpc_reset_wakeup(CPUState *cs, CPUPPCState *env, int excp,
 static inline void ppc_excp_apply_ail(PowerPCCPU *cpu, int excp_model, int excp,
                                       target_ulong msr,
                                       target_ulong *new_msr,
-                                      target_ulong *vector)
+                                      target_ulong *new_nip)
 {
 #if defined(TARGET_PPC64)
     CPUPPCState *env = &cpu->env;
@@ -241,9 +241,9 @@ static inline void ppc_excp_apply_ail(PowerPCCPU *cpu, int excp_model, int excp,
 
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
@@ -251,15 +251,15 @@ static inline void ppc_excp_apply_ail(PowerPCCPU *cpu, int excp_model, int excp,
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
@@ -272,9 +272,9 @@ static inline void powerpc_set_excp_state(PowerPCCPU *cpu,
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
@@ -289,6 +289,15 @@ static inline void powerpc_set_excp_state(PowerPCCPU *cpu,
     check_tlb_flush(env, false);
 }
 
+typedef struct PPCIntrArgs {
+    target_ulong nip;
+    target_ulong msr;
+    target_ulong new_nip;
+    target_ulong new_msr;
+    int sprn_srr0;
+    int sprn_srr1;
+} PPCIntrArgs;
+
 /*
  * Note that this function should be greatly optimized when called
  * with a constant excp, from ppc_hw_interrupt
@@ -298,35 +307,35 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp)
     CPUState *cs = CPU(cpu);
     CPUPPCState *env = &cpu->env;
     int excp_model = env->excp_model;
-    target_ulong msr, new_msr, vector;
-    int srr0, srr1, lev = -1;
+    PPCIntrArgs regs;
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
      */
-    new_msr = env->msr & (((target_ulong)1 << MSR_ME) | MSR_HVB);
+    regs.new_msr = env->msr & (((target_ulong)1 << MSR_ME) | MSR_HVB);
 
-    /* target registers */
-    srr0 = SPR_SRR0;
-    srr1 = SPR_SRR1;
+    regs.sprn_srr0 = SPR_SRR0;
+    regs.sprn_srr1 = SPR_SRR1;
 
     /*
      * check for special resume at 0x100 from doze/nap/sleep/winkle on
      * P7/P8/P9
      */
     if (env->resume_as_sreset) {
-        excp = powerpc_reset_wakeup(cs, env, excp, &msr);
+        excp = powerpc_reset_wakeup(cs, env, excp, &regs.msr);
     }
 
     /*
@@ -353,13 +362,13 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp)
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
 
     switch (excp) {
     case POWERPC_EXCP_NONE:
@@ -368,12 +377,12 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp)
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
@@ -401,25 +410,25 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp)
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
+            regs.sprn_srr0 = SPR_BOOKE_MCSRR0;
+            regs.sprn_srr1 = SPR_BOOKE_MCSRR1;
 
-            env->spr[SPR_BOOKE_CSRR0] = env->nip;
-            env->spr[SPR_BOOKE_CSRR1] = msr;
+            env->spr[SPR_BOOKE_CSRR0] = regs.nip;
+            env->spr[SPR_BOOKE_CSRR1] = regs.msr;
             break;
         default:
             break;
@@ -429,8 +438,8 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp)
         trace_ppc_excp_dsi(env->spr[SPR_DSISR], env->spr[SPR_DAR]);
         break;
     case POWERPC_EXCP_ISI:       /* Instruction storage exception            */
-        trace_ppc_excp_isi(msr, env->nip);
-        msr |= env->error_code;
+        trace_ppc_excp_isi(regs.msr, regs.nip);
+        regs.msr |= env->error_code;
         break;
     case POWERPC_EXCP_EXTERNAL:  /* External input                           */
     {
@@ -460,10 +469,10 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp)
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
@@ -495,20 +504,20 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp)
              * instruction, so always use store_next and claim we are
              * precise in the MSR.
              */
-            msr |= 0x00100000;
+            regs.msr |= 0x00100000;
             env->spr[SPR_BOOKE_ESR] = ESR_FP;
             break;
         case POWERPC_EXCP_INVAL:
-            trace_ppc_excp_inval(env->nip);
-            msr |= 0x00080000;
+            trace_ppc_excp_inval(regs.nip);
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
@@ -529,9 +538,12 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp)
 
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
@@ -540,21 +552,22 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp)
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
 
-        vector += lev * 0x20;
+        regs.new_nip += lev * 0x20;
 
-        env->lr = env->nip;
-        env->ctr = msr;
+        env->lr = regs.nip;
+        env->ctr = regs.msr;
         break;
     case POWERPC_EXCP_FPU:       /* Floating-point unavailable exception     */
     case POWERPC_EXCP_APU:       /* Auxiliary processor unavailable          */
@@ -568,8 +581,8 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp)
         trace_ppc_excp_print("WDT");
         switch (excp_model) {
         case POWERPC_EXCP_BOOKE:
-            srr0 = SPR_BOOKE_CSRR0;
-            srr1 = SPR_BOOKE_CSRR1;
+            regs.sprn_srr0 = SPR_BOOKE_CSRR0;
+            regs.sprn_srr1 = SPR_BOOKE_CSRR1;
             break;
         default:
             break;
@@ -581,12 +594,11 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp)
     case POWERPC_EXCP_DEBUG:     /* Debug interrupt                          */
         if (env->flags & POWERPC_FLAG_DE) {
             /* FIXME: choose one or the other based on CPU type */
-            srr0 = SPR_BOOKE_DSRR0;
-            srr1 = SPR_BOOKE_DSRR1;
-
-            env->spr[SPR_BOOKE_CSRR0] = env->nip;
-            env->spr[SPR_BOOKE_CSRR1] = msr;
+            regs.sprn_srr0 = SPR_BOOKE_DSRR0;
+            regs.sprn_srr1 = SPR_BOOKE_DSRR1;
 
+            env->spr[SPR_BOOKE_CSRR0] = regs.nip;
+            env->spr[SPR_BOOKE_CSRR1] = regs.msr;
             /* DBSR already modified by caller */
         } else {
             cpu_abort(cs, "Debug exception triggered on unsupported model\n");
@@ -615,22 +627,22 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp)
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
@@ -643,7 +655,7 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp)
     case POWERPC_EXCP_TRACE:     /* Trace exception                          */
         break;
     case POWERPC_EXCP_HISI:      /* Hypervisor instruction storage exception */
-        msr |= env->error_code;
+        regs.msr |= env->error_code;
         /* fall through */
     case POWERPC_EXCP_HDECR:     /* Hypervisor decrementer exception         */
     case POWERPC_EXCP_HDSI:      /* Hypervisor data storage exception        */
@@ -652,10 +664,10 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp)
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
@@ -667,10 +679,10 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp)
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
@@ -697,8 +709,8 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp)
         case POWERPC_EXCP_603:
         case POWERPC_EXCP_G2:
             /* Swap temporary saved registers with GPRs */
-            if (!(new_msr & ((target_ulong)1 << MSR_TGPR))) {
-                new_msr |= (target_ulong)1 << MSR_TGPR;
+            if (!(regs.new_msr & ((target_ulong)1 << MSR_TGPR))) {
+                regs.new_msr |= (target_ulong)1 << MSR_TGPR;
                 hreg_swap_gpr_tgpr(env);
             }
             /* fall through */
@@ -731,10 +743,10 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp)
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
         default:
             cpu_abort(cs, "Invalid TLB miss exception\n");
@@ -800,11 +812,11 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp)
 
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
@@ -816,32 +828,32 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp)
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
 
@@ -849,31 +861,32 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp)
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
2.33.1


