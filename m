Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49EDF332746
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 14:36:03 +0100 (CET)
Received: from localhost ([::1]:59398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJcWo-0003tL-AP
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 08:36:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1lJcEY-00026T-RW; Tue, 09 Mar 2021 08:17:11 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:25006)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1lJcEU-0007Ak-MB; Tue, 09 Mar 2021 08:17:10 -0500
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 129D5XVZ057968; Tue, 9 Mar 2021 08:16:51 -0500
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3762wr47bs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Mar 2021 08:16:51 -0500
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 129D7w3o023796;
 Tue, 9 Mar 2021 13:16:49 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma04ams.nl.ibm.com with ESMTP id 3768n1g2fs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Mar 2021 13:16:48 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 129DGVq236831574
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 9 Mar 2021 13:16:31 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A656842041;
 Tue,  9 Mar 2021 13:16:46 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 66F994203F;
 Tue,  9 Mar 2021 13:16:46 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Tue,  9 Mar 2021 13:16:46 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.48.251])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id C847F22025C;
 Tue,  9 Mar 2021 14:16:45 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 6/7] hw/misc: Add a basic Aspeed LPC controller model
Date: Tue,  9 Mar 2021 14:16:40 +0100
Message-Id: <20210309131641.2709380-7-clg@kaod.org>
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
 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 phishscore=0 clxscore=1034
 mlxlogscore=889 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103090064
Received-SPF: softfail client-ip=148.163.156.1; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a very minimal framework to access registers which are used to
configure the AHB memory mapping of the flash chips on the LPC HC
Firmware address space.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
Message-Id: <20210302014317.915120-5-andrew@aj.id.au>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 docs/system/arm/aspeed.rst   |   2 +-
 include/hw/arm/aspeed_soc.h  |   2 +
 include/hw/misc/aspeed_lpc.h |  32 +++++++++
 hw/arm/aspeed_ast2600.c      |  10 +++
 hw/arm/aspeed_soc.c          |  10 +++
 hw/misc/aspeed_lpc.c         | 131 +++++++++++++++++++++++++++++++++++
 hw/misc/meson.build          |   7 +-
 7 files changed, 192 insertions(+), 2 deletions(-)
 create mode 100644 include/hw/misc/aspeed_lpc.h
 create mode 100644 hw/misc/aspeed_lpc.c

diff --git a/docs/system/arm/aspeed.rst b/docs/system/arm/aspeed.rst
index 8972aa3f7bbe..d1fb8f25b39c 100644
--- a/docs/system/arm/aspeed.rst
+++ b/docs/system/arm/aspeed.rst
@@ -48,6 +48,7 @@ Supported devices
  * UART
  * Ethernet controllers
  * Front LEDs (PCA9552 on I2C bus)
+ * LPC Peripheral Controller (a subset of subdevices are supported)
=20
=20
 Missing devices
@@ -56,7 +57,6 @@ Missing devices
  * Coprocessor support
  * ADC (out of tree implementation)
  * PWM and Fan Controller
- * LPC Bus Controller
  * Slave GPIO Controller
  * Super I/O Controller
  * Hash/Crypto Engine
diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
index 11cfe6e3585b..42c64bd28ba2 100644
--- a/include/hw/arm/aspeed_soc.h
+++ b/include/hw/arm/aspeed_soc.h
@@ -28,6 +28,7 @@
 #include "hw/sd/aspeed_sdhci.h"
 #include "hw/usb/hcd-ehci.h"
 #include "qom/object.h"
+#include "hw/misc/aspeed_lpc.h"
=20
 #define ASPEED_SPIS_NUM  2
 #define ASPEED_EHCIS_NUM 2
@@ -61,6 +62,7 @@ struct AspeedSoCState {
     AspeedGPIOState gpio_1_8v;
     AspeedSDHCIState sdhci;
     AspeedSDHCIState emmc;
+    AspeedLPCState lpc;
 };
=20
 #define TYPE_ASPEED_SOC "aspeed-soc"
