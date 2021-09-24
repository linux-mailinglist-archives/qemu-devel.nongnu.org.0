Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC9A6416B7E
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 08:22:06 +0200 (CEST)
Received: from localhost ([::1]:59544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTeaz-0007ws-Ve
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 02:22:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=8901221e72=pdel@fb.com>)
 id 1mTeZ3-0005ni-1j
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 02:20:05 -0400
Received: from mx0a-00082601.pphosted.com ([67.231.145.42]:63872)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=8901221e72=pdel@fb.com>)
 id 1mTeYz-00032q-Uy
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 02:20:04 -0400
Received: from pps.filterd (m0148461.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18NNe0Jl011018
 for <qemu-devel@nongnu.org>; Thu, 23 Sep 2021 23:19:58 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=facebook;
 bh=u3Mm8NRCQT3mErl5WbVm3bPV1QoXGSg5THd9RkQY/Pg=;
 b=WHWCFqY3UzGsRzE1/0l7FBBR0k+NKALtixU3HttpkoV+e0fd7VKpgR4UE83mE+Uv3XPo
 LGOOArjXJl/cv9XQ7OouMCMT1rxhb/vS2mfTfTyh+kbbkcnH09MquVrycHBU5+OYgDfB
 9/B6qgqAl3Gy4NORDTS+fk0sw/AxshtYmcQ= 
Received: from mail.thefacebook.com ([163.114.132.120])
 by mx0a-00082601.pphosted.com with ESMTP id 3b93ey9phe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <qemu-devel@nongnu.org>; Thu, 23 Sep 2021 23:19:58 -0700
Received: from intmgw003.48.prn1.facebook.com (2620:10d:c085:108::4) by
 mail.thefacebook.com (2620:10d:c085:11d::6) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.14; Thu, 23 Sep 2021 23:19:57 -0700
Received: by devvm660.prn0.facebook.com (Postfix, from userid 385188)
 id 9EFAB3E4FC98; Thu, 23 Sep 2021 23:19:55 -0700 (PDT)
From: <pdel@fb.com>
To: 
CC: <clg@kaod.org>, <joel@jms.id.au>, <rashmica.g@gmail.com>,
 <patrick@stwcx.xyz>, <qemu-devel@nongnu.org>,
 Peter Delevoryas <pdel@fb.com>
Subject: [PATCH 1/1] hw: aspeed_gpio: Fix GPIO array indexing
Date: Thu, 23 Sep 2021 23:19:53 -0700
Message-ID: <20210924061953.1996620-2-pdel@fb.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210924061953.1996620-1-pdel@fb.com>
References: <20210924061953.1996620-1-pdel@fb.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-FB-Internal: Safe
Content-Type: text/plain
X-FB-Source: Intern
X-Proofpoint-GUID: 7EaFgpP56dVE5zTQNOESd7v6KoNxH8vl
X-Proofpoint-ORIG-GUID: 7EaFgpP56dVE5zTQNOESd7v6KoNxH8vl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-24_01,2021-09-23_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 clxscore=1015
 suspectscore=0 priorityscore=1501 spamscore=0 phishscore=0 mlxlogscore=970
 lowpriorityscore=0 bulkscore=0 malwarescore=0 mlxscore=0 adultscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2109240035
X-FB-Internal: deliver
Received-SPF: pass client-ip=67.231.145.42;
 envelope-from=prvs=8901221e72=pdel@fb.com; helo=mx0a-00082601.pphosted.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.473,
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

The gpio array is declared as a dense array:

...
qemu_irq gpios[ASPEED_GPIO_NR_PINS];

(AST2500 has 228, AST2400 has 216, AST2600 has 208)

However, this array is used like a matrix of GPIO sets
(e.g. gpio[NR_SETS][NR_PINS_PER_SET] =3D gpio[8][32])

size_t offset =3D set * GPIOS_PER_SET + gpio;
qemu_set_irq(s->gpios[offset], !!(new & mask));

This can result in an out-of-bounds access to "s->gpios" because the
gpio sets do _not_ have the same length. Some of the groups (e.g.
GPIOAB) only have 4 pins. 228 !=3D 8 * 32 =3D=3D 256.

To fix this, I converted the gpio array from dense to sparse, to that
match both the hardware layout and this existing indexing code.

Also, I noticed that some of the property specifications looked wrong:
the lower 8 bits in the input and output u32's correspond to the first
group label, and the upper 8 bits correspond to the last group label.

I looked at the datasheet and several of these declarations seemed
incorrect to me (I was basing it off of the I/O column). If somebody
can double-check this, I'd really appreciate it!

Some were definitely wrong though, like "Y" and "Z" in the 2600.

@@ -796,7 +776,7 @@ static const GPIOSetProperties ast2500_set_props[] =3D=
 {
     [3] =3D {0xffffffff,  0xffffffff,  {"M", "N", "O", "P"} },
     [4] =3D {0xffffffff,  0xffffffff,  {"Q", "R", "S", "T"} },
     [5] =3D {0xffffffff,  0x0000ffff,  {"U", "V", "W", "X"} },
-    [6] =3D {0xffffff0f,  0x0fffff0f,  {"Y", "Z", "AA", "AB"} },
+    [6] =3D {0x0fffffff,  0x0fffffff,  {"Y", "Z", "AA", "AB"} },
     [7] =3D {0x000000ff,  0x000000ff,  {"AC"} },
 };

@@ -805,9 +785,9 @@ static GPIOSetProperties ast2600_3_3v_set_props[] =3D=
 {
     [1] =3D {0xffffffff,  0xffffffff,  {"E", "F", "G", "H"} },
     [2] =3D {0xffffffff,  0xffffffff,  {"I", "J", "K", "L"} },
     [3] =3D {0xffffffff,  0xffffffff,  {"M", "N", "O", "P"} },
-    [4] =3D {0xffffffff,  0xffffffff,  {"Q", "R", "S", "T"} },
-    [5] =3D {0xffffffff,  0x0000ffff,  {"U", "V", "W", "X"} },
-    [6] =3D {0xffff0000,  0x0fff0000,  {"Y", "Z", "", ""} },
+    [4] =3D {0xffffffff,  0x00ffffff,  {"Q", "R", "S", "T"} },
+    [5] =3D {0xffffffff,  0xffffff00,  {"U", "V", "W", "X"} },
+    [6] =3D {0x0000ffff,  0x0000ffff,  {"Y", "Z", "", ""} },
 };

Signed-off-by: Peter Delevoryas <pdel@fb.com>
---
 hw/gpio/aspeed_gpio.c         | 80 +++++++++++++++--------------------
 include/hw/gpio/aspeed_gpio.h |  5 +--
 2 files changed, 35 insertions(+), 50 deletions(-)

diff --git a/hw/gpio/aspeed_gpio.c b/hw/gpio/aspeed_gpio.c
index dfa6d6cb40..8e3f7e4398 100644
--- a/hw/gpio/aspeed_gpio.c
+++ b/hw/gpio/aspeed_gpio.c
@@ -16,11 +16,7 @@
 #include "hw/irq.h"
 #include "migration/vmstate.h"
=20
-#define GPIOS_PER_REG 32
-#define GPIOS_PER_SET GPIOS_PER_REG
-#define GPIO_PIN_GAP_SIZE 4
 #define GPIOS_PER_GROUP 8
-#define GPIO_GROUP_SHIFT 3
=20
 /* GPIO Source Types */
 #define ASPEED_CMD_SRC_MASK         0x01010101
@@ -259,7 +255,7 @@ static void aspeed_gpio_update(AspeedGPIOState *s, GP=
IOSets *regs,
=20
     diff =3D old ^ new;
     if (diff) {
-        for (gpio =3D 0; gpio < GPIOS_PER_REG; gpio++) {
+        for (gpio =3D 0; gpio < ASPEED_GPIOS_PER_SET; gpio++) {
             uint32_t mask =3D 1 << gpio;
=20
             /* If the gpio needs to be updated... */
@@ -283,8 +279,7 @@ static void aspeed_gpio_update(AspeedGPIOState *s, GP=
IOSets *regs,
             if (direction & mask) {
                 /* ...trigger the line-state IRQ */
                 ptrdiff_t set =3D aspeed_gpio_set_idx(s, regs);
-                size_t offset =3D set * GPIOS_PER_SET + gpio;
-                qemu_set_irq(s->gpios[offset], !!(new & mask));
+                qemu_set_irq(s->gpios[set][gpio], !!(new & mask));
             } else {
                 /* ...otherwise if we meet the line's current IRQ policy=
... */
                 if (aspeed_evaluate_irq(regs, old & mask, gpio)) {
@@ -297,21 +292,6 @@ static void aspeed_gpio_update(AspeedGPIOState *s, G=
PIOSets *regs,
     qemu_set_irq(s->irq, !!(s->pending));
 }
=20
-static uint32_t aspeed_adjust_pin(AspeedGPIOState *s, uint32_t pin)
-{
-    AspeedGPIOClass *agc =3D ASPEED_GPIO_GET_CLASS(s);
-    /*
-     * The 2500 has a 4 pin gap in group AB and the 2400 has a 4 pin
-     * gap in group Y (and only four pins in AB but this is the last gro=
up so
-     * it doesn't matter).
-     */
-    if (agc->gap && pin >=3D agc->gap) {
-        pin +=3D GPIO_PIN_GAP_SIZE;
-    }
-
-    return pin;
-}
-
 static bool aspeed_gpio_get_pin_level(AspeedGPIOState *s, uint32_t set_i=
dx,
                                       uint32_t pin)
 {
@@ -367,7 +347,7 @@ static uint32_t update_value_control_source(GPIOSets =
*regs, uint32_t old_value,
     uint32_t new_value =3D 0;
=20
     /* for each group in set */
-    for (i =3D 0; i < GPIOS_PER_REG; i +=3D GPIOS_PER_GROUP) {
+    for (i =3D 0; i < ASPEED_GPIOS_PER_SET; i +=3D GPIOS_PER_GROUP) {
         cmd_source =3D extract32(regs->cmd_source_0, i, 1)
                 | (extract32(regs->cmd_source_1, i, 1) << 1);
=20
@@ -637,7 +617,7 @@ static void aspeed_gpio_write(void *opaque, hwaddr of=
fset, uint64_t data,
          *   bidirectional  |   1       |   1        |  data
          *   input only     |   1       |   0        |   0
          *   output only    |   0       |   1        |   1
-         *   no pin / gap   |   0       |   0        |   0
+         *   no pin         |   0       |   0        |   0
          *
          *  which is captured by:
          *  data =3D ( data | ~input) & output;
@@ -796,7 +776,7 @@ static const GPIOSetProperties ast2500_set_props[] =3D=
 {
     [3] =3D {0xffffffff,  0xffffffff,  {"M", "N", "O", "P"} },
     [4] =3D {0xffffffff,  0xffffffff,  {"Q", "R", "S", "T"} },
     [5] =3D {0xffffffff,  0x0000ffff,  {"U", "V", "W", "X"} },
-    [6] =3D {0xffffff0f,  0x0fffff0f,  {"Y", "Z", "AA", "AB"} },
+    [6] =3D {0x0fffffff,  0x0fffffff,  {"Y", "Z", "AA", "AB"} },
     [7] =3D {0x000000ff,  0x000000ff,  {"AC"} },
 };
=20
@@ -805,9 +785,9 @@ static GPIOSetProperties ast2600_3_3v_set_props[] =3D=
 {
     [1] =3D {0xffffffff,  0xffffffff,  {"E", "F", "G", "H"} },
     [2] =3D {0xffffffff,  0xffffffff,  {"I", "J", "K", "L"} },
     [3] =3D {0xffffffff,  0xffffffff,  {"M", "N", "O", "P"} },
-    [4] =3D {0xffffffff,  0xffffffff,  {"Q", "R", "S", "T"} },
-    [5] =3D {0xffffffff,  0x0000ffff,  {"U", "V", "W", "X"} },
-    [6] =3D {0xffff0000,  0x0fff0000,  {"Y", "Z", "", ""} },
+    [4] =3D {0xffffffff,  0x00ffffff,  {"Q", "R", "S", "T"} },
+    [5] =3D {0xffffffff,  0xffffff00,  {"U", "V", "W", "X"} },
+    [6] =3D {0x0000ffff,  0x0000ffff,  {"Y", "Z", "", ""} },
 };
=20
 static GPIOSetProperties ast2600_1_8v_set_props[] =3D {
@@ -836,14 +816,20 @@ static void aspeed_gpio_realize(DeviceState *dev, E=
rror **errp)
     AspeedGPIOState *s =3D ASPEED_GPIO(dev);
     SysBusDevice *sbd =3D SYS_BUS_DEVICE(dev);
     AspeedGPIOClass *agc =3D ASPEED_GPIO_GET_CLASS(s);
-    int pin;
=20
     /* Interrupt parent line */
     sysbus_init_irq(sbd, &s->irq);
=20
     /* Individual GPIOs */
-    for (pin =3D 0; pin < agc->nr_gpio_pins; pin++) {
-        sysbus_init_irq(sbd, &s->gpios[pin]);
+    for (int i =3D 0; i < ASPEED_GPIO_MAX_NR_SETS; i++) {
+        const GPIOSetProperties *props =3D &agc->props[i];
+        uint32_t skip =3D ~(props->input | props->output);
+        for (int j =3D 0; j < ASPEED_GPIOS_PER_SET; j++) {
+            if (skip >> j & 1) {
+                continue;
+            }
+            sysbus_init_irq(sbd, &s->gpios[i][j]);
+        }
     }
=20
     memory_region_init_io(&s->iomem, OBJECT(s), &aspeed_gpio_ops, s,
@@ -856,20 +842,22 @@ static void aspeed_gpio_init(Object *obj)
 {
     AspeedGPIOState *s =3D ASPEED_GPIO(obj);
     AspeedGPIOClass *agc =3D ASPEED_GPIO_GET_CLASS(s);
-    int pin;
-
-    for (pin =3D 0; pin < agc->nr_gpio_pins; pin++) {
-        char *name;
-        int set_idx =3D pin / GPIOS_PER_SET;
-        int pin_idx =3D aspeed_adjust_pin(s, pin) - (set_idx * GPIOS_PER=
_SET);
-        int group_idx =3D pin_idx >> GPIO_GROUP_SHIFT;
-        const GPIOSetProperties *props =3D &agc->props[set_idx];
-
-        name =3D g_strdup_printf("gpio%s%d", props->group_label[group_id=
x],
-                               pin_idx % GPIOS_PER_GROUP);
-        object_property_add(obj, name, "bool", aspeed_gpio_get_pin,
-                            aspeed_gpio_set_pin, NULL, NULL);
-        g_free(name);
+
+    for (int i =3D 0; i < ASPEED_GPIO_MAX_NR_SETS; i++) {
+        const GPIOSetProperties *props =3D &agc->props[i];
+        uint32_t skip =3D ~(props->input | props->output);
+        for (int j =3D 0; j < ASPEED_GPIOS_PER_SET; j++) {
+            if (skip >> j & 1) {
+                continue;
+            }
+            int group_idx =3D j / GPIOS_PER_GROUP;
+            int pin_idx =3D j % GPIOS_PER_GROUP;
+            const char *group =3D &props->group_label[group_idx][0];
+            char *name =3D g_strdup_printf("gpio%s%d", group, pin_idx);
+            object_property_add(obj, name, "bool", aspeed_gpio_get_pin,
+                                aspeed_gpio_set_pin, NULL, NULL);
+            g_free(name);
+        }
     }
 }
=20
@@ -926,7 +914,6 @@ static void aspeed_gpio_ast2400_class_init(ObjectClas=
s *klass, void *data)
     agc->props =3D ast2400_set_props;
     agc->nr_gpio_pins =3D 216;
     agc->nr_gpio_sets =3D 7;
-    agc->gap =3D 196;
     agc->reg_table =3D aspeed_3_3v_gpios;
 }
=20
@@ -937,7 +924,6 @@ static void aspeed_gpio_2500_class_init(ObjectClass *=
klass, void *data)
     agc->props =3D ast2500_set_props;
     agc->nr_gpio_pins =3D 228;
     agc->nr_gpio_sets =3D 8;
-    agc->gap =3D 220;
     agc->reg_table =3D aspeed_3_3v_gpios;
 }
=20
diff --git a/include/hw/gpio/aspeed_gpio.h b/include/hw/gpio/aspeed_gpio.=
h
index e1636ce7fe..801846befb 100644
--- a/include/hw/gpio/aspeed_gpio.h
+++ b/include/hw/gpio/aspeed_gpio.h
@@ -17,9 +17,9 @@
 OBJECT_DECLARE_TYPE(AspeedGPIOState, AspeedGPIOClass, ASPEED_GPIO)
=20
 #define ASPEED_GPIO_MAX_NR_SETS 8
+#define ASPEED_GPIOS_PER_SET 32
 #define ASPEED_REGS_PER_BANK 14
 #define ASPEED_GPIO_MAX_NR_REGS (ASPEED_REGS_PER_BANK * ASPEED_GPIO_MAX_=
NR_SETS)
-#define ASPEED_GPIO_NR_PINS 228
 #define ASPEED_GROUPS_PER_SET 4
 #define ASPEED_GPIO_NR_DEBOUNCE_REGS 3
 #define ASPEED_CHARS_PER_GROUP_LABEL 4
@@ -60,7 +60,6 @@ struct AspeedGPIOClass {
     const GPIOSetProperties *props;
     uint32_t nr_gpio_pins;
     uint32_t nr_gpio_sets;
-    uint32_t gap;
     const AspeedGPIOReg *reg_table;
 };
=20
@@ -72,7 +71,7 @@ struct AspeedGPIOState {
     MemoryRegion iomem;
     int pending;
     qemu_irq irq;
-    qemu_irq gpios[ASPEED_GPIO_NR_PINS];
+    qemu_irq gpios[ASPEED_GPIO_MAX_NR_SETS][ASPEED_GPIOS_PER_SET];
=20
 /* Parallel GPIO Registers */
     uint32_t debounce_regs[ASPEED_GPIO_NR_DEBOUNCE_REGS];
--=20
2.30.2


