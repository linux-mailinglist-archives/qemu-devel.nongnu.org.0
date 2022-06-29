Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C5BD56013D
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jun 2022 15:28:13 +0200 (CEST)
Received: from localhost ([::1]:46196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6Xjn-000163-2f
	for lists+qemu-devel@lfdr.de; Wed, 29 Jun 2022 09:28:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o6X1G-0000fq-0e; Wed, 29 Jun 2022 08:42:10 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:51260)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o6X1E-0004lQ-FL; Wed, 29 Jun 2022 08:42:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0nmOnBynzw7DZuINWBYXE5I8ii2Adx8EQBfqD8pJrDM=; b=1wWkmLZcDuLuolA6BOlTC8kP3l
 zgbTLFgdX64ShQ7iyY7kkwgz42njL4q6BGok/iSE9Tn5CoWjR/541Y+yQe74LfCaCsKQ1dftU5lkb
 I9niU/6h9J8cCtD7oDMhBcGWaryyh9yKOekMDUngkJ+QjxGAIOUtrg3gc9q2dpL8+KCaDYya5jefW
 aGhlDtzNasa4Ky/XWBzvpglMXaLQqMFFqEC0k5yuLIkjKyJOKZBxrnrOIN3Z9ORh5SFEstkobl4q8
 91YdlbasntRp3q67U8Rk1aJwVv2ANt5zy/SauMEep4YZ3Psok5c5T2QYbvX2BbI+WlcEa52ZreC7n
 Y0nVukihcYEeBqiaa0x8Cfn6j/QaN6dG/4EAlYxNZjd7on/4p7qhsl5tsLcCxvCC6gWBtRyejnIVc
 pQGqGn2bOtZ8HRdYxEZCxI3ms5fAiD0p5+JOp42kwy5DdVpbqj6oIJT6cAA+0IOhhJbrlt+IIz7eI
 itwcAj817d4tYBLnEgPXcL0g1c31wfJnlgm5YQc52gsi0oB23HEdhxD7th43Cn+AiaQsOspvjEY+4
 H0OCaJ9u8jCm/TnMm5jzeVN22kgz77+vv788rKFH+LLe7Piu4XOZ/s0PTc+VTO6v2wbGKVAt8J31H
 Xb6rw88r+uHVgqrwm0OP8FKQKp1cO5kZWMgiR+0JQ=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o6Wzb-0002tZ-Ee; Wed, 29 Jun 2022 13:40:28 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, svens@stackframe.org,
 mst@redhat.com, pbonzini@redhat.com, peter.maydell@linaro.org,
 hpoussin@reactos.org, aleksandar.rikalo@syrmia.com, f4bug@amsat.org,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org
Date: Wed, 29 Jun 2022 13:40:13 +0100
Message-Id: <20220629124026.1077021-28-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220629124026.1077021-1-mark.cave-ayland@ilande.co.uk>
References: <20220629124026.1077021-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 27/40] lasips2: add named input gpio to handle incoming port
 IRQs
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

The LASIPS2 device named input gpio is soon to be connected to the port output
IRQs. Add a new int_status field to LASIPS2State which is a bitmap representing
the port input IRQ status.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/input/lasips2.c         | 15 +++++++++++++++
 include/hw/input/lasips2.h |  1 +
 2 files changed, 16 insertions(+)

diff --git a/hw/input/lasips2.c b/hw/input/lasips2.c
index ec1661a8f1..013d891af6 100644
--- a/hw/input/lasips2.c
+++ b/hw/input/lasips2.c
@@ -125,6 +125,19 @@ static void lasips2_update_irq(LASIPS2State *s)
                          s->mouse_port.parent_obj.birq);
 }
 
+static void lasips2_set_irq(void *opaque, int n, int level)
+{
+    LASIPS2State *s = LASIPS2(opaque);
+
+    if (level) {
+        s->int_status |= BIT(n);
+    } else {
+        s->int_status &= ~BIT(n);
+    }
+
+    lasips2_update_irq(s);
+}
+
 static void lasips2_reg_write(void *opaque, hwaddr addr, uint64_t val,
                               unsigned size)
 {
@@ -303,6 +316,8 @@ static void lasips2_init(Object *obj)
                             "ps2-kbd-input-irq", 1);
     qdev_init_gpio_in_named(DEVICE(obj), lasips2_set_mouse_irq,
                             "ps2-mouse-input-irq", 1);
+    qdev_init_gpio_in_named(DEVICE(obj), lasips2_set_irq,
+                            "lasips2-port-input-irq", 2);
 }
 
 static void lasips2_class_init(ObjectClass *klass, void *data)
diff --git a/include/hw/input/lasips2.h b/include/hw/input/lasips2.h
index 35e0aa26eb..b79febf64b 100644
--- a/include/hw/input/lasips2.h
+++ b/include/hw/input/lasips2.h
@@ -69,6 +69,7 @@ struct LASIPS2State {
 
     LASIPS2KbdPort kbd_port;
     LASIPS2MousePort mouse_port;
+    uint8_t int_status;
     qemu_irq irq;
 };
 
-- 
2.30.2


