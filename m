Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0619E381B53
	for <lists+qemu-devel@lfdr.de>; Sun, 16 May 2021 00:12:17 +0200 (CEST)
Received: from localhost ([::1]:55498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1li2W7-00076g-Vm
	for lists+qemu-devel@lfdr.de; Sat, 15 May 2021 18:12:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mrolnik@gmail.com>) id 1li2U4-0004qV-5u
 for qemu-devel@nongnu.org; Sat, 15 May 2021 18:10:08 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:42877)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mrolnik@gmail.com>) id 1li2U1-0008SK-0J
 for qemu-devel@nongnu.org; Sat, 15 May 2021 18:10:07 -0400
Received: by mail-wr1-x430.google.com with SMTP id x8so2545509wrq.9
 for <qemu-devel@nongnu.org>; Sat, 15 May 2021 15:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TP0RgiK6WkCQ6+cnI0p4id7QRzplk6h0tUaIwyIoqSo=;
 b=gi+RqIUTwz0GFtWT9NJbIrR2oh6bqlxlGdZW63MZRXd2vHG48CiBeTYoVPEuiONWsm
 5Uj+Jk8w9lm/xlhsoPL6PWDp/prod3Ghs1gmbIwaVAx0jcFxuLo5z8QY6+1thAS8+1BY
 jJGBusbAR1hw3fJqPc4RxWfdNrKwOJLjREg/5cXhtBnPSMkViYsidO2BP57HVg1wyjVv
 aWTkN3GFbcuedYS/u+4vFMDO/lqZWs+BOs3ylsvbZtlP78WdC8X6kd6fraDmwLBln1MG
 iSCFp9K6181ehLcEcOEf5kUNcylNSlx0yieYn36Ce09jmlGQG6Fe7XLS7HenI8SWU27u
 45fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TP0RgiK6WkCQ6+cnI0p4id7QRzplk6h0tUaIwyIoqSo=;
 b=II7ujnxl+beBbbq2XufLpVcXFKym0zlMR/xID6XwBh1mE0nSDfd4IYLO/G+1e3BVBB
 mB+AZeHkoWWlslNI+tYMQNlCO/z2QeMXbvIF/MuX5ImGGx+xTeMO9TEBZL4mxe+GiEgi
 bGl9/ZRiJpWrQJIL2olTLoOlu7Px0jA8oDz1Z1QaASv3uNcgRDvByEc8p78MRbIJdalS
 W6PJXJakJ6OrglsDcP3dk+AFgdoQg27kw3c90nV/yZDq/Ohm3aN5BPM14tkT+67P9Pke
 EoaFfhl664vxLAs9mBg1JvNd6Sf6HIAXDYkPp5HDXAc9uSwslkG0MSlg5FVAhjx0g6eG
 eLOQ==
X-Gm-Message-State: AOAM531s+BIu7HR/jQPy53586pcqoLBj6qACJb6BAbhw8rYcBo4c+r+5
 WhUKlKEeqNJHc9wEaTvIT0wGfOileAP7zg==
X-Google-Smtp-Source: ABdhPJzbeXF/0W8w95QgZ3sfgmn+cgpYrITAvykMHzwZ/konOzbilZUyEz4aNtwCZc1B3XaCOA+Yvg==
X-Received: by 2002:a5d:570c:: with SMTP id a12mr13138570wrv.354.1621116603171; 
 Sat, 15 May 2021 15:10:03 -0700 (PDT)
Received: from localhost.localdomain ([2001:4df4:24b:2f00:952c:e8b5:99dc:4d3e])
 by smtp.gmail.com with ESMTPSA id r7sm8216022wmq.18.2021.05.15.15.10.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 May 2021 15:10:02 -0700 (PDT)
From: Michael Rolnik <mrolnik@gmail.com>
To: qemu-devel@nongnu.org
Subject: [RFC v3 1/1] Implement AVR watchdog timer
Date: Sun, 16 May 2021 01:09:57 +0300
Message-Id: <20210515220957.13053-2-mrolnik@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210515220957.13053-1-mrolnik@gmail.com>
References: <20210515220957.13053-1-mrolnik@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=mrolnik@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Michael Rolnik <mrolnik@gmail.com>, me@xcancerberox.com.ar,
 konrad@adacore.com, richard.henderson@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Michael Rolnik <mrolnik@gmail.com>
