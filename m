Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 653B441D0BB
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 02:46:28 +0200 (CEST)
Received: from localhost ([::1]:56438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVkDP-0003my-Fd
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 20:46:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=9907073e8e=pdel@fb.com>)
 id 1mVk9y-0002P9-TJ
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 20:42:51 -0400
Received: from mx0a-00082601.pphosted.com ([67.231.145.42]:31658)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=9907073e8e=pdel@fb.com>)
 id 1mVk9w-0004ws-1d
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 20:42:50 -0400
Received: from pps.filterd (m0044010.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18TNkCfb006576
 for <qemu-devel@nongnu.org>; Wed, 29 Sep 2021 17:42:42 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=facebook;
 bh=hkTcXDcbMXhTg+WSAuWccteWWQSXmzEQVHxcvWStVSU=;
 b=ZUVxDlj7ipMhJYMCwDX/DqWJUf5JLpyEpaErZb4YB4PHBcGoEdYeXr7y/pFsMqt4yCSd
 2X/Zqffaz5OOABzOvyf6x4Fjwq2dnpYh3V6q/jtRs1P3wQpfJNxNkbzTk3V3v9/i9R9i
 biwwPuXXeBwXyPaXN//64vnLr1212aEQ828= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 3bcvtk2qjq-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <qemu-devel@nongnu.org>; Wed, 29 Sep 2021 17:42:42 -0700
Received: from intmgw001.27.prn2.facebook.com (2620:10d:c0a8:1b::d) by
 mail.thefacebook.com (2620:10d:c0a8:83::7) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.14; Wed, 29 Sep 2021 17:42:41 -0700
Received: by devvm660.prn0.facebook.com (Postfix, from userid 385188)
 id A794748462EB; Wed, 29 Sep 2021 17:42:40 -0700 (PDT)
From: <pdel@fb.com>
To: 
CC: <clg@kaod.org>, <patrick@stwcx.xyz>, <amithash@fb.com>, <zhdaniel@fb.com>, 
 <qemu-devel@nongnu.org>, Peter Delevoryas <pdel@fb.com>
Subject: [RFC PATCH 1/1] hw: aspeed_adc: Add initial Aspeed ADC support
Date: Wed, 29 Sep 2021 17:42:35 -0700
Message-ID: <20210930004235.1656003-2-pdel@fb.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210930004235.1656003-1-pdel@fb.com>
References: <20210930004235.1656003-1-pdel@fb.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-FB-Internal: Safe
Content-Type: text/plain
X-FB-Source: Intern
X-Proofpoint-GUID: 1j0-4iskKqi1B73MR67LT3dw4SaqboW9
X-Proofpoint-ORIG-GUID: 1j0-4iskKqi1B73MR67LT3dw4SaqboW9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-29_09,2021-09-29_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 mlxscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 mlxlogscore=999
 malwarescore=0 suspectscore=0 impostorscore=0 adultscore=0 bulkscore=0
 clxscore=1015 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2109300001
X-FB-Internal: deliver
Received-SPF: pass client-ip=67.231.145.42;
 envelope-from=prvs=9907073e8e=pdel@fb.com; helo=mx0a-00082601.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Delevoryas <pdel@fb.com>

This change sets up Aspeed SoC ADC emulation, so that most ADC drivers
will pass the initialization sequence and load successfully. In the
future, we can extend this to emulate more features.

The initialization sequence is:

    1. Set `ADC00` to `0xF`.
    2. Wait for bit 8 of `ADC00` to be set.

I also added the sequence for enabling "Auto compensating sensing mode":

    1. Set `ADC00` to `0x2F` (set bit 5).
    2. Wait for bit 5 of `ADC00` to be reset (to zero).
    3. ...
    4. ...

Fuji (AST2600):
  Before:
    [   56.185778] aspeed_adc: probe of 1e6e9000.adc failed with error -1=
10
    [   56.687936] aspeed_adc: probe of 1e6e9100.adc failed with error -1=
10

  After:
    aspeed_adc_read 0x0c read 0x0000
    aspeed_adc_read 0x0c read 0x0000
    aspeed_adc_write 0x00 write 0x000f
    aspeed_adc_read 0x00 read 0x010f
    aspeed_adc_read 0x00 read 0x010f
    [   55.885164] aspeed_adc 1e6e9000.adc: trim 8
    aspeed_adc_read 0xc4 read 0x0000
    aspeed_adc_write 0xc4 write 0x0008
    aspeed_adc_write 0x00 write 0x011f
    aspeed_adc_write 0x00 write 0x1011f
    aspeed_adc_read 0x10 read 0x0000
    aspeed_adc_write 0x00 write 0x010f
    [   55.886509] aspeed_adc 1e6e9000.adc: cv 512
    aspeed_adc_write 0x00 write 0xffff010f
    aspeed_adc_read 0x0c read 0x0000
    aspeed_adc_read 0x0c read 0x0000
    aspeed_adc_write 0x00 write 0x000f
    aspeed_adc_read 0x00 read 0x010f
    aspeed_adc_read 0x00 read 0x010f
    [   55.890609] aspeed_adc 1e6e9100.adc: trim 8
    aspeed_adc_read 0xc4 read 0x0000
    aspeed_adc_write 0xc4 write 0x0008
    aspeed_adc_write 0x00 write 0x011f
    aspeed_adc_write 0x00 write 0x1011f
    aspeed_adc_read 0x10 read 0x0000
    aspeed_adc_write 0x00 write 0x010f
    [   55.891863] aspeed_adc 1e6e9100.adc: cv 512
    aspeed_adc_write 0x00 write 0xffff010f

YosemiteV2 (AST2500):
  Before:
    [   20.561588] ast_adc ast_adc.0: ast_adc_probe
    [   20.563741] hwmon hwmon0: write offset: c4, val: 8
    [   20.563925] hwmon hwmon0: write offset: c, val: 40
    [   20.564099] hwmon hwmon0: write offset: 0, val: f
    [   21.066110] ast_adc: driver init failed (ret=3D-110)!
    [   21.066635] ast_adc: probe of ast_adc.0 failed with error -110

  After:
    aspeed_adc_write 0xc4 write 0x0008
    aspeed_adc_write 0x0c write 0x0040
    aspeed_adc_write 0x00 write 0x000f
    aspeed_adc_read 0x00 read 0x010f
    aspeed_adc_write 0x00 write 0x002f
    aspeed_adc_read 0x00 read 0x000f
    aspeed_adc_read 0xc4 read 0x0008
    [   19.602033] ast_adc: driver successfully loaded.

Signed-off-by: Peter Delevoryas <pdel@fb.com>
---
 hw/adc/aspeed_adc.c         | 205 ++++++++++++++++++++++++++++++++++++
 hw/adc/meson.build          |   1 +
 hw/adc/trace-events         |   4 +
 hw/arm/aspeed_ast2600.c     |  18 ++++
 hw/arm/aspeed_soc.c         |  17 +++
 include/hw/adc/aspeed_adc.h |  48 +++++++++
 include/hw/arm/aspeed_soc.h |   5 +
 7 files changed, 298 insertions(+)
 create mode 100644 hw/adc/aspeed_adc.c
 create mode 100644 include/hw/adc/aspeed_adc.h

diff --git a/hw/adc/aspeed_adc.c b/hw/adc/aspeed_adc.c
new file mode 100644
index 0000000000..590936148b
--- /dev/null
+++ b/hw/adc/aspeed_adc.c
@@ -0,0 +1,205 @@
+/*
+ * Aspeed ADC Controller
+ *
+ * Copyright 2021 Facebook, Inc.
+ *
+ * This program is free software; you can redistribute it and/or modify =
it
+ * under the terms of the GNU General Public License as published by the
+ * Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful, but W=
ITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
+ * for more details.
+ */
+
+#include "qemu/osdep.h"
+#include "hw/adc/aspeed_adc.h"
+#include "hw/qdev-properties.h"
+#include "migration/vmstate.h"
+#include "trace.h"
+#include "qemu/log.h"
+
+#define TO_REG(offset) ((offset) >> 2)
+#define ENGINE_CONTROL TO_REG(0x00)
+
+static uint64_t aspeed_adc_read(void *opaque, hwaddr offset, unsigned si=
ze)
+{
+    AspeedADCState *s =3D ASPEED_ADC(opaque);
+    int reg =3D TO_REG(offset);
+
+    if (reg >=3D ASPEED_ADC_MAX_REGS) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: Out-of-bounds read 0x%04" HWADDR_PRIX "\n",
+                      __func__, offset);
+        return 0;
+    }
+
+    int value =3D s->regs[reg];
+
+    trace_aspeed_adc_read(offset, value);
+    return value;
+}
+
+static void aspeed_adc_write(void *opaque, hwaddr offset, uint64_t data,
+                             unsigned size)
+{
+    AspeedADCState *s =3D ASPEED_ADC(opaque);
+    int reg =3D TO_REG(offset);
+
+    if (reg >=3D ASPEED_ADC_MAX_REGS) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: Out-of-bounds write 0x%04" HWADDR_PRIX "\n",
+                      __func__, offset);
+        return;
+    }
+
+    trace_aspeed_adc_write(offset, data);
+
+    switch (reg) {
+    case ENGINE_CONTROL:
+        switch (data) {
+        case 0xF:
+            s->regs[ENGINE_CONTROL] =3D 0x10F;
+            return;
+        case 0x2F:
+            s->regs[ENGINE_CONTROL] =3D 0xF;
+            return;
+        }
+        break;
+    }
+
+    s->regs[reg] =3D data;
+}
+
+static const MemoryRegionOps aspeed_adc_ops =3D {
+    .read =3D aspeed_adc_read,
+    .write =3D aspeed_adc_write,
+    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .valid.min_access_size =3D 4,
+    .valid.max_access_size =3D 4,
+    .valid.unaligned =3D false,
+};
+
+static void aspeed_adc_realize(DeviceState *dev, Error **errp)
+{
+    SysBusDevice *sbd =3D SYS_BUS_DEVICE(dev);
+    AspeedADCState *s =3D ASPEED_ADC(dev);
+
+    sysbus_init_irq(sbd, &s->irq);
+    // The memory region is actually 4KB (0x1000), but there's 2 ADC's i=
n the
+    // AST2600 that are offset by 0x100.
+    memory_region_init_io(&s->mmio, OBJECT(s), &aspeed_adc_ops, s,
+                          TYPE_ASPEED_ADC, 0x100);
+    sysbus_init_mmio(sbd, &s->mmio);
+}
+
+static void aspeed_adc_reset(DeviceState *dev)
+{
+    AspeedADCState *s =3D ASPEED_ADC(dev);
+    AspeedADCClass *aac =3D ASPEED_ADC_GET_CLASS(dev);
+
+    memcpy(s->regs, aac->resets, aac->nr_regs << 2);
+}
+
+static const uint32_t aspeed_2400_resets[ASPEED_2400_ADC_NR_REGS] =3D {
+    [ENGINE_CONTROL] =3D 0x00000000,
+};
+
+static const uint32_t aspeed_2500_resets[ASPEED_2500_ADC_NR_REGS] =3D {
+    [ENGINE_CONTROL] =3D 0x00000000,
+};
+
+static const uint32_t aspeed_2600_resets[ASPEED_2600_ADC_NR_REGS] =3D {
+    [ENGINE_CONTROL] =3D 0x00000000,
+};
+
+static const VMStateDescription aspeed_adc_vmstate =3D {
+    .name =3D TYPE_ASPEED_ADC,
+    .version_id =3D 0,
+    .minimum_version_id =3D 0,
+    .fields =3D (VMStateField[]) {
+        VMSTATE_UINT32_ARRAY(regs, AspeedADCState, ASPEED_ADC_MAX_REGS),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static void aspeed_adc_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc =3D DEVICE_CLASS(klass);
+    dc->realize =3D aspeed_adc_realize;
+    dc->reset =3D aspeed_adc_reset;
+    dc->desc =3D "Aspeed Analog-to-Digital Converter";
+    dc->vmsd =3D &aspeed_adc_vmstate;
+}
+
+static void aspeed_2400_adc_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc =3D DEVICE_CLASS(klass);
+    AspeedADCClass *aac =3D ASPEED_ADC_CLASS(klass);
+
+    dc->desc =3D "Aspeed 2400 Analog-to-Digital Converter";
+    aac->resets =3D aspeed_2400_resets;
+    aac->nr_regs =3D ASPEED_2400_ADC_NR_REGS;
+}
+
+static void aspeed_2500_adc_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc =3D DEVICE_CLASS(klass);
+    AspeedADCClass *aac =3D ASPEED_ADC_CLASS(klass);
+
+    dc->desc =3D "Aspeed 2500 Analog-to-Digital Converter";
+    aac->resets =3D aspeed_2500_resets;
+    aac->nr_regs =3D ASPEED_2500_ADC_NR_REGS;
+}
+
+static void aspeed_2600_adc_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc =3D DEVICE_CLASS(klass);
+    AspeedADCClass *aac =3D ASPEED_ADC_CLASS(klass);
+
+    dc->desc =3D "Aspeed 2600 Analog-to-Digital Converter";
+    aac->resets =3D aspeed_2600_resets;
+    aac->nr_regs =3D ASPEED_2600_ADC_NR_REGS;
+}
+
+static const TypeInfo aspeed_adc_info =3D {
+    .name =3D TYPE_ASPEED_ADC,
+    .parent =3D TYPE_SYS_BUS_DEVICE,
+    .instance_size =3D sizeof(AspeedADCState),
+    .class_init =3D aspeed_adc_class_init,
+    .class_size =3D sizeof(AspeedADCClass),
+    .abstract =3D true,
+};
+
+static const TypeInfo aspeed_2400_adc_info =3D {
+    .name =3D TYPE_ASPEED_2400_ADC,
+    .parent =3D TYPE_ASPEED_ADC,
+    .instance_size =3D sizeof(AspeedADCState),
+    .class_init =3D aspeed_2400_adc_class_init,
+};
+
+static const TypeInfo aspeed_2500_adc_info =3D {
+    .name =3D TYPE_ASPEED_2500_ADC,
+    .parent =3D TYPE_ASPEED_ADC,
+    .instance_size =3D sizeof(AspeedADCState),
+    .class_init =3D aspeed_2500_adc_class_init,
+};
+
+static const TypeInfo aspeed_2600_adc_info =3D {
+    .name =3D TYPE_ASPEED_2600_ADC,
+    .parent =3D TYPE_ASPEED_ADC,
+    .instance_size =3D sizeof(AspeedADCState),
+    .class_init =3D aspeed_2600_adc_class_init,
+};
+
+static void aspeed_adc_register_types(void)
+{
+    type_register_static(&aspeed_adc_info);
+    type_register_static(&aspeed_2400_adc_info);
+    type_register_static(&aspeed_2500_adc_info);
+    type_register_static(&aspeed_2600_adc_info);
+}
+
+type_init(aspeed_adc_register_types);
diff --git a/hw/adc/meson.build b/hw/adc/meson.build
index ac4f093fea..65e1dd73c1 100644
--- a/hw/adc/meson.build
+++ b/hw/adc/meson.build
@@ -2,3 +2,4 @@ softmmu_ss.add(when: 'CONFIG_STM32F2XX_ADC', if_true: fil=
es('stm32f2xx_adc.c'))
 softmmu_ss.add(when: 'CONFIG_NPCM7XX', if_true: files('npcm7xx_adc.c'))
 softmmu_ss.add(when: 'CONFIG_ZYNQ', if_true: files('zynq-xadc.c'))
 softmmu_ss.add(when: 'CONFIG_MAX111X', if_true: files('max111x.c'))
