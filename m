Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D782434C96
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 15:47:55 +0200 (CEST)
Received: from localhost ([::1]:47704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdBwg-0004Lg-I3
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 09:47:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mdBrL-0004Qm-RW
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 09:42:24 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:56436
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mdBrJ-0002lq-AT
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 09:42:23 -0400
Received: from [2a00:23c4:8b9d:f500:9396:df17:737c:b32c] (helo=kentang.home)
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mdBr3-00011V-Eh; Wed, 20 Oct 2021 14:42:05 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: laurent@vivier.eu,
	qemu-devel@nongnu.org
Date: Wed, 20 Oct 2021 14:41:29 +0100
Message-Id: <20211020134131.4392-7-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211020134131.4392-1-mark.cave-ayland@ilande.co.uk>
References: <20211020134131.4392-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8b9d:f500:9396:df17:737c:b32c
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 6/8] q800: route SONIC on-board Ethernet IRQ via nubus IRQ
 9 in classic mode
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

When the hardware is operating in classic mode the SONIC on-board Ethernet IRQ is
routed to nubus IRQ 9 instead of directly to the CPU at level 3. This does not
affect the framebuffer which although it exists in slot 9, has its own
dedicated IRQ on the Quadra 800 hardware.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/m68k/q800.c | 57 ++++++++++++++++++++++++++++++++++++--------------
 1 file changed, 41 insertions(+), 16 deletions(-)

diff --git a/hw/m68k/q800.c b/hw/m68k/q800.c
index 0093872d89..7a8de089f4 100644
--- a/hw/m68k/q800.c
+++ b/hw/m68k/q800.c
@@ -101,6 +101,7 @@ struct GLUEState {
     M68kCPU *cpu;
     uint8_t ipr;
     uint8_t auxmode;
+    qemu_irq irqs[1];
 };
 
 #define GLUE_IRQ_IN_VIA1       0
@@ -108,27 +109,40 @@ struct GLUEState {
 #define GLUE_IRQ_IN_SONIC      2
 #define GLUE_IRQ_IN_ESCC       3
 
+#define GLUE_IRQ_NUBUS_9       0
+
 static void GLUE_set_irq(void *opaque, int irq, int level)
 {
     GLUEState *s = opaque;
     int i;
 
-    switch (irq) {
-    case GLUE_IRQ_IN_VIA1:
-        irq = 5;
-        break;
-
-    case GLUE_IRQ_IN_VIA2:
-        irq = 1;
-        break;
-
-    case GLUE_IRQ_IN_SONIC:
-        irq = 2;
-        break;
-
-    case GLUE_IRQ_IN_ESCC:
-        irq = 3;
-        break;
+    if (s->auxmode) {
+        /* Classic mode */
+        switch (irq) {
+        case GLUE_IRQ_IN_SONIC:
+            /* Route to VIA2 instead */
+            qemu_set_irq(s->irqs[GLUE_IRQ_NUBUS_9], level);
+            return;
+        }
+    } else {
+        /* A/UX mode */
+        switch (irq) {
+        case GLUE_IRQ_IN_VIA1:
+            irq = 5;
+            break;
+
+        case GLUE_IRQ_IN_VIA2:
+            irq = 1;
+            break;
+
+        case GLUE_IRQ_IN_SONIC:
+            irq = 2;
+            break;
+
+        case GLUE_IRQ_IN_ESCC:
+            irq = 3;
+            break;
+        }
     }
 
     if (level) {
@@ -186,9 +200,12 @@ static Property glue_properties[] = {
 static void glue_init(Object *obj)
 {
     DeviceState *dev = DEVICE(obj);
+    GLUEState *s = GLUE(dev);
 
     qdev_init_gpio_in(dev, GLUE_set_irq, 8);
     qdev_init_gpio_in_named(dev, glue_auxmode_set_irq, "auxmode", 1);
+
+    qdev_init_gpio_out(dev, s->irqs, 1);
 }
 
 static void glue_class_init(ObjectClass *klass, void *data)
@@ -454,6 +471,14 @@ static void q800_init(MachineState *machine)
                                                      VIA2_NUBUS_IRQ_9 + i));
     }
 
+    /*
+     * Since the framebuffer in slot 0x9 uses a separate IRQ, wire the unused
+     * IRQ via GLUE for use by SONIC Ethernet in classic mode
+     */
+    qdev_connect_gpio_out(glue, GLUE_IRQ_NUBUS_9,
+                          qdev_get_gpio_in_named(via2_dev, "nubus-irq",
+                                                 VIA2_NUBUS_IRQ_9));
+
     nubus = &NUBUS_BRIDGE(dev)->bus;
 
     /* framebuffer in nubus slot #9 */
-- 
2.20.1


