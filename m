Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B2F5BD3D9
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Sep 2022 19:36:02 +0200 (CEST)
Received: from localhost ([::1]:34354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaKga-0003f1-PE
	for lists+qemu-devel@lfdr.de; Mon, 19 Sep 2022 13:36:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhangjian.3032@bytedance.com>)
 id 1oaKT4-00065C-Ig
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 13:22:02 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:43631)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zhangjian.3032@bytedance.com>)
 id 1oaKSw-0000Qt-Rj
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 13:22:02 -0400
Received: by mail-pf1-x431.google.com with SMTP id d82so233328pfd.10
 for <qemu-devel@nongnu.org>; Mon, 19 Sep 2022 10:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=n8+XgzHYrArgCn4U9y3QEq0TqqXR5edeovdfx2xO/z0=;
 b=axR/v0kNVxD6fIrlxoHyGs86ELdse0K5NR9DOjXFGmw5XimYuv4bovaEGYAJUtYA0h
 1JGAl0rc8UXC+qSOIsJVK7xj1A7vUeJrEj6/MYiSyh9O1p71aULZM5R3nS6PXYSaVyc4
 d/mA9arcSuibuQ/8cMMKdcv7oRQTMpTsWL8SeTiHpWGcur3H65/HLOpfLoLcMtIpfKFT
 UDJMoYvHZaeV9ay6OLU83pF5aY2A2QyM2mgysBJaQGahsw9gpRq+1yVCakc8Z6ESMHh/
 u4DU0NCFoZGK/GXoaiNDJzT1XlrdZRxWRnSrOCOK2eoCS5KXP7Mng9UEs4FODWVQKsks
 ccJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=n8+XgzHYrArgCn4U9y3QEq0TqqXR5edeovdfx2xO/z0=;
 b=EWAjDAeAWS2ZLli8YCF+6WxBhfZjfi8KhI5bsqmmCPEq5GREv56IREprDj9EsSdY0L
 UATe5yBJ/kd2Jf4peYHx0GN97CxcSJJgPmgN8jsB0pcF/hoZR+2JYXviwRXMnvaHmimk
 IAcryYwDo8kedFuqt8hZwomt3so7iCh7xr/aEISOCgy1zqXF4OR1fmYAg7xmkRYmoZW3
 FcKgTzUpPzYnFeHpXLuyrxkMVA9HJie1c+5vhJCavycEgoE/6cQlYWsScKp6x3CKaWze
 JxKvBJ8IMCxN5KOzupTl/LXrAgYkWuPOacvamNQccku2dfxGz5z479A1yDpfWN/oPqh4
 mA1Q==
X-Gm-Message-State: ACrzQf0nAhxqYXrzFDf7Cq+gXkapPtADqPFXRw3JT4ezPARBXlxGED+j
 O1dI99Ds1hG+UlNFtH+m1Ps2ew==
X-Google-Smtp-Source: AMsMyM5ZkCsaEM0n8YBK0D59+lwtTCDcj4A7htNlAqQetXJ2FNWeEwm07VcDtfCeQvQSPeUazcbXdQ==
X-Received: by 2002:a05:6a00:1a8d:b0:547:c564:1614 with SMTP id
 e13-20020a056a001a8d00b00547c5641614mr19244038pfv.71.1663608113591; 
 Mon, 19 Sep 2022 10:21:53 -0700 (PDT)
Received: from localhost ([49.7.199.102]) by smtp.gmail.com with ESMTPSA id
 q6-20020aa79826000000b0053e99f2bf16sm20580236pfl.78.2022.09.19.10.21.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Sep 2022 10:21:53 -0700 (PDT)
From: Jian Zhang <zhangjian.3032@bytedance.com>
To: peter.maydell@linaro.org, clg@kaod.org, andrew@aj.id.au, joel@jms.id.au,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc: yulei.sh@bytedance.com, tangyiwei.2022@bytedance.com,
 chentingting.2150@bytedance.com, yuhao.17@bytedance.com,
 wangxiaohua.1217@bytedance.com, xiening.xll@bytedance.com,
 Jian Zhang <zhangjian.3032@bytedance.com>
