Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4593834AF8C
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 20:49:19 +0100 (CET)
Received: from localhost ([::1]:50012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPsSM-00032c-9x
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 15:49:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lPsHI-0006jB-FY
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 15:37:52 -0400
Received: from mx2.suse.de ([195.135.220.15]:45682)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lPsHG-00013d-9z
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 15:37:52 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B445AAC3C;
 Fri, 26 Mar 2021 19:37:37 +0000 (UTC)
From: Claudio Fontana <cfontana@suse.de>
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC v12 29/65] target/arm: move sve_exception_el out of TCG helpers
Date: Fri, 26 Mar 2021 20:36:25 +0100
Message-Id: <20210326193701.5981-30-cfontana@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210326193701.5981-1-cfontana@suse.de>
References: <20210326193701.5981-1-cfontana@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

we need this for KVM too.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu-sysemu.c | 62 +++++++++++++++++++++++++++++++++++++++
 target/arm/cpu-user.c   |  5 ++++
 target/arm/tcg/helper.c | 64 -----------------------------------------
 3 files changed, 67 insertions(+), 64 deletions(-)

diff --git a/target/arm/cpu-sysemu.c b/target/arm/cpu-sysemu.c
index 7a314bf805..7cc721fe68 100644
--- a/target/arm/cpu-sysemu.c
+++ b/target/arm/cpu-sysemu.c
@@ -348,3 +348,65 @@ void aarch64_sync_64_to_32(CPUARMState *env)
 
     env->regs[15] = env->pc;
 }
+
+/*
+ * Return the exception level to which exceptions should be taken
+ * via SVEAccessTrap.  If an exception should be routed through
+ * AArch64.AdvSIMDFPAccessTrap, return 0; fp_exception_el should
+ * take care of raising that exception.
+ * C.f. the ARM pseudocode function CheckSVEEnabled.
+ */
+int sve_exception_el(CPUARMState *env, int el)
+{
+    uint64_t hcr_el2 = arm_hcr_el2_eff(env);
+
+    if (el <= 1 && (hcr_el2 & (HCR_E2H | HCR_TGE)) != (HCR_E2H | HCR_TGE)) {
+        bool disabled = false;
+
+        /*
+         * The CPACR.ZEN controls traps to EL1:
+         * 0, 2 : trap EL0 and EL1 accesses
+         * 1    : trap only EL0 accesses
+         * 3    : trap no accesses
+         */
+        if (!extract32(env->cp15.cpacr_el1, 16, 1)) {
+            disabled = true;
+        } else if (!extract32(env->cp15.cpacr_el1, 17, 1)) {
+            disabled = el == 0;
+        }
+        if (disabled) {
+            /* route_to_el2 */
+            return hcr_el2 & HCR_TGE ? 2 : 1;
+        }
+
+        /* Check CPACR.FPEN.  */
+        if (!extract32(env->cp15.cpacr_el1, 20, 1)) {
+            disabled = true;
+        } else if (!extract32(env->cp15.cpacr_el1, 21, 1)) {
+            disabled = el == 0;
+        }
+        if (disabled) {
+            return 0;
+        }
+    }
+
+    /*
+     * CPTR_EL2.  Since TZ and TFP are positive,
+     * they will be zero when EL2 is not present.
+     */
+    if (el <= 2 && arm_is_el2_enabled(env)) {
+        if (env->cp15.cptr_el[2] & CPTR_TZ) {
+            return 2;
+        }
+        if (env->cp15.cptr_el[2] & CPTR_TFP) {
+            return 0;
+        }
+    }
+
+    /* CPTR_EL3.  Since EZ is negative we must check for EL3.  */
+    if (arm_feature(env, ARM_FEATURE_EL3)
+        && !(env->cp15.cptr_el[3] & CPTR_EZ)) {
+        return 3;
+    }
+    return 0;
+}
diff --git a/target/arm/cpu-user.c b/target/arm/cpu-user.c
index 0225089e46..39093ade76 100644
--- a/target/arm/cpu-user.c
+++ b/target/arm/cpu-user.c
@@ -33,3 +33,8 @@ uint32_t arm_phys_excp_target_el(CPUState *cs, uint32_t excp_idx,
 {
     return 1;
 }
+
+int sve_exception_el(CPUARMState *env, int el)
+{
+    return 0;
+}
diff --git a/target/arm/tcg/helper.c b/target/arm/tcg/helper.c
index e4f18bcaa7..aaa307daca 100644
--- a/target/arm/tcg/helper.c
+++ b/target/arm/tcg/helper.c
@@ -261,70 +261,6 @@ static int arm_gdb_set_svereg(CPUARMState *env, uint8_t *buf, int reg)
 }
 #endif /* TARGET_AARCH64 */
 
-/*
- * Return the exception level to which exceptions should be taken
- * via SVEAccessTrap.  If an exception should be routed through
- * AArch64.AdvSIMDFPAccessTrap, return 0; fp_exception_el should
- * take care of raising that exception.
- * C.f. the ARM pseudocode function CheckSVEEnabled.
- */
-int sve_exception_el(CPUARMState *env, int el)
-{
-#ifndef CONFIG_USER_ONLY
-    uint64_t hcr_el2 = arm_hcr_el2_eff(env);
-
-    if (el <= 1 && (hcr_el2 & (HCR_E2H | HCR_TGE)) != (HCR_E2H | HCR_TGE)) {
-        bool disabled = false;
-
-        /*
-         * The CPACR.ZEN controls traps to EL1:
-         * 0, 2 : trap EL0 and EL1 accesses
-         * 1    : trap only EL0 accesses
-         * 3    : trap no accesses
-         */
-        if (!extract32(env->cp15.cpacr_el1, 16, 1)) {
-            disabled = true;
-        } else if (!extract32(env->cp15.cpacr_el1, 17, 1)) {
-            disabled = el == 0;
-        }
-        if (disabled) {
-            /* route_to_el2 */
-            return hcr_el2 & HCR_TGE ? 2 : 1;
-        }
-
-        /* Check CPACR.FPEN.  */
-        if (!extract32(env->cp15.cpacr_el1, 20, 1)) {
-            disabled = true;
-        } else if (!extract32(env->cp15.cpacr_el1, 21, 1)) {
-            disabled = el == 0;
-        }
-        if (disabled) {
-            return 0;
-        }
-    }
-
-    /*
-     * CPTR_EL2.  Since TZ and TFP are positive,
-     * they will be zero when EL2 is not present.
-     */
-    if (el <= 2 && arm_is_el2_enabled(env)) {
-        if (env->cp15.cptr_el[2] & CPTR_TZ) {
-            return 2;
-        }
-        if (env->cp15.cptr_el[2] & CPTR_TFP) {
-            return 0;
-        }
-    }
-
-    /* CPTR_EL3.  Since EZ is negative we must check for EL3.  */
-    if (arm_feature(env, ARM_FEATURE_EL3)
-        && !(env->cp15.cptr_el[3] & CPTR_EZ)) {
-        return 3;
-    }
-#endif
-    return 0;
-}
-
 void hw_watchpoint_update(ARMCPU *cpu, int n)
 {
     CPUARMState *env = &cpu->env;
-- 
2.26.2


