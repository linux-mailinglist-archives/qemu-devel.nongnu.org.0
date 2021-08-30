Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE6A03FB3EB
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Aug 2021 12:31:03 +0200 (CEST)
Received: from localhost ([::1]:60746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKeZ7-0005vL-Jy
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 06:30:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mKeU4-0005kS-CD
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 06:25:44 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:53310
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mKeTh-0007FZ-Oe
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 06:25:33 -0400
Received: from host86-179-186-93.range86-179.btcentralplus.com
 ([86.179.186.93] helo=kentang.home)
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mKeTH-0003D2-Iq; Mon, 30 Aug 2021 11:24:59 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org,
	laurent@vivier.eu
Date: Mon, 30 Aug 2021 11:24:40 +0100
Message-Id: <20210830102447.10806-6-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210830102447.10806-1-mark.cave-ayland@ilande.co.uk>
References: <20210830102447.10806-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.179.186.93
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 05/12] mac_via: move ADB variables to MOS6522Q800VIA1State
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

The ADB is accessed using clock and data pins on q800 VIA1 port B and so can be
moved to MOS6522Q800VIA1State.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/m68k/q800.c            |   6 +-
 hw/misc/mac_via.c         | 169 +++++++++++++++++++-------------------
 include/hw/misc/mac_via.h |  20 ++---
 3 files changed, 96 insertions(+), 99 deletions(-)

diff --git a/hw/m68k/q800.c b/hw/m68k/q800.c
index ac0a13060b..e14f68f19b 100644
--- a/hw/m68k/q800.c
+++ b/hw/m68k/q800.c
@@ -225,7 +225,7 @@ static void q800_init(MachineState *machine)
     hwaddr parameters_base;
     CPUState *cs;
     DeviceState *dev;
-    DeviceState *via_dev;
+    DeviceState *via_dev, *via1_dev;
     DeviceState *escc_orgate;
     SysBusESPState *sysbus_esp;
     ESPState *esp;
@@ -285,8 +285,8 @@ static void q800_init(MachineState *machine)
     qdev_connect_gpio_out_named(DEVICE(sysbus), "irq", 1,
                                 qdev_get_gpio_in(glue, 1));
 
-
-    adb_bus = qdev_get_child_bus(via_dev, "adb.0");
+    via1_dev = DEVICE(MOS6522_Q800_VIA1(&MAC_VIA(via_dev)->mos6522_via1));
+    adb_bus = qdev_get_child_bus(DEVICE(via1_dev), "adb.0");
     dev = qdev_new(TYPE_ADB_KEYBOARD);
     qdev_realize_and_unref(dev, adb_bus, &error_fatal);
     dev = qdev_new(TYPE_ADB_MOUSE);
