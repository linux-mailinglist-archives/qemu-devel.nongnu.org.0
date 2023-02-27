Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F40C6A4412
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 15:16:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWe5A-0002E7-JL; Mon, 27 Feb 2023 09:02:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pWe48-0000dr-VG
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:01:29 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pWe44-0007XY-Er
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:01:19 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 m25-20020a7bcb99000000b003e7842b75f2so3884039wmi.3
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 06:01:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=qA/3Z94irQbWBM1pbSkHlsvHgpn7DcaD1jcVgPus5vI=;
 b=UOK/XBgkCuLakUDjlRyQFBTIDa84LBgmj3ZZfUnOfd/YcNitORKfoxCMZ9BALbabqb
 oNaFR976pL2BdQ7w815XICuBT3ONxxeZHGcUuCEG/ozGt0MJVjj+tNNi0zpox+k/yQGe
 cTMX+70SieY3HizgqxorLIR0DNuF61SXciBOxj3VuhVD8A+bWdl3f27f+zhRqJdAfT0g
 Z5mNwZ72VWqPMu6r+7Y6aby24DXhCXFo91C/AkbPmvaUaJSnpBWsclfLvEIvbnLDIqgm
 MqY8vEa490eUGDFlbH7L3iKvqLw6BfmYpW04DFLfAhQSe7mB/c8XQKE9Zz+VmIrsd19Q
 EINQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qA/3Z94irQbWBM1pbSkHlsvHgpn7DcaD1jcVgPus5vI=;
 b=C4iCiEXGmf/SmTmvqVvMBlGEaeLQTAJq8N0TmOV85zYO0msdfvqB0a5r+LK/ly9Gk/
 92yj6YCa892+AUvcn87TSNL74dCitk7Y+1Ul5QPM6hp2LnWgiCRaRMuVlxQjt8iKBln3
 f2ZlAz+JwRSXpZrIr/1kdT4Pv4YZ4ZK0y4GjxqzsuA4m1mkFOt7z8Ak/ejxFK5pa2wex
 4zU3S5xP7Wejbr6u3aogVFiPoC5EMPTiPSDPMoHgCGZxvv3paa5kCFHgFRs+yDC15oHe
 TZeWyhBuWolpZbzRNe8kA1pcplgHXYc4YQD08dmnTQacn6EfWqpHtL7G9ERhpC22DJJZ
 DrJw==
X-Gm-Message-State: AO0yUKWm+dXGZEpq4f4mIqBhR0kGdXpl4wEh1BRDbXeLJAa7ytzefwuq
 uXn+0ml5wbNoEZTmSylRLucDH4tAsM2TpZ/a
X-Google-Smtp-Source: AK7set/PzKnmwFgbniuoBPUmNKCvCddV8QZXBCxwo5RUWr8+oocGUACuwsZ6xyPgCa64pC95+N2oTg==
X-Received: by 2002:a05:600c:3b8b:b0:3ea:ea6b:f9ad with SMTP id
 n11-20020a05600c3b8b00b003eaea6bf9admr11959801wms.31.1677506474680; 
 Mon, 27 Feb 2023 06:01:14 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 s9-20020a5d4249000000b002c5598c14acsm7158514wrr.6.2023.02.27.06.01.13
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 06:01:13 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 07/25] target/arm: Wrap arm_rebuild_hflags calls with
 tcg_enabled
Date: Mon, 27 Feb 2023 14:00:44 +0000
Message-Id: <20230227140102.3712344-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227140102.3712344-1-peter.maydell@linaro.org>
References: <20230227140102.3712344-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

From: Fabiano Rosas <farosas@suse.de>

This is in preparation to moving the hflags code into its own file
under the tcg/ directory.

Signed-off-by: Fabiano Rosas <farosas@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/boot.c             |  6 +++++-
 hw/intc/armv7m_nvic.c     | 20 +++++++++++++-------
 target/arm/arm-powerctl.c |  7 +++++--
 target/arm/cpu.c          |  3 ++-
 target/arm/helper.c       | 18 +++++++++++++-----
 target/arm/machine.c      |  5 ++++-
 6 files changed, 42 insertions(+), 17 deletions(-)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index 3d7d11f782f..1e021c4a340 100644
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
index e54553283f4..8e289051a40 100644
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
@@ -2454,8 +2455,10 @@ static MemTxResult nvic_sysreg_write(void *opaque, hwaddr addr,
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
 
@@ -2636,11 +2639,14 @@ static void armv7m_nvic_reset(DeviceState *dev)
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
index b75f813b403..326a03153df 100644
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
index da416f7b1cb..0b333a749f6 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -542,8 +542,9 @@ static void arm_cpu_reset_hold(Object *obj)
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
index 07d41003654..af72e6d16c0 100644
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
@@ -9886,7 +9888,7 @@ void cpsr_write(CPUARMState *env, uint32_t val, uint32_t mask,
     }
     mask &= ~CACHED_CPSR_BITS;
     env->uncached_cpsr = (env->uncached_cpsr & ~mask) | (val & mask);
-    if (rebuild_hflags) {
+    if (tcg_enabled() && rebuild_hflags) {
         arm_rebuild_hflags(env);
     }
 }
@@ -10445,7 +10447,10 @@ static void take_aarch32_exception(CPUARMState *env, int new_mode,
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
@@ -11001,7 +11006,10 @@ static void arm_cpu_do_interrupt_aarch64(CPUState *cs)
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
index fd6323f6d8a..fc4a4a40644 100644
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
2.34.1


