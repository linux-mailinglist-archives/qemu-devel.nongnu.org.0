Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAA834C8D87
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 15:18:18 +0100 (CET)
Received: from localhost ([::1]:36386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nP3KT-0004F5-8B
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 09:18:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nP34t-0005xN-KR; Tue, 01 Mar 2022 09:02:11 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:11230
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nP34r-0003NL-6Q; Tue, 01 Mar 2022 09:02:11 -0500
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 221DDTMb013599; 
 Tue, 1 Mar 2022 13:56:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=PdUNWxrJWezfPBQxww7zx5EdB5hqXx8jt1rI1u68aCY=;
 b=DwPvRX86y3CQtHHnov4fDhcWDnVjgxLxOWBM3McNm/86ci9OeL2B0WMG8xIMKI4ed6/s
 YKWFdwhbli2aMNffVFVyNkuSdxQk36nFpvdAPpJLy5gvcokNNrKY3aIpprF7IzKzNmie
 g3cEVqOX60kUx0HoZhJ3InfDcG6/rBi09/U6sCAEmCqo3SpErneyq0QwixerKOjwlCn0
 SrSv5HlzSSrUp/wV/gyZC/VzT62Kf7DTbFZyFcpg4FscFLo6udKu9+DcMockR+jrsgSy
 Nnlm20m2a8izYgzLHQzUo0+y8fi8yD2JZL1vhi2CXSBihJstQyo9A96+PUNKxe+xiDvp HQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ehm6e0xx9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Mar 2022 13:56:54 +0000
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 221DFOSK017582;
 Tue, 1 Mar 2022 13:56:54 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ehm6e0xww-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Mar 2022 13:56:54 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 221DtTr8024028;
 Tue, 1 Mar 2022 13:56:53 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma01dal.us.ibm.com with ESMTP id 3efbuac6ns-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Mar 2022 13:56:53 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 221DupCv25821538
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 1 Mar 2022 13:56:51 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CA313BE04F;
 Tue,  1 Mar 2022 13:56:51 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3D65FBE056;
 Tue,  1 Mar 2022 13:56:50 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.51.129])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue,  1 Mar 2022 13:56:49 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 12/17] target/ppc: Move powerpc_excp_6xx into cpu_6xx.c
Date: Tue,  1 Mar 2022 10:56:15 -0300
Message-Id: <20220301135620.2411952-13-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220301135620.2411952-1-farosas@linux.ibm.com>
References: <20220301135620.2411952-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: G9HWk6-YEnS4Tcbn0TVEkP6yY-IOKgP3
X-Proofpoint-ORIG-GUID: 6Jxh3lTHCj2LlCs2xemdSuNJ9S7jqnWj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-01_07,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0
 mlxscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 adultscore=0
 mlxlogscore=637 impostorscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
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
 target/ppc/cpu.h         |   2 +
 target/ppc/cpu_6xx.c     | 188 ++++++++++++++++++++++++++++++++++++++-
 target/ppc/excp_helper.c | 177 +-----------------------------------
 3 files changed, 190 insertions(+), 177 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index ba3740ea92..1a5150f712 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -179,7 +179,9 @@ const char *powerpc_excp_name(int excp);
 void powerpc_set_excp_state(PowerPCCPU *cpu,
                             target_ulong vector, target_ulong msr);
 void powerpc_reset_excp_state(PowerPCCPU *cpu);
+void ppc_excp_debug_sw_tlb(CPUPPCState *env, int excp);
 void powerpc_excp_40x(PowerPCCPU *cpu, int excp);
+void powerpc_excp_6xx(PowerPCCPU *cpu, int excp);
 
 #define PPC_INPUT(env) ((env)->bus_model)
 
