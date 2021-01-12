Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D60F2F36FD
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 18:24:38 +0100 (CET)
Received: from localhost ([::1]:37776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzNPJ-00055n-D0
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 12:24:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kzMzr-0001yi-TE
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 11:58:19 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:44670)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kzMzo-000730-QY
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 11:58:19 -0500
Received: by mail-wr1-x42d.google.com with SMTP id w5so3224761wrm.11
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 08:58:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=wR5z/kJnao51NPzZP9QnfcBQ068D1JOXzILEW7CUv2o=;
 b=Z4zEEUeuRP1pPm58x9HFpsiE5iObmu/So5qqo5TG0imwxim/7LgiP7zGPhAlq18f2K
 ywnMKE1ndjHeJgYZlWm/XaB5wi9o5wMplI7rN3Bd7syYqi7kwjF1gH434nf0uD0ewh7K
 f/Qyd/H0XIK60tARbma2KiGUY+Azir2t7RN94Uw3XEs6CBxzdA4c6xupHoop9Hl6j97e
 9U9af8c0bRoUW4V83M8u+fbMtGV5agRwQBY5//ziBPVtiSrOI5Kb82njcgEFA0gsiyYh
 BCJdODfjb0xYfP+d69ppF0zObJI4mn6YoX6QIqEQgZoeZ0w7eFBhJ4Um6i0/sJUFL+fs
 jtRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wR5z/kJnao51NPzZP9QnfcBQ068D1JOXzILEW7CUv2o=;
 b=Or+GT/luMlNFuTMCbbvezZo2jqe7P47qnoaJifXY1o/nzcewKpLe4aG7jo0dLJrw8J
 1R3YJcX8cXC0/8SZx1L35lD5suhEQExnYSYDFyNx4U6obRfb4gfy0ckXg3756ocexee3
 BV2C0/wePWqr1Frr29Inf1U6z19FPjHyXqK7JQEGyO/YIQqv0M76ZIQGXPb5ejGUyV6V
 fkbbXaXtn0q4TkKrKLx4FJ6RrPUSKosfooQbBZS+qr+ffIHZf9xwcZMLg1IogcGsXBGa
 pL1mjK7ZZzCEFFimFYv2No98T+igDqHvLqSYgUBaNli/vkTaH4WhUafOnvb1Cu/TH8nz
 C2sw==
X-Gm-Message-State: AOAM5324rQSW1FGCnVpQPrS+/PAQNK3I5FygQd0roIqleb71UYSr7HyO
 eilNTFxRMPKK4LH6eVFtLG3fE0f1+G4EXQ==
X-Google-Smtp-Source: ABdhPJzU6PkxbE2J4dSZ1ollSTCCkepnbh96HPXt4pPI4Jc32TRlwdmtgqx4m8gInud3E+vFp8o5Tw==
X-Received: by 2002:adf:ec92:: with SMTP id z18mr5396008wrn.166.1610470694907; 
 Tue, 12 Jan 2021 08:58:14 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id i18sm6210083wrp.74.2021.01.12.08.58.13
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 08:58:14 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 18/21] hw/misc: Add a PWM module for NPCM7XX
Date: Tue, 12 Jan 2021 16:57:47 +0000
Message-Id: <20210112165750.30475-19-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210112165750.30475-1-peter.maydell@linaro.org>
References: <20210112165750.30475-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
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

From: Hao Wu <wuhaotsh@google.com>

The PWM module is part of NPCM7XX module. Each NPCM7XX module has two
identical PWM modules. Each module contains 4 PWM entries. Each PWM has
two outputs: frequency and duty_cycle. Both are computed using inputs
from software side.

This module does not model detail pulse signals since it is expensive.
It also does not model interrupts and watchdogs that are dependant on
the detail models. The interfaces for these are left in the module so
that anyone in need for these functionalities can implement on their
own.

The user can read the duty cycle and frequency using qom-get command.

Reviewed-by: Havard Skinnemoen <hskinnemoen@google.com>
Reviewed-by: Tyrone Ting <kfting@nuvoton.com>
Signed-off-by: Hao Wu <wuhaotsh@google.com>
Message-id: 20210108190945.949196-5-wuhaotsh@google.com
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/system/arm/nuvoton.rst   |   2 +-
 include/hw/arm/npcm7xx.h      |   2 +
 include/hw/misc/npcm7xx_pwm.h | 105 +++++++
 hw/arm/npcm7xx.c              |  26 +-
 hw/misc/npcm7xx_pwm.c         | 550 ++++++++++++++++++++++++++++++++++
 hw/misc/meson.build           |   1 +
 hw/misc/trace-events          |   6 +
 7 files changed, 689 insertions(+), 3 deletions(-)
 create mode 100644 include/hw/misc/npcm7xx_pwm.h
 create mode 100644 hw/misc/npcm7xx_pwm.c

