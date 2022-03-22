Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E37714E370D
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 03:59:35 +0100 (CET)
Received: from localhost ([::1]:54546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWUkB-0005xu-0s
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 22:59:35 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1nWUdt-0002zS-C4; Mon, 21 Mar 2022 22:53:05 -0400
Received: from twspam01.aspeedtech.com ([211.20.114.71]:22006)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1nWUdp-0001v0-6C; Mon, 21 Mar 2022 22:53:04 -0400
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 22M2fWGF078443;
 Tue, 22 Mar 2022 10:41:32 +0800 (GMT-8)
 (envelope-from jamin_lin@aspeedtech.com)
Received: from localhost.localdomain (192.168.70.87) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 22 Mar
 2022 10:52:00 +0800
From: Jamin Lin <jamin_lin@aspeedtech.com>
To: Alistair Francis <alistair@alistair23.me>, Peter Maydell
 <peter.maydell@linaro.org>, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?=
 <clg@kaod.org>, Andrew Jeffery <andrew@aj.id.au>, Joel Stanley
 <joel@jms.id.au>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>, "Wainer dos
 Santos Moschetta" <wainersm@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 "open list:STM32F205" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Subject: [PATCH v1 7/9] aspeed/soc : Add AST1030 support
Date: Tue, 22 Mar 2022 10:51:52 +0800
Message-ID: <20220322025154.3989-8-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220322025154.3989-1-jamin_lin@aspeedtech.com>
References: <20220322025154.3989-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [192.168.70.87]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 22M2fWGF078443
Received-SPF: pass client-ip=211.20.114.71;
 envelope-from=jamin_lin@aspeedtech.com; helo=twspam01.aspeedtech.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: jamin_lin@aspeedtech.com, troy_lee@aspeedtech.com,
 steven_lee@aspeedtech.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Steven Lee <steven_lee@aspeedtech.com>

The embeded core of AST1030 SoC is ARM Coretex M4.
It is hard to be integrated in the common Aspeed Soc framework.
We introduce a new ast1030 class with instance_init and realize
handlers.

Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
---
 hw/arm/aspeed_ast1030.c     | 301 ++++++++++++++++++++++++++++++++++++
 hw/arm/meson.build          |   7 +-
 include/hw/arm/aspeed_soc.h |   3 +
 3 files changed, 310 insertions(+), 1 deletion(-)
 create mode 100644 hw/arm/aspeed_ast1030.c

diff --git a/hw/arm/aspeed_ast1030.c b/hw/arm/aspeed_ast1030.c
new file mode 100644
index 0000000000..fe700d922f
--- /dev/null
+++ b/hw/arm/aspeed_ast1030.c
@@ -0,0 +1,301 @@
+/*
+ * ASPEED AST1030 SoC
+ *
+ * Copyright (C) 2022 ASPEED Technology Inc.
+ *
+ * This code is licensed under the GPL version 2 or later.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "exec/address-spaces.h"
+#include "sysemu/sysemu.h"
+#include "hw/qdev-clock.h"
+#include "hw/misc/unimp.h"
+#include "hw/char/serial.h"
+
+#include "hw/arm/aspeed_soc.h"
+
+#define ASPEED_SOC_IOMEM_SIZE 0x00200000
+
+static const hwaddr aspeed_soc_ast1030_memmap[] = {
+    [ASPEED_DEV_SRAM]      = 0x00000000,
+    [ASPEED_DEV_SBC]       = 0x79000000,
+    [ASPEED_DEV_IOMEM]     = 0x7E600000,
+    [ASPEED_DEV_PWM]       = 0x7E610000,
+    [ASPEED_DEV_FMC]       = 0x7E620000,
+    [ASPEED_DEV_SPI1]      = 0x7E630000,
+    [ASPEED_DEV_SPI2]      = 0x7E640000,
+    [ASPEED_DEV_SCU]       = 0x7E6E2000,
+    [ASPEED_DEV_ADC]       = 0x7E6E9000,
+    [ASPEED_DEV_SBC]       = 0x7E6F2000,
+    [ASPEED_DEV_GPIO]      = 0x7E780000,
+    [ASPEED_DEV_TIMER1]    = 0x7E782000,
+    [ASPEED_DEV_UART5]     = 0x7E784000,
+    [ASPEED_DEV_WDT]       = 0x7E785000,
+    [ASPEED_DEV_LPC]       = 0x7E789000,
+    [ASPEED_DEV_I2C]       = 0x7E7B0000,
+};
+
+static const int aspeed_soc_ast1030_irqmap[] = {
+    [ASPEED_DEV_UART5]     = 8,
+    [ASPEED_DEV_GPIO]      = 11,
+    [ASPEED_DEV_TIMER1]    = 16,
+    [ASPEED_DEV_TIMER2]    = 17,
+    [ASPEED_DEV_TIMER3]    = 18,
+    [ASPEED_DEV_TIMER4]    = 19,
+    [ASPEED_DEV_TIMER5]    = 20,
+    [ASPEED_DEV_TIMER6]    = 21,
+    [ASPEED_DEV_TIMER7]    = 22,
+    [ASPEED_DEV_TIMER8]    = 23,
+    [ASPEED_DEV_WDT]       = 24,
+    [ASPEED_DEV_LPC]       = 35,
+    [ASPEED_DEV_FMC]       = 39,
+    [ASPEED_DEV_PWM]       = 44,
+    [ASPEED_DEV_ADC]       = 46,
+    [ASPEED_DEV_SPI1]      = 65,
+    [ASPEED_DEV_SPI2]      = 66,
+    [ASPEED_DEV_I2C]       = 110, /* 110 ~ 123 */
+    [ASPEED_DEV_KCS]       = 138, /* 138 -> 142 */
+};
+
+static qemu_irq aspeed_soc_get_irq(AspeedSoCState *s, int ctrl)
+{
+    AspeedSoCClass *sc = ASPEED_SOC_GET_CLASS(s);
+
+    return qdev_get_gpio_in(DEVICE(&s->armv7m), sc->irqmap[ctrl]);
+}
+
+
+static void aspeed_soc_ast1030_init(Object *obj)
+{
+    AspeedSoCState *s = ASPEED_SOC(obj);
+    AspeedSoCClass *sc = ASPEED_SOC_GET_CLASS(s);
+    char socname[8];
+    char typename[64];
+    int i;
+
+    if (sscanf(sc->name, "%7s", socname) != 1) {
+        g_assert_not_reached();
+    }
+
+    object_initialize_child(obj, "armv7m", &s->armv7m, TYPE_ARMV7M);
+
+    s->sysclk = qdev_init_clock_in(DEVICE(s), "sysclk", NULL, NULL, 0);
+
+
+    snprintf(typename, sizeof(typename), "aspeed.scu-%s", socname);
+    object_initialize_child(obj, "scu", &s->scu, typename);
+    qdev_prop_set_uint32(DEVICE(&s->scu), "silicon-rev", sc->silicon_rev);
+
+    object_property_add_alias(obj, "hw-strap1", OBJECT(&s->scu), "hw-strap1");
+    object_property_add_alias(obj, "hw-strap2", OBJECT(&s->scu), "hw-strap2");
+
+    snprintf(typename, sizeof(typename), "aspeed.timer-%s", socname);
+    object_initialize_child(obj, "timerctrl", &s->timerctrl, typename);
+
+    snprintf(typename, sizeof(typename), "aspeed.adc-%s", socname);
+    object_initialize_child(obj, "adc", &s->adc, typename);
+
+    snprintf(typename, sizeof(typename), "aspeed.fmc-%s", socname);
+    object_initialize_child(obj, "fmc", &s->fmc, typename);
+
+    for (i = 0; i < sc->spis_num; i++) {
+        snprintf(typename, sizeof(typename), "aspeed.spi%d-%s", i + 1, socname);
+        object_initialize_child(obj, "spi[*]", &s->spi[i], typename);
+    }
+
+    object_initialize_child(obj, "lpc", &s->lpc, TYPE_ASPEED_LPC);
+
+    object_initialize_child(obj, "sbc", &s->sbc, TYPE_ASPEED_SBC);
+
+    for (i = 0; i < sc->wdts_num; i++) {
+        snprintf(typename, sizeof(typename), "aspeed.wdt-%s", socname);
+        object_initialize_child(obj, "wdt[*]", &s->wdt[i], typename);
+    }
+}
+
+static void aspeed_soc_ast1030_realize(DeviceState *dev_soc, Error **errp)
+{
+    AspeedSoCState *s = ASPEED_SOC(dev_soc);
+    AspeedSoCClass *sc = ASPEED_SOC_GET_CLASS(s);
+    MemoryRegion *system_memory = get_system_memory();
+    DeviceState *armv7m;
+    Error *err = NULL;
+    int i;
+
+    if (!clock_has_source(s->sysclk)) {
+        error_setg(errp, "sysclk clock must be wired up by the board code");
+        return;
+    }
+
+    /* General I/O memory space to catch all unimplemented device */
+    create_unimplemented_device("aspeed.sbc",
+                                sc->memmap[ASPEED_DEV_SBC],
+                                0x40000);
+    create_unimplemented_device("aspeed.io",
+                                sc->memmap[ASPEED_DEV_IOMEM],
+                                ASPEED_SOC_IOMEM_SIZE);
+
+    /* AST1030 CPU Core */
+    armv7m = DEVICE(&s->armv7m);
+    qdev_prop_set_uint32(armv7m, "num-irq", 256);
+    qdev_prop_set_string(armv7m, "cpu-type", sc->cpu_type);
+    qdev_connect_clock_in(armv7m, "cpuclk", s->sysclk);
+    object_property_set_link(OBJECT(&s->armv7m), "memory",
+                             OBJECT(system_memory), &error_abort);
+    sysbus_realize(SYS_BUS_DEVICE(&s->armv7m), &error_abort);
+
+    /* Internal SRAM */
+    memory_region_init_ram(&s->sram, NULL, "aspeed.sram", sc->sram_size, &err);
+    if (err != NULL) {
+        error_propagate(errp, err);
+        return;
+    }
+    memory_region_add_subregion(system_memory,
+                                sc->memmap[ASPEED_DEV_SRAM],
+                                &s->sram);
+
+    /* SCU */
+    if (!sysbus_realize(SYS_BUS_DEVICE(&s->scu), errp)) {
+        return;
+    }
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->scu), 0, sc->memmap[ASPEED_DEV_SCU]);
+
+    /* LPC */
+    if (!sysbus_realize(SYS_BUS_DEVICE(&s->lpc), errp)) {
+        return;
+    }
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->lpc), 0, sc->memmap[ASPEED_DEV_LPC]);
+
+    /* Connect the LPC IRQ to the GIC. It is otherwise unused. */
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->lpc), 0,
+                       aspeed_soc_get_irq(s, ASPEED_DEV_LPC));
+
+    /*
+     * On the AST1030 LPC subdevice IRQs are connected straight to the GIC.
+     */
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->lpc), 1 + aspeed_lpc_kcs_1,
+                       qdev_get_gpio_in(DEVICE(&s->armv7m),
+                                sc->irqmap[ASPEED_DEV_KCS] + aspeed_lpc_kcs_1));
+
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->lpc), 1 + aspeed_lpc_kcs_2,
+                       qdev_get_gpio_in(DEVICE(&s->armv7m),
+                                sc->irqmap[ASPEED_DEV_KCS] + aspeed_lpc_kcs_2));
+
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->lpc), 1 + aspeed_lpc_kcs_3,
+                       qdev_get_gpio_in(DEVICE(&s->armv7m),
+                                sc->irqmap[ASPEED_DEV_KCS] + aspeed_lpc_kcs_3));
+
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->lpc), 1 + aspeed_lpc_kcs_4,
+                       qdev_get_gpio_in(DEVICE(&s->armv7m),
+                                sc->irqmap[ASPEED_DEV_KCS] + aspeed_lpc_kcs_4));
+
+    /* UART5 - attach an 8250 to the IO space as our UART */
+    serial_mm_init(get_system_memory(), sc->memmap[ASPEED_DEV_UART5], 2,
+                   aspeed_soc_get_irq(s, ASPEED_DEV_UART5),
+                   38400, serial_hd(0), DEVICE_LITTLE_ENDIAN);
+
+    /* Timer */
+    object_property_set_link(OBJECT(&s->timerctrl), "scu", OBJECT(&s->scu),
+                             &error_abort);
+    if (!sysbus_realize(SYS_BUS_DEVICE(&s->timerctrl), errp)) {
+        return;
+    }
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->timerctrl), 0,
+                    sc->memmap[ASPEED_DEV_TIMER1]);
+    for (i = 0; i < ASPEED_TIMER_NR_TIMERS; i++) {
+        qemu_irq irq = aspeed_soc_get_irq(s, ASPEED_DEV_TIMER1 + i);
+        sysbus_connect_irq(SYS_BUS_DEVICE(&s->timerctrl), i, irq);
+    }
+
+    /* ADC */
+    if (!sysbus_realize(SYS_BUS_DEVICE(&s->adc), errp)) {
+        return;
+    }
+
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->adc), 0, sc->memmap[ASPEED_DEV_ADC]);
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->adc), 0,
+                       aspeed_soc_get_irq(s, ASPEED_DEV_ADC));
+
+    /* FMC, The number of CS is set at the board level */
+    object_property_set_link(OBJECT(&s->fmc), "dram", OBJECT(&s->sram),
+            &error_abort);
+    if (!sysbus_realize(SYS_BUS_DEVICE(&s->fmc), errp)) {
+        return;
+    }
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->fmc), 0, sc->memmap[ASPEED_DEV_FMC]);
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->fmc), 1,
+                    ASPEED_SMC_GET_CLASS(&s->fmc)->flash_window_base);
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->fmc), 0,
+                       aspeed_soc_get_irq(s, ASPEED_DEV_FMC));
+
+    /* SPI */
+    for (i = 0; i < sc->spis_num; i++) {
+        object_property_set_link(OBJECT(&s->spi[i]), "dram",
+                                 OBJECT(&s->sram), &error_abort);
+        if (!sysbus_realize(SYS_BUS_DEVICE(&s->spi[i]), errp)) {
+            return;
+        }
+        sysbus_mmio_map(SYS_BUS_DEVICE(&s->spi[i]), 0,
+                        sc->memmap[ASPEED_DEV_SPI1 + i]);
+        sysbus_mmio_map(SYS_BUS_DEVICE(&s->spi[i]), 1,
+                        ASPEED_SMC_GET_CLASS(&s->spi[i])->flash_window_base);
+    }
+
+    /* Secure Boot Controller */
+    if (!sysbus_realize(SYS_BUS_DEVICE(&s->sbc), errp)) {
+        return;
+    }
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->sbc), 0, sc->memmap[ASPEED_DEV_SBC]);
+
+    /* Watch dog */
+    for (i = 0; i < sc->wdts_num; i++) {
+        AspeedWDTClass *awc = ASPEED_WDT_GET_CLASS(&s->wdt[i]);
+
+        object_property_set_link(OBJECT(&s->wdt[i]), "scu", OBJECT(&s->scu),
+                                 &error_abort);
+        if (!sysbus_realize(SYS_BUS_DEVICE(&s->wdt[i]), errp)) {
+            return;
+        }
+        sysbus_mmio_map(SYS_BUS_DEVICE(&s->wdt[i]), 0,
+                        sc->memmap[ASPEED_DEV_WDT] + i * awc->offset);
+    }
+}
+
+static void aspeed_soc_ast1030_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    AspeedSoCClass *sc = ASPEED_SOC_CLASS(dc);
+
+    dc->realize = aspeed_soc_ast1030_realize;
+
+    sc->name = "ast1030-a1";
+    sc->cpu_type = ARM_CPU_TYPE_NAME("cortex-m4");
+    sc->silicon_rev = AST1030_A1_SILICON_REV;
+    sc->sram_size = 0xc0000;
+    sc->spis_num = 2;
+    sc->ehcis_num = 0;
+    sc->wdts_num = 4;
+    sc->macs_num = 1;
+    sc->irqmap = aspeed_soc_ast1030_irqmap;
+    sc->memmap = aspeed_soc_ast1030_memmap;
+    sc->num_cpus = 1;
+}
+
+static const TypeInfo aspeed_soc_ast1030_type_info = {
+    .name          = "ast1030-a1",
+    .parent        = TYPE_ASPEED_SOC,
+    .instance_size = sizeof(AspeedSoCState),
+    .instance_init = aspeed_soc_ast1030_init,
+    .class_init    = aspeed_soc_ast1030_class_init,
+    .class_size    = sizeof(AspeedSoCClass),
+};
+
+static void aspeed_soc_register_types(void)
+{
+    type_register_static(&aspeed_soc_ast1030_type_info);
+};
+
+type_init(aspeed_soc_register_types)
diff --git a/hw/arm/meson.build b/hw/arm/meson.build
index 721a8eb8be..362868c1a0 100644
--- a/hw/arm/meson.build
+++ b/hw/arm/meson.build
@@ -48,7 +48,12 @@ arm_ss.add(when: 'CONFIG_XLNX_VERSAL', if_true: files('xlnx-versal.c', 'xlnx-ver
 arm_ss.add(when: 'CONFIG_FSL_IMX25', if_true: files('fsl-imx25.c', 'imx25_pdk.c'))
 arm_ss.add(when: 'CONFIG_FSL_IMX31', if_true: files('fsl-imx31.c', 'kzm.c'))
 arm_ss.add(when: 'CONFIG_FSL_IMX6', if_true: files('fsl-imx6.c'))
-arm_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files('aspeed_soc.c', 'aspeed.c', 'aspeed_ast2600.c'))
+arm_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files(
+  'aspeed_soc.c',
+  'aspeed.c',
+  'aspeed_ast2600.c',
+  'aspeed_ast1030.c'
+))
 arm_ss.add(when: 'CONFIG_MPS2', if_true: files('mps2.c'))
 arm_ss.add(when: 'CONFIG_MPS2', if_true: files('mps2-tz.c'))
 arm_ss.add(when: 'CONFIG_MSF2', if_true: files('msf2-soc.c'))
diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
index da043dcb45..645d2dc83b 100644
--- a/include/hw/arm/aspeed_soc.h
+++ b/include/hw/arm/aspeed_soc.h
@@ -13,6 +13,7 @@
 #define ASPEED_SOC_H
 
 #include "hw/cpu/a15mpcore.h"
+#include "hw/arm/armv7m.h"
 #include "hw/intc/aspeed_vic.h"
 #include "hw/misc/aspeed_scu.h"
 #include "hw/adc/aspeed_adc.h"
@@ -47,6 +48,7 @@ struct AspeedSoCState {
     /*< public >*/
     ARMCPU cpu[ASPEED_CPUS_NUM];
     A15MPPrivState     a7mpcore;
+    ARMv7MState        armv7m;
     MemoryRegion *dram_mr;
     MemoryRegion sram;
     AspeedVICState vic;
@@ -72,6 +74,7 @@ struct AspeedSoCState {
     AspeedSDHCIState emmc;
     AspeedLPCState lpc;
     uint32_t uart_default;
+    Clock *sysclk;
 };
 
 #define TYPE_ASPEED_SOC "aspeed-soc"
-- 
2.17.1


