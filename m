Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9662E55B388
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Jun 2022 20:34:28 +0200 (CEST)
Received: from localhost ([::1]:51724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5X5W-0003vZ-LK
	for lists+qemu-devel@lfdr.de; Sun, 26 Jun 2022 14:34:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o5WNO-0004tV-0T
 for qemu-devel@nongnu.org; Sun, 26 Jun 2022 13:48:50 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:45260)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o5WNM-0000GL-AZ
 for qemu-devel@nongnu.org; Sun, 26 Jun 2022 13:48:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HQkoPwsImv45VDlQctHLH1Icq4Wy4yM2X6rr1GWdsFg=; b=STn0peYAjJ+T7AWAUtA+EP9RJR
 Q7uaLiX8eFkMeP/w6Hi4WdKBI4VVvJoe7c0HXjCIplFi8DtSPZjrT8MJ5pwwbXUNkh//6sm5tbUjt
 jdMQ5AkvozTsmZl0AV2YuTDNEwXNOy6duE9WwCcbFT8HQrpxl4eAY1/Mb82t1MyYsKTcsXpHF/7Re
 xXWbAkfif2MPvZhyqF7W6686cRgfOik1QO60XuCOslu1U8Xl+uC8CcrdFLxfV9Sha5WyNbjmeeue0
 gDUlTGjIAGv0VqTo0wDaFaF+DIDAVBRRqxI42Pxv6R3XwmNJftNcKphVrcwNo4XkC/YFx37s2ITQw
 4RJEXpDYfdatVx91u3y+5orXjZDOVyjhP1unKeUPjETHIkKPKCJxh+/9E072w8JRO8i2eWLSQsxcO
 2pzA9CZ9YCOUvuqRozK8BvFUx+uRFDbADRJcRNokwi9kHJ8VeRl6Fste1vMIo6NByxGeF5S4L/ezW
 ndVTYVPS2GfaU94eN045D3c84CdlGyru5S0OxO9hWceTFT859k3faxj6dwX+vH7+Qh5YacSIqzPIm
 O0vBjcLc3/0OnDrqpcTkr35WIgB4xfI3rS6L867PAw5SfSlWEcgx61Lo/eG63OFTN/IcCXkeoB070
 g3IP4f7UOXheAH45XWppgr9a/G5/IW2Nk6pAIHOLI=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o5WLy-0007KY-LE; Sun, 26 Jun 2022 18:47:26 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org,
	qemu-devel@nongnu.org
Date: Sun, 26 Jun 2022 18:45:23 +0100
Message-Id: <20220626174531.969187-48-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220626174531.969187-1-mark.cave-ayland@ilande.co.uk>
References: <20220626174531.969187-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PULL 47/55] lasips2: switch over from update_irq() function to PS2
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
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Acked-by: Helge Deller <deller@gmx.de>
Message-Id: <20220624134109.881989-48-mark.cave-ayland@ilande.co.uk>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/input/lasips2.c | 29 +++++++++++++++++++++++++----
 1 file changed, 25 insertions(+), 4 deletions(-)

diff --git a/hw/input/lasips2.c b/hw/input/lasips2.c
index bd72505411..a6e14e0e6b 100644
--- a/hw/input/lasips2.c
+++ b/hw/input/lasips2.c
@@ -237,9 +237,19 @@ static const MemoryRegionOps lasips2_reg_ops = {
     .endianness = DEVICE_NATIVE_ENDIAN,
 };
 
-static void lasips2_port_set_irq(void *opaque, int level)
+static void lasips2_set_kbd_irq(void *opaque, int n, int level)
 {
-    LASIPS2Port *port = opaque;
+    LASIPS2State *s = LASIPS2(opaque);
+    LASIPS2Port *port = &s->kbd;
+
+    port->irq = level;
+    lasips2_update_irq(port->parent);
+}
+
+static void lasips2_set_mouse_irq(void *opaque, int n, int level)
+{
+    LASIPS2State *s = LASIPS2(opaque);
+    LASIPS2Port *port = &s->mouse;
 
     port->irq = level;
     lasips2_update_irq(port->parent);
@@ -264,8 +274,14 @@ static void lasips2_realize(DeviceState *dev, Error **errp)
 
     vmstate_register(NULL, s->base, &vmstate_lasips2, s);
 
-    s->kbd.dev = ps2_kbd_init(lasips2_port_set_irq, &s->kbd);
-    s->mouse.dev = ps2_mouse_init(lasips2_port_set_irq, &s->mouse);
+    s->kbd.dev = ps2_kbd_init(NULL, NULL);
+    qdev_connect_gpio_out(DEVICE(s->kbd.dev), PS2_DEVICE_IRQ,
+                          qdev_get_gpio_in_named(dev, "ps2-kbd-input-irq",
+                                                 0));
+    s->mouse.dev = ps2_mouse_init(NULL, NULL);
+    qdev_connect_gpio_out(DEVICE(s->mouse.dev), PS2_DEVICE_IRQ,
+                          qdev_get_gpio_in_named(dev, "ps2-mouse-input-irq",
+                                                 0));
 }
 
 static void lasips2_init(Object *obj)
@@ -286,6 +302,11 @@ static void lasips2_init(Object *obj)
     sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->mouse.reg);
 
     sysbus_init_irq(SYS_BUS_DEVICE(obj), &s->irq);
+
+    qdev_init_gpio_in_named(DEVICE(obj), lasips2_set_kbd_irq,
+                            "ps2-kbd-input-irq", 1);
+    qdev_init_gpio_in_named(DEVICE(obj), lasips2_set_mouse_irq,
+                            "ps2-mouse-input-irq", 1);
 }
 
 static Property lasips2_properties[] = {
-- 
2.30.2


