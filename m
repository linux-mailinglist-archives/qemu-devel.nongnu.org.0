Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BEEF3735B7
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 09:41:59 +0200 (CEST)
Received: from localhost ([::1]:51590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leCAQ-0007I3-6N
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 03:41:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1leC4c-0007cF-HS
 for qemu-devel@nongnu.org; Wed, 05 May 2021 03:35:58 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:57712
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1leC4a-0002Bb-8l
 for qemu-devel@nongnu.org; Wed, 05 May 2021 03:35:58 -0400
Received: from host81-154-26-71.range81-154.btcentralplus.com ([81.154.26.71]
 helo=kentang.home) by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1leC4V-0000OI-Cs; Wed, 05 May 2021 08:35:54 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Date: Wed,  5 May 2021 08:35:35 +0100
Message-Id: <20210505073538.11438-8-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210505073538.11438-1-mark.cave-ayland@ilande.co.uk>
References: <20210505073538.11438-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 81.154.26.71
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PULL 07/10] hw/sparc: Allow building without the leon3 machine
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.uk0.bigv.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.uk0.bigv.io
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

When building without the leon3 machine, we get this link failure:

  /usr/bin/ld: target_sparc_int32_helper.c.o: in function `leon3_irq_manager':
  target/sparc/int32_helper.c:172: undefined reference to `leon3_irq_ack'

This is because the leon3_irq_ack() is declared in hw/sparc/leon3.c,
which is only build when CONFIG_LEON3 is selected.

Fix by moving the leon3_cache_control_int() / leon3_irq_manager()
(which are specific to the leon3 machine) to hw/sparc/leon3.c.
Move the trace events along (but don't rename them).

leon3_irq_ack() is now locally used, declare it static to reduce
its scope.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: KONRAD Frederic <frederic.konrad@adacore.com>
Tested-by: KONRAD Frederic <frederic.konrad@adacore.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-Id: <20210428141655.387430-2-f4bug@amsat.org>
Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/sparc/leon3.c            | 37 ++++++++++++++++++++++++++++++++++++-
 hw/sparc/trace-events       |  2 ++
 target/sparc/cpu.h          |  6 ------
 target/sparc/int32_helper.c | 37 -------------------------------------
 target/sparc/trace-events   |  4 ----
 5 files changed, 38 insertions(+), 48 deletions(-)

diff --git a/hw/sparc/leon3.c b/hw/sparc/leon3.c
index 7e16eea9e6..98e3789cf8 100644
--- a/hw/sparc/leon3.c
+++ b/hw/sparc/leon3.c
@@ -137,7 +137,36 @@ static void main_cpu_reset(void *opaque)
     env->regbase[6] = s->sp;
 }
 
-void leon3_irq_ack(void *irq_manager, int intno)
+static void leon3_cache_control_int(CPUSPARCState *env)
+{
+    uint32_t state = 0;
+
+    if (env->cache_control & CACHE_CTRL_IF) {
+        /* Instruction cache state */
+        state = env->cache_control & CACHE_STATE_MASK;
+        if (state == CACHE_ENABLED) {
+            state = CACHE_FROZEN;
+            trace_int_helper_icache_freeze();
+        }
+
+        env->cache_control &= ~CACHE_STATE_MASK;
+        env->cache_control |= state;
+    }
+
+    if (env->cache_control & CACHE_CTRL_DF) {
+        /* Data cache state */
+        state = (env->cache_control >> 2) & CACHE_STATE_MASK;
+        if (state == CACHE_ENABLED) {
+            state = CACHE_FROZEN;
+            trace_int_helper_dcache_freeze();
+        }
+
+        env->cache_control &= ~(CACHE_STATE_MASK << 2);
+        env->cache_control |= (state << 2);
+    }
+}
+
+static void leon3_irq_ack(void *irq_manager, int intno)
 {
     grlib_irqmp_ack((DeviceState *)irq_manager, intno);
 }
@@ -181,6 +210,12 @@ static void leon3_set_pil_in(void *opaque, int n, int level)
     }
 }
 
