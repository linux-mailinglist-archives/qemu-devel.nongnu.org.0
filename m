Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8BAF3B7441
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 16:26:05 +0200 (CEST)
Received: from localhost ([::1]:41572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyEge-00013I-K3
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 10:26:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1lyEef-0006iv-Bk; Tue, 29 Jun 2021 10:24:02 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:30686
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1lyEec-0005wC-AE; Tue, 29 Jun 2021 10:24:00 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15TE5WhK117612; Tue, 29 Jun 2021 10:23:46 -0400
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0b-001b2d01.pphosted.com with ESMTP id 39g4swgv70-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Jun 2021 10:23:45 -0400
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15TENIFh023300;
 Tue, 29 Jun 2021 14:23:44 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma06fra.de.ibm.com with ESMTP id 39dugh8pt2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Jun 2021 14:23:43 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 15TEM8Uq36831688
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 29 Jun 2021 14:22:08 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 913B652B55;
 Tue, 29 Jun 2021 14:23:41 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with SMTP id 0E3295215B;
 Tue, 29 Jun 2021 14:23:41 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.54.151])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 4FEDA220213;
 Tue, 29 Jun 2021 16:23:40 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 3/4] hw/misc: Add Infineon DPS310 sensor model
Date: Tue, 29 Jun 2021 16:23:35 +0200
Message-Id: <20210629142336.750058-4-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210629142336.750058-1-clg@kaod.org>
References: <20210629142336.750058-1-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: QJ1awAWdYO6bdSux6u_aHMcpbsjMukRP
X-Proofpoint-GUID: QJ1awAWdYO6bdSux6u_aHMcpbsjMukRP
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-29_06:2021-06-28,
 2021-06-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1034
 spamscore=0 priorityscore=1501 bulkscore=0 malwarescore=0 adultscore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 mlxscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2106290095
Received-SPF: softfail client-ip=148.163.158.5; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) BAYES_00=-1.9, KHOP_HELO_FCRDNS=0.207,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

It does enough to test the Linux kernel driver. The FIFO mode, IRQs and
operation modes other than the default as used by Linux are not modelled.

Signed-off-by: Joel Stanley <joel@jms.id.au>
[ clg: Fix sequential reading ]
Message-Id: <20210616073358.750472-2-joel@jms.id.au>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/misc/dps310.c    | 227 ++++++++++++++++++++++++++++++++++++++++++++
 hw/arm/Kconfig      |   1 +
 hw/misc/Kconfig     |   4 +
 hw/misc/meson.build |   1 +
 4 files changed, 233 insertions(+)
 create mode 100644 hw/misc/dps310.c

