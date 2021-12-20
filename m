Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8784247B386
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 20:13:01 +0100 (CET)
Received: from localhost ([::1]:46762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzO5k-0003vq-CQ
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 14:13:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1mzNGF-00034b-OG; Mon, 20 Dec 2021 13:19:49 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:38470)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1mzNGC-0006o5-Rn; Mon, 20 Dec 2021 13:19:47 -0500
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BKHJOXi013131; 
 Mon, 20 Dec 2021 18:19:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=vOGYN9GpzDQPb1zAsdt2ewCNMRPiZ0GMZJDwRfFdWPM=;
 b=rQQM87mAnJYPN8b19nVbJYSBaMaLzuyOixfkTYTgK0gZXuzCwaeXyYvadAb2lKD4HHLc
 P4JFZdbw+aWF1FRSlyb/GkNBgBdSq8tB5uQxN69JLRiCeR489scAQdYtpvVTV0v6p0Mx
 rfaHEOVrIuOhbvsYadN5OmEQXQTx49++IrE/FTmcvTLJ0zSUWh3rPRcEwi8ot1fuueZD
 9wpQ/90/IthCB3HhzNxjCZXQIGMHhTArmxUD3WO1CgvbFEdqSy0/Dq8YOfTdQZtdxjrf
 yFtkOY1ZE858bAUNTY+2N+VmdJvBC9/N7d2VqwkQiesehT1EpaeWhRqIzlr4zRE4t5ef ow== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3d1s4wt341-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Dec 2021 18:19:39 +0000
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1BKIIVE2020764;
 Mon, 20 Dec 2021 18:19:38 GMT
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3d1s4wt33n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Dec 2021 18:19:38 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BKIEi4n017567;
 Mon, 20 Dec 2021 18:19:37 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma02dal.us.ibm.com with ESMTP id 3d179aa8mj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Dec 2021 18:19:37 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1BKIJaIJ28115322
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 20 Dec 2021 18:19:36 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A19CFC6069;
 Mon, 20 Dec 2021 18:19:36 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1DF4FC6067;
 Mon, 20 Dec 2021 18:19:35 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.60.53])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 20 Dec 2021 18:19:34 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [RFC v2 12/12] target/ppc: Do not enable all interrupts when running
 KVM
Date: Mon, 20 Dec 2021 15:19:03 -0300
Message-Id: <20211220181903.3456898-13-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211220181903.3456898-1-farosas@linux.ibm.com>
References: <20211220181903.3456898-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: bxxhQEQ8tTKxnSBIAOsaItNOew9Uil0I
X-Proofpoint-GUID: vve0Aq6qi0hdP-v3VEQwErdGLAJvQtJG
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

When running with KVM, QEMU only needs to dispatch a few interrupts in
specific occasions, so we don't need to have all interrupts
registered. We also want to better identify code that is used with KVM
to avoid breaking the --disable-tcg|kvm builds, so this patch also
adds ifdefs to make that distinction.

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
---
 target/ppc/interrupts.c  | 268 ++++++++++++++++++++++-----------------
 target/ppc/intr-book3s.c |   2 +
 target/ppc/intr-booke.c  |   2 +
 target/ppc/ppc_intr.h    |  12 +-
 4 files changed, 161 insertions(+), 123 deletions(-)

diff --git a/target/ppc/interrupts.c b/target/ppc/interrupts.c
index 6f956029fd..be2755b1a8 100644
--- a/target/ppc/interrupts.c
+++ b/target/ppc/interrupts.c
@@ -11,7 +11,9 @@
 #include "cpu.h"
 #include "ppc_intr.h"
 #include "trace.h"
+#include "sysemu/kvm.h"
 
+#ifdef CONFIG_TCG
 /* for hreg_swap_gpr_tgpr */
 #include "helper_regs.h"
 
@@ -43,56 +45,6 @@ void ppc_intr_critical(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore)
     }
 }
 