---
 MAINTAINERS                   |   2 +
 hw/avr/Kconfig                |   1 +
 hw/avr/atmega.c               |  15 +-
 hw/avr/atmega.h               |   2 +
 hw/watchdog/Kconfig           |   3 +
 hw/watchdog/avr_wdt.c         | 279 ++++++++++++++++++++++++++++++++++
 hw/watchdog/meson.build       |   2 +
 hw/watchdog/trace-events      |   5 +
 include/hw/watchdog/avr_wdt.h |  47 ++++++
 target/avr/cpu.c              |   3 +
 target/avr/cpu.h              |   1 +
 target/avr/helper.c           |   7 +-
 target/avr/translate.c        |  58 ++++++-
 13 files changed, 419 insertions(+), 6 deletions(-)
 create mode 100644 hw/watchdog/avr_wdt.c
 create mode 100644 include/hw/watchdog/avr_wdt.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 78561a223f..e53bccfa9a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1036,6 +1036,8 @@ F: include/hw/timer/avr_timer16.h
 F: hw/timer/avr_timer16.c
 F: include/hw/misc/avr_power.h
 F: hw/misc/avr_power.c
+F: include/hw/watchdog/avr_wdt.h
+F: hw/watchdog/avr_wdt.c
 
 Arduino
 M: Philippe Mathieu-Daudé <f4bug@amsat.org>
diff --git a/hw/avr/Kconfig b/hw/avr/Kconfig
index d31298c3cc..9939e4902f 100644
--- a/hw/avr/Kconfig
+++ b/hw/avr/Kconfig
@@ -3,6 +3,7 @@ config AVR_ATMEGA_MCU
     select AVR_TIMER16
     select AVR_USART
     select AVR_POWER
+    select AVR_WDT
 
 config ARDUINO
     select AVR_ATMEGA_MCU
diff --git a/hw/avr/atmega.c b/hw/avr/atmega.c
index 80b8a41cb5..0932f781ff 100644
--- a/hw/avr/atmega.c
+++ b/hw/avr/atmega.c
@@ -27,6 +27,7 @@ enum AtmegaPeripheral {
     GPIOG, GPIOH, GPIOI, GPIOJ, GPIOK, GPIOL,
     USART0, USART1, USART2, USART3,
     TIMER0, TIMER1, TIMER2, TIMER3, TIMER4, TIMER5,
+    WDT,
     PERIFMAX
 };
 
