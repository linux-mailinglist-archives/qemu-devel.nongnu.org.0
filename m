Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D421E2EC105
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jan 2021 17:22:28 +0100 (CET)
Received: from localhost ([::1]:43010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxBZr-0008W7-Bz
	for lists+qemu-devel@lfdr.de; Wed, 06 Jan 2021 11:22:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maxim.uvarov@linaro.org>)
 id 1kxBYu-0007yP-Oi
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 11:21:28 -0500
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131]:43966)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <maxim.uvarov@linaro.org>)
 id 1kxBYr-0007VZ-JB
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 11:21:28 -0500
Received: by mail-lf1-x131.google.com with SMTP id 23so7722433lfg.10
 for <qemu-devel@nongnu.org>; Wed, 06 Jan 2021 08:21:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QfzBEaW8hSd2HhAG2j9VbHsLNzruC36gvg1hj4FQBy8=;
 b=AM9gkvPy1L+N71esfbLKxPitm8ZRI/42fl2KnexsLU/8LI3VOeSTPN1z8TETArw6CH
 dw9y7749qpE3X1bpqv+Gib0/mXJ/l3oQatLuESY+g3jU09s2ar0qC55q+5TtlVWVzbq6
 yPJ0boUzKJw2qAnZPUKNJPMZztR9yw4EkXRw3l73wlgJTCva0oKOfQGoGjj7MtyxtxcH
 bMp6TTUokT3IrtGtc2D7QrtPa2UC6BroVTycsfRcM4cFTXbRtJNuiYAZRouXqQ6LRn+/
 OQ3JNJrhpGtDccfcCmov7rnWLbT/igKzpCgrJK+Ci1PBA/KK3g4xF0VZlkGK8UCpqTIC
 uTXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QfzBEaW8hSd2HhAG2j9VbHsLNzruC36gvg1hj4FQBy8=;
 b=VjfmHHECK8HsNVBOUXPxG/0MV+CTSLvsFLExnv+Z+6hlD0wHOHqMGG07ORDveb/05v
 9HbNv+C5wfGvn3C/kIdGabgurBpLqMq1+tfD/MC+yHrc/TpKY/DkGo4v6IsnjCnco5s+
 rsh0/vP38Qj6IFT6y2XV9oL72ITZTnuv2r7BQNUqZ01uaDK5o5+ejxZ35ldWk4Tispl4
 VklYnnexe4hSAbAD8KJASB3cziS7EVpSJDvrhVcvESkt2LaAtkmNL6r7cl6YzS+0DpK1
 tcKpaZwZiCjJ9LihR3GGm8Lbg5hhr9LnZ0saUfkAXa6Ybz9NCaw85QnEC5KXtoRGjJmx
 ILQQ==
X-Gm-Message-State: AOAM530+ziRFqT9j7xMzC0iqVuYn4nR4B9FRdHWI+LTVtZ39jlumERKK
 cMRj7np47a0nOCUHzCx2qisqCA==
X-Google-Smtp-Source: ABdhPJzuw6CMODYpg7C9uxjCaqevbDTt5sQGzvMdC4ssPpbYmspCJ+7/f9qOA0QwWJwl3Bx3+blC+Q==
X-Received: by 2002:a19:23d8:: with SMTP id j207mr2391375lfj.144.1609950082913; 
 Wed, 06 Jan 2021 08:21:22 -0800 (PST)
Received: from localhost.localdomain ([176.59.51.124])
 by smtp.gmail.com with ESMTPSA id u14sm498231ljo.72.2021.01.06.08.21.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jan 2021 08:21:22 -0800 (PST)
From: Maxim Uvarov <maxim.uvarov@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCHv2] arm-virt: add secure pl061 for reset/power down
Date: Wed,  6 Jan 2021 19:21:18 +0300
Message-Id: <20210106162118.8869-1-maxim.uvarov@linaro.org>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::131;
 envelope-from=maxim.uvarov@linaro.org; helo=mail-lf1-x131.google.com
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
Cc: peter.maydell@linaro.org, Maxim Uvarov <maxim.uvarov@linaro.org>,
 f4bug@amsat.org, Jose.Marinho@arm.com, tf-a@lists.trustedfirmware.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add secure pl061 for reset/power down machine from
