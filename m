Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D15E33A120A
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 13:06:58 +0200 (CEST)
Received: from localhost ([::1]:37302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqw2z-0002oX-JF
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 07:06:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1lqvuo-0006Dz-Kc; Wed, 09 Jun 2021 06:58:30 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:43900)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1lqvum-0006rF-D7; Wed, 09 Jun 2021 06:58:30 -0400
Received: by mail-pf1-x429.google.com with SMTP id m7so5181046pfa.10;
 Wed, 09 Jun 2021 03:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oeCq1ifJeKYNEfT34xRGhB5YzlA4KKQ+veFtXOA2wc4=;
 b=u6O+QdmZhRRtvhZXgpOIDmm8xVmSJh31RWzajqRa38n/Tu1Da3nzPmwEyKzyaW4c5A
 Bl48qu8YgLldoBKPxEl0OuEDFr+RdBRwHKx5xTF984iqpj+dUbYy4zcFcpQFjdxWFixW
 8ZP/zgvdlFTfVkbipbkc27uz41ymuK75Feld9detmCPM0VbXXrrgbWPLBMVCK7xo3pu9
 X6N+xfOP4C0tTBCjnicbtQ0UKFlncIwZwhIPW5kqaPakueyCnUbalz4yAS4Um0iEuaOG
 rrLMQfkU0NcqNlfIAgHSf86wwHLi3/tN43FTX/vGwzhZULCNtgeb9qdEQ7BEUada+l2K
 IXWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=oeCq1ifJeKYNEfT34xRGhB5YzlA4KKQ+veFtXOA2wc4=;
 b=NZsbsIpLA6jqgOnBXRnmFcvenzcHZW2McENbeQINEETMS4nU1aCvWbZGoobEufqAHa
 1LNpk9eL6ceXzwu7LcMfDVWb2gqYqdphOp9InTadXoGie1qgD9tsiPGSvuW3B3PzjQ4j
 dAq8IX33lFCIlr/amEiZSAwgpN+9Jk9wuwu4LV1eF9f7dgF/GEMdospqRvP67kF8I7YV
 IEzvsdE+Y2GUUh6zIZNL7sHYsommReZ6a0AtwmSMZsRrswYqXFLl321AmXmfzny9lR+v
 OWcAceXU/3aTWqahoewkuHlC9ELG9LbceeuTTX4xirdRQFz52Xet9EBEMSbrDKqY5jf4
 DZzQ==
X-Gm-Message-State: AOAM531xoGfAQoLeg+tZiFNBpbuf0c8i+Xwo6rY44L5lo/up7z4YbxVM
 CRftrKSJBUd4hUSKa/2jX+HZ+AkpJdE=
X-Google-Smtp-Source: ABdhPJzxjBPR5PH1PGLQYXZra/IsropKC+wCQlwYRrozS49PDj0ciDv0bbQqazQ4ezEnvAZc3RbaDg==
X-Received: by 2002:aa7:83c3:0:b029:2e8:f2ba:3979 with SMTP id
 j3-20020aa783c30000b02902e8f2ba3979mr4606203pfn.8.1623236306620; 
 Wed, 09 Jun 2021 03:58:26 -0700 (PDT)
Received: from voyager.lan ([45.124.203.19])
 by smtp.gmail.com with ESMTPSA id c3sm12866923pfl.42.2021.06.09.03.58.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jun 2021 03:58:25 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH 1/2] hw/misc: Add Infineon DPS310 sensor model
Date: Wed,  9 Jun 2021 20:28:01 +0930
Message-Id: <20210609105802.17015-2-joel@jms.id.au>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210609105802.17015-1-joel@jms.id.au>
References: <20210609105802.17015-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=joel.stan@gmail.com; helo=mail-pf1-x429.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This contains some hardcoded register values that were obtained from the
hardware after reading the temperature.

It does enough to test the Linux kernel driver.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 hw/misc/dps310.c    | 357 ++++++++++++++++++++++++++++++++++++++++++++
 hw/arm/Kconfig      |   1 +
 hw/misc/Kconfig     |   4 +
 hw/misc/meson.build |   1 +
 4 files changed, 363 insertions(+)
 create mode 100644 hw/misc/dps310.c

