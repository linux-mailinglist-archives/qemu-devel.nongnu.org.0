Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CC8847B35D
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 20:02:49 +0100 (CET)
Received: from localhost ([::1]:60522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzNvr-00022t-NR
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 14:02:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1mzNGC-00031F-Rg; Mon, 20 Dec 2021 13:19:45 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:5252)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1mzNG8-0006md-VQ; Mon, 20 Dec 2021 13:19:44 -0500
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BKHqRkX005537; 
 Mon, 20 Dec 2021 18:19:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=FY8MFEwFUCUEQc3QoHRKWrc+IKTLR95gH1Lzl3q1y3o=;
 b=MRUNBhTM0mwEYxDffa/R+ZH1hnxafHW1RlXrhIH7bbbMAig2PZWYfhpHLc9uk2W8og5h
 sa+XvAGEvgy7lpt0UbORUTpzP/+ENhp9l3C46O6V46qhUHTbaGaxdDFR+EGpjFEH0/Ra
 +QROwusqnvR7WM3GU+u2g3v55+ccWuh8dEAmVIzBLyhhdkxM5483o4ZMy+jnGYm8nxGk
 2YHXSte6BfXS4duToMLTEEJJ2D7M+SBAOblKpB37PfLLtotnmY5pRwrWXjgALOmwy1nE
 zrkBrI69aboWG3acUKTbaic7SWU7VU7IY+GHhdZIfOlDw12W3V/S9JvE2UWrmarWYTvY Vg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3d2q0jtpah-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Dec 2021 18:19:35 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1BKHc6u1003467;
 Mon, 20 Dec 2021 18:19:34 GMT
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3d2q0jtp9k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Dec 2021 18:19:34 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BKIDcQl017491;
 Mon, 20 Dec 2021 18:19:33 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma05wdc.us.ibm.com with ESMTP id 3d179ahw9a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Dec 2021 18:19:33 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1BKIJW9f11403914
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 20 Dec 2021 18:19:32 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 671F5C6063;
 Mon, 20 Dec 2021 18:19:32 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E1C73C605D;
 Mon, 20 Dec 2021 18:19:30 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.60.53])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 20 Dec 2021 18:19:30 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [RFC v2 10/12] target/ppc: Split powerpc_excp into book3s,
 booke and 32 bit
Date: Mon, 20 Dec 2021 15:19:01 -0300
Message-Id: <20211220181903.3456898-11-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211220181903.3456898-1-farosas@linux.ibm.com>
References: <20211220181903.3456898-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: PD0kvh9WjXSmnXkWe5f7eCX9qQwdq7UB
X-Proofpoint-ORIG-GUID: ghOViJu85448aqk4cbXE0VbgjUH4fzcl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-20_08,2021-12-20_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0
 impostorscore=0 bulkscore=0 clxscore=1015 mlxlogscore=999 phishscore=0
 adultscore=0 suspectscore=0 priorityscore=1501 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

These are the three major categories of processors we support and they
have slightly different requirements when it comes to dispatching
interrupts. Having it all in the same function is somewhat confusing
because one needs to keep guessing which parts of the code apply
exactly to which processors.

This patch splits powerpc_excp into three functions that will later be
moved into their own file.

(POWERPC_EXCP_DOORCI was removed because no CPUs use it)

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
---
 target/ppc/excp_helper.c | 258 +++++++++++++++++++++++++--------------
 target/ppc/interrupts.c  | 223 ++++++++++++++++++++++++++-------
 target/ppc/ppc_intr.h    |   7 +-
 3 files changed, 350 insertions(+), 138 deletions(-)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index 4f8a6c4ec8..9c785b75d5 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -37,6 +37,7 @@
 /* Exception processing */
 #if !defined(CONFIG_USER_ONLY)
 
