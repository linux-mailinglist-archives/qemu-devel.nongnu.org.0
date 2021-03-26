Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52AEE34AF9D
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 20:52:49 +0100 (CET)
Received: from localhost ([::1]:33108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPsVk-0007nJ-0r
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 15:52:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lPsH9-0006SN-1y
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 15:37:43 -0400
Received: from mx2.suse.de ([195.135.220.15]:45470)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lPsH5-0000y5-6z
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 15:37:42 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0A979AF3E;
 Fri, 26 Mar 2021 19:37:28 +0000 (UTC)
From: Claudio Fontana <cfontana@suse.de>
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC v12 20/65] target/arm: move arm_hcr_el2_eff from tcg/ to
 common_cpu
Date: Fri, 26 Mar 2021 20:36:16 +0100
Message-Id: <20210326193701.5981-21-cfontana@suse.de>
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

we will need this for KVM too, especially for Nested support.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
---
 target/arm/cpu-common.c | 68 +++++++++++++++++++++++++++++++++++++++++
 target/arm/tcg/helper.c | 68 -----------------------------------------
 2 files changed, 68 insertions(+), 68 deletions(-)

diff --git a/target/arm/cpu-common.c b/target/arm/cpu-common.c
index 694e5d73f3..040e06392a 100644
--- a/target/arm/cpu-common.c
+++ b/target/arm/cpu-common.c
@@ -231,3 +231,71 @@ void cpsr_write(CPUARMState *env, uint32_t val, uint32_t mask,
     mask &= ~CACHED_CPSR_BITS;
     env->uncached_cpsr = (env->uncached_cpsr & ~mask) | (val & mask);
 }
+
+/*
+ * Return the effective value of HCR_EL2.
+ * Bits that are not included here:
+ * RW       (read from SCR_EL3.RW as needed)
+ */
+uint64_t arm_hcr_el2_eff(CPUARMState *env)
+{
+    uint64_t ret = env->cp15.hcr_el2;
+
+    if (!arm_is_el2_enabled(env)) {
+        /*
+         * "This register has no effect if EL2 is not enabled in the
+         * current Security state".  This is ARMv8.4-SecEL2 speak for
+         * !(SCR_EL3.NS==1 || SCR_EL3.EEL2==1).
+         *
+         * Prior to that, the language was "In an implementation that
+         * includes EL3, when the value of SCR_EL3.NS is 0 the PE behaves
+         * as if this field is 0 for all purposes other than a direct
+         * read or write access of HCR_EL2".  With lots of enumeration
+         * on a per-field basis.  In current QEMU, this is condition
+         * is arm_is_secure_below_el3.
+         *
+         * Since the v8.4 language applies to the entire register, and
+         * appears to be backward compatible, use that.
+         */
+        return 0;
+    }
+
+    /*
+     * For a cpu that supports both aarch64 and aarch32, we can set bits
+     * in HCR_EL2 (e.g. via EL3) that are RES0 when we enter EL2 as aa32.
+     * Ignore all of the bits in HCR+HCR2 that are not valid for aarch32.
+     */
+    if (!arm_el_is_aa64(env, 2)) {
+        uint64_t aa32_valid;
+
+        /*
+         * These bits are up-to-date as of ARMv8.6.
+         * For HCR, it's easiest to list just the 2 bits that are invalid.
+         * For HCR2, list those that are valid.
+         */
+        aa32_valid = MAKE_64BIT_MASK(0, 32) & ~(HCR_RW | HCR_TDZ);
+        aa32_valid |= (HCR_CD | HCR_ID | HCR_TERR | HCR_TEA | HCR_MIOCNCE |
+                       HCR_TID4 | HCR_TICAB | HCR_TOCU | HCR_TTLBIS);
+        ret &= aa32_valid;
+    }
+
+    if (ret & HCR_TGE) {
+        /* These bits are up-to-date as of ARMv8.6.  */
+        if (ret & HCR_E2H) {
+            ret &= ~(HCR_VM | HCR_FMO | HCR_IMO | HCR_AMO |
+                     HCR_BSU_MASK | HCR_DC | HCR_TWI | HCR_TWE |
+                     HCR_TID0 | HCR_TID2 | HCR_TPCP | HCR_TPU |
+                     HCR_TDZ | HCR_CD | HCR_ID | HCR_MIOCNCE |
+                     HCR_TID4 | HCR_TICAB | HCR_TOCU | HCR_ENSCXT |
+                     HCR_TTLBIS | HCR_TTLBOS | HCR_TID5);
+        } else {
+            ret |= HCR_FMO | HCR_IMO | HCR_AMO;
+        }
+        ret &= ~(HCR_SWIO | HCR_PTW | HCR_VF | HCR_VI | HCR_VSE |
+                 HCR_FB | HCR_TID1 | HCR_TID3 | HCR_TSC | HCR_TACR |
+                 HCR_TSW | HCR_TTLB | HCR_TVM | HCR_HCD | HCR_TRVM |
+                 HCR_TLOR);
+    }
+
+    return ret;
+}
diff --git a/target/arm/tcg/helper.c b/target/arm/tcg/helper.c
index f35d2969b0..15f53d57b0 100644
--- a/target/arm/tcg/helper.c
+++ b/target/arm/tcg/helper.c
@@ -261,74 +261,6 @@ static int arm_gdb_set_svereg(CPUARMState *env, uint8_t *buf, int reg)
 }
 #endif /* TARGET_AARCH64 */
 
