Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 194772C7A5C
	for <lists+qemu-devel@lfdr.de>; Sun, 29 Nov 2020 18:46:44 +0100 (CET)
Received: from localhost ([::1]:57716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjQmZ-0000aW-1B
	for lists+qemu-devel@lfdr.de; Sun, 29 Nov 2020 12:46:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kjQga-0004yX-EX
 for qemu-devel@nongnu.org; Sun, 29 Nov 2020 12:40:32 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:42281)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kjQgX-0000ZD-5U
 for qemu-devel@nongnu.org; Sun, 29 Nov 2020 12:40:32 -0500
Received: by mail-wr1-x433.google.com with SMTP id l1so12025142wrb.9
 for <qemu-devel@nongnu.org>; Sun, 29 Nov 2020 09:40:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/FxvsfbYuPeoI5yNL7aoPzes/aAFeiidS/o1TlDSqOw=;
 b=TEGmpEv43kFNDUPZYhlAYEkz0fNOu3w3+p9EzMB8U8dGGlQwQYcA16dYYZB+daz9XO
 8iveQrO5MsWphCcuw75JxnfKlFYpYgCvcziKTrNLBmhmJtwtlSoIOdOfm8rdJPSdUQ34
 4scEa/E8YrbaZxaP7k/S81f65so7NefymeT35nxzILAMBhyfhy16beU7x+gp6cBxham9
 FBFEEpebuzvmR48zK5Yn3EKM2fWrjjNNz8TLESVPDXGUf5eUwDQ3D0eSL0sSF3ZPd2yH
 VqZ+5Z1/DUjEYzqN3bdjOhwQsW/pAOr62mogae+jL59aJN2hGxRZgpwhyWeV9dhxm7/5
 Qqxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/FxvsfbYuPeoI5yNL7aoPzes/aAFeiidS/o1TlDSqOw=;
 b=hwOHUiX4yayJPTsBbbh8WaLrxkfKe87osddIUEdZUjqaXSERGx1ZcyevFWXHXgJ788
 fk+sJwPw+P/3T43z3uUephdTOj1/2tz8s/VJq+G5b4HT7AP7Q3HrSU8a09v7jgb5vRB3
 JxPCHEvUNI2apyFbDpIO0EAy9/tGF5+8jGDHx32sA2Fdr71NloMluuanguaBN2jHVWvR
 ZKwi97mP/7EeLz65mUQVgH2mYgoBvniwQ/i1tiTXP223/m+5r2PTb78vN81yOHs6NAUv
 3m1CVA3xgiWk2f/b8GBQeVyKTdK1wsg/SlifefHV1VIOelxmUzCXbFsIriXrf8R/2aqr
 r5nA==
X-Gm-Message-State: AOAM5334tjwvC17rOT3rynrWW6p4KRxNHppUVRqG6k8nyB9MdXK4a9WR
 sz1jAadDAdhks0ryKV7+xNPl3Utr+mHmJA==
X-Google-Smtp-Source: ABdhPJyMkd1qfIHJnQLOpEb7dtvNynLnO2l4Vq+TlQmBUDAAi0aNDOwWeFU3puLS8F1vrhz6cz57Ww==
X-Received: by 2002:adf:f48c:: with SMTP id l12mr23414569wro.280.1606671626605; 
 Sun, 29 Nov 2020 09:40:26 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id b4sm23379940wmc.1.2020.11.29.09.40.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Nov 2020 09:40:26 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/3] target/nios2: Move IIC code into CPU object proper
Date: Sun, 29 Nov 2020 17:40:20 +0000
Message-Id: <20201129174022.26530-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201129174022.26530-1-peter.maydell@linaro.org>
References: <20201129174022.26530-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
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

The Nios2 architecture supports two different interrupt controller
options:

 * The IIC (Internal Interrupt Controller) is part of the CPU itself;
   it has 32 IRQ input lines and no NMI support.  Interrupt status is
   queried and controlled via the CPU's ipending and istatus
   registers.

 * The EIC (External Interrupt Controller) interface allows the CPU
   to connect to an external interrupt controller.  The interface
   allows the interrupt controller to present a packet of information
   containing:
    - handler address
    - interrupt level
    - register set
    - NMI mode

QEMU does not model an EIC currently.  We do model the IIC, but its
implementation is split across code in hw/nios2/cpu_pic.c and
hw/intc/nios2_iic.c.  The code in those two files has no state of its
own -- the IIC state is in the Nios2CPU state struct.

Because CPU objects now inherit (indirectly) from TYPE_DEVICE, they
can have GPIO input lines themselves, so we can implement the IIC
directly in the CPU object the same way that real hardware does.

