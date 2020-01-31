Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD95B14E65B
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Jan 2020 01:10:17 +0100 (CET)
Received: from localhost ([::1]:41308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ixJt2-0001nB-LX
	for lists+qemu-devel@lfdr.de; Thu, 30 Jan 2020 19:10:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58759)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1ixJnp-0007q4-14
 for qemu-devel@nongnu.org; Thu, 30 Jan 2020 19:04:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1ixJnn-000344-7k
 for qemu-devel@nongnu.org; Thu, 30 Jan 2020 19:04:52 -0500
Received: from mx2.rt-rk.com ([89.216.37.149]:51208 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1ixJnm-0002tp-SE
 for qemu-devel@nongnu.org; Thu, 30 Jan 2020 19:04:51 -0500
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id 0EF991A20FE;
 Fri, 31 Jan 2020 01:03:38 +0100 (CET)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.14.106])
 by mail.rt-rk.com (Postfix) with ESMTPSA id CF2661A207B;
 Fri, 31 Jan 2020 01:03:37 +0100 (CET)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Subject: [PATCH rc4 18/29] hw/misc: Add limited support for AVR power device
Date: Fri, 31 Jan 2020 01:03:02 +0100
Message-Id: <1580428993-4767-19-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1580428993-4767-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1580428993-4767-1-git-send-email-aleksandar.markovic@rt-rk.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 89.216.37.149
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Michael Rolnik <mrolnik@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Michael Rolnik <mrolnik@gmail.com>

This is a simple device of just one register, and whenever this
register is written to it calls qemu_set_irq function for each
of 8 bits/IRQs. It is used to implement AVR Power Reduction.

[AM: Remove word 'Atmel' from filenames and all elements of code]
Suggested-by: Aleksandar Markovic <aleksandar.m.mail@gmail.com>

Signed-off-by: Michael Rolnik <mrolnik@gmail.com>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
[rth: Squash include fix and file rename from f4bug]
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
---
 hw/misc/Kconfig             |   3 ++
 hw/misc/Makefile.objs       |   2 +
 hw/misc/avr_power.c         | 112 ++++++++++++++++++++++++++++++++++++++=
++++++
 include/hw/misc/avr_power.h |  46 ++++++++++++++++++
 4 files changed, 163 insertions(+)
 create mode 100644 hw/misc/avr_power.c
 create mode 100644 include/hw/misc/avr_power.h

diff --git a/hw/misc/Kconfig b/hw/misc/Kconfig
index bdd77d8..92c397c 100644
--- a/hw/misc/Kconfig
+++ b/hw/misc/Kconfig
@@ -131,4 +131,7 @@ config MAC_VIA
     select MOS6522
     select ADB
=20
+config AVR_POWER
+    bool
+
 source macio/Kconfig
diff --git a/hw/misc/Makefile.objs b/hw/misc/Makefile.objs
index da993f4..df8e457 100644
--- a/hw/misc/Makefile.objs
+++ b/hw/misc/Makefile.objs
@@ -85,3 +85,5 @@ common-obj-$(CONFIG_NRF51_SOC) +=3D nrf51_rng.o
 obj-$(CONFIG_MAC_VIA) +=3D mac_via.o
=20
 common-obj-$(CONFIG_GRLIB) +=3D grlib_ahb_apb_pnp.o
