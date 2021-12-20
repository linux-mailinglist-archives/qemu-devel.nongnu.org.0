Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 777DD47B38F
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 20:15:49 +0100 (CET)
Received: from localhost ([::1]:51408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzO8R-0007ML-QQ
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 14:15:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1mzNGL-00037w-F5; Mon, 20 Dec 2021 13:19:54 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:40076)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1mzNGG-0006p7-Se; Mon, 20 Dec 2021 13:19:53 -0500
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BKFovA2022746; 
 Mon, 20 Dec 2021 18:19:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=ETS5/aZICXsUpJfo8gjAjbrLEeoju7dH/+fNc0iNpmU=;
 b=jxgdaZsqXYS93Btea6GUjmvOHYgHqoMU7agRmJIn7V/ao87NCvBtuPV1+hCIL6GHWCxG
 OPS2NW1/8nlMeGT4Q7SfBd59Mz9X4NLB8MB6wYAxCYjUajgHmhCVN+80C461cwi8KZYY
 GN6SxhgIVqfa9MuLZjVadgxubzx69y6XpLTcIx4zx9zCXY0burKTlw2X3B1azIL9VL4u
 b/ox3auVfZilVlQAs7zxmJ3m7ow5YFiFvDSGkj1xu+240Bf0jEVH2AA4EjRXnmTJgtgT
 3c3n2/FE2nzKz8MKcRH2tLPI8JBMGjhK3rsB5C09/bBmQRW3AM3LdmI1ZplsKGjMoqV4 Pg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3d1skej88p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Dec 2021 18:19:37 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1BKIBHRG029844;
 Mon, 20 Dec 2021 18:19:36 GMT
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3d1skej88e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Dec 2021 18:19:36 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BKIE7et014697;
 Mon, 20 Dec 2021 18:19:35 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma02wdc.us.ibm.com with ESMTP id 3d179a217g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Dec 2021 18:19:35 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1BKIJYLm23790052
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 20 Dec 2021 18:19:34 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A51F2C6063;
 Mon, 20 Dec 2021 18:19:34 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id ED584C6062;
 Mon, 20 Dec 2021 18:19:32 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.60.53])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 20 Dec 2021 18:19:32 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [RFC v2 11/12] target/ppc: Create new files for book3s,
 booke and ppc32 exception code
Date: Mon, 20 Dec 2021 15:19:02 -0300
Message-Id: <20211220181903.3456898-12-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211220181903.3456898-1-farosas@linux.ibm.com>
References: <20211220181903.3456898-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: U8Vp1u7PN6jSWW3EPmzAtvMY8y7FbG1p
X-Proofpoint-GUID: x0jvdDxK5TF04gx-fWxbOBMISegtCb6u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-20_08,2021-12-20_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0
 spamscore=0 clxscore=1015 mlxscore=0 malwarescore=0 suspectscore=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 mlxlogscore=999
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112200101
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farosas@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
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

Now that everything is split we can move them to their own files. The
rationale is that hopefully in the future we'll be able to move the
cpu code along and give them each a separate CONFIG option.

Another benefit is that we can now define static routines to replace
any of the generic ones from interrupts.c in case we need it.

book3s is now TARGET_PPC64 only. I also had to move some function
definitions to put them all under an ifdef.

ppc32 is now CONFIG_TCG only. I added a stub for ppc32_excp.

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
---
 target/ppc/cpu.h         |   2 +
 target/ppc/excp_helper.c | 426 +--------------------------------------
 target/ppc/interrupts.c  | 258 +-----------------------
 target/ppc/intr-book3s.c | 381 ++++++++++++++++++++++++++++++++++
 target/ppc/intr-booke.c  | 150 ++++++++++++++
 target/ppc/intr-ppc32.c  | 159 +++++++++++++++
 target/ppc/meson.build   |   3 +
 target/ppc/ppc_intr.h    |  18 +-
 target/ppc/tcg-stub.c    |   6 +
 9 files changed, 724 insertions(+), 679 deletions(-)
 create mode 100644 target/ppc/intr-book3s.c
 create mode 100644 target/ppc/intr-booke.c
 create mode 100644 target/ppc/intr-ppc32.c

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index fc66c3561d..becb5e0eb8 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -1356,6 +1356,8 @@ void ppc_cpu_do_interrupt(CPUState *cpu);
 bool ppc_cpu_exec_interrupt(CPUState *cpu, int int_req);
 void ppc_cpu_do_system_reset(CPUState *cs);
 void ppc_cpu_do_fwnmi_machine_check(CPUState *cs, target_ulong vector);
+void powerpc_set_excp_state(PowerPCCPU *cpu, target_ulong new_nip,
+                            target_ulong new_msr);
 extern const VMStateDescription vmstate_ppc_cpu;
 #endif
 
diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index 9c785b75d5..eb8dab1741 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -37,204 +37,8 @@
 /* Exception processing */
 #if !defined(CONFIG_USER_ONLY)
 
