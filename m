Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 919144C8D59
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 15:10:30 +0100 (CET)
Received: from localhost ([::1]:45222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nP3Cv-0007VL-Kl
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 09:10:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nP302-0006Oe-Da; Tue, 01 Mar 2022 08:57:17 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:52650)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nP2zw-00026G-Fq; Tue, 01 Mar 2022 08:57:07 -0500
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 221Dkd6W020120; 
 Tue, 1 Mar 2022 13:56:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=bzGJ7RpJudcH0P0onPCUTKODIoGHYz+yPiRo+5tA6lk=;
 b=AnPyv0pK0pfFG6OM91jWkn/rIm+hOgqtt2pljb/Uvxfwq4eiVh4ujCzQKP5n13n/eDKD
 eOZ6xiBiJl9Toz11FCX6b3sgehleZ/2Zeuk3Oxk6lhUIQ1w7p8LlmcAuQc6T9HETSoiE
 LLDEJ/qkJGCqUQ7UYudTmoaSE3+n6Z4fhXzXKeLrKT1+Lpg8t5haPKzSVo3jWPecEwo6
 ypOPIfdGJANec+dQzByyfdgSnbgef6cOw9qk0/rCInv9TfQ7ZBduf4shQRgfl9LigHjr
 aRhq4SojSSjsGOlSxavqPNWTkrnLtkOEKJ4xE4I8tQwIlI1YcMw1VNltTb0gHkquEcVx bw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ehmnyg7df-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Mar 2022 13:56:52 +0000
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 221DlpXF023401;
 Tue, 1 Mar 2022 13:56:52 GMT
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ehmnyg7cv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Mar 2022 13:56:52 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 221Du43q026024;
 Tue, 1 Mar 2022 13:56:51 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma02dal.us.ibm.com with ESMTP id 3efbuac5fc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Mar 2022 13:56:51 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 221Dun7c25821664
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 1 Mar 2022 13:56:50 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C415ABE04F;
 Tue,  1 Mar 2022 13:56:49 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4C861BE053;
 Tue,  1 Mar 2022 13:56:48 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.51.129])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue,  1 Mar 2022 13:56:48 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 11/17] target/ppc: Move powerpc_excp_40x into cpu_40x.c
Date: Tue,  1 Mar 2022 10:56:14 -0300
Message-Id: <20220301135620.2411952-12-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220301135620.2411952-1-farosas@linux.ibm.com>
References: <20220301135620.2411952-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: YNmMiV8kc6VKiUiijAa04Ij8jLDJlOq2
X-Proofpoint-ORIG-GUID: PnMdBF-iDpsSGpw4fg6XF71PNhHmd-Jg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-01_07,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0
 mlxlogscore=999 lowpriorityscore=0 bulkscore=0 spamscore=0 phishscore=0
 mlxscore=0 priorityscore=1501 suspectscore=0 impostorscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2203010074
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

This change along with the next few patches which move the
powerpc_excp_foo functions into the cpu_foo.c files has the following
purposes:

- Move the exception dispatching (powerpc_excp) closer to the
  exception vectors initialization (init_excp);

- Make it immediately clear which CPUs are affected by the exception
  dispatching code;

- Move code which is not a TCG helper out of excp_helpers.c. Aside
  from the obvious, this also helps with separation between TCG and
  KVM code; excp_helpers could be TCG-only (we're not quite there
  yet);

- We could start thinking about ways of simplifying the
  init_excp/powerpc_excp relationship since both users of the
  POWERPC_EXCP vector addresses are now in the same place.

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
---
 target/ppc/cpu.h         |   1 +
 target/ppc/cpu_40x.c     | 150 ++++++++++++++++++++++++++++++++++++++-
 target/ppc/excp_helper.c | 138 -----------------------------------
 3 files changed, 150 insertions(+), 139 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index c7bb10b0bf..ba3740ea92 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -179,6 +179,7 @@ const char *powerpc_excp_name(int excp);
 void powerpc_set_excp_state(PowerPCCPU *cpu,
                             target_ulong vector, target_ulong msr);
 void powerpc_reset_excp_state(PowerPCCPU *cpu);
+void powerpc_excp_40x(PowerPCCPU *cpu, int excp);
 
 #define PPC_INPUT(env) ((env)->bus_model)
 