diff --git a/docs/system/arm/nuvoton.rst b/docs/system/arm/nuvoton.rst
index 35829f8d0b6..a1786342e21 100644
--- a/docs/system/arm/nuvoton.rst
+++ b/docs/system/arm/nuvoton.rst
@@ -42,6 +42,7 @@ Supported devices
  * USB host (USBH)
  * GPIO controller
  * Analog to Digital Converter (ADC)
+ * Pulse Width Modulation (PWM)
 
 Missing devices
 ---------------
@@ -61,7 +62,6 @@ Missing devices
  * Peripheral SPI controller (PSPI)
  * SD/MMC host
  * PECI interface
- * Pulse Width Modulation (PWM)
  * Tachometer
  * PCI and PCIe root complex and bridges
  * VDM and MCTP support
diff --git a/include/hw/arm/npcm7xx.h b/include/hw/arm/npcm7xx.h
index 51e1c7620db..f6227aa8aa8 100644
--- a/include/hw/arm/npcm7xx.h
+++ b/include/hw/arm/npcm7xx.h
@@ -23,6 +23,7 @@
 #include "hw/mem/npcm7xx_mc.h"
 #include "hw/misc/npcm7xx_clk.h"
 #include "hw/misc/npcm7xx_gcr.h"
+#include "hw/misc/npcm7xx_pwm.h"
 #include "hw/misc/npcm7xx_rng.h"
 #include "hw/nvram/npcm7xx_otp.h"
 #include "hw/timer/npcm7xx_timer.h"
@@ -78,6 +79,7 @@ typedef struct NPCM7xxState {
     NPCM7xxCLKState     clk;
     NPCM7xxTimerCtrlState tim[3];
     NPCM7xxADCState     adc;
+    NPCM7xxPWMState     pwm[2];
     NPCM7xxOTPState     key_storage;
     NPCM7xxOTPState     fuse_array;
     NPCM7xxMCState      mc;
diff --git a/include/hw/misc/npcm7xx_pwm.h b/include/hw/misc/npcm7xx_pwm.h
new file mode 100644
index 00000000000..5a689d3f669
--- /dev/null
+++ b/include/hw/misc/npcm7xx_pwm.h
@@ -0,0 +1,105 @@
+/*
+ * Nuvoton NPCM7xx PWM Module
+ *
+ * Copyright 2020 Google LLC
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU General Public License as published by the
+ * Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
+ * for more details.
+ */
+#ifndef NPCM7XX_PWM_H
+#define NPCM7XX_PWM_H
+
+#include "hw/clock.h"
+#include "hw/sysbus.h"
+#include "hw/irq.h"
+
+/* Each PWM module holds 4 PWM channels. */
+#define NPCM7XX_PWM_PER_MODULE 4
+
+/*
+ * Number of registers in one pwm module. Don't change this without increasing
+ * the version_id in vmstate.
+ */
+#define NPCM7XX_PWM_NR_REGS (0x54 / sizeof(uint32_t))
+
+/*
+ * The maximum duty values. Each duty unit represents 1/NPCM7XX_PWM_MAX_DUTY
+ * cycles. For example, if NPCM7XX_PWM_MAX_DUTY=1,000,000 and a PWM has a duty
+ * value of 100,000 the duty cycle for that PWM is 10%.
+ */
+#define NPCM7XX_PWM_MAX_DUTY 1000000
+
+typedef struct NPCM7xxPWMState NPCM7xxPWMState;
+
+/**
+ * struct NPCM7xxPWM - The state of a single PWM channel.
+ * @module: The PWM module that contains this channel.
+ * @irq: GIC interrupt line to fire on expiration if enabled.
+ * @running: Whether this PWM channel is generating output.
+ * @inverted: Whether this PWM channel is inverted.
+ * @index: The index of this PWM channel.
+ * @cnr: The counter register.
+ * @cmr: The comparator register.
+ * @pdr: The data register.
+ * @pwdr: The watchdog register.
+ * @freq: The frequency of this PWM channel.
+ * @duty: The duty cycle of this PWM channel. One unit represents
+ *   1/NPCM7XX_MAX_DUTY cycles.
+ */
+typedef struct NPCM7xxPWM {
+    NPCM7xxPWMState         *module;
+
+    qemu_irq                irq;
+
+    bool                    running;
+    bool                    inverted;
+
+    uint8_t                 index;
+    uint32_t                cnr;
+    uint32_t                cmr;
+    uint32_t                pdr;
+    uint32_t                pwdr;
+
+    uint32_t                freq;
+    uint32_t                duty;
+} NPCM7xxPWM;
+
+/**
+ * struct NPCM7xxPWMState - Pulse Width Modulation device state.
+ * @parent: System bus device.
+ * @iomem: Memory region through which registers are accessed.
+ * @clock: The PWM clock.
+ * @pwm: The PWM channels owned by this module.
+ * @ppr: The prescaler register.
+ * @csr: The clock selector register.
+ * @pcr: The control register.
+ * @pier: The interrupt enable register.
+ * @piir: The interrupt indication register.
+ */
+struct NPCM7xxPWMState {
+    SysBusDevice parent;
+
+    MemoryRegion iomem;
+
+    Clock       *clock;
+    NPCM7xxPWM pwm[NPCM7XX_PWM_PER_MODULE];
+
+    uint32_t    ppr;
+    uint32_t    csr;
+    uint32_t    pcr;
+    uint32_t    pier;
+    uint32_t    piir;
+};
+
+#define TYPE_NPCM7XX_PWM "npcm7xx-pwm"
+#define NPCM7XX_PWM(obj) \
+    OBJECT_CHECK(NPCM7xxPWMState, (obj), TYPE_NPCM7XX_PWM)
+
+#endif /* NPCM7XX_PWM_H */
diff --git a/hw/arm/npcm7xx.c b/hw/arm/npcm7xx.c
index b22a8c966d3..72040d40799 100644
--- a/hw/arm/npcm7xx.c
+++ b/hw/arm/npcm7xx.c
@@ -102,6 +102,8 @@ enum NPCM7xxInterrupt {
     NPCM7XX_WDG2_IRQ,                   /* Timer Module 2 Watchdog */
     NPCM7XX_EHCI_IRQ            = 61,
     NPCM7XX_OHCI_IRQ            = 62,
+    NPCM7XX_PWM0_IRQ            = 93,   /* PWM module 0 */
+    NPCM7XX_PWM1_IRQ,                   /* PWM module 1 */
     NPCM7XX_GPIO0_IRQ           = 116,
     NPCM7XX_GPIO1_IRQ,
     NPCM7XX_GPIO2_IRQ,
@@ -144,6 +146,12 @@ static const hwaddr npcm7xx_fiu3_flash_addr[] = {
     0xb8000000, /* CS3 */
 };
 
+/* Register base address for each PWM Module */
+static const hwaddr npcm7xx_pwm_addr[] = {
+    0xf0103000,
+    0xf0104000,
+};
+
 static const struct {
     hwaddr regs_addr;
     uint32_t unconnected_pins;
@@ -353,6 +361,10 @@ static void npcm7xx_init(Object *obj)
         object_initialize_child(obj, npcm7xx_fiu[i].name, &s->fiu[i],
                                 TYPE_NPCM7XX_FIU);
     }
+
+    for (i = 0; i < ARRAY_SIZE(s->pwm); i++) {
+        object_initialize_child(obj, "pwm[*]", &s->pwm[i], TYPE_NPCM7XX_PWM);
+    }
 }
 
 static void npcm7xx_realize(DeviceState *dev, Error **errp)
@@ -513,6 +525,18 @@ static void npcm7xx_realize(DeviceState *dev, Error **errp)
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->ohci), 0,
                        npcm7xx_irq(s, NPCM7XX_OHCI_IRQ));
 