diff --git a/hw/misc/dps310.c b/hw/misc/dps310.c
new file mode 100644
index 000000000000..893521ab8516
--- /dev/null
+++ b/hw/misc/dps310.c
@@ -0,0 +1,227 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright 2017-2021 Joel Stanley <joel@jms.id.au>, IBM Corporation
+ *
+ * Infineon DPS310 temperature and humidity sensor
+ *
+ * https://www.infineon.com/cms/en/product/sensor/pressure-sensors/pressur=
e-sensors-for-iot/dps310/
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
+#define NUM_REGISTERS   0x33
+
+typedef struct DPS310State {
+    /*< private >*/
+    I2CSlave i2c;
+
+    /*< public >*/
+    uint8_t regs[NUM_REGISTERS];
+
+    uint8_t len;
+    uint8_t pointer;
+
+} DPS310State;
+
+#define TYPE_DPS310 "dps310"
+#define DPS310(obj) OBJECT_CHECK(DPS310State, (obj), TYPE_DPS310)
+
+#define DPS310_PRS_B2           0x00
+#define DPS310_PRS_B1           0x01
+#define DPS310_PRS_B0           0x02
+#define DPS310_TMP_B2           0x03
+#define DPS310_TMP_B1           0x04
+#define DPS310_TMP_B0           0x05
+#define DPS310_PRS_CFG          0x06
+#define DPS310_TMP_CFG          0x07
+#define  DPS310_TMP_RATE_BITS   (0x70)
+#define DPS310_MEAS_CFG         0x08
+#define  DPS310_MEAS_CTRL_BITS  (0x07)
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
+    DPS310State *s =3D DPS310(dev);
+
+    static const uint8_t regs_reset_state[] =3D {
+        0xfe, 0x2f, 0xee, 0x02, 0x69, 0xa6, 0x00, 0x80, 0xc7, 0x00, 0x00, =
0x00,
+        0x00, 0x10, 0x00, 0x00, 0x0e, 0x1e, 0xdd, 0x13, 0xca, 0x5f, 0x21, =
0x52,
+        0xf9, 0xc6, 0x04, 0xd1, 0xdb, 0x47, 0x00, 0x5b, 0xfb, 0x3a, 0x00, =
0x00,
+        0x20, 0x49, 0x4e, 0xa5, 0x90, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, =
0x00,
+        0x60, 0x15, 0x02
+    };
+
+    QEMU_BUILD_BUG_ON(sizeof(regs_reset_state) !=3D sizeof(s->regs));
+
+    memcpy(s->regs, regs_reset_state, sizeof(s->regs));
+    s->pointer =3D 0;
+
+    /* TODO: assert these after some timeout ? */
+    s->regs[DPS310_MEAS_CFG] =3D DPS310_COEF_RDY | DPS310_SENSOR_RDY
+        | DPS310_TMP_RDY | DPS310_PRS_RDY;
+}
+
+static uint8_t dps310_read(DPS310State *s, uint8_t reg)
+{
+    if (reg >=3D sizeof(s->regs)) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: register 0x%02x out of bounds\=
n",
+                      __func__, s->pointer);
+        return 0xFF;
+    }
+
+    switch (reg) {
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
+    case 0x32: /* Undocumented register to indicate workaround not require=
d */
+        return s->regs[reg];
+    default:
+        qemu_log_mask(LOG_UNIMP, "%s: register 0x%02x unimplemented\n",
+                      __func__, reg);
+        return 0xFF;
+    }
+}
+
+static void dps310_write(DPS310State *s, uint8_t reg, uint8_t data)
+{
+    if (reg >=3D sizeof(s->regs)) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: register %d out of bounds\n",
+                      __func__, s->pointer);
+        return;
+    }
+
+    switch (reg) {
+    case DPS310_RESET:
+        if (data =3D=3D DPS310_RESET_MAGIC) {
+            device_cold_reset(DEVICE(s));
+        }
+        break;
+    case DPS310_PRS_CFG:
+    case DPS310_TMP_CFG:
+    case DPS310_MEAS_CFG:
+    case DPS310_CFG_REG:
+        s->regs[reg] =3D data;
+        break;
+    default:
+        qemu_log_mask(LOG_UNIMP, "%s: register 0x%02x unimplemented\n",
+                      __func__, reg);
+        return;
+    }
+}
+
+static uint8_t dps310_rx(I2CSlave *i2c)
+{
+    DPS310State *s =3D DPS310(i2c);
+
+    if (s->len =3D=3D 1) {
+        return dps310_read(s, s->pointer++);
+    } else {
+        return 0xFF;
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
+        dps310_write(s, s->pointer++, data);
+    }
+
+    return 0;
+}
+
+static int dps310_event(I2CSlave *i2c, enum i2c_event event)
+{
+    DPS310State *s =3D DPS310(i2c);
+
+    switch (event) {
+    case I2C_START_SEND:
+        s->pointer =3D 0xFF;
+        s->len =3D 0;
+        break;
+    case I2C_START_RECV:
+        if (s->len !=3D 1) {
+            qemu_log_mask(LOG_GUEST_ERROR, "%s: invalid recv sequence\n",
+                          __func__);
+        }
+        break;
+    default:
+        break;
+    }
+
+    return 0;
+}
+
+static const VMStateDescription vmstate_dps310 =3D {
+    .name =3D "DPS310",
+    .version_id =3D 0,
+    .minimum_version_id =3D 0,
+    .fields =3D (VMStateField[]) {
+        VMSTATE_UINT8(len, DPS310State),
+        VMSTATE_UINT8_ARRAY(regs, DPS310State, NUM_REGISTERS),
+        VMSTATE_UINT8(pointer, DPS310State),
+        VMSTATE_I2C_SLAVE(i2c, DPS310State),
+        VMSTATE_END_OF_LIST()
+    }
+};
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
index 647b5c8b43ae..a8fa477709f8 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -411,6 +411,7 @@ config ASPEED_SOC
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
index 66e1648533e0..779d8b1582d3 100644
--- a/hw/misc/meson.build
+++ b/hw/misc/meson.build
@@ -1,4 +1,5 @@
 softmmu_ss.add(when: 'CONFIG_APPLESMC', if_true: files('applesmc.c'))
+softmmu_ss.add(when: 'CONFIG_DPS310', if_true: files('dps310.c'))
 softmmu_ss.add(when: 'CONFIG_EDU', if_true: files('edu.c'))
 softmmu_ss.add(when: 'CONFIG_FW_CFG_DMA', if_true: files('vmcoreinfo.c'))
 softmmu_ss.add(when: 'CONFIG_ISA_DEBUG', if_true: files('debugexit.c'))
--=20
2.31.1


