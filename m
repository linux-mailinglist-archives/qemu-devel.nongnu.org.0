Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FDE73572F3
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 19:19:17 +0200 (CEST)
Received: from localhost ([::1]:54722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUBpk-0001Bk-Li
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 13:19:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1lUBnf-0007R0-MQ; Wed, 07 Apr 2021 13:17:07 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:63084)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1lUBnc-0006lv-Ts; Wed, 07 Apr 2021 13:17:06 -0400
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 137H2mhP119133; Wed, 7 Apr 2021 13:17:00 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37s5xsmr84-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Apr 2021 13:16:59 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 137HE6pj031313;
 Wed, 7 Apr 2021 17:16:58 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma03ams.nl.ibm.com with ESMTP id 37rvbqgwc7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Apr 2021 17:16:58 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 137HGugI38797792
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 7 Apr 2021 17:16:56 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F3F69AE053;
 Wed,  7 Apr 2021 17:16:55 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BDACCAE04D;
 Wed,  7 Apr 2021 17:16:55 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed,  7 Apr 2021 17:16:55 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.70.229])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 302552200C7;
 Wed,  7 Apr 2021 19:16:55 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 22/24] hw/misc: Add Infineon DPS310 sensor model
Date: Wed,  7 Apr 2021 19:16:35 +0200
Message-Id: <20210407171637.777743-23-clg@kaod.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210407171637.777743-1-clg@kaod.org>
References: <20210407171637.777743-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: i1e2s1rUsTjRoJeXO5YhytaGQdm6iAdP
X-Proofpoint-ORIG-GUID: i1e2s1rUsTjRoJeXO5YhytaGQdm6iAdP
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-07_09:2021-04-07,
 2021-04-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0
 malwarescore=0 mlxscore=0 spamscore=0 impostorscore=0 mlxlogscore=999
 bulkscore=0 clxscore=1034 lowpriorityscore=0 priorityscore=1501
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104070116
Received-SPF: softfail client-ip=148.163.158.5; envelope-from=clg@kaod.org;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Joel Stanley <joel@jms.id.au>

This contains some hardcoded register values that were obtained from the
hardware after reading the temperature.

It does enough to test the Linux kernel driver.

Signed-off-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/misc/dps310.c    | 339 ++++++++++++++++++++++++++++++++++++++++++++
 hw/arm/Kconfig      |   1 +
 hw/misc/Kconfig     |   4 +
 hw/misc/meson.build |   1 +
 4 files changed, 345 insertions(+)
 create mode 100644 hw/misc/dps310.c

