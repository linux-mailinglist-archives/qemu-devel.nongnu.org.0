Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF9C03725EE
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 08:46:48 +0200 (CEST)
Received: from localhost ([::1]:38536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldopT-0001TT-VY
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 02:46:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ldo0z-0006gm-5z; Tue, 04 May 2021 01:54:37 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:49855)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ldo0w-0005A9-3i; Tue, 04 May 2021 01:54:36 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FZ8CP319Gz9t0p; Tue,  4 May 2021 15:53:21 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1620107601;
 bh=QR2zcAf6goM5WAwuXHkSFi0GzTiS9Ue5wHyMsGgu9Vk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jmInMLY8K9bH1wnMoJ51iDm7nU0nwM6xc/gPHPnKAo4ObNqr/cDD6jWBYxs+dsazV
 1e2USJx1a9cOi0GCv8FDH3eK7S2viFO76nZpPCezdBuXz7Ra/QMkeZ65APs0MDZ0VL
 KEp/PDfo2yrRYLQhhXDllgyHPiw7U+FR2f7OVMLw=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 39/46] target/ppc: rework AIL logic in interrupt delivery
Date: Tue,  4 May 2021 15:53:05 +1000
Message-Id: <20210504055312.306823-40-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210504055312.306823-1-david@gibson.dropbear.id.au>
References: <20210504055312.306823-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: David Gibson <david@gibson.dropbear.id.au>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, Nicholas Piggin <npiggin@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Nicholas Piggin <npiggin@gmail.com>

The AIL logic is becoming unmanageable spread all over powerpc_excp(),
and it is slated to get even worse with POWER10 support.

Move it all to a new helper function.

Reviewed-by: Cédric Le Goater <clg@kaod.org>
Tested-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
Message-Id: <20210501072436.145444-2-npiggin@gmail.com>
[dwg: Corrected tab indenting]
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/spapr_hcall.c            |   3 +-
 target/ppc/cpu.h                |   8 --
 target/ppc/excp_helper.c        | 165 ++++++++++++++++++++------------
 target/ppc/translate_init.c.inc |   2 +-
 4 files changed, 108 insertions(+), 70 deletions(-)

diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
index 7b5cd3553c..2fbe04a689 100644
--- a/hw/ppc/spapr_hcall.c
+++ b/hw/ppc/spapr_hcall.c
@@ -1395,7 +1395,8 @@ static target_ulong h_set_mode_resource_addr_trans_mode(PowerPCCPU *cpu,
         return H_P4;
     }
 
-    if (mflags == AIL_RESERVED) {
+    if (mflags == 1) {
+        /* AIL=1 is reserved */
         return H_UNSUPPORTED_FLAG;
     }
 
diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 8c18bb0762..be24a501fc 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -2405,14 +2405,6 @@ enum {
     HMER_XSCOM_STATUS_MASK      = PPC_BITMASK(21, 23),
 };
 
-/* Alternate Interrupt Location (AIL) */
-enum {
-    AIL_NONE                = 0,
-    AIL_RESERVED            = 1,
-    AIL_0001_8000           = 2,
-    AIL_C000_0000_0000_4000 = 3,
-};
-
 /*****************************************************************************/
 
 #define is_isa300(ctx) (!!(ctx->insns_flags2 & PPC2_ISA300))
diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index 344af66f66..15b2813253 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -136,25 +136,111 @@ static int powerpc_reset_wakeup(CPUState *cs, CPUPPCState *env, int excp,
     return POWERPC_EXCP_RESET;
 }
 
-static uint64_t ppc_excp_vector_offset(CPUState *cs, int ail)
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
+ * the hypervisor in AIL mode if the guest is radix.
+ */
+static inline void ppc_excp_apply_ail(PowerPCCPU *cpu, int excp_model, int excp,
+                                      target_ulong msr,
+                                      target_ulong *new_msr,
+                                      target_ulong *vector)
 {
-    uint64_t offset = 0;
+#if defined(TARGET_PPC64)
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
 
-    switch (ail) {
-    case AIL_NONE:
-        break;
-    case AIL_0001_8000:
-        offset = 0x18000;
-        break;
-    case AIL_C000_0000_0000_4000:
-        offset = 0xc000000000004000ull;
-        break;
-    default:
-        cpu_abort(cs, "Invalid AIL combination %d\n", ail);
-        break;
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
+    } else {
+        /* Other processors do not support AIL */
+        return;
     }
 
-    return offset;
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
+#endif
 }
 
 static inline void powerpc_set_excp_state(PowerPCCPU *cpu,
@@ -197,7 +283,7 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp)
     CPUState *cs = CPU(cpu);
     CPUPPCState *env = &cpu->env;
     target_ulong msr, new_msr, vector;
-    int srr0, srr1, asrr0, asrr1, lev = -1, ail;
+    int srr0, srr1, asrr0, asrr1, lev = -1;
     bool lpes0;
 
     qemu_log_mask(CPU_LOG_INT, "Raise exception at " TARGET_FMT_lx
@@ -238,25 +324,16 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp)
      *
      * On anything else, we behave as if LPES0 is 1
      * (externals don't alter MSR:HV)
-     *
-     * AIL is initialized here but can be cleared by
-     * selected exceptions
      */
 #if defined(TARGET_PPC64)
     if (excp_model == POWERPC_EXCP_POWER7 ||
         excp_model == POWERPC_EXCP_POWER8 ||
         excp_model == POWERPC_EXCP_POWER9) {
         lpes0 = !!(env->spr[SPR_LPCR] & LPCR_LPES0);
-        if (excp_model != POWERPC_EXCP_POWER7) {
-            ail = (env->spr[SPR_LPCR] & LPCR_AIL) >> LPCR_AIL_SHIFT;
-        } else {
-            ail = 0;
-        }
     } else
 #endif /* defined(TARGET_PPC64) */
     {
         lpes0 = true;
-        ail = 0;
     }
 
     /*
@@ -315,7 +392,6 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp)
              */
             new_msr |= (target_ulong)MSR_HVB;
         }
-        ail = 0;
 
         /* machine check exceptions don't have ME set */
         new_msr &= ~((target_ulong)1 << MSR_ME);
@@ -519,7 +595,6 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp)
                           "exception %d with no HV support\n", excp);
             }
         }
