Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EB94559B24
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 16:10:24 +0200 (CEST)
Received: from localhost ([::1]:54100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4k0t-0004h9-Nl
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 10:10:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o4jaW-0001Rm-Gu; Fri, 24 Jun 2022 09:43:08 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:41948)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o4jaR-0005FR-9Q; Fri, 24 Jun 2022 09:43:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DKty+RL/HfeLQYbktID6JL6wjBgh3DFMrE602y3f6wY=; b=L2ftVy2AliOqLGU93tGDdE54+R
 RVBXl/DeSeUbBXwqBnITc8g5UY078E4b2SQ4VQeBDf1EPchkExE/9DglxKWNq6+0yytYYJgUj4ijd
 usRyTK7flsnctCHSELwVNu/KZEpx3+CvqDXfbuATykarVEsjsRe4cKbSEmy387X/NqVOb7UjL8PP/
 yQ140kJ/uYADhHBchSQrZ8amO9phCtlYTHkGwh6AuQvvjXznsRvmg0vmw4QD52j6gmLyuYlVJbF5R
 ELTSYEYCrtjl5v0R8/p+7Y2aBWqPRfDEh7M72Bx6teKW4XRhqJV+fhm49yaKovvRl1NmV44yhumj2
 0Gci3mbrJJBjU5L31JoWYEwsU7nJdDVhwNiN5w5EJBvPJudHKCIu9TWidLyzHKxJn8+XKWuekjcQR
 zPoF1oVxmw3ClIUoVwgu+22zZgU3fwPXLhjo6xvdCaYcGd95IQEUb3L0fQjp/28dpHOqGlIOoHUGP
 HcWtakDvOaIl+3J7FaYNHf99rylHEiFFnlOwUZ6LSIc+NOecvnPWgJ8Ft2rwGCQl6j5zaFBvtRkgS
 EauqoiclJKHRMhk752MLo5p1Itkrp3xiD/iZudo67d/DfqzNXWrsvO+/PUIjBhN6kWhSqY/RMyvH0
 DRECMjnlfr61W1p0gBhm3aGn3239D9wOPiocMXTjw=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o4jYr-00037t-4v; Fri, 24 Jun 2022 14:41:25 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com,
 pbonzini@redhat.com, peter.maydell@linaro.org, hpoussin@reactos.org,
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, jiaxun.yang@flygoat.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Date: Fri, 24 Jun 2022 14:40:37 +0100
Message-Id: <20220624134109.881989-23-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220624134109.881989-1-mark.cave-ayland@ilande.co.uk>
References: <20220624134109.881989-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 22/54] pckbd: implement i8042_mmio_reset() for I8042_MMIO
 device
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

This allows the I8042_MMIO reset function to be registered directly within the
DeviceClass rather than using qemu_register_reset() directly.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Acked-by: Helge Deller <deller@gmx.de>
---
 hw/input/pckbd.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/hw/input/pckbd.c b/hw/input/pckbd.c
index 89a41ed566..7b520d0eb4 100644
--- a/hw/input/pckbd.c
+++ b/hw/input/pckbd.c
@@ -665,10 +665,19 @@ static const MemoryRegionOps i8042_mmio_ops = {
     .endianness = DEVICE_NATIVE_ENDIAN,
 };
 
+static void i8042_mmio_reset(DeviceState *dev)
+{
+    MMIOKBDState *s = I8042_MMIO(dev);
+    KBDState *ks = &s->kbd;
+
+    kbd_reset(ks);
+}
+
 static void i8042_mmio_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
 
+    dc->reset = i8042_mmio_reset;
     set_bit(DEVICE_CATEGORY_INPUT, dc->categories);
 }
 
@@ -695,7 +704,6 @@ void i8042_mm_init(qemu_irq kbd_irq, qemu_irq mouse_irq,
 
     s->kbd = ps2_kbd_init(kbd_update_kbd_irq, s);
     s->mouse = ps2_mouse_init(kbd_update_aux_irq, s);
-    qemu_register_reset(kbd_reset, s);
 }
 
 static const TypeInfo i8042_mmio_info = {
-- 
2.30.2


