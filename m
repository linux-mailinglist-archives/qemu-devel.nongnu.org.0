Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 690EA4CE53C
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Mar 2022 15:20:22 +0100 (CET)
Received: from localhost ([::1]:45948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQVGf-0004Au-GJ
	for lists+qemu-devel@lfdr.de; Sat, 05 Mar 2022 09:20:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nQV8D-0000Xn-Jq
 for qemu-devel@nongnu.org; Sat, 05 Mar 2022 09:11:37 -0500
Received: from [2001:41c9:1:41f::167] (port=58966
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nQV8B-00073d-Qq
 for qemu-devel@nongnu.org; Sat, 05 Mar 2022 09:11:37 -0500
Received: from [2a00:23c4:8ba0:ca00:d4eb:dbd5:5a41:aefe] (helo=kentang.home)
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nQV7W-00082l-68; Sat, 05 Mar 2022 14:10:58 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: laurent@vivier.eu,
	qemu-devel@nongnu.org
Date: Sat,  5 Mar 2022 14:10:43 +0000
Message-Id: <20220305141044.31911-12-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220305141044.31911-1-mark.cave-ayland@ilande.co.uk>
References: <20220305141044.31911-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba0:ca00:d4eb:dbd5:5a41:aefe
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v3 11/12] mos6522: implement edge-triggering for CA1/2 and
 CB1/2 control line IRQs
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:41c9:1:41f::167
 (failed)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

The mos6522 datasheet describes how the control lines IRQs are edge-triggered
according to the configuration in the PCR register. Implement the logic according
to the datasheet so that the interrupt bits in IFR are latched when the edge is
detected, and cleared when reading portA/portB or writing to IFR as necessary.

To maintain bisectibility this change also updates the SCSI, SCSI data, Nubus
and VIA2 60Hz/1Hz clocks in the q800 machine to be negative edge-triggered as
confirmed by the PCR programming in all of Linux, NetBSD and MacOS.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/m68k/q800.c            |  9 +++--
 hw/misc/mac_via.c         | 15 +++++--
 hw/misc/mos6522.c         | 82 +++++++++++++++++++++++++++++++++++++--
 include/hw/misc/mos6522.h | 15 +++++++
 4 files changed, 109 insertions(+), 12 deletions(-)

diff --git a/hw/m68k/q800.c b/hw/m68k/q800.c
index 55dfe5036f..66ca5c0df6 100644
--- a/hw/m68k/q800.c
+++ b/hw/m68k/q800.c
@@ -533,10 +533,11 @@ static void q800_init(MachineState *machine)
 
     sysbus = SYS_BUS_DEVICE(dev);
     sysbus_realize_and_unref(sysbus, &error_fatal);
-    sysbus_connect_irq(sysbus, 0, qdev_get_gpio_in(via2_dev,
-                                                   VIA2_IRQ_SCSI_BIT));
-    sysbus_connect_irq(sysbus, 1, qdev_get_gpio_in(via2_dev,
-                                                   VIA2_IRQ_SCSI_DATA_BIT));
+    /* SCSI and SCSI data IRQs are negative edge triggered */
+    sysbus_connect_irq(sysbus, 0, qemu_irq_invert(qdev_get_gpio_in(via2_dev,
+                                                  VIA2_IRQ_SCSI_BIT)));
+    sysbus_connect_irq(sysbus, 1, qemu_irq_invert(qdev_get_gpio_in(via2_dev,
+                                                  VIA2_IRQ_SCSI_DATA_BIT)));
     sysbus_mmio_map(sysbus, 0, ESP_BASE);
     sysbus_mmio_map(sysbus, 1, ESP_PDMA);
 
diff --git a/hw/misc/mac_via.c b/hw/misc/mac_via.c
index d8b35e6ca6..525e38ce93 100644
--- a/hw/misc/mac_via.c
+++ b/hw/misc/mac_via.c
@@ -327,7 +327,9 @@ static void via1_sixty_hz(void *opaque)
     MOS6522State *s = MOS6522(v1s);
     qemu_irq irq = qdev_get_gpio_in(DEVICE(s), VIA1_IRQ_60HZ_BIT);
 
-    qemu_set_irq(irq, 1);
+    /* Negative edge trigger */
+    qemu_irq_lower(irq);
+    qemu_irq_raise(irq);
 
     via1_sixty_hz_update(v1s);
 }
