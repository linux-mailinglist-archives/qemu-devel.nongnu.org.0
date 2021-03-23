Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6618A34651D
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 17:29:07 +0100 (CET)
Received: from localhost ([::1]:48858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOjtu-0006V1-41
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 12:29:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lOjGO-0007X2-JQ
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 11:48:14 -0400
Received: from mx2.suse.de ([195.135.220.15]:54876)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lOjFq-0000z9-FL
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 11:48:12 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 32AF1AF75;
 Tue, 23 Mar 2021 15:47:05 +0000 (UTC)
From: Claudio Fontana <cfontana@suse.de>
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC v11 47/55] target/arm: make is_aa64 and arm_el_is_aa64 a macro
 for !TARGET_AARCH64
Date: Tue, 23 Mar 2021 16:46:31 +0100
Message-Id: <20210323154639.23477-40-cfontana@suse.de>
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

when TARGET_AARCH64 is not defined, it is helpful to make
is_aa64() and arm_el_is_aa64 macros defined to "false".

This way we can make more code TARGET_AARCH64-only.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
---
 target/arm/cpu.h            | 37 ++++++++++++++++++++++++-------------
 target/arm/cpu-mmu-sysemu.c |  6 ++----
 2 files changed, 26 insertions(+), 17 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index a7646d56c5..50a7544d40 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1051,6 +1051,11 @@ void aarch64_sve_narrow_vq(CPUARMState *env, unsigned vq);
 void aarch64_sve_change_el(CPUARMState *env, int old_el,
                            int new_el, bool el0_a64);
 
+static inline bool is_a64(CPUARMState *env)
+{
+    return env->aarch64;
+}
+
 /*
  * SVE registers are encoded in KVM's memory in an endianness-invariant format.
  * The byte at offset i from the start of the in-memory representation contains
@@ -1080,7 +1085,10 @@ static inline void aarch64_sve_narrow_vq(CPUARMState *env, unsigned vq) { }
 static inline void aarch64_sve_change_el(CPUARMState *env, int o,
                                          int n, bool a)
 { }
-#endif
+
+#define is_a64(env) (false)
+
+#endif /* TARGET_AARCH64 */
 
 void aarch64_sync_32_to_64(CPUARMState *env);
 void aarch64_sync_64_to_32(CPUARMState *env);
@@ -1089,11 +1097,6 @@ int fp_exception_el(CPUARMState *env, int cur_el);
 int sve_exception_el(CPUARMState *env, int cur_el);
 uint32_t sve_zcr_len_for_el(CPUARMState *env, int el);
 
-static inline bool is_a64(CPUARMState *env)
-{
-    return env->aarch64;
-}
-
 /* you can call this signal handler from your SIGBUS and SIGSEGV
    signal handlers to inform the virtual CPU of exceptions. non zero
    is returned if the signal was handled by the virtual CPU.  */
@@ -2193,13 +2196,7 @@ static inline bool arm_is_el2_enabled(CPUARMState *env)
 }
 #endif
 
-/**
- * arm_hcr_el2_eff(): Return the effective value of HCR_EL2.
- * E.g. when in secure state, fields in HCR_EL2 are suppressed,
- * "for all purposes other than a direct read or write access of HCR_EL2."
- * Not included here is HCR_RW.
- */
-uint64_t arm_hcr_el2_eff(CPUARMState *env);
+#ifdef TARGET_AARCH64
 
 /* Return true if the specified exception level is running in AArch64 state. */
 static inline bool arm_el_is_aa64(CPUARMState *env, int el)
@@ -2234,6 +2231,20 @@ static inline bool arm_el_is_aa64(CPUARMState *env, int el)
     return aa64;
 }
 
+#else
+
+#define arm_el_is_aa64(env, el) (false)
+
+#endif /* TARGET_AARCH64 */
+
+/**
+ * arm_hcr_el2_eff(): Return the effective value of HCR_EL2.
+ * E.g. when in secure state, fields in HCR_EL2 are suppressed,
+ * "for all purposes other than a direct read or write access of HCR_EL2."
+ * Not included here is HCR_RW.
+ */
+uint64_t arm_hcr_el2_eff(CPUARMState *env);
+
 /* Function for determing whether guest cp register reads and writes should
  * access the secure or non-secure bank of a cp register.  When EL3 is
  * operating in AArch32 state, the NS-bit determines whether the secure
diff --git a/target/arm/cpu-mmu-sysemu.c b/target/arm/cpu-mmu-sysemu.c
index 9d4735a190..4faa68fcd1 100644
--- a/target/arm/cpu-mmu-sysemu.c
+++ b/target/arm/cpu-mmu-sysemu.c
@@ -787,7 +787,6 @@ static bool check_s2_mmu_setup(ARMCPU *cpu, bool is_aa64, int level,
     }
 
     if (is_aa64) {
-        CPUARMState *env = &cpu->env;
         unsigned int pamax = arm_pamax(cpu);
 
         switch (stride) {
@@ -812,7 +811,7 @@ static bool check_s2_mmu_setup(ARMCPU *cpu, bool is_aa64, int level,
 
         /* Inputsize checks.  */
         if (inputsize > pamax &&
-            (arm_el_is_aa64(env, 1) || inputsize > 40)) {
+            (arm_el_is_aa64(&cpu->env, 1) || inputsize > 40)) {
             /* This is CONSTRAINED UNPREDICTABLE and we choose to fault.  */
             return false;
         }
@@ -967,9 +966,8 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
     int addrsize, inputsize;
     TCR *tcr = regime_tcr(env, mmu_idx);
     int ap, ns, xn, pxn;
-    uint32_t el = regime_el(env, mmu_idx);
     uint64_t descaddrmask;
-    bool aarch64 = arm_el_is_aa64(env, el);
+    bool aarch64 = arm_el_is_aa64(env, regime_el(env, mmu_idx));
     bool guarded = false;
 
     /* TODO: This code does not support shareability levels. */
-- 
2.26.2


