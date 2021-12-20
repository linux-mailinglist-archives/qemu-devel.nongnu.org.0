Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FBB547B370
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 20:07:57 +0100 (CET)
Received: from localhost ([::1]:39332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzO0q-0007Gb-MT
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 14:07:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1mzNGD-00031G-G1; Mon, 20 Dec 2021 13:19:45 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:20792)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1mzNG8-0006mQ-Em; Mon, 20 Dec 2021 13:19:45 -0500
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BKI6aBn005671; 
 Mon, 20 Dec 2021 18:19:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=ST7YdzWAL4N187OmUdDhi/AnB/ulQ74+anXZaWJvrTc=;
 b=AapkZ7T1zzkpIRMRwAtHjTnKoApdvCTHmpTZb0SJNkQokSPw3JpYyvPv24XikN1zuj1p
 EsJSuysTahXSmRBTAaQ5uPR5eh5PHzLutikzYS5k+o+6+WdYFhMbEuPTc79FuvcKroaH
 o2V5ZDqoJYylELL9wfXn9ZbfTf9oNA14+Ap1aPyLhBIjP849I8Gvo3eF7V2Mxknm/Dhc
 1UYvJSG4cSVmMVlvHd5EnLtF1EW1Avlk094pPNUi2ALpVSe7PM5AsJQ2hkqXwb2y2AbY
 l/ChrZRXM14zHQffIz10VXOFkE3yvqKhPg0FYjCYRcZ9apqY4aVS5AclKpeoaBb50DnX Bg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3d2q0jtp5s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Dec 2021 18:19:28 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1BKIAnV6012556;
 Mon, 20 Dec 2021 18:19:27 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3d2q0jtp5c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Dec 2021 18:19:27 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BKIEub6007232;
 Mon, 20 Dec 2021 18:19:26 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma01dal.us.ibm.com with ESMTP id 3d179aj88c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Dec 2021 18:19:26 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1BKIJOMm31850754
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 20 Dec 2021 18:19:24 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A95CBC6059;
 Mon, 20 Dec 2021 18:19:24 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E59B3C606C;
 Mon, 20 Dec 2021 18:19:22 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.60.53])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 20 Dec 2021 18:19:22 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [RFC v2 06/12] target/ppc: Extract interrupt routines into a new file
Date: Mon, 20 Dec 2021 15:18:57 -0300
Message-Id: <20211220181903.3456898-7-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211220181903.3456898-1-farosas@linux.ibm.com>
References: <20211220181903.3456898-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: BMF_B9sBc4ymCIuwVKLssCVUoA-Q6noQ
X-Proofpoint-ORIG-GUID: KbGt_LHUDxADC0hJHF-e5i_488wd4qL9
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

Extract the interrupt setup routines into their own functions and put
everything in a separate file. These routines will be made independent
of exception model in the following patches. This change is just to
facilitate the review.

No funcional change intended.

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
---
 target/ppc/excp_helper.c | 434 ++++----------------------
 target/ppc/interrupts.c  | 645 +++++++++++++++++++++++++++++++++++++++
 target/ppc/meson.build   |   1 +
 target/ppc/ppc_intr.h    |  61 ++++
 4 files changed, 769 insertions(+), 372 deletions(-)
 create mode 100644 target/ppc/interrupts.c
 create mode 100644 target/ppc/ppc_intr.h

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index f478ff8a87..bc20499b6c 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -23,6 +23,10 @@
 #include "internal.h"
 #include "helper_regs.h"
 
+#if !defined(CONFIG_USER_ONLY)
+#include "ppc_intr.h"
+#endif
+
 #include "trace.h"
 
 #ifdef CONFIG_TCG
@@ -30,39 +34,10 @@
 #include "exec/cpu_ldst.h"
 #endif
 
-/* #define DEBUG_SOFTWARE_TLB */
-
 /*****************************************************************************/
 /* Exception processing */
 #if !defined(CONFIG_USER_ONLY)
 
