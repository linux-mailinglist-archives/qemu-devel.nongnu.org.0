Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B84F4573E24
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jul 2022 22:49:39 +0200 (CEST)
Received: from localhost ([::1]:40120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBjIg-0002kW-E7
	for lists+qemu-devel@lfdr.de; Wed, 13 Jul 2022 16:49:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben@codethink.co.uk>)
 id 1oBg2J-0000LM-6K; Wed, 13 Jul 2022 13:20:33 -0400
Received: from imap4.hz.codethink.co.uk ([188.40.203.114]:43308)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben@codethink.co.uk>)
 id 1oBg2G-0004Fj-Ls; Wed, 13 Jul 2022 13:20:30 -0400
Received: from cpc152649-stkp13-2-0-cust121.10-2.cable.virginm.net
 ([86.15.83.122] helo=rainbowdash)
 by imap4.hz.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
 id 1oBg21-003Mcx-KX; Wed, 13 Jul 2022 18:20:12 +0100
Received: from ben by rainbowdash with local (Exim 4.96)
 (envelope-from <ben@rainbowdash>) id 1oBg1z-000ABu-2v;
 Wed, 13 Jul 2022 18:20:11 +0100
From: Ben Dooks <ben.dooks@sifive.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Jude Onyenegecha <jude.onyenegecha@sifive.com>,
 Sudip Mukherjee <sudip.mukherjee@sifive.com>,
 William Salmon <william.salmon@sifive.com>,
 Adnan Chowdhury <adnan.chowdhury@sifive.com>,
 Ben Dooks <ben.dooks@sifive.com>
Subject: [PATCH] gpio: designware gpio driver
Date: Wed, 13 Jul 2022 18:20:10 +0100
Message-Id: <20220713172010.39163-1-ben.dooks@sifive.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=188.40.203.114; envelope-from=ben@codethink.co.uk;
 helo=imap4.hz.codethink.co.uk
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 13 Jul 2022 16:45:29 -0400
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

A model for the DesignWare GPIO (v1) block.

Signed-off-by: Ben Dooks <ben.dooks@sifive.com>
---
 hw/gpio/Kconfig                   |   3 +
 hw/gpio/designware_gpio.c         | 327 ++++++++++++++++++++++++++++++
 hw/gpio/meson.build               |   1 +
 hw/gpio/trace-events              |   7 +
 include/hw/gpio/designware_gpio.h |  89 ++++++++
 5 files changed, 427 insertions(+)
 create mode 100644 hw/gpio/designware_gpio.c
 create mode 100644 include/hw/gpio/designware_gpio.h

diff --git a/hw/gpio/Kconfig b/hw/gpio/Kconfig
index f0e7405f6e..e5883d9763 100644
--- a/hw/gpio/Kconfig
+++ b/hw/gpio/Kconfig
@@ -13,3 +13,6 @@ config GPIO_PWR
 
 config SIFIVE_GPIO
     bool
