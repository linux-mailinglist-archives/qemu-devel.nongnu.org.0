Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A81D03735B8
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 09:42:08 +0200 (CEST)
Received: from localhost ([::1]:52068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leCAZ-0007V2-Lm
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 03:42:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1leC4m-0007l0-1J
 for qemu-devel@nongnu.org; Wed, 05 May 2021 03:36:08 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:57730
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1leC4g-0002Ex-H8
 for qemu-devel@nongnu.org; Wed, 05 May 2021 03:36:07 -0400
Received: from host81-154-26-71.range81-154.btcentralplus.com ([81.154.26.71]
 helo=kentang.home) by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1leC4e-0000OI-CU; Wed, 05 May 2021 08:36:01 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Date: Wed,  5 May 2021 08:35:38 +0100
Message-Id: <20210505073538.11438-11-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210505073538.11438-1-mark.cave-ayland@ilande.co.uk>
References: <20210505073538.11438-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 81.154.26.71
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PULL 10/10] hw/sparc*: Move cpu_check_irqs() to target/sparc/
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

Since cpu_check_irqs() doesn't reference to anything outside
of CPUSPARCState, it better belongs to the architectural code
in target/, rather than the hardware specific code in hw/.

Note: while we moved the trace events, we don't rename them.

Remark: this allows us to build the leon3 machine stand alone,
fixing this link failure (because cpu_check_irqs is defined in
hw/sparc/sun4m.c which is only built when CONFIG_SUN4M is selected):

  /usr/bin/ld: target_sparc_win_helper.c.o: in function `cpu_put_psr':
  target/sparc/win_helper.c:91: undefined reference to `cpu_check_irqs'

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210428141655.387430-5-f4bug@amsat.org>
Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/sparc/sun4m.c            | 32 ------------------
 hw/sparc/trace-events       |  2 --
 hw/sparc64/sparc64.c        | 66 -------------------------------------
 hw/sparc64/trace-events     |  4 ---
 target/sparc/int32_helper.c | 33 +++++++++++++++++++
 target/sparc/int64_helper.c | 66 +++++++++++++++++++++++++++++++++++++
 target/sparc/trace-events   |  8 +++++
 7 files changed, 107 insertions(+), 104 deletions(-)

diff --git a/hw/sparc/sun4m.c b/hw/sparc/sun4m.c
index 263732b904..42e139849e 100644
--- a/hw/sparc/sun4m.c
+++ b/hw/sparc/sun4m.c
@@ -170,38 +170,6 @@ static void nvram_init(Nvram *nvram, uint8_t *macaddr,
     }
 }
 