-void ppc_intr_machine_check(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore)
-{
-    CPUState *cs = CPU(cpu);
-    CPUPPCState *env = &cpu->env;
-    int excp_model = env->excp_model;
-
-    if (msr_me == 0) {
-        /*
-         * Machine check exception is not enabled.  Enter
-         * checkstop state.
-         */
-        fprintf(stderr, "Machine check while not allowed. "
-                "Entering checkstop state\n");
-        if (qemu_log_separate()) {
-            qemu_log("Machine check while not allowed. "
-                     "Entering checkstop state\n");
-        }
-        cs->halted = 1;
-        cpu_interrupt_exittb(cs);
-    }
-    if (env->msr_mask & MSR_HVB) {
-        /*
-         * ISA specifies HV, but can be delivered to guest with HV
-         * clear (e.g., see FWNMI in PAPR).
-         */
-        regs->new_msr |= (target_ulong)MSR_HVB;
-    }
-
-    /* machine check exceptions don't have ME set */
-    regs->new_msr &= ~((target_ulong)1 << MSR_ME);
-
-    /* XXX: should also have something loaded in DAR / DSISR */
-    switch (excp_model) {
-    case POWERPC_EXCP_40x:
-        regs->sprn_srr0 = SPR_40x_SRR2;
-        regs->sprn_srr1 = SPR_40x_SRR3;
-        break;
-    case POWERPC_EXCP_BOOKE:
-        /* FIXME: choose one or the other based on CPU type */
-        regs->sprn_srr0 = SPR_BOOKE_MCSRR0;
-        regs->sprn_srr1 = SPR_BOOKE_MCSRR1;
-
-        env->spr[SPR_BOOKE_CSRR0] = regs->nip;
-        env->spr[SPR_BOOKE_CSRR1] = regs->msr;
-        break;
-    default:
-        break;
-    }
-}
-
 void ppc_intr_data_storage(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore)
 {
     CPUPPCState *env = &cpu->env;
@@ -165,51 +117,6 @@ void ppc_intr_alignment(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore)
     env->spr[SPR_DSISR] |= (env->error_code & 0x03FF0000) >> 16;
 }
 
-void ppc_intr_program(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore)
-{
-    CPUState *cs = CPU(cpu);
-    CPUPPCState *env = &cpu->env;
-
-    switch (env->error_code & ~0xF) {
-    case POWERPC_EXCP_FP:
-        if ((msr_fe0 == 0 && msr_fe1 == 0) || msr_fp == 0) {
-            trace_ppc_excp_fp_ignore();
-            cs->exception_index = POWERPC_EXCP_NONE;
-            env->error_code = 0;
-
-            *ignore = true;
-            return;
-        }
-
-        /*
-         * FP exceptions always have NIP pointing to the faulting
-         * instruction, so always use store_next and claim we are
-         * precise in the MSR.
-         */
-        regs->msr |= 0x00100000;
-        env->spr[SPR_BOOKE_ESR] = ESR_FP;
-        break;
-    case POWERPC_EXCP_INVAL:
-        trace_ppc_excp_inval(regs->nip);
-        regs->msr |= 0x00080000;
-        env->spr[SPR_BOOKE_ESR] = ESR_PIL;
-        break;
-    case POWERPC_EXCP_PRIV:
-        regs->msr |= 0x00040000;
-        env->spr[SPR_BOOKE_ESR] = ESR_PPR;
-        break;
-    case POWERPC_EXCP_TRAP:
-        regs->msr |= 0x00020000;
-        env->spr[SPR_BOOKE_ESR] = ESR_PTR;
-        break;
-    default:
-        /* Should never occur */
-        cpu_abort(cs, "Invalid program exception %d. Aborting\n",
-                  env->error_code);
-        break;
-    }
-}
-
 static inline void dump_syscall(CPUPPCState *env)
 {
     qemu_log_mask(CPU_LOG_INT, "syscall r0=%016" PRIx64
@@ -334,30 +241,6 @@ void ppc_intr_spe_unavailable(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore)
     env->spr[SPR_BOOKE_ESR] = ESR_SPV;
 }
 
-void ppc_intr_system_reset(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore)
-{
-    CPUPPCState *env = &cpu->env;
-
-    /* A power-saving exception sets ME, otherwise it is unchanged */
-    if (msr_pow) {
-        /* indicate that we resumed from power save mode */
-        regs->msr |= 0x10000;
-        regs->new_msr |= ((target_ulong)1 << MSR_ME);
-    }
-    if (env->msr_mask & MSR_HVB) {
-        /*
-         * ISA specifies HV, but can be delivered to guest with HV
-         * clear (e.g., see FWNMI in PAPR, NMI injection in QEMU).
-         */
-        regs->new_msr |= (target_ulong)MSR_HVB;
-    } else {
-        if (msr_pow) {
-            cpu_abort(CPU(cpu), "Trying to deliver power-saving system reset "
-                      "exception with no HV support\n");
-        }
-    }
-}
-
 #ifdef TARGET_PPC64
 void ppc_intr_hv(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore)
 {
@@ -455,6 +338,149 @@ void ppc_intr_tlb_miss(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore)
         break;
     }
 }
