Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C63984C8D93
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 15:22:45 +0100 (CET)
Received: from localhost ([::1]:42798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nP3Oj-0000I8-E9
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 09:22:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nP352-0006Lr-UF; Tue, 01 Mar 2022 09:02:21 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:56968
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nP34v-0003Nw-9S; Tue, 01 Mar 2022 09:02:20 -0500
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 221DDXj1013717; 
 Tue, 1 Mar 2022 13:57:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=R4Mkt5Ckuf/Le2nfFwzHs7Ar5I1iszuun5XjvFXoiDE=;
 b=IY0EswkhFHbMdHdho7pvcAoqaJ7WNBDN06OB61MEClnJXPoQEUn7gOts2XHp5l9hjF4Q
 aMF+0Ey/zrUDc6ZUAhNmYnfhUgJvAvvrayzXgDOjSwE+ZFm+MUnJNcTFBr/8lEX9EEjd
 eWDjYBW7wshzyNMfsxLr+fnzO187wmgvmEvjftFdOVKyngIMgSErM5wf7YTReEILuA6Y
 PgbriLnDkW+ZijcqlcJcIiatAcko1tqpPXheqXZ/KAu7FR3aqCCfkFSVUK9sRRlTZR3F
 Gu3SD3NPnMpXfLdx7Ii3rU+SSSqhZLI46SBXANNY9h+TSKldGfN+mHoMEMUqJq/tsSH3 Qg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ehm6e0y0q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Mar 2022 13:57:01 +0000
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 221DEDfM015330;
 Tue, 1 Mar 2022 13:57:00 GMT
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ehm6e0y0d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Mar 2022 13:57:00 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 221DtU0b030890;
 Tue, 1 Mar 2022 13:57:00 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma03wdc.us.ibm.com with ESMTP id 3efbu9w14p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Mar 2022 13:57:00 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 221DuxJ825821628
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 1 Mar 2022 13:56:59 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 40C87BE054;
 Tue,  1 Mar 2022 13:56:59 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CCD3CBE053;
 Tue,  1 Mar 2022 13:56:57 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.51.129])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue,  1 Mar 2022 13:56:57 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 16/17] target/ppc: Move powerpc_excp_books into cpu_books.c
Date: Tue,  1 Mar 2022 10:56:19 -0300
Message-Id: <20220301135620.2411952-17-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220301135620.2411952-1-farosas@linux.ibm.com>
References: <20220301135620.2411952-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: LLWTuzrYlwsBcb3uac7RWsAojVnWfTED
X-Proofpoint-ORIG-GUID: HdE0HktzuhmaPA-unjTN8ocLTf1CuJCm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-01_07,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0
 mlxscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 adultscore=0
 mlxlogscore=999 impostorscore=0 phishscore=0 clxscore=1015
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

Take powerpc_reset_wakeup and ppc_excp_apply_ail along because these
are specific to BookS as well.

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
---
 target/ppc/cpu.h         |   1 +
 target/ppc/cpu_books.c   | 525 +++++++++++++++++++++++++++++++++++++-
 target/ppc/excp_helper.c | 531 +--------------------------------------
 3 files changed, 527 insertions(+), 530 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 03ca593095..30d06d2ef2 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -185,6 +185,7 @@ void powerpc_excp_6xx(PowerPCCPU *cpu, int excp);
 void powerpc_excp_7xx(PowerPCCPU *cpu, int excp);
 void powerpc_excp_74xx(PowerPCCPU *cpu, int excp);
 void powerpc_excp_booke(PowerPCCPU *cpu, int excp);
+void powerpc_excp_books(PowerPCCPU *cpu, int excp);
 
 #define PPC_INPUT(env) ((env)->bus_model)
 
