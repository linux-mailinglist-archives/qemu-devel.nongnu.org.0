Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC99576D82
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Jul 2022 13:34:12 +0200 (CEST)
Received: from localhost ([::1]:53074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oCg3n-00050U-Q1
	for lists+qemu-devel@lfdr.de; Sat, 16 Jul 2022 07:34:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ph.makarov@gmail.com>)
 id 1oCg26-0002mK-K0
 for qemu-devel@nongnu.org; Sat, 16 Jul 2022 07:32:27 -0400
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d]:39500)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ph.makarov@gmail.com>)
 id 1oCg23-0006ju-OP
 for qemu-devel@nongnu.org; Sat, 16 Jul 2022 07:32:25 -0400
Received: by mail-lj1-x22d.google.com with SMTP id w17so8287686ljh.6
 for <qemu-devel@nongnu.org>; Sat, 16 Jul 2022 04:32:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=p8kQPXFlBFUzzKVN6r3HjH1XwU9PYiMSwO4WDOqSalM=;
 b=aQkGK4/GQGAgRhvKkS2gmEaLqz1lTgdZJKRB6GxMObDVJpCXE5tSeHoWrlVtj4jZXt
 3Msr9YotISBvc62p2O5lFESX/OPl0MlyKAHwoiyON01m3h/hLs0h/PPU00hfDEmbhiFv
 uM2AdwhacSYR+G/oheQwVtO9wfcrLPpf3m4ICTGC4nmh3t37MplotcPvT/5tsdDRHXM5
 2qBosB57AAYDPhewl7MFL0j0OD32XeAMTEhIW+KYfGmes01r1uru1x3zuh1jX0Ne1brw
 opTX2F5mmq+MG4rJddCDBm3AT6tIfec+4ng5NvlSVXx7kdi4rCqLJElRQXJQAN0kdtrB
 mfSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=p8kQPXFlBFUzzKVN6r3HjH1XwU9PYiMSwO4WDOqSalM=;
 b=l1bNddZ8HpHXmO3kMstVBGNQnWYQxZzCzOW1FSM+zm0O99+JzjBzCnhVAlFMOcPHRN
 Kb4j3o4tRj1cFfMv6hI/XENf2oajZnJ1P/XOqYHGq12LcIe03NyTRqdkKRhDj+ERoLqE
 9OHpz2mR1OKyOZTkeXzvcewK3efCsg24P6EGpqwoixitdTUw37vHHqn0gKB3tiBol6ib
 f2++kc5TCCX574x3HXKmdg6dANmxbUMcVnWbB6nKDA2d8GVYIcs6i68MtX4ec3SGjnUg
 gDun3lAsWrU7Bwfn01cx+TEMxf98txfNIfTsNuxnxPOoMsDxTCDjYFDZQce+yI6cOype
 Hltw==
X-Gm-Message-State: AJIora/QcXFyCjks0JpEgU/VPCZH9Uc8XUEx9+z4GW1RnqXyrBs/Mwea
 phpChAbOrQB07tcLO12a5lxhZ+0Y3DO5PQ==
X-Google-Smtp-Source: AGRyM1vUggJusqmLUzUKN64xYhJK6ubWJMR1Jl4YaMEhm7TNZhWXrDhccnuoFqM99Vu08vaJi+5u1w==
X-Received: by 2002:a05:651c:1142:b0:25d:9f05:66c9 with SMTP id
 h2-20020a05651c114200b0025d9f0566c9mr4829939ljo.224.1657971140853; 
 Sat, 16 Jul 2022 04:32:20 -0700 (PDT)
Received: from localhost.localdomain ([37.204.56.188])
 by smtp.gmail.com with ESMTPSA id
 w20-20020a197b14000000b00489d7fec4f5sm1418878lfc.122.2022.07.16.04.32.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Jul 2022 04:32:20 -0700 (PDT)
