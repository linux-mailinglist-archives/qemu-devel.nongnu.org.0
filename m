Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BF9B346597
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 17:44:45 +0100 (CET)
Received: from localhost ([::1]:59232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOk96-0001Zb-07
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 12:44:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lOjGS-0007YT-FA
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 11:48:18 -0400
Received: from mx2.suse.de ([195.135.220.15]:54982)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lOjFt-00011N-R6
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 11:48:16 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 85847AF9A;
 Tue, 23 Mar 2021 15:47:07 +0000 (UTC)
From: Claudio Fontana <cfontana@suse.de>
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC v11 52/55] target/arm: refactor arm_cpu_finalize_features into
 cpu64
Date: Tue, 23 Mar 2021 16:46:36 +0100
Message-Id: <20210323154639.23477-45-cfontana@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210323151749.21299-1-cfontana@suse.de>
References: <20210323151749.21299-1-cfontana@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

all the features in arm_cpu_finalize_features are actually
TARGET_AARCH64-only, since KVM is now only supported on 64bit.

Therefore move the function to cpu64, and rename it to
aarch64_cpu_finalize_features.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
---
 target/arm/cpu.h         |  3 +-
 target/arm/kvm/kvm_arm.h |  5 ++--
 target/arm/cpu.c         | 65 ++++++++++------------------------------
 target/arm/cpu64.c       | 25 ++++++++++++++++
 target/arm/kvm/kvm64.c   |  7 +++--
 target/arm/monitor.c     |  8 +++--
 6 files changed, 54 insertions(+), 59 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index e9cfb99ad9..99c03fd6b4 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1036,6 +1036,7 @@ int arm_cpu_write_elf32_note(WriteCoreDumpFunction f, CPUState *cs,
 #ifdef TARGET_AARCH64
 int aarch64_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
 int aarch64_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
+bool aarch64_cpu_finalize_features(ARMCPU *cpu, Error **errp);
 
 static inline bool is_a64(CPUARMState *env)
 {
@@ -2096,8 +2097,6 @@ static inline int arm_feature(CPUARMState *env, int feature)
     return (env->features & (1ULL << feature)) != 0;
 }
 
-void arm_cpu_finalize_features(ARMCPU *cpu, Error **errp);
-
 #if !defined(CONFIG_USER_ONLY)
 /* Return true if exception levels below EL3 are in secure state,
  * or would be following an exception return to that level.
diff --git a/target/arm/kvm/kvm_arm.h b/target/arm/kvm/kvm_arm.h
index 34f8daa377..5c0d58f527 100644
--- a/target/arm/kvm/kvm_arm.h
+++ b/target/arm/kvm/kvm_arm.h
@@ -275,7 +275,7 @@ void kvm_arm_add_vcpu_properties(Object *obj);
  * Validate the kvm-steal-time property selection and set its default
  * based on KVM support and guest configuration.
  */
-void kvm_arm_steal_time_finalize(ARMCPU *cpu, Error **errp);
+bool kvm_arm_steal_time_finalize(ARMCPU *cpu, Error **errp);
 
 /**
  * kvm_arm_steal_time_supported:
@@ -436,9 +436,10 @@ static inline void kvm_arm_pvtime_init(CPUState *cs, uint64_t ipa)
     g_assert_not_reached();
 }
 
-static inline void kvm_arm_steal_time_finalize(ARMCPU *cpu, Error **errp)
+static inline bool kvm_arm_steal_time_finalize(ARMCPU *cpu, Error **errp)
 {
     g_assert_not_reached();
+    return false;
 }
 
 static inline void kvm_arm_sve_get_vls(CPUState *cs, unsigned long *map)
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 82c55b4820..46afe3f134 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -23,7 +23,6 @@
 #include "target/arm/idau.h"
 #include "qapi/error.h"
 #include "cpu.h"
-#include "cpu-sve.h"
 #include "cpregs.h"
 
 #ifdef CONFIG_TCG
@@ -815,40 +814,6 @@ static void arm_cpu_finalizefn(Object *obj)
 #endif
 }
 
-void arm_cpu_finalize_features(ARMCPU *cpu, Error **errp)
-{
-    Error *local_err = NULL;
-
-#ifdef TARGET_AARCH64
-    if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
-        if (!cpu_sve_finalize_features(cpu, &local_err)) {
-            error_propagate(errp, local_err);
-            return;
-        }
-
-        /*
-         * KVM does not support modifications to this feature.
-         * We have not registered the cpu properties when KVM
-         * is in use, so the user will not be able to set them.
-         */
-        if (tcg_enabled()) {
-            if (!cpu_pauth_finalize(cpu, &local_err)) {
-                error_propagate(errp, local_err);
-                return;
-            }
-        }
-    }
-#endif /* TARGET_AARCH64 */
-
-    if (kvm_enabled()) {
-        kvm_arm_steal_time_finalize(cpu, &local_err);
-        if (local_err != NULL) {
-            error_propagate(errp, local_err);
-            return;
-        }
-    }
-}
-
 static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
 {
     CPUState *cs = CPU(dev);
@@ -871,22 +836,22 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
         return;
     }
 
