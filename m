Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A01C6E8F4D
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 12:08:35 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppRAD-0000at-3d; Thu, 20 Apr 2023 06:05:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ppRA6-0000YB-Md
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 06:05:10 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ppRA0-0003eQ-FB
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 06:05:09 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-3f09b4a1584so3679515e9.2
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 03:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681985101; x=1684577101;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=L7nlUevNqyMVdqq24J8aX19ltWH+K+rS+TXuZnL1vZQ=;
 b=DS7OlppCCKh7qbeK0Ny6auM0z070IUJruOjljTQXREcNM2N+9vIVFvtBfUjMgugVlZ
 HSdiLgB/xTZQPMf8H6E7UIc1Hmdx1os6xxA1ATDOF2g+eNB2WiiaYd+WH6a85ep17//1
 ctAJBLh6xVEFB6r95K0gWjFFphEBlRrHTNsUu36U4v2iJW6543Ega87x1rRfMq9Q0qsL
 94qRPw/uU5ap3oZbDAL3snjrHk/k1ipIPNwQteBY0VcypwqdWk+450K6rm+CVaxEKA4m
 ms3heN0VltmbkKo5qg5pwahvoDFAripsRWaGnSXi7D1Fj3nfVDQB2DpV2Av/wyjy9fuj
 WUdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681985101; x=1684577101;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=L7nlUevNqyMVdqq24J8aX19ltWH+K+rS+TXuZnL1vZQ=;
 b=lmUEM94vzDB2esIFB1n8b9Np1rJu2vJJWvpdZzrzB+wcmGdgBUe+lYQe5C8WWGvNAw
 /7vTx74K8MQca6gB6FkQEQ/krn3vtyhw7aTlbiWggUXxD632/DUs72aOQpNjZrJeYh2S
 S2bd1DCwVPbWN8JIwg8tzArcJEkR6P3XK44YFgtQmG6K/IJ/aN3dos0k6qP8mNqCM53k
 IdNBC+dvsTlFIoIE9hPj65xiIX6lacZXsxfDVthE5gOF+Mse39Cm8TtTyQsGlCqMkQ8q
 iMTKGlz+ULCDqCGYgWO5IDR7GBJZbXT44ldLZKPlD8EzmXJ11+ZdcEiavIYs9oKEelnd
 /kwA==
X-Gm-Message-State: AAQBX9cwR5SiHiGqQmYx+bfGJBTe4g9Mqs27i63cf59Vbr0OeBFx9h4G
 29xGE0aQBJnZ09JO7jrpBEUuGn70uwU/UzhEF3k=
X-Google-Smtp-Source: AKy350biF5BPexr+RPS8wUN7R1FOPwZyKCPfjip+iBhARX1llQoxUWoZLT68wQ2Sbcm4qW1b7HcnLg==
X-Received: by 2002:adf:f209:0:b0:2f5:ace2:8737 with SMTP id
 p9-20020adff209000000b002f5ace28737mr900834wro.32.1681985100929; 
 Thu, 20 Apr 2023 03:05:00 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 o2-20020a5d58c2000000b002fe522117fdsm1556388wrf.36.2023.04.20.03.05.00
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Apr 2023 03:05:00 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 03/21] hw/watchdog: Allwinner WDT emulation for system reset
Date: Thu, 20 Apr 2023 11:04:38 +0100
Message-Id: <20230420100456.944969-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230420100456.944969-1-peter.maydell@linaro.org>
References: <20230420100456.944969-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Strahinja Jankovic <strahinjapjankovic@gmail.com>

This patch adds basic support for Allwinner WDT.
Both sun4i and sun6i variants are supported.
However, interrupt generation is not supported, so WDT can be used only to trigger system reset.

Signed-off-by: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
Reviewed-by: Niek Linnenbank <nieklinnenbank@gmail.com>
Tested-by: Niek Linnenbank <nieklinnenbank@gmail.com>
Message-id: 20230326202256.22980-2-strahinja.p.jankovic@gmail.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/watchdog/allwinner-wdt.h | 123 ++++++++
 hw/watchdog/allwinner-wdt.c         | 416 ++++++++++++++++++++++++++++
 hw/watchdog/Kconfig                 |   4 +
 hw/watchdog/meson.build             |   1 +
 hw/watchdog/trace-events            |   7 +
 5 files changed, 551 insertions(+)
 create mode 100644 include/hw/watchdog/allwinner-wdt.h
 create mode 100644 hw/watchdog/allwinner-wdt.c

