Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CC0C2F368F
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 18:05:30 +0100 (CET)
Received: from localhost ([::1]:43804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzN6n-0007XI-K1
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 12:05:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kzMzq-0001y7-WD
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 11:58:19 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:43535)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kzMzn-00072q-Dg
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 11:58:18 -0500
Received: by mail-wr1-x42e.google.com with SMTP id y17so3217763wrr.10
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 08:58:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=4FlNkzNZlb3zZ7vcEpXyK6XdcSGmtuLMsQxAIwbf1ds=;
 b=XR3Ma+/RLS5mPZSmsO2lJB4I1DtZmAJ54Z2jbr/CUEi5MC09WL/+lv5npqSX/Qo5Rc
 DLp8fDrDPxQvg1vQ8QQ5IYpOTL0rjak8a6BY820srWwR9DNTYCsbrHVk380qbwxshD7H
 7ldEBgU+5kfMHdfIQT81RTsbLSV+3JI2uuAWkyXCefM1KTRrCXB4xLpLEw8Pnga/87YX
 qvU47owgPQzDtnaUWMv0YHTE92an06IvcVLMQUoZfTa04miaaRfSvPHjW9ZkAxF8v3OV
 E6sBsyx7hecKl1AoLKFJsWc1K44Vf8R1aTTmMKZfSpETMujY04RekY6/FybQsMz5slv6
 hzYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4FlNkzNZlb3zZ7vcEpXyK6XdcSGmtuLMsQxAIwbf1ds=;
 b=jJN0RVuQDvH6ugbEXS56BuZ44TrDdUSLV5Fk//HPEHlslDT8cCbAwJqHMbD4f4yK7E
 dPyRemR4xf4x+TnfCsCoe+0DNcmCfo9orw0cfSws6WiWlyTUJpspiz4aghoh78GvjDxU
 IftKpcpf7jAFZiBcmVgz6x7xWtLWKsIUe/leiLEpFC59qhvugVdVRCULX7OWLBDuJd5k
 5Hsfs5613fPNjGgzf547fYgCQHwigXZSwSyuGAZTOCVhNCfeoVs64/9xu9eJSgH1Upzi
 djUAWIeyg1LMHPAowH44z3Ce3X0oTP26IdTRDB8NgHkZJvoV0oXAnT5S9vLCpUM0T5yp
 PPnA==
X-Gm-Message-State: AOAM532RjeQKHvgyQZeo+Bc08O/87wYQpoz3agQ/HHi9gCCoFuq6QkSW
 bkulFcQMiARcYerTczx3vpQp8XfTZ19l4g==
X-Google-Smtp-Source: ABdhPJyuhf6RPZyvtFvkgjOexTVG946N7AGA2QhOg7+y0WZYczCaPBMHUqB3LiTibPPza0Hhy5q/7A==
X-Received: by 2002:a5d:457a:: with SMTP id a26mr2733639wrc.53.1610470693466; 
 Tue, 12 Jan 2021 08:58:13 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id i18sm6210083wrp.74.2021.01.12.08.58.12
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 08:58:12 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 17/21] hw/adc: Add an ADC module for NPCM7XX
Date: Tue, 12 Jan 2021 16:57:46 +0000
Message-Id: <20210112165750.30475-18-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210112165750.30475-1-peter.maydell@linaro.org>
References: <20210112165750.30475-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
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

The ADC is part of NPCM7XX Module. Its behavior is controled by the
ADC_CON register. It converts one of the eight analog inputs into a
digital input and stores it in the ADC_DATA register when enabled.

Users can alter input value by using qom-set QMP command.

Reviewed-by: Havard Skinnemoen <hskinnemoen@google.com>
Reviewed-by: Tyrone Ting <kfting@nuvoton.com>
Signed-off-by: Hao Wu <wuhaotsh@google.com>
Message-id: 20210108190945.949196-4-wuhaotsh@google.com
[PMM: Added missing hw/adc/trace.h file]
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/system/arm/nuvoton.rst    |   2 +-
 meson.build                    |   1 +
 hw/adc/trace.h                 |   1 +
 include/hw/adc/npcm7xx_adc.h   |  69 ++++++
 include/hw/arm/npcm7xx.h       |   2 +
 hw/adc/npcm7xx_adc.c           | 301 ++++++++++++++++++++++++++
 hw/arm/npcm7xx.c               |  24 ++-
 tests/qtest/npcm7xx_adc-test.c | 377 +++++++++++++++++++++++++++++++++
 hw/adc/meson.build             |   1 +
 hw/adc/trace-events            |   5 +
 tests/qtest/meson.build        |   3 +-
 11 files changed, 783 insertions(+), 3 deletions(-)
 create mode 100644 hw/adc/trace.h
 create mode 100644 include/hw/adc/npcm7xx_adc.h
 create mode 100644 hw/adc/npcm7xx_adc.c
 create mode 100644 tests/qtest/npcm7xx_adc-test.c
 create mode 100644 hw/adc/trace-events

diff --git a/docs/system/arm/nuvoton.rst b/docs/system/arm/nuvoton.rst
index b00d405d52e..35829f8d0b6 100644
--- a/docs/system/arm/nuvoton.rst
+++ b/docs/system/arm/nuvoton.rst
@@ -41,6 +41,7 @@ Supported devices
  * Random Number Generator (RNG)
  * USB host (USBH)
  * GPIO controller
