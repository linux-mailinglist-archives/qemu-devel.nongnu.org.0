Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 566E8510C7E
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 01:16:04 +0200 (CEST)
Received: from localhost ([::1]:55314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njUPb-0007kc-Ds
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 19:16:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1njUIu-0005M3-9U
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 19:09:08 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:53093)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1njUIq-0000IP-QN
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 19:09:07 -0400
Received: by mail-pj1-x102e.google.com with SMTP id e24so2937489pjt.2
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 16:09:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YBxB19b1LDH2ZngtUHbjc+2JAn1UtWz5r0U4AkPLkb8=;
 b=hlIwq3u3ZtqHOeR0DpGSrLbV25I0CjUVq061nt9uqSJHnAz0la/QX+qhQA+Bo5J6z0
 BiH5yHW2Lzz3uZNbIRHNeKtSxLaernkW6pTZmk9pEiMe4tXsndF1ocy+tx2hVvgzy3lT
 BxCM0a7B0kT7PVMxU14U5Q4pesh3a6kBSwzXEA0aTKkQNEOoghbmDHfeakIGlGEs1Zut
 vt0W3eXxnW19c09qtQFyQaaJmopo94v95P9Sp9lXQCW2a6EeiSwuMZ0ioQsO64qOTqPd
 /jo1pGs92pYdl+OoVKunAgTJDuK30C9NGydtuxeZNqhePAHLXJHHiA6Bgdf65VhyXSYF
 FMgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YBxB19b1LDH2ZngtUHbjc+2JAn1UtWz5r0U4AkPLkb8=;
 b=KIgFGhdFtxfcXxK1FqfwPArhZZnJq/S/NUMReOVhvBfPKUmXRb5qkUHcmavJOUDyUF
 qs4Jubptjv7ZZ195ruCAu2lMADN9JSg1E++CXKJgnJ3CxyQWnYJ8j84IK9AUEp3YDL5X
 N6OSHRhElMrpJeW5r6jJHIkNRP9xydJNg+z5AsPGr5UOhUDXWS52Cd09Z5T0LFvDIl0y
 9+WtP7aQmjZkUu5slLQzEEn+r/4Caf3aR7ysaP0Ir9EBaHAEfXN/YN2JRBeO3QSsCaOC
 EWZCHxfESZortmo4RK/MXN/AOUOvcVGC8EphaMddCQ46eq4KAGkTDBN/npn18+MTAnvJ
 33TA==
X-Gm-Message-State: AOAM530yEyN8NU33zHhNM2X8jrRT6Sa+KApfEA43TnmGioZSEGxWoOyv
 Uohq8qI4eb6WxQ4alzaOp/havt2CH7IOlQ==
X-Google-Smtp-Source: ABdhPJxwmF/IyTc+V1n18NhNV1jG8tAYDig1dG2lUKT9Rj5X8tloUmR9riU2YFq8nbByK7m0Ysc6OQ==
X-Received: by 2002:a17:902:8f81:b0:154:be2d:1948 with SMTP id
 z1-20020a1709028f8100b00154be2d1948mr25724641plo.110.1651014542689; 
 Tue, 26 Apr 2022 16:09:02 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
 by smtp.gmail.com with ESMTPSA id
 t29-20020a62d15d000000b0050d42864753sm7856490pfl.49.2022.04.26.16.09.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 16:09:02 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2  1/5] hw/intc: Move mtimer/mtimecmp to aclint
Date: Tue, 26 Apr 2022 16:08:50 -0700
Message-Id: <20220426230855.336292-2-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220426230855.336292-1-atishp@rivosinc.com>
References: <20220426230855.336292-1-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=atishp@rivosinc.com; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: qemu-riscv@nongnu.org, Juan Quintela <quintela@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, Atish Patra <atishp@rivosinc.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Historically, The mtimer/mtimecmp has been part of the CPU because
they are per hart entities. However, they actually belong to aclint
which is a MMIO device.

