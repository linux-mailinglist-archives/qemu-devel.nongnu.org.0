Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2176A530570
	for <lists+qemu-devel@lfdr.de>; Sun, 22 May 2022 21:27:32 +0200 (CEST)
Received: from localhost ([::1]:36486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nsrEh-0006iH-6w
	for lists+qemu-devel@lfdr.de; Sun, 22 May 2022 15:27:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsqCX-0000of-4h; Sun, 22 May 2022 14:21:13 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:48126)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsqCR-0003vf-8a; Sun, 22 May 2022 14:21:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AgQ9tl8RYsUu/xrIDuheT5/OLJSMhx+JYfeSvd2gKeI=; b=ZB1AX+umsPwc27vHIsLUaRm/qt
 ug5JJ32cHdjdyDsBO8kzSJ055JPxstbTyUeblWDM893Bn2Z1xtvFbb7m6M37Jc7OqV//Xap2qqtjY
 P3yXlQYy1OXxx0RyZVWQ1Oa9SI0fwCPGRFNedCu77yPwifXyKGjQ/jcseESKl1ndG1KCuNNNWd9VY
 tUzZoZX2qSvg9G3Ixy8OAIZ+4HKC7eyhDT22z9lrcOlYfNdfZfW3srE4wYdyddGrkcFIDrEry/qLp
 /1OJV5r2jZWS3wayjZ+BlZ2vj/C2hiqyGkzvG4iGGgz+QcXeiNXRqiVU16K8kdV88n29oyHbmPq47
 R0UtXXRCYrNZvdNBTrU+LW+gl2BNnelGIssK6tZBnz363Zxg6+ef9VthPyfprEH/VdyYzPz2eFSyL
 FOt7sNl9lFCRBtlBNu93PvEoZJdAWaFLQnGmhBjK7m2ywtQCxnNMHiK11BulTl4qFMBjxYjPMf0y1
 P/LqZbe3htHRHHiarmFoxfXVWPXgIyNFr7BoNEpP3ztwgfAiTtDQbCgzmUdLmk9yypjT+Ddd1pY79
 sGVlmwS4QkO3Z+Wvu0E/lIyuLLU6X1FjZZbtlufl2DVGpHIFCt98QgvyOz6UyInzO+B4CFm9+hl0Y
 +bksDiyzQ1OxzwSw+Jt5enTSXmJjCWicMNFZ83Fe8=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsqAw-0007pH-Jt; Sun, 22 May 2022 19:19:35 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com,
 pbonzini@redhat.com, peter.maydell@linaro.org, hpoussin@reactos.org,
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, jiaxun.yang@flygoat.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Date: Sun, 22 May 2022 19:18:32 +0100
Message-Id: <20220522181836.864-47-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
References: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 46/50] lasips2: switch over from update_irq() function to PS2
 device gpio
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

Add a qdev gpio input in lasips2_init() by taking the existing lasips2_port_set_irq()
function, updating it accordingly and then renaming to lasips2_set_irq(). Use these
new qdev gpio inputs to wire up the PS2 keyboard and mouse devices.

At the same time set update_irq() and update_arg to NULL in ps2_kbd_init() and
ps2_mouse_init() to ensure that any accidental attempt to use the legacy update_irq()
function will cause a NULL pointer dereference.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/input/lasips2.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/hw/input/lasips2.c b/hw/input/lasips2.c
index 644cf70955..12ff95a05f 100644
--- a/hw/input/lasips2.c
+++ b/hw/input/lasips2.c
@@ -117,6 +117,9 @@ static const char *lasips2_write_reg_name(uint64_t addr)
     }
 }
 
+#define LASIPS2_KBD_INPUT_IRQ      0
+#define LASIPS2_MOUSE_INPUT_IRQ    1
+
 static void lasips2_update_irq(LASIPS2State *s)
 {
     trace_lasips2_intr(s->kbd.irq | s->mouse.irq);
@@ -237,9 +240,10 @@ static const MemoryRegionOps lasips2_reg_ops = {
     .endianness = DEVICE_NATIVE_ENDIAN,
 };
 
-static void lasips2_port_set_irq(void *opaque, int level)
+static void lasips2_set_irq(void *opaque, int n, int level)
 {
-    LASIPS2Port *port = opaque;
+    LASIPS2State *s = LASIPS2(opaque);
+    LASIPS2Port *port = (n ? &s->mouse : &s->kbd);
 
     port->irq = level;
     lasips2_update_irq(port->parent);
@@ -263,8 +267,12 @@ static void lasips2_realize(DeviceState *dev, Error **errp)
 
     vmstate_register(NULL, s->base, &vmstate_lasips2, s);
 
-    s->kbd.dev = ps2_kbd_init(lasips2_port_set_irq, &s->kbd);
-    s->mouse.dev = ps2_mouse_init(lasips2_port_set_irq, &s->mouse);
+    s->kbd.dev = ps2_kbd_init(NULL, NULL);
+    qdev_connect_gpio_out(DEVICE(s->kbd.dev), PS2_DEVICE_IRQ,
+                          qdev_get_gpio_in(dev, LASIPS2_KBD_INPUT_IRQ));
+    s->mouse.dev = ps2_mouse_init(NULL, NULL);
+    qdev_connect_gpio_out(DEVICE(s->mouse.dev), PS2_DEVICE_IRQ,
+                          qdev_get_gpio_in(dev, LASIPS2_MOUSE_INPUT_IRQ));
 }
 
 static void lasips2_init(Object *obj)
@@ -285,6 +293,7 @@ static void lasips2_init(Object *obj)
     sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->mouse.reg);
 
     qdev_init_gpio_out(DEVICE(obj), &s->irq, 1);
+    qdev_init_gpio_in(DEVICE(obj), lasips2_set_irq, 2);
 }
 
 static Property lasips2_properties[] = {
-- 
2.20.1


