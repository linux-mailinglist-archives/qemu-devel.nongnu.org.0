Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEDDE56006B
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jun 2022 14:53:17 +0200 (CEST)
Received: from localhost ([::1]:45538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6XBz-0002of-F7
	for lists+qemu-devel@lfdr.de; Wed, 29 Jun 2022 08:53:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o6X0E-0007dz-Fb; Wed, 29 Jun 2022 08:41:08 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:50882)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o6X0C-0004ev-HM; Wed, 29 Jun 2022 08:41:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UWILSGlR6dlI19vHCngeYgExrt7TVeG6tbsNRBKmHr0=; b=B5NylDc1YaQQXyiOAVuLtVoJTb
 E0dfGLh7q1LcTR/O0eF6FEgMxjUXXvEhkUFecuN7+O61x+F5xnQc3wzQlGUqJLf8Ne0br1pbOgvR+
 +FyKaYKRAHVzWBy3ddUwsTCYA2XJDCiqwCXmQTHMu5KQA0xXu5Ixt0T38WM1fPCCEAtIf+y4GmzaB
 9v0to5Y5tONhbA3BqB6e1ahwlOBJD5sqBzESPHQXR8QjPLkX5SiRjKNAJwJKIBo1E87N8M0cw9f6b
 33pUxQqeQw0xEDBjeFjS3u6N23k4ZO/0QXFCXAkBzMxxgpN8Wj3/5VGhKo0PFIQwPiGa4AM3mVex+
 GmReS6wxVnXr2U59ejeAWGeg6UF7FupCnKjn+NkCpPc6Z3fsIIlzcgPCpRfNRpMQK/Ein1hGoNQ9E
 mjibdh0KIPpkWbuMT+eJlzJBbx4oclhqKoSfypRAZEzZzv0z3U2qSfCY2BCqOmK+yNA3uExesuuPr
 MI+2edgdU6hH75dqKnX7cy3S1vLQyRJv/BDv8gGWYWTMi6OnpgoNkReA3OVJdOOoYI74YPHzrUuAa
 m7HSUF4hEHU/3IK2SN4VtdLp3Aeccv95/f0ThQ/3m0+knTRR250kqu1Pqng01Hbj8RbEsHzh5O6KV
 eAg420bKVz1E4zOFW+h5oXRzTyM+FR7QQqrbmh7KM=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o6Wys-0002tZ-RK; Wed, 29 Jun 2022 13:39:47 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, svens@stackframe.org,
 mst@redhat.com, pbonzini@redhat.com, peter.maydell@linaro.org,
 hpoussin@reactos.org, aleksandar.rikalo@syrmia.com, f4bug@amsat.org,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org
Date: Wed, 29 Jun 2022 13:39:54 +0100
Message-Id: <20220629124026.1077021-9-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220629124026.1077021-1-mark.cave-ayland@ilande.co.uk>
References: <20220629124026.1077021-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 08/40] pl050: introduce pl050_kbd_class_init() and
 pl050_kbd_realize()
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

Introduce a new pl050_kbd_class_init() function containing a call to
device_class_set_parent_realize() which calls a new pl050_kbd_realize()
function to initialise the PS2 keyboard device.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/input/pl050.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/hw/input/pl050.c b/hw/input/pl050.c
index d7796b73a1..24363c007e 100644
--- a/hw/input/pl050.c
+++ b/hw/input/pl050.c
@@ -155,14 +155,21 @@ static void pl050_realize(DeviceState *dev, Error **errp)
 
     if (s->is_mouse) {
         s->ps2dev = ps2_mouse_init();
-    } else {
-        s->ps2dev = ps2_kbd_init();
     }
 
     qdev_connect_gpio_out(DEVICE(s->ps2dev), PS2_DEVICE_IRQ,
                           qdev_get_gpio_in_named(dev, "ps2-input-irq", 0));
 }
 
+static void pl050_kbd_realize(DeviceState *dev, Error **errp)
+{
+    PL050DeviceClass *pdc = PL050_GET_CLASS(dev);
+    PL050State *ps = PL050(dev);
+
+    ps->ps2dev = ps2_kbd_init();
+    pdc->parent_realize(dev, errp);
+}
+
 static void pl050_kbd_init(Object *obj)
 {
     PL050State *s = PL050(obj);
@@ -177,11 +184,21 @@ static void pl050_mouse_init(Object *obj)
     s->is_mouse = true;
 }
 
+static void pl050_kbd_class_init(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+    PL050DeviceClass *pdc = PL050_CLASS(oc);
+
+    device_class_set_parent_realize(dc, pl050_kbd_realize,
+                                    &pdc->parent_realize);
+}
+
 static const TypeInfo pl050_kbd_info = {
     .name          = TYPE_PL050_KBD_DEVICE,
     .parent        = TYPE_PL050,
     .instance_init = pl050_kbd_init,
     .instance_size = sizeof(PL050KbdState),
+    .class_init    = pl050_kbd_class_init,
 };
 
 static const TypeInfo pl050_mouse_info = {
-- 
2.30.2