@@ -74,6 +75,7 @@ static const peripheral_cfg dev168_328[PERIFMAX] = {
     [GPIOD]         = {  0x29 },
     [GPIOC]         = {  0x26 },
     [GPIOB]         = {  0x23 },
+    [WDT]           = {  0x60 },
 }, dev1280_2560[PERIFMAX] = {
     [USART3]        = { 0x130, POWER1, 2 },
     [TIMER5]        = { 0x120, POWER1, 5, 0x73, 0x3a, true },
@@ -98,6 +100,7 @@ static const peripheral_cfg dev168_328[PERIFMAX] = {
     [GPIOC]         = {  0x26 },
     [GPIOB]         = {  0x23 },
     [GPIOA]         = {  0x20 },
+    [WDT]           = {  0x60 },
 };
 
 enum AtmegaIrq {
@@ -117,6 +120,7 @@ enum AtmegaIrq {
         TIMER4_COMPC_IRQ, TIMER4_OVF_IRQ,
     TIMER5_CAPT_IRQ, TIMER5_COMPA_IRQ, TIMER5_COMPB_IRQ,
         TIMER5_COMPC_IRQ, TIMER5_OVF_IRQ,
+    WATCHDOG_TIMER_IRQ,
     IRQ_COUNT
 };
 
@@ -132,6 +136,7 @@ enum AtmegaIrq {
 #define TIMER_OVF_IRQ(n)    (n * TIMER_IRQ_COUNT + TIMER0_OVF_IRQ)
 
 static const uint8_t irq168_328[IRQ_COUNT] = {
+    [WATCHDOG_TIMER_IRQ]    = 7,
     [TIMER2_COMPA_IRQ]      = 8,
     [TIMER2_COMPB_IRQ]      = 9,
     [TIMER2_OVF_IRQ]        = 10,
@@ -146,6 +151,7 @@ static const uint8_t irq168_328[IRQ_COUNT] = {
     [USART0_DRE_IRQ]        = 20,
     [USART0_TXC_IRQ]        = 21,
 }, irq1280_2560[IRQ_COUNT] = {
+    [WATCHDOG_TIMER_IRQ]    = 13,
     [TIMER2_COMPA_IRQ]      = 14,
     [TIMER2_COMPB_IRQ]      = 15,
     [TIMER2_OVF_IRQ]        = 16,
@@ -343,10 +349,17 @@ static void atmega_realize(DeviceState *dev, Error **errp)
         g_free(devname);
     }
 
+    /* Watchdog Timer */
+    object_initialize_child(OBJECT(dev), "wdt", &s->wdt, TYPE_AVR_WDT);
+    sysbus_realize(SYS_BUS_DEVICE(&s->wdt), &error_abort);
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->wdt), 0,
+                    OFFSET_DATA + mc->dev[WDT].addr);
+    qdev_connect_gpio_out_named(cpudev, "wdr", 0,
+                    qdev_get_gpio_in_named(DEVICE(&s->wdt), "wdr", 0));
+
     create_unimplemented_device("avr-twi",          OFFSET_DATA + 0x0b8, 6);
     create_unimplemented_device("avr-adc",          OFFSET_DATA + 0x078, 8);
     create_unimplemented_device("avr-ext-mem-ctrl", OFFSET_DATA + 0x074, 2);
-    create_unimplemented_device("avr-watchdog",     OFFSET_DATA + 0x060, 1);
     create_unimplemented_device("avr-spi",          OFFSET_DATA + 0x04c, 3);
     create_unimplemented_device("avr-eeprom",       OFFSET_DATA + 0x03f, 3);
 }
diff --git a/hw/avr/atmega.h b/hw/avr/atmega.h
index a99ee15c7e..60bbd44bdd 100644
--- a/hw/avr/atmega.h
+++ b/hw/avr/atmega.h
@@ -13,6 +13,7 @@
 
 #include "hw/char/avr_usart.h"
 #include "hw/timer/avr_timer16.h"
+#include "hw/watchdog/avr_wdt.h"
 #include "hw/misc/avr_power.h"
 #include "target/avr/cpu.h"
 #include "qom/object.h"
@@ -45,6 +46,7 @@ struct AtmegaMcuState {
     AVRMaskState pwr[POWER_MAX];
     AVRUsartState usart[USART_MAX];
     AVRTimer16State timer[TIMER_MAX];
+    AVRWatchdogState wdt;
     uint64_t xtal_freq_hz;
 };
 
diff --git a/hw/watchdog/Kconfig b/hw/watchdog/Kconfig
index 66e1d029e3..e0f89d2fe0 100644
--- a/hw/watchdog/Kconfig
+++ b/hw/watchdog/Kconfig
@@ -20,3 +20,6 @@ config WDT_IMX2
 
 config WDT_SBSA
     bool
+
+config AVR_WDT
+    bool
diff --git a/hw/watchdog/avr_wdt.c b/hw/watchdog/avr_wdt.c
new file mode 100644
index 0000000000..4e14f734cd
--- /dev/null
+++ b/hw/watchdog/avr_wdt.c
@@ -0,0 +1,279 @@
+/*
+ * AVR watchdog
+ *
+ * Copyright (c) 2021 Michael Rolnik
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2.1 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see
+ * <http://www.gnu.org/licenses/lgpl-2.1.html>
+ */
+
+#include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "qemu/log.h"
+#include "hw/irq.h"
+#include "hw/watchdog/avr_wdt.h"
+#include "trace.h"
+#include "target/avr/cpu.h"
+#include "sysemu/runstate.h"
+#include "migration/vmstate.h"
+#include "hw/registerfields.h"
+
+REG8(CSR, 0x00)
+    FIELD(CSR, WDP0, 0, 1)
+    FIELD(CSR, WDP1, 1, 1)
+    FIELD(CSR, WDP2, 2, 1)
+    FIELD(CSR, WDE,  3, 1)
+    FIELD(CSR, WDCE, 4, 1)
+    FIELD(CSR, WDP3, 5, 1)
+    FIELD(CSR, WDIE, 6, 1)
+    FIELD(CSR, WDIF, 7, 1)
+
+REG8(MCUSR, 0x55)
+    FIELD(MCUSR, WDRF, 2, 1)
+
+/* Helper macros */
+#define WDP0(csr)       FIELD_EX8(csr, CSR, WDP0)
+#define WDP1(csr)       FIELD_EX8(csr, CSR, WDP1)
+#define WDP2(csr)       FIELD_EX8(csr, CSR, WDP2)
+#define WDP3(csr)       FIELD_EX8(csr, CSR, WDP3)
+#define WDP(csr)        ((WDP3(csr) << 3) | (WDP2(csr) << 2) | \
+                         (WDP1(csr) << 1) | (WDP0(csr) << 0))
+#define WDIE(csr)       FIELD_EX8(csr, CSR, WDIE)
+#define WDE(csr)        FIELD_EX8(csr, CSR, WDE)
+#define WCE(csr)        FIELD_EX8(csr, CSR, WVE)
+
+#define DB_PRINT(fmt, args...) /* Nothing */
+
+#define MS2NS(n)        ((n) * 1000000ull)
+
+static void set_bits(uint8_t *addr, uint8_t bits)
+{
+    *addr |= bits;
+}
+
+static void rst_bits(uint8_t *addr, uint8_t bits)
+{
+    *addr &= ~bits;
+}
+
+static void avr_wdt_reset_alarm(AVRWatchdogState *wdt)
+{
+    uint32_t csr = wdt->csr;
+    int wdp = WDP(csr);
+
+    if (WDIE(csr) == 0 && WDE(csr) == 0) {
+        /* watchdog is stopped */
+        return;
+    }
+
+    timer_mod_ns(&wdt->timer, qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
+            (MS2NS(15) << wdp));
+}
+
+static void avr_wdt_interrupt(void *opaque)
+{
+    AVRWatchdogState *wdt = opaque;
+    int8_t csr = wdt->csr;
+
+    if (WDIE(csr) == 1) {
+        /* Interrupt Mode */
+        set_bits(&wdt->csr, R_CSR_WDIF_MASK);
+        qemu_set_irq(wdt->irq, 1);
+        rst_bits(&wdt->csr, R_CSR_WDIE_MASK);
+        trace_avr_wdt_interrupt();
+    }
+
+    if (WDE(csr) == 1) {
+        /* System Reset Mode */
+        qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_RESET);
+    }
+
+    avr_wdt_reset_alarm(wdt);
+}
+
+static void avr_wdt_reset(DeviceState *dev)
+{
+    AVRWatchdogState *wdt = AVR_WDT(dev);
+
+    wdt->csr = 0;
+    qemu_set_irq(wdt->irq, 0);
+    avr_wdt_reset_alarm(wdt);
+}
+
+static uint64_t avr_wdt_read(void *opaque, hwaddr offset, unsigned size)
+{
+    assert(size == 1);
+    AVRWatchdogState *wdt = opaque;
+    uint8_t retval = wdt->csr;
+
+    trace_avr_wdt_read(offset, retval);
+
+    return (uint64_t)retval;
+}
+
+static void avr_wdt_write(void *opaque, hwaddr offset,
+                              uint64_t val64, unsigned size)
+{
+    assert(size == 1);
+    AVRWatchdogState *wdt = opaque;
+    uint8_t val = (uint8_t)val64;
+    uint8_t set1 = val; /* bits that should be set to 1 */
+    uint8_t set0 = ~val;/* bits that should be set to 0 */
+    uint8_t mcusr = 0;
+
+    /*
+     *  Bit 7 - WDIF: Watchdog Interrupt Flag
+     *  This bit is set when a time-out occurs in the Watchdog Timer and the
+     *  Watchdog Timer is configured for interrupt. WDIF is cleared by hardware
+     *  when executing the corresponding interrupt handling vector.
+     *  Alternatively, WDIF is cleared by writing a logic one to the flag.
+     *  When the I-bit in SREG and WDIE are set, the Watchdog Time-out Interrupt
+     *  is executed.
+     */
+    if (val & R_CSR_WDIF_MASK) {
+        rst_bits(&set1, R_CSR_WDIF_MASK);  /* don't set 1 */
+        set_bits(&set0, R_CSR_WDIF_MASK);  /* set 0 */
+    } else {
+        rst_bits(&set1, R_CSR_WDIF_MASK);  /* don't set 1 */
+        rst_bits(&set0, R_CSR_WDIF_MASK);  /* don't set 0 */
+    }
+
+    /*
+     *  Bit 4 - WDCE: Watchdog Change Enable
+     *  This bit is used in timed sequences for changing WDE and prescaler
+     *  bits. To clear the WDE bit, and/or change the prescaler bits,
+     *  WDCE must be set.
+     *  Once written to one, hardware will clear WDCE after four clock cycles.
+     */
+    if (!(val & R_CSR_WDCE_MASK)) {
+        uint8_t bits = R_CSR_WDE_MASK | R_CSR_WDP0_MASK | R_CSR_WDP1_MASK |
+                       R_CSR_WDP2_MASK | R_CSR_WDP3_MASK;
+        rst_bits(&set1, bits);
+        rst_bits(&set0, bits);
+    }
+
+    /*
+     *  Bit 3 - WDE: Watchdog System Reset Enable
+     *  WDE is overridden by WDRF in MCUSR. This means that WDE is always set
+     *  when WDRF is set. To clear WDE, WDRF must be cleared first. This
+     *  feature ensures multiple resets during conditions causing failure, and
+     *  a safe start-up after the failure.
+     */
+    cpu_physical_memory_read(A_MCUSR, &mcusr, sizeof(mcusr));
+    if (mcusr & R_MCUSR_WDRF_MASK) {
+        set_bits(&set1, R_CSR_WDE_MASK);
+        rst_bits(&set0, R_CSR_WDE_MASK);
+    }
+
+    /*  update CSR value */
+    assert((set0 & set1) == 0);
+
+    val = wdt->csr;
+    set_bits(&val, set1);
+    rst_bits(&val, set0);
+    wdt->csr = val;
+    trace_avr_wdt_write(offset, val);
+    avr_wdt_reset_alarm(wdt);
+
+    /*
+     *  Bit 6 - WDIE: Watchdog Interrupt Enable
+     *  When this bit is written to one and the I-bit in the Status Register is
+     *  set, the Watchdog Interrupt is enabled. If WDE is cleared in
+     *  combination with this setting, the Watchdog Timer is in Interrupt Mode,
+     *  and the corresponding interrupt is executed if time-out in the Watchdog
+     *  Timer occurs.
+     *  If WDE is set, the Watchdog Timer is in Interrupt and System Reset Mode.
+     *  The first time-out in the Watchdog Timer will set WDIF. Executing the
+     *  corresponding interrupt vector will clear WDIE and WDIF automatically by
+     *  hardware (the Watchdog goes to System Reset Mode). This is useful for
+     *  keeping the Watchdog Timer security while using the interrupt. To stay
+     *  in Interrupt and System Reset Mode, WDIE must be set after each
+     *  interrupt. This should however not be done within the interrupt service
+     *  routine itself, as this might compromise the safety-function of the
+     *  Watchdog System Reset mode. If the interrupt is not executed before the
+     *  next time-out, a System Reset will be applied.
+     */
+    if ((val & R_CSR_WDIE_MASK) && (wdt->csr & R_CSR_WDIF_MASK)) {
+        avr_wdt_interrupt(opaque);
+    }
+}
+
+static const MemoryRegionOps avr_wdt_ops = {
+    .read = avr_wdt_read,
+    .write = avr_wdt_write,
+    .endianness = DEVICE_NATIVE_ENDIAN,
+    .impl = {.max_access_size = 1}
+};
+
+static void avr_wdt_wdr(void *opaque, int irq, int level)
+{
+    AVRWatchdogState *wdt = AVR_WDT(opaque);
+
+    avr_wdt_reset_alarm(wdt);
+}
+
+static void avr_wdt_init(Object *obj)
+{
+    AVRWatchdogState *s = AVR_WDT(obj);
+
+    sysbus_init_irq(SYS_BUS_DEVICE(obj), &s->irq);
+
+    memory_region_init_io(&s->iomem, obj, &avr_wdt_ops,
+                          s, "avr-wdt", 0xa);
+
+    sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->iomem);
+    qdev_init_gpio_in_named(DEVICE(s), avr_wdt_wdr, "wdr", 1);
+}
+
+static void avr_wdt_realize(DeviceState *dev, Error **errp)
+{
+    AVRWatchdogState *s = AVR_WDT(dev);
+
+    timer_init_ns(&s->timer, QEMU_CLOCK_VIRTUAL, avr_wdt_interrupt, s);
+}
+
+static const VMStateDescription avr_wdt_vmstate = {
+    .name = "avr-wdt",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_TIMER(timer, AVRWatchdogState),
+        VMSTATE_UINT8(csr, AVRWatchdogState),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static void avr_wdt_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->reset = avr_wdt_reset;
+    dc->realize = avr_wdt_realize;
+    dc->vmsd = &avr_wdt_vmstate;
+}
+
+static const TypeInfo avr_wdt_info = {
+    .name = TYPE_AVR_WDT,
+    .parent = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(AVRWatchdogState),
+    .instance_init = avr_wdt_init,
+    .class_init = avr_wdt_class_init,
+};
+
+static void avr_wdt_register_types(void)
+{
+    type_register_static(&avr_wdt_info);
+}
+
+type_init(avr_wdt_register_types)
diff --git a/hw/watchdog/meson.build b/hw/watchdog/meson.build
index 054c403dea..8db2be8317 100644
--- a/hw/watchdog/meson.build
+++ b/hw/watchdog/meson.build
@@ -6,3 +6,5 @@ softmmu_ss.add(when: 'CONFIG_WDT_DIAG288', if_true: files('wdt_diag288.c'))
 softmmu_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files('wdt_aspeed.c'))
 softmmu_ss.add(when: 'CONFIG_WDT_IMX2', if_true: files('wdt_imx2.c'))
 softmmu_ss.add(when: 'CONFIG_WDT_SBSA', if_true: files('sbsa_gwdt.c'))