+
+config DESIGNWARE_GPIO
+    bool
\ No newline at end of file
diff --git a/hw/gpio/designware_gpio.c b/hw/gpio/designware_gpio.c
new file mode 100644
index 0000000000..417bccd630
--- /dev/null
+++ b/hw/gpio/designware_gpio.c
@@ -0,0 +1,327 @@
+/*
+ * Synopsys Desgignware general purpose input/output register definition
+ *
+ * Based on sifive_gpio.c and imx_gpio.c
+ *
+ * Copyright 2022 Sifive, Inc.
+ * Copyright 2018 Steffen Görtz <contrib@steffen-goertz.de>
+ *
+ * This code is licensed under the GPL version 2 or later.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/log.h"
+#include "hw/irq.h"
+#include "hw/qdev-properties.h"
+#include "hw/gpio/designware_gpio.h"
+#include "migration/vmstate.h"
+#include "trace.h"
+
+/* only bank A can provide interrupts */
+static void update_output_irqs(DESIGNWAREGPIOState *s)
+{
+    struct DESIGNWAREGPIOBank *bank = &s->bank[0];
+    uint32_t level_irqs, edge_irqs = 0;
+
+    /* re-calculate interrupts for raw_int_status */
+    level_irqs = bank->dr_val ^ s->int_polarity;
+    level_irqs &= ~s->int_level;
+
+    edge_irqs = bank->dr_val ^ bank->last_dr_val;
+    edge_irqs &= s->int_level;
+    bank->last_dr_val = bank->dr_val;
+
+    /* update irq from raw-status and the mask */
+    s->int_status_raw = level_irqs | edge_irqs;
+    s->int_status = s->int_status_raw & s->int_mask;
+
+    qemu_set_irq(s->irq, s->int_status ? 1 : 0);
+    trace_designware_gpio_update_output_irq(s->int_status);
+}
+
+static void update_state(DESIGNWAREGPIOState *s)
+{
+    struct DESIGNWAREGPIOBank *bank;
+    int banknr, basenr, nr;
+
+    for (banknr = 0; banknr < DESIGNWARE_GPIO_BANKS; banknr++) {
+        basenr = banknr * DESIGNWARE_GPIO_NR_PER_BANK;
+        bank = &s->bank[banknr];
+
+        /* check for data-direction differences */
+        if (bank->ddr & bank->in) {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "GPIO bank %d: pins shorted, DDR=%x, IN=%x, overlap=%x\n",
+                          banknr, bank->ddr, bank->in, bank->ddr & bank->in);
+        }
+
+        bank->dr_val = (bank->dr & bank->ddr) | (bank->in & ~bank->ddr);
+
+        /* update any outputs marked as outputs */
+        for (nr = 0; nr < DESIGNWARE_GPIO_NR_PER_BANK; nr++) {
+            if (!extract32(bank->ddr, nr, 1))
+                continue;
+            qemu_set_irq(s->output[basenr+nr], extract32(bank->dr_val, nr, 1));
+        }
+    }
+
+    update_output_irqs(s);
+}
+
+
+static uint64_t designware_gpio_read(void *opaque, hwaddr offset, unsigned int size)
+{
+    struct DESIGNWAREGPIOState *s = DESIGNWARE_GPIO(opaque);
+    struct DESIGNWAREGPIOBank *bank;
+    hwaddr banknr, reg;
+    uint64_t r = 0;
+    bool handled = true;
+
+    if (offset < (REG_SWPORTD_DDR + 4)) {
+        banknr = offset / REG_SWPORT_DR_STRIDE;
+        reg = offset % REG_SWPORT_DR_STRIDE;
+        bank = &s->bank[banknr];
+
+        switch (reg) {
+        case REG_SWPORTA_DR:
+            r = bank->dr;
+            break;
+        case REG_SWPORTA_DDR:
+            r = bank->ddr;
+            break;
+        default:
+            handled = false;
+        }
+    } else {
+        switch (offset) {
+        case REG_INTEN:
+            r= s->int_en;
+            break;
+        case REG_INTMASK:
+            r = s->int_mask;
+            break;
+        case REG_INTTYPE_LEVEL:
+            r = s->int_level;
+            break;
+        case REG_INT_POLARITY:
+            r = s->int_polarity;
+            break;
+        case REG_INTSTATUS:
+            r = s->int_status;
+            break;
+        case REG_INTSTATUS_RAW:
+            r = s->int_status_raw;
+            break;
+        case REG_PORTA_DEBOUNCE:
+            r = s->porta_debounce;
+            break;
+        case REG_PORTA_EOI:
+            r = 0x0;    /* write only */
+            break;
+        case REG_EXT_PORTA:
+            r = s->bank[0].dr_val;
+            break;
+        case REG_EXT_PORTB:
+            r = s->bank[1].dr_val;
+            break;
+        case REG_EXT_PORTC:
+            r = s->bank[2].dr_val;
+            break;
+        case REG_EXT_PORTD:
+            r = s->bank[3].dr_val;
+            break;
+        case REG_ID:
+            r = 0x0;
+            break;
+        default:
+            handled = false;
+        }
+    }
+
+    if (!handled)
+        qemu_log_mask(LOG_GUEST_ERROR,
+                "%s: bad read offset 0x%" HWADDR_PRIx "\n",
+                      __func__, offset);
+
+    trace_designware_gpio_read(offset, r);
+
+    return r;
+}
+
+static void designware_gpio_write(void *opaque, hwaddr offset,
+                              uint64_t value, unsigned int size)
+{
+    struct DESIGNWAREGPIOState *s = DESIGNWARE_GPIO(opaque);
+    struct DESIGNWAREGPIOBank *bank;
+    hwaddr banknr, reg;
+    bool handled = true;
+
+    trace_designware_gpio_write(offset, value);
+
+    if (offset < (REG_SWPORTD_DDR + 4)) {
+        banknr = offset / REG_SWPORT_DR_STRIDE;
+        reg = offset % REG_SWPORT_DR_STRIDE;
+        bank = &s->bank[banknr];
+
+        switch (reg) {
+        case REG_SWPORTA_DR:
+            bank->dr = value;
+            break;
+        case REG_SWPORTA_DDR:
+            bank->ddr = value;
+            break;
+        default:
+            handled = false;
+        }
+    } else {
+        switch (offset) {
+        case REG_INTEN:
+            s->int_en = value;
+            break;
+        case REG_INTMASK:
+            s->int_mask = value;
+            break;
+        case REG_INTTYPE_LEVEL:
+            s->int_level = value;
+            break;
+        case REG_INT_POLARITY:
+            s->int_polarity = value;
+            break;
+        case REG_INTSTATUS:
+            /* read only */
+        case REG_INTSTATUS_RAW:
+            /* read only */
+            break;
+        case REG_PORTA_DEBOUNCE:
+            s->porta_debounce = value;
+            break;
+        case REG_PORTA_EOI:
+            /* assume level irqs will just re-trigger */
+            s->int_status_raw &= ~value;
+            break;
+        case REG_EXT_PORTA:
+        case REG_EXT_PORTB:
+        case REG_EXT_PORTC:
+        case REG_EXT_PORTD:
+            /* read only, ignore */
+            break;
+        }
+    }
+
+    if (!handled)
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: bad write offset 0x%" HWADDR_PRIx "\n",
+                      __func__, offset);
+
+    update_state(s);
+}
+
+
+static const MemoryRegionOps gpio_ops = {
+    .read =  designware_gpio_read,
+    .write = designware_gpio_write,
+    .endianness = DEVICE_LITTLE_ENDIAN,
+    .impl.min_access_size = 4,
+    .impl.max_access_size = 4,
+};
+
+static void designware_gpio_set(void *opaque, int line, int value)
+{
+    DESIGNWAREGPIOState *s = DESIGNWARE_GPIO(opaque);
+    struct DESIGNWAREGPIOBank *bank = &s->bank[line / DESIGNWARE_GPIO_NR_PER_BANK];
+
+    trace_designware_gpio_set(line, value);
+    assert(line >= 0 && line < DESIGNWARE_GPIO_PINS);
+
+    bank->in_mask = deposit32(bank->in_mask, line, 1, value >= 0);
+    if (value >= 0) {
+        bank->in = deposit32(bank->in, line, 1, value != 0);
+    }
+
+    update_state(s);
+}
+
+static void designware_gpio_reset(DeviceState *dev)
+{
+    DESIGNWAREGPIOState *s = DESIGNWARE_GPIO(dev);
+
+    memset(s->bank, 0, sizeof(s->bank));
+    s->int_en = 0;
+    s->int_mask = 0;
+    s->int_level = 0;
+    s->int_polarity = 0;
+    s->int_status = 0;
+    s->porta_debounce = 0;
+}
+
+#define STATE_BANK(__nr) \
+    VMSTATE_UINT32(bank[__nr].dr,      DESIGNWAREGPIOState), \
+    VMSTATE_UINT32(bank[__nr].dr_val,  DESIGNWAREGPIOState), \
+    VMSTATE_UINT32(bank[__nr].ddr,     DESIGNWAREGPIOState), \
+    VMSTATE_UINT32(bank[__nr].in,      DESIGNWAREGPIOState), \
+    VMSTATE_UINT32(bank[__nr].in_mask,  DESIGNWAREGPIOState)
+
+static const VMStateDescription vmstate_designware_gpio = {
+    .name = TYPE_DESIGNWARE_GPIO,
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        STATE_BANK(0),
+        STATE_BANK(1),
+        STATE_BANK(2),
+        STATE_BANK(3),
+        VMSTATE_UINT32(int_en,       DESIGNWAREGPIOState),
+        VMSTATE_UINT32(int_mask,     DESIGNWAREGPIOState),
+        VMSTATE_UINT32(int_level,    DESIGNWAREGPIOState),
+        VMSTATE_UINT32(int_polarity, DESIGNWAREGPIOState),
+        VMSTATE_UINT32(int_status,   DESIGNWAREGPIOState),
+        VMSTATE_UINT32(int_status_raw, DESIGNWAREGPIOState),
+        VMSTATE_UINT32(porta_debounce, DESIGNWAREGPIOState),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static Property designware_gpio_properties[] = {
+    DEFINE_PROP_UINT32("ngpio", DESIGNWAREGPIOState, ngpio, DESIGNWARE_GPIO_PINS),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void designware_gpio_realize(DeviceState *dev, Error **errp)
+{
+    DESIGNWAREGPIOState *s = DESIGNWARE_GPIO(dev);
+
+    memory_region_init_io(&s->mmio, OBJECT(dev), &gpio_ops, s,
+            TYPE_DESIGNWARE_GPIO, DESIGNWARE_GPIO_SIZE);
+
+    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->mmio);
+    sysbus_init_irq(SYS_BUS_DEVICE(dev), &s->irq);
+
+    qdev_init_gpio_in(DEVICE(s), designware_gpio_set, s->ngpio);
+    qdev_init_gpio_out(DEVICE(s), s->output, s->ngpio);
+}
+
+static void designware_gpio_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    device_class_set_props(dc, designware_gpio_properties);
+    dc->vmsd = &vmstate_designware_gpio;
+    dc->realize = designware_gpio_realize;
+    dc->reset = designware_gpio_reset;
+    dc->desc = "SiFive GPIO";
+}
+
+static const TypeInfo designware_gpio_info = {
+    .name = TYPE_DESIGNWARE_GPIO,
+    .parent = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(DESIGNWAREGPIOState),
+    .class_init = designware_gpio_class_init
+};
+
+static void designware_gpio_register_types(void)
+{
+    type_register_static(&designware_gpio_info);
+}
+
+type_init(designware_gpio_register_types)
diff --git a/hw/gpio/meson.build b/hw/gpio/meson.build
index 7bd6a57264..66959c33de 100644
--- a/hw/gpio/meson.build
+++ b/hw/gpio/meson.build
@@ -5,6 +5,7 @@ softmmu_ss.add(when: 'CONFIG_MAX7310', if_true: files('max7310.c'))
 softmmu_ss.add(when: 'CONFIG_PL061', if_true: files('pl061.c'))
 softmmu_ss.add(when: 'CONFIG_ZAURUS', if_true: files('zaurus.c'))
 
