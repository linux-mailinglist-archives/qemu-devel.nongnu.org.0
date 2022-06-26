Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82F9655B367
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Jun 2022 20:12:40 +0200 (CEST)
Received: from localhost ([::1]:49606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5WkR-0005Tw-JN
	for lists+qemu-devel@lfdr.de; Sun, 26 Jun 2022 14:12:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o5WMD-0003Wr-Dm
 for qemu-devel@nongnu.org; Sun, 26 Jun 2022 13:47:39 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:45140)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o5WMB-00008z-UG
 for qemu-devel@nongnu.org; Sun, 26 Jun 2022 13:47:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cAjb10wPrLGEXsmvUIGx0r4+8eSqf6cm4Jha9xfzR/k=; b=wWrbc5BPjZVrsWuFRVzZHJc11q
 vC9foRrXdrMTD73VKRpoqzmvbAtQsf4cAh+cMlNVDROZJ4cX+YyjHCn8Nzrb6f9N2sO5HIOBXbrYa
 U3BpbxX8B7tDz0/GcThJIKwGQPymxxDhp5AtcUEiGUEEp/v1H3TcvA6FQ+/+VpGGKUCRVNRnBfMkW
 VYtbLvXX05Fak7lx1IgzUSVoyMH0CsHl+7XALEzW2ZWTsqgEbo9lOkSJwVZegNvZGphGZPXEIblRM
 I6C5G1wqJs4LenXNIQkOFzmkXoxdSXIHQWKTzdzkV/VOLw+gcUf1SalpmmjobT+U164lk875DDRXe
 Jjz6JHGEIkfIiGpSqgcKKs6glj7vzVmhwNJ7RhYGJX8ODhRlyN5cWJ7606qfEs5qxTO88cqMk+tk3
 indAIdxoOwfqOhRlQ4u2dhhWMpoF9qS1wHl8UKiddLjKaHhuf9EyD/HzCn8RoR4dV/u0Yyzx9IUjk
 28NqdWk7hhsPVA9V+VZ5O61qFNoxXQR4ianYuvxpcvjBcQOMhFYbU3564qRZsPypMxIgoC8kPXS2t
 Gi5zMpz1wXrVSYeJe9p4jE79otYbVcxYJ0z622JfP3qRwlVg1kBhOyeaHNWr5ZeVdqzIlhQjYArwo
 r0mtxefFquIH1itl7F3OjzaeKj4JRaOsai0ewRfeA=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o5WKn-0007KY-Kt; Sun, 26 Jun 2022 18:46:13 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org,
	qemu-devel@nongnu.org
Date: Sun, 26 Jun 2022 18:45:03 +0100
Message-Id: <20220626174531.969187-28-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220626174531.969187-1-mark.cave-ayland@ilande.co.uk>
References: <20220626174531.969187-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PULL 27/55] pckbd: alter i8042_mm_init() to return a I8042_MMIO
 device
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

This exposes the I8042_MMIO device to the caller to allow the register memory
region to be mapped outside of i8042_mm_init().

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Acked-by: Helge Deller <deller@gmx.de>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20220624134109.881989-28-mark.cave-ayland@ilande.co.uk>
---
 hw/input/pckbd.c         | 8 +++++---
 include/hw/input/i8042.h | 6 +++---
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/hw/input/pckbd.c b/hw/input/pckbd.c
index b8623d2f9a..702dab056c 100644
--- a/hw/input/pckbd.c
+++ b/hw/input/pckbd.c
@@ -708,9 +708,9 @@ static void i8042_mmio_class_init(ObjectClass *klass, void *data)
     set_bit(DEVICE_CATEGORY_INPUT, dc->categories);
 }
 
-void i8042_mm_init(qemu_irq kbd_irq, qemu_irq mouse_irq,
-                   MemoryRegion *region, ram_addr_t size,
-                   hwaddr mask)
+MMIOKBDState *i8042_mm_init(qemu_irq kbd_irq, qemu_irq mouse_irq,
+                            MemoryRegion *region, ram_addr_t size,
+                            hwaddr mask)
 {
     DeviceState *dev;
     KBDState *s;
@@ -730,6 +730,8 @@ void i8042_mm_init(qemu_irq kbd_irq, qemu_irq mouse_irq,
 
     s->kbd = ps2_kbd_init(kbd_update_kbd_irq, s);
     s->mouse = ps2_mouse_init(kbd_update_aux_irq, s);
+
+    return I8042_MMIO(dev);
 }
 
 static const TypeInfo i8042_mmio_info = {
diff --git a/include/hw/input/i8042.h b/include/hw/input/i8042.h
index 59d695a9dd..d05cd33e3c 100644
--- a/include/hw/input/i8042.h
+++ b/include/hw/input/i8042.h
@@ -64,9 +64,9 @@ struct MMIOKBDState {
 #define I8042_A20_LINE "a20"
 
 
-void i8042_mm_init(qemu_irq kbd_irq, qemu_irq mouse_irq,
-                   MemoryRegion *region, ram_addr_t size,
-                   hwaddr mask);
+MMIOKBDState *i8042_mm_init(qemu_irq kbd_irq, qemu_irq mouse_irq,
+                            MemoryRegion *region, ram_addr_t size,
+                            hwaddr mask);
 void i8042_isa_mouse_fake_event(ISAKBDState *isa);
 void i8042_setup_a20_line(ISADevice *dev, qemu_irq a20_out);
 
-- 
2.30.2