+
+specific_ss.add(when: 'CONFIG_AVR_WDT', if_true: files('avr_wdt.c'))
diff --git a/hw/watchdog/trace-events b/hw/watchdog/trace-events
index 3124ca1f1b..ac14773179 100644
--- a/hw/watchdog/trace-events
+++ b/hw/watchdog/trace-events
@@ -5,3 +5,8 @@ cmsdk_apb_watchdog_read(uint64_t offset, uint64_t data, unsigned size) "CMSDK AP
 cmsdk_apb_watchdog_write(uint64_t offset, uint64_t data, unsigned size) "CMSDK APB watchdog write: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %u"
 cmsdk_apb_watchdog_reset(void) "CMSDK APB watchdog: reset"
 cmsdk_apb_watchdog_lock(uint32_t lock) "CMSDK APB watchdog: lock %" PRIu32
+
+# avr_wdt.c
+avr_wdt_read(uint8_t addr, uint8_t value) "wdt read addr:%u value:%u"
+avr_wdt_write(uint8_t addr, uint8_t value) "wdt write addr:%u value:%u"
+avr_wdt_interrupt(void) ""
diff --git a/include/hw/watchdog/avr_wdt.h b/include/hw/watchdog/avr_wdt.h
new file mode 100644
index 0000000000..006f9496fb
--- /dev/null
+++ b/include/hw/watchdog/avr_wdt.h
@@ -0,0 +1,47 @@
+/*
+ * AVR watchdog
+ *
+ * Copyright (c) 2021 Michael Rolnik
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2.1 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see
+ * <http://www.gnu.org/licenses/lgpl-2.1.html>
+ */
+
+#ifndef HW_WATCHDOG_AVR_WDT_H
+#define HW_WATCHDOG_AVR_WDT_H
+
+#include "hw/sysbus.h"
+#include "qemu/timer.h"
+#include "hw/hw.h"
+#include "qom/object.h"
+
+#define TYPE_AVR_WDT "avr-wdt"
+OBJECT_DECLARE_SIMPLE_TYPE(AVRWatchdogState, AVR_WDT)
+
+struct AVRWatchdogState {
+    /* <private> */
+    SysBusDevice parent_obj;
+
+    /* <public> */
+    MemoryRegion iomem;
+    MemoryRegion imsk_iomem;
+    MemoryRegion ifr_iomem;
+    QEMUTimer timer;
+    qemu_irq irq;
+
+    /* registers */
+    uint8_t csr;
+};
+
+#endif /* HW_WATCHDOG_AVR_WDT_H */
diff --git a/target/avr/cpu.c b/target/avr/cpu.c
index 0f4596932b..d5eb785833 100644
--- a/target/avr/cpu.c
+++ b/target/avr/cpu.c
@@ -131,6 +131,9 @@ static void avr_cpu_initfn(Object *obj)
     /* Set the number of interrupts supported by the CPU. */
     qdev_init_gpio_in(DEVICE(cpu), avr_cpu_set_int,
                       sizeof(cpu->env.intsrc) * 8);
