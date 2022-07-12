Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B73D75728F7
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jul 2022 00:06:22 +0200 (CEST)
Received: from localhost ([::1]:56980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBO1N-0004Tj-Nv
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 18:06:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oBNqB-0003mB-Hx; Tue, 12 Jul 2022 17:54:47 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:42322)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oBNqA-0007vO-0o; Tue, 12 Jul 2022 17:54:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Nv+MjNauFM7d8s3RY2hSbgxq4uIv0MM6IJKLOjx0wjo=; b=DH5E8hhWDqeaLs375zK3f8SVXO
 9EhqwJ1B/+C05V4d0Mg5Kd8WbCvrAzdtRCxca/Wym8bJcnU/qvV0vcrfo5oCWloCrK/Dzn7Iahx5p
 4ay3GfiwpGJC4MlU7RsrRRgMV3rNOj3tjJeP7nZEweRPgU4WCn4/xGHWL9VcIMXaUWrzfCuT3Fe51
 rXLhPPJE+MkcmI0LncMyTvICkqaELnbeIrQUF20Onyc/0KjvNrL71Rt1mQ9UH47+AYUg8PX8SJMnW
 94VZhRzoVWAsJlvoS5UJ55Hx+nzh2y1H/eVCJsNzkcqYEQIAo/WTB5Dd9FUjgvMznaex/RCZiyYGo
 wngvFL/icf5AuENzZFjy2WaQb8x4kG0IsARhjKrm43nyiGOeQbn++tn/5yov507OwKiVk1Z9WeSt3
 SWzPKO5sSb6+cKsgWxBh89sYSRNA48Ed/rViIllHISxXGfM+ivWQdexleVMnt2o6FdyDDsibiQzKY
 f3FOx47t1oKhSmig5hMI00JosMfxlpAduiHAa7SP82DEIUguSNyPg01P9jVniyKIpxpCxJ0kKRprC
 Ast5zXsyJc3RVy3gpBz3NlMfwVKiyPblm17+qee0el4Kyw3Cfg9+i3/uWoxu/DnpcysfgDs5EZ+p2
 mYeDhhJdXXNuRpC2jIw20ONRj5KGOte3NyWa1JNEM=;
Received: from [2a00:23c4:8ba5:df00:fd7d:1c3a:1dd0:c576] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oBNoP-000Bqt-PR; Tue, 12 Jul 2022 22:53:01 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, svens@stackframe.org,
 pbonzini@redhat.com, peter.maydell@linaro.org, hpoussin@reactos.org,
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Date: Tue, 12 Jul 2022 22:52:33 +0100
Message-Id: <20220712215251.7944-23-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220712215251.7944-1-mark.cave-ayland@ilande.co.uk>
References: <20220712215251.7944-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba5:df00:fd7d:1c3a:1dd0:c576
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 22/40] lasips2: introduce lasips2_mouse_port_class_init()
 and lasips2_mouse_port_realize()
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


