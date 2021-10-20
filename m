Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0F5A434C98
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 15:48:35 +0200 (CEST)
Received: from localhost ([::1]:48658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdBxK-0004zy-T7
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 09:48:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mdBrK-0004PG-Bo
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 09:42:22 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:56430
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mdBrI-0002lQ-On
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 09:42:22 -0400
Received: from [2a00:23c4:8b9d:f500:9396:df17:737c:b32c] (helo=kentang.home)
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mdBr3-00011V-4N; Wed, 20 Oct 2021 14:42:05 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: laurent@vivier.eu,
	qemu-devel@nongnu.org
Date: Wed, 20 Oct 2021 14:41:28 +0100
Message-Id: <20211020134131.4392-6-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211020134131.4392-1-mark.cave-ayland@ilande.co.uk>
References: <20211020134131.4392-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8b9d:f500:9396:df17:737c:b32c
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 5/8] q800: wire up auxmode GPIO to GLUE
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

This enables the GLUE logic to change its CPU level IRQ routing depending upon
whether the hardware has been configured for A/UX mode.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/m68k/q800.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/hw/m68k/q800.c b/hw/m68k/q800.c
index 81c335bf16..0093872d89 100644
--- a/hw/m68k/q800.c
+++ b/hw/m68k/q800.c
@@ -100,6 +100,7 @@ struct GLUEState {
     SysBusDevice parent_obj;
     M68kCPU *cpu;
     uint8_t ipr;
+    uint8_t auxmode;
 };
 
 #define GLUE_IRQ_IN_VIA1       0
@@ -145,11 +146,19 @@ static void GLUE_set_irq(void *opaque, int irq, int level)
     m68k_set_irq_level(s->cpu, 0, 0);
 }
 
+static void glue_auxmode_set_irq(void *opaque, int irq, int level)
+{
+    GLUEState *s = GLUE(opaque);
+
+    s->auxmode = level;
+}
+
 static void glue_reset(DeviceState *dev)
 {
     GLUEState *s = GLUE(dev);
 
     s->ipr = 0;
+    s->auxmode = 0;
 }
 
 static const VMStateDescription vmstate_glue = {
@@ -158,6 +167,7 @@ static const VMStateDescription vmstate_glue = {
     .minimum_version_id = 0,
     .fields = (VMStateField[]) {
         VMSTATE_UINT8(ipr, GLUEState),
+        VMSTATE_UINT8(auxmode, GLUEState),
         VMSTATE_END_OF_LIST(),
     },
 };
@@ -178,6 +188,7 @@ static void glue_init(Object *obj)
     DeviceState *dev = DEVICE(obj);
 
     qdev_init_gpio_in(dev, GLUE_set_irq, 8);
+    qdev_init_gpio_in_named(dev, glue_auxmode_set_irq, "auxmode", 1);
 }
 
 static void glue_class_init(ObjectClass *klass, void *data)
@@ -308,6 +319,9 @@ static void q800_init(MachineState *machine)
     sysbus_realize_and_unref(sysbus, &error_fatal);
     sysbus_mmio_map(sysbus, 1, VIA_BASE);
     sysbus_connect_irq(sysbus, 0, qdev_get_gpio_in(glue, GLUE_IRQ_IN_VIA1));
+    /* A/UX mode */
+    qdev_connect_gpio_out(via1_dev, 0,
+                          qdev_get_gpio_in_named(glue, "auxmode", 0));
 
     adb_bus = qdev_get_child_bus(via1_dev, "adb.0");
     dev = qdev_new(TYPE_ADB_KEYBOARD);
-- 
2.20.1


