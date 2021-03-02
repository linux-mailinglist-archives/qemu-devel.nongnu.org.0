Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E764C32A825
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 18:30:36 +0100 (CET)
Received: from localhost ([::1]:53822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH8qx-0004uZ-TX
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 12:30:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <niteesh.gs@gmail.com>)
 id 1lH8q0-0004BG-8C
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 12:29:36 -0500
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:40185)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <niteesh.gs@gmail.com>)
 id 1lH8py-0002w0-2M
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 12:29:36 -0500
Received: by mail-pg1-x534.google.com with SMTP id b21so14284285pgk.7
 for <qemu-devel@nongnu.org>; Tue, 02 Mar 2021 09:29:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=TWuSPvzsgi16A7qVqvx7lzBHy3j06dGROFaxNjVkmh0=;
 b=ka7vVhitUJqOStSzVbOUBMKD6jkM2XYFhc5Sx32NG5VLYDjgDpvYpvQ8gJ5UKr3Yu/
 RARmCwp18BT9n6w3aFelSyALmGSoRm48W+CcHpBDcN88nPoDJeOxsFAOQHUvB2SWrb07
 7H2khjXPv26Tv4IcCEl5daOdyK1GNjoNg9nFlwuRhCsTimYg9Gu1neHXLF78EDnE0pyo
 HXb/UdRliWfa3IeiF6pMM9wKSsdHXoE1S+x7ehQxPaJ2A1SMHR0xpTXy83zT/Tm78wC7
 fXaqQEY9ev0uOb64ZG1CLQa8PUfXVrb7yDcr8OiCEsiK40jAD7NiEm70qlzmaN2QsupB
 xz7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=TWuSPvzsgi16A7qVqvx7lzBHy3j06dGROFaxNjVkmh0=;
 b=hlReW/cYKgQwG2w9a/CMJX4tLpjKTRogCVusu6xiJyUh7Eo8miX6MF06XWSoK4av0U
 4Aslm5QiIuTuCIy/jHu2n15YW8WtiQ4Hu/doaVuSuHstRJS7adbuS94AESTvMvxphheP
 PZiIAa9QF17xaphk42GhIX+wes95u+BrMiybA5lMZat7breVDjvUljIb85yOob+xvGLf
 sPGLjiT/pj8V4SQAee/ABazrsHUj6WhH2oS3bo3MzXrsY1NW2QFYG9unldQ4rpFuw2+s
 D3Wlv+Ppfvws48GirSwy0Y2nbg8jhC9T+JgHCapabEAVrRigvXVSSTSWAsgQawx3Bvln
 ny+g==
X-Gm-Message-State: AOAM532kdugL0y8TJoylu679spDQfkuiSpQCAbX+W1YLnP6E9EYySZU0
 bS+ulnDeUj2HCMPfvLwXJXYSa+B8I5aePA==
X-Google-Smtp-Source: ABdhPJz015s4RuBJluw1kTvAXvjuqS6QRxcxHvZQbjJc6hcO+R/Y1sZPkpapNd4HLAUOVoA1HOR1jQ==
X-Received: by 2002:a65:4904:: with SMTP id p4mr19315477pgs.429.1614706171682; 
 Tue, 02 Mar 2021 09:29:31 -0800 (PST)
Received: from localhost.localdomain ([45.115.91.0])
 by smtp.gmail.com with ESMTPSA id b15sm20122999pgj.84.2021.03.02.09.29.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Mar 2021 09:29:31 -0800 (PST)
From: G S Niteesh Babu <niteesh.gs@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/3] hw/avr: Add limited support for avr gpio registers
Date: Tue,  2 Mar 2021 22:59:17 +0530
Message-Id: <20210302172919.7923-1-niteesh.gs@gmail.com>
X-Mailer: git-send-email 2.17.1
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=niteesh.gs@gmail.com; helo=mail-pg1-x534.google.com
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
Cc: f4bug@amsat.org, heecheol.yang@outlook.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Heecheol Yang <heecheol.yang@outlook.com>

Add some of these features for AVR GPIO:

  - GPIO I/O : PORTx registers
  - Data Direction : DDRx registers
  - DDRx toggling : PINx registers

Following things are not supported yet:
  - MCUR registers

Signed-off-by: Heecheol Yang <heecheol.yang@outlook.com>
---
 hw/avr/Kconfig             |   1 +
 hw/avr/atmega.c            |   7 +-
 hw/avr/atmega.h            |   2 +
 hw/gpio/Kconfig            |   3 +
 hw/gpio/avr_gpio.c         | 139 +++++++++++++++++++++++++++++++++++++
 hw/gpio/meson.build        |   1 +
 include/hw/gpio/avr_gpio.h |  53 ++++++++++++++
 7 files changed, 204 insertions(+), 2 deletions(-)
 create mode 100644 hw/gpio/avr_gpio.c
 create mode 100644 include/hw/gpio/avr_gpio.h

