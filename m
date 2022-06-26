Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 922B355B364
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Jun 2022 20:12:07 +0200 (CEST)
Received: from localhost ([::1]:46830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5Wju-0003cP-Lg
	for lists+qemu-devel@lfdr.de; Sun, 26 Jun 2022 14:12:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o5WMl-00048K-Tp
 for qemu-devel@nongnu.org; Sun, 26 Jun 2022 13:48:14 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:45194)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o5WMi-0000Bo-8R
 for qemu-devel@nongnu.org; Sun, 26 Jun 2022 13:48:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Nt/5+eB9QW9rdJcmBBwJHYEcRho05ayp0AUk0xz9jZI=; b=AKQi/Wn/N+DcsaThVykeyxJcow
 gCnwPkKy2vEBSVTIDdBzgnP/koq86xp7AtsuGTRd9zpBJhlyzTWRhKYVo69AEsdYLygcBZkPnvBfp
 82KLaiKBU+5BPu+ft9b7QlqhCXT/nsgKKKvsh8wARAoDDDdjD55H9/RjEcnwv/Vd1bEnyC4mFOAAp
 HCRHBDKPCMs4BeLcsa3gr3IJaw+c7uOjmdrJCW+DGX/E0WlZE9fRSm6TaV1rv3Bb+VYYi1gymlhEE
 Z/e/4S+jSFqhG8niUAvBBJ6MNP/tWhRBpIsZ96e4IXG4UebcBioGAF5ooWvqQRPhtqTyuRscegYXH
 iOO045atOLH/RXAMHoFXRIynwrCVZ1+0M9sFME0/zWVQz3FtDkzO/O2xw4TyoU4uAMprft8ci/yug
 pLBV+GmHUy6pCEU6DWj/9ClDvy/Zx+KzaCi364G+zz6fwE1xTQFhHbA95SVrm8scOppeL4xm2T6UA
 EQ/Hbv0a516A4zT/Npty8zis9PYVh9CM9tHesWk2FO5pWtT/97qN5d47IR+wlJPPgPWEgL5sHRAVx
 ZDVRYZb5m7FecXAhJcq26d9lC1bP+vXDhcoNxF4Mtlx+y2mjQH/9uBniluWcqvMeoJCwfZLssitUJ
 0MXUD3qhU7sKebJDl7yMp0sMPU3wYHxQl6GtW+EMs=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o5WLK-0007KY-Ag; Sun, 26 Jun 2022 18:46:46 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org,
	qemu-devel@nongnu.org
Date: Sun, 26 Jun 2022 18:45:12 +0100
Message-Id: <20220626174531.969187-37-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220626174531.969187-1-mark.cave-ayland@ilande.co.uk>
References: <20220626174531.969187-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PULL 36/55] pl050: switch over from update_irq() function to PS2
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

Add a new pl050_init() function which initialises a qdev input gpio for handling
incoming PS2 IRQs, and then wire up the PS2 device to use it. At the same time
set update_irq() and update_arg to NULL in ps2_kbd_init() and ps2_mouse_init()
to ensure that any accidental attempt to use the legacy update_irq() function will
cause a NULL pointer dereference.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Acked-by: Helge Deller <deller@gmx.de>
Message-Id: <20220624134109.881989-37-mark.cave-ayland@ilande.co.uk>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/input/pl050.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/hw/input/pl050.c b/hw/input/pl050.c
index 66f8c20d9f..c665a4fc99 100644
--- a/hw/input/pl050.c
+++ b/hw/input/pl050.c
@@ -65,7 +65,7 @@ static void pl050_update_irq(PL050State *s)
     qemu_set_irq(s->irq, level);
 }
 
-static void pl050_set_irq(void *opaque, int level)
+static void pl050_set_irq(void *opaque, int n, int level)
 {
     PL050State *s = (PL050State *)opaque;
 
@@ -164,10 +164,12 @@ static void pl050_realize(DeviceState *dev, Error **errp)
     sysbus_init_mmio(sbd, &s->iomem);
     sysbus_init_irq(sbd, &s->irq);
     if (s->is_mouse) {
-        s->dev = ps2_mouse_init(pl050_set_irq, s);
+        s->dev = ps2_mouse_init(NULL, NULL);
     } else {
-        s->dev = ps2_kbd_init(pl050_set_irq, s);
+        s->dev = ps2_kbd_init(NULL, NULL);
     }
+    qdev_connect_gpio_out(DEVICE(s->dev), PS2_DEVICE_IRQ,
+                          qdev_get_gpio_in_named(dev, "ps2-input-irq", 0));
 }
 
 static void pl050_keyboard_init(Object *obj)
@@ -196,6 +198,11 @@ static const TypeInfo pl050_mouse_info = {
     .instance_init = pl050_mouse_init,
 };
 
+static void pl050_init(Object *obj)
+{
+    qdev_init_gpio_in_named(DEVICE(obj), pl050_set_irq, "ps2-input-irq", 1);
+}
+
 static void pl050_class_init(ObjectClass *oc, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(oc);
@@ -207,6 +214,7 @@ static void pl050_class_init(ObjectClass *oc, void *data)
 static const TypeInfo pl050_type_info = {
     .name          = TYPE_PL050,
     .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_init = pl050_init,
     .instance_size = sizeof(PL050State),
     .abstract      = true,
     .class_init    = pl050_class_init,
-- 
2.30.2