-#ifdef TARGET_PPC64
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
-static inline void ppc_excp_apply_ail(PowerPCCPU *cpu, int excp_model, int excp,
-                                      target_ulong msr,
-                                      target_ulong *new_msr,
-                                      target_ulong *new_nip)
-{
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
-    if (excp_model == POWERPC_EXCP_POWER8 ||
-        excp_model == POWERPC_EXCP_POWER9) {
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
-    } else if (excp_model == POWERPC_EXCP_POWER10) {
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
-    } else {
-        /* Other processors do not support AIL */
-        return;
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
-            *new_nip |= 0x0000000000018000ull;
-        } else if (ail == 3) {
-            *new_nip |= 0xc000000000004000ull;
-        }
-    } else {
-        /*
-         * scv AIL is a little different. AIL=2 does not change the address,
-         * only the MSR. AIL=3 replaces the 0x17000 base with 0xc...3000.
-         */
-        if (ail == 3) {
-            *new_nip &= ~0x0000000000017000ull; /* Un-apply the base offset */
-            *new_nip |= 0xc000000000003000ull; /* Apply scv's AIL=3 offset */
-        }
-    }
-}
-#endif /* TARGET_PPC64 */
-
-
-static inline void powerpc_set_excp_state(PowerPCCPU *cpu, target_ulong new_nip,
-                                          target_ulong new_msr)
+inline void powerpc_set_excp_state(PowerPCCPU *cpu, target_ulong new_nip,
+                                   target_ulong new_msr)
 {
     CPUState *cs = CPU(cpu);
     CPUPPCState *env = &cpu->env;
@@ -264,232 +68,6 @@ static inline void powerpc_set_excp_state(PowerPCCPU *cpu, target_ulong new_nip,
     check_tlb_flush(env, false);
 }
 
-#if defined(TARGET_PPC64)
-static inline void book3s_excp(PowerPCCPU *cpu, int excp)
-{
-    CPUState *cs = CPU(cpu);
-    CPUPPCState *env = &cpu->env;
-    int excp_model = env->excp_model;
-    PPCIntrArgs regs;
-    bool ignore;
-
-    regs.msr = env->msr & ~0x783f0000ULL;
-    regs.nip = env->nip;
-
-    /*
-     * new interrupt handler msr preserves existing HV and ME unless
-     * explicitly overriden
-     */
-    regs.new_msr = env->msr & (((target_ulong)1 << MSR_ME) | MSR_HVB);
-
-    /* The Book3S cpus we support are 64 bit only */
-    regs.new_msr |= (target_ulong)1 << MSR_SF;
-
-    regs.sprn_srr0 = SPR_SRR0;
-    regs.sprn_srr1 = SPR_SRR1;
-
-    /*
-     * check for special resume at 0x100 from doze/nap/sleep/winkle on
-     * P7/P8/P9
-     */
-    if (env->resume_as_sreset) {
-        excp = powerpc_reset_wakeup(cs, env, excp, &regs.msr);
-    }
-
-    /*
-     * We don't want to generate an Hypervisor emulation assistance
-     * interrupt if we don't have HVB in msr_mask (PAPR mode).
-     */
-    if (excp == POWERPC_EXCP_HV_EMU && !(env->msr_mask & MSR_HVB)) {
-        excp = POWERPC_EXCP_PROGRAM;
-    }
-
-    regs.new_nip = env->excp_vectors[excp];
-    if (regs.new_nip == (target_ulong)-1ULL) {
-        cpu_abort(cs, "Raised an exception without defined vector %d\n",
-                  excp);
-    }
-
-    /* Setup interrupt-specific registers before injecting */
-    ignore = ppc_intr_prepare(cpu, interrupts_book3s, &regs, excp);
-
-    if (ignore) {
-        /* No further setup is needed for this interrupt */
-        return;
-    }
-
-    /*
-     * Sort out endianness of interrupt, this differs depending on the
-     * CPU, the HV mode, etc...
-     */
-    if (excp_model == POWERPC_EXCP_POWER7) {
-        if (!(regs.new_msr & MSR_HVB) && (env->spr[SPR_LPCR] & LPCR_ILE)) {
-            regs.new_msr |= (target_ulong)1 << MSR_LE;
-        }
-    } else if (excp_model == POWERPC_EXCP_POWER8) {
-        if (regs.new_msr & MSR_HVB) {
-            if (env->spr[SPR_HID0] & HID0_HILE) {
-                regs.new_msr |= (target_ulong)1 << MSR_LE;
-            }
-        } else if (env->spr[SPR_LPCR] & LPCR_ILE) {
-            regs.new_msr |= (target_ulong)1 << MSR_LE;
-        }
-    } else if (excp_model == POWERPC_EXCP_POWER9 ||
-               excp_model == POWERPC_EXCP_POWER10) {
-        if (regs.new_msr & MSR_HVB) {
-            if (env->spr[SPR_HID0] & HID0_POWER9_HILE) {
-                regs.new_msr |= (target_ulong)1 << MSR_LE;
-            }
-        } else if (env->spr[SPR_LPCR] & LPCR_ILE) {
-            regs.new_msr |= (target_ulong)1 << MSR_LE;
-        }
-    } else if (msr_ile) {
-        regs.new_msr |= (target_ulong)1 << MSR_LE;
-    }
-
-    if (excp != POWERPC_EXCP_SYSCALL_VECTORED) {
-        /* Save PC */
-        env->spr[regs.sprn_srr0] = regs.nip;
-
-        /* Save MSR */
-        env->spr[regs.sprn_srr1] = regs.msr;
-    }
-
-    /* This can update regs.new_msr and regs.new_nip if AIL applies */
-    ppc_excp_apply_ail(cpu, excp_model, excp, regs.msr, &regs.new_msr,
-                       &regs.new_nip);
-
-    powerpc_set_excp_state(cpu, regs.new_nip, regs.new_msr);
-}
-#endif /* defined(TARGET_PPC64) */
-
-static inline void booke_excp(PowerPCCPU *cpu, int excp)
-{
-    CPUState *cs = CPU(cpu);
-    CPUPPCState *env = &cpu->env;
-    PPCIntrArgs regs;
-    bool ignore;
-
-    regs.msr = env->msr;
-    regs.nip = env->nip;
-
-    /*
-     * new interrupt handler msr preserves existing HV and ME unless
-     * explicitly overriden
-     */
-    regs.new_msr = env->msr & (((target_ulong)1 << MSR_ME) | MSR_HVB);
-
-    regs.sprn_srr0 = SPR_SRR0;
-    regs.sprn_srr1 = SPR_SRR1;
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
-    if (env->excp_model == POWERPC_EXCP_BOOKE && excp == POWERPC_EXCP_VPU) {
-        excp = POWERPC_EXCP_SPEU;
-    }
-#endif
-
-    regs.new_nip = env->excp_vectors[excp];
-    if (regs.new_nip == (target_ulong)-1ULL) {
-        cpu_abort(cs, "Raised an exception without defined vector %d\n",
-                  excp);
-    }
-
-    regs.new_nip |= env->excp_prefix;
-
-    /* Setup interrupt-specific registers before injecting */
-    ignore = ppc_intr_prepare(cpu, interrupts_booke, &regs, excp);
-
-    if (ignore) {
-        /* No further setup is needed for this interrupt */
-        return;
-    }
-
-#if defined(TARGET_PPC64)
-    if (env->spr[SPR_BOOKE_EPCR] & EPCR_ICM) {
-        /* Cat.64-bit: EPCR.ICM is copied to MSR.CM */
-        regs.new_msr |= (target_ulong)1 << MSR_CM;
-    } else {
-        regs.new_nip = (uint32_t)regs.new_nip;
-    }
-#endif
-
-    /* Save PC */
-    env->spr[regs.sprn_srr0] = regs.nip;
-
-    /* Save MSR */
-    env->spr[regs.sprn_srr1] = regs.msr;
-
-    powerpc_set_excp_state(cpu, regs.new_nip, regs.new_msr);
-}
-
-static inline void ppc32_excp(PowerPCCPU *cpu, int excp)
-{
-    CPUState *cs = CPU(cpu);
-    CPUPPCState *env = &cpu->env;
-    PPCIntrArgs regs;
-    bool ignore;
-
-    regs.msr = env->msr & ~0x783f0000ULL;
-    regs.nip = env->nip;
-
-    /*
-     * new interrupt handler msr preserves existing HV and ME unless
-     * explicitly overriden
-     */
-    regs.new_msr = env->msr & (((target_ulong)1 << MSR_ME) | MSR_HVB);
-
-    regs.sprn_srr0 = SPR_SRR0;
-    regs.sprn_srr1 = SPR_SRR1;
-
-    /*
-     * Hypervisor emulation assistance interrupt only exists on server
-     * arch 2.05 server or later.
-     */
-    if (excp == POWERPC_EXCP_HV_EMU) {
-        excp = POWERPC_EXCP_PROGRAM;
-    }
-
-    regs.new_nip = env->excp_vectors[excp];
-    if (regs.new_nip == (target_ulong)-1ULL) {
-        cpu_abort(cs, "Raised an exception without defined vector %d\n",
-                  excp);
-    }
-
-    regs.new_nip |= env->excp_prefix;
-
-    /* Setup interrupt-specific registers before injecting */
-    ignore = ppc_intr_prepare(cpu, interrupts_ppc32, &regs, excp);
-
-    if (ignore) {
-        /* No further setup is needed for this interrupt */
-        return;
-    }
-
-    if (msr_ile) {
-        regs.new_msr |= (target_ulong)1 << MSR_LE;
-    }
-
-    /* Save PC */
-    env->spr[regs.sprn_srr0] = regs.nip;
-
-    /* Save MSR */
-    env->spr[regs.sprn_srr1] = regs.msr;
-
-    powerpc_set_excp_state(cpu, regs.new_nip, regs.new_msr);
-}
-
 static inline void powerpc_excp(PowerPCCPU *cpu, int excp)
 {
     CPUPPCState *env = &cpu->env;
diff --git a/target/ppc/interrupts.c b/target/ppc/interrupts.c
index 743faddfee..6f956029fd 100644
--- a/target/ppc/interrupts.c
+++ b/target/ppc/interrupts.c
@@ -358,6 +358,7 @@ void ppc_intr_system_reset(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore)
     }
 }
 
