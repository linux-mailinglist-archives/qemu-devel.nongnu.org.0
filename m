Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 860EF3B4A02
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 23:10:17 +0200 (CEST)
Received: from localhost ([::1]:57672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwt5c-00055v-63
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 17:10:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nolan@voxel.sigbus.net>)
 id 1lwt4g-0004LB-BY
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 17:09:18 -0400
Received: from phong.sigbus.net ([2605:2700:0:17:a800:ff:fe3e:ad08]:54464)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nolan@voxel.sigbus.net>)
 id 1lwt4d-0003MQ-Ni
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 17:09:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=sigbus.net; s=2020;
 t=1624654934; bh=wtugsWe9E6HXj/QraXbFEI1U4PdNbjFc2Y91F4CKS3w=;
 h=From:To:Cc:Subject:Date:From;
 b=Y1Fp0TRWnIYUJE+H74MzsfymLIELNETIy0txIgRmTCsA9b09+jDUxScPnrS/Iih/b
 KF/041mHGhOgHunEYjSFsnD/M7ZPmUDUbtBYwU0FFfUbzrkQt1ye0UPB3T8VmkNs+R
 QgG1BVAbimID+FKgOsyne21kgbPWwpdh3Mao9AvPNKKD+X6uFEMaiSfbep2u9Q4Mey
 pUZFdHTfZFp0rt/iMBS3oZc/5F3siACHQoskW+V4yjWJUUs7WtqZnHDCCLDZsvGPGn
 AUl9P4z6emMA+8o7/rZTdGzfHgSJ+cGNUBBgZKHs9qsVJNiyzJbhRR07lRt6V4HaTZ
 8NBTTCMZwu/HA==
Received: (nullmailer pid 1870328 invoked by uid 1000);
 Fri, 25 Jun 2021 21:02:14 -0000
From: Nolan Leake <nolan@sigbus.net>
To: qemu-devel@nongnu.org
Subject: [PATCH v3] Add basic power management to raspi.
Date: Fri, 25 Jun 2021 14:02:09 -0700
Message-Id: <20210625210209.1870217-1-nolan@sigbus.net>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2605:2700:0:17:a800:ff:fe3e:ad08;
 envelope-from=nolan@voxel.sigbus.net; helo=phong.sigbus.net
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NO_DNS_FOR_FROM=0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Nolan Leake <nolan@sigbus.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is just enough to make reboot and poweroff work. Works for
linux, u-boot, and the arm trusted firmware. Not tested, but should
work for plan9, and bare-metal/hobby OSes, since they seem to generally
do what linux does for reset.

The watchdog timer functionality is not yet implemented.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/64
Signed-off-by: Nolan Leake <nolan@sigbus.net>
---
 hw/arm/bcm2835_peripherals.c         |  13 ++-
 hw/misc/bcm2835_powermgt.c           | 160 +++++++++++++++++++++++++++
 hw/misc/meson.build                  |   1 +
 include/hw/arm/bcm2835_peripherals.h |   3 +-
 include/hw/misc/bcm2835_powermgt.h   |  29 +++++
 5 files changed, 204 insertions(+), 2 deletions(-)
 create mode 100644 hw/misc/bcm2835_powermgt.c
 create mode 100644 include/hw/misc/bcm2835_powermgt.h

diff --git hw/arm/bcm2835_peripherals.c hw/arm/bcm2835_peripherals.c
index dcff13433e..48538c9360 100644
--- hw/arm/bcm2835_peripherals.c
+++ hw/arm/bcm2835_peripherals.c
@@ -126,6 +126,10 @@ static void bcm2835_peripherals_init(Object *obj)
 
     object_property_add_const_link(OBJECT(&s->dwc2), "dma-mr",
                                    OBJECT(&s->gpu_bus_mr));
+
+    /* Power Management */
+    object_initialize_child(obj, "powermgt", &s->powermgt,
+                            TYPE_BCM2835_POWERMGT);
 }
 
 static void bcm2835_peripherals_realize(DeviceState *dev, Error **errp)
@@ -364,9 +368,16 @@ static void bcm2835_peripherals_realize(DeviceState *dev, Error **errp)
         qdev_get_gpio_in_named(DEVICE(&s->ic), BCM2835_IC_GPU_IRQ,
                                INTERRUPT_USB));
 
+    /* Power Management */
+    if (!sysbus_realize(SYS_BUS_DEVICE(&s->powermgt), errp)) {
+        return;
+    }
+
+    memory_region_add_subregion(&s->peri_mr, PM_OFFSET,
+                sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->powermgt), 0));
+
     create_unimp(s, &s->txp, "bcm2835-txp", TXP_OFFSET, 0x1000);
     create_unimp(s, &s->armtmr, "bcm2835-sp804", ARMCTRL_TIMER0_1_OFFSET, 0x40);