+softmmu_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files('aspeed_adc.c')=
)
diff --git a/hw/adc/trace-events b/hw/adc/trace-events
index 456f21c8f4..c23d7bb6d7 100644
--- a/hw/adc/trace-events
+++ b/hw/adc/trace-events
@@ -3,3 +3,7 @@
 # npcm7xx_adc.c
 npcm7xx_adc_read(const char *id, uint64_t offset, uint32_t value) " %s o=
ffset: 0x%04" PRIx64 " value 0x%04" PRIx32
 npcm7xx_adc_write(const char *id, uint64_t offset, uint32_t value) "%s o=
ffset: 0x%04" PRIx64 " value 0x%04" PRIx32
+
+# aspeed_adc.c
+aspeed_adc_read(uint8_t offset, uint32_t value)  "0x%02" PRIx8 " read 0x=
%04" PRIx32
+aspeed_adc_write(uint8_t offset, uint32_t value) "0x%02" PRIx8 " write 0=
x%04" PRIx32
diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index 9d70e8e060..a582e882f2 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -44,6 +44,7 @@ static const hwaddr aspeed_soc_ast2600_memmap[] =3D {
     [ASPEED_DEV_SCU]       =3D 0x1E6E2000,
     [ASPEED_DEV_XDMA]      =3D 0x1E6E7000,
     [ASPEED_DEV_ADC]       =3D 0x1E6E9000,
+    [ASPEED_DEV_ADC2]      =3D 0x1E6E9100,
     [ASPEED_DEV_VIDEO]     =3D 0x1E700000,
     [ASPEED_DEV_SDHCI]     =3D 0x1E740000,
     [ASPEED_DEV_EMMC]      =3D 0x1E750000,
@@ -77,6 +78,7 @@ static const int aspeed_soc_ast2600_irqmap[] =3D {
     [ASPEED_DEV_SDMC]      =3D 0,
     [ASPEED_DEV_SCU]       =3D 12,
     [ASPEED_DEV_ADC]       =3D 78,
+    [ASPEED_DEV_ADC2]      =3D 78,
     [ASPEED_DEV_XDMA]      =3D 6,
     [ASPEED_DEV_SDHCI]     =3D 43,
     [ASPEED_DEV_EHCI1]     =3D 5,
@@ -216,6 +218,11 @@ static void aspeed_soc_ast2600_init(Object *obj)
=20
     snprintf(typename, sizeof(typename), "aspeed.hace-%s", socname);
     object_initialize_child(obj, "hace", &s->hace, typename);
+
+    snprintf(typename, sizeof(typename), "aspeed.adc-%s", socname);
+    for (i =3D 0; i < sc->adcs_num; i++) {
+        object_initialize_child(obj, "adc[*]", &s->adc[i], typename);
+    }
 }
=20
 /*
@@ -507,6 +514,16 @@ static void aspeed_soc_ast2600_realize(DeviceState *=
dev, Error **errp)
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->hace), 0, sc->memmap[ASPEED_DEV_H=
ACE]);
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->hace), 0,
                        aspeed_soc_get_irq(s, ASPEED_DEV_HACE));
+
+    /* ADC */
+    for (int i =3D 0; i < sc->adcs_num; i++) {
+        SysBusDevice *bus =3D SYS_BUS_DEVICE(&s->adc[i]);
+        if (!sysbus_realize(bus, errp)) {
+            return;
+        }
+        sysbus_mmio_map(bus, 0, sc->memmap[ASPEED_DEV_ADC + i]);
+        sysbus_connect_irq(bus, 0, aspeed_soc_get_irq(s, ASPEED_DEV_ADC =
+ i));
+    }
 }
