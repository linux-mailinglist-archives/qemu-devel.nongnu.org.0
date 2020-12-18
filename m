Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6023A2DE1A6
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 11:59:15 +0100 (CET)
Received: from localhost ([::1]:38532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqDTe-0006Ss-Az
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 05:59:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <remi@remlab.net>)
 id 1kqD9b-000769-2W; Fri, 18 Dec 2020 05:38:31 -0500
Received: from poy.remlab.net ([2001:41d0:2:5a1a::]:55286
 helo=ns207790.ip-94-23-215.eu)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <remi@remlab.net>)
 id 1kqD9X-0003Jk-VA; Fri, 18 Dec 2020 05:38:30 -0500
Received: from basile.remlab.net (ip6-localhost [IPv6:::1])
 by ns207790.ip-94-23-215.eu (Postfix) with ESMTP id F042E607A0;
 Fri, 18 Dec 2020 11:38:03 +0100 (CET)
From: remi.denis.courmont@huawei.com
To: qemu-arm@nongnu.org
Subject: [PATCH 16/18] target/arm: add ARMv8.4-SEL2 extension
Date: Fri, 18 Dec 2020 12:37:57 +0200
Message-Id: <20201218103759.19929-16-remi.denis.courmont@huawei.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <3337797.iIbC2pHGDl@basile.remlab.net>
References: <3337797.iIbC2pHGDl@basile.remlab.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:41d0:2:5a1a::; envelope-from=remi@remlab.net;
 helo=ns207790.ip-94-23-215.eu
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>

This adds handling for the SCR_EL3.EEL2 bit.

A translation block flag is added in A32 mode to route exceptions
correctly from AArch32 S-EL1 to (AArch64) S-EL2.

