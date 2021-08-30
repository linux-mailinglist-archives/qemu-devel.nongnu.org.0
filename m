Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28CB13FB3D9
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Aug 2021 12:28:24 +0200 (CEST)
Received: from localhost ([::1]:52108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKeWY-00006i-6x
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 06:28:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mKeTj-0005hq-4O
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 06:25:24 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:53298
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mKeTb-00075j-CO
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 06:25:21 -0400
Received: from host86-179-186-93.range86-179.btcentralplus.com
 ([86.179.186.93] helo=kentang.home)
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mKeT8-0003D2-2v; Mon, 30 Aug 2021 11:24:51 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org,
	laurent@vivier.eu
Date: Mon, 30 Aug 2021 11:24:38 +0100
Message-Id: <20210830102447.10806-4-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210830102447.10806-1-mark.cave-ayland@ilande.co.uk>
References: <20210830102447.10806-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.179.186.93
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 03/12] mac_via: move PRAM contents and block backend to
 MOS6522Q800VIA1State
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) SPF_HELO_NONE=0.001,
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

The PRAM contents are accessed using clock and data pins on q800 VIA1 port B
and so can be moved to MOS6522Q800VIA1State.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/misc/mac_via.c         | 59 ++++++++++++++++++++-------------------
 include/hw/misc/mac_via.h |  7 +++--
 2 files changed, 34 insertions(+), 32 deletions(-)

diff --git a/hw/misc/mac_via.c b/hw/misc/mac_via.c
index 6fb0b9391d..abbe99af11 100644
--- a/hw/misc/mac_via.c
+++ b/hw/misc/mac_via.c
@@ -374,11 +374,10 @@ static void via2_irq_request(void *opaque, int irq, int level)
 }
 
 
