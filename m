Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21F953FB3E9
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Aug 2021 12:30:57 +0200 (CEST)
Received: from localhost ([::1]:60650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKeZ6-0005rX-76
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 06:30:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mKeU8-0005re-Sh
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 06:25:49 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:53328
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mKeU4-0007Op-Ck
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 06:25:48 -0400
Received: from host86-179-186-93.range86-179.btcentralplus.com
 ([86.179.186.93] helo=kentang.home)
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mKeTW-0003D2-9t; Mon, 30 Aug 2021 11:25:15 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org,
	laurent@vivier.eu
Date: Mon, 30 Aug 2021 11:24:43 +0100
Message-Id: <20210830102447.10806-9-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210830102447.10806-1-mark.cave-ayland@ilande.co.uk>
References: <20210830102447.10806-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.179.186.93
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 08/12] mac_via: move VIA1 realize logic from mac_via_realize()
 to mos6522_q800_via1_realize()
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

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/misc/mac_via.c | 86 ++++++++++++++++++++++++-----------------------
 1 file changed, 44 insertions(+), 42 deletions(-)

diff --git a/hw/misc/mac_via.c b/hw/misc/mac_via.c
index a2df17d9be..bb8d682ce9 100644
--- a/hw/misc/mac_via.c
+++ b/hw/misc/mac_via.c
@@ -948,11 +948,7 @@ static const MemoryRegionOps mos6522_q800_via2_ops = {
 static void mac_via_realize(DeviceState *dev, Error **errp)
 {
     MacVIAState *m = MAC_VIA(dev);
-    MOS6522Q800VIA1State *v1s = &m->mos6522_via1;
     MOS6522State *ms;
-    ADBBusState *adb_bus = &v1s->adb_bus;
-    struct tm tm;
-    int ret;
 
     /* Pass through mos6522 output IRQs */
     ms = MOS6522(&m->mos6522_via1);
@@ -968,44 +964,6 @@ static void mac_via_realize(DeviceState *dev, Error **errp)
     /* Pass through mos6522 input IRQs */
     qdev_pass_gpios(DEVICE(&m->mos6522_via1), dev, "via1-irq");
     qdev_pass_gpios(DEVICE(&m->mos6522_via2), dev, "via2-irq");
-
-    /* VIA 1 */
-    m->mos6522_via1.one_second_timer = timer_new_ms(QEMU_CLOCK_VIRTUAL,
-                                                     via1_one_second,
-                                                     &m->mos6522_via1);
-    via1_one_second_update(&m->mos6522_via1);
-    m->mos6522_via1.sixty_hz_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL,
-                                                  via1_sixty_hz,
-                                                  &m->mos6522_via1);
-    via1_sixty_hz_update(&m->mos6522_via1);
-
-    qemu_get_timedate(&tm, 0);
-    v1s->tick_offset = (uint32_t)mktimegm(&tm) + RTC_OFFSET;
-
-    adb_register_autopoll_callback(adb_bus, adb_via_poll, v1s);
-    v1s->adb_data_ready = qdev_get_gpio_in_named(dev, "via1-irq",
-                                                 VIA1_IRQ_ADB_READY_BIT);
-
-    if (v1s->blk) {
-        int64_t len = blk_getlength(v1s->blk);
-        if (len < 0) {
-            error_setg_errno(errp, -len,
-                             "could not get length of backing image");
-            return;
-        }
-        ret = blk_set_perm(v1s->blk,
-                           BLK_PERM_CONSISTENT_READ | BLK_PERM_WRITE,
-                           BLK_PERM_ALL, errp);
-        if (ret < 0) {
-            return;
-        }
-
-        len = blk_pread(v1s->blk, 0, v1s->PRAM, sizeof(v1s->PRAM));
-        if (len != sizeof(v1s->PRAM)) {
-            error_setg(errp, "can't read PRAM contents");
-            return;
-        }
-    }
 }
 
 static void mac_via_init(Object *obj)
@@ -1091,6 +1049,49 @@ static void mos6522_q800_via1_reset(DeviceState *dev)
     v1s->alt = REG_EMPTY;
 }
 
+static void mos6522_q800_via1_realize(DeviceState *dev, Error **errp)
+{
+    MOS6522Q800VIA1State *v1s = MOS6522_Q800_VIA1(dev);
+    ADBBusState *adb_bus = &v1s->adb_bus;
+    struct tm tm;
+    int ret;
+
+    v1s->one_second_timer = timer_new_ms(QEMU_CLOCK_VIRTUAL, via1_one_second,
+                                         v1s);
+    via1_one_second_update(v1s);
+    v1s->sixty_hz_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, via1_sixty_hz,
+                                       v1s);
+    via1_sixty_hz_update(v1s);
+
+    qemu_get_timedate(&tm, 0);
+    v1s->tick_offset = (uint32_t)mktimegm(&tm) + RTC_OFFSET;
+
+    adb_register_autopoll_callback(adb_bus, adb_via_poll, v1s);
+    v1s->adb_data_ready = qdev_get_gpio_in_named(dev, "via1-irq",
+                                                 VIA1_IRQ_ADB_READY_BIT);
+
+    if (v1s->blk) {
+        int64_t len = blk_getlength(v1s->blk);
+        if (len < 0) {
+            error_setg_errno(errp, -len,
+                             "could not get length of backing image");
+            return;
+        }
+        ret = blk_set_perm(v1s->blk,
+                           BLK_PERM_CONSISTENT_READ | BLK_PERM_WRITE,
+                           BLK_PERM_ALL, errp);
+        if (ret < 0) {
+            return;
+        }
+
+        len = blk_pread(v1s->blk, 0, v1s->PRAM, sizeof(v1s->PRAM));
+        if (len != sizeof(v1s->PRAM)) {
+            error_setg(errp, "can't read PRAM contents");
+            return;
+        }
+    }
+}
+
 static void mos6522_q800_via1_init(Object *obj)
 {
     MOS6522Q800VIA1State *v1s = MOS6522_Q800_VIA1(obj);
@@ -1147,6 +1148,7 @@ static void mos6522_q800_via1_class_init(ObjectClass *oc, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(oc);
 
+    dc->realize = mos6522_q800_via1_realize;
     dc->reset = mos6522_q800_via1_reset;
     dc->vmsd = &vmstate_q800_via1;
     device_class_set_props(dc, mos6522_q800_via1_properties);
-- 
2.20.1


