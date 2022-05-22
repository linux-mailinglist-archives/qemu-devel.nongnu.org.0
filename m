Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1254853052F
	for <lists+qemu-devel@lfdr.de>; Sun, 22 May 2022 20:33:41 +0200 (CEST)
Received: from localhost ([::1]:47688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nsqOZ-0001Os-Um
	for lists+qemu-devel@lfdr.de; Sun, 22 May 2022 14:33:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsqAq-0006u2-JA; Sun, 22 May 2022 14:19:32 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:47498)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsqAp-0003ZM-5w; Sun, 22 May 2022 14:19:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4Rn7s6j/2/PqPyRoJlkfv/QncADpDni4z9RRy5nqK1c=; b=YE0abgVbw3MLE9LwW3U9i/b3Ks
 V1UD7YV7G8Y+bhKWChfg4cshrnCdyYnHUuY4nQZ8Ma5wtPizOx/cMU+FLBEHF/4cUjYG94uJnKnVb
 MWzWT4LvB4TzEWBj01fAigT7bIxP1udQv29hQ/3KzVxb4+krRBoOK1KAVhRZE77kIDxmi5vroRAK2
 2pUMMYnBiv1W4EBH5R2pINkTBIXR+hzPtJRYuBg0Vrc/6WaXaEP4YYz0N4AbcHKa2b83JbU4kSQP2
 xeO1chcuijTXnOzebIzixU7zQx7YDbz1VlLpat0bMpvMGFDcYtTaT2c+8TBfRDztdvPilDcjLkQ8Q
 r2BGKxWgYI6PVfslozt74H9TF/L5nuk+0GjsiiQRcIVkx1zRE8YqosWqQtUlr8m7RXLIA9Z1/sQ2a
 Tf9KbyrhOz9x4KQV4f0LVEPRsIwO1ez1T1t9AUavPzHE+Ku9xZakvaCPaShhY/Nu3xdXtAOn/HhJA
 zLs9tkiH6ffLKlc6Z/Ax2Urq6vBdxHv1gpTbupMA0GAO3GphCS5Kox0krjHWcG82KdS8wJKpO7MYf
 ns4hoW7tqo6/Ttft1v4WGdvJKZmwvunjN0+Z5DsvbaVHcyO+k28YXmcKIQSg2ZJhSKx0F/RBdUj4k
 GxDBD4dwMC72QIT7maRV2UeiYQ/Gjo6+dFswX3sCI=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsq9g-0007pH-6e; Sun, 22 May 2022 19:18:20 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com,
 pbonzini@redhat.com, peter.maydell@linaro.org, hpoussin@reactos.org,
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, jiaxun.yang@flygoat.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Date: Sun, 22 May 2022 19:17:56 +0100
Message-Id: <20220522181836.864-11-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
References: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 10/50] ps2: implement ps2_kbd_realize() and use it to register
 ps2_keyboard_handler
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

Move the registration of ps2_keyboard_handler from ps2_kbd_init() to a new
ps2_kbd_realize() function. Since the abstract PS2_DEVICE parent class doesn't
have a realize() function then it is not necessary to store the reference to
it in PS2DeviceClass and use device_class_set_parent_realize().

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/input/ps2.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/hw/input/ps2.c b/hw/input/ps2.c
index 555abb5392..2abd6510ab 100644
--- a/hw/input/ps2.c
+++ b/hw/input/ps2.c
@@ -1213,6 +1213,11 @@ static QemuInputHandler ps2_keyboard_handler = {
     .event = ps2_keyboard_event,
 };
 
+static void ps2_kbd_realize(DeviceState *dev, Error **errp)
+{
+    qemu_input_handler_register(dev, &ps2_keyboard_handler);
+}
+
 void *ps2_kbd_init(void (*update_irq)(void *, int), void *update_arg)
 {
     DeviceState *dev;
@@ -1228,8 +1233,7 @@ void *ps2_kbd_init(void (*update_irq)(void *, int), void *update_arg)
     ps2->update_irq = update_irq;
     ps2->update_arg = update_arg;
     vmstate_register(NULL, 0, &vmstate_ps2_keyboard, s);
-    qemu_input_handler_register((DeviceState *)s,
-                                &ps2_keyboard_handler);
+
     return s;
 }
 
@@ -1265,6 +1269,7 @@ static void ps2_kbd_class_init(ObjectClass *klass, void *data)
     DeviceClass *dc = DEVICE_CLASS(klass);
     PS2DeviceClass *ps2dc = PS2_DEVICE_CLASS(klass);
 
+    dc->realize = ps2_kbd_realize;
     device_class_set_parent_reset(dc, ps2_kbd_reset, &ps2dc->parent_reset);
 }
 
-- 
2.20.1


