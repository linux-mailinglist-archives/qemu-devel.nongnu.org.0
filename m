Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE0563446E7
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 15:16:56 +0100 (CET)
Received: from localhost ([::1]:32770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOLMV-0002MO-Pa
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 10:16:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lOL8t-00056i-JG
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 10:02:51 -0400
Received: from mx2.suse.de ([195.135.220.15]:44462)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lOL8i-00059t-94
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 10:02:51 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 26159AF27;
 Mon, 22 Mar 2021 14:02:17 +0000 (UTC)
From: Claudio Fontana <cfontana@suse.de>
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC v10 17/49] target/arm: move arm_mmu_idx* to cpu-mmu
Date: Mon, 22 Mar 2021 15:01:34 +0100
Message-Id: <20210322140206.9513-18-cfontana@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210322140206.9513-1-cfontana@suse.de>
References: <20210322140206.9513-1-cfontana@suse.de>
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

Signed-off-by: Claudio Fontana <cfontana@suse.de>
---
 target/arm/cpu-mmu.c    | 95 +++++++++++++++++++++++++++++++++++++++++
 target/arm/tcg/helper.c | 95 -----------------------------------------
 2 files changed, 95 insertions(+), 95 deletions(-)

diff --git a/target/arm/cpu-mmu.c b/target/arm/cpu-mmu.c
index f463f8458e..c6ac90a61e 100644
--- a/target/arm/cpu-mmu.c
+++ b/target/arm/cpu-mmu.c
@@ -122,3 +122,98 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
         .using64k = using64k,
     };
 }