-void cpu_check_irqs(CPUSPARCState *env)
-{
-    CPUState *cs;
-
-    /* We should be holding the BQL before we mess with IRQs */
-    g_assert(qemu_mutex_iothread_locked());
-
-    if (env->pil_in && (env->interrupt_index == 0 ||
-                        (env->interrupt_index & ~15) == TT_EXTINT)) {
-        unsigned int i;
-
-        for (i = 15; i > 0; i--) {
-            if (env->pil_in & (1 << i)) {
-                int old_interrupt = env->interrupt_index;
-
-                env->interrupt_index = TT_EXTINT | i;
-                if (old_interrupt != env->interrupt_index) {
-                    cs = env_cpu(env);
-                    trace_sun4m_cpu_interrupt(i);
-                    cpu_interrupt(cs, CPU_INTERRUPT_HARD);
-                }
-                break;
-            }
-        }
-    } else if (!env->pil_in && (env->interrupt_index & ~15) == TT_EXTINT) {
-        cs = env_cpu(env);
-        trace_sun4m_cpu_reset_interrupt(env->interrupt_index & 15);
-        env->interrupt_index = 0;
-        cpu_reset_interrupt(cs, CPU_INTERRUPT_HARD);
-    }
-}
-
 static void cpu_kick_irq(SPARCCPU *cpu)
 {
     CPUSPARCState *env = &cpu->env;
diff --git a/hw/sparc/trace-events b/hw/sparc/trace-events
index dfb53dc1a2..d3a30a816a 100644
--- a/hw/sparc/trace-events
+++ b/hw/sparc/trace-events
@@ -1,8 +1,6 @@
 # See docs/devel/tracing.txt for syntax documentation.
 
 # sun4m.c
-sun4m_cpu_interrupt(unsigned int level) "Set CPU IRQ %d"
-sun4m_cpu_reset_interrupt(unsigned int level) "Reset CPU IRQ %d"
 sun4m_cpu_set_irq_raise(int level) "Raise CPU IRQ %d"
 sun4m_cpu_set_irq_lower(int level) "Lower CPU IRQ %d"
 
diff --git a/hw/sparc64/sparc64.c b/hw/sparc64/sparc64.c
index fd29a79edc..8654e955eb 100644
--- a/hw/sparc64/sparc64.c
+++ b/hw/sparc64/sparc64.c
@@ -34,72 +34,6 @@
 
 #define TICK_MAX             0x7fffffffffffffffULL
 
-void cpu_check_irqs(CPUSPARCState *env)
-{
-    CPUState *cs;
-    uint32_t pil = env->pil_in |
-                  (env->softint & ~(SOFTINT_TIMER | SOFTINT_STIMER));
-
-    /* We should be holding the BQL before we mess with IRQs */
-    g_assert(qemu_mutex_iothread_locked());
-
-    /* TT_IVEC has a higher priority (16) than TT_EXTINT (31..17) */
-    if (env->ivec_status & 0x20) {
-        return;
-    }
-    cs = env_cpu(env);
-    /*
-     * check if TM or SM in SOFTINT are set
-     * setting these also causes interrupt 14
-     */
-    if (env->softint & (SOFTINT_TIMER | SOFTINT_STIMER)) {
-        pil |= 1 << 14;
-    }
-
-    /*
-     * The bit corresponding to psrpil is (1<< psrpil),
-     * the next bit is (2 << psrpil).
-     */
-    if (pil < (2 << env->psrpil)) {
-        if (cs->interrupt_request & CPU_INTERRUPT_HARD) {
-            trace_sparc64_cpu_check_irqs_reset_irq(env->interrupt_index);
-            env->interrupt_index = 0;
-            cpu_reset_interrupt(cs, CPU_INTERRUPT_HARD);
-        }
-        return;
-    }
-
-    if (cpu_interrupts_enabled(env)) {
-
-        unsigned int i;
-
-        for (i = 15; i > env->psrpil; i--) {
-            if (pil & (1 << i)) {
-                int old_interrupt = env->interrupt_index;
-                int new_interrupt = TT_EXTINT | i;
-
-                if (unlikely(env->tl > 0 && cpu_tsptr(env)->tt > new_interrupt
-                  && ((cpu_tsptr(env)->tt & 0x1f0) == TT_EXTINT))) {
-                    trace_sparc64_cpu_check_irqs_noset_irq(env->tl,
-                                                      cpu_tsptr(env)->tt,
-                                                      new_interrupt);
-                } else if (old_interrupt != new_interrupt) {
-                    env->interrupt_index = new_interrupt;
-                    trace_sparc64_cpu_check_irqs_set_irq(i, old_interrupt,
-                                                         new_interrupt);
-                    cpu_interrupt(cs, CPU_INTERRUPT_HARD);
-                }
-                break;
-            }
-        }
-    } else if (cs->interrupt_request & CPU_INTERRUPT_HARD) {
-        trace_sparc64_cpu_check_irqs_disabled(pil, env->pil_in, env->softint,
-                                              env->interrupt_index);
-        env->interrupt_index = 0;
-        cpu_reset_interrupt(cs, CPU_INTERRUPT_HARD);
-    }
-}
-
 static void cpu_kick_irq(SPARCCPU *cpu)
 {
     CPUState *cs = CPU(cpu);
diff --git a/hw/sparc64/trace-events b/hw/sparc64/trace-events
index a0b29987d2..b85d14c30c 100644
--- a/hw/sparc64/trace-events
+++ b/hw/sparc64/trace-events
@@ -9,10 +9,6 @@ sun4u_iommu_mem_write(uint64_t addr, uint64_t val, int size) "addr: 0x%"PRIx64"
 sun4u_iommu_translate(uint64_t addr, uint64_t trans_addr, uint64_t tte) "xlate 0x%"PRIx64" => pa 0x%"PRIx64" tte: 0x%"PRIx64
 
 # sparc64.c
-sparc64_cpu_check_irqs_reset_irq(int intno) "Reset CPU IRQ (current interrupt 0x%x)"
-sparc64_cpu_check_irqs_noset_irq(uint32_t tl, uint32_t tt, int intno) "Not setting CPU IRQ: TL=%d current 0x%x >= pending 0x%x"
-sparc64_cpu_check_irqs_set_irq(unsigned int i, int old, int new) "Set CPU IRQ %d old=0x%x new=0x%x"
-sparc64_cpu_check_irqs_disabled(uint32_t pil, uint32_t pil_in, uint32_t softint, int intno) "Interrupts disabled, pil=0x%08x pil_in=0x%08x softint=0x%08x current interrupt 0x%x"
 sparc64_cpu_ivec_raise_irq(int irq) "Raise IVEC IRQ %d"
 sparc64_cpu_ivec_lower_irq(int irq) "Lower IVEC IRQ %d"
 sparc64_cpu_tick_irq_disabled(void) "tick_irq: softint disabled"
diff --git a/target/sparc/int32_helper.c b/target/sparc/int32_helper.c
index d008dbdb65..82e8418e46 100644
--- a/target/sparc/int32_helper.c
+++ b/target/sparc/int32_helper.c
@@ -18,6 +18,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/main-loop.h"
 #include "cpu.h"
 #include "trace.h"
 #include "exec/log.h"
@@ -64,6 +65,38 @@ static const char *excp_name_str(int32_t exception_index)
     return excp_names[exception_index];
 }
 
+void cpu_check_irqs(CPUSPARCState *env)
+{
+    CPUState *cs;
+
+    /* We should be holding the BQL before we mess with IRQs */
+    g_assert(qemu_mutex_iothread_locked());
+
+    if (env->pil_in && (env->interrupt_index == 0 ||
+                        (env->interrupt_index & ~15) == TT_EXTINT)) {
+        unsigned int i;
+
+        for (i = 15; i > 0; i--) {
+            if (env->pil_in & (1 << i)) {
+                int old_interrupt = env->interrupt_index;
+
+                env->interrupt_index = TT_EXTINT | i;
+                if (old_interrupt != env->interrupt_index) {
+                    cs = env_cpu(env);
+                    trace_sun4m_cpu_interrupt(i);
+                    cpu_interrupt(cs, CPU_INTERRUPT_HARD);
+                }
+                break;
+            }
+        }
+    } else if (!env->pil_in && (env->interrupt_index & ~15) == TT_EXTINT) {
+        cs = env_cpu(env);
+        trace_sun4m_cpu_reset_interrupt(env->interrupt_index & 15);
+        env->interrupt_index = 0;
+        cpu_reset_interrupt(cs, CPU_INTERRUPT_HARD);
+    }
+}
+
 void sparc_cpu_do_interrupt(CPUState *cs)
 {
     SPARCCPU *cpu = SPARC_CPU(cs);
diff --git a/target/sparc/int64_helper.c b/target/sparc/int64_helper.c
index 7fb8ab211c..793e57c536 100644
--- a/target/sparc/int64_helper.c
+++ b/target/sparc/int64_helper.c
@@ -62,6 +62,72 @@ static const char * const excp_names[0x80] = {
 };
 #endif
 
+void cpu_check_irqs(CPUSPARCState *env)
+{
+    CPUState *cs;
+    uint32_t pil = env->pil_in |
+                  (env->softint & ~(SOFTINT_TIMER | SOFTINT_STIMER));
+
+    /* We should be holding the BQL before we mess with IRQs */
+    g_assert(qemu_mutex_iothread_locked());
+
+    /* TT_IVEC has a higher priority (16) than TT_EXTINT (31..17) */
+    if (env->ivec_status & 0x20) {
+        return;
+    }
+    cs = env_cpu(env);
+    /*
+     * check if TM or SM in SOFTINT are set
+     * setting these also causes interrupt 14
+     */
+    if (env->softint & (SOFTINT_TIMER | SOFTINT_STIMER)) {
+        pil |= 1 << 14;
+    }
+
+    /*
+     * The bit corresponding to psrpil is (1<< psrpil),
+     * the next bit is (2 << psrpil).
+     */
+    if (pil < (2 << env->psrpil)) {
+        if (cs->interrupt_request & CPU_INTERRUPT_HARD) {
+            trace_sparc64_cpu_check_irqs_reset_irq(env->interrupt_index);
+            env->interrupt_index = 0;
+            cpu_reset_interrupt(cs, CPU_INTERRUPT_HARD);
+        }
+        return;
+    }
+
+    if (cpu_interrupts_enabled(env)) {
+
+        unsigned int i;
+
+        for (i = 15; i > env->psrpil; i--) {
+            if (pil & (1 << i)) {
+                int old_interrupt = env->interrupt_index;
+                int new_interrupt = TT_EXTINT | i;
+
+                if (unlikely(env->tl > 0 && cpu_tsptr(env)->tt > new_interrupt
+                  && ((cpu_tsptr(env)->tt & 0x1f0) == TT_EXTINT))) {
+                    trace_sparc64_cpu_check_irqs_noset_irq(env->tl,
+                                                      cpu_tsptr(env)->tt,
+                                                      new_interrupt);
+                } else if (old_interrupt != new_interrupt) {
+                    env->interrupt_index = new_interrupt;
+                    trace_sparc64_cpu_check_irqs_set_irq(i, old_interrupt,
+                                                         new_interrupt);
+                    cpu_interrupt(cs, CPU_INTERRUPT_HARD);
+                }
+                break;
+            }
+        }
+    } else if (cs->interrupt_request & CPU_INTERRUPT_HARD) {
+        trace_sparc64_cpu_check_irqs_disabled(pil, env->pil_in, env->softint,
+                                              env->interrupt_index);
+        env->interrupt_index = 0;
+        cpu_reset_interrupt(cs, CPU_INTERRUPT_HARD);
+    }
+}
+
 void sparc_cpu_do_interrupt(CPUState *cs)
 {
     SPARCCPU *cpu = SPARC_CPU(cs);
diff --git a/target/sparc/trace-events b/target/sparc/trace-events
index e925ddd1cc..75e7093d5f 100644
--- a/target/sparc/trace-events
+++ b/target/sparc/trace-events
@@ -10,10 +10,18 @@ mmu_helper_get_phys_addr_code(uint32_t tl, int mmu_idx, uint64_t prim_context, u
 mmu_helper_get_phys_addr_data(uint32_t tl, int mmu_idx, uint64_t prim_context, uint64_t sec_context, uint64_t address) "tl=%d mmu_idx=%d primary context=0x%"PRIx64" secondary context=0x%"PRIx64" address=0x%"PRIx64
 mmu_helper_mmu_fault(uint64_t address, uint64_t paddr, int mmu_idx, uint32_t tl, uint64_t prim_context, uint64_t sec_context) "Translate at 0x%"PRIx64" -> 0x%"PRIx64", mmu_idx=%d tl=%d primary context=0x%"PRIx64" secondary context=0x%"PRIx64
 
+# int32_helper.c
+sun4m_cpu_interrupt(unsigned int level) "Set CPU IRQ %d"
+sun4m_cpu_reset_interrupt(unsigned int level) "Reset CPU IRQ %d"
+
 # int64_helper.c
 int_helper_set_softint(uint32_t softint) "new 0x%08x"
 int_helper_clear_softint(uint32_t softint) "new 0x%08x"
 int_helper_write_softint(uint32_t softint) "new 0x%08x"
+sparc64_cpu_check_irqs_reset_irq(int intno) "Reset CPU IRQ (current interrupt 0x%x)"
+sparc64_cpu_check_irqs_noset_irq(uint32_t tl, uint32_t tt, int intno) "Not setting CPU IRQ: TL=%d current 0x%x >= pending 0x%x"
+sparc64_cpu_check_irqs_set_irq(unsigned int i, int old, int new) "Set CPU IRQ %d old=0x%x new=0x%x"
+sparc64_cpu_check_irqs_disabled(uint32_t pil, uint32_t pil_in, uint32_t softint, int intno) "Interrupts disabled, pil=0x%08x pil_in=0x%08x softint=0x%08x current interrupt 0x%x"
 
 # win_helper.c
 win_helper_gregset_error(uint32_t pstate) "ERROR in get_gregset: active pstate bits=0x%x"
-- 
2.20.1


