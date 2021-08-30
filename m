Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 045E83FB3F0
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Aug 2021 12:34:19 +0200 (CEST)
Received: from localhost ([::1]:39534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKecC-0002X8-2J
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 06:34:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mKeUC-00060C-Gr
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 06:25:52 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:53340
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mKeU6-0007bp-RP
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 06:25:52 -0400
Received: from host86-179-186-93.range86-179.btcentralplus.com
 ([86.179.186.93] helo=kentang.home)
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mKeTg-0003D2-QM; Mon, 30 Aug 2021 11:25:25 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org,
	laurent@vivier.eu
Date: Mon, 30 Aug 2021 11:24:45 +0100
Message-Id: <20210830102447.10806-11-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210830102447.10806-1-mark.cave-ayland@ilande.co.uk>
References: <20210830102447.10806-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.179.186.93
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 10/12] mac_via: remove explicit viaN prefix from VIA IRQ gpios
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

Now that q800 VIA1 and VIA2 are completely separate devices there is no need to
add a specific device prefix to ensure that the IRQ lines remain separate.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/m68k/q800.c    | 10 ++++------
 hw/misc/mac_via.c |  9 +++------
 2 files changed, 7 insertions(+), 12 deletions(-)

diff --git a/hw/m68k/q800.c b/hw/m68k/q800.c
index ec28e69802..5ba87f789c 100644
--- a/hw/m68k/q800.c
+++ b/hw/m68k/q800.c
@@ -377,12 +377,10 @@ static void q800_init(MachineState *machine)
 
     sysbus = SYS_BUS_DEVICE(dev);
     sysbus_realize_and_unref(sysbus, &error_fatal);
-    sysbus_connect_irq(sysbus, 0, qdev_get_gpio_in_named(via2_dev,
-                                                         "via2-irq",
-                                                         VIA2_IRQ_SCSI_BIT));
-    sysbus_connect_irq(sysbus, 1,
-                       qdev_get_gpio_in_named(via2_dev, "via2-irq",
-                                              VIA2_IRQ_SCSI_DATA_BIT));
+    sysbus_connect_irq(sysbus, 0, qdev_get_gpio_in(via2_dev,
+                                                   VIA2_IRQ_SCSI_BIT));
+    sysbus_connect_irq(sysbus, 1, qdev_get_gpio_in(via2_dev,
+                                                   VIA2_IRQ_SCSI_DATA_BIT));
     sysbus_mmio_map(sysbus, 0, ESP_BASE);
     sysbus_mmio_map(sysbus, 1, ESP_PDMA);
 
diff --git a/hw/misc/mac_via.c b/hw/misc/mac_via.c
index 7b9f067e71..f093f7388e 100644
--- a/hw/misc/mac_via.c
+++ b/hw/misc/mac_via.c
@@ -1004,8 +1004,7 @@ static void mos6522_q800_via1_realize(DeviceState *dev, Error **errp)
     v1s->tick_offset = (uint32_t)mktimegm(&tm) + RTC_OFFSET;
 
     adb_register_autopoll_callback(adb_bus, adb_via_poll, v1s);
-    v1s->adb_data_ready = qdev_get_gpio_in_named(dev, "via1-irq",
-                                                 VIA1_IRQ_ADB_READY_BIT);
+    v1s->adb_data_ready = qdev_get_gpio_in(dev, VIA1_IRQ_ADB_READY_BIT);
 
     if (v1s->blk) {
         int64_t len = blk_getlength(v1s->blk);
@@ -1042,8 +1041,7 @@ static void mos6522_q800_via1_init(Object *obj)
     qbus_create_inplace((BusState *)&v1s->adb_bus, sizeof(v1s->adb_bus),
                         TYPE_ADB_BUS, DEVICE(v1s), "adb.0");
 
-    qdev_init_gpio_in_named(DEVICE(obj), via1_irq_request, "via1-irq",
-                            VIA1_IRQ_NB);
+    qdev_init_gpio_in(DEVICE(obj), via1_irq_request, VIA1_IRQ_NB);
 }
 
 static const VMStateDescription vmstate_q800_via1 = {
@@ -1136,8 +1134,7 @@ static void mos6522_q800_via2_init(Object *obj)
                           "via2", VIA_SIZE);
     sysbus_init_mmio(sbd, &v2s->via_mem);
 
-    qdev_init_gpio_in_named(DEVICE(obj), via2_irq_request, "via2-irq",
-                            VIA2_IRQ_NB);
+    qdev_init_gpio_in(DEVICE(obj), via2_irq_request, VIA2_IRQ_NB);
 }
 
 static const VMStateDescription vmstate_q800_via2 = {
-- 
2.20.1


