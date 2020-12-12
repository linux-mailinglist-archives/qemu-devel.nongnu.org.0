Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D328D2D8981
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Dec 2020 19:58:03 +0100 (CET)
Received: from localhost ([::1]:49414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koA5h-0001pT-QI
	for lists+qemu-devel@lfdr.de; Sat, 12 Dec 2020 13:58:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1ko9U1-0000eu-1H
 for qemu-devel@nongnu.org; Sat, 12 Dec 2020 13:19:05 -0500
Received: from mout.kundenserver.de ([212.227.126.133]:40507)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1ko9Tw-000264-EK
 for qemu-devel@nongnu.org; Sat, 12 Dec 2020 13:19:04 -0500
Received: from localhost.localdomain ([82.252.152.214]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MdNwm-1kF5L41evQ-00ZLRU; Sat, 12 Dec 2020 18:55:02 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 2/5] hw/m68k/q800.c: Make the GLUE chip an actual QOM device
Date: Sat, 12 Dec 2020 18:54:55 +0100
Message-Id: <20201212175458.259960-3-laurent@vivier.eu>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201212175458.259960-1-laurent@vivier.eu>
References: <20201212175458.259960-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:5WvelqhmKeJZ1UJ33TMHa3b2gEKW8F8ymjEsQvDHOSYdYUL8jJF
 TknZWh5MFlDzEUd6FVUShawIL4Jxh3UHzmto+TTJ3eJoGMniJ2VUrGtRjjbK9luOdsK6IkE
 cLshecz51JrZ+a4yrilvT8n4nWyGoXesYSgAUL2sCUyX2QhTkjuR87Dt2+y5Yf7GfPH+8V8
 1Q6XHtn9fcGBeffI4Hgog==
X-UI-Out-Filterresults: notjunk:1;V03:K0:UwXOuLaZehw=:fhIiWcI41MGUNjEw+vEVkK
 kqlsTm0Za/J3sQmsEFFwlKAW0Ob+chGowbbBh/H9eqtv6LnOrvbeCo2Sc6kbZsmctXg1uy4yg
 qyQxrnEGmxNFlWLtA2B2zhYAhOWqCqHDWvZRVcS8Vujn613GeFGzabXPTaXB1jn+PG5cy1Tmp
 85ZU9w0CyqykNh7/RPut7umVc1I02SVGJRnKCIvZfeIQVpTiq+TpTqvRzilq4dNVDLgqQdsJk
 8MT6IvZcuVfA2otMB3Xb63DDHWqsbO6BrxxEAKSIagdrp9p69N4b/H/WAba1HjRwZngSsgt4m
 8PtJlerqm0/5z8tOwa2qGFjZ0D0+7ex3xHdYeRwL1B9LTb6cOdvZzo8awS/sUShW8qqbdcQhG
 U5Gbz3mjdYrqXgrszsm8VpBK5Cj+zUHGGLOiBy5M8Oo2zJ0rElVoJHR82zrOHXARi9zm7uybd
 rEIXylpqYg==
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Maydell <peter.maydell@linaro.org>

The handling of the GLUE (General Logic Unit) device is
currently open-coded. Make this into a proper QOM device.

This minor piece of modernisation gets rid of the free
floating qemu_irq array 'pic', which Coverity points out
is technically leaked when we exit the machine init function.
(The replacement glue device is not leaked because it gets
added to the sysbus, so it's accessible via that.)

Fixes: Coverity CID 1421883
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Laurent vivier <laurent@vivier.eu>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20201106235109.7066-3-peter.maydell@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/m68k/q800.c | 82 ++++++++++++++++++++++++++++++++++++++++++--------
 1 file changed, 70 insertions(+), 12 deletions(-)

diff --git a/hw/m68k/q800.c b/hw/m68k/q800.c
index f9a2be776eb0..2af0e2532eb2 100644
--- a/hw/m68k/q800.c
+++ b/hw/m68k/q800.c
@@ -48,6 +48,7 @@
 #include "sysemu/qtest.h"
 #include "sysemu/runstate.h"
 #include "sysemu/reset.h"
+#include "migration/vmstate.h"
 
 #define MACROM_ADDR     0x40800000
 #define MACROM_SIZE     0x00100000
@@ -95,10 +96,14 @@
  * CPU.
  */
 
-typedef struct {
+#define TYPE_GLUE "q800-glue"
+OBJECT_DECLARE_SIMPLE_TYPE(GLUEState, GLUE)
+
+struct GLUEState {
+    SysBusDevice parent_obj;
     M68kCPU *cpu;
     uint8_t ipr;
-} GLUEState;
+};
 
 static void GLUE_set_irq(void *opaque, int irq, int level)
 {
@@ -120,6 +125,58 @@ static void GLUE_set_irq(void *opaque, int irq, int level)
     m68k_set_irq_level(s->cpu, 0, 0);
 }
 
+static void glue_reset(DeviceState *dev)
+{
+    GLUEState *s = GLUE(dev);
+
+    s->ipr = 0;
+}
+
+static const VMStateDescription vmstate_glue = {
+    .name = "q800-glue",
+    .version_id = 0,
+    .minimum_version_id = 0,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT8(ipr, GLUEState),
+        VMSTATE_END_OF_LIST(),
+    },
+};
+
+/*
+ * If the m68k CPU implemented its inbound irq lines as GPIO lines
+ * rather than via the m68k_set_irq_level() function we would not need
+ * this cpu link property and could instead provide outbound IRQ lines
+ * that the board could wire up to the CPU.
+ */
+static Property glue_properties[] = {
+    DEFINE_PROP_LINK("cpu", GLUEState, cpu, TYPE_M68K_CPU, M68kCPU *),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void glue_init(Object *obj)
+{
+    DeviceState *dev = DEVICE(obj);
+
+    qdev_init_gpio_in(dev, GLUE_set_irq, 8);
+}
+
+static void glue_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->vmsd = &vmstate_glue;
+    dc->reset = glue_reset;
+    device_class_set_props(dc, glue_properties);
+}
+
+static const TypeInfo glue_info = {
+    .name = TYPE_GLUE,
+    .parent = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(GLUEState),
+    .instance_init = glue_init,
+    .class_init = glue_class_init,
+};
+
 static void main_cpu_reset(void *opaque)
 {
     M68kCPU *cpu = opaque;
@@ -180,8 +237,7 @@ static void q800_init(MachineState *machine)
     SysBusDevice *sysbus;
     BusState *adb_bus;
     NubusBus *nubus;
-    GLUEState *irq;
-    qemu_irq *pic;
+    DeviceState *glue;
     DriveInfo *dinfo;
 
     linux_boot = (kernel_filename != NULL);
@@ -215,10 +271,9 @@ static void q800_init(MachineState *machine)
     }
 
     /* IRQ Glue */
-
-    irq = g_new0(GLUEState, 1);
-    irq->cpu = cpu;
-    pic = qemu_allocate_irqs(GLUE_set_irq, irq, 8);
+    glue = qdev_new(TYPE_GLUE);
+    object_property_set_link(OBJECT(glue), "cpu", OBJECT(cpu), &error_abort);
+    sysbus_realize_and_unref(SYS_BUS_DEVICE(glue), &error_fatal);
 
     /* VIA */
 
@@ -230,8 +285,10 @@ static void q800_init(MachineState *machine)
     sysbus = SYS_BUS_DEVICE(via_dev);
     sysbus_realize_and_unref(sysbus, &error_fatal);
     sysbus_mmio_map(sysbus, 0, VIA_BASE);
-    qdev_connect_gpio_out_named(DEVICE(sysbus), "irq", 0, pic[0]);
-    qdev_connect_gpio_out_named(DEVICE(sysbus), "irq", 1, pic[1]);
+    qdev_connect_gpio_out_named(DEVICE(sysbus), "irq", 0,
+                                qdev_get_gpio_in(glue, 0));
+    qdev_connect_gpio_out_named(DEVICE(sysbus), "irq", 1,
+                                qdev_get_gpio_in(glue, 1));
 
 
     adb_bus = qdev_get_child_bus(via_dev, "adb.0");
@@ -272,7 +329,7 @@ static void q800_init(MachineState *machine)
     sysbus_realize_and_unref(sysbus, &error_fatal);
     sysbus_mmio_map(sysbus, 0, SONIC_BASE);
     sysbus_mmio_map(sysbus, 1, SONIC_PROM_BASE);
-    sysbus_connect_irq(sysbus, 0, pic[2]);
+    sysbus_connect_irq(sysbus, 0, qdev_get_gpio_in(glue, 2));
 
     /* SCC */
 
@@ -294,7 +351,7 @@ static void q800_init(MachineState *machine)
     qdev_realize_and_unref(escc_orgate, NULL, &error_fatal);
     sysbus_connect_irq(sysbus, 0, qdev_get_gpio_in(escc_orgate, 0));
     sysbus_connect_irq(sysbus, 1, qdev_get_gpio_in(escc_orgate, 1));
-    qdev_connect_gpio_out(DEVICE(escc_orgate), 0, pic[3]);
+    qdev_connect_gpio_out(DEVICE(escc_orgate), 0, qdev_get_gpio_in(glue, 3));
     sysbus_mmio_map(sysbus, 0, SCC_BASE);
 
     /* SCSI */
@@ -456,6 +513,7 @@ static const TypeInfo q800_machine_typeinfo = {
 static void q800_machine_register_types(void)
 {
     type_register_static(&q800_machine_typeinfo);
+    type_register_static(&glue_info);
 }
 
 type_init(q800_machine_register_types)
-- 
2.29.2


