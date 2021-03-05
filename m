Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E10932EECB
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 16:28:43 +0100 (CET)
Received: from localhost ([::1]:40844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lICNe-0006Qw-Ks
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 10:28:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lIBwR-00028f-7o
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 10:00:35 -0500
Received: from mx2.suse.de ([195.135.220.15]:59968)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lIBwL-00043i-Ds
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 10:00:34 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 31F01AFF4;
 Fri,  5 Mar 2021 14:59:58 +0000 (UTC)
From: Claudio Fontana <cfontana@suse.de>
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC v4 30/33] target/arm: remove broad "else" statements when
 checking accels
Date: Fri,  5 Mar 2021 15:59:38 +0100
Message-Id: <20210305145941.32020-31-cfontana@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210305145941.32020-1-cfontana@suse.de>
References: <20210305145941.32020-1-cfontana@suse.de>
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

There might be more than just KVM and TCG in the future,
so where appropriate, replace broad "else" statements
with the appropriate if (accel_enabled()) check.

Also invert some checks for !kvm_enabled() or !tcg_enabled()
where it seems appropriate to do so.

Note that to make qtest happy we need to perform gpio
initialization in the qtest_enabled() case as well.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
---
 target/arm/cpu.c     | 10 ++++++----
 target/arm/cpu64.c   | 13 +++++++++----
 target/arm/machine.c | 19 ++++++-------------
 3 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index be86bd4b8b..353cd652bc 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -37,6 +37,7 @@
 #endif
 
 #include "sysemu/tcg.h"
+#include "sysemu/qtest.h"
 #include "kvm/kvm_arm.h"
 #include "disas/capstone.h"
 #include "fpu/softfloat.h"
@@ -564,7 +565,8 @@ static void arm_cpu_initfn(Object *obj)
          * the same interface as non-KVM CPUs.
          */
         qdev_init_gpio_in(DEVICE(cpu), arm_cpu_kvm_set_irq, 4);
-    } else {
+    }
+    if (tcg_enabled() || qtest_enabled()) {
         qdev_init_gpio_in(DEVICE(cpu), arm_cpu_set_irq, 4);
     }
 
@@ -741,14 +743,14 @@ void arm_cpu_post_init(Object *obj)
         ? cpu_isar_feature(aa64_fp_simd, cpu)
         : cpu_isar_feature(aa32_vfp, cpu)) {
         cpu->has_vfp = true;
-        if (!kvm_enabled()) {
+        if (tcg_enabled()) {
             qdev_property_add_static(DEVICE(obj), &arm_cpu_has_vfp_property);
         }
     }
 
     if (arm_feature(&cpu->env, ARM_FEATURE_NEON)) {
         cpu->has_neon = true;
-        if (!kvm_enabled()) {
+        if (tcg_enabled()) {
             qdev_property_add_static(DEVICE(obj), &arm_cpu_has_neon_property);
         }
     }
@@ -849,7 +851,7 @@ void arm_cpu_finalize_features(ARMCPU *cpu, Error **errp)
          * We have not registered the cpu properties when KVM
          * is in use, so the user will not be able to set them.
          */
-        if (!kvm_enabled()) {
+        if (tcg_enabled()) {
             arm_cpu_pauth_finalize(cpu, &local_err);
             if (local_err != NULL) {
                 error_propagate(errp, local_err);
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 7c27b0febb..be3c1c6f36 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -23,6 +23,7 @@
 #include "qemu/qemu-print.h"
 #include "cpu.h"
 #include "qemu/module.h"
+#include "sysemu/tcg.h"
 #include "sysemu/kvm.h"
 #include "kvm/kvm_arm.h"
 #include "qapi/visitor.h"
@@ -296,7 +297,8 @@ void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp)
              */
             bitmap_andnot(tmp, kvm_supported, cpu->sve_vq_init, max_vq);
             bitmap_or(cpu->sve_vq_map, cpu->sve_vq_map, tmp, max_vq);
-        } else {
+        }
+        if (tcg_enabled()) {
             /* Propagate enabled bits down through required powers-of-two. */
             for (vq = pow2floor(max_vq); vq >= 1; vq >>= 1) {
                 if (!test_bit(vq - 1, cpu->sve_vq_init)) {
@@ -333,7 +335,8 @@ void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp)
                                   "vector length must be enabled.\n");
                 return;
             }
-        } else {
+        }
+        if (tcg_enabled()) {
             /* Disabling a power-of-two disables all larger lengths. */
             if (test_bit(0, cpu->sve_vq_init)) {
                 error_setg(errp, "cannot disable sve128");
@@ -415,7 +418,8 @@ void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp)
             }
             return;
         }
-    } else {
+    }
+    if (tcg_enabled()) {
         /* Ensure all required powers-of-two are enabled. */
         for (vq = pow2floor(max_vq); vq >= 1; vq >>= 1) {
             if (!test_bit(vq - 1, cpu->sve_vq_map)) {
@@ -609,7 +613,8 @@ static void aarch64_max_initfn(Object *obj)
 
     if (kvm_enabled()) {
         kvm_arm_set_cpu_features_from_host(cpu);
-    } else {
+    }
+    if (tcg_enabled()) {
         uint64_t t;
         uint32_t u;
         aarch64_a57_initfn(obj);
diff --git a/target/arm/machine.c b/target/arm/machine.c
index 595ab94237..cfc2bb4982 100644
--- a/target/arm/machine.c
+++ b/target/arm/machine.c
@@ -638,24 +638,21 @@ static int cpu_pre_save(void *opaque)
 
     if (tcg_enabled()) {
         pmu_op_start(&cpu->env);
+        if (!write_cpustate_to_list(cpu, false)) {
+            /* This should never fail. */
+            abort();
+        }
     }
-
     if (kvm_enabled()) {
         if (!write_kvmstate_to_list(cpu)) {
             /* This should never fail */
             abort();
         }
-
         /*
          * kvm_arm_cpu_pre_save() must be called after
          * write_kvmstate_to_list()
          */
         kvm_arm_cpu_pre_save(cpu);
-    } else {
-        if (!write_cpustate_to_list(cpu, false)) {
-            /* This should never fail. */
-            abort();
-        }
     }
 
     cpu->cpreg_vmstate_array_len = cpu->cpreg_array_len;
@@ -754,20 +751,16 @@ static int cpu_post_load(void *opaque, int version_id)
          */
         write_list_to_cpustate(cpu);
         kvm_arm_cpu_post_load(cpu);
-    } else {
+    }
+    if (tcg_enabled()) {
         if (!write_list_to_cpustate(cpu)) {
             return -1;
         }
-    }
-
-    if (tcg_enabled()) {
         hw_breakpoint_update_all(cpu);
         hw_watchpoint_update_all(cpu);
-
         pmu_op_finish(&cpu->env);
         arm_rebuild_hflags(&cpu->env);
     }
-
     return 0;
 }
 
-- 
2.26.2