=20
 static void aspeed_soc_ast2600_class_init(ObjectClass *oc, void *data)
@@ -524,6 +541,7 @@ static void aspeed_soc_ast2600_class_init(ObjectClass=
 *oc, void *data)
     sc->ehcis_num    =3D 2;
     sc->wdts_num     =3D 4;
     sc->macs_num     =3D 4;
+    sc->adcs_num     =3D 2;
     sc->irqmap       =3D aspeed_soc_ast2600_irqmap;
     sc->memmap       =3D aspeed_soc_ast2600_memmap;
     sc->num_cpus     =3D 2;
diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index ed84502e23..412c557e40 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -216,6 +216,11 @@ static void aspeed_soc_init(Object *obj)
=20
     snprintf(typename, sizeof(typename), "aspeed.hace-%s", socname);
     object_initialize_child(obj, "hace", &s->hace, typename);
+
+    snprintf(typename, sizeof(typename), "aspeed.adc-%s", socname);
+    for (i =3D 0; i < sc->adcs_num; i++) {
+        object_initialize_child(obj, "adc[*]", &s->adc[i], typename);
+    }
 }
=20
 static void aspeed_soc_realize(DeviceState *dev, Error **errp)
@@ -435,6 +440,16 @@ static void aspeed_soc_realize(DeviceState *dev, Err=
or **errp)
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->hace), 0, sc->memmap[ASPEED_DEV_H=
ACE]);
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->hace), 0,
                        aspeed_soc_get_irq(s, ASPEED_DEV_HACE));