-/*
- * Return the effective value of HCR_EL2.
- * Bits that are not included here:
- * RW       (read from SCR_EL3.RW as needed)
- */
-uint64_t arm_hcr_el2_eff(CPUARMState *env)
-{
-    uint64_t ret = env->cp15.hcr_el2;
-
-    if (!arm_is_el2_enabled(env)) {
-        /*
-         * "This register has no effect if EL2 is not enabled in the
-         * current Security state".  This is ARMv8.4-SecEL2 speak for
-         * !(SCR_EL3.NS==1 || SCR_EL3.EEL2==1).
-         *
-         * Prior to that, the language was "In an implementation that
-         * includes EL3, when the value of SCR_EL3.NS is 0 the PE behaves
-         * as if this field is 0 for all purposes other than a direct
-         * read or write access of HCR_EL2".  With lots of enumeration
-         * on a per-field basis.  In current QEMU, this is condition
-         * is arm_is_secure_below_el3.
-         *
-         * Since the v8.4 language applies to the entire register, and
-         * appears to be backward compatible, use that.
-         */
-        return 0;
-    }
-
-    /*
-     * For a cpu that supports both aarch64 and aarch32, we can set bits
-     * in HCR_EL2 (e.g. via EL3) that are RES0 when we enter EL2 as aa32.
-     * Ignore all of the bits in HCR+HCR2 that are not valid for aarch32.
-     */
-    if (!arm_el_is_aa64(env, 2)) {
-        uint64_t aa32_valid;
-
-        /*
-         * These bits are up-to-date as of ARMv8.6.
-         * For HCR, it's easiest to list just the 2 bits that are invalid.
-         * For HCR2, list those that are valid.
-         */
-        aa32_valid = MAKE_64BIT_MASK(0, 32) & ~(HCR_RW | HCR_TDZ);
-        aa32_valid |= (HCR_CD | HCR_ID | HCR_TERR | HCR_TEA | HCR_MIOCNCE |
-                       HCR_TID4 | HCR_TICAB | HCR_TOCU | HCR_TTLBIS);
-        ret &= aa32_valid;
-    }
-
-    if (ret & HCR_TGE) {
-        /* These bits are up-to-date as of ARMv8.6.  */
-        if (ret & HCR_E2H) {
-            ret &= ~(HCR_VM | HCR_FMO | HCR_IMO | HCR_AMO |
-                     HCR_BSU_MASK | HCR_DC | HCR_TWI | HCR_TWE |
-                     HCR_TID0 | HCR_TID2 | HCR_TPCP | HCR_TPU |
-                     HCR_TDZ | HCR_CD | HCR_ID | HCR_MIOCNCE |
-                     HCR_TID4 | HCR_TICAB | HCR_TOCU | HCR_ENSCXT |
-                     HCR_TTLBIS | HCR_TTLBOS | HCR_TID5);
-        } else {
-            ret |= HCR_FMO | HCR_IMO | HCR_AMO;
-        }
-        ret &= ~(HCR_SWIO | HCR_PTW | HCR_VF | HCR_VI | HCR_VSE |
-                 HCR_FB | HCR_TID1 | HCR_TID3 | HCR_TSC | HCR_TACR |
-                 HCR_TSW | HCR_TTLB | HCR_TVM | HCR_HCD | HCR_TRVM |
-                 HCR_TLOR);
-    }
-
-    return ret;
-}
-
 /* Return the exception level to which exceptions should be taken
  * via SVEAccessTrap.  If an exception should be routed through
  * AArch64.AdvSIMDFPAccessTrap, return 0; fp_exception_el should
-- 
2.26.2


