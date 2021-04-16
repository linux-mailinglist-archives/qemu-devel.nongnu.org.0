Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E54B43626AA
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 19:23:27 +0200 (CEST)
Received: from localhost ([::1]:55594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXSBj-0000Q6-0O
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 13:23:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lXRLG-0004Ma-IZ
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 12:29:14 -0400
Received: from mx2.suse.de ([195.135.220.15]:44458)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lXRL3-0001Tq-Hx
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 12:29:14 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8912BAFAA;
 Fri, 16 Apr 2021 16:28:41 +0000 (UTC)
From: Claudio Fontana <cfontana@suse.de>
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC v14 33/80] target/arm: move fp_exception_el out of TCG helpers
Date: Fri, 16 Apr 2021 18:27:37 +0200
Message-Id: <20210416162824.25131-34-cfontana@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210416162824.25131-1-cfontana@suse.de>
References: <20210416162824.25131-1-cfontana@suse.de>
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
 target/arm/cpu-sysemu.c | 100 ++++++++++++++++++++++++++++++++++++++++
 target/arm/cpu-user.c   |   5 ++
 target/arm/tcg/helper.c | 100 ----------------------------------------
 3 files changed, 105 insertions(+), 100 deletions(-)

diff --git a/target/arm/cpu-sysemu.c b/target/arm/cpu-sysemu.c
index 7cc721fe68..128616d90d 100644
--- a/target/arm/cpu-sysemu.c
+++ b/target/arm/cpu-sysemu.c
@@ -410,3 +410,103 @@ int sve_exception_el(CPUARMState *env, int el)
     }
     return 0;
 }
+
+/*
+ * Return the exception level to which FP-disabled exceptions should
+ * be taken, or 0 if FP is enabled.
+ */
+int fp_exception_el(CPUARMState *env, int cur_el)
+{
+#ifndef CONFIG_USER_ONLY
+    /*
+     * CPACR and the CPTR registers don't exist before v6, so FP is
+     * always accessible
+     */
+    if (!arm_feature(env, ARM_FEATURE_V6)) {
+        return 0;
+    }
+
+    if (arm_feature(env, ARM_FEATURE_M)) {
+        /* CPACR can cause a NOCP UsageFault taken to current security state */
+        if (!v7m_cpacr_pass(env, env->v7m.secure, cur_el != 0)) {
+            return 1;
+        }
+
+        if (arm_feature(env, ARM_FEATURE_M_SECURITY) && !env->v7m.secure) {
+            if (!extract32(env->v7m.nsacr, 10, 1)) {
+                /* FP insns cause a NOCP UsageFault taken to Secure */
+                return 3;
+            }
+        }
+
+        return 0;
+    }
+
+    /*
+     * The CPACR controls traps to EL1, or PL1 if we're 32 bit:
+     * 0, 2 : trap EL0 and EL1/PL1 accesses
+     * 1    : trap only EL0 accesses
+     * 3    : trap no accesses
+     * This register is ignored if E2H+TGE are both set.
+     */
+    if ((arm_hcr_el2_eff(env) & (HCR_E2H | HCR_TGE)) != (HCR_E2H | HCR_TGE)) {
+        int fpen = extract32(env->cp15.cpacr_el1, 20, 2);
+
+        switch (fpen) {
+        case 0:
+        case 2:
+            if (cur_el == 0 || cur_el == 1) {
+                /* Trap to PL1, which might be EL1 or EL3 */
+                if (arm_is_secure(env) && !arm_el_is_aa64(env, 3)) {
+                    return 3;
+                }
+                return 1;
+            }
+            if (cur_el == 3 && !is_a64(env)) {
+                /* Secure PL1 running at EL3 */
+                return 3;
+            }
+            break;
+        case 1:
+            if (cur_el == 0) {
+                return 1;
+            }
+            break;
+        case 3:
+            break;
+        }
+    }
+
+    /*
+     * The NSACR allows A-profile AArch32 EL3 and M-profile secure mode
+     * to control non-secure access to the FPU. It doesn't have any
+     * effect if EL3 is AArch64 or if EL3 doesn't exist at all.
+     */
+    if ((arm_feature(env, ARM_FEATURE_EL3) && !arm_el_is_aa64(env, 3) &&
+         cur_el <= 2 && !arm_is_secure_below_el3(env))) {
+        if (!extract32(env->cp15.nsacr, 10, 1)) {
+            /* FP insns act as UNDEF */
+            return cur_el == 2 ? 2 : 1;
+        }
+    }
+
+    /*
+     * For the CPTR registers we don't need to guard with an ARM_FEATURE
+     * check because zero bits in the registers mean "don't trap".
+     */
+
+    /* CPTR_EL2 : present in v7VE or v8 */
+    if (cur_el <= 2 && extract32(env->cp15.cptr_el[2], 10, 1)
+        && arm_is_el2_enabled(env)) {
+        /* Trap FP ops at EL2, NS-EL1 or NS-EL0 to EL2 */
+        return 2;
+    }
+
+    /* CPTR_EL3 : present in v8 */
+    if (extract32(env->cp15.cptr_el[3], 10, 1)) {
+        /* Trap all FP ops to EL3 */
+        return 3;
+    }
+#endif
+    return 0;
+}
diff --git a/target/arm/cpu-user.c b/target/arm/cpu-user.c
index 39093ade76..6a1a1fa273 100644
--- a/target/arm/cpu-user.c
+++ b/target/arm/cpu-user.c
@@ -38,3 +38,8 @@ int sve_exception_el(CPUARMState *env, int el)
 {
     return 0;
 }