diff --git a/include/hw/misc/aspeed_lpc.h b/include/hw/misc/aspeed_lpc.h
new file mode 100644
index 000000000000..0fbb7f68bed2
--- /dev/null
+++ b/include/hw/misc/aspeed_lpc.h
@@ -0,0 +1,32 @@
+/*
+ *  ASPEED LPC Controller
+ *
+ *  Copyright (C) 2017-2018 IBM Corp.
+ *
+ * This code is licensed under the GPL version 2 or later.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#ifndef ASPEED_LPC_H
+#define ASPEED_LPC_H
+
+#include "hw/sysbus.h"
+
+#define TYPE_ASPEED_LPC "aspeed.lpc"
+#define ASPEED_LPC(obj) OBJECT_CHECK(AspeedLPCState, (obj), TYPE_ASPEED_=
LPC)
+
+#define ASPEED_LPC_NR_REGS (0x260 >> 2)
+
+typedef struct AspeedLPCState {
+    /* <private> */
+    SysBusDevice parent;
+
+    /*< public >*/
+    MemoryRegion iomem;
+    qemu_irq irq;
+
+    uint32_t regs[ASPEED_LPC_NR_REGS];
+    uint32_t hicr7;
+} AspeedLPCState;
+
+#endif /* _ASPEED_LPC_H_ */
diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index 7635d4bae9d0..78a8d6e62f52 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -211,6 +211,8 @@ static void aspeed_soc_ast2600_init(Object *obj)
=20
     object_initialize_child(obj, "emmc-controller.sdhci", &s->emmc.slots=
[0],
                             TYPE_SYSBUS_SDHCI);
+
+    object_initialize_child(obj, "lpc", &s->lpc, TYPE_ASPEED_LPC);
 }
=20
 /*
@@ -462,6 +464,14 @@ static void aspeed_soc_ast2600_realize(DeviceState *=
dev, Error **errp)
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->emmc), 0, sc->memmap[ASPEED_DEV_E=
MMC]);
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->emmc), 0,
                        aspeed_soc_get_irq(s, ASPEED_DEV_EMMC));
+
+    /* LPC */
+    if (!sysbus_realize(SYS_BUS_DEVICE(&s->lpc), errp)) {
+        return;
+    }
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->lpc), 0, sc->memmap[ASPEED_DEV_LP=
C]);
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->lpc), 0,
+                       aspeed_soc_get_irq(s, ASPEED_DEV_LPC));
 }
=20
 static void aspeed_soc_ast2600_class_init(ObjectClass *oc, void *data)
diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index 7eefd54ac07a..4f098da437ac 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -211,6 +211,8 @@ static void aspeed_soc_init(Object *obj)
         object_initialize_child(obj, "sdhci[*]", &s->sdhci.slots[i],
                                 TYPE_SYSBUS_SDHCI);
     }
+
+    object_initialize_child(obj, "lpc", &s->lpc, TYPE_ASPEED_LPC);
 }
=20
 static void aspeed_soc_realize(DeviceState *dev, Error **errp)
@@ -393,6 +395,14 @@ static void aspeed_soc_realize(DeviceState *dev, Err=
or **errp)
                     sc->memmap[ASPEED_DEV_SDHCI]);
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->sdhci), 0,
                        aspeed_soc_get_irq(s, ASPEED_DEV_SDHCI));
