Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7484D4372A7
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Oct 2021 09:23:15 +0200 (CEST)
Received: from localhost ([::1]:59828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdotW-0000vl-Hp
	for lists+qemu-devel@lfdr.de; Fri, 22 Oct 2021 03:23:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mdonk-00010c-Bw
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 03:17:16 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:36657)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mdong-0003Iy-J2
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 03:17:16 -0400
Received: from quad ([82.142.24.54]) by mrelayeu.kundenserver.de (mreue010
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MatmF-1nF5Yr3paV-00cTB7; Fri, 22
 Oct 2021 09:17:11 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 8/9] q800: add NMI handler
Date: Fri, 22 Oct 2021 09:17:04 +0200
Message-Id: <20211022071705.471954-9-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211022071705.471954-1-laurent@vivier.eu>
References: <20211022071705.471954-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Br282fpXttVP0qBf8ZRrsR1u2lGO+QtO9uNxaX0pMcmwX0Ogk5K
 N7/2lk2T4PCmBZXIHYu6b4WaX7K8p7+/SzQWQWr9A+oNyzud7iceV1uHoH8psBZ4p2XjSX/
 Uev36UdhixA7PhPyrxsMJm+5FlBHg0lZ42Po4y59PZXQz55b2CF/ANkhE+bDV9WCHa+yahm
 mGfbQUdX7Wq+rcyfLs3dA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:0XoiA+e1dR0=:fVs4oNMJBTs8FR3efjg0me
 TjUpRBCrftugtXsxOHPjb9d/fNwJgDK0ePZkMDrZYvcgeYJRpMmgrgbm4MF6UEyR+XKqMzOEv
 0ZV4FKPMpZ9/qpe+c2N9en62ORnUfO23GxvujBMh691cgkJeydfPk9BV5kA4t5HQ1jsMMyijS
 BbKpDbhXWa8VXSbx3bJ4EzLlXiwfotZzUtNG+pdKQA/11uMoL28IZhVK7IYloW4JQWyLCmGR9
 ggqxriG5C2mHzhipyI3mKxJvRA5+8/7zF8OuJ0uq8QBry+9U0+ACpzbGzElbs90qPtB4O5E04
 yZORd7KsVba1Ek/Eeh1IF/b5zVWEiimirjiXFC58g3FAzJiazjD01JgR/sjMxarlbK3OzdyY1
 m0NX0McaiGmvGv9tsT61dtanWE00Ay5EUNT0Jn7e1a7+Ds9tvjC1TMZrAEdhtbFPhNEpV408k
 PGfr4MhHoD1OrsdzuxoYgouXAnpr0Nbx5XTwb9aNLQ/0jDkfQlTV4IdzVWbBU17keQjabD1UE
 UQ8kxlPf/NC2dePkvNw2kTbMFAcYc0fJ/Tdy2r4TFKW5/ep/9RWDbw6Sa4WPXNBpOkGUvVv5n
 6J9wAYKUN/bOZIWc11poNJhM2u/INAg8a9+Q9ME9ITXLPrA52MssFnhM3+D5mMojClE+9v0rI
 DrsLAyY78hE3BSR4T8AhC+3OGyiS/mcrZI9H9BsuPI52eeibUK+3rQ+nAacqESSiK3wc=
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

This allows the programmer's switch to be triggered via the monitor for debugging
purposes. Since the CPU level 7 interrupt is level-triggered, use a timer to hold
the NMI active for 100ms before releasing it again.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewied-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20211020134131.4392-9-mark.cave-ayland@ilande.co.uk>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/m68k/q800.c | 47 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/hw/m68k/q800.c b/hw/m68k/q800.c
index 83fde3929834..a081051a8dd5 100644
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
2.31.1