+
+int fp_exception_el(CPUARMState *env, int el)
+{
+    return 0;
+}
diff --git a/target/arm/tcg/helper.c b/target/arm/tcg/helper.c
index 4e027b98fe..2dbeb3a077 100644
--- a/target/arm/tcg/helper.c
+++ b/target/arm/tcg/helper.c
@@ -1625,106 +1625,6 @@ uint32_t HELPER(crc32c)(uint32_t acc, uint32_t val, uint32_t bytes)
     return crc32c(acc, buf, bytes) ^ 0xffffffff;
 }
 
-/*
- * Return the exception level to which FP-disabled exceptions should
- * be taken, or 0 if FP is enabled.
- */
-int fp_exception_el(CPUARMState *env, int cur_el)
-{
-#ifndef CONFIG_USER_ONLY
-    /*
-     * CPACR and the CPTR registers don't exist before v6, so FP is
-     * always accessible
-     */
-    if (!arm_feature(env, ARM_FEATURE_V6)) {
-        return 0;
-    }
-
-    if (arm_feature(env, ARM_FEATURE_M)) {
-        /* CPACR can cause a NOCP UsageFault taken to current security state */
-        if (!v7m_cpacr_pass(env, env->v7m.secure, cur_el != 0)) {
-            return 1;
-        }
-
-        if (arm_feature(env, ARM_FEATURE_M_SECURITY) && !env->v7m.secure) {
-            if (!extract32(env->v7m.nsacr, 10, 1)) {
-                /* FP insns cause a NOCP UsageFault taken to Secure */
-                return 3;
-            }
-        }
-
-        return 0;
-    }
-
-    /*
-     * The CPACR controls traps to EL1, or PL1 if we're 32 bit:
-     * 0, 2 : trap EL0 and EL1/PL1 accesses
-     * 1    : trap only EL0 accesses
-     * 3    : trap no accesses
-     * This register is ignored if E2H+TGE are both set.
-     */
-    if ((arm_hcr_el2_eff(env) & (HCR_E2H | HCR_TGE)) != (HCR_E2H | HCR_TGE)) {
-        int fpen = extract32(env->cp15.cpacr_el1, 20, 2);
-
-        switch (fpen) {
-        case 0:
-        case 2:
-            if (cur_el == 0 || cur_el == 1) {
-                /* Trap to PL1, which might be EL1 or EL3 */
-                if (arm_is_secure(env) && !arm_el_is_aa64(env, 3)) {
-                    return 3;
-                }
-                return 1;
-            }
-            if (cur_el == 3 && !is_a64(env)) {
-                /* Secure PL1 running at EL3 */
-                return 3;
-            }
-            break;
-        case 1:
-            if (cur_el == 0) {
-                return 1;
-            }
-            break;
-        case 3:
-            break;
-        }
-    }
-
-    /*
-     * The NSACR allows A-profile AArch32 EL3 and M-profile secure mode
-     * to control non-secure access to the FPU. It doesn't have any
-     * effect if EL3 is AArch64 or if EL3 doesn't exist at all.
-     */
-    if ((arm_feature(env, ARM_FEATURE_EL3) && !arm_el_is_aa64(env, 3) &&
-         cur_el <= 2 && !arm_is_secure_below_el3(env))) {
-        if (!extract32(env->cp15.nsacr, 10, 1)) {
-            /* FP insns act as UNDEF */
-            return cur_el == 2 ? 2 : 1;
-        }
-    }
-
-    /*
-     * For the CPTR registers we don't need to guard with an ARM_FEATURE
-     * check because zero bits in the registers mean "don't trap".
-     */
-
-    /* CPTR_EL2 : present in v7VE or v8 */
-    if (cur_el <= 2 && extract32(env->cp15.cptr_el[2], 10, 1)
-        && arm_is_el2_enabled(env)) {
-        /* Trap FP ops at EL2, NS-EL1 or NS-EL0 to EL2 */
-        return 2;
-    }
-
-    /* CPTR_EL3 : present in v8 */
-    if (extract32(env->cp15.cptr_el[3], 10, 1)) {
-        /* Trap all FP ops to EL3 */
-        return 3;
-    }
-#endif
-    return 0;
-}
-
 #ifndef CONFIG_USER_ONLY
 ARMMMUIdx arm_stage1_mmu_idx(CPUARMState *env)
 {
-- 
2.26.2