Create named "IRQ" GPIO inputs to the Nios2 CPU object, and make the
only user of the IIC wire up directly to those instead.

Note that the old code had an "NMI" concept which was entirely unused
and also as far as I can see not architecturally correct, since only
the EIC has a concept of an NMI.

This fixes a Coverity-reported trivial memory leak of the IRQ array
allocated in nios2_cpu_pic_init().

Fixes: Coverity CID 1421916
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/nios2/cpu.h        |  1 -
 hw/intc/nios2_iic.c       | 95 ---------------------------------------
 hw/nios2/10m50_devboard.c | 13 +-----
 hw/nios2/cpu_pic.c        | 31 -------------
 target/nios2/cpu.c        | 30 +++++++++++++
 MAINTAINERS               |  1 -
 hw/intc/meson.build       |  1 -
 7 files changed, 32 insertions(+), 140 deletions(-)
 delete mode 100644 hw/intc/nios2_iic.c

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
diff --git a/hw/intc/nios2_iic.c b/hw/intc/nios2_iic.c
deleted file mode 100644
index 216db670594..00000000000
--- a/hw/intc/nios2_iic.c
+++ /dev/null
@@ -1,95 +0,0 @@
-/*
- * QEMU Altera Internal Interrupt Controller.
- *
- * Copyright (c) 2012 Chris Wulff <crwulff@gmail.com>
- *
- * This library is free software; you can redistribute it and/or
- * modify it under the terms of the GNU Lesser General Public
- * License as published by the Free Software Foundation; either
- * version 2.1 of the License, or (at your option) any later version.
- *
- * This library is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
- * Lesser General Public License for more details.
- *
- * You should have received a copy of the GNU Lesser General Public
- * License along with this library; if not, see
- * <http://www.gnu.org/licenses/lgpl-2.1.html>
- */
-
-#include "qemu/osdep.h"
-#include "qemu/module.h"
-#include "qapi/error.h"
-
-#include "hw/irq.h"
-#include "hw/sysbus.h"
-#include "cpu.h"
-#include "qom/object.h"
-
-#define TYPE_ALTERA_IIC "altera,iic"
-OBJECT_DECLARE_SIMPLE_TYPE(AlteraIIC, ALTERA_IIC)
-
-struct AlteraIIC {
-    SysBusDevice  parent_obj;
-    void         *cpu;
-    qemu_irq      parent_irq;
-};
-
-static void update_irq(AlteraIIC *pv)
-{
-    CPUNios2State *env = &((Nios2CPU *)(pv->cpu))->env;
-
-    qemu_set_irq(pv->parent_irq,
-                 env->regs[CR_IPENDING] & env->regs[CR_IENABLE]);
-}
-
-static void irq_handler(void *opaque, int irq, int level)
-{
-    AlteraIIC *pv = opaque;
-    CPUNios2State *env = &((Nios2CPU *)(pv->cpu))->env;
-
-    env->regs[CR_IPENDING] &= ~(1 << irq);
-    env->regs[CR_IPENDING] |= !!level << irq;
-
-    update_irq(pv);
-}
-
-static void altera_iic_init(Object *obj)
-{
-    AlteraIIC *pv = ALTERA_IIC(obj);
-
-    qdev_init_gpio_in(DEVICE(pv), irq_handler, 32);
-    sysbus_init_irq(SYS_BUS_DEVICE(obj), &pv->parent_irq);
-}
-
-static void altera_iic_realize(DeviceState *dev, Error **errp)
-{
-    struct AlteraIIC *pv = ALTERA_IIC(dev);
-
-    pv->cpu = object_property_get_link(OBJECT(dev), "cpu", &error_abort);
-}
-
-static void altera_iic_class_init(ObjectClass *klass, void *data)
-{
-    DeviceClass *dc = DEVICE_CLASS(klass);
-
-    /* Reason: needs to be wired up, e.g. by nios2_10m50_ghrd_init() */
-    dc->user_creatable = false;
-    dc->realize = altera_iic_realize;
-}
-
-static TypeInfo altera_iic_info = {
-    .name          = TYPE_ALTERA_IIC,
-    .parent        = TYPE_SYS_BUS_DEVICE,
-    .instance_size = sizeof(AlteraIIC),
-    .instance_init = altera_iic_init,
-    .class_init    = altera_iic_class_init,
-};
-
-static void altera_iic_register(void)
-{
-    type_register_static(&altera_iic_info);
-}
-
-type_init(altera_iic_register)
diff --git a/hw/nios2/10m50_devboard.c b/hw/nios2/10m50_devboard.c
index 5c13b74306f..a14fc31e86b 100644
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
@@ -75,17 +75,8 @@ static void nios2_10m50_ghrd_init(MachineState *machine)
 
     /* Create CPU -- FIXME */
     cpu = NIOS2_CPU(cpu_create(TYPE_NIOS2_CPU));