+
+    /* register watchdog timer reset interrupt */
+    qdev_init_gpio_out_named(DEVICE(cpu), &cpu->wdr, "wdr", 1);
 }
 
 static ObjectClass *avr_cpu_class_by_name(const char *cpu_model)
diff --git a/target/avr/cpu.h b/target/avr/cpu.h
index d148e8c75a..f8f5641c8b 100644
--- a/target/avr/cpu.h
+++ b/target/avr/cpu.h
@@ -152,6 +152,7 @@ typedef struct AVRCPU {
 
     CPUNegativeOffsetState neg;
     CPUAVRState env;
+    qemu_irq wdr; /* reset WDT */
 } AVRCPU;
 
 extern const struct VMStateDescription vms_avr_cpu;
diff --git a/target/avr/helper.c b/target/avr/helper.c
index 35e1019594..dd88057e5f 100644
--- a/target/avr/helper.c
+++ b/target/avr/helper.c
@@ -24,6 +24,7 @@
 #include "exec/exec-all.h"
 #include "exec/address-spaces.h"
 #include "exec/helper-proto.h"
+#include "hw/irq.h"
 
 bool avr_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
 {
@@ -188,11 +189,9 @@ void helper_break(CPUAVRState *env)
 
 void helper_wdr(CPUAVRState *env)
 {
-    CPUState *cs = env_cpu(env);
+    AVRCPU *cpu = env_archcpu(env);
 
-    /* WD is not implemented yet, placeholder */
-    cs->exception_index = EXCP_DEBUG;
-    cpu_loop_exit(cs);
+    qemu_set_irq(cpu->wdr, 1);
 }
 
 /*
diff --git a/target/avr/translate.c b/target/avr/translate.c
index 850c5941d9..b32e640f6b 100644
--- a/target/avr/translate.c
+++ b/target/avr/translate.c
@@ -74,6 +74,7 @@ enum {
     DISAS_EXIT   = DISAS_TARGET_0,  /* We want return to the cpu main loop.  */
     DISAS_LOOKUP = DISAS_TARGET_1,  /* We have a variable condition exit.  */
     DISAS_CHAIN  = DISAS_TARGET_2,  /* We have a single condition exit.  */
+    DISAS_ICOUNT = DISAS_TARGET_3
 };
 
 typedef struct DisasContext DisasContext;
