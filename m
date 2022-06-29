Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C5B556009F
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jun 2022 15:06:23 +0200 (CEST)
Received: from localhost ([::1]:37374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6XOe-0000Q8-B2
	for lists+qemu-devel@lfdr.de; Wed, 29 Jun 2022 09:06:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o6X0h-0008G1-IQ; Wed, 29 Jun 2022 08:41:35 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:51016)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o6X0f-0004h9-VF; Wed, 29 Jun 2022 08:41:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UnDgBCQ1nazf6CWSvGa/E4M/V4s1Kwdeqy2ihWnMyQY=; b=HRab6Z9Q0TFuDBK6glc6OdxHNz
 YASlTxFnasw7piOSwjE1B6eZo2WlEkAVs0EU87ucv2PRNwEpMuoU/8/CcB4xUlCRMeKuxM4zz1cCh
 oZkc/w/p2LTZ4DyQ+lA+NczIfns4O7859aBGSaXMqJYeJiQi4Hr7frTGUCRgFf8jKjyrlGpucXR8x
 7yLWJ0Gb2y3djXdYwyIN7J8k0omOdDp3vMeRc0RE8dmmiAGaLiXVoo2Yig7mEpHNJ+d4Moi7H8rC5
 mo86ugH/0bjDh5eLb8Wn7edc2KlKV6LZ1le8037d4YXJYBm6q4d7vuvctUlFibgoQX+L0GtrO18Md
 LfsEvyVMAcZlWngIH/0cW7uCBhVXFccGfCcagXIijajvBTuCphsjQetPYBCqx+7TPD5/LqEgtR2dF
 CAyr5CzQO/csXsTePT/TOfZhPfrqtOgnSIW1IuC/y6RUgw3+LZ43rc6HkgtZiqBMgWl15wYs1VjUs
 r7FarD9AUACEu4ss7NiphXroImMx9eb8M9plM89ddPLs6LJ2XTnfuXQ8GWhW1+i5Xm/5hXanz0V+7
 WEUjYxl5hFvpU8bQVi3aAHBikM0vZSeIZqPNGVyGw/Wpd50NVUYnV2Dwa3OKmVa/TwWKPkx9mEk+7
 j/P/GFgoYrIoGY2ZuLnHo/JWN5ZUhQcjrG7cdzq5s=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o6Wz4-0002tZ-GJ; Wed, 29 Jun 2022 13:39:54 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, svens@stackframe.org,
 mst@redhat.com, pbonzini@redhat.com, peter.maydell@linaro.org,
 hpoussin@reactos.org, aleksandar.rikalo@syrmia.com, f4bug@amsat.org,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org
Date: Wed, 29 Jun 2022 13:40:01 +0100
Message-Id: <20220629124026.1077021-16-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220629124026.1077021-1-mark.cave-ayland@ilande.co.uk>
References: <20220629124026.1077021-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 15/40] lasips2: change LASIPS2State dev pointer from void to
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
---
 hw/input/lasips2.c         | 16 ++++++++--------
 include/hw/input/lasips2.h |  3 ++-
 2 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/hw/input/lasips2.c b/hw/input/lasips2.c
index 48237816a3..b539c4de7a 100644
--- a/hw/input/lasips2.c
+++ b/hw/input/lasips2.c
@@ -146,9 +146,9 @@ static void lasips2_reg_write(void *opaque, hwaddr addr, uint64_t val,
         }
 
         if (port->id) {
-            ps2_write_mouse(port->dev, val);
+            ps2_write_mouse(PS2_MOUSE_DEVICE(port->ps2dev), val);
         } else {
-            ps2_write_keyboard(port->dev, val);
+            ps2_write_keyboard(PS2_KBD_DEVICE(port->ps2dev), val);
         }
         break;
 
@@ -181,7 +181,7 @@ static uint64_t lasips2_reg_read(void *opaque, hwaddr addr, unsigned size)
             break;
         }
 
-        ret = ps2_read_data(port->dev);
+        ret = ps2_read_data(port->ps2dev);
         break;
 
     case REG_PS2_CONTROL:
@@ -206,7 +206,7 @@ static uint64_t lasips2_reg_read(void *opaque, hwaddr addr, unsigned size)
                 ret |= LASIPS2_STATUS_RBNE;
             }
         } else {
-            if (!ps2_queue_empty(port->dev)) {
+            if (!ps2_queue_empty(port->ps2dev)) {
                 ret |= LASIPS2_STATUS_RBNE;
             }
         }
@@ -259,12 +259,12 @@ static void lasips2_realize(DeviceState *dev, Error **errp)
 {
     LASIPS2State *s = LASIPS2(dev);
 
-    s->kbd.dev = ps2_kbd_init();
-    qdev_connect_gpio_out(DEVICE(s->kbd.dev), PS2_DEVICE_IRQ,
+    s->kbd.ps2dev = ps2_kbd_init();
+    qdev_connect_gpio_out(DEVICE(s->kbd.ps2dev), PS2_DEVICE_IRQ,
                           qdev_get_gpio_in_named(dev, "ps2-kbd-input-irq",
                                                  0));
-    s->mouse.dev = ps2_mouse_init();
-    qdev_connect_gpio_out(DEVICE(s->mouse.dev), PS2_DEVICE_IRQ,
+    s->mouse.ps2dev = ps2_mouse_init();
+    qdev_connect_gpio_out(DEVICE(s->mouse.ps2dev), PS2_DEVICE_IRQ,
                           qdev_get_gpio_in_named(dev, "ps2-mouse-input-irq",
                                                  0));
 }
diff --git a/include/hw/input/lasips2.h b/include/hw/input/lasips2.h
index 868c5521d7..9746b7a132 100644
--- a/include/hw/input/lasips2.h
+++ b/include/hw/input/lasips2.h
@@ -23,12 +23,13 @@
 
 #include "exec/hwaddr.h"
 #include "hw/sysbus.h"
+#include "hw/input/ps2.h"
 
 struct LASIPS2State;
 typedef struct LASIPS2Port {
     struct LASIPS2State *parent;
     MemoryRegion reg;
-    void *dev;
+    PS2State *ps2dev;
     uint8_t id;
     uint8_t control;
     uint8_t buf;
-- 
2.30.2


