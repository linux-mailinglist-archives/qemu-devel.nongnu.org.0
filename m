Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A58E8286CE5
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Oct 2020 04:43:44 +0200 (CEST)
Received: from localhost ([::1]:34666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kQLuB-0007Wu-NF
	for lists+qemu-devel@lfdr.de; Wed, 07 Oct 2020 22:43:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1kQLsi-00060Y-3M
 for qemu-devel@nongnu.org; Wed, 07 Oct 2020 22:42:12 -0400
Received: from mail-qt1-x843.google.com ([2607:f8b0:4864:20::843]:40777)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1kQLse-0006td-0D
 for qemu-devel@nongnu.org; Wed, 07 Oct 2020 22:42:11 -0400
Received: by mail-qt1-x843.google.com with SMTP id m9so3883701qth.7
 for <qemu-devel@nongnu.org>; Wed, 07 Oct 2020 19:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=97iB57Uxc+UDu+YzEjICdVW6dKjI5VFaTmXJdtTsPT0=;
 b=zEfCs1wBYkpDNhnQatZyNW1oShjx31pGgww0Wd66h6xN8iws2PILYsaqZ6ghL7byJt
 DNmFmTCDvMP9OqZW6NH0dCyYN951Fe5hZjD5q4KwAwT1TIDGFlfCGeWe5OuK/fwzcZJw
 rDG1Jixs5Ypbq+QgV/xhHP4dwXbMThaVeWDJRwprv4htcugj6qMmS6weSz98jS+VJ8rt
 c/t3iBPvYeEplVM6Treu3PXvkq58btnUskbAes80V9XFVkzgQBfUeLjTQm9XEEqYvnC5
 TenHJ2PdRr5fr3LaS94ThbixGWON2DPpTtN4ZneHG6a5iY0JpuG3hyhNeqDMVmaWdzu+
 9s9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=97iB57Uxc+UDu+YzEjICdVW6dKjI5VFaTmXJdtTsPT0=;
 b=TleH/5TgRnpYvhd/oPc3fesl7akM3AP3TTHSURoNY33GzWJyodOux69wKYCZhUCH0y
 zdJuq35FTZCxI494Tp1D9tuylcffGtAZVacnknWqkpVIvhWf5aYDquyyeQuL6ODDAPzu
 a1DGMGKE8TAfUgW0J5Ja/n/7z40pd0Lv41A7O7iZ79W6E6Lo7c2GmXgnEFGj5GrTlgZu
 C0haFxAYI+0UEqaHjq8Fx0sXo7ERxVnFTlzDBRYHkFuiaiJ9cJ65cEuSBsX3/oZ5AIUM
 0i629SpJlLov0QZbC3ApMuDoOUCSafeZKZWVSX7Pd+JYRTA4MG3QySQx2qPmnLh56I7N
 VGlg==
X-Gm-Message-State: AOAM533DUbY71zsuO8X2/8yNJv9pHr73H49m8w4x/O2mM66+nzo18ggg
 nwP2HvuWEIKxFwQthf4ahSNjRA==
X-Google-Smtp-Source: ABdhPJwJo3NX5pU0Uoux5IwWyG5q0Lyg2u1wL+JcbESNkj+rjb/p60W575uShzMhfL7PRykyJrpuIg==
X-Received: by 2002:ac8:4807:: with SMTP id g7mr6429892qtq.54.1602124926937;
 Wed, 07 Oct 2020 19:42:06 -0700 (PDT)
Received: from master.ht.home ([2607:fea8:e2a0:e950::d884])
 by smtp.googlemail.com with ESMTPSA id m3sm3005031qkh.10.2020.10.07.19.42.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Oct 2020 19:42:06 -0700 (PDT)
From: Shashi Mallela <shashi.mallela@linaro.org>
To: peter.maydell@linaro.org,
	leif@nuviainc.com,
	rad@semihalf.com
Subject: [PATCH v3 1/2] hw/watchdog: Implement SBSA watchdog device
Date: Wed,  7 Oct 2020 22:42:02 -0400
Message-Id: <20201008024203.112303-2-shashi.mallela@linaro.org>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20201008024203.112303-1-shashi.mallela@linaro.org>
References: <20201008024203.112303-1-shashi.mallela@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::843;
 envelope-from=shashi.mallela@linaro.org; helo=mail-qt1-x843.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Generic watchdog device model has been implemented as per ARM BSAv0.9

Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
---
 hw/arm/Kconfig                      |   1 +
 hw/watchdog/Kconfig                 |   4 +
 hw/watchdog/meson.build             |   1 +
 hw/watchdog/wdt_sbsa_gwdt.c         | 345 ++++++++++++++++++++++++++++
 include/hw/watchdog/wdt_sbsa_gwdt.h |  70 ++++++
 5 files changed, 421 insertions(+)
 create mode 100644 hw/watchdog/wdt_sbsa_gwdt.c
 create mode 100644 include/hw/watchdog/wdt_sbsa_gwdt.h

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index f303c6bead25..6b97e64595d3 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -210,6 +210,7 @@ config SBSA_REF
     select PL031 # RTC
     select PL061 # GPIO
     select USB_EHCI_SYSBUS
+    select WDT_SBSA_GWDT
 
 config SABRELITE
     bool
diff --git a/hw/watchdog/Kconfig b/hw/watchdog/Kconfig
index 293209b291d6..ea9cadd66f22 100644
--- a/hw/watchdog/Kconfig
+++ b/hw/watchdog/Kconfig
@@ -17,3 +17,7 @@ config WDT_DIAG288
 
 config WDT_IMX2
     bool
+
+config WDT_SBSA_GWDT
+    bool
+    default y if SBSA_REF
diff --git a/hw/watchdog/meson.build b/hw/watchdog/meson.build
index 9b8725e64288..a9a23307acfe 100644
--- a/hw/watchdog/meson.build
+++ b/hw/watchdog/meson.build
@@ -5,3 +5,4 @@ softmmu_ss.add(when: 'CONFIG_WDT_IB700', if_true: files('wdt_ib700.c'))
 softmmu_ss.add(when: 'CONFIG_WDT_DIAG288', if_true: files('wdt_diag288.c'))
 softmmu_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files('wdt_aspeed.c'))
 softmmu_ss.add(when: 'CONFIG_WDT_IMX2', if_true: files('wdt_imx2.c'))
