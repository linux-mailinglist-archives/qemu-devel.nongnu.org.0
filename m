Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C8FD591BC5
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Aug 2022 17:56:23 +0200 (CEST)
Received: from localhost ([::1]:48380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMtUs-0000hi-F4
	for lists+qemu-devel@lfdr.de; Sat, 13 Aug 2022 11:56:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oMtA1-0000iC-Bp; Sat, 13 Aug 2022 11:34:49 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:28359)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oMt9y-0006M4-IZ; Sat, 13 Aug 2022 11:34:49 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 1138A748191;
 Sat, 13 Aug 2022 17:34:45 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id E1E3174818E; Sat, 13 Aug 2022 17:34:44 +0200 (CEST)
Message-Id: <092ec66e749939f9c7ab3d1252012461366719ac.1660402839.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1660402839.git.balaton@eik.bme.hu>
References: <cover.1660402839.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH 17/22] ppc/ppc405: QOM'ify FPGA
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org,
    qemu-ppc@nongnu.org
Cc: clg@kaod.org, Daniel Henrique Barboza <danielhb413@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 13 Aug 2022 17:34:44 +0200 (CEST)
X-Spam-Probability: 8%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
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

From: Cédric Le Goater <clg@kaod.org>

Signed-off-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/ppc/ppc405_boards.c | 56 +++++++++++++++++++++++++++++-------------
 1 file changed, 39 insertions(+), 17 deletions(-)

diff --git a/hw/ppc/ppc405_boards.c b/hw/ppc/ppc405_boards.c
index 3677793adc..7af0d7feef 100644
--- a/hw/ppc/ppc405_boards.c
+++ b/hw/ppc/ppc405_boards.c
@@ -71,18 +71,23 @@ struct Ppc405MachineState {
  * - NVRAM (0xF0000000)
  * - FPGA  (0xF0300000)
  */
-typedef struct ref405ep_fpga_t ref405ep_fpga_t;
-struct ref405ep_fpga_t {
+
+#define TYPE_REF405EP_FPGA "ref405ep-fpga"
+OBJECT_DECLARE_SIMPLE_TYPE(Ref405epFpgaState, REF405EP_FPGA);
+struct Ref405epFpgaState {
+    SysBusDevice parent_obj;
+
+    MemoryRegion iomem;
+
     uint8_t reg0;
     uint8_t reg1;
 };
 
 static uint64_t ref405ep_fpga_readb(void *opaque, hwaddr addr, unsigned size)
 {
-    ref405ep_fpga_t *fpga;
+    Ref405epFpgaState *fpga = opaque;
     uint32_t ret;
 
-    fpga = opaque;
     switch (addr) {
     case 0x0:
         ret = fpga->reg0;
@@ -101,9 +106,8 @@ static uint64_t ref405ep_fpga_readb(void *opaque, hwaddr addr, unsigned size)
 static void ref405ep_fpga_writeb(void *opaque, hwaddr addr, uint64_t value,
                                  unsigned size)
 {
-    ref405ep_fpga_t *fpga;
+    Ref405epFpgaState *fpga = opaque;
 
-    fpga = opaque;
     switch (addr) {
     case 0x0:
         /* Read only */
@@ -126,27 +130,40 @@ static const MemoryRegionOps ref405ep_fpga_ops = {
     .endianness = DEVICE_BIG_ENDIAN,
 };
 
-static void ref405ep_fpga_reset (void *opaque)
+static void ref405ep_fpga_reset(DeviceState *dev)
 {
-    ref405ep_fpga_t *fpga;
+    Ref405epFpgaState *fpga = REF405EP_FPGA(dev);
 
-    fpga = opaque;
     fpga->reg0 = 0x00;
     fpga->reg1 = 0x0F;
 }
 
-static void ref405ep_fpga_init(MemoryRegion *sysmem, uint32_t base)
+static void ref405ep_fpga_realize(DeviceState *dev, Error **errp)
 {
-    ref405ep_fpga_t *fpga;
-    MemoryRegion *fpga_memory = g_new(MemoryRegion, 1);
+    Ref405epFpgaState *s = REF405EP_FPGA(dev);
 
-    fpga = g_new0(ref405ep_fpga_t, 1);
-    memory_region_init_io(fpga_memory, NULL, &ref405ep_fpga_ops, fpga,
+    memory_region_init_io(&s->iomem, OBJECT(s), &ref405ep_fpga_ops, s,
                           "fpga", 0x00000100);
-    memory_region_add_subregion(sysmem, base, fpga_memory);
-    qemu_register_reset(&ref405ep_fpga_reset, fpga);
+    sysbus_init_mmio(SYS_BUS_DEVICE(s), &s->iomem);
+}
+
+static void ref405ep_fpga_class_init(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+
+    dc->realize = ref405ep_fpga_realize;
+    dc->reset = ref405ep_fpga_reset;
+    /* Reason: only works as part of a ppc405 board */
+    dc->user_creatable = false;
 }
 
+static const TypeInfo ref405ep_fpga_type = {
+    .name = TYPE_REF405EP_FPGA,
+    .parent = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(Ref405epFpgaState),
+    .class_init = ref405ep_fpga_class_init,
+};
+
 /*
  * CPU reset handler when booting directly from a loaded kernel
  */
@@ -331,7 +348,11 @@ static void ref405ep_init(MachineState *machine)
     memory_region_add_subregion(get_system_memory(), PPC405EP_SRAM_BASE, sram);
 
     /* Register FPGA */
-    ref405ep_fpga_init(get_system_memory(), PPC405EP_FPGA_BASE);
+    dev = qdev_new(TYPE_REF405EP_FPGA);
+    object_property_add_child(OBJECT(machine), "fpga", OBJECT(dev));
+    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
+    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, PPC405EP_FPGA_BASE);
+
     /* Register NVRAM */
     dev = qdev_new("sysbus-m48t08");
     qdev_prop_set_int32(dev, "base-year", 1968);
@@ -376,6 +397,7 @@ static void ppc405_machine_init(void)
 {
     type_register_static(&ppc405_machine_type);
     type_register_static(&ref405ep_type);
+    type_register_static(&ref405ep_fpga_type);
 }
 
 type_init(ppc405_machine_init)
-- 
2.30.4