diff --git a/hw/misc/mac_via.c b/hw/misc/mac_via.c
index 3978e6b441..b4a65480fd 100644
--- a/hw/misc/mac_via.c
+++ b/hw/misc/mac_via.c
@@ -595,10 +595,9 @@ static void via1_rtc_update(MOS6522Q800VIA1State *v1s)
 
 static void adb_via_poll(void *opaque)
 {
-    MacVIAState *m = opaque;
-    MOS6522Q800VIA1State *v1s = MOS6522_Q800_VIA1(&m->mos6522_via1);
+    MOS6522Q800VIA1State *v1s = MOS6522_Q800_VIA1(opaque);
     MOS6522State *s = MOS6522(v1s);
-    ADBBusState *adb_bus = &m->adb_bus;
+    ADBBusState *adb_bus = &v1s->adb_bus;
     uint8_t obuf[9];
     uint8_t *data = &s->sr;
     int olen;
@@ -610,50 +609,50 @@ static void adb_via_poll(void *opaque)
      */
     adb_autopoll_block(adb_bus);
 
-    if (m->adb_data_in_size > 0 && m->adb_data_in_index == 0) {
+    if (v1s->adb_data_in_size > 0 && v1s->adb_data_in_index == 0) {
         /*
          * For older Linux kernels that switch to IDLE mode after sending the
          * ADB command, detect if there is an existing response and return that
          * as a a "fake" autopoll reply or bus timeout accordingly
          */
-        *data = m->adb_data_out[0];
-        olen = m->adb_data_in_size;
+        *data = v1s->adb_data_out[0];
+        olen = v1s->adb_data_in_size;
 
         s->b &= ~VIA1B_vADBInt;
-        qemu_irq_raise(m->adb_data_ready);
+        qemu_irq_raise(v1s->adb_data_ready);
     } else {
         /*
          * Otherwise poll as normal
          */
-        m->adb_data_in_index = 0;
-        m->adb_data_out_index = 0;
+        v1s->adb_data_in_index = 0;
+        v1s->adb_data_out_index = 0;
         olen = adb_poll(adb_bus, obuf, adb_bus->autopoll_mask);
 
         if (olen > 0) {
             /* Autopoll response */
             *data = obuf[0];
             olen--;
-            memcpy(m->adb_data_in, &obuf[1], olen);
-            m->adb_data_in_size = olen;
+            memcpy(v1s->adb_data_in, &obuf[1], olen);
+            v1s->adb_data_in_size = olen;
 
             s->b &= ~VIA1B_vADBInt;
-            qemu_irq_raise(m->adb_data_ready);
+            qemu_irq_raise(v1s->adb_data_ready);
         } else {
-            *data = m->adb_autopoll_cmd;
+            *data = v1s->adb_autopoll_cmd;
             obuf[0] = 0xff;
             obuf[1] = 0xff;
             olen = 2;
 
-            memcpy(m->adb_data_in, obuf, olen);
-            m->adb_data_in_size = olen;
+            memcpy(v1s->adb_data_in, obuf, olen);
+            v1s->adb_data_in_size = olen;
 
             s->b &= ~VIA1B_vADBInt;
-            qemu_irq_raise(m->adb_data_ready);
+            qemu_irq_raise(v1s->adb_data_ready);
         }
     }
 
     trace_via1_adb_poll(*data, (s->b & VIA1B_vADBInt) ? "+" : "-",
-                        adb_bus->status, m->adb_data_in_index, olen);
+                        adb_bus->status, v1s->adb_data_in_index, olen);
 }
 
 static int adb_via_send_len(uint8_t data)
@@ -686,11 +685,10 @@ static int adb_via_send_len(uint8_t data)
     }
 }
 
-static void adb_via_send(MacVIAState *s, int state, uint8_t data)
+static void adb_via_send(MOS6522Q800VIA1State *v1s, int state, uint8_t data)
 {
-    MOS6522Q800VIA1State *v1s = MOS6522_Q800_VIA1(&s->mos6522_via1);
     MOS6522State *ms = MOS6522(v1s);
-    ADBBusState *adb_bus = &s->adb_bus;
+    ADBBusState *adb_bus = &v1s->adb_bus;
     uint16_t autopoll_mask;
 
     switch (state) {
@@ -706,22 +704,22 @@ static void adb_via_send(MacVIAState *s, int state, uint8_t data)
             ms->b &= ~VIA1B_vADBInt;
         } else {
             ms->b |= VIA1B_vADBInt;
-            s->adb_data_out_index = 0;
-            s->adb_data_out[s->adb_data_out_index++] = data;
+            v1s->adb_data_out_index = 0;
+            v1s->adb_data_out[v1s->adb_data_out_index++] = data;
         }
 
         trace_via1_adb_send(" NEW", data, (ms->b & VIA1B_vADBInt) ? "+" : "-");
-        qemu_irq_raise(s->adb_data_ready);
+        qemu_irq_raise(v1s->adb_data_ready);
         break;
 
     case ADB_STATE_EVEN:
     case ADB_STATE_ODD:
         ms->b |= VIA1B_vADBInt;
-        s->adb_data_out[s->adb_data_out_index++] = data;
+        v1s->adb_data_out[v1s->adb_data_out_index++] = data;
 
         trace_via1_adb_send(state == ADB_STATE_EVEN ? "EVEN" : " ODD",
                             data, (ms->b & VIA1B_vADBInt) ? "+" : "-");
-        qemu_irq_raise(s->adb_data_ready);
+        qemu_irq_raise(v1s->adb_data_ready);
         break;
 
     case ADB_STATE_IDLE:
@@ -729,40 +727,39 @@ static void adb_via_send(MacVIAState *s, int state, uint8_t data)
     }
 
     /* If the command is complete, execute it */