the secure world (Arm Trusted Firmware).
Use the same gpio 3 and gpio 4 which were used by
non acpi variant of linux power control gpios.

Signed-off-by: Maxim Uvarov <maxim.uvarov@linaro.org>
---
 v2: replace printf with qemu_log (Philippe Mathieu-Daudé)

 hw/arm/Kconfig        |  1 +
 hw/arm/virt.c         | 24 +++++++++++++
 hw/gpio/Kconfig       |  3 ++
 hw/gpio/gpio_pwr.c    | 84 +++++++++++++++++++++++++++++++++++++++++++
 hw/gpio/meson.build   |  1 +
 include/hw/arm/virt.h |  1 +
 6 files changed, 114 insertions(+)
 create mode 100644 hw/gpio/gpio_pwr.c

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 0a242e4c5d..13cc42dcc8 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -17,6 +17,7 @@ config ARM_VIRT
     select PL011 # UART
     select PL031 # RTC
     select PL061 # GPIO
+    select GPIO_PWR
     select PLATFORM_BUS
     select SMBIOS
     select VIRTIO_MMIO
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 96985917d3..eff0345303 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -147,6 +147,7 @@ static const MemMapEntry base_memmap[] = {
     [VIRT_RTC] =                { 0x09010000, 0x00001000 },
     [VIRT_FW_CFG] =             { 0x09020000, 0x00000018 },
     [VIRT_GPIO] =               { 0x09030000, 0x00001000 },
+    [VIRT_SECURE_GPIO] =        { 0x09031000, 0x00001000 },
     [VIRT_SECURE_UART] =        { 0x09040000, 0x00001000 },
     [VIRT_SMMU] =               { 0x09050000, 0x00020000 },
     [VIRT_PCDIMM_ACPI] =        { 0x09070000, MEMORY_HOTPLUG_IO_LEN },
@@ -189,6 +190,7 @@ static const int a15irqmap[] = {
     [VIRT_GPIO] = 7,
     [VIRT_SECURE_UART] = 8,
     [VIRT_ACPI_GED] = 9,
+    [VIRT_SECURE_GPIO] = 10,
     [VIRT_MMIO] = 16, /* ...to 16 + NUM_VIRTIO_TRANSPORTS - 1 */
     [VIRT_GIC_V2M] = 48, /* ...to 48 + NUM_GICV2M_SPIS - 1 */
     [VIRT_SMMU] = 74,    /* ...to 74 + NUM_SMMU_IRQS - 1 */
@@ -864,6 +866,24 @@ static void create_gpio(const VirtMachineState *vms)
     g_free(nodename);
 }
 
+static void create_gpio_secure(const VirtMachineState *vms)
+{
+    DeviceState *pl061_dev;
+    static DeviceState *gpio_pwr_dev;
+
+    hwaddr base = vms->memmap[VIRT_SECURE_GPIO].base;
+    int irq = vms->irqmap[VIRT_SECURE_GPIO];
+
+    pl061_dev = sysbus_create_simple("pl061", base,
+                                     qdev_get_gpio_in(vms->gic, irq));
+
+    gpio_pwr_dev = sysbus_create_simple("gpio-pwr", -1,
+                                        qdev_get_gpio_in(pl061_dev, 3));
+
+    qdev_connect_gpio_out(pl061_dev, 3, qdev_get_gpio_in(gpio_pwr_dev, 3));
+    qdev_connect_gpio_out(pl061_dev, 4, qdev_get_gpio_in(gpio_pwr_dev, 4));
+}
+
 static void create_virtio_devices(const VirtMachineState *vms)
 {
     int i;
@@ -1993,6 +2013,10 @@ static void machvirt_init(MachineState *machine)
         create_gpio(vms);
     }
 
+    if (vms->secure) {
+        create_gpio_secure(vms);
+    }
+
      /* connect powerdown request */
      vms->powerdown_notifier.notify = virt_powerdown_req;
      qemu_register_powerdown_notifier(&vms->powerdown_notifier);
diff --git a/hw/gpio/Kconfig b/hw/gpio/Kconfig
index b6fdaa2586..f0e7405f6e 100644
--- a/hw/gpio/Kconfig
+++ b/hw/gpio/Kconfig
@@ -8,5 +8,8 @@ config PL061
 config GPIO_KEY
     bool
 
+config GPIO_PWR
+    bool
+
 config SIFIVE_GPIO
     bool
diff --git a/hw/gpio/gpio_pwr.c b/hw/gpio/gpio_pwr.c
new file mode 100644
index 0000000000..f5868653b3
--- /dev/null
+++ b/hw/gpio/gpio_pwr.c
@@ -0,0 +1,84 @@
+/*
+ * GPIO qemu power controller
+ *
+ * Copyright (c) 2020 Linaro Limited
+ *
+ * Author: Maxim Uvarov <maxim.uvarov@linaro.org>
+ *
+ * Virtual gpio driver which can be used on top of pl061
+ * to reboot and shutdown qemu virtual machine. One of use
+ * case is gpio driver for secure world application (ARM
+ * Trusted Firmware.).
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "hw/irq.h"
+#include "hw/sysbus.h"
+#include "sysemu/runstate.h"
+
+#define TYPE_GPIOPWR "gpio-pwr"
+OBJECT_DECLARE_SIMPLE_TYPE(GPIO_PWR_State, GPIOPWR)
+
+struct GPIO_PWR_State {
+    SysBusDevice parent_obj;
+    qemu_irq irq;
+};
+
+static void gpio_pwr_set_irq(void *opaque, int irq, int level)
+{
+    GPIO_PWR_State *s = (GPIO_PWR_State *)opaque;
+
+    qemu_set_irq(s->irq, 1);
+
+    if (level) {
+        return;
+    }
+
+    switch (irq) {
+    case 3:
+        qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
+        break;
+    case 4:
+        qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_RESET);
+        break;
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "qemu; gpio_pwr: unknown interrupt %d lvl %d\n",
+                      irq, level);
+    }
+}
+
+
+static void gpio_pwr_realize(DeviceState *dev, Error **errp)
+{
+    GPIO_PWR_State *s = GPIOPWR(dev);
+    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
+
+    sysbus_init_irq(sbd, &s->irq);
+    qdev_init_gpio_in(dev, gpio_pwr_set_irq, 8);
+}
+
+static void gpio_pwr_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->realize = gpio_pwr_realize;
+}
+
+static const TypeInfo gpio_pwr_info = {
+    .name          = TYPE_GPIOPWR,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(GPIO_PWR_State),
+    .class_init    = gpio_pwr_class_init,
+};
+
+static void gpio_pwr_register_types(void)
+{
+    type_register_static(&gpio_pwr_info);
+}
+
+type_init(gpio_pwr_register_types)
diff --git a/hw/gpio/meson.build b/hw/gpio/meson.build
index 5c0a7d7b95..79568f00ce 100644
--- a/hw/gpio/meson.build
+++ b/hw/gpio/meson.build
@@ -1,5 +1,6 @@
 softmmu_ss.add(when: 'CONFIG_E500', if_true: files('mpc8xxx.c'))
 softmmu_ss.add(when: 'CONFIG_GPIO_KEY', if_true: files('gpio_key.c'))
+softmmu_ss.add(when: 'CONFIG_GPIO_PWR', if_true: files('gpio_pwr.c'))
 softmmu_ss.add(when: 'CONFIG_MAX7310', if_true: files('max7310.c'))
 softmmu_ss.add(when: 'CONFIG_PL061', if_true: files('pl061.c'))
 softmmu_ss.add(when: 'CONFIG_PUV3', if_true: files('puv3_gpio.c'))
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index abf54fab49..77a4523cc7 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -81,6 +81,7 @@ enum {
     VIRT_GPIO,
     VIRT_SECURE_UART,
     VIRT_SECURE_MEM,
+    VIRT_SECURE_GPIO,
     VIRT_PCDIMM_ACPI,
     VIRT_ACPI_GED,
     VIRT_NVDIMM_ACPI,
-- 
2.17.1


