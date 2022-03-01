Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93DC04C8D5F
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 15:12:25 +0100 (CET)
Received: from localhost ([::1]:50266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nP3Em-0002hQ-LJ
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 09:12:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nP307-0006Oy-U2; Tue, 01 Mar 2022 08:57:17 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:52390
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nP302-00026p-EQ; Tue, 01 Mar 2022 08:57:13 -0500
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 221CpZ4D013912; 
 Tue, 1 Mar 2022 13:56:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=8Zs83GwgmPkgBsRA9eR7M9871igkOoflBfu+hTiv4Z4=;
 b=Lk0IDwiGkl8dry/C5oFeGKr0oVyoaNWXAwf1SpGl5UecqXIInxZwxYuyinzQJIQjmqjC
 QrMuIDjNNIYusuhY859tbmhbcxvQrM3cf8XNvBjzuNo8tnrCNc1CreCeD9YFrfqSMjLB
 Lxyx1POiviMAe7K8JWjNSM08a9gOJuRT0s+uBzNftnFu6+X5lDiUJXCzAOJYMO6YOSf2
 gAZHNQyuW3v/XU7B4lPpktgX7CRkANspW99DGWRBz+K1aSnQ+GgyNOSvatPufCU63UqV
 eXZGJWMQjaBDmkjyjsD7IKPyF2sKKdTTPK+/rFVH8MV6PmTX0l9HIhn/ZWH5QUD6KgQh Fg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ehkv5hgmf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Mar 2022 13:56:57 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 221DWSov025880;
 Tue, 1 Mar 2022 13:56:57 GMT
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ehkv5hgm1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Mar 2022 13:56:57 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 221DtVuc003473;
 Tue, 1 Mar 2022 13:56:56 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma01wdc.us.ibm.com with ESMTP id 3efbu9my9d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Mar 2022 13:56:56 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 221DutHJ27722058
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 1 Mar 2022 13:56:55 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 93056BE05D;
 Tue,  1 Mar 2022 13:56:55 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3014BBE053;
 Tue,  1 Mar 2022 13:56:54 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.51.129])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue,  1 Mar 2022 13:56:53 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 14/17] target/ppc: Move powerpc_excp_74xx into cpu_74xx.c
Date: Tue,  1 Mar 2022 10:56:17 -0300
Message-Id: <20220301135620.2411952-15-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220301135620.2411952-1-farosas@linux.ibm.com>
References: <20220301135620.2411952-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 1Y5yE9QXujzyNAIvuVdjw-Y269C1r1Me
X-Proofpoint-GUID: 3KhblOlkclsk9X0AVwxqZgbb2nIeetUa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-01_07,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 mlxscore=0 impostorscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 mlxlogscore=925
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
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
 target/ppc/cpu_74xx.c    | 185 ++++++++++++++++++++++++++++++++++++++-
 target/ppc/excp_helper.c | 173 ------------------------------------
 3 files changed, 185 insertions(+), 174 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 10920464ad..614a92954c 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -183,6 +183,7 @@ void ppc_excp_debug_sw_tlb(CPUPPCState *env, int excp);
 void powerpc_excp_40x(PowerPCCPU *cpu, int excp);
 void powerpc_excp_6xx(PowerPCCPU *cpu, int excp);
 void powerpc_excp_7xx(PowerPCCPU *cpu, int excp);
+void powerpc_excp_74xx(PowerPCCPU *cpu, int excp);
 
 #define PPC_INPUT(env) ((env)->bus_model)
 
diff --git a/target/ppc/cpu_74xx.c b/target/ppc/cpu_74xx.c
index cc530cc405..07715cadb5 100644
--- a/target/ppc/cpu_74xx.c
+++ b/target/ppc/cpu_74xx.c
@@ -1,5 +1,5 @@
 /*
- * CPU initialization for PowerPC 74xx CPUs
+ * CPU initialization and exception dispatching for PowerPC 74xx CPUs
  *
  *  Copyright IBM Corp. 2022
  *
@@ -8,11 +8,14 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/log.h"
 #include "sysemu/hw_accel.h"
 #include "hw/ppc/ppc.h"
 #include "fpu/softfloat.h"
 #include "cpu.h"
 #include "spr_common.h"
+#include "trace.h"
+#include "helper_regs.h"
 
 static int check_pow_hid0(CPUPPCState *env)
 {
@@ -32,6 +35,186 @@ static int check_pow_hid0_74xx(CPUPPCState *env)
     return 0;
 }
 
+#if !defined(CONFIG_USER_ONLY)
+void powerpc_excp_74xx(PowerPCCPU *cpu, int excp)
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
+         * uses VOF and the 74xx CPUs, so although the 74xx don't have
+         * HV mode, we need to keep hypercall support.
+         */
+        if ((lev == 1) && cpu->vhyp) {
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
+    case POWERPC_EXCP_VPU:       /* Vector unavailable exception             */
+        break;
+    case POWERPC_EXCP_IABR:      /* Instruction address breakpoint           */
+    case POWERPC_EXCP_SMI:       /* System management interrupt              */
+    case POWERPC_EXCP_THERM:     /* Thermal interrupt                        */
+    case POWERPC_EXCP_PERFM:     /* Embedded performance monitor interrupt   */
+    case POWERPC_EXCP_VPUA:      /* Vector assist exception                  */
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
+void powerpc_excp_74xx(PowerPCCPU *cpu, int excp)
+{
+    g_assert_not_reached();
+}
+#endif
+
 static inline void vscr_init(CPUPPCState *env, uint32_t val)
 {
     /* Altivec always uses round-to-nearest */
diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index 1306dcedcf..b2b8c991bf 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -376,179 +376,6 @@ void powerpc_set_excp_state(PowerPCCPU *cpu, target_ulong vector,
     env->reserve_addr = -1;
 }
 
-static void powerpc_excp_74xx(PowerPCCPU *cpu, int excp)
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
-         * uses VOF and the 74xx CPUs, so although the 74xx don't have
-         * HV mode, we need to keep hypercall support.
-         */
-        if ((lev == 1) && cpu->vhyp) {
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
-    case POWERPC_EXCP_VPU:       /* Vector unavailable exception             */
-        break;
-    case POWERPC_EXCP_IABR:      /* Instruction address breakpoint           */
-    case POWERPC_EXCP_SMI:       /* System management interrupt              */
-    case POWERPC_EXCP_THERM:     /* Thermal interrupt                        */
-    case POWERPC_EXCP_PERFM:     /* Embedded performance monitor interrupt   */
-    case POWERPC_EXCP_VPUA:      /* Vector assist exception                  */
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
 static void powerpc_excp_booke(PowerPCCPU *cpu, int excp)
 {
     CPUState *cs = CPU(cpu);
-- 
2.34.1