+#ifdef TARGET_PPC64
 static int powerpc_reset_wakeup(CPUState *cs, CPUPPCState *env, int excp,
                                 target_ulong *msr)
 {
@@ -140,7 +141,6 @@ static inline void ppc_excp_apply_ail(PowerPCCPU *cpu, int excp_model, int excp,
                                       target_ulong *new_msr,
                                       target_ulong *new_nip)
 {
-#if defined(TARGET_PPC64)
     CPUPPCState *env = &cpu->env;
     bool mmu_all_on = ((msr >> MSR_IR) & 1) && ((msr >> MSR_DR) & 1);
     bool hv_escalation = !(msr & MSR_HVB) && (*new_msr & MSR_HVB);
@@ -229,8 +229,9 @@ static inline void ppc_excp_apply_ail(PowerPCCPU *cpu, int excp_model, int excp,
             *new_nip |= 0xc000000000003000ull; /* Apply scv's AIL=3 offset */
         }
     }
-#endif
 }
+#endif /* TARGET_PPC64 */
+
 
 static inline void powerpc_set_excp_state(PowerPCCPU *cpu, target_ulong new_nip,
                                           target_ulong new_msr)
@@ -263,33 +264,16 @@ static inline void powerpc_set_excp_state(PowerPCCPU *cpu, target_ulong new_nip,
     check_tlb_flush(env, false);
 }
 
-/*
- * Note that this function should be greatly optimized when called
- * with a constant excp, from ppc_hw_interrupt
- */
-static inline void powerpc_excp(PowerPCCPU *cpu, int excp)
+#if defined(TARGET_PPC64)
+static inline void book3s_excp(PowerPCCPU *cpu, int excp)
 {
     CPUState *cs = CPU(cpu);
     CPUPPCState *env = &cpu->env;
     int excp_model = env->excp_model;
     PPCIntrArgs regs;
-    PPCInterrupt *intr;
-    bool ignore = false;
+    bool ignore;
 
-    qemu_log_mask(CPU_LOG_INT, "Raise exception at " TARGET_FMT_lx
-                  " => %08x (%02x)\n", env->nip, excp, env->error_code);
-
-    if (excp == POWERPC_EXCP_NONE) {
-        /* Should never happen */
-        return;
-    }
-
-    /* new srr1 value excluding must-be-zero bits */
-    if (excp_model == POWERPC_EXCP_BOOKE) {
-        regs.msr = env->msr;
-    } else {
-        regs.msr = env->msr & ~0x783f0000ULL;
-    }
+    regs.msr = env->msr & ~0x783f0000ULL;
     regs.nip = env->nip;
 
     /*
@@ -298,6 +282,9 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp)
      */
     regs.new_msr = env->msr & (((target_ulong)1 << MSR_ME) | MSR_HVB);
 
+    /* The Book3S cpus we support are 64 bit only */
+    regs.new_msr |= (target_ulong)1 << MSR_SF;
+
     regs.sprn_srr0 = SPR_SRR0;
     regs.sprn_srr1 = SPR_SRR1;
 
@@ -310,71 +297,31 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp)
     }
 
     /*
-     * Hypervisor emulation assistance interrupt only exists on server
-     * arch 2.05 server or later. We also don't want to generate it if
-     * we don't have HVB in msr_mask (PAPR mode).
+     * We don't want to generate an Hypervisor emulation assistance
+     * interrupt if we don't have HVB in msr_mask (PAPR mode).
      */