+ * Analog to Digital Converter (ADC)
 
 Missing devices
 ---------------
@@ -58,7 +59,6 @@ Missing devices
  * USB device (USBD)
  * SMBus controller (SMBF)
  * Peripheral SPI controller (PSPI)
- * Analog to Digital Converter (ADC)
  * SD/MMC host
  * PECI interface
  * Pulse Width Modulation (PWM)
diff --git a/meson.build b/meson.build
index e4db67ccf2e..0ce993a404b 100644
--- a/meson.build
+++ b/meson.build
@@ -1687,6 +1687,7 @@ if have_system
     'chardev',
     'hw/9pfs',
     'hw/acpi',
+    'hw/adc',
     'hw/alpha',
     'hw/arm',
     'hw/audio',
diff --git a/hw/adc/trace.h b/hw/adc/trace.h
new file mode 100644
index 00000000000..b71d5b5b4ee
--- /dev/null
+++ b/hw/adc/trace.h
@@ -0,0 +1 @@
+#include "trace/trace-hw_adc.h"
diff --git a/include/hw/adc/npcm7xx_adc.h b/include/hw/adc/npcm7xx_adc.h
new file mode 100644
index 00000000000..7d8442107ae
--- /dev/null
+++ b/include/hw/adc/npcm7xx_adc.h
@@ -0,0 +1,69 @@
+/*
+ * Nuvoton NPCM7xx ADC Module
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
+#ifndef NPCM7XX_ADC_H
+#define NPCM7XX_ADC_H
+
+#include "hw/clock.h"
+#include "hw/irq.h"
+#include "hw/sysbus.h"
+#include "qemu/timer.h"
+
+#define NPCM7XX_ADC_NUM_INPUTS      8
+/**
+ * This value should not be changed unless write_adc_calibration function in
+ * hw/arm/npcm7xx.c is also changed.
+ */
+#define NPCM7XX_ADC_NUM_CALIB       2
+
+/**
+ * struct NPCM7xxADCState - Analog to Digital Converter Module device state.
+ * @parent: System bus device.
+ * @iomem: Memory region through which registers are accessed.
+ * @conv_timer: The timer counts down remaining cycles for the conversion.
+ * @irq: GIC interrupt line to fire on expiration (if enabled).
+ * @con: The Control Register.
+ * @data: The Data Buffer.
+ * @clock: The ADC Clock.
+ * @adci: The input voltage in units of uV. 1uv = 1e-6V.
+ * @vref: The external reference voltage.
+ * @iref: The internal reference voltage, initialized at launch time.
+ * @rv: The calibrated output values of 0.5V and 1.5V for the ADC.
+ */
+typedef struct {
+    SysBusDevice parent;
+
+    MemoryRegion iomem;
+
+    QEMUTimer    conv_timer;
+
+    qemu_irq     irq;
+    uint32_t     con;
+    uint32_t     data;
+    Clock       *clock;
+
+    /* Voltages are in unit of uV. 1V = 1000000uV. */
+    uint32_t     adci[NPCM7XX_ADC_NUM_INPUTS];
+    uint32_t     vref;
+    uint32_t     iref;
+
+    uint16_t     calibration_r_values[NPCM7XX_ADC_NUM_CALIB];
+} NPCM7xxADCState;
+
+#define TYPE_NPCM7XX_ADC "npcm7xx-adc"
+#define NPCM7XX_ADC(obj) \
+    OBJECT_CHECK(NPCM7xxADCState, (obj), TYPE_NPCM7XX_ADC)
+
+#endif /* NPCM7XX_ADC_H */
diff --git a/include/hw/arm/npcm7xx.h b/include/hw/arm/npcm7xx.h
index 5469247e389..51e1c7620db 100644
--- a/include/hw/arm/npcm7xx.h
+++ b/include/hw/arm/npcm7xx.h
@@ -17,6 +17,7 @@
 #define NPCM7XX_H
 
 #include "hw/boards.h"
+#include "hw/adc/npcm7xx_adc.h"
 #include "hw/cpu/a9mpcore.h"
 #include "hw/gpio/npcm7xx_gpio.h"
 #include "hw/mem/npcm7xx_mc.h"