@@ -100,7 +101,7 @@ struct DisasContext {
      *     B   - instruction that can be skipped. this depends on execution of A
      * there are two scenarios
      * 1. A and B belong to the same translation block
-     * 2. A is the last instruction in the translation block and B is the last
+     * 2. A is the last instruction in the translation block and B is the first
      *
      * following variables are used to simplify the skipping logic, they are
      * used in the following manner (sketch)
@@ -1411,12 +1412,18 @@ static bool trans_SBIC(DisasContext *ctx, arg_SBIC *a)
 {
     TCGv temp = tcg_const_i32(a->reg);
 
+    if (ctx->tb->cflags & CF_USE_ICOUNT) {
+        gen_io_start();
+    }
+
     gen_helper_inb(temp, cpu_env, temp);
     tcg_gen_andi_tl(temp, temp, 1 << a->bit);
     ctx->skip_cond = TCG_COND_EQ;
     ctx->skip_var0 = temp;
     ctx->free_skip_var0 = true;
 
+    ctx->bstate = DISAS_ICOUNT;
+
     return true;
 }
 
@@ -1429,12 +1436,18 @@ static bool trans_SBIS(DisasContext *ctx, arg_SBIS *a)
 {
     TCGv temp = tcg_const_i32(a->reg);
 
+    if (ctx->tb->cflags & CF_USE_ICOUNT) {
+        gen_io_start();
+    }
+
     gen_helper_inb(temp, cpu_env, temp);
     tcg_gen_andi_tl(temp, temp, 1 << a->bit);
     ctx->skip_cond = TCG_COND_NE;
     ctx->skip_var0 = temp;
     ctx->free_skip_var0 = true;
 
+    ctx->bstate = DISAS_ICOUNT;
+
     return true;
 }
 
@@ -1611,7 +1624,11 @@ static TCGv gen_get_zaddr(void)
 static void gen_data_store(DisasContext *ctx, TCGv data, TCGv addr)
 {
     if (ctx->tb->flags & TB_FLAGS_FULL_ACCESS) {
+        if (ctx->tb->cflags & CF_USE_ICOUNT) {
+            gen_io_start();
+        }
         gen_helper_fullwr(cpu_env, data, addr);
+        ctx->bstate = DISAS_ICOUNT;
     } else {
         tcg_gen_qemu_st8(data, addr, MMU_DATA_IDX); /* mem[addr] = data */
     }
@@ -1620,7 +1637,11 @@ static void gen_data_store(DisasContext *ctx, TCGv data, TCGv addr)
 static void gen_data_load(DisasContext *ctx, TCGv data, TCGv addr)
 {
     if (ctx->tb->flags & TB_FLAGS_FULL_ACCESS) {
+        if (ctx->tb->cflags & CF_USE_ICOUNT) {
+            gen_io_start();
+        }
         gen_helper_fullrd(data, cpu_env, addr);
+        ctx->bstate = DISAS_ICOUNT;
     } else {
         tcg_gen_qemu_ld8u(data, addr, MMU_DATA_IDX); /* data = mem[addr] */
     }
@@ -2325,10 +2346,16 @@ static bool trans_IN(DisasContext *ctx, arg_IN *a)
     TCGv Rd = cpu_r[a->rd];
     TCGv port = tcg_const_i32(a->imm);
 
+    if (ctx->tb->cflags & CF_USE_ICOUNT) {
+        gen_io_start();
+    }
+
     gen_helper_inb(Rd, cpu_env, port);
 
     tcg_temp_free_i32(port);
 
+    ctx->bstate = DISAS_ICOUNT;
+
     return true;
 }
 
@@ -2341,10 +2368,16 @@ static bool trans_OUT(DisasContext *ctx, arg_OUT *a)
     TCGv Rd = cpu_r[a->rd];
     TCGv port = tcg_const_i32(a->imm);
 
+    if (ctx->tb->cflags & CF_USE_ICOUNT) {
+        gen_io_start();
+    }
+
     gen_helper_outb(cpu_env, port, Rd);
 
     tcg_temp_free_i32(port);
 
+    ctx->bstate = DISAS_ICOUNT;
+
     return true;
 }
 
@@ -2641,6 +2674,10 @@ static bool trans_SBI(DisasContext *ctx, arg_SBI *a)
     TCGv data = tcg_temp_new_i32();
     TCGv port = tcg_const_i32(a->reg);
 
+    if (ctx->tb->cflags & CF_USE_ICOUNT) {
+        gen_io_start();
+    }
+
     gen_helper_inb(data, cpu_env, port);
     tcg_gen_ori_tl(data, data, 1 << a->bit);
     gen_helper_outb(cpu_env, port, data);
@@ -2648,6 +2685,8 @@ static bool trans_SBI(DisasContext *ctx, arg_SBI *a)
     tcg_temp_free_i32(port);
     tcg_temp_free_i32(data);
 
+    ctx->bstate = DISAS_ICOUNT;
+
     return true;
 }
 