diff --git a/hw/avr/Kconfig b/hw/avr/Kconfig
index d31298c3cc..16a57ced11 100644
--- a/hw/avr/Kconfig
+++ b/hw/avr/Kconfig
@@ -3,6 +3,7 @@ config AVR_ATMEGA_MCU
     select AVR_TIMER16
     select AVR_USART
     select AVR_POWER
+    select AVR_GPIO
 
 config ARDUINO
     select AVR_ATMEGA_MCU
diff --git a/hw/avr/atmega.c b/hw/avr/atmega.c
index 44c6afebbb..ad942028fd 100644
--- a/hw/avr/atmega.c
+++ b/hw/avr/atmega.c
@@ -283,8 +283,11 @@ static void atmega_realize(DeviceState *dev, Error **errp)
             continue;
         }
         devname = g_strdup_printf("atmega-gpio-%c", 'a' + (char)i);
-        create_unimplemented_device(devname,
-                                    OFFSET_DATA + mc->dev[idx].addr, 3);
+        object_initialize_child(OBJECT(dev), devname, &s->gpio[i],
+                                TYPE_AVR_GPIO);
+        sysbus_realize(SYS_BUS_DEVICE(&s->gpio[i]), &error_abort);
+        sysbus_mmio_map(SYS_BUS_DEVICE(&s->gpio[i]), 0,
+            OFFSET_DATA + mc->dev[idx].addr);
         g_free(devname);
     }
 
diff --git a/hw/avr/atmega.h b/hw/avr/atmega.h
index a99ee15c7e..e2289d5744 100644
--- a/hw/avr/atmega.h
+++ b/hw/avr/atmega.h
@@ -13,6 +13,7 @@
 
 #include "hw/char/avr_usart.h"
 #include "hw/timer/avr_timer16.h"
+#include "hw/gpio/avr_gpio.h"
 #include "hw/misc/avr_power.h"
 #include "target/avr/cpu.h"
 #include "qom/object.h"
@@ -44,6 +45,7 @@ struct AtmegaMcuState {
     DeviceState *io;
     AVRMaskState pwr[POWER_MAX];
     AVRUsartState usart[USART_MAX];
+    AVRGPIOState gpio[GPIO_MAX];
     AVRTimer16State timer[TIMER_MAX];
     uint64_t xtal_freq_hz;
 };
diff --git a/hw/gpio/Kconfig b/hw/gpio/Kconfig
index f0e7405f6e..fde7019b2b 100644
--- a/hw/gpio/Kconfig
+++ b/hw/gpio/Kconfig
@@ -13,3 +13,6 @@ config GPIO_PWR
 
 config SIFIVE_GPIO
     bool
