Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3DC829A27A
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Oct 2020 03:02:32 +0100 (CET)
Received: from localhost ([::1]:48488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kXEJk-0003sB-1k
	for lists+qemu-devel@lfdr.de; Mon, 26 Oct 2020 22:02:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1kXEGs-0002PY-8p
 for qemu-devel@nongnu.org; Mon, 26 Oct 2020 21:59:34 -0400
Received: from mail-qv1-xf33.google.com ([2607:f8b0:4864:20::f33]:33192)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1kXEGp-0000zR-2n
 for qemu-devel@nongnu.org; Mon, 26 Oct 2020 21:59:33 -0400
Received: by mail-qv1-xf33.google.com with SMTP id w9so3541qvj.0
 for <qemu-devel@nongnu.org>; Mon, 26 Oct 2020 18:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=9Mf50yUYZ/3jVFW39UF6D+RCMZ4zdnsGlzvSeR7Kt0A=;
 b=PAOeORKDy0rMbcYpXJLCvX19pOlH605V9Q/CZqVvhnbA4+MOnsdpDkpfhuAC7FY1V/
 GZ6J2IBd3EWHdcEHCYUixvXMfLzfCDI6QXtvupeZb2DWY2XgOCgZMj/Z/kKjn0vOiZh8
 vh12ZyYQM4zO41X++PdzxNOAj5m6r2wpigTKR9gKLdkfubufKLGXHIcO8gCT7i6dFHdW
 SYBcv1AKIM8p24plUQQJNbIeMxKW3HPGpWWrI0aSZHR9/CJ7YBEuv+PSNG3JdQc1RtRK
 mfL6AJ4tyPTmPRjACJKVjjLrH4IlvDhJuXAU3zR6dZl73ZhIfoiWy2ykoi8BoVfhJ8Ka
 aJHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=9Mf50yUYZ/3jVFW39UF6D+RCMZ4zdnsGlzvSeR7Kt0A=;
 b=TWP8EKAB1dmLEYIKdMf+9ezyCEKKhP1ohRtPvYMcgrs871bRt5hCT3qJkggcgILgF0
 fhfWfasTZRnERJYS59FnKnKAIIwJnosnmUxS1pqcMFqBkiUUgu6dhM78srzgSeN2+W9o
 cHeFrzpp+VZUm6vc9ARlMsb/Xe6vbkfditkuklx5kwOhcX/3NMh0IyBy8u+So0NVGV6W
 XdnaDSRDVXh2U4dvV/U3fURXSbtHKbyM6TEkyDMzRGstbYVZ4CNMkebwTjdNvcg55dfu
 /sTKybwqbb0ocvNsruTqhCNX97RhVLDzK1SEcg1/3O4hKXrq9qmTby7JtjlZCIoGw4H8
 JqzA==
X-Gm-Message-State: AOAM530Rl605a/qn18NQOUzS/bdEaSAVoNLPOIgayhssQ9kXZifD7gPn
 pxB9BIJMR70dsf2+sRfhfAq7Mw==
X-Google-Smtp-Source: ABdhPJwftJ3Zxkr6hR3j2emMOwSyTy8I+PDINjb9udGtKyB8N5c3cU62zAJBIz6lv/0bWE2Oe0Md8Q==
X-Received: by 2002:a05:6214:180d:: with SMTP id
 o13mr155976qvw.34.1603763970120; 
 Mon, 26 Oct 2020 18:59:30 -0700 (PDT)
Received: from localhost.localdomain ([142.114.143.244])
 by smtp.googlemail.com with ESMTPSA id 61sm19317qta.19.2020.10.26.18.59.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Oct 2020 18:59:29 -0700 (PDT)
From: Shashi Mallela <shashi.mallela@linaro.org>
To: peter.maydell@linaro.org,
	leif@nuviainc.com,
	rad@semihalf.com
Subject: [PATCH v8 1/2] hw/watchdog: Implement SBSA watchdog device
Date: Mon, 26 Oct 2020 21:59:26 -0400
Message-Id: <20201027015927.29495-2-shashi.mallela@linaro.org>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20201027015927.29495-1-shashi.mallela@linaro.org>
References: <20201027015927.29495-1-shashi.mallela@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::f33;
 envelope-from=shashi.mallela@linaro.org; helo=mail-qv1-xf33.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Generic watchdog device model implementation as per ARM SBSA v6.0

Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
---
 hw/arm/Kconfig                  |   1 +
 hw/watchdog/Kconfig             |   3 +
 hw/watchdog/meson.build         |   1 +
 hw/watchdog/sbsa_gwdt.c         | 293 ++++++++++++++++++++++++++++++++
 include/hw/watchdog/sbsa_gwdt.h |  79 +++++++++
 5 files changed, 377 insertions(+)
 create mode 100644 hw/watchdog/sbsa_gwdt.c
 create mode 100644 include/hw/watchdog/sbsa_gwdt.h

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 7d040827af4f..0ef9e3c1d5f5 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -211,6 +211,7 @@ config SBSA_REF
     select PL031 # RTC
     select PL061 # GPIO
     select USB_EHCI_SYSBUS
+    select WDT_SBSA
 
 config SABRELITE
     bool
diff --git a/hw/watchdog/Kconfig b/hw/watchdog/Kconfig
index 293209b291d6..66e1d029e32e 100644
--- a/hw/watchdog/Kconfig
+++ b/hw/watchdog/Kconfig
@@ -17,3 +17,6 @@ config WDT_DIAG288
 
 config WDT_IMX2
     bool
+
+config WDT_SBSA
+    bool
diff --git a/hw/watchdog/meson.build b/hw/watchdog/meson.build
index 9b8725e64288..054c403dea7c 100644
--- a/hw/watchdog/meson.build
+++ b/hw/watchdog/meson.build
@@ -5,3 +5,4 @@ softmmu_ss.add(when: 'CONFIG_WDT_IB700', if_true: files('wdt_ib700.c'))
 softmmu_ss.add(when: 'CONFIG_WDT_DIAG288', if_true: files('wdt_diag288.c'))
 softmmu_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files('wdt_aspeed.c'))
 softmmu_ss.add(when: 'CONFIG_WDT_IMX2', if_true: files('wdt_imx2.c'))