+
+    /* ADC */
+    for (int i =3D 0; i < sc->adcs_num; i++) {
+        SysBusDevice *bus =3D SYS_BUS_DEVICE(&s->adc[i]);
+        if (!sysbus_realize(bus, errp)) {
+            return;
+        }
+        sysbus_mmio_map(bus, 0, sc->memmap[ASPEED_DEV_ADC + i]);
+        sysbus_connect_irq(bus, 0, aspeed_soc_get_irq(s, ASPEED_DEV_ADC =
+ i));
+    }
 }
 static Property aspeed_soc_properties[] =3D {
     DEFINE_PROP_LINK("dram", AspeedSoCState, dram_mr, TYPE_MEMORY_REGION=
,
@@ -475,6 +490,7 @@ static void aspeed_soc_ast2400_class_init(ObjectClass=
 *oc, void *data)
     sc->ehcis_num    =3D 1;
     sc->wdts_num     =3D 2;
     sc->macs_num     =3D 2;
+    sc->adcs_num     =3D 1;
     sc->irqmap       =3D aspeed_soc_ast2400_irqmap;
     sc->memmap       =3D aspeed_soc_ast2400_memmap;
     sc->num_cpus     =3D 1;
@@ -500,6 +516,7 @@ static void aspeed_soc_ast2500_class_init(ObjectClass=
 *oc, void *data)
     sc->ehcis_num    =3D 2;
     sc->wdts_num     =3D 3;
     sc->macs_num     =3D 2;
+    sc->adcs_num     =3D 1;
     sc->irqmap       =3D aspeed_soc_ast2500_irqmap;
     sc->memmap       =3D aspeed_soc_ast2500_memmap;
     sc->num_cpus     =3D 1;
diff --git a/include/hw/adc/aspeed_adc.h b/include/hw/adc/aspeed_adc.h
new file mode 100644
index 0000000000..5528781be0
--- /dev/null
+++ b/include/hw/adc/aspeed_adc.h
@@ -0,0 +1,48 @@
+/*
+ * Aspeed ADC Controller
+ *
+ * Copyright 2021 Facebook, Inc.
+ *
+ * This program is free software; you can redistribute it and/or modify =
it
+ * under the terms of the GNU General Public License as published by the
+ * Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful, but W=
ITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
+ * for more details.
+ */
+
+#ifndef ASPEED_ADC_H
+#define ASPEED_ADC_H
+
+#include "qemu/osdep.h"
+#include "hw/sysbus.h"
+#include "qom/object.h"
+
+#define TYPE_ASPEED_ADC "aspeed.adc"
+OBJECT_DECLARE_TYPE(AspeedADCState, AspeedADCClass, ASPEED_ADC)
+#define TYPE_ASPEED_2400_ADC TYPE_ASPEED_ADC "-ast2400"
+#define TYPE_ASPEED_2500_ADC TYPE_ASPEED_ADC "-ast2500"
+#define TYPE_ASPEED_2600_ADC TYPE_ASPEED_ADC "-ast2600"
+
+#define ASPEED_2400_ADC_NR_REGS (0xC4 >> 2)
+#define ASPEED_2500_ADC_NR_REGS (0xC8 >> 2)
+#define ASPEED_2600_ADC_NR_REGS (0xD0 >> 2)
+#define ASPEED_ADC_MAX_REGS ASPEED_2600_ADC_NR_REGS
+
+struct AspeedADCState {
+    SysBusDevice parent;
+    MemoryRegion mmio;
+    qemu_irq irq;
+    uint32_t regs[ASPEED_ADC_MAX_REGS];
+};
+
+struct AspeedADCClass {
+    SysBusDeviceClass parent;
+    const uint32_t *resets;
+    uint32_t nr_regs;
+};
+
+#endif
diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
index 87d76c9259..4503f08870 100644
--- a/include/hw/arm/aspeed_soc.h
+++ b/include/hw/arm/aspeed_soc.h
@@ -30,12 +30,14 @@
 #include "hw/usb/hcd-ehci.h"
 #include "qom/object.h"
 #include "hw/misc/aspeed_lpc.h"
+#include "hw/adc/aspeed_adc.h"
=20
 #define ASPEED_SPIS_NUM  2
 #define ASPEED_EHCIS_NUM 2
 #define ASPEED_WDTS_NUM  4
 #define ASPEED_CPUS_NUM  2
 #define ASPEED_MACS_NUM  4
+#define ASPEED_ADCS_NUM  2
=20
 struct AspeedSoCState {
     /*< private >*/
@@ -65,6 +67,7 @@ struct AspeedSoCState {
     AspeedSDHCIState sdhci;
     AspeedSDHCIState emmc;
     AspeedLPCState lpc;
+    AspeedADCState adc[ASPEED_ADCS_NUM];
     uint32_t uart_default;
 };
=20
@@ -82,6 +85,7 @@ struct AspeedSoCClass {
     int ehcis_num;
     int wdts_num;
     int macs_num;
+    int adcs_num;
     const int *irqmap;
     const hwaddr *memmap;
     uint32_t num_cpus;
@@ -105,6 +109,7 @@ enum {
     ASPEED_DEV_SDMC,
     ASPEED_DEV_SCU,
     ASPEED_DEV_ADC,
+    ASPEED_DEV_ADC2,
     ASPEED_DEV_VIDEO,
     ASPEED_DEV_SRAM,
     ASPEED_DEV_SDHCI,
--=20
2.30.2