diff --git a/hw/misc/dps310.c b/hw/misc/dps310.c
new file mode 100644
index 000000000000..1fe1a1a645f2
--- /dev/null
+++ b/hw/misc/dps310.c
@@ -0,0 +1,357 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright 2017 Joel Stanley <joel@jms.id.au>, IBM Corporation
+ *
+ * Infineon DPS310 temperature and himidity sensor
+ *
+ * https://www.infineon.com/cms/en/product/sensor/pressure-sensors/pressure-sensors-for-iot/dps310/
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/log.h"
+#include "hw/hw.h"
+#include "hw/i2c/i2c.h"
+#include "qapi/error.h"
+#include "qapi/visitor.h"
+#include "migration/vmstate.h"
+
+#define NUM_REGISTERS   0x32
+
+typedef struct DPS310State {
+    /*< private >*/
+    I2CSlave i2c;
+
+    /*< public >*/
+    uint8_t regs[NUM_REGISTERS];
+
+    int16_t pressure, temperature;
+
+    uint8_t len;
+    uint8_t buf[2];
+    uint8_t pointer;
+
+} DPS310State;
+
+typedef struct DPS310Class {
+    I2CSlaveClass parent_class;
+} DPS310Class;
+
+#define TYPE_DPS310 "dps310"
+#define DPS310(obj) OBJECT_CHECK(DPS310State, (obj), TYPE_DPS310)
+
+#define DPS310_CLASS(klass) \
+     OBJECT_CLASS_CHECK(DPS310Class, (klass), TYPE_DPS310)
+#define DPS310_GET_CLASS(obj) \
+     OBJECT_GET_CLASS(DPS310Class, (obj), TYPE_DPS310)
+
+#define DPS310_PRS_B2           0x00
+#define DPS310_PRS_B1           0x01
+#define DPS310_PRS_B0           0x02
+#define DPS310_TMP_B2           0x03
+#define DPS310_TMP_B1           0x04
+#define DPS310_TMP_B0           0x05
+#define DPS310_PRS_CFG          0x06
+#define DPS310_TMP_CFG          0x07
+#define  DPS310_TMP_RATE_BITS   GENMASK(6, 4)
+#define DPS310_MEAS_CFG         0x08
+#define  DPS310_MEAS_CTRL_BITS  GENMASK(2, 0)
+#define   DPS310_PRESSURE_EN    BIT(0)
+#define   DPS310_TEMP_EN        BIT(1)
+#define   DPS310_BACKGROUND     BIT(2)
+#define  DPS310_PRS_RDY         BIT(4)
+#define  DPS310_TMP_RDY         BIT(5)
+#define  DPS310_SENSOR_RDY      BIT(6)
+#define  DPS310_COEF_RDY        BIT(7)
+#define DPS310_CFG_REG          0x09
+#define DPS310_RESET            0x0c
+#define  DPS310_RESET_MAGIC     (BIT(0) | BIT(3))
+#define DPS310_COEF_BASE        0x10
+#define DPS310_COEF_LAST        0x21
+#define DPS310_COEF_SRC         0x28
+
+static void dps310_reset(DeviceState *dev)
+{
+    DPS310State *s = DPS310(dev);
+
+    memset(s->regs, 0, sizeof(s->regs));
+    s->pointer = 0;
+
+    s->regs[0x00] = 0xfe;
+    s->regs[0x01] = 0x2f;
+    s->regs[0x02] = 0xee;
+    s->regs[0x03] = 0x02;
+    s->regs[0x04] = 0x69;
+    s->regs[0x05] = 0xa6;
+    s->regs[0x06] = 0x00;
+    s->regs[0x07] = 0x80;
+    s->regs[0x08] = 0xc7;
+
+    s->regs[0x0d] = 0x10;
+    s->regs[0x0e] = 0x00;
+    s->regs[0x0f] = 0x00;
+    s->regs[0x10] = 0x0e;
+    s->regs[0x11] = 0x1e;
+    s->regs[0x12] = 0xdd;
+    s->regs[0x13] = 0x13;
+    s->regs[0x14] = 0xca;
+    s->regs[0x15] = 0x5f;
+    s->regs[0x16] = 0x21;
+    s->regs[0x17] = 0x52;
+    s->regs[0x18] = 0xf9;
+    s->regs[0x19] = 0xc6;
+    s->regs[0x1a] = 0x04;
+    s->regs[0x1b] = 0xd1;
+    s->regs[0x1c] = 0xdb;
+    s->regs[0x1d] = 0x47;
+    s->regs[0x1e] = 0x00;
+    s->regs[0x1f] = 0x5b;
+    s->regs[0x20] = 0xfb;
+    s->regs[0x21] = 0x3a;
+    s->regs[0x22] = 0x00;
+    s->regs[0x23] = 0x00;
+    s->regs[0x24] = 0x20;
+    s->regs[0x25] = 0x49;
+    s->regs[0x26] = 0x4e;
+    s->regs[0x27] = 0xa5;
+    s->regs[0x28] = 0x90;
+
+    s->regs[0x30] = 0x60;
+    s->regs[0x31] = 0x15;
+
+    /* TODO: assert these after some timeout ? */
+    s->regs[DPS310_MEAS_CFG] = DPS310_COEF_RDY | DPS310_SENSOR_RDY
+        | DPS310_TMP_RDY | DPS310_PRS_RDY;
+}
+
+static void dps310_get_pressure(Object *obj, Visitor *v, const char *name,
+                                   void *opaque, Error **errp)
+{
+    DPS310State *s = DPS310(obj);
+    int64_t value;
+
+    /* TODO */
+    value = s->pressure;
+
+    visit_type_int(v, name, &value, errp);
+}
+
+static void dps310_get_temperature(Object *obj, Visitor *v, const char *name,
+                                   void *opaque, Error **errp)
+{
+    DPS310State *s = DPS310(obj);
+    int64_t value;
+
+    /* TODO */
+    value = s->temperature;
+
+    visit_type_int(v, name, &value, errp);
+}
+
+static void dps310_set_temperature(Object *obj, Visitor *v, const char *name,
+                                   void *opaque, Error **errp)
+{
+    DPS310State *s = DPS310(obj);
+    Error *local_err = NULL;
+    int64_t temp;
+
+    visit_type_int(v, name, &temp, &local_err);
+    if (local_err) {
+        error_propagate(errp, local_err);
+        return;
+    }
+
+    /* TODO */
+    if (temp >= 200 || temp < -100) {
+        error_setg(errp, "value %" PRId64 ".%03" PRIu64 " °C is out of range",
+                   temp / 1000, temp % 1000);
+        return;
+    }
+
+    s->temperature = temp;
+}
+
+static void dps310_set_pressure(Object *obj, Visitor *v, const char *name,
+                                   void *opaque, Error **errp)
+{
+    DPS310State *s = DPS310(obj);
+    Error *local_err = NULL;
+    int64_t pres;
+
+    visit_type_int(v, name, &pres, &local_err);
+    if (local_err) {
+        error_propagate(errp, local_err);
+        return;
+    }
+
+    /* TODO */
+    if (pres >= 200 || pres < -100) {
+        error_setg(errp, "value %" PRId64 ".%03" PRIu64 " is out of range",
+                   pres / 1000, pres % 1000);
+        return;
+    }
+
+    s->pressure = pres;
+}
+
+static void dps310_read(DPS310State *s)
+{
+    /* Test should be >=, but we want to include register 0x32 */
+    if (s->pointer > sizeof(s->regs)) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: register 0x%02x out of bounds\n",
+                      __func__, s->pointer);
+        return;
+    }
+
+    s->len = 0;
+
+    switch (s->pointer) {
+    case DPS310_PRS_B2:
+    case DPS310_PRS_B1:
+    case DPS310_PRS_B0:
+    case DPS310_TMP_B2:
+    case DPS310_TMP_B1:
+    case DPS310_TMP_B0:
+    case DPS310_PRS_CFG:
+    case DPS310_TMP_CFG:
+    case DPS310_MEAS_CFG:
+    case DPS310_CFG_REG:
+    case DPS310_COEF_BASE...DPS310_COEF_LAST:
+    case DPS310_COEF_SRC:
+        s->buf[s->len++] = s->regs[s->pointer];
+        break;
+    case 0x32:
+        /* Undocumented register to indicate workaround not required */
+        s->buf[s->len++] = 0x2;
+        break;
+    default:
+        qemu_log_mask(LOG_UNIMP, "%s: register 0x%02x unimplemented\n",
+                      __func__, s->pointer);
+        return;
+    }
+}
+
+static void dps310_write(DPS310State *s)
+{
+    if (s->pointer >= sizeof(s->regs)) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: register %d out of bounds\n",
+                      __func__, s->pointer);
+        return;
+    }
+
+    switch (s->pointer) {
+    case DPS310_RESET:
+        if (s->buf[0] == DPS310_RESET_MAGIC) {
+            dps310_reset(DEVICE(s));
+        }
+        break;
+    case DPS310_PRS_CFG:
+    case DPS310_TMP_CFG:
+    case DPS310_MEAS_CFG:
+    case DPS310_CFG_REG:
+        s->regs[s->pointer] = s->buf[0];
+        break;
+    default:
+        qemu_log_mask(LOG_UNIMP, "%s: register 0x%02x unimplemented\n",
+                      __func__, s->pointer);
+        return;
+    }
+}
+
+static uint8_t dps310_rx(I2CSlave *i2c)
+{
+    DPS310State *s = DPS310(i2c);
+
+    if (s->len < 2) {
+        return s->buf[s->len++];
+    } else {
+        return 0xff;
+    }
+}
+
+static int dps310_tx(I2CSlave *i2c, uint8_t data)
+{
+    DPS310State *s = DPS310(i2c);
+
+    if (s->len == 0) {
+        /*
+         * first byte is the register pointer for a read or write
+         * operation
+         */
+        s->pointer = data;
+        s->len++;
+    } else if (s->len == 1) {
+        /*
+         * second byte is the data to write. The device only supports
+         * one byte writes
+         */
+        s->buf[0] = data;
+        dps310_write(s);
+    }
+
+    return 0;
+}
+
+static int dps310_event(I2CSlave *i2c, enum i2c_event event)
+{
+    DPS310State *s = DPS310(i2c);
+
+    if (event == I2C_START_RECV) {
+        dps310_read(s);
+    }
+
+    s->len = 0;
+    return 0;
+}
+
+static const VMStateDescription vmstate_dps310 = {
+    .name = "DPS310",
+    .version_id = 0,
+    .minimum_version_id = 0,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT8(len, DPS310State),
+        VMSTATE_UINT8_ARRAY(buf, DPS310State, 2),
+        VMSTATE_UINT8_ARRAY(regs, DPS310State, NUM_REGISTERS),
+        VMSTATE_UINT8(pointer, DPS310State),
+        VMSTATE_INT16(temperature, DPS310State),
+        VMSTATE_INT16(pressure, DPS310State),
+        VMSTATE_I2C_SLAVE(i2c, DPS310State),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static void dps310_initfn(Object *obj)
+{
+    object_property_add(obj, "temperature", "int",
+                        dps310_get_temperature,
+                        dps310_set_temperature, NULL, NULL);
+    object_property_add(obj, "pressure", "int",
+                        dps310_get_pressure,
+                        dps310_set_pressure, NULL, NULL);
+}
+
+static void dps310_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    I2CSlaveClass *k = I2C_SLAVE_CLASS(klass);
+
+    k->event = dps310_event;
+    k->recv = dps310_rx;
+    k->send = dps310_tx;
+    dc->reset = dps310_reset;
+    dc->vmsd = &vmstate_dps310;
+}
+
+static const TypeInfo dps310_info = {
+    .name          = TYPE_DPS310,
+    .parent        = TYPE_I2C_SLAVE,
+    .instance_size = sizeof(DPS310State),
+    .instance_init = dps310_initfn,
+    .class_init    = dps310_class_init,
+};
+
+static void dps310_register_types(void)
+{
+    type_register_static(&dps310_info);
+}
+
+type_init(dps310_register_types)
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 67723d9ea6a8..62925845ebc1 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -410,6 +410,7 @@ config ASPEED_SOC
     select DS1338
     select FTGMAC100
     select I2C