@@ -76,6 +77,7 @@ typedef struct NPCM7xxState {
     NPCM7xxGCRState     gcr;
     NPCM7xxCLKState     clk;
     NPCM7xxTimerCtrlState tim[3];
+    NPCM7xxADCState     adc;
     NPCM7xxOTPState     key_storage;
     NPCM7xxOTPState     fuse_array;
     NPCM7xxMCState      mc;
diff --git a/hw/adc/npcm7xx_adc.c b/hw/adc/npcm7xx_adc.c
new file mode 100644
index 00000000000..870a6d50c27
--- /dev/null
+++ b/hw/adc/npcm7xx_adc.c
@@ -0,0 +1,301 @@
+/*
+ * Nuvoton NPCM7xx ADC Module
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
+#include "hw/adc/npcm7xx_adc.h"
+#include "hw/qdev-clock.h"
+#include "hw/qdev-properties.h"
+#include "hw/registerfields.h"
+#include "migration/vmstate.h"
+#include "qemu/log.h"
+#include "qemu/module.h"
+#include "qemu/timer.h"
+#include "qemu/units.h"
+#include "trace.h"
+
+REG32(NPCM7XX_ADC_CON, 0x0)
+REG32(NPCM7XX_ADC_DATA, 0x4)
+
+/* Register field definitions. */
+#define NPCM7XX_ADC_CON_MUX(rv) extract32(rv, 24, 4)
+#define NPCM7XX_ADC_CON_INT_EN  BIT(21)
+#define NPCM7XX_ADC_CON_REFSEL  BIT(19)
+#define NPCM7XX_ADC_CON_INT     BIT(18)
+#define NPCM7XX_ADC_CON_EN      BIT(17)
+#define NPCM7XX_ADC_CON_RST     BIT(16)
+#define NPCM7XX_ADC_CON_CONV    BIT(14)
+#define NPCM7XX_ADC_CON_DIV(rv) extract32(rv, 1, 8)
+
+#define NPCM7XX_ADC_MAX_RESULT      1023
+#define NPCM7XX_ADC_DEFAULT_IREF    2000000
+#define NPCM7XX_ADC_CONV_CYCLES     20
+#define NPCM7XX_ADC_RESET_CYCLES    10
+#define NPCM7XX_ADC_R0_INPUT        500000
+#define NPCM7XX_ADC_R1_INPUT        1500000
+
+static void npcm7xx_adc_reset(NPCM7xxADCState *s)
+{
+    timer_del(&s->conv_timer);
+    s->con = 0x000c0001;
+    s->data = 0x00000000;
+}
+
+static uint32_t npcm7xx_adc_convert(uint32_t input, uint32_t ref)
+{
+    uint32_t result;
+
+    result = input * (NPCM7XX_ADC_MAX_RESULT + 1) / ref;
+    if (result > NPCM7XX_ADC_MAX_RESULT) {
+        result = NPCM7XX_ADC_MAX_RESULT;
+    }
+
+    return result;
+}
+
+static uint32_t npcm7xx_adc_prescaler(NPCM7xxADCState *s)
+{
+    return 2 * (NPCM7XX_ADC_CON_DIV(s->con) + 1);
+}
+
+static void npcm7xx_adc_start_timer(Clock *clk, QEMUTimer *timer,
+        uint32_t cycles, uint32_t prescaler)
+{
+    int64_t now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+    int64_t ticks = cycles;
+    int64_t ns;
+
+    ticks *= prescaler;
+    ns = clock_ticks_to_ns(clk, ticks);
+    ns += now;
+    timer_mod(timer, ns);
+}
+
+static void npcm7xx_adc_start_convert(NPCM7xxADCState *s)
+{
+    uint32_t prescaler = npcm7xx_adc_prescaler(s);
+
+    npcm7xx_adc_start_timer(s->clock, &s->conv_timer, NPCM7XX_ADC_CONV_CYCLES,
+            prescaler);
+}
+
+static void npcm7xx_adc_convert_done(void *opaque)
+{
+    NPCM7xxADCState *s = opaque;
+    uint32_t input = NPCM7XX_ADC_CON_MUX(s->con);
+    uint32_t ref = (s->con & NPCM7XX_ADC_CON_REFSEL)
+        ? s->iref : s->vref;
+
+    if (input >= NPCM7XX_ADC_NUM_INPUTS) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: invalid input: %u\n",
+                      __func__, input);
+        return;
+    }
+    s->data = npcm7xx_adc_convert(s->adci[input], ref);
+    if (s->con & NPCM7XX_ADC_CON_INT_EN) {
+        s->con |= NPCM7XX_ADC_CON_INT;
+        qemu_irq_raise(s->irq);
+    }
+    s->con &= ~NPCM7XX_ADC_CON_CONV;
+}
+
+static void npcm7xx_adc_calibrate(NPCM7xxADCState *adc)
+{
+    adc->calibration_r_values[0] = npcm7xx_adc_convert(NPCM7XX_ADC_R0_INPUT,
+            adc->iref);
+    adc->calibration_r_values[1] = npcm7xx_adc_convert(NPCM7XX_ADC_R1_INPUT,
+            adc->iref);
+}
+
+static void npcm7xx_adc_write_con(NPCM7xxADCState *s, uint32_t new_con)
+{
+    uint32_t old_con = s->con;
+
+    /* Write ADC_INT to 1 to clear it */
+    if (new_con & NPCM7XX_ADC_CON_INT) {
+        new_con &= ~NPCM7XX_ADC_CON_INT;
+        qemu_irq_lower(s->irq);
+    } else if (old_con & NPCM7XX_ADC_CON_INT) {
+        new_con |= NPCM7XX_ADC_CON_INT;
+    }
+
+    s->con = new_con;
+
+    if (s->con & NPCM7XX_ADC_CON_RST) {
+        npcm7xx_adc_reset(s);
+        return;
+    }
+
+    if ((s->con & NPCM7XX_ADC_CON_EN)) {
+        if (s->con & NPCM7XX_ADC_CON_CONV) {
+            if (!(old_con & NPCM7XX_ADC_CON_CONV)) {
+                npcm7xx_adc_start_convert(s);
+            }
+        } else {
+            timer_del(&s->conv_timer);
+        }
+    }
+}
+
+static uint64_t npcm7xx_adc_read(void *opaque, hwaddr offset, unsigned size)
+{
+    uint64_t value = 0;
+    NPCM7xxADCState *s = opaque;
+
+    switch (offset) {
+    case A_NPCM7XX_ADC_CON:
+        value = s->con;
+        break;
+
+    case A_NPCM7XX_ADC_DATA:
+        value = s->data;
+        break;
+
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: invalid offset 0x%04" HWADDR_PRIx "\n",
+                      __func__, offset);
+        break;
+    }
+
+    trace_npcm7xx_adc_read(DEVICE(s)->canonical_path, offset, value);
+    return value;
+}
+
+static void npcm7xx_adc_write(void *opaque, hwaddr offset, uint64_t v,
+        unsigned size)
+{
+    NPCM7xxADCState *s = opaque;
+
+    trace_npcm7xx_adc_write(DEVICE(s)->canonical_path, offset, v);
+    switch (offset) {
+    case A_NPCM7XX_ADC_CON:
+        npcm7xx_adc_write_con(s, v);
+        break;
+
+    case A_NPCM7XX_ADC_DATA:
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: register @ 0x%04" HWADDR_PRIx " is read-only\n",
+                      __func__, offset);
+        break;
+
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: invalid offset 0x%04" HWADDR_PRIx "\n",
+                      __func__, offset);
+        break;
+    }
+
+}
+
+static const struct MemoryRegionOps npcm7xx_adc_ops = {
+    .read       = npcm7xx_adc_read,
+    .write      = npcm7xx_adc_write,
+    .endianness = DEVICE_LITTLE_ENDIAN,
+    .valid      = {
+        .min_access_size        = 4,
+        .max_access_size        = 4,
+        .unaligned              = false,
+    },
+};
+
+static void npcm7xx_adc_enter_reset(Object *obj, ResetType type)
+{
+    NPCM7xxADCState *s = NPCM7XX_ADC(obj);
+
+    npcm7xx_adc_reset(s);
+}
+
+static void npcm7xx_adc_hold_reset(Object *obj)
+{
+    NPCM7xxADCState *s = NPCM7XX_ADC(obj);
+
+    qemu_irq_lower(s->irq);
+}
+
+static void npcm7xx_adc_init(Object *obj)
+{
+    NPCM7xxADCState *s = NPCM7XX_ADC(obj);
+    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
+    int i;
+
+    sysbus_init_irq(sbd, &s->irq);
+
+    timer_init_ns(&s->conv_timer, QEMU_CLOCK_VIRTUAL,
+            npcm7xx_adc_convert_done, s);
+    memory_region_init_io(&s->iomem, obj, &npcm7xx_adc_ops, s,
+                          TYPE_NPCM7XX_ADC, 4 * KiB);
+    sysbus_init_mmio(sbd, &s->iomem);
+    s->clock = qdev_init_clock_in(DEVICE(s), "clock", NULL, NULL);
+
+    for (i = 0; i < NPCM7XX_ADC_NUM_INPUTS; ++i) {
+        object_property_add_uint32_ptr(obj, "adci[*]",
+                &s->adci[i], OBJ_PROP_FLAG_WRITE);
+    }
+    object_property_add_uint32_ptr(obj, "vref",
+            &s->vref, OBJ_PROP_FLAG_WRITE);
+    npcm7xx_adc_calibrate(s);
+}
+
+static const VMStateDescription vmstate_npcm7xx_adc = {
+    .name = "npcm7xx-adc",
+    .version_id = 0,
+    .minimum_version_id = 0,
+    .fields = (VMStateField[]) {
+        VMSTATE_TIMER(conv_timer, NPCM7xxADCState),
+        VMSTATE_UINT32(con, NPCM7xxADCState),
+        VMSTATE_UINT32(data, NPCM7xxADCState),
+        VMSTATE_CLOCK(clock, NPCM7xxADCState),
+        VMSTATE_UINT32_ARRAY(adci, NPCM7xxADCState, NPCM7XX_ADC_NUM_INPUTS),
+        VMSTATE_UINT32(vref, NPCM7xxADCState),
+        VMSTATE_UINT32(iref, NPCM7xxADCState),
+        VMSTATE_UINT16_ARRAY(calibration_r_values, NPCM7xxADCState,
+                NPCM7XX_ADC_NUM_CALIB),
+        VMSTATE_END_OF_LIST(),
+    },
+};
+
+static Property npcm7xx_timer_properties[] = {
+    DEFINE_PROP_UINT32("iref", NPCM7xxADCState, iref, NPCM7XX_ADC_DEFAULT_IREF),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void npcm7xx_adc_class_init(ObjectClass *klass, void *data)
+{
+    ResettableClass *rc = RESETTABLE_CLASS(klass);
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->desc = "NPCM7xx ADC Module";
+    dc->vmsd = &vmstate_npcm7xx_adc;
+    rc->phases.enter = npcm7xx_adc_enter_reset;
+    rc->phases.hold = npcm7xx_adc_hold_reset;
+
+    device_class_set_props(dc, npcm7xx_timer_properties);
+}
+
+static const TypeInfo npcm7xx_adc_info = {
+    .name               = TYPE_NPCM7XX_ADC,
+    .parent             = TYPE_SYS_BUS_DEVICE,
+    .instance_size      = sizeof(NPCM7xxADCState),
+    .class_init         = npcm7xx_adc_class_init,
+    .instance_init      = npcm7xx_adc_init,
+};
+
+static void npcm7xx_adc_register_types(void)
+{
+    type_register_static(&npcm7xx_adc_info);
+}
+
+type_init(npcm7xx_adc_register_types);
diff --git a/hw/arm/npcm7xx.c b/hw/arm/npcm7xx.c
index fabfb1697ba..b22a8c966d3 100644
--- a/hw/arm/npcm7xx.c
+++ b/hw/arm/npcm7xx.c
@@ -51,6 +51,9 @@
 #define NPCM7XX_EHCI_BA         (0xf0806000)
 #define NPCM7XX_OHCI_BA         (0xf0807000)
 
+/* ADC Module */
+#define NPCM7XX_ADC_BA          (0xf000c000)
+
 /* Internal AHB SRAM */
 #define NPCM7XX_RAM3_BA         (0xc0008000)
 #define NPCM7XX_RAM3_SZ         (4 * KiB)
@@ -61,6 +64,7 @@
 #define NPCM7XX_ROM_BA          (0xffff0000)
 #define NPCM7XX_ROM_SZ          (64 * KiB)
 
+
 /* Clock configuration values to be fixed up when bypassing bootloader */
 
 /* Run PLL1 at 1600 MHz */
@@ -73,6 +77,7 @@
  * interrupts.
  */
 enum NPCM7xxInterrupt {
+    NPCM7XX_ADC_IRQ             = 0,
     NPCM7XX_UART0_IRQ           = 2,
     NPCM7XX_UART1_IRQ,
     NPCM7XX_UART2_IRQ,
@@ -296,6 +301,14 @@ static void npcm7xx_init_fuses(NPCM7xxState *s)
                             sizeof(value));
 }
 
