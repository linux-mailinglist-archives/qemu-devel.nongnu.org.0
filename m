Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9617D3326F3
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 14:24:26 +0100 (CET)
Received: from localhost ([::1]:55192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJcLZ-000701-K6
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 08:24:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1lJcEY-00026S-QI; Tue, 09 Mar 2021 08:17:11 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:59984)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1lJcEU-00077O-Mo; Tue, 09 Mar 2021 08:17:09 -0500
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 129D3VDJ117542; Tue, 9 Mar 2021 08:16:52 -0500
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 375wcm9cbn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Mar 2021 08:16:52 -0500
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 129D9krj026985;
 Tue, 9 Mar 2021 13:16:49 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma02fra.de.ibm.com with ESMTP id 3768mv81a3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Mar 2021 13:16:49 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 129DGlE864880962
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 9 Mar 2021 13:16:47 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4E92E11C05B;
 Tue,  9 Mar 2021 13:16:47 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F3ED711C04C;
 Tue,  9 Mar 2021 13:16:46 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Tue,  9 Mar 2021 13:16:46 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.48.251])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 53599220270;
 Tue,  9 Mar 2021 14:16:46 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 7/7] hw/misc: Model KCS devices in the Aspeed LPC controller
Date: Tue,  9 Mar 2021 14:16:41 +0100
Message-Id: <20210309131641.2709380-8-clg@kaod.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210309131641.2709380-1-clg@kaod.org>
References: <20210309131641.2709380-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-09_11:2021-03-08,
 2021-03-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 malwarescore=0 impostorscore=0 spamscore=0 suspectscore=0 phishscore=0
 adultscore=0 bulkscore=0 mlxscore=0 clxscore=1034 priorityscore=1501
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103090064
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Andrew Jeffery <andrew@aj.id.au>

Keyboard-Controller-Style devices for IPMI purposes are exposed via LPC
IO cycles from the BMC to the host.

Expose support on the BMC side by implementing the usual MMIO
behaviours, and expose the ability to inspect the KCS registers in
"host" style by accessing QOM properties associated with each register.

The model caters to the IRQ style of both the AST2600 and the earlier
SoCs (AST2400 and AST2500). The AST2600 allocates an IRQ for each LPC
sub-device, while there is a single IRQ shared across all subdevices on
the AST2400 and AST2500.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
Message-Id: <20210302014317.915120-6-andrew@aj.id.au>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 include/hw/arm/aspeed_soc.h  |   1 +
 include/hw/misc/aspeed_lpc.h |  17 +-
 hw/arm/aspeed_ast2600.c      |  28 ++-
 hw/arm/aspeed_soc.c          |  24 ++-
 hw/misc/aspeed_lpc.c         | 359 ++++++++++++++++++++++++++++++++++-
 5 files changed, 424 insertions(+), 5 deletions(-)

diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
index 42c64bd28ba2..9359d6da336d 100644
--- a/include/hw/arm/aspeed_soc.h
+++ b/include/hw/arm/aspeed_soc.h
@@ -132,6 +132,7 @@ enum {
     ASPEED_DEV_SDRAM,
     ASPEED_DEV_XDMA,
     ASPEED_DEV_EMMC,
+    ASPEED_DEV_KCS,
 };
=20
 #endif /* ASPEED_SOC_H */
diff --git a/include/hw/misc/aspeed_lpc.h b/include/hw/misc/aspeed_lpc.h
index 0fbb7f68bed2..df418cfcd36c 100644
--- a/include/hw/misc/aspeed_lpc.h
+++ b/include/hw/misc/aspeed_lpc.h
@@ -12,10 +12,22 @@
=20
 #include "hw/sysbus.h"
=20
+#include <stdint.h>
+
 #define TYPE_ASPEED_LPC "aspeed.lpc"
 #define ASPEED_LPC(obj) OBJECT_CHECK(AspeedLPCState, (obj), TYPE_ASPEED_=
