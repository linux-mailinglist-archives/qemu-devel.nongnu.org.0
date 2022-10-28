Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DAD76117C7
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 18:42:47 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooSQo-0007FV-2E; Fri, 28 Oct 2022 12:42:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ooSQE-000249-4N; Fri, 28 Oct 2022 12:41:30 -0400
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ooSQ8-0008Mz-ED; Fri, 28 Oct 2022 12:41:28 -0400
Received: by mail-ot1-x335.google.com with SMTP id
 v40-20020a056830092800b00661e37421c2so3278298ott.3; 
 Fri, 28 Oct 2022 09:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aQMgQBUL/z42BRPKG0+UiGd22iAyg0JcGKSHWTlylG0=;
 b=fIvR2sjSqVerg+8PbDGDd8ViCNC5u78xXmFBnCku6hNc5OgrZRUWmICJWSfCO9rK2a
 nle5B9+FatvxaXSpqUAw860W8NzS4zO4P9YJjMnURAcGFMYYmrkoNL+fpsihS4wugAWx
 X7a2LVkG3SHgU8fLE/M69210yYISWJrW/dWoSJXH2WaoSwzTtI4ZqXe46bOvjzBY7Ljh
 LruYwFJK0Xyam78zuCMnHXqeRyb+ela64SXC+cuoSQrEFn/5M2xTBVDfsdjSVFdOQCQ+
 +vWr9AkkSAWnUSGi9DLdmMVP3larVqx5sl3msJLJmI4beOHGXd/AAb9HsrLowTqqObMx
 7FuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aQMgQBUL/z42BRPKG0+UiGd22iAyg0JcGKSHWTlylG0=;
 b=quH+sZ5pRxvu98OAuv0aZ42etfU4zSUlGrxG82bfqkMdRE/bZpTsr5z++a0f+WTfwq
 CfMo0qEbg0qb2InvXcEZq+WaV7RQdvLktyvyPSE8GFBWVaDuWOFcYGmj02mHVZb/uvTq
 fdFrVywtaITd2yDcKb87kQV2xXSDBwiPQDeIeI+tdoXbWSmZ+bZIlX6V7tjvyD5AKGXk
 X7zcU/M8TYOUQtipeOFY0B3ZKTUwl22R5C1tCuztXLToGU6WJulO5+uXC7o6wve8X2xU
 mv7dZTGJoVh8kricTsfJBbvB/Od2H0ZA3oszaOQPCfEhhnHAO8Zw3ojWB7B9wQue2AvQ
 v18w==
X-Gm-Message-State: ACrzQf2hAIGZOPjS3CmKg1Z2ypz8c0fP6lqjv3AQfi4vGeNUnuYrJcE6
 FENvXM4TcP+IGoHUUsqA/ZSuQm2R8wgSfA==
X-Google-Smtp-Source: AMsMyM6Gfeznshqj4O7HzZJ9feGIsvkE8qbj3sOBbBoPMqI2/e4S4ix+el8QOXtHy53DuvyMzsws8w==
X-Received: by 2002:a9d:198c:0:b0:661:aa2e:1aa0 with SMTP id
 k12-20020a9d198c000000b00661aa2e1aa0mr121609otk.154.1666975282288; 
 Fri, 28 Oct 2022 09:41:22 -0700 (PDT)
Received: from balboa.COMFAST ([177.45.165.63])
 by smtp.gmail.com with ESMTPSA id
 s127-20020acaa985000000b00354b7120d60sm1658373oie.52.2022.10.28.09.41.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Oct 2022 09:41:21 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, stefanha@redhat.com,
 Matheus Ferst <matheus.ferst@eldorado.org.br>,
 David Gibson <david@gibson.dropbear.id.au>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PULL 19/62] target/ppc: define PPC_INTERRUPT_* values directly
Date: Fri, 28 Oct 2022 13:39:08 -0300
Message-Id: <20221028163951.810456-20-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221028163951.810456-1-danielhb413@gmail.com>
References: <20221028163951.810456-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::335;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x335.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

