Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D51634C8D70
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 15:13:42 +0100 (CET)
Received: from localhost ([::1]:53324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nP3G1-0004li-Qf
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 09:13:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nP30B-0006R1-7c; Tue, 01 Mar 2022 08:57:20 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:29150
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nP306-00027L-Ql; Tue, 01 Mar 2022 08:57:18 -0500
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 221DhEN1008109; 
 Tue, 1 Mar 2022 13:57:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=FaE2u7lu+7IDk8y5MUXVWeOleamhhRj4hXNYIrAGviE=;
 b=sfzMeGBJDNXpIDBUkKzzmCOCoZLQM1zrCLO/Ks6GzGuGASVblnHbDY6HiiKhl3Uc308b
 tXAT3KVTW1g5yFY83nuJzzL2DOhf7T82XJo6nEhEdYJzpTf+pJqBgU54Xkzp0u2ZAs0L
 wN6EMO50OcB8rrNmjAiX+KT5s6Bc4fzurokrOYpr2JDw2fInjM+yNf1dD0BQqoXrMbAr
 cgagNGSIXp84HH1eNMg8crxPOCGd73hrsXIqehfOrU1TWBCTsIRAh6csacjEWxtielnz
 viM3wzQ5dU3yb2h7hiUO3oB3iF14MvUzfwhrWWpL+ocVl6hPzosj42Bkj5j5jWUEtXsk fw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ehmmbg9mc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Mar 2022 13:56:59 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 221DlAwd025212;
 Tue, 1 Mar 2022 13:56:59 GMT
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ehmmbg9m6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Mar 2022 13:56:59 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 221Du5XH010415;
 Tue, 1 Mar 2022 13:56:58 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma05wdc.us.ibm.com with ESMTP id 3efbua50rv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Mar 2022 13:56:58 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 221DuvO422151432
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 1 Mar 2022 13:56:57 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 69909BE059;
 Tue,  1 Mar 2022 13:56:57 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E9918BE054;
 Tue,  1 Mar 2022 13:56:55 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.51.129])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue,  1 Mar 2022 13:56:55 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 15/17] target/ppc: Move powerpc_excp_booke into cpu_booke.c
Date: Tue,  1 Mar 2022 10:56:18 -0300
Message-Id: <20220301135620.2411952-16-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220301135620.2411952-1-farosas@linux.ibm.com>
References: <20220301135620.2411952-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Fm1RK6-dILovJKjGrKvfZqau3kSVfDsk
X-Proofpoint-ORIG-GUID: GHH5iYrEc2ge4h9XJfGNlCpnhGYoTLJA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-01_07,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 mlxlogscore=997
 impostorscore=0 spamscore=0 bulkscore=0 adultscore=0 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2203010074
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farosas@linux.ibm.com;
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

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
---
 target/ppc/cpu.h         |   1 +
 target/ppc/cpu_booke.c   | 216 ++++++++++++++++++++++++++++++++++++++-
 target/ppc/excp_helper.c | 204 ------------------------------------
 3 files changed, 216 insertions(+), 205 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 614a92954c..03ca593095 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -184,6 +184,7 @@ void powerpc_excp_40x(PowerPCCPU *cpu, int excp);
 void powerpc_excp_6xx(PowerPCCPU *cpu, int excp);
 void powerpc_excp_7xx(PowerPCCPU *cpu, int excp);
 void powerpc_excp_74xx(PowerPCCPU *cpu, int excp);
+void powerpc_excp_booke(PowerPCCPU *cpu, int excp);
 
 #define PPC_INPUT(env) ((env)->bus_model)
 