diff --git a/target/ppc/cpu_40x.c b/target/ppc/cpu_40x.c
index 4ed2cbc305..4b7bbeb28c 100644
--- a/target/ppc/cpu_40x.c
+++ b/target/ppc/cpu_40x.c
@@ -1,5 +1,5 @@
 /*
- * CPU initialization for PowerPC 40x CPUs
+ * CPU initialization and exception dispatching for PowerPC 40x CPUs
  *
  *  Copyright IBM Corp. 2022
  *
@@ -8,9 +8,157 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/log.h"
 #include "hw/ppc/ppc.h"
 #include "cpu.h"
 #include "spr_common.h"
+#include "trace.h"
+#include "helper_regs.h"
+
+#if !defined(CONFIG_USER_ONLY)
+void powerpc_excp_40x(PowerPCCPU *cpu, int excp)
+{
+    CPUState *cs = CPU(cpu);
+    CPUPPCState *env = &cpu->env;
+    target_ulong msr, new_msr, vector;
+    int srr0, srr1;
+
+    /* new srr1 value excluding must-be-zero bits */
+    msr = env->msr & ~0x783f0000ULL;
+
+    /*
+     * new interrupt handler msr preserves existing ME unless
+     * explicitly overriden.
+     */
+    new_msr = env->msr & (((target_ulong)1 << MSR_ME));
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
+        srr0 = SPR_40x_SRR2;
+        srr1 = SPR_40x_SRR3;
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
+        srr0 = SPR_40x_SRR2;
+        srr1 = SPR_40x_SRR3;
+        break;
+    case POWERPC_EXCP_DSI:       /* Data storage exception                   */
+        trace_ppc_excp_dsi(env->spr[SPR_40x_ESR], env->spr[SPR_40x_DEAR]);
+        break;
+    case POWERPC_EXCP_ISI:       /* Instruction storage exception            */
+        trace_ppc_excp_isi(msr, env->nip);
+        break;
+    case POWERPC_EXCP_EXTERNAL:  /* External input                           */
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
+            env->spr[SPR_40x_ESR] = ESR_FP;
+            break;
+        case POWERPC_EXCP_INVAL:
+            trace_ppc_excp_inval(env->nip);
+            env->spr[SPR_40x_ESR] = ESR_PIL;
+            break;
+        case POWERPC_EXCP_PRIV:
+            env->spr[SPR_40x_ESR] = ESR_PPR;
+            break;
+        case POWERPC_EXCP_TRAP:
+            env->spr[SPR_40x_ESR] = ESR_PTR;
+            break;
+        default:
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
+    case POWERPC_EXCP_FIT:       /* Fixed-interval timer interrupt           */
+        trace_ppc_excp_print("FIT");
+        break;
+    case POWERPC_EXCP_WDT:       /* Watchdog timer interrupt                 */
+        trace_ppc_excp_print("WDT");
+        break;
+    case POWERPC_EXCP_DTLB:      /* Data TLB error                           */
+    case POWERPC_EXCP_ITLB:      /* Instruction TLB error                    */
+        break;
+    case POWERPC_EXCP_PIT:       /* Programmable interval timer interrupt    */
+        trace_ppc_excp_print("PIT");
+        break;
+    case POWERPC_EXCP_DEBUG:     /* Debug interrupt                          */
+        cpu_abort(cs, "%s exception not implemented\n",
+                  powerpc_excp_name(excp));
+        break;
+    default:
+        cpu_abort(cs, "Invalid PowerPC exception %d. Aborting\n", excp);
+        break;
+    }
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
+void powerpc_excp_40x(PowerPCCPU *cpu, int excp)
+{
+    g_assert_not_reached();
+}
+#endif
 
 /* SPR shared between PowerPC 40x implementations */
 static void register_40x_sprs(CPUPPCState *env)
diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index 07190d785a..3ae3f4cc45 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -376,144 +376,6 @@ void powerpc_set_excp_state(PowerPCCPU *cpu, target_ulong vector,
     env->reserve_addr = -1;
 }
 
-static void powerpc_excp_40x(PowerPCCPU *cpu, int excp)
-{
-    CPUState *cs = CPU(cpu);
-    CPUPPCState *env = &cpu->env;
-    target_ulong msr, new_msr, vector;
-    int srr0, srr1;
-
-    /* new srr1 value excluding must-be-zero bits */
-    msr = env->msr & ~0x783f0000ULL;
-
-    /*
-     * new interrupt handler msr preserves existing ME unless
-     * explicitly overriden.
-     */
-    new_msr = env->msr & (((target_ulong)1 << MSR_ME));
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
-        srr0 = SPR_40x_SRR2;
-        srr1 = SPR_40x_SRR3;
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
-        srr0 = SPR_40x_SRR2;
-        srr1 = SPR_40x_SRR3;
-        break;
-    case POWERPC_EXCP_DSI:       /* Data storage exception                   */
-        trace_ppc_excp_dsi(env->spr[SPR_40x_ESR], env->spr[SPR_40x_DEAR]);
-        break;
-    case POWERPC_EXCP_ISI:       /* Instruction storage exception            */
-        trace_ppc_excp_isi(msr, env->nip);
-        break;
-    case POWERPC_EXCP_EXTERNAL:  /* External input                           */
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
-            env->spr[SPR_40x_ESR] = ESR_FP;
-            break;
-        case POWERPC_EXCP_INVAL:
-            trace_ppc_excp_inval(env->nip);
-            env->spr[SPR_40x_ESR] = ESR_PIL;
-            break;
-        case POWERPC_EXCP_PRIV:
-            env->spr[SPR_40x_ESR] = ESR_PPR;
-            break;
-        case POWERPC_EXCP_TRAP:
-            env->spr[SPR_40x_ESR] = ESR_PTR;
-            break;
-        default:
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
-    case POWERPC_EXCP_FIT:       /* Fixed-interval timer interrupt           */
-        trace_ppc_excp_print("FIT");
-        break;
-    case POWERPC_EXCP_WDT:       /* Watchdog timer interrupt                 */
-        trace_ppc_excp_print("WDT");
-        break;
-    case POWERPC_EXCP_DTLB:      /* Data TLB error                           */
-    case POWERPC_EXCP_ITLB:      /* Instruction TLB error                    */
-        break;
-    case POWERPC_EXCP_PIT:       /* Programmable interval timer interrupt    */
-        trace_ppc_excp_print("PIT");
-        break;
-    case POWERPC_EXCP_DEBUG:     /* Debug interrupt                          */
-        cpu_abort(cs, "%s exception not implemented\n",
-                  powerpc_excp_name(excp));
-        break;
-    default:
-        cpu_abort(cs, "Invalid PowerPC exception %d. Aborting\n", excp);
-        break;
-    }
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
 static void powerpc_excp_6xx(PowerPCCPU *cpu, int excp)
 {
     CPUState *cs = CPU(cpu);
-- 
2.34.1


