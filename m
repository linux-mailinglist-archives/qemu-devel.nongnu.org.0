Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 722036A816A
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 12:43:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXhJh-00046j-8l; Thu, 02 Mar 2023 06:41:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qianfanguijin@163.com>)
 id 1pXhJd-00042r-Jp; Thu, 02 Mar 2023 06:41:41 -0500
Received: from m12.mail.163.com ([123.126.96.233])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <qianfanguijin@163.com>)
 id 1pXhJZ-0006AS-79; Thu, 02 Mar 2023 06:41:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=CK7lj
 y0+Rnk6tRS1HPnauFUkh+art3pR5pFHzdONKsA=; b=njrJ/lXz2FsaXwQ8pYQ9q
 rIVW6sLF5EV6g4AZAQokct2qK9SF1Uf/V+8y3wJl/5X8LqLTeRcAKLvqTseHdNQb
 T/InPmdSoz8WiFpbtut+KgG3DQdJtKr1LQrPR/ywJ38tYBCE/gDjamlCcmJKXGun
 nwHccWNs0Zdw2LmMtGtzBQ=
Received: from DESKTOP-B1R4FVG.localdomain (unknown [144.123.156.254])
 by smtp20 (Coremail) with SMTP id H91pCgBni79OiwBknjVaGA--.63318S10;
 Thu, 02 Mar 2023 19:41:07 +0800 (CST)
From: qianfanguijin@163.com
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Beniamino Galvani <b.galvani@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Niek Linnenbank <nieklinnenbank@gmail.com>,
 qianfan Zhao <qianfanguijin@163.com>
Subject: [RFC PATCH v1 08/12] hw/misc: AXP221 PMU Emulation
Date: Thu,  2 Mar 2023 19:40:57 +0800
Message-Id: <20230302114102.32236-9-qianfanguijin@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230302114102.32236-1-qianfanguijin@163.com>
References: <20230302114102.32236-1-qianfanguijin@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: H91pCgBni79OiwBknjVaGA--.63318S10
X-Coremail-Antispam: 1Uf129KBjvJXoW3AFWDKFykGrW7Kw1xCryxuFg_yoWfArW5pr
 9YkFn8trykWFW7JrZ3XrsrWFy3Grs7Wr15Cr18ZwsakF4fAa43CFyvgwn8tFy8CrWDXw15
 X39xWFW3AwsIvw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pRT5lbUUUUU=
X-Originating-IP: [144.123.156.254]
X-CM-SenderInfo: htld0w5dqj3xxmlqqiywtou0bp/1tbiGhQm7VaEEb8QXQAAs0
Received-SPF: pass client-ip=123.126.96.233;
 envelope-from=qianfanguijin@163.com; helo=m12.mail.163.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: qianfan Zhao <qianfanguijin@163.com>

This patch adds minimal support for AXP-221 PMU and connect it to
bananapi M2U board.

Signed-off-by: qianfan Zhao <qianfanguijin@163.com>
---
 hw/arm/Kconfig        |   1 +
 hw/arm/bananapi_m2u.c |   5 ++
 hw/misc/Kconfig       |   4 +
 hw/misc/axp221.c      | 196 ++++++++++++++++++++++++++++++++++++++++++
 hw/misc/meson.build   |   1 +
 hw/misc/trace-events  |   5 ++
 6 files changed, 212 insertions(+)
 create mode 100644 hw/misc/axp221.c

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 8eabedce43..5d2c10cb18 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -347,6 +347,7 @@ config ALLWINNER_H3
 config ALLWINNER_R40
     bool
     select ALLWINNER_A10_PIT
+    select AXP221_PMU
     select SERIAL
     select ARM_TIMER
     select ARM_GIC
diff --git a/hw/arm/bananapi_m2u.c b/hw/arm/bananapi_m2u.c
index 1b6241719d..bdee12efd3 100644
--- a/hw/arm/bananapi_m2u.c
+++ b/hw/arm/bananapi_m2u.c
@@ -22,6 +22,7 @@
 #include "exec/address-spaces.h"
 #include "qapi/error.h"
 #include "hw/boards.h"
+#include "hw/i2c/i2c.h"
 #include "hw/qdev-properties.h"
 #include "hw/arm/allwinner-r40.h"
 
@@ -91,6 +92,10 @@ static void bpim2u_init(MachineState *machine)
                      &bootroom_loaded);
     mmc_attach_drive(r40, &r40->mmc3, 3, false, NULL);
 
+    /* Connect AXP221 */
+    i2c = I2C_BUS(qdev_get_child_bus(DEVICE(&r40->i2c0), "i2c"));
+    i2c_slave_create_simple(i2c, "axp221_pmu", 0x34);
+
     /* SDRAM */
     memory_region_add_subregion(get_system_memory(), r40->memmap[AW_R40_DEV_SDRAM],
                                 machine->ram);
