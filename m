Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 952A02C6BE0
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 20:16:23 +0100 (CET)
Received: from localhost ([::1]:49156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kijEE-0006W0-Ks
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 14:16:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kijAf-0005BA-5Z
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 14:12:41 -0500
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:40814)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kijAd-0004Ry-58
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 14:12:40 -0500
Received: by mail-wr1-x444.google.com with SMTP id m6so6611325wrg.7
 for <qemu-devel@nongnu.org>; Fri, 27 Nov 2020 11:12:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rYWSqU97TTIF2G1xrqc542TJUc1cxfiAAwoKNqxMB2k=;
 b=BPLfzU85eJVQGqkQrhMoE5qQep0feWBiXTOeODemiohJnjmV2E7V0mkPAVy/K2fTML
 Pbpsz8ZVgfL8NptqmQb3WlNhtKGoHuZVCUY9V/XyztOTFVl74nLHhR3BuRU5xMtDQM0v
 cxfHMm+OO9Z1LMICEAHl+NqXwvfK9IlNaWkc4huS71OF9K7BqhJS/yfjwIcZzTrr1Ock
 LkB3zwn0w2b/wLky7pVLFzRLQeF3X2DIR0qF+phmUtkrMTMmTafoCUjeZtC8iOntCVYf
 hKw6dMTXOUCcAaO8Ka0u7TcRWMv83/d9AqD6kO1Zjd9XOMJgnh26dm9WBI2LSUDO1DXt
 8BXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rYWSqU97TTIF2G1xrqc542TJUc1cxfiAAwoKNqxMB2k=;
 b=txKTLYEoDTF0ucVEfL+EsNjMqTVSpzt/qdGtU1vEjREmSowB642NMUOJAM0TY0dNO2
 o9Sk6S6qfmnDTN7G4F5TQAwg2V5CBRaSNiYr/T7byK0c8U+Z8PoDJKfwYVizkjH0oV35
 zbnFbz60+r0kr12+sZsoLqGUeS+CaWRBgUvU/nDi6jy7xDHtf6vwSTbtp0jk7TIUSL79
 9bo7yN85guypm2OjwlgZGonNlKzNAdGUcsEmwrXdvL6F/OlVtgbAi+l9l3azvkeWMZbX
 nYk7tZV+Ih+9rORnh80bevQK665trBH2SH7w56bqZDEvU40sbnghOxDNKTxHLkrWvtYj
 JEoA==
X-Gm-Message-State: AOAM530gtBQ/LqeFvVhX2z5TSL04FiJkhNX6OzocPGfhX38wrW8eTNLV
 tLgykP5QdV5paB0FHu5jqEY8e1qlTIuGSw==
X-Google-Smtp-Source: ABdhPJxyO1WEHJ//UynGQqRCIs4/9b/BgnCJjsu5hsWkPwORACRzQJ9Cn5OvpbyWDC4WS1v/lu/0aA==
X-Received: by 2002:adf:f08e:: with SMTP id n14mr12189592wro.136.1606504357271; 
 Fri, 27 Nov 2020 11:12:37 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id 34sm15809722wrh.78.2020.11.27.11.12.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Nov 2020 11:12:36 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] target/nios2: Move cpu_pic code into CPU object proper
Date: Fri, 27 Nov 2020 19:12:32 +0000
Message-Id: <20201127191233.11200-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201127191233.11200-1-peter.maydell@linaro.org>
References: <20201127191233.11200-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::444;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x444.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Marek Vasut <marex@denx.de>, Sandra Loosemore <sandra@codesourcery.com>,
 Chris Wulff <crwulff@gmail.com>, Wentong Wu <wentong.wu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The nios2 code uses an old style of interrupt handling, where a
separate standalone set of qemu_irqs invoke a function
nios2_pic_cpu_handler() which signals the interrupt to the CPU proper
by directly calling cpu_interrupt() and cpu_reset_interrupt().
Because CPU objects now inherit (indirectly) from TYPE_DEVICE, they
can have GPIO input lines themselves, and the neater modern way to
implement this is to simply have the CPU object itself provide the
input IRQ lines.

Create named "NMI" and "IRQ" GPIO inputs to the Nios2 CPU object, and
make the only user of nios2_cpu_pic_init() wire up directly to those
instead.

This fixes a Coverity-reported trivial memory leak of the IRQ array
allocated in nios2_cpu_pic_init().

Fixes: Coverity CID 1421916
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/nios2/cpu.h        |  1 -
 hw/nios2/10m50_devboard.c |  8 +++-----
 hw/nios2/cpu_pic.c        | 31 -------------------------------
 target/nios2/cpu.c        | 34 ++++++++++++++++++++++++++++++++++
 4 files changed, 37 insertions(+), 37 deletions(-)

diff --git a/target/nios2/cpu.h b/target/nios2/cpu.h
index 86bbe1d8670..b7efb54ba7e 100644
--- a/target/nios2/cpu.h
+++ b/target/nios2/cpu.h
@@ -201,7 +201,6 @@ void nios2_cpu_do_unaligned_access(CPUState *cpu, vaddr addr,
                                    MMUAccessType access_type,
                                    int mmu_idx, uintptr_t retaddr);
 
-qemu_irq *nios2_cpu_pic_init(Nios2CPU *cpu);
 void nios2_check_interrupts(CPUNios2State *env);
 
 void do_nios2_semihosting(CPUNios2State *env);
