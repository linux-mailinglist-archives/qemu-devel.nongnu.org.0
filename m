Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D069755B347
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Jun 2022 19:52:57 +0200 (CEST)
Received: from localhost ([::1]:52390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5WRM-0002Y5-UA
	for lists+qemu-devel@lfdr.de; Sun, 26 Jun 2022 13:52:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o5WL4-0002Cq-3n
 for qemu-devel@nongnu.org; Sun, 26 Jun 2022 13:46:26 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:45038)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o5WL2-0008Oc-KE
 for qemu-devel@nongnu.org; Sun, 26 Jun 2022 13:46:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:
 Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=G6JS/joUS82h2wujkBp2Ea2A9lzUQf916n/VgoQVylc=; b=03P9KdE9kfmWVlkyWd7x896R2U
 dJZI82E4ks2syOd434CvvJS9yX+44YEAnmu73scTxww+cLdOlqZSFuQh8Cg0LBJ2XrM/tXgZtJB2H
 ZRJziJgmzasbXnkGB1e49nRCNubhvI/Bh6KX+iWGYP5u26gRPJ6O37Vd0Y1rXY6RumQJkOCY20kb6
 27wBqVTWsDt7/zQ7tMyjEwZWX/SjkEQGc4z9XeMQJj8mMoGaRQz1dBJxqWys83u1Zn5FcDExXhHxU
 ++KfHWXnlusTjnAHGybzRiskwHXaYiw4dvURGcb8A7TNxwc5/TK9YsI39jCb+WEr+VEWpZLuAr7dD
 PMHbBjo5fzRhxzvxOuL1O7L0EYTM1Hnoi+YLS/sTkn4I57WXP7XmyOctG8S6VeLBdPxH9gPMIGE7K
 zx4Co1O1QMgJmLoqYYk5sbQglrEHb/L/1eHa7zF9yCVzgpL5dxt0GrUUJuRV3BjNPDUouJgpZpGUR
 SPcLO1jIjaJaD4RUmioDCth9hc6KvZJONRESX4nGGkH6IE7Qr/WY1jItK42d9ih+ctw6crvia6Efl
 1FA5QD1uD9B9eDT7eKk4snTcOQwqC/mDpEjwPlO6XvHAbB/Y+gce7aYYwJES/B0JjtA5SPacLFSqg
 /7FWAPcFs1OsG0BPkZvAkkema6zGYFHdxKajMDwLM=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o5WJp-0007KY-65; Sun, 26 Jun 2022 18:45:12 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org,
	qemu-devel@nongnu.org
Date: Sun, 26 Jun 2022 18:44:46 +0100
Message-Id: <20220626174531.969187-11-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220626174531.969187-1-mark.cave-ayland@ilande.co.uk>
References: <20220626174531.969187-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PULL 10/55] ps2: implement ps2_kbd_realize() and use it to register
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
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Acked-by: Helge Deller <deller@gmx.de>
Message-Id: <20220624134109.881989-11-mark.cave-ayland@ilande.co.uk>
---
 hw/input/ps2.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/hw/input/ps2.c b/hw/input/ps2.c
index 8018e39b17..62ea4c228b 100644
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
2.30.2