diff --git a/include/hw/watchdog/allwinner-wdt.h b/include/hw/watchdog/allwinner-wdt.h
new file mode 100644
index 00000000000..7fe41e20f2e
--- /dev/null
+++ b/include/hw/watchdog/allwinner-wdt.h
@@ -0,0 +1,123 @@
+/*
+ * Allwinner Watchdog emulation
+ *
+ * Copyright (C) 2023 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
+ *
+ *  This file is derived from Allwinner RTC,
+ *  by Niek Linnenbank.
+ *
+ * This program is free software: you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation, either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef HW_WATCHDOG_ALLWINNER_WDT_H
+#define HW_WATCHDOG_ALLWINNER_WDT_H
+
+#include "qom/object.h"
+#include "hw/ptimer.h"
+#include "hw/sysbus.h"
+
+/*
+ * This is a model of the Allwinner watchdog.
+ * Since watchdog registers belong to the timer module (and are shared with the
+ * RTC module), the interrupt line from watchdog is not handled right now.
+ * In QEMU, we just wire up the watchdog reset to watchdog_perform_action(),
+ * at least for the moment.
+ */
+
+#define TYPE_AW_WDT    "allwinner-wdt"
+
+/** Allwinner WDT sun4i family (A10, A12), also sun7i (A20) */
+#define TYPE_AW_WDT_SUN4I    TYPE_AW_WDT "-sun4i"
+
+/** Allwinner WDT sun6i family and newer (A31, H2+, H3, etc) */
+#define TYPE_AW_WDT_SUN6I    TYPE_AW_WDT "-sun6i"
+
+/** Number of WDT registers */
+#define AW_WDT_REGS_NUM      (5)
+
+OBJECT_DECLARE_TYPE(AwWdtState, AwWdtClass, AW_WDT)
+
+/**
+ * Allwinner WDT object instance state.
+ */
+struct AwWdtState {
+    /*< private >*/
+    SysBusDevice parent_obj;
+
+    /*< public >*/
+    MemoryRegion iomem;
+    struct ptimer_state *timer;
+
+    uint32_t regs[AW_WDT_REGS_NUM];
+};
+
+/**
+ * Allwinner WDT class-level struct.
+ *
+ * This struct is filled by each sunxi device specific code
+ * such that the generic code can use this struct to support
+ * all devices.
+ */
+struct AwWdtClass {
+    /*< private >*/
+    SysBusDeviceClass parent_class;
+    /*< public >*/
+
+    /** Defines device specific register map */
+    const uint8_t *regmap;
+
+    /** Size of the regmap in bytes */
+    size_t regmap_size;
+
+    /**
+     * Read device specific register
+     *
+     * @offset: register offset to read
+     * @return true if register read successful, false otherwise
+     */
+    bool (*read)(AwWdtState *s, uint32_t offset);
+
+    /**
+     * Write device specific register
+     *
+     * @offset: register offset to write
+     * @data: value to set in register
+     * @return true if register write successful, false otherwise
+     */
+    bool (*write)(AwWdtState *s, uint32_t offset, uint32_t data);
+
+    /**
+     * Check if watchdog can generate system reset
+     *
+     * @return true if watchdog can generate system reset
+     */
+    bool (*can_reset_system)(AwWdtState *s);
+
+    /**
+     * Check if provided key is valid
+     *
+     * @value: value written to register
+     * @return true if key is valid, false otherwise
+     */
+    bool (*is_key_valid)(AwWdtState *s, uint32_t val);
+
+    /**
+     * Get current INTV_VALUE setting
+     *
+     * @return current INTV_VALUE (0-15)
+     */
+    uint8_t (*get_intv_value)(AwWdtState *s);
+};
+
+#endif /* HW_WATCHDOG_ALLWINNER_WDT_H */
diff --git a/hw/watchdog/allwinner-wdt.c b/hw/watchdog/allwinner-wdt.c
new file mode 100644
index 00000000000..6205765efec
--- /dev/null
+++ b/hw/watchdog/allwinner-wdt.c
@@ -0,0 +1,416 @@
+/*
+ * Allwinner Watchdog emulation
+ *
+ * Copyright (C) 2023 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
+ *
+ *  This file is derived from Allwinner RTC,
+ *  by Niek Linnenbank.
+ *
+ * This program is free software: you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation, either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/log.h"
+#include "qemu/units.h"
+#include "qemu/module.h"
+#include "trace.h"
+#include "hw/sysbus.h"
+#include "hw/registerfields.h"
+#include "hw/watchdog/allwinner-wdt.h"
+#include "sysemu/watchdog.h"
+#include "migration/vmstate.h"
+
+/* WDT registers */
+enum {
+    REG_IRQ_EN = 0,     /* Watchdog interrupt enable */
+    REG_IRQ_STA,        /* Watchdog interrupt status */
+    REG_CTRL,           /* Watchdog control register */
+    REG_CFG,            /* Watchdog configuration register */
+    REG_MODE,           /* Watchdog mode register */
+};
+
+/* Universal WDT register flags */
+#define WDT_RESTART_MASK    (1 << 0)
+#define WDT_EN_MASK         (1 << 0)
+
+/* sun4i specific WDT register flags */
+#define RST_EN_SUN4I_MASK       (1 << 1)
+#define INTV_VALUE_SUN4I_SHIFT  (3)
+#define INTV_VALUE_SUN4I_MASK   (0xfu << INTV_VALUE_SUN4I_SHIFT)
+
+/* sun6i specific WDT register flags */
+#define RST_EN_SUN6I_MASK       (1 << 0)
+#define KEY_FIELD_SUN6I_SHIFT   (1)
+#define KEY_FIELD_SUN6I_MASK    (0xfffu << KEY_FIELD_SUN6I_SHIFT)
+#define KEY_FIELD_SUN6I         (0xA57u)
+#define INTV_VALUE_SUN6I_SHIFT  (4)
+#define INTV_VALUE_SUN6I_MASK   (0xfu << INTV_VALUE_SUN6I_SHIFT)
+
+/* Map of INTV_VALUE to 0.5s units. */
+static const uint8_t allwinner_wdt_count_map[] = {
+    1,
+    2,
+    4,
+    6,
+    8,
+    10,
+    12,
+    16,
+    20,
+    24,
+    28,
+    32
+};
+
+/* WDT sun4i register map (offset to name) */
+const uint8_t allwinner_wdt_sun4i_regmap[] = {
+    [0x0000] = REG_CTRL,
+    [0x0004] = REG_MODE,
+};
+
+/* WDT sun6i register map (offset to name) */
+const uint8_t allwinner_wdt_sun6i_regmap[] = {
+    [0x0000] = REG_IRQ_EN,
+    [0x0004] = REG_IRQ_STA,
+    [0x0010] = REG_CTRL,
+    [0x0014] = REG_CFG,
+    [0x0018] = REG_MODE,
+};
+
+static bool allwinner_wdt_sun4i_read(AwWdtState *s, uint32_t offset)
+{
+    /* no sun4i specific registers currently implemented */
+    return false;
+}
+
+static bool allwinner_wdt_sun4i_write(AwWdtState *s, uint32_t offset,
+                                      uint32_t data)
+{
+    /* no sun4i specific registers currently implemented */
+    return false;
+}
+
+static bool allwinner_wdt_sun4i_can_reset_system(AwWdtState *s)
+{
+    if (s->regs[REG_MODE] & RST_EN_SUN4I_MASK) {
+        return true;
+    } else {
+        return false;
+    }
+}
+
+static bool allwinner_wdt_sun4i_is_key_valid(AwWdtState *s, uint32_t val)
+{
+    /* sun4i has no key */
+    return true;
+}
+
+static uint8_t allwinner_wdt_sun4i_get_intv_value(AwWdtState *s)
+{
+    return ((s->regs[REG_MODE] & INTV_VALUE_SUN4I_MASK) >>
+            INTV_VALUE_SUN4I_SHIFT);
+}
+
+static bool allwinner_wdt_sun6i_read(AwWdtState *s, uint32_t offset)
+{
+    const AwWdtClass *c = AW_WDT_GET_CLASS(s);
+
+    switch (c->regmap[offset]) {
+    case REG_IRQ_EN:
+    case REG_IRQ_STA:
+    case REG_CFG:
+        return true;
+    default:
+        break;
+    }
+    return false;
+}
+
+static bool allwinner_wdt_sun6i_write(AwWdtState *s, uint32_t offset,
+                                      uint32_t data)
+{
+    const AwWdtClass *c = AW_WDT_GET_CLASS(s);
+
+    switch (c->regmap[offset]) {
+    case REG_IRQ_EN:
+    case REG_IRQ_STA:
+    case REG_CFG:
+        return true;
+    default:
+        break;
+    }
+    return false;
+}
+
+static bool allwinner_wdt_sun6i_can_reset_system(AwWdtState *s)
+{
+    if (s->regs[REG_CFG] & RST_EN_SUN6I_MASK) {
+        return true;
+    } else {
+        return false;
+    }
+}
+
+static bool allwinner_wdt_sun6i_is_key_valid(AwWdtState *s, uint32_t val)
+{
+    uint16_t key = (val & KEY_FIELD_SUN6I_MASK) >> KEY_FIELD_SUN6I_SHIFT;
+    return (key == KEY_FIELD_SUN6I);
+}
+
+static uint8_t allwinner_wdt_sun6i_get_intv_value(AwWdtState *s)
+{
+    return ((s->regs[REG_MODE] & INTV_VALUE_SUN6I_MASK) >>
+            INTV_VALUE_SUN6I_SHIFT);
+}
+
+static void allwinner_wdt_update_timer(AwWdtState *s)
+{
+    const AwWdtClass *c = AW_WDT_GET_CLASS(s);
+    uint8_t count = c->get_intv_value(s);
+
+    ptimer_transaction_begin(s->timer);
+    ptimer_stop(s->timer);
+
+    /* Use map to convert. */
+    if (count < sizeof(allwinner_wdt_count_map)) {
+        ptimer_set_count(s->timer, allwinner_wdt_count_map[count]);
+    } else {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: incorrect INTV_VALUE 0x%02x\n",
+                __func__, count);
+    }
+
+    ptimer_run(s->timer, 1);
+    ptimer_transaction_commit(s->timer);
+
+    trace_allwinner_wdt_update_timer(count);
+}
+
+static uint64_t allwinner_wdt_read(void *opaque, hwaddr offset,
+                                       unsigned size)
+{
+    AwWdtState *s = AW_WDT(opaque);
+    const AwWdtClass *c = AW_WDT_GET_CLASS(s);
+    uint64_t r;
+
+    if (offset >= c->regmap_size) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: out-of-bounds offset 0x%04x\n",
+                      __func__, (uint32_t)offset);
+        return 0;
+    }
+
+    switch (c->regmap[offset]) {
+    case REG_CTRL:
+    case REG_MODE:
+        r = s->regs[c->regmap[offset]];
+        break;
+    default:
+        if (!c->read(s, offset)) {
+            qemu_log_mask(LOG_UNIMP, "%s: unimplemented register 0x%04x\n",
+                            __func__, (uint32_t)offset);
+            return 0;
+        }
+        r = s->regs[c->regmap[offset]];
+        break;
+    }
+
+    trace_allwinner_wdt_read(offset, r, size);
+
+    return r;
+}
+
+static void allwinner_wdt_write(void *opaque, hwaddr offset,
+                                   uint64_t val, unsigned size)
+{
+    AwWdtState *s = AW_WDT(opaque);
+    const AwWdtClass *c = AW_WDT_GET_CLASS(s);
+    uint32_t old_val;
+
+    if (offset >= c->regmap_size) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: out-of-bounds offset 0x%04x\n",
+                      __func__, (uint32_t)offset);
+        return;
+    }
+
+   trace_allwinner_wdt_write(offset, val, size);
+
+    switch (c->regmap[offset]) {
+    case REG_CTRL:
+        if (c->is_key_valid(s, val)) {
+            if (val & WDT_RESTART_MASK) {
+                /* Kick timer */
+                allwinner_wdt_update_timer(s);
+            }
+        }
+        break;
+    case REG_MODE:
+        old_val = s->regs[REG_MODE];
+        s->regs[REG_MODE] = (uint32_t)val;
+
+        /* Check for rising edge on WDOG_MODE_EN */
+        if ((s->regs[REG_MODE] & ~old_val) & WDT_EN_MASK) {
+            allwinner_wdt_update_timer(s);
+        }
+        break;
+    default:
+        if (!c->write(s, offset, val)) {
+            qemu_log_mask(LOG_UNIMP, "%s: unimplemented register 0x%04x\n",
+                          __func__, (uint32_t)offset);
+        }
+        s->regs[c->regmap[offset]] = (uint32_t)val;
+        break;
+    }
+}
+
+static const MemoryRegionOps allwinner_wdt_ops = {
+    .read = allwinner_wdt_read,
+    .write = allwinner_wdt_write,
+    .endianness = DEVICE_NATIVE_ENDIAN,
+    .valid = {
+        .min_access_size = 4,
+        .max_access_size = 4,
+    },
+    .impl.min_access_size = 4,
+};
+
+static void allwinner_wdt_expired(void *opaque)
+{
+    AwWdtState *s = AW_WDT(opaque);
+    const AwWdtClass *c = AW_WDT_GET_CLASS(s);
+
+    bool enabled = s->regs[REG_MODE] & WDT_EN_MASK;
+    bool reset_enabled = c->can_reset_system(s);
+
+    trace_allwinner_wdt_expired(enabled, reset_enabled);
+
+    /* Perform watchdog action if watchdog is enabled and can trigger reset */
+    if (enabled && reset_enabled) {
+        watchdog_perform_action();
+    }
+}
+
+static void allwinner_wdt_reset_enter(Object *obj, ResetType type)
+{
+    AwWdtState *s = AW_WDT(obj);
+
+    trace_allwinner_wdt_reset_enter();
+
+    /* Clear registers */
+    memset(s->regs, 0, sizeof(s->regs));
+}
+
+static const VMStateDescription allwinner_wdt_vmstate = {
+    .name = "allwinner-wdt",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_PTIMER(timer, AwWdtState),
+        VMSTATE_UINT32_ARRAY(regs, AwWdtState, AW_WDT_REGS_NUM),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static void allwinner_wdt_init(Object *obj)
+{
+    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
+    AwWdtState *s = AW_WDT(obj);
+    const AwWdtClass *c = AW_WDT_GET_CLASS(s);
+
+    /* Memory mapping */
+    memory_region_init_io(&s->iomem, OBJECT(s), &allwinner_wdt_ops, s,
+                          TYPE_AW_WDT, c->regmap_size * 4);
+    sysbus_init_mmio(sbd, &s->iomem);
+}
+
+static void allwinner_wdt_realize(DeviceState *dev, Error **errp)
+{
+    AwWdtState *s = AW_WDT(dev);
+
+    s->timer = ptimer_init(allwinner_wdt_expired, s,
+                           PTIMER_POLICY_NO_IMMEDIATE_TRIGGER |
+                           PTIMER_POLICY_NO_IMMEDIATE_RELOAD |
+                           PTIMER_POLICY_NO_COUNTER_ROUND_DOWN);
+
+    ptimer_transaction_begin(s->timer);
+    /* Set to 2Hz (0.5s period); other periods are multiples of 0.5s. */
+    ptimer_set_freq(s->timer, 2);
+    ptimer_set_limit(s->timer, 0xff, 1);
+    ptimer_transaction_commit(s->timer);
+}
+
+static void allwinner_wdt_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    ResettableClass *rc = RESETTABLE_CLASS(klass);
+
+    rc->phases.enter = allwinner_wdt_reset_enter;
+    dc->realize = allwinner_wdt_realize;
+    dc->vmsd = &allwinner_wdt_vmstate;
+}
+
+static void allwinner_wdt_sun4i_class_init(ObjectClass *klass, void *data)
+{
+    AwWdtClass *awc = AW_WDT_CLASS(klass);
+
+    awc->regmap = allwinner_wdt_sun4i_regmap;
+    awc->regmap_size = sizeof(allwinner_wdt_sun4i_regmap);
+    awc->read = allwinner_wdt_sun4i_read;
+    awc->write = allwinner_wdt_sun4i_write;
+    awc->can_reset_system = allwinner_wdt_sun4i_can_reset_system;
+    awc->is_key_valid = allwinner_wdt_sun4i_is_key_valid;
+    awc->get_intv_value = allwinner_wdt_sun4i_get_intv_value;
+}
+
+static void allwinner_wdt_sun6i_class_init(ObjectClass *klass, void *data)
+{
+    AwWdtClass *awc = AW_WDT_CLASS(klass);
+
+    awc->regmap = allwinner_wdt_sun6i_regmap;
+    awc->regmap_size = sizeof(allwinner_wdt_sun6i_regmap);
+    awc->read = allwinner_wdt_sun6i_read;
+    awc->write = allwinner_wdt_sun6i_write;
+    awc->can_reset_system = allwinner_wdt_sun6i_can_reset_system;
+    awc->is_key_valid = allwinner_wdt_sun6i_is_key_valid;
+    awc->get_intv_value = allwinner_wdt_sun6i_get_intv_value;
+}
+
+static const TypeInfo allwinner_wdt_info = {
+    .name          = TYPE_AW_WDT,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_init = allwinner_wdt_init,
+    .instance_size = sizeof(AwWdtState),
+    .class_init    = allwinner_wdt_class_init,
+    .class_size    = sizeof(AwWdtClass),
+    .abstract      = true,
+};
+
+static const TypeInfo allwinner_wdt_sun4i_info = {
+    .name          = TYPE_AW_WDT_SUN4I,
+    .parent        = TYPE_AW_WDT,
+    .class_init    = allwinner_wdt_sun4i_class_init,
+};
+
+static const TypeInfo allwinner_wdt_sun6i_info = {
+    .name          = TYPE_AW_WDT_SUN6I,
+    .parent        = TYPE_AW_WDT,
+    .class_init    = allwinner_wdt_sun6i_class_init,
+};
+
+static void allwinner_wdt_register(void)
+{
+    type_register_static(&allwinner_wdt_info);
+    type_register_static(&allwinner_wdt_sun4i_info);
+    type_register_static(&allwinner_wdt_sun6i_info);
+}
+
+type_init(allwinner_wdt_register)
diff --git a/hw/watchdog/Kconfig b/hw/watchdog/Kconfig
index 66e1d029e32..861fd003341 100644
--- a/hw/watchdog/Kconfig
+++ b/hw/watchdog/Kconfig
@@ -20,3 +20,7 @@ config WDT_IMX2
 
 config WDT_SBSA
     bool