+softmmu_ss.add(when: 'CONFIG_DESIGNWARE_GPIO', if_true: files('designware_gpio.c'))
 softmmu_ss.add(when: 'CONFIG_IMX', if_true: files('imx_gpio.c'))
 softmmu_ss.add(when: 'CONFIG_NPCM7XX', if_true: files('npcm7xx_gpio.c'))
 softmmu_ss.add(when: 'CONFIG_NRF51_SOC', if_true: files('nrf51_gpio.c'))
diff --git a/hw/gpio/trace-events b/hw/gpio/trace-events
index 9736b362ac..45dac8b706 100644
--- a/hw/gpio/trace-events
+++ b/hw/gpio/trace-events
@@ -31,3 +31,10 @@ sifive_gpio_update_output_irq(int64_t line, int64_t value) "line %" PRIi64 " val
 # aspeed_gpio.c
 aspeed_gpio_read(uint64_t offset, uint64_t value) "offset: 0x%" PRIx64 " value 0x%" PRIx64
 aspeed_gpio_write(uint64_t offset, uint64_t value) "offset: 0x%" PRIx64 " value 0x%" PRIx64
+
+# designware_gpio
+designware_gpio_read(uint64_t offset, uint64_t r) "offset 0x%" PRIx64 " value 0x%" PRIx64
+designware_gpio_write(uint64_t offset, uint64_t value) "offset 0x%" PRIx64 " value 0x%" PRIx64
+designware_gpio_set(int64_t line, int64_t value) "line %" PRIi64 " value %" PRIi64
+designware_gpio_update_output_irq(int64_t value) " value %" PRIi64
+
diff --git a/include/hw/gpio/designware_gpio.h b/include/hw/gpio/designware_gpio.h
new file mode 100644
index 0000000000..2d151d3823
--- /dev/null
+++ b/include/hw/gpio/designware_gpio.h
@@ -0,0 +1,89 @@
+/*
+ * Designware System-on-Chip general purpose input/output register definition
+ *
+ * Copyright 2022 SiFive, Inc.
+ * Copyright (c) 2011 Jamie Iles
+ *
+ * This code is licensed under the GPL version 2 or later.  See
+ * the COPYING file in the top-level directory.
+*/
+
+#ifndef DESIGNWARE_GPIO_H
+#define DESIGNWARE_GPIO_H
+
+#include "hw/sysbus.h"
+#include "qom/object.h"
+
+#define TYPE_DESIGNWARE_GPIO "designware.gpio"
+typedef struct DESIGNWAREGPIOState DESIGNWAREGPIOState;
+DECLARE_INSTANCE_CHECKER(DESIGNWAREGPIOState, DESIGNWARE_GPIO,
+                         TYPE_DESIGNWARE_GPIO)
+
+/* maximum pins for 4 banks */
+#define DESIGNWARE_GPIO_BANKS (4)
+#define DESIGNWARE_GPIO_NR_PER_BANK (32)
+#define DESIGNWARE_GPIO_PINS (32 * DESIGNWARE_GPIO_BANKS)
+
+#define DESIGNWARE_GPIO_SIZE 0x100
+
+/* registers copied from linux driver */
+#define REG_SWPORTA_DR		0x00
+#define REG_SWPORTA_DDR         0x04
+#define REG_SWPORTB_DR		0x0c
+#define REG_SWPORTB_DDR         0x10
+#define REG_SWPORTC_DR		0x18
+#define REG_SWPORTC_DDR         0x1c
+#define REG_SWPORTD_DR		0x24
+#define REG_SWPORTD_DDR         0x28
+#define REG_INTEN		0x30
+#define REG_INTMASK		0x34
+#define REG_INTTYPE_LEVEL	0x38
+#define REG_INT_POLARITY	0x3c
+#define REG_INTSTATUS		0x40
+#define REG_INTSTATUS_RAW       0x44
+#define REG_PORTA_DEBOUNCE	0x48
+#define REG_PORTA_EOI		0x4c    /* write to clear edge irq */
+#define REG_EXT_PORTA		0x50
+#define REG_EXT_PORTB		0x54
+#define REG_EXT_PORTC		0x58
+#define REG_EXT_PORTD		0x5c
+#define REG_ID                  0x64
+
+#define REG_EXT_PORT_STRIDE	0x04 /* register stride 32 bits */
+#define REG_SWPORT_DR_STRIDE	0x0c /* register stride 3*32 bits */
+#define REG_SWPORT_DDR_STRIDE	0x0c /* register stride 3*32 bits */
+\
+    
+struct DESIGNWAREGPIOBank {
+    uint32_t    dr;
+    uint32_t    dr_val;
+    uint32_t    ddr;    /* 0=in, 1=out */
+    uint32_t    last_dr_val;
+
+    /* internal state */
+    /* state from user */
+    uint32_t    in_mask;
+    uint32_t    in;
+};
+
+struct DESIGNWAREGPIOState {
+    SysBusDevice parent_obj;
+    MemoryRegion mmio;
+
+    qemu_irq irq;
+    qemu_irq output[DESIGNWARE_GPIO_PINS];
+
+    struct DESIGNWAREGPIOBank bank[DESIGNWARE_GPIO_BANKS];
+
+    uint32_t int_en;
+    uint32_t int_mask;
+    uint32_t int_level;         /* 0 = level, 1 = edge */
+    uint32_t int_polarity;
+    uint32_t int_status;
+    uint32_t int_status_raw;
+    uint32_t porta_debounce;
+    /* config */
+    uint32_t ngpio;
+};
+
+#endif /* DESIGNWARE_GPIO_H */
-- 
2.35.1