-    create_unimp(s, &s->powermgt, "bcm2835-powermgt", PM_OFFSET, 0x114);
     create_unimp(s, &s->i2s, "bcm2835-i2s", I2S_OFFSET, 0x100);
     create_unimp(s, &s->smi, "bcm2835-smi", SMI_OFFSET, 0x100);
     create_unimp(s, &s->spi[0], "bcm2835-spi0", SPI0_OFFSET, 0x20);
diff --git hw/misc/bcm2835_powermgt.c hw/misc/bcm2835_powermgt.c
new file mode 100644
index 0000000000..dcdd6d1ea7
--- /dev/null
+++ hw/misc/bcm2835_powermgt.c
@@ -0,0 +1,160 @@
+/*
+ * BCM2835 Power Management emulation
+ *
+ * Copyright (C) 2017 Marcin Chojnacki <marcinch7@gmail.com>
+ * Copyright (C) 2021 Nolan Leake <nolan@sigbus.net>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/log.h"
+#include "qemu/module.h"
+#include "hw/misc/bcm2835_powermgt.h"
+#include "migration/vmstate.h"
+#include "sysemu/runstate.h"
+
+#define PASSWORD 0x5a000000
+#define PASSWORD_MASK 0xff000000
+
+#define R_RSTC 0x1c
+#define V_RSTC_RESET 0x20
+#define R_RSTS 0x20
+#define V_RSTS_POWEROFF 0x555 /* Linux uses partition 63 to indicate halt. */
+#define R_WDOG 0x24
+
+static uint64_t bcm2835_powermgt_read(void *opaque, hwaddr offset,
+                                      unsigned size)
+{
+    BCM2835PowerMgtState *s = (BCM2835PowerMgtState *)opaque;
+    uint32_t res = 0;
+
+    switch (offset) {
+    case R_RSTC:
+        res = s->rstc;
+        break;
+    case R_RSTS:
+        res = s->rsts;
+        break;
+    case R_WDOG:
+        res = s->wdog;
+        break;
+
+    default:
+        qemu_log_mask(LOG_UNIMP,
+                      "bcm2835_powermgt_read: Unknown offset 0x%08"HWADDR_PRIx
+                      "\n", offset);
+        res = 0;
+        break;
+    }
+
+    return res;
+}
+
+static void bcm2835_powermgt_write(void *opaque, hwaddr offset,
+                                   uint64_t value, unsigned size)
+{
+    BCM2835PowerMgtState *s = (BCM2835PowerMgtState *)opaque;
+
+    if ((value & PASSWORD_MASK) != PASSWORD) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "bcm2835_powermgt_write: Bad password 0x%"PRIx64
+                      " at offset 0x%08"HWADDR_PRIx"\n",
+                      value, offset);
+        return;
+    }
+
+    value = value & ~PASSWORD_MASK;
+
+    switch (offset) {
+    case R_RSTC:
+        s->rstc = value;
+        if (value & V_RSTC_RESET) {
+            if ((s->rsts & 0xfff) == V_RSTS_POWEROFF) {
+                qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
+            } else {
+                qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_RESET);
+            }
+        }
+        break;
+    case R_RSTS:
+        qemu_log_mask(LOG_UNIMP,
+                      "bcm2835_powermgt_write: RSTS\n");
+        s->rsts = value;
+        break;
+    case R_WDOG:
+        qemu_log_mask(LOG_UNIMP,
+                      "bcm2835_powermgt_write: WDOG\n");
+        s->wdog = value;
+        break;
+
+    default:
+        qemu_log_mask(LOG_UNIMP,
+                      "bcm2835_powermgt_write: Unknown offset 0x%08"HWADDR_PRIx
+                      "\n", offset);
+        break;
+    }
+}
+
+static const MemoryRegionOps bcm2835_powermgt_ops = {
+    .read = bcm2835_powermgt_read,
+    .write = bcm2835_powermgt_write,
+    .endianness = DEVICE_NATIVE_ENDIAN,
+    .impl.min_access_size = 4,
+    .impl.max_access_size = 4,
+};
+
+static const VMStateDescription vmstate_bcm2835_powermgt = {
+    .name = TYPE_BCM2835_POWERMGT,
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT32(rstc, BCM2835PowerMgtState),
+        VMSTATE_UINT32(rsts, BCM2835PowerMgtState),
+        VMSTATE_UINT32(wdog, BCM2835PowerMgtState),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static void bcm2835_powermgt_init(Object *obj)
+{
+    BCM2835PowerMgtState *s = BCM2835_POWERMGT(obj);
+
+    memory_region_init_io(&s->iomem, obj, &bcm2835_powermgt_ops, s,
+                          TYPE_BCM2835_POWERMGT, 0x114);
+    sysbus_init_mmio(SYS_BUS_DEVICE(s), &s->iomem);
+}
+
+static void bcm2835_powermgt_reset(DeviceState *dev)
+{
+    BCM2835PowerMgtState *s = BCM2835_POWERMGT(dev);
+
+    /* https://elinux.org/BCM2835_registers#PM */
+    s->rstc = 0x00000102;
+    s->rsts = 0x00001000;
+    s->wdog = 0x00000000;
+}
+
+static void bcm2835_powermgt_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->reset = bcm2835_powermgt_reset;
+    dc->vmsd = &vmstate_bcm2835_powermgt;
+}
+
+static TypeInfo bcm2835_powermgt_info = {
+    .name          = TYPE_BCM2835_POWERMGT,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(BCM2835PowerMgtState),
+    .class_init    = bcm2835_powermgt_class_init,
+    .instance_init = bcm2835_powermgt_init,
+};
+
+static void bcm2835_powermgt_register_types(void)
+{
+    type_register_static(&bcm2835_powermgt_info);
+}
+
+type_init(bcm2835_powermgt_register_types)
diff --git hw/misc/meson.build hw/misc/meson.build
index 66e1648533..f89b5c1643 100644
--- hw/misc/meson.build
+++ hw/misc/meson.build
@@ -82,6 +82,7 @@ softmmu_ss.add(when: 'CONFIG_RASPI', if_true: files(
   'bcm2835_rng.c',
   'bcm2835_thermal.c',
   'bcm2835_cprman.c',
+  'bcm2835_powermgt.c',
 ))
 softmmu_ss.add(when: 'CONFIG_SLAVIO', if_true: files('slavio_misc.c'))
 softmmu_ss.add(when: 'CONFIG_ZYNQ', if_true: files('zynq_slcr.c', 'zynq-xadc.c'))