diff --git a/hw/misc/dps310.c b/hw/misc/dps310.c
new file mode 100644
index 000000000000..153357b88236
--- /dev/null
+++ b/hw/misc/dps310.c
@@ -0,0 +1,339 @@
+/*
+ * Infineon DPS310 temperature and himidity sensor
+ *
+ * Copyright 2017 IBM Corporation
+ *
+ * This code is licensed under the GPL version 2 or later.  See
+ * the COPYING file in the top-level directory.
+ *
+ */
+
+#include "qemu/osdep.h"
+#include "hw/hw.h"
+#include "hw/i2c/i2c.h"
+#include "qapi/error.h"
+#include "qapi/visitor.h"
+#include "migration/vmstate.h"
+
+typedef struct DPS310State {
+    /*< private >*/
+    I2CSlave i2c;
+
+    /*< public >*/
+
+    uint8_t regs[0x30];
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
+#define DPS310_RESET            0x0c
+#define  DPS310_RESET_MAGIC     (BIT(0) | BIT(3))
+#define DPS310_COEF_BASE        0x10
+
+static void dps310_reset(DeviceState *dev)
+{
+    DPS310State *s =3D DPS310(dev);
+
+    memset(s->regs, 0, sizeof(s->regs));
+    s->pointer =3D 0;
+
+    s->regs[0x00] =3D 0xf3;
+    s->regs[0x01] =3D 0x4a;
+    s->regs[0x02] =3D 0xcc;
+    s->regs[0x03] =3D 0x06;
+    s->regs[0x04] =3D 0x7b;
+    s->regs[0x05] =3D 0xf3;
+    s->regs[0x06] =3D 0x07;
+    s->regs[0x07] =3D 0x87;
+    s->regs[0x08] =3D 0xc0;
+    s->regs[0x09] =3D 0x0c;
+    s->regs[0x0a] =3D 0x00;
+    s->regs[0x0b] =3D 0x00;
+    s->regs[0x0c] =3D 0x00;
+    s->regs[0x0d] =3D 0x10;
+    s->regs[0x0e] =3D 0x00;
+    s->regs[0x0f] =3D 0x00;
+    s->regs[0x10] =3D 0x0e;
+    s->regs[0x11] =3D 0x0e;
+    s->regs[0x12] =3D 0xdb;
+    s->regs[0x13] =3D 0x13;
+    s->regs[0x14] =3D 0xca;
+    s->regs[0x15] =3D 0xff;
+    s->regs[0x16] =3D 0x35;
+    s->regs[0x17] =3D 0x10;
+    s->regs[0x18] =3D 0xf3;
+    s->regs[0x19] =3D 0x34;
+    s->regs[0x1a] =3D 0x05;
+    s->regs[0x1b] =3D 0xc3;
+    s->regs[0x1c] =3D 0xd6;
+    s->regs[0x1d] =3D 0x84;
+    s->regs[0x1e] =3D 0x00;
+    s->regs[0x1f] =3D 0xa4;
+    s->regs[0x20] =3D 0xf9;
+    s->regs[0x21] =3D 0xa9;
+    s->regs[0x22] =3D 0x00;
+    s->regs[0x23] =3D 0x00;
+    s->regs[0x24] =3D 0x20;
+    s->regs[0x25] =3D 0x49;
+    s->regs[0x26] =3D 0x4a;
+    s->regs[0x27] =3D 0x41;
+    s->regs[0x28] =3D 0x86;
+    s->regs[0x29] =3D 0x00;
+    s->regs[0x2a] =3D 0x00;
+    s->regs[0x2b] =3D 0x00;
+    s->regs[0x2c] =3D 0x00;
+    s->regs[0x2d] =3D 0x00;
+    s->regs[0x2e] =3D 0x00;
+    s->regs[0x2f] =3D 0x00;
+
+    /* TODO: assert these after some timeout ? */
+    s->regs[DPS310_MEAS_CFG] =3D DPS310_COEF_RDY | DPS310_SENSOR_RDY
+        | DPS310_TMP_RDY | DPS310_PRS_RDY;
+
+}
+
+
+static void dps310_get_pressure(Object *obj, Visitor *v, const char *nam=
e,
+                                   void *opaque, Error **errp)
+{
+    DPS310State *s =3D DPS310(obj);
+    int64_t value;
+
+    /* TODO */
+    value =3D s->pressure;
+
+    visit_type_int(v, name, &value, errp);
+}
+
+static void dps310_get_temperature(Object *obj, Visitor *v, const char *=
name,
+                                   void *opaque, Error **errp)
+{
+    DPS310State *s =3D DPS310(obj);
+    int64_t value;
+
+    /* TODO */
+    value =3D s->temperature;
+
+
+    visit_type_int(v, name, &value, errp);
+}
+
+static void dps310_set_temperature(Object *obj, Visitor *v, const char *=
name,
+                                   void *opaque, Error **errp)
+{
+    DPS310State *s =3D DPS310(obj);
+    Error *local_err =3D NULL;
+    int64_t temp;
+
+    visit_type_int(v, name, &temp, &local_err);
+    if (local_err) {
+        error_propagate(errp, local_err);
+        return;
+    }
+
+    /* TODO */
+    if (temp >=3D 200 || temp < -100) {
+        error_setg(errp, "value %" PRId64 ".%03" PRIu64 " =C2=B0C is out=
 of range",
+                   temp / 1000, temp % 1000);
+        return;
+    }
+
+    s->temperature =3D temp;
+}
+
+static void dps310_set_pressure(Object *obj, Visitor *v, const char *nam=
e,
+                                   void *opaque, Error **errp)
+{
+    DPS310State *s =3D DPS310(obj);
+    Error *local_err =3D NULL;
+    int64_t pres;
+
+    visit_type_int(v, name, &pres, &local_err);
+    if (local_err) {
+        error_propagate(errp, local_err);
+        return;
+    }
+
+    /* TODO */
+    if (pres >=3D 200 || pres < -100) {
+        error_setg(errp, "value %" PRId64 ".%03" PRIu64 " is out of rang=
e",
+                   pres / 1000, pres % 1000);
+        return;
+    }
+
+    s->pressure =3D pres;
+}
+
+static void dps310_read(DPS310State *s)
+{
+    s->len =3D 0;
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
+    case DPS310_COEF_BASE:
+    default:
+        s->buf[s->len++] =3D s->regs[s->pointer];
+        break;
+    }
+}
+
+static void dps310_write(DPS310State *s)
+{
+    switch (s->pointer) {
+    case DPS310_RESET:
+        if (s->buf[0] =3D=3D DPS310_RESET_MAGIC) {
+            dps310_reset(DEVICE(s));
+        }
+        break;
+    case DPS310_PRS_CFG:
+    case DPS310_TMP_CFG:
+    case DPS310_MEAS_CFG:
+    case DPS310_COEF_BASE:
+    default:
+        s->regs[s->pointer] =3D s->buf[0];
+        break;
+    }
+}
+
+static uint8_t dps310_rx(I2CSlave *i2c)
+{
+    DPS310State *s =3D DPS310(i2c);
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
+    DPS310State *s =3D DPS310(i2c);
+
+    if (s->len =3D=3D 0) {
+        /*
+         * first byte is the register pointer for a read or write
+         * operation
+         */
+        s->pointer =3D data;
+        s->len++;
+    } else if (s->len =3D=3D 1) {
+        /*
+         * second byte is the data to write. The device only supports
+         * one byte writes
+         */
+        s->buf[0] =3D data;
+        dps310_write(s);
+    }
+
+    return 0;
+}
+
+static int dps310_event(I2CSlave *i2c, enum i2c_event event)
+{
+    DPS310State *s =3D DPS310(i2c);
+
+    if (event =3D=3D I2C_START_RECV) {
+        dps310_read(s);
+    }
+
+    s->len =3D 0;
+    return 0;
+}
+
+static const VMStateDescription vmstate_dps310 =3D {
+    .name =3D "DPS310",
+    .version_id =3D 0,
+    .minimum_version_id =3D 0,
+    .fields =3D (VMStateField[]) {
+        VMSTATE_UINT8(len, DPS310State),
+        VMSTATE_UINT8_ARRAY(buf, DPS310State, 2),
+        VMSTATE_UINT8_ARRAY(regs, DPS310State, 0x30),
+        VMSTATE_UINT8(pointer, DPS310State),
+        VMSTATE_INT16(temperature, DPS310State),
+        VMSTATE_INT16(pressure, DPS310State),
+        VMSTATE_I2C_SLAVE(i2c, DPS310State),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
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
+    DeviceClass *dc =3D DEVICE_CLASS(klass);
+    I2CSlaveClass *k =3D I2C_SLAVE_CLASS(klass);
+
+    k->event =3D dps310_event;
+    k->recv =3D dps310_rx;
+    k->send =3D dps310_tx;
+    dc->reset =3D dps310_reset;
+    dc->vmsd =3D &vmstate_dps310;
+}
+
+static const TypeInfo dps310_info =3D {
+    .name          =3D TYPE_DPS310,
+    .parent        =3D TYPE_I2C_SLAVE,
+    .instance_size =3D sizeof(DPS310State),
+    .instance_init =3D dps310_initfn,
+    .class_init    =3D dps310_class_init,
+};
+
+static void dps310_register_types(void)
+{
+    type_register_static(&dps310_info);
+}
+
+type_init(dps310_register_types)
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 8c37cf00da74..66532e0e3e82 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -408,6 +408,7 @@ config ASPEED_SOC
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
=20
+config DPS310
+    bool
+    depends on I2C
+
 config PCA9552
     bool
     depends on I2C
diff --git a/hw/misc/meson.build b/hw/misc/meson.build
index ed8196dc4380..30cb61ec0e31 100644
--- a/hw/misc/meson.build
+++ b/hw/misc/meson.build
@@ -1,4 +1,5 @@
 softmmu_ss.add(when: 'CONFIG_APPLESMC', if_true: files('applesmc.c'))
+softmmu_ss.add(when: 'CONFIG_DPS310', if_true: files('dps310.c'))
 softmmu_ss.add(when: 'CONFIG_EDU', if_true: files('edu.c'))
 softmmu_ss.add(when: 'CONFIG_FW_CFG_DMA', if_true: files('vmcoreinfo.c')=
)
 softmmu_ss.add(when: 'CONFIG_ISA_DEBUG', if_true: files('debugexit.c'))
--=20
2.26.3


