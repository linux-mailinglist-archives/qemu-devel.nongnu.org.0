Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 092FE26E701
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Sep 2020 23:00:46 +0200 (CEST)
Received: from localhost ([::1]:55030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kJ11I-0002Xf-KA
	for lists+qemu-devel@lfdr.de; Thu, 17 Sep 2020 17:00:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1kIyOs-00084D-74
 for qemu-devel@nongnu.org; Thu, 17 Sep 2020 14:12:54 -0400
Received: from mail-qv1-xf41.google.com ([2607:f8b0:4864:20::f41]:43383)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1kIyOp-0007XY-Lm
 for qemu-devel@nongnu.org; Thu, 17 Sep 2020 14:12:53 -0400
Received: by mail-qv1-xf41.google.com with SMTP id cr8so1451438qvb.10
 for <qemu-devel@nongnu.org>; Thu, 17 Sep 2020 11:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=vi2tBTnmk/vRLvVMLOo5DMMva4xANKkHA12Ad3xVztQ=;
 b=fqL1fVEqe7Zih+tQ3kLIVMMYFsGRcgpTgXYg/PZI0AIPYqXaM05W98UmkfFJKUNz6a
 g2cCKABTwR6p4a2T0zIPp1aeOR+UDkdh9Mfy47KCzOcx+KcR+7MwWAEaEIHF9pX2HB2j
 dNC75izYVS36DVZj6hFcCLO9rZ7CKdUwkoqwsXHGwIUVkx5TM7/ZAmyjDDlLJuhmlsQn
 4YPj/X6Kpa36NujL4fSnzTO2QMWIjw4pmDr9vODvlIA1dRpRP4vlbmEhg9BcZ05xLjds
 /7+aEZZjmKY8j/4Fv4Ll1/2aNZ+ntaeonCN1dBYWG5Gw5GFs8oO0NOv+6jbB1Ka0JVly
 +o/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=vi2tBTnmk/vRLvVMLOo5DMMva4xANKkHA12Ad3xVztQ=;
 b=jhYnJeOrEriQ9mZxkzi4dlSPnE3upJtNC0yCogS7VRk2mxPmvQWx1S+CfSkpZB0zbz
 xfDnDRgYWUb0jzy+Y9B75BxQ745P77VWltlK+GP/HbXqPXu5AMVw13/sFgZIXZHDNg5r
 /ctKjZaXuwPXYSeiAdb8peqQPqgwbya+QPF5o17cLnpVxeUzwAmwk/d2/g8HlBtJvKuW
 6Eb0TMBxKtIi4Xs6ftJ96Bno4Xe0mSZuP+T4OYYG2KsT9zTXTPQjtPJC5D0+eDNx0d1a
 P+VY5GA/LUK+szA5NC+82X0m3vqEEnqVzqQBl/SmQ2OHQbuLYI1WUSk5/sxpgSE5LD9v
 8R2Q==
X-Gm-Message-State: AOAM533T9SAmonOr5Q9ZkjhpF1addSsCEVq3eaTF0MTleLVuUKO24WLy
 nyBokEF+TSb6VjYpOuhHQlDOgQ==
X-Google-Smtp-Source: ABdhPJzTUGLMhup8I8Ypbo47Gfw46PYjFeVJHjdCnMBzbpa33+QqQP1w+iHihZ9CojzuHSHSzZR80Q==
X-Received: by 2002:a0c:eac5:: with SMTP id y5mr29960099qvp.2.1600366367952;
 Thu, 17 Sep 2020 11:12:47 -0700 (PDT)
Received: from master.hitronhub.home ([2607:fea8:e2a0:e950::661])
 by smtp.googlemail.com with ESMTPSA id s192sm364556qke.50.2020.09.17.11.12.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Sep 2020 11:12:47 -0700 (PDT)
From: Shashi Mallela <shashi.mallela@linaro.org>
To: peter.maydell@linaro.org,
	leif@nuviainc.com,
	rad@semihalf.com
Subject: [PATCH] hw/watchdog: Implement generic watchdog device model as per
 ARM BSAv0.9 hw/arm/sbsa-ref : Include SBSA watchdog device in sbsa-ref
 platform
Date: Thu, 17 Sep 2020 14:12:45 -0400
Message-Id: <20200917181245.132819-1-shashi.mallela@linaro.org>
X-Mailer: git-send-email 2.18.4
Received-SPF: pass client-ip=2607:f8b0:4864:20::f41;
 envelope-from=shashi.mallela@linaro.org; helo=mail-qv1-xf41.google.com
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
X-Mailman-Approved-At: Thu, 17 Sep 2020 16:57:34 -0400
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

Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
---
 hw/arm/Kconfig                      |   1 +
 hw/arm/sbsa-ref.c                   |  23 ++
 hw/watchdog/Kconfig                 |   4 +
 hw/watchdog/meson.build             |   1 +
 hw/watchdog/wdt_sbsa_gwdt.c         | 343 ++++++++++++++++++++++++++++
 include/hw/watchdog/wdt_sbsa_gwdt.h |  68 ++++++
 6 files changed, 440 insertions(+)
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
diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
index ac68b4640d0d..652079a12e37 100644
--- a/hw/arm/sbsa-ref.c
+++ b/hw/arm/sbsa-ref.c
@@ -40,6 +40,7 @@
 #include "hw/qdev-properties.h"
 #include "hw/usb.h"
 #include "hw/char/pl011.h"
+#include "hw/watchdog/wdt_sbsa_gwdt.h"
 #include "net/net.h"
 #include "qom/object.h"
 
@@ -64,6 +65,9 @@ enum {
     SBSA_GIC_DIST,
     SBSA_GIC_REDIST,
     SBSA_SECURE_EC,
+    SBSA_GWDT,
+    SBSA_GWDT_REFRESH,
+    SBSA_GWDT_CONTROL,
     SBSA_SMMU,
     SBSA_UART,
     SBSA_RTC,
@@ -111,6 +115,8 @@ static const MemMapEntry sbsa_ref_memmap[] = {
     [SBSA_GIC_DIST] =           { 0x40060000, 0x00010000 },
     [SBSA_GIC_REDIST] =         { 0x40080000, 0x04000000 },
     [SBSA_SECURE_EC] =          { 0x50000000, 0x00001000 },
+    [SBSA_GWDT_REFRESH] =       { 0x50010000, 0x00001000 },
+    [SBSA_GWDT_CONTROL] =       { 0x50011000, 0x00001000 },
     [SBSA_UART] =               { 0x60000000, 0x00001000 },
     [SBSA_RTC] =                { 0x60010000, 0x00001000 },
     [SBSA_GPIO] =               { 0x60020000, 0x00001000 },
@@ -140,6 +146,7 @@ static const int sbsa_ref_irqmap[] = {
     [SBSA_SECURE_UART_MM] = 9,
     [SBSA_AHCI] = 10,
     [SBSA_EHCI] = 11,
+    [SBSA_GWDT] = 12,
 };
 
 static uint64_t sbsa_ref_cpu_mp_affinity(SBSAMachineState *sms, int idx)
@@ -454,6 +461,20 @@ static void create_rtc(const SBSAMachineState *sms)
     sysbus_create_simple("pl031", base, qdev_get_gpio_in(sms->gic, irq));
 }
 
+static void create_wdt(const SBSAMachineState *sms)
+{
+    hwaddr rbase = sbsa_ref_memmap[SBSA_GWDT_REFRESH].base;
+    hwaddr cbase = sbsa_ref_memmap[SBSA_GWDT_CONTROL].base;
+    DeviceState *dev = qdev_new(TYPE_WDT_SBSA_GWDT);
+    SysBusDevice *s = SYS_BUS_DEVICE(dev);
+    int irq = sbsa_ref_irqmap[SBSA_GWDT];
+
+    sysbus_realize_and_unref(s, &error_fatal);
+    sysbus_mmio_map(s, 0, rbase);
+    sysbus_mmio_map(s, 1, cbase);
+    sysbus_connect_irq(s, 0, qdev_get_gpio_in(sms->gic, irq));
+}
+
 static DeviceState *gpio_key_dev;
 static void sbsa_ref_powerdown_req(Notifier *n, void *opaque)
 {
@@ -737,6 +758,8 @@ static void sbsa_ref_init(MachineState *machine)
 
     create_rtc(sms);
 
+    create_wdt(sms);
+
     create_gpio(sms);
 
     create_ahci(sms);
diff --git a/hw/watchdog/Kconfig b/hw/watchdog/Kconfig
index 293209b291d6..94ac0d5b76b1 100644
--- a/hw/watchdog/Kconfig
+++ b/hw/watchdog/Kconfig
@@ -17,3 +17,7 @@ config WDT_DIAG288
 
 config WDT_IMX2
     bool
+
+config WDT_SBSA_GWDT
+    bool
+    default y if SBSA_REF
\ No newline at end of file
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
index 000000000000..eb3be0862cf1
--- /dev/null
+++ b/hw/watchdog/wdt_sbsa_gwdt.c
@@ -0,0 +1,343 @@
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
+        fprintf(stderr, "bad address in refresh frame read : 0x%x\n",
+                      (int)addr);
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
+        fprintf(stderr, "bad address in control frame read : 0x%x\n",
+                         (int)addr);
+    }
+    return ret;
+}
+
+static void sbsa_gwdt_update_timer(SBSA_GWDTState *s, bool refresh,
+                                   bool expired)
+{
+    uint64_t timeout = 0;
+
+    if (s->enabled) {
+        if ((refresh) || (expired && !s->ws0)) {
+            /*
+             * Extract the upper 16 bits from woru & 32 bits from worl
+             * registers to construct the 48 bit offset value
+             */
+            timeout = s->woru & SBSA_GWDT_WOR_MASK;
+            timeout <<= 32;
+            timeout |= s->worl;
+            timeout += qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+
+            /* store the current timeout value into compare registers */
+            s->wcvu = timeout >> 32;
+            s->wcvl = timeout;
+        } else {
+            timeout = s->wcvu;
+            timeout <<= 32;
+            timeout |= s->wcvl;
+        }
+
+        if (!s->ws0) {
+            timer_del(s->timer);
+            timer_mod(s->ptimer,
+                       timeout * NANOSECONDS_PER_SECOND);
+        } else {
+            timer_del(s->ptimer);
+            timer_mod(s->timer,
+                       timeout * NANOSECONDS_PER_SECOND);
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
+        sbsa_gwdt_update_timer(s, true , false);
+    } else {
+        fprintf(stderr, "bad address in refresh frame write : 0x%x\n",
+                        (int)offset);
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
+            s->ws0 = false;
+            s->ws1 = false;
+        }
+        sbsa_gwdt_update_timer(s, false, false);
+        break;
+
+    case SBSA_GWDT_WOR:
+        s->worl = data;
+        /*
+         * TODO:- setting woru to 0 and triggering update timer(below) is a
+         * temporary workaround to handle current linux driver which is
+         * based on earlier version of BSA specification.Once the linux
+         * driver is updated to BSA v0.9 will remove these next 2 lines.
+         */
+        s->woru = 0;
+        sbsa_gwdt_update_timer(s, true , false);
+        break;
+
+    case SBSA_GWDT_WORU:
+        s->woru = data;
+        sbsa_gwdt_update_timer(s, true , false);
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
+        fprintf(stderr, "bad address in control frame write : 0x%x\n",
+                (int)offset);
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
+    sbsa_gwdt_update_timer(s, false, true);
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
index 000000000000..8044646fa62d
--- /dev/null
+++ b/include/hw/watchdog/wdt_sbsa_gwdt.h
@@ -0,0 +1,68 @@
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


