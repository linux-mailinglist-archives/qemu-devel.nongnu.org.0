Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 649C62C6D6B
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 23:56:17 +0100 (CET)
Received: from localhost ([::1]:43242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kimf2-00050n-Ff
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 17:56:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kimad-0001kh-Uy
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 17:51:43 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:34387)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kimaX-00058o-OC
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 17:51:43 -0500
Received: by mail-wm1-x331.google.com with SMTP id g25so3253592wmh.1
 for <qemu-devel@nongnu.org>; Fri, 27 Nov 2020 14:51:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MVfCyIKYRUXr7imyRBkz/klFFCA+S52B4FiE+DiGsYA=;
 b=S6j/oAIGH26k2SkWuVoEDKEY1VWrmSIbWulFC22nwFBTqeS/5yhi9PAwG83PpyojO3
 fZ16RAIAG9JMb+SWbCRFdSsKfLdjUY1pG/9y5gDUpm6NY1WDz8Bc8dcm9ixEkR/QlR8N
 JD71i9Z/VRGH9AubBxXSf5oh6TeO774VTfGiDn0MxdhJ8pd3/IsQq51maO+NPhIoIMo4
 Ygs0XC+s/6NRG8E1xH7NH4GA3Rry8EzyHFT4dTXFXOUejXe8RdDMTf7VghsAzzJsGuWI
 uVmaQyVJ9tHJgCybaIRw2hfApdcCVHHjNSHNaaFAUGDEMnXPpsKIGewKWEUhHvlX3118
 PtvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MVfCyIKYRUXr7imyRBkz/klFFCA+S52B4FiE+DiGsYA=;
 b=AR6zkDVN28tb1+BkI01AkYY7QBsj1gjDDQ7eGymhUYcPcPOO63LQMyJ+dcR+dL2CTV
 +pv+xxlU1sS8yvuVguwh/jaziWFCSdipGXjKjtUz6e2MibJ+gG27yFCefdD9d5G4J09H
 cVe/mlSksar33P9en3i3QrwK4pucGtESL30kclxJZcXa24x4GnFtTEG1TEZsUAhXF+uW
 +bzrOvj5TOVw8FT0wzm3O5ZrU2jMmgjPWn6qwrMW/QQUfiBEjSjTRy7Vu81Rda5Lwi9O
 dOKIrTwBtbSqShMdtzY8eCxkYjz36KguQxBDECqYcZsJFebu24cbBqUQDXMxSkGFnXPf
 bH9w==
X-Gm-Message-State: AOAM531Hfld/MSwq+SZ3sFYMLQYnuW2LqbztjHvUrFvYLbXB7VPNvCHs
 ElsRZE+HbCYZlT/XLz9O7NpL76FPgjP7Xg==
X-Google-Smtp-Source: ABdhPJzCGKrRoyzYYO5OgXpqOrcvMiskAX2QKgZXo0ROG9b3RUCcJFQIRWOXxfrJmZ6lvKVWQ5cqDw==
X-Received: by 2002:a1c:a507:: with SMTP id o7mr10414201wme.164.1606517495808; 
 Fri, 27 Nov 2020 14:51:35 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q16sm17429756wrn.13.2020.11.27.14.51.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Nov 2020 14:51:35 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/3] target/openrisc: Move pic_cpu code into CPU object proper
Date: Fri, 27 Nov 2020 22:51:27 +0000
Message-Id: <20201127225127.14770-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201127225127.14770-1-peter.maydell@linaro.org>
References: <20201127225127.14770-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
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
Cc: Stafford Horne <shorne@gmail.com>, Jia Liu <proljc@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The openrisc code uses an old style of interrupt handling, where a
separate standalone set of qemu_irqs invoke a function
openrisc_pic_cpu_handler() which signals the interrupt to the CPU
proper by directly calling cpu_interrupt() and cpu_reset_interrupt().
Because CPU objects now inherit (indirectly) from TYPE_DEVICE, they
can have GPIO input lines themselves, and the neater modern way to
implement this is to simply have the CPU object itself provide the
input IRQ lines.

Create GPIO inputs to the OpenRISC CPU object, and make the only user
of cpu_openrisc_pic_init() wire up directly to those instead.

This allows us to delete the hw/openrisc/pic_cpu.c file entirely.

This fixes a trivial memory leak reported by Coverity of the IRQs
allocated in cpu_openrisc_pic_init().

Fixes: Coverity CID 1421934
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/openrisc/cpu.h      |  1 -
 hw/openrisc/openrisc_sim.c |  3 +-
 hw/openrisc/pic_cpu.c      | 61 --------------------------------------
 target/openrisc/cpu.c      | 32 ++++++++++++++++++++
 hw/openrisc/meson.build    |  2 +-
 5 files changed, 34 insertions(+), 65 deletions(-)
 delete mode 100644 hw/openrisc/pic_cpu.c