-static inline void dump_syscall(CPUPPCState *env)
-{
-    qemu_log_mask(CPU_LOG_INT, "syscall r0=%016" PRIx64
-                  " r3=%016" PRIx64 " r4=%016" PRIx64 " r5=%016" PRIx64
-                  " r6=%016" PRIx64 " r7=%016" PRIx64 " r8=%016" PRIx64
-                  " nip=" TARGET_FMT_lx "\n",
-                  ppc_dump_gpr(env, 0), ppc_dump_gpr(env, 3),
-                  ppc_dump_gpr(env, 4), ppc_dump_gpr(env, 5),
-                  ppc_dump_gpr(env, 6), ppc_dump_gpr(env, 7),
-                  ppc_dump_gpr(env, 8), env->nip);
-}
-
-static inline void dump_hcall(CPUPPCState *env)
-{
-    qemu_log_mask(CPU_LOG_INT, "hypercall r3=%016" PRIx64
-                  " r4=%016" PRIx64 " r5=%016" PRIx64 " r6=%016" PRIx64
-                  " r7=%016" PRIx64 " r8=%016" PRIx64 " r9=%016" PRIx64
-                  " r10=%016" PRIx64 " r11=%016" PRIx64 " r12=%016" PRIx64
-                  " nip=" TARGET_FMT_lx "\n",
-                  ppc_dump_gpr(env, 3), ppc_dump_gpr(env, 4),
-                  ppc_dump_gpr(env, 5), ppc_dump_gpr(env, 6),
-                  ppc_dump_gpr(env, 7), ppc_dump_gpr(env, 8),
-                  ppc_dump_gpr(env, 9), ppc_dump_gpr(env, 10),
-                  ppc_dump_gpr(env, 11), ppc_dump_gpr(env, 12),
-                  env->nip);
-}
-
 static int powerpc_reset_wakeup(CPUState *cs, CPUPPCState *env, int excp,
                                 target_ulong *msr)
 {
@@ -289,15 +264,6 @@ static inline void powerpc_set_excp_state(PowerPCCPU *cpu, target_ulong new_nip,
     check_tlb_flush(env, false);
 }
 
-typedef struct PPCIntrArgs {
-    target_ulong nip;
-    target_ulong msr;
-    target_ulong new_nip;
-    target_ulong new_msr;
-    int sprn_srr0;
-    int sprn_srr1;
-} PPCIntrArgs;
-
 /*
  * Note that this function should be greatly optimized when called
  * with a constant excp, from ppc_hw_interrupt
@@ -308,7 +274,7 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp)
     CPUPPCState *env = &cpu->env;
     int excp_model = env->excp_model;
     PPCIntrArgs regs;
-    int lev = -1;
+    bool ignore = false;
 
     qemu_log_mask(CPU_LOG_INT, "Raise exception at " TARGET_FMT_lx
                   " => %08x (%02x)\n", env->nip, excp, env->error_code);
@@ -374,442 +340,166 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp)
     case POWERPC_EXCP_NONE:
         /* Should never happen */
         return;
+
     case POWERPC_EXCP_CRITICAL:    /* Critical input                         */
-        switch (excp_model) {
-        case POWERPC_EXCP_40x:
-            regs.sprn_srr0 = SPR_40x_SRR2;
-            regs.sprn_srr1 = SPR_40x_SRR3;
-            break;
-        case POWERPC_EXCP_BOOKE:
-            regs.sprn_srr0 = SPR_BOOKE_CSRR0;
-            regs.sprn_srr1 = SPR_BOOKE_CSRR1;
-            break;
-        case POWERPC_EXCP_G2:
-            break;
-        default:
-            goto excp_invalid;
-        }
+        ppc_intr_critical(cpu, &regs, &ignore);
         break;
     case POWERPC_EXCP_MCHECK:    /* Machine check exception                  */
-        if (msr_me == 0) {
-            /*
-             * Machine check exception is not enabled.  Enter
-             * checkstop state.
-             */
-            fprintf(stderr, "Machine check while not allowed. "
-                    "Entering checkstop state\n");
-            if (qemu_log_separate()) {
-                qemu_log("Machine check while not allowed. "
-                        "Entering checkstop state\n");
-            }
-            cs->halted = 1;
-            cpu_interrupt_exittb(cs);
-        }
-        if (env->msr_mask & MSR_HVB) {
-            /*
-             * ISA specifies HV, but can be delivered to guest with HV
-             * clear (e.g., see FWNMI in PAPR).
-             */
-            regs.new_msr |= (target_ulong)MSR_HVB;
-        }
-
-        /* machine check exceptions don't have ME set */
-        regs.new_msr &= ~((target_ulong)1 << MSR_ME);
-
-        /* XXX: should also have something loaded in DAR / DSISR */
-        switch (excp_model) {
-        case POWERPC_EXCP_40x:
-            regs.sprn_srr0 = SPR_40x_SRR2;
-            regs.sprn_srr1 = SPR_40x_SRR3;
-            break;
-        case POWERPC_EXCP_BOOKE:
-            /* FIXME: choose one or the other based on CPU type */
-            regs.sprn_srr0 = SPR_BOOKE_MCSRR0;
-            regs.sprn_srr1 = SPR_BOOKE_MCSRR1;
-
-            env->spr[SPR_BOOKE_CSRR0] = regs.nip;
-            env->spr[SPR_BOOKE_CSRR1] = regs.msr;
-            break;
-        default:
-            break;
-        }
+        ppc_intr_machine_check(cpu, &regs, &ignore);
         break;
     case POWERPC_EXCP_DSI:       /* Data storage exception                   */
-        trace_ppc_excp_dsi(env->spr[SPR_DSISR], env->spr[SPR_DAR]);
+        ppc_intr_data_storage(cpu, &regs, &ignore);
         break;
     case POWERPC_EXCP_ISI:       /* Instruction storage exception            */
-        trace_ppc_excp_isi(regs.msr, regs.nip);
-        regs.msr |= env->error_code;
+        ppc_intr_insn_storage(cpu, &regs, &ignore);
         break;
     case POWERPC_EXCP_EXTERNAL:  /* External input                           */
-    {
-        bool lpes0;
-
-        cs = CPU(cpu);
-
-        /*
-         * Exception targeting modifiers
-         *
-         * LPES0 is supported on POWER7/8/9
-         * LPES1 is not supported (old iSeries mode)
-         *
-         * On anything else, we behave as if LPES0 is 1
-         * (externals don't alter MSR:HV)
-         */
-#if defined(TARGET_PPC64)
-        if (excp_model == POWERPC_EXCP_POWER7 ||
-            excp_model == POWERPC_EXCP_POWER8 ||
-            excp_model == POWERPC_EXCP_POWER9 ||
-            excp_model == POWERPC_EXCP_POWER10) {
-            lpes0 = !!(env->spr[SPR_LPCR] & LPCR_LPES0);
-        } else
-#endif /* defined(TARGET_PPC64) */
-        {
-            lpes0 = true;
-        }
-
-        if (!lpes0) {
-            regs.new_msr |= (target_ulong)MSR_HVB;
-            regs.new_msr |= env->msr & ((target_ulong)1 << MSR_RI);
-            regs.sprn_srr0 = SPR_HSRR0;
-            regs.sprn_srr1 = SPR_HSRR1;
-        }
-        if (env->mpic_proxy) {
-            /* IACK the IRQ on delivery */
-            env->spr[SPR_BOOKE_EPR] = ldl_phys(cs->as, env->mpic_iack);
-        }
+        ppc_intr_external(cpu, &regs, &ignore);
         break;
-    }
     case POWERPC_EXCP_ALIGN:     /* Alignment exception                      */
-        /* Get rS/rD and rA from faulting opcode */
-        /*
-         * Note: the opcode fields will not be set properly for a
-         * direct store load/store, but nobody cares as nobody
-         * actually uses direct store segments.
-         */
-        env->spr[SPR_DSISR] |= (env->error_code & 0x03FF0000) >> 16;
+        ppc_intr_alignment(cpu, &regs, &ignore);
         break;
     case POWERPC_EXCP_PROGRAM:   /* Program exception                        */
-        switch (env->error_code & ~0xF) {
-        case POWERPC_EXCP_FP:
-            if ((msr_fe0 == 0 && msr_fe1 == 0) || msr_fp == 0) {
-                trace_ppc_excp_fp_ignore();
-                cs->exception_index = POWERPC_EXCP_NONE;
-                env->error_code = 0;
-                return;
-            }
-
-            /*
-             * FP exceptions always have NIP pointing to the faulting
-             * instruction, so always use store_next and claim we are
-             * precise in the MSR.
-             */
-            regs.msr |= 0x00100000;
-            env->spr[SPR_BOOKE_ESR] = ESR_FP;
-            break;
-        case POWERPC_EXCP_INVAL:
-            trace_ppc_excp_inval(regs.nip);
-            regs.msr |= 0x00080000;
-            env->spr[SPR_BOOKE_ESR] = ESR_PIL;
-            break;
-        case POWERPC_EXCP_PRIV:
-            regs.msr |= 0x00040000;
-            env->spr[SPR_BOOKE_ESR] = ESR_PPR;
-            break;
-        case POWERPC_EXCP_TRAP:
-            regs.msr |= 0x00020000;
-            env->spr[SPR_BOOKE_ESR] = ESR_PTR;
-            break;
-        default:
-            /* Should never occur */
-            cpu_abort(cs, "Invalid program exception %d. Aborting\n",
-                      env->error_code);
-            break;
-        }
+        ppc_intr_program(cpu, &regs, &ignore);
         break;
     case POWERPC_EXCP_SYSCALL:   /* System call exception                    */
-        lev = env->error_code;
-
-        if ((lev == 1) && cpu->vhyp) {
-            dump_hcall(env);
-        } else {
-            dump_syscall(env);
-        }
-
-        /*
-         * We need to correct the NIP which in this case is supposed
-         * to point to the next instruction. We also set env->nip here
-         * because the modification needs to be accessible by the
-         * virtual hypervisor code below.
-         */
-        regs.nip += 4;
-        env->nip = regs.nip;
-
-        /* "PAPR mode" built-in hypercall emulation */
-        if ((lev == 1) && cpu->vhyp) {
-            PPCVirtualHypervisorClass *vhc =
-                PPC_VIRTUAL_HYPERVISOR_GET_CLASS(cpu->vhyp);
-            vhc->hypercall(cpu->vhyp, cpu);
-            return;
-        }
-
-        if (lev == 1) {
-            regs.new_msr |= (target_ulong)MSR_HVB;
-        }
+        ppc_intr_system_call(cpu, &regs, &ignore);
         break;
     case POWERPC_EXCP_SYSCALL_VECTORED: /* scv exception                     */
-        lev = env->error_code;
-        dump_syscall(env);
-        regs.nip += 4;
-        regs.new_msr |= env->msr & ((target_ulong)1 << MSR_EE);
-        regs.new_msr |= env->msr & ((target_ulong)1 << MSR_RI);
-
-        regs.new_nip += lev * 0x20;
-
-        env->lr = regs.nip;
-        env->ctr = regs.msr;
+        ppc_intr_system_call_vectored(cpu, &regs, &ignore);
         break;
     case POWERPC_EXCP_FPU:       /* Floating-point unavailable exception     */
     case POWERPC_EXCP_APU:       /* Auxiliary processor unavailable          */
     case POWERPC_EXCP_DECR:      /* Decrementer exception                    */
         break;
     case POWERPC_EXCP_FIT:       /* Fixed-interval timer interrupt           */
-        /* FIT on 4xx */
-        trace_ppc_excp_print("FIT");
+        ppc_intr_fit(cpu, &regs, &ignore);
         break;
     case POWERPC_EXCP_WDT:       /* Watchdog timer interrupt                 */
-        trace_ppc_excp_print("WDT");
-        switch (excp_model) {
-        case POWERPC_EXCP_BOOKE:
-            regs.sprn_srr0 = SPR_BOOKE_CSRR0;
-            regs.sprn_srr1 = SPR_BOOKE_CSRR1;
-            break;
-        default:
-            break;
-        }
+        ppc_intr_watchdog(cpu, &regs, &ignore);
         break;
     case POWERPC_EXCP_DTLB:      /* Data TLB error                           */
     case POWERPC_EXCP_ITLB:      /* Instruction TLB error                    */
         break;
     case POWERPC_EXCP_DEBUG:     /* Debug interrupt                          */
-        if (env->flags & POWERPC_FLAG_DE) {
-            /* FIXME: choose one or the other based on CPU type */
-            regs.sprn_srr0 = SPR_BOOKE_DSRR0;
-            regs.sprn_srr1 = SPR_BOOKE_DSRR1;
-
-            env->spr[SPR_BOOKE_CSRR0] = regs.nip;
-            env->spr[SPR_BOOKE_CSRR1] = regs.msr;
-            /* DBSR already modified by caller */
-        } else {
-            cpu_abort(cs, "Debug exception triggered on unsupported model\n");
-        }
+        ppc_intr_debug(cpu, &regs, &ignore);
         break;
     case POWERPC_EXCP_SPEU:   /* SPE/embedded floating-point unavailable/VPU  */
-        env->spr[SPR_BOOKE_ESR] = ESR_SPV;
+        ppc_intr_spe_unavailable(cpu, &regs, &ignore);
         break;
     case POWERPC_EXCP_EFPDI:     /* Embedded floating-point data interrupt   */
-        /* XXX: TODO */
-        cpu_abort(cs, "Embedded floating point data exception "
-                  "is not implemented yet !\n");
-        env->spr[SPR_BOOKE_ESR] = ESR_SPV;
+        ppc_intr_embedded_fp_data(cpu, &regs, &ignore);
         break;
     case POWERPC_EXCP_EFPRI:     /* Embedded floating-point round interrupt  */
-        /* XXX: TODO */
-        cpu_abort(cs, "Embedded floating point round exception "
-                  "is not implemented yet !\n");
-        env->spr[SPR_BOOKE_ESR] = ESR_SPV;
+        ppc_intr_embedded_fp_round(cpu, &regs, &ignore);
         break;
     case POWERPC_EXCP_EPERFM:    /* Embedded performance monitor interrupt   */
-        /* XXX: TODO */
-        cpu_abort(cs,
-                  "Performance counter exception is not implemented yet !\n");
+        ppc_intr_embedded_perf_monitor(cpu, &regs, &ignore);
         break;
     case POWERPC_EXCP_DOORI:     /* Embedded doorbell interrupt              */
         break;
     case POWERPC_EXCP_DOORCI:    /* Embedded doorbell critical interrupt     */
-        regs.sprn_srr0 = SPR_BOOKE_CSRR0;
-        regs.sprn_srr1 = SPR_BOOKE_CSRR1;
+        ppc_intr_embedded_doorbell_crit(cpu, &regs, &ignore);
         break;
     case POWERPC_EXCP_RESET:     /* System reset exception                   */
-        /* A power-saving exception sets ME, otherwise it is unchanged */
-        if (msr_pow) {
-            /* indicate that we resumed from power save mode */
-            regs.msr |= 0x10000;
-            regs.new_msr |= ((target_ulong)1 << MSR_ME);
-        }
-        if (env->msr_mask & MSR_HVB) {
-            /*
-             * ISA specifies HV, but can be delivered to guest with HV
-             * clear (e.g., see FWNMI in PAPR, NMI injection in QEMU).
-             */
-            regs.new_msr |= (target_ulong)MSR_HVB;
-        } else {
-            if (msr_pow) {
-                cpu_abort(cs, "Trying to deliver power-saving system reset "
-                          "exception %d with no HV support\n", excp);
-            }
-        }
+        ppc_intr_system_reset(cpu, &regs, &ignore);
         break;
     case POWERPC_EXCP_DSEG:      /* Data segment exception                   */
     case POWERPC_EXCP_ISEG:      /* Instruction segment exception            */
     case POWERPC_EXCP_TRACE:     /* Trace exception                          */
         break;
     case POWERPC_EXCP_HISI:      /* Hypervisor instruction storage exception */
-        regs.msr |= env->error_code;
-        /* fall through */
+        ppc_intr_hv_insn_storage(cpu, &regs, &ignore);
+        break;
     case POWERPC_EXCP_HDECR:     /* Hypervisor decrementer exception         */
+        ppc_intr_hv_decrementer(cpu, &regs, &ignore);
+        break;
     case POWERPC_EXCP_HDSI:      /* Hypervisor data storage exception        */
+        ppc_intr_hv_data_storage(cpu, &regs, &ignore);
+        break;
     case POWERPC_EXCP_HDSEG:     /* Hypervisor data segment exception        */
+        ppc_intr_hv_data_segment(cpu, &regs, &ignore);
+        break;
     case POWERPC_EXCP_HISEG:     /* Hypervisor instruction segment exception */
+        ppc_intr_hv_insn_segment(cpu, &regs, &ignore);
+        break;
     case POWERPC_EXCP_SDOOR_HV:  /* Hypervisor Doorbell interrupt            */
+        ppc_intr_hv_doorbell(cpu, &regs, &ignore);
+        break;
     case POWERPC_EXCP_HV_EMU:
+        ppc_intr_hv_emulation(cpu, &regs, &ignore);
+        break;
     case POWERPC_EXCP_HVIRT:     /* Hypervisor virtualization                */
-        regs.sprn_srr0 = SPR_HSRR0;
-        regs.sprn_srr1 = SPR_HSRR1;
-        regs.new_msr |= (target_ulong)MSR_HVB;
-        regs.new_msr |= env->msr & ((target_ulong)1 << MSR_RI);
+        ppc_intr_hv_virtualization(cpu, &regs, &ignore);
         break;
     case POWERPC_EXCP_VPU:       /* Vector unavailable exception             */
     case POWERPC_EXCP_VSXU:       /* VSX unavailable exception               */
     case POWERPC_EXCP_FU:         /* Facility unavailable exception          */
-#ifdef TARGET_PPC64
-        env->spr[SPR_FSCR] |= ((target_ulong)env->error_code << 56);
-#endif
+        ppc_intr_facility_unavail(cpu, &regs, &ignore);
         break;
     case POWERPC_EXCP_HV_FU:     /* Hypervisor Facility Unavailable Exception */
-#ifdef TARGET_PPC64
-        env->spr[SPR_HFSCR] |= ((target_ulong)env->error_code << FSCR_IC_POS);
-        regs.sprn_srr0 = SPR_HSRR0;
-        regs.sprn_srr1 = SPR_HSRR1;
-        regs.new_msr |= (target_ulong)MSR_HVB;
-        regs.new_msr |= env->msr & ((target_ulong)1 << MSR_RI);
-#endif
+        ppc_intr_hv_facility_unavail(cpu, &regs, &ignore);
         break;
     case POWERPC_EXCP_PIT:       /* Programmable interval timer interrupt    */
-        trace_ppc_excp_print("PIT");
+        ppc_intr_programmable_timer(cpu, &regs, &ignore);
         break;
     case POWERPC_EXCP_IO:        /* IO error exception                       */
-        /* XXX: TODO */
-        cpu_abort(cs, "601 IO error exception is not implemented yet !\n");
+        ppc_intr_io_error(cpu, &regs, &ignore);
         break;
     case POWERPC_EXCP_RUNM:      /* Run mode exception                       */
-        /* XXX: TODO */
-        cpu_abort(cs, "601 run mode exception is not implemented yet !\n");
+        ppc_intr_run_mode(cpu, &regs, &ignore);
         break;
     case POWERPC_EXCP_EMUL:      /* Emulation trap exception                 */
-        /* XXX: TODO */
-        cpu_abort(cs, "602 emulation trap exception "
-                  "is not implemented yet !\n");
+        ppc_intr_emulation(cpu, &regs, &ignore);
         break;
     case POWERPC_EXCP_IFTLB:     /* Instruction fetch TLB error              */
     case POWERPC_EXCP_DLTLB:     /* Data load TLB miss                       */
     case POWERPC_EXCP_DSTLB:     /* Data store TLB miss                      */
-        switch (excp_model) {
-        case POWERPC_EXCP_602:
-        case POWERPC_EXCP_603:
-        case POWERPC_EXCP_G2:
-            /* Swap temporary saved registers with GPRs */
-            if (!(regs.new_msr & ((target_ulong)1 << MSR_TGPR))) {
-                regs.new_msr |= (target_ulong)1 << MSR_TGPR;
-                hreg_swap_gpr_tgpr(env);
-            }
-            /* fall through */
-        case POWERPC_EXCP_7x5:
-#if defined(DEBUG_SOFTWARE_TLB)
-            if (qemu_log_enabled()) {
-                const char *es;
-                target_ulong *miss, *cmp;
-                int en;
-
-                if (excp == POWERPC_EXCP_IFTLB) {
-                    es = "I";
-                    en = 'I';
-                    miss = &env->spr[SPR_IMISS];
-                    cmp = &env->spr[SPR_ICMP];
-                } else {
-                    if (excp == POWERPC_EXCP_DLTLB) {
-                        es = "DL";
-                    } else {
-                        es = "DS";
-                    }
-                    en = 'D';
-                    miss = &env->spr[SPR_DMISS];
-                    cmp = &env->spr[SPR_DCMP];
-                }
-                qemu_log("6xx %sTLB miss: %cM " TARGET_FMT_lx " %cC "
-                         TARGET_FMT_lx " H1 " TARGET_FMT_lx " H2 "
-                         TARGET_FMT_lx " %08x\n", es, en, *miss, en, *cmp,
-                         env->spr[SPR_HASH1], env->spr[SPR_HASH2],
-                         env->error_code);
-            }
-#endif
-            regs.msr |= env->crf[0] << 28;
-            regs.msr |= env->error_code; /* key, D/I, S/L bits */
-            /* Set way using a LRU mechanism */
-            regs.msr |= ((env->last_way + 1) & (env->nb_ways - 1)) << 17;
-            break;
-        default:
-            cpu_abort(cs, "Invalid TLB miss exception\n");
-            break;
-        }
+        ppc_intr_tlb_miss(cpu, &regs, &ignore);
         break;
     case POWERPC_EXCP_FPA:       /* Floating-point assist exception          */
-        /* XXX: TODO */
-        cpu_abort(cs, "Floating point assist exception "
-                  "is not implemented yet !\n");
+        ppc_intr_fpa(cpu, &regs, &ignore);
         break;
     case POWERPC_EXCP_DABR:      /* Data address breakpoint                  */
-        /* XXX: TODO */
-        cpu_abort(cs, "DABR exception is not implemented yet !\n");
+        ppc_intr_dabr(cpu, &regs, &ignore);
         break;
     case POWERPC_EXCP_IABR:      /* Instruction address breakpoint           */
-        /* XXX: TODO */
-        cpu_abort(cs, "IABR exception is not implemented yet !\n");
+        ppc_intr_iabr(cpu, &regs, &ignore);
         break;
     case POWERPC_EXCP_SMI:       /* System management interrupt              */
-        /* XXX: TODO */
-        cpu_abort(cs, "SMI exception is not implemented yet !\n");
+        ppc_intr_smi(cpu, &regs, &ignore);
         break;
     case POWERPC_EXCP_THERM:     /* Thermal interrupt                        */
-        /* XXX: TODO */
-        cpu_abort(cs, "Thermal management exception "
-                  "is not implemented yet !\n");
+        ppc_intr_therm(cpu, &regs, &ignore);
         break;
     case POWERPC_EXCP_PERFM:     /* Embedded performance monitor interrupt   */
-        /* XXX: TODO */
-        cpu_abort(cs,
-                  "Performance counter exception is not implemented yet !\n");
+        ppc_intr_perfm(cpu, &regs, &ignore);
         break;
     case POWERPC_EXCP_VPUA:      /* Vector assist exception                  */
-        /* XXX: TODO */
-        cpu_abort(cs, "VPU assist exception is not implemented yet !\n");
+        ppc_intr_vpua(cpu, &regs, &ignore);
         break;
     case POWERPC_EXCP_SOFTP:     /* Soft patch exception                     */
-        /* XXX: TODO */
-        cpu_abort(cs,
-                  "970 soft-patch exception is not implemented yet !\n");
+        ppc_intr_softp(cpu, &regs, &ignore);
         break;
     case POWERPC_EXCP_MAINT:     /* Maintenance exception                    */
-        /* XXX: TODO */
-        cpu_abort(cs,
-                  "970 maintenance exception is not implemented yet !\n");
+        ppc_intr_maint(cpu, &regs, &ignore);
         break;
     case POWERPC_EXCP_MEXTBR:    /* Maskable external breakpoint             */
-        /* XXX: TODO */
-        cpu_abort(cs, "Maskable external exception "
-                  "is not implemented yet !\n");
+        ppc_intr_mextbr(cpu, &regs, &ignore);
         break;
     case POWERPC_EXCP_NMEXTBR:   /* Non maskable external breakpoint         */
-        /* XXX: TODO */
-        cpu_abort(cs, "Non maskable external exception "
-                  "is not implemented yet !\n");
+        ppc_intr_nmextbr(cpu, &regs, &ignore);
         break;
     default:
-    excp_invalid:
         cpu_abort(cs, "Invalid PowerPC exception %d. Aborting\n", excp);
         break;
     }
 