-    if (excp == POWERPC_EXCP_HV_EMU
-#if defined(TARGET_PPC64)
-        && !(mmu_is_64bit(env->mmu_model) && (env->msr_mask & MSR_HVB))
-#endif /* defined(TARGET_PPC64) */
-
-    ) {
+    if (excp == POWERPC_EXCP_HV_EMU && !(env->msr_mask & MSR_HVB)) {
         excp = POWERPC_EXCP_PROGRAM;
     }
 
-#ifdef TARGET_PPC64
-    /*
-     * SPEU and VPU share the same IVOR but they exist in different
-     * processors. SPEU is e500v1/2 only and VPU is e6500 only.
-     */
-    if (excp_model == POWERPC_EXCP_BOOKE && excp == POWERPC_EXCP_VPU) {
-        excp = POWERPC_EXCP_SPEU;
-    }
-#endif
-
     regs.new_nip = env->excp_vectors[excp];
     if (regs.new_nip == (target_ulong)-1ULL) {
         cpu_abort(cs, "Raised an exception without defined vector %d\n",
                   excp);
     }
 
-    regs.new_nip |= env->excp_prefix;
-
-    intr = &interrupts[excp];
-    if (!intr->name) {
-        cpu_abort(cs, "Invalid PowerPC exception %d. Aborting\n", excp);
-    }
-
-    if (!intr->fn) {
-        cpu_abort(cs, "%s exception is not implemented yet !\n", intr->name);
-    }
-
-    /* Setup interrupt-specific registers before dispatching */
-    intr->fn(cpu, &regs, &ignore);
+    /* Setup interrupt-specific registers before injecting */
+    ignore = ppc_intr_prepare(cpu, interrupts_book3s, &regs, excp);
 
     if (ignore) {
         /* No further setup is needed for this interrupt */
         return;
     }
 
-    /* Sanity check */
-    if (!(env->msr_mask & MSR_HVB)) {
-        if (regs.new_msr & MSR_HVB) {
-            cpu_abort(cs, "Trying to deliver HV exception (MSR) %d with "
-                      "no HV support\n", excp);
-        }
-        if (regs.sprn_srr0 == SPR_HSRR0) {
-            cpu_abort(cs, "Trying to deliver HV exception (HSRR) %d with "
-                      "no HV support\n", excp);
-        }
-    }
-
     /*
      * Sort out endianness of interrupt, this differs depending on the
      * CPU, the HV mode, etc...
      */
-#ifdef TARGET_PPC64
     if (excp_model == POWERPC_EXCP_POWER7) {
         if (!(regs.new_msr & MSR_HVB) && (env->spr[SPR_LPCR] & LPCR_ILE)) {
             regs.new_msr |= (target_ulong)1 << MSR_LE;
@@ -399,28 +346,6 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp)
     } else if (msr_ile) {
         regs.new_msr |= (target_ulong)1 << MSR_LE;
     }
-#else
-    if (msr_ile) {
-        regs.new_msr |= (target_ulong)1 << MSR_LE;
-    }
-#endif
-
-#if defined(TARGET_PPC64)
-    if (excp_model == POWERPC_EXCP_BOOKE) {
-        if (env->spr[SPR_BOOKE_EPCR] & EPCR_ICM) {
-            /* Cat.64-bit: EPCR.ICM is copied to MSR.CM */
-            regs.new_msr |= (target_ulong)1 << MSR_CM;
-        } else {
-            regs.new_nip = (uint32_t)regs.new_nip;
-        }
-    } else {
-        if (!msr_isf && !mmu_is_64bit(env->mmu_model)) {
-            regs.new_nip = (uint32_t)regs.new_nip;
-        } else {
-            regs.new_msr |= (target_ulong)1 << MSR_SF;
-        }
-    }
-#endif
 
     if (excp != POWERPC_EXCP_SYSCALL_VECTORED) {
         /* Save PC */
@@ -436,6 +361,159 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp)
 
     powerpc_set_excp_state(cpu, regs.new_nip, regs.new_msr);
 }