diff --git a/target/openrisc/cpu.h b/target/openrisc/cpu.h
index bd42faf144f..82cbaeb4f84 100644
--- a/target/openrisc/cpu.h
+++ b/target/openrisc/cpu.h
@@ -293,7 +293,6 @@ typedef struct CPUOpenRISCState {
     uint32_t picmr;         /* Interrupt mask register */
     uint32_t picsr;         /* Interrupt contrl register*/
 #endif
-    void *irq[32];          /* Interrupt irq input */
 } CPUOpenRISCState;
 
 /**
diff --git a/hw/openrisc/openrisc_sim.c b/hw/openrisc/openrisc_sim.c
index 75ba0f47444..39f1d344ae9 100644
--- a/hw/openrisc/openrisc_sim.c
+++ b/hw/openrisc/openrisc_sim.c
@@ -54,7 +54,7 @@ static void main_cpu_reset(void *opaque)
 
 static qemu_irq get_cpu_irq(OpenRISCCPU *cpus[], int cpunum, int irq_pin)
 {
-    return cpus[cpunum]->env.irq[irq_pin];
+    return qdev_get_gpio_in_named(DEVICE(cpus[cpunum]), "IRQ", irq_pin);
 }
 
 static void openrisc_sim_net_init(hwaddr base, hwaddr descriptors,
@@ -154,7 +154,6 @@ static void openrisc_sim_init(MachineState *machine)
             fprintf(stderr, "Unable to find CPU definition!\n");
             exit(1);
         }
-        cpu_openrisc_pic_init(cpus[n]);
 
         cpu_openrisc_clock_init(cpus[n]);
 
diff --git a/hw/openrisc/pic_cpu.c b/hw/openrisc/pic_cpu.c
deleted file mode 100644
index 36f93508309..00000000000
--- a/hw/openrisc/pic_cpu.c
+++ /dev/null
@@ -1,61 +0,0 @@
-/*
- * OpenRISC Programmable Interrupt Controller support.
- *
- * Copyright (c) 2011-2012 Jia Liu <proljc@gmail.com>
- *                         Feng Gao <gf91597@gmail.com>
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
- * License along with this library; if not, see <http://www.gnu.org/licenses/>.
- */
-
-#include "qemu/osdep.h"
-#include "hw/irq.h"
-#include "cpu.h"
-
-/* OpenRISC pic handler */
-static void openrisc_pic_cpu_handler(void *opaque, int irq, int level)
-{
-    OpenRISCCPU *cpu = (OpenRISCCPU *)opaque;
-    CPUState *cs = CPU(cpu);
-    uint32_t irq_bit;
-
-    if (irq > 31 || irq < 0) {
-        return;
-    }
-
-    irq_bit = 1U << irq;
-
-    if (level) {
-        cpu->env.picsr |= irq_bit;
-    } else {
-        cpu->env.picsr &= ~irq_bit;
-    }
-
-    if (cpu->env.picsr & cpu->env.picmr) {
-        cpu_interrupt(cs, CPU_INTERRUPT_HARD);
-    } else {
-        cpu_reset_interrupt(cs, CPU_INTERRUPT_HARD);
-        cpu->env.picsr = 0;
-    }
-}
-
-void cpu_openrisc_pic_init(OpenRISCCPU *cpu)
-{
-    int i;
-    qemu_irq *qi;
-    qi = qemu_allocate_irqs(openrisc_pic_cpu_handler, cpu, NR_IRQS);
-
-    for (i = 0; i < NR_IRQS; i++) {
-        cpu->env.irq[i] = qi[i];
-    }
-}
diff --git a/target/openrisc/cpu.c b/target/openrisc/cpu.c
index 5528c0918f4..b0bdfbe4fe2 100644
--- a/target/openrisc/cpu.c
+++ b/target/openrisc/cpu.c
@@ -65,6 +65,34 @@ static void openrisc_cpu_reset(DeviceState *dev)
 #endif
 }
 
+#ifndef CONFIG_USER_ONLY
+static void openrisc_cpu_set_irq(void *opaque, int irq, int level)
+{
+    OpenRISCCPU *cpu = (OpenRISCCPU *)opaque;
+    CPUState *cs = CPU(cpu);
+    uint32_t irq_bit;
+
+    if (irq > 31 || irq < 0) {
+        return;
+    }
+
+    irq_bit = 1U << irq;
+
+    if (level) {
+        cpu->env.picsr |= irq_bit;
+    } else {
+        cpu->env.picsr &= ~irq_bit;
+    }
+
+    if (cpu->env.picsr & cpu->env.picmr) {
+        cpu_interrupt(cs, CPU_INTERRUPT_HARD);
+    } else {
+        cpu_reset_interrupt(cs, CPU_INTERRUPT_HARD);
+        cpu->env.picsr = 0;
+    }
+}
+#endif
+
 static void openrisc_cpu_realizefn(DeviceState *dev, Error **errp)
 {
     CPUState *cs = CPU(dev);
@@ -88,6 +116,10 @@ static void openrisc_cpu_initfn(Object *obj)
     OpenRISCCPU *cpu = OPENRISC_CPU(obj);
 
     cpu_set_cpustate_pointers(cpu);
+
+#ifndef CONFIG_USER_ONLY
+    qdev_init_gpio_in_named(DEVICE(cpu), openrisc_cpu_set_irq, "IRQ", NR_IRQS);
+#endif
 }
 
 /* CPU models */
diff --git a/hw/openrisc/meson.build b/hw/openrisc/meson.build
index 57c42558e18..947f63ee087 100644
--- a/hw/openrisc/meson.build
+++ b/hw/openrisc/meson.build
@@ -1,5 +1,5 @@
 openrisc_ss = ss.source_set()
-openrisc_ss.add(files('pic_cpu.c', 'cputimer.c'))
+openrisc_ss.add(files('cputimer.c'))
 openrisc_ss.add(when: 'CONFIG_OR1K_SIM', if_true: files('openrisc_sim.c'))
 
 hw_arch += {'openrisc': openrisc_ss}
-- 
2.20.1


