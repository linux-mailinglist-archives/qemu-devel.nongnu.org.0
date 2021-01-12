Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B69462F2D98
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 12:11:50 +0100 (CET)
Received: from localhost ([::1]:55272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzHaX-00056k-Ou
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 06:11:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <remi@remlab.net>)
 id 1kzHBV-0003vv-ME; Tue, 12 Jan 2021 05:45:57 -0500
Received: from poy.remlab.net ([2001:41d0:2:5a1a::]:56722
 helo=ns207790.ip-94-23-215.eu)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <remi@remlab.net>)
 id 1kzHBQ-0003Sw-UU; Tue, 12 Jan 2021 05:45:57 -0500
Received: from basile.remlab.net (ip6-localhost [IPv6:::1])
 by ns207790.ip-94-23-215.eu (Postfix) with ESMTP id DFF9B60605;
 Tue, 12 Jan 2021 11:45:15 +0100 (CET)
From: remi.denis.courmont@huawei.com
To: qemu-arm@nongnu.org
Subject: [PATCH 17/19] target/arm: add ARMv8.4-SEL2 extension
Date: Tue, 12 Jan 2021 12:45:09 +0200
Message-Id: <20210112104511.36576-17-remi.denis.courmont@huawei.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <12681824.uLZWGnKmhe@basile.remlab.net>
References: <12681824.uLZWGnKmhe@basile.remlab.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:41d0:2:5a1a::; envelope-from=remi@remlab.net;
 helo=ns207790.ip-94-23-215.eu
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_NONE=0.001,
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

Signed-off-by: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
---
 target/arm/cpu.c       |  2 +-
 target/arm/cpu.h       |  8 ++++++--
 target/arm/helper.c    | 19 ++++++++++++++++---
 target/arm/translate.c | 14 ++++++++++++--
 4 files changed, 35 insertions(+), 8 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 5530874686..b85b644941 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -480,7 +480,7 @@ static inline bool arm_excp_unmasked(CPUState *cs, unsigned int excp_idx,
              * masked from Secure state. The HCR and SCR settings
              * don't affect the masking logic, only the interrupt routing.
              */
-            if (target_el == 3 || !secure) {
+            if (target_el == 3 || !secure || (env->cp15.scr_el3 & SCR_EEL2)) {
                 unmasked = true;
             }
         } else {
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index e605791e47..df510114f6 100644
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
 
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 7648f6fb97..32fc72d9ed 100644
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
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 8b6b7355c9..688cd41684 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -2832,9 +2832,19 @@ static bool msr_banked_access_decode(DisasContext *s, int r, int sysm, int rn,
         }
         if (s->current_el == 1) {
             /* If we're in Secure EL1 (which implies that EL3 is AArch64)
-             * then accesses to Mon registers trap to EL3
+             * then accesses to Mon registers trap to Secure EL2, if it exists,
+             * otherwise EL3.
              */
-            TCGv_i32 tcg_el = tcg_const_i32(3);
+            TCGv_i32 tcg_el;
+
+            if (dc_isar_feature(aa64_sel2, s)) {
+                /* Target EL is EL<3 minus SCR_EL3.EEL2> */
+                tcg_el = load_cpu_field(cp15.scr_el3);
+                tcg_gen_sextract_i32(tcg_el, tcg_el, ctz32(SCR_EEL2), 1);
+                tcg_gen_addi_i32(tcg_el, tcg_el, 3);
+            } else {
+                tcg_el = tcg_const_i32(3);
+            }
 
             gen_exception_el(s, EXCP_UDEF, syn_uncategorized(), tcg_el);
             tcg_temp_free_i32(tcg_el);
-- 
2.30.0


