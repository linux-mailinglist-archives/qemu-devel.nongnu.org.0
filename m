Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 912B8559B7A
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 16:26:05 +0200 (CEST)
Received: from localhost ([::1]:40950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4kG4-0001tI-Ky
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 10:26:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o4jbG-0003MG-Ty; Fri, 24 Jun 2022 09:43:55 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:42208)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o4jbF-0005L8-Fu; Fri, 24 Jun 2022 09:43:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UjCk8nbDxOm4YyqZIvcD6JDjQvWB3UJaiziOYbgdFpY=; b=Xh3KrhTQBNLUsD8nI9XSmbRy1g
 clwyaGGqAJrueb8jsfCCVf4x3ipqvY9UImvILPoTWiOSTT+6JNWnXgWTZ7zpDhWYp94EiNwyLul7C
 usurWXYcx/MC06gnjaKaqHcVJwNC5nQVeOc6OTsCQ777noJ/2XzoxX3kf+Aq94siKVcAIpHIz0/Ye
 Bfc1+fF9YVLTAVpA4X7g9zcmiMg0iZWPZeZ/SshhbKkI9r0Umlj9IfUG2l4aU8RwmGQ5T+lFc9r0C
 mt/q6lWj9boGOY8oJGbTkTVm8j4BNHeCC23Agv5NTPl42webgeW0EHNAnud/0iHDJz+8vGb7Jm0fM
 sTclcJZ1xGOz7zZz9Z6qwpUG5i4MbQ4YSYOuaVtHt8HvoGp/dZGLXFPbwEHRWcqDqAdMbS87VN5B5
 tad4q12YKghBi6z2meLU/U/2edl0lemnOcgs/hK13R2OclGINLBtSMYLB0d7XZQ48Jg1Dpzfp6M/f
 +IWii0THUqAafqF+utnoPaHW1ZzUqt5BwE7PEFvrxa2x1fAdeF7iEiv/MxNR1r6KvVW2AO3knZMM8
 txmSxmtDiVvxGpnSPYSGP4LQQEXlazi4H+lh3qNWm70o1ImNcCaX8w94Bsf0L/zZoxtKlKaWTptg7
 GQkANkyCloErm/CqbQmeqNlwyrXrXGbN4CEnmEBlU=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o4jZd-00037t-6F; Fri, 24 Jun 2022 14:42:17 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com,
 pbonzini@redhat.com, peter.maydell@linaro.org, hpoussin@reactos.org,
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, jiaxun.yang@flygoat.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Date: Fri, 24 Jun 2022 14:40:51 +0100
Message-Id: <20220624134109.881989-37-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220624134109.881989-1-mark.cave-ayland@ilande.co.uk>
References: <20220624134109.881989-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 36/54] pl050: switch over from update_irq() function to PS2
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