diff --git a/hw/misc/Kconfig b/hw/misc/Kconfig
index 2ef5781ef8..f66ac390b1 100644
--- a/hw/misc/Kconfig
+++ b/hw/misc/Kconfig
@@ -180,4 +180,8 @@ config AXP209_PMU
     bool
     depends on I2C
 
+config AXP221_PMU
+    bool
+    depends on I2C
+
 source macio/Kconfig
diff --git a/hw/misc/axp221.c b/hw/misc/axp221.c
new file mode 100644
index 0000000000..47784bb085
--- /dev/null
+++ b/hw/misc/axp221.c
@@ -0,0 +1,196 @@
+/*
+ * AXP-221/221s PMU Emulation
+ *
+ * Copyright (C) 2023 qianfan Zhao <qianfanguijin@163.com>
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
+ * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
+ * DEALINGS IN THE SOFTWARE.
+ *
+ * SPDX-License-Identifier: MIT
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/log.h"
+#include "qemu/bitops.h"
+#include "trace.h"
+#include "hw/i2c/i2c.h"
+#include "migration/vmstate.h"
+
+#define TYPE_AXP221_PMU "axp221_pmu"
+
+#define AXP221(obj) \
+    OBJECT_CHECK(AXP221I2CState, (obj), TYPE_AXP221_PMU)
+
+#define NR_REGS                         0xff
+
+/* A simple I2C slave which returns values of ID or CNT register. */
+typedef struct AXP221I2CState {
+    /*< private >*/
+    I2CSlave i2c;
+    /*< public >*/
+    uint8_t regs[NR_REGS];  /* peripheral registers */
+    uint8_t ptr;            /* current register index */
+    uint8_t count;          /* counter used for tx/rx */
+} AXP221I2CState;
+
+#define AXP221_PWR_STATUS_ACIN_PRESENT          BIT(7)
+#define AXP221_PWR_STATUS_ACIN_AVAIL            BIT(6)
+#define AXP221_PWR_STATUS_VBUS_PRESENT          BIT(5)
+#define AXP221_PWR_STATUS_VBUS_USED             BIT(4)
+#define AXP221_PWR_STATUS_BAT_CHARGING          BIT(2)
+#define AXP221_PWR_STATUS_ACIN_VBUS_POWERED     BIT(1)
+
+/* Reset all counters and load ID register */
+static void axp221_reset_enter(Object *obj, ResetType type)
+{
+    AXP221I2CState *s = AXP221(obj);
+
+    memset(s->regs, 0, NR_REGS);
+    s->ptr = 0;
+    s->count = 0;
+
+    /* input power status register */
+    s->regs[0x00] = AXP221_PWR_STATUS_ACIN_PRESENT
+                    | AXP221_PWR_STATUS_ACIN_AVAIL
+                    | AXP221_PWR_STATUS_ACIN_VBUS_POWERED;
+
+    s->regs[0x01] = 0x00; /* no battery is connected */
+
+    /* CHIPID register, no documented on datasheet, but it is checked in
+     * u-boot spl. I had read it from AXP221s and got 0x06 value.
+     * So leave 06h here.
+     */
+    s->regs[0x03] = 0x06;
+
+    s->regs[0x10] = 0xbf;
+    s->regs[0x13] = 0x01;
+    s->regs[0x30] = 0x60;
+    s->regs[0x31] = 0x03;
+    s->regs[0x32] = 0x43;
+    s->regs[0x33] = 0xc6;
+    s->regs[0x34] = 0x45;
+    s->regs[0x35] = 0x0e;
+    s->regs[0x36] = 0x5d;
+    s->regs[0x37] = 0x08;
+    s->regs[0x38] = 0xa5;
+    s->regs[0x39] = 0x1f;
+    s->regs[0x3c] = 0xfc;
+    s->regs[0x3d] = 0x16;
+    s->regs[0x80] = 0x80;
+    s->regs[0x82] = 0xe0;
+    s->regs[0x84] = 0x32;
+    s->regs[0x8f] = 0x01;
+
+    s->regs[0x90] = 0x07;
+    s->regs[0x91] = 0x1f;
+    s->regs[0x92] = 0x07;
+    s->regs[0x93] = 0x1f;
+
+    s->regs[0x40] = 0xd8;
+    s->regs[0x41] = 0xff;
+    s->regs[0x42] = 0x03;
+    s->regs[0x43] = 0x03;
+
+    s->regs[0xb8] = 0xc0;
+    s->regs[0xb9] = 0x64;
+    s->regs[0xe6] = 0xa0;
+}
+
+/* Handle events from master. */
+static int axp221_event(I2CSlave *i2c, enum i2c_event event)
+{
+    AXP221I2CState *s = AXP221(i2c);
+
+    s->count = 0;
+
+    return 0;
+}
+
+/* Called when master requests read */
+static uint8_t axp221_rx(I2CSlave *i2c)
+{
+    AXP221I2CState *s = AXP221(i2c);
+    uint8_t ret = 0xff;
+
+    if (s->ptr < NR_REGS) {
+        ret = s->regs[s->ptr];
+        trace_axp221_rx(s->ptr, ret);
+        s->ptr++;
+    }
+
+    return ret;
+}
+
+/*
+ * Called when master sends write.
+ * Update ptr with byte 0, then perform write with second byte.
+ */
+static int axp221_tx(I2CSlave *i2c, uint8_t data)
+{
+    AXP221I2CState *s = AXP221(i2c);
+
+    if (s->count == 0) {
+        /* Store register address */
+        s->ptr = data;
+        s->count++;
+        trace_axp221_select(data);
+    } else {
+        trace_axp221_tx(s->ptr, data);
+        s->regs[s->ptr++] = data;
+    }
+
+    return 0;
+}
+
+static const VMStateDescription vmstate_axp221 = {
+    .name = TYPE_AXP221_PMU,
+    .version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT8_ARRAY(regs, AXP221I2CState, NR_REGS),
+        VMSTATE_UINT8(count, AXP221I2CState),
+        VMSTATE_UINT8(ptr, AXP221I2CState),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static void axp221_class_init(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+    I2CSlaveClass *isc = I2C_SLAVE_CLASS(oc);
+    ResettableClass *rc = RESETTABLE_CLASS(oc);
+
+    rc->phases.enter = axp221_reset_enter;
+    dc->vmsd = &vmstate_axp221;
+    isc->event = axp221_event;
+    isc->recv = axp221_rx;
+    isc->send = axp221_tx;
+}
+
+static const TypeInfo axp221_info = {
+    .name = TYPE_AXP221_PMU,
+    .parent = TYPE_I2C_SLAVE,
+    .instance_size = sizeof(AXP221I2CState),
+    .class_init = axp221_class_init
+};
+
+static void axp221_register_devices(void)
+{
+    type_register_static(&axp221_info);
+}
+
+type_init(axp221_register_devices);
diff --git a/hw/misc/meson.build b/hw/misc/meson.build
index b19b44841a..6b81670641 100644
--- a/hw/misc/meson.build
+++ b/hw/misc/meson.build
@@ -46,6 +46,7 @@ softmmu_ss.add(when: 'CONFIG_ALLWINNER_H3', if_true: files('allwinner-h3-sysctrl
 softmmu_ss.add(when: 'CONFIG_ALLWINNER_H3', if_true: files('allwinner-sid.c'))
 softmmu_ss.add(when: 'CONFIG_ALLWINNER_R40', if_true: files('allwinner-r40-ccu.c'))
 softmmu_ss.add(when: 'CONFIG_AXP209_PMU', if_true: files('axp209.c'))
+softmmu_ss.add(when: 'CONFIG_AXP221_PMU', if_true: files('axp221.c'))
 softmmu_ss.add(when: 'CONFIG_REALVIEW', if_true: files('arm_sysctl.c'))
 softmmu_ss.add(when: 'CONFIG_NSERIES', if_true: files('cbus.c'))
 softmmu_ss.add(when: 'CONFIG_ECCMEMCTL', if_true: files('eccmemctl.c'))
diff --git a/hw/misc/trace-events b/hw/misc/trace-events
index c47876a902..63b072d2d8 100644
--- a/hw/misc/trace-events
+++ b/hw/misc/trace-events
@@ -28,6 +28,11 @@ axp209_rx(uint8_t reg, uint8_t data) "Read reg 0x%" PRIx8 " : 0x%" PRIx8
 axp209_select(uint8_t reg) "Accessing reg 0x%" PRIx8
 axp209_tx(uint8_t reg, uint8_t data) "Write reg 0x%" PRIx8 " : 0x%" PRIx8
 
+# axp221.c
+axp221_rx(uint8_t reg, uint8_t data) "Read reg 0x%" PRIx8 " : 0x%" PRIx8
+axp221_select(uint8_t reg) "Accessing reg 0x%" PRIx8
+axp221_tx(uint8_t reg, uint8_t data) "Write reg 0x%" PRIx8 " : 0x%" PRIx8
+
 # eccmemctl.c
 ecc_mem_writel_mer(uint32_t val) "Write memory enable 0x%08x"
 ecc_mem_writel_mdr(uint32_t val) "Write memory delay 0x%08x"
-- 
2.25.1