Move them to the ACLINT device. This also emulates the real hardware
more closely.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 hw/intc/riscv_aclint.c         | 27 +++++++++++++++------------
 hw/timer/ibex_timer.c          | 20 ++++++++------------
 include/hw/intc/riscv_aclint.h |  2 ++
 include/hw/timer/ibex_timer.h  |  2 ++
 target/riscv/cpu.h             |  2 --
 target/riscv/machine.c         |  1 -
 6 files changed, 27 insertions(+), 27 deletions(-)

diff --git a/hw/intc/riscv_aclint.c b/hw/intc/riscv_aclint.c
index 0412edc98257..1bddb99bda47 100644
--- a/hw/intc/riscv_aclint.c
+++ b/hw/intc/riscv_aclint.c
@@ -65,8 +65,8 @@ static void riscv_aclint_mtimer_write_timecmp(RISCVAclintMTimerState *mtimer,
 
     uint64_t rtc_r = cpu_riscv_read_rtc(mtimer);
 
-    cpu->env.timecmp = value;
-    if (cpu->env.timecmp <= rtc_r) {
+    mtimer->timecmp[hartid] = value;
+    if (mtimer->timecmp[hartid] <= rtc_r) {
         /*
          * If we're setting an MTIMECMP value in the "past",
          * immediately raise the timer interrupt
@@ -77,7 +77,7 @@ static void riscv_aclint_mtimer_write_timecmp(RISCVAclintMTimerState *mtimer,
 
     /* otherwise, set up the future timer interrupt */
     qemu_irq_lower(mtimer->timer_irqs[hartid - mtimer->hartid_base]);
-    diff = cpu->env.timecmp - rtc_r;
+    diff = mtimer->timecmp[hartid] - rtc_r;
     /* back to ns (note args switched in muldiv64) */
     uint64_t ns_diff = muldiv64(diff, NANOSECONDS_PER_SECOND, timebase_freq);
 
@@ -102,7 +102,7 @@ static void riscv_aclint_mtimer_write_timecmp(RISCVAclintMTimerState *mtimer,
         next = MIN(next, INT64_MAX);
     }
 
-    timer_mod(cpu->env.timer, next);
+    timer_mod(mtimer->timers[hartid], next);
 }
 
 /*
@@ -133,11 +133,11 @@ static uint64_t riscv_aclint_mtimer_read(void *opaque, hwaddr addr,
                           "aclint-mtimer: invalid hartid: %zu", hartid);
         } else if ((addr & 0x7) == 0) {
             /* timecmp_lo for RV32/RV64 or timecmp for RV64 */
-            uint64_t timecmp = env->timecmp;
+            uint64_t timecmp = mtimer->timecmp[hartid];
             return (size == 4) ? (timecmp & 0xFFFFFFFF) : timecmp;
         } else if ((addr & 0x7) == 4) {
             /* timecmp_hi */
-            uint64_t timecmp = env->timecmp;
+            uint64_t timecmp = mtimer->timecmp[hartid];
             return (timecmp >> 32) & 0xFFFFFFFF;
         } else {
             qemu_log_mask(LOG_UNIMP,
@@ -177,7 +177,7 @@ static void riscv_aclint_mtimer_write(void *opaque, hwaddr addr,
         } else if ((addr & 0x7) == 0) {
             if (size == 4) {
                 /* timecmp_lo for RV32/RV64 */
-                uint64_t timecmp_hi = env->timecmp >> 32;
+                uint64_t timecmp_hi = mtimer->timecmp[hartid] >> 32;
                 riscv_aclint_mtimer_write_timecmp(mtimer, RISCV_CPU(cpu), hartid,
                     timecmp_hi << 32 | (value & 0xFFFFFFFF));
             } else {
@@ -188,7 +188,7 @@ static void riscv_aclint_mtimer_write(void *opaque, hwaddr addr,
         } else if ((addr & 0x7) == 4) {
             if (size == 4) {
                 /* timecmp_hi for RV32/RV64 */
-                uint64_t timecmp_lo = env->timecmp;
+                uint64_t timecmp_lo = mtimer->timecmp[hartid];
                 riscv_aclint_mtimer_write_timecmp(mtimer, RISCV_CPU(cpu), hartid,
                     value << 32 | (timecmp_lo & 0xFFFFFFFF));
             } else {
@@ -233,7 +233,7 @@ static void riscv_aclint_mtimer_write(void *opaque, hwaddr addr,
                 continue;
             }
             riscv_aclint_mtimer_write_timecmp(mtimer, RISCV_CPU(cpu),
-                                              i, env->timecmp);
+                                              i, mtimer->timecmp[i]);
         }
         return;
     }
@@ -283,6 +283,8 @@ static void riscv_aclint_mtimer_realize(DeviceState *dev, Error **errp)
     s->timer_irqs = g_new(qemu_irq, s->num_harts);
     qdev_init_gpio_out(dev, s->timer_irqs, s->num_harts);
 
+    s->timers = g_malloc0(s->num_harts * sizeof(QEMUTimer));
+    s->timecmp = g_new(uint64_t, s->num_harts);
     /* Claim timer interrupt bits */
     for (i = 0; i < s->num_harts; i++) {
         RISCVCPU *cpu = RISCV_CPU(qemu_get_cpu(s->hartid_base + i));
@@ -335,6 +337,7 @@ DeviceState *riscv_aclint_mtimer_create(hwaddr addr, hwaddr size,
 {
     int i;
     DeviceState *dev = qdev_new(TYPE_RISCV_ACLINT_MTIMER);
+    RISCVAclintMTimerState *s = RISCV_ACLINT_MTIMER(dev);
 
     assert(num_harts <= RISCV_ACLINT_MAX_HARTS);
     assert(!(addr & 0x7));
@@ -365,11 +368,11 @@ DeviceState *riscv_aclint_mtimer_create(hwaddr addr, hwaddr size,
             riscv_cpu_set_rdtime_fn(env, cpu_riscv_read_rtc, dev);
         }
 
-        cb->s = RISCV_ACLINT_MTIMER(dev);
+        cb->s = s;
         cb->num = i;
-        env->timer = timer_new_ns(QEMU_CLOCK_VIRTUAL,
+        s->timers[i] = timer_new_ns(QEMU_CLOCK_VIRTUAL,
                                   &riscv_aclint_mtimer_cb, cb);
-        env->timecmp = 0;
+        s->timecmp[i] = 0;
 
         qdev_connect_gpio_out(dev, i,
                               qdev_get_gpio_in(DEVICE(rvcpu), IRQ_M_TIMER));
diff --git a/hw/timer/ibex_timer.c b/hw/timer/ibex_timer.c
index 8c2ca364daab..d7786b35101a 100644
--- a/hw/timer/ibex_timer.c
+++ b/hw/timer/ibex_timer.c
@@ -30,8 +30,8 @@
 #include "qemu/timer.h"
 #include "hw/timer/ibex_timer.h"
 #include "hw/irq.h"
-#include "hw/qdev-properties.h"
 #include "target/riscv/cpu.h"
+#include "hw/qdev-properties.h"
 #include "migration/vmstate.h"
 
 REG32(ALERT_TEST, 0x00)
@@ -60,8 +60,6 @@ static uint64_t cpu_riscv_read_rtc(uint32_t timebase_freq)
 
 static void ibex_timer_update_irqs(IbexTimerState *s)
 {
-    CPUState *cs = qemu_get_cpu(0);
-    RISCVCPU *cpu = RISCV_CPU(cs);
     uint64_t value = s->timer_compare_lower0 |
                          ((uint64_t)s->timer_compare_upper0 << 32);
     uint64_t next, diff;
@@ -73,9 +71,9 @@ static void ibex_timer_update_irqs(IbexTimerState *s)
     }
 
     /* Update the CPUs mtimecmp */
-    cpu->env.timecmp = value;
+    s->mtimecmp = value;
 
-    if (cpu->env.timecmp <= now) {
+    if (s->mtimecmp <= now) {
         /*
          * If the mtimecmp was in the past raise the interrupt now.
          */
@@ -91,7 +89,7 @@ static void ibex_timer_update_irqs(IbexTimerState *s)
     qemu_irq_lower(s->m_timer_irq);
     qemu_set_irq(s->irq, false);
 
-    diff = cpu->env.timecmp - now;
+    diff = s->mtimecmp - now;
     next = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
                                  muldiv64(diff,
                                           NANOSECONDS_PER_SECOND,
@@ -99,9 +97,9 @@ static void ibex_timer_update_irqs(IbexTimerState *s)
 
     if (next < qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL)) {
         /* We overflowed the timer, just set it as large as we can */
-        timer_mod(cpu->env.timer, 0x7FFFFFFFFFFFFFFF);
+        timer_mod(s->mtimer, 0x7FFFFFFFFFFFFFFF);
     } else {
-        timer_mod(cpu->env.timer, next);
+        timer_mod(s->mtimer, next);
     }
 }
 
@@ -120,11 +118,9 @@ static void ibex_timer_reset(DeviceState *dev)
 {
     IbexTimerState *s = IBEX_TIMER(dev);
 
-    CPUState *cpu = qemu_get_cpu(0);
-    CPURISCVState *env = cpu->env_ptr;
-    env->timer = timer_new_ns(QEMU_CLOCK_VIRTUAL,
+    s->mtimer = timer_new_ns(QEMU_CLOCK_VIRTUAL,
                               &ibex_timer_cb, s);
-    env->timecmp = 0;
+    s->mtimecmp = 0;
 
     s->timer_ctrl = 0x00000000;
     s->timer_cfg0 = 0x00010000;
diff --git a/include/hw/intc/riscv_aclint.h b/include/hw/intc/riscv_aclint.h
index 26d4048687fb..693415eb6def 100644
--- a/include/hw/intc/riscv_aclint.h
+++ b/include/hw/intc/riscv_aclint.h
@@ -32,6 +32,8 @@ typedef struct RISCVAclintMTimerState {
     /*< private >*/
     SysBusDevice parent_obj;
     uint64_t time_delta;
+    uint64_t *timecmp;
+    QEMUTimer **timers;
 
     /*< public >*/
     MemoryRegion mmio;
diff --git a/include/hw/timer/ibex_timer.h b/include/hw/timer/ibex_timer.h
index 1a0a28d5fab5..41f5c82a920b 100644
--- a/include/hw/timer/ibex_timer.h
+++ b/include/hw/timer/ibex_timer.h
@@ -33,6 +33,8 @@ OBJECT_DECLARE_SIMPLE_TYPE(IbexTimerState, IBEX_TIMER)
 struct IbexTimerState {
     /* <private> */
     SysBusDevice parent_obj;
+    uint64_t mtimecmp;
+    QEMUTimer *mtimer; /* Internal timer for M-mode interrupt */
 
     /* <public> */
     MemoryRegion mmio;
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 34c22d5d3be3..1119d5201066 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -275,7 +275,6 @@ struct CPUArchState {
     /* temporary htif regs */
     uint64_t mfromhost;
     uint64_t mtohost;
-    uint64_t timecmp;
 
     /* physical memory protection */
     pmp_table_t pmp_state;
@@ -330,7 +329,6 @@ struct CPUArchState {
     float_status fp_status;
 
     /* Fields from here on are preserved across CPU reset. */
-    QEMUTimer *timer; /* Internal timer */
 
     hwaddr kernel_addr;
     hwaddr fdt_addr;
diff --git a/target/riscv/machine.c b/target/riscv/machine.c
index 2a437b29a1ce..14a3c1d775bc 100644
--- a/target/riscv/machine.c
+++ b/target/riscv/machine.c
@@ -334,7 +334,6 @@ const VMStateDescription vmstate_riscv_cpu = {
         VMSTATE_UINTTL(env.mscratch, RISCVCPU),
         VMSTATE_UINT64(env.mfromhost, RISCVCPU),
         VMSTATE_UINT64(env.mtohost, RISCVCPU),
-        VMSTATE_UINT64(env.timecmp, RISCVCPU),
 
         VMSTATE_END_OF_LIST()
     },
-- 
2.25.1


