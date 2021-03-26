Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E38F34B025
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 21:25:53 +0100 (CET)
Received: from localhost ([::1]:40766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPt1k-00043w-KC
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 16:25:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lPsHs-0007Tc-R2
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 15:38:29 -0400
Received: from mx2.suse.de ([195.135.220.15]:46274)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lPsHm-0001Lw-Ss
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 15:38:28 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A8D33AC6A;
 Fri, 26 Mar 2021 19:38:11 +0000 (UTC)
From: Claudio Fontana <cfontana@suse.de>
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC v12 59/65] target/arm: move sve_zcr_len_for_el to
 TARGET_AARCH64-only cpu-sve
Date: Fri, 26 Mar 2021 20:36:55 +0100
Message-Id: <20210326193701.5981-60-cfontana@suse.de>
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

now that we handled the dependency between HELPER(), cpregs defs
and functions in tcg/,

we can make sve_zcr_len_for_el TARGET_AARCH64-only,
and move it to the cpu-sve module.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
---
 target/arm/cpu-sve.h    |  3 +++
 target/arm/cpu.h        |  4 ++--
 target/arm/arch_dump.c  |  1 +
 target/arm/cpu-common.c | 43 -----------------------------------------
 target/arm/cpu-sve.c    | 33 +++++++++++++++++++++++++++++++
 target/arm/cpu.c        |  4 ++++
 target/arm/tcg/cpregs.c |  1 +
 target/arm/tcg/helper.c |  4 ++++
 8 files changed, 48 insertions(+), 45 deletions(-)

diff --git a/target/arm/cpu-sve.h b/target/arm/cpu-sve.h
index 6ab74b1d8f..1512c56a6b 100644
--- a/target/arm/cpu-sve.h
+++ b/target/arm/cpu-sve.h
@@ -34,4 +34,7 @@ void cpu_sve_add_props(Object *obj);
 /* add the CPU SVE properties specific to the "MAX" CPU */
 void cpu_sve_add_props_max(Object *obj);
 
+/* return the vector length for EL */
+uint32_t sve_zcr_len_for_el(CPUARMState *env, int el);
+
 #endif /* CPU_SVE_H */
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 6917c8161d..6d0e8ac1be 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -223,7 +223,8 @@ typedef struct ARMPACKey {
 } ARMPACKey;
 #else
 static inline void arm_cpu_pauth_finalize(ARMCPU *cpu, Error **errp) { }