+    /* PWM Modules. Cannot fail. */
+    QEMU_BUILD_BUG_ON(ARRAY_SIZE(npcm7xx_pwm_addr) != ARRAY_SIZE(s->pwm));
+    for (i = 0; i < ARRAY_SIZE(s->pwm); i++) {
+        SysBusDevice *sbd = SYS_BUS_DEVICE(&s->pwm[i]);
+
+        qdev_connect_clock_in(DEVICE(&s->pwm[i]), "clock", qdev_get_clock_out(
+                    DEVICE(&s->clk), "apb3-clock"));
+        sysbus_realize(sbd, &error_abort);
+        sysbus_mmio_map(sbd, 0, npcm7xx_pwm_addr[i]);
+        sysbus_connect_irq(sbd, i, npcm7xx_irq(s, NPCM7XX_PWM0_IRQ + i));
+    }
+
     /*
      * Flash Interface Unit (FIU). Can fail if incorrect number of chip selects
      * specified, but this is a programming error.
@@ -580,8 +604,6 @@ static void npcm7xx_realize(DeviceState *dev, Error **errp)
     create_unimplemented_device("npcm7xx.peci",         0xf0100000,   4 * KiB);
     create_unimplemented_device("npcm7xx.siox[1]",      0xf0101000,   4 * KiB);
     create_unimplemented_device("npcm7xx.siox[2]",      0xf0102000,   4 * KiB);
-    create_unimplemented_device("npcm7xx.pwm[0]",       0xf0103000,   4 * KiB);
-    create_unimplemented_device("npcm7xx.pwm[1]",       0xf0104000,   4 * KiB);
     create_unimplemented_device("npcm7xx.mft[0]",       0xf0180000,   4 * KiB);
     create_unimplemented_device("npcm7xx.mft[1]",       0xf0181000,   4 * KiB);
     create_unimplemented_device("npcm7xx.mft[2]",       0xf0182000,   4 * KiB);
diff --git a/hw/misc/npcm7xx_pwm.c b/hw/misc/npcm7xx_pwm.c
new file mode 100644
index 00000000000..e99e3cc7ef3
--- /dev/null
+++ b/hw/misc/npcm7xx_pwm.c
@@ -0,0 +1,550 @@
+/*
+ * Nuvoton NPCM7xx PWM Module
+ *
+ * Copyright 2020 Google LLC
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU General Public License as published by the
+ * Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
+ * for more details.
+ */
+
+#include "qemu/osdep.h"
+#include "hw/irq.h"
+#include "hw/qdev-clock.h"
+#include "hw/qdev-properties.h"
+#include "hw/misc/npcm7xx_pwm.h"
+#include "hw/registerfields.h"
+#include "migration/vmstate.h"
+#include "qemu/bitops.h"
+#include "qemu/error-report.h"
+#include "qemu/log.h"
+#include "qemu/module.h"
+#include "qemu/units.h"
+#include "trace.h"
+
+REG32(NPCM7XX_PWM_PPR, 0x00);
+REG32(NPCM7XX_PWM_CSR, 0x04);
+REG32(NPCM7XX_PWM_PCR, 0x08);
+REG32(NPCM7XX_PWM_CNR0, 0x0c);
+REG32(NPCM7XX_PWM_CMR0, 0x10);
+REG32(NPCM7XX_PWM_PDR0, 0x14);
+REG32(NPCM7XX_PWM_CNR1, 0x18);
+REG32(NPCM7XX_PWM_CMR1, 0x1c);
+REG32(NPCM7XX_PWM_PDR1, 0x20);
+REG32(NPCM7XX_PWM_CNR2, 0x24);
+REG32(NPCM7XX_PWM_CMR2, 0x28);
+REG32(NPCM7XX_PWM_PDR2, 0x2c);
+REG32(NPCM7XX_PWM_CNR3, 0x30);
+REG32(NPCM7XX_PWM_CMR3, 0x34);
+REG32(NPCM7XX_PWM_PDR3, 0x38);
+REG32(NPCM7XX_PWM_PIER, 0x3c);
+REG32(NPCM7XX_PWM_PIIR, 0x40);
+REG32(NPCM7XX_PWM_PWDR0, 0x44);
+REG32(NPCM7XX_PWM_PWDR1, 0x48);
+REG32(NPCM7XX_PWM_PWDR2, 0x4c);
+REG32(NPCM7XX_PWM_PWDR3, 0x50);
+
+/* Register field definitions. */
+#define NPCM7XX_PPR(rv, index)      extract32((rv), npcm7xx_ppr_base[index], 8)
+#define NPCM7XX_CSR(rv, index)      extract32((rv), npcm7xx_csr_base[index], 3)
+#define NPCM7XX_CH(rv, index)       extract32((rv), npcm7xx_ch_base[index], 4)
+#define NPCM7XX_CH_EN               BIT(0)
+#define NPCM7XX_CH_INV              BIT(2)
+#define NPCM7XX_CH_MOD              BIT(3)
+
+/* Offset of each PWM channel's prescaler in the PPR register. */
+static const int npcm7xx_ppr_base[] = { 0, 0, 8, 8 };
+/* Offset of each PWM channel's clock selector in the CSR register. */
+static const int npcm7xx_csr_base[] = { 0, 4, 8, 12 };
+/* Offset of each PWM channel's control variable in the PCR register. */
+static const int npcm7xx_ch_base[] = { 0, 8, 12, 16 };
+
+static uint32_t npcm7xx_pwm_calculate_freq(NPCM7xxPWM *p)
+{
+    uint32_t ppr;
+    uint32_t csr;
+    uint32_t freq;
+
+    if (!p->running) {
+        return 0;
+    }
+
+    csr = NPCM7XX_CSR(p->module->csr, p->index);
+    ppr = NPCM7XX_PPR(p->module->ppr, p->index);
+    freq = clock_get_hz(p->module->clock);
+    freq /= ppr + 1;
+    /* csr can only be 0~4 */
+    if (csr > 4) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: invalid csr value %u\n",
+                      __func__, csr);
+        csr = 4;
+    }
+    /* freq won't be changed if csr == 4. */
+    if (csr < 4) {
+        freq >>= csr + 1;
+    }
+
+    return freq / (p->cnr + 1);
+}
+
+static uint32_t npcm7xx_pwm_calculate_duty(NPCM7xxPWM *p)
+{
+    uint64_t duty;
+
+    if (p->running) {
+        if (p->cnr == 0) {
+            duty = 0;
+        } else if (p->cmr >= p->cnr) {
+            duty = NPCM7XX_PWM_MAX_DUTY;
+        } else {
+            duty = NPCM7XX_PWM_MAX_DUTY * (p->cmr + 1) / (p->cnr + 1);
+        }
+    } else {
+        duty = 0;
+    }
+
+    if (p->inverted) {
+        duty = NPCM7XX_PWM_MAX_DUTY - duty;
+    }
+
+    return duty;
+}
+
+static void npcm7xx_pwm_update_freq(NPCM7xxPWM *p)
+{
+    uint32_t freq = npcm7xx_pwm_calculate_freq(p);
+
+    if (freq != p->freq) {
+        trace_npcm7xx_pwm_update_freq(DEVICE(p->module)->canonical_path,
+                                      p->index, p->freq, freq);
+        p->freq = freq;
+    }
+}
+
+static void npcm7xx_pwm_update_duty(NPCM7xxPWM *p)
+{
+    uint32_t duty = npcm7xx_pwm_calculate_duty(p);
+
+    if (duty != p->duty) {
+        trace_npcm7xx_pwm_update_duty(DEVICE(p->module)->canonical_path,
+                                      p->index, p->duty, duty);
+        p->duty = duty;
+    }
+}
+
+static void npcm7xx_pwm_update_output(NPCM7xxPWM *p)
+{
+    npcm7xx_pwm_update_freq(p);
+    npcm7xx_pwm_update_duty(p);
+}
+
+static void npcm7xx_pwm_write_ppr(NPCM7xxPWMState *s, uint32_t new_ppr)
+{
+    int i;
+    uint32_t old_ppr = s->ppr;
+
+    QEMU_BUILD_BUG_ON(ARRAY_SIZE(npcm7xx_ppr_base) != NPCM7XX_PWM_PER_MODULE);
+    s->ppr = new_ppr;
+    for (i = 0; i < NPCM7XX_PWM_PER_MODULE; ++i) {
+        if (NPCM7XX_PPR(old_ppr, i) != NPCM7XX_PPR(new_ppr, i)) {
+            npcm7xx_pwm_update_freq(&s->pwm[i]);
+        }
+    }
+}
+
+static void npcm7xx_pwm_write_csr(NPCM7xxPWMState *s, uint32_t new_csr)
+{
+    int i;
+    uint32_t old_csr = s->csr;
+
+    QEMU_BUILD_BUG_ON(ARRAY_SIZE(npcm7xx_csr_base) != NPCM7XX_PWM_PER_MODULE);
+    s->csr = new_csr;
+    for (i = 0; i < NPCM7XX_PWM_PER_MODULE; ++i) {
+        if (NPCM7XX_CSR(old_csr, i) != NPCM7XX_CSR(new_csr, i)) {
+            npcm7xx_pwm_update_freq(&s->pwm[i]);
+        }
+    }
+}
+
+static void npcm7xx_pwm_write_pcr(NPCM7xxPWMState *s, uint32_t new_pcr)
+{
+    int i;
+    bool inverted;
+    uint32_t pcr;
+    NPCM7xxPWM *p;
+
+    s->pcr = new_pcr;
+    QEMU_BUILD_BUG_ON(ARRAY_SIZE(npcm7xx_ch_base) != NPCM7XX_PWM_PER_MODULE);
+    for (i = 0; i < NPCM7XX_PWM_PER_MODULE; ++i) {
+        p = &s->pwm[i];
+        pcr = NPCM7XX_CH(new_pcr, i);
+        inverted = pcr & NPCM7XX_CH_INV;
+
+        /*
+         * We only run a PWM channel with toggle mode. Single-shot mode does not
+         * generate frequency and duty-cycle values.
+         */
+        if ((pcr & NPCM7XX_CH_EN) && (pcr & NPCM7XX_CH_MOD)) {
+            if (p->running) {
+                /* Re-run this PWM channel if inverted changed. */
+                if (p->inverted ^ inverted) {
+                    p->inverted = inverted;
+                    npcm7xx_pwm_update_duty(p);
+                }
+            } else {
+                /* Run this PWM channel. */
+                p->running = true;
+                p->inverted = inverted;
+                npcm7xx_pwm_update_output(p);
+            }
+        } else {
+            /* Clear this PWM channel. */
+            p->running = false;
+            p->inverted = inverted;
+            npcm7xx_pwm_update_output(p);
+        }
+    }
+
+}
+
+static hwaddr npcm7xx_cnr_index(hwaddr offset)
+{
+    switch (offset) {
+    case A_NPCM7XX_PWM_CNR0:
+        return 0;
+    case A_NPCM7XX_PWM_CNR1:
+        return 1;
+    case A_NPCM7XX_PWM_CNR2:
+        return 2;
+    case A_NPCM7XX_PWM_CNR3:
+        return 3;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+static hwaddr npcm7xx_cmr_index(hwaddr offset)
+{
+    switch (offset) {
+    case A_NPCM7XX_PWM_CMR0:
+        return 0;
+    case A_NPCM7XX_PWM_CMR1:
+        return 1;
+    case A_NPCM7XX_PWM_CMR2:
+        return 2;
+    case A_NPCM7XX_PWM_CMR3:
+        return 3;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+static hwaddr npcm7xx_pdr_index(hwaddr offset)
+{
+    switch (offset) {
+    case A_NPCM7XX_PWM_PDR0:
+        return 0;
+    case A_NPCM7XX_PWM_PDR1:
+        return 1;
+    case A_NPCM7XX_PWM_PDR2:
+        return 2;
+    case A_NPCM7XX_PWM_PDR3:
+        return 3;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+static hwaddr npcm7xx_pwdr_index(hwaddr offset)
+{
+    switch (offset) {
+    case A_NPCM7XX_PWM_PWDR0:
+        return 0;
+    case A_NPCM7XX_PWM_PWDR1:
+        return 1;
+    case A_NPCM7XX_PWM_PWDR2:
+        return 2;
+    case A_NPCM7XX_PWM_PWDR3:
+        return 3;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+static uint64_t npcm7xx_pwm_read(void *opaque, hwaddr offset, unsigned size)
+{
+    NPCM7xxPWMState *s = opaque;
+    uint64_t value = 0;
+
+    switch (offset) {
+    case A_NPCM7XX_PWM_CNR0:
+    case A_NPCM7XX_PWM_CNR1:
+    case A_NPCM7XX_PWM_CNR2:
+    case A_NPCM7XX_PWM_CNR3:
+        value = s->pwm[npcm7xx_cnr_index(offset)].cnr;
+        break;
+
+    case A_NPCM7XX_PWM_CMR0:
+    case A_NPCM7XX_PWM_CMR1:
+    case A_NPCM7XX_PWM_CMR2:
+    case A_NPCM7XX_PWM_CMR3:
+        value = s->pwm[npcm7xx_cmr_index(offset)].cmr;
+        break;
+
+    case A_NPCM7XX_PWM_PDR0:
+    case A_NPCM7XX_PWM_PDR1:
+    case A_NPCM7XX_PWM_PDR2:
+    case A_NPCM7XX_PWM_PDR3:
+        value = s->pwm[npcm7xx_pdr_index(offset)].pdr;
+        break;
+
+    case A_NPCM7XX_PWM_PWDR0:
+    case A_NPCM7XX_PWM_PWDR1:
+    case A_NPCM7XX_PWM_PWDR2:
+    case A_NPCM7XX_PWM_PWDR3:
+        value = s->pwm[npcm7xx_pwdr_index(offset)].pwdr;
+        break;
+
+    case A_NPCM7XX_PWM_PPR:
+        value = s->ppr;
+        break;
+
+    case A_NPCM7XX_PWM_CSR:
+        value = s->csr;
+        break;
+
+    case A_NPCM7XX_PWM_PCR:
+        value = s->pcr;
+        break;
+
+    case A_NPCM7XX_PWM_PIER:
+        value = s->pier;
+        break;
+
+    case A_NPCM7XX_PWM_PIIR:
+        value = s->piir;
+        break;
+
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: invalid offset 0x%04" HWADDR_PRIx "\n",
+                      __func__, offset);
+        break;
+    }
+
+    trace_npcm7xx_pwm_read(DEVICE(s)->canonical_path, offset, value);
+    return value;
+}
+
+static void npcm7xx_pwm_write(void *opaque, hwaddr offset,
+                                uint64_t v, unsigned size)
+{
+    NPCM7xxPWMState *s = opaque;
+    NPCM7xxPWM *p;
+    uint32_t value = v;
+
+    trace_npcm7xx_pwm_write(DEVICE(s)->canonical_path, offset, value);
+    switch (offset) {
+    case A_NPCM7XX_PWM_CNR0:
+    case A_NPCM7XX_PWM_CNR1:
+    case A_NPCM7XX_PWM_CNR2:
+    case A_NPCM7XX_PWM_CNR3:
+        p = &s->pwm[npcm7xx_cnr_index(offset)];
+        p->cnr = value;
+        npcm7xx_pwm_update_output(p);
+        break;
+
+    case A_NPCM7XX_PWM_CMR0:
+    case A_NPCM7XX_PWM_CMR1:
+    case A_NPCM7XX_PWM_CMR2:
+    case A_NPCM7XX_PWM_CMR3:
+        p = &s->pwm[npcm7xx_cmr_index(offset)];
+        p->cmr = value;
+        npcm7xx_pwm_update_output(p);
+        break;
+
+    case A_NPCM7XX_PWM_PDR0:
+    case A_NPCM7XX_PWM_PDR1:
+    case A_NPCM7XX_PWM_PDR2:
+    case A_NPCM7XX_PWM_PDR3:
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: register @ 0x%04" HWADDR_PRIx " is read-only\n",
+                      __func__, offset);
+        break;
+
+    case A_NPCM7XX_PWM_PWDR0:
+    case A_NPCM7XX_PWM_PWDR1:
+    case A_NPCM7XX_PWM_PWDR2:
+    case A_NPCM7XX_PWM_PWDR3:
+        qemu_log_mask(LOG_UNIMP,
+                     "%s: register @ 0x%04" HWADDR_PRIx " is not implemented\n",
+                     __func__, offset);
+        break;
+
+    case A_NPCM7XX_PWM_PPR:
+        npcm7xx_pwm_write_ppr(s, value);
+        break;
+
+    case A_NPCM7XX_PWM_CSR:
+        npcm7xx_pwm_write_csr(s, value);
+        break;
+
+    case A_NPCM7XX_PWM_PCR:
+        npcm7xx_pwm_write_pcr(s, value);
+        break;
+
+    case A_NPCM7XX_PWM_PIER:
+        qemu_log_mask(LOG_UNIMP,
+                     "%s: register @ 0x%04" HWADDR_PRIx " is not implemented\n",
+                     __func__, offset);
+        break;
+
+    case A_NPCM7XX_PWM_PIIR:
+        qemu_log_mask(LOG_UNIMP,
+                     "%s: register @ 0x%04" HWADDR_PRIx " is not implemented\n",
+                     __func__, offset);
+        break;
+
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: invalid offset 0x%04" HWADDR_PRIx "\n",
+                      __func__, offset);
+        break;
+    }
+}
+
+static const struct MemoryRegionOps npcm7xx_pwm_ops = {
+    .read       = npcm7xx_pwm_read,
+    .write      = npcm7xx_pwm_write,
+    .endianness = DEVICE_LITTLE_ENDIAN,
+    .valid      = {
+        .min_access_size        = 4,
+        .max_access_size        = 4,
+        .unaligned              = false,
+    },
+};
+
+static void npcm7xx_pwm_enter_reset(Object *obj, ResetType type)
+{
+    NPCM7xxPWMState *s = NPCM7XX_PWM(obj);
+    int i;
+
+    for (i = 0; i < NPCM7XX_PWM_PER_MODULE; i++) {
+        NPCM7xxPWM *p = &s->pwm[i];
+
+        p->cnr = 0x00000000;
+        p->cmr = 0x00000000;
+        p->pdr = 0x00000000;
+        p->pwdr = 0x00000000;
+    }
+
+    s->ppr = 0x00000000;
+    s->csr = 0x00000000;
+    s->pcr = 0x00000000;
+    s->pier = 0x00000000;
+    s->piir = 0x00000000;
+}
+
+static void npcm7xx_pwm_hold_reset(Object *obj)
+{
+    NPCM7xxPWMState *s = NPCM7XX_PWM(obj);
+    int i;
+
+    for (i = 0; i < NPCM7XX_PWM_PER_MODULE; i++) {
+        qemu_irq_lower(s->pwm[i].irq);
+    }
+}
+
+static void npcm7xx_pwm_init(Object *obj)
+{
+    NPCM7xxPWMState *s = NPCM7XX_PWM(obj);
+    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
+    int i;
+
+    for (i = 0; i < NPCM7XX_PWM_PER_MODULE; i++) {
+        NPCM7xxPWM *p = &s->pwm[i];
+        p->module = s;
+        p->index = i;
+        sysbus_init_irq(sbd, &p->irq);
+    }
+
+    memory_region_init_io(&s->iomem, obj, &npcm7xx_pwm_ops, s,
+                          TYPE_NPCM7XX_PWM, 4 * KiB);
+    sysbus_init_mmio(sbd, &s->iomem);
+    s->clock = qdev_init_clock_in(DEVICE(s), "clock", NULL, NULL);
+
+    for (i = 0; i < NPCM7XX_PWM_PER_MODULE; ++i) {
+        object_property_add_uint32_ptr(obj, "freq[*]",
+                &s->pwm[i].freq, OBJ_PROP_FLAG_READ);
+        object_property_add_uint32_ptr(obj, "duty[*]",
+                &s->pwm[i].duty, OBJ_PROP_FLAG_READ);
+    }
+}
+
+static const VMStateDescription vmstate_npcm7xx_pwm = {
+    .name = "npcm7xx-pwm",
+    .version_id = 0,
+    .minimum_version_id = 0,
+    .fields = (VMStateField[]) {
+        VMSTATE_BOOL(running, NPCM7xxPWM),
+        VMSTATE_BOOL(inverted, NPCM7xxPWM),
+        VMSTATE_UINT8(index, NPCM7xxPWM),
+        VMSTATE_UINT32(cnr, NPCM7xxPWM),
+        VMSTATE_UINT32(cmr, NPCM7xxPWM),
+        VMSTATE_UINT32(pdr, NPCM7xxPWM),
+        VMSTATE_UINT32(pwdr, NPCM7xxPWM),
+        VMSTATE_UINT32(freq, NPCM7xxPWM),
+        VMSTATE_UINT32(duty, NPCM7xxPWM),
+        VMSTATE_END_OF_LIST(),
+    },
+};
+
+static const VMStateDescription vmstate_npcm7xx_pwm_module = {
+    .name = "npcm7xx-pwm-module",
+    .version_id = 0,
+    .minimum_version_id = 0,
+    .fields = (VMStateField[]) {
+        VMSTATE_CLOCK(clock, NPCM7xxPWMState),
+        VMSTATE_STRUCT_ARRAY(pwm, NPCM7xxPWMState,
+                             NPCM7XX_PWM_PER_MODULE, 0, vmstate_npcm7xx_pwm,
+                             NPCM7xxPWM),
+        VMSTATE_UINT32(ppr, NPCM7xxPWMState),
+        VMSTATE_UINT32(csr, NPCM7xxPWMState),
+        VMSTATE_UINT32(pcr, NPCM7xxPWMState),
+        VMSTATE_UINT32(pier, NPCM7xxPWMState),
+        VMSTATE_UINT32(piir, NPCM7xxPWMState),
+        VMSTATE_END_OF_LIST(),
+    },
+};
+
+static void npcm7xx_pwm_class_init(ObjectClass *klass, void *data)
+{
+    ResettableClass *rc = RESETTABLE_CLASS(klass);
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->desc = "NPCM7xx PWM Controller";
+    dc->vmsd = &vmstate_npcm7xx_pwm_module;
+    rc->phases.enter = npcm7xx_pwm_enter_reset;
+    rc->phases.hold = npcm7xx_pwm_hold_reset;
+}
+
+static const TypeInfo npcm7xx_pwm_info = {
+    .name               = TYPE_NPCM7XX_PWM,
+    .parent             = TYPE_SYS_BUS_DEVICE,
+    .instance_size      = sizeof(NPCM7xxPWMState),
+    .class_init         = npcm7xx_pwm_class_init,
+    .instance_init      = npcm7xx_pwm_init,
+};
+
+static void npcm7xx_pwm_register_type(void)
+{
+    type_register_static(&npcm7xx_pwm_info);
+}
+type_init(npcm7xx_pwm_register_type);
diff --git a/hw/misc/meson.build b/hw/misc/meson.build
index ce15ffceb95..607cd38a210 100644
--- a/hw/misc/meson.build
+++ b/hw/misc/meson.build
@@ -64,6 +64,7 @@ softmmu_ss.add(when: 'CONFIG_MAINSTONE', if_true: files('mst_fpga.c'))
 softmmu_ss.add(when: 'CONFIG_NPCM7XX', if_true: files(
   'npcm7xx_clk.c',
   'npcm7xx_gcr.c',
+  'npcm7xx_pwm.c',
   'npcm7xx_rng.c',
 ))
 softmmu_ss.add(when: 'CONFIG_OMAP', if_true: files(
diff --git a/hw/misc/trace-events b/hw/misc/trace-events
index b5118acd3fd..d626b9d7a7c 100644
--- a/hw/misc/trace-events
+++ b/hw/misc/trace-events
@@ -120,6 +120,12 @@ npcm7xx_gcr_write(uint64_t offset, uint32_t value) "offset: 0x%04" PRIx64 " valu
 npcm7xx_rng_read(uint64_t offset, uint64_t value, unsigned size) "offset: 0x%04" PRIx64 " value: 0x%02" PRIx64 " size: %u"
 npcm7xx_rng_write(uint64_t offset, uint64_t value, unsigned size) "offset: 0x%04" PRIx64 " value: 0x%02" PRIx64 " size: %u"
 
+# npcm7xx_pwm.c
+npcm7xx_pwm_read(const char *id, uint64_t offset, uint32_t value) "%s offset: 0x%04" PRIx64 " value: 0x%08" PRIx32
+npcm7xx_pwm_write(const char *id, uint64_t offset, uint32_t value) "%s offset: 0x%04" PRIx64 " value: 0x%08" PRIx32
+npcm7xx_pwm_update_freq(const char *id, uint8_t index, uint32_t old_value, uint32_t new_value) "%s pwm[%u] Update Freq: old_freq: %u, new_freq: %u"
+npcm7xx_pwm_update_duty(const char *id, uint8_t index, uint32_t old_value, uint32_t new_value) "%s pwm[%u] Update Duty: old_duty: %u, new_duty: %u"
+
 # stm32f4xx_syscfg.c
 stm32f4xx_syscfg_set_irq(int gpio, int line, int level) "Interupt: GPIO: %d, Line: %d; Level: %d"
 stm32f4xx_pulse_exti(int irq) "Pulse EXTI: %d"
-- 
2.20.1


