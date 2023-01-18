Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31344671C11
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 13:31:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pI7ZW-0007Fk-SW; Wed, 18 Jan 2023 07:29:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>) id 1pI7ZU-0007FR-V5
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 07:29:41 -0500
Received: from mail-b.sr.ht ([173.195.146.151])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>) id 1pI7ZS-0004Ed-So
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 07:29:40 -0500
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id F3FD311EF15
 for <qemu-devel@nongnu.org>; Wed, 18 Jan 2023 12:29:36 +0000 (UTC)
From: ~luhux <luhux@git.sr.ht>
Date: Wed, 18 Jan 2023 16:29:15 +0800
Subject: [PATCH qemu 1/3] hw/misc/mt7628-sysctrl.c: Add mt7628 system control
 support.
Message-ID: <167404497644.25699.12403586061485468184-0@git.sr.ht>
X-Mailer: git.sr.ht
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
 MAINTAINERS                      |   5 +
 hw/misc/meson.build              |   3 +
 hw/misc/mt7628-sysctrl.c         | 169 +++++++++++++++++++++++++++++++
 include/hw/misc/mt7628-sysctrl.h |  66 ++++++++++++
 4 files changed, 243 insertions(+)
 create mode 100644 hw/misc/mt7628-sysctrl.c
 create mode 100644 include/hw/misc/mt7628-sysctrl.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 0fe50d01e3..41854e939c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1234,6 +1234,11 @@ F: configs/devices/mips*/*
 F: hw/mips/
 F: include/hw/mips/
=20
+VoCore2
+M: Lu Hui <luhux76@gmail.com>
+S: Maintained
+F: hw/*/*mt7628*
+
 Jazz
 M: Herv=C3=A9 Poussineau <hpoussin@reactos.org>
 R: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