diff --git a/target/ppc/cpu_books.c b/target/ppc/cpu_books.c
index 01943140a3..e776ededda 100644
--- a/target/ppc/cpu_books.c
+++ b/target/ppc/cpu_books.c
@@ -1,5 +1,5 @@
 /*
- * CPU initialization for PowerPC BookS CPUs
+ * CPU initialization and exception dispatching for PowerPC BookS CPUs
  *
  *  Copyright IBM Corp. 2022
  *
@@ -8,6 +8,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/log.h"
 #include "sysemu/hw_accel.h"
 #include "sysemu/tcg.h"
 #include "hw/ppc/ppc.h"
@@ -17,6 +18,8 @@
 #include "power8-pmu.h"
 #include "cpu-models.h"
 #include "mmu-hash64.h"
+#include "trace.h"
+#include "helper_regs.h"
 
 #if defined(CONFIG_USER_ONLY)
 #define POWERPC970_HID5_INIT 0x00000080
@@ -24,6 +27,526 @@
 #define POWERPC970_HID5_INIT 0x00000000
 
 
+static int powerpc_reset_wakeup(CPUState *cs, CPUPPCState *env, int excp,
+                                target_ulong *msr)
+{
+    /* We no longer are in a PM state */
+    env->resume_as_sreset = false;
+
+    /* Pretend to be returning from doze always as we don't lose state */
+    *msr |= SRR1_WS_NOLOSS;
+
+    /* Machine checks are sent normally */
+    if (excp == POWERPC_EXCP_MCHECK) {
+        return excp;
+    }
+    switch (excp) {
+    case POWERPC_EXCP_RESET:
+        *msr |= SRR1_WAKERESET;
+        break;
+    case POWERPC_EXCP_EXTERNAL:
+        *msr |= SRR1_WAKEEE;
+        break;
+    case POWERPC_EXCP_DECR:
+        *msr |= SRR1_WAKEDEC;
+        break;
+    case POWERPC_EXCP_SDOOR:
+        *msr |= SRR1_WAKEDBELL;
+        break;
+    case POWERPC_EXCP_SDOOR_HV:
+        *msr |= SRR1_WAKEHDBELL;
+        break;
+    case POWERPC_EXCP_HV_MAINT:
+        *msr |= SRR1_WAKEHMI;
+        break;
+    case POWERPC_EXCP_HVIRT:
+        *msr |= SRR1_WAKEHVI;
+        break;
+    default:
+        cpu_abort(cs, "Unsupported exception %d in Power Save mode\n",
+                  excp);
+    }
+    return POWERPC_EXCP_RESET;
+}
+
+/*
+ * AIL - Alternate Interrupt Location, a mode that allows interrupts to be
+ * taken with the MMU on, and which uses an alternate location (e.g., so the
+ * kernel/hv can map the vectors there with an effective address).
+ *
+ * An interrupt is considered to be taken "with AIL" or "AIL applies" if they
+ * are delivered in this way. AIL requires the LPCR to be set to enable this
+ * mode, and then a number of conditions have to be true for AIL to apply.
+ *
+ * First of all, SRESET, MCE, and HMI are always delivered without AIL, because
+ * they specifically want to be in real mode (e.g., the MCE might be signaling
+ * a SLB multi-hit which requires SLB flush before the MMU can be enabled).
+ *
+ * After that, behaviour depends on the current MSR[IR], MSR[DR], MSR[HV],
+ * whether or not the interrupt changes MSR[HV] from 0 to 1, and the current
+ * radix mode (LPCR[HR]).
+ *
+ * POWER8, POWER9 with LPCR[HR]=0
+ * | LPCR[AIL] | MSR[IR||DR] | MSR[HV] | new MSR[HV] | AIL |
+ * +-----------+-------------+---------+-------------+-----+
+ * | a         | 00/01/10    | x       | x           | 0   |
+ * | a         | 11          | 0       | 1           | 0   |
+ * | a         | 11          | 1       | 1           | a   |
+ * | a         | 11          | 0       | 0           | a   |
+ * +-------------------------------------------------------+
+ *
+ * POWER9 with LPCR[HR]=1
+ * | LPCR[AIL] | MSR[IR||DR] | MSR[HV] | new MSR[HV] | AIL |
+ * +-----------+-------------+---------+-------------+-----+
+ * | a         | 00/01/10    | x       | x           | 0   |
+ * | a         | 11          | x       | x           | a   |
+ * +-------------------------------------------------------+
+ *
+ * The difference with POWER9 being that MSR[HV] 0->1 interrupts can be sent to
+ * the hypervisor in AIL mode if the guest is radix. This is good for
+ * performance but allows the guest to influence the AIL of hypervisor
+ * interrupts using its MSR, and also the hypervisor must disallow guest
+ * interrupts (MSR[HV] 0->0) from using AIL if the hypervisor does not want to
+ * use AIL for its MSR[HV] 0->1 interrupts.
+ *
+ * POWER10 addresses those issues with a new LPCR[HAIL] bit that is applied to
+ * interrupts that begin execution with MSR[HV]=1 (so both MSR[HV] 0->1 and
+ * MSR[HV] 1->1).
+ *
+ * HAIL=1 is equivalent to AIL=3, for interrupts delivered with MSR[HV]=1.
+ *
+ * POWER10 behaviour is
+ * | LPCR[AIL] | LPCR[HAIL] | MSR[IR||DR] | MSR[HV] | new MSR[HV] | AIL |
+ * +-----------+------------+-------------+---------+-------------+-----+
+ * | a         | h          | 00/01/10    | 0       | 0           | 0   |
+ * | a         | h          | 11          | 0       | 0           | a   |
+ * | a         | h          | x           | 0       | 1           | h   |
+ * | a         | h          | 00/01/10    | 1       | 1           | 0   |
+ * | a         | h          | 11          | 1       | 1           | h   |
+ * +--------------------------------------------------------------------+
+ */
+static void ppc_excp_apply_ail(PowerPCCPU *cpu, int excp, target_ulong msr,
+                               target_ulong *new_msr, target_ulong *vector)
+{
+    PowerPCCPUClass *pcc = POWERPC_CPU_GET_CLASS(cpu);
+    CPUPPCState *env = &cpu->env;
+    bool mmu_all_on = ((msr >> MSR_IR) & 1) && ((msr >> MSR_DR) & 1);
+    bool hv_escalation = !(msr & MSR_HVB) && (*new_msr & MSR_HVB);
+    int ail = 0;
+
+    if (excp == POWERPC_EXCP_MCHECK ||
+        excp == POWERPC_EXCP_RESET ||
+        excp == POWERPC_EXCP_HV_MAINT) {
+        /* SRESET, MCE, HMI never apply AIL */
+        return;
+    }
+
+    if (!(pcc->lpcr_mask & LPCR_AIL)) {
+        /* This CPU does not have AIL */
+        return;
+    }
+
+    /* P8 & P9 */
+    if (!(pcc->lpcr_mask & LPCR_HAIL)) {
+        if (!mmu_all_on) {
+            /* AIL only works if MSR[IR] and MSR[DR] are both enabled. */
+            return;
+        }
+        if (hv_escalation && !(env->spr[SPR_LPCR] & LPCR_HR)) {
+            /*
+             * AIL does not work if there is a MSR[HV] 0->1 transition and the
+             * partition is in HPT mode. For radix guests, such interrupts are
+             * allowed to be delivered to the hypervisor in ail mode.
+             */
+            return;
+        }
+
+        ail = (env->spr[SPR_LPCR] & LPCR_AIL) >> LPCR_AIL_SHIFT;
+        if (ail == 0) {
+            return;
+        }
+        if (ail == 1) {
+            /* AIL=1 is reserved, treat it like AIL=0 */
+            return;
+        }
+
+    /* P10 and up */
+    } else {
+        if (!mmu_all_on && !hv_escalation) {
+            /*
+             * AIL works for HV interrupts even with guest MSR[IR/DR] disabled.
+             * Guest->guest and HV->HV interrupts do require MMU on.
+             */
+            return;
+        }
+
+        if (*new_msr & MSR_HVB) {
+            if (!(env->spr[SPR_LPCR] & LPCR_HAIL)) {
+                /* HV interrupts depend on LPCR[HAIL] */
+                return;
+            }
+            ail = 3; /* HAIL=1 gives AIL=3 behaviour for HV interrupts */
+        } else {
+            ail = (env->spr[SPR_LPCR] & LPCR_AIL) >> LPCR_AIL_SHIFT;
+        }
+        if (ail == 0) {
+            return;
+        }
+        if (ail == 1 || ail == 2) {
+            /* AIL=1 and AIL=2 are reserved, treat them like AIL=0 */
+            return;
+        }
+    }
+
+    /*
+     * AIL applies, so the new MSR gets IR and DR set, and an offset applied
+     * to the new IP.
+     */
+    *new_msr |= (1 << MSR_IR) | (1 << MSR_DR);
+
+    if (excp != POWERPC_EXCP_SYSCALL_VECTORED) {
+        if (ail == 2) {
+            *vector |= 0x0000000000018000ull;
+        } else if (ail == 3) {
+            *vector |= 0xc000000000004000ull;
+        }
+    } else {
+        /*
+         * scv AIL is a little different. AIL=2 does not change the address,
+         * only the MSR. AIL=3 replaces the 0x17000 base with 0xc...3000.
+         */
+        if (ail == 3) {
+            *vector &= ~0x0000000000017000ull; /* Un-apply the base offset */
+            *vector |= 0xc000000000003000ull; /* Apply scv's AIL=3 offset */
+        }
+    }
+}
+
+/*
+ * When running under vhyp, hcalls are always intercepted and sent to the
+ * vhc->hypercall handler.
+ */
+static bool books_vhyp_handles_hcall(PowerPCCPU *cpu)
+{
+    if (cpu->vhyp) {
+        return !vhyp_cpu_in_nested(cpu);
+    }
+    return false;
+}
+
+/*
+ * When running a nested KVM HV guest under vhyp, HV exceptions are not
+ * delivered to the guest (because there is no concept of HV support), but
+ * rather they are sent tothe vhyp to exit from the L2 back to the L1 and
+ * return from the H_ENTER_NESTED hypercall.
+ */
+static bool books_vhyp_handles_hv_excp(PowerPCCPU *cpu)
+{
+    if (cpu->vhyp) {
+        return vhyp_cpu_in_nested(cpu);
+    }
+    return false;
+}
+
+void powerpc_excp_books(PowerPCCPU *cpu, int excp)
+{
+    CPUState *cs = CPU(cpu);
+    CPUPPCState *env = &cpu->env;
+    target_ulong msr, new_msr, vector;
+    int srr0, srr1, lev = -1;
+
+    /* new srr1 value excluding must-be-zero bits */
+    msr = env->msr & ~0x783f0000ULL;
+
+    /*
+     * new interrupt handler msr preserves existing HV and ME unless
+     * explicitly overriden
+     */
+    new_msr = env->msr & (((target_ulong)1 << MSR_ME) | MSR_HVB);
+
+    /* target registers */
+    srr0 = SPR_SRR0;
+    srr1 = SPR_SRR1;
+
+    /*
+     * check for special resume at 0x100 from doze/nap/sleep/winkle on
+     * P7/P8/P9
+     */
+    if (env->resume_as_sreset) {
+        excp = powerpc_reset_wakeup(cs, env, excp, &msr);
+    }
+
+    /*
+     * We don't want to generate a Hypervisor Emulation Assistance
+     * Interrupt if we don't have HVB in msr_mask (PAPR mode).
+     */
+    if (excp == POWERPC_EXCP_HV_EMU && !(env->msr_mask & MSR_HVB)) {
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
+        if (env->msr_mask & MSR_HVB) {
+            /*
+             * ISA specifies HV, but can be delivered to guest with HV
+             * clear (e.g., see FWNMI in PAPR).
+             */
+            new_msr |= (target_ulong)MSR_HVB;
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
+    {
+        bool lpes0;
+
+        /*
+         * LPES0 is only taken into consideration if we support HV
+         * mode for this CPU.
+         */
+        if (!env->has_hv_mode) {
+            break;
+        }
+
+        lpes0 = !!(env->spr[SPR_LPCR] & LPCR_LPES0);
+
+        if (!lpes0) {
+            new_msr |= (target_ulong)MSR_HVB;
+            new_msr |= env->msr & ((target_ulong)1 << MSR_RI);
+            srr0 = SPR_HSRR0;
+            srr1 = SPR_HSRR1;
+        }
+
+        break;
+    }
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
+        lev = env->error_code;
+
+        trace_ppc_syscall(env, lev);
+
+        /*
+         * We need to correct the NIP which in this case is supposed
+         * to point to the next instruction
+         */
+        env->nip += 4;
+
+        /* "PAPR mode" built-in hypercall emulation */
+        if ((lev == 1) && books_vhyp_handles_hcall(cpu)) {
+            PPCVirtualHypervisorClass *vhc =
+                PPC_VIRTUAL_HYPERVISOR_GET_CLASS(cpu->vhyp);
+            vhc->hypercall(cpu->vhyp, cpu);
+            return;
+        }
+        if (lev == 1) {
+            new_msr |= (target_ulong)MSR_HVB;
+        }
+        break;
+    case POWERPC_EXCP_SYSCALL_VECTORED: /* scv exception                     */
+        lev = env->error_code;
+        trace_ppc_syscall(env, 0);
+        env->nip += 4;
+        new_msr |= env->msr & ((target_ulong)1 << MSR_EE);
+        new_msr |= env->msr & ((target_ulong)1 << MSR_RI);
+
+        vector += lev * 0x20;
+
+        env->lr = env->nip;
+        env->ctr = msr;
+        break;
+    case POWERPC_EXCP_FPU:       /* Floating-point unavailable exception     */
+    case POWERPC_EXCP_DECR:      /* Decrementer exception                    */
+        break;
+    case POWERPC_EXCP_RESET:     /* System reset exception                   */
+        /* A power-saving exception sets ME, otherwise it is unchanged */
+        if (msr_pow) {
+            /* indicate that we resumed from power save mode */
+            msr |= 0x10000;
+            new_msr |= ((target_ulong)1 << MSR_ME);
+        }
+        if (env->msr_mask & MSR_HVB) {
+            /*
+             * ISA specifies HV, but can be delivered to guest with HV
+             * clear (e.g., see FWNMI in PAPR, NMI injection in QEMU).
+             */
+            new_msr |= (target_ulong)MSR_HVB;
+        } else {
+            if (msr_pow) {
+                cpu_abort(cs, "Trying to deliver power-saving system reset "
+                          "exception %d with no HV support\n", excp);
+            }
+        }
+        break;
+    case POWERPC_EXCP_DSEG:      /* Data segment exception                   */
+    case POWERPC_EXCP_ISEG:      /* Instruction segment exception            */
+    case POWERPC_EXCP_TRACE:     /* Trace exception                          */
+        break;
+    case POWERPC_EXCP_HISI:      /* Hypervisor instruction storage exception */
+        msr |= env->error_code;
+        /* fall through */
+    case POWERPC_EXCP_HDECR:     /* Hypervisor decrementer exception         */
+    case POWERPC_EXCP_HDSI:      /* Hypervisor data storage exception        */
+    case POWERPC_EXCP_SDOOR_HV:  /* Hypervisor Doorbell interrupt            */
+    case POWERPC_EXCP_HV_EMU:
+    case POWERPC_EXCP_HVIRT:     /* Hypervisor virtualization                */
+        srr0 = SPR_HSRR0;
+        srr1 = SPR_HSRR1;
+        new_msr |= (target_ulong)MSR_HVB;
+        new_msr |= env->msr & ((target_ulong)1 << MSR_RI);
+        break;
+    case POWERPC_EXCP_VPU:       /* Vector unavailable exception             */
+    case POWERPC_EXCP_VSXU:       /* VSX unavailable exception               */
+    case POWERPC_EXCP_FU:         /* Facility unavailable exception          */
+        env->spr[SPR_FSCR] |= ((target_ulong)env->error_code << 56);
+        break;
+    case POWERPC_EXCP_HV_FU:     /* Hypervisor Facility Unavailable Exception */
+        env->spr[SPR_HFSCR] |= ((target_ulong)env->error_code << FSCR_IC_POS);
+        srr0 = SPR_HSRR0;
+        srr1 = SPR_HSRR1;
+        new_msr |= (target_ulong)MSR_HVB;
+        new_msr |= env->msr & ((target_ulong)1 << MSR_RI);
+        break;
+    case POWERPC_EXCP_PERFM_EBB:        /* Performance Monitor EBB Exception  */
+    case POWERPC_EXCP_EXTERNAL_EBB:     /* External EBB Exception             */
+        env->spr[SPR_BESCR] &= ~BESCR_GE;
+
+        /*
+         * Save NIP for rfebb insn in SPR_EBBRR. Next nip is
+         * stored in the EBB Handler SPR_EBBHR.
+         */
+        env->spr[SPR_EBBRR] = env->nip;
+        powerpc_set_excp_state(cpu, env->spr[SPR_EBBHR], env->msr);
+
+        /*
+         * This exception is handled in userspace. No need to proceed.
+         */
+        return;
+    case POWERPC_EXCP_THERM:     /* Thermal interrupt                        */
+    case POWERPC_EXCP_PERFM:     /* Embedded performance monitor interrupt   */
+    case POWERPC_EXCP_VPUA:      /* Vector assist exception                  */
+    case POWERPC_EXCP_MAINT:     /* Maintenance exception                    */
+    case POWERPC_EXCP_SDOOR:     /* Doorbell interrupt                       */
+    case POWERPC_EXCP_HV_MAINT:  /* Hypervisor Maintenance exception         */
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
+    new_msr |= (target_ulong)1 << MSR_SF;
+
+    if (excp != POWERPC_EXCP_SYSCALL_VECTORED) {
+        /* Save PC */
+        env->spr[srr0] = env->nip;
+
+        /* Save MSR */
+        env->spr[srr1] = msr;
+    }
+
+    if ((new_msr & MSR_HVB) && books_vhyp_handles_hv_excp(cpu)) {
+        PPCVirtualHypervisorClass *vhc =
+            PPC_VIRTUAL_HYPERVISOR_GET_CLASS(cpu->vhyp);
+        /* Deliver interrupt to L1 by returning from the H_ENTER_NESTED call */
+        vhc->deliver_hv_excp(cpu, excp);
+
+        powerpc_reset_excp_state(cpu);
+
+    } else {
+        /* Sanity check */
+        if (!(env->msr_mask & MSR_HVB) && srr0 == SPR_HSRR0) {
+            cpu_abort(cs, "Trying to deliver HV exception (HSRR) %d with "
+                      "no HV support\n", excp);
+        }
+
+        /* This can update new_msr and vector if AIL applies */
+        ppc_excp_apply_ail(cpu, excp, msr, &new_msr, &vector);
+
+        powerpc_set_excp_state(cpu, vector, new_msr);
+    }
+}
+
 static inline void vscr_init(CPUPPCState *env, uint32_t val)
 {
     /* Altivec always uses round-to-nearest */
diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index a6a721d21c..257379871f 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -138,203 +138,6 @@ void ppc_excp_debug_sw_tlb(CPUPPCState *env, int excp)
              env->error_code);
 }
 
-#if defined(TARGET_PPC64)
-static int powerpc_reset_wakeup(CPUState *cs, CPUPPCState *env, int excp,
-                                target_ulong *msr)
-{
-    /* We no longer are in a PM state */
-    env->resume_as_sreset = false;
-
-    /* Pretend to be returning from doze always as we don't lose state */
-    *msr |= SRR1_WS_NOLOSS;
-
-    /* Machine checks are sent normally */
-    if (excp == POWERPC_EXCP_MCHECK) {
-        return excp;
-    }
-    switch (excp) {
-    case POWERPC_EXCP_RESET:
-        *msr |= SRR1_WAKERESET;
-        break;
-    case POWERPC_EXCP_EXTERNAL:
-        *msr |= SRR1_WAKEEE;
-        break;
-    case POWERPC_EXCP_DECR:
-        *msr |= SRR1_WAKEDEC;
-        break;
-    case POWERPC_EXCP_SDOOR:
-        *msr |= SRR1_WAKEDBELL;
-        break;
-    case POWERPC_EXCP_SDOOR_HV:
-        *msr |= SRR1_WAKEHDBELL;
-        break;
-    case POWERPC_EXCP_HV_MAINT:
-        *msr |= SRR1_WAKEHMI;
-        break;
-    case POWERPC_EXCP_HVIRT:
-        *msr |= SRR1_WAKEHVI;
-        break;
-    default:
-        cpu_abort(cs, "Unsupported exception %d in Power Save mode\n",
-                  excp);
-    }
-    return POWERPC_EXCP_RESET;
-}
-
-/*
- * AIL - Alternate Interrupt Location, a mode that allows interrupts to be
- * taken with the MMU on, and which uses an alternate location (e.g., so the
- * kernel/hv can map the vectors there with an effective address).
- *
- * An interrupt is considered to be taken "with AIL" or "AIL applies" if they
- * are delivered in this way. AIL requires the LPCR to be set to enable this
- * mode, and then a number of conditions have to be true for AIL to apply.
- *
- * First of all, SRESET, MCE, and HMI are always delivered without AIL, because
- * they specifically want to be in real mode (e.g., the MCE might be signaling
- * a SLB multi-hit which requires SLB flush before the MMU can be enabled).
- *
- * After that, behaviour depends on the current MSR[IR], MSR[DR], MSR[HV],
- * whether or not the interrupt changes MSR[HV] from 0 to 1, and the current
- * radix mode (LPCR[HR]).
- *
- * POWER8, POWER9 with LPCR[HR]=0
- * | LPCR[AIL] | MSR[IR||DR] | MSR[HV] | new MSR[HV] | AIL |
- * +-----------+-------------+---------+-------------+-----+
- * | a         | 00/01/10    | x       | x           | 0   |
- * | a         | 11          | 0       | 1           | 0   |
- * | a         | 11          | 1       | 1           | a   |
- * | a         | 11          | 0       | 0           | a   |
- * +-------------------------------------------------------+
- *
- * POWER9 with LPCR[HR]=1
- * | LPCR[AIL] | MSR[IR||DR] | MSR[HV] | new MSR[HV] | AIL |
- * +-----------+-------------+---------+-------------+-----+
- * | a         | 00/01/10    | x       | x           | 0   |
- * | a         | 11          | x       | x           | a   |
- * +-------------------------------------------------------+
- *
- * The difference with POWER9 being that MSR[HV] 0->1 interrupts can be sent to
- * the hypervisor in AIL mode if the guest is radix. This is good for
- * performance but allows the guest to influence the AIL of hypervisor
- * interrupts using its MSR, and also the hypervisor must disallow guest
- * interrupts (MSR[HV] 0->0) from using AIL if the hypervisor does not want to
- * use AIL for its MSR[HV] 0->1 interrupts.
- *
- * POWER10 addresses those issues with a new LPCR[HAIL] bit that is applied to
- * interrupts that begin execution with MSR[HV]=1 (so both MSR[HV] 0->1 and
- * MSR[HV] 1->1).
- *
- * HAIL=1 is equivalent to AIL=3, for interrupts delivered with MSR[HV]=1.
- *
- * POWER10 behaviour is
- * | LPCR[AIL] | LPCR[HAIL] | MSR[IR||DR] | MSR[HV] | new MSR[HV] | AIL |
- * +-----------+------------+-------------+---------+-------------+-----+
- * | a         | h          | 00/01/10    | 0       | 0           | 0   |
- * | a         | h          | 11          | 0       | 0           | a   |
- * | a         | h          | x           | 0       | 1           | h   |
- * | a         | h          | 00/01/10    | 1       | 1           | 0   |
- * | a         | h          | 11          | 1       | 1           | h   |
- * +--------------------------------------------------------------------+
- */
-static void ppc_excp_apply_ail(PowerPCCPU *cpu, int excp, target_ulong msr,
-                               target_ulong *new_msr, target_ulong *vector)
-{
-    PowerPCCPUClass *pcc = POWERPC_CPU_GET_CLASS(cpu);
-    CPUPPCState *env = &cpu->env;
-    bool mmu_all_on = ((msr >> MSR_IR) & 1) && ((msr >> MSR_DR) & 1);
-    bool hv_escalation = !(msr & MSR_HVB) && (*new_msr & MSR_HVB);
-    int ail = 0;
-
-    if (excp == POWERPC_EXCP_MCHECK ||
-        excp == POWERPC_EXCP_RESET ||
-        excp == POWERPC_EXCP_HV_MAINT) {
-        /* SRESET, MCE, HMI never apply AIL */
-        return;
-    }
-
-    if (!(pcc->lpcr_mask & LPCR_AIL)) {
-        /* This CPU does not have AIL */
-        return;
-    }
-
-    /* P8 & P9 */
-    if (!(pcc->lpcr_mask & LPCR_HAIL)) {
-        if (!mmu_all_on) {
-            /* AIL only works if MSR[IR] and MSR[DR] are both enabled. */
-            return;
-        }
-        if (hv_escalation && !(env->spr[SPR_LPCR] & LPCR_HR)) {
-            /*
-             * AIL does not work if there is a MSR[HV] 0->1 transition and the
-             * partition is in HPT mode. For radix guests, such interrupts are
-             * allowed to be delivered to the hypervisor in ail mode.
-             */
-            return;
-        }
-
-        ail = (env->spr[SPR_LPCR] & LPCR_AIL) >> LPCR_AIL_SHIFT;
-        if (ail == 0) {
-            return;
-        }
-        if (ail == 1) {
-            /* AIL=1 is reserved, treat it like AIL=0 */
-            return;
-        }
-
-    /* P10 and up */
-    } else {
-        if (!mmu_all_on && !hv_escalation) {
-            /*
-             * AIL works for HV interrupts even with guest MSR[IR/DR] disabled.
-             * Guest->guest and HV->HV interrupts do require MMU on.
-             */
-            return;
-        }
-
-        if (*new_msr & MSR_HVB) {
-            if (!(env->spr[SPR_LPCR] & LPCR_HAIL)) {
-                /* HV interrupts depend on LPCR[HAIL] */
-                return;
-            }
-            ail = 3; /* HAIL=1 gives AIL=3 behaviour for HV interrupts */
-        } else {
-            ail = (env->spr[SPR_LPCR] & LPCR_AIL) >> LPCR_AIL_SHIFT;
-        }
-        if (ail == 0) {
-            return;
-        }
-        if (ail == 1 || ail == 2) {
-            /* AIL=1 and AIL=2 are reserved, treat them like AIL=0 */
-            return;
-        }
-    }
-
-    /*
-     * AIL applies, so the new MSR gets IR and DR set, and an offset applied
-     * to the new IP.
-     */
-    *new_msr |= (1 << MSR_IR) | (1 << MSR_DR);
-
-    if (excp != POWERPC_EXCP_SYSCALL_VECTORED) {
-        if (ail == 2) {
-            *vector |= 0x0000000000018000ull;
-        } else if (ail == 3) {
-            *vector |= 0xc000000000004000ull;
-        }
-    } else {
-        /*
-         * scv AIL is a little different. AIL=2 does not change the address,
-         * only the MSR. AIL=3 replaces the 0x17000 base with 0xc...3000.
-         */
-        if (ail == 3) {
-            *vector &= ~0x0000000000017000ull; /* Un-apply the base offset */
-            *vector |= 0xc000000000003000ull; /* Apply scv's AIL=3 offset */
-        }
-    }
-}
-#endif
-
 void powerpc_reset_excp_state(PowerPCCPU *cpu)
 {
     CPUState *cs = CPU(cpu);
@@ -388,338 +191,6 @@ static bool books_vhyp_promotes_external_to_hvirt(PowerPCCPU *cpu)
     return false;
 }
 
-#ifdef TARGET_PPC64
-/*
- * When running under vhyp, hcalls are always intercepted and sent to the
- * vhc->hypercall handler.
- */
-static bool books_vhyp_handles_hcall(PowerPCCPU *cpu)
-{
-    if (cpu->vhyp) {
-        return !vhyp_cpu_in_nested(cpu);
-    }
-    return false;
-}
-
-/*
- * When running a nested KVM HV guest under vhyp, HV exceptions are not
- * delivered to the guest (because there is no concept of HV support), but
- * rather they are sent tothe vhyp to exit from the L2 back to the L1 and
- * return from the H_ENTER_NESTED hypercall.
- */
-static bool books_vhyp_handles_hv_excp(PowerPCCPU *cpu)
-{
-    if (cpu->vhyp) {
-        return vhyp_cpu_in_nested(cpu);
-    }
-    return false;
-}
-
-static void powerpc_excp_books(PowerPCCPU *cpu, int excp)
-{
-    CPUState *cs = CPU(cpu);
-    CPUPPCState *env = &cpu->env;
-    target_ulong msr, new_msr, vector;
-    int srr0, srr1, lev = -1;
-
-    /* new srr1 value excluding must-be-zero bits */
-    msr = env->msr & ~0x783f0000ULL;
-
-    /*
-     * new interrupt handler msr preserves existing HV and ME unless
-     * explicitly overriden
-     */
-    new_msr = env->msr & (((target_ulong)1 << MSR_ME) | MSR_HVB);
-
-    /* target registers */
-    srr0 = SPR_SRR0;
-    srr1 = SPR_SRR1;
-
-    /*
-     * check for special resume at 0x100 from doze/nap/sleep/winkle on
-     * P7/P8/P9
-     */
-    if (env->resume_as_sreset) {
-        excp = powerpc_reset_wakeup(cs, env, excp, &msr);
-    }
-
-    /*
-     * We don't want to generate a Hypervisor Emulation Assistance
-     * Interrupt if we don't have HVB in msr_mask (PAPR mode).
-     */
-    if (excp == POWERPC_EXCP_HV_EMU && !(env->msr_mask & MSR_HVB)) {
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
-        if (env->msr_mask & MSR_HVB) {
-            /*
-             * ISA specifies HV, but can be delivered to guest with HV
-             * clear (e.g., see FWNMI in PAPR).
-             */
-            new_msr |= (target_ulong)MSR_HVB;
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
-    {
-        bool lpes0;
-
-        /*
-         * LPES0 is only taken into consideration if we support HV
-         * mode for this CPU.
-         */
-        if (!env->has_hv_mode) {
-            break;
-        }
-
-        lpes0 = !!(env->spr[SPR_LPCR] & LPCR_LPES0);
-
-        if (!lpes0) {
-            new_msr |= (target_ulong)MSR_HVB;
-            new_msr |= env->msr & ((target_ulong)1 << MSR_RI);
-            srr0 = SPR_HSRR0;
-            srr1 = SPR_HSRR1;
-        }
-
-        break;
-    }
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
-        lev = env->error_code;
-
-        trace_ppc_syscall(env, lev);
-
-        /*
-         * We need to correct the NIP which in this case is supposed
-         * to point to the next instruction
-         */
-        env->nip += 4;
-
-        /* "PAPR mode" built-in hypercall emulation */
-        if ((lev == 1) && books_vhyp_handles_hcall(cpu)) {
-            PPCVirtualHypervisorClass *vhc =
-                PPC_VIRTUAL_HYPERVISOR_GET_CLASS(cpu->vhyp);
-            vhc->hypercall(cpu->vhyp, cpu);
-            return;
-        }
-        if (lev == 1) {
-            new_msr |= (target_ulong)MSR_HVB;
-        }
-        break;
-    case POWERPC_EXCP_SYSCALL_VECTORED: /* scv exception                     */
-        lev = env->error_code;
-        trace_ppc_syscall(env, 0);
-        env->nip += 4;
-        new_msr |= env->msr & ((target_ulong)1 << MSR_EE);
-        new_msr |= env->msr & ((target_ulong)1 << MSR_RI);
-
-        vector += lev * 0x20;
-
-        env->lr = env->nip;
-        env->ctr = msr;
-        break;
-    case POWERPC_EXCP_FPU:       /* Floating-point unavailable exception     */
-    case POWERPC_EXCP_DECR:      /* Decrementer exception                    */
-        break;
-    case POWERPC_EXCP_RESET:     /* System reset exception                   */
-        /* A power-saving exception sets ME, otherwise it is unchanged */
-        if (msr_pow) {
-            /* indicate that we resumed from power save mode */
-            msr |= 0x10000;
-            new_msr |= ((target_ulong)1 << MSR_ME);
-        }
-        if (env->msr_mask & MSR_HVB) {
-            /*
-             * ISA specifies HV, but can be delivered to guest with HV
-             * clear (e.g., see FWNMI in PAPR, NMI injection in QEMU).
-             */
-            new_msr |= (target_ulong)MSR_HVB;
-        } else {
-            if (msr_pow) {
-                cpu_abort(cs, "Trying to deliver power-saving system reset "
-                          "exception %d with no HV support\n", excp);
-            }
-        }
-        break;
-    case POWERPC_EXCP_DSEG:      /* Data segment exception                   */
-    case POWERPC_EXCP_ISEG:      /* Instruction segment exception            */
-    case POWERPC_EXCP_TRACE:     /* Trace exception                          */
-        break;
-    case POWERPC_EXCP_HISI:      /* Hypervisor instruction storage exception */
-        msr |= env->error_code;
-        /* fall through */
-    case POWERPC_EXCP_HDECR:     /* Hypervisor decrementer exception         */
-    case POWERPC_EXCP_HDSI:      /* Hypervisor data storage exception        */
-    case POWERPC_EXCP_SDOOR_HV:  /* Hypervisor Doorbell interrupt            */
-    case POWERPC_EXCP_HV_EMU:
-    case POWERPC_EXCP_HVIRT:     /* Hypervisor virtualization                */
-        srr0 = SPR_HSRR0;
-        srr1 = SPR_HSRR1;
-        new_msr |= (target_ulong)MSR_HVB;
-        new_msr |= env->msr & ((target_ulong)1 << MSR_RI);
-        break;
-    case POWERPC_EXCP_VPU:       /* Vector unavailable exception             */
-    case POWERPC_EXCP_VSXU:       /* VSX unavailable exception               */
-    case POWERPC_EXCP_FU:         /* Facility unavailable exception          */
-        env->spr[SPR_FSCR] |= ((target_ulong)env->error_code << 56);
-        break;
-    case POWERPC_EXCP_HV_FU:     /* Hypervisor Facility Unavailable Exception */
-        env->spr[SPR_HFSCR] |= ((target_ulong)env->error_code << FSCR_IC_POS);
-        srr0 = SPR_HSRR0;
-        srr1 = SPR_HSRR1;
-        new_msr |= (target_ulong)MSR_HVB;
-        new_msr |= env->msr & ((target_ulong)1 << MSR_RI);
-        break;
-    case POWERPC_EXCP_PERFM_EBB:        /* Performance Monitor EBB Exception  */
-    case POWERPC_EXCP_EXTERNAL_EBB:     /* External EBB Exception             */
-        env->spr[SPR_BESCR] &= ~BESCR_GE;
-
-        /*
-         * Save NIP for rfebb insn in SPR_EBBRR. Next nip is
-         * stored in the EBB Handler SPR_EBBHR.
-         */
-        env->spr[SPR_EBBRR] = env->nip;
-        powerpc_set_excp_state(cpu, env->spr[SPR_EBBHR], env->msr);
-
-        /*
-         * This exception is handled in userspace. No need to proceed.
-         */
-        return;
-    case POWERPC_EXCP_THERM:     /* Thermal interrupt                        */
-    case POWERPC_EXCP_PERFM:     /* Embedded performance monitor interrupt   */
-    case POWERPC_EXCP_VPUA:      /* Vector assist exception                  */
-    case POWERPC_EXCP_MAINT:     /* Maintenance exception                    */
-    case POWERPC_EXCP_SDOOR:     /* Doorbell interrupt                       */
-    case POWERPC_EXCP_HV_MAINT:  /* Hypervisor Maintenance exception         */
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
-    new_msr |= (target_ulong)1 << MSR_SF;
-
-    if (excp != POWERPC_EXCP_SYSCALL_VECTORED) {
-        /* Save PC */
-        env->spr[srr0] = env->nip;
-
-        /* Save MSR */
-        env->spr[srr1] = msr;
-    }
-
-    if ((new_msr & MSR_HVB) && books_vhyp_handles_hv_excp(cpu)) {
-        PPCVirtualHypervisorClass *vhc =
-            PPC_VIRTUAL_HYPERVISOR_GET_CLASS(cpu->vhyp);
-        /* Deliver interrupt to L1 by returning from the H_ENTER_NESTED call */
-        vhc->deliver_hv_excp(cpu, excp);
-
-        powerpc_reset_excp_state(cpu);
-
-    } else {
-        /* Sanity check */
-        if (!(env->msr_mask & MSR_HVB) && srr0 == SPR_HSRR0) {
-            cpu_abort(cs, "Trying to deliver HV exception (HSRR) %d with "
-                      "no HV support\n", excp);
-        }
-
-        /* This can update new_msr and vector if AIL applies */
-        ppc_excp_apply_ail(cpu, excp, msr, &new_msr, &vector);
-
-        powerpc_set_excp_state(cpu, vector, new_msr);
-    }
-}
-#else
-static inline void powerpc_excp_books(PowerPCCPU *cpu, int excp)
-{
-    g_assert_not_reached();
-}
-#endif
-
 static void powerpc_excp(PowerPCCPU *cpu, int excp)
 {
     CPUState *cs = CPU(cpu);
@@ -751,6 +222,7 @@ static void powerpc_excp(PowerPCCPU *cpu, int excp)
     case POWERPC_EXCP_BOOKE:
         powerpc_excp_booke(cpu, excp);
         break;
+#if defined(TARGET_PPC64)
     case POWERPC_EXCP_970:
     case POWERPC_EXCP_POWER7:
     case POWERPC_EXCP_POWER8:
@@ -758,6 +230,7 @@ static void powerpc_excp(PowerPCCPU *cpu, int excp)
     case POWERPC_EXCP_POWER10:
         powerpc_excp_books(cpu, excp);
         break;
+#endif
     default:
         g_assert_not_reached();
     }
-- 
2.34.1


