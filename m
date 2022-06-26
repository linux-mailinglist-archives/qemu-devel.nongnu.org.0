Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 072E155B352
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Jun 2022 19:59:02 +0200 (CEST)
Received: from localhost ([::1]:41584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5WXF-0005w7-2v
	for lists+qemu-devel@lfdr.de; Sun, 26 Jun 2022 13:59:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o5WLQ-00035I-Uw
 for qemu-devel@nongnu.org; Sun, 26 Jun 2022 13:46:48 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:45068)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o5WLP-0008Pw-5D
 for qemu-devel@nongnu.org; Sun, 26 Jun 2022 13:46:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:
 Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mTBDnjeMfjleuZ6uNlkYwnj6Dy8vKD4kLgQGW6RsGVA=; b=Mt/hTzQjmHGSHydDUTNYtEREcW
 LLy+dqyL6qh51jHoIQPxYq4x43rybEMrPysA2bHxeODXXHMn2owOp4iiUGRSc1K/6KCXWKHx5qlPt
 DHpNO0KHfddYkZr2ZUgNKfQg6W9TqWzGwH8tY3VG5PfHvYWBNcPaTT/vQ+B3xeqg9DOAHvW5h8qDt
 3/hinlV4i+ULr1J3Nu+LRh91y46Ujg8vhE1meHUrROO2KG8CWQLxEjMJZGwWiYNQLFeGzRo4MyQCY
 bMBHA2rgx8K3Pw1xOx8AsenT4RYF0fALcgf85GqMwz7mE1U+y1Hl8udW6PFKtJkfubDvoQfYoDTYJ
 7Rsxn01m6KVygIhOYl9hMmPum34+5mNru/rV+MyajhfUcFV3cIEcYnWn+g0Q4JuD2n/uAa3Fpj3sR
 FxAwOv8KWi7MBpeSMI8A8KBi1o4PzS/xODofiWWSUmZQOTk+iEu2rcPI1aIWougPPlj6E1d6rgGRF
 i0eJbsgOqzPaGXLeOqWV5IP932Zu7mKUPcbRBKgPsoLnzXtWDDzQy4xAU1MrsudMHOHa1EaJ16bmj
 aDVFNop3jlGrbZ5OFlmx3i0/2q7HsiGHTXvVFZCUKeIb+sFAozO46EiS5dsu4i5K660fzDGSEM137
 e5sb5aiT6BMziZ7fJFGR93S4cP2M/ZGLf/p/E8CRE=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o5WK4-0007KY-PE; Sun, 26 Jun 2022 18:45:25 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org,
	qemu-devel@nongnu.org
Date: Sun, 26 Jun 2022 18:44:51 +0100
Message-Id: <20220626174531.969187-16-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220626174531.969187-1-mark.cave-ayland@ilande.co.uk>
References: <20220626174531.969187-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PULL 15/55] pl050: split pl050_update_irq() into separate
 pl050_set_irq() and pl050_update_irq() functions
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

This will soon allow pl050_set_irq() to be used as a GPIO input function.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Acked-by: Helge Deller <deller@gmx.de>
Message-Id: <20220624134109.881989-16-mark.cave-ayland@ilande.co.uk>
---
 hw/input/pl050.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/hw/input/pl050.c b/hw/input/pl050.c
index 889a0674d3..66f8c20d9f 100644
--- a/hw/input/pl050.c
+++ b/hw/input/pl050.c
@@ -57,15 +57,20 @@ static const unsigned char pl050_id[] = {
     0x50, 0x10, 0x04, 0x00, 0x0d, 0xf0, 0x05, 0xb1
 };
 
-static void pl050_update(void *opaque, int level)
+static void pl050_update_irq(PL050State *s)
+{
+    int level = (s->pending && (s->cr & 0x10) != 0)
+                 || (s->cr & 0x08) != 0;
+
+    qemu_set_irq(s->irq, level);
+}
+
+static void pl050_set_irq(void *opaque, int level)
 {
     PL050State *s = (PL050State *)opaque;
-    int raise;
 
     s->pending = level;
-    raise = (s->pending && (s->cr & 0x10) != 0)
-            || (s->cr & 0x08) != 0;
-    qemu_set_irq(s->irq, raise);
+    pl050_update_irq(s);
 }
 
 static uint64_t pl050_read(void *opaque, hwaddr offset,
@@ -124,7 +129,7 @@ static void pl050_write(void *opaque, hwaddr offset,
     switch (offset >> 2) {
     case 0: /* KMICR */
         s->cr = value;
-        pl050_update(s, s->pending);
+        pl050_update_irq(s);
         /* ??? Need to implement the enable/disable bit.  */
         break;
     case 2: /* KMIDATA */
@@ -159,9 +164,9 @@ static void pl050_realize(DeviceState *dev, Error **errp)
     sysbus_init_mmio(sbd, &s->iomem);
     sysbus_init_irq(sbd, &s->irq);
     if (s->is_mouse) {
-        s->dev = ps2_mouse_init(pl050_update, s);
+        s->dev = ps2_mouse_init(pl050_set_irq, s);
     } else {
-        s->dev = ps2_kbd_init(pl050_update, s);
+        s->dev = ps2_kbd_init(pl050_set_irq, s);
     }
 }
 
-- 
2.30.2