-    if (s->adb_data_out_index == adb_via_send_len(s->adb_data_out[0])) {
-        s->adb_data_in_size = adb_request(adb_bus, s->adb_data_in,
-                                          s->adb_data_out,
-                                          s->adb_data_out_index);
-        s->adb_data_in_index = 0;
+    if (v1s->adb_data_out_index == adb_via_send_len(v1s->adb_data_out[0])) {
+        v1s->adb_data_in_size = adb_request(adb_bus, v1s->adb_data_in,
+                                            v1s->adb_data_out,
+                                            v1s->adb_data_out_index);
+        v1s->adb_data_in_index = 0;
 
         if (adb_bus->status & ADB_STATUS_BUSTIMEOUT) {
             /*
              * Bus timeout (but allow first EVEN and ODD byte to indicate
              * timeout via vADBInt and SRQ status)
              */
-            s->adb_data_in[0] = 0xff;
-            s->adb_data_in[1] = 0xff;
-            s->adb_data_in_size = 2;
+            v1s->adb_data_in[0] = 0xff;
+            v1s->adb_data_in[1] = 0xff;
+            v1s->adb_data_in_size = 2;
         }
 
         /*
          * If last command is TALK, store it for use by autopoll and adjust
          * the autopoll mask accordingly
          */
-        if ((s->adb_data_out[0] & 0xc) == 0xc) {
-            s->adb_autopoll_cmd = s->adb_data_out[0];
+        if ((v1s->adb_data_out[0] & 0xc) == 0xc) {
+            v1s->adb_autopoll_cmd = v1s->adb_data_out[0];
 
-            autopoll_mask = 1 << (s->adb_autopoll_cmd >> 4);
+            autopoll_mask = 1 << (v1s->adb_autopoll_cmd >> 4);
             adb_set_autopoll_mask(adb_bus, autopoll_mask);
         }
     }
 }
 
-static void adb_via_receive(MacVIAState *s, int state, uint8_t *data)
+static void adb_via_receive(MOS6522Q800VIA1State *v1s, int state, uint8_t *data)
 {
-    MOS6522Q800VIA1State *v1s = MOS6522_Q800_VIA1(&s->mos6522_via1);
     MOS6522State *ms = MOS6522(v1s);
-    ADBBusState *adb_bus = &s->adb_bus;
+    ADBBusState *adb_bus = &v1s->adb_bus;
     uint16_t pending;
 
     switch (state) {
@@ -776,16 +773,16 @@ static void adb_via_receive(MacVIAState *s, int state, uint8_t *data)
 
         trace_via1_adb_receive("IDLE", *data,
                         (ms->b & VIA1B_vADBInt) ? "+" : "-", adb_bus->status,
-                        s->adb_data_in_index, s->adb_data_in_size);
+                        v1s->adb_data_in_index, v1s->adb_data_in_size);
 
         break;
 
     case ADB_STATE_EVEN:
     case ADB_STATE_ODD:
-        switch (s->adb_data_in_index) {
+        switch (v1s->adb_data_in_index) {
         case 0:
             /* First EVEN byte: vADBInt indicates bus timeout */
-            *data = s->adb_data_in[s->adb_data_in_index];
+            *data = v1s->adb_data_in[v1s->adb_data_in_index];
             if (adb_bus->status & ADB_STATUS_BUSTIMEOUT) {
                 ms->b &= ~VIA1B_vADBInt;
             } else {
@@ -794,16 +791,16 @@ static void adb_via_receive(MacVIAState *s, int state, uint8_t *data)
 
             trace_via1_adb_receive(state == ADB_STATE_EVEN ? "EVEN" : " ODD",
                                    *data, (ms->b & VIA1B_vADBInt) ? "+" : "-",
-                                   adb_bus->status, s->adb_data_in_index,
-                                   s->adb_data_in_size);
+                                   adb_bus->status, v1s->adb_data_in_index,
+                                   v1s->adb_data_in_size);
 
-            s->adb_data_in_index++;
+            v1s->adb_data_in_index++;
             break;
 
         case 1:
             /* First ODD byte: vADBInt indicates SRQ */
-            *data = s->adb_data_in[s->adb_data_in_index];
-            pending = adb_bus->pending & ~(1 << (s->adb_autopoll_cmd >> 4));
+            *data = v1s->adb_data_in[v1s->adb_data_in_index];
+            pending = adb_bus->pending & ~(1 << (v1s->adb_autopoll_cmd >> 4));
             if (pending) {
                 ms->b &= ~VIA1B_vADBInt;
             } else {
@@ -812,10 +809,10 @@ static void adb_via_receive(MacVIAState *s, int state, uint8_t *data)
 
             trace_via1_adb_receive(state == ADB_STATE_EVEN ? "EVEN" : " ODD",
                                    *data, (ms->b & VIA1B_vADBInt) ? "+" : "-",
-                                   adb_bus->status, s->adb_data_in_index,
-                                   s->adb_data_in_size);
+                                   adb_bus->status, v1s->adb_data_in_index,
+                                   v1s->adb_data_in_size);
 
-            s->adb_data_in_index++;
+            v1s->adb_data_in_index++;
             break;
 
         default:
@@ -825,11 +822,11 @@ static void adb_via_receive(MacVIAState *s, int state, uint8_t *data)
              * end of the poll reply, so provide these extra bytes below to
              * keep it happy
              */
-            if (s->adb_data_in_index < s->adb_data_in_size) {
+            if (v1s->adb_data_in_index < v1s->adb_data_in_size) {
                 /* Next data byte */
-                *data = s->adb_data_in[s->adb_data_in_index];
+                *data = v1s->adb_data_in[v1s->adb_data_in_index];
                 ms->b |= VIA1B_vADBInt;
-            } else if (s->adb_data_in_index == s->adb_data_in_size) {
+            } else if (v1s->adb_data_in_index == v1s->adb_data_in_size) {
                 if (adb_bus->status & ADB_STATUS_BUSTIMEOUT) {
                     /* Bus timeout (no more data) */
                     *data = 0xff;
@@ -848,23 +845,22 @@ static void adb_via_receive(MacVIAState *s, int state, uint8_t *data)
 
             trace_via1_adb_receive(state == ADB_STATE_EVEN ? "EVEN" : " ODD",
                                    *data, (ms->b & VIA1B_vADBInt) ? "+" : "-",
-                                   adb_bus->status, s->adb_data_in_index,
-                                   s->adb_data_in_size);
+                                   adb_bus->status, v1s->adb_data_in_index,
+                                   v1s->adb_data_in_size);
 
-            if (s->adb_data_in_index <= s->adb_data_in_size) {
-                s->adb_data_in_index++;
+            if (v1s->adb_data_in_index <= v1s->adb_data_in_size) {
+                v1s->adb_data_in_index++;
             }
             break;
         }
 
-        qemu_irq_raise(s->adb_data_ready);
+        qemu_irq_raise(v1s->adb_data_ready);
         break;
     }
 }
 
-static void via1_adb_update(MacVIAState *m)
+static void via1_adb_update(MOS6522Q800VIA1State *v1s)
 {
-    MOS6522Q800VIA1State *v1s = MOS6522_Q800_VIA1(&m->mos6522_via1);
     MOS6522State *s = MOS6522(v1s);
     int oldstate, state;
 
@@ -874,10 +870,10 @@ static void via1_adb_update(MacVIAState *m)
     if (state != oldstate) {
         if (s->acr & VIA1ACR_vShiftOut) {
             /* output mode */
-            adb_via_send(m, state, s->sr);
+            adb_via_send(v1s, state, s->sr);
         } else {
             /* input mode */
-            adb_via_receive(m, state, &s->sr);
+            adb_via_receive(v1s, state, &s->sr);
         }
     }
 }
@@ -895,7 +891,6 @@ static void mos6522_q800_via1_write(void *opaque, hwaddr addr, uint64_t val,
                                     unsigned size)
 {
     MOS6522Q800VIA1State *v1s = MOS6522_Q800_VIA1(opaque);
-    MacVIAState *m = container_of(v1s, MacVIAState, mos6522_via1);
     MOS6522State *ms = MOS6522(v1s);
 
     addr = (addr >> 9) & 0xf;
@@ -904,7 +899,7 @@ static void mos6522_q800_via1_write(void *opaque, hwaddr addr, uint64_t val,
     switch (addr) {
     case VIA_REG_B:
         via1_rtc_update(v1s);
-        via1_adb_update(m);
+        via1_adb_update(v1s);
 
         v1s->last_b = ms->b;
         break;
@@ -954,7 +949,7 @@ static void mac_via_reset(DeviceState *dev)
 {
     MacVIAState *m = MAC_VIA(dev);
     MOS6522Q800VIA1State *v1s = &m->mos6522_via1;
-    ADBBusState *adb_bus = &m->adb_bus;
+    ADBBusState *adb_bus = &v1s->adb_bus;
 
     adb_set_autopoll_enabled(adb_bus, true);
 
@@ -967,17 +962,10 @@ static void mac_via_realize(DeviceState *dev, Error **errp)
     MacVIAState *m = MAC_VIA(dev);
     MOS6522Q800VIA1State *v1s = &m->mos6522_via1;
     MOS6522State *ms;
-    ADBBusState *adb_bus = &m->adb_bus;
+    ADBBusState *adb_bus = &v1s->adb_bus;
     struct tm tm;
     int ret;
 
-    /* Init VIAs 1 and 2 */
-    object_initialize_child(OBJECT(dev), "via1", &m->mos6522_via1,
-                            TYPE_MOS6522_Q800_VIA1);
-
-    object_initialize_child(OBJECT(dev), "via2", &m->mos6522_via2,
-                            TYPE_MOS6522_Q800_VIA2);
-
     /* Pass through mos6522 output IRQs */
     ms = MOS6522(&m->mos6522_via1);
     object_property_add_alias(OBJECT(dev), "irq[0]", OBJECT(ms),
@@ -1006,9 +994,9 @@ static void mac_via_realize(DeviceState *dev, Error **errp)
     qemu_get_timedate(&tm, 0);
     v1s->tick_offset = (uint32_t)mktimegm(&tm) + RTC_OFFSET;
 
-    adb_register_autopoll_callback(adb_bus, adb_via_poll, m);
-    m->adb_data_ready = qdev_get_gpio_in_named(dev, "via1-irq",
-                                               VIA1_IRQ_ADB_READY_BIT);
+    adb_register_autopoll_callback(adb_bus, adb_via_poll, v1s);
+    v1s->adb_data_ready = qdev_get_gpio_in_named(dev, "via1-irq",
+                                                 VIA1_IRQ_ADB_READY_BIT);
 
     if (v1s->blk) {
         int64_t len = blk_getlength(v1s->blk);
@@ -1049,9 +1037,12 @@ static void mac_via_init(Object *obj)
                           &m->mos6522_via2, "via2", VIA_SIZE);
     memory_region_add_subregion(&m->mmio, VIA_SIZE, &m->via2mem);
 
-    /* ADB */
-    qbus_create_inplace((BusState *)&m->adb_bus, sizeof(m->adb_bus),
-                        TYPE_ADB_BUS, DEVICE(obj), "adb.0");
+    /* Init VIAs 1 and 2 */
+    object_initialize_child(obj, "via1", &m->mos6522_via1,
+                            TYPE_MOS6522_Q800_VIA1);
+
+    object_initialize_child(obj, "via2", &m->mos6522_via2,
+                            TYPE_MOS6522_Q800_VIA2);
 }
 
 static void via1_postload_update_cb(void *opaque, bool running, RunState state)
@@ -1086,13 +1077,6 @@ static const VMStateDescription vmstate_mac_via = {
         VMSTATE_INT64(mos6522_via1.next_second, MacVIAState),
         VMSTATE_TIMER_PTR(mos6522_via1.sixty_hz_timer, MacVIAState),
         VMSTATE_INT64(mos6522_via1.next_sixty_hz, MacVIAState),
-        /* ADB */
-        VMSTATE_INT32(adb_data_in_size, MacVIAState),
-        VMSTATE_INT32(adb_data_in_index, MacVIAState),
-        VMSTATE_INT32(adb_data_out_index, MacVIAState),
-        VMSTATE_BUFFER(adb_data_in, MacVIAState),
-        VMSTATE_BUFFER(adb_data_out, MacVIAState),
-        VMSTATE_UINT8(adb_autopoll_cmd, MacVIAState),
         VMSTATE_END_OF_LIST()
     }
 };
@@ -1130,6 +1114,12 @@ static void mos6522_q800_via1_reset(DeviceState *dev)
 
 static void mos6522_q800_via1_init(Object *obj)
 {
+    MOS6522Q800VIA1State *v1s = MOS6522_Q800_VIA1(obj);
+
+    /* ADB */
+    qbus_create_inplace((BusState *)&v1s->adb_bus, sizeof(v1s->adb_bus),
+                        TYPE_ADB_BUS, DEVICE(v1s), "adb.0");
+
     qdev_init_gpio_in_named(DEVICE(obj), via1_irq_request, "via1-irq",
                             VIA1_IRQ_NB);
 }
@@ -1153,6 +1143,13 @@ static const VMStateDescription vmstate_q800_via1 = {
         VMSTATE_UINT8(cmd, MOS6522Q800VIA1State),
         VMSTATE_INT32(wprotect, MOS6522Q800VIA1State),
         VMSTATE_INT32(alt, MOS6522Q800VIA1State),
+        /* ADB */
+        VMSTATE_INT32(adb_data_in_size, MOS6522Q800VIA1State),
+        VMSTATE_INT32(adb_data_in_index, MOS6522Q800VIA1State),
+        VMSTATE_INT32(adb_data_out_index, MOS6522Q800VIA1State),
+        VMSTATE_BUFFER(adb_data_in, MOS6522Q800VIA1State),
+        VMSTATE_BUFFER(adb_data_out, MOS6522Q800VIA1State),
+        VMSTATE_UINT8(adb_autopoll_cmd, MOS6522Q800VIA1State),
         VMSTATE_END_OF_LIST()
     }
 };
diff --git a/include/hw/misc/mac_via.h b/include/hw/misc/mac_via.h
index b2c499ed6b..182dcb7422 100644
--- a/include/hw/misc/mac_via.h
+++ b/include/hw/misc/mac_via.h
@@ -56,6 +56,16 @@ struct MOS6522Q800VIA1State {
     int wprotect;
     int alt;
 
+    /* ADB */
+    ADBBusState adb_bus;
+    qemu_irq adb_data_ready;
+    int adb_data_in_size;
+    int adb_data_in_index;
+    int adb_data_out_index;
+    uint8_t adb_data_in[128];
+    uint8_t adb_data_out[16];
+    uint8_t adb_autopoll_cmd;
+
     /* external timers */
     QEMUTimer *one_second_timer;
     int64_t next_second;
@@ -102,16 +112,6 @@ struct MacVIAState {
     /* VIAs */
     MOS6522Q800VIA1State mos6522_via1;
     MOS6522Q800VIA2State mos6522_via2;
-
-    /* ADB */
-    ADBBusState adb_bus;
-    qemu_irq adb_data_ready;
-    int adb_data_in_size;
-    int adb_data_in_index;
-    int adb_data_out_index;
-    uint8_t adb_data_in[128];
-    uint8_t adb_data_out[16];
-    uint8_t adb_autopoll_cmd;
 };
 
 #endif
-- 
2.20.1


