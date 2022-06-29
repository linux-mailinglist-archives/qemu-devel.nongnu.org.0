Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B584560058
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jun 2022 14:45:38 +0200 (CEST)
Received: from localhost ([::1]:34998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6X4b-0002d6-B7
	for lists+qemu-devel@lfdr.de; Wed, 29 Jun 2022 08:45:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o6X06-0007aV-LH; Wed, 29 Jun 2022 08:40:59 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:50846)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o6X04-0004dK-8W; Wed, 29 Jun 2022 08:40:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/0LdAl3a8XS+g0OH0t5akFaU0tsvy7Ot80OGO9/Qa8g=; b=KyFrN4a9IK+rLvVLde+3MghBV3
 rUSvnZNY7gOFMQywmOD/L0G9hH0MN23C7t8JV1N8YP3C3OND0Rx5hRC326Ug/UQcNwAFScL+0jhKg
 OjS7sH2G2SwY2Wrzj/x5a7HwB7umoLIFUOQervNfV7VG8dGe62F7khl+IId72fKA6Ms6JP7khwRTq
 j8y9oTOIrdCKNM2G0+Tq4kVSPFmXm78gtvPzHqVTin0fY7fLJUC//MujaPkuvK7GmjxJqwgXVjLck
 nRwGM+6sBYbn/583YVAGNM2unWdJh0tN+j9yCccF2CAaJD/BYUPz8XlvnJmaho6PqRSeoGtOlJUxV
 uUs+AX/qk+SCl0Ra18u7ohDNMLeCVZZdkLA5lfBJGJpNV5m98D2xT8Jv9o7ZJHd7El6LfXVIkNS38
 XrZurZt0wJccQBYSuAXvU2TzRS0neGDH5yuGp//IOH+mzrvSBgueLWo58M8cG5mg9UABwhTP2VqOx
 ER28174GdADtoJwbQDeB6sPG2V1VQcDrT41zd8OGtlUkZMVcPsvIEJI5wKuSPU7+B3/I8kCth+7wn
 8eawcCcnSxvGkBcqN9JTIlxYGM/XEd0unFIyiOlChjJTz2ovKPfBuA7u747QtiijQTnTcbAkMaQCB
 G61Ga8zkCcIaQxz5hBWXh67Ctjj1J/tcXFGf7TIjA=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o6Wyi-0002tZ-QF; Wed, 29 Jun 2022 13:39:36 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, svens@stackframe.org,
 mst@redhat.com, pbonzini@redhat.com, peter.maydell@linaro.org,
 hpoussin@reactos.org, aleksandar.rikalo@syrmia.com, f4bug@amsat.org,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org
Date: Wed, 29 Jun 2022 13:39:49 +0100
Message-Id: <20220629124026.1077021-4-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220629124026.1077021-1-mark.cave-ayland@ilande.co.uk>
References: <20220629124026.1077021-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 03/40] pl050: change PL050State dev pointer from void to
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