+#endif /* CONFIG_TCG */
+
+void ppc_intr_machine_check(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore)
+{
+    CPUState *cs = CPU(cpu);
+    CPUPPCState *env = &cpu->env;
+    int excp_model = env->excp_model;
+
+    if (msr_me == 0) {
+        /*
+         * Machine check exception is not enabled.  Enter
+         * checkstop state.
+         */
+        fprintf(stderr, "Machine check while not allowed. "
+                "Entering checkstop state\n");
+        if (qemu_log_separate()) {
+            qemu_log("Machine check while not allowed. "
+                     "Entering checkstop state\n");
+        }
+        cs->halted = 1;
+#if defined(CONFIG_TCG)
+        cpu_interrupt_exittb(cs);
+#endif
+    }
+    if (env->msr_mask & MSR_HVB) {
+        /*
+         * ISA specifies HV, but can be delivered to guest with HV
+         * clear (e.g., see FWNMI in PAPR).
+         */
+        regs->new_msr |= (target_ulong)MSR_HVB;
+    }
+
+    /* machine check exceptions don't have ME set */
+    regs->new_msr &= ~((target_ulong)1 << MSR_ME);
+
+    /* XXX: should also have something loaded in DAR / DSISR */
+    switch (excp_model) {
+    case POWERPC_EXCP_40x:
+        regs->sprn_srr0 = SPR_40x_SRR2;
+        regs->sprn_srr1 = SPR_40x_SRR3;
+        break;
+    case POWERPC_EXCP_BOOKE:
+        /* FIXME: choose one or the other based on CPU type */
+        regs->sprn_srr0 = SPR_BOOKE_MCSRR0;
+        regs->sprn_srr1 = SPR_BOOKE_MCSRR1;
+
+        env->spr[SPR_BOOKE_CSRR0] = regs->nip;
+        env->spr[SPR_BOOKE_CSRR1] = regs->msr;
+        break;
+    default:
+        break;
+    }
+}
+
+void ppc_intr_program(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore)
+{
+    CPUState *cs = CPU(cpu);
+    CPUPPCState *env = &cpu->env;
+
+    switch (env->error_code & ~0xF) {
+    case POWERPC_EXCP_FP:
+        if ((msr_fe0 == 0 && msr_fe1 == 0) || msr_fp == 0) {
+            trace_ppc_excp_fp_ignore();
+            cs->exception_index = POWERPC_EXCP_NONE;
+            env->error_code = 0;
+
+            *ignore = true;
+            return;
+        }
+
+        /*
+         * FP exceptions always have NIP pointing to the faulting
+         * instruction, so always use store_next and claim we are
+         * precise in the MSR.
+         */
+        regs->msr |= 0x00100000;
+        env->spr[SPR_BOOKE_ESR] = ESR_FP;
+        break;
+    case POWERPC_EXCP_INVAL:
+        trace_ppc_excp_inval(regs->nip);
+        regs->msr |= 0x00080000;
+        env->spr[SPR_BOOKE_ESR] = ESR_PIL;
+        break;
+    case POWERPC_EXCP_PRIV:
+        regs->msr |= 0x00040000;
+        env->spr[SPR_BOOKE_ESR] = ESR_PPR;
+        break;
+    case POWERPC_EXCP_TRAP:
+        regs->msr |= 0x00020000;
+        env->spr[SPR_BOOKE_ESR] = ESR_PTR;
+        break;
+    default:
+        /* Should never occur */
+        cpu_abort(cs, "Invalid program exception %d. Aborting\n",
+                  env->error_code);
+        break;
+    }
+}
+
+void ppc_intr_system_reset(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore)
+{
+    CPUPPCState *env = &cpu->env;
+
+    /* A power-saving exception sets ME, otherwise it is unchanged */
+    if (msr_pow) {
+        /* indicate that we resumed from power save mode */
+        regs->msr |= 0x10000;
+        regs->new_msr |= ((target_ulong)1 << MSR_ME);
+    }
+    if (env->msr_mask & MSR_HVB) {
+        /*
+         * ISA specifies HV, but can be delivered to guest with HV
+         * clear (e.g., see FWNMI in PAPR, NMI injection in QEMU).
+         */
+        regs->new_msr |= (target_ulong)MSR_HVB;
+    } else {
+        if (msr_pow) {
+            cpu_abort(CPU(cpu), "Trying to deliver power-saving system reset "
+                      "exception with no HV support\n");
+        }
+    }
+}
+
+/*
+ * Book3S and BookE support KVM, but QEMU only dispatches a small
+ * set of interrupts in very specific ocasions. All other
+ * interrupts are dispatched by the real harware and QEMU knows
+ * nothing about them.
+ */
+PPCInterrupt interrupts_kvm[POWERPC_EXCP_NB] = {
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
+};
 
 int ppc_intr_prepare(PowerPCCPU *cpu, PPCInterrupt *interrupts,
                      PPCIntrArgs *regs, int excp)