-static void pram_update(MacVIAState *m)
+static void pram_update(MOS6522Q800VIA1State *v1s)
 {
-    if (m->blk) {
-        if (blk_pwrite(m->blk, 0, m->mos6522_via1.PRAM,
-                       sizeof(m->mos6522_via1.PRAM), 0) < 0) {
+    if (v1s->blk) {
+        if (blk_pwrite(v1s->blk, 0, v1s->PRAM, sizeof(v1s->PRAM), 0) < 0) {
             qemu_log("pram_update: cannot write to file\n");
         }
     }
@@ -556,7 +555,7 @@ static void via1_rtc_update(MacVIAState *m)
             /* PRAM address 0x00 -> 0x13 */
             trace_via1_rtc_cmd_pram_write(m->cmd - REG_PRAM_ADDR, m->data_out);
             v1s->PRAM[m->cmd - REG_PRAM_ADDR] = m->data_out;
-            pram_update(m);
+            pram_update(v1s);
             m->cmd = REG_EMPTY;
             break;
         case REG_PRAM_SECT...REG_PRAM_SECT_LAST:
@@ -587,7 +586,7 @@ static void via1_rtc_update(MacVIAState *m)
     g_assert(REG_PRAM_SECT <= m->cmd && m->cmd <= REG_PRAM_SECT_LAST);
     sector = m->cmd - REG_PRAM_SECT;
     v1s->PRAM[sector * 32 + m->alt] = m->data_out;
-    pram_update(m);
+    pram_update(v1s);
     trace_via1_rtc_cmd_pram_sect_write(sector, m->alt, sector * 32 + m->alt,
                                        m->data_out);
     m->alt = REG_EMPTY;
@@ -965,6 +964,7 @@ static void mac_via_reset(DeviceState *dev)
 static void mac_via_realize(DeviceState *dev, Error **errp)
 {
     MacVIAState *m = MAC_VIA(dev);
+    MOS6522Q800VIA1State *v1s = &m->mos6522_via1;
     MOS6522State *ms;
     ADBBusState *adb_bus = &m->adb_bus;
     struct tm tm;
@@ -1009,23 +1009,22 @@ static void mac_via_realize(DeviceState *dev, Error **errp)
     m->adb_data_ready = qdev_get_gpio_in_named(dev, "via1-irq",
                                                VIA1_IRQ_ADB_READY_BIT);
 
-    if (m->blk) {
-        int64_t len = blk_getlength(m->blk);
+    if (v1s->blk) {
+        int64_t len = blk_getlength(v1s->blk);
         if (len < 0) {
             error_setg_errno(errp, -len,
                              "could not get length of backing image");
             return;
         }
-        ret = blk_set_perm(m->blk,
+        ret = blk_set_perm(v1s->blk,
                            BLK_PERM_CONSISTENT_READ | BLK_PERM_WRITE,
                            BLK_PERM_ALL, errp);
         if (ret < 0) {
             return;
         }
 
-        len = blk_pread(m->blk, 0, m->mos6522_via1.PRAM,
-                        sizeof(m->mos6522_via1.PRAM));
-        if (len != sizeof(m->mos6522_via1.PRAM)) {
+        len = blk_pread(v1s->blk, 0, v1s->PRAM, sizeof(v1s->PRAM));
+        if (len != sizeof(v1s->PRAM)) {
             error_setg(errp, "can't read PRAM contents");
             return;
         }
@@ -1054,23 +1053,23 @@ static void mac_via_init(Object *obj)
                         TYPE_ADB_BUS, DEVICE(obj), "adb.0");
 }
 
-static void postload_update_cb(void *opaque, bool running, RunState state)
+static void via1_postload_update_cb(void *opaque, bool running, RunState state)
 {
-    MacVIAState *m = MAC_VIA(opaque);
+    MOS6522Q800VIA1State *v1s = MOS6522_Q800_VIA1(opaque);
 
-    qemu_del_vm_change_state_handler(m->vmstate);
-    m->vmstate = NULL;
+    qemu_del_vm_change_state_handler(v1s->vmstate);
+    v1s->vmstate = NULL;
 
-    pram_update(m);
+    pram_update(v1s);
 }
 
-static int mac_via_post_load(void *opaque, int version_id)
+static int via1_post_load(void *opaque, int version_id)
 {
-    MacVIAState *m = MAC_VIA(opaque);
+    MOS6522Q800VIA1State *v1s = MOS6522_Q800_VIA1(opaque);
 
-    if (m->blk) {
-        m->vmstate = qemu_add_vm_change_state_handler(postload_update_cb,
-                                                      m);
+    if (v1s->blk) {
+        v1s->vmstate = qemu_add_vm_change_state_handler(
+                           via1_postload_update_cb, v1s);
     }
 
     return 0;
@@ -1080,7 +1079,6 @@ static const VMStateDescription vmstate_mac_via = {
     .name = "mac-via",
     .version_id = 2,
     .minimum_version_id = 2,
-    .post_load = mac_via_post_load,
     .fields = (VMStateField[]) {
         /* VIAs */
         VMSTATE_BUFFER(mos6522_via1.PRAM, MacVIAState),
@@ -1108,11 +1106,6 @@ static const VMStateDescription vmstate_mac_via = {
     }
 };
 
-static Property mac_via_properties[] = {
-    DEFINE_PROP_DRIVE("drive", MacVIAState, blk),
-    DEFINE_PROP_END_OF_LIST(),
-};
-
 static void mac_via_class_init(ObjectClass *oc, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(oc);
@@ -1120,7 +1113,6 @@ static void mac_via_class_init(ObjectClass *oc, void *data)
     dc->realize = mac_via_realize;
     dc->reset = mac_via_reset;
     dc->vmsd = &vmstate_mac_via;
-    device_class_set_props(dc, mac_via_properties);
 }
 
 static TypeInfo mac_via_info = {
@@ -1155,20 +1147,29 @@ static const VMStateDescription vmstate_q800_via1 = {
     .name = "q800-via1",
     .version_id = 0,
     .minimum_version_id = 0,
+    .post_load = via1_post_load,
     .fields = (VMStateField[]) {
         VMSTATE_STRUCT(parent_obj, MOS6522Q800VIA1State, 0, vmstate_mos6522,
                        MOS6522State),
         VMSTATE_UINT8(last_b, MOS6522Q800VIA1State),
+        /* RTC */
+        VMSTATE_BUFFER(PRAM, MOS6522Q800VIA1State),
         VMSTATE_END_OF_LIST()
     }
 };
 
+static Property mos6522_q800_via1_properties[] = {
+    DEFINE_PROP_DRIVE("drive", MOS6522Q800VIA1State, blk),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
 static void mos6522_q800_via1_class_init(ObjectClass *oc, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(oc);
 
     dc->reset = mos6522_q800_via1_reset;
     dc->vmsd = &vmstate_q800_via1;
+    device_class_set_props(dc, mos6522_q800_via1_properties);
 }
 
 static const TypeInfo mos6522_q800_via1_type_info = {
diff --git a/include/hw/misc/mac_via.h b/include/hw/misc/mac_via.h
index 3058b30685..bd1c65d1b9 100644
--- a/include/hw/misc/mac_via.h
+++ b/include/hw/misc/mac_via.h
@@ -40,7 +40,11 @@ struct MOS6522Q800VIA1State {
 
     qemu_irq irqs[VIA1_IRQ_NB];
     uint8_t last_b;
+
+    /* RTC */
     uint8_t PRAM[256];
+    BlockBackend *blk;
+    VMChangeStateEntry *vmstate;
 
     /* external timers */
     QEMUTimer *one_second_timer;
@@ -80,8 +84,6 @@ OBJECT_DECLARE_SIMPLE_TYPE(MacVIAState, MAC_VIA)
 struct MacVIAState {
     SysBusDevice busdev;
 
-    VMChangeStateEntry *vmstate;
-
     /* MMIO */
     MemoryRegion mmio;
     MemoryRegion via1mem;
@@ -101,7 +103,6 @@ struct MacVIAState {
     uint8_t cmd;
     int wprotect;
     int alt;
-    BlockBackend *blk;
 
     /* ADB */
     ADBBusState adb_bus;
-- 
2.20.1


