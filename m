Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED0D035F3C5
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Apr 2021 14:29:47 +0200 (CEST)
Received: from localhost ([::1]:36618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWeeR-0001kl-32
	for lists+qemu-devel@lfdr.de; Wed, 14 Apr 2021 08:29:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lWdh5-0007F9-V5
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 07:28:28 -0400
Received: from mx2.suse.de ([195.135.220.15]:45968)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lWdgu-0005qk-Cm
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 07:28:27 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D7C24B1C9;
 Wed, 14 Apr 2021 11:27:27 +0000 (UTC)
From: Claudio Fontana <cfontana@suse.de>
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC v13 76/80] target/arm: cpu64: rename arm_cpu_finalize_features
Date: Wed, 14 Apr 2021 13:26:46 +0200
Message-Id: <20210414112650.18003-77-cfontana@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210414112650.18003-1-cfontana@suse.de>
References: <20210414112650.18003-1-cfontana@suse.de>
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

also remove the now useless ifdef TARGET_AARCH64 from the function

Signed-off-by: Claudio Fontana <cfontana@suse.de>
---
 target/arm/cpu-sve.h       | 2 +-
 target/arm/cpu.h           | 2 +-
 target/arm/tcg/cpu-pauth.h | 2 +-
 target/arm/cpu.c           | 2 +-
 target/arm/cpu64.c         | 4 +---
 target/arm/monitor.c       | 4 ++--
 6 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/target/arm/cpu-sve.h b/target/arm/cpu-sve.h
index c83508ea0a..85078550bb 100644
--- a/target/arm/cpu-sve.h
+++ b/target/arm/cpu-sve.h
@@ -25,7 +25,7 @@
 
 #include "cpu.h"
 
-/* called by arm_cpu_finalize_features in realizefn */
+/* called by aarch64_cpu_finalize_features in realizefn */
 bool cpu_sve_finalize_features(ARMCPU *cpu, Error **errp);
 
 /* add the CPU SVE properties */
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 236717ec71..dbbad48fda 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2110,7 +2110,7 @@ static inline int arm_feature(CPUARMState *env, int feature)
     return (env->features & (1ULL << feature)) != 0;
 }
 
-void arm_cpu_finalize_features(ARMCPU *cpu, Error **errp);
+void aarch64_cpu_finalize_features(ARMCPU *cpu, Error **errp);
 
 #if !defined(CONFIG_USER_ONLY)
 /* Return true if exception levels below EL3 are in secure state,
diff --git a/target/arm/tcg/cpu-pauth.h b/target/arm/tcg/cpu-pauth.h
index a0ef74dc77..b106b9cefc 100644
--- a/target/arm/tcg/cpu-pauth.h
+++ b/target/arm/tcg/cpu-pauth.h
@@ -25,7 +25,7 @@
 
 #include "cpu.h"
 
-/* called by arm_cpu_finalize_features in realizefn */
+/* called by aarch64_cpu_finalize_features in realizefn */
 bool cpu_pauth_finalize(ARMCPU *cpu, Error **errp);
 
 /* add the CPU Pointer Authentication properties */
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 4d0724b537..fac297df4e 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -843,7 +843,7 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
     }
 
 #ifdef TARGET_AARCH64
-    arm_cpu_finalize_features(cpu, &local_err);
+    aarch64_cpu_finalize_features(cpu, &local_err);
     if (local_err != NULL) {
         error_propagate(errp, local_err);
         return;
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index bcbfc5d53a..5b8dc8ff14 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -455,11 +455,10 @@ static gchar *aarch64_gdb_arch_name(CPUState *cs)
     return g_strdup("aarch64");
 }
 
-void arm_cpu_finalize_features(ARMCPU *cpu, Error **errp)
+void aarch64_cpu_finalize_features(ARMCPU *cpu, Error **errp)
 {
     Error *local_err = NULL;
 
-#ifdef TARGET_AARCH64
     if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
         if (!cpu_sve_finalize_features(cpu, &local_err)) {
             error_propagate(errp, local_err);
@@ -478,7 +477,6 @@ void arm_cpu_finalize_features(ARMCPU *cpu, Error **errp)
             }
         }
     }
-#endif /* TARGET_AARCH64 */
 
     if (kvm_enabled()) {
         kvm_arm_steal_time_finalize(cpu, &local_err);
diff --git a/target/arm/monitor.c b/target/arm/monitor.c
index 95c1e72cd1..8a31c4dd04 100644
--- a/target/arm/monitor.c
+++ b/target/arm/monitor.c
@@ -186,7 +186,7 @@ CpuModelExpansionInfo *qmp_query_cpu_model_expansion(CpuModelExpansionType type,
         }
 #ifdef TARGET_AARCH64
         if (!err) {
-            arm_cpu_finalize_features(ARM_CPU(obj), &err);
+            aarch64_cpu_finalize_features(ARM_CPU(obj), &err);
         }
 #endif /* TARGET_AARCH64 */
         visit_end_struct(visitor, NULL);
@@ -198,7 +198,7 @@ CpuModelExpansionInfo *qmp_query_cpu_model_expansion(CpuModelExpansionType type,
         }
     } else {
 #ifdef TARGET_AARCH64
-        arm_cpu_finalize_features(ARM_CPU(obj), &error_abort);
+        aarch64_cpu_finalize_features(ARM_CPU(obj), &error_abort);
 #endif /* TARGET_AARCH64 */
     }
 
-- 
2.26.2