From: Andrey Makarov <ph.makarov@gmail.com>
X-Google-Original-From: Andrey Makarov <andrey.makarov@auriga.com>
To: qemu-devel@nongnu.org
Cc: Andrey Makarov <andrey.makarov@auriga.com>
Subject: [PATCH v4] Align Raspberry Pi DMA interrupts with Linux DTS
Date: Sat, 16 Jul 2022 14:32:10 +0300
Message-Id: <20220716113210.349153-1-andrey.makarov@auriga.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22d;
 envelope-from=ph.makarov@gmail.com; helo=mail-lj1-x22d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

There is nothing in the specs on DMA engine interrupt lines: it should have
been in the "BCM2835 ARM Peripherals" datasheet but the appropriate
"ARM peripherals interrupt table" (p.113) is nearly empty.

All Raspberry Pi models 1-3 (based on bcm2835) have
Linux device tree (arch/arm/boot/dts/bcm2835-common.dtsi +25):

    /* dma channel 11-14 share one irq */

This information is repeated in the driver code
(drivers/dma/bcm2835-dma.c +1344):

    /*
     * in case of channel >= 11
     * use the 11th interrupt and that is shared
     */

In this patch channels 0--10 and 11--14 are handled separately.

Signed-off-by: Andrey Makarov <andrey.makarov@auriga.com>

---
In version v4:

- added a license header to bcm2835-dma-test.c

In version v3:

- changed naming of orgate & removed hard-coded constants

In version v2:

1) an OR-gate is added according to review 
2) a simple qtest is added for testing DMA & its interrupts
---

 hw/arm/bcm2835_peripherals.c         |  25 +++++-
 include/hw/arm/bcm2835_peripherals.h |   2 +
 tests/qtest/bcm2835-dma-test.c       | 115 +++++++++++++++++++++++++++
 tests/qtest/meson.build              |   3 +-
 4 files changed, 143 insertions(+), 2 deletions(-)
 create mode 100644 tests/qtest/bcm2835-dma-test.c

diff --git a/hw/arm/bcm2835_peripherals.c b/hw/arm/bcm2835_peripherals.c
index 48538c9360..d17a8d5fbf 100644
--- a/hw/arm/bcm2835_peripherals.c
+++ b/hw/arm/bcm2835_peripherals.c
@@ -23,6 +23,12 @@
 /* Capabilities for SD controller: no DMA, high-speed, default clocks etc. */
 #define BCM2835_SDHC_CAPAREG 0x52134b4
 
+/* According to Linux driver & DTS, dma channels 0--10 have separate IRQ,
+ * while channels 11--14 share one IRQ:
+ */
+#define SEPARATE_DMA_IRQ_MAX 10
+#define ORGATED_DMA_IRQ_COUNT 4
+
 static void create_unimp(BCM2835PeripheralState *ps,
                          UnimplementedDeviceState *uds,
                          const char *name, hwaddr ofs, hwaddr size)
@@ -101,6 +107,11 @@ static void bcm2835_peripherals_init(Object *obj)
     /* DMA Channels */
     object_initialize_child(obj, "dma", &s->dma, TYPE_BCM2835_DMA);
 
+    object_initialize_child(obj, "orgated-dma-irq",
+                            &s->orgated_dma_irq, TYPE_OR_IRQ);
+    object_property_set_int(OBJECT(&s->orgated_dma_irq), "num-lines",
+                            ORGATED_DMA_IRQ_COUNT, &error_abort);
+
     object_property_add_const_link(OBJECT(&s->dma), "dma-mr",
                                    OBJECT(&s->gpu_bus_mr));
 
@@ -322,12 +333,24 @@ static void bcm2835_peripherals_realize(DeviceState *dev, Error **errp)
     memory_region_add_subregion(&s->peri_mr, DMA15_OFFSET,
                 sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->dma), 1));
 
