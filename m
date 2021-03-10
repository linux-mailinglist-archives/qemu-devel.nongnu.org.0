Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F11333717
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 09:15:07 +0100 (CET)
Received: from localhost ([::1]:51596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJtzm-0003xw-Dc
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 03:15:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lJtuc-0005NT-Cj
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 03:09:46 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:49986
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lJtuW-00008v-Jf
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 03:09:44 -0500
Received: from host86-140-100-136.range86-140.btcentralplus.com
 ([86.140.100.136] helo=kentang.home)
 by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lJtuT-0006rB-TX; Wed, 10 Mar 2021 08:09:41 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org,
	laurent@vivier.eu
Date: Wed, 10 Mar 2021 08:09:06 +0000
Message-Id: <20210310080908.11861-6-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210310080908.11861-1-mark.cave-ayland@ilande.co.uk>
References: <20210310080908.11861-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.140.100.136
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 5/7] mac_via: rename VBL timer to 60Hz timer
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

According to the "Guide To The Macintosh Family Hardware", the 60Hz VIA1 timer
on newer Macs such as the Quadra only exists for compatibility with old software
and is no longer synced to the VBL interval.

Rename the VBL timer to 60Hz timer to emphasise this and to prevent confusion
when the real VBL interrupt (now handled as a NuBus slot interrupt) is added in
future.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/misc/mac_via.c         | 41 ++++++++++++++++++++-------------------
 include/hw/misc/mac_via.h |  8 ++++----
 2 files changed, 25 insertions(+), 24 deletions(-)

diff --git a/hw/misc/mac_via.c b/hw/misc/mac_via.c
index 76f31b8cae..f994fefa7c 100644
--- a/hw/misc/mac_via.c
+++ b/hw/misc/mac_via.c
@@ -297,18 +297,18 @@ enum {
     REG_EMPTY = 0xff,
 };
 
-static void via1_VBL_update(MOS6522Q800VIA1State *v1s)
+static void via1_sixty_hz_update(MOS6522Q800VIA1State *v1s)
 {
     MOS6522State *s = MOS6522(v1s);
 
     /* 60 Hz irq */
-    v1s->next_VBL = (qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + 16630) /
-                    16630 * 16630;
+    v1s->next_sixty_hz = (qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + 16630) /
+                          16630 * 16630;
 
-    if (s->ier & VIA1_IRQ_VBLANK) {
-        timer_mod(v1s->VBL_timer, v1s->next_VBL);
+    if (s->ier & VIA1_IRQ_60HZ) {
+        timer_mod(v1s->sixty_hz_timer, v1s->next_sixty_hz);
     } else {
-        timer_del(v1s->VBL_timer);
+        timer_del(v1s->sixty_hz_timer);
     }
 }
 
@@ -325,16 +325,16 @@ static void via1_one_second_update(MOS6522Q800VIA1State *v1s)
     }
 }
 
-static void via1_VBL(void *opaque)
+static void via1_sixty_hz(void *opaque)
 {
     MOS6522Q800VIA1State *v1s = opaque;
     MOS6522State *s = MOS6522(v1s);
     MOS6522DeviceClass *mdc = MOS6522_GET_CLASS(s);
 
-    s->ifr |= VIA1_IRQ_VBLANK;
+    s->ifr |= VIA1_IRQ_60HZ;
     mdc->update_irq(s);
 
-    via1_VBL_update(v1s);
+    via1_sixty_hz_update(v1s);
 }
 
 static void via1_one_second(void *opaque)
@@ -897,12 +897,12 @@ static uint64_t mos6522_q800_via1_read(void *opaque, hwaddr addr, unsigned size)
 
     /*
      * If IRQs are disabled, timers are disabled, but we need to update
-     * VIA1_IRQ_VBLANK and VIA1_IRQ_ONE_SECOND bits in the IFR
+     * VIA1_IRQ_60HZ and VIA1_IRQ_ONE_SECOND bits in the IFR
      */
 
