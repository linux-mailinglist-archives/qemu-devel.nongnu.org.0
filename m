Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 662AF407C58
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Sep 2021 10:04:30 +0200 (CEST)
Received: from localhost ([::1]:37218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPKTV-0002Ei-Na
	for lists+qemu-devel@lfdr.de; Sun, 12 Sep 2021 04:04:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mPKG6-0003ev-Kq
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 03:50:40 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:35090
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mPKG2-00030I-9G
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 03:50:38 -0400
Received: from host109-153-76-56.range109-153.btcentralplus.com
 ([109.153.76.56] helo=kentang.home)
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mPKFf-00034U-7f; Sun, 12 Sep 2021 08:50:15 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org,
	laurent@vivier.eu
Date: Sun, 12 Sep 2021 08:49:12 +0100
Message-Id: <20210912074914.22048-19-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210912074914.22048-1-mark.cave-ayland@ilande.co.uk>
References: <20210912074914.22048-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 109.153.76.56
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 18/20] nubus: add support for slot IRQs
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
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

Each Nubus slot has an IRQ line that can be used to request service from the
CPU. Connect the IRQs to the Nubus bridge so that they can be wired up using qdev
gpios accordingly, and introduce a new nubus_set_irq() function that can be used
by Nubus devices to control the slot IRQ.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/nubus/nubus-bridge.c  | 2 ++
 hw/nubus/nubus-device.c  | 8 ++++++++
 include/hw/nubus/nubus.h | 6 ++++++
 3 files changed, 16 insertions(+)

diff --git a/hw/nubus/nubus-bridge.c b/hw/nubus/nubus-bridge.c
index 2c7c4ee121..0366d925a9 100644
--- a/hw/nubus/nubus-bridge.c
+++ b/hw/nubus/nubus-bridge.c
@@ -19,6 +19,8 @@ static void nubus_bridge_init(Object *obj)
     NubusBus *bus = &s->bus;
 
     qbus_create_inplace(bus, sizeof(s->bus), TYPE_NUBUS_BUS, DEVICE(s), NULL);
+
+    qdev_init_gpio_out(DEVICE(s), bus->irqs, NUBUS_IRQS);
 }
 
 static Property nubus_bridge_properties[] = {
diff --git a/hw/nubus/nubus-device.c b/hw/nubus/nubus-device.c
index f316eb7789..67ab281943 100644
--- a/hw/nubus/nubus-device.c
+++ b/hw/nubus/nubus-device.c
@@ -10,12 +10,20 @@
 
 #include "qemu/osdep.h"
 #include "qemu/datadir.h"
+#include "hw/irq.h"
 #include "hw/loader.h"
 #include "hw/nubus/nubus.h"
 #include "qapi/error.h"
 #include "qemu/error-report.h"
 
 
+void nubus_set_irq(NubusDevice *nd, int level)
+{
+    NubusBus *nubus = NUBUS_BUS(qdev_get_parent_bus(DEVICE(nd)));
+
+    qemu_set_irq(nubus->irqs[nd->slot], level);
+}
+
 static void nubus_device_realize(DeviceState *dev, Error **errp)
 {
     NubusBus *nubus = NUBUS_BUS(qdev_get_parent_bus(dev));
diff --git a/include/hw/nubus/nubus.h b/include/hw/nubus/nubus.h
index 503ebf0c1c..2b9c4c77ac 100644
--- a/include/hw/nubus/nubus.h
+++ b/include/hw/nubus/nubus.h
@@ -24,6 +24,8 @@
 #define NUBUS_FIRST_SLOT      0x0
 #define NUBUS_LAST_SLOT       0xf
 
+#define NUBUS_IRQS            16
+
 #define TYPE_NUBUS_DEVICE "nubus-device"
 OBJECT_DECLARE_SIMPLE_TYPE(NubusDevice, NUBUS_DEVICE)
 
@@ -43,6 +45,8 @@ struct NubusBus {
     MemoryRegion slot_io;
 
     uint32_t slot_available_mask;
+
+    qemu_irq irqs[NUBUS_IRQS];
 };
 
 #define NUBUS_DECL_ROM_MAX_SIZE    0xffff
@@ -58,6 +62,8 @@ struct NubusDevice {
     MemoryRegion decl_rom;
 };
 
+void nubus_set_irq(NubusDevice *nd, int level);
+
 struct NubusBridge {
     SysBusDevice parent_obj;
 
-- 
2.20.1


