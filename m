Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12BD553F2C2
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 01:48:58 +0200 (CEST)
Received: from localhost ([::1]:34152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyMSv-0004Ky-6w
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 19:48:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyLwW-0001lb-1v
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 19:15:32 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:34812)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyLwU-00042w-7n
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 19:15:27 -0400
Received: by mail-pf1-x435.google.com with SMTP id c196so13949697pfb.1
 for <qemu-devel@nongnu.org>; Mon, 06 Jun 2022 16:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gmzoDobHUlo4eBCpJn9QL/bMJx0ITvLegs/aBds/jhw=;
 b=kFeNjrP22iqKS3WA0IQOfCZ4xh31WvZwCM3/RypA49M3x54vuah1mMbXOAObM+G+To
 hPT+hzrM1XQdD8Zx96eKcg2M01A7WRQSMHTVXWQEiTK8hio6BlwpK7BuvE2nVcdI55aW
 ++4eElKic8RLmqmgKjfJJsFu+LwIGpFiy4RB2FxXUXS53BIicvUa9R0OortBlFWK8hF9
 XkgO9E3oLKmLaaygjkxOBxUnMQ1YYUaR/4IJwgp0EerLiI04yoIx1HWw1DVgub2X2KCw
 UEjJN0dEnE4PnEEpGc2NXh1SI79MUfDas9ssdnzY5Tbo1fhTsuhzuwQ5hNjMnwaMAvre
 vg7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gmzoDobHUlo4eBCpJn9QL/bMJx0ITvLegs/aBds/jhw=;
 b=VesD1PFg2iUQS1z9oSLmcSbGE8K5Bh4qBtqUGKZGF+IM7XKvu9OKJQNgt+oIzBsXJn
 fUaadQXSR1OZuqvqxIU8jgCX6DkkVvTr/B/DCaWlMkcR7oEIBt7cF8P9fg48qTTEyPCi
 cyziGLTQgERbReZqmthNtK6C374NQyr+nY9TWj4RFwN+h3tfJb6B/7cgiEhjgrc1TUZp
 8FOaC0/RoQ7dUupUe64up5VXkxVb7OJRTrh/NmWCqrzpS4mIqmiqFYi8XHSGvb1/GN5a
 DiGhHR4RM2EX7K72QGPNdyVKlNeRruG2fmcyO5lYHbrugFjj7IQiNiXuEYN4ulqFv00Z
 n7NA==
X-Gm-Message-State: AOAM530LgEvdoh27fifi0UHUkS1T34/6Ze+dbbmd52ECxav4JaCty3qO
 iZi9fd0Phx/lABwpTr3e2ZEqcvM+Vz4O9w==
X-Google-Smtp-Source: ABdhPJwCfdPB3/imbQQeigAJXjb2lcQ1Q19g9UWk+dgD8CgUC7ed7E4jv8tftOD0q/ZbqiqgAvskKw==
X-Received: by 2002:a63:4418:0:b0:3fd:af26:a795 with SMTP id
 r24-20020a634418000000b003fdaf26a795mr7372058pga.331.1654557324862; 
 Mon, 06 Jun 2022 16:15:24 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:dd1c:9738:3e40:ffe0])
 by smtp.gmail.com with ESMTPSA id
 2-20020a170902c24200b00162523fdb8fsm10954623plg.252.2022.06.06.16.15.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 16:15:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =gaosong@loongson.cn, yangxiaojuan@loongson.cn,
 Song Gao <gaosong@loongson.cn>
Subject: [PULL 35/43] hw/loongarch: Add irq hierarchy for the system
Date: Mon,  6 Jun 2022 16:14:42 -0700
Message-Id: <20220606231450.448443-36-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220606231450.448443-1-richard.henderson@linaro.org>
References: <20220606231450.448443-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Xiaojuan Yang <yangxiaojuan@loongson.cn>

This patch add the irq hierarchy for the virt board.

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Signed-off-by: Song Gao <gaosong@loongson.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220606124333.2060567-36-yangxiaojuan@loongson.cn>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/loongarch/loongson3.c | 104 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 104 insertions(+)

diff --git a/hw/loongarch/loongson3.c b/hw/loongarch/loongson3.c
index 7df32f777e..7a5c61e2df 100644
--- a/hw/loongarch/loongson3.c
+++ b/hw/loongarch/loongson3.c
@@ -16,8 +16,110 @@
 #include "sysemu/rtc.h"
 #include "hw/loongarch/virt.h"
 #include "exec/address-spaces.h"
+#include "hw/intc/loongarch_ipi.h"
+#include "hw/intc/loongarch_extioi.h"
+#include "hw/intc/loongarch_pch_pic.h"
+#include "hw/intc/loongarch_pch_msi.h"
+#include "hw/pci-host/ls7a.h"
+
 #include "target/loongarch/cpu.h"
 
