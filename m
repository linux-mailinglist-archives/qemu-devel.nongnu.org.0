Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA8C1559AD5
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 16:01:57 +0200 (CEST)
Received: from localhost ([::1]:58062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4jsi-0004NY-TG
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 10:01:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o4ja3-0001C7-SE; Fri, 24 Jun 2022 09:42:41 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:41810)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o4ja2-00059c-9C; Fri, 24 Jun 2022 09:42:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:
 Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YcsPtnedy787CRYrviUMvRysA7y4KFa7Jb53DABOCoc=; b=ouWEs6uFDIzVJLzpNxdVcSWAup
 BKQXikYHWBXDR0KfglDcE6ewvJeLtqeQQBsxA0/5QqqB2pdH7G7GWvC9J7hzr5kxY3xn5V7KeAXDP
 eo3Vcq3WF6jneXWdYndD1iR+bcHj10q1uRUBflO7Ajsg6tLTfBSyHP2xAmqnY7qw9+cyam55zKMYz
 wU8kTwXoGTc+Wf5Sk6a0r0zxyq2Ub5+slKRQKx7Necw5DQS/+YdES6SEPYZui4OFhZ5rUuVkB4m+T
 9EPxI3OgzO9wt4vvZbQ1cK9iNkWkkJpej2UNO7vedTbBMcEohltaUjJBUN9QA8ZtGS+nsUwKAwNn9
 snTe0Mss1bgW57Scq0LRhpctEbFdjbNHw9BV/Zkq0ScasoZ2Z+5MDbxOTB6PxmVfg7oOHTcU0EOeN
 t75jsnJ7nnN84zKBW/KEZ7w1ETiIjhKNuzS0hk0hN6sDp1NuDtud1nefBM5DaFf5ZhTKIAF1Z4Kf9
 5RtklxMfKUnGZScYsuMz4RMjuYOfAsVcl3+PlGI4ZGtQJ6elb4hl0Rx5wIzq0zJjUBMXFZT6VmJU3
 lWiIkNEU+85BnWxeXIkVlYDqCm3YmL4ZcvH761A/sP33LQhbf9LPQDFW+ZFSIyixGYq0SU+nu/Iwe
 zOJrPM1ZGlqbnVVINywdWE23UaTUoH1S3Gc+hmKMU=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o4jYP-00037t-Sj; Fri, 24 Jun 2022 14:41:01 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com,
 pbonzini@redhat.com, peter.maydell@linaro.org, hpoussin@reactos.org,
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, jiaxun.yang@flygoat.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Date: Fri, 24 Jun 2022 14:40:30 +0100
Message-Id: <20220624134109.881989-16-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220624134109.881989-1-mark.cave-ayland@ilande.co.uk>
References: <20220624134109.881989-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 15/54] pl050: split pl050_update_irq() into separate
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