diff --git include/hw/arm/bcm2835_peripherals.h include/hw/arm/bcm2835_peripherals.h
index 479e2346e8..d864879421 100644
--- include/hw/arm/bcm2835_peripherals.h
+++ include/hw/arm/bcm2835_peripherals.h
@@ -24,6 +24,7 @@
 #include "hw/misc/bcm2835_mphi.h"
 #include "hw/misc/bcm2835_thermal.h"
 #include "hw/misc/bcm2835_cprman.h"
+#include "hw/misc/bcm2835_powermgt.h"
 #include "hw/sd/sdhci.h"
 #include "hw/sd/bcm2835_sdhost.h"
 #include "hw/gpio/bcm2835_gpio.h"
@@ -48,7 +49,7 @@ struct BCM2835PeripheralState {
     BCM2835MphiState mphi;
     UnimplementedDeviceState txp;
     UnimplementedDeviceState armtmr;
-    UnimplementedDeviceState powermgt;
+    BCM2835PowerMgtState powermgt;
     BCM2835CprmanState cprman;
     PL011State uart0;
     BCM2835AuxState aux;
diff --git include/hw/misc/bcm2835_powermgt.h include/hw/misc/bcm2835_powermgt.h
new file mode 100644
index 0000000000..303b9a6f68
--- /dev/null
+++ include/hw/misc/bcm2835_powermgt.h
@@ -0,0 +1,29 @@
+/*
+ * BCM2835 Power Management emulation
+ *
+ * Copyright (C) 2017 Marcin Chojnacki <marcinch7@gmail.com>
+ * Copyright (C) 2021 Nolan Leake <nolan@sigbus.net>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#ifndef BCM2835_POWERMGT_H
+#define BCM2835_POWERMGT_H
+
+#include "hw/sysbus.h"
+#include "qom/object.h"
+
+#define TYPE_BCM2835_POWERMGT "bcm2835-powermgt"
+OBJECT_DECLARE_SIMPLE_TYPE(BCM2835PowerMgtState, BCM2835_POWERMGT)
+
+struct BCM2835PowerMgtState {
+    SysBusDevice busdev;
+    MemoryRegion iomem;
+
+    uint32_t rstc;
+    uint32_t rsts;
+    uint32_t wdog;
+};
+
+#endif
-- 
2.30.2