This enum defines the bit positions in env->pending_interrupts for each
interrupt. However, except for the comparison in kvmppc_set_interrupt,
the values are always used as (1 << PPC_INTERRUPT_*). Define them
directly like that to save some clutter. No functional change intended.

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Message-Id: <20221011204829.1641124-2-matheus.ferst@eldorado.org.br>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/ppc.c             | 10 +++---
 hw/ppc/trace-events      |  2 +-
 target/ppc/cpu.h         | 40 +++++++++++-----------
 target/ppc/cpu_init.c    | 56 +++++++++++++++---------------
 target/ppc/excp_helper.c | 74 ++++++++++++++++++++--------------------
 target/ppc/misc_helper.c |  6 ++--
 6 files changed, 94 insertions(+), 94 deletions(-)

diff --git a/hw/ppc/ppc.c b/hw/ppc/ppc.c
index 690f448cb9..77e611e81c 100644
--- a/hw/ppc/ppc.c
+++ b/hw/ppc/ppc.c
@@ -40,7 +40,7 @@
 static void cpu_ppc_tb_stop (CPUPPCState *env);
 static void cpu_ppc_tb_start (CPUPPCState *env);
 
-void ppc_set_irq(PowerPCCPU *cpu, int n_IRQ, int level)
+void ppc_set_irq(PowerPCCPU *cpu, int irq, int level)
 {
     CPUState *cs = CPU(cpu);
     CPUPPCState *env = &cpu->env;
@@ -56,21 +56,21 @@ void ppc_set_irq(PowerPCCPU *cpu, int n_IRQ, int level)
     old_pending = env->pending_interrupts;
 
     if (level) {
-        env->pending_interrupts |= 1 << n_IRQ;
+        env->pending_interrupts |= irq;
         cpu_interrupt(cs, CPU_INTERRUPT_HARD);
     } else {
-        env->pending_interrupts &= ~(1 << n_IRQ);
+        env->pending_interrupts &= ~irq;
         if (env->pending_interrupts == 0) {
             cpu_reset_interrupt(cs, CPU_INTERRUPT_HARD);
         }
     }
 
     if (old_pending != env->pending_interrupts) {
-        kvmppc_set_interrupt(cpu, n_IRQ, level);
+        kvmppc_set_interrupt(cpu, irq, level);
     }
 
 
-    trace_ppc_irq_set_exit(env, n_IRQ, level, env->pending_interrupts,
+    trace_ppc_irq_set_exit(env, irq, level, env->pending_interrupts,
                            CPU(cpu)->interrupt_request);
 
     if (locked) {
diff --git a/hw/ppc/trace-events b/hw/ppc/trace-events
index a07d5aca0f..956938ebcd 100644
--- a/hw/ppc/trace-events
+++ b/hw/ppc/trace-events
@@ -127,7 +127,7 @@ ppc40x_set_tb_clk(uint32_t value) "new frequency %" PRIu32
 ppc40x_timers_init(uint32_t value) "frequency %" PRIu32
 
 ppc_irq_set(void *env, uint32_t pin, uint32_t level) "env [%p] pin %d level %d"
-ppc_irq_set_exit(void *env, uint32_t n_IRQ, uint32_t level, uint32_t pending, uint32_t request) "env [%p] n_IRQ %d level %d => pending 0x%08" PRIx32 " req 0x%08" PRIx32
+ppc_irq_set_exit(void *env, uint32_t irq, uint32_t level, uint32_t pending, uint32_t request) "env [%p] irq 0x%05" PRIx32 " level %d => pending 0x%08" PRIx32 " req 0x%08" PRIx32
 ppc_irq_set_state(const char *name, uint32_t level) "\"%s\" level %d"
 ppc_irq_reset(const char *name) "%s"
 ppc_irq_cpu(const char *action) "%s"
diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index cca6c4e51c..2433756973 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -2416,27 +2416,27 @@ enum {
 /* Hardware exceptions definitions */
 enum {
     /* External hardware exception sources */
-    PPC_INTERRUPT_RESET     = 0,  /* Reset exception                      */
-    PPC_INTERRUPT_WAKEUP,         /* Wakeup exception                     */
-    PPC_INTERRUPT_MCK,            /* Machine check exception              */
-    PPC_INTERRUPT_EXT,            /* External interrupt                   */
-    PPC_INTERRUPT_SMI,            /* System management interrupt          */
-    PPC_INTERRUPT_CEXT,           /* Critical external interrupt          */
-    PPC_INTERRUPT_DEBUG,          /* External debug exception             */
-    PPC_INTERRUPT_THERM,          /* Thermal exception                    */
+    PPC_INTERRUPT_RESET     = 0x00001,  /* Reset exception                    */
+    PPC_INTERRUPT_WAKEUP    = 0x00002,  /* Wakeup exception                   */
+    PPC_INTERRUPT_MCK       = 0x00004,  /* Machine check exception            */
+    PPC_INTERRUPT_EXT       = 0x00008,  /* External interrupt                 */
+    PPC_INTERRUPT_SMI       = 0x00010,  /* System management interrupt        */
+    PPC_INTERRUPT_CEXT      = 0x00020,  /* Critical external interrupt        */
+    PPC_INTERRUPT_DEBUG     = 0x00040,  /* External debug exception           */
+    PPC_INTERRUPT_THERM     = 0x00080,  /* Thermal exception                  */
     /* Internal hardware exception sources */
-    PPC_INTERRUPT_DECR,           /* Decrementer exception                */
-    PPC_INTERRUPT_HDECR,          /* Hypervisor decrementer exception     */
-    PPC_INTERRUPT_PIT,            /* Programmable interval timer interrupt */
-    PPC_INTERRUPT_FIT,            /* Fixed interval timer interrupt       */
-    PPC_INTERRUPT_WDT,            /* Watchdog timer interrupt             */
-    PPC_INTERRUPT_CDOORBELL,      /* Critical doorbell interrupt          */
-    PPC_INTERRUPT_DOORBELL,       /* Doorbell interrupt                   */
-    PPC_INTERRUPT_PERFM,          /* Performance monitor interrupt        */
-    PPC_INTERRUPT_HMI,            /* Hypervisor Maintenance interrupt    */
-    PPC_INTERRUPT_HDOORBELL,      /* Hypervisor Doorbell interrupt        */
-    PPC_INTERRUPT_HVIRT,          /* Hypervisor virtualization interrupt  */
-    PPC_INTERRUPT_EBB,            /* Event-based Branch exception         */
+    PPC_INTERRUPT_DECR      = 0x00100, /* Decrementer exception               */
+    PPC_INTERRUPT_HDECR     = 0x00200, /* Hypervisor decrementer exception    */
+    PPC_INTERRUPT_PIT       = 0x00400, /* Programmable interval timer int.    */
+    PPC_INTERRUPT_FIT       = 0x00800, /* Fixed interval timer interrupt      */
+    PPC_INTERRUPT_WDT       = 0x01000, /* Watchdog timer interrupt            */
+    PPC_INTERRUPT_CDOORBELL = 0x02000, /* Critical doorbell interrupt         */
+    PPC_INTERRUPT_DOORBELL  = 0x04000, /* Doorbell interrupt                  */
+    PPC_INTERRUPT_PERFM     = 0x08000, /* Performance monitor interrupt       */
+    PPC_INTERRUPT_HMI       = 0x10000, /* Hypervisor Maintenance interrupt    */
+    PPC_INTERRUPT_HDOORBELL = 0x20000, /* Hypervisor Doorbell interrupt       */
+    PPC_INTERRUPT_HVIRT     = 0x40000, /* Hypervisor virtualization interrupt */
+    PPC_INTERRUPT_EBB       = 0x80000, /* Event-based Branch exception        */
 };
 
 /* Processor Compatibility mask (PCR) */
diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 335351c226..07171c679c 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -5969,23 +5969,23 @@ static bool cpu_has_work_POWER7(CPUState *cs)
         if (!(cs->interrupt_request & CPU_INTERRUPT_HARD)) {
             return false;
         }
-        if ((env->pending_interrupts & (1u << PPC_INTERRUPT_EXT)) &&
+        if ((env->pending_interrupts & PPC_INTERRUPT_EXT) &&
             (env->spr[SPR_LPCR] & LPCR_P7_PECE0)) {
             return true;
         }
-        if ((env->pending_interrupts & (1u << PPC_INTERRUPT_DECR)) &&
+        if ((env->pending_interrupts & PPC_INTERRUPT_DECR) &&
             (env->spr[SPR_LPCR] & LPCR_P7_PECE1)) {
             return true;
         }
-        if ((env->pending_interrupts & (1u << PPC_INTERRUPT_MCK)) &&
+        if ((env->pending_interrupts & PPC_INTERRUPT_MCK) &&
             (env->spr[SPR_LPCR] & LPCR_P7_PECE2)) {
             return true;
         }
-        if ((env->pending_interrupts & (1u << PPC_INTERRUPT_HMI)) &&
+        if ((env->pending_interrupts & PPC_INTERRUPT_HMI) &&
             (env->spr[SPR_LPCR] & LPCR_P7_PECE2)) {
             return true;
         }
-        if (env->pending_interrupts & (1u << PPC_INTERRUPT_RESET)) {
+        if (env->pending_interrupts & PPC_INTERRUPT_RESET) {
             return true;
         }
         return false;
@@ -6142,31 +6142,31 @@ static bool cpu_has_work_POWER8(CPUState *cs)
         if (!(cs->interrupt_request & CPU_INTERRUPT_HARD)) {
             return false;
         }
-        if ((env->pending_interrupts & (1u << PPC_INTERRUPT_EXT)) &&
+        if ((env->pending_interrupts & PPC_INTERRUPT_EXT) &&
             (env->spr[SPR_LPCR] & LPCR_P8_PECE2)) {
             return true;
         }
-        if ((env->pending_interrupts & (1u << PPC_INTERRUPT_DECR)) &&
+        if ((env->pending_interrupts & PPC_INTERRUPT_DECR) &&
             (env->spr[SPR_LPCR] & LPCR_P8_PECE3)) {
             return true;
         }
-        if ((env->pending_interrupts & (1u << PPC_INTERRUPT_MCK)) &&
+        if ((env->pending_interrupts & PPC_INTERRUPT_MCK) &&
             (env->spr[SPR_LPCR] & LPCR_P8_PECE4)) {
             return true;
         }
-        if ((env->pending_interrupts & (1u << PPC_INTERRUPT_HMI)) &&
+        if ((env->pending_interrupts & PPC_INTERRUPT_HMI) &&
             (env->spr[SPR_LPCR] & LPCR_P8_PECE4)) {
             return true;
         }
-        if ((env->pending_interrupts & (1u << PPC_INTERRUPT_DOORBELL)) &&
+        if ((env->pending_interrupts & PPC_INTERRUPT_DOORBELL) &&
             (env->spr[SPR_LPCR] & LPCR_P8_PECE0)) {
             return true;
         }
-        if ((env->pending_interrupts & (1u << PPC_INTERRUPT_HDOORBELL)) &&
+        if ((env->pending_interrupts & PPC_INTERRUPT_HDOORBELL) &&
             (env->spr[SPR_LPCR] & LPCR_P8_PECE1)) {
             return true;
         }
-        if (env->pending_interrupts & (1u << PPC_INTERRUPT_RESET)) {
+        if (env->pending_interrupts & PPC_INTERRUPT_RESET) {
             return true;
         }
         return false;
@@ -6368,7 +6368,7 @@ static bool cpu_has_work_POWER9(CPUState *cs)
             return true;
         }
         /* External Exception */
-        if ((env->pending_interrupts & (1u << PPC_INTERRUPT_EXT)) &&
+        if ((env->pending_interrupts & PPC_INTERRUPT_EXT) &&
             (env->spr[SPR_LPCR] & LPCR_EEE)) {
             bool heic = !!(env->spr[SPR_LPCR] & LPCR_HEIC);
             if (!heic || !FIELD_EX64_HV(env->msr) ||
@@ -6377,31 +6377,31 @@ static bool cpu_has_work_POWER9(CPUState *cs)
             }
         }
         /* Decrementer Exception */
-        if ((env->pending_interrupts & (1u << PPC_INTERRUPT_DECR)) &&
+        if ((env->pending_interrupts & PPC_INTERRUPT_DECR) &&
             (env->spr[SPR_LPCR] & LPCR_DEE)) {
             return true;
         }
         /* Machine Check or Hypervisor Maintenance Exception */
-        if ((env->pending_interrupts & (1u << PPC_INTERRUPT_MCK |
-            1u << PPC_INTERRUPT_HMI)) && (env->spr[SPR_LPCR] & LPCR_OEE)) {
+        if ((env->pending_interrupts & (PPC_INTERRUPT_MCK | PPC_INTERRUPT_HMI))
+            && (env->spr[SPR_LPCR] & LPCR_OEE)) {
             return true;
         }
         /* Privileged Doorbell Exception */
-        if ((env->pending_interrupts & (1u << PPC_INTERRUPT_DOORBELL)) &&
+        if ((env->pending_interrupts & PPC_INTERRUPT_DOORBELL) &&
             (env->spr[SPR_LPCR] & LPCR_PDEE)) {
             return true;
         }
         /* Hypervisor Doorbell Exception */
-        if ((env->pending_interrupts & (1u << PPC_INTERRUPT_HDOORBELL)) &&
+        if ((env->pending_interrupts & PPC_INTERRUPT_HDOORBELL) &&
             (env->spr[SPR_LPCR] & LPCR_HDEE)) {
             return true;
         }
         /* Hypervisor virtualization exception */
-        if ((env->pending_interrupts & (1u << PPC_INTERRUPT_HVIRT)) &&
+        if ((env->pending_interrupts & PPC_INTERRUPT_HVIRT) &&
             (env->spr[SPR_LPCR] & LPCR_HVEE)) {
             return true;
         }
-        if (env->pending_interrupts & (1u << PPC_INTERRUPT_RESET)) {
+        if (env->pending_interrupts & PPC_INTERRUPT_RESET) {
             return true;
         }
         return false;
@@ -6601,7 +6601,7 @@ static bool cpu_has_work_POWER10(CPUState *cs)
             return true;
         }
         /* External Exception */
-        if ((env->pending_interrupts & (1u << PPC_INTERRUPT_EXT)) &&
+        if ((env->pending_interrupts & PPC_INTERRUPT_EXT) &&
             (env->spr[SPR_LPCR] & LPCR_EEE)) {
             bool heic = !!(env->spr[SPR_LPCR] & LPCR_HEIC);
             if (!heic || !FIELD_EX64_HV(env->msr) ||
@@ -6610,31 +6610,31 @@ static bool cpu_has_work_POWER10(CPUState *cs)
             }
         }
         /* Decrementer Exception */
-        if ((env->pending_interrupts & (1u << PPC_INTERRUPT_DECR)) &&
+        if ((env->pending_interrupts & PPC_INTERRUPT_DECR) &&
             (env->spr[SPR_LPCR] & LPCR_DEE)) {
             return true;
         }
         /* Machine Check or Hypervisor Maintenance Exception */
-        if ((env->pending_interrupts & (1u << PPC_INTERRUPT_MCK |
-            1u << PPC_INTERRUPT_HMI)) && (env->spr[SPR_LPCR] & LPCR_OEE)) {
+        if ((env->pending_interrupts & (PPC_INTERRUPT_MCK | PPC_INTERRUPT_HMI))
+            && (env->spr[SPR_LPCR] & LPCR_OEE)) {
             return true;
         }
         /* Privileged Doorbell Exception */
-        if ((env->pending_interrupts & (1u << PPC_INTERRUPT_DOORBELL)) &&
+        if ((env->pending_interrupts & PPC_INTERRUPT_DOORBELL) &&
             (env->spr[SPR_LPCR] & LPCR_PDEE)) {
             return true;
         }
         /* Hypervisor Doorbell Exception */
-        if ((env->pending_interrupts & (1u << PPC_INTERRUPT_HDOORBELL)) &&
+        if ((env->pending_interrupts & PPC_INTERRUPT_HDOORBELL) &&
             (env->spr[SPR_LPCR] & LPCR_HDEE)) {
             return true;
         }
         /* Hypervisor virtualization exception */
-        if ((env->pending_interrupts & (1u << PPC_INTERRUPT_HVIRT)) &&
+        if ((env->pending_interrupts & PPC_INTERRUPT_HVIRT) &&
             (env->spr[SPR_LPCR] & LPCR_HVEE)) {
             return true;
         }
-        if (env->pending_interrupts & (1u << PPC_INTERRUPT_RESET)) {
+        if (env->pending_interrupts & PPC_INTERRUPT_RESET) {
             return true;
         }
         return false;
diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index 43f2480e94..d168789fc0 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -1689,21 +1689,21 @@ static void ppc_hw_interrupt(CPUPPCState *env)
     bool async_deliver;
 
     /* External reset */
-    if (env->pending_interrupts & (1 << PPC_INTERRUPT_RESET)) {
-        env->pending_interrupts &= ~(1 << PPC_INTERRUPT_RESET);
+    if (env->pending_interrupts & PPC_INTERRUPT_RESET) {
+        env->pending_interrupts &= ~PPC_INTERRUPT_RESET;
         powerpc_excp(cpu, POWERPC_EXCP_RESET);
         return;
     }
     /* Machine check exception */
-    if (env->pending_interrupts & (1 << PPC_INTERRUPT_MCK)) {
-        env->pending_interrupts &= ~(1 << PPC_INTERRUPT_MCK);
+    if (env->pending_interrupts & PPC_INTERRUPT_MCK) {
+        env->pending_interrupts &= ~PPC_INTERRUPT_MCK;
         powerpc_excp(cpu, POWERPC_EXCP_MCHECK);
         return;
     }
 #if 0 /* TODO */
     /* External debug exception */
-    if (env->pending_interrupts & (1 << PPC_INTERRUPT_DEBUG)) {
-        env->pending_interrupts &= ~(1 << PPC_INTERRUPT_DEBUG);
+    if (env->pending_interrupts & PPC_INTERRUPT_DEBUG) {
+        env->pending_interrupts &= ~PPC_INTERRUPT_DEBUG;
         powerpc_excp(cpu, POWERPC_EXCP_DEBUG);
         return;
     }
@@ -1718,19 +1718,19 @@ static void ppc_hw_interrupt(CPUPPCState *env)
     async_deliver = FIELD_EX64(env->msr, MSR, EE) || env->resume_as_sreset;
 
     /* Hypervisor decrementer exception */
-    if (env->pending_interrupts & (1 << PPC_INTERRUPT_HDECR)) {
+    if (env->pending_interrupts & PPC_INTERRUPT_HDECR) {
         /* LPCR will be clear when not supported so this will work */
         bool hdice = !!(env->spr[SPR_LPCR] & LPCR_HDICE);
         if ((async_deliver || !FIELD_EX64_HV(env->msr)) && hdice) {
             /* HDEC clears on delivery */
-            env->pending_interrupts &= ~(1 << PPC_INTERRUPT_HDECR);
+            env->pending_interrupts &= ~PPC_INTERRUPT_HDECR;
             powerpc_excp(cpu, POWERPC_EXCP_HDECR);
             return;
         }
     }
 
     /* Hypervisor virtualization interrupt */
-    if (env->pending_interrupts & (1 << PPC_INTERRUPT_HVIRT)) {
+    if (env->pending_interrupts & PPC_INTERRUPT_HVIRT) {
         /* LPCR will be clear when not supported so this will work */
         bool hvice = !!(env->spr[SPR_LPCR] & LPCR_HVICE);
         if ((async_deliver || !FIELD_EX64_HV(env->msr)) && hvice) {
@@ -1740,7 +1740,7 @@ static void ppc_hw_interrupt(CPUPPCState *env)
     }
 
     /* External interrupt can ignore MSR:EE under some circumstances */
-    if (env->pending_interrupts & (1 << PPC_INTERRUPT_EXT)) {
+    if (env->pending_interrupts & PPC_INTERRUPT_EXT) {
         bool lpes0 = !!(env->spr[SPR_LPCR] & LPCR_LPES0);
         bool heic = !!(env->spr[SPR_LPCR] & LPCR_HEIC);
         /* HEIC blocks delivery to the hypervisor */
@@ -1757,45 +1757,45 @@ static void ppc_hw_interrupt(CPUPPCState *env)
     }
     if (FIELD_EX64(env->msr, MSR, CE)) {
         /* External critical interrupt */
-        if (env->pending_interrupts & (1 << PPC_INTERRUPT_CEXT)) {
+        if (env->pending_interrupts & PPC_INTERRUPT_CEXT) {
             powerpc_excp(cpu, POWERPC_EXCP_CRITICAL);
             return;
         }
     }
     if (async_deliver != 0) {
         /* Watchdog timer on embedded PowerPC */
-        if (env->pending_interrupts & (1 << PPC_INTERRUPT_WDT)) {
-            env->pending_interrupts &= ~(1 << PPC_INTERRUPT_WDT);
+        if (env->pending_interrupts & PPC_INTERRUPT_WDT) {
+            env->pending_interrupts &= ~PPC_INTERRUPT_WDT;
             powerpc_excp(cpu, POWERPC_EXCP_WDT);
             return;
         }
-        if (env->pending_interrupts & (1 << PPC_INTERRUPT_CDOORBELL)) {
-            env->pending_interrupts &= ~(1 << PPC_INTERRUPT_CDOORBELL);
+        if (env->pending_interrupts & PPC_INTERRUPT_CDOORBELL) {
+            env->pending_interrupts &= ~PPC_INTERRUPT_CDOORBELL;
             powerpc_excp(cpu, POWERPC_EXCP_DOORCI);
             return;
         }
         /* Fixed interval timer on embedded PowerPC */
-        if (env->pending_interrupts & (1 << PPC_INTERRUPT_FIT)) {
-            env->pending_interrupts &= ~(1 << PPC_INTERRUPT_FIT);
+        if (env->pending_interrupts & PPC_INTERRUPT_FIT) {
+            env->pending_interrupts &= ~PPC_INTERRUPT_FIT;
             powerpc_excp(cpu, POWERPC_EXCP_FIT);
             return;
         }
         /* Programmable interval timer on embedded PowerPC */
-        if (env->pending_interrupts & (1 << PPC_INTERRUPT_PIT)) {
-            env->pending_interrupts &= ~(1 << PPC_INTERRUPT_PIT);
+        if (env->pending_interrupts & PPC_INTERRUPT_PIT) {
+            env->pending_interrupts &= ~PPC_INTERRUPT_PIT;
             powerpc_excp(cpu, POWERPC_EXCP_PIT);
             return;
         }
         /* Decrementer exception */
-        if (env->pending_interrupts & (1 << PPC_INTERRUPT_DECR)) {
+        if (env->pending_interrupts & PPC_INTERRUPT_DECR) {
             if (ppc_decr_clear_on_delivery(env)) {
-                env->pending_interrupts &= ~(1 << PPC_INTERRUPT_DECR);
+                env->pending_interrupts &= ~PPC_INTERRUPT_DECR;
             }
             powerpc_excp(cpu, POWERPC_EXCP_DECR);
             return;
         }
-        if (env->pending_interrupts & (1 << PPC_INTERRUPT_DOORBELL)) {
-            env->pending_interrupts &= ~(1 << PPC_INTERRUPT_DOORBELL);
+        if (env->pending_interrupts & PPC_INTERRUPT_DOORBELL) {
+            env->pending_interrupts &= ~PPC_INTERRUPT_DOORBELL;
             if (is_book3s_arch2x(env)) {
                 powerpc_excp(cpu, POWERPC_EXCP_SDOOR);
             } else {
@@ -1803,31 +1803,31 @@ static void ppc_hw_interrupt(CPUPPCState *env)
             }
             return;
         }
-        if (env->pending_interrupts & (1 << PPC_INTERRUPT_HDOORBELL)) {
-            env->pending_interrupts &= ~(1 << PPC_INTERRUPT_HDOORBELL);
+        if (env->pending_interrupts & PPC_INTERRUPT_HDOORBELL) {
+            env->pending_interrupts &= ~PPC_INTERRUPT_HDOORBELL;
             powerpc_excp(cpu, POWERPC_EXCP_SDOOR_HV);
             return;
         }
-        if (env->pending_interrupts & (1 << PPC_INTERRUPT_PERFM)) {
-            env->pending_interrupts &= ~(1 << PPC_INTERRUPT_PERFM);
+        if (env->pending_interrupts & PPC_INTERRUPT_PERFM) {
+            env->pending_interrupts &= ~PPC_INTERRUPT_PERFM;
             powerpc_excp(cpu, POWERPC_EXCP_PERFM);
             return;
         }
         /* Thermal interrupt */
-        if (env->pending_interrupts & (1 << PPC_INTERRUPT_THERM)) {
-            env->pending_interrupts &= ~(1 << PPC_INTERRUPT_THERM);
+        if (env->pending_interrupts & PPC_INTERRUPT_THERM) {
+            env->pending_interrupts &= ~PPC_INTERRUPT_THERM;
             powerpc_excp(cpu, POWERPC_EXCP_THERM);
             return;
         }
         /* EBB exception */
-        if (env->pending_interrupts & (1 << PPC_INTERRUPT_EBB)) {
+        if (env->pending_interrupts & PPC_INTERRUPT_EBB) {
             /*
              * EBB exception must be taken in problem state and
              * with BESCR_GE set.
              */
             if (FIELD_EX64(env->msr, MSR, PR) &&
                 (env->spr[SPR_BESCR] & BESCR_GE)) {
-                env->pending_interrupts &= ~(1 << PPC_INTERRUPT_EBB);
+                env->pending_interrupts &= ~PPC_INTERRUPT_EBB;
 
                 if (env->spr[SPR_BESCR] & BESCR_PMEO) {
                     powerpc_excp(cpu, POWERPC_EXCP_PERFM_EBB);
@@ -2104,7 +2104,7 @@ static void do_ebb(CPUPPCState *env, int ebb_excp)
     if (FIELD_EX64(env->msr, MSR, PR)) {
         powerpc_excp(cpu, ebb_excp);
     } else {
-        env->pending_interrupts |= 1 << PPC_INTERRUPT_EBB;
+        env->pending_interrupts |= PPC_INTERRUPT_EBB;
         cpu_interrupt(cs, CPU_INTERRUPT_HARD);
     }
 }
@@ -2298,7 +2298,7 @@ void helper_msgclr(CPUPPCState *env, target_ulong rb)
         return;
     }
 
-    env->pending_interrupts &= ~(1 << irq);
+    env->pending_interrupts &= ~irq;
 }
 
 void helper_msgsnd(target_ulong rb)
@@ -2317,7 +2317,7 @@ void helper_msgsnd(target_ulong rb)
         CPUPPCState *cenv = &cpu->env;
 
         if ((rb & DBELL_BRDCAST) || (cenv->spr[SPR_BOOKE_PIR] == pir)) {
-            cenv->pending_interrupts |= 1 << irq;
+            cenv->pending_interrupts |= irq;
             cpu_interrupt(cs, CPU_INTERRUPT_HARD);
         }
     }
@@ -2342,7 +2342,7 @@ void helper_book3s_msgclr(CPUPPCState *env, target_ulong rb)
         return;
     }
 
-    env->pending_interrupts &= ~(1 << PPC_INTERRUPT_HDOORBELL);
+    env->pending_interrupts &= ~PPC_INTERRUPT_HDOORBELL;
 }
 
 static void book3s_msgsnd_common(int pir, int irq)
@@ -2356,7 +2356,7 @@ static void book3s_msgsnd_common(int pir, int irq)
 
         /* TODO: broadcast message to all threads of the same  processor */
         if (cenv->spr_cb[SPR_PIR].default_value == pir) {
-            cenv->pending_interrupts |= 1 << irq;
+            cenv->pending_interrupts |= irq;
             cpu_interrupt(cs, CPU_INTERRUPT_HARD);
         }
     }
@@ -2383,7 +2383,7 @@ void helper_book3s_msgclrp(CPUPPCState *env, target_ulong rb)
         return;
     }
 
-    env->pending_interrupts &= ~(1 << PPC_INTERRUPT_DOORBELL);
+    env->pending_interrupts &= ~PPC_INTERRUPT_DOORBELL;
 }
 
 /*
diff --git a/target/ppc/misc_helper.c b/target/ppc/misc_helper.c
index b0a5e7ce76..05e35572bc 100644
--- a/target/ppc/misc_helper.c
+++ b/target/ppc/misc_helper.c
@@ -163,7 +163,7 @@ target_ulong helper_load_dpdes(CPUPPCState *env)
     helper_hfscr_facility_check(env, HFSCR_MSGP, "load DPDES", HFSCR_IC_MSGP);
 
     /* TODO: TCG supports only one thread */
-    if (env->pending_interrupts & (1 << PPC_INTERRUPT_DOORBELL)) {
+    if (env->pending_interrupts & PPC_INTERRUPT_DOORBELL) {
         dpdes = 1;
     }
 
@@ -185,10 +185,10 @@ void helper_store_dpdes(CPUPPCState *env, target_ulong val)
     }
 
     if (val & 0x1) {
-        env->pending_interrupts |= 1 << PPC_INTERRUPT_DOORBELL;
+        env->pending_interrupts |= PPC_INTERRUPT_DOORBELL;
         cpu_interrupt(cs, CPU_INTERRUPT_HARD);
     } else {
-        env->pending_interrupts &= ~(1 << PPC_INTERRUPT_DOORBELL);
+        env->pending_interrupts &= ~PPC_INTERRUPT_DOORBELL;
     }
 }
 #endif /* defined(TARGET_PPC64) */
-- 
2.37.3