+#endif /* defined(TARGET_PPC64) */
+
+static inline void booke_excp(PowerPCCPU *cpu, int excp)
+{
+    CPUState *cs = CPU(cpu);
+    CPUPPCState *env = &cpu->env;
+    PPCIntrArgs regs;
+    bool ignore;
+
+    regs.msr = env->msr;
+    regs.nip = env->nip;
+
+    /*
+     * new interrupt handler msr preserves existing HV and ME unless
+     * explicitly overriden
+     */
+    regs.new_msr = env->msr & (((target_ulong)1 << MSR_ME) | MSR_HVB);
+
+    regs.sprn_srr0 = SPR_SRR0;
+    regs.sprn_srr1 = SPR_SRR1;
+
+    /*
+     * Hypervisor emulation assistance interrupt only exists on server
+     * arch 2.05 server or later.
+     */
+    if (excp == POWERPC_EXCP_HV_EMU) {
+        excp = POWERPC_EXCP_PROGRAM;
+    }
+
+#ifdef TARGET_PPC64
+    /*
+     * SPEU and VPU share the same IVOR but they exist in different
+     * processors. SPEU is e500v1/2 only and VPU is e6500 only.
+     */
+    if (env->excp_model == POWERPC_EXCP_BOOKE && excp == POWERPC_EXCP_VPU) {
+        excp = POWERPC_EXCP_SPEU;
+    }
+#endif
+
+    regs.new_nip = env->excp_vectors[excp];
+    if (regs.new_nip == (target_ulong)-1ULL) {
+        cpu_abort(cs, "Raised an exception without defined vector %d\n",
+                  excp);
+    }
+
+    regs.new_nip |= env->excp_prefix;
+
+    /* Setup interrupt-specific registers before injecting */
+    ignore = ppc_intr_prepare(cpu, interrupts_booke, &regs, excp);
+
+    if (ignore) {
+        /* No further setup is needed for this interrupt */
+        return;
+    }
+
+#if defined(TARGET_PPC64)
+    if (env->spr[SPR_BOOKE_EPCR] & EPCR_ICM) {
+        /* Cat.64-bit: EPCR.ICM is copied to MSR.CM */
+        regs.new_msr |= (target_ulong)1 << MSR_CM;
+    } else {
+        regs.new_nip = (uint32_t)regs.new_nip;
+    }
+#endif
+
+    /* Save PC */
+    env->spr[regs.sprn_srr0] = regs.nip;
+
+    /* Save MSR */
+    env->spr[regs.sprn_srr1] = regs.msr;
+
+    powerpc_set_excp_state(cpu, regs.new_nip, regs.new_msr);
+}
+
+static inline void ppc32_excp(PowerPCCPU *cpu, int excp)
+{
+    CPUState *cs = CPU(cpu);
+    CPUPPCState *env = &cpu->env;
+    PPCIntrArgs regs;
+    bool ignore;
+
+    regs.msr = env->msr & ~0x783f0000ULL;
+    regs.nip = env->nip;
+
+    /*
+     * new interrupt handler msr preserves existing HV and ME unless
+     * explicitly overriden
+     */
+    regs.new_msr = env->msr & (((target_ulong)1 << MSR_ME) | MSR_HVB);
+
+    regs.sprn_srr0 = SPR_SRR0;
+    regs.sprn_srr1 = SPR_SRR1;
+
+    /*
+     * Hypervisor emulation assistance interrupt only exists on server
+     * arch 2.05 server or later.
+     */
+    if (excp == POWERPC_EXCP_HV_EMU) {
+        excp = POWERPC_EXCP_PROGRAM;
+    }
+
+    regs.new_nip = env->excp_vectors[excp];
+    if (regs.new_nip == (target_ulong)-1ULL) {
+        cpu_abort(cs, "Raised an exception without defined vector %d\n",
+                  excp);
+    }
+
+    regs.new_nip |= env->excp_prefix;
+
+    /* Setup interrupt-specific registers before injecting */
+    ignore = ppc_intr_prepare(cpu, interrupts_ppc32, &regs, excp);
+
+    if (ignore) {
+        /* No further setup is needed for this interrupt */
+        return;
+    }
+
+    if (msr_ile) {
+        regs.new_msr |= (target_ulong)1 << MSR_LE;
+    }
+
+    /* Save PC */
+    env->spr[regs.sprn_srr0] = regs.nip;
+
+    /* Save MSR */
+    env->spr[regs.sprn_srr1] = regs.msr;
+
+    powerpc_set_excp_state(cpu, regs.new_nip, regs.new_msr);
+}
+
+static inline void powerpc_excp(PowerPCCPU *cpu, int excp)
+{
+    CPUPPCState *env = &cpu->env;
+
+    qemu_log_mask(CPU_LOG_INT, "Raise exception at " TARGET_FMT_lx
+                  " => %08x (%02x)\n", env->nip, excp, env->error_code);
+
+    if (excp == POWERPC_EXCP_NONE) {
+        /* Should never happen */
+        return;
+    }
+
+#ifdef TARGET_PPC64
+    if (env->excp_model >= POWERPC_EXCP_970) {
+        return book3s_excp(cpu, excp);
+    }
+#endif
+
+    if (env->excp_model == POWERPC_EXCP_BOOKE) {
+        booke_excp(cpu, excp);
+    } else {
+        ppc32_excp(cpu, excp);
+    }
+}
 
 void ppc_cpu_do_interrupt(CPUState *cs)
 {
diff --git a/target/ppc/interrupts.c b/target/ppc/interrupts.c
index 61a7dec682..743faddfee 100644
--- a/target/ppc/interrupts.c
+++ b/target/ppc/interrupts.c
@@ -334,12 +334,6 @@ void ppc_intr_spe_unavailable(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore)
     env->spr[SPR_BOOKE_ESR] = ESR_SPV;
 }
 
