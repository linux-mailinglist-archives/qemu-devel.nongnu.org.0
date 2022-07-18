Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06D19578A4E
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 21:07:48 +0200 (CEST)
Received: from localhost ([::1]:34702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDW5r-00075Q-1G
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 15:07:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oDVae-0000p4-FW
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 14:35:34 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:49156)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oDVac-0005pE-Ua
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 14:35:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:
 Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JlWvlkX1Ne6yT3ExBKpq3/VcuLkupj1yyMXsauJrXQw=; b=UopQfdqiZJS8hYhL1WSrt8nq42
 5wDvTHkCRJXdJpNHSrCe8bJLmp+SbwEGOCF0wnvn23b23tQm3Q1gnuwlTPQ+TIdUcF+AWXkodVHps
 olVNpE9+MdIFgGKYvpVaFHpZHZf1n7RQLYUntcjA9WQ75QOb+pbMKbKz0IMj9ACMs7L3DalD4lraN
 1f17MoLff/h6LWiw7P7LyAfpv3AjkdMdfUYIbM4oWTsxrczBRLTHQ7OiBotdaKa/+IldIUwoGVBdv
 OJnVpHnIAwZp4hwHENKnERNLgdMzh7BrFMuuvOnc1v3c2P6I/1Vt2K8wHW0W6kPufAEjF2GxJHX4s
 HOG2nnizcU5v6W8ECpzf15lQvQzIj6tj1E2w/LCDLeuqu3Eg5objHmY3vNC/ZYLpeRO63QtwSUJd+
 ml018KmUzB+M4A4bOiafSfu55Bx1uWo2ar2CaJpEqwBMWrNzOpG6oihmVzzgbe9dXFgTAc0mm4y+u
 VoLMR+URh3NI/HGikB1rxqPqGkZCMx+58VFK705ycQvvtSPCdVyF4oCuk5sI73qq1Ui5p+IzKnUdD
 xE4floXGfQKoGaP1BQDBYkx8U5pxNufSQ7x3KDTRafZ0ftOUHlzv6G82jZmdgbO18AWNDHkwv2hM2
 Zk5KCgGdyLAjJdgbXZv4scIsUNLFZlWtYa+fLswuQ=;
Received: from [2a00:23c4:8ba6:5100:d563:eb67:74b1:7b0] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oDVZ7-000B51-G4; Mon, 18 Jul 2022 19:34:01 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Date: Mon, 18 Jul 2022 19:33:21 +0100
Message-Id: <20220718183339.124253-23-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220718183339.124253-1-mark.cave-ayland@ilande.co.uk>
References: <20220718183339.124253-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba6:5100:d563:eb67:74b1:7b0
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PULL 22/40] lasips2: introduce lasips2_mouse_port_class_init() and
 lasips2_mouse_port_realize()
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

Introduce a new lasips2_mouse_port_class_init() function which uses a new
lasips2_mouse_port_realize() function to initialise the PS2 mouse device.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Tested-by: Helge Deller <deller@gmx.de>
Acked-by: Helge Deller <deller@gmx.de>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20220712215251.7944-23-mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/input/lasips2.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/hw/input/lasips2.c b/hw/input/lasips2.c
index b4fdaed5cb..ce87c66f2a 100644
--- a/hw/input/lasips2.c
+++ b/hw/input/lasips2.c
@@ -277,7 +277,6 @@ static void lasips2_realize(DeviceState *dev, Error **errp)
         return;
     }
 
-    lp->ps2dev = ps2_mouse_init();
     qdev_connect_gpio_out(DEVICE(lp->ps2dev), PS2_DEVICE_IRQ,
                           qdev_get_gpio_in_named(dev, "ps2-mouse-input-irq",
                                                  0));
@@ -363,6 +362,13 @@ static const TypeInfo lasips2_kbd_port_info = {
     .class_init    = lasips2_kbd_port_class_init,
 };
 
+static void lasips2_mouse_port_realize(DeviceState *dev, Error **errp)
+{
+    LASIPS2Port *lp = LASIPS2_PORT(dev);
+
+    lp->ps2dev = ps2_mouse_init();
+}
+
 static void lasips2_mouse_port_init(Object *obj)
 {
     LASIPS2MousePort *s = LASIPS2_MOUSE_PORT(obj);
@@ -374,11 +380,19 @@ static void lasips2_mouse_port_init(Object *obj)
     lp->parent = container_of(s, LASIPS2State, mouse_port);
 }
 
+static void lasips2_mouse_port_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->realize = lasips2_mouse_port_realize;
+}
+
 static const TypeInfo lasips2_mouse_port_info = {
     .name          = TYPE_LASIPS2_MOUSE_PORT,
     .parent        = TYPE_LASIPS2_PORT,
     .instance_size = sizeof(LASIPS2MousePort),
     .instance_init = lasips2_mouse_port_init,
+    .class_init    = lasips2_mouse_port_class_init,
 };
 
 static void lasips2_register_types(void)
-- 
2.30.2