Signed-off-by: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.c       |  2 +-
 target/arm/cpu.h       | 11 ++++++++---
 target/arm/helper.c    | 22 +++++++++++++++++++---
 target/arm/translate.c |  6 ++++--
 target/arm/translate.h |  1 +
 5 files changed, 33 insertions(+), 9 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 0f004d8e51..bcca324773 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -479,7 +479,7 @@ static inline bool arm_excp_unmasked(CPUState *cs, unsigned int excp_idx,
              * masked from Secure state. The HCR and SCR settings
              * don't affect the masking logic, only the interrupt routing.
              */
-            if (target_el == 3 || !secure) {
+            if (target_el == 3 || !secure || (env->cp15.scr_el3 & SCR_EEL2)) {
                 unmasked = true;
             }
         } else {
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index e5c05111e1..39abb2a36b 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2094,7 +2094,10 @@ static inline bool arm_is_secure(CPUARMState *env)
 static inline bool arm_is_el2_enabled(CPUARMState *env)
 {
     if (arm_feature(env, ARM_FEATURE_EL2)) {
-        return !arm_is_secure_below_el3(env);
+        if (arm_is_secure_below_el3(env)) {
+            return (env->cp15.scr_el3 & SCR_EEL2) != 0;
+        }
+        return true;
     }
     return false;
 }
@@ -2141,7 +2144,8 @@ static inline bool arm_el_is_aa64(CPUARMState *env, int el)
         return aa64;
     }
 
-    if (arm_feature(env, ARM_FEATURE_EL3)) {
+    if (arm_feature(env, ARM_FEATURE_EL3) &&
+        ((env->cp15.scr_el3 & SCR_NS) || !(env->cp15.scr_el3 & SCR_EEL2))) {
         aa64 = aa64 && (env->cp15.scr_el3 & SCR_RW);
     }
 
@@ -3297,7 +3301,7 @@ typedef ARMCPU ArchCPU;
  * We put flags which are shared between 32 and 64 bit mode at the top
  * of the word, and flags which apply to only one mode at the bottom.
  *
- *  31          20    18    14          9              0
+ *  31          20    19    14          9              0
  * +--------------+-----+-----+----------+--------------+
  * |              |     |   TBFLAG_A32   |              |
  * |              |     +-----+----------+  TBFLAG_AM32 |
@@ -3346,6 +3350,7 @@ FIELD(TBFLAG_A32, HSTR_ACTIVE, 16, 1)
  * the same thing as the current security state of the processor!
  */
 FIELD(TBFLAG_A32, NS, 17, 1)
+FIELD(TBFLAG_A32, EEL2, 18, 1)
 
 /*
  * Bit usage when in AArch32 state, for M-profile only.
diff --git a/target/arm/helper.c b/target/arm/helper.c
index f1c6b5b8ba..a96daca233 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -532,6 +532,9 @@ static CPAccessResult access_trap_aa32s_el1(CPUARMState *env,
         return CP_ACCESS_OK;
     }
     if (arm_is_secure_below_el3(env)) {
+        if (env->cp15.scr_el3 & SCR_EEL2) {
+            return CP_ACCESS_TRAP_EL2;
+        }
         return CP_ACCESS_TRAP_EL3;
     }
     /* This will be EL1 NS and EL2 NS, which just UNDEF */
@@ -2029,6 +2032,9 @@ static void scr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
         if (cpu_isar_feature(aa64_pauth, cpu)) {
             valid_mask |= SCR_API | SCR_APK;
         }
+        if (cpu_isar_feature(aa64_sel2, cpu)) {
+            valid_mask |= SCR_EEL2;
+        }
         if (cpu_isar_feature(aa64_mte, cpu)) {
             valid_mask |= SCR_ATA;
         }
@@ -3387,13 +3393,16 @@ static CPAccessResult ats_access(CPUARMState *env, const ARMCPRegInfo *ri,
                                  bool isread)
 {
     if (ri->opc2 & 4) {
-        /* The ATS12NSO* operations must trap to EL3 if executed in
+        /* The ATS12NSO* operations must trap to EL3 or EL2 if executed in
          * Secure EL1 (which can only happen if EL3 is AArch64).
          * They are simply UNDEF if executed from NS EL1.
          * They function normally from EL2 or EL3.
          */
         if (arm_current_el(env) == 1) {
             if (arm_is_secure_below_el3(env)) {
+                if (env->cp15.scr_el3 & SCR_EEL2) {
+                    return CP_ACCESS_TRAP_UNCATEGORIZED_EL2;
+                }
                 return CP_ACCESS_TRAP_UNCATEGORIZED_EL3;
             }
             return CP_ACCESS_TRAP_UNCATEGORIZED;
@@ -3656,7 +3665,8 @@ static void ats1h_write(CPUARMState *env, const ARMCPRegInfo *ri,
 static CPAccessResult at_s1e2_access(CPUARMState *env, const ARMCPRegInfo *ri,
                                      bool isread)
 {
-    if (arm_current_el(env) == 3 && !(env->cp15.scr_el3 & SCR_NS)) {
+    if (arm_current_el(env) == 3 &&
+        !(env->cp15.scr_el3 & (SCR_NS | SCR_EEL2))) {
         return CP_ACCESS_TRAP;
     }
     return CP_ACCESS_OK;
@@ -5755,12 +5765,15 @@ static CPAccessResult nsacr_access(CPUARMState *env, const ARMCPRegInfo *ri,
                                    bool isread)
 {
     /* The NSACR is RW at EL3, and RO for NS EL1 and NS EL2.
-     * At Secure EL1 it traps to EL3.
+     * At Secure EL1 it traps to EL3 or EL2.
      */
     if (arm_current_el(env) == 3) {
         return CP_ACCESS_OK;
     }
     if (arm_is_secure_below_el3(env)) {
+        if (env->cp15.scr_el3 & SCR_EEL2) {
+            return CP_ACCESS_TRAP_EL2;
+        }
         return CP_ACCESS_TRAP_EL3;
     }
     /* Accesses from EL1 NS and EL2 NS are UNDEF for write but allow reads. */
@@ -12895,6 +12908,9 @@ static uint32_t rebuild_hflags_common_32(CPUARMState *env, int fp_el,
         flags = FIELD_DP32(flags, TBFLAG_ANY, BE_DATA, 1);
     }
     flags = FIELD_DP32(flags, TBFLAG_A32, NS, !access_secure_reg(env));
+    if (arm_is_secure_below_el3(env) && (env->cp15.scr_el3 & SCR_EEL2)) {
+        flags = FIELD_DP32(flags, TBFLAG_A32, EEL2, 1);
+    }
 
     return rebuild_hflags_common(env, fp_el, mmu_idx, flags);
 }
diff --git a/target/arm/translate.c b/target/arm/translate.c
index f5acd32e76..31109839f1 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -2816,9 +2816,10 @@ static bool msr_banked_access_decode(DisasContext *s, int r, int sysm, int rn,
         }
         if (s->current_el == 1) {
             /* If we're in Secure EL1 (which implies that EL3 is AArch64)
-             * then accesses to Mon registers trap to EL3
+             * then accesses to Mon registers trap to Secure EL2 if it exists
+             * otherwise EL3.
              */
-            exc_target = 3;
+            exc_target = s->sel2 ? 2 : 3;
             goto undef;
         }
         break;
@@ -8845,6 +8846,7 @@ static void arm_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
         dc->sctlr_b = FIELD_EX32(tb_flags, TBFLAG_A32, SCTLR_B);
         dc->hstr_active = FIELD_EX32(tb_flags, TBFLAG_A32, HSTR_ACTIVE);
         dc->ns = FIELD_EX32(tb_flags, TBFLAG_A32, NS);
+        dc->sel2 = FIELD_EX32(tb_flags, TBFLAG_A32, EEL2);
         dc->vfp_enabled = FIELD_EX32(tb_flags, TBFLAG_A32, VFPEN);
         if (arm_feature(env, ARM_FEATURE_XSCALE)) {
             dc->c15_cpar = FIELD_EX32(tb_flags, TBFLAG_A32, XSCALE_CPAR);
diff --git a/target/arm/translate.h b/target/arm/translate.h
index 423b0e08df..bf3624791b 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -32,6 +32,7 @@ typedef struct DisasContext {
     uint8_t tbid;      /* TBI1|TBI0 for data */
     uint8_t tcma;      /* TCMA1|TCMA0 for MTE */
     bool ns;        /* Use non-secure CPREG bank on access */
+    bool sel2;      /* Secure EL2 enabled (only used in AArch32) */
     int fp_excp_el; /* FP exception EL or 0 if enabled */
     int sve_excp_el; /* SVE exception EL or 0 if enabled */
     int sve_len;     /* SVE vector length in bytes */
-- 
2.29.2


