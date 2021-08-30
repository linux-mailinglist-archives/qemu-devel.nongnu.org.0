Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 584233FB3F1
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Aug 2021 12:34:19 +0200 (CEST)
Received: from localhost ([::1]:39936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKecM-0002nd-DE
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 06:34:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mKeU8-0005rG-NQ
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 06:25:49 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:53304
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mKeU4-00079n-Ac
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 06:25:48 -0400
Received: from host86-179-186-93.range86-179.btcentralplus.com
 ([86.179.186.93] helo=kentang.home)
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mKeTD-0003D2-AF; Mon, 30 Aug 2021 11:24:55 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org,
	laurent@vivier.eu
Date: Mon, 30 Aug 2021 11:24:39 +0100
Message-Id: <20210830102447.10806-5-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210830102447.10806-1-mark.cave-ayland@ilande.co.uk>
References: <20210830102447.10806-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.179.186.93
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 04/12] mac_via: move PRAM/RTC variables to MOS6522Q800VIA1State
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

The PRAM/RTC is accessed using clock and data pins on q800 VIA1 port B and so
can be moved to MOS6522Q800VIA1State.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/misc/mac_via.c         | 135 +++++++++++++++++++-------------------
 include/hw/misc/mac_via.h |  21 +++---
 2 files changed, 77 insertions(+), 79 deletions(-)

diff --git a/hw/misc/mac_via.c b/hw/misc/mac_via.c
index abbe99af11..3978e6b441 100644
--- a/hw/misc/mac_via.c
+++ b/hw/misc/mac_via.c
@@ -433,9 +433,8 @@ static int via1_rtc_compact_cmd(uint8_t value)
     return REG_INVALID;
 }
 
-static void via1_rtc_update(MacVIAState *m)
+static void via1_rtc_update(MOS6522Q800VIA1State *v1s)
 {
-    MOS6522Q800VIA1State *v1s = &m->mos6522_via1;
     MOS6522State *s = MOS6522(v1s);
     int cmd, sector, addr;
     uint32_t time;
@@ -447,40 +446,40 @@ static void via1_rtc_update(MacVIAState *m)
     if (s->dirb & VIA1B_vRTCData) {
         /* send bits to the RTC */
         if (!(v1s->last_b & VIA1B_vRTCClk) && (s->b & VIA1B_vRTCClk)) {
-            m->data_out <<= 1;
-            m->data_out |= s->b & VIA1B_vRTCData;
-            m->data_out_cnt++;
+            v1s->data_out <<= 1;
+            v1s->data_out |= s->b & VIA1B_vRTCData;
+            v1s->data_out_cnt++;
         }
-        trace_via1_rtc_update_data_out(m->data_out_cnt, m->data_out);
+        trace_via1_rtc_update_data_out(v1s->data_out_cnt, v1s->data_out);
     } else {
-        trace_via1_rtc_update_data_in(m->data_in_cnt, m->data_in);
+        trace_via1_rtc_update_data_in(v1s->data_in_cnt, v1s->data_in);
         /* receive bits from the RTC */
         if ((v1s->last_b & VIA1B_vRTCClk) &&
             !(s->b & VIA1B_vRTCClk) &&
-            m->data_in_cnt) {
+            v1s->data_in_cnt) {
             s->b = (s->b & ~VIA1B_vRTCData) |
-                   ((m->data_in >> 7) & VIA1B_vRTCData);
-            m->data_in <<= 1;
-            m->data_in_cnt--;
+                   ((v1s->data_in >> 7) & VIA1B_vRTCData);
+            v1s->data_in <<= 1;
+            v1s->data_in_cnt--;
         }
         return;
     }
 
-    if (m->data_out_cnt != 8) {
+    if (v1s->data_out_cnt != 8) {
         return;
     }
 
-    m->data_out_cnt = 0;
+    v1s->data_out_cnt = 0;
 
-    trace_via1_rtc_internal_status(m->cmd, m->alt, m->data_out);
+    trace_via1_rtc_internal_status(v1s->cmd, v1s->alt, v1s->data_out);
     /* first byte: it's a command */
-    if (m->cmd == REG_EMPTY) {
+    if (v1s->cmd == REG_EMPTY) {
 
-        cmd = via1_rtc_compact_cmd(m->data_out);
+        cmd = via1_rtc_compact_cmd(v1s->data_out);
         trace_via1_rtc_internal_cmd(cmd);
 
         if (cmd == REG_INVALID) {
-            trace_via1_rtc_cmd_invalid(m->data_out);
+            trace_via1_rtc_cmd_invalid(v1s->data_out);
             return;
         }
 
@@ -492,20 +491,20 @@ static void via1_rtc_update(MacVIAState *m)
                  * register 3 is highest-order byte
                  */
 
-                time = m->tick_offset + (qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL)
+                time = v1s->tick_offset + (qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL)
                        / NANOSECONDS_PER_SECOND);
                 trace_via1_rtc_internal_time(time);
-                m->data_in = (time >> ((cmd & 0x03) << 3)) & 0xff;
-                m->data_in_cnt = 8;
+                v1s->data_in = (time >> ((cmd & 0x03) << 3)) & 0xff;
+                v1s->data_in_cnt = 8;
                 trace_via1_rtc_cmd_seconds_read((cmd & 0x7f) - REG_0,
-                                                m->data_in);
+                                                v1s->data_in);
                 break;
             case REG_PRAM_ADDR...REG_PRAM_ADDR_LAST:
                 /* PRAM address 0x00 -> 0x13 */
-                m->data_in = v1s->PRAM[(cmd & 0x7f) - REG_PRAM_ADDR];
-                m->data_in_cnt = 8;
+                v1s->data_in = v1s->PRAM[(cmd & 0x7f) - REG_PRAM_ADDR];
+                v1s->data_in_cnt = 8;
                 trace_via1_rtc_cmd_pram_read((cmd & 0x7f) - REG_PRAM_ADDR,
-                                             m->data_in);
+                                             v1s->data_in);
                 break;
             case REG_PRAM_SECT...REG_PRAM_SECT_LAST:
                 /*
@@ -513,7 +512,7 @@ static void via1_rtc_update(MacVIAState *m)
                  * the only two-byte read command
                  */
                 trace_via1_rtc_internal_set_cmd(cmd);
-                m->cmd = cmd;
+                v1s->cmd = cmd;
                 break;
             default:
                 g_assert_not_reached();
@@ -523,9 +522,9 @@ static void via1_rtc_update(MacVIAState *m)
         }
 
         /* this is a write command, needs a parameter */