-    arm_cpu_finalize_features(cpu, &local_err);
-    if (local_err != NULL) {
-        error_propagate(errp, local_err);
-        return;
-    }
-
-    if (arm_feature(env, ARM_FEATURE_AARCH64) &&
-        cpu->has_vfp != cpu->has_neon) {
-        /*
-         * This is an architectural requirement for AArch64; AArch32 is
-         * more flexible and permits VFP-no-Neon and Neon-no-VFP.
-         */
-        error_setg(errp,
-                   "AArch64 CPUs must have both VFP and Neon or neither");
-        return;
+#ifdef TARGET_AARCH64
+    if (arm_feature(env, ARM_FEATURE_AARCH64)) {
+        if (!aarch64_cpu_finalize_features(cpu, errp)) {
+            return;
+        }
+        if (cpu->has_vfp != cpu->has_neon) {
+            /*
+             * This is an architectural requirement for AArch64; AArch32 is
+             * more flexible and permits VFP-no-Neon and Neon-no-VFP.
+             */
+            error_setg(errp,
+                       "AArch64 CPUs must have both VFP and Neon or neither");
+            return;
+        }
     }
+#endif /* TARGET_AARCH64 */
 
     if (!cpu->has_vfp) {
         uint64_t t;
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 9bc5ddfc09..d67c0b1be4 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -22,6 +22,8 @@
 #include "qapi/error.h"
 #include "qemu/qemu-print.h"
 #include "cpu.h"
+#include "cpu-sve.h"
+#include "tcg/cpu-pauth.h"
 #include "cpu-exceptions-aa64.h"
 #include "qemu/module.h"
 #include "sysemu/tcg.h"
@@ -454,6 +456,29 @@ static gchar *aarch64_gdb_arch_name(CPUState *cs)
     return g_strdup("aarch64");
 }
 
+bool aarch64_cpu_finalize_features(ARMCPU *cpu, Error **errp)
+{
+    if (!cpu_sve_finalize_features(cpu, errp)) {
+        return false;
+    }
+    if (tcg_enabled()) {
+        /*
+         * KVM does not support modifications to this feature.
+         * We have not registered the cpu properties when KVM
+         * is in use, so the user will not be able to set them.
+         */
+        if (!cpu_pauth_finalize(cpu, errp)) {
+            return false;
+        }
+    }
+    if (kvm_enabled()) {
+        if (!kvm_arm_steal_time_finalize(cpu, errp)) {
+            return false;
+        }
+    }
+    return true;
+}
+
 static void aarch64_cpu_dump_state(CPUState *cs, FILE *f, int flags)
 {
     ARMCPU *cpu = ARM_CPU(cs);
diff --git a/target/arm/kvm/kvm64.c b/target/arm/kvm/kvm64.c
index b34642e74c..372957331b 100644
--- a/target/arm/kvm/kvm64.c
+++ b/target/arm/kvm/kvm64.c
@@ -677,7 +677,7 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
     return true;
 }
 
-void kvm_arm_steal_time_finalize(ARMCPU *cpu, Error **errp)
+bool kvm_arm_steal_time_finalize(ARMCPU *cpu, Error **errp)
 {
     bool has_steal_time = kvm_arm_steal_time_supported();
 
@@ -691,7 +691,7 @@ void kvm_arm_steal_time_finalize(ARMCPU *cpu, Error **errp)
         if (!has_steal_time) {
             error_setg(errp, "'kvm-steal-time' cannot be enabled "
                              "on this host");
-            return;
+            return false;
         } else if (!arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
             /*
              * DEN0057A chapter 2 says "This specification only covers
@@ -702,9 +702,10 @@ void kvm_arm_steal_time_finalize(ARMCPU *cpu, Error **errp)
              */
             error_setg(errp, "'kvm-steal-time' cannot be enabled "
                              "for AArch32 guests");
-            return;
+            return false;
         }
     }
+    return true;
 }
 
 bool kvm_arm_aarch32_supported(void)
diff --git a/target/arm/monitor.c b/target/arm/monitor.c
index 0c72bf7c31..8a31c4dd04 100644
--- a/target/arm/monitor.c
+++ b/target/arm/monitor.c
@@ -184,9 +184,11 @@ CpuModelExpansionInfo *qmp_query_cpu_model_expansion(CpuModelExpansionType type,
         if (!err) {
             visit_check_struct(visitor, &err);
         }
+#ifdef TARGET_AARCH64
         if (!err) {
-            arm_cpu_finalize_features(ARM_CPU(obj), &err);
+            aarch64_cpu_finalize_features(ARM_CPU(obj), &err);
         }
+#endif /* TARGET_AARCH64 */
         visit_end_struct(visitor, NULL);
         visit_free(visitor);
         if (err) {
@@ -195,7 +197,9 @@ CpuModelExpansionInfo *qmp_query_cpu_model_expansion(CpuModelExpansionType type,
             return NULL;
         }
     } else {
-        arm_cpu_finalize_features(ARM_CPU(obj), &error_abort);
+#ifdef TARGET_AARCH64
+        aarch64_cpu_finalize_features(ARM_CPU(obj), &error_abort);
+#endif /* TARGET_AARCH64 */
     }
 
     expansion_info = g_new0(CpuModelExpansionInfo, 1);
-- 
2.26.2


