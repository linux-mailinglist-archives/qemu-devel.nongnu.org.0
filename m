Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88C23560104
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jun 2022 15:16:23 +0200 (CEST)
Received: from localhost ([::1]:54806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6XYM-00046s-4F
	for lists+qemu-devel@lfdr.de; Wed, 29 Jun 2022 09:16:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o6X13-0000A1-JN; Wed, 29 Jun 2022 08:41:57 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:51124)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o6X11-0004jl-Vy; Wed, 29 Jun 2022 08:41:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pXChNeiqlOgeRrdBdv3SwZYw1TaXTqA7Klk5m97k/gE=; b=X/uscyMCibT8HGOIEulPLhcPVi
 I9HxpNfnA5howu6Dqx29mYPagcDsOV6lvtMxkuJ/cx2WOspmbvcb+kvQF5t/cvzvzjGHpUd1YXIzQ
 8/cWGD+xgd4zb4xBpZ7MxCEPNdHuggQ4YwBB+gRi/I77tH6jhPs7yoQyU/8wSz7cKztIucP0Fd7S9
 fWshzWavEOLYPjwbcIqyVI6kMFOVW0Tc9L+bv6VT0TsuO4ekHTVaFTRtEaEKV+DorRLF2V7/d1UFM
 oEbmJhkK3FpFLqGeij6H0KLmq8SKSIKoF3KpdBYGyC33kF/fHeUIUVrQbP1qNAH445TlNF2KArObY
 uEkf9oLBspEZ6BE5lASTYUznc4yCkrT6tGpUKgbwgovpyZ+q73X+Dg31HbX+KmSACczS9eDgtbuLq
 GSOplpPc7NVStMOlOH/ykp6R0uD0PzfuX+WOk5eSN4FAylwRifB1KH/ew+5AoOLY9qPwCtz8mE3gR
 JTxDDsY9/Xxiu5O84nHW6yWX/L5MZMQNLI0iUEo4RpS5LPtpY9MBzyD4pVSwMnpAFH1TbC7erEC4H
 H/HI56OnOFuzBHXWheISviNut9sweBC2kTs3uqCb961l34u5AfoTgijgPinPJUqrP4FPdQwoj13+I
 5Nq70z7QASRMiTRUUWgUfaoXnX6u8m5b9KONcP/aI=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o6WzM-0002tZ-MY; Wed, 29 Jun 2022 13:40:16 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, svens@stackframe.org,
 mst@redhat.com, pbonzini@redhat.com, peter.maydell@linaro.org,
 hpoussin@reactos.org, aleksandar.rikalo@syrmia.com, f4bug@amsat.org,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org
Date: Wed, 29 Jun 2022 13:40:07 +0100
Message-Id: <20220629124026.1077021-22-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220629124026.1077021-1-mark.cave-ayland@ilande.co.uk>
References: <20220629124026.1077021-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 21/40] lasips2: introduce lasips2_kbd_port_class_init() and
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