+softmmu_ss.add(when: 'CONFIG_WDT_SBSA', if_true: files('sbsa_gwdt.c'))
diff --git a/hw/watchdog/sbsa_gwdt.c b/hw/watchdog/sbsa_gwdt.c
new file mode 100644
index 000000000000..d0998f8489cb
--- /dev/null
+++ b/hw/watchdog/sbsa_gwdt.c
@@ -0,0 +1,293 @@
+/*
+ * Generic watchdog device model for SBSA
+ *
+ * The watchdog device has been implemented as revision 1 variant of
+ * the ARM SBSA specification v6.0
+ * (https://developer.arm.com/documentation/den0029/d?lang=en)
+ *
+ * Copyright Linaro.org 2020
+ *
+ * Authors:
+ *  Shashi Mallela <shashi.mallela@linaro.org>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or (at your
+ * option) any later version.  See the COPYING file in the top-level directory.
+ *
+ */
+
+#include "qemu/osdep.h"
+#include "sysemu/reset.h"
+#include "sysemu/watchdog.h"
+#include "hw/watchdog/sbsa_gwdt.h"
+#include "qemu/timer.h"
+#include "migration/vmstate.h"
+#include "qemu/log.h"
+#include "qemu/module.h"
+
+static WatchdogTimerModel model = {
+    .wdt_name = TYPE_WDT_SBSA,
+    .wdt_description = "SBSA-compliant generic watchdog device",
+};
+
+static const VMStateDescription vmstate_sbsa_gwdt = {
+    .name = "sbsa-gwdt",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_TIMER_PTR(timer, SBSA_GWDTState),
+        VMSTATE_UINT32(wcs, SBSA_GWDTState),
+        VMSTATE_UINT32(worl, SBSA_GWDTState),
+        VMSTATE_UINT32(woru, SBSA_GWDTState),
+        VMSTATE_UINT32(wcvl, SBSA_GWDTState),
+        VMSTATE_UINT32(wcvu, SBSA_GWDTState),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+typedef enum WdtRefreshType {
+    EXPLICIT_REFRESH = 0,
+    TIMEOUT_REFRESH = 1,
+} WdtRefreshType;
+
+static uint64_t sbsa_gwdt_rread(void *opaque, hwaddr addr, unsigned int size)
+{
+    SBSA_GWDTState *s = SBSA_GWDT(opaque);
+    uint32_t ret = 0;
+
+    switch (addr) {
+    case SBSA_GWDT_WRR:
+        /* watch refresh read has no effect and returns 0 */
+        ret = 0;
+        break;
+    case SBSA_GWDT_W_IIDR:
+        ret = s->id;
+        break;
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR, "bad address in refresh frame read :"
+                        " 0x%x\n", (int)addr);
+    }
+    return ret;
+}
+
+static uint64_t sbsa_gwdt_read(void *opaque, hwaddr addr, unsigned int size)
+{
+    SBSA_GWDTState *s = SBSA_GWDT(opaque);
+    uint32_t ret = 0;
+
+    switch (addr) {
+    case SBSA_GWDT_WCS:
+        ret = s->wcs;
+        break;
+    case SBSA_GWDT_WOR:
+        ret = s->worl;
+        break;
+    case SBSA_GWDT_WORU:
+         ret = s->woru;
+         break;
+    case SBSA_GWDT_WCV:
+        ret = s->wcvl;
+        break;
+    case SBSA_GWDT_WCVU:
+        ret = s->wcvu;
+        break;
+    case SBSA_GWDT_W_IIDR:
+        ret = s->id;
+        break;
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR, "bad address in control frame read :"
+                        " 0x%x\n", (int)addr);
+    }
+    return ret;
+}
+
+static void sbsa_gwdt_update_timer(SBSA_GWDTState *s, WdtRefreshType rtype)
+{
+    uint64_t timeout = 0;
+
+    timer_del(s->timer);
+
+    if (s->wcs & SBSA_GWDT_WCS_EN) {
+        /*
+         * Extract the upper 16 bits from woru & 32 bits from worl
+         * registers to construct the 48 bit offset value
+         */
+        timeout = s->woru;
+        timeout <<= 32;
+        timeout |= s->worl;
+        timeout = muldiv64(timeout, NANOSECONDS_PER_SECOND, SBSA_TIMER_FREQ);
+        timeout += qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+
+        if ((rtype == EXPLICIT_REFRESH) || ((rtype == TIMEOUT_REFRESH) &&
+                (!(s->wcs & SBSA_GWDT_WCS_WS0)))) {
+            /* store the current timeout value into compare registers */
+            s->wcvu = timeout >> 32;
+            s->wcvl = timeout;
+        }
+        timer_mod(s->timer, timeout);
+    }
+}
+
+static void sbsa_gwdt_rwrite(void *opaque, hwaddr offset, uint64_t data,
+                             unsigned size) {
+    SBSA_GWDTState *s = SBSA_GWDT(opaque);
+
+    if (offset == SBSA_GWDT_WRR) {
+        s->wcs &= ~(SBSA_GWDT_WCS_WS0 | SBSA_GWDT_WCS_WS1);
+
+        sbsa_gwdt_update_timer(s, EXPLICIT_REFRESH);
+    } else {
+        qemu_log_mask(LOG_GUEST_ERROR, "bad address in refresh frame write :"
+                        " 0x%x\n", (int)offset);
+    }
+}
+
+static void sbsa_gwdt_write(void *opaque, hwaddr offset, uint64_t data,
+                             unsigned size) {
+    SBSA_GWDTState *s = SBSA_GWDT(opaque);
+
+    switch (offset) {
+    case SBSA_GWDT_WCS:
+        s->wcs = data & SBSA_GWDT_WCS_EN;
+        qemu_set_irq(s->irq, 0);
+        sbsa_gwdt_update_timer(s, EXPLICIT_REFRESH);
+        break;
+
+    case SBSA_GWDT_WOR:
+        s->worl = data;
+        s->wcs &= ~(SBSA_GWDT_WCS_WS0 | SBSA_GWDT_WCS_WS1);
+        qemu_set_irq(s->irq, 0);
+        sbsa_gwdt_update_timer(s, EXPLICIT_REFRESH);
+        break;
+
+    case SBSA_GWDT_WORU:
+        s->woru = data & SBSA_GWDT_WOR_MASK;
+        s->wcs &= ~(SBSA_GWDT_WCS_WS0 | SBSA_GWDT_WCS_WS1);
+        qemu_set_irq(s->irq, 0);
+        sbsa_gwdt_update_timer(s, EXPLICIT_REFRESH);
+        break;
+
+    case SBSA_GWDT_WCV:
+        s->wcvl = data;
+        break;
+
+    case SBSA_GWDT_WCVU:
+        s->wcvu = data;
+        break;
+
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR, "bad address in control frame write :"
+                " 0x%x\n", (int)offset);
+    }
+    return;
+}
+
+static void wdt_sbsa_gwdt_reset(DeviceState *dev)
+{
+    SBSA_GWDTState *s = SBSA_GWDT(dev);
+
+    timer_del(s->timer);
+
+    s->wcs  = 0;
+    s->wcvl = 0;
+    s->wcvu = 0;
+    s->worl = 0;
+    s->woru = 0;
+    s->id = SBSA_GWDT_ID;
+}
+
+static void sbsa_gwdt_timer_sysinterrupt(void *opaque)
+{
+    SBSA_GWDTState *s = SBSA_GWDT(opaque);
+
+    if (!(s->wcs & SBSA_GWDT_WCS_WS0)) {
+        s->wcs |= SBSA_GWDT_WCS_WS0;
+        sbsa_gwdt_update_timer(s, TIMEOUT_REFRESH);
+        qemu_set_irq(s->irq, 1);
+    } else {
+        s->wcs |= SBSA_GWDT_WCS_WS1;
+        qemu_log_mask(CPU_LOG_RESET, "Watchdog timer expired.\n");
+        /*
+         * Reset the watchdog only if the guest gets notified about
+         * expiry. watchdog_perform_action() may temporarily relinquish
+         * the BQL; reset before triggering the action to avoid races with
+         * sbsa_gwdt instructions.
+         */
+        switch (get_watchdog_action()) {
+        case WATCHDOG_ACTION_DEBUG:
+        case WATCHDOG_ACTION_NONE:
+        case WATCHDOG_ACTION_PAUSE:
+            break;
+        default:
+            wdt_sbsa_gwdt_reset(DEVICE(s));
+        }
+        watchdog_perform_action();
+    }
+}
+
+static const MemoryRegionOps sbsa_gwdt_rops = {
+    .read = sbsa_gwdt_rread,
+    .write = sbsa_gwdt_rwrite,
+    .endianness = DEVICE_LITTLE_ENDIAN,
+    .valid.min_access_size = 4,
+    .valid.max_access_size = 4,
+    .valid.unaligned = false,
+};
+
+static const MemoryRegionOps sbsa_gwdt_ops = {
+    .read = sbsa_gwdt_read,
+    .write = sbsa_gwdt_write,
+    .endianness = DEVICE_LITTLE_ENDIAN,
+    .valid.min_access_size = 4,
+    .valid.max_access_size = 4,
+    .valid.unaligned = false,
+};
+
+static void wdt_sbsa_gwdt_realize(DeviceState *dev, Error **errp)
+{
+    SBSA_GWDTState *s = SBSA_GWDT(dev);
+    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
+
+    memory_region_init_io(&s->rmmio, OBJECT(dev),
+                          &sbsa_gwdt_rops, s,
+                          "sbsa_gwdt.refresh",
+                          SBSA_GWDT_RMMIO_SIZE);
+
+    memory_region_init_io(&s->cmmio, OBJECT(dev),
+                          &sbsa_gwdt_ops, s,
+                          "sbsa_gwdt.control",
+                          SBSA_GWDT_CMMIO_SIZE);
+
+    sysbus_init_mmio(sbd, &s->rmmio);
+    sysbus_init_mmio(sbd, &s->cmmio);
+
+    sysbus_init_irq(sbd, &s->irq);
+
+    s->timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, sbsa_gwdt_timer_sysinterrupt,
+                dev);
+}
+
+static void wdt_sbsa_gwdt_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->realize = wdt_sbsa_gwdt_realize;
+    dc->reset = wdt_sbsa_gwdt_reset;
+    dc->hotpluggable = false;
+    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
+    dc->vmsd = &vmstate_sbsa_gwdt;
+}
+
+static const TypeInfo wdt_sbsa_gwdt_info = {
+    .class_init = wdt_sbsa_gwdt_class_init,
+    .parent = TYPE_SYS_BUS_DEVICE,
+    .name  = TYPE_WDT_SBSA,
+    .instance_size  = sizeof(SBSA_GWDTState),
+};
+
+static void wdt_sbsa_gwdt_register_types(void)
+{
+    watchdog_add_model(&model);
+    type_register_static(&wdt_sbsa_gwdt_info);
+}
+
+type_init(wdt_sbsa_gwdt_register_types)
diff --git a/include/hw/watchdog/sbsa_gwdt.h b/include/hw/watchdog/sbsa_gwdt.h
new file mode 100644
index 000000000000..70b137de3016
--- /dev/null
+++ b/include/hw/watchdog/sbsa_gwdt.h
@@ -0,0 +1,79 @@
+/*
+ * Copyright (c) 2020 Linaro Limited
+ *
+ * Authors:
+ *  Shashi Mallela <shashi.mallela@linaro.org>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or (at your
+ * option) any later version.  See the COPYING file in the top-level directory.
+ *
+ */
+
+#ifndef WDT_SBSA_GWDT_H
+#define WDT_SBSA_GWDT_H
+
+#include "qemu/bitops.h"
+#include "hw/sysbus.h"
+#include "hw/irq.h"
+
+#define TYPE_WDT_SBSA "sbsa_gwdt"
+#define SBSA_GWDT(obj) \
+    OBJECT_CHECK(SBSA_GWDTState, (obj), TYPE_WDT_SBSA)
+#define SBSA_GWDT_CLASS(klass) \
+    OBJECT_CLASS_CHECK(SBSA_GWDTClass, (klass), TYPE_WDT_SBSA)
+#define SBSA_GWDT_GET_CLASS(obj) \
+    OBJECT_GET_CLASS(SBSA_GWDTClass, (obj), TYPE_WDT_SBSA)
+
+/* SBSA Generic Watchdog register definitions */
+/* refresh frame */
+#define SBSA_GWDT_WRR       0x000
+
+/* control frame */
+#define SBSA_GWDT_WCS       0x000
+#define SBSA_GWDT_WOR       0x008
+#define SBSA_GWDT_WORU      0x00C
+#define SBSA_GWDT_WCV       0x010
+#define SBSA_GWDT_WCVU      0x014
+
+/* Watchdog Interface Identification Register */
+#define SBSA_GWDT_W_IIDR    0xFCC
+
+/* Watchdog Control and Status Register Bits */
+#define SBSA_GWDT_WCS_EN    BIT(0)
+#define SBSA_GWDT_WCS_WS0   BIT(1)
+#define SBSA_GWDT_WCS_WS1   BIT(2)
+
+#define SBSA_GWDT_WOR_MASK  0x0000FFFF
+
+/*
+ * Watchdog Interface Identification Register definition
+ * considering JEP106 code for ARM in Bits [11:0]
+ */
+#define SBSA_GWDT_ID        0x1043B
+
+/* 2 Separate memory regions for each of refresh & control register frames */
+#define SBSA_GWDT_RMMIO_SIZE 0x1000
+#define SBSA_GWDT_CMMIO_SIZE 0x1000
+
+#define SBSA_TIMER_FREQ      62500000 /* Hz */
+
+typedef struct SBSA_GWDTState {
+    /* <private> */
+    SysBusDevice parent_obj;
+
+    /*< public >*/
+    MemoryRegion rmmio;
+    MemoryRegion cmmio;
+    qemu_irq irq;
+
+    QEMUTimer *timer;
+
+    uint32_t id;
+    uint32_t wcs;
+    uint32_t worl;
+    uint32_t woru;
+    uint32_t wcvl;
+    uint32_t wcvu;
+} SBSA_GWDTState;
+
+#endif /* WDT_SBSA_GWDT_H */
-- 
2.18.4


