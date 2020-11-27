Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD5C92C6D66
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 23:54:30 +0100 (CET)
Received: from localhost ([::1]:41074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kimdJ-0003wx-RI
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 17:54:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kimaZ-0001hz-Un
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 17:51:41 -0500
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:37359)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kimaX-00058e-Fp
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 17:51:39 -0500
Received: by mail-wm1-x342.google.com with SMTP id h21so7759970wmb.2
 for <qemu-devel@nongnu.org>; Fri, 27 Nov 2020 14:51:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sc7E18icOEP5e/KQwDEzq3DU5Jee3GKyEtql9RrB7e4=;
 b=Y54RFyboULFCwummQq0MDmC7bUGgh6aURKXJjnLdvswVaFQTvHtUn3pf2jz3JZKsu4
 BAsfyQzySdrHFbh9Xs31r7luP66OhZ4G3ef3dm9bU1jPU6zb/7YaaogMtLF08ll92SkZ
 HLQSa6bQ7yjSZjNf4953e/cuGbuUhkC6PuBNpfQagZYXQxraPOpCdXQ4NgJ2lcmIM2jt
 TV0Zxuip1BUfo7YBzx7EXoVbe843xVnqUTQBWyefYJcXV5U5Ts1R9pRSQBFTusb7Wbqx
 9MjjLVTMmHUvVS133F2zBIGUYAuxjAVMdmCP96mfKs5/8RqL5wQ27wzsZ+P0yjkb4+YW
 6VHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sc7E18icOEP5e/KQwDEzq3DU5Jee3GKyEtql9RrB7e4=;
 b=qhPIVvfzemf9RpkXLRZi9SyIp+Jm+5wS8F7mHCllWh8lVkIPi1i05XiRSSz2zk9Udb
 mepaRm87ggwd4IuDd2+R081ec2qh/jOmdH/tmJXeaHXVkQFtrXnB/fwKE+bXav0yOPg/
 U8Yl3Sqfck4KPHgsDi3nBmseCIjlRQfFYICItRm8b3pqdtuzxRS2EEPLcPqMSmxNm/+4
 piFAob6VzRTy38HEtAZ14EFgqSf+hB23Cz1Pq4tjJFcZQU2NiAdh3Bz7R5dAgvFETS0E
 KFeWnP6djFsxoDd2usSKZwfJTuEkCgvUJWNY0Yryo+/pMEPTmgVFK9K33C9gWFdH/iGJ
 uzUQ==
X-Gm-Message-State: AOAM532D2nG0zzddn5KeGzTzyzZWy9cchLAQ8QQph02nPQIX6oVL1FL+
 vV+q/zCuL4+p7zjDT5++2dmAnSo5aFiuUg==
X-Google-Smtp-Source: ABdhPJzCArvJ2Du+V4PpQH3SEZhmy49qesCtwYlvzJ4OMhx/uIKOZFDcqD54K5baUCyeB/zSpne4mQ==
X-Received: by 2002:a1c:491:: with SMTP id 139mr11233781wme.81.1606517491946; 
 Fri, 27 Nov 2020 14:51:31 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q16sm17429756wrn.13.2020.11.27.14.51.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Nov 2020 14:51:31 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/3] hw/openrisc/openrisc_sim: Abstract out "get IRQ x of CPU
 y"
Date: Fri, 27 Nov 2020 22:51:26 +0000
Message-Id: <20201127225127.14770-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201127225127.14770-1-peter.maydell@linaro.org>
References: <20201127225127.14770-1-peter.maydell@linaro.org>
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
Cc: Stafford Horne <shorne@gmail.com>, Jia Liu <proljc@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We're about to refactor the OpenRISC pic_cpu code in a way that means
that just grabbing the whole qemu_irq[] array of inbound IRQs for a
CPU won't be possible any more.  Abstract out a function for "return
the qemu_irq for IRQ x input of CPU y" so we can more easily replace
the implementation.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
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