+    select DPS310
     select PCA9552
     select SERIAL
     select SMBUS_EEPROM
diff --git a/hw/misc/Kconfig b/hw/misc/Kconfig
index c71ed2582046..016e34790e4f 100644
--- a/hw/misc/Kconfig
+++ b/hw/misc/Kconfig
@@ -49,6 +49,10 @@ config EDU
     default y if TEST_DEVICES
     depends on PCI && MSI_NONBROKEN
 
+config DPS310
+    bool
+    depends on I2C
+
 config PCA9552
     bool
     depends on I2C
diff --git a/hw/misc/meson.build b/hw/misc/meson.build
index 66e1648533e0..779d8b1582d3 100644
--- a/hw/misc/meson.build
+++ b/hw/misc/meson.build
@@ -1,4 +1,5 @@
 softmmu_ss.add(when: 'CONFIG_APPLESMC', if_true: files('applesmc.c'))
+softmmu_ss.add(when: 'CONFIG_DPS310', if_true: files('dps310.c'))
 softmmu_ss.add(when: 'CONFIG_EDU', if_true: files('edu.c'))
 softmmu_ss.add(when: 'CONFIG_FW_CFG_DMA', if_true: files('vmcoreinfo.c'))
 softmmu_ss.add(when: 'CONFIG_ISA_DEBUG', if_true: files('debugexit.c'))
-- 
2.30.2


