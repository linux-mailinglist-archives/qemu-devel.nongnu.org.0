Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6C41671C13
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 13:31:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pI7ZY-0007GS-AV; Wed, 18 Jan 2023 07:29:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>) id 1pI7ZW-0007Fj-9I
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 07:29:42 -0500
Received: from mail-b.sr.ht ([173.195.146.151])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>) id 1pI7ZS-0004Ee-TR
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 07:29:42 -0500
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id 2F05B11EF5B
 for <qemu-devel@nongnu.org>; Wed, 18 Jan 2023 12:29:37 +0000 (UTC)
From: ~luhux <luhux@git.sr.ht>
Date: Wed, 18 Jan 2023 17:00:29 +0800
Subject: [PATCH qemu 2/3] hw/intc/mt7628-intc.c: add mt7628 interrupt control
 support.
Message-ID: <167404497644.25699.12403586061485468184-1@git.sr.ht>
X-Mailer: git.sr.ht
In-Reply-To: <167404497644.25699.12403586061485468184-0@git.sr.ht>
To: qemu-devel@nongnu.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Received-SPF: pass client-ip=173.195.146.151; envelope-from=outgoing@sr.ht;
 helo=mail-b.sr.ht
X-Spam_score_int: 20
X-Spam_score: 2.0
X-Spam_bar: ++
X-Spam_report: (2.0 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_03_06=1.592,
 FREEMAIL_FORGED_REPLYTO=2.095, FREEMAIL_REPLYTO_END_DIGIT=0.25,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-To: ~luhux <luhux76@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: LuHui <luhux76@gmail.com>

Signed-off-by: LuHui <luhux76@gmail.com>
---
 hw/intc/meson.build           |   1 +
 hw/intc/mt7628-intc.c         | 155 ++++++++++++++++++++++++++++++++++
 include/hw/intc/mt7628-intc.h |  30 +++++++
 3 files changed, 186 insertions(+)
 create mode 100644 hw/intc/mt7628-intc.c
 create mode 100644 include/hw/intc/mt7628-intc.h

diff --git a/hw/intc/meson.build b/hw/intc/meson.build
index cd9f1ee888..2ce3ddb4d2 100644
--- a/hw/intc/meson.build
+++ b/hw/intc/meson.build
@@ -73,3 +73,4 @@ specific_ss.add(when: 'CONFIG_LOONGARCH_IPI', if_true: file=
s('loongarch_ipi.c'))
 specific_ss.add(when: 'CONFIG_LOONGARCH_PCH_PIC', if_true: files('loongarch_=
pch_pic.c'))
 specific_ss.add(when: 'CONFIG_LOONGARCH_PCH_MSI', if_true: files('loongarch_=
pch_msi.c'))
 specific_ss.add(when: 'CONFIG_LOONGARCH_EXTIOI', if_true: files('loongarch_e=
xtioi.c'))
+specific_ss.add(when: 'CONFIG_MT7628', if_true: files('mt7628-intc.c'))
diff --git a/hw/intc/mt7628-intc.c b/hw/intc/mt7628-intc.c
new file mode 100644
index 0000000000..f900bf502f
--- /dev/null
+++ b/hw/intc/mt7628-intc.c
@@ -0,0 +1,155 @@
+/*
+ * mt7628 interrupt controller device emulation
+ *
+ * Copyright (C) 2023 Lu Hui
+ * Written by Lu Hui <luhux76@gmail.com>
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU General Public License as published by the
+ * Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+
+ * This program is distributed in the hope that it will be useful, but WITHO=
UT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
+ * for more details.
+ */
+
+#include "qemu/osdep.h"
+#include "hw/sysbus.h"
+#include "migration/vmstate.h"
+#include "hw/intc/mt7628-intc.h"
+#include "hw/irq.h"
+#include "qemu/log.h"
+#include "qemu/module.h"
+
+static void mt7628_intc_update(mt7628intcState *s)
+{
+    int i;
+    for (i =3D 0; i < 32; i++) {
+        if (test_bit(i, (void *) &s->disable)) {
+            clear_bit(i, (void *) &s->enable);
+        }
+    }
+    qemu_set_irq(s->parent_irq, !!(s->enable));
+}
+
+static void mt7628_intc_set_irq(void *opaque, int irq, int level)
+{
+    mt7628intcState *s =3D opaque;
+
+    if (level) {
+        set_bit(irq, (void *) &s->enable);
+        clear_bit(irq, (void *) &s->disable);
+    } else {
+        clear_bit(irq, (void *) &s->enable);
+        set_bit(irq, (void *) &s->disable);
+    }
+    mt7628_intc_update(s);
+}
+
+static uint64_t mt7628_intc_read(void *opaque, hwaddr offset,
+                                 unsigned size)
+{
+    mt7628intcState *s =3D opaque;
+
+    switch (offset) {
+    case MT7628_INTC_REG_STATUS0:
+        return s->enable;
+    case MT7628_INTC_REG_TYPE:
+        return s->type;
+    case MT7628_INTC_REG_ENABLE:
+        return s->enable;
+    case MT7628_INTC_REG_DISABLE:
+        return s->disable;
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: not imp offset 0x%x\n", __func__, (int) offset);
+        return 0x0;
+        break;
+    }
+
+    return 0;
+}
+
+static void mt7628_intc_write(void *opaque, hwaddr offset, uint64_t value,
+                              unsigned size)
+{
+    mt7628intcState *s =3D opaque;
+
+    switch (offset) {
+    case MT7628_INTC_REG_TYPE:
+        s->type =3D value;
+        break;
+    case MT7628_INTC_REG_ENABLE:
+        s->enable =3D value;
+        break;
+    case MT7628_INTC_REG_DISABLE:
+        s->disable =3D value;
+        break;
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: not imp offset 0x%x\n", __func__, (int) offset);
+        break;
+    }
+
+    mt7628_intc_update(s);
+}
+
+static const MemoryRegionOps mt7628_intc_ops =3D {
+    .read =3D mt7628_intc_read,
+    .write =3D mt7628_intc_write,
+    .endianness =3D DEVICE_NATIVE_ENDIAN,
+};
+
+static const VMStateDescription vmstate_mt7628_intc =3D {
+    .name =3D "mt7628.intc",
+    .version_id =3D 1,
+    .minimum_version_id =3D 1,
+};
+
+static void mt7628_intc_init(Object *obj)
+{
+    mt7628intcState *s =3D MT7628_INTC(obj);
+    SysBusDevice *dev =3D SYS_BUS_DEVICE(obj);
+
+    qdev_init_gpio_in(DEVICE(dev), mt7628_intc_set_irq, 32);
+    sysbus_init_irq(dev, &s->parent_irq);
+    memory_region_init_io(&s->iomem, OBJECT(s), &mt7628_intc_ops, s,
+                          TYPE_MT7628_INTC, MT7628_INTC_REGS_MAXADDR);
+    sysbus_init_mmio(dev, &s->iomem);
+}
+
+static void mt7628_intc_reset(DeviceState *d)
+{
+    mt7628intcState *s =3D MT7628_INTC(d);
+
+    s->type    =3D 0b00000000000000000000000000000000;
+    s->enable  =3D 0b00000000000000000000000000000000;
+    s->disable =3D 0b00000000000000000000000000000000;
+}
+
+static void mt7628_intc_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc =3D DEVICE_CLASS(klass);
+
+    dc->reset =3D mt7628_intc_reset;
+    dc->desc =3D "mt7628 interrupt control";
+    dc->vmsd =3D &vmstate_mt7628_intc;
+}
+
+static const TypeInfo mt7628_intc_info =3D {
+    .name =3D TYPE_MT7628_INTC,
+    .parent =3D TYPE_SYS_BUS_DEVICE,
+    .instance_size =3D sizeof(mt7628intcState),
+    .instance_init =3D mt7628_intc_init,
+    .class_init =3D mt7628_intc_class_init,
+};
+
+static void mt7628_register_types(void)
+{
+    type_register_static(&mt7628_intc_info);
+}
+
+type_init(mt7628_register_types);
diff --git a/include/hw/intc/mt7628-intc.h b/include/hw/intc/mt7628-intc.h
new file mode 100644
index 0000000000..a2f4690d1d
--- /dev/null
+++ b/include/hw/intc/mt7628-intc.h
@@ -0,0 +1,30 @@
+#ifndef MT7628_INTC_H
+#define MT7628_INTC_H
+
+#include "hw/sysbus.h"
+#include "qom/object.h"
+
+#define TYPE_MT7628_INTC  "mt7628-intc"
+OBJECT_DECLARE_SIMPLE_TYPE(mt7628intcState, MT7628_INTC)
+
+#define MT7628_INTC_REG_STATUS0     (0x9c)
+#define MT7628_INTC_REG_TYPE        (0x6c)
+#define MT7628_INTC_REG_ENABLE      (0x80)
+#define MT7628_INTC_REG_DISABLE     (0x78)
+
+#define MT7628_INTC_REGS_MAXADDR (0xFF)
+
+struct mt7628intcState {
+    /*< private >*/
+    SysBusDevice parent_obj;
+    /*< public >*/
+    MemoryRegion iomem;
+    qemu_irq parent_irq;
+
+    uint32_t type;
+    uint32_t enable;
+    uint32_t disable;
+    /*priority setting here*/
+};
+
+#endif
--=20
2.34.5