+    if (ignore) {
+        /* No further setup is needed for this interrupt */
+        return;
+    }
+
     /* Sanity check */
     if (!(env->msr_mask & MSR_HVB)) {
         if (regs.new_msr & MSR_HVB) {
diff --git a/target/ppc/interrupts.c b/target/ppc/interrupts.c
new file mode 100644
index 0000000000..0168ce03a7
--- /dev/null
+++ b/target/ppc/interrupts.c
@@ -0,0 +1,645 @@
+/*
+ * PowerPC interrupt emulation.
+ *
+ * Copyright (C) 2021 IBM Corporation.
+ *
+ * This code is licensed under the GPL version 2 or later. See the
+ * COPYING file in the top-level directory.
+ */
+#include "qemu/osdep.h"
+#include "qemu/log.h"
+#include "cpu.h"
+#include "ppc_intr.h"
+#include "trace.h"
+
+/* for hreg_swap_gpr_tgpr */
+#include "helper_regs.h"
+
+/* #define DEBUG_SOFTWARE_TLB */
+
+void ppc_intr_critical(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore)
+{
+    CPUPPCState *env = &cpu->env;
+    int excp_model = env->excp_model;
+
+    switch (excp_model) {
+    case POWERPC_EXCP_40x:
+        regs->sprn_srr0 = SPR_40x_SRR2;
+        regs->sprn_srr1 = SPR_40x_SRR3;
+        break;
+    case POWERPC_EXCP_BOOKE:
+        regs->sprn_srr0 = SPR_BOOKE_CSRR0;
+        regs->sprn_srr1 = SPR_BOOKE_CSRR1;
+        break;
+    case POWERPC_EXCP_G2:
+        break;
+    default:
+        cpu_abort(CPU(cpu), "Invalid PowerPC critical exception. Aborting\n");
+        break;
+    }
+}
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
+        cpu_interrupt_exittb(cs);
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
+void ppc_intr_data_storage(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore)
+{
+    CPUPPCState *env = &cpu->env;
+
+    trace_ppc_excp_dsi(env->spr[SPR_DSISR], env->spr[SPR_DAR]);
+}
+
+
+void ppc_intr_insn_storage(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore)
+{
+    CPUPPCState *env = &cpu->env;
+
+    trace_ppc_excp_isi(regs->msr, regs->nip);
+
+    regs->msr |= env->error_code;
+}
+
+void ppc_intr_external(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore)
+{
+    CPUState *cs = CPU(cpu);
+    CPUPPCState *env = &cpu->env;
+    bool lpes0;
+#if defined(TARGET_PPC64)
+    int excp_model = env->excp_model;
+#endif /* defined(TARGET_PPC64) */
+
+    /*
+     * Exception targeting modifiers
+     *
+     * LPES0 is supported on POWER7/8/9
+     * LPES1 is not supported (old iSeries mode)
+     *
+     * On anything else, we behave as if LPES0 is 1
+     * (externals don't alter MSR:HV)
+     */
+#if defined(TARGET_PPC64)
+    if (excp_model == POWERPC_EXCP_POWER7 ||
+        excp_model == POWERPC_EXCP_POWER8 ||
+        excp_model == POWERPC_EXCP_POWER9 ||
+        excp_model == POWERPC_EXCP_POWER10) {
+        lpes0 = !!(env->spr[SPR_LPCR] & LPCR_LPES0);
+    } else
+#endif /* defined(TARGET_PPC64) */
+    {
+        lpes0 = true;
+    }
+
+    if (!lpes0) {
+        regs->new_msr |= (target_ulong)MSR_HVB;
+        regs->new_msr |= env->msr & ((target_ulong)1 << MSR_RI);
+        regs->sprn_srr0 = SPR_HSRR0;
+        regs->sprn_srr1 = SPR_HSRR1;
+    }
+    if (env->mpic_proxy) {
+        /* IACK the IRQ on delivery */
+        env->spr[SPR_BOOKE_EPR] = ldl_phys(cs->as, env->mpic_iack);
+    }
+}
+
+void ppc_intr_alignment(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore)
+{
+    CPUPPCState *env = &cpu->env;
+
+    /* Get rS/rD and rA from faulting opcode */
+    /*
+     * Note: the opcode fields will not be set properly for a
+     * direct store load/store, but nobody cares as nobody
+     * actually uses direct store segments.
+     */
+    env->spr[SPR_DSISR] |= (env->error_code & 0x03FF0000) >> 16;
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
+static inline void dump_syscall(CPUPPCState *env)
+{
+    qemu_log_mask(CPU_LOG_INT, "syscall r0=%016" PRIx64
+                  " r3=%016" PRIx64 " r4=%016" PRIx64 " r5=%016" PRIx64
+                  " r6=%016" PRIx64 " r7=%016" PRIx64 " r8=%016" PRIx64
+                  " nip=" TARGET_FMT_lx "\n",
+                  ppc_dump_gpr(env, 0), ppc_dump_gpr(env, 3),
+                  ppc_dump_gpr(env, 4), ppc_dump_gpr(env, 5),
+                  ppc_dump_gpr(env, 6), ppc_dump_gpr(env, 7),
+                  ppc_dump_gpr(env, 8), env->nip);
+}
+
+static inline void dump_hcall(CPUPPCState *env)
+{
+    qemu_log_mask(CPU_LOG_INT, "hypercall r3=%016" PRIx64
+                  " r4=%016" PRIx64 " r5=%016" PRIx64 " r6=%016" PRIx64
+                  " r7=%016" PRIx64 " r8=%016" PRIx64 " r9=%016" PRIx64
+                  " r10=%016" PRIx64 " r11=%016" PRIx64 " r12=%016" PRIx64
+                  " nip=" TARGET_FMT_lx "\n",
+                  ppc_dump_gpr(env, 3), ppc_dump_gpr(env, 4),
+                  ppc_dump_gpr(env, 5), ppc_dump_gpr(env, 6),
+                  ppc_dump_gpr(env, 7), ppc_dump_gpr(env, 8),
+                  ppc_dump_gpr(env, 9), ppc_dump_gpr(env, 10),
+                  ppc_dump_gpr(env, 11), ppc_dump_gpr(env, 12),
+                  env->nip);
+}
+
+void ppc_intr_system_call(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore)
+{
+    CPUPPCState *env = &cpu->env;
+    int lev = env->error_code;
+
+    if ((lev == 1) && cpu->vhyp) {
+        dump_hcall(env);
+    } else {
+        dump_syscall(env);
+    }
+
+    /*
+     * We need to correct the NIP which in this case is supposed
+     * to point to the next instruction. We also set env->nip here
+     * because the modification needs to be accessible by the
+     * virtual hypervisor code below.
+     */
+    regs->nip += 4;
+    env->nip = regs->nip;
+
+    /* "PAPR mode" built-in hypercall emulation */
+    if ((lev == 1) && cpu->vhyp) {
+        PPCVirtualHypervisorClass *vhc =
+            PPC_VIRTUAL_HYPERVISOR_GET_CLASS(cpu->vhyp);
+        vhc->hypercall(cpu->vhyp, cpu);
+
+        *ignore = true;
+        return;
+    }
+
+    if (lev == 1) {
+        regs->new_msr |= (target_ulong)MSR_HVB;
+    }
+}
+
+void ppc_intr_system_call_vectored(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore)
+{
+    CPUPPCState *env = &cpu->env;
+    int lev = env->error_code;
+
+    dump_syscall(env);
+
+    regs->nip += 4;
+    regs->new_msr |= env->msr & ((target_ulong)1 << MSR_EE);
+    regs->new_msr |= env->msr & ((target_ulong)1 << MSR_RI);
+    regs->new_nip += lev * 0x20;
+
+    env->lr = regs->nip;
+    env->ctr = regs->msr;
+}
+
+void ppc_intr_fit(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore)
+{
+    /* FIT on 4xx */
+    trace_ppc_excp_print("FIT");
+};
+
+void ppc_intr_watchdog(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore)
+{
+    CPUPPCState *env = &cpu->env;
+    int excp_model = env->excp_model;
+
+    trace_ppc_excp_print("WDT");
+    switch (excp_model) {
+    case POWERPC_EXCP_BOOKE:
+        regs->sprn_srr0 = SPR_BOOKE_CSRR0;
+        regs->sprn_srr1 = SPR_BOOKE_CSRR1;
+        break;
+    default:
+        break;
+    }
+}
+
+void ppc_intr_debug(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore)
+{
+    CPUPPCState *env = &cpu->env;
+
+    if (env->flags & POWERPC_FLAG_DE) {
+        /* FIXME: choose one or the other based on CPU type */
+        regs->sprn_srr0 = SPR_BOOKE_DSRR0;
+        regs->sprn_srr1 = SPR_BOOKE_DSRR1;
+
+        env->spr[SPR_BOOKE_CSRR0] = regs->nip;
+        env->spr[SPR_BOOKE_CSRR1] = regs->msr;
+        /* DBSR already modified by caller */
+    } else {
+        cpu_abort(CPU(cpu), "Debug exception triggered on unsupported model\n");
+    }
+}
+
+void ppc_intr_spe_unavailable(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore)
+{
+    CPUPPCState *env = &cpu->env;
+
+    env->spr[SPR_BOOKE_ESR] = ESR_SPV;
+}
+
+void ppc_intr_embedded_fp_data(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore)
+{
+    CPUPPCState *env = &cpu->env;
+
+    /* XXX: TODO */
+    cpu_abort(CPU(cpu), "Embedded floating point data exception "
+              "is not implemented yet !\n");
+    env->spr[SPR_BOOKE_ESR] = ESR_SPV;
+}
+
+void ppc_intr_embedded_fp_round(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore)
+{
+    CPUPPCState *env = &cpu->env;
+
+    /* XXX: TODO */
+    cpu_abort(CPU(cpu), "Embedded floating point round exception "
+              "is not implemented yet !\n");
+    env->spr[SPR_BOOKE_ESR] = ESR_SPV;
+}
+
+void ppc_intr_embedded_perf_monitor(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore)
+{
+    /* XXX: TODO */
+    cpu_abort(CPU(cpu),
+              "Performance counter exception is not implemented yet !\n");
+}
+
+void ppc_intr_embedded_doorbell_crit(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore)
+{
+    regs->sprn_srr0 = SPR_BOOKE_CSRR0;
+    regs->sprn_srr1 = SPR_BOOKE_CSRR1;
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
+void ppc_intr_hv_insn_storage(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore)
+{
+    CPUPPCState *env = &cpu->env;
+
+    regs->msr |= env->error_code;
+
+    regs->sprn_srr0 = SPR_HSRR0;
+    regs->sprn_srr1 = SPR_HSRR1;
+    regs->new_msr |= (target_ulong)MSR_HVB;
+    regs->new_msr |= env->msr & ((target_ulong)1 << MSR_RI);
+}
+
+void ppc_intr_hv_decrementer(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore)
+{
+    CPUPPCState *env = &cpu->env;
+
+    regs->sprn_srr0 = SPR_HSRR0;
+    regs->sprn_srr1 = SPR_HSRR1;
+    regs->new_msr |= (target_ulong)MSR_HVB;
+    regs->new_msr |= env->msr & ((target_ulong)1 << MSR_RI);
+}
+
+void ppc_intr_hv_data_storage(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore)
+{
+    CPUPPCState *env = &cpu->env;
+
+    regs->sprn_srr0 = SPR_HSRR0;
+    regs->sprn_srr1 = SPR_HSRR1;
+    regs->new_msr |= (target_ulong)MSR_HVB;
+    regs->new_msr |= env->msr & ((target_ulong)1 << MSR_RI);
+}
+
+void ppc_intr_hv_data_segment(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore)
+{
+    CPUPPCState *env = &cpu->env;
+
+    regs->sprn_srr0 = SPR_HSRR0;
+    regs->sprn_srr1 = SPR_HSRR1;
+    regs->new_msr |= (target_ulong)MSR_HVB;
+    regs->new_msr |= env->msr & ((target_ulong)1 << MSR_RI);
+}
+
+void ppc_intr_hv_insn_segment(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore)
+{
+    CPUPPCState *env = &cpu->env;
+
+    regs->sprn_srr0 = SPR_HSRR0;
+    regs->sprn_srr1 = SPR_HSRR1;
+    regs->new_msr |= (target_ulong)MSR_HVB;
+    regs->new_msr |= env->msr & ((target_ulong)1 << MSR_RI);
+}
+
+void ppc_intr_hv_doorbell(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore)
+{
+    CPUPPCState *env = &cpu->env;
+
+    regs->sprn_srr0 = SPR_HSRR0;
+    regs->sprn_srr1 = SPR_HSRR1;
+    regs->new_msr |= (target_ulong)MSR_HVB;
+    regs->new_msr |= env->msr & ((target_ulong)1 << MSR_RI);
+}
+
+void ppc_intr_hv_emulation(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore)
+{
+    CPUPPCState *env = &cpu->env;
+
+    regs->sprn_srr0 = SPR_HSRR0;
+    regs->sprn_srr1 = SPR_HSRR1;
+    regs->new_msr |= (target_ulong)MSR_HVB;
+    regs->new_msr |= env->msr & ((target_ulong)1 << MSR_RI);
+}
+
+void ppc_intr_hv_virtualization(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore)
+{
+    CPUPPCState *env = &cpu->env;
+
+    regs->sprn_srr0 = SPR_HSRR0;
+    regs->sprn_srr1 = SPR_HSRR1;
+    regs->new_msr |= (target_ulong)MSR_HVB;
+    regs->new_msr |= env->msr & ((target_ulong)1 << MSR_RI);
+}
+
+void ppc_intr_facility_unavail(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore)
+{
+#ifdef TARGET_PPC64
+    CPUPPCState *env = &cpu->env;
+    env->spr[SPR_FSCR] |= ((target_ulong)env->error_code << 56);
+#endif
+}
+
+void ppc_intr_hv_facility_unavail(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore)
+{
+#ifdef TARGET_PPC64
+    CPUPPCState *env = &cpu->env;
+    env->spr[SPR_FSCR] |= ((target_ulong)env->error_code << FSCR_IC_POS);
+
+    regs->sprn_srr0 = SPR_HSRR0;
+    regs->sprn_srr1 = SPR_HSRR1;
+    regs->new_msr |= (target_ulong)MSR_HVB;
+    regs->new_msr |= env->msr & ((target_ulong)1 << MSR_RI);
+#endif
+}
+
+void ppc_intr_programmable_timer(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore)
+{
+    trace_ppc_excp_print("PIT");
+}
+
+void ppc_intr_io_error(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore)
+{
+    /* XXX: TODO */
+    cpu_abort(CPU(cpu), "601 IO error exception is not implemented yet !\n");
+}
+
+void ppc_intr_run_mode(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore)
+{
+    /* XXX: TODO */
+    cpu_abort(CPU(cpu), "601 run mode exception is not implemented yet !\n");
+}
+
+void ppc_intr_emulation(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore)
+{
+    /* XXX: TODO */
+    cpu_abort(CPU(cpu), "602 emulation trap exception is not implemented yet !\n");
+}
+
+void ppc_intr_tlb_miss(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore)
+{
+    CPUPPCState *env = &cpu->env;
+    int excp_model = env->excp_model;
+
+    switch (excp_model) {
+    case POWERPC_EXCP_602:
+    case POWERPC_EXCP_603:
+    case POWERPC_EXCP_G2:
+        /* Swap temporary saved registers with GPRs */
+        if (!(regs->new_msr & ((target_ulong)1 << MSR_TGPR))) {
+            regs->new_msr |= (target_ulong)1 << MSR_TGPR;
+            hreg_swap_gpr_tgpr(env);
+        }
+        /* fall through */
+    case POWERPC_EXCP_7x5:
+#if defined(DEBUG_SOFTWARE_TLB)
+        if (qemu_log_enabled()) {
+            const char *es;
+            target_ulong *miss, *cmp;
+            int en;
+
+            if (excp == POWERPC_EXCP_IFTLB) {
+                es = "I";
+                en = 'I';
+                miss = &env->spr[imiss_sprn];
+                cmp = &env->spr[icmp_sprn];
+            } else {
+                if (excp == POWERPC_EXCP_DLTLB) {
+                    es = "DL";
+                } else {
+                    es = "DS";
+                }
+                en = 'D';
+                miss = &env->spr[dmiss_sprn];
+                cmp = &env->spr[dcmp_srpn];
+            }
+
+            qemu_log("6xx %sTLB miss: %cM " TARGET_FMT_lx " %cC "
+                     TARGET_FMT_lx " H1 " TARGET_FMT_lx " H2 "
+                     TARGET_FMT_lx " %08x\n", es, en, *miss, en, *cmp,
+                     env->spr[SPR_HASH1], env->spr[SPR_HASH2],
+                     env->error_code);
+        }
+#endif
+        regs->msr |= env->crf[0] << 28;
+        regs->msr |= env->error_code; /* key, D/I, S/L bits */
+
+        /* Set way using a LRU mechanism */
+        regs->msr |= ((env->last_way + 1) & (env->nb_ways - 1)) << 17;
+
+        break;
+    default:
+        cpu_abort(CPU(cpu), "Invalid instruction TLB miss exception\n");
+        break;
+    }
+}
+
+void ppc_intr_fpa(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore)
+{
+    /* XXX: TODO */
+    cpu_abort(CPU(cpu), "Floating point assist exception "
+              "is not implemented yet !\n");
+}
+
+void ppc_intr_dabr(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore)
+{
+    /* XXX: TODO */
+    cpu_abort(CPU(cpu), "DABR exception is not implemented yet !\n");
+}
+
+void ppc_intr_iabr(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore)
+{
+    /* XXX: TODO */
+    cpu_abort(CPU(cpu), "IABR exception is not implemented yet !\n");
+}
+
+void ppc_intr_smi(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore)
+{
+    /* XXX: TODO */
+    cpu_abort(CPU(cpu), "SMI exception is not implemented yet !\n");
+}
+
+void ppc_intr_therm(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore)
+{
+    /* XXX: TODO */
+    cpu_abort(CPU(cpu), "Thermal management exception "
+              "is not implemented yet !\n");
+}
+
+void ppc_intr_perfm(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore)
+{
+    /* XXX: TODO */
+    cpu_abort(CPU(cpu),
+              "Performance counter exception is not implemented yet !\n");
+}
+
+void ppc_intr_vpua(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore)
+{
+    /* XXX: TODO */
+    cpu_abort(CPU(cpu), "VPU assist exception is not implemented yet !\n");
+}
+
+void ppc_intr_softp(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore)
+{
+    /* XXX: TODO */
+    cpu_abort(CPU(cpu),
+              "970 soft-patch exception is not implemented yet !\n");
+}
+
+void ppc_intr_maint(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore)
+{
+    /* XXX: TODO */
+    cpu_abort(CPU(cpu),
+              "970 maintenance exception is not implemented yet !\n");
+}
+
+void ppc_intr_mextbr(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore)
+{
+    /* XXX: TODO */
+    cpu_abort(CPU(cpu), "Maskable external exception "
+              "is not implemented yet !\n");
+}
+
+void ppc_intr_nmextbr(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore)
+{
+    /* XXX: TODO */
+    cpu_abort(CPU(cpu), "Non maskable external exception "
+              "is not implemented yet !\n");
+}
diff --git a/target/ppc/meson.build b/target/ppc/meson.build
index a49a8911e0..53b8e0a98e 100644
--- a/target/ppc/meson.build
+++ b/target/ppc/meson.build
@@ -39,6 +39,7 @@ ppc_softmmu_ss.add(files(
   'mmu-hash32.c',
   'mmu_common.c',
   'monitor.c',
+  'interrupts.c',
 ))
 ppc_softmmu_ss.add(when: 'CONFIG_TCG', if_true: files(
   'mmu_helper.c',
diff --git a/target/ppc/ppc_intr.h b/target/ppc/ppc_intr.h
new file mode 100644
index 0000000000..25c11710f9
--- /dev/null
+++ b/target/ppc/ppc_intr.h
@@ -0,0 +1,61 @@
+#ifndef PPC_INTR_H
+#define PPC_INTR_H
+
+typedef struct PPCIntrArgs PPCIntrArgs;
+
+struct PPCIntrArgs {
+    target_ulong nip;
+    target_ulong msr;
+    target_ulong new_nip;
+    target_ulong new_msr;
+    int sprn_srr0;
+    int sprn_srr1;
+};
+
+void ppc_intr_alignment(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore);
+void ppc_intr_critical(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore);
+void ppc_intr_dabr(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore);
+void ppc_intr_data_storage(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore);
+void ppc_intr_debug(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore);
+void ppc_intr_embedded_doorbell_crit(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore);
+void ppc_intr_embedded_fp_data(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore);
+void ppc_intr_embedded_fp_round(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore);
+void ppc_intr_embedded_perf_monitor(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore);
+void ppc_intr_emulation(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore);
+void ppc_intr_external(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore);
+void ppc_intr_facility_unavail(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore);
+void ppc_intr_fit(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore);
+void ppc_intr_fpa(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore);
+void ppc_intr_hv_data_segment(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore);
+void ppc_intr_hv_data_storage(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore);
+void ppc_intr_hv_decrementer(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore);
+void ppc_intr_hv_doorbell(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore);
+void ppc_intr_hv_emulation(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore);
+void ppc_intr_hv_facility_unavail(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore);
+void ppc_intr_hv_insn_segment(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore);
+void ppc_intr_hv_insn_storage(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore);
+void ppc_intr_hv_virtualization(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore);
+void ppc_intr_iabr(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore);
+void ppc_intr_insn_storage(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore);
+void ppc_intr_io_error(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore);
+void ppc_intr_machine_check(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore);
+void ppc_intr_maint(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore);
+void ppc_intr_mextbr(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore);
+void ppc_intr_nmextbr(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore);
+void ppc_intr_noop(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore);
+void ppc_intr_perfm(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore);
+void ppc_intr_program(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore);
+void ppc_intr_programmable_timer(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore);
+void ppc_intr_run_mode(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore);
+void ppc_intr_smi(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore);
+void ppc_intr_softp(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore);
+void ppc_intr_spe_unavailable(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore);
+void ppc_intr_system_call(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore);
+void ppc_intr_system_call_vectored(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore);
+void ppc_intr_system_reset(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore);
+void ppc_intr_therm(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore);
+void ppc_intr_tlb_miss(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore);
+void ppc_intr_vpua(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore);
+void ppc_intr_watchdog(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore);
+
+#endif /* PPC_INTR_H */
-- 
2.33.1


