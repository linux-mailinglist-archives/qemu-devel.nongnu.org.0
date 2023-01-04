Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1184865DFE8
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Jan 2023 23:22:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDBpQ-0005rF-1u; Wed, 04 Jan 2023 17:01:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pDBp4-0005a6-33; Wed, 04 Jan 2023 17:01:25 -0500
Received: from smtp-out1.suse.de ([2001:67c:2178:6::1c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pDBp0-0002vr-Jq; Wed, 04 Jan 2023 17:01:21 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E40724D802;
 Wed,  4 Jan 2023 22:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1672869676; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FQWKf42WdYIRelmjsSpz3+3V2eDmolRC00cxxxE3GbI=;
 b=Q0/rWGlBGyUEdAW8vyMeTYQ/J+R5baRSM3beg7Jc0lqCnjKIlqGF79WFGUeWa3eAhIXo/N
 hVuSqXuX5dNg9T10ehrZzAu0OPD6qZK05TS860faYgS866/DTQl/YhUY38cSH856rCkDqg
 JZL+kyFpqgjDUWOmJLNOBehTBueQZc8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1672869676;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FQWKf42WdYIRelmjsSpz3+3V2eDmolRC00cxxxE3GbI=;
 b=lde44PVCRW4Fr0uo0Ww52oAvlC9o74l9dV3dg0uT7CsW0Vd1yCQDPFsCv7f/0LsL/0Keh5
 7gdE/2H2wMYEpuCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 386321342C;
 Wed,  4 Jan 2023 22:01:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id QC+kACr3tWPwJAAAMHmgww
 (envelope-from <farosas@suse.de>); Wed, 04 Jan 2023 22:01:14 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>
Subject: [RFC PATCH 11/27] target/arm: only perform TCG cpu and machine inits
 if TCG enabled
Date: Wed,  4 Jan 2023 18:58:19 -0300
Message-Id: <20230104215835.24692-12-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230104215835.24692-1-farosas@suse.de>
References: <20230104215835.24692-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:67c:2178:6::1c; envelope-from=farosas@suse.de;
 helo=smtp-out1.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Claudio Fontana <cfontana@suse.de>

of note, cpreg lists were previously initialized by TCG first,
and then thrown away and replaced with the data coming from KVM.

Now we just initialize once, either for TCG or for KVM.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
[moved arm_cpu_register_gdb_regs_for_features out of tcg_enabled]
Signed-off-by: Fabiano Rosas <farosas@suse.de>
---
 target/arm/cpu.c     | 31 +++++++++++++++++-------------
 target/arm/kvm.c     | 18 +++++++++---------
 target/arm/kvm_arm.h |  3 +--
 target/arm/machine.c | 45 +++++++++++++++++++++++++-------------------
 4 files changed, 54 insertions(+), 43 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index f5381af437..5a132aa7bc 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -524,9 +524,11 @@ static void arm_cpu_reset_hold(Object *obj)
     }
 #endif
 
-    hw_breakpoint_update_all(cpu);
-    hw_watchpoint_update_all(cpu);
-    arm_rebuild_hflags(env);
+    if (tcg_enabled()) {
+        hw_breakpoint_update_all(cpu);
+        hw_watchpoint_update_all(cpu);
+        arm_rebuild_hflags(env);
+    }
 }
 
 #if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
@@ -1599,6 +1601,7 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
         }
     }
 
+#ifdef CONFIG_TCG
     {
         uint64_t scale;
 
@@ -1624,7 +1627,8 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
         cpu->gt_timer[GTIMER_HYPVIRT] = timer_new(QEMU_CLOCK_VIRTUAL, scale,
                                                   arm_gt_hvtimer_cb, cpu);
     }
