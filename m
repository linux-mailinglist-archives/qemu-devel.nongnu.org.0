Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8F3E2799EF
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Sep 2020 16:04:47 +0200 (CEST)
Received: from localhost ([::1]:50434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kMAog-0007pp-Qq
	for lists+qemu-devel@lfdr.de; Sat, 26 Sep 2020 10:04:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kMAmh-000635-A0; Sat, 26 Sep 2020 10:02:43 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:41404
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kMAmf-0005Fc-ET; Sat, 26 Sep 2020 10:02:42 -0400
Received: from host86-184-131-21.range86-184.btcentralplus.com
 ([86.184.131.21] helo=kentang.home)
 by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kMAn5-0001Y4-L3; Sat, 26 Sep 2020 15:03:12 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: armbru@redhat.com, david@gibson.dropbear.id.au, atar4qemu@gmail.com,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Date: Sat, 26 Sep 2020 15:02:11 +0100
Message-Id: <20200926140216.7368-2-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200926140216.7368-1-mark.cave-ayland@ilande.co.uk>
References: <20200926140216.7368-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.184.131.21
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 1/6] sparc32-dma: use object_initialize_child() for espdma
 and ledma child objects
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.uk0.bigv.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.uk0.bigv.io
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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

Store the child objects directly within the sparc32-dma object rather than using
link properties.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/dma/sparc32_dma.c           | 15 +++++++++------
 include/hw/sparc/sparc32_dma.h |  4 ++--
 2 files changed, 11 insertions(+), 8 deletions(-)

diff --git a/hw/dma/sparc32_dma.c b/hw/dma/sparc32_dma.c
index d20a5bc065..b25a212f7a 100644
--- a/hw/dma/sparc32_dma.c
+++ b/hw/dma/sparc32_dma.c
@@ -379,10 +379,9 @@ static void sparc32_dma_realize(DeviceState *dev, Error **errp)
         return;
     }
 
-    espdma = qdev_new(TYPE_SPARC32_ESPDMA_DEVICE);
+    espdma = DEVICE(&s->espdma);
     object_property_set_link(OBJECT(espdma), "iommu", iommu, &error_abort);
-    object_property_add_child(OBJECT(s), "espdma", OBJECT(espdma));
-    sysbus_realize_and_unref(SYS_BUS_DEVICE(espdma), &error_fatal);
+    sysbus_realize(SYS_BUS_DEVICE(espdma), &error_fatal);
 
     esp = DEVICE(object_resolve_path_component(OBJECT(espdma), "esp"));
     sbd = SYS_BUS_DEVICE(esp);
@@ -394,10 +393,9 @@ static void sparc32_dma_realize(DeviceState *dev, Error **errp)
     memory_region_add_subregion(&s->dmamem, 0x0,
                                 sysbus_mmio_get_region(sbd, 0));
 
-    ledma = qdev_new(TYPE_SPARC32_LEDMA_DEVICE);
+    ledma = DEVICE(&s->ledma);
     object_property_set_link(OBJECT(ledma), "iommu", iommu, &error_abort);
-    object_property_add_child(OBJECT(s), "ledma", OBJECT(ledma));
-    sysbus_realize_and_unref(SYS_BUS_DEVICE(ledma), &error_fatal);
+    sysbus_realize(SYS_BUS_DEVICE(ledma), &error_fatal);
 
     lance = DEVICE(object_resolve_path_component(OBJECT(ledma), "lance"));
     sbd = SYS_BUS_DEVICE(lance);
@@ -421,6 +419,11 @@ static void sparc32_dma_init(Object *obj)
 
     memory_region_init(&s->dmamem, OBJECT(s), "dma", DMA_SIZE + DMA_ETH_SIZE);
     sysbus_init_mmio(sbd, &s->dmamem);
+
+    object_initialize_child(obj, "espdma", &s->espdma,
+                            TYPE_SPARC32_ESPDMA_DEVICE);
+    object_initialize_child(obj, "ledma", &s->ledma,
+                            TYPE_SPARC32_LEDMA_DEVICE);
 }
 
 static void sparc32_dma_class_init(ObjectClass *klass, void *data)
diff --git a/include/hw/sparc/sparc32_dma.h b/include/hw/sparc/sparc32_dma.h
index e650489414..3348a725f0 100644
--- a/include/hw/sparc/sparc32_dma.h
+++ b/include/hw/sparc/sparc32_dma.h
@@ -48,8 +48,8 @@ struct SPARC32DMAState {
 
     MemoryRegion dmamem;
     MemoryRegion ledma_alias;
-    ESPDMADeviceState *espdma;
-    LEDMADeviceState *ledma;
+    ESPDMADeviceState espdma;
+    LEDMADeviceState ledma;
 };
 
 /* sparc32_dma.c */
-- 
2.20.1