+
+obj-$(CONFIG_AVR_POWER) +=3D avr_power.o
diff --git a/hw/misc/avr_power.c b/hw/misc/avr_power.c
new file mode 100644
index 0000000..598bc72
--- /dev/null
+++ b/hw/misc/avr_power.c
@@ -0,0 +1,112 @@
+/*
+ * AVR Power Reduction Management
+ *
+ * Copyright (c) 2019 Michael Rolnik
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining=
 a copy
+ * of this software and associated documentation files (the "Software"),=
 to deal
+ * in the Software without restriction, including without limitation the=
 rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or =
sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be includ=
ed in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRE=
SS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILI=
TY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHA=
LL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR =
OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISI=
NG FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALING=
S IN
+ * THE SOFTWARE.
+ */
+
+#include "qemu/osdep.h"
+#include "hw/misc/avr_power.h"
+#include "qemu/log.h"
+#include "hw/qdev-properties.h"
+#include "hw/irq.h"
+
+#define DB_PRINT(fmt, args...) /* Nothing */
+/*#define DB_PRINT(fmt, args...) printf("%s: " fmt "\n", __func__, ## ar=
gs)*/
+
+static void avr_mask_reset(DeviceState *dev)
+{
+    AVRMaskState *s =3D AVR_MASK(dev);
+
+    s->val =3D 0x00;
+
+    for (int i =3D 0; i < 8; i++) {
+        qemu_set_irq(s->irq[i], 0);
+    }
+}
+
+static uint64_t avr_mask_read(void *opaque, hwaddr offset, unsigned size=
)
+{
+    assert(size =3D=3D 1);
+    assert(offset =3D=3D 0);
+    AVRMaskState *s =3D opaque;
+
+    return (uint64_t)s->val;
+}
+
+static void avr_mask_write(void *opaque, hwaddr offset,
+                              uint64_t val64, unsigned size)
+{
+    assert(size =3D=3D 1);
+    assert(offset =3D=3D 0);
+    AVRMaskState *s =3D opaque;
+    uint8_t val8 =3D val64;
+
+    DB_PRINT("write %d to offset %d", val8, (uint8_t)offset);
+
+    s->val =3D val8;
+    for (int i =3D 0; i < 8; i++) {
+        qemu_set_irq(s->irq[i], (val8 & (1 << i)) !=3D 0);
+    }
+}
+
+static const MemoryRegionOps avr_mask_ops =3D {
+    .read =3D avr_mask_read,
+    .write =3D avr_mask_write,
+    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .impl =3D {.max_access_size =3D 1}
+};
+
+static void avr_mask_init(Object *dev)
+{
+    AVRMaskState *s =3D AVR_MASK(dev);
+    SysBusDevice *busdev =3D SYS_BUS_DEVICE(dev);
+
+    memory_region_init_io(&s->iomem, dev, &avr_mask_ops, s, TYPE_AVR_MAS=
K,
+            0x01);
+    sysbus_init_mmio(busdev, &s->iomem);
+
+    for (int i =3D 0; i < 8; i++) {
+        sysbus_init_irq(busdev, &s->irq[i]);
+    }
+    s->val =3D 0x00;
+}
+
+static void avr_mask_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc =3D DEVICE_CLASS(klass);
+
+    dc->reset =3D avr_mask_reset;
+}
+
+static const TypeInfo avr_mask_info =3D {
+    .name          =3D TYPE_AVR_MASK,
+    .parent        =3D TYPE_SYS_BUS_DEVICE,
+    .instance_size =3D sizeof(AVRMaskState),
+    .class_init    =3D avr_mask_class_init,
+    .instance_init =3D avr_mask_init,
+};
+
+static void avr_mask_register_types(void)
+{
+    type_register_static(&avr_mask_info);
+}
+
+type_init(avr_mask_register_types)
diff --git a/include/hw/misc/avr_power.h b/include/hw/misc/avr_power.h
new file mode 100644
index 0000000..434ac23
--- /dev/null
+++ b/include/hw/misc/avr_power.h
@@ -0,0 +1,46 @@
+/*
+ * AVR Power Reduction Management
+ *
+ * Copyright (c) 2019 Michael Rolnik
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining=
 a copy
+ * of this software and associated documentation files (the "Software"),=
 to deal
+ * in the Software without restriction, including without limitation the=
 rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or =
sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be includ=
ed in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRE=
SS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILI=
TY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHA=
LL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR =
OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISI=
NG FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALING=
S IN
+ * THE SOFTWARE.
+ */
+
+#ifndef HW_MISC_AVR_POWER_H
+#define HW_MISC_AVR_POWER_H
+
+#include "hw/sysbus.h"
+#include "hw/hw.h"
+
+
+#define TYPE_AVR_MASK "avr-power"
+#define AVR_MASK(obj) OBJECT_CHECK(AVRMaskState, (obj), TYPE_AVR_MASK)
+
+typedef struct {
+    /* <private> */
+    SysBusDevice parent_obj;
+
+    /* <public> */
+    MemoryRegion iomem;
+
+    uint8_t val;
+    qemu_irq irq[8];
+} AVRMaskState;
+
+#endif /* HW_MISC_AVR_POWER_H */
--=20
2.7.4


