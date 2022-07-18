Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F5F578A79
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 21:15:55 +0200 (CEST)
Received: from localhost ([::1]:49916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDWDh-0002Zl-NH
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 15:15:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oDVau-000176-Ff
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 14:35:48 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:49180)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oDVas-0005rG-PV
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 14:35:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:
 Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=huZr1sJnDYuoWztZNIHakdrI76p37PbbgQNbg4Gs7g4=; b=y16HXv4Gdg0Ja5t1l6ftDQqcX7
 B1J9GpENo+9XEiArPae4Xlu8XlqYcf19oEYxokoBRn5g5g/oqoXW/nung+NVhX9cTTUSUaAyRE+8O
 56GzLPEPpq3nD1PaSidDwJGS0ddlDkEUo0q/qfTH/6ITEfAEOAuL4IZUHSpxplj3T6BwQ2vzKIT0K
 TYLhfavrTPFw4Gz9EN/cPZhD0oty7QVd94NTRHv1McUvl+m+hrIqO0VILF8tIAe1rTyR83LbaZdyK
 Zja9CHFxchTkbtaWm77/xrlkvxVa2IO8WdYZ3GFW2pfvT6/lQRZLBi87ENG2xUZciIHX+ZYN4C1nS
 9e7q23CR6WHFHQLAd2IOHIQeoF3QUaKYGaEWTO2TR0YsBNT68KxpGOGO8L9ye/0sgDVsbhH+o7MoY
 I5VFp75OCSEQmaH4J1bdiW4/B2R6PkSOQOxK18euklaqg0TyntmAVaTBFtT6f075Xo7b0oiSHwICj
 ClCoC/DeqrQVM+XDWtAq4PzwPoq0hHynCz8oka5f08VztFWRqueNfYqIxBeykf85E/BJQCsFVKF3W
 ffQn8eSctd/Pqw5lAlZqdIMavWD11PMcLkQ62iuPmURe4qm/9/D174H3FTYTv5oAkjqQWmFOr9Hd5
 FQWOcc/XFX7WImGgWRJbkPF2u+DBPbtX1P1VcVeX4=;
Received: from [2a00:23c4:8ba6:5100:d563:eb67:74b1:7b0] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oDVZM-000B51-TJ; Mon, 18 Jul 2022 19:34:17 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Date: Mon, 18 Jul 2022 19:33:25 +0100
Message-Id: <20220718183339.124253-27-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220718183339.124253-1-mark.cave-ayland@ilande.co.uk>
References: <20220718183339.124253-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba6:5100:d563:eb67:74b1:7b0
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PULL 26/40] lasips2: add named input gpio to port for downstream PS2
 device IRQ
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

The named input gpio is to be connected to the IRQ output of the downstream
PS2 device and used to drive the port IRQ. Initialise the named input gpio
in lasips2_port_init() and add new lasips2_port_class_init() and
lasips2_port_realize() functions to connect the PS2 device output gpio to
the new named input gpio.

Note that the reference to lasips2_port_realize() is stored in
LASIPS2PortDeviceClass but not yet used.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Tested-by: Helge Deller <deller@gmx.de>
Acked-by: Helge Deller <deller@gmx.de>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20220712215251.7944-27-mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/input/lasips2.c         | 32 ++++++++++++++++++++++++++++++--
 include/hw/input/lasips2.h |  2 ++
 2 files changed, 32 insertions(+), 2 deletions(-)

diff --git a/hw/input/lasips2.c b/hw/input/lasips2.c
index 10494a2322..ec1661a8f1 100644
--- a/hw/input/lasips2.c
+++ b/hw/input/lasips2.c
@@ -322,11 +322,35 @@ static const TypeInfo lasips2_info = {
     .class_init    = lasips2_class_init,
 };
 
+static void lasips2_port_set_irq(void *opaque, int n, int level)
+{
+    LASIPS2Port *s = LASIPS2_PORT(opaque);
+
+    qemu_set_irq(s->irq, level);
+}
+
+static void lasips2_port_realize(DeviceState *dev, Error **errp)
+{
+    LASIPS2Port *s = LASIPS2_PORT(dev);
+
+    qdev_connect_gpio_out(DEVICE(s->ps2dev), PS2_DEVICE_IRQ,
+                          qdev_get_gpio_in_named(dev, "ps2-input-irq", 0));
+}
+
 static void lasips2_port_init(Object *obj)
 {
     LASIPS2Port *s = LASIPS2_PORT(obj);
 
     qdev_init_gpio_out(DEVICE(obj), &s->irq, 1);
+    qdev_init_gpio_in_named(DEVICE(obj), lasips2_port_set_irq,
+                            "ps2-input-irq", 1);
+}
+
+static void lasips2_port_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->realize = lasips2_port_realize;
 }
 
 static const TypeInfo lasips2_port_info = {
@@ -360,8 +384,10 @@ static void lasips2_kbd_port_init(Object *obj)
 static void lasips2_kbd_port_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
+    LASIPS2PortDeviceClass *lpdc = LASIPS2_PORT_CLASS(klass);
 
-    dc->realize = lasips2_kbd_port_realize;
+    device_class_set_parent_realize(dc, lasips2_kbd_port_realize,
+                                    &lpdc->parent_realize);
 }
 
 static const TypeInfo lasips2_kbd_port_info = {
@@ -393,8 +419,10 @@ static void lasips2_mouse_port_init(Object *obj)
 static void lasips2_mouse_port_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
+    LASIPS2PortDeviceClass *lpdc = LASIPS2_PORT_CLASS(klass);
 
-    dc->realize = lasips2_mouse_port_realize;
+    device_class_set_parent_realize(dc, lasips2_mouse_port_realize,
+                                    &lpdc->parent_realize);
 }
 
 static const TypeInfo lasips2_mouse_port_info = {
diff --git a/include/hw/input/lasips2.h b/include/hw/input/lasips2.h
index 426aa1371f..35e0aa26eb 100644
--- a/include/hw/input/lasips2.h
+++ b/include/hw/input/lasips2.h
@@ -30,6 +30,8 @@ OBJECT_DECLARE_TYPE(LASIPS2Port, LASIPS2PortDeviceClass, LASIPS2_PORT)
 
 struct LASIPS2PortDeviceClass {
     DeviceClass parent;
+
+    DeviceRealize parent_realize;
 };
 
 typedef struct LASIPS2State LASIPS2State;
-- 
2.30.2