-    for (n = 0; n <= 12; n++) {
+    for (n = 0; n <= SEPARATE_DMA_IRQ_MAX; n++) {
         sysbus_connect_irq(SYS_BUS_DEVICE(&s->dma), n,
                            qdev_get_gpio_in_named(DEVICE(&s->ic),
                                                   BCM2835_IC_GPU_IRQ,
                                                   INTERRUPT_DMA0 + n));
     }
+    if (!qdev_realize(DEVICE(&s->orgated_dma_irq), NULL, errp)) {
+        return;
+    }
+    for (n = 0; n < ORGATED_DMA_IRQ_COUNT; n++) {
+        sysbus_connect_irq(SYS_BUS_DEVICE(&s->dma),
+                           SEPARATE_DMA_IRQ_MAX + 1 + n,
+                           qdev_get_gpio_in(DEVICE(&s->orgated_dma_irq), n));
+    }
+    qdev_connect_gpio_out(DEVICE(&s->orgated_dma_irq), 0,
+                          qdev_get_gpio_in_named(DEVICE(&s->ic),
+                              BCM2835_IC_GPU_IRQ,
+                              INTERRUPT_DMA0 + SEPARATE_DMA_IRQ_MAX + 1));
 
     /* THERMAL */
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->thermal), errp)) {
diff --git a/include/hw/arm/bcm2835_peripherals.h b/include/hw/arm/bcm2835_peripherals.h
index d864879421..c9d25d493e 100644
--- a/include/hw/arm/bcm2835_peripherals.h
+++ b/include/hw/arm/bcm2835_peripherals.h
@@ -17,6 +17,7 @@
 #include "hw/char/bcm2835_aux.h"
 #include "hw/display/bcm2835_fb.h"
 #include "hw/dma/bcm2835_dma.h"
+#include "hw/or-irq.h"
 #include "hw/intc/bcm2835_ic.h"
 #include "hw/misc/bcm2835_property.h"
 #include "hw/misc/bcm2835_rng.h"
@@ -55,6 +56,7 @@ struct BCM2835PeripheralState {
     BCM2835AuxState aux;
     BCM2835FBState fb;
     BCM2835DMAState dma;
+    qemu_or_irq orgated_dma_irq;
     BCM2835ICState ic;
     BCM2835PropertyState property;
     BCM2835RngState rng;
diff --git a/tests/qtest/bcm2835-dma-test.c b/tests/qtest/bcm2835-dma-test.c
new file mode 100644
index 0000000000..eed9d42fcc
--- /dev/null
+++ b/tests/qtest/bcm2835-dma-test.c
@@ -0,0 +1,115 @@
+/*
+ * QTest testcase for BCM283x DMA engine (on Raspberry Pi 3)
+ * and its interrupts coming to Interrupt Controller.
+ *
+ * Copyright (c) 2022 Auriga LLC
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "libqtest-single.h"
+
+/* Offsets in raspi3b platform: */
+#define RASPI3_DMA_BASE 0x3f007000
+#define RASPI3_IC_BASE  0x3f00b200
+
+/* Used register/fields definitions */
+
+/* DMA engine registers: */
+#define BCM2708_DMA_CS         0
+#define BCM2708_DMA_ACTIVE     (1 << 0)
+#define BCM2708_DMA_INT        (1 << 2)
+
+#define BCM2708_DMA_ADDR       0x04
+
+#define BCM2708_DMA_INT_STATUS 0xfe0
+
+/* DMA Trasfer Info fields: */
+#define BCM2708_DMA_INT_EN     (1 << 0)
+#define BCM2708_DMA_D_INC      (1 << 4)
+#define BCM2708_DMA_S_INC      (1 << 8)
+
+/* Interrupt controller registers: */
+#define IRQ_PENDING_BASIC      0x00
+#define IRQ_GPU_PENDING1_AGGR  (1 << 8)
+#define IRQ_PENDING_1          0x04
+#define IRQ_ENABLE_1           0x10
+
+/* Data for the test: */
+#define SCB_ADDR   256
+#define S_ADDR     32
+#define D_ADDR     64
+#define TXFR_LEN   32
+const uint32_t check_data = 0x12345678;
+
+static void bcm2835_dma_test_interrupt(int dma_c, int irq_line) {
+    uint64_t dma_base = RASPI3_DMA_BASE + dma_c * 0x100;
+    int gpu_irq_line = 16 + irq_line;
+
+    /* Check that interrupts are silent by default: */
+    writel(RASPI3_IC_BASE + IRQ_ENABLE_1, 1 << gpu_irq_line);
+    int isr = readl(dma_base + BCM2708_DMA_INT_STATUS);
+    g_assert_cmpint(isr, ==, 0);
+    uint32_t reg0 = readl(dma_base + BCM2708_DMA_CS);
+    g_assert_cmpint(reg0, ==, 0);
+    uint32_t ic_pending = readl(RASPI3_IC_BASE + IRQ_PENDING_BASIC);
+    g_assert_cmpint(ic_pending, ==, 0);
+    uint32_t gpu_pending1 = readl(RASPI3_IC_BASE + IRQ_PENDING_1);
+    g_assert_cmpint(gpu_pending1, ==, 0);
+
+    /* Prepare Control Block: */
+    writel(SCB_ADDR + 0, BCM2708_DMA_S_INC | BCM2708_DMA_D_INC |
+                         BCM2708_DMA_INT_EN); /* transfer info */
+    writel(SCB_ADDR + 4, S_ADDR);             /* source address */
+    writel(SCB_ADDR + 8, D_ADDR);             /* destination address */
+    writel(SCB_ADDR + 12, TXFR_LEN);          /* transfer length */
+    writel(dma_base + BCM2708_DMA_ADDR, SCB_ADDR);
+
+    writel(S_ADDR, check_data);
+    for (int word = S_ADDR + 4; word < S_ADDR + TXFR_LEN; word += 4)
+        writel(word, ~check_data);
+    /* Perform the transfer: */
+    writel(dma_base + BCM2708_DMA_CS, BCM2708_DMA_ACTIVE);
+
+    /* Check that destination == source: */
+    uint32_t data = readl(D_ADDR);
+    g_assert_cmpint(data, ==, check_data);
+    for (int word = D_ADDR + 4; word < D_ADDR + TXFR_LEN; word += 4) {
+        data = readl(word);
+        g_assert_cmpint(data, ==, ~check_data);
+    }
+
+    /* Check that interrupt status is set both in DMA and IC controllers: */
+    isr = readl(RASPI3_DMA_BASE + BCM2708_DMA_INT_STATUS);
+    g_assert_cmpint(isr, ==, 1 << dma_c);
+
+    ic_pending = readl(RASPI3_IC_BASE + IRQ_PENDING_BASIC);
+    g_assert_cmpint(ic_pending, ==, IRQ_GPU_PENDING1_AGGR);
+
+    gpu_pending1 = readl(RASPI3_IC_BASE + IRQ_PENDING_1);
+    g_assert_cmpint(gpu_pending1, ==, 1 << gpu_irq_line);
+
+    /* Clean up, clear interrupt: */
+    writel(dma_base + BCM2708_DMA_CS, BCM2708_DMA_INT);
+}
+
+static void bcm2835_dma_test_interrupts(void) {
+    /* DMA engines 0--10 have separate IRQ lines, 11--14 - only one: */
+    bcm2835_dma_test_interrupt(0,  0);
+    bcm2835_dma_test_interrupt(10, 10);
+    bcm2835_dma_test_interrupt(11, 11);
+    bcm2835_dma_test_interrupt(14, 11);
+}
+
+int main(int argc, char **argv)
+{
+    int ret;
+    g_test_init(&argc, &argv, NULL);
+    qtest_add_func("/bcm2835/dma/test_interrupts",
+                   bcm2835_dma_test_interrupts);
+    qtest_start("-machine raspi3b");
+    ret = g_test_run();
+    qtest_end();
+    return ret;
+}
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 31287a9173..3a474010e4 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -218,7 +218,8 @@ qtests_aarch64 = \
   ['arm-cpu-features',
    'numa-test',
    'boot-serial-test',
-   'migration-test']
+   'migration-test',
+   'bcm2835-dma-test']
 
 qtests_s390x = \
   (slirp.found() ? ['pxe-test', 'test-netfilter'] : []) +                 \
-- 
2.30.2


