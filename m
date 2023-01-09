Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A7F663465
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 23:53:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pF0rQ-0004UD-FO; Mon, 09 Jan 2023 17:43:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pF0rL-0004Rd-KY; Mon, 09 Jan 2023 17:43:15 -0500
Received: from smtp-out1.suse.de ([2001:67c:2178:6::1c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pF0rJ-00043R-OB; Mon, 09 Jan 2023 17:43:15 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9ED153F8AB;
 Mon,  9 Jan 2023 22:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1673304191; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Em5sFCFrBn9k7p4ReWFU7L6za46reGU1ENIoYYxEJMs=;
 b=DSzwPSzv+zZGnP2/Z1OXdR9GX16znS23qfgncgzcTK5B8Oy8ZnroF/bsKpU6//NNFsL6j/
 MXI3HfMEJhNTEvVKtwxWuPKUGGIeYh5gFRt/PDgbf7tB/tEnva4LQf3GQ2ObjZIhezRCpp
 N1PW7uAXVRpaAZNRclv9V/IwxTRtwWI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1673304191;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Em5sFCFrBn9k7p4ReWFU7L6za46reGU1ENIoYYxEJMs=;
 b=2rqqNYXB+wNBpZR0sfQOhFvgSWBRh74URcg1n63SmXOD26bJs5dPcQN813u/SLOgbpw9ON
 ah+al3DMU9mXUsDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 07C7513583;
 Mon,  9 Jan 2023 22:43:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id IMDBMHyYvGMdIQAAMHmgww
 (envelope-from <farosas@suse.de>); Mon, 09 Jan 2023 22:43:08 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>
Subject: [RFC PATCH v2 11/19] target/arm: Wrap arm_rebuild_hflags calls with
 tcg_enabled
Date: Mon,  9 Jan 2023 19:42:24 -0300
Message-Id: <20230109224232.11661-12-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230109224232.11661-1-farosas@suse.de>
References: <20230109224232.11661-1-farosas@suse.de>
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

This is in preparation to moving the hflags code into its own file
under the tcg/ directory.

Signed-off-by: Fabiano Rosas <farosas@suse.de>
---
I extracted these into a separate patch so we can discuss. If I move
the tcg_enabled check to a header that would add overhead for all the
calls where we know for sure that the code is running with TCG. And I
don't think we want a new arm_rebuild_hflags_foo to be used for common
code.
---
 hw/arm/boot.c             |  6 +++++-
 hw/intc/armv7m_nvic.c     | 20 +++++++++++++-------
 target/arm/arm-powerctl.c |  7 +++++--
 target/arm/cpregs.c       |  8 ++++++--
 target/arm/cpu.c          |  4 ++--
 target/arm/helper.c       | 12 +++++++++---
 target/arm/machine.c      |  6 +++++-
 7 files changed, 45 insertions(+), 18 deletions(-)

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
diff --git a/target/arm/cpregs.c b/target/arm/cpregs.c
index a6deae9926..3b0458e188 100644
--- a/target/arm/cpregs.c
+++ b/target/arm/cpregs.c
@@ -16,6 +16,7 @@
 #include "exec/exec-all.h"
 #include "hw/irq.h"
 #include "sysemu/cpu-timers.h"
+#include "sysemu/tcg.h"
 #include "qapi/error.h"
 #include "qemu/guest-random.h"
 #include "cpregs.h"
@@ -5178,7 +5179,7 @@ static void sctlr_write(CPUARMState *env, const ARMCPRegInfo *ri,
     /* This may enable/disable the MMU, so do a TLB flush.  */
     tlb_flush(CPU(cpu));
 
-    if (ri->type & ARM_CP_SUPPRESS_TB_END) {
+    if (tcg_enabled() && ri->type & ARM_CP_SUPPRESS_TB_END) {
         /*
          * Normally we would always end the TB on an SCTLR write; see the
          * comment in ARMCPRegInfo sctlr initialization below for why Xscale
@@ -6667,7 +6668,10 @@ static void svcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
 {
     helper_set_pstate_sm(env, FIELD_EX64(value, SVCR, SM));
     helper_set_pstate_za(env, FIELD_EX64(value, SVCR, ZA));
-    arm_rebuild_hflags(env);
+
+    if (tcg_enabled()) {
+        arm_rebuild_hflags(env);
+    }
 }
 
 static void smcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 4cb524a102..1d5f97a055 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -540,9 +540,9 @@ static void arm_cpu_reset_hold(Object *obj)
     if (tcg_enabled()) {
         hw_breakpoint_update_all(cpu);
         hw_watchpoint_update_all(cpu);
-    }
 
-    arm_rebuild_hflags(env);
+        arm_rebuild_hflags(env);
+    }
 }
 
 #if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 1809df829b..acefd4b69f 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -570,7 +570,7 @@ void cpsr_write(CPUARMState *env, uint32_t val, uint32_t mask,
     }
     mask &= ~CACHED_CPSR_BITS;
     env->uncached_cpsr = (env->uncached_cpsr & ~mask) | (val & mask);
-    if (rebuild_hflags) {
+    if (tcg_enabled() && rebuild_hflags) {
         arm_rebuild_hflags(env);
     }
 }
@@ -1129,7 +1129,10 @@ static void take_aarch32_exception(CPUARMState *env, int new_mode,
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
@@ -1685,7 +1688,10 @@ static void arm_cpu_do_interrupt_aarch64(CPUState *cs)
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
index b83b073da4..fd5be7a558 100644
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
@@ -871,7 +872,10 @@ static int cpu_post_load(void *opaque, int version_id)
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


