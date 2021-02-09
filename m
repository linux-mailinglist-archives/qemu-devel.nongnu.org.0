Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 130033156EE
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 20:40:11 +0100 (CET)
Received: from localhost ([::1]:40242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Yrq-0004kf-1b
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 14:40:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1l9Yio-0003k7-PD
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 14:30:50 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:56744
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1l9Yie-00020l-8p
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 14:30:49 -0500
Received: from host109-153-84-1.range109-153.btcentralplus.com ([109.153.84.1]
 helo=kentang.home) by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1l9Yix-0007pt-03; Tue, 09 Feb 2021 19:31:03 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org, pbonzini@redhat.com, fam@euphon.net,
 laurent@vivier.eu
Date: Tue,  9 Feb 2021 19:29:38 +0000
Message-Id: <20210209193018.31339-3-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210209193018.31339-1-mark.cave-ayland@ilande.co.uk>
References: <20210209193018.31339-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 109.153.84.1
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 02/42] esp: rename existing ESP QOM type to SYSBUS_ESP
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.uk0.bigv.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.uk0.bigv.io
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

The existing ESP QOM type currently represents a sysbus device with an embedded
ESP state. Rename the type to SYSBUS_ESP accordingly.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/dma/sparc32_dma.c  | 4 ++--
 hw/m68k/q800.c        | 4 ++--
 hw/mips/jazz.c        | 4 ++--
 hw/scsi/esp.c         | 8 ++++----
 hw/sparc/sun4m.c      | 2 +-
 include/hw/scsi/esp.h | 4 ++--
 6 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/hw/dma/sparc32_dma.c b/hw/dma/sparc32_dma.c
index b643b413c5..03bc500878 100644
--- a/hw/dma/sparc32_dma.c
+++ b/hw/dma/sparc32_dma.c
@@ -295,13 +295,13 @@ static void sparc32_espdma_device_init(Object *obj)
     memory_region_init_io(&s->iomem, OBJECT(s), &dma_mem_ops, s,
                           "espdma-mmio", DMA_SIZE);
 
-    object_initialize_child(obj, "esp", &es->esp, TYPE_ESP);
+    object_initialize_child(obj, "esp", &es->esp, TYPE_SYSBUS_ESP);
 }
 
 static void sparc32_espdma_device_realize(DeviceState *dev, Error **errp)
 {
     ESPDMADeviceState *es = SPARC32_ESPDMA_DEVICE(dev);
-    SysBusESPState *sysbus = ESP(&es->esp);
+    SysBusESPState *sysbus = SYSBUS_ESP(&es->esp);
     ESPState *esp = &sysbus->esp;
 
     esp->dma_memory_read = espdma_memory_read;
diff --git a/hw/m68k/q800.c b/hw/m68k/q800.c
index 2af0e2532e..af54d509ff 100644
--- a/hw/m68k/q800.c
+++ b/hw/m68k/q800.c
@@ -356,8 +356,8 @@ static void q800_init(MachineState *machine)
 
     /* SCSI */
 
-    dev = qdev_new(TYPE_ESP);
-    sysbus_esp = ESP(dev);
+    dev = qdev_new(TYPE_SYSBUS_ESP);
+    sysbus_esp = SYSBUS_ESP(dev);
     esp = &sysbus_esp->esp;
     esp->dma_memory_read = NULL;
     esp->dma_memory_write = NULL;
diff --git a/hw/mips/jazz.c b/hw/mips/jazz.c
index 83c8086062..1a0888a0fd 100644
--- a/hw/mips/jazz.c
+++ b/hw/mips/jazz.c
@@ -328,8 +328,8 @@ static void mips_jazz_init(MachineState *machine,
     }
 
     /* SCSI adapter */
-    dev = qdev_new(TYPE_ESP);
-    sysbus_esp = ESP(dev);
+    dev = qdev_new(TYPE_SYSBUS_ESP);
+    sysbus_esp = SYSBUS_ESP(dev);
     esp = &sysbus_esp->esp;
     esp->dma_memory_read = rc4030_dma_read;
     esp->dma_memory_write = rc4030_dma_write;
diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
index 7073166ad1..aa38acc660 100644
--- a/hw/scsi/esp.c
+++ b/hw/scsi/esp.c
@@ -939,7 +939,7 @@ static const struct SCSIBusInfo esp_scsi_info = {
 
 static void sysbus_esp_gpio_demux(void *opaque, int irq, int level)
 {
-    SysBusESPState *sysbus = ESP(opaque);
+    SysBusESPState *sysbus = SYSBUS_ESP(opaque);
     ESPState *s = &sysbus->esp;
 
     switch (irq) {
@@ -955,7 +955,7 @@ static void sysbus_esp_gpio_demux(void *opaque, int irq, int level)
 static void sysbus_esp_realize(DeviceState *dev, Error **errp)
 {
     SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
-    SysBusESPState *sysbus = ESP(dev);
+    SysBusESPState *sysbus = SYSBUS_ESP(dev);
     ESPState *s = &sysbus->esp;
 
     sysbus_init_irq(sbd, &s->irq);
@@ -977,7 +977,7 @@ static void sysbus_esp_realize(DeviceState *dev, Error **errp)
 
 static void sysbus_esp_hard_reset(DeviceState *dev)
 {
-    SysBusESPState *sysbus = ESP(dev);
+    SysBusESPState *sysbus = SYSBUS_ESP(dev);
     esp_hard_reset(&sysbus->esp);
 }
 
@@ -1002,7 +1002,7 @@ static void sysbus_esp_class_init(ObjectClass *klass, void *data)
 }
 
 static const TypeInfo sysbus_esp_info = {
-    .name          = TYPE_ESP,
+    .name          = TYPE_SYSBUS_ESP,
     .parent        = TYPE_SYS_BUS_DEVICE,
     .instance_size = sizeof(SysBusESPState),
     .class_init    = sysbus_esp_class_init,
diff --git a/hw/sparc/sun4m.c b/hw/sparc/sun4m.c
index 38ca1e33c7..312e2afaf9 100644
--- a/hw/sparc/sun4m.c
+++ b/hw/sparc/sun4m.c
@@ -334,7 +334,7 @@ static void *sparc32_dma_init(hwaddr dma_base,
                                    OBJECT(dma), "espdma"));
     sysbus_connect_irq(SYS_BUS_DEVICE(espdma), 0, espdma_irq);
 
-    esp = ESP(object_resolve_path_component(OBJECT(espdma), "esp"));
+    esp = SYSBUS_ESP(object_resolve_path_component(OBJECT(espdma), "esp"));
 
     ledma = SPARC32_LEDMA_DEVICE(object_resolve_path_component(
                                  OBJECT(dma), "ledma"));
diff --git a/include/hw/scsi/esp.h b/include/hw/scsi/esp.h
index 60cc3047a5..9694825e71 100644
--- a/include/hw/scsi/esp.h
+++ b/include/hw/scsi/esp.h
@@ -65,8 +65,8 @@ struct ESPState {
     void (*pdma_cb)(ESPState *s);
 };
 
-#define TYPE_ESP "esp"
-OBJECT_DECLARE_SIMPLE_TYPE(SysBusESPState, ESP)
+#define TYPE_SYSBUS_ESP "sysbus-esp"
+OBJECT_DECLARE_SIMPLE_TYPE(SysBusESPState, SYSBUS_ESP)
 
 struct SysBusESPState {
     /*< private >*/
-- 
2.20.1