+
+    /* LPC */
+    if (!sysbus_realize(SYS_BUS_DEVICE(&s->lpc), errp)) {
+        return;
+    }
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->lpc), 0, sc->memmap[ASPEED_DEV_LP=
C]);
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->lpc), 0,
+                       aspeed_soc_get_irq(s, ASPEED_DEV_LPC));
 }
 static Property aspeed_soc_properties[] =3D {
     DEFINE_PROP_LINK("dram", AspeedSoCState, dram_mr, TYPE_MEMORY_REGION=
,
diff --git a/hw/misc/aspeed_lpc.c b/hw/misc/aspeed_lpc.c
new file mode 100644
index 000000000000..e668e985ff04
--- /dev/null
+++ b/hw/misc/aspeed_lpc.c
@@ -0,0 +1,131 @@
+/*
+ *  ASPEED LPC Controller
+ *
+ *  Copyright (C) 2017-2018 IBM Corp.
+ *
+ * This code is licensed under the GPL version 2 or later.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/log.h"
+#include "qemu/error-report.h"
+#include "hw/misc/aspeed_lpc.h"
+#include "qapi/error.h"
+#include "hw/qdev-properties.h"
+#include "migration/vmstate.h"
+
+#define TO_REG(offset) ((offset) >> 2)
+
+#define HICR0                TO_REG(0x00)
+#define HICR1                TO_REG(0x04)
+#define HICR2                TO_REG(0x08)
+#define HICR3                TO_REG(0x0C)
+#define HICR4                TO_REG(0x10)
+#define HICR5                TO_REG(0x80)
+#define HICR6                TO_REG(0x84)
+#define HICR7                TO_REG(0x88)
+#define HICR8                TO_REG(0x8C)
+
+static uint64_t aspeed_lpc_read(void *opaque, hwaddr offset, unsigned si=
ze)
+{
+    AspeedLPCState *s =3D ASPEED_LPC(opaque);
+    int reg =3D TO_REG(offset);
+
+    if (reg >=3D ARRAY_SIZE(s->regs)) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: Out-of-bounds read at offset 0x%" HWADDR_PRIx=
 "\n",
+                      __func__, offset);
+        return 0;
+    }
+
+    return s->regs[reg];
+}
+
+static void aspeed_lpc_write(void *opaque, hwaddr offset, uint64_t data,
+                             unsigned int size)
+{
+    AspeedLPCState *s =3D ASPEED_LPC(opaque);
+    int reg =3D TO_REG(offset);
+
+    if (reg >=3D ARRAY_SIZE(s->regs)) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: Out-of-bounds write at offset 0x%" HWADDR_PRI=
x "\n",
+                      __func__, offset);
+        return;
+    }
+
+    s->regs[reg] =3D data;
+}
+
+static const MemoryRegionOps aspeed_lpc_ops =3D {
+    .read =3D aspeed_lpc_read,
+    .write =3D aspeed_lpc_write,
+    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .valid =3D {
+        .min_access_size =3D 1,
+        .max_access_size =3D 4,
+    },
+};
+
+static void aspeed_lpc_reset(DeviceState *dev)
+{
+    struct AspeedLPCState *s =3D ASPEED_LPC(dev);
+
+    memset(s->regs, 0, sizeof(s->regs));
+
+    s->regs[HICR7] =3D s->hicr7;
+}
+
+static void aspeed_lpc_realize(DeviceState *dev, Error **errp)
+{
+    AspeedLPCState *s =3D ASPEED_LPC(dev);
+    SysBusDevice *sbd =3D SYS_BUS_DEVICE(dev);
+
+    sysbus_init_irq(sbd, &s->irq);
+
+    memory_region_init_io(&s->iomem, OBJECT(s), &aspeed_lpc_ops, s,
+            TYPE_ASPEED_LPC, 0x1000);
+
+    sysbus_init_mmio(sbd, &s->iomem);
+}
+
+static const VMStateDescription vmstate_aspeed_lpc =3D {
+    .name =3D TYPE_ASPEED_LPC,
+    .version_id =3D 1,
+    .minimum_version_id =3D 1,
+    .fields =3D (VMStateField[]) {
+        VMSTATE_UINT32_ARRAY(regs, AspeedLPCState, ASPEED_LPC_NR_REGS),
+        VMSTATE_END_OF_LIST(),
+    }
+};
+
+static Property aspeed_lpc_properties[] =3D {
+    DEFINE_PROP_UINT32("hicr7", AspeedLPCState, hicr7, 0),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void aspeed_lpc_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc =3D DEVICE_CLASS(klass);
+
+    dc->realize =3D aspeed_lpc_realize;
+    dc->reset =3D aspeed_lpc_reset;
+    dc->desc =3D "Aspeed LPC Controller",
+    dc->vmsd =3D &vmstate_aspeed_lpc;
+    device_class_set_props(dc, aspeed_lpc_properties);
+}
+
+static const TypeInfo aspeed_lpc_info =3D {
+    .name =3D TYPE_ASPEED_LPC,
+    .parent =3D TYPE_SYS_BUS_DEVICE,
+    .instance_size =3D sizeof(AspeedLPCState),
+    .class_init =3D aspeed_lpc_class_init,
+};
+
+static void aspeed_lpc_register_types(void)
+{
+    type_register_static(&aspeed_lpc_info);
+}
+
+type_init(aspeed_lpc_register_types);
diff --git a/hw/misc/meson.build b/hw/misc/meson.build
index 629283957fcc..e3263383cd59 100644
--- a/hw/misc/meson.build
+++ b/hw/misc/meson.build
@@ -102,7 +102,12 @@ softmmu_ss.add(when: 'CONFIG_ARMSSE_MHU', if_true: f=
iles('armsse-mhu.c'))
 softmmu_ss.add(when: 'CONFIG_PVPANIC_ISA', if_true: files('pvpanic-isa.c=
'))
 softmmu_ss.add(when: 'CONFIG_PVPANIC_PCI', if_true: files('pvpanic-pci.c=
'))
 softmmu_ss.add(when: 'CONFIG_AUX', if_true: files('auxbus.c'))
-softmmu_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files('aspeed_scu.c',=
 'aspeed_sdmc.c', 'aspeed_xdma.c'))
+softmmu_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files(
+  'aspeed_lpc.c',
+  'aspeed_scu.c',
+  'aspeed_sdmc.c',
+  'aspeed_xdma.c'))
+
 softmmu_ss.add(when: 'CONFIG_MSF2', if_true: files('msf2-sysreg.c'))
 softmmu_ss.add(when: 'CONFIG_NRF51_SOC', if_true: files('nrf51_rng.c'))
=20
--=20
2.26.2