+static void npcm7xx_write_adc_calibration(NPCM7xxState *s)
+{
+    /* Both ADC and the fuse array must have realized. */
+    QEMU_BUILD_BUG_ON(sizeof(s->adc.calibration_r_values) != 4);
+    npcm7xx_otp_array_write(&s->fuse_array, s->adc.calibration_r_values,
+            NPCM7XX_FUSE_ADC_CALIB, sizeof(s->adc.calibration_r_values));
+}
+
 static qemu_irq npcm7xx_irq(NPCM7xxState *s, int n)
 {
     return qdev_get_gpio_in(DEVICE(&s->a9mpcore), n);
@@ -322,6 +335,7 @@ static void npcm7xx_init(Object *obj)
                             TYPE_NPCM7XX_FUSE_ARRAY);
     object_initialize_child(obj, "mc", &s->mc, TYPE_NPCM7XX_MC);
     object_initialize_child(obj, "rng", &s->rng, TYPE_NPCM7XX_RNG);
+    object_initialize_child(obj, "adc", &s->adc, TYPE_NPCM7XX_ADC);
 
     for (i = 0; i < ARRAY_SIZE(s->tim); i++) {
         object_initialize_child(obj, "tim[*]", &s->tim[i], TYPE_NPCM7XX_TIMER);
@@ -414,6 +428,15 @@ static void npcm7xx_realize(DeviceState *dev, Error **errp)
     sysbus_realize(SYS_BUS_DEVICE(&s->mc), &error_abort);
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->mc), 0, NPCM7XX_MC_BA);
 