@@ -338,7 +340,9 @@ static void via1_one_second(void *opaque)
     MOS6522State *s = MOS6522(v1s);
     qemu_irq irq = qdev_get_gpio_in(DEVICE(s), VIA1_IRQ_ONE_SECOND_BIT);
 
-    qemu_set_irq(irq, 1);
+    /* Negative edge trigger */
+    qemu_irq_lower(irq);
+    qemu_irq_raise(irq);
 
     via1_one_second_update(v1s);
 }
@@ -917,9 +921,11 @@ static uint64_t mos6522_q800_via2_read(void *opaque, hwaddr addr, unsigned size)
          * On a Q800 an emulated VIA2 is integrated into the onboard logic. The
          * expectation of most OSs is that the DRQ bit is live, rather than
          * latched as it would be on a real VIA so do the same here.
+         *
+         * Note: DRQ is negative edge triggered
          */
         val &= ~VIA2_IRQ_SCSI_DATA;
-        val |= (ms->last_irq_levels & VIA2_IRQ_SCSI_DATA);
+        val |= (~ms->last_irq_levels & VIA2_IRQ_SCSI_DATA);
         break;
     }
 
@@ -1146,7 +1152,8 @@ static void via2_nubus_irq_request(void *opaque, int n, int level)
         s->a |= (1 << n);
     }
 
-    qemu_set_irq(irq, level);
+    /* Negative edge trigger */
+    qemu_set_irq(irq, !level);
 }
 
 static void mos6522_q800_via2_init(Object *obj)
