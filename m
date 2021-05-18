Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D58C3995F9
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 00:33:03 +0200 (CEST)
Received: from localhost ([::1]:48900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loZQ6-0001Vy-MT
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 18:33:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1loZP7-0000cp-Ke; Wed, 02 Jun 2021 18:32:01 -0400
Received: from mail-b.sr.ht ([173.195.146.151]:54856)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1loZP4-0005eT-Bq; Wed, 02 Jun 2021 18:32:00 -0400
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id 5F73411EF37;
 Wed,  2 Jun 2021 22:31:55 +0000 (UTC)
From: ~nolanl <nolanl@git.sr.ht>
Date: Tue, 18 May 2021 13:24:49 -0700
Subject: [PATCH qemu v2] Add basic power management to raspi.
Message-ID: <162267311514.20123.7251014689774228873-0@git.sr.ht>
X-Mailer: git.sr.ht
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Received-SPF: pass client-ip=173.195.146.151; envelope-from=outgoing@sr.ht;
 helo=mail-b.sr.ht
X-Spam_score_int: 15
X-Spam_score: 1.5
X-Spam_bar: +
X-Spam_report: (1.5 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_96_XX=3.405,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-To: ~nolanl <nolan@sigbus.net>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Philippe =?utf-8?q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Nolan Leake <nolan@sigbus.net>

This is just enough to make reboot and poweroff work. Works for
linux, u-boot, and the arm trusted firmware. Not tested, but should
work for plan9, and bare-metal/hobby OSes, since they seem to generally
do what linux does for reset.

The watchdog timer functionality is not yet implemented.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/64
Signed-off-by: Nolan Leake <nolan@sigbus.net>
---
 hw/arm/bcm2835_peripherals.c         |  13 ++-
 hw/misc/bcm2835_powermgt.c           | 159 +++++++++++++++++++++++++++
 hw/misc/meson.build                  |   1 +
 include/hw/arm/bcm2835_peripherals.h |   3 +-
 include/hw/misc/bcm2835_powermgt.h   |  29 +++++
 5 files changed, 203 insertions(+), 2 deletions(-)
 create mode 100644 hw/misc/bcm2835_powermgt.c
 create mode 100644 include/hw/misc/bcm2835_powermgt.h

diff --git a/hw/arm/bcm2835_peripherals.c b/hw/arm/bcm2835_peripherals.c
index dcff13433e..48538c9360 100644
--- a/hw/arm/bcm2835_peripherals.c
+++ b/hw/arm/bcm2835_peripherals.c
@@ -126,6 +126,10 @@ static void bcm2835_peripherals_init(Object *obj)
=20
     object_property_add_const_link(OBJECT(&s->dwc2), "dma-mr",
                                    OBJECT(&s->gpu_bus_mr));
+
+    /* Power Management */
+    object_initialize_child(obj, "powermgt", &s->powermgt,
+                            TYPE_BCM2835_POWERMGT);
 }
=20
 static void bcm2835_peripherals_realize(DeviceState *dev, Error **errp)
@@ -364,9 +368,16 @@ static void bcm2835_peripherals_realize(DeviceState *dev=
, Error **errp)
         qdev_get_gpio_in_named(DEVICE(&s->ic), BCM2835_IC_GPU_IRQ,
                                INTERRUPT_USB));
=20
+    /* Power Management */
+    if (!sysbus_realize(SYS_BUS_DEVICE(&s->powermgt), errp)) {
+        return;
+    }
+
+    memory_region_add_subregion(&s->peri_mr, PM_OFFSET,
+                sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->powermgt), 0));
+
     create_unimp(s, &s->txp, "bcm2835-txp", TXP_OFFSET, 0x1000);
     create_unimp(s, &s->armtmr, "bcm2835-sp804", ARMCTRL_TIMER0_1_OFFSET, 0x=
40);
-    create_unimp(s, &s->powermgt, "bcm2835-powermgt", PM_OFFSET, 0x114);
     create_unimp(s, &s->i2s, "bcm2835-i2s", I2S_OFFSET, 0x100);
     create_unimp(s, &s->smi, "bcm2835-smi", SMI_OFFSET, 0x100);
     create_unimp(s, &s->spi[0], "bcm2835-spi0", SPI0_OFFSET, 0x20);
