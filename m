Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4288B530558
	for <lists+qemu-devel@lfdr.de>; Sun, 22 May 2022 21:04:36 +0200 (CEST)
Received: from localhost ([::1]:50922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nsqsV-0001tC-Bp
	for lists+qemu-devel@lfdr.de; Sun, 22 May 2022 15:04:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsqC7-0008IH-4s; Sun, 22 May 2022 14:20:47 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:47904)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsqBp-0003qK-Hc; Sun, 22 May 2022 14:20:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vmfTzBu0WqXvpdSNe78zL/FGTgctRuAw3Wsuyq2/YuE=; b=I1jUMdvCN117FwFuGrA1hE6bK2
 cRweCqvz9twY6z2x4xN9ky3R1Kbzn4GOXpw/7avht5SBb/mVAYpXfaT1xHRIwvkMsctAIsW9Ofeco
 rpq5aZQ+OdGF9m3HoSi4hGgPkntClObgc1+G+5icrRZdh51ypoxN7og2viyudDeFPPvoqGX4dKwne
 ZBDThPxrlHyJ46RH2cZSjNaaxboaxRtdzl0+gEdE65sxHdCA3/kus68pJmOdRPFhkqrAO26fT2wFH
 sVpPuyapAE+57jklZHChVG1zqY71D4eacSOImhz/K+Emwr9hliqaVKUunVyZZ9OPNILnQecdayCaR
 4uhywbFVyuftqGu2439weY4oJMx9n85svx7sMzvfY6K+X9a8zPQmDFlfLMQ2cMcoF5SO0c0ok742E
 MI+d2TI81Q/NZkc/bY5gXrtEK7+UdPrbacCnvvSkRTNmQt9QyDQtGguBO4LfqUweCbssjh0sz9Twu
 sR/g5s9pIj7w2tSPjdt79gImljyg2J/1Hf96EZNEwzaIP0qdUYD09W5WKFBGCwb53QfT0wlYknG1x
 eZvWywmL5gmyqWpJRM/xrl3rWJH2hR69Vnm2/BByR/84VmbheowlCmxzdsDp5f44DAYmfkVOvTKu5
 cnRuwnzhFudfWi6occchNkvdYuIw6sXhRkKZDnWMo=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsqAP-0007pH-GO; Sun, 22 May 2022 19:19:02 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com,
 pbonzini@redhat.com, peter.maydell@linaro.org, hpoussin@reactos.org,
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, jiaxun.yang@flygoat.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Date: Sun, 22 May 2022 19:18:21 +0100
Message-Id: <20220522181836.864-36-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
References: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 35/50] pckbd: replace irq_kbd and irq_mouse with qemu_irq
 array in KBDState
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

This allows both IRQs to be declared as a single qdev gpio array.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/input/pckbd.c         | 12 ++++++------
 include/hw/input/i8042.h |  6 ++++--
 2 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/hw/input/pckbd.c b/hw/input/pckbd.c
index 1c61c55123..90acf0dd6a 100644
--- a/hw/input/pckbd.c
+++ b/hw/input/pckbd.c
@@ -170,8 +170,8 @@ static void kbd_update_irq_lines(KBDState *s)
             }
         }
     }
-    qemu_set_irq(s->irq_kbd, irq_kbd_level);
-    qemu_set_irq(s->irq_mouse, irq_mouse_level);
+    qemu_set_irq(s->irqs[I8042_KBD_IRQ], irq_kbd_level);
+    qemu_set_irq(s->irqs[I8042_MOUSE_IRQ], irq_mouse_level);
 }
 
 static void kbd_deassert_irq(KBDState *s)
@@ -724,8 +724,8 @@ MMIOKBDState *i8042_mm_init(qemu_irq kbd_irq, qemu_irq mouse_irq,
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
     s = &I8042_MMIO(dev)->kbd;
 
-    s->irq_kbd = kbd_irq;
-    s->irq_mouse = mouse_irq;
+    s->irqs[I8042_KBD_IRQ] = kbd_irq;
+    s->irqs[I8042_MOUSE_IRQ] = mouse_irq;
 
     return I8042_MMIO(dev);
 }
@@ -811,8 +811,8 @@ static void i8042_realizefn(DeviceState *dev, Error **errp)
         return;
     }
 
-    s->irq_kbd = isa_get_irq(isadev, isa_s->kbd_irq);
-    s->irq_mouse = isa_get_irq(isadev, isa_s->mouse_irq);
+    s->irqs[I8042_KBD_IRQ] = isa_get_irq(isadev, isa_s->kbd_irq);
+    s->irqs[I8042_MOUSE_IRQ] = isa_get_irq(isadev, isa_s->mouse_irq);
 
     isa_register_ioport(isadev, isa_s->io + 0, 0x60);
     isa_register_ioport(isadev, isa_s->io + 1, 0x64);
diff --git a/include/hw/input/i8042.h b/include/hw/input/i8042.h
index 9d1f8af964..4ba2664377 100644
--- a/include/hw/input/i8042.h
+++ b/include/hw/input/i8042.h
@@ -12,6 +12,9 @@
 #include "hw/sysbus.h"
 #include "qom/object.h"
 
+#define I8042_KBD_IRQ      0
+#define I8042_MOUSE_IRQ    1
+
 typedef struct KBDState {
     uint8_t write_cmd; /* if non zero, write data to port 60 is expected */
     uint8_t status;
@@ -31,8 +34,7 @@ typedef struct KBDState {
     void *mouse;
     QEMUTimer *throttle_timer;
 
-    qemu_irq irq_kbd;
-    qemu_irq irq_mouse;
+    qemu_irq irqs[2];
     qemu_irq a20_out;
     hwaddr mask;
 } KBDState;
-- 
2.20.1