@@ -464,6 +490,10 @@ int ppc_intr_prepare(PowerPCCPU *cpu, PPCInterrupt *interrupts,
     PPCInterrupt *intr;
     bool ignore = false;
 
+    if (kvm_enabled()) {
+        interrupts = interrupts_kvm;
+    }
+
     intr = &interrupts[excp];
     if (!intr->name) {
         cpu_abort(cs, "Invalid PowerPC exception %d. Aborting\n", excp);
diff --git a/target/ppc/intr-book3s.c b/target/ppc/intr-book3s.c
index cd279de346..a475c668ed 100644
--- a/target/ppc/intr-book3s.c
+++ b/target/ppc/intr-book3s.c
@@ -11,6 +11,7 @@
 #include "ppc_intr.h"
 
 static PPCInterrupt interrupts_book3s[POWERPC_EXCP_NB] = {
+#ifdef CONFIG_TCG
     [POWERPC_EXCP_ALIGN] = {
         "Alignment", ppc_intr_alignment
     },
@@ -88,6 +89,7 @@ static PPCInterrupt interrupts_book3s[POWERPC_EXCP_NB] = {
     [POWERPC_EXCP_SDOOR]    = { "Server doorbell" },
     [POWERPC_EXCP_THERM]    = { "Thermal management" },
     [POWERPC_EXCP_VPUA]     = { "Vector assist" },
+#endif
 };
 
 static int powerpc_reset_wakeup(CPUState *cs, CPUPPCState *env, int excp,
diff --git a/target/ppc/intr-booke.c b/target/ppc/intr-booke.c
index 598d372069..9297b14ed6 100644
--- a/target/ppc/intr-booke.c
+++ b/target/ppc/intr-booke.c
@@ -11,6 +11,7 @@
 #include "ppc_intr.h"
 
 static PPCInterrupt interrupts_booke[POWERPC_EXCP_NB] = {
+#ifdef CONFIG_TCG
     [POWERPC_EXCP_ALIGN] = {
         "Alignment", ppc_intr_alignment
     },
@@ -76,6 +77,7 @@ static PPCInterrupt interrupts_booke[POWERPC_EXCP_NB] = {
 /* Not impleemented */
     [POWERPC_EXCP_EFPDI]    = { "Embedded floating-point data" },
     [POWERPC_EXCP_EFPRI]    = { "Embedded floating-point round" },
+#endif
 };
 
 void booke_excp(PowerPCCPU *cpu, int excp)
diff --git a/target/ppc/ppc_intr.h b/target/ppc/ppc_intr.h
index a0362f4248..4aab37ea28 100644
--- a/target/ppc/ppc_intr.h
+++ b/target/ppc/ppc_intr.h
@@ -19,6 +19,7 @@ struct PPCInterrupt {
     ppc_intr_fn_t fn;
 };
 
+#ifdef CONFIG_TCG
 void ppc_intr_alignment(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore);
 void ppc_intr_critical(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore);
 void ppc_intr_data_storage(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore);
@@ -28,14 +29,11 @@ void ppc_intr_external(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore);
 void ppc_intr_facility_unavail(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore);
 void ppc_intr_fit(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore);
 void ppc_intr_insn_storage(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore);
-void ppc_intr_machine_check(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore);
 void ppc_intr_noop(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore);
-void ppc_intr_program(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore);
 void ppc_intr_programmable_timer(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore);
 void ppc_intr_spe_unavailable(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore);
 void ppc_intr_system_call(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore);
 void ppc_intr_system_call_vectored(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore);
-void ppc_intr_system_reset(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore);
 void ppc_intr_tlb_miss(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore);
 void ppc_intr_watchdog(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore);
 
@@ -43,7 +41,13 @@ void ppc_intr_watchdog(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore);
 void ppc_intr_hv(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore);
 void ppc_intr_hv_facility_unavail(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore);
 void ppc_intr_hv_insn_storage(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore);
-#endif
+#endif /* TARGET_PPC64 */
+
+#endif /* CONFIG_TCG */
+
+void ppc_intr_machine_check(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore);
+void ppc_intr_program(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore);
+void ppc_intr_system_reset(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore);
 
 int ppc_intr_prepare(PowerPCCPU *cpu, PPCInterrupt *interrupts,
                      PPCIntrArgs *regs, int excp);
-- 
2.33.1


