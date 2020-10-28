Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B62E229CEF7
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Oct 2020 09:26:27 +0100 (CET)
Received: from localhost ([::1]:42784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kXgmo-00048f-LO
	for lists+qemu-devel@lfdr.de; Wed, 28 Oct 2020 04:26:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kXgl2-0002q9-Nr
 for qemu-devel@nongnu.org; Wed, 28 Oct 2020 04:24:36 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:51664
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kXgl1-00047w-3d
 for qemu-devel@nongnu.org; Wed, 28 Oct 2020 04:24:36 -0400
Received: from host81-158-111-11.range81-158.btcentralplus.com
 ([81.158.111.11] helo=kentang.home)
 by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kXgl5-0006Q8-WD; Wed, 28 Oct 2020 08:24:43 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Date: Wed, 28 Oct 2020 08:23:50 +0000
Message-Id: <20201028082358.23761-3-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201028082358.23761-1-mark.cave-ayland@ilande.co.uk>
References: <20201028082358.23761-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 81.158.111.11
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PULL 02/10] sparc32-ledma: use object_initialize_child() for lance
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Store the child object directly within the sparc32-ledma object rather than
using link properties.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20200926140216.7368-3-mark.cave-ayland@ilande.co.uk>
Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/dma/sparc32_dma.c           | 14 ++++++++------
 include/hw/sparc/sparc32_dma.h |  2 +-
 2 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/hw/dma/sparc32_dma.c b/hw/dma/sparc32_dma.c
index b25a212f7a..84196afb95 100644
--- a/hw/dma/sparc32_dma.c
+++ b/hw/dma/sparc32_dma.c
@@ -331,24 +331,26 @@ static const TypeInfo sparc32_espdma_device_info = {
 static void sparc32_ledma_device_init(Object *obj)
 {
     DMADeviceState *s = SPARC32_DMA_DEVICE(obj);
+    LEDMADeviceState *ls = SPARC32_LEDMA_DEVICE(obj);
 
     memory_region_init_io(&s->iomem, OBJECT(s), &dma_mem_ops, s,
                           "ledma-mmio", DMA_SIZE);
+
+    object_initialize_child(obj, "lance", &ls->lance, TYPE_LANCE);
 }
 
 static void sparc32_ledma_device_realize(DeviceState *dev, Error **errp)
 {
-    DeviceState *d;
+    LEDMADeviceState *s = SPARC32_LEDMA_DEVICE(dev);
+    SysBusPCNetState *lance = SYSBUS_PCNET(&s->lance);
     NICInfo *nd = &nd_table[0];
 
     /* FIXME use qdev NIC properties instead of nd_table[] */
     qemu_check_nic_model(nd, TYPE_LANCE);
 
-    d = qdev_new(TYPE_LANCE);
-    object_property_add_child(OBJECT(dev), "lance", OBJECT(d));
-    qdev_set_nic_properties(d, nd);
-    object_property_set_link(OBJECT(d), "dma", OBJECT(dev), &error_abort);
-    sysbus_realize_and_unref(SYS_BUS_DEVICE(d), &error_fatal);
+    qdev_set_nic_properties(DEVICE(lance), nd);
+    object_property_set_link(OBJECT(lance), "dma", OBJECT(dev), &error_abort);
+    sysbus_realize(SYS_BUS_DEVICE(lance), &error_fatal);
 }
 
 static void sparc32_ledma_device_class_init(ObjectClass *klass, void *data)
diff --git a/include/hw/sparc/sparc32_dma.h b/include/hw/sparc/sparc32_dma.h
index 3348a725f0..80d69cbba2 100644
--- a/include/hw/sparc/sparc32_dma.h
+++ b/include/hw/sparc/sparc32_dma.h
@@ -37,7 +37,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(LEDMADeviceState, SPARC32_LEDMA_DEVICE)
 struct LEDMADeviceState {
     DMADeviceState parent_obj;
 
-    SysBusPCNetState *lance;
+    SysBusPCNetState lance;
 };
 
 #define TYPE_SPARC32_DMA "sparc32-dma"
-- 
2.20.1