@@ -2660,6 +2699,10 @@ static bool trans_CBI(DisasContext *ctx, arg_CBI *a)
     TCGv data = tcg_temp_new_i32();
     TCGv port = tcg_const_i32(a->reg);
 
+    if (ctx->tb->cflags & CF_USE_ICOUNT) {
+        gen_io_start();
+    }
+
     gen_helper_inb(data, cpu_env, port);
     tcg_gen_andi_tl(data, data, ~(1 << a->bit));
     gen_helper_outb(cpu_env, port, data);
@@ -2667,6 +2710,8 @@ static bool trans_CBI(DisasContext *ctx, arg_CBI *a)
     tcg_temp_free_i32(data);
     tcg_temp_free_i32(port);
 
+    ctx->bstate = DISAS_ICOUNT;
+
     return true;
 }
 
@@ -2830,7 +2875,11 @@ static bool trans_SLEEP(DisasContext *ctx, arg_SLEEP *a)
  */
 static bool trans_WDR(DisasContext *ctx, arg_WDR *a)
 {
+    if (ctx->tb->cflags & CF_USE_ICOUNT) {
+        gen_io_start();
+    }
     gen_helper_wdr(cpu_env);
+    ctx->bstate = DISAS_ICOUNT;
 
     return true;
 }
@@ -2993,6 +3042,13 @@ void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns)
                 ctx.bstate = DISAS_CHAIN;
             }
         }
+
+        if (ctx.bstate == DISAS_ICOUNT) {
+            ctx.bstate = DISAS_NEXT;
+            if (tb->cflags & CF_USE_ICOUNT) {
+                break;
+            }
+        }
     } while (ctx.bstate == DISAS_NEXT
              && num_insns < max_insns
              && (ctx.npc - pc_start) * 2 < TARGET_PAGE_SIZE - 4
-- 
2.25.1