LPC)
=20
-#define ASPEED_LPC_NR_REGS (0x260 >> 2)
+#define ASPEED_LPC_NR_REGS      (0x260 >> 2)
+
+enum aspeed_lpc_subdevice {
+    aspeed_lpc_kcs_1 =3D 0,
+    aspeed_lpc_kcs_2,
+    aspeed_lpc_kcs_3,
+    aspeed_lpc_kcs_4,
+    aspeed_lpc_ibt,
+};
+
+#define ASPEED_LPC_NR_SUBDEVS   5
=20
 typedef struct AspeedLPCState {
     /* <private> */
@@ -25,6 +37,9 @@ typedef struct AspeedLPCState {
     MemoryRegion iomem;
     qemu_irq irq;
=20
+    qemu_irq subdevice_irqs[ASPEED_LPC_NR_SUBDEVS];
+    uint32_t subdevice_irqs_pending;
+
     uint32_t regs[ASPEED_LPC_NR_REGS];
     uint32_t hicr7;
 } AspeedLPCState;
diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index 78a8d6e62f52..bc87e754a3cc 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -104,7 +104,7 @@ static const int aspeed_soc_ast2600_irqmap[] =3D {
     [ASPEED_DEV_ETH2]      =3D 3,
     [ASPEED_DEV_ETH3]      =3D 32,
     [ASPEED_DEV_ETH4]      =3D 33,
-
+    [ASPEED_DEV_KCS]       =3D 138,   /* 138 -> 142 */
 };
=20
 static qemu_irq aspeed_soc_get_irq(AspeedSoCState *s, int ctrl)
@@ -470,8 +470,34 @@ static void aspeed_soc_ast2600_realize(DeviceState *=
dev, Error **errp)
         return;
     }
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->lpc), 0, sc->memmap[ASPEED_DEV_LP=
C]);
+
+    /* Connect the LPC IRQ to the GIC. It is otherwise unused. */
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->lpc), 0,
                        aspeed_soc_get_irq(s, ASPEED_DEV_LPC));
+
+    /*
+     * On the AST2600 LPC subdevice IRQs are connected straight to the G=
IC.
+     *
+     * LPC subdevice IRQ sources are offset from 1 because the LPC model=
 caters
+     * to the AST2400 and AST2500. SoCs before the AST2600 have one LPC =
IRQ
+     * shared across the subdevices, and the shared IRQ output to the VI=
C is at
+     * offset 0.
+     */
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->lpc), 1 + aspeed_lpc_kcs_1,
+                       qdev_get_gpio_in(DEVICE(&s->a7mpcore),
+                                sc->irqmap[ASPEED_DEV_KCS] + aspeed_lpc_=
kcs_1));
+
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->lpc), 1 + aspeed_lpc_kcs_2,
+                       qdev_get_gpio_in(DEVICE(&s->a7mpcore),
+                                sc->irqmap[ASPEED_DEV_KCS] + aspeed_lpc_=
kcs_2));
+
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->lpc), 1 + aspeed_lpc_kcs_3,
+                       qdev_get_gpio_in(DEVICE(&s->a7mpcore),
+                                sc->irqmap[ASPEED_DEV_KCS] + aspeed_lpc_=
kcs_3));
+
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->lpc), 1 + aspeed_lpc_kcs_4,
+                       qdev_get_gpio_in(DEVICE(&s->a7mpcore),
+                                sc->irqmap[ASPEED_DEV_KCS] + aspeed_lpc_=
kcs_4));
 }
=20
 static void aspeed_soc_ast2600_class_init(ObjectClass *oc, void *data)
diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index 4f098da437ac..057d053c8478 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -112,7 +112,6 @@ static const int aspeed_soc_ast2400_irqmap[] =3D {
     [ASPEED_DEV_WDT]    =3D 27,
     [ASPEED_DEV_PWM]    =3D 28,
     [ASPEED_DEV_LPC]    =3D 8,
-    [ASPEED_DEV_IBT]    =3D 8, /* LPC */
     [ASPEED_DEV_I2C]    =3D 12,
     [ASPEED_DEV_ETH1]   =3D 2,
     [ASPEED_DEV_ETH2]   =3D 3,
@@ -401,8 +400,31 @@ static void aspeed_soc_realize(DeviceState *dev, Err=
or **errp)
         return;
     }
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->lpc), 0, sc->memmap[ASPEED_DEV_LP=
C]);
+
+    /* Connect the LPC IRQ to the VIC */
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->lpc), 0,
                        aspeed_soc_get_irq(s, ASPEED_DEV_LPC));