-        if (cmd == REG_WPROTECT || !m->wprotect) {
+        if (cmd == REG_WPROTECT || !v1s->wprotect) {
             trace_via1_rtc_internal_set_cmd(cmd);
-            m->cmd = cmd;
+            v1s->cmd = cmd;
         } else {
             trace_via1_rtc_internal_ignore_cmd(cmd);
         }
@@ -533,46 +532,47 @@ static void via1_rtc_update(MacVIAState *m)
     }
 
     /* second byte: it's a parameter */
-    if (m->alt == REG_EMPTY) {
-        switch (m->cmd & 0x7f) {
+    if (v1s->alt == REG_EMPTY) {
+        switch (v1s->cmd & 0x7f) {
         case REG_0...REG_3: /* seconds register */
             /* FIXME */
-            trace_via1_rtc_cmd_seconds_write(m->cmd - REG_0, m->data_out);
-            m->cmd = REG_EMPTY;
+            trace_via1_rtc_cmd_seconds_write(v1s->cmd - REG_0, v1s->data_out);
+            v1s->cmd = REG_EMPTY;
             break;
         case REG_TEST:
             /* device control: nothing to do */
-            trace_via1_rtc_cmd_test_write(m->data_out);
-            m->cmd = REG_EMPTY;
+            trace_via1_rtc_cmd_test_write(v1s->data_out);
+            v1s->cmd = REG_EMPTY;
             break;
         case REG_WPROTECT:
             /* Write Protect register */
-            trace_via1_rtc_cmd_wprotect_write(m->data_out);
-            m->wprotect = !!(m->data_out & 0x80);
-            m->cmd = REG_EMPTY;
+            trace_via1_rtc_cmd_wprotect_write(v1s->data_out);
+            v1s->wprotect = !!(v1s->data_out & 0x80);
+            v1s->cmd = REG_EMPTY;
             break;
         case REG_PRAM_ADDR...REG_PRAM_ADDR_LAST:
             /* PRAM address 0x00 -> 0x13 */
-            trace_via1_rtc_cmd_pram_write(m->cmd - REG_PRAM_ADDR, m->data_out);
-            v1s->PRAM[m->cmd - REG_PRAM_ADDR] = m->data_out;
+            trace_via1_rtc_cmd_pram_write(v1s->cmd - REG_PRAM_ADDR,
+                                          v1s->data_out);
+            v1s->PRAM[v1s->cmd - REG_PRAM_ADDR] = v1s->data_out;
             pram_update(v1s);
-            m->cmd = REG_EMPTY;
+            v1s->cmd = REG_EMPTY;
             break;
         case REG_PRAM_SECT...REG_PRAM_SECT_LAST:
-            addr = (m->data_out >> 2) & 0x1f;
-            sector = (m->cmd & 0x7f) - REG_PRAM_SECT;
-            if (m->cmd & 0x80) {
+            addr = (v1s->data_out >> 2) & 0x1f;
+            sector = (v1s->cmd & 0x7f) - REG_PRAM_SECT;
+            if (v1s->cmd & 0x80) {
                 /* it's a read */
-                m->data_in = v1s->PRAM[sector * 32 + addr];
-                m->data_in_cnt = 8;
+                v1s->data_in = v1s->PRAM[sector * 32 + addr];
+                v1s->data_in_cnt = 8;
                 trace_via1_rtc_cmd_pram_sect_read(sector, addr,
                                                   sector * 32 + addr,
-                                                  m->data_in);
-                m->cmd = REG_EMPTY;
+                                                  v1s->data_in);
+                v1s->cmd = REG_EMPTY;
             } else {
                 /* it's a write, we need one more parameter */
                 trace_via1_rtc_internal_set_alt(addr, sector, addr);
-                m->alt = addr;
+                v1s->alt = addr;
             }
             break;
         default:
@@ -583,14 +583,14 @@ static void via1_rtc_update(MacVIAState *m)
     }
 
     /* third byte: it's the data of a REG_PRAM_SECT write */
-    g_assert(REG_PRAM_SECT <= m->cmd && m->cmd <= REG_PRAM_SECT_LAST);
-    sector = m->cmd - REG_PRAM_SECT;
-    v1s->PRAM[sector * 32 + m->alt] = m->data_out;
+    g_assert(REG_PRAM_SECT <= v1s->cmd && v1s->cmd <= REG_PRAM_SECT_LAST);
+    sector = v1s->cmd - REG_PRAM_SECT;
+    v1s->PRAM[sector * 32 + v1s->alt] = v1s->data_out;
     pram_update(v1s);
-    trace_via1_rtc_cmd_pram_sect_write(sector, m->alt, sector * 32 + m->alt,
-                                       m->data_out);
-    m->alt = REG_EMPTY;
-    m->cmd = REG_EMPTY;
+    trace_via1_rtc_cmd_pram_sect_write(sector, v1s->alt, sector * 32 + v1s->alt,
+                                       v1s->data_out);
+    v1s->alt = REG_EMPTY;
+    v1s->cmd = REG_EMPTY;
 }
 
 static void adb_via_poll(void *opaque)
@@ -903,7 +903,7 @@ static void mos6522_q800_via1_write(void *opaque, hwaddr addr, uint64_t val,
 
     switch (addr) {
     case VIA_REG_B:
-        via1_rtc_update(m);
+        via1_rtc_update(v1s);
         via1_adb_update(m);
 
         v1s->last_b = ms->b;
@@ -953,12 +953,13 @@ static const MemoryRegionOps mos6522_q800_via2_ops = {
 static void mac_via_reset(DeviceState *dev)
 {
     MacVIAState *m = MAC_VIA(dev);
+    MOS6522Q800VIA1State *v1s = &m->mos6522_via1;
     ADBBusState *adb_bus = &m->adb_bus;
 
     adb_set_autopoll_enabled(adb_bus, true);
 
-    m->cmd = REG_EMPTY;
-    m->alt = REG_EMPTY;
+    v1s->cmd = REG_EMPTY;
+    v1s->alt = REG_EMPTY;
 }
 
 static void mac_via_realize(DeviceState *dev, Error **errp)
@@ -1003,7 +1004,7 @@ static void mac_via_realize(DeviceState *dev, Error **errp)
     via1_sixty_hz_update(&m->mos6522_via1);
 
     qemu_get_timedate(&tm, 0);
-    m->tick_offset = (uint32_t)mktimegm(&tm) + RTC_OFFSET;
+    v1s->tick_offset = (uint32_t)mktimegm(&tm) + RTC_OFFSET;
 
     adb_register_autopoll_callback(adb_bus, adb_via_poll, m);
     m->adb_data_ready = qdev_get_gpio_in_named(dev, "via1-irq",
@@ -1081,20 +1082,10 @@ static const VMStateDescription vmstate_mac_via = {
     .minimum_version_id = 2,
     .fields = (VMStateField[]) {
         /* VIAs */
-        VMSTATE_BUFFER(mos6522_via1.PRAM, MacVIAState),
         VMSTATE_TIMER_PTR(mos6522_via1.one_second_timer, MacVIAState),
         VMSTATE_INT64(mos6522_via1.next_second, MacVIAState),
         VMSTATE_TIMER_PTR(mos6522_via1.sixty_hz_timer, MacVIAState),
         VMSTATE_INT64(mos6522_via1.next_sixty_hz, MacVIAState),
-        /* RTC */
-        VMSTATE_UINT32(tick_offset, MacVIAState),
-        VMSTATE_UINT8(data_out, MacVIAState),
-        VMSTATE_INT32(data_out_cnt, MacVIAState),
-        VMSTATE_UINT8(data_in, MacVIAState),
-        VMSTATE_UINT8(data_in_cnt, MacVIAState),
-        VMSTATE_UINT8(cmd, MacVIAState),
-        VMSTATE_INT32(wprotect, MacVIAState),
-        VMSTATE_INT32(alt, MacVIAState),
         /* ADB */
         VMSTATE_INT32(adb_data_in_size, MacVIAState),
         VMSTATE_INT32(adb_data_in_index, MacVIAState),
@@ -1154,6 +1145,14 @@ static const VMStateDescription vmstate_q800_via1 = {
         VMSTATE_UINT8(last_b, MOS6522Q800VIA1State),
         /* RTC */
         VMSTATE_BUFFER(PRAM, MOS6522Q800VIA1State),
+        VMSTATE_UINT32(tick_offset, MOS6522Q800VIA1State),
+        VMSTATE_UINT8(data_out, MOS6522Q800VIA1State),
+        VMSTATE_INT32(data_out_cnt, MOS6522Q800VIA1State),
+        VMSTATE_UINT8(data_in, MOS6522Q800VIA1State),
+        VMSTATE_UINT8(data_in_cnt, MOS6522Q800VIA1State),
+        VMSTATE_UINT8(cmd, MOS6522Q800VIA1State),
+        VMSTATE_INT32(wprotect, MOS6522Q800VIA1State),
+        VMSTATE_INT32(alt, MOS6522Q800VIA1State),
         VMSTATE_END_OF_LIST()
     }
 };
diff --git a/include/hw/misc/mac_via.h b/include/hw/misc/mac_via.h
index bd1c65d1b9..b2c499ed6b 100644
--- a/include/hw/misc/mac_via.h
+++ b/include/hw/misc/mac_via.h
@@ -46,6 +46,16 @@ struct MOS6522Q800VIA1State {
     BlockBackend *blk;
     VMChangeStateEntry *vmstate;
 
+    uint32_t tick_offset;
+
+    uint8_t data_out;
+    int data_out_cnt;
+    uint8_t data_in;
+    uint8_t data_in_cnt;
+    uint8_t cmd;
+    int wprotect;
+    int alt;
+
     /* external timers */
     QEMUTimer *one_second_timer;
     int64_t next_second;
@@ -93,17 +103,6 @@ struct MacVIAState {
     MOS6522Q800VIA1State mos6522_via1;
     MOS6522Q800VIA2State mos6522_via2;
 
-    /* RTC */
-    uint32_t tick_offset;
-
-    uint8_t data_out;
-    int data_out_cnt;
-    uint8_t data_in;
-    uint8_t data_in_cnt;
-    uint8_t cmd;
-    int wprotect;
-    int alt;
-
     /* ADB */
     ADBBusState adb_bus;
     qemu_irq adb_data_ready;
-- 
2.20.1