+softmmu_ss.add(when: 'CONFIG_WDT_SBSA_GWDT', if_true: files('wdt_sbsa_gwdt.c'))
diff --git a/hw/watchdog/wdt_sbsa_gwdt.c b/hw/watchdog/wdt_sbsa_gwdt.c
new file mode 100644
index 000000000000..c0906180449e
--- /dev/null
+++ b/hw/watchdog/wdt_sbsa_gwdt.c
@@ -0,0 +1,345 @@
+/*
+ * Generic watchdog device model for SBSA
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
+#include "hw/watchdog/wdt_sbsa_gwdt.h"
+#include "qemu/timer.h"
+#include "migration/vmstate.h"
+#include "qemu/log.h"
+#include "qemu/module.h"
+
+static WatchdogTimerModel model = {
+    .wdt_name = TYPE_WDT_SBSA_GWDT,
+    .wdt_description = "sbsa_gwdt device for sbsa_ref platform",
+};
+
+static const VMStateDescription vmstate_sbsa_gwdt = {
+    .name = "vmstate_sbsa_gwdt",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_TIMER_PTR(timer, SBSA_GWDTState),
+        VMSTATE_BOOL(enabled, SBSA_GWDTState),
+        VMSTATE_BOOL(ws0, SBSA_GWDTState),
+        VMSTATE_BOOL(ws1, SBSA_GWDTState),
+        VMSTATE_UINT32(wrr, SBSA_GWDTState),
+        VMSTATE_UINT32(wcs, SBSA_GWDTState),
+        VMSTATE_UINT32(worl, SBSA_GWDTState),
+        VMSTATE_UINT32(woru, SBSA_GWDTState),
+        VMSTATE_UINT32(wcvl, SBSA_GWDTState),
+        VMSTATE_UINT32(wcvu, SBSA_GWDTState),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static uint64_t sbsa_gwdt_rread(void *opaque, hwaddr addr, unsigned int size)
+{
+    uint32_t ret;
+
+    if (addr == SBSA_GWDT_WRR) {
+        /* watch refresh read has no effect and returns 0 */
+        ret = 0;
+    } else {
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
+static void sbsa_gwdt_update_timer(SBSA_GWDTState *s)
+{
+    uint64_t timeout = 0;
+
+    if (s->enabled) {
+        /*
+         * Extract the upper 16 bits from woru & 32 bits from worl
+         * registers to construct the 48 bit offset value
+         */
+        timeout = s->woru & SBSA_GWDT_WOR_MASK;
+        timeout <<= 32;
+        timeout |= s->worl;
+        timeout = muldiv64(timeout, NANOSECONDS_PER_SECOND, SBSA_TIMER_FREQ);
+        timeout += qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+
+        /* store the current timeout value into compare registers */
+        s->wcvu = timeout >> 32;
+        s->wcvl = timeout;
+
+        if (!s->ws0) {
+            timer_del(s->timer);
+            timer_mod(s->ptimer, timeout);
+        } else {
+            timer_del(s->ptimer);
+            timer_mod(s->timer, timeout);
+        }
+    } else {
+        timer_del(s->ptimer);
+        timer_del(s->timer);
+    }
+}
+
+static void sbsa_gwdt_rwrite(void *opaque, hwaddr offset, uint64_t data,
+                             unsigned size) {
+    SBSA_GWDTState *s = SBSA_GWDT(opaque);
+
+    if (offset == SBSA_GWDT_WRR) {
+        s->wrr = data;
+        s->wcs &= ~SBSA_GWDT_WCS_WS0;
+        s->wcs &= ~SBSA_GWDT_WCS_WS1;
+        s->ws0 = false;
+        s->ws1 = false;
+        sbsa_gwdt_update_timer(s);
+    } else {
+        qemu_log_mask(LOG_GUEST_ERROR, "bad address in refresh frame write :"
+                        " 0x%x\n", (int)offset);
+    }
+}
+
+static void sbsa_gwdt_write(void *opaque, hwaddr offset, uint64_t data,
+                             unsigned size) {
+    SBSA_GWDTState *s = SBSA_GWDT(opaque);
+    bool enable;
+
+    switch (offset) {
+    case SBSA_GWDT_WCS:
+        enable = data & SBSA_GWDT_WCS_EN;
+        if (enable) {
+            s->wcs |= SBSA_GWDT_WCS_EN;
+            s->enabled = true;
+        } else {
+            s->wcs &= ~SBSA_GWDT_WCS_EN;
+            s->enabled = false;
+        }
+        s->ws0 = false;
+        s->ws1 = false;
+        s->wcs &= ~SBSA_GWDT_WCS_WS0;
+        s->wcs &= ~SBSA_GWDT_WCS_WS1;
+        sbsa_gwdt_update_timer(s);
+        break;
+
+    case SBSA_GWDT_WOR:
+        s->worl = data;
+        s->ws0 = false;
+        s->ws1 = false;
+        s->wcs &= ~SBSA_GWDT_WCS_WS0;
+        s->wcs &= ~SBSA_GWDT_WCS_WS1;
+        /*
+         * TODO:- setting woru to 0 and triggering update timer(below) is a
+         * temporary workaround to handle current linux driver which is
+         * based on earlier version of BSA specification.Once the linux
+         * driver is updated to BSA v0.9 will remove these next 2 lines.
+         */
+        s->woru = 0;
+        sbsa_gwdt_update_timer(s);
+        break;
+
+    case SBSA_GWDT_WORU:
+        s->woru = data;
+        s->ws0 = false;
+        s->ws1 = false;
+        s->wcs &= ~SBSA_GWDT_WCS_WS0;
+        s->wcs &= ~SBSA_GWDT_WCS_WS1;
+        sbsa_gwdt_update_timer(s);
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
+    timer_del(s->ptimer);
+    timer_del(s->timer);
+
+    s->enabled = false;
+    s->ws0 = false;
+    s->ws1 = false;
+    s->wcs &= ~SBSA_GWDT_WCS_EN;
+    s->wcs &= ~SBSA_GWDT_WCS_WS0;
+    s->wcs &= ~SBSA_GWDT_WCS_WS1;
+    s->wcvl = 0;
+    s->wcvu = 0;
+    s->worl = 0;
+    s->woru = 0;
+    s->id = SBSA_GWDT_ID;
+}
+
+static void sbsa_gwdt_reset(void *opaque)
+{
+    DeviceState *sbsa_gwdt = opaque;
+
+    wdt_sbsa_gwdt_reset(sbsa_gwdt);
+}
+
+static void sbsa_gwdt_timer_sysinterrupt(void *opaque)
+{
+    SBSA_GWDTState *s = SBSA_GWDT(opaque);
+
+    s->wcs |= SBSA_GWDT_WCS_WS0;
+    s->ws0 = true;
+    qemu_set_irq(s->irq, 1);
+    sbsa_gwdt_update_timer(s);
+}
+
+static void sbsa_gwdt_timer_sysreset(void *dev)
+{
+    SBSA_GWDTState *s = SBSA_GWDT(dev);
+    s->wcs |= SBSA_GWDT_WCS_WS1;
+    s->ws1 = true;
+    qemu_log_mask(CPU_LOG_RESET, "Watchdog timer expired.\n");
+    /*
+     * Reset the watchdog only if the guest gets notified about
+     * expiry. watchdog_perform_action() may temporarily relinquish
+     * the BQL; reset before triggering the action to avoid races with
+     * sbsa_gwdt instructions.
+     */
+    switch (get_watchdog_action()) {
+    case WATCHDOG_ACTION_DEBUG:
+    case WATCHDOG_ACTION_NONE:
+    case WATCHDOG_ACTION_PAUSE:
+        break;
+    default:
+        wdt_sbsa_gwdt_reset(dev);
+    }
+    watchdog_perform_action();
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
+    qemu_register_reset(sbsa_gwdt_reset, s);
+
+    s->ptimer = timer_new_ns(QEMU_CLOCK_VIRTUAL, sbsa_gwdt_timer_sysinterrupt,
+            dev);
+    s->timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, sbsa_gwdt_timer_sysreset,
+                dev);
+}
+
+static void wdt_sbsa_gwdt_unrealize(DeviceState *dev)
+{
+    SBSA_GWDTState *s = SBSA_GWDT(dev);
+
+    timer_del(s->ptimer);
+    timer_free(s->ptimer);
+
+    timer_del(s->timer);
+    timer_free(s->timer);
+}
+
+static void wdt_sbsa_gwdt_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->realize = wdt_sbsa_gwdt_realize;
+    dc->unrealize = wdt_sbsa_gwdt_unrealize;
+    dc->reset = wdt_sbsa_gwdt_reset;
+    dc->hotpluggable = false;
+    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
+    dc->vmsd = &vmstate_sbsa_gwdt;
+}
+
+static const TypeInfo wdt_sbsa_gwdt_info = {
+    .class_init = wdt_sbsa_gwdt_class_init,
+    .parent = TYPE_SYS_BUS_DEVICE,
+    .name  = TYPE_WDT_SBSA_GWDT,
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
diff --git a/include/hw/watchdog/wdt_sbsa_gwdt.h b/include/hw/watchdog/wdt_sbsa_gwdt.h
new file mode 100644
index 000000000000..70ba7abb3ace
--- /dev/null
+++ b/include/hw/watchdog/wdt_sbsa_gwdt.h
@@ -0,0 +1,70 @@
+#ifndef WDT_SBSA_GWDT_H
+#define WDT_SBSA_GWDT_H
+
+#include "qemu/bitops.h"
+#include "hw/sysbus.h"
+#include "hw/irq.h"
+
+#define TYPE_WDT_SBSA_GWDT "sbsa_gwdt"
+#define SBSA_GWDT(obj) \
+    OBJECT_CHECK(SBSA_GWDTState, (obj), TYPE_WDT_SBSA_GWDT)
+#define SBSA_GWDT_CLASS(klass) \
+    OBJECT_CLASS_CHECK(SBSA_GWDTClass, (klass), TYPE_WDT_SBSA_GWDT)
+#define SBSA_GWDT_GET_CLASS(obj) \
+    OBJECT_GET_CLASS(SBSA_GWDTClass, (obj), TYPE_WDT_SBSA_GWDT)
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
+/* Watchdog Interface Identification Register definition*/
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
+    QEMUTimer *ptimer, *timer;
+
+    uint32_t id;
+    uint32_t wrr;
+    uint32_t wcs;
+    uint32_t worl;
+    uint32_t woru;
+    uint32_t wcvl;
+    uint32_t wcvu;
+    bool enabled;
+    bool ws0, ws1;
+
+    /*< public >*/
+} SBSA_GWDTState;
+
+#endif /* WDT_SBSA_GWDT_H */
-- 
2.18.4