+
+    /*
+     * On the AST2400 and AST2500 the one LPC IRQ is shared between all =
of the
+     * subdevices. Connect the LPC subdevice IRQs to the LPC controller =
IRQ (by
+     * contrast, on the AST2600, the subdevice IRQs are connected straig=
ht to
+     * the GIC).
+     *
+     * LPC subdevice IRQ sources are offset from 1 because the shared IR=
Q output
+     * to the VIC is at offset 0.
+     */
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->lpc), 1 + aspeed_lpc_kcs_1,
+                       qdev_get_gpio_in(DEVICE(&s->lpc), aspeed_lpc_kcs_=
1));
+
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->lpc), 1 + aspeed_lpc_kcs_2,
+                       qdev_get_gpio_in(DEVICE(&s->lpc), aspeed_lpc_kcs_=
2));
+
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->lpc), 1 + aspeed_lpc_kcs_3,
+                       qdev_get_gpio_in(DEVICE(&s->lpc), aspeed_lpc_kcs_=
3));
+
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->lpc), 1 + aspeed_lpc_kcs_4,
+                       qdev_get_gpio_in(DEVICE(&s->lpc), aspeed_lpc_kcs_=
4));
 }
 static Property aspeed_soc_properties[] =3D {
     DEFINE_PROP_LINK("dram", AspeedSoCState, dram_mr, TYPE_MEMORY_REGION=
,
diff --git a/hw/misc/aspeed_lpc.c b/hw/misc/aspeed_lpc.c
index e668e985ff04..2dddb27c35d0 100644
--- a/hw/misc/aspeed_lpc.c
+++ b/hw/misc/aspeed_lpc.c
@@ -12,20 +12,301 @@
 #include "qemu/error-report.h"
 #include "hw/misc/aspeed_lpc.h"
 #include "qapi/error.h"
+#include "qapi/visitor.h"
+#include "hw/irq.h"
 #include "hw/qdev-properties.h"
 #include "migration/vmstate.h"
=20
 #define TO_REG(offset) ((offset) >> 2)
=20
 #define HICR0                TO_REG(0x00)
+#define   HICR0_LPC3E        BIT(7)
+#define   HICR0_LPC2E        BIT(6)
+#define   HICR0_LPC1E        BIT(5)
 #define HICR1                TO_REG(0x04)
 #define HICR2                TO_REG(0x08)
+#define   HICR2_IBFIE3       BIT(3)
+#define   HICR2_IBFIE2       BIT(2)
+#define   HICR2_IBFIE1       BIT(1)
 #define HICR3                TO_REG(0x0C)
 #define HICR4                TO_REG(0x10)
+#define   HICR4_KCSENBL      BIT(2)
+#define IDR1                 TO_REG(0x24)
+#define IDR2                 TO_REG(0x28)
+#define IDR3                 TO_REG(0x2C)
+#define ODR1                 TO_REG(0x30)
+#define ODR2                 TO_REG(0x34)
+#define ODR3                 TO_REG(0x38)
+#define STR1                 TO_REG(0x3C)
+#define   STR_OBF            BIT(0)
+#define   STR_IBF            BIT(1)
+#define   STR_CMD_DATA       BIT(3)
+#define STR2                 TO_REG(0x40)
+#define STR3                 TO_REG(0x44)
 #define HICR5                TO_REG(0x80)
 #define HICR6                TO_REG(0x84)
 #define HICR7                TO_REG(0x88)
 #define HICR8                TO_REG(0x8C)
+#define HICRB                TO_REG(0x100)
+#define   HICRB_IBFIE4       BIT(1)
+#define   HICRB_LPC4E        BIT(0)
+#define IDR4                 TO_REG(0x114)
+#define ODR4                 TO_REG(0x118)
+#define STR4                 TO_REG(0x11C)
+
+enum aspeed_kcs_channel_id {
+    kcs_channel_1 =3D 0,
+    kcs_channel_2,
+    kcs_channel_3,
+    kcs_channel_4,
+};
+
+static const enum aspeed_lpc_subdevice aspeed_kcs_subdevice_map[] =3D {
+    [kcs_channel_1] =3D aspeed_lpc_kcs_1,
+    [kcs_channel_2] =3D aspeed_lpc_kcs_2,
+    [kcs_channel_3] =3D aspeed_lpc_kcs_3,
+    [kcs_channel_4] =3D aspeed_lpc_kcs_4,
+};
+
+struct aspeed_kcs_channel {
+    enum aspeed_kcs_channel_id id;
+
+    int idr;
+    int odr;
+    int str;
+};
+
+static const struct aspeed_kcs_channel aspeed_kcs_channel_map[] =3D {
+    [kcs_channel_1] =3D {
+        .id =3D kcs_channel_1,
+        .idr =3D IDR1,
+        .odr =3D ODR1,
+        .str =3D STR1
+    },
+
+    [kcs_channel_2] =3D {
+        .id =3D kcs_channel_2,
+        .idr =3D IDR2,
+        .odr =3D ODR2,
+        .str =3D STR2
+    },
+
+    [kcs_channel_3] =3D {
+        .id =3D kcs_channel_3,
+        .idr =3D IDR3,
+        .odr =3D ODR3,
+        .str =3D STR3
+    },
+
+    [kcs_channel_4] =3D {
+        .id =3D kcs_channel_4,
+        .idr =3D IDR4,
+        .odr =3D ODR4,
+        .str =3D STR4
+    },
+};
+
+struct aspeed_kcs_register_data {
+    const char *name;
+    int reg;
+    const struct aspeed_kcs_channel *chan;
+};
+
+static const struct aspeed_kcs_register_data aspeed_kcs_registers[] =3D =
{
+    {
+        .name =3D "idr1",
+        .reg =3D IDR1,
+        .chan =3D &aspeed_kcs_channel_map[kcs_channel_1],
+    },
+    {
+        .name =3D "odr1",
+        .reg =3D ODR1,
+        .chan =3D &aspeed_kcs_channel_map[kcs_channel_1],
+    },
+    {
+        .name =3D "str1",
+        .reg =3D STR1,
+        .chan =3D &aspeed_kcs_channel_map[kcs_channel_1],
+    },
+    {
+        .name =3D "idr2",
+        .reg =3D IDR2,
+        .chan =3D &aspeed_kcs_channel_map[kcs_channel_2],
+    },
+    {
+        .name =3D "odr2",
+        .reg =3D ODR2,
+        .chan =3D &aspeed_kcs_channel_map[kcs_channel_2],
+    },
+    {
+        .name =3D "str2",
+        .reg =3D STR2,
+        .chan =3D &aspeed_kcs_channel_map[kcs_channel_2],
+    },
+    {
+        .name =3D "idr3",
+        .reg =3D IDR3,
+        .chan =3D &aspeed_kcs_channel_map[kcs_channel_3],
+    },
+    {
+        .name =3D "odr3",
+        .reg =3D ODR3,
+        .chan =3D &aspeed_kcs_channel_map[kcs_channel_3],
+    },
+    {
+        .name =3D "str3",
+        .reg =3D STR3,
+        .chan =3D &aspeed_kcs_channel_map[kcs_channel_3],
+    },
+    {
+        .name =3D "idr4",
+        .reg =3D IDR4,
+        .chan =3D &aspeed_kcs_channel_map[kcs_channel_4],
+    },
+    {
+        .name =3D "odr4",
+        .reg =3D ODR4,
+        .chan =3D &aspeed_kcs_channel_map[kcs_channel_4],
+    },
+    {
+        .name =3D "str4",
+        .reg =3D STR4,
+        .chan =3D &aspeed_kcs_channel_map[kcs_channel_4],
+    },
+    { },
+};
+
+static const struct aspeed_kcs_register_data *
+aspeed_kcs_get_register_data_by_name(const char *name)
+{
+    const struct aspeed_kcs_register_data *pos =3D aspeed_kcs_registers;
+
+    while (pos->name) {
+        if (!strcmp(pos->name, name)) {
+            return pos;
+        }
+        pos++;
+    }
+
+    return NULL;
+}
+
+static const struct aspeed_kcs_channel *
+aspeed_kcs_get_channel_by_register(int reg)
+{
+    const struct aspeed_kcs_register_data *pos =3D aspeed_kcs_registers;
+
+    while (pos->name) {
+        if (pos->reg =3D=3D reg) {
+            return pos->chan;
+        }
+        pos++;
+    }
+
+    return NULL;
+}
+
+static void aspeed_kcs_get_register_property(Object *obj,
+                                             Visitor *v,
+                                             const char *name,
+                                             void *opaque,
+                                             Error **errp)
+{
+    const struct aspeed_kcs_register_data *data;
+    AspeedLPCState *s =3D ASPEED_LPC(obj);
+    uint32_t val;
+
+    data =3D aspeed_kcs_get_register_data_by_name(name);
+    if (!data) {
+        return;
+    }
+
+    if (!strncmp("odr", name, 3)) {
+        s->regs[data->chan->str] &=3D ~STR_OBF;
+    }
+
+    val =3D s->regs[data->reg];
+
+    visit_type_uint32(v, name, &val, errp);
+}
+
+static bool aspeed_kcs_channel_enabled(AspeedLPCState *s,
+                                       const struct aspeed_kcs_channel *=
channel)
+{
+    switch (channel->id) {
+    case kcs_channel_1: return s->regs[HICR0] & HICR0_LPC1E;
+    case kcs_channel_2: return s->regs[HICR0] & HICR0_LPC2E;
+    case kcs_channel_3:
+        return (s->regs[HICR0] & HICR0_LPC3E) &&
+                    (s->regs[HICR4] & HICR4_KCSENBL);
+    case kcs_channel_4: return s->regs[HICRB] & HICRB_LPC4E;
+    default: return false;
+    }
+}
+
+static bool
+aspeed_kcs_channel_ibf_irq_enabled(AspeedLPCState *s,
+                                   const struct aspeed_kcs_channel *chan=
nel)
+{
+    if (!aspeed_kcs_channel_enabled(s, channel)) {
+            return false;
+    }
+
+    switch (channel->id) {
+    case kcs_channel_1: return s->regs[HICR2] & HICR2_IBFIE1;
+    case kcs_channel_2: return s->regs[HICR2] & HICR2_IBFIE2;
+    case kcs_channel_3: return s->regs[HICR2] & HICR2_IBFIE3;
+    case kcs_channel_4: return s->regs[HICRB] & HICRB_IBFIE4;
+    default: return false;
+    }
+}
+
+static void aspeed_kcs_set_register_property(Object *obj,
+                                             Visitor *v,
+                                             const char *name,
+                                             void *opaque,
+                                             Error **errp)
+{
+    const struct aspeed_kcs_register_data *data;
+    AspeedLPCState *s =3D ASPEED_LPC(obj);
+    uint32_t val;
+
+    data =3D aspeed_kcs_get_register_data_by_name(name);
+    if (!data) {
+        return;
+    }
+
+    if (!visit_type_uint32(v, name, &val, errp)) {
+        return;
+    }
+
+    if (strncmp("str", name, 3)) {
+        s->regs[data->reg] =3D val;
+    }
+
+    if (!strncmp("idr", name, 3)) {
+        s->regs[data->chan->str] |=3D STR_IBF;
+        if (aspeed_kcs_channel_ibf_irq_enabled(s, data->chan)) {
+            enum aspeed_lpc_subdevice subdev;
+
+            subdev =3D aspeed_kcs_subdevice_map[data->chan->id];
+            qemu_irq_raise(s->subdevice_irqs[subdev]);
+        }
+    }
+}
+
+static void aspeed_lpc_set_irq(void *opaque, int irq, int level)
+{
+    AspeedLPCState *s =3D (AspeedLPCState *)opaque;
+
+    if (level) {
+        s->subdevice_irqs_pending |=3D BIT(irq);
+    } else {
+        s->subdevice_irqs_pending &=3D ~BIT(irq);
+    }
+
+    qemu_set_irq(s->irq, !!s->subdevice_irqs_pending);
+}
=20
 static uint64_t aspeed_lpc_read(void *opaque, hwaddr offset, unsigned si=
ze)
 {
@@ -39,6 +320,29 @@ static uint64_t aspeed_lpc_read(void *opaque, hwaddr =
offset, unsigned size)
         return 0;
     }
=20
+    switch (reg) {
+    case IDR1:
+    case IDR2:
+    case IDR3:
+    case IDR4:
+    {
+        const struct aspeed_kcs_channel *channel;
+
+        channel =3D aspeed_kcs_get_channel_by_register(reg);
+        if (s->regs[channel->str] & STR_IBF) {
+            enum aspeed_lpc_subdevice subdev;
+
+            subdev =3D aspeed_kcs_subdevice_map[channel->id];
+            qemu_irq_lower(s->subdevice_irqs[subdev]);
+        }
+
+        s->regs[channel->str] &=3D ~STR_IBF;
+        break;
+    }
+    default:
+        break;
+    }
+
     return s->regs[reg];
 }
=20
@@ -55,6 +359,18 @@ static void aspeed_lpc_write(void *opaque, hwaddr off=
set, uint64_t data,
         return;
     }
=20
+
+    switch (reg) {
+    case ODR1:
+    case ODR2:
+    case ODR3:
+    case ODR4:
+        s->regs[aspeed_kcs_get_channel_by_register(reg)->str] |=3D STR_O=
BF;
+        break;
+    default:
+        break;
+    }
+
     s->regs[reg] =3D data;
 }