-
-    /* Register: CPU interrupt controller (PIC) */
-    cpu_irq = nios2_cpu_pic_init(cpu);
-
-    /* Register: Internal Interrupt Controller (IIC) */
-    dev = qdev_new("altera,iic");
-    object_property_add_const_link(OBJECT(dev), "cpu", OBJECT(cpu));
-    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
-    sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, cpu_irq[0]);
     for (i = 0; i < 32; i++) {
-        irq[i] = qdev_get_gpio_in(dev, i);
+        irq[i] = qdev_get_gpio_in_named(DEVICE(cpu), "IRQ", i);
     }
 
     /* Register: Altera 16550 UART */
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
index 8f7011fcb92..52ebda89ca7 100644
--- a/target/nios2/cpu.c
+++ b/target/nios2/cpu.c
@@ -64,6 +64,27 @@ static void nios2_cpu_reset(DeviceState *dev)
 #endif
 }
 
+#ifndef CONFIG_USER_ONLY
+static void nios2_cpu_set_irq(void *opaque, int irq, int level)
+{
+    Nios2CPU *cpu = opaque;
+    CPUNios2State *env = &cpu->env;
+    CPUState *cs = CPU(cpu);
+
+    env->regs[CR_IPENDING] &= ~(1 << irq);
+    env->regs[CR_IPENDING] |= !!level << irq;
+
+    env->irq_pending = env->regs[CR_IPENDING] & env->regs[CR_IENABLE];
+
+    if (env->irq_pending && (env->regs[CR_STATUS] & CR_STATUS_PIE)) {
+        env->irq_pending = 0;
+        cpu_interrupt(cs, CPU_INTERRUPT_HARD);
+    } else if (!env->irq_pending) {
+        cpu_reset_interrupt(cs, CPU_INTERRUPT_HARD);
+    }
+}
+#endif
+
 static void nios2_cpu_initfn(Object *obj)
 {
     Nios2CPU *cpu = NIOS2_CPU(obj);
@@ -72,6 +93,15 @@ static void nios2_cpu_initfn(Object *obj)
 
 #if !defined(CONFIG_USER_ONLY)
     mmu_init(&cpu->env);
+
+    /*
+     * These interrupt lines model the IIC (internal interrupt
+     * controller). QEMU does not currently support the EIC
+     * (external interrupt controller) -- if we did it would be
+     * a separate device in hw/intc with a custom interface to
+     * the CPU, and boards using it would not wire up these IRQ lines.
+     */
+    qdev_init_gpio_in_named(DEVICE(cpu), nios2_cpu_set_irq, "IRQ", 32);
 #endif
 }
 
diff --git a/MAINTAINERS b/MAINTAINERS
index 68bc160f41b..1bf7d02330e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -259,7 +259,6 @@ M: Marek Vasut <marex@denx.de>
 S: Maintained
 F: target/nios2/
 F: hw/nios2/
-F: hw/intc/nios2_iic.c
 F: disas/nios2.c
 F: default-configs/nios2-softmmu.mak
 
diff --git a/hw/intc/meson.build b/hw/intc/meson.build
index 3f82cc230ad..7c3e9daf586 100644
--- a/hw/intc/meson.build
+++ b/hw/intc/meson.build
@@ -37,7 +37,6 @@ specific_ss.add(when: 'CONFIG_IBEX', if_true: files('ibex_plic.c'))
 specific_ss.add(when: 'CONFIG_IOAPIC', if_true: files('ioapic.c'))
 specific_ss.add(when: 'CONFIG_LOONGSON_LIOINTC', if_true: files('loongson_liointc.c'))
 specific_ss.add(when: 'CONFIG_MIPS_CPS', if_true: files('mips_gic.c'))
-specific_ss.add(when: 'CONFIG_NIOS2', if_true: files('nios2_iic.c'))
 specific_ss.add(when: 'CONFIG_OMAP', if_true: files('omap_intc.c'))
 specific_ss.add(when: 'CONFIG_OMPIC', if_true: files('ompic.c'))
 specific_ss.add(when: 'CONFIG_OPENPIC_KVM', if_true: files('openpic_kvm.c'))
-- 
2.20.1