-#endif
+#endif /* CONFIG_TCG */
+#endif /* !CONFIG_USER_ONLY */
 
     cpu_exec_realizefn(cs, &local_err);
     if (local_err != NULL) {
@@ -1942,17 +1946,16 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
         unset_feature(env, ARM_FEATURE_PMU);
     }
     if (arm_feature(env, ARM_FEATURE_PMU)) {
-        pmu_init(cpu);
-
-        if (!kvm_enabled()) {
+        if (tcg_enabled()) {
+            pmu_init(cpu);
             arm_register_pre_el_change_hook(cpu, &pmu_pre_el_change, 0);
             arm_register_el_change_hook(cpu, &pmu_post_el_change, 0);
-        }
 
 #ifndef CONFIG_USER_ONLY
-        cpu->pmu_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, arm_pmu_timer_cb,
-                cpu);
+            cpu->pmu_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, arm_pmu_timer_cb,
+                                          cpu);
 #endif
+        }
     } else {
         cpu->isar.id_aa64dfr0 =
             FIELD_DP64(cpu->isar.id_aa64dfr0, ID_AA64DFR0, PMUVER, 0);
@@ -2048,11 +2051,13 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
         set_feature(env, ARM_FEATURE_VBAR);
     }
 
-    register_cp_regs_for_features(cpu);
+    if (tcg_enabled()) {
+        register_cp_regs_for_features(cpu);
+        init_cpreg_list(cpu);
+    }
+
     arm_cpu_register_gdb_regs_for_features(cpu);
 
-    init_cpreg_list(cpu);
-
 #ifndef CONFIG_USER_ONLY
     MachineState *ms = MACHINE(qdev_get_machine());
     unsigned int smp_cpus = ms->smp.cpus;
diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index f022c644d2..2f01c26f54 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -438,9 +438,11 @@ static uint64_t *kvm_arm_get_cpreg_ptr(ARMCPU *cpu, uint64_t regidx)
     return &cpu->cpreg_values[res - cpu->cpreg_indexes];
 }
 
-/* Initialize the ARMCPU cpreg list according to the kernel's
- * definition of what CPU registers it knows about (and throw away
- * the previous TCG-created cpreg list).
+/*
+ * Initialize the ARMCPU cpreg list according to the kernel's
+ * definition of what CPU registers it knows about.
+ *
+ * The parallel for TCG is init_cpreg_list()
  */
 int kvm_arm_init_cpreg_list(ARMCPU *cpu)
 {
@@ -482,12 +484,10 @@ int kvm_arm_init_cpreg_list(ARMCPU *cpu)
         arraylen++;
     }
 
-    cpu->cpreg_indexes = g_renew(uint64_t, cpu->cpreg_indexes, arraylen);
-    cpu->cpreg_values = g_renew(uint64_t, cpu->cpreg_values, arraylen);
-    cpu->cpreg_vmstate_indexes = g_renew(uint64_t, cpu->cpreg_vmstate_indexes,
-                                         arraylen);
-    cpu->cpreg_vmstate_values = g_renew(uint64_t, cpu->cpreg_vmstate_values,
-                                        arraylen);
+    cpu->cpreg_indexes = g_new(uint64_t, arraylen);
+    cpu->cpreg_values = g_new(uint64_t, arraylen);
+    cpu->cpreg_vmstate_indexes = g_new(uint64_t, arraylen);
+    cpu->cpreg_vmstate_values = g_new(uint64_t, arraylen);
     cpu->cpreg_array_len = arraylen;
     cpu->cpreg_vmstate_array_len = arraylen;
 
diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
index 99017b635c..41de2a7cf1 100644
--- a/target/arm/kvm_arm.h
+++ b/target/arm/kvm_arm.h
@@ -70,8 +70,7 @@ void kvm_arm_register_device(MemoryRegion *mr, uint64_t devid, uint64_t group,
  * @cpu: ARMCPU
  *
  * Initialize the ARMCPU cpreg list according to the kernel's
- * definition of what CPU registers it knows about (and throw away
- * the previous TCG-created cpreg list).
+ * definition of what CPU registers it knows about.
  *
  * Returns: 0 if success, else < 0 error code
  */
diff --git a/target/arm/machine.c b/target/arm/machine.c
index a186787d2b..5ac1e6173a 100644
--- a/target/arm/machine.c
+++ b/target/arm/machine.c
@@ -2,6 +2,7 @@
 #include "cpu.h"
 #include "qemu/error-report.h"
 #include "sysemu/kvm.h"
+#include "sysemu/tcg.h"
 #include "kvm_arm.h"
 #include "internals.h"
 #include "migration/cpu.h"
@@ -687,7 +688,7 @@ static int cpu_pre_save(void *opaque)
 {
     ARMCPU *cpu = opaque;
 
-    if (!kvm_enabled()) {
+    if (tcg_enabled()) {
         pmu_op_start(&cpu->env);
     }
 
@@ -722,7 +723,7 @@ static int cpu_post_save(void *opaque)
 {
     ARMCPU *cpu = opaque;
 
-    if (!kvm_enabled()) {
+    if (tcg_enabled()) {
         pmu_op_finish(&cpu->env);
     }
 
@@ -741,7 +742,7 @@ static int cpu_pre_load(void *opaque)
      */
     env->irq_line_state = UINT32_MAX;
 
-    if (!kvm_enabled()) {
+    if (tcg_enabled()) {
         pmu_op_start(&cpu->env);
     }
 
@@ -820,27 +821,28 @@ static int cpu_post_load(void *opaque, int version_id)
         return -1;
     }
 
-    hw_breakpoint_update_all(cpu);
-    hw_watchpoint_update_all(cpu);
+    if (tcg_enabled()) {
+        hw_breakpoint_update_all(cpu);
+        hw_watchpoint_update_all(cpu);
 
-    /*
-     * TCG gen_update_fp_context() relies on the invariant that
-     * FPDSCR.LTPSIZE is constant 4 for M-profile with the LOB extension;
-     * forbid bogus incoming data with some other value.
-     */
-    if (arm_feature(env, ARM_FEATURE_M) && cpu_isar_feature(aa32_lob, cpu)) {
-        if (extract32(env->v7m.fpdscr[M_REG_NS],
-                      FPCR_LTPSIZE_SHIFT, FPCR_LTPSIZE_LENGTH) != 4 ||
-            extract32(env->v7m.fpdscr[M_REG_S],
-                      FPCR_LTPSIZE_SHIFT, FPCR_LTPSIZE_LENGTH) != 4) {
-            return -1;
+        /*
+         * TCG gen_update_fp_context() relies on the invariant that
+         * FPDSCR.LTPSIZE is constant 4 for M-profile with the LOB extension;
+         * forbid bogus incoming data with some other value.
+         */
+        if (arm_feature(env, ARM_FEATURE_M) &&
+            cpu_isar_feature(aa32_lob, cpu)) {
+            if (extract32(env->v7m.fpdscr[M_REG_NS],
+                          FPCR_LTPSIZE_SHIFT, FPCR_LTPSIZE_LENGTH) != 4 ||
+                extract32(env->v7m.fpdscr[M_REG_S],
+                          FPCR_LTPSIZE_SHIFT, FPCR_LTPSIZE_LENGTH) != 4) {
+                return -1;
+            }
         }
-    }
 
-    if (!kvm_enabled()) {
         pmu_op_finish(&cpu->env);
+        arm_rebuild_hflags(&cpu->env);
     }
-    arm_rebuild_hflags(&cpu->env);
 
     return 0;
 }
@@ -890,8 +892,13 @@ const VMStateDescription vmstate_arm_cpu = {
         VMSTATE_UINT32(env.exception.syndrome, ARMCPU),
         VMSTATE_UINT32(env.exception.fsr, ARMCPU),
         VMSTATE_UINT64(env.exception.vaddress, ARMCPU),
+#ifdef CONFIG_TCG
         VMSTATE_TIMER_PTR(gt_timer[GTIMER_PHYS], ARMCPU),
         VMSTATE_TIMER_PTR(gt_timer[GTIMER_VIRT], ARMCPU),
+#else
+        VMSTATE_UNUSED(sizeof(QEMUTimer *)),
+        VMSTATE_UNUSED(sizeof(QEMUTimer *)),
+#endif /* CONFIG_TCG */
         {
             .name = "power_state",
             .version_id = 0,
-- 
2.35.3


