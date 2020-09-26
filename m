Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C4392799F7
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Sep 2020 16:07:58 +0200 (CEST)
Received: from localhost ([::1]:58760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kMArl-0002z2-2Y
	for lists+qemu-devel@lfdr.de; Sat, 26 Sep 2020 10:07:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kMAmi-00065y-D8; Sat, 26 Sep 2020 10:02:44 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:41408
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kMAmg-0005Fj-IM; Sat, 26 Sep 2020 10:02:44 -0400
Received: from host86-184-131-21.range86-184.btcentralplus.com
 ([86.184.131.21] helo=kentang.home)
 by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kMAnF-0001Y4-Sm; Sat, 26 Sep 2020 15:03:22 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: armbru@redhat.com, david@gibson.dropbear.id.au, atar4qemu@gmail.com,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Date: Sat, 26 Sep 2020 15:02:13 +0100
Message-Id: <20200926140216.7368-4-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200926140216.7368-1-mark.cave-ayland@ilande.co.uk>
References: <20200926140216.7368-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.184.131.21
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 3/6] sparc32-espdma: use object_initialize_child() for esp
 child object
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

Store the child object directly within the sparc32-espdma object rather than
using link properties.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/dma/sparc32_dma.c           | 17 ++++++++---------
 include/hw/sparc/sparc32_dma.h |  2 +-
 2 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/hw/dma/sparc32_dma.c b/hw/dma/sparc32_dma.c
index 84196afb95..2cbe331959 100644
--- a/hw/dma/sparc32_dma.c
+++ b/hw/dma/sparc32_dma.c
@@ -290,27 +290,26 @@ static const TypeInfo sparc32_dma_device_info = {
 static void sparc32_espdma_device_init(Object *obj)
 {
     DMADeviceState *s = SPARC32_DMA_DEVICE(obj);
+    ESPDMADeviceState *es = SPARC32_ESPDMA_DEVICE(obj);
 
     memory_region_init_io(&s->iomem, OBJECT(s), &dma_mem_ops, s,
                           "espdma-mmio", DMA_SIZE);
+
+    object_initialize_child(obj, "esp", &es->esp, TYPE_ESP);
 }
 
 static void sparc32_espdma_device_realize(DeviceState *dev, Error **errp)
 {
-    DeviceState *d;
-    SysBusESPState *sysbus;
-    ESPState *esp;
-
-    d = qdev_new(TYPE_ESP);
-    object_property_add_child(OBJECT(dev), "esp", OBJECT(d));
-    sysbus = ESP(d);
-    esp = &sysbus->esp;
+    ESPDMADeviceState *es = SPARC32_ESPDMA_DEVICE(dev);
+    SysBusESPState *sysbus = ESP(&es->esp);
+    ESPState *esp = &sysbus->esp;
+
     esp->dma_memory_read = espdma_memory_read;
     esp->dma_memory_write = espdma_memory_write;
     esp->dma_opaque = SPARC32_DMA_DEVICE(dev);
     sysbus->it_shift = 2;
     esp->dma_enabled = 1;
-    sysbus_realize_and_unref(SYS_BUS_DEVICE(d), &error_fatal);
+    sysbus_realize(SYS_BUS_DEVICE(sysbus), &error_fatal);
 }
 
 static void sparc32_espdma_device_class_init(ObjectClass *klass, void *data)
diff --git a/include/hw/sparc/sparc32_dma.h b/include/hw/sparc/sparc32_dma.h
index 80d69cbba2..cde8ec02cb 100644
--- a/include/hw/sparc/sparc32_dma.h
+++ b/include/hw/sparc/sparc32_dma.h
@@ -28,7 +28,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(ESPDMADeviceState, SPARC32_ESPDMA_DEVICE)
 struct ESPDMADeviceState {
     DMADeviceState parent_obj;
 
-    SysBusESPState *esp;
+    SysBusESPState esp;
 };
 
 #define TYPE_SPARC32_LEDMA_DEVICE "sparc32-ledma"
-- 
2.20.1