diff --git a/hw/nios2/10m50_devboard.c b/hw/nios2/10m50_devboard.c
index 5c13b74306f..ac1993e8c08 100644
--- a/hw/nios2/10m50_devboard.c
+++ b/hw/nios2/10m50_devboard.c
@@ -52,7 +52,7 @@ static void nios2_10m50_ghrd_init(MachineState *machine)
     ram_addr_t tcm_size = 0x1000;    /* 1 kiB, but QEMU limit is 4 kiB */
     ram_addr_t ram_base = 0x08000000;
     ram_addr_t ram_size = 0x08000000;
-    qemu_irq *cpu_irq, irq[32];
+    qemu_irq irq[32];
     int i;
 
     /* Physical TCM (tb_ram_1k) with alias at 0xc0000000 */
@@ -76,14 +76,12 @@ static void nios2_10m50_ghrd_init(MachineState *machine)
     /* Create CPU -- FIXME */
     cpu = NIOS2_CPU(cpu_create(TYPE_NIOS2_CPU));
 
-    /* Register: CPU interrupt controller (PIC) */
-    cpu_irq = nios2_cpu_pic_init(cpu);
-
     /* Register: Internal Interrupt Controller (IIC) */
     dev = qdev_new("altera,iic");
     object_property_add_const_link(OBJECT(dev), "cpu", OBJECT(cpu));
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
-    sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, cpu_irq[0]);
+    sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0,
+                       qdev_get_gpio_in_named(DEVICE(cpu), "IRQ", 0));
     for (i = 0; i < 32; i++) {
         irq[i] = qdev_get_gpio_in(dev, i);
     }
diff --git a/hw/nios2/cpu_pic.c b/hw/nios2/cpu_pic.c
index 5ea7e52ab83..3fb621c5c85 100644
--- a/hw/nios2/cpu_pic.c
+++ b/hw/nios2/cpu_pic.c
@@ -26,32 +26,6 @@
 
 #include "boot.h"
 
-static void nios2_pic_cpu_handler(void *opaque, int irq, int level)
-{
-    Nios2CPU *cpu = opaque;
-    CPUNios2State *env = &cpu->env;
-    CPUState *cs = CPU(cpu);
-    int type = irq ? CPU_INTERRUPT_NMI : CPU_INTERRUPT_HARD;
-
-    if (type == CPU_INTERRUPT_HARD) {
-        env->irq_pending = level;
-
-        if (level && (env->regs[CR_STATUS] & CR_STATUS_PIE)) {
-            env->irq_pending = 0;
-            cpu_interrupt(cs, type);
-        } else if (!level) {
-            env->irq_pending = 0;
-            cpu_reset_interrupt(cs, type);
-        }
-    } else {
-        if (level) {
-            cpu_interrupt(cs, type);
-        } else {
-            cpu_reset_interrupt(cs, type);
-        }
-    }
-}
-
 void nios2_check_interrupts(CPUNios2State *env)
 {
     if (env->irq_pending &&
@@ -60,8 +34,3 @@ void nios2_check_interrupts(CPUNios2State *env)
         cpu_interrupt(env_cpu(env), CPU_INTERRUPT_HARD);
     }
 }
-
-qemu_irq *nios2_cpu_pic_init(Nios2CPU *cpu)
-{
-    return qemu_allocate_irqs(nios2_pic_cpu_handler, cpu, 2);
-}
diff --git a/target/nios2/cpu.c b/target/nios2/cpu.c
index 8f7011fcb92..4b21e7c6d1c 100644
--- a/target/nios2/cpu.c
+++ b/target/nios2/cpu.c
@@ -64,6 +64,37 @@ static void nios2_cpu_reset(DeviceState *dev)
 #endif
 }
 
+#ifndef CONFIG_USER_ONLY
+static void nios2_cpu_set_nmi(void *opaque, int irq, int level)
+{
+    Nios2CPU *cpu = opaque;
+    CPUState *cs = CPU(cpu);
+
+    if (level) {
+        cpu_interrupt(cs, CPU_INTERRUPT_NMI);
+    } else {
+        cpu_reset_interrupt(cs, CPU_INTERRUPT_NMI);
+    }
+}
+
+static void nios2_cpu_set_irq(void *opaque, int irq, int level)
+{
+    Nios2CPU *cpu = opaque;
+    CPUNios2State *env = &cpu->env;
+    CPUState *cs = CPU(cpu);
+
+    env->irq_pending = level;
+
+    if (level && (env->regs[CR_STATUS] & CR_STATUS_PIE)) {
+        env->irq_pending = 0;
+        cpu_interrupt(cs, CPU_INTERRUPT_HARD);
+    } else if (!level) {
+        env->irq_pending = 0;
+        cpu_reset_interrupt(cs, CPU_INTERRUPT_HARD);
+    }
+}
+#endif
+
 static void nios2_cpu_initfn(Object *obj)
 {
     Nios2CPU *cpu = NIOS2_CPU(obj);
@@ -72,6 +103,9 @@ static void nios2_cpu_initfn(Object *obj)
 
 #if !defined(CONFIG_USER_ONLY)
     mmu_init(&cpu->env);
+
+    qdev_init_gpio_in_named(DEVICE(cpu), nios2_cpu_set_nmi, "NMI", 1);
+    qdev_init_gpio_in_named(DEVICE(cpu), nios2_cpu_set_irq, "IRQ", 1);
 #endif
 }
 
-- 
2.20.1


