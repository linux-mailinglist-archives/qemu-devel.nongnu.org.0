Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A85F82DAEBB
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 15:18:11 +0100 (CET)
Received: from localhost ([::1]:53134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpB9W-0006kf-Mo
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 09:18:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kpB4R-0001Sf-Ny
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 09:12:58 -0500
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:55580)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kpB4J-00076r-6r
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 09:12:55 -0500
Received: by mail-wm1-x342.google.com with SMTP id x22so17001898wmc.5
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 06:12:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=9UlecDaR2TH7Y40McyC04bsmJGq7HwQNtSBVe+3WirE=;
 b=IMtkcb6OQjGa4xlnf6Pte3F6UrPDcaKsV6UDt1t4Sq3ftVvvRql5PIQ5tHsbn5KtFA
 kg0SYf4BhrHjj7sAZQYP+qPDw2NuEI/0UITVF7RbkevG4o9s5qzLztlUkzARpSgwwCej
 T/bAZgLq2aFq7pbrBB9qSaeIHhHD2Pep7uGgVx09sBHK9d+S1bUhrq1ek+wLMSp7Qb3O
 wVXLtpbSFt7Q7fdN+iAZXA8GdkiSNXLfWlecL034uqddjH72wQ5yH8CRgAOAhEs6RD/H
 ymlTwKofaW5i38+HXGpjN8x2pIcrwAFyk8T7Bsfj1u2DFkrJa8Bn5Oot7gxkfc8oHxyp
 2Paw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9UlecDaR2TH7Y40McyC04bsmJGq7HwQNtSBVe+3WirE=;
 b=jz6gKe9t0gnVQcSuhbH8DtYi2IRGLfCoPdkGvY+HSceAbBObxCnrer3fXy1SsEiqEN
 e5r6HPQFytRePCMeVVxOPffNe6CC8IaaBA9EFuGLHjVqwrCrgysB9T4GAFjeUy3+YZsG
 1if8DvJNjNeN6d+R59iG3HXAqmDaUdp53T5me4k6hMtgXD8lVf4aW+NqFhwMe4dsieMd
 Td1KPLHmlwFanuSvfB6CX4R+TYDg5PmSqxv9G4cQbirBYd+YeYu3+40DLTbNhdxruWVc
 f6MI/dZ2bG8Mz8tUTXPZa6VQmSkLaimjNDdhy+cYaKNNIrhmT1MjkN/PgAtOxJbS3Euz
 t9kg==
X-Gm-Message-State: AOAM532MCI8j9SE2uJx+zvi/RZeRqAE9Ash/P6O9qaRtIPDL3W741Jkg
 JFhPZTp12c/BEs4bgF9TDWhkgLgiTNZV2g==
X-Google-Smtp-Source: ABdhPJzr9cieubB+kBKcKeY04Q0NOoJIfjJx4T2R2pZC2uf1b31t3OhOW6X2htdhAAW7Xkb2KJc2MA==
X-Received: by 2002:a1c:3c09:: with SMTP id j9mr33200906wma.180.1608041563515; 
 Tue, 15 Dec 2020 06:12:43 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id w21sm19667319wmi.45.2020.12.15.06.12.42
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Dec 2020 06:12:42 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 03/20] hw/openrisc/openrisc_sim: Abstract out "get IRQ x of CPU
 y"
Date: Tue, 15 Dec 2020 14:12:20 +0000
Message-Id: <20201215141237.17868-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201215141237.17868-1-peter.maydell@linaro.org>
References: <20201215141237.17868-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::342;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x342.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We're about to refactor the OpenRISC pic_cpu code in a way that means
that just grabbing the whole qemu_irq[] array of inbound IRQs for a
CPU won't be possible any more.  Abstract out a function for "return
the qemu_irq for IRQ x input of CPU y" so we can more easily replace
the implementation.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Stafford Horne <shorne@gmail.com>
Message-id: 20201127225127.14770-3-peter.maydell@linaro.org
---
 hw/openrisc/openrisc_sim.c | 38 +++++++++++++++++++++-----------------
 1 file changed, 21 insertions(+), 17 deletions(-)

diff --git a/hw/openrisc/openrisc_sim.c b/hw/openrisc/openrisc_sim.c
index a8adf6b70d7..75ba0f47444 100644
--- a/hw/openrisc/openrisc_sim.c
+++ b/hw/openrisc/openrisc_sim.c
@@ -52,8 +52,13 @@ static void main_cpu_reset(void *opaque)
     cpu_set_pc(cs, boot_info.bootstrap_pc);
 }
 