=20
@@ -72,6 +388,8 @@ static void aspeed_lpc_reset(DeviceState *dev)
 {
     struct AspeedLPCState *s =3D ASPEED_LPC(dev);
=20
+    s->subdevice_irqs_pending =3D 0;
+
     memset(s->regs, 0, sizeof(s->regs));
=20
     s->regs[HICR7] =3D s->hicr7;
@@ -83,19 +401,55 @@ static void aspeed_lpc_realize(DeviceState *dev, Err=
or **errp)
     SysBusDevice *sbd =3D SYS_BUS_DEVICE(dev);
=20
     sysbus_init_irq(sbd, &s->irq);
+    sysbus_init_irq(sbd, &s->subdevice_irqs[aspeed_lpc_kcs_1]);
+    sysbus_init_irq(sbd, &s->subdevice_irqs[aspeed_lpc_kcs_2]);
+    sysbus_init_irq(sbd, &s->subdevice_irqs[aspeed_lpc_kcs_3]);
+    sysbus_init_irq(sbd, &s->subdevice_irqs[aspeed_lpc_kcs_4]);
+    sysbus_init_irq(sbd, &s->subdevice_irqs[aspeed_lpc_ibt]);
=20
     memory_region_init_io(&s->iomem, OBJECT(s), &aspeed_lpc_ops, s,
             TYPE_ASPEED_LPC, 0x1000);
=20
     sysbus_init_mmio(sbd, &s->iomem);
+
+    qdev_init_gpio_in(dev, aspeed_lpc_set_irq, ASPEED_LPC_NR_SUBDEVS);
+}
+
+static void aspeed_lpc_init(Object *obj)
+{
+    object_property_add(obj, "idr1", "uint32", aspeed_kcs_get_register_p=
roperty,
+                        aspeed_kcs_set_register_property, NULL, NULL);
+    object_property_add(obj, "odr1", "uint32", aspeed_kcs_get_register_p=
roperty,
+                        aspeed_kcs_set_register_property, NULL, NULL);
+    object_property_add(obj, "str1", "uint32", aspeed_kcs_get_register_p=
roperty,
+                        aspeed_kcs_set_register_property, NULL, NULL);
+    object_property_add(obj, "idr2", "uint32", aspeed_kcs_get_register_p=
roperty,
+                        aspeed_kcs_set_register_property, NULL, NULL);
+    object_property_add(obj, "odr2", "uint32", aspeed_kcs_get_register_p=
roperty,
+                        aspeed_kcs_set_register_property, NULL, NULL);
+    object_property_add(obj, "str2", "uint32", aspeed_kcs_get_register_p=
roperty,
+                        aspeed_kcs_set_register_property, NULL, NULL);
+    object_property_add(obj, "idr3", "uint32", aspeed_kcs_get_register_p=
roperty,
+                        aspeed_kcs_set_register_property, NULL, NULL);
+    object_property_add(obj, "odr3", "uint32", aspeed_kcs_get_register_p=
roperty,
+                        aspeed_kcs_set_register_property, NULL, NULL);
+    object_property_add(obj, "str3", "uint32", aspeed_kcs_get_register_p=
roperty,
+                        aspeed_kcs_set_register_property, NULL, NULL);
+    object_property_add(obj, "idr4", "uint32", aspeed_kcs_get_register_p=
roperty,
+                        aspeed_kcs_set_register_property, NULL, NULL);
+    object_property_add(obj, "odr4", "uint32", aspeed_kcs_get_register_p=
roperty,
+                        aspeed_kcs_set_register_property, NULL, NULL);
+    object_property_add(obj, "str4", "uint32", aspeed_kcs_get_register_p=
roperty,
+                        aspeed_kcs_set_register_property, NULL, NULL);
 }
=20
 static const VMStateDescription vmstate_aspeed_lpc =3D {
     .name =3D TYPE_ASPEED_LPC,
-    .version_id =3D 1,
-    .minimum_version_id =3D 1,
+    .version_id =3D 2,
+    .minimum_version_id =3D 2,
     .fields =3D (VMStateField[]) {
         VMSTATE_UINT32_ARRAY(regs, AspeedLPCState, ASPEED_LPC_NR_REGS),
+        VMSTATE_UINT32(subdevice_irqs_pending, AspeedLPCState),
         VMSTATE_END_OF_LIST(),
     }
 };
@@ -121,6 +475,7 @@ static const TypeInfo aspeed_lpc_info =3D {
     .parent =3D TYPE_SYS_BUS_DEVICE,
     .instance_size =3D sizeof(AspeedLPCState),
     .class_init =3D aspeed_lpc_class_init,
+    .instance_init =3D aspeed_lpc_init,
 };
=20
 static void aspeed_lpc_register_types(void)
--=20
2.26.2


