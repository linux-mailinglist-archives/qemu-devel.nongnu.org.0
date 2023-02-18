Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76C1069B3B5
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 21:18:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pT785-0003Ab-7s; Fri, 17 Feb 2023 15:14:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pT77s-0002ir-DY; Fri, 17 Feb 2023 15:14:37 -0500
Received: from smtp-out1.suse.de ([2001:67c:2178:6::1c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pT77q-0000pl-Ik; Fri, 17 Feb 2023 15:14:36 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 558FF34656;
 Fri, 17 Feb 2023 20:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1676664872; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WqDCBQWTJwQxWgZeckjmLMTx4vtbA6TkuIRzSeLM7cw=;
 b=fVSkrgkSo1FfeW3vR3S1VAlm+ViMAYMnK4HXnKqhsUpe4OfL9yPupInm9yKHZmed/Zx4Yj
 tyljrmRqijsA6ORE7Ytb2a0S73IkcWAv2wAaJdzi7IGBiA6He8aysoz42vuNsNil70Hfme
 8QUCgz1sRTfE33l1+SNDUjm9SYmBMq4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1676664872;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WqDCBQWTJwQxWgZeckjmLMTx4vtbA6TkuIRzSeLM7cw=;
 b=/adOyK2VoCpGGNgv4Lc/Q3X/S0E/fyujXx+blmw0eniMWpgiKmNxoSo9SwjiN1/UlhrCph
 EY0o/zpErYHQr5CA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 70963138E3;
 Fri, 17 Feb 2023 20:14:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id oIGTDiXg72MwIAAAMHmgww
 (envelope-from <farosas@suse.de>); Fri, 17 Feb 2023 20:14:29 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>
Subject: [PATCH v6 11/29] target/arm: Wrap arm_rebuild_hflags calls with
 tcg_enabled
Date: Fri, 17 Feb 2023 17:11:32 -0300
Message-Id: <20230217201150.22032-12-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230217201150.22032-1-farosas@suse.de>
References: <20230217201150.22032-1-farosas@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

This is in preparation to moving the hflags code into its own file
under the tcg/ directory.

Signed-off-by: Fabiano Rosas <farosas@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/boot.c             |  6 +++++-
 hw/intc/armv7m_nvic.c     | 20 +++++++++++++-------
 target/arm/arm-powerctl.c |  7 +++++--
 target/arm/cpu.c          |  3 ++-
 target/arm/helper.c       | 18 +++++++++++++-----
 target/arm/machine.c      |  5 ++++-
 6 files changed, 42 insertions(+), 17 deletions(-)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index 3d7d11f782..1e021c4a34 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -15,6 +15,7 @@
 #include "hw/arm/boot.h"
 #include "hw/arm/linux-boot-if.h"
 #include "sysemu/kvm.h"
+#include "sysemu/tcg.h"
 #include "sysemu/sysemu.h"
 #include "sysemu/numa.h"
 #include "hw/boards.h"
@@ -827,7 +828,10 @@ static void do_cpu_reset(void *opaque)
                 info->secondary_cpu_reset_hook(cpu, info);
             }
         }
-        arm_rebuild_hflags(env);
+
+        if (tcg_enabled()) {
+            arm_rebuild_hflags(env);
+        }
     }
 }
 
diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
index 1f7763964c..74ac8f610c 100644
--- a/hw/intc/armv7m_nvic.c
+++ b/hw/intc/armv7m_nvic.c
@@ -18,6 +18,7 @@
 #include "hw/intc/armv7m_nvic.h"
 #include "hw/irq.h"
 #include "hw/qdev-properties.h"
+#include "sysemu/tcg.h"
 #include "sysemu/runstate.h"
 #include "target/arm/cpu.h"
 #include "exec/exec-all.h"
@@ -2466,8 +2467,10 @@ static MemTxResult nvic_sysreg_write(void *opaque, hwaddr addr,
     /* This is UNPREDICTABLE; treat as RAZ/WI */
 
  exit_ok:
-    /* Ensure any changes made are reflected in the cached hflags.  */
-    arm_rebuild_hflags(&s->cpu->env);
+    if (tcg_enabled()) {
+        /* Ensure any changes made are reflected in the cached hflags. */
+        arm_rebuild_hflags(&s->cpu->env);
+    }
     return MEMTX_OK;
 }
 
@@ -2648,11 +2651,14 @@ static void armv7m_nvic_reset(DeviceState *dev)
         }
     }
 
-    /*
-     * We updated state that affects the CPU's MMUidx and thus its hflags;
-     * and we can't guarantee that we run before the CPU reset function.
-     */
-    arm_rebuild_hflags(&s->cpu->env);
+    if (tcg_enabled()) {
+        /*
+         * We updated state that affects the CPU's MMUidx and thus its
+         * hflags; and we can't guarantee that we run before the CPU
+         * reset function.
+         */
+        arm_rebuild_hflags(&s->cpu->env);
+    }
 }
 
 static void nvic_systick_trigger(void *opaque, int n, int level)
