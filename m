Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE7F35789E2
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 20:56:12 +0200 (CEST)
Received: from localhost ([::1]:46364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDVud-0002Js-Om
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 14:56:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oDVZe-0008Jc-2U
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 14:34:30 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:49078)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oDVZc-0005Z4-EX
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 14:34:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:
 Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HjXmZwi2YPoZjCnlb40gNszw34DPNKEad7/HYN+GQIQ=; b=hnJjP8hayw1nGhW163WIecPMIe
 r4Z26yx29c4XKbM78k5NzNXfbRt4XcdbWbHoKieT5FZYnRaiB1+ncXrgPiVhB9CI2MSIo0zYaGXxl
 OW+jIutchbi69WqptNgGg3qtJW+KThWYFtAyjPtUFEtmbRYnhM8ER2/a3jrws3bZeqXQ38O1QGctj
 xErqkkYih60FY4gZtpZOgXYC37QP/7gdjQsDuu3e7E3zUBUhV3y7TKXP0th7lmP/sLRIlQYiSWitm
 Wmx8IhW/sdi0NS/WkgTjjwAMs5VLv3jW5b5gdHJiVk047U9Un70kd0EVtBxAOx1h4GgOjTaNuDMnq
 Y5dMOYpWqoIj6f5UFPlU4LVuRacerYWgrvskEMp8eYdegJCL6dFfyGkRiUfp8eN9bfxsYNsgRj53D
 03gE65U/ALickugZxoKrsd4dJaz7gFCOd4lxqH+uweMLroe4nN7PWKw20makvaM9+3mRRbhpCkjLo
 Np9WmVq/4EV1W3PmqjV1L8wElYb4Eng+VpbIN62EwtlxCikS2gC9uKbcFA/7tHMr075pesuMKG4HR
 hy4RYxXPGos4n25NiAbe9axW3n9cI5TF1EEn5Wea5GDLJbK8eB9NmbBRByv9+gu7Jj0HgW7cIV+lb
 n74fg1XWLUIwt6KbE/j+uhP/R1gwQcxXT87hwnfuk=;
Received: from [2a00:23c4:8ba6:5100:d563:eb67:74b1:7b0] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oDVYH-000B51-2G; Mon, 18 Jul 2022 19:33:09 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Date: Mon, 18 Jul 2022 19:33:08 +0100
Message-Id: <20220718183339.124253-10-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220718183339.124253-1-mark.cave-ayland@ilande.co.uk>
References: <20220718183339.124253-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba6:5100:d563:eb67:74b1:7b0
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PULL 09/40] pl050: introduce pl050_mouse_class_init() and
 pl050_mouse_realize()
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

Introduce a new pl050_mouse_class_init() function containing a call to
device_class_set_parent_realize() which calls a new pl050_mouse_realize()
function to initialise the PS2 mouse device.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Tested-by: Helge Deller <deller@gmx.de>
Acked-by: Helge Deller <deller@gmx.de>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20220712215251.7944-10-mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/input/pl050.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/hw/input/pl050.c b/hw/input/pl050.c
index 24363c007e..fcc40758a3 100644
--- a/hw/input/pl050.c
+++ b/hw/input/pl050.c
@@ -153,10 +153,6 @@ static void pl050_realize(DeviceState *dev, Error **errp)
 {
     PL050State *s = PL050(dev);
 
-    if (s->is_mouse) {
-        s->ps2dev = ps2_mouse_init();
-    }
-
     qdev_connect_gpio_out(DEVICE(s->ps2dev), PS2_DEVICE_IRQ,
                           qdev_get_gpio_in_named(dev, "ps2-input-irq", 0));
 }
@@ -177,6 +173,15 @@ static void pl050_kbd_init(Object *obj)
     s->is_mouse = false;
 }
 
+static void pl050_mouse_realize(DeviceState *dev, Error **errp)
+{
+    PL050DeviceClass *pdc = PL050_GET_CLASS(dev);
+    PL050State *ps = PL050(dev);
+
+    ps->ps2dev = ps2_mouse_init();
+    pdc->parent_realize(dev, errp);
+}
+
 static void pl050_mouse_init(Object *obj)
 {
     PL050State *s = PL050(obj);
@@ -201,11 +206,21 @@ static const TypeInfo pl050_kbd_info = {
     .class_init    = pl050_kbd_class_init,
 };
 
+static void pl050_mouse_class_init(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+    PL050DeviceClass *pdc = PL050_CLASS(oc);
+
+    device_class_set_parent_realize(dc, pl050_mouse_realize,
+                                    &pdc->parent_realize);
+}
+
 static const TypeInfo pl050_mouse_info = {
     .name          = TYPE_PL050_MOUSE_DEVICE,
     .parent        = TYPE_PL050,
     .instance_init = pl050_mouse_init,
     .instance_size = sizeof(PL050MouseState),
+    .class_init    = pl050_mouse_class_init,
 };
 
 static void pl050_init(Object *obj)
-- 
2.30.2


