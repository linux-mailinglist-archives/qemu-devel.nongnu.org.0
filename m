Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7818D3725F2
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 08:49:31 +0200 (CEST)
Received: from localhost ([::1]:46614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldos6-00050p-IN
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 02:49:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ldo11-0006jL-EY; Tue, 04 May 2021 01:54:39 -0400
Received: from ozlabs.org ([203.11.71.1]:44035)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ldo0x-0005B8-MH; Tue, 04 May 2021 01:54:38 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FZ8CP4lZgz9t10; Tue,  4 May 2021 15:53:21 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1620107601;
 bh=7s0wh9A/59HjPU6V9IWuN3aCWuxXIcM4WxtwCSfx7ug=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=kavHcnSrRl6F+mheeXclQ6DyAgqUnxactHqVL/9ZCbOi6cYutHwYpzELZlxODxgqu
 uryO3vCBVaekViAiJnhIAI+Ta+tSyj8LYmOcsxqbc7IsW8tTjLI1UiF6DDBHyhPHiw
 +d0m2quiT7I0LC4p6IUo/d3poC/vF197uRdUE/N4=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 40/46] target/ppc: Add POWER10 exception model
Date: Tue,  4 May 2021 15:53:06 +1000
Message-Id: <20210504055312.306823-41-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210504055312.306823-1-david@gibson.dropbear.id.au>
References: <20210504055312.306823-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
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

POWER10 adds a new bit that modifies interrupt behaviour, LPCR[HAIL],
and it removes support for the LPCR[AIL]=0b10 mode.

Reviewed-by: Cédric Le Goater <clg@kaod.org>
Tested-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
Message-Id: <20210501072436.145444-3-npiggin@gmail.com>
[dwg: Corrected tab indenting]
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/spapr_hcall.c            |  7 ++++-
 target/ppc/cpu-qom.h            |  2 ++
 target/ppc/cpu.h                |  5 +--
 target/ppc/excp_helper.c        | 54 +++++++++++++++++++++++++++++++--
 target/ppc/translate.c          |  3 +-
 target/ppc/translate_init.c.inc |  2 +-
 6 files changed, 65 insertions(+), 8 deletions(-)

diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
index 2fbe04a689..7275d0bba1 100644
--- a/hw/ppc/spapr_hcall.c
+++ b/hw/ppc/spapr_hcall.c
@@ -1396,7 +1396,12 @@ static target_ulong h_set_mode_resource_addr_trans_mode(PowerPCCPU *cpu,
     }
 
     if (mflags == 1) {
-        /* AIL=1 is reserved */
+        /* AIL=1 is reserved in POWER8/POWER9/POWER10 */
+        return H_UNSUPPORTED_FLAG;
+    }
+
+    if (mflags == 2 && (pcc->insns_flags2 & PPC2_ISA310)) {
+        /* AIL=2 is reserved in POWER10 (ISA v3.1) */
         return H_UNSUPPORTED_FLAG;
     }
 
diff --git a/target/ppc/cpu-qom.h b/target/ppc/cpu-qom.h
index 118baf8d41..06b6571bc9 100644
--- a/target/ppc/cpu-qom.h
+++ b/target/ppc/cpu-qom.h
@@ -116,6 +116,8 @@ enum powerpc_excp_t {
     POWERPC_EXCP_POWER8,
     /* POWER9 exception model           */
     POWERPC_EXCP_POWER9,
+    /* POWER10 exception model           */
+    POWERPC_EXCP_POWER10,
 };
 
 /*****************************************************************************/
diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index be24a501fc..8a076fab48 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -354,10 +354,11 @@ typedef struct ppc_v3_pate_t {
 #define LPCR_PECE_U_SHIFT (63 - 19)
 #define LPCR_PECE_U_MASK  (0x7ull << LPCR_PECE_U_SHIFT)
 #define LPCR_HVEE         PPC_BIT(17) /* Hypervisor Virt Exit Enable */
-#define LPCR_RMLS_SHIFT   (63 - 37)
+#define LPCR_RMLS_SHIFT   (63 - 37)   /* RMLS (removed in ISA v3.0) */
 #define LPCR_RMLS         (0xfull << LPCR_RMLS_SHIFT)
+#define LPCR_HAIL         PPC_BIT(37) /* ISA v3.1 HV AIL=3 equivalent */
 #define LPCR_ILE          PPC_BIT(38)
-#define LPCR_AIL_SHIFT    (63 - 40)      /* Alternate interrupt location */
+#define LPCR_AIL_SHIFT    (63 - 40)   /* Alternate interrupt location */
 #define LPCR_AIL          (3ull << LPCR_AIL_SHIFT)
 #define LPCR_UPRT         PPC_BIT(41) /* Use Process Table */
 #define LPCR_EVIRT        PPC_BIT(42) /* Enhanced Virtualisation */
diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index 15b2813253..f4f15279eb 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -170,7 +170,27 @@ static int powerpc_reset_wakeup(CPUState *cs, CPUPPCState *env, int excp,
  * +-------------------------------------------------------+
  *
  * The difference with POWER9 being that MSR[HV] 0->1 interrupts can be sent to
- * the hypervisor in AIL mode if the guest is radix.
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
  */
 static inline void ppc_excp_apply_ail(PowerPCCPU *cpu, int excp_model, int excp,
                                       target_ulong msr,
@@ -213,6 +233,32 @@ static inline void ppc_excp_apply_ail(PowerPCCPU *cpu, int excp_model, int excp,
             /* AIL=1 is reserved, treat it like AIL=0 */
             return;
         }
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
     } else {
         /* Other processors do not support AIL */
         return;
@@ -328,7 +374,8 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp)
 #if defined(TARGET_PPC64)
     if (excp_model == POWERPC_EXCP_POWER7 ||
         excp_model == POWERPC_EXCP_POWER8 ||
-        excp_model == POWERPC_EXCP_POWER9) {
+        excp_model == POWERPC_EXCP_POWER9 ||
+        excp_model == POWERPC_EXCP_POWER10) {
         lpes0 = !!(env->spr[SPR_LPCR] & LPCR_LPES0);
     } else
 #endif /* defined(TARGET_PPC64) */
@@ -848,7 +895,8 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp)
         } else if (env->spr[SPR_LPCR] & LPCR_ILE) {
             new_msr |= (target_ulong)1 << MSR_LE;
         }
-    } else if (excp_model == POWERPC_EXCP_POWER9) {
+    } else if (excp_model == POWERPC_EXCP_POWER9 ||
+               excp_model == POWERPC_EXCP_POWER10) {
         if (new_msr & MSR_HVB) {
             if (env->spr[SPR_HID0] & HID0_POWER9_HILE) {
                 new_msr |= (target_ulong)1 << MSR_LE;
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index a7c568ca9c..a6381208a5 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -7731,7 +7731,8 @@ void ppc_cpu_dump_state(CPUState *cs, FILE *f, int flags)
 #if defined(TARGET_PPC64)
     if (env->excp_model == POWERPC_EXCP_POWER7 ||
         env->excp_model == POWERPC_EXCP_POWER8 ||
-        env->excp_model == POWERPC_EXCP_POWER9)  {
+        env->excp_model == POWERPC_EXCP_POWER9 ||
+        env->excp_model == POWERPC_EXCP_POWER10)  {
         qemu_fprintf(f, "HSRR0 " TARGET_FMT_lx " HSRR1 " TARGET_FMT_lx "\n",
                      env->spr[SPR_HSRR0], env->spr[SPR_HSRR1]);
     }
diff --git a/target/ppc/translate_init.c.inc b/target/ppc/translate_init.c.inc
index 65906c7e6d..f92656b2f2 100644
--- a/target/ppc/translate_init.c.inc
+++ b/target/ppc/translate_init.c.inc
@@ -9316,7 +9316,7 @@ POWERPC_FAMILY(POWER10)(ObjectClass *oc, void *data)
     pcc->radix_page_info = &POWER10_radix_page_info;
     pcc->lrg_decr_bits = 56;
 #endif
-    pcc->excp_model = POWERPC_EXCP_POWER9;
+    pcc->excp_model = POWERPC_EXCP_POWER10;
     pcc->bus_model = PPC_FLAGS_INPUT_POWER9;
     pcc->bfd_mach = bfd_mach_ppc64;
     pcc->flags = POWERPC_FLAG_VRE | POWERPC_FLAG_SE |
-- 
2.31.1


