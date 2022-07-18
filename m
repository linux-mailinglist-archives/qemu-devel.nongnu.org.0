Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1E9E578AAC
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 21:27:44 +0200 (CEST)
Received: from localhost ([::1]:42558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDWP9-0002FL-6o
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 15:27:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oDVac-0000mV-HC
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 14:35:30 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:49150)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oDVaY-0005os-Ma
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 14:35:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:
 Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wpPCvgkjPUAGBHObYnQ+9G3lW7Yc+gdmJLMMZHBdCBQ=; b=enqVS0KB2Q6VMnyZbPG98Cz4nv
 N8lxZ5a8zfBZt6WW/4TCoNlN6yOXKjeIHDs3nySjjhvk2pNXepvKnoKxTfoKJNFieuFbjgOeX6D1a
 Fo+YjmLRF1HVBI1raJ+730CGMkmImkIj4Belxe6lUKLY30pvMUBsMmhj6ZdQI0IlCTFSTTNXm63ZA
 Co8Q1HQ3dOezXREL+GSms5J5rg1ZCAURyKwaQN9ncsPQ4HAexe57jFxYpRzeDZUoUbZEDtjYjKj7O
 zvUy1WYchETs7YGi3aEPoEEoX+P9gPRNFk2IcIMonakr7iSVd5cHEN+C1RlnCgbqly2hDJz0IGzbc
 8MW7PZuuP2RQzXIRbRT1EtCkhN1FTIztsLuM2LB0Jxhl/JLgkgZoETW11ChkYem8XnW/bONZAB3nX
 NJ/vXU4/1UktH+zUleTDaQ7Dz0MBFGBcQwcwjY35oyx1t8wIi785fv+OEMwLFHrwLutPZhISyC8Sg
 glT3EqyyCxQ5E/Ta+vR0sHwP5Tbkt3LqavlXyPfJTgqwcwC7rdrb3l/FvTRIxpmoHCi1IO0LZM0mj
 V16/TWhLGosKj8AYwID1F6gomddkvthXdZ10Bd9rCIw0acI97fBWDW+f2IBaDx84tSN/r4KckTB1+
 CcgxZwXBiEfH/5dEZymu0uzATs6wpm6L70JvGqMCw=;
Received: from [2a00:23c4:8ba6:5100:d563:eb67:74b1:7b0] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oDVZ3-000B51-9c; Mon, 18 Jul 2022 19:33:57 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Date: Mon, 18 Jul 2022 19:33:20 +0100
Message-Id: <20220718183339.124253-22-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220718183339.124253-1-mark.cave-ayland@ilande.co.uk>
References: <20220718183339.124253-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba6:5100:d563:eb67:74b1:7b0
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PULL 21/40] lasips2: introduce lasips2_kbd_port_class_init() and
 lasips2_kbd_port_realize()
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

Introduce a new lasips2_kbd_port_class_init() function which uses a new
lasips2_kbd_port_realize() function to initialise the PS2 keyboard device.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Tested-by: Helge Deller <deller@gmx.de>
Acked-by: Helge Deller <deller@gmx.de>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20220712215251.7944-22-mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/input/lasips2.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/hw/input/lasips2.c b/hw/input/lasips2.c
index 9535cab268..b4fdaed5cb 100644
--- a/hw/input/lasips2.c
+++ b/hw/input/lasips2.c
@@ -268,7 +268,6 @@ static void lasips2_realize(DeviceState *dev, Error **errp)
         return;
     }
 
-    lp->ps2dev = ps2_kbd_init();
     qdev_connect_gpio_out(DEVICE(lp->ps2dev), PS2_DEVICE_IRQ,
                           qdev_get_gpio_in_named(dev, "ps2-kbd-input-irq",
                                                  0));
@@ -331,6 +330,13 @@ static const TypeInfo lasips2_port_info = {
     .abstract      = true,
 };
 
+static void lasips2_kbd_port_realize(DeviceState *dev, Error **errp)
+{
+    LASIPS2Port *lp = LASIPS2_PORT(dev);
+
+    lp->ps2dev = ps2_kbd_init();
+}
+
 static void lasips2_kbd_port_init(Object *obj)
 {
     LASIPS2KbdPort *s = LASIPS2_KBD_PORT(obj);
@@ -342,11 +348,19 @@ static void lasips2_kbd_port_init(Object *obj)
     lp->parent = container_of(s, LASIPS2State, kbd_port);
 }
 
+static void lasips2_kbd_port_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->realize = lasips2_kbd_port_realize;
+}
+
 static const TypeInfo lasips2_kbd_port_info = {
     .name          = TYPE_LASIPS2_KBD_PORT,
     .parent        = TYPE_LASIPS2_PORT,
     .instance_size = sizeof(LASIPS2KbdPort),
     .instance_init = lasips2_kbd_port_init,
+    .class_init    = lasips2_kbd_port_class_init,
 };
 
 static void lasips2_mouse_port_init(Object *obj)
-- 
2.30.2