-    if (now >= s->next_VBL) {
-        ms->ifr |= VIA1_IRQ_VBLANK;
-        via1_VBL_update(s);
+    if (now >= s->next_sixty_hz) {
+        ms->ifr |= VIA1_IRQ_60HZ;
+        via1_sixty_hz_update(s);
     }
     if (now >= s->next_second) {
         ms->ifr |= VIA1_IRQ_ONE_SECOND;
@@ -933,7 +933,7 @@ static void mos6522_q800_via1_write(void *opaque, hwaddr addr, uint64_t val,
     }
 
     via1_one_second_update(v1s);
-    via1_VBL_update(v1s);
+    via1_sixty_hz_update(v1s);
 }
 
 static const MemoryRegionOps mos6522_q800_via1_ops = {
@@ -983,8 +983,8 @@ static void mac_via_reset(DeviceState *dev)
 
     adb_set_autopoll_enabled(adb_bus, true);
 
-    timer_del(v1s->VBL_timer);
-    v1s->next_VBL = 0;
+    timer_del(v1s->sixty_hz_timer);
+    v1s->next_sixty_hz = 0;
     timer_del(v1s->one_second_timer);
     v1s->next_second = 0;
 
@@ -1026,8 +1026,9 @@ static void mac_via_realize(DeviceState *dev, Error **errp)
     m->mos6522_via1.one_second_timer = timer_new_ms(QEMU_CLOCK_VIRTUAL,
                                                      via1_one_second,
                                                      &m->mos6522_via1);
-    m->mos6522_via1.VBL_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, via1_VBL,
-                                              &m->mos6522_via1);
+    m->mos6522_via1.sixty_hz_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL,
+                                                  via1_sixty_hz,
+                                                  &m->mos6522_via1);
 
     qemu_get_timedate(&tm, 0);
     m->tick_offset = (uint32_t)mktimegm(&tm) + RTC_OFFSET;
@@ -1116,8 +1117,8 @@ static const VMStateDescription vmstate_mac_via = {
         VMSTATE_BUFFER(mos6522_via1.PRAM, MacVIAState),
         VMSTATE_TIMER_PTR(mos6522_via1.one_second_timer, MacVIAState),
         VMSTATE_INT64(mos6522_via1.next_second, MacVIAState),
-        VMSTATE_TIMER_PTR(mos6522_via1.VBL_timer, MacVIAState),
-        VMSTATE_INT64(mos6522_via1.next_VBL, MacVIAState),
+        VMSTATE_TIMER_PTR(mos6522_via1.sixty_hz_timer, MacVIAState),
+        VMSTATE_INT64(mos6522_via1.next_sixty_hz, MacVIAState),
         VMSTATE_STRUCT(mos6522_via2.parent_obj, MacVIAState, 0, vmstate_mos6522,
                        MOS6522State),
         /* RTC */
diff --git a/include/hw/misc/mac_via.h b/include/hw/misc/mac_via.h
index a59f0bd422..3058b30685 100644
--- a/include/hw/misc/mac_via.h
+++ b/include/hw/misc/mac_via.h
@@ -17,7 +17,7 @@
 
 /* VIA 1 */
 #define VIA1_IRQ_ONE_SECOND_BIT 0
-#define VIA1_IRQ_VBLANK_BIT     1
+#define VIA1_IRQ_60HZ_BIT       1
 #define VIA1_IRQ_ADB_READY_BIT  2
 #define VIA1_IRQ_ADB_DATA_BIT   3
 #define VIA1_IRQ_ADB_CLOCK_BIT  4
@@ -25,7 +25,7 @@
 #define VIA1_IRQ_NB             8
 
 #define VIA1_IRQ_ONE_SECOND (1 << VIA1_IRQ_ONE_SECOND_BIT)
-#define VIA1_IRQ_VBLANK     (1 << VIA1_IRQ_VBLANK_BIT)
+#define VIA1_IRQ_60HZ       (1 << VIA1_IRQ_60HZ_BIT)
 #define VIA1_IRQ_ADB_READY  (1 << VIA1_IRQ_ADB_READY_BIT)
 #define VIA1_IRQ_ADB_DATA   (1 << VIA1_IRQ_ADB_DATA_BIT)
 #define VIA1_IRQ_ADB_CLOCK  (1 << VIA1_IRQ_ADB_CLOCK_BIT)
@@ -45,8 +45,8 @@ struct MOS6522Q800VIA1State {
     /* external timers */
     QEMUTimer *one_second_timer;
     int64_t next_second;
-    QEMUTimer *VBL_timer;
-    int64_t next_VBL;
+    QEMUTimer *sixty_hz_timer;
+    int64_t next_sixty_hz;
 };
 
 
-- 
2.20.1


