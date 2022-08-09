Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8405858DB8D
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Aug 2022 18:04:12 +0200 (CEST)
Received: from localhost ([::1]:44812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLRiF-00019P-Kr
	for lists+qemu-devel@lfdr.de; Tue, 09 Aug 2022 12:04:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=uImW=YN=kaod.org=clg@ozlabs.org>)
 id 1oLRKv-0004iI-Ef; Tue, 09 Aug 2022 11:40:05 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]:51723
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=uImW=YN=kaod.org=clg@ozlabs.org>)
 id 1oLRKs-0004SK-1X; Tue, 09 Aug 2022 11:40:04 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4M2HM509j9z4xVR;
 Wed, 10 Aug 2022 01:40:01 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4M2HM270W2z4xTv;
 Wed, 10 Aug 2022 01:39:58 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org,
 BALATON Zoltan <balaton@eik.bme.hu>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH v4 19/24] ppc/ppc405: QOM'ify FPGA
Date: Tue,  9 Aug 2022 17:38:59 +0200
Message-Id: <20220809153904.485018-20-clg@kaod.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220809153904.485018-1-clg@kaod.org>
References: <20220809153904.485018-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=uImW=YN=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/ppc/ppc405_boards.c | 55 +++++++++++++++++++++++++++++-------------
 1 file changed, 38 insertions(+), 17 deletions(-)

diff --git a/hw/ppc/ppc405_boards.c b/hw/ppc/ppc405_boards.c
index 3677793adc75..4ff6715f3533 100644
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
+    Ref405epFpgaState *fpga = REF405EP_FPGA(opaque);
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
+    Ref405epFpgaState *fpga = REF405EP_FPGA(opaque);
 
-    fpga = opaque;
     switch (addr) {
     case 0x0:
         /* Read only */
@@ -126,27 +130,39 @@ static const MemoryRegionOps ref405ep_fpga_ops = {
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
+    dc->user_creatable = false;
+    dc->reset = ref405ep_fpga_reset;
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
@@ -331,7 +347,11 @@ static void ref405ep_init(MachineState *machine)
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
@@ -376,6 +396,7 @@ static void ppc405_machine_init(void)
 {
     type_register_static(&ppc405_machine_type);
     type_register_static(&ref405ep_type);
+    type_register_static(&ref405ep_fpga_type);
 }
 
 type_init(ppc405_machine_init)
-- 
2.37.1