diff --git a/target/ppc/cpu_booke.c b/target/ppc/cpu_booke.c
index 18e16bd3bf..b73cfe224d 100644
--- a/target/ppc/cpu_booke.c
+++ b/target/ppc/cpu_booke.c
@@ -1,5 +1,5 @@
 /*
- * CPU initialization for PowerPC BookE CPUs
+ * CPU initialization and exception dispatching for PowerPC BookE CPUs
  *
  *  Copyright IBM Corp. 2022
  *
@@ -8,9 +8,12 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/log.h"
 #include "hw/ppc/ppc.h"
 #include "cpu.h"
 #include "spr_common.h"
+#include "trace.h"
+#include "helper_regs.h"
 
 static int check_pow_hid0(CPUPPCState *env)
 {
@@ -21,6 +24,217 @@ static int check_pow_hid0(CPUPPCState *env)
     return 0;
 }
 
+#if !defined(CONFIG_USER_ONLY)
+void powerpc_excp_booke(PowerPCCPU *cpu, int excp)
+{
+    CPUState *cs = CPU(cpu);
+    CPUPPCState *env = &cpu->env;
+    target_ulong msr, new_msr, vector;
+    int srr0, srr1;
+
+    msr = env->msr;
+
+    /*
+     * new interrupt handler msr preserves existing ME unless
+     * explicitly overriden
+     */
+    new_msr = env->msr & ((target_ulong)1 << MSR_ME);
+
+    /* target registers */
+    srr0 = SPR_SRR0;
+    srr1 = SPR_SRR1;
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
+    if (excp == POWERPC_EXCP_VPU) {
+        excp = POWERPC_EXCP_SPEU;
+    }
+#endif
+
+    vector = env->excp_vectors[excp];
+    if (vector == (target_ulong)-1ULL) {
+        cpu_abort(cs, "Raised an exception without defined vector %d\n",
+                  excp);
+    }
+
+    vector |= env->excp_prefix;
+
+    switch (excp) {
+    case POWERPC_EXCP_CRITICAL:    /* Critical input                         */
+        srr0 = SPR_BOOKE_CSRR0;
+        srr1 = SPR_BOOKE_CSRR1;
+        break;
+    case POWERPC_EXCP_MCHECK:    /* Machine check exception                  */
+        if (msr_me == 0) {
+            /*
+             * Machine check exception is not enabled.  Enter
+             * checkstop state.
+             */
+            fprintf(stderr, "Machine check while not allowed. "
+                    "Entering checkstop state\n");
+            if (qemu_log_separate()) {
+                qemu_log("Machine check while not allowed. "
+                        "Entering checkstop state\n");
+            }
+            cs->halted = 1;
+            cpu_interrupt_exittb(cs);
+        }
+
+        /* machine check exceptions don't have ME set */
+        new_msr &= ~((target_ulong)1 << MSR_ME);
+
+        /* FIXME: choose one or the other based on CPU type */
+        srr0 = SPR_BOOKE_MCSRR0;
+        srr1 = SPR_BOOKE_MCSRR1;
+
+        env->spr[SPR_BOOKE_CSRR0] = env->nip;
+        env->spr[SPR_BOOKE_CSRR1] = msr;
+
+        break;
+    case POWERPC_EXCP_DSI:       /* Data storage exception                   */
+        trace_ppc_excp_dsi(env->spr[SPR_BOOKE_ESR], env->spr[SPR_BOOKE_DEAR]);
+        break;
+    case POWERPC_EXCP_ISI:       /* Instruction storage exception            */
+        trace_ppc_excp_isi(msr, env->nip);
+        break;
+    case POWERPC_EXCP_EXTERNAL:  /* External input                           */
+        if (env->mpic_proxy) {
+            /* IACK the IRQ on delivery */
+            env->spr[SPR_BOOKE_EPR] = ldl_phys(cs->as, env->mpic_iack);
+        }
+        break;
+    case POWERPC_EXCP_ALIGN:     /* Alignment exception                      */
+        break;
+    case POWERPC_EXCP_PROGRAM:   /* Program exception                        */
+        switch (env->error_code & ~0xF) {
+        case POWERPC_EXCP_FP:
+            if ((msr_fe0 == 0 && msr_fe1 == 0) || msr_fp == 0) {
+                trace_ppc_excp_fp_ignore();
+                powerpc_reset_excp_state(cpu);
+                return;
+            }
+
+            /*
+             * FP exceptions always have NIP pointing to the faulting
+             * instruction, so always use store_next and claim we are
+             * precise in the MSR.
+             */
+            msr |= 0x00100000;
+            env->spr[SPR_BOOKE_ESR] = ESR_FP;
+            break;
+        case POWERPC_EXCP_INVAL:
+            trace_ppc_excp_inval(env->nip);
+            msr |= 0x00080000;
+            env->spr[SPR_BOOKE_ESR] = ESR_PIL;
+            break;
+        case POWERPC_EXCP_PRIV:
+            msr |= 0x00040000;
+            env->spr[SPR_BOOKE_ESR] = ESR_PPR;
+            break;
+        case POWERPC_EXCP_TRAP:
+            msr |= 0x00020000;
+            env->spr[SPR_BOOKE_ESR] = ESR_PTR;
+            break;
+        default:
+            /* Should never occur */
+            cpu_abort(cs, "Invalid program exception %d. Aborting\n",
+                      env->error_code);
+            break;
+        }
+        break;
+    case POWERPC_EXCP_SYSCALL:   /* System call exception                    */
+        trace_ppc_syscall(env, 0);
+
+        /*
+         * We need to correct the NIP which in this case is supposed
+         * to point to the next instruction
+         */
+        env->nip += 4;
+        break;
+    case POWERPC_EXCP_FPU:       /* Floating-point unavailable exception     */
+    case POWERPC_EXCP_APU:       /* Auxiliary processor unavailable          */
+    case POWERPC_EXCP_DECR:      /* Decrementer exception                    */
+        break;
+    case POWERPC_EXCP_FIT:       /* Fixed-interval timer interrupt           */
+        /* FIT on 4xx */
+        trace_ppc_excp_print("FIT");
+        break;
+    case POWERPC_EXCP_WDT:       /* Watchdog timer interrupt                 */
+        trace_ppc_excp_print("WDT");
+        srr0 = SPR_BOOKE_CSRR0;
+        srr1 = SPR_BOOKE_CSRR1;
+        break;
+    case POWERPC_EXCP_DTLB:      /* Data TLB error                           */
+    case POWERPC_EXCP_ITLB:      /* Instruction TLB error                    */
+        break;
+    case POWERPC_EXCP_DEBUG:     /* Debug interrupt                          */
+        if (env->flags & POWERPC_FLAG_DE) {
+            /* FIXME: choose one or the other based on CPU type */
+            srr0 = SPR_BOOKE_DSRR0;
+            srr1 = SPR_BOOKE_DSRR1;
+
+            env->spr[SPR_BOOKE_CSRR0] = env->nip;
+            env->spr[SPR_BOOKE_CSRR1] = msr;
+
+            /* DBSR already modified by caller */
+        } else {
+            cpu_abort(cs, "Debug exception triggered on unsupported model\n");
+        }
+        break;
+    case POWERPC_EXCP_SPEU:   /* SPE/embedded floating-point unavailable/VPU  */
+        env->spr[SPR_BOOKE_ESR] = ESR_SPV;
+        break;
+    case POWERPC_EXCP_RESET:     /* System reset exception                   */
+        if (msr_pow) {
+            cpu_abort(cs, "Trying to deliver power-saving system reset "
+                      "exception %d with no HV support\n", excp);
+        }
+        break;
+    case POWERPC_EXCP_EFPDI:     /* Embedded floating-point data interrupt   */
+    case POWERPC_EXCP_EFPRI:     /* Embedded floating-point round interrupt  */
+        cpu_abort(cs, "%s exception not implemented\n",
+                  powerpc_excp_name(excp));
+        break;
+    default:
+        cpu_abort(cs, "Invalid PowerPC exception %d. Aborting\n", excp);
+        break;
+    }
+
+#if defined(TARGET_PPC64)
+    if (env->spr[SPR_BOOKE_EPCR] & EPCR_ICM) {
+        /* Cat.64-bit: EPCR.ICM is copied to MSR.CM */
+        new_msr |= (target_ulong)1 << MSR_CM;
+    } else {
+        vector = (uint32_t)vector;
+    }
+#endif
+
+    /* Save PC */
+    env->spr[srr0] = env->nip;
+
+    /* Save MSR */
+    env->spr[srr1] = msr;
+
+    powerpc_set_excp_state(cpu, vector, new_msr);
+}
+#else
+void powerpc_excp_booke(PowerPCCPU *cpu, int excp)
+{
+    g_assert_not_reached();
+}
+#endif
+
 static void register_BookE_sprs(CPUPPCState *env, uint64_t ivor_mask)
 {
     const char *ivor_names[64] = {
diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index b2b8c991bf..a6a721d21c 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -376,210 +376,6 @@ void powerpc_set_excp_state(PowerPCCPU *cpu, target_ulong vector,
     env->reserve_addr = -1;
 }
 
-static void powerpc_excp_booke(PowerPCCPU *cpu, int excp)
-{
-    CPUState *cs = CPU(cpu);
-    CPUPPCState *env = &cpu->env;
-    target_ulong msr, new_msr, vector;
-    int srr0, srr1;
-
-    msr = env->msr;
-
-    /*
-     * new interrupt handler msr preserves existing ME unless
-     * explicitly overriden
-     */
-    new_msr = env->msr & ((target_ulong)1 << MSR_ME);
-
-    /* target registers */
-    srr0 = SPR_SRR0;
-    srr1 = SPR_SRR1;
-
-    /*
-     * Hypervisor emulation assistance interrupt only exists on server
-     * arch 2.05 server or later.
-     */
-    if (excp == POWERPC_EXCP_HV_EMU) {
-        excp = POWERPC_EXCP_PROGRAM;
-    }
-
-#ifdef TARGET_PPC64
-    /*
-     * SPEU and VPU share the same IVOR but they exist in different
-     * processors. SPEU is e500v1/2 only and VPU is e6500 only.
-     */
-    if (excp == POWERPC_EXCP_VPU) {
-        excp = POWERPC_EXCP_SPEU;
-    }
-#endif
-
-    vector = env->excp_vectors[excp];
-    if (vector == (target_ulong)-1ULL) {
-        cpu_abort(cs, "Raised an exception without defined vector %d\n",
-                  excp);
-    }
-
-    vector |= env->excp_prefix;
-
-    switch (excp) {
-    case POWERPC_EXCP_CRITICAL:    /* Critical input                         */
-        srr0 = SPR_BOOKE_CSRR0;
-        srr1 = SPR_BOOKE_CSRR1;
-        break;
-    case POWERPC_EXCP_MCHECK:    /* Machine check exception                  */
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
-
-        /* machine check exceptions don't have ME set */
-        new_msr &= ~((target_ulong)1 << MSR_ME);
-
-        /* FIXME: choose one or the other based on CPU type */
-        srr0 = SPR_BOOKE_MCSRR0;
-        srr1 = SPR_BOOKE_MCSRR1;
-
-        env->spr[SPR_BOOKE_CSRR0] = env->nip;
-        env->spr[SPR_BOOKE_CSRR1] = msr;
-
-        break;
-    case POWERPC_EXCP_DSI:       /* Data storage exception                   */
-        trace_ppc_excp_dsi(env->spr[SPR_BOOKE_ESR], env->spr[SPR_BOOKE_DEAR]);
-        break;
-    case POWERPC_EXCP_ISI:       /* Instruction storage exception            */
-        trace_ppc_excp_isi(msr, env->nip);
-        break;
-    case POWERPC_EXCP_EXTERNAL:  /* External input                           */
-        if (env->mpic_proxy) {
-            /* IACK the IRQ on delivery */
-            env->spr[SPR_BOOKE_EPR] = ldl_phys(cs->as, env->mpic_iack);
-        }
-        break;
-    case POWERPC_EXCP_ALIGN:     /* Alignment exception                      */
-        break;
-    case POWERPC_EXCP_PROGRAM:   /* Program exception                        */
-        switch (env->error_code & ~0xF) {
-        case POWERPC_EXCP_FP:
-            if ((msr_fe0 == 0 && msr_fe1 == 0) || msr_fp == 0) {
-                trace_ppc_excp_fp_ignore();
-                powerpc_reset_excp_state(cpu);
-                return;
-            }
-
-            /*
-             * FP exceptions always have NIP pointing to the faulting
-             * instruction, so always use store_next and claim we are
-             * precise in the MSR.
-             */
-            msr |= 0x00100000;
-            env->spr[SPR_BOOKE_ESR] = ESR_FP;
-            break;
-        case POWERPC_EXCP_INVAL:
-            trace_ppc_excp_inval(env->nip);
-            msr |= 0x00080000;
-            env->spr[SPR_BOOKE_ESR] = ESR_PIL;
-            break;
-        case POWERPC_EXCP_PRIV:
-            msr |= 0x00040000;
-            env->spr[SPR_BOOKE_ESR] = ESR_PPR;
-            break;
-        case POWERPC_EXCP_TRAP:
-            msr |= 0x00020000;
-            env->spr[SPR_BOOKE_ESR] = ESR_PTR;
-            break;
-        default:
-            /* Should never occur */
-            cpu_abort(cs, "Invalid program exception %d. Aborting\n",
-                      env->error_code);
-            break;
-        }
-        break;
-    case POWERPC_EXCP_SYSCALL:   /* System call exception                    */
-        trace_ppc_syscall(env, 0);
-
-        /*
-         * We need to correct the NIP which in this case is supposed
-         * to point to the next instruction
-         */
-        env->nip += 4;
-        break;
-    case POWERPC_EXCP_FPU:       /* Floating-point unavailable exception     */
-    case POWERPC_EXCP_APU:       /* Auxiliary processor unavailable          */
-    case POWERPC_EXCP_DECR:      /* Decrementer exception                    */
-        break;
-    case POWERPC_EXCP_FIT:       /* Fixed-interval timer interrupt           */
-        /* FIT on 4xx */
-        trace_ppc_excp_print("FIT");
-        break;
-    case POWERPC_EXCP_WDT:       /* Watchdog timer interrupt                 */
-        trace_ppc_excp_print("WDT");
-        srr0 = SPR_BOOKE_CSRR0;
-        srr1 = SPR_BOOKE_CSRR1;
-        break;
-    case POWERPC_EXCP_DTLB:      /* Data TLB error                           */
-    case POWERPC_EXCP_ITLB:      /* Instruction TLB error                    */
-        break;
-    case POWERPC_EXCP_DEBUG:     /* Debug interrupt                          */
-        if (env->flags & POWERPC_FLAG_DE) {
-            /* FIXME: choose one or the other based on CPU type */
-            srr0 = SPR_BOOKE_DSRR0;
-            srr1 = SPR_BOOKE_DSRR1;
-
-            env->spr[SPR_BOOKE_CSRR0] = env->nip;
-            env->spr[SPR_BOOKE_CSRR1] = msr;
-
-            /* DBSR already modified by caller */
-        } else {
-            cpu_abort(cs, "Debug exception triggered on unsupported model\n");
-        }
-        break;
-    case POWERPC_EXCP_SPEU:   /* SPE/embedded floating-point unavailable/VPU  */
-        env->spr[SPR_BOOKE_ESR] = ESR_SPV;
-        break;
-    case POWERPC_EXCP_RESET:     /* System reset exception                   */
-        if (msr_pow) {
-            cpu_abort(cs, "Trying to deliver power-saving system reset "
-                      "exception %d with no HV support\n", excp);
-        }
-        break;
-    case POWERPC_EXCP_EFPDI:     /* Embedded floating-point data interrupt   */
-    case POWERPC_EXCP_EFPRI:     /* Embedded floating-point round interrupt  */
-        cpu_abort(cs, "%s exception not implemented\n",
-                  powerpc_excp_name(excp));
-        break;
-    default:
-        cpu_abort(cs, "Invalid PowerPC exception %d. Aborting\n", excp);
-        break;
-    }
-
-#if defined(TARGET_PPC64)
-    if (env->spr[SPR_BOOKE_EPCR] & EPCR_ICM) {
-        /* Cat.64-bit: EPCR.ICM is copied to MSR.CM */
-        new_msr |= (target_ulong)1 << MSR_CM;
-    } else {
-        vector = (uint32_t)vector;
-    }
-#endif
-
-    /* Save PC */
-    env->spr[srr0] = env->nip;
-
-    /* Save MSR */
-    env->spr[srr1] = msr;
-
-    powerpc_set_excp_state(cpu, vector, new_msr);
-}
-
 /*
  * When running a nested HV guest under vhyp, external interrupts are
  * delivered as HVIRT.
-- 
2.34.1