+#ifdef TARGET_PPC64
 void ppc_intr_hv(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore)
 {
     CPUPPCState *env = &cpu->env;
@@ -376,20 +377,19 @@ void ppc_intr_hv_insn_storage(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore)
     ppc_intr_hv(cpu, regs, ignore);
 }
 
-void ppc_intr_facility_unavail(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore)
-{
-#ifdef TARGET_PPC64
-    CPUPPCState *env = &cpu->env;
-    env->spr[SPR_FSCR] |= ((target_ulong)env->error_code << 56);
-#endif
-}
-
 void ppc_intr_hv_facility_unavail(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore)
 {
-#ifdef TARGET_PPC64
     CPUPPCState *env = &cpu->env;
     env->spr[SPR_FSCR] |= ((target_ulong)env->error_code << FSCR_IC_POS);
     ppc_intr_hv(cpu, regs, ignore);
+}
+#endif /* TARGET PPC64 */
+
+void ppc_intr_facility_unavail(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore)
+{
+#ifdef TARGET_PPC64
+    CPUPPCState *env = &cpu->env;
+    env->spr[SPR_FSCR] |= ((target_ulong)env->error_code << 56);
 #endif
 }
 
@@ -456,246 +456,6 @@ void ppc_intr_tlb_miss(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore)
     }
 }
 