-#endif
+
+#endif /* TARGET_AARCH64 */
 
 typedef struct CPUARMState {
     /* Regs for current mode.  */
@@ -1086,7 +1087,6 @@ static inline uint64_t *sve_bswap64(uint64_t *dst, uint64_t *src, int nr)
 #endif /* TARGET_AARCH64 */
 
 int fp_exception_el(CPUARMState *env, int cur_el);
-uint32_t sve_zcr_len_for_el(CPUARMState *env, int el);
 
 /* you can call this signal handler from your SIGBUS and SIGSEGV
    signal handlers to inform the virtual CPU of exceptions. non zero
diff --git a/target/arm/arch_dump.c b/target/arm/arch_dump.c
index 88b3d50684..11509557e3 100644
--- a/target/arm/arch_dump.c
+++ b/target/arm/arch_dump.c
@@ -25,6 +25,7 @@
 #include "sysemu/dump.h"
 
 #ifdef TARGET_AARCH64
+#include "cpu-sve.h"
 
 /* struct user_pt_regs from arch/arm64/include/uapi/asm/ptrace.h */
 struct aarch64_user_regs {
diff --git a/target/arm/cpu-common.c b/target/arm/cpu-common.c
index 76aaa06ce9..516a7f1287 100644
--- a/target/arm/cpu-common.c
+++ b/target/arm/cpu-common.c
@@ -301,49 +301,6 @@ uint64_t arm_hcr_el2_eff(CPUARMState *env)
     return ret;
 }
 
-/*
- * these are AARCH64-only, but due to the chain of dependencies,
- * between HELPER prototypes, hflags, cpreg definitions and functions in
- * tcg/ etc, it becomes incredibly messy to add what should be here:
- *
- * #ifdef TARGET_AARCH64
- */
-
-static uint32_t sve_zcr_get_valid_len(ARMCPU *cpu, uint32_t start_len)
-{
-    uint32_t end_len;
-
-    end_len = start_len &= 0xf;
-    if (!test_bit(start_len, cpu->sve_vq_map)) {
-        end_len = find_last_bit(cpu->sve_vq_map, start_len);
-        assert(end_len < start_len);
-    }
-    return end_len;
-}
-
-/*
- * Given that SVE is enabled, return the vector length for EL.
- */
-uint32_t sve_zcr_len_for_el(CPUARMState *env, int el)
-{
-    ARMCPU *cpu = env_archcpu(env);
-    uint32_t zcr_len = cpu->sve_max_vq - 1;
-
-    if (el <= 1) {
-        zcr_len = MIN(zcr_len, 0xf & (uint32_t)env->vfp.zcr_el[1]);
-    }
-    if (el <= 2 && arm_feature(env, ARM_FEATURE_EL2)) {
-        zcr_len = MIN(zcr_len, 0xf & (uint32_t)env->vfp.zcr_el[2]);
-    }
-    if (arm_feature(env, ARM_FEATURE_EL3)) {
-        zcr_len = MIN(zcr_len, 0xf & (uint32_t)env->vfp.zcr_el[3]);
-    }
-
-    return sve_zcr_get_valid_len(cpu, zcr_len);
-}
-
-/* #endif TARGET_AARCH64 , see matching comment above */
-
 uint64_t arm_sctlr(CPUARMState *env, int el)
 {
     /* Only EL0 needs to be adjusted for EL1&0 or EL2&0. */
diff --git a/target/arm/cpu-sve.c b/target/arm/cpu-sve.c
index 24bffbba8b..e8e817e110 100644
--- a/target/arm/cpu-sve.c
+++ b/target/arm/cpu-sve.c
@@ -288,3 +288,36 @@ void cpu_sve_add_props_max(Object *obj)
 {
     object_property_add(obj, "sve-max-vq", "uint32", get_prop_max_vq, set_prop_max_vq, NULL, NULL);
 }
+
+static uint32_t sve_zcr_get_valid_len(ARMCPU *cpu, uint32_t start_len)
+{
+    uint32_t end_len;
+
+    end_len = start_len &= 0xf;
+    if (!test_bit(start_len, cpu->sve_vq_map)) {
+        end_len = find_last_bit(cpu->sve_vq_map, start_len);
+        assert(end_len < start_len);
+    }
+    return end_len;
+}
+
+/*
+ * Given that SVE is enabled, return the vector length for EL.
+ */
+uint32_t sve_zcr_len_for_el(CPUARMState *env, int el)
+{
+    ARMCPU *cpu = env_archcpu(env);
+    uint32_t zcr_len = cpu->sve_max_vq - 1;
+
+    if (el <= 1) {
+        zcr_len = MIN(zcr_len, 0xf & (uint32_t)env->vfp.zcr_el[1]);
+    }
+    if (el <= 2 && arm_feature(env, ARM_FEATURE_EL2)) {
+        zcr_len = MIN(zcr_len, 0xf & (uint32_t)env->vfp.zcr_el[2]);
+    }
+    if (arm_feature(env, ARM_FEATURE_EL3)) {
+        zcr_len = MIN(zcr_len, 0xf & (uint32_t)env->vfp.zcr_el[3]);
+    }
+
+    return sve_zcr_get_valid_len(cpu, zcr_len);
+}
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 195fe49fbf..dda56381a6 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -23,7 +23,11 @@
 #include "target/arm/idau.h"
 #include "qapi/error.h"
 #include "cpu.h"
+
+#ifdef TARGET_AARCH64
 #include "cpu-sve.h"
+#endif /* TARGET_AARCH64 */
+
 #include "cpregs.h"
 
 #ifdef CONFIG_TCG
diff --git a/target/arm/tcg/cpregs.c b/target/arm/tcg/cpregs.c
index a451e0aaef..4c7d96f465 100644
--- a/target/arm/tcg/cpregs.c
+++ b/target/arm/tcg/cpregs.c
@@ -17,6 +17,7 @@
 #include "cpregs.h"
 
 #ifdef TARGET_AARCH64
+#include "cpu-sve.h"
 #include "tcg/tcg-sve.h"
 #endif /* TARGET_AARCH64 */
 
diff --git a/target/arm/tcg/helper.c b/target/arm/tcg/helper.c
index 2c0cc115f2..b157b3615c 100644
--- a/target/arm/tcg/helper.c
+++ b/target/arm/tcg/helper.c
@@ -19,6 +19,10 @@
 #include "cpregs.h"
 #include "tcg-cpu.h"
 
+#ifdef TARGET_AARCH64
+#include "cpu-sve.h"
+#endif /* TARGET_AARCH64 */
+
 static int vfp_gdb_get_reg(CPUARMState *env, GByteArray *buf, int reg)
 {
     ARMCPU *cpu = env_archcpu(env);
-- 
2.26.2