-        ail = 0;
         break;
     case POWERPC_EXCP_DSEG:      /* Data segment exception                   */
     case POWERPC_EXCP_ISEG:      /* Instruction segment exception            */
@@ -790,24 +865,6 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp)
     }
 #endif
 
-    /*
-     * AIL only works if MSR[IR] and MSR[DR] are both enabled.
-     */
-    if (!((msr >> MSR_IR) & 1) || !((msr >> MSR_DR) & 1)) {
-        ail = 0;
-    }
-
-    /*
-     * AIL does not work if there is a MSR[HV] 0->1 transition and the
-     * partition is in HPT mode. For radix guests, such interrupts are
-     * allowed to be delivered to the hypervisor in ail mode.
-     */
-    if ((new_msr & MSR_HVB) && !(msr & MSR_HVB)) {
-        if (!(env->spr[SPR_LPCR] & LPCR_HR)) {
-            ail = 0;
-        }
-    }
-
     vector = env->excp_vectors[excp];
     if (vector == (target_ulong)-1ULL) {
         cpu_abort(cs, "Raised an exception without defined vector %d\n",
@@ -848,23 +905,8 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp)
         /* Save MSR */
         env->spr[srr1] = msr;
 
-        /* Handle AIL */
-        if (ail) {
-            new_msr |= (1 << MSR_IR) | (1 << MSR_DR);
-            vector |= ppc_excp_vector_offset(cs, ail);
-        }
-
 #if defined(TARGET_PPC64)
     } else {
-        /* scv AIL is a little different */
-        if (ail) {
-            new_msr |= (1 << MSR_IR) | (1 << MSR_DR);
-        }
-        if (ail == AIL_C000_0000_0000_4000) {
-            vector |= 0xc000000000003000ull;
-        } else {
-            vector |= 0x0000000000017000ull;
-        }
         vector += lev * 0x20;
 
         env->lr = env->nip;
@@ -872,6 +914,9 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp)
 #endif
     }
 
+    /* This can update new_msr and vector if AIL applies */
+    ppc_excp_apply_ail(cpu, excp_model, excp, msr, &new_msr, &vector);
+
     powerpc_set_excp_state(cpu, vector, new_msr);
 }
 
diff --git a/target/ppc/translate_init.c.inc b/target/ppc/translate_init.c.inc
index 42b3a4fd57..65906c7e6d 100644
--- a/target/ppc/translate_init.c.inc
+++ b/target/ppc/translate_init.c.inc
@@ -3456,7 +3456,7 @@ static void init_excp_POWER9(CPUPPCState *env)
 
 #if !defined(CONFIG_USER_ONLY)
     env->excp_vectors[POWERPC_EXCP_HVIRT]    = 0x00000EA0;
-    env->excp_vectors[POWERPC_EXCP_SYSCALL_VECTORED] = 0x00000000;
+    env->excp_vectors[POWERPC_EXCP_SYSCALL_VECTORED] = 0x00017000;
 #endif
 }
 
-- 
2.31.1


