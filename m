Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B05741FE52
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Oct 2021 23:53:30 +0200 (CEST)
Received: from localhost ([::1]:41576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWmwi-0007pr-Pb
	for lists+qemu-devel@lfdr.de; Sat, 02 Oct 2021 17:53:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=99090ed790=pdel@fb.com>)
 id 1mWmo0-0002Ck-9h
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 17:44:29 -0400
Received: from mx0a-00082601.pphosted.com ([67.231.145.42]:35608)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=99090ed790=pdel@fb.com>)
 id 1mWmnx-0006Dj-S7
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 17:44:28 -0400
Received: from pps.filterd (m0109333.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 192Lfuwg014459
 for <qemu-devel@nongnu.org>; Sat, 2 Oct 2021 14:44:22 -0700
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 3beyjcg09m-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <qemu-devel@nongnu.org>; Sat, 02 Oct 2021 14:44:21 -0700
Received: from intmgw001.27.prn2.facebook.com (2620:10d:c0a8:1b::d) by
 mail.thefacebook.com (2620:10d:c0a8:82::e) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.14; Sat, 2 Oct 2021 14:44:20 -0700
Received: by devvm660.prn0.facebook.com (Postfix, from userid 385188)
 id 663FF51973D7; Sat,  2 Oct 2021 14:44:15 -0700 (PDT)
From: <pdel@fbc.om>
To: 
Subject: [PATCH 1/2] hw/adc: Add basic Aspeed ADC model
Date: Sat, 2 Oct 2021 14:44:13 -0700
Message-ID: <20211002214414.2858382-2-pdel@fbc.om>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211002214414.2858382-1-pdel@fbc.om>
References: <20211002214414.2858382-1-pdel@fbc.om>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-FB-Internal: Safe
X-FB-Source: Intern
X-Proofpoint-ORIG-GUID: a9izpweQehXG9VJXmmhVrwOAyU9R6XL-
X-Proofpoint-GUID: a9izpweQehXG9VJXmmhVrwOAyU9R6XL-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-10-02_07,2021-10-01_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 mlxlogscore=951
 impostorscore=0 clxscore=1034 priorityscore=1501 bulkscore=0 phishscore=0
 spamscore=0 malwarescore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110020158
X-FB-Internal: deliver
Received-SPF: pass client-ip=67.231.145.42;
 envelope-from=prvs=99090ed790=pdel@fb.com; helo=mx0a-00082601.pphosted.com
X-Spam_score_int: 5
X-Spam_score: 0.5
X-Spam_bar: /
X-Spam_report: (0.5 / 5.0 requ) DKIM_ADSP_NXDOMAIN=0.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sat, 02 Oct 2021 17:49:27 -0400
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
Cc: peter.maydell@linaro.org, andrew@aj.id.au, alistair@alistair23.me,
 qemu-devel@nongnu.org, patrick@stwcx.xyz, qemu-arm@nongnu.org, clg@kaod.org,
 Peter Delevoryas <pdel@fb.com>, zhdaniel@fb.com, joel@jms.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Andrew Jeffery <andrew@aj.id.au>

This model implements enough behaviour to do basic functionality tests
such as device initialisation and read out of dummy sample values. The
sample value generation strategy is similar to the STM ADC already in
the tree.

This patch was originally created by Andrew Jeffery, but I (Peter)
refactored it to use a regs[] array and added some extra guest-error
traces for the AST2600 multi-engine configuration.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
[clg : support for multiple engines (AST2600) ]
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Signed-off-by: Peter Delevoryas <pdel@fb.com>
---
 hw/adc/aspeed_adc.c         | 417 ++++++++++++++++++++++++++++++++++++
 hw/adc/meson.build          |   1 +
 hw/adc/trace-events         |   3 +
 include/hw/adc/aspeed_adc.h |  55 +++++
 4 files changed, 476 insertions(+)
 create mode 100644 hw/adc/aspeed_adc.c
 create mode 100644 include/hw/adc/aspeed_adc.h

diff --git a/hw/adc/aspeed_adc.c b/hw/adc/aspeed_adc.c
new file mode 100644
index 0000000000..8a132ef375
--- /dev/null
+++ b/hw/adc/aspeed_adc.c
@@ -0,0 +1,417 @@
+/*
+ * Aspeed ADC
+ *
+ * Copyright 2017-2021 IBM Corp.
+ *
+ * Andrew Jeffery <andrew@aj.id.au>
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "qemu/log.h"
+#include "hw/irq.h"
+#include "hw/qdev-properties.h"
+#include "migration/vmstate.h"
+#include "hw/adc/aspeed_adc.h"
+#include "trace.h"
+
+#define  ASPEED_ADC_ENGINE_CH_EN_MASK           0xffff0000
+#define   ASPEED_ADC_ENGINE_CH_EN(x)            ((BIT(x)) << 16)
+#define  ASPEED_ADC_ENGINE_INIT                 BIT(8)
+#define  ASPEED_ADC_ENGINE_AUTO_COMP            BIT(5)
+#define  ASPEED_ADC_ENGINE_COMP                 BIT(4)
+#define  ASPEED_ADC_ENGINE_MODE_MASK            0x0000000e
+#define   ASPEED_ADC_ENGINE_MODE_OFF            (0b000 << 1)
+#define   ASPEED_ADC_ENGINE_MODE_STANDBY        (0b001 << 1)
+#define   ASPEED_ADC_ENGINE_MODE_NORMAL         (0b111 << 1)
+#define  ASPEED_ADC_ENGINE_EN                   BIT(0)
+#define ASPEED_ADC_HYST_EN                      BIT(31)
+
+#define ASPEED_ADC_L_MASK       ((1 << 10) - 1)
+#define ASPEED_ADC_L(x)         ((x) & ASPEED_ADC_L_MASK)
+#define ASPEED_ADC_H(x)         (((x) >> 16) & ASPEED_ADC_L_MASK)
+#define ASPEED_ADC_LH_MASK      (ASPEED_ADC_L_MASK << 16 | ASPEED_ADC_L_=
MASK)
+#define LOWER_CHANNEL_MASK      ((1 << 10) - 1)
+#define LOWER_CHANNEL_DATA(x)   ((x) & LOWER_CHANNEL_MASK)
+#define UPPER_CHANNEL_DATA(x)   (((x) >> 16) & LOWER_CHANNEL_MASK)
+
+#define TO_REG(addr) (addr >> 2)
+
+#define ENGINE_CONTROL              TO_REG(0x00)
+#define INTERRUPT_CONTROL           TO_REG(0x04)
+#define VGA_DETECT_CONTROL          TO_REG(0x08)
+#define CLOCK_CONTROL               TO_REG(0x0C)
+#define DATA_CHANNEL_1_AND_0        TO_REG(0x10)
+#define DATA_CHANNEL_7_AND_6        TO_REG(0x1C)
+#define DATA_CHANNEL_9_AND_8        TO_REG(0x20)
+#define DATA_CHANNEL_15_AND_14      TO_REG(0x2C)
+#define BOUNDS_CHANNEL_0            TO_REG(0x30)
+#define BOUNDS_CHANNEL_7            TO_REG(0x4C)
+#define BOUNDS_CHANNEL_8            TO_REG(0x50)
+#define BOUNDS_CHANNEL_15           TO_REG(0x6C)
+#define HYSTERESIS_CHANNEL_0        TO_REG(0x70)
+#define HYSTERESIS_CHANNEL_7        TO_REG(0x8C)
+#define HYSTERESIS_CHANNEL_8        TO_REG(0x90)
+#define HYSTERESIS_CHANNEL_15       TO_REG(0xAC)
+#define INTERRUPT_SOURCE            TO_REG(0xC0)
+#define COMPENSATING_AND_TRIMMING   TO_REG(0xC4)
+
+static inline uint32_t update_channels(uint32_t current)
+{
+    return ((((current >> 16) & ASPEED_ADC_L_MASK) + 7) << 16) |
+        ((current + 5) & ASPEED_ADC_L_MASK);
+}
+
+static bool breaks_threshold(AspeedADCEngineState *s, int reg)
+{
+    assert(reg >=3D DATA_CHANNEL_1_AND_0 &&
+           reg < DATA_CHANNEL_1_AND_0 + s->nr_channels / 2);
+
+    int a_bounds_reg =3D BOUNDS_CHANNEL_0 + (reg - DATA_CHANNEL_1_AND_0)=
 * 2;
+    int b_bounds_reg =3D a_bounds_reg + 1;
+    uint32_t a_and_b =3D s->regs[reg];
+    uint32_t a_bounds =3D s->regs[a_bounds_reg];
+    uint32_t b_bounds =3D s->regs[b_bounds_reg];
+    uint32_t a =3D ASPEED_ADC_L(a_and_b);
+    uint32_t b =3D ASPEED_ADC_H(a_and_b);
+    uint32_t a_lower =3D ASPEED_ADC_L(a_bounds);
+    uint32_t a_upper =3D ASPEED_ADC_H(a_bounds);
+    uint32_t b_lower =3D ASPEED_ADC_L(b_bounds);
+    uint32_t b_upper =3D ASPEED_ADC_H(b_bounds);
+
+    return (a < a_lower || a > a_upper) ||
+           (b < b_lower || b > b_upper);
+}
+
+static uint32_t read_channel_sample(AspeedADCEngineState *s, int reg)
+{
+    assert(reg >=3D DATA_CHANNEL_1_AND_0 &&
+           reg < DATA_CHANNEL_1_AND_0 + s->nr_channels / 2);
+
+    /* Poor man's sampling */
+    uint32_t value =3D s->regs[reg];
+    s->regs[reg] =3D update_channels(s->regs[reg]);
+
+    if (breaks_threshold(s, reg)) {
+        s->regs[INTERRUPT_CONTROL] |=3D BIT(reg - DATA_CHANNEL_1_AND_0);
+        qemu_irq_raise(s->irq);
+    }
+
+    return value;
+}
+
+static uint64_t aspeed_adc_engine_read(void *opaque, hwaddr addr,
+                                       unsigned int size)
+{
+    AspeedADCEngineState *s =3D ASPEED_ADC_ENGINE(opaque);
+    int reg =3D TO_REG(addr);
+    uint32_t value =3D 0;
+
+    switch (reg) {
+    case BOUNDS_CHANNEL_8 ... BOUNDS_CHANNEL_15:
+        if (s->nr_channels <=3D 8) {
+            qemu_log_mask(LOG_GUEST_ERROR, "%s: engine[%u]: "
+                          "bounds register %u invalid, only 0...7 valid\=
n",
+                          __func__, s->engine_id, reg - BOUNDS_CHANNEL_0=
);
+            break;
+        }
+        /* fallthrough */
+    case HYSTERESIS_CHANNEL_8 ... HYSTERESIS_CHANNEL_15:
+        if (s->nr_channels <=3D 8) {
+            qemu_log_mask(LOG_GUEST_ERROR, "%s: engine[%u]: "
+                          "hysteresis register %u invalid, only 0...7 va=
lid\n",
+                          __func__, s->engine_id, reg - HYSTERESIS_CHANN=
EL_0);
+            break;
+        }
+        /* fallthrough */
+    case BOUNDS_CHANNEL_0 ... BOUNDS_CHANNEL_7:
+    case HYSTERESIS_CHANNEL_0 ... HYSTERESIS_CHANNEL_7:
+    case ENGINE_CONTROL:
+    case INTERRUPT_CONTROL:
+    case VGA_DETECT_CONTROL:
+    case CLOCK_CONTROL:
+    case INTERRUPT_SOURCE:
+    case COMPENSATING_AND_TRIMMING:
+        value =3D s->regs[reg];
+        break;
+    case DATA_CHANNEL_9_AND_8 ... DATA_CHANNEL_15_AND_14:
+        if (s->nr_channels <=3D 8) {
+            qemu_log_mask(LOG_GUEST_ERROR, "%s: engine[%u]: "
+                          "data register %u invalid, only 0...3 valid\n"=
,
+                          __func__, s->engine_id, reg - DATA_CHANNEL_1_A=
ND_0);
+            break;
+        }
+        /* fallthrough */
+    case DATA_CHANNEL_1_AND_0 ... DATA_CHANNEL_7_AND_6:
+        value =3D read_channel_sample(s, reg);
+        break;
+    default:
+        qemu_log_mask(LOG_UNIMP, "%s: engine[%u]: 0x%" HWADDR_PRIx "\n",
+                      __func__, s->engine_id, addr);
+        break;
+    }
+
+    trace_aspeed_adc_engine_read(s->engine_id, addr, value);
+    return value;
+}
+
+static void aspeed_adc_engine_write(void *opaque, hwaddr addr, uint64_t =
value,
+                                    unsigned int size)
+{
+    AspeedADCEngineState *s =3D ASPEED_ADC_ENGINE(opaque);
+    int reg =3D TO_REG(addr);
+    uint32_t init =3D 0;
+
+    trace_aspeed_adc_engine_write(s->engine_id, addr, value);
+
+    switch (reg) {
+    case ENGINE_CONTROL:
+        init =3D !!(value & ASPEED_ADC_ENGINE_EN);
+        init *=3D ASPEED_ADC_ENGINE_INIT;
+
+        value &=3D ~ASPEED_ADC_ENGINE_INIT;
+        value |=3D init;
+
+        value &=3D ~ASPEED_ADC_ENGINE_AUTO_COMP;
+        break;
+    case INTERRUPT_CONTROL:
+    case VGA_DETECT_CONTROL:
+    case CLOCK_CONTROL:
+        break;
+    case DATA_CHANNEL_9_AND_8 ... DATA_CHANNEL_15_AND_14:
+        if (s->nr_channels <=3D 8) {
+            qemu_log_mask(LOG_GUEST_ERROR, "%s: engine[%u]: "
+                          "data register %u invalid, only 0...3 valid\n"=
,
+                          __func__, s->engine_id, reg - DATA_CHANNEL_1_A=
ND_0);
+            return;
+        }
+        /* fallthrough */
+    case BOUNDS_CHANNEL_8 ... BOUNDS_CHANNEL_15:
+        if (s->nr_channels <=3D 8) {
+            qemu_log_mask(LOG_GUEST_ERROR, "%s: engine[%u]: "
+                          "bounds register %u invalid, only 0...7 valid\=
n",
+                          __func__, s->engine_id, reg - BOUNDS_CHANNEL_0=
);
+            return;
+        }
+        /* fallthrough */
+    case DATA_CHANNEL_1_AND_0 ... DATA_CHANNEL_7_AND_6:
+    case BOUNDS_CHANNEL_0 ... BOUNDS_CHANNEL_7:
+        value &=3D ASPEED_ADC_LH_MASK;
+        break;
+    case HYSTERESIS_CHANNEL_8 ... HYSTERESIS_CHANNEL_15:
+        if (s->nr_channels <=3D 8) {
+            qemu_log_mask(LOG_GUEST_ERROR, "%s: engine[%u]: "
+                          "hysteresis register %u invalid, only 0...7 va=
lid\n",
+                          __func__, s->engine_id, reg - HYSTERESIS_CHANN=
EL_0);
+            return;
+        }
+        /* fallthrough */
+    case HYSTERESIS_CHANNEL_0 ... HYSTERESIS_CHANNEL_7:
+        value &=3D (ASPEED_ADC_HYST_EN | ASPEED_ADC_LH_MASK);
+        break;
+    case INTERRUPT_SOURCE:
+        value &=3D 0xffff;
+        break;
+    case COMPENSATING_AND_TRIMMING:
+        value &=3D 0xf;
+        break;
+    default:
+        qemu_log_mask(LOG_UNIMP, "%s: engine[%u]: "
+                      "0x%" HWADDR_PRIx " 0x%" PRIx64 "\n",
+                      __func__, s->engine_id, addr, value);
+        break;
+    }
+
+    s->regs[reg] =3D value;
+}
+
+static const MemoryRegionOps aspeed_adc_engine_ops =3D {
+    .read =3D aspeed_adc_engine_read,
+    .write =3D aspeed_adc_engine_write,
+    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .valid =3D {
+        .min_access_size =3D 4,
+        .max_access_size =3D 4,
+        .unaligned =3D false,
+    },
+};
+
+static const uint32_t aspeed_adc_resets[ASPEED_ADC_NR_REGS] =3D {
+    [ENGINE_CONTROL]     =3D 0x00000000,
+    [INTERRUPT_CONTROL]  =3D 0x00000000,
+    [VGA_DETECT_CONTROL] =3D 0x0000000f,
+    [CLOCK_CONTROL]      =3D 0x0000000f,
+};
+
+static void aspeed_adc_engine_reset(DeviceState *dev)
+{
+    AspeedADCEngineState *s =3D ASPEED_ADC_ENGINE(dev);
+
+    memcpy(s->regs, aspeed_adc_resets, sizeof(aspeed_adc_resets));
+}
+
+static void aspeed_adc_engine_realize(DeviceState *dev, Error **errp)
+{
+    AspeedADCEngineState *s =3D ASPEED_ADC_ENGINE(dev);
+    SysBusDevice *sbd =3D SYS_BUS_DEVICE(dev);
+    g_autofree char *name =3D g_strdup_printf(TYPE_ASPEED_ADC_ENGINE ".%=
d",
+                                            s->engine_id);
+
+    assert(s->engine_id < 2);
+
+    sysbus_init_irq(sbd, &s->irq);
+
+    memory_region_init_io(&s->mmio, OBJECT(s), &aspeed_adc_engine_ops, s=
, name,
+                          0x100);
+
+    sysbus_init_mmio(sbd, &s->mmio);
+}
+
+static const VMStateDescription vmstate_aspeed_adc_engine =3D {
+    .name =3D TYPE_ASPEED_ADC,
+    .version_id =3D 1,
+    .minimum_version_id =3D 1,
+    .fields =3D (VMStateField[]) {
+        VMSTATE_UINT32_ARRAY(regs, AspeedADCEngineState, ASPEED_ADC_NR_R=
EGS),
+        VMSTATE_END_OF_LIST(),
+    }
+};
+
+static Property aspeed_adc_engine_properties[] =3D {
+    DEFINE_PROP_UINT32("engine-id", AspeedADCEngineState, engine_id, 0),
+    DEFINE_PROP_UINT32("nr-channels", AspeedADCEngineState, nr_channels,=
 0),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void aspeed_adc_engine_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc =3D DEVICE_CLASS(klass);
+
+    dc->realize =3D aspeed_adc_engine_realize;
+    dc->reset =3D aspeed_adc_engine_reset;
+    device_class_set_props(dc, aspeed_adc_engine_properties);
+    dc->desc =3D "Aspeed Analog-to-Digital Engine";
+    dc->vmsd =3D &vmstate_aspeed_adc_engine;
+}
+
+static const TypeInfo aspeed_adc_engine_info =3D {
+    .name =3D TYPE_ASPEED_ADC_ENGINE,
+    .parent =3D TYPE_SYS_BUS_DEVICE,
+    .instance_size =3D sizeof(AspeedADCEngineState),
+    .class_init =3D aspeed_adc_engine_class_init,
+};
+
+static void aspeed_adc_instance_init(Object *obj)
+{
+    AspeedADCState *s =3D ASPEED_ADC(obj);
+    AspeedADCClass *aac =3D ASPEED_ADC_GET_CLASS(obj);
+    uint32_t nr_channels =3D ASPEED_ADC_NR_CHANNELS / aac->nr_engines;
+
+    for (int i =3D 0; i < aac->nr_engines; i++) {
+        AspeedADCEngineState *engine =3D &s->engines[i];
+        object_initialize_child(obj, "engine[*]", engine,
+                                TYPE_ASPEED_ADC_ENGINE);
+        qdev_prop_set_uint32(DEVICE(engine), "engine-id", i);
+        qdev_prop_set_uint32(DEVICE(engine), "nr-channels", nr_channels)=
;
+    }
+}
+
+static void aspeed_adc_set_irq(void *opaque, int n, int level)
+{
+    AspeedADCState *s =3D opaque;
+    AspeedADCClass *aac =3D ASPEED_ADC_GET_CLASS(s);
+    uint32_t pending =3D 0;
+
+    /* TODO: update Global IRQ status register on AST2600 (Need specs) *=
/
+    for (int i =3D 0; i < aac->nr_engines; i++) {
+        uint32_t irq_status =3D s->engines[i].regs[INTERRUPT_CONTROL] & =
0xFF;
+        pending |=3D irq_status << (i * 8);
+    }
+
+    qemu_set_irq(s->irq, !!pending);
+}
+
+static void aspeed_adc_realize(DeviceState *dev, Error **errp)
+{
+    AspeedADCState *s =3D ASPEED_ADC(dev);
+    SysBusDevice *sbd =3D SYS_BUS_DEVICE(dev);
+    AspeedADCClass *aac =3D ASPEED_ADC_GET_CLASS(dev);
+
+    qdev_init_gpio_in_named_with_opaque(DEVICE(sbd), aspeed_adc_set_irq,
+                                        s, NULL, aac->nr_engines);
+
+    sysbus_init_irq(sbd, &s->irq);
+
+    memory_region_init(&s->mmio, OBJECT(s), TYPE_ASPEED_ADC, 0x1000);
+
+    sysbus_init_mmio(sbd, &s->mmio);
+
+    for (int i =3D 0; i < aac->nr_engines; i++) {
+        Object *eng =3D OBJECT(&s->engines[i]);
+
+        if (!sysbus_realize(SYS_BUS_DEVICE(eng), errp)) {
+            return;
+        }
+        sysbus_connect_irq(SYS_BUS_DEVICE(eng), 0,
+                           qdev_get_gpio_in(DEVICE(sbd), i));
+        memory_region_add_subregion(&s->mmio, i * 0x100, &s->engines[i].=
mmio);
+    }
+}
+
+static void aspeed_adc_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc =3D DEVICE_CLASS(klass);
+    AspeedADCClass *aac =3D ASPEED_ADC_CLASS(klass);
+
+    dc->realize =3D aspeed_adc_realize;
+    dc->desc =3D "Aspeed Analog-to-Digital Converter";
+    aac->nr_engines =3D 1;
+}
+
+static void aspeed_2600_adc_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc =3D DEVICE_CLASS(klass);
+    AspeedADCClass *aac =3D ASPEED_ADC_CLASS(klass);
+
+    dc->desc =3D "ASPEED 2600 ADC Controller";
+    aac->nr_engines =3D 2;
+}
+
+static const TypeInfo aspeed_adc_info =3D {
+    .name =3D TYPE_ASPEED_ADC,
+    .parent =3D TYPE_SYS_BUS_DEVICE,
+    .instance_init =3D aspeed_adc_instance_init,
+    .instance_size =3D sizeof(AspeedADCState),
+    .class_init =3D aspeed_adc_class_init,
+    .class_size =3D sizeof(AspeedADCClass),
+    .abstract   =3D true,
+};
+
+static const TypeInfo aspeed_2400_adc_info =3D {
+    .name =3D TYPE_ASPEED_2400_ADC,
+    .parent =3D TYPE_ASPEED_ADC,
+};
+
+static const TypeInfo aspeed_2500_adc_info =3D {
+    .name =3D TYPE_ASPEED_2500_ADC,
+    .parent =3D TYPE_ASPEED_ADC,
+};
+
+static const TypeInfo aspeed_2600_adc_info =3D {
+    .name =3D TYPE_ASPEED_2600_ADC,
+    .parent =3D TYPE_ASPEED_ADC,
+    .class_init =3D aspeed_2600_adc_class_init,
+};
+
+static void aspeed_adc_register_types(void)
+{
+    type_register_static(&aspeed_adc_engine_info);
+    type_register_static(&aspeed_adc_info);
+    type_register_static(&aspeed_2400_adc_info);
+    type_register_static(&aspeed_2500_adc_info);
+    type_register_static(&aspeed_2600_adc_info);
+}
+
+type_init(aspeed_adc_register_types);
diff --git a/hw/adc/meson.build b/hw/adc/meson.build
index ac4f093fea..b29ac7ccdf 100644
--- a/hw/adc/meson.build
+++ b/hw/adc/meson.build
@@ -1,4 +1,5 @@
 softmmu_ss.add(when: 'CONFIG_STM32F2XX_ADC', if_true: files('stm32f2xx_a=
dc.c'))
+softmmu_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files('aspeed_adc.c')=
)
 softmmu_ss.add(when: 'CONFIG_NPCM7XX', if_true: files('npcm7xx_adc.c'))
 softmmu_ss.add(when: 'CONFIG_ZYNQ', if_true: files('zynq-xadc.c'))
 softmmu_ss.add(when: 'CONFIG_MAX111X', if_true: files('max111x.c'))
diff --git a/hw/adc/trace-events b/hw/adc/trace-events
index 456f21c8f4..5a4c444d77 100644
--- a/hw/adc/trace-events
+++ b/hw/adc/trace-events
@@ -3,3 +3,6 @@
 # npcm7xx_adc.c
 npcm7xx_adc_read(const char *id, uint64_t offset, uint32_t value) " %s o=
ffset: 0x%04" PRIx64 " value 0x%04" PRIx32
 npcm7xx_adc_write(const char *id, uint64_t offset, uint32_t value) "%s o=
ffset: 0x%04" PRIx64 " value 0x%04" PRIx32
+
+aspeed_adc_engine_read(uint32_t engine_id, uint64_t addr, uint64_t value=
) "engine[%u] 0x%" PRIx64 " 0x%" PRIx64
+aspeed_adc_engine_write(uint32_t engine_id, uint64_t addr, uint64_t valu=
e) "engine[%u] 0x%" PRIx64 " 0x%" PRIx64
diff --git a/include/hw/adc/aspeed_adc.h b/include/hw/adc/aspeed_adc.h
new file mode 100644
index 0000000000..2f166e8be1
--- /dev/null
+++ b/include/hw/adc/aspeed_adc.h
@@ -0,0 +1,55 @@
+/*
+ * Aspeed ADC
+ *
+ * Copyright 2017-2021 IBM Corp.
+ *
+ * Andrew Jeffery <andrew@aj.id.au>
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#ifndef HW_ADC_ASPEED_ADC_H
+#define HW_ADC_ASPEED_ADC_H
+
+#include "hw/sysbus.h"
+
+#define TYPE_ASPEED_ADC "aspeed.adc"
+#define TYPE_ASPEED_2400_ADC TYPE_ASPEED_ADC "-ast2400"
+#define TYPE_ASPEED_2500_ADC TYPE_ASPEED_ADC "-ast2500"
+#define TYPE_ASPEED_2600_ADC TYPE_ASPEED_ADC "-ast2600"
+OBJECT_DECLARE_TYPE(AspeedADCState, AspeedADCClass, ASPEED_ADC)
+
+#define TYPE_ASPEED_ADC_ENGINE "aspeed.adc.engine"
+OBJECT_DECLARE_SIMPLE_TYPE(AspeedADCEngineState, ASPEED_ADC_ENGINE)
+
+#define ASPEED_ADC_NR_CHANNELS 16
+#define ASPEED_ADC_NR_REGS     (0xD0 >> 2)
+
+struct AspeedADCEngineState {
+    /* <private> */
+    SysBusDevice parent;
+
+    MemoryRegion mmio;
+    qemu_irq irq;
+    uint32_t engine_id;
+    uint32_t nr_channels;
+    uint32_t regs[ASPEED_ADC_NR_REGS];
+};
+
+struct AspeedADCState {
+    /* <private> */
+    SysBusDevice parent;
+
+    MemoryRegion mmio;
+    qemu_irq irq;
+
+    AspeedADCEngineState engines[2];
+};
+
+struct AspeedADCClass {
+    SysBusDeviceClass parent_class;
+
+    uint32_t nr_engines;
+};
+
+#endif /* HW_ADC_ASPEED_ADC_H */
--=20
2.30.2