Subject: [PATCH 2/3]  hw/misc/host_power: Add a simple host power device
Date: Tue, 20 Sep 2022 01:21:11 +0800
Message-Id: <20220919172112.2706026-3-zhangjian.3032@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220919172112.2706026-1-zhangjian.3032@bytedance.com>
References: <20220919172112.2706026-1-zhangjian.3032@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=zhangjian.3032@bytedance.com; helo=mail-pf1-x431.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 19 Sep 2022 13:29:46 -0400
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

This Host Power device privide a simple power control logic for a host,
like use a bmc to control the power of a host.

This device has 2 gpio, one is input named "button", another gpio is
output named "power-good", when button have a falling edge, invert the
"power-good" gpio.

Signed-off-by: Jian Zhang <zhangjian.3032@bytedance.com>
---
 MAINTAINERS                  |   2 +
 hw/arm/Kconfig               |   1 +
 hw/misc/Kconfig              |   3 +
 hw/misc/host_power.c         | 105 +++++++++++++++++++++++++++++++++++
 hw/misc/meson.build          |   1 +
 include/hw/misc/host_power.h |  41 ++++++++++++++
 6 files changed, 153 insertions(+)
 create mode 100644 hw/misc/host_power.c
 create mode 100644 include/hw/misc/host_power.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 472fbf4f42..5a27a78985 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1068,6 +1068,8 @@ F: tests/qtest/*aspeed*
 F: hw/arm/fby35.c
 F: hw/misc/fby35_sb_cpld.c
 F: hw/misc/intel_me.c
+F: include/hw/misc/host_power.h
+F: hw/misc/host_power.c
 
 NRF51
 M: Joel Stanley <joel@jms.id.au>
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 23330cca52..f6fa364ab7 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -455,6 +455,7 @@ config ASPEED_SOC
     select EMC141X
     select UNIMP
     select LED
+    select HOST_POWER
     select PMBUS
     select MAX31785
 
diff --git a/hw/misc/Kconfig b/hw/misc/Kconfig
index d0e691990a..e0b168ec1d 100644
--- a/hw/misc/Kconfig
+++ b/hw/misc/Kconfig
@@ -147,6 +147,9 @@ config UNIMP
 config LED
     bool
 
+config HOST_POWER
+    bool
+
 config MAC_VIA
     bool
     select MOS6522
diff --git a/hw/misc/host_power.c b/hw/misc/host_power.c
new file mode 100644
index 0000000000..18d2573d5e
--- /dev/null
+++ b/hw/misc/host_power.c
@@ -0,0 +1,105 @@
+/*
+ * QEMU single Host Power device
+ *
+ * Copyright (C) 2022 Jian Zhang <zhangjian.3032@bytedance.com>
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+#include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "migration/vmstate.h"
+#include "hw/qdev-properties.h"
+#include "hw/irq.h"
+#include "hw/misc/host_power.h"
+#include "trace.h"
+
+static void power_control(HostPowerState *s, bool on)
+{
+    if (on) {
+        qemu_set_irq(s->power_good, 1);
+    } else {
+        qemu_set_irq(s->power_good, 0);
+    }
+    s->power_status = on;
+}
+
+static void power_button_handler(void *opaque, int line, int new_state)
+{
+    HostPowerState *s = HOST_POWER(opaque);
+
+    assert(line == 0);
+
+    if (new_state == 0) {
+        /* falling edge, reverse the power status */
+        if (s->power_status == 0) {
+            power_control(s, true);
+        } else {
+            power_control(s, false);
+        }
+    }
+}
+
+static void host_power_reset(DeviceState *dev)
+{
+    HostPowerState *s = HOST_POWER(dev);
+    s->power_status = false;
+}
+
+static const VMStateDescription vmstate_host_power = {
+    .name = TYPE_HOST_POWER,
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static void host_power_realize(DeviceState *dev, Error **errp)
+{
+    HostPowerState *s = HOST_POWER(dev);
+    s->power_status = false;
+
+    /* init a power button gpio as input pin */
+    qdev_init_gpio_in_named(dev, power_button_handler, "power-button", 1);
+
+    /* init a power good gpio as output pin */
+    qdev_init_gpio_out_named(dev, &(s->power_good), "power-good", 1);
+}
+
+static void host_power_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->desc = "Host Power";
+    dc->vmsd = &vmstate_host_power;
+    dc->reset = host_power_reset;
+    dc->realize = host_power_realize;
+    set_bit(DEVICE_CATEGORY_DISPLAY, dc->categories);
+}
+
+static const TypeInfo host_power_info = {
+    .name = TYPE_HOST_POWER,
+    .parent = TYPE_DEVICE,
+    .instance_size = sizeof(HostPowerState),
+    .class_init = host_power_class_init
+};
+
+static void host_power_register_types(void)
+{
+    type_register_static(&host_power_info);
+}
+
+type_init(host_power_register_types)
+
+HostPowerState *host_power_create_simple(Object *parentobj)
+{
+    static const char *name = "host-power";
+    DeviceState *dev;
+
+    dev = qdev_new(TYPE_HOST_POWER);
+
+    object_property_add_child(parentobj, name, OBJECT(dev));
+    qdev_realize_and_unref(dev, NULL, &error_fatal);
+
+    return HOST_POWER(dev);
+}
diff --git a/hw/misc/meson.build b/hw/misc/meson.build
index 87d65c16a6..be14c1399a 100644
--- a/hw/misc/meson.build
+++ b/hw/misc/meson.build
@@ -9,6 +9,7 @@ softmmu_ss.add(when: 'CONFIG_SGA', if_true: files('sga.c'))
 softmmu_ss.add(when: 'CONFIG_UNIMP', if_true: files('unimp.c'))
 softmmu_ss.add(when: 'CONFIG_EMPTY_SLOT', if_true: files('empty_slot.c'))
 softmmu_ss.add(when: 'CONFIG_LED', if_true: files('led.c'))
