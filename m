Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF6BF5789C9
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 20:51:20 +0200 (CEST)
Received: from localhost ([::1]:35840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDVpv-0001rD-Ps
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 14:51:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oDVZH-0007xG-OL
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 14:34:12 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:49044)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oDVZF-0005Wv-Pk
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 14:34:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:
 Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=n2JqZKu5e42y4DYwNVbIWEZty650iAFPFT1H7oR1Erk=; b=YyujgR2rhH5faoYST6iX+BKjlU
 RdwF5Lz9a+gOx+9ZjnHwQR1SCIsVjDh0b5OMKj78d8LhMa8F/8IhFN8ioiIOXNK8ZZK+sBt5mNrxY
 ksHUYTwimvWvqPuVGeEAEUwQCdu3JQU2GframaJpJcaMxGdB9c+X1dwA0z4C8m9wY6uzAEmxPKR4P
 hEccOZVr7sf6k78TutuUitLkmc5j22FJzBChjVsHSJFktru478GYooLjBMaU/bHvh8/rszZQMLaVm
 dNDoTQGARm0CTw9CPcQQg/NAGtquAK6xWG1Elyg+7sydoCS1WTFIL6qeVouCgZE/yiVJOrFpUA2tS
 xOz1N17W7EeI/Cx7HNR8aXCj9B3hUpsJobu7TVN7nAoy72T/aE3NCka+zrDOS0sRnPIV0mv9AEzFh
 YdFroTzVtuoGYHbVRabmqh9konkTJoBoa7LTS4zfQimEZgaSURiRLiuYB3/XQcOtVSxMdrwHm8ZFU
 tIQWyR0e992ddMvxRTEjTW0TjtxYFnf+nhWrsZPcxHWXcnmwqR8aMXQ1fbpiwViJo6taofq09CEg5
 r9huaG918asS5XFT2aW1Dp4fTwQmN6RvNiWEFce6lK/SanL+22C1HpHMbJkiFStNyUHd95fxpeKqm
 xZ8e5cFrWf52s9t3mQR1hxA8HFTQVTedbbFYnh2JI=;
Received: from [2a00:23c4:8ba6:5100:d563:eb67:74b1:7b0] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oDVXs-000B51-Nr; Mon, 18 Jul 2022 19:32:45 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Date: Mon, 18 Jul 2022 19:33:02 +0100
Message-Id: <20220718183339.124253-4-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220718183339.124253-1-mark.cave-ayland@ilande.co.uk>
References: <20220718183339.124253-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba6:5100:d563:eb67:74b1:7b0
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PULL 03/40] pl050: change PL050State dev pointer from void to
 PS2State
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

This allows the compiler to enforce that the PS2 device pointer is always of
type PS2State. Update the name of the pointer from dev to ps2dev to emphasise
this type change.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Tested-by: Helge Deller <deller@gmx.de>
Acked-by: Helge Deller <deller@gmx.de>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20220712215251.7944-4-mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/input/pl050.c         | 13 +++++++------
 include/hw/input/pl050.h |  2 +-
 2 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/hw/input/pl050.c b/hw/input/pl050.c
index 8e32b8ed46..0d91b0eaea 100644
--- a/hw/input/pl050.c
+++ b/hw/input/pl050.c
@@ -101,7 +101,7 @@ static uint64_t pl050_read(void *opaque, hwaddr offset,
         }
     case 2: /* KMIDATA */
         if (s->pending) {
-            s->last = ps2_read_data(s->dev);
+            s->last = ps2_read_data(s->ps2dev);
         }
         return s->last;
     case 3: /* KMICLKDIV */
@@ -130,9 +130,9 @@ static void pl050_write(void *opaque, hwaddr offset,
         /* ??? This should toggle the TX interrupt line.  */
         /* ??? This means kbd/mouse can block each other.  */
         if (s->is_mouse) {
-            ps2_write_mouse(s->dev, value);
+            ps2_write_mouse(PS2_MOUSE_DEVICE(s->ps2dev), value);
         } else {
-            ps2_write_keyboard(s->dev, value);
+            ps2_write_keyboard(PS2_KBD_DEVICE(s->ps2dev), value);
         }
         break;
     case 3: /* KMICLKDIV */
@@ -158,11 +158,12 @@ static void pl050_realize(DeviceState *dev, Error **errp)
     sysbus_init_mmio(sbd, &s->iomem);
     sysbus_init_irq(sbd, &s->irq);
     if (s->is_mouse) {
-        s->dev = ps2_mouse_init();
+        s->ps2dev = ps2_mouse_init();
     } else {
-        s->dev = ps2_kbd_init();
+        s->ps2dev = ps2_kbd_init();
     }
-    qdev_connect_gpio_out(DEVICE(s->dev), PS2_DEVICE_IRQ,
+
+    qdev_connect_gpio_out(DEVICE(s->ps2dev), PS2_DEVICE_IRQ,
                           qdev_get_gpio_in_named(dev, "ps2-input-irq", 0));
 }
 
diff --git a/include/hw/input/pl050.h b/include/hw/input/pl050.h
index 2bbf7a9d50..c1f6c5a1fb 100644
--- a/include/hw/input/pl050.h
+++ b/include/hw/input/pl050.h
@@ -23,7 +23,7 @@ struct PL050State {
     SysBusDevice parent_obj;
 
     MemoryRegion iomem;
-    void *dev;
+    PS2State *ps2dev;
     uint32_t cr;
     uint32_t clk;
     uint32_t last;
-- 
2.30.2


