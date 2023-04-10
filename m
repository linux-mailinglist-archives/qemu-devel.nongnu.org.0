Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE9746DCA3A
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Apr 2023 19:51:11 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1plveh-00027J-NK; Mon, 10 Apr 2023 13:50:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <morbidrsa@gmail.com>)
 id 1plveY-00022R-Nn
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 13:50:10 -0400
Received: from mail-ej1-f47.google.com ([209.85.218.47])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <morbidrsa@gmail.com>)
 id 1plveW-0002NG-O8
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 13:50:06 -0400
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-94a34a0b9e2so104304666b.1
 for <qemu-devel@nongnu.org>; Mon, 10 Apr 2023 10:50:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681149003;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kmJdS+UNWtRGRmUQMkJm593ZKkMfzAjPRmYbqbhhPew=;
 b=6uIcME+X59ilSbc3qf3lYZZSx5+f5mVy3V6oNwEldGndxh3k6wsoxkItQxwtBDOE8i
 8pIw4DKA5gUXb94p1Ae+aFUu+3bSmg9T43QU1UXFuadKgZVhPtJPMlbcsvQz3NJi9HIm
 9bwcsgTHMtLxuWkflvGiOQaMuMCl2rY3LwuXp09QnjixfyK2UENAlhduWTyeh8xg331s
 a376TcamkWejb0ZQhijMxXPTPSPMOBQ1bz1EAfbKR5fmUDSjPOXky8eHB49pyeWWyH4/
 t31pXu/bdY15NGRBX+RP7DjuAKrHsr0zc3EeuMOjg+I2sTd4xf9mQdnSq85b9WXzKtL0
 HGZQ==
X-Gm-Message-State: AAQBX9eG4XhcJp424H5N1AdG6FEAOiCVhJFd7ZrOxmyQAJth3923iN51
 F39di4LUBMeTtB4elO4933gxoayc5MiOqo6/
X-Google-Smtp-Source: AKy350ZlVsrg5MkyY5ZOYNQ30QCYyeuwUgVM9Q6aXlPEpDUqpFQhqWSBQGa6L23cwkU16EPPOz4ZdQ==
X-Received: by 2002:a05:6402:12c9:b0:4a0:e305:a0de with SMTP id
 k9-20020a05640212c900b004a0e305a0demr12059550edx.19.1681149003218; 
 Mon, 10 Apr 2023 10:50:03 -0700 (PDT)
Received: from localhost.localdomain
 (aftr-82-135-86-174.dynamic.mnet-online.de. [82.135.86.174])
 by smtp.googlemail.com with ESMTPSA id
 n19-20020a509353000000b005002daeb27asm5129282eda.37.2023.04.10.10.50.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Apr 2023 10:50:02 -0700 (PDT)
From: Johannes Thumshirn <jth@kernel.org>
To: qemu-devel@nongnu.org
Cc: Alistair Francis <alistair@alistair23.me>,
 Javier Rodriguez <josejavier.rodriguez@duagon.com>,
 =?UTF-8?q?Jorge=20Sanjuan=20Garc=C3=ADa?= <Jorge.SanjuanGarcia@duagon.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Dmitry Fomichev <dmitry.fomichev@wdc.com>,
 Johannes Thumshirn <jth@kernel.org>
Subject: [PATCH v3 4/4] wdt_z069: Add support for MEN 16z069 Watchdog
Date: Mon, 10 Apr 2023 19:49:10 +0200
Message-Id: <20230410174910.4806-5-jth@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230410174910.4806-1-jth@kernel.org>
References: <20230410174910.4806-1-jth@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.218.47; envelope-from=morbidrsa@gmail.com;
 helo=mail-ej1-f47.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Add 16z069 Watchdog over MEN Chameleon BUS emulation.

Signed-off-by: Johannes Thumshirn <jth@kernel.org>
---
 hw/watchdog/Kconfig     |   5 +
 hw/watchdog/meson.build |   1 +
 hw/watchdog/wdt_z069.c  | 218 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 224 insertions(+)
 create mode 100644 hw/watchdog/wdt_z069.c

diff --git a/hw/watchdog/Kconfig b/hw/watchdog/Kconfig
index 66e1d029e3..a3f1196f66 100644
--- a/hw/watchdog/Kconfig
+++ b/hw/watchdog/Kconfig
@@ -20,3 +20,8 @@ config WDT_IMX2
 
 config WDT_SBSA
     bool