+
+config AVR_GPIO
+    bool
diff --git a/hw/gpio/avr_gpio.c b/hw/gpio/avr_gpio.c
new file mode 100644
index 0000000000..7984843841
--- /dev/null
+++ b/hw/gpio/avr_gpio.c
@@ -0,0 +1,139 @@
+/*
+ * AVR processors GPIO registers emulation.
+ *
+ * Copyright (C) 2020 Heecheol Yang <heecheol.yang@outlook.com>
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License as
+ * published by the Free Software Foundation; either version 2 or
+ * (at your option) version 3 of the License.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License along
+ * with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+#include "qemu/osdep.h"
+#include "qemu/log.h"
+#include "qemu/module.h"
+#include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "hw/sysbus.h"
+#include "hw/irq.h"
+#include "hw/gpio/avr_gpio.h"
+#include "hw/qdev-properties.h"
+
+static void avr_gpio_reset(DeviceState *dev)
+{
+    AVRGPIOState *gpio = AVR_GPIO(dev);
+    gpio->reg.pin = 0u;
+    gpio->reg.ddr = 0u;
+    gpio->reg.port = 0u;
+}
+
+static void avr_gpio_write_port(AVRGPIOState *s, uint64_t value)
+{
+    uint8_t pin;
+    uint8_t org_val = value;
+    uint8_t cur_port_val = s->reg.port;
+    uint8_t cur_ddr_val = s->reg.ddr;
+
+    for (pin = 0u; pin < 8u ; pin++) {
+        uint8_t cur_port_pin_val = cur_port_val & 0x01u;
+        uint8_t cur_ddr_pin_val = cur_ddr_val & 0x01u;
+        uint8_t new_port_pin_val = value & 0x01u;
+
+        if (cur_ddr_pin_val && (cur_port_pin_val != new_port_pin_val)) {
+            qemu_set_irq(s->out[pin], new_port_pin_val);
+        }
+        cur_port_val >>= 1u;
+        cur_ddr_val >>= 1u;
+        value >>= 1u;
+    }
+    s->reg.port = org_val & s->reg.ddr;
+}
+static uint64_t avr_gpio_read(void *opaque, hwaddr offset, unsigned int size)
+{
+    AVRGPIOState *s = (AVRGPIOState *)opaque;
+    switch (offset) {
+    case GPIO_PIN:
+        return s->reg.pin;
+    case GPIO_DDR:
+        return s->reg.ddr;
+    case GPIO_PORT:
+        return s->reg.port;
+    default:
+        g_assert_not_reached();
+        break;
+    }
+    return 0;
+}
+
+static void avr_gpio_write(void *opaque, hwaddr offset, uint64_t value,
+                                unsigned int size)
+{
+    AVRGPIOState *s = (AVRGPIOState *)opaque;
+    value = value & 0xFF;
+
+    trace_avr_gpio_write(offset, value);
+    switch (offset) {
+    case GPIO_PIN:
+        s->reg.pin = value;
+        s->reg.port ^= s->reg.pin;
+        break;
+    case GPIO_DDR:
+        s->reg.ddr = value;
+        break;
+    case GPIO_PORT:
+        avr_gpio_write_port(s, value);
+        break;
+    default:
+        g_assert_not_reached();
+        break;
+    }
+}
+
+static const MemoryRegionOps avr_gpio_ops = {
+    .read = avr_gpio_read,
+    .write = avr_gpio_write,
+    .endianness = DEVICE_NATIVE_ENDIAN,
+};
+
+static void avr_gpio_init(Object *obj)
+{
+    AVRGPIOState *s = AVR_GPIO(obj);
+    qdev_init_gpio_out(DEVICE(obj), s->out, ARRAY_SIZE(s->out));
+    memory_region_init_io(&s->mmio, obj, &avr_gpio_ops, s, TYPE_AVR_GPIO, 3);
+    sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->mmio);
+}
+static void avr_gpio_realize(DeviceState *dev, Error **errp)
+{
+    /* Do nothing currently */
+}
+
+
+static void avr_gpio_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->reset = avr_gpio_reset;
+    dc->realize = avr_gpio_realize;
+}
+
+static const TypeInfo avr_gpio_info = {
+    .name          = TYPE_AVR_GPIO,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(AVRGPIOState),
+    .instance_init = avr_gpio_init,
+    .class_init    = avr_gpio_class_init,
+};
+
+static void avr_gpio_register_types(void)
+{
+    type_register_static(&avr_gpio_info);
+}
+
+type_init(avr_gpio_register_types)
diff --git a/hw/gpio/meson.build b/hw/gpio/meson.build
index 79568f00ce..366aca52ca 100644
--- a/hw/gpio/meson.build
+++ b/hw/gpio/meson.build
@@ -13,3 +13,4 @@ softmmu_ss.add(when: 'CONFIG_OMAP', if_true: files('omap_gpio.c'))
 softmmu_ss.add(when: 'CONFIG_RASPI', if_true: files('bcm2835_gpio.c'))
 softmmu_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files('aspeed_gpio.c'))
 softmmu_ss.add(when: 'CONFIG_SIFIVE_GPIO', if_true: files('sifive_gpio.c'))
+softmmu_ss.add(when: 'CONFIG_AVR_GPIO', if_true: files('avr_gpio.c'))
diff --git a/include/hw/gpio/avr_gpio.h b/include/hw/gpio/avr_gpio.h
new file mode 100644
index 0000000000..498a7275f0
--- /dev/null
+++ b/include/hw/gpio/avr_gpio.h
@@ -0,0 +1,53 @@
+/*
+ * AVR processors GPIO registers definition.
+ *
+ * Copyright (C) 2020 Heecheol Yang <heecheol.yang@outlook.com>
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License as
+ * published by the Free Software Foundation; either version 2 or
+ * (at your option) version 3 of the License.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License along
+ * with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef AVR_GPIO_H
+#define AVR_GPIO_H
+
+#include "hw/sysbus.h"
+#include "qom/object.h"
+
+/* Offsets of registers. */
+#define GPIO_PIN   0x00
+#define GPIO_DDR   0x01
+#define GPIO_PORT  0x02
+
+#define TYPE_AVR_GPIO "avr-gpio"
+OBJECT_DECLARE_SIMPLE_TYPE(AVRGPIOState, AVR_GPIO)
+#define AVR_GPIO_COUNT 8
+
+struct AVRGPIOState {
+    /*< private >*/
+    SysBusDevice parent_obj;
+
+    /*< public >*/
+    MemoryRegion mmio;
+
+    struct {
+        uint8_t pin;
+        uint8_t ddr;
+        uint8_t port;
+    } reg;
+
+    /* PORTx data changed IRQs */
+    qemu_irq out[8u];
+
+};
+
+#endif /* AVR_GPIO_H */
-- 
2.17.1


