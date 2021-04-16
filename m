Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18973362720
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 19:46:52 +0200 (CEST)
Received: from localhost ([::1]:35448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXSYN-00023U-5X
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 13:46:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lXRLc-0005LK-VK
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 12:29:36 -0400
Received: from mx2.suse.de ([195.135.220.15]:47104)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lXRLR-0001eI-Pl
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 12:29:36 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 31163B30F;
 Fri, 16 Apr 2021 16:29:00 +0000 (UTC)
From: Claudio Fontana <cfontana@suse.de>
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC v14 75/80] target/arm: move arm_cpu_finalize_features into cpu64
Date: Fri, 16 Apr 2021 18:28:19 +0200
Message-Id: <20210416162824.25131-76-cfontana@suse.de>
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

all the features in arm_cpu_finalize_features are actually
TARGET_AARCH64-only now, since KVM is now only supported on 64bit.

Therefore move the function to cpu64.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
---
 target/arm/cpu.c     | 36 ++----------------------------------
 target/arm/cpu64.c   | 34 ++++++++++++++++++++++++++++++++++
 target/arm/monitor.c |  4 ++++
 3 files changed, 40 insertions(+), 34 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index b91c48cd2f..4d0724b537 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -820,40 +820,6 @@ static void arm_cpu_finalizefn(Object *obj)
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
@@ -876,6 +842,7 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
         return;
     }
 
+#ifdef TARGET_AARCH64
     arm_cpu_finalize_features(cpu, &local_err);
     if (local_err != NULL) {
         error_propagate(errp, local_err);
@@ -892,6 +859,7 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
                    "AArch64 CPUs must have both VFP and Neon or neither");
         return;
     }
+#endif /* TARGET_AARCH64 */
 
     if (!cpu->has_vfp) {
         uint64_t t;
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index b76fbb4947..bcbfc5d53a 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -455,6 +455,40 @@ static gchar *aarch64_gdb_arch_name(CPUState *cs)
     return g_strdup("aarch64");
 }
 
+void arm_cpu_finalize_features(ARMCPU *cpu, Error **errp)
+{
+    Error *local_err = NULL;
+
+#ifdef TARGET_AARCH64
+    if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
+        if (!cpu_sve_finalize_features(cpu, &local_err)) {
+            error_propagate(errp, local_err);
+            return;
+        }
+
+        /*
+         * KVM does not support modifications to this feature.
+         * We have not registered the cpu properties when KVM
+         * is in use, so the user will not be able to set them.
+         */
+        if (tcg_enabled()) {
+            if (!cpu_pauth_finalize(cpu, &local_err)) {
+                error_propagate(errp, local_err);
+                return;
+            }
+        }
+    }
+#endif /* TARGET_AARCH64 */
+
+    if (kvm_enabled()) {
+        kvm_arm_steal_time_finalize(cpu, &local_err);
+        if (local_err != NULL) {
+            error_propagate(errp, local_err);
+            return;
+        }
+    }
+}
+
 static void aarch64_cpu_dump_state(CPUState *cs, FILE *f, int flags)
 {
     ARMCPU *cpu = ARM_CPU(cs);
diff --git a/target/arm/monitor.c b/target/arm/monitor.c
index 0c72bf7c31..95c1e72cd1 100644
--- a/target/arm/monitor.c
+++ b/target/arm/monitor.c
@@ -184,9 +184,11 @@ CpuModelExpansionInfo *qmp_query_cpu_model_expansion(CpuModelExpansionType type,
         if (!err) {
             visit_check_struct(visitor, &err);
         }
+#ifdef TARGET_AARCH64
         if (!err) {
             arm_cpu_finalize_features(ARM_CPU(obj), &err);
         }
+#endif /* TARGET_AARCH64 */
         visit_end_struct(visitor, NULL);
         visit_free(visitor);
         if (err) {
@@ -195,7 +197,9 @@ CpuModelExpansionInfo *qmp_query_cpu_model_expansion(CpuModelExpansionType type,
             return NULL;
         }
     } else {
+#ifdef TARGET_AARCH64
         arm_cpu_finalize_features(ARM_CPU(obj), &error_abort);
+#endif /* TARGET_AARCH64 */
     }
 
     expansion_info = g_new0(CpuModelExpansionInfo, 1);
-- 
2.26.2