+
+config WDT_Z069
+    bool
+    default y if MCB
+    depends on MCB
diff --git a/hw/watchdog/meson.build b/hw/watchdog/meson.build
index 8974b5cf4c..7bc353774e 100644
--- a/hw/watchdog/meson.build
+++ b/hw/watchdog/meson.build
@@ -6,4 +6,5 @@ softmmu_ss.add(when: 'CONFIG_WDT_DIAG288', if_true: files('wdt_diag288.c'))
 softmmu_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files('wdt_aspeed.c'))
 softmmu_ss.add(when: 'CONFIG_WDT_IMX2', if_true: files('wdt_imx2.c'))
 softmmu_ss.add(when: 'CONFIG_WDT_SBSA', if_true: files('sbsa_gwdt.c'))
+softmmu_ss.add(when: 'CONFIG_WDT_Z069', if_true: files('wdt_z069.c'))
 specific_ss.add(when: 'CONFIG_PSERIES', if_true: files('spapr_watchdog.c'))
diff --git a/hw/watchdog/wdt_z069.c b/hw/watchdog/wdt_z069.c
new file mode 100644
index 0000000000..b20ceab532
--- /dev/null
+++ b/hw/watchdog/wdt_z069.c
@@ -0,0 +1,218 @@
+/*
+ * QEMU MEN 16z069 Watchdog over MCB emulation
+ *
+ * Copyright (C) 2023 Johannes Thumshirn <jth@kernel.org>
+ *
+ * This code is licensed under the GPL version 2 or later. See the
+ * COPYING file in the top-level directory.
+ */
+#include "qemu/osdep.h"
+#include "qemu/module.h"
+#include "qemu/timer.h"
+#include "sysemu/watchdog.h"
+#include "hw/mcb/mcb.h"
+#include "migration/vmstate.h"
+#include "hw/qdev-properties.h"
+
+/* #define Z069_DEBUG 1 */
+
+#ifdef Z069_DEBUG
+#define z069_debug(fmt, ...)                                        \
+    fprintf(stderr, "wdt_z069: %s: "fmt, __func__, ##__VA_ARGS__)
+#else
+#define z069_debug(fmt, ...)
+#endif
+
+#define MEN_Z069_WTR 0x10
+#define MEN_Z069_WTR_WDEN BIT(15)
+#define MEN_Z069_WTR_WDET_MASK  0x7fff
+#define MEN_Z069_WVR 0x14
+
+#define CLK_500(x) ((x) * 2) /* 500Hz in ms */
+
+typedef struct {
+    /*< private >*/
+    MCBDevice dev;
+
+    /*< public >*/
+    QEMUTimer *timer;
+
+    bool enabled;
+    unsigned int timeout;
+
+    MemoryRegion mmio;
+
+    /* Registers */
+    uint16_t wtr;
+    uint16_t wvr;
+} MENZ069State;
+
+static void men_z069_wdt_enable(MENZ069State *s)
+{
+    z069_debug("next timeout will fire in +%dms\n", s->timeout);
+    timer_mod(s->timer, qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL) + s->timeout);
+}
+
+static void men_z069_wdt_disable(MENZ069State *s)
+{
+    timer_del(s->timer);
+}
+
+static uint64_t men_z069_wdt_read(void *opaque, hwaddr addr, unsigned size)
+{
+    MENZ069State *s = opaque;
+    uint64_t ret;
+
+    switch (addr) {
+    case MEN_Z069_WTR:
+        ret = s->wtr;
+        break;
+    case MEN_Z069_WVR:
+        ret = s->wvr;
+        break;
+    default:
+        ret = 0UL;
+        break;
+    }
+
+    z069_debug("returning: 0x%"PRIx64" @ 0x%lx\n", ret, addr);
+    return ret;
+}
+
+static void men_z069_wdt_write(void *opaque, hwaddr addr, uint64_t v,
+                               unsigned size)
+{
+    MENZ069State *s = opaque;
+    bool old_ena = s->enabled;
+    uint16_t val = v & 0xffff;
+    uint16_t tout;
+
+    z069_debug("got: 0x%"PRIx64" @ 0x%lx\n", v, addr);
+
+    switch (addr) {
+    case MEN_Z069_WTR:
+        s->wtr = val;
+        tout = val & MEN_Z069_WTR_WDET_MASK;
+        s->timeout = CLK_500(tout);
+        s->enabled = val & MEN_Z069_WTR_WDEN;
+        z069_debug("new timeout: %u (0x%x) %u\n", tout, tout, s->timeout);
+
+        if (old_ena && !s->enabled) {
+            men_z069_wdt_disable(s);
+        } else if (!old_ena && s->enabled) {
+            men_z069_wdt_enable(s);
+        }
+
+        break;
+    case MEN_Z069_WVR:
+        /* The watchdog trigger value toggles between 0x5555 and 0xaaaa */
+        if (val == (s->wvr ^ 0xffff)) {
+            s->wvr = val;
+            z069_debug("watchdog triggered, next timeout will fire in +%dms\n",
+                       s->timeout);
+            timer_mod(s->timer,
+                      qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL) + s->timeout);
+        }
+        break;
+    default:
+        break;
+    }
+    return;
+}
+
+static const MemoryRegionOps men_z069_io_ops = {
+    .read = men_z069_wdt_read,
+    .write = men_z069_wdt_write,
+    .endianness = DEVICE_LITTLE_ENDIAN,
+    .valid = {
+        .min_access_size = 4,
+        .max_access_size = 4
+    },
+    .impl = {
+        .min_access_size = 4,
+        .max_access_size = 4
+    },
+};
+
+static void men_z069_timer_expired(void *opaque)
+{
+    MENZ069State *s = opaque;
+
+    watchdog_perform_action();
+    timer_del(s->timer);
+}
+
+static void men_z069_wdt_realize(DeviceState *dev, Error **errp)
+{
+    MCBDevice *mdev = MCB_DEVICE(dev);
+    MENZ069State *s = DO_UPCAST(MENZ069State, dev, mdev);
+    MCBus *bus = MCB_BUS(qdev_get_parent_bus(DEVICE(dev)));
+
+    mdev->gdd = mcb_new_chameleon_descriptor(bus, 69, mdev->rev,
+                                             mdev->var, 0x18);
+    if (!mdev->gdd) {
+        return;
+    }
+
+    s->wvr = 0x5555;
+    s->wtr = 0x7fff;
+    s->timeout = CLK_500(s->wtr & MEN_Z069_WTR_WDET_MASK);
+    s->timer = timer_new_ms(QEMU_CLOCK_VIRTUAL,
+                            men_z069_timer_expired, s);
+
+    memory_region_init_io(&s->mmio, OBJECT(s),
+                          &men_z069_io_ops, s, "z069.wdt", 0x16);
+    memory_region_add_subregion(&bus->mmio_region, mdev->gdd->offset,
+                                &s->mmio);
+}
+
+static void men_z069_wdt_unrealize(DeviceState *dev)
+{
+    MCBDevice *mdev = MCB_DEVICE(dev);
+
+    g_free(&mdev->gdd);
+}
+
+static const VMStateDescription vmstate_z069_wdt = {
+    .name = "z069-wdt",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_MCB_DEVICE(dev, MENZ069State),
+        VMSTATE_TIMER_PTR(timer, MENZ069State),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static Property men_z069_wdt_properties[] = {
+    DEFINE_PROP_UINT8("rev", MENZ069State, dev.rev, 0),
+    DEFINE_PROP_UINT8("var", MENZ069State, dev.var, 0),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void men_z069_wdt_class_intifn(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    MCBDeviceClass *mc = MCB_DEVICE_CLASS(klass);
+
+    mc->realize = men_z069_wdt_realize;
+    mc->unrealize = men_z069_wdt_unrealize;
+
+    dc->desc = "MEN 16z069 Watchdog Timer";
+    dc->vmsd = &vmstate_z069_wdt;
+    device_class_set_props(dc, men_z069_wdt_properties);
+}
+
+static const TypeInfo men_z069_wdt_info = {
+    .name = "z069-wdt",
+    .parent = TYPE_MCB_DEVICE,
+    .instance_size = sizeof(MENZ069State),
+    .class_init = men_z069_wdt_class_intifn,
+};
+
+static void men_z069_wdt_register_types(void)
+{
+    type_register_static(&men_z069_wdt_info);
+}
+
+type_init(men_z069_wdt_register_types);
-- 
2.39.2