diff --git a/target/arm/arm-powerctl.c b/target/arm/arm-powerctl.c
index b75f813b40..326a03153d 100644
--- a/target/arm/arm-powerctl.c
+++ b/target/arm/arm-powerctl.c
@@ -15,6 +15,7 @@
 #include "arm-powerctl.h"
 #include "qemu/log.h"
 #include "qemu/main-loop.h"
+#include "sysemu/tcg.h"
 
 #ifndef DEBUG_ARM_POWERCTL
 #define DEBUG_ARM_POWERCTL 0
@@ -127,8 +128,10 @@ static void arm_set_cpu_on_async_work(CPUState *target_cpu_state,
         target_cpu->env.regs[0] = info->context_id;
     }
 
-    /* CP15 update requires rebuilding hflags */
-    arm_rebuild_hflags(&target_cpu->env);
+    if (tcg_enabled()) {
+        /* CP15 update requires rebuilding hflags */
+        arm_rebuild_hflags(&target_cpu->env);
+    }
 
     /* Start the new CPU at the requested address */
     cpu_set_pc(target_cpu_state, info->entry);
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index d7ceb626f0..ce1a425e10 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -539,8 +539,9 @@ static void arm_cpu_reset_hold(Object *obj)
     if (tcg_enabled()) {
         hw_breakpoint_update_all(cpu);
         hw_watchpoint_update_all(cpu);
+
+        arm_rebuild_hflags(env);
     }
-    arm_rebuild_hflags(env);
 }
 
 #if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
diff --git a/target/arm/helper.c b/target/arm/helper.c
index bd704396e0..2c4336bab6 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -5173,7 +5173,7 @@ static void sctlr_write(CPUARMState *env, const ARMCPRegInfo *ri,
     /* This may enable/disable the MMU, so do a TLB flush.  */
     tlb_flush(CPU(cpu));
 
-    if (ri->type & ARM_CP_SUPPRESS_TB_END) {
+    if (tcg_enabled() && ri->type & ARM_CP_SUPPRESS_TB_END) {
         /*
          * Normally we would always end the TB on an SCTLR write; see the
          * comment in ARMCPRegInfo sctlr initialization below for why Xscale
@@ -6841,7 +6841,9 @@ void aarch64_set_svcr(CPUARMState *env, uint64_t new, uint64_t mask)
         memset(env->zarray, 0, sizeof(env->zarray));
     }
 
-    arm_rebuild_hflags(env);
+    if (tcg_enabled()) {
+        arm_rebuild_hflags(env);
+    }
 }
 
 static void svcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
@@ -9878,7 +9880,7 @@ void cpsr_write(CPUARMState *env, uint32_t val, uint32_t mask,
     }
     mask &= ~CACHED_CPSR_BITS;
     env->uncached_cpsr = (env->uncached_cpsr & ~mask) | (val & mask);
-    if (rebuild_hflags) {
+    if (tcg_enabled() && rebuild_hflags) {
         arm_rebuild_hflags(env);
     }
 }
@@ -10437,7 +10439,10 @@ static void take_aarch32_exception(CPUARMState *env, int new_mode,
         env->regs[14] = env->regs[15] + offset;
     }
     env->regs[15] = newpc;
-    arm_rebuild_hflags(env);
+
+    if (tcg_enabled()) {
+        arm_rebuild_hflags(env);
+    }
 }
 
 static void arm_cpu_do_interrupt_aarch32_hyp(CPUState *cs)
@@ -10993,7 +10998,10 @@ static void arm_cpu_do_interrupt_aarch64(CPUState *cs)
     pstate_write(env, PSTATE_DAIF | new_mode);
     env->aarch64 = true;
     aarch64_restore_sp(env, new_el);
-    helper_rebuild_hflags_a64(env, new_el);
+
+    if (tcg_enabled()) {
+        helper_rebuild_hflags_a64(env, new_el);
+    }
 
     env->pc = addr;
 
diff --git a/target/arm/machine.c b/target/arm/machine.c
index fd6323f6d8..fc4a4a4064 100644
--- a/target/arm/machine.c
+++ b/target/arm/machine.c
@@ -871,7 +871,10 @@ static int cpu_post_load(void *opaque, int version_id)
     if (!kvm_enabled()) {
         pmu_op_finish(&cpu->env);
     }
-    arm_rebuild_hflags(&cpu->env);
+
+    if (tcg_enabled()) {
+        arm_rebuild_hflags(&cpu->env);
+    }
 
     return 0;
 }
-- 
2.35.3


