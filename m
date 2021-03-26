Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F123034AFCB
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 21:07:11 +0100 (CET)
Received: from localhost ([::1]:37270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPsje-0004oN-VU
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 16:07:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lPsHG-0006fC-DE
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 15:37:50 -0400
Received: from mx2.suse.de ([195.135.220.15]:45614)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lPsHD-00011V-6J
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 15:37:50 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 669AFAF48;
 Fri, 26 Mar 2021 19:37:31 +0000 (UTC)
From: Claudio Fontana <cfontana@suse.de>
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC v12 23/65] target/arm: move sve_zcr_len_for_el to common_cpu
Date: Fri, 26 Mar 2021 20:36:19 +0100
Message-Id: <20210326193701.5981-24-cfontana@suse.de>
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

it is required by arch-dump.c and cpu.c, so apparently
we need this for KVM too

Signed-off-by: Claudio Fontana <cfontana@suse.de>
---
 target/arm/cpu-common.c | 43 +++++++++++++++++++++++++++++++++++++++++
 target/arm/tcg/helper.c | 33 -------------------------------
 2 files changed, 43 insertions(+), 33 deletions(-)

diff --git a/target/arm/cpu-common.c b/target/arm/cpu-common.c
index 040e06392a..a34f7f19d8 100644
--- a/target/arm/cpu-common.c
+++ b/target/arm/cpu-common.c
@@ -299,3 +299,46 @@ uint64_t arm_hcr_el2_eff(CPUARMState *env)
 
     return ret;
 }
+
+/*
+ * these are AARCH64-only, but due to the chain of dependencies,
+ * between HELPER prototypes, hflags, cpreg definitions and functions in
+ * tcg/ etc, it becomes incredibly messy to add what should be here:
+ *
+ * #ifdef TARGET_AARCH64
+ */
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
+
+/* #endif TARGET_AARCH64 , see matching comment above */
diff --git a/target/arm/tcg/helper.c b/target/arm/tcg/helper.c
index 4b8a0d436c..5bc0055c87 100644
--- a/target/arm/tcg/helper.c
+++ b/target/arm/tcg/helper.c
@@ -322,39 +322,6 @@ int sve_exception_el(CPUARMState *env, int el)
     return 0;
 }
 
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
 void hw_watchpoint_update(ARMCPU *cpu, int n)
 {
     CPUARMState *env = &cpu->env;
-- 
2.26.2