+static void loongarch_irq_init(LoongArchMachineState *lams)
+{
+    MachineState *ms = MACHINE(lams);
+    DeviceState *pch_pic, *pch_msi, *cpudev;
+    DeviceState *ipi, *extioi;
+    SysBusDevice *d;
+    LoongArchCPU *lacpu;
+    CPULoongArchState *env;
+    CPUState *cpu_state;
+    int cpu, pin, i;
+
+    ipi = qdev_new(TYPE_LOONGARCH_IPI);
+    sysbus_realize_and_unref(SYS_BUS_DEVICE(ipi), &error_fatal);
+
+    extioi = qdev_new(TYPE_LOONGARCH_EXTIOI);
+    sysbus_realize_and_unref(SYS_BUS_DEVICE(extioi), &error_fatal);
+
+    /*
+     * The connection of interrupts:
+     *   +-----+    +---------+     +-------+
+     *   | IPI |--> | CPUINTC | <-- | Timer |
+     *   +-----+    +---------+     +-------+
+     *                  ^
+     *                  |
+     *            +---------+
+     *            | EIOINTC |
+     *            +---------+
+     *             ^       ^
+     *             |       |
+     *      +---------+ +---------+
+     *      | PCH-PIC | | PCH-MSI |
+     *      +---------+ +---------+
+     *        ^      ^          ^
+     *        |      |          |
+     * +--------+ +---------+ +---------+
+     * | UARTs  | | Devices | | Devices |
+     * +--------+ +---------+ +---------+
+     */
+    for (cpu = 0; cpu < ms->smp.cpus; cpu++) {
+        cpu_state = qemu_get_cpu(cpu);
+        cpudev = DEVICE(cpu_state);
+        lacpu = LOONGARCH_CPU(cpu_state);
+        env = &(lacpu->env);
+
+        /* connect ipi irq to cpu irq */
+        qdev_connect_gpio_out(ipi, cpu, qdev_get_gpio_in(cpudev, IRQ_IPI));
+        /* IPI iocsr memory region */
+        memory_region_add_subregion(&env->system_iocsr, SMP_IPI_MAILBOX,
+                                    sysbus_mmio_get_region(SYS_BUS_DEVICE(ipi),
+                                    cpu));
+        /* extioi iocsr memory region */
+        memory_region_add_subregion(&env->system_iocsr, APIC_BASE,
+                                sysbus_mmio_get_region(SYS_BUS_DEVICE(extioi),
+                                cpu));
+    }
+
+    /*
+     * connect ext irq to the cpu irq
+     * cpu_pin[9:2] <= intc_pin[7:0]
+     */
+    for (cpu = 0; cpu < ms->smp.cpus; cpu++) {
+        cpudev = DEVICE(qemu_get_cpu(cpu));
+        for (pin = 0; pin < LS3A_INTC_IP; pin++) {
+            qdev_connect_gpio_out(extioi, (cpu * 8 + pin),
+                                  qdev_get_gpio_in(cpudev, pin + 2));
+        }
+    }
+
+    pch_pic = qdev_new(TYPE_LOONGARCH_PCH_PIC);
+    d = SYS_BUS_DEVICE(pch_pic);
+    sysbus_realize_and_unref(d, &error_fatal);
+    memory_region_add_subregion(get_system_memory(), LS7A_IOAPIC_REG_BASE,
+                            sysbus_mmio_get_region(d, 0));
+    memory_region_add_subregion(get_system_memory(),
+                            LS7A_IOAPIC_REG_BASE + PCH_PIC_ROUTE_ENTRY_OFFSET,
+                            sysbus_mmio_get_region(d, 1));
+    memory_region_add_subregion(get_system_memory(),
+                            LS7A_IOAPIC_REG_BASE + PCH_PIC_INT_STATUS_LO,
+                            sysbus_mmio_get_region(d, 2));
+
+    /* Connect 64 pch_pic irqs to extioi */
+    for (int i = 0; i < PCH_PIC_IRQ_NUM; i++) {
+        qdev_connect_gpio_out(DEVICE(d), i, qdev_get_gpio_in(extioi, i));
+    }
+
+    pch_msi = qdev_new(TYPE_LOONGARCH_PCH_MSI);
+    d = SYS_BUS_DEVICE(pch_msi);
+    sysbus_realize_and_unref(d, &error_fatal);
+    sysbus_mmio_map(d, 0, LS7A_PCH_MSI_ADDR_LOW);
+    for (i = 0; i < PCH_MSI_IRQ_NUM; i++) {
+        /* Connect 192 pch_msi irqs to extioi */
+        qdev_connect_gpio_out(DEVICE(d), i,
+                              qdev_get_gpio_in(extioi, i + PCH_MSI_IRQ_START));
+    }
+}
+
 static void loongarch_init(MachineState *machine)
 {
     const char *cpu_model = machine->cpu_type;
@@ -63,6 +165,8 @@ static void loongarch_init(MachineState *machine)
                              get_system_io(), 0, LOONGARCH_ISA_IO_SIZE);
     memory_region_add_subregion(address_space_mem, LOONGARCH_ISA_IO_BASE,
                                 &lams->isa_io);
+    /* Initialize the IO interrupt subsystem */
+    loongarch_irq_init(lams);
 }
 
 static void loongarch_class_init(ObjectClass *oc, void *data)
-- 
2.34.1