+static qemu_irq get_cpu_irq(OpenRISCCPU *cpus[], int cpunum, int irq_pin)
+{
+    return cpus[cpunum]->env.irq[irq_pin];
+}
+
 static void openrisc_sim_net_init(hwaddr base, hwaddr descriptors,
-                                  int num_cpus, qemu_irq **cpu_irqs,
+                                  int num_cpus, OpenRISCCPU *cpus[],
                                   int irq_pin, NICInfo *nd)
 {
     DeviceState *dev;
@@ -70,18 +75,18 @@ static void openrisc_sim_net_init(hwaddr base, hwaddr descriptors,
         qdev_prop_set_uint32(splitter, "num-lines", num_cpus);
         qdev_realize_and_unref(splitter, NULL, &error_fatal);
         for (i = 0; i < num_cpus; i++) {
-            qdev_connect_gpio_out(splitter, i, cpu_irqs[i][irq_pin]);
+            qdev_connect_gpio_out(splitter, i, get_cpu_irq(cpus, i, irq_pin));
         }
         sysbus_connect_irq(s, 0, qdev_get_gpio_in(splitter, 0));
     } else {
-        sysbus_connect_irq(s, 0, cpu_irqs[0][irq_pin]);
+        sysbus_connect_irq(s, 0, get_cpu_irq(cpus, 0, irq_pin));
     }
     sysbus_mmio_map(s, 0, base);
     sysbus_mmio_map(s, 1, descriptors);
 }
 
 static void openrisc_sim_ompic_init(hwaddr base, int num_cpus,
-                                    qemu_irq **cpu_irqs, int irq_pin)
+                                    OpenRISCCPU *cpus[], int irq_pin)
 {
     DeviceState *dev;
     SysBusDevice *s;
@@ -93,7 +98,7 @@ static void openrisc_sim_ompic_init(hwaddr base, int num_cpus,
     s = SYS_BUS_DEVICE(dev);
     sysbus_realize_and_unref(s, &error_fatal);
     for (i = 0; i < num_cpus; i++) {
-        sysbus_connect_irq(s, i, cpu_irqs[i][irq_pin]);
+        sysbus_connect_irq(s, i, get_cpu_irq(cpus, i, irq_pin));
     }
     sysbus_mmio_map(s, 0, base);
 }
@@ -136,26 +141,24 @@ static void openrisc_sim_init(MachineState *machine)
 {
     ram_addr_t ram_size = machine->ram_size;
     const char *kernel_filename = machine->kernel_filename;
-    OpenRISCCPU *cpu = NULL;
+    OpenRISCCPU *cpus[2] = {};
     MemoryRegion *ram;
-    qemu_irq *cpu_irqs[2];
     qemu_irq serial_irq;
     int n;
     unsigned int smp_cpus = machine->smp.cpus;
 
     assert(smp_cpus >= 1 && smp_cpus <= 2);
     for (n = 0; n < smp_cpus; n++) {
-        cpu = OPENRISC_CPU(cpu_create(machine->cpu_type));
-        if (cpu == NULL) {
+        cpus[n] = OPENRISC_CPU(cpu_create(machine->cpu_type));
+        if (cpus[n] == NULL) {
             fprintf(stderr, "Unable to find CPU definition!\n");
             exit(1);
         }
-        cpu_openrisc_pic_init(cpu);
-        cpu_irqs[n] = (qemu_irq *) cpu->env.irq;
+        cpu_openrisc_pic_init(cpus[n]);
 
-        cpu_openrisc_clock_init(cpu);
+        cpu_openrisc_clock_init(cpus[n]);
 
-        qemu_register_reset(main_cpu_reset, cpu);
+        qemu_register_reset(main_cpu_reset, cpus[n]);
     }
 
     ram = g_malloc(sizeof(*ram));
@@ -164,15 +167,16 @@ static void openrisc_sim_init(MachineState *machine)
 
     if (nd_table[0].used) {
         openrisc_sim_net_init(0x92000000, 0x92000400, smp_cpus,
-                              cpu_irqs, 4, nd_table);
+                              cpus, 4, nd_table);
     }
 
     if (smp_cpus > 1) {
-        openrisc_sim_ompic_init(0x98000000, smp_cpus, cpu_irqs, 1);
+        openrisc_sim_ompic_init(0x98000000, smp_cpus, cpus, 1);
 
-        serial_irq = qemu_irq_split(cpu_irqs[0][2], cpu_irqs[1][2]);
+        serial_irq = qemu_irq_split(get_cpu_irq(cpus, 0, 2),
+                                    get_cpu_irq(cpus, 1, 2));
     } else {
-        serial_irq = cpu_irqs[0][2];
+        serial_irq = get_cpu_irq(cpus, 0, 2);
     }
 
     serial_mm_init(get_system_memory(), 0x90000000, 0, serial_irq,
-- 
2.20.1