+softmmu_ss.add(when: 'CONFIG_HOST_POWER', if_true: files('host_power.c'))
 softmmu_ss.add(when: 'CONFIG_PVPANIC_COMMON', if_true: files('pvpanic.c'))
 
 # ARM devices
diff --git a/include/hw/misc/host_power.h b/include/hw/misc/host_power.h
new file mode 100644
index 0000000000..a2d12ded27
--- /dev/null
+++ b/include/hw/misc/host_power.h
@@ -0,0 +1,41 @@
+/*
+ * QEMU Host Power device
+ *
+ * Copyright (C) Jian Zhang <zhangjian.3032@bytedance.com>
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+#ifndef HW_MISC_HOST_POWER_H
+#define HW_MISC_HOST_POWER_H
+
+#include "qom/object.h"
+#include "hw/qdev-core.h"
+
+#define TYPE_HOST_POWER "host-power"
+
+struct HostPowerState {
+    /* Private */
+    DeviceState parent_obj;
+    /* Public */
+
+    qemu_irq power_button;
+    qemu_irq power_good;
+
+    /* Properties */
+    bool power_status;
+    char *description;
+};
+typedef struct HostPowerState HostPowerState;
+DECLARE_INSTANCE_CHECKER(HostPowerState, HOST_POWER, TYPE_HOST_POWER)
+
+/**
+ * host_power_create_simple: Create and realize a  device
+ * @parentobj: the parent object
+ *
+ * Create the device state structure, initialize it, and
+ * drop the reference to it (the device is realized).
+ *
+ */
+HostPowerState *host_power_create_simple(Object *parentobj);
+
+#endif /* HW_MISC_HOST_POWER_H */
-- 
2.25.1