diff --git a/target/ppc/cpu_6xx.c b/target/ppc/cpu_6xx.c
index a909f79e87..b6a4909dbf 100644
--- a/target/ppc/cpu_6xx.c
+++ b/target/ppc/cpu_6xx.c
@@ -1,5 +1,5 @@
 /*
- * CPU initialization for PowerPC 6xx CPUs
+ * CPU initialization and exception dispatching for PowerPC 6xx CPUs
  *
  *  Copyright IBM Corp. 2022
  *
@@ -8,10 +8,14 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/log.h"
 #include "sysemu/hw_accel.h"
 #include "hw/ppc/ppc.h"
 #include "cpu.h"
 #include "spr_common.h"
+#include "trace.h"
+#include "helper_regs.h"
+
 
 static int check_pow_hid0(CPUPPCState *env)
 {
@@ -22,6 +26,188 @@ static int check_pow_hid0(CPUPPCState *env)
     return 0;
 }
 
+#if !defined(CONFIG_USER_ONLY)
+void powerpc_excp_6xx(PowerPCCPU *cpu, int excp)
+{
+    CPUState *cs = CPU(cpu);
+    CPUPPCState *env = &cpu->env;
+    target_ulong msr, new_msr, vector;
+
+    /* new srr1 value excluding must-be-zero bits */
+    msr = env->msr & ~0x783f0000ULL;
+
+    /*
+     * new interrupt handler msr preserves existing ME unless
+     * explicitly overriden
+     */
+    new_msr = env->msr & ((target_ulong)1 << MSR_ME);
+
+    /*
+     * Hypervisor emulation assistance interrupt only exists on server
+     * arch 2.05 server or later.
+     */
+    if (excp == POWERPC_EXCP_HV_EMU) {
+        excp = POWERPC_EXCP_PROGRAM;
+    }
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
+        break;
+    case POWERPC_EXCP_DSI:       /* Data storage exception                   */
+        trace_ppc_excp_dsi(env->spr[SPR_DSISR], env->spr[SPR_DAR]);
+        break;
+    case POWERPC_EXCP_ISI:       /* Instruction storage exception            */
+        trace_ppc_excp_isi(msr, env->nip);
+        msr |= env->error_code;
+        break;
+    case POWERPC_EXCP_EXTERNAL:  /* External input                           */
+        break;
+    case POWERPC_EXCP_ALIGN:     /* Alignment exception                      */
+        /* Get rS/rD and rA from faulting opcode */
+        /*
+         * Note: the opcode fields will not be set properly for a
+         * direct store load/store, but nobody cares as nobody
+         * actually uses direct store segments.
+         */
+        env->spr[SPR_DSISR] |= (env->error_code & 0x03FF0000) >> 16;
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
+            break;
+        case POWERPC_EXCP_INVAL:
+            trace_ppc_excp_inval(env->nip);
+            msr |= 0x00080000;
+            break;
+        case POWERPC_EXCP_PRIV:
+            msr |= 0x00040000;
+            break;
+        case POWERPC_EXCP_TRAP:
+            msr |= 0x00020000;
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
+    case POWERPC_EXCP_DECR:      /* Decrementer exception                    */
+        break;
+    case POWERPC_EXCP_DTLB:      /* Data TLB error                           */
+    case POWERPC_EXCP_ITLB:      /* Instruction TLB error                    */
+        break;
+    case POWERPC_EXCP_RESET:     /* System reset exception                   */
+        if (msr_pow) {
+            cpu_abort(cs, "Trying to deliver power-saving system reset "
+                      "exception %d with no HV support\n", excp);
+        }
+        break;
+    case POWERPC_EXCP_TRACE:     /* Trace exception                          */
+        break;
+    case POWERPC_EXCP_IFTLB:     /* Instruction fetch TLB error              */
+    case POWERPC_EXCP_DLTLB:     /* Data load TLB miss                       */
+    case POWERPC_EXCP_DSTLB:     /* Data store TLB miss                      */
+        /* Swap temporary saved registers with GPRs */
+        if (!(new_msr & ((target_ulong)1 << MSR_TGPR))) {
+            new_msr |= (target_ulong)1 << MSR_TGPR;
+            hreg_swap_gpr_tgpr(env);
+        }
+
+        ppc_excp_debug_sw_tlb(env, excp);
+
+        msr |= env->crf[0] << 28;
+        msr |= env->error_code; /* key, D/I, S/L bits */
+        /* Set way using a LRU mechanism */
+        msr |= ((env->last_way + 1) & (env->nb_ways - 1)) << 17;
+        break;
+    case POWERPC_EXCP_FPA:       /* Floating-point assist exception          */
+    case POWERPC_EXCP_DABR:      /* Data address breakpoint                  */
+    case POWERPC_EXCP_IABR:      /* Instruction address breakpoint           */
+    case POWERPC_EXCP_SMI:       /* System management interrupt              */
+    case POWERPC_EXCP_MEXTBR:    /* Maskable external breakpoint             */
+    case POWERPC_EXCP_NMEXTBR:   /* Non maskable external breakpoint         */
+        cpu_abort(cs, "%s exception not implemented\n",
+                  powerpc_excp_name(excp));
+        break;
+    default:
+        cpu_abort(cs, "Invalid PowerPC exception %d. Aborting\n", excp);
+        break;
+    }
+
+    /*
+     * Sort out endianness of interrupt, this differs depending on the
+     * CPU, the HV mode, etc...
+     */
+    if (ppc_interrupts_little_endian(cpu, !!(new_msr & MSR_HVB))) {
+        new_msr |= (target_ulong)1 << MSR_LE;
+    }
+
+    /* Save PC */
+    env->spr[SPR_SRR0] = env->nip;
+
+    /* Save MSR */
+    env->spr[SPR_SRR1] = msr;
+
+    powerpc_set_excp_state(cpu, vector, new_msr);
+}
+#else
+void powerpc_excp_6xx(PowerPCCPU *cpu, int excp)
+{
+    g_assert_not_reached();
+}
+#endif
+
 static void register_5xx_8xx_sprs(CPUPPCState *env)
 {
     /* Exception processing */
diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index 3ae3f4cc45..2cbd7be499 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -106,7 +106,7 @@ const char *powerpc_excp_name(int excp)
     }
 }
 