+
+/* Return the exception level we're running at if this is our mmu_idx */
+int arm_mmu_idx_to_el(ARMMMUIdx mmu_idx)
+{
+    if (mmu_idx & ARM_MMU_IDX_M) {
+        return mmu_idx & ARM_MMU_IDX_M_PRIV;
+    }
+
+    switch (mmu_idx) {
+    case ARMMMUIdx_E10_0:
+    case ARMMMUIdx_E20_0:
+    case ARMMMUIdx_SE10_0:
+    case ARMMMUIdx_SE20_0:
+        return 0;
+    case ARMMMUIdx_E10_1:
+    case ARMMMUIdx_E10_1_PAN:
+    case ARMMMUIdx_SE10_1:
+    case ARMMMUIdx_SE10_1_PAN:
+        return 1;
+    case ARMMMUIdx_E2:
+    case ARMMMUIdx_E20_2:
+    case ARMMMUIdx_E20_2_PAN:
+    case ARMMMUIdx_SE2:
+    case ARMMMUIdx_SE20_2:
+    case ARMMMUIdx_SE20_2_PAN:
+        return 2;
+    case ARMMMUIdx_SE3:
+        return 3;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+#ifndef CONFIG_TCG
+ARMMMUIdx arm_v7m_mmu_idx_for_secstate(CPUARMState *env, bool secstate)
+{
+    g_assert_not_reached();
+}
+#endif
+
+ARMMMUIdx arm_mmu_idx_el(CPUARMState *env, int el)
+{
+    ARMMMUIdx idx;
+    uint64_t hcr;
+
+    if (arm_feature(env, ARM_FEATURE_M)) {
+        return arm_v7m_mmu_idx_for_secstate(env, env->v7m.secure);
+    }
+
+    /* See ARM pseudo-function ELIsInHost.  */
+    switch (el) {
+    case 0:
+        hcr = arm_hcr_el2_eff(env);
+        if ((hcr & (HCR_E2H | HCR_TGE)) == (HCR_E2H | HCR_TGE)) {
+            idx = ARMMMUIdx_E20_0;
+        } else {
+            idx = ARMMMUIdx_E10_0;
+        }
+        break;
+    case 1:
+        if (env->pstate & PSTATE_PAN) {
+            idx = ARMMMUIdx_E10_1_PAN;
+        } else {
+            idx = ARMMMUIdx_E10_1;
+        }
+        break;
+    case 2:
+        /* Note that TGE does not apply at EL2.  */
+        if (arm_hcr_el2_eff(env) & HCR_E2H) {
+            if (env->pstate & PSTATE_PAN) {
+                idx = ARMMMUIdx_E20_2_PAN;
+            } else {
+                idx = ARMMMUIdx_E20_2;
+            }
+        } else {
+            idx = ARMMMUIdx_E2;
+        }
+        break;
+    case 3:
+        return ARMMMUIdx_SE3;
+    default:
+        g_assert_not_reached();
+    }
+
+    if (arm_is_secure_below_el3(env)) {
+        idx &= ~ARM_MMU_IDX_A_NS;
+    }
+
+    return idx;
+}
+
+ARMMMUIdx arm_mmu_idx(CPUARMState *env)
+{
+    return arm_mmu_idx_el(env, arm_current_el(env));
+}
diff --git a/target/arm/tcg/helper.c b/target/arm/tcg/helper.c
index f35d2969b0..beaf252ca5 100644
--- a/target/arm/tcg/helper.c
+++ b/target/arm/tcg/helper.c
@@ -2161,101 +2161,6 @@ int fp_exception_el(CPUARMState *env, int cur_el)
     return 0;
 }
 
-/* Return the exception level we're running at if this is our mmu_idx */
-int arm_mmu_idx_to_el(ARMMMUIdx mmu_idx)
-{
-    if (mmu_idx & ARM_MMU_IDX_M) {
-        return mmu_idx & ARM_MMU_IDX_M_PRIV;
-    }
-
-    switch (mmu_idx) {
-    case ARMMMUIdx_E10_0:
-    case ARMMMUIdx_E20_0:
-    case ARMMMUIdx_SE10_0:
-    case ARMMMUIdx_SE20_0:
-        return 0;
-    case ARMMMUIdx_E10_1:
-    case ARMMMUIdx_E10_1_PAN:
-    case ARMMMUIdx_SE10_1:
-    case ARMMMUIdx_SE10_1_PAN:
-        return 1;
-    case ARMMMUIdx_E2:
-    case ARMMMUIdx_E20_2:
-    case ARMMMUIdx_E20_2_PAN:
-    case ARMMMUIdx_SE2:
-    case ARMMMUIdx_SE20_2:
-    case ARMMMUIdx_SE20_2_PAN:
-        return 2;
-    case ARMMMUIdx_SE3:
-        return 3;
-    default:
-        g_assert_not_reached();
-    }
-}
-
-#ifndef CONFIG_TCG
-ARMMMUIdx arm_v7m_mmu_idx_for_secstate(CPUARMState *env, bool secstate)
-{
-    g_assert_not_reached();
-}
-#endif
-
-ARMMMUIdx arm_mmu_idx_el(CPUARMState *env, int el)
-{
-    ARMMMUIdx idx;
-    uint64_t hcr;
-
-    if (arm_feature(env, ARM_FEATURE_M)) {
-        return arm_v7m_mmu_idx_for_secstate(env, env->v7m.secure);
-    }
-
-    /* See ARM pseudo-function ELIsInHost.  */
-    switch (el) {
-    case 0:
-        hcr = arm_hcr_el2_eff(env);
-        if ((hcr & (HCR_E2H | HCR_TGE)) == (HCR_E2H | HCR_TGE)) {
-            idx = ARMMMUIdx_E20_0;
-        } else {
-            idx = ARMMMUIdx_E10_0;
-        }
-        break;
-    case 1:
-        if (env->pstate & PSTATE_PAN) {
-            idx = ARMMMUIdx_E10_1_PAN;
-        } else {
-            idx = ARMMMUIdx_E10_1;
-        }
-        break;
-    case 2:
-        /* Note that TGE does not apply at EL2.  */
-        if (arm_hcr_el2_eff(env) & HCR_E2H) {
-            if (env->pstate & PSTATE_PAN) {
-                idx = ARMMMUIdx_E20_2_PAN;
-            } else {
-                idx = ARMMMUIdx_E20_2;
-            }
-        } else {
-            idx = ARMMMUIdx_E2;
-        }
-        break;
-    case 3:
-        return ARMMMUIdx_SE3;
-    default:
-        g_assert_not_reached();
-    }
-
-    if (arm_is_secure_below_el3(env)) {
-        idx &= ~ARM_MMU_IDX_A_NS;
-    }
-
-    return idx;
-}
-
-ARMMMUIdx arm_mmu_idx(CPUARMState *env)
-{
-    return arm_mmu_idx_el(env, arm_current_el(env));
-}
-
 #ifndef CONFIG_USER_ONLY
 ARMMMUIdx arm_stage1_mmu_idx(CPUARMState *env)
 {
-- 
2.26.2