+static void leon3_irq_manager(CPUSPARCState *env, void *irq_manager, int intno)
+{
+    leon3_irq_ack(irq_manager, intno);
+    leon3_cache_control_int(env);
+}
+
 static void leon3_generic_hw_init(MachineState *machine)
 {
     ram_addr_t ram_size = machine->ram_size;
diff --git a/hw/sparc/trace-events b/hw/sparc/trace-events
index 355b07ae05..dfb53dc1a2 100644
--- a/hw/sparc/trace-events
+++ b/hw/sparc/trace-events
@@ -19,3 +19,5 @@ sun4m_iommu_bad_addr(uint64_t addr) "bad addr 0x%"PRIx64
 # leon3.c
 leon3_set_irq(int intno) "Set CPU IRQ %d"
 leon3_reset_irq(int intno) "Reset CPU IRQ %d"
+int_helper_icache_freeze(void) "Instruction cache: freeze"
+int_helper_dcache_freeze(void) "Data cache: freeze"
diff --git a/target/sparc/cpu.h b/target/sparc/cpu.h
index 4b2290650b..ff8ae73002 100644
--- a/target/sparc/cpu.h
+++ b/target/sparc/cpu.h
@@ -615,15 +615,9 @@ int cpu_cwp_inc(CPUSPARCState *env1, int cwp);
 int cpu_cwp_dec(CPUSPARCState *env1, int cwp);
 void cpu_set_cwp(CPUSPARCState *env1, int new_cwp);
 
-/* int_helper.c */
-void leon3_irq_manager(CPUSPARCState *env, void *irq_manager, int intno);
-
 /* sun4m.c, sun4u.c */
 void cpu_check_irqs(CPUSPARCState *env);
 
-/* leon3.c */
-void leon3_irq_ack(void *irq_manager, int intno);
-
 #if defined (TARGET_SPARC64)
 
 static inline int compare_masked(uint64_t x, uint64_t y, uint64_t mask)
diff --git a/target/sparc/int32_helper.c b/target/sparc/int32_helper.c
index 817a463a17..d008dbdb65 100644
--- a/target/sparc/int32_helper.c
+++ b/target/sparc/int32_helper.c
@@ -136,40 +136,3 @@ void sparc_cpu_do_interrupt(CPUState *cs)
     }
 #endif
 }
-
-#if !defined(CONFIG_USER_ONLY)
-static void leon3_cache_control_int(CPUSPARCState *env)
-{
-    uint32_t state = 0;
-
-    if (env->cache_control & CACHE_CTRL_IF) {
-        /* Instruction cache state */
-        state = env->cache_control & CACHE_STATE_MASK;
-        if (state == CACHE_ENABLED) {
-            state = CACHE_FROZEN;
-            trace_int_helper_icache_freeze();
-        }
-
-        env->cache_control &= ~CACHE_STATE_MASK;
-        env->cache_control |= state;
-    }
-
-    if (env->cache_control & CACHE_CTRL_DF) {
-        /* Data cache state */
-        state = (env->cache_control >> 2) & CACHE_STATE_MASK;
-        if (state == CACHE_ENABLED) {
-            state = CACHE_FROZEN;
-            trace_int_helper_dcache_freeze();
-        }
-
-        env->cache_control &= ~(CACHE_STATE_MASK << 2);
-        env->cache_control |= (state << 2);
-    }
-}
-
-void leon3_irq_manager(CPUSPARCState *env, void *irq_manager, int intno)
-{
-    leon3_irq_ack(irq_manager, intno);
-    leon3_cache_control_int(env);
-}
-#endif
diff --git a/target/sparc/trace-events b/target/sparc/trace-events
index 6a064e2327..e925ddd1cc 100644
--- a/target/sparc/trace-events
+++ b/target/sparc/trace-events
@@ -15,10 +15,6 @@ int_helper_set_softint(uint32_t softint) "new 0x%08x"
 int_helper_clear_softint(uint32_t softint) "new 0x%08x"
 int_helper_write_softint(uint32_t softint) "new 0x%08x"
 
-# int32_helper.c
-int_helper_icache_freeze(void) "Instruction cache: freeze"
-int_helper_dcache_freeze(void) "Data cache: freeze"
-
 # win_helper.c
 win_helper_gregset_error(uint32_t pstate) "ERROR in get_gregset: active pstate bits=0x%x"
 win_helper_switch_pstate(uint32_t pstate_regs, uint32_t new_pstate_regs) "change_pstate: switching regs old=0x%x new=0x%x"
-- 
2.20.1