+
+config ALLWINNER_WDT
+    bool
+    select PTIMER
diff --git a/hw/watchdog/meson.build b/hw/watchdog/meson.build
index 8974b5cf4c8..5dcd4fbe2f1 100644
--- a/hw/watchdog/meson.build
+++ b/hw/watchdog/meson.build
@@ -1,4 +1,5 @@
 softmmu_ss.add(files('watchdog.c'))
+softmmu_ss.add(when: 'CONFIG_ALLWINNER_WDT', if_true: files('allwinner-wdt.c'))
 softmmu_ss.add(when: 'CONFIG_CMSDK_APB_WATCHDOG', if_true: files('cmsdk-apb-watchdog.c'))
 softmmu_ss.add(when: 'CONFIG_WDT_IB6300ESB', if_true: files('wdt_i6300esb.c'))
 softmmu_ss.add(when: 'CONFIG_WDT_IB700', if_true: files('wdt_ib700.c'))
diff --git a/hw/watchdog/trace-events b/hw/watchdog/trace-events
index 54371ae0755..2739570652b 100644
--- a/hw/watchdog/trace-events
+++ b/hw/watchdog/trace-events
@@ -1,5 +1,12 @@
 # See docs/devel/tracing.rst for syntax documentation.
 
+# allwinner-wdt.c
+allwinner_wdt_read(uint64_t offset, uint64_t data, unsigned size) "Allwinner watchdog read: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %u"
+allwinner_wdt_write(uint64_t offset, uint64_t data, unsigned size) "Allwinner watchdog write: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %u"
+allwinner_wdt_reset_enter(void) "Allwinner watchdog: reset"
+allwinner_wdt_update_timer(uint8_t count) "Allwinner watchdog: count %" PRIu8
+allwinner_wdt_expired(bool enabled, bool reset_enabled) "Allwinner watchdog: enabled %u reset_enabled %u"
+
 # cmsdk-apb-watchdog.c
 cmsdk_apb_watchdog_read(uint64_t offset, uint64_t data, unsigned size) "CMSDK APB watchdog read: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %u"
 cmsdk_apb_watchdog_write(uint64_t offset, uint64_t data, unsigned size) "CMSDK APB watchdog write: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %u"
-- 
2.34.1