diff --git a/hw/misc/meson.build b/hw/misc/meson.build
index 448e14b531..0dfe7d9740 100644
--- a/hw/misc/meson.build
+++ b/hw/misc/meson.build
@@ -140,3 +140,6 @@ softmmu_ss.add(when: 'CONFIG_SBSA_REF', if_true: files('s=
bsa_ec.c'))
=20
 # HPPA devices
 softmmu_ss.add(when: 'CONFIG_LASI', if_true: files('lasi.c'))
+
+# mt7628
+softmmu_ss.add(when: 'CONFIG_MT7628', if_true: files('mt7628-sysctrl.c'))
diff --git a/hw/misc/mt7628-sysctrl.c b/hw/misc/mt7628-sysctrl.c
new file mode 100644
index 0000000000..e04d1de69d
--- /dev/null
+++ b/hw/misc/mt7628-sysctrl.c
@@ -0,0 +1,169 @@
+/*
+ * Mediatek mt7628 System Control emulation
+ *
+ * Copyright (C) 2023 Lu Hui <luhux76@gmail.com>
+ *
+ * This program is free software: you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation, either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/units.h"
+#include "hw/sysbus.h"
+#include "migration/vmstate.h"
+#include "qemu/log.h"
+#include "qemu/module.h"
+#include "hw/misc/mt7628-sysctrl.h"
+#include "sysemu/runstate.h"
+
+#define REG_INDEX(offset)   (offset / sizeof(uint32_t))
+
+/* System Control register offsets */
+/* from linux kernel arch/mips/include/asm/mach-ralink/mt7620.h */
+enum {
+    REG_CHIP_NAME0 =3D 0x00,
+    REG_CHIP_NAME1 =3D 0x04,
+    REG_EFUSE_CFG =3D 0x08,
+    REG_CHIP_REV =3D 0x0C,
+    REG_SYS_CFG0 =3D 0x10,
+    REG_SYS_CFG1 =3D 0x14,
+    REG_CLK_CFG0 =3D 0x2C,
+    REG_CLK_CFG1 =3D 0x30,
+    REG_RST_CTRL =3D 0x34,
+    REG_RST_STAT =3D 0x38,
+    REG_AGPIO_CFG =3D 0x3C,
+    REG_GPIO1_MODE =3D 0x60,
+    REG_GPIO2_MODE =3D 0x64,
+};
+
+static uint64_t mt7628_sysctrl_read(void *opaque, hwaddr offset,
+                                    unsigned size)
+{
+    const mt7628SysCtrlState *s =3D MT7628_SYSCTRL(opaque);
+    const uint32_t idx =3D REG_INDEX(offset);
+
+    if (idx >=3D MT7628_SYSCTRL_REGS_NUM) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: out-of-bounds offset 0x%04x\n",
+                      __func__, (uint32_t) offset);
+        return 0;
+    }
+
+    return s->regs[idx];
+}
+
+enum {
+    RST_SYSTEM =3D 0,
+};
+
+static void mt7628_reset(uint32_t val)
+{
+    if (test_bit(RST_SYSTEM, (void *)&val)) {
+        /* reset whole system */
+        qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_RESET);
+    }
+}
+
+static void mt7628_sysctrl_write(void *opaque, hwaddr offset,
+                                 uint64_t val, unsigned size)
+{
+    mt7628SysCtrlState *s =3D MT7628_SYSCTRL(opaque);
+    const uint32_t idx =3D REG_INDEX(offset);
+
+    if (idx >=3D MT7628_SYSCTRL_REGS_NUM) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: out-of-bounds offset 0x%04x\n",
+                      __func__, (uint32_t) offset);
+        return;
+    }
+
+    switch (offset) {
+    case REG_RST_CTRL:
+        s->regs[idx] =3D (uint32_t) val;
+        mt7628_reset(s->regs[idx]);
+        break;
+    default:
+        s->regs[idx] =3D (uint32_t) val;
+        break;
+    }
+}
+
+static const MemoryRegionOps mt7628_sysctrl_ops =3D {
+    .read =3D mt7628_sysctrl_read,
+    .write =3D mt7628_sysctrl_write,
+    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .valid =3D {
+        .min_access_size =3D 4,
+        .max_access_size =3D 4,
+    },
+    .impl.min_access_size =3D 4,
+};
+
+static void mt7628_sysctrl_reset(DeviceState *dev)
+{
+    mt7628SysCtrlState *s =3D MT7628_SYSCTRL(dev);
+
+    /* Set default values for registers */
+    /* dump from real mt7628 board */
+    s->regs[REG_INDEX(REG_CHIP_NAME0)] =3D 0x3637544d; /* "MT76" */
+    s->regs[REG_INDEX(REG_CHIP_NAME1)] =3D 0x20203832; /* "28  " */
+    s->regs[REG_INDEX(REG_EFUSE_CFG)]  =3D 0x01010000;
+    s->regs[REG_INDEX(REG_CHIP_REV)]   =3D 0x00010102;
+    s->regs[REG_INDEX(REG_SYS_CFG0)]   =3D 0x00144144;
+    s->regs[REG_INDEX(REG_SYS_CFG1)]   =3D 0x02605500;
+    s->regs[REG_INDEX(REG_CLK_CFG0)]   =3D 0b0000000000100000000100000000000=
0;
+    s->regs[REG_INDEX(REG_CLK_CFG1)]   =3D 0b1111011010011111011111110000000=
0;
+    s->regs[REG_INDEX(REG_RST_CTRL)]   =3D 0b0000010000000000000001000000000=
0;
+    s->regs[REG_INDEX(REG_RST_STAT)]   =3D 0b1100000000000011000000000000000=
0;
+    s->regs[REG_INDEX(REG_AGPIO_CFG)]  =3D 0b0000000000011111000000000001111=
1;
+    s->regs[REG_INDEX(REG_GPIO1_MODE)] =3D 0b0101010000000101000001000000010=
0;
+    s->regs[REG_INDEX(REG_GPIO2_MODE)] =3D 0b0000010101010101000001010101010=
1;
+}
+
+static void mt7628_sysctrl_init(Object *obj)
+{
+    SysBusDevice *sbd =3D SYS_BUS_DEVICE(obj);
+    mt7628SysCtrlState *s =3D MT7628_SYSCTRL(obj);
+
+    /* Memory mapping */
+    memory_region_init_io(&s->iomem, OBJECT(s), &mt7628_sysctrl_ops, s,
+                          TYPE_MT7628_SYSCTRL, MT7628_SYSCTRL_REGS_MAXADDR);
+    sysbus_init_mmio(sbd, &s->iomem);
+}
+
+static const VMStateDescription mt7628_sysctrl_vmstate =3D {
+    .name =3D "mt7628-sysctrl",
+    .version_id =3D 1,
+    .minimum_version_id =3D 1,
+};
+
+static void mt7628_sysctrl_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc =3D DEVICE_CLASS(klass);
+
+    dc->reset =3D mt7628_sysctrl_reset;
+    dc->vmsd =3D &mt7628_sysctrl_vmstate;
+}
+
+static const TypeInfo mt7628_sysctrl_info =3D {
+    .name =3D TYPE_MT7628_SYSCTRL,
+    .parent =3D TYPE_SYS_BUS_DEVICE,
+    .instance_init =3D mt7628_sysctrl_init,
+    .instance_size =3D sizeof(mt7628SysCtrlState),
+    .class_init =3D mt7628_sysctrl_class_init,
+};
+
+static void mt7628_sysctrl_register(void)
+{
+    type_register_static(&mt7628_sysctrl_info);
+}
+
+type_init(mt7628_sysctrl_register)
diff --git a/include/hw/misc/mt7628-sysctrl.h b/include/hw/misc/mt7628-sysctr=
l.h
new file mode 100644
index 0000000000..836dbdd5aa
--- /dev/null
+++ b/include/hw/misc/mt7628-sysctrl.h
@@ -0,0 +1,66 @@
+/*
+ * Mediatek mt7628 System Control emulation
+ *
+ * Copyright (C) 2023 Lu Hui <luhux76@gmail.com>
+ *
+ * This program is free software: you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation, either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef HW_MISC_MT7628_SYSCTRL_H
+#define HW_MISC_MT7628_SYSCTRL_H
+
+#include "qom/object.h"
+#include "hw/sysbus.h"
+
+/**
+ * @name Constants
+ * @{
+ */
+
+/** Highest register address used by System Control device */
+#define MT7628_SYSCTRL_REGS_MAXADDR   (0x100)
+
+/** Total number of known registers */
+#define MT7628_SYSCTRL_REGS_NUM       ((MT7628_SYSCTRL_REGS_MAXADDR / \
+                                      sizeof(uint32_t)) + 1)
+
+/** @} */
+
+/**
+ * @name Object model
+ * @{
+ */
+
+#define TYPE_MT7628_SYSCTRL    "mt7628-sysctrl"
+OBJECT_DECLARE_SIMPLE_TYPE(mt7628SysCtrlState, MT7628_SYSCTRL)
+
+/** @} */
+
+/**
+ * mt7628 System Control object instance state
+ */
+struct mt7628SysCtrlState {
+    /*< private >*/
+    SysBusDevice parent_obj;
+    /*< public >*/
+
+    /** Maps I/O registers in physical memory */
+    MemoryRegion iomem;
+
+    /** Array of hardware registers */
+    uint32_t regs[MT7628_SYSCTRL_REGS_NUM];
+
+};
+
+#endif /* HW_MISC_MT7628_SYSCTRL_H */
--=20
2.34.5


