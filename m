Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B5C94C8D79
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 15:15:05 +0100 (CET)
Received: from localhost ([::1]:56748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nP3HM-00079K-At
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 09:15:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nP2zw-0006KA-Sc; Tue, 01 Mar 2022 08:57:04 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:46484)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nP2zu-00025x-BN; Tue, 01 Mar 2022 08:57:04 -0500
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 221DlX9l002459; 
 Tue, 1 Mar 2022 13:56:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=neJTrP27U39KKV3x/kRwWVk2u76aQVFbMe2ZcFg9wyk=;
 b=HWZRa39woKai8zI52b325PqffIh1XotnaaQR7GoZvAbhOs30kXGBKhJZfQn9+RWOTUXm
 oyzDw0pObu+szjr+e0hYvEIR8RLkVH/Sz1cR6s/gKxcWqXVmreKWRR9nFPPhSnlBOcBY
 uXVrMJ8WHtyutAa1wTQB9m6BmSuqTrs9Nd8E6futh+6iYZNjRXeC9Ua5CLQeCv3M6cwU
 DxTEMLRfKFrFVPInVoIIU5B0oRMm+UyBM+Ix+rKHCSdbxfXKnd2ahNNH4Qzw6Bd/a5GL
 Z5Tyk+wAS511F0oM/SxVmK5VawDcardHXeKHtQH8MlHhAZhUxMC5MtBaZiGulSzUvUXF ug== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ehgc6phkq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Mar 2022 13:56:56 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 221DJmb7025741;
 Tue, 1 Mar 2022 13:56:56 GMT
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ehgc6phk6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Mar 2022 13:56:56 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 221Du5XE010415;
 Tue, 1 Mar 2022 13:56:54 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma05wdc.us.ibm.com with ESMTP id 3efbua50rh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Mar 2022 13:56:54 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 221DurxT17040002
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 1 Mar 2022 13:56:53 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BD431BE053;
 Tue,  1 Mar 2022 13:56:53 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 304DDBE056;
 Tue,  1 Mar 2022 13:56:52 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.51.129])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue,  1 Mar 2022 13:56:51 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 13/17] target/ppc: Move powerpc_excp_7xx into cpu_7xx.c
Date: Tue,  1 Mar 2022 10:56:16 -0300
Message-Id: <20220301135620.2411952-14-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220301135620.2411952-1-farosas@linux.ibm.com>
References: <20220301135620.2411952-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Txk4oWsPROBP6t-IfVToxB_CO8RiaRdm
X-Proofpoint-ORIG-GUID: HKfBFqVWbpcIhhN9eB3oh2E8FWen5HUJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-01_07,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=906
 spamscore=0 malwarescore=0 impostorscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2203010074
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

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
---
 target/ppc/cpu.h         |   1 +
 target/ppc/cpu_7xx.c     | 193 ++++++++++++++++++++++++++++++++++++++-
 target/ppc/excp_helper.c | 181 ------------------------------------
 3 files changed, 193 insertions(+), 182 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 1a5150f712..10920464ad 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -182,6 +182,7 @@ void powerpc_reset_excp_state(PowerPCCPU *cpu);
 void ppc_excp_debug_sw_tlb(CPUPPCState *env, int excp);
 void powerpc_excp_40x(PowerPCCPU *cpu, int excp);
 void powerpc_excp_6xx(PowerPCCPU *cpu, int excp);
+void powerpc_excp_7xx(PowerPCCPU *cpu, int excp);
 
 #define PPC_INPUT(env) ((env)->bus_model)
 