+    /* ADC Modules. Cannot fail. */
+    qdev_connect_clock_in(DEVICE(&s->adc), "clock", qdev_get_clock_out(
+                          DEVICE(&s->clk), "adc-clock"));
+    sysbus_realize(SYS_BUS_DEVICE(&s->adc), &error_abort);
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->adc), 0, NPCM7XX_ADC_BA);
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->adc), 0,
+            npcm7xx_irq(s, NPCM7XX_ADC_IRQ));
+    npcm7xx_write_adc_calibration(s);
+
     /* Timer Modules (TIM). Cannot fail. */
     QEMU_BUILD_BUG_ON(ARRAY_SIZE(npcm7xx_tim_addr) != ARRAY_SIZE(s->tim));
     for (i = 0; i < ARRAY_SIZE(s->tim); i++) {
@@ -528,7 +551,6 @@ static void npcm7xx_realize(DeviceState *dev, Error **errp)
     create_unimplemented_device("npcm7xx.vdmx",         0xe0800000,   4 * KiB);
     create_unimplemented_device("npcm7xx.pcierc",       0xe1000000,  64 * KiB);
     create_unimplemented_device("npcm7xx.kcs",          0xf0007000,   4 * KiB);
-    create_unimplemented_device("npcm7xx.adc",          0xf000c000,   4 * KiB);
     create_unimplemented_device("npcm7xx.gfxi",         0xf000e000,   4 * KiB);
     create_unimplemented_device("npcm7xx.gpio[0]",      0xf0010000,   4 * KiB);
     create_unimplemented_device("npcm7xx.gpio[1]",      0xf0011000,   4 * KiB);
diff --git a/tests/qtest/npcm7xx_adc-test.c b/tests/qtest/npcm7xx_adc-test.c
new file mode 100644
index 00000000000..f0297069459
--- /dev/null
+++ b/tests/qtest/npcm7xx_adc-test.c
@@ -0,0 +1,377 @@
+/*
+ * QTests for Nuvoton NPCM7xx ADCModules.
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
+#include "qemu/bitops.h"
+#include "qemu/timer.h"
+#include "libqos/libqtest.h"
+#include "qapi/qmp/qdict.h"
+
+#define REF_HZ          (25000000)
+
+#define CON_OFFSET      0x0
+#define DATA_OFFSET     0x4
+
+#define NUM_INPUTS      8
+#define DEFAULT_IREF    2000000
+#define CONV_CYCLES     20
+#define RESET_CYCLES    10
+#define R0_INPUT        500000
+#define R1_INPUT        1500000
+#define MAX_RESULT      1023
+
+#define DEFAULT_CLKDIV  5
+
+#define FUSE_ARRAY_BA   0xf018a000
+#define FCTL_OFFSET     0x14
+#define FST_OFFSET      0x0
+#define FADDR_OFFSET    0x4
+#define FDATA_OFFSET    0x8
+#define ADC_CALIB_ADDR  24
+#define FUSE_READ       0x2
+
+/* Register field definitions. */
+#define CON_MUX(rv) ((rv) << 24)
+#define CON_INT_EN  BIT(21)
+#define CON_REFSEL  BIT(19)
+#define CON_INT     BIT(18)
+#define CON_EN      BIT(17)
+#define CON_RST     BIT(16)
+#define CON_CONV    BIT(14)
+#define CON_DIV(rv) extract32(rv, 1, 8)
+
+#define FST_RDST    BIT(1)
+#define FDATA_MASK  0xff
+
+#define MAX_ERROR   10000
+#define MIN_CALIB_INPUT 100000
+#define MAX_CALIB_INPUT 1800000
+
+static const uint32_t input_list[] = {
+    100000,
+    500000,
+    1000000,
+    1500000,
+    1800000,
+    2000000,
+};
+
+static const uint32_t vref_list[] = {
+    2000000,
+    2200000,
+    2500000,
+};
+
+static const uint32_t iref_list[] = {
+    1800000,
+    1900000,
+    2000000,
+    2100000,
+    2200000,
+};
+
+static const uint32_t div_list[] = {0, 1, 3, 7, 15};
+
+typedef struct ADC {
+    int irq;
+    uint64_t base_addr;
+} ADC;
+
+ADC adc = {
+    .irq        = 0,
+    .base_addr  = 0xf000c000
+};
+
+static uint32_t adc_read_con(QTestState *qts, const ADC *adc)
+{
+    return qtest_readl(qts, adc->base_addr + CON_OFFSET);
+}
+
+static void adc_write_con(QTestState *qts, const ADC *adc, uint32_t value)
+{
+    qtest_writel(qts, adc->base_addr + CON_OFFSET, value);
+}
+
+static uint32_t adc_read_data(QTestState *qts, const ADC *adc)
+{
+    return qtest_readl(qts, adc->base_addr + DATA_OFFSET);
+}
+
+static uint32_t adc_calibrate(uint32_t measured, uint32_t *rv)
+{
+    return R0_INPUT + (R1_INPUT - R0_INPUT) * (int32_t)(measured - rv[0])
+        / (int32_t)(rv[1] - rv[0]);
+}
+
+static void adc_qom_set(QTestState *qts, const ADC *adc,
+        const char *name, uint32_t value)
+{
+    QDict *response;
+    const char *path = "/machine/soc/adc";
+
+    g_test_message("Setting properties %s of %s with value %u",
+            name, path, value);
+    response = qtest_qmp(qts, "{ 'execute': 'qom-set',"
+            " 'arguments': { 'path': %s, 'property': %s, 'value': %u}}",
+            path, name, value);
+    /* The qom set message returns successfully. */
+    g_assert_true(qdict_haskey(response, "return"));
+}
+
+static void adc_write_input(QTestState *qts, const ADC *adc,
+        uint32_t index, uint32_t value)
+{
+    char name[100];
+
+    sprintf(name, "adci[%u]", index);
+    adc_qom_set(qts, adc, name, value);
+}
+
+static void adc_write_vref(QTestState *qts, const ADC *adc, uint32_t value)
+{
+    adc_qom_set(qts, adc, "vref", value);
+}
+
+static uint32_t adc_calculate_output(uint32_t input, uint32_t ref)
+{
+    uint32_t output;
+
+    g_assert_cmpuint(input, <=, ref);
+    output = (input * (MAX_RESULT + 1)) / ref;
+    if (output > MAX_RESULT) {
+        output = MAX_RESULT;
+    }
+
+    return output;
+}
+
+static uint32_t adc_prescaler(QTestState *qts, const ADC *adc)
+{
+    uint32_t div = extract32(adc_read_con(qts, adc), 1, 8);
+
+    return 2 * (div + 1);
+}
+
+static int64_t adc_calculate_steps(uint32_t cycles, uint32_t prescale,
+        uint32_t clkdiv)
+{
+    return (NANOSECONDS_PER_SECOND / (REF_HZ >> clkdiv)) * cycles * prescale;
+}
+
+static void adc_wait_conv_finished(QTestState *qts, const ADC *adc,
+        uint32_t clkdiv)
+{
+    uint32_t prescaler = adc_prescaler(qts, adc);
+
+    /*
+     * ADC should takes roughly 20 cycles to convert one sample. So we assert it
+     * should take 10~30 cycles here.
+     */
+    qtest_clock_step(qts, adc_calculate_steps(CONV_CYCLES / 2, prescaler,
+                clkdiv));
+    /* ADC is still converting. */
+    g_assert_true(adc_read_con(qts, adc) & CON_CONV);
+    qtest_clock_step(qts, adc_calculate_steps(CONV_CYCLES, prescaler, clkdiv));
+    /* ADC has finished conversion. */
+    g_assert_false(adc_read_con(qts, adc) & CON_CONV);
+}
+
+/* Check ADC can be reset to default value. */
+static void test_init(gconstpointer adc_p)
+{
+    const ADC *adc = adc_p;
+
+    QTestState *qts = qtest_init("-machine quanta-gsj");
+    adc_write_con(qts, adc, CON_REFSEL | CON_INT);
+    g_assert_cmphex(adc_read_con(qts, adc), ==, CON_REFSEL);
+    qtest_quit(qts);
+}
+
+/* Check ADC can convert from an internal reference. */
+static void test_convert_internal(gconstpointer adc_p)
+{
+    const ADC *adc = adc_p;
+    uint32_t index, input, output, expected_output;
+    QTestState *qts = qtest_init("-machine quanta-gsj");
+    qtest_irq_intercept_in(qts, "/machine/soc/a9mpcore/gic");
+
+    for (index = 0; index < NUM_INPUTS; ++index) {
+        for (size_t i = 0; i < ARRAY_SIZE(input_list); ++i) {
+            input = input_list[i];
+            expected_output = adc_calculate_output(input, DEFAULT_IREF);
+
+            adc_write_input(qts, adc, index, input);
+            adc_write_con(qts, adc, CON_MUX(index) | CON_REFSEL | CON_INT |
+                    CON_EN | CON_CONV);
+            adc_wait_conv_finished(qts, adc, DEFAULT_CLKDIV);
+            g_assert_cmphex(adc_read_con(qts, adc), ==, CON_MUX(index) |
+                    CON_REFSEL | CON_EN);
+            g_assert_false(qtest_get_irq(qts, adc->irq));
+            output = adc_read_data(qts, adc);
+            g_assert_cmpuint(output, ==, expected_output);
+        }
+    }
+
+    qtest_quit(qts);
+}
+
+/* Check ADC can convert from an external reference. */
+static void test_convert_external(gconstpointer adc_p)
+{
+    const ADC *adc = adc_p;
+    uint32_t index, input, vref, output, expected_output;
+    QTestState *qts = qtest_init("-machine quanta-gsj");
+    qtest_irq_intercept_in(qts, "/machine/soc/a9mpcore/gic");
+
+    for (index = 0; index < NUM_INPUTS; ++index) {
+        for (size_t i = 0; i < ARRAY_SIZE(input_list); ++i) {
+            for (size_t j = 0; j < ARRAY_SIZE(vref_list); ++j) {
+                input = input_list[i];
+                vref = vref_list[j];
+                expected_output = adc_calculate_output(input, vref);
+
+                adc_write_input(qts, adc, index, input);
+                adc_write_vref(qts, adc, vref);
+                adc_write_con(qts, adc, CON_MUX(index) | CON_INT | CON_EN |
+                        CON_CONV);
+                adc_wait_conv_finished(qts, adc, DEFAULT_CLKDIV);
+                g_assert_cmphex(adc_read_con(qts, adc), ==,
+                        CON_MUX(index) | CON_EN);
+                g_assert_false(qtest_get_irq(qts, adc->irq));
+                output = adc_read_data(qts, adc);
+                g_assert_cmpuint(output, ==, expected_output);
+            }
+        }
+    }
+
+    qtest_quit(qts);
+}
+
+/* Check ADC interrupt files if and only if CON_INT_EN is set. */
+static void test_interrupt(gconstpointer adc_p)
+{
+    const ADC *adc = adc_p;
+    uint32_t index, input, output, expected_output;
+    QTestState *qts = qtest_init("-machine quanta-gsj");
+
+    index = 1;
+    input = input_list[1];
+    expected_output = adc_calculate_output(input, DEFAULT_IREF);
+
+    qtest_irq_intercept_in(qts, "/machine/soc/a9mpcore/gic");
+    adc_write_input(qts, adc, index, input);
+    g_assert_false(qtest_get_irq(qts, adc->irq));
+    adc_write_con(qts, adc, CON_MUX(index) | CON_INT_EN | CON_REFSEL | CON_INT
+            | CON_EN | CON_CONV);
+    adc_wait_conv_finished(qts, adc, DEFAULT_CLKDIV);
+    g_assert_cmphex(adc_read_con(qts, adc), ==, CON_MUX(index) | CON_INT_EN
+            | CON_REFSEL | CON_INT | CON_EN);
+    g_assert_true(qtest_get_irq(qts, adc->irq));
+    output = adc_read_data(qts, adc);
+    g_assert_cmpuint(output, ==, expected_output);
+
+    qtest_quit(qts);
+}
+
+/* Check ADC is reset after setting ADC_RST for 10 ADC cycles. */
+static void test_reset(gconstpointer adc_p)
+{
+    const ADC *adc = adc_p;
+    QTestState *qts = qtest_init("-machine quanta-gsj");
+
+    for (size_t i = 0; i < ARRAY_SIZE(div_list); ++i) {
+        uint32_t div = div_list[i];
+
+        adc_write_con(qts, adc, CON_INT | CON_EN | CON_RST | CON_DIV(div));
+        qtest_clock_step(qts, adc_calculate_steps(RESET_CYCLES,
+                    adc_prescaler(qts, adc), DEFAULT_CLKDIV));
+        g_assert_false(adc_read_con(qts, adc) & CON_EN);
+    }
+    qtest_quit(qts);
+}
+
+/* Check ADC Calibration works as desired. */
+static void test_calibrate(gconstpointer adc_p)
+{
+    int i, j;
+    const ADC *adc = adc_p;
+
+    for (j = 0; j < ARRAY_SIZE(iref_list); ++j) {
+        uint32_t iref = iref_list[j];
+        uint32_t expected_rv[] = {
+            adc_calculate_output(R0_INPUT, iref),
+            adc_calculate_output(R1_INPUT, iref),
+        };
+        char buf[100];
+        QTestState *qts;
+
+        sprintf(buf, "-machine quanta-gsj -global npcm7xx-adc.iref=%u", iref);
+        qts = qtest_init(buf);
+
+        /* Check the converted value is correct using the calibration value. */
+        for (i = 0; i < ARRAY_SIZE(input_list); ++i) {
+            uint32_t input;
+            uint32_t output;
+            uint32_t expected_output;
+            uint32_t calibrated_voltage;
+            uint32_t index = 0;
+
+            input = input_list[i];
+            /* Calibration only works for input range 0.1V ~ 1.8V. */
+            if (input < MIN_CALIB_INPUT || input > MAX_CALIB_INPUT) {
+                continue;
+            }
+            expected_output = adc_calculate_output(input, iref);
+
+            adc_write_input(qts, adc, index, input);
+            adc_write_con(qts, adc, CON_MUX(index) | CON_REFSEL | CON_INT |
+                    CON_EN | CON_CONV);
+            adc_wait_conv_finished(qts, adc, DEFAULT_CLKDIV);
+            g_assert_cmphex(adc_read_con(qts, adc), ==,
+                    CON_REFSEL | CON_MUX(index) | CON_EN);
+            output = adc_read_data(qts, adc);
+            g_assert_cmpuint(output, ==, expected_output);
+
+            calibrated_voltage = adc_calibrate(output, expected_rv);
+            g_assert_cmpuint(calibrated_voltage, >, input - MAX_ERROR);
+            g_assert_cmpuint(calibrated_voltage, <, input + MAX_ERROR);
+        }
+
+        qtest_quit(qts);
+    }
+}
+
+static void adc_add_test(const char *name, const ADC* wd,
+        GTestDataFunc fn)
+{
+    g_autofree char *full_name = g_strdup_printf("npcm7xx_adc/%s",  name);
+    qtest_add_data_func(full_name, wd, fn);
+}
+#define add_test(name, td) adc_add_test(#name, td, test_##name)
+
+int main(int argc, char **argv)
+{
+    g_test_init(&argc, &argv, NULL);
+
+    add_test(init, &adc);
+    add_test(convert_internal, &adc);
+    add_test(convert_external, &adc);
+    add_test(interrupt, &adc);
+    add_test(reset, &adc);
+    add_test(calibrate, &adc);
+
+    return g_test_run();
+}
diff --git a/hw/adc/meson.build b/hw/adc/meson.build
index 0d62ae96ae9..6ddee238139 100644
--- a/hw/adc/meson.build
+++ b/hw/adc/meson.build
@@ -1 +1,2 @@
 softmmu_ss.add(when: 'CONFIG_STM32F2XX_ADC', if_true: files('stm32f2xx_adc.c'))
+softmmu_ss.add(when: 'CONFIG_NPCM7XX', if_true: files('npcm7xx_adc.c'))
diff --git a/hw/adc/trace-events b/hw/adc/trace-events
new file mode 100644
index 00000000000..4c3279ece2c
--- /dev/null
+++ b/hw/adc/trace-events
@@ -0,0 +1,5 @@
+# See docs/devel/tracing.txt for syntax documentation.
+
+# npcm7xx_adc.c
+npcm7xx_adc_read(const char *id, uint64_t offset, uint32_t value) " %s offset: 0x%04" PRIx64 " value 0x%04" PRIx32
+npcm7xx_adc_write(const char *id, uint64_t offset, uint32_t value) "%s offset: 0x%04" PRIx64 " value 0x%04" PRIx32
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 6a67c538be1..955710d1c5d 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -134,7 +134,8 @@ qtests_sparc64 = \
   ['prom-env-test', 'boot-serial-test']
 
 qtests_npcm7xx = \
-  ['npcm7xx_gpio-test',
+  ['npcm7xx_adc-test',
+   'npcm7xx_gpio-test',
    'npcm7xx_rng-test',
    'npcm7xx_timer-test',
    'npcm7xx_watchdog_timer-test']
-- 
2.20.1