-static void ppc_excp_debug_sw_tlb(CPUPPCState *env, int excp)
+void ppc_excp_debug_sw_tlb(CPUPPCState *env, int excp)
 {
     const char *es;
     target_ulong *miss, *cmp;
@@ -376,181 +376,6 @@ void powerpc_set_excp_state(PowerPCCPU *cpu, target_ulong vector,
     env->reserve_addr = -1;
 }
 
-static void powerpc_excp_6xx(PowerPCCPU *cpu, int excp)
-{
-    CPUState *cs = CPU(cpu);
-    CPUPPCState *env = &cpu->env;
-    target_ulong msr, new_msr, vector;
-
-    /* new srr1 value excluding must-be-zero bits */
-    msr = env->msr & ~0x783f0000ULL;
-
-    /*
-     * new interrupt handler msr preserves existing ME unless
-     * explicitly overriden
-     */
-    new_msr = env->msr & ((target_ulong)1 << MSR_ME);
-
-    /*
-     * Hypervisor emulation assistance interrupt only exists on server
-     * arch 2.05 server or later.
-     */
-    if (excp == POWERPC_EXCP_HV_EMU) {
-        excp = POWERPC_EXCP_PROGRAM;
-    }
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
-        break;
-    case POWERPC_EXCP_DSI:       /* Data storage exception                   */
-        trace_ppc_excp_dsi(env->spr[SPR_DSISR], env->spr[SPR_DAR]);
-        break;
-    case POWERPC_EXCP_ISI:       /* Instruction storage exception            */
-        trace_ppc_excp_isi(msr, env->nip);
-        msr |= env->error_code;
-        break;
-    case POWERPC_EXCP_EXTERNAL:  /* External input                           */
-        break;
-    case POWERPC_EXCP_ALIGN:     /* Alignment exception                      */
-        /* Get rS/rD and rA from faulting opcode */
-        /*
-         * Note: the opcode fields will not be set properly for a
-         * direct store load/store, but nobody cares as nobody
-         * actually uses direct store segments.
-         */
-        env->spr[SPR_DSISR] |= (env->error_code & 0x03FF0000) >> 16;
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
-            break;
-        case POWERPC_EXCP_INVAL:
-            trace_ppc_excp_inval(env->nip);
-            msr |= 0x00080000;
-            break;
-        case POWERPC_EXCP_PRIV:
-            msr |= 0x00040000;
-            break;
-        case POWERPC_EXCP_TRAP:
-            msr |= 0x00020000;
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
-    case POWERPC_EXCP_DECR:      /* Decrementer exception                    */
-        break;
-    case POWERPC_EXCP_DTLB:      /* Data TLB error                           */
-    case POWERPC_EXCP_ITLB:      /* Instruction TLB error                    */
-        break;
-    case POWERPC_EXCP_RESET:     /* System reset exception                   */
-        if (msr_pow) {
-            cpu_abort(cs, "Trying to deliver power-saving system reset "
-                      "exception %d with no HV support\n", excp);
-        }
-        break;
-    case POWERPC_EXCP_TRACE:     /* Trace exception                          */
-        break;
-    case POWERPC_EXCP_IFTLB:     /* Instruction fetch TLB error              */
-    case POWERPC_EXCP_DLTLB:     /* Data load TLB miss                       */
-    case POWERPC_EXCP_DSTLB:     /* Data store TLB miss                      */
-        /* Swap temporary saved registers with GPRs */
-        if (!(new_msr & ((target_ulong)1 << MSR_TGPR))) {
-            new_msr |= (target_ulong)1 << MSR_TGPR;
-            hreg_swap_gpr_tgpr(env);
-        }
-
-        ppc_excp_debug_sw_tlb(env, excp);
-
-        msr |= env->crf[0] << 28;
-        msr |= env->error_code; /* key, D/I, S/L bits */
-        /* Set way using a LRU mechanism */
-        msr |= ((env->last_way + 1) & (env->nb_ways - 1)) << 17;
-        break;
-    case POWERPC_EXCP_FPA:       /* Floating-point assist exception          */
-    case POWERPC_EXCP_DABR:      /* Data address breakpoint                  */
-    case POWERPC_EXCP_IABR:      /* Instruction address breakpoint           */
-    case POWERPC_EXCP_SMI:       /* System management interrupt              */
-    case POWERPC_EXCP_MEXTBR:    /* Maskable external breakpoint             */
-    case POWERPC_EXCP_NMEXTBR:   /* Non maskable external breakpoint         */
-        cpu_abort(cs, "%s exception not implemented\n",
-                  powerpc_excp_name(excp));
-        break;
-    default:
-        cpu_abort(cs, "Invalid PowerPC exception %d. Aborting\n", excp);
-        break;
-    }
-
-    /*
-     * Sort out endianness of interrupt, this differs depending on the
-     * CPU, the HV mode, etc...
-     */
-    if (ppc_interrupts_little_endian(cpu, !!(new_msr & MSR_HVB))) {
-        new_msr |= (target_ulong)1 << MSR_LE;
-    }
-
-    /* Save PC */
-    env->spr[SPR_SRR0] = env->nip;
-
-    /* Save MSR */
-    env->spr[SPR_SRR1] = msr;
-
-    powerpc_set_excp_state(cpu, vector, new_msr);
-}
-
 static void powerpc_excp_7xx(PowerPCCPU *cpu, int excp)
 {
     CPUState *cs = CPU(cpu);
-- 
2.34.1