-PPCInterrupt interrupts_ppc32[POWERPC_EXCP_NB] = {
-    [POWERPC_EXCP_ALIGN] = {
-        "Alignment", ppc_intr_alignment
-    },
-
-    [POWERPC_EXCP_CRITICAL] = {
-        "Critical input", ppc_intr_critical
-    },
-
-    [POWERPC_EXCP_DEBUG] = {
-        "Debug", ppc_intr_debug
-    },
-
-    [POWERPC_EXCP_DLTLB] = {
-        "Data load TLB error", ppc_intr_tlb_miss
-    },
-
-    [POWERPC_EXCP_DSI] = {
-        "Data storage", ppc_intr_data_storage
-    },
-
-    [POWERPC_EXCP_DSTLB] = {
-        "Data store TLB error", ppc_intr_tlb_miss
-    },
-
-    [POWERPC_EXCP_EXTERNAL] = {
-        "External", ppc_intr_external
-    },
-
-    [POWERPC_EXCP_FIT] = {
-        "Fixed-interval timer", ppc_intr_fit
-    },
-
-    [POWERPC_EXCP_IFTLB] = {
-        "Insn fetch TLB error", ppc_intr_tlb_miss
-    },
-
-    [POWERPC_EXCP_ISI] = {
-        "Instruction storage", ppc_intr_insn_storage
-    },
-
-    [POWERPC_EXCP_MCHECK] = {
-        "Machine check", ppc_intr_machine_check
-    },
-
-    [POWERPC_EXCP_PIT] = {
-        "Programmable interval timer", ppc_intr_programmable_timer
-    },
-
-    [POWERPC_EXCP_PROGRAM] = {
-        "Program", ppc_intr_program
-    },
-
-    [POWERPC_EXCP_RESET] = {
-        "System reset", ppc_intr_system_reset
-    },
-
-    [POWERPC_EXCP_SYSCALL] = {
-        "System call", ppc_intr_system_call
-    },
-
-    [POWERPC_EXCP_VPU] = {
-        "Vector unavailable", ppc_intr_facility_unavail
-    },
-
-    [POWERPC_EXCP_WDT] = {
-        "Watchdog timer", ppc_intr_watchdog
-    },
-
-    [POWERPC_EXCP_DECR]  = { "Decrementer",                ppc_intr_noop },
-    [POWERPC_EXCP_DTLB]  = { "Data TLB error",             ppc_intr_noop },
-    [POWERPC_EXCP_FPU]   = { "Floating-point unavailable", ppc_intr_noop },
-    [POWERPC_EXCP_ITLB]  = { "Instruction TLB error",      ppc_intr_noop },
-    [POWERPC_EXCP_TRACE] = { "Trace",                      ppc_intr_noop },
-
-/* Not implemented */
-    [POWERPC_EXCP_DABR]     = { "Data address breakpoint" },
-    [POWERPC_EXCP_DTLBE]    = { "Data TLB error" },
-    [POWERPC_EXCP_EMUL]     = { "Emulation trap" },
-    [POWERPC_EXCP_FPA]      = { "Floating-point assist" },
-    [POWERPC_EXCP_IABR]     = { "Insn address breakpoint" },
-    [POWERPC_EXCP_IO]       = { "IO error" },
-    [POWERPC_EXCP_ITLBE]    = { "Instruction TLB error" },
-    [POWERPC_EXCP_MEXTBR]   = { "Maskable external" },
-    [POWERPC_EXCP_NMEXTBR]  = { "Non-maskable external" },
-    [POWERPC_EXCP_PERFM]    = { "Performance counter" },
-    [POWERPC_EXCP_RUNM]     = { "Run mode" },
-    [POWERPC_EXCP_SMI]      = { "System management" },
-    [POWERPC_EXCP_THERM]    = { "Thermal management" },
-    [POWERPC_EXCP_VPUA]     = { "Vector assist" },
-};
-
-PPCInterrupt interrupts_book3s[POWERPC_EXCP_NB] = {
-    [POWERPC_EXCP_ALIGN] = {
-        "Alignment", ppc_intr_alignment
-    },
-
-    [POWERPC_EXCP_DSI] = {
-        "Data storage", ppc_intr_data_storage
-    },
-
-    [POWERPC_EXCP_EXTERNAL] = {
-        "External", ppc_intr_external
-    },
-
-    [POWERPC_EXCP_FU] = {
-        "Facility unavailable", ppc_intr_facility_unavail
-    },
-
-    [POWERPC_EXCP_HISI] = {
-        "Hypervisor instruction storage", ppc_intr_hv_insn_storage
-    },
-
-    [POWERPC_EXCP_HV_FU] = {
-        "Hypervisor facility unavailable", ppc_intr_hv_facility_unavail
-    },
-
-    [POWERPC_EXCP_ISI] = {
-        "Instruction storage", ppc_intr_insn_storage
-    },
-
-    [POWERPC_EXCP_MCHECK] = {
-        "Machine check", ppc_intr_machine_check
-    },
-
-    [POWERPC_EXCP_PROGRAM] = {
-        "Program", ppc_intr_program
-    },
-
-    [POWERPC_EXCP_RESET] = {
-        "System reset", ppc_intr_system_reset
-    },
-
-    [POWERPC_EXCP_SYSCALL] = {
-        "System call", ppc_intr_system_call
-    },
-
-    [POWERPC_EXCP_SYSCALL_VECTORED] = {
-        "System call vectored", ppc_intr_system_call_vectored
-    },
-
-    [POWERPC_EXCP_VPU] = {
-        "Vector unavailable", ppc_intr_facility_unavail
-    },
-
-    [POWERPC_EXCP_VSXU] = {
-        "VSX unavailable", ppc_intr_facility_unavail
-    },
-
-    [POWERPC_EXCP_HDECR]    = { "Hypervisor decrementer",         ppc_intr_hv },
-    [POWERPC_EXCP_HDSI]     = { "Hypervisor data storage",        ppc_intr_hv },
-    [POWERPC_EXCP_HVIRT]    = { "Hypervisor virtualization",      ppc_intr_hv },
-    [POWERPC_EXCP_HV_EMU]   = { "Hypervisor emulation assist",    ppc_intr_hv },
-    [POWERPC_EXCP_SDOOR_HV] = { "Hypervisor doorbell",            ppc_intr_hv },
-
-    [POWERPC_EXCP_DECR]  = { "Decrementer",                ppc_intr_noop },
-    [POWERPC_EXCP_DSEG]  = { "Data segment",               ppc_intr_noop },
-    [POWERPC_EXCP_FPU]   = { "Floating-point unavailable", ppc_intr_noop },
-    [POWERPC_EXCP_ISEG]  = { "Instruction segment",        ppc_intr_noop },
-    [POWERPC_EXCP_ITLB]  = { "Instruction TLB error",      ppc_intr_noop },
-    [POWERPC_EXCP_TRACE] = { "Trace",                      ppc_intr_noop },
-
-/* Not implemented */
-    [POWERPC_EXCP_HV_MAINT] = { "Hypervisor maintenance" },
-    [POWERPC_EXCP_IABR]     = { "Insn address breakpoint" },
-    [POWERPC_EXCP_MAINT]    = { "Maintenance" },
-    [POWERPC_EXCP_PERFM]    = { "Performance counter" },
-    [POWERPC_EXCP_SDOOR]    = { "Server doorbell" },
-    [POWERPC_EXCP_THERM]    = { "Thermal management" },
-    [POWERPC_EXCP_VPUA]     = { "Vector assist" },
-};
-
-PPCInterrupt interrupts_booke[POWERPC_EXCP_NB] = {
-    [POWERPC_EXCP_ALIGN] = {
-        "Alignment", ppc_intr_alignment
-    },
-
-    [POWERPC_EXCP_CRITICAL] = {
-        "Critical input", ppc_intr_critical
-    },
-
-    [POWERPC_EXCP_DEBUG] = {
-        "Debug", ppc_intr_debug
-    },
-
-    [POWERPC_EXCP_DLTLB] = {
-        "Data load TLB error", ppc_intr_tlb_miss
-    },
-
-    [POWERPC_EXCP_DSI] = {
-        "Data storage", ppc_intr_data_storage
-    },
-
-    [POWERPC_EXCP_EXTERNAL] = {
-        "External", ppc_intr_external
-    },
-
-    [POWERPC_EXCP_FIT] = {
-        "Fixed-interval timer", ppc_intr_fit
-    },
-
-    [POWERPC_EXCP_ISI] = {
-        "Instruction storage", ppc_intr_insn_storage
-    },
-
-    [POWERPC_EXCP_MCHECK] = {
-        "Machine check", ppc_intr_machine_check
-    },
-
-    [POWERPC_EXCP_PROGRAM] = {
-        "Program", ppc_intr_program
-    },
-
-    [POWERPC_EXCP_RESET] = {
-        "System reset", ppc_intr_system_reset
-    },
-
-    [POWERPC_EXCP_SPEU] = {
-        "SPE/embedded FP unavailable/VPU", ppc_intr_spe_unavailable
-    },
-
-    [POWERPC_EXCP_SYSCALL] = {
-        "System call", ppc_intr_system_call
-    },
-
-    [POWERPC_EXCP_WDT] = {
-        "Watchdog timer", ppc_intr_watchdog
-    },
-
-    [POWERPC_EXCP_APU]   = { "Aux. processor unavailable", ppc_intr_noop },
-    [POWERPC_EXCP_DECR]  = { "Decrementer",                ppc_intr_noop },
-    [POWERPC_EXCP_DTLB]  = { "Data TLB error",             ppc_intr_noop },
-    [POWERPC_EXCP_FPU]   = { "Floating-point unavailable", ppc_intr_noop },
-    [POWERPC_EXCP_ITLB]  = { "Instruction TLB error",      ppc_intr_noop },
-
-/* Not impleemented */
-    [POWERPC_EXCP_EFPDI]    = { "Embedded floating-point data" },
-    [POWERPC_EXCP_EFPRI]    = { "Embedded floating-point round" },
-};
-
 int ppc_intr_prepare(PowerPCCPU *cpu, PPCInterrupt *interrupts,
                      PPCIntrArgs *regs, int excp)
 {
diff --git a/target/ppc/intr-book3s.c b/target/ppc/intr-book3s.c
new file mode 100644
index 0000000000..cd279de346
--- /dev/null
+++ b/target/ppc/intr-book3s.c
@@ -0,0 +1,381 @@
+/*
+ * PowerPC interrupt dispatching for Book3S CPUs
+ *
+ * Copyright (C) 2021 IBM Corporation.
+ *
+ * This code is licensed under the GPL version 2 or later. See the
+ * COPYING file in the top-level directory.
+ */
+#include "qemu/osdep.h"
+#include "cpu.h"
+#include "ppc_intr.h"
+
+static PPCInterrupt interrupts_book3s[POWERPC_EXCP_NB] = {
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
+    [POWERPC_EXCP_FU] = {
+        "Facility unavailable", ppc_intr_facility_unavail
+    },
+
+    [POWERPC_EXCP_HISI] = {
+        "Hypervisor instruction storage", ppc_intr_hv_insn_storage
+    },
+
+    [POWERPC_EXCP_HV_FU] = {
+        "Hypervisor facility unavailable", ppc_intr_hv_facility_unavail
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
+    [POWERPC_EXCP_SYSCALL] = {
+        "System call", ppc_intr_system_call
+    },
+
+    [POWERPC_EXCP_SYSCALL_VECTORED] = {
+        "System call vectored", ppc_intr_system_call_vectored
+    },
+
+    [POWERPC_EXCP_VPU] = {
+        "Vector unavailable", ppc_intr_facility_unavail
+    },
+
+    [POWERPC_EXCP_VSXU] = {
+        "VSX unavailable", ppc_intr_facility_unavail
+    },
+
+    [POWERPC_EXCP_HDECR]    = { "Hypervisor decrementer",         ppc_intr_hv },
+    [POWERPC_EXCP_HDSI]     = { "Hypervisor data storage",        ppc_intr_hv },
+    [POWERPC_EXCP_HVIRT]    = { "Hypervisor virtualization",      ppc_intr_hv },
+    [POWERPC_EXCP_HV_EMU]   = { "Hypervisor emulation assist",    ppc_intr_hv },
+    [POWERPC_EXCP_SDOOR_HV] = { "Hypervisor doorbell",            ppc_intr_hv },
+
+    [POWERPC_EXCP_DECR]  = { "Decrementer",                ppc_intr_noop },
+    [POWERPC_EXCP_DSEG]  = { "Data segment",               ppc_intr_noop },
+    [POWERPC_EXCP_FPU]   = { "Floating-point unavailable", ppc_intr_noop },
+    [POWERPC_EXCP_ISEG]  = { "Instruction segment",        ppc_intr_noop },
+    [POWERPC_EXCP_ITLB]  = { "Instruction TLB error",      ppc_intr_noop },
+    [POWERPC_EXCP_TRACE] = { "Trace",                      ppc_intr_noop },
+
+/* Not implemented */
+    [POWERPC_EXCP_HV_MAINT] = { "Hypervisor maintenance" },
+    [POWERPC_EXCP_IABR]     = { "Insn address breakpoint" },
+    [POWERPC_EXCP_MAINT]    = { "Maintenance" },
+    [POWERPC_EXCP_PERFM]    = { "Performance counter" },
+    [POWERPC_EXCP_SDOOR]    = { "Server doorbell" },
+    [POWERPC_EXCP_THERM]    = { "Thermal management" },
+    [POWERPC_EXCP_VPUA]     = { "Vector assist" },
+};
+
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
+static inline void ppc_excp_apply_ail(PowerPCCPU *cpu, int excp_model, int excp,
+                                      target_ulong msr,
+                                      target_ulong *new_msr,
+                                      target_ulong *new_nip)
+{
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
+    if (excp_model == POWERPC_EXCP_POWER8 ||
+        excp_model == POWERPC_EXCP_POWER9) {
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
+    } else if (excp_model == POWERPC_EXCP_POWER10) {
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
+    } else {
+        /* Other processors do not support AIL */
+        return;
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
+            *new_nip |= 0x0000000000018000ull;
+        } else if (ail == 3) {
+            *new_nip |= 0xc000000000004000ull;
+        }
+    } else {
+        /*
+         * scv AIL is a little different. AIL=2 does not change the address,
+         * only the MSR. AIL=3 replaces the 0x17000 base with 0xc...3000.
+         */
+        if (ail == 3) {
+            *new_nip &= ~0x0000000000017000ull; /* Un-apply the base offset */
+            *new_nip |= 0xc000000000003000ull; /* Apply scv's AIL=3 offset */
+        }
+    }
+}
+
+void book3s_excp(PowerPCCPU *cpu, int excp)
+{
+    CPUState *cs = CPU(cpu);
+    CPUPPCState *env = &cpu->env;
+    int excp_model = env->excp_model;
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
+    /* The Book3S cpus we support are 64 bit only */
+    regs.new_msr |= (target_ulong)1 << MSR_SF;
+
+    regs.sprn_srr0 = SPR_SRR0;
+    regs.sprn_srr1 = SPR_SRR1;
+
+    /*
+     * check for special resume at 0x100 from doze/nap/sleep/winkle on
+     * P7/P8/P9
+     */
+    if (env->resume_as_sreset) {
+        excp = powerpc_reset_wakeup(cs, env, excp, &regs.msr);
+    }
+
+    /*
+     * We don't want to generate an Hypervisor emulation assistance
+     * interrupt if we don't have HVB in msr_mask (PAPR mode).
+     */
+    if (excp == POWERPC_EXCP_HV_EMU && !(env->msr_mask & MSR_HVB)) {
+        excp = POWERPC_EXCP_PROGRAM;
+    }
+
+    regs.new_nip = env->excp_vectors[excp];
+    if (regs.new_nip == (target_ulong)-1ULL) {
+        cpu_abort(cs, "Raised an exception without defined vector %d\n",
+                  excp);
+    }
+
+    /* Setup interrupt-specific registers before injecting */
+    ignore = ppc_intr_prepare(cpu, interrupts_book3s, &regs, excp);
+
+    if (ignore) {
+        /* No further setup is needed for this interrupt */
+        return;
+    }
+
+    /*
+     * Sort out endianness of interrupt, this differs depending on the
+     * CPU, the HV mode, etc...
+     */
+    if (excp_model == POWERPC_EXCP_POWER7) {
+        if (!(regs.new_msr & MSR_HVB) && (env->spr[SPR_LPCR] & LPCR_ILE)) {
+            regs.new_msr |= (target_ulong)1 << MSR_LE;
+        }
+    } else if (excp_model == POWERPC_EXCP_POWER8) {
+        if (regs.new_msr & MSR_HVB) {
+            if (env->spr[SPR_HID0] & HID0_HILE) {
+                regs.new_msr |= (target_ulong)1 << MSR_LE;
+            }
+        } else if (env->spr[SPR_LPCR] & LPCR_ILE) {
+            regs.new_msr |= (target_ulong)1 << MSR_LE;
+        }
+    } else if (excp_model == POWERPC_EXCP_POWER9 ||
+               excp_model == POWERPC_EXCP_POWER10) {
+        if (regs.new_msr & MSR_HVB) {
+            if (env->spr[SPR_HID0] & HID0_POWER9_HILE) {
+                regs.new_msr |= (target_ulong)1 << MSR_LE;
+            }
+        } else if (env->spr[SPR_LPCR] & LPCR_ILE) {
+            regs.new_msr |= (target_ulong)1 << MSR_LE;
+        }
+    } else if (msr_ile) {
+        regs.new_msr |= (target_ulong)1 << MSR_LE;
+    }
+
+    if (excp != POWERPC_EXCP_SYSCALL_VECTORED) {
+        /* Save PC */
+        env->spr[regs.sprn_srr0] = regs.nip;
+
+        /* Save MSR */
+        env->spr[regs.sprn_srr1] = regs.msr;
+    }
+
+    /* This can update regs.new_msr and regs.new_nip if AIL applies */
+    ppc_excp_apply_ail(cpu, excp_model, excp, regs.msr, &regs.new_msr,
+                       &regs.new_nip);
+
+    powerpc_set_excp_state(cpu, regs.new_nip, regs.new_msr);
+}
diff --git a/target/ppc/intr-booke.c b/target/ppc/intr-booke.c
new file mode 100644
index 0000000000..598d372069
--- /dev/null
+++ b/target/ppc/intr-booke.c
@@ -0,0 +1,150 @@
+/*
+ * PowerPC exception dispatching for BookE CPUs
+ *
+ * Copyright (C) 2021 IBM Corporation.
+ *
+ * This code is licensed under the GPL version 2 or later. See the
+ * COPYING file in the top-level directory.
+ */
+#include "qemu/osdep.h"
+#include "cpu.h"
+#include "ppc_intr.h"
+
+static PPCInterrupt interrupts_booke[POWERPC_EXCP_NB] = {
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
+void booke_excp(PowerPCCPU *cpu, int excp)
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
diff --git a/target/ppc/intr-ppc32.c b/target/ppc/intr-ppc32.c
new file mode 100644
index 0000000000..a4b89da536
--- /dev/null
+++ b/target/ppc/intr-ppc32.c
@@ -0,0 +1,159 @@
+/*
+ * PowerPC exception dispatching for 32bit CPUs
+ *
+ * Copyright (C) 2021 IBM Corporation.
+ *
+ * This code is licensed under the GPL version 2 or later. See the
+ * COPYING file in the top-level directory.
+ */
+#include "qemu/osdep.h"
+#include "cpu.h"
+#include "ppc_intr.h"
+
+static PPCInterrupt interrupts_ppc32[POWERPC_EXCP_NB] = {
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
+    [POWERPC_EXCP_DSTLB] = {
+        "Data store TLB error", ppc_intr_tlb_miss
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
+void ppc32_excp(PowerPCCPU *cpu, int excp)
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
diff --git a/target/ppc/meson.build b/target/ppc/meson.build
index 53b8e0a98e..9ec335d438 100644
--- a/target/ppc/meson.build
+++ b/target/ppc/meson.build
@@ -40,9 +40,11 @@ ppc_softmmu_ss.add(files(
   'mmu_common.c',
   'monitor.c',
   'interrupts.c',
+  'intr-booke.c',
 ))
 ppc_softmmu_ss.add(when: 'CONFIG_TCG', if_true: files(
   'mmu_helper.c',
+  'intr-ppc32.c',
 ), if_false: files(
   'tcg-stub.c',
 ))
@@ -53,6 +55,7 @@ ppc_softmmu_ss.add(when: 'TARGET_PPC64', if_true: files(
   'mmu-hash64.c',
   'mmu-radix64.c',
   'power8-pmu.c',
+  'intr-book3s.c',
 ))
 
 target_arch += {'ppc': ppc_ss}
diff --git a/target/ppc/ppc_intr.h b/target/ppc/ppc_intr.h
index a12b3a9e4d..a0362f4248 100644
--- a/target/ppc/ppc_intr.h
+++ b/target/ppc/ppc_intr.h
@@ -27,9 +27,6 @@ void ppc_intr_embedded_doorbell_crit(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *i
 void ppc_intr_external(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore);
 void ppc_intr_facility_unavail(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore);
 void ppc_intr_fit(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore);
-void ppc_intr_hv(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore);
-void ppc_intr_hv_facility_unavail(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore);
-void ppc_intr_hv_insn_storage(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore);
 void ppc_intr_insn_storage(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore);
 void ppc_intr_machine_check(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore);
 void ppc_intr_noop(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore);
@@ -42,11 +39,20 @@ void ppc_intr_system_reset(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore);
 void ppc_intr_tlb_miss(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore);
 void ppc_intr_watchdog(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore);
 
+#ifdef TARGET_PPC64
+void ppc_intr_hv(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore);
+void ppc_intr_hv_facility_unavail(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore);
+void ppc_intr_hv_insn_storage(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore);
+#endif
+
 int ppc_intr_prepare(PowerPCCPU *cpu, PPCInterrupt *interrupts,
                      PPCIntrArgs *regs, int excp);
 
-extern PPCInterrupt interrupts_ppc32[POWERPC_EXCP_NB];
-extern PPCInterrupt interrupts_booke[POWERPC_EXCP_NB];
-extern PPCInterrupt interrupts_book3s[POWERPC_EXCP_NB];
+void ppc32_excp(PowerPCCPU *cpu, int excp);
+void booke_excp(PowerPCCPU *cpu, int excp);
+
+#ifdef TARGET_PPC64
+void book3s_excp(PowerPCCPU *cpu, int excp);
+#endif
 
 #endif /* PPC_INTR_H */
diff --git a/target/ppc/tcg-stub.c b/target/ppc/tcg-stub.c
index aadcf59d26..2b40258b01 100644
--- a/target/ppc/tcg-stub.c
+++ b/target/ppc/tcg-stub.c
@@ -20,6 +20,7 @@
 #include "cpu.h"
 #include "internal.h"
 #include "hw/ppc/spapr.h"
+#include "ppc_intr.h"
 
 void create_ppc_opcodes(PowerPCCPU *cpu, Error **errp)
 {
@@ -43,3 +44,8 @@ target_ulong softmmu_resize_hpt_commit(PowerPCCPU *cpu,
 {
     g_assert_not_reached();
 }
+
+void ppc32_excp(PowerPCCPU *cpu, int excp)
+{
+    g_assert_not_reached();
+}
-- 
2.33.1


