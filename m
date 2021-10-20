Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64191434C6F
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 15:45:02 +0200 (CEST)
Received: from localhost ([::1]:41138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdBtt-000835-Bm
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 09:45:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mdBrS-0004XR-ON
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 09:42:32 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:56446
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mdBrR-0002sF-3b
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 09:42:30 -0400
Received: from [2a00:23c4:8b9d:f500:9396:df17:737c:b32c] (helo=kentang.home)
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mdBr7-00011V-NL; Wed, 20 Oct 2021 14:42:13 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: laurent@vivier.eu,
	qemu-devel@nongnu.org
Date: Wed, 20 Oct 2021 14:41:31 +0100
Message-Id: <20211020134131.4392-9-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211020134131.4392-1-mark.cave-ayland@ilande.co.uk>
References: <20211020134131.4392-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8b9d:f500:9396:df17:737c:b32c
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 8/8] q800: add NMI handler
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

This allows the programmer's switch to be triggered via the monitor for debugging
purposes. Since the CPU level 7 interrupt is level-triggered, use a timer to hold
the NMI active for 100ms before releasing it again.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewied-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/m68k/q800.c | 47 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/hw/m68k/q800.c b/hw/m68k/q800.c
index 83fde39298..a081051a8d 100644
--- a/hw/m68k/q800.c
+++ b/hw/m68k/q800.c
@@ -28,6 +28,7 @@
 #include "cpu.h"
 #include "hw/boards.h"
 #include "hw/or-irq.h"
+#include "hw/nmi.h"
 #include "elf.h"
 #include "hw/loader.h"
 #include "ui/console.h"
@@ -102,12 +103,14 @@ struct GLUEState {
     uint8_t ipr;
     uint8_t auxmode;
     qemu_irq irqs[1];
+    QEMUTimer *nmi_release;
 };
 
 #define GLUE_IRQ_IN_VIA1       0
 #define GLUE_IRQ_IN_VIA2       1
 #define GLUE_IRQ_IN_SONIC      2
 #define GLUE_IRQ_IN_ESCC       3
+#define GLUE_IRQ_IN_NMI        4
 
 #define GLUE_IRQ_NUBUS_9       0
 
@@ -167,6 +170,10 @@ static void GLUE_set_irq(void *opaque, int irq, int level)
             irq = 3;
             break;
 
+        case GLUE_IRQ_IN_NMI:
+            irq = 6;
+            break;
+
         default:
             g_assert_not_reached();
         }
@@ -189,6 +196,10 @@ static void GLUE_set_irq(void *opaque, int irq, int level)
             irq = 3;
             break;
 
+        case GLUE_IRQ_IN_NMI:
+            irq = 6;
+            break;
+
         default:
             g_assert_not_reached();
         }
@@ -216,12 +227,30 @@ static void glue_auxmode_set_irq(void *opaque, int irq, int level)
     s->auxmode = level;
 }
 
+static void glue_nmi(NMIState *n, int cpu_index, Error **errp)
+{
+    GLUEState *s = GLUE(n);
+
+    /* Hold NMI active for 100ms */
+    GLUE_set_irq(s, GLUE_IRQ_IN_NMI, 1);
+    timer_mod(s->nmi_release, qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL) + 100);
+}
+
+static void glue_nmi_release(void *opaque)
+{
+    GLUEState *s = GLUE(opaque);
+
+    GLUE_set_irq(s, GLUE_IRQ_IN_NMI, 0);
+}
+
 static void glue_reset(DeviceState *dev)
 {
     GLUEState *s = GLUE(dev);
 
     s->ipr = 0;
     s->auxmode = 0;
+
+    timer_del(s->nmi_release);
 }
 
 static const VMStateDescription vmstate_glue = {
@@ -231,6 +260,7 @@ static const VMStateDescription vmstate_glue = {
     .fields = (VMStateField[]) {
         VMSTATE_UINT8(ipr, GLUEState),
         VMSTATE_UINT8(auxmode, GLUEState),
+        VMSTATE_TIMER_PTR(nmi_release, GLUEState),
         VMSTATE_END_OF_LIST(),
     },
 };
@@ -246,6 +276,13 @@ static Property glue_properties[] = {
     DEFINE_PROP_END_OF_LIST(),
 };
 
+static void glue_finalize(Object *obj)
+{
+    GLUEState *s = GLUE(obj);
+
+    timer_free(s->nmi_release);
+}
+
 static void glue_init(Object *obj)
 {
     DeviceState *dev = DEVICE(obj);
@@ -255,15 +292,20 @@ static void glue_init(Object *obj)
     qdev_init_gpio_in_named(dev, glue_auxmode_set_irq, "auxmode", 1);
 
     qdev_init_gpio_out(dev, s->irqs, 1);
+
+    /* NMI release timer */
+    s->nmi_release = timer_new_ms(QEMU_CLOCK_VIRTUAL, glue_nmi_release, s);
 }
 
 static void glue_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
+    NMIClass *nc = NMI_CLASS(klass);
 
     dc->vmsd = &vmstate_glue;
     dc->reset = glue_reset;
     device_class_set_props(dc, glue_properties);
+    nc->nmi_monitor_handler = glue_nmi;
 }
 
 static const TypeInfo glue_info = {
@@ -271,7 +313,12 @@ static const TypeInfo glue_info = {
     .parent = TYPE_SYS_BUS_DEVICE,
     .instance_size = sizeof(GLUEState),
     .instance_init = glue_init,
+    .instance_finalize = glue_finalize,
     .class_init = glue_class_init,
+    .interfaces = (InterfaceInfo[]) {
+         { TYPE_NMI },
+         { }
+    },
 };
 
 static void main_cpu_reset(void *opaque)
-- 
2.20.1