diff --git a/hw/misc/bcm2835_powermgt.c b/hw/misc/bcm2835_powermgt.c
new file mode 100644
index 0000000000..55455bbd60
--- /dev/null
+++ b/hw/misc/bcm2835_powermgt.c
@@ -0,0 +1,159 @@
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
+    BCM2835PowerMgtState *s =3D (BCM2835PowerMgtState *)opaque;
+    uint32_t res =3D 0;
+
+    switch (offset) {
+    case R_RSTC:
+        res =3D s->rstc;
+        break;
+    case R_RSTS:
+        res =3D s->rsts;
+        break;
+    case R_WDOG:
+        res =3D s->wdog;
+        break;
+
+    default:
+        qemu_log_mask(LOG_UNIMP,
+                      "bcm2835_powermgt_read: Unknown offset 0x%08"HWADDR_PR=
Ix
+                      "\n", offset);
+        res =3D 0;
+        break;
+    }
+
+    return res;
+}
+
+static void bcm2835_powermgt_write(void *opaque, hwaddr offset,
+                                   uint64_t value, unsigned size)
+{
+    BCM2835PowerMgtState *s =3D (BCM2835PowerMgtState *)opaque;
+
+    if ((value & PASSWORD_MASK) !=3D PASSWORD) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "bcm2835_powermgt_write: Bad password 0x%"PRIx64
+                      " at offset 0x%08"HWADDR_PRIx"\n",
+                      value, offset);
+        return;
+    }
+
+    value =3D value & ~PASSWORD_MASK;
+
+    switch (offset) {
+    case R_RSTC:
+        s->rstc =3D value;
+        if (value & V_RSTC_RESET) {
+            if ((s->rsts & 0xfff) =3D=3D V_RSTS_POWEROFF) {
+                qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
+            } else {
+                qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_RESET);
+            }
+        }
+        break;
+    case R_RSTS:
+        qemu_log_mask(LOG_UNIMP,
+                      "bcm2835_powermgt_write: RSTS\n");
+        s->rsts =3D value;
+        break;
+    case R_WDOG:
+        qemu_log_mask(LOG_UNIMP,
+                      "bcm2835_powermgt_write: WDOG\n");
+        s->wdog =3D value;
+        break;
+
+    default:
+        qemu_log_mask(LOG_UNIMP,
+                      "bcm2835_powermgt_write: Unknown offset 0x%08"HWADDR_P=
RIx
+                      "\n", offset);
+        break;
+    }
+}
+
+static const MemoryRegionOps bcm2835_powermgt_ops =3D {
+    .read =3D bcm2835_powermgt_read,
+    .write =3D bcm2835_powermgt_write,
+    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .impl.min_access_size =3D 4,
+    .impl.max_access_size =3D 4,
+};
+
+static const VMStateDescription vmstate_bcm2835_powermgt =3D {
+    .name =3D TYPE_BCM2835_POWERMGT,
+    .version_id =3D 1,
+    .minimum_version_id =3D 1,
+    .fields =3D (VMStateField[]) {
+        VMSTATE_UINT32(rstc, BCM2835PowerMgtState),
+        VMSTATE_UINT32(rsts, BCM2835PowerMgtState),
+        VMSTATE_UINT32(wdog, BCM2835PowerMgtState),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static void bcm2835_powermgt_init(Object *obj)
+{
+    BCM2835PowerMgtState *s =3D BCM2835_POWERMGT(obj);
+
+    memory_region_init_io(&s->iomem, obj, &bcm2835_powermgt_ops, s,
+                          TYPE_BCM2835_POWERMGT, 0x114);
+    sysbus_init_mmio(SYS_BUS_DEVICE(s), &s->iomem);
+}
+
+static void bcm2835_powermgt_reset(DeviceState *dev)
+{
+    BCM2835PowerMgtState *s =3D BCM2835_POWERMGT(dev);
+
+    s->rstc =3D 0x00000102;
+    s->rsts =3D 0x00001000;
+    s->wdog =3D 0x00000000;
+}
+
+static void bcm2835_powermgt_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc =3D DEVICE_CLASS(klass);
+
+    dc->reset =3D bcm2835_powermgt_reset;
+    dc->vmsd =3D &vmstate_bcm2835_powermgt;
+}
+
+static TypeInfo bcm2835_powermgt_info =3D {
+    .name          =3D TYPE_BCM2835_POWERMGT,
+    .parent        =3D TYPE_SYS_BUS_DEVICE,
+    .instance_size =3D sizeof(BCM2835PowerMgtState),
+    .class_init    =3D bcm2835_powermgt_class_init,
+    .instance_init =3D bcm2835_powermgt_init,
+};
+
+static void bcm2835_powermgt_register_types(void)
+{
+    type_register_static(&bcm2835_powermgt_info);
+}
+
+type_init(bcm2835_powermgt_register_types)
diff --git a/hw/misc/meson.build b/hw/misc/meson.build
index 66e1648533..f89b5c1643 100644
--- a/hw/misc/meson.build
+++ b/hw/misc/meson.build
@@ -82,6 +82,7 @@ softmmu_ss.add(when: 'CONFIG_RASPI', if_true: files(
   'bcm2835_rng.c',
   'bcm2835_thermal.c',
   'bcm2835_cprman.c',
+  'bcm2835_powermgt.c',
 ))
 softmmu_ss.add(when: 'CONFIG_SLAVIO', if_true: files('slavio_misc.c'))
 softmmu_ss.add(when: 'CONFIG_ZYNQ', if_true: files('zynq_slcr.c', 'zynq-xadc=
.c'))
diff --git a/include/hw/arm/bcm2835_peripherals.h b/include/hw/arm/bcm2835_pe=
ripherals.h
index 479e2346e8..d864879421 100644
--- a/include/hw/arm/bcm2835_peripherals.h
+++ b/include/hw/arm/bcm2835_peripherals.h
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
diff --git a/include/hw/misc/bcm2835_powermgt.h b/include/hw/misc/bcm2835_pow=
ermgt.h
new file mode 100644
index 0000000000..303b9a6f68
--- /dev/null
+++ b/include/hw/misc/bcm2835_powermgt.h
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
--=20
2.30.2