diff --git a/target/ppc/cpu_7xx.c b/target/ppc/cpu_7xx.c
index 423f4cb97a..6f99521aba 100644
--- a/target/ppc/cpu_7xx.c
+++ b/target/ppc/cpu_7xx.c
@@ -1,5 +1,5 @@
 /*
- * CPU initialization for PowerPC 7xx CPUs
+ * CPU initialization and exception dispatching for PowerPC 7xx CPUs
  *
  *  Copyright IBM Corp. 2022
  *
@@ -8,10 +8,201 @@
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
+#if !defined(CONFIG_USER_ONLY)
+void powerpc_excp_7xx(PowerPCCPU *cpu, int excp)
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
+    {
+        int lev = env->error_code;
+
+        trace_ppc_syscall(env, lev);
+
+        /*
+         * We need to correct the NIP which in this case is supposed
+         * to point to the next instruction
+         */
+        env->nip += 4;
+
+        /*
+         * The Virtual Open Firmware (VOF) relies on the 'sc 1'
+         * instruction to communicate with QEMU. The pegasos2 machine
+         * uses VOF and the 7xx CPUs, so although the 7xx don't have
+         * HV mode, we need to keep hypercall support.
+         */
+        if (lev == 1 && cpu->vhyp) {
+            PPCVirtualHypervisorClass *vhc =
+                PPC_VIRTUAL_HYPERVISOR_GET_CLASS(cpu->vhyp);
+            vhc->hypercall(cpu->vhyp, cpu);
+            return;
+        }
+
+        break;
+    }
+    case POWERPC_EXCP_FPU:       /* Floating-point unavailable exception     */
+    case POWERPC_EXCP_DECR:      /* Decrementer exception                    */
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
+        ppc_excp_debug_sw_tlb(env, excp);
+
+        msr |= env->crf[0] << 28;
+        msr |= env->error_code; /* key, D/I, S/L bits */
+        /* Set way using a LRU mechanism */
+        msr |= ((env->last_way + 1) & (env->nb_ways - 1)) << 17;
+
+        break;
+    case POWERPC_EXCP_IABR:      /* Instruction address breakpoint           */
+    case POWERPC_EXCP_SMI:       /* System management interrupt              */
+    case POWERPC_EXCP_THERM:     /* Thermal interrupt                        */
+    case POWERPC_EXCP_PERFM:     /* Embedded performance monitor interrupt   */
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
+void powerpc_excp_7xx(PowerPCCPU *cpu, int excp)
+{
+    g_assert_not_reached();
+}
+#endif
 
 static int check_pow_hid0(CPUPPCState *env)
 {
diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index 2cbd7be499..1306dcedcf 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -376,187 +376,6 @@ void powerpc_set_excp_state(PowerPCCPU *cpu, target_ulong vector,
     env->reserve_addr = -1;
 }
 
-static void powerpc_excp_7xx(PowerPCCPU *cpu, int excp)
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
-    {
-        int lev = env->error_code;
-
-        trace_ppc_syscall(env, lev);
-
-        /*
-         * We need to correct the NIP which in this case is supposed
-         * to point to the next instruction
-         */
-        env->nip += 4;
-
-        /*
-         * The Virtual Open Firmware (VOF) relies on the 'sc 1'
-         * instruction to communicate with QEMU. The pegasos2 machine
-         * uses VOF and the 7xx CPUs, so although the 7xx don't have
-         * HV mode, we need to keep hypercall support.
-         */
-        if (lev == 1 && cpu->vhyp) {
-            PPCVirtualHypervisorClass *vhc =
-                PPC_VIRTUAL_HYPERVISOR_GET_CLASS(cpu->vhyp);
-            vhc->hypercall(cpu->vhyp, cpu);
-            return;
-        }
-
-        break;
-    }
-    case POWERPC_EXCP_FPU:       /* Floating-point unavailable exception     */
-    case POWERPC_EXCP_DECR:      /* Decrementer exception                    */
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
-        ppc_excp_debug_sw_tlb(env, excp);
-
-        msr |= env->crf[0] << 28;
-        msr |= env->error_code; /* key, D/I, S/L bits */
-        /* Set way using a LRU mechanism */
-        msr |= ((env->last_way + 1) & (env->nb_ways - 1)) << 17;
-
-        break;
-    case POWERPC_EXCP_IABR:      /* Instruction address breakpoint           */
-    case POWERPC_EXCP_SMI:       /* System management interrupt              */
-    case POWERPC_EXCP_THERM:     /* Thermal interrupt                        */
-    case POWERPC_EXCP_PERFM:     /* Embedded performance monitor interrupt   */
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
 static void powerpc_excp_74xx(PowerPCCPU *cpu, int excp)
 {
     CPUState *cs = CPU(cpu);
-- 
2.34.1