-void ppc_intr_embedded_doorbell_crit(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore)
-{
-    regs->sprn_srr0 = SPR_BOOKE_CSRR0;
-    regs->sprn_srr1 = SPR_BOOKE_CSRR1;
-}
-
 void ppc_intr_system_reset(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore)
 {
     CPUPPCState *env = &cpu->env;
@@ -462,7 +456,7 @@ void ppc_intr_tlb_miss(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore)
     }
 }
 
-PPCInterrupt interrupts[POWERPC_EXCP_NB] = {
+PPCInterrupt interrupts_ppc32[POWERPC_EXCP_NB] = {
     [POWERPC_EXCP_ALIGN] = {
         "Alignment", ppc_intr_alignment
     },
@@ -479,10 +473,6 @@ PPCInterrupt interrupts[POWERPC_EXCP_NB] = {
         "Data load TLB error", ppc_intr_tlb_miss
     },
 
-    [POWERPC_EXCP_DOORCI] = {
-        "Embedded doorbell critical", ppc_intr_embedded_doorbell_crit
-    },
-
     [POWERPC_EXCP_DSI] = {
         "Data storage", ppc_intr_data_storage
     },
@@ -499,6 +489,78 @@ PPCInterrupt interrupts[POWERPC_EXCP_NB] = {
         "Fixed-interval timer", ppc_intr_fit
     },
 
+    [POWERPC_EXCP_IFTLB] = {
+        "Insn fetch TLB error", ppc_intr_tlb_miss
+    },
+
+    [POWERPC_EXCP_ISI] = {
+        "Instruction storage", ppc_intr_insn_storage
+    },
+
+    [POWERPC_EXCP_MCHECK] = {
+        "Machine check", ppc_intr_machine_check
+    },
+
+    [POWERPC_EXCP_PIT] = {
+        "Programmable interval timer", ppc_intr_programmable_timer
+    },
+
+    [POWERPC_EXCP_PROGRAM] = {
+        "Program", ppc_intr_program
+    },
+
+    [POWERPC_EXCP_RESET] = {
+        "System reset", ppc_intr_system_reset
+    },
+
+    [POWERPC_EXCP_SYSCALL] = {
+        "System call", ppc_intr_system_call
+    },
+
+    [POWERPC_EXCP_VPU] = {
+        "Vector unavailable", ppc_intr_facility_unavail
+    },
+
+    [POWERPC_EXCP_WDT] = {
+        "Watchdog timer", ppc_intr_watchdog
+    },
+
+    [POWERPC_EXCP_DECR]  = { "Decrementer",                ppc_intr_noop },
+    [POWERPC_EXCP_DTLB]  = { "Data TLB error",             ppc_intr_noop },
+    [POWERPC_EXCP_FPU]   = { "Floating-point unavailable", ppc_intr_noop },
+    [POWERPC_EXCP_ITLB]  = { "Instruction TLB error",      ppc_intr_noop },
+    [POWERPC_EXCP_TRACE] = { "Trace",                      ppc_intr_noop },
+
+/* Not implemented */
+    [POWERPC_EXCP_DABR]     = { "Data address breakpoint" },
+    [POWERPC_EXCP_DTLBE]    = { "Data TLB error" },
+    [POWERPC_EXCP_EMUL]     = { "Emulation trap" },
+    [POWERPC_EXCP_FPA]      = { "Floating-point assist" },
+    [POWERPC_EXCP_IABR]     = { "Insn address breakpoint" },
+    [POWERPC_EXCP_IO]       = { "IO error" },
+    [POWERPC_EXCP_ITLBE]    = { "Instruction TLB error" },
+    [POWERPC_EXCP_MEXTBR]   = { "Maskable external" },
+    [POWERPC_EXCP_NMEXTBR]  = { "Non-maskable external" },
+    [POWERPC_EXCP_PERFM]    = { "Performance counter" },
+    [POWERPC_EXCP_RUNM]     = { "Run mode" },
+    [POWERPC_EXCP_SMI]      = { "System management" },
+    [POWERPC_EXCP_THERM]    = { "Thermal management" },
+    [POWERPC_EXCP_VPUA]     = { "Vector assist" },
+};
+
+PPCInterrupt interrupts_book3s[POWERPC_EXCP_NB] = {
+    [POWERPC_EXCP_ALIGN] = {
+        "Alignment", ppc_intr_alignment
+    },
+
+    [POWERPC_EXCP_DSI] = {
+        "Data storage", ppc_intr_data_storage
+    },
+
+    [POWERPC_EXCP_EXTERNAL] = {
+        "External", ppc_intr_external
+    },
+
     [POWERPC_EXCP_FU] = {
         "Facility unavailable", ppc_intr_facility_unavail
     },
@@ -508,11 +570,7 @@ PPCInterrupt interrupts[POWERPC_EXCP_NB] = {
     },
 
     [POWERPC_EXCP_HV_FU] = {
-        "Hypervisor facility unavailable" , ppc_intr_hv_facility_unavail
-    },
-
-    [POWERPC_EXCP_IFTLB] = {
-        "Insn fetch TLB error", ppc_intr_tlb_miss
+        "Hypervisor facility unavailable", ppc_intr_hv_facility_unavail
     },
 
     [POWERPC_EXCP_ISI] = {
@@ -523,10 +581,6 @@ PPCInterrupt interrupts[POWERPC_EXCP_NB] = {
         "Machine check", ppc_intr_machine_check
     },
 
-    [POWERPC_EXCP_PIT] = {
-        "Programmable interval timer", ppc_intr_programmable_timer
-    },
-
     [POWERPC_EXCP_PROGRAM] = {
         "Program", ppc_intr_program
     },
@@ -535,10 +589,6 @@ PPCInterrupt interrupts[POWERPC_EXCP_NB] = {
         "System reset", ppc_intr_system_reset
     },
 
-    [POWERPC_EXCP_SPEU] = {
-        "SPE/embedded FP unavailable/VPU", ppc_intr_spe_unavailable
-    },
-
     [POWERPC_EXCP_SYSCALL] = {
         "System call", ppc_intr_system_call
     },
@@ -555,48 +605,127 @@ PPCInterrupt interrupts[POWERPC_EXCP_NB] = {
         "VSX unavailable", ppc_intr_facility_unavail
     },
 
-    [POWERPC_EXCP_WDT] = {
-        "Watchdog timer", ppc_intr_watchdog
-    },
-
     [POWERPC_EXCP_HDECR]    = { "Hypervisor decrementer",         ppc_intr_hv },
-    [POWERPC_EXCP_HDSEG]    = { "Hypervisor data segment",        ppc_intr_hv },
     [POWERPC_EXCP_HDSI]     = { "Hypervisor data storage",        ppc_intr_hv },
-    [POWERPC_EXCP_HISEG]    = { "Hypervisor insn segment",        ppc_intr_hv },
     [POWERPC_EXCP_HVIRT]    = { "Hypervisor virtualization",      ppc_intr_hv },
     [POWERPC_EXCP_HV_EMU]   = { "Hypervisor emulation assist",    ppc_intr_hv },
     [POWERPC_EXCP_SDOOR_HV] = { "Hypervisor doorbell",            ppc_intr_hv },
 
-    [POWERPC_EXCP_APU]   = { "Aux. processor unavailable", ppc_intr_noop },
     [POWERPC_EXCP_DECR]  = { "Decrementer",                ppc_intr_noop },
-    [POWERPC_EXCP_DOORI] = { "Embedded doorbell",          ppc_intr_noop },
     [POWERPC_EXCP_DSEG]  = { "Data segment",               ppc_intr_noop },
-    [POWERPC_EXCP_DTLB]  = { "Data TLB error",             ppc_intr_noop },
     [POWERPC_EXCP_FPU]   = { "Floating-point unavailable", ppc_intr_noop },
     [POWERPC_EXCP_ISEG]  = { "Instruction segment",        ppc_intr_noop },
     [POWERPC_EXCP_ITLB]  = { "Instruction TLB error",      ppc_intr_noop },
     [POWERPC_EXCP_TRACE] = { "Trace",                      ppc_intr_noop },
 
 /* Not implemented */
-    [POWERPC_EXCP_DABR]     = { "Data address breakpoint" },
-    [POWERPC_EXCP_DTLBE]    = { "Data TLB error" },
-    [POWERPC_EXCP_EFPDI]    = { "Embedded floating-point data" },
-    [POWERPC_EXCP_EFPRI]    = { "Embedded floating-point round" },
-    [POWERPC_EXCP_EMUL]     = { "Emulation trap" },
-    [POWERPC_EXCP_EPERFM]   = { "Embedded perf. monitor" },
-    [POWERPC_EXCP_FPA]      = { "Floating-point assist" },
     [POWERPC_EXCP_HV_MAINT] = { "Hypervisor maintenance" },
     [POWERPC_EXCP_IABR]     = { "Insn address breakpoint" },
-    [POWERPC_EXCP_IO]       = { "IO error" },
-    [POWERPC_EXCP_ITLBE]    = { "Instruction TLB error" },
     [POWERPC_EXCP_MAINT]    = { "Maintenance" },
-    [POWERPC_EXCP_MEXTBR]   = { "Maskable external" },
-    [POWERPC_EXCP_NMEXTBR]  = { "Non-maskable external" },
     [POWERPC_EXCP_PERFM]    = { "Performance counter" },
-    [POWERPC_EXCP_RUNM]     = { "Run mode" },
     [POWERPC_EXCP_SDOOR]    = { "Server doorbell" },
-    [POWERPC_EXCP_SMI]      = { "System management" },
-    [POWERPC_EXCP_SOFTP]    = { "Soft patch" },
     [POWERPC_EXCP_THERM]    = { "Thermal management" },
     [POWERPC_EXCP_VPUA]     = { "Vector assist" },
 };
+
+PPCInterrupt interrupts_booke[POWERPC_EXCP_NB] = {
+    [POWERPC_EXCP_ALIGN] = {
+        "Alignment", ppc_intr_alignment
+    },
+
+    [POWERPC_EXCP_CRITICAL] = {
+        "Critical input", ppc_intr_critical
+    },
+
+    [POWERPC_EXCP_DEBUG] = {
+        "Debug", ppc_intr_debug
+    },
+
+    [POWERPC_EXCP_DLTLB] = {
+        "Data load TLB error", ppc_intr_tlb_miss
+    },
+
+    [POWERPC_EXCP_DSI] = {
+        "Data storage", ppc_intr_data_storage
+    },
+
+    [POWERPC_EXCP_EXTERNAL] = {
+        "External", ppc_intr_external
+    },
+
+    [POWERPC_EXCP_FIT] = {
+        "Fixed-interval timer", ppc_intr_fit
+    },
+
+    [POWERPC_EXCP_ISI] = {
+        "Instruction storage", ppc_intr_insn_storage
+    },
+
+    [POWERPC_EXCP_MCHECK] = {
+        "Machine check", ppc_intr_machine_check
+    },
+
+    [POWERPC_EXCP_PROGRAM] = {
+        "Program", ppc_intr_program
+    },
+
+    [POWERPC_EXCP_RESET] = {
+        "System reset", ppc_intr_system_reset
+    },
+
+    [POWERPC_EXCP_SPEU] = {
+        "SPE/embedded FP unavailable/VPU", ppc_intr_spe_unavailable
+    },
+
+    [POWERPC_EXCP_SYSCALL] = {
+        "System call", ppc_intr_system_call
+    },
+
+    [POWERPC_EXCP_WDT] = {
+        "Watchdog timer", ppc_intr_watchdog
+    },
+
+    [POWERPC_EXCP_APU]   = { "Aux. processor unavailable", ppc_intr_noop },
+    [POWERPC_EXCP_DECR]  = { "Decrementer",                ppc_intr_noop },
+    [POWERPC_EXCP_DTLB]  = { "Data TLB error",             ppc_intr_noop },
+    [POWERPC_EXCP_FPU]   = { "Floating-point unavailable", ppc_intr_noop },
+    [POWERPC_EXCP_ITLB]  = { "Instruction TLB error",      ppc_intr_noop },
+
+/* Not impleemented */
+    [POWERPC_EXCP_EFPDI]    = { "Embedded floating-point data" },
+    [POWERPC_EXCP_EFPRI]    = { "Embedded floating-point round" },
+};
+
+int ppc_intr_prepare(PowerPCCPU *cpu, PPCInterrupt *interrupts,
+                     PPCIntrArgs *regs, int excp)
+{
+    CPUState *cs = CPU(cpu);
+    CPUPPCState *env = &cpu->env;
+    PPCInterrupt *intr;
+    bool ignore = false;
+
+    intr = &interrupts[excp];
+    if (!intr->name) {
+        cpu_abort(cs, "Invalid PowerPC exception %d. Aborting\n", excp);
+    }
+
+    if (!intr->fn) {
+        cpu_abort(cs, "%s exception is not implemented yet !\n", intr->name);
+    }
+
+    intr->fn(cpu, regs, &ignore);
+
+    /* Sanity check */
+    if (!(env->msr_mask & MSR_HVB)) {
+        if (regs->new_msr & MSR_HVB) {
+            cpu_abort(cs, "Trying to deliver HV exception (MSR) %d with "
+                      "no HV support\n", excp);
+        }
+        if (regs->sprn_srr0 == SPR_HSRR0) {
+            cpu_abort(cs, "Trying to deliver HV exception (HSRR) %d with "
+                      "no HV support\n", excp);
+        }
+    }
+
+    return ignore;
+}
diff --git a/target/ppc/ppc_intr.h b/target/ppc/ppc_intr.h
index 078906ed68..a12b3a9e4d 100644
--- a/target/ppc/ppc_intr.h
+++ b/target/ppc/ppc_intr.h
@@ -42,6 +42,11 @@ void ppc_intr_system_reset(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore);
 void ppc_intr_tlb_miss(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore);
 void ppc_intr_watchdog(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore);
 
-extern PPCInterrupt interrupts[POWERPC_EXCP_NB];
+int ppc_intr_prepare(PowerPCCPU *cpu, PPCInterrupt *interrupts,
+                     PPCIntrArgs *regs, int excp);
+
+extern PPCInterrupt interrupts_ppc32[POWERPC_EXCP_NB];
+extern PPCInterrupt interrupts_booke[POWERPC_EXCP_NB];
+extern PPCInterrupt interrupts_book3s[POWERPC_EXCP_NB];
 
 #endif /* PPC_INTR_H */
-- 
2.33.1