diff --git a/hw/misc/mos6522.c b/hw/misc/mos6522.c
index c67123f864..f9e646350e 100644
--- a/hw/misc/mos6522.c
+++ b/hw/misc/mos6522.c
@@ -64,14 +64,62 @@ static void mos6522_update_irq(MOS6522State *s)
 static void mos6522_set_irq(void *opaque, int n, int level)
 {
     MOS6522State *s = MOS6522(opaque);
+    int last_level = !!(s->last_irq_levels & (1 << n));
+    uint8_t last_ifr = s->ifr;
+    bool positive_edge = true;
+    int ctrl;
+
+    /*
+     * SR_INT is managed by mos6522 instances and cleared upon SR
+     * read. It is only the external CA1/2 and CB1/2 lines that
+     * are edge-triggered and latched in IFR
+     */
+    if (n != SR_INT_BIT && level == last_level) {
+        return;
+    }
 
-    if (level) {
+    /* Detect negative edge trigger */
+    if (last_level == 1 && level == 0) {
+        positive_edge = false;
+    }
+
+    switch (n) {
+    case CA2_INT_BIT:
+        ctrl = (s->pcr & CA2_CTRL_MASK) >> CA2_CTRL_SHIFT;
+        if ((positive_edge && (ctrl & C2_POS)) ||
+             (!positive_edge && !(ctrl & C2_POS))) {
+            s->ifr |= 1 << n;
+        }
+        break;
+    case CA1_INT_BIT:
+        ctrl = (s->pcr & CA1_CTRL_MASK) >> CA1_CTRL_SHIFT;
+        if ((positive_edge && (ctrl & C1_POS)) ||
+             (!positive_edge && !(ctrl & C1_POS))) {
+            s->ifr |= 1 << n;
+        }
+        break;
+    case SR_INT_BIT:
         s->ifr |= 1 << n;
-    } else {
-        s->ifr &= ~(1 << n);
+        break;
+    case CB2_INT_BIT:
+        ctrl = (s->pcr & CB2_CTRL_MASK) >> CB2_CTRL_SHIFT;
+        if ((positive_edge && (ctrl & C2_POS)) ||
+             (!positive_edge && !(ctrl & C2_POS))) {
+            s->ifr |= 1 << n;
+        }
+        break;
+    case CB1_INT_BIT:
+        ctrl = (s->pcr & CB1_CTRL_MASK) >> CB1_CTRL_SHIFT;
+        if ((positive_edge && (ctrl & C1_POS)) ||
+             (!positive_edge && !(ctrl & C1_POS))) {
+            s->ifr |= 1 << n;
+        }
+        break;
     }
 
-    mos6522_update_irq(s);
+    if (s->ifr != last_ifr) {
+        mos6522_update_irq(s);
+    }
 
     if (level) {
         s->last_irq_levels |= 1 << n;
@@ -250,6 +298,7 @@ uint64_t mos6522_read(void *opaque, hwaddr addr, unsigned size)
 {
     MOS6522State *s = opaque;
     uint32_t val;
+    int ctrl;
     int64_t now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
 
     if (now >= s->timers[0].next_irq_time) {
@@ -263,12 +312,24 @@ uint64_t mos6522_read(void *opaque, hwaddr addr, unsigned size)
     switch (addr) {
     case VIA_REG_B:
         val = s->b;
+        ctrl = (s->pcr & CB2_CTRL_MASK) >> CB2_CTRL_SHIFT;
+        if (!(ctrl & C2_IND)) {
+            s->ifr &= ~CB2_INT;
+        }
+        s->ifr &= ~CB1_INT;
+        mos6522_update_irq(s);
         break;
     case VIA_REG_A:
        qemu_log_mask(LOG_UNIMP, "Read access to register A with handshake");
        /* fall through */
     case VIA_REG_ANH:
         val = s->a;
+        ctrl = (s->pcr & CA2_CTRL_MASK) >> CA2_CTRL_SHIFT;
+        if (!(ctrl & C2_IND)) {
+            s->ifr &= ~CA2_INT;
+        }
+        s->ifr &= ~CA1_INT;
+        mos6522_update_irq(s);
         break;
     case VIA_REG_DIRB:
         val = s->dirb;
@@ -335,6 +396,7 @@ void mos6522_write(void *opaque, hwaddr addr, uint64_t val, unsigned size)
 {
     MOS6522State *s = opaque;
     MOS6522DeviceClass *mdc = MOS6522_GET_CLASS(s);
+    int ctrl;
 
     trace_mos6522_write(addr, mos6522_reg_names[addr], val);
 
@@ -342,6 +404,12 @@ void mos6522_write(void *opaque, hwaddr addr, uint64_t val, unsigned size)
     case VIA_REG_B:
         s->b = (s->b & ~s->dirb) | (val & s->dirb);
         mdc->portB_write(s);
+        ctrl = (s->pcr & CB2_CTRL_MASK) >> CB2_CTRL_SHIFT;
+        if (!(ctrl & C2_IND)) {
+            s->ifr &= ~CB2_INT;
+        }
+        s->ifr &= ~CB1_INT;
+        mos6522_update_irq(s);
         break;
     case VIA_REG_A:
        qemu_log_mask(LOG_UNIMP, "Write access to register A with handshake");
@@ -349,6 +417,12 @@ void mos6522_write(void *opaque, hwaddr addr, uint64_t val, unsigned size)
     case VIA_REG_ANH:
         s->a = (s->a & ~s->dira) | (val & s->dira);
         mdc->portA_write(s);
+        ctrl = (s->pcr & CA2_CTRL_MASK) >> CA2_CTRL_SHIFT;
+        if (!(ctrl & C2_IND)) {
+            s->ifr &= ~CA2_INT;
+        }
+        s->ifr &= ~CA1_INT;
+        mos6522_update_irq(s);
         break;
     case VIA_REG_DIRB:
         s->dirb = val;
diff --git a/include/hw/misc/mos6522.h b/include/hw/misc/mos6522.h
index babea99e06..0bc22a8395 100644
--- a/include/hw/misc/mos6522.h
+++ b/include/hw/misc/mos6522.h
@@ -65,6 +65,21 @@
 #define T1MODE             0xc0    /* Timer 1 mode */
 #define T1MODE_CONT        0x40    /*  continuous interrupts */
 
+/* Bits in PCR */
+#define CB2_CTRL_MASK      0xe0
+#define CB2_CTRL_SHIFT     5
+#define CB1_CTRL_MASK      0x10
+#define CB1_CTRL_SHIFT     4
+#define CA2_CTRL_MASK      0x0e
+#define CA2_CTRL_SHIFT     1
+#define CA1_CTRL_MASK      0x1
+#define CA1_CTRL_SHIFT     0
+
+#define C2_POS             0x2
+#define C2_IND             0x1
+
+#define C1_POS             0x1
+
 /* VIA registers */
 #define VIA_REG_B       0x00
 #define VIA_REG_A       0x01
-- 
2.20.1


