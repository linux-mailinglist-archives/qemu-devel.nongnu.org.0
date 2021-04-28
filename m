Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5595D36D97F
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 16:23:07 +0200 (CEST)
Received: from localhost ([::1]:52608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbl5m-0004bk-CW
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 10:23:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lbl0H-0006u4-9G
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 10:17:25 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:36766)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lbl0F-0003SR-3g
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 10:17:25 -0400
Received: by mail-wr1-x42e.google.com with SMTP id m9so50511365wrx.3
 for <qemu-devel@nongnu.org>; Wed, 28 Apr 2021 07:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vqgsjuSJIEYWEWPcK57p29/yxcMDDnB0zu7h3NrXs3Q=;
 b=BPEMT3MiKpfuPMo2uXoi7FoRdwiMPc3cn1IuuY17qGelAYAcjcdvOM8qJyqP/tPXgD
 9yFIw0wQ5lkEoQjYWOU3X5sEUmLokitQ4o2kJAn+SbTLLajTMFA+kLEbXq5G9Meh2MX/
 hePPJB8m9RD0dKRrfci9NLAACo+eqZA3DNNIOxhIiXPrjrrPdYKPAfVHRW4lAkiPV8Bq
 w02ipyFXM6XMykNl5U9np+2t/EvRPXQwTo0/YYUpzDzFtfX8MssefK/xaeXdmFhPJpqc
 Veq96647YhGRnUZdq/A5VmZO6/hdHfmsGGH6TOZMCTiteDkYd54IKT9x93XpjTkarNxc
 UDeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=vqgsjuSJIEYWEWPcK57p29/yxcMDDnB0zu7h3NrXs3Q=;
 b=Ml1rIgkFqdiyYEDyT/NziDsG6a7Oz39YRgcShIpeG2chDSNSj8ATzAK7TXl+gK2uwa
 TVOeSsCko8f8W2stqdqBl4sAZ4C6X2am1HSJK355X5pxB5p4pD0S/+vfSmnyzNFa+xGO
 fa+QTSbAonJyN52FQxCbhY5MNb1bvHEhnTW6rUtCs3aLwCUytOdr4a8VuEdRab/+nwTO
 b3YJYlCfN+DlncyaH720OYqnWCOI5Aq5roHcO53gZjgNgbGAj0wp8+JlDHriEZWSu3st
 qnvJUCMyggHljWcJhDMxmFBXe40RlaakHMi40kfFl/cGLbblIYkJiUmIl/xk0mIhOeob
 NvbQ==
X-Gm-Message-State: AOAM533IP6upNgsy1+aqQ3yGFYzsfqFlQxxnLR7cYb2UMuQivC5CVnlg
 ZKT28Gne3NMs0OVrt3nk0u6HrAMh8dBXwQ==
X-Google-Smtp-Source: ABdhPJw+lbQExbK/TEH7ptrEBPLMb85ggfXym4qhGFrrhKOEVFALNlS0as4KsZwa1k1+hG1KTpR66g==
X-Received: by 2002:adf:d0c8:: with SMTP id z8mr36959040wrh.68.1619619441426; 
 Wed, 28 Apr 2021 07:17:21 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id t2sm7173937wmg.38.2021.04.28.07.17.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Apr 2021 07:17:21 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 4/4] hw/sparc*: Move cpu_check_irqs() to target/sparc/
Date: Wed, 28 Apr 2021 16:16:54 +0200
Message-Id: <20210428141655.387430-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210428141655.387430-1-f4bug@amsat.org>
References: <20210428141655.387430-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Fabien Chouteau <chouteau@adacore.com>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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
---
 hw/sparc/sun4m.c            | 32 ------------------
 hw/sparc64/sparc64.c        | 66 -------------------------------------
 target/sparc/int32_helper.c | 33 +++++++++++++++++++
 target/sparc/int64_helper.c | 66 +++++++++++++++++++++++++++++++++++++
 hw/sparc/trace-events       |  2 --
 hw/sparc64/trace-events     |  4 ---
 target/sparc/trace-events   |  8 +++++
 7 files changed, 107 insertions(+), 104 deletions(-)

diff --git a/hw/sparc/sun4m.c b/hw/sparc/sun4m.c
index 1a00816d9a8..2edf913d945 100644
--- a/hw/sparc/sun4m.c
+++ b/hw/sparc/sun4m.c
@@ -159,38 +159,6 @@ static void nvram_init(Nvram *nvram, uint8_t *macaddr,
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
diff --git a/hw/sparc64/sparc64.c b/hw/sparc64/sparc64.c
index fd29a79edc0..8654e955eb1 100644
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
diff --git a/target/sparc/int32_helper.c b/target/sparc/int32_helper.c
index d008dbdb65c..82e8418e465 100644
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
index 7fb8ab211ca..793e57c536d 100644
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
diff --git a/hw/sparc/trace-events b/hw/sparc/trace-events
index dfb53dc1a24..d3a30a816aa 100644
--- a/hw/sparc/trace-events
+++ b/hw/sparc/trace-events
@@ -1,8 +1,6 @@
 # See docs/devel/tracing.txt for syntax documentation.
 
 # sun4m.c
-sun4m_cpu_interrupt(unsigned int level) "Set CPU IRQ %d"
-sun4m_cpu_reset_interrupt(unsigned int level) "Reset CPU IRQ %d"
 sun4m_cpu_set_irq_raise(int level) "Raise CPU IRQ %d"
 sun4m_cpu_set_irq_lower(int level) "Lower CPU IRQ %d"
 
diff --git a/hw/sparc64/trace-events b/hw/sparc64/trace-events
index a0b29987d2b..b85d14c30c8 100644
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
diff --git a/target/sparc/trace-events b/target/sparc/trace-events
index e925ddd1cc0..75e7093d5f3 100644
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
2.26.3


