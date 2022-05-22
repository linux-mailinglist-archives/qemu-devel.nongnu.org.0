Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B39B530545
	for <lists+qemu-devel@lfdr.de>; Sun, 22 May 2022 20:49:15 +0200 (CEST)
Received: from localhost ([::1]:52430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nsqde-0007hr-LP
	for lists+qemu-devel@lfdr.de; Sun, 22 May 2022 14:49:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsqBV-0007wh-RG; Sun, 22 May 2022 14:20:11 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:47674)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsqBU-0003b2-5D; Sun, 22 May 2022 14:20:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MQQj4BHZNb1SwAxzdbz1KTc16gkdRkZbxZ3rw5s/cLs=; b=NAt/P7jgqvR2sFdkjWj0d1piaD
 R9ZWHHAD1ccNKKAla3bqLmy0i6Qb22RCFtDK4EOx/19sSi2CGs65DKYzDC04b8ySQiPYd9qq0qaFl
 4KPI6XqKJLZcY39nultNJ6bcvraYCWH6gj9HP089WoY7yzGrmvqS9HJZ1rhMa5H0wWFBamRbKZ1bT
 rtFBKlOhUXA45JcKik4EupVKBWrSNGBdEEuGEpnMe6LNFpznqo0CUXif554E6ED5xuuF2b6Zt/VkO
 wPx5yvYndJ17zbutLfK1rnb/z1m1szx68KqFBANuFWYWZPII3GB12eoz8tBnWLScWuhjGrC9Brjwh
 4UDqXpI/RoyKmsyjB2sbgDCx6B50uzM/Wu+0E+Racz3LB8EEHpWL7d6eB7YMCRy2T32KWtc0Uf7fG
 y7HFOi0j5ctTLqBnjZi2aGkCaMjl4Z4ePpyWHbxEm0w7blOT+/Ju4C3PLGPp9Bx96utOGnwOfKrAr
 Er6YidW2rEDpXxGLI8VEsMTViWsffBXpzco8kfWeaCmV+OI8hx9eBSy87ZAi0fy9BOuavr/ek0chf
 /vPYBKYYlDCzoQGNbJmvi8ewCzBNI7uhtFA0G3ff1jU8cMakK3gsdjTy7kBUnnQaNuGCEAxgSowRl
 WnmodUg7xNUzPNKDztFT2vrKt8b+/Cq4+BXvVtkxc=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsqA2-0007pH-CJ; Sun, 22 May 2022 19:18:38 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com,
 pbonzini@redhat.com, peter.maydell@linaro.org, hpoussin@reactos.org,
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, jiaxun.yang@flygoat.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Date: Sun, 22 May 2022 19:18:08 +0100
Message-Id: <20220522181836.864-23-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
References: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 22/50] pckbd: implement i8042_mmio_reset() for I8042_MMIO
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

This allows the I8042_MMIO reset function to be registered directly within the
DeviceClass rather than using qemu_register_reset() directly.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/input/pckbd.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/hw/input/pckbd.c b/hw/input/pckbd.c
index bbdd3bc568..df443aaff2 100644
--- a/hw/input/pckbd.c
+++ b/hw/input/pckbd.c
@@ -665,10 +665,20 @@ static const MemoryRegionOps i8042_mmio_ops = {
     .endianness = DEVICE_NATIVE_ENDIAN,
 };
 
+static void i8042_mmio_reset(DeviceState *dev)
+{
+    MMIOKBDState *s = I8042_MMIO(dev);
+    KBDState *ks = &s->kbd;
+
+    ks->extended_state = true;
+    kbd_reset(ks);
+}
+
 static void i8042_mmio_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
 
+    dc->reset = i8042_mmio_reset;
     set_bit(DEVICE_CATEGORY_INPUT, dc->categories);
 }
 
@@ -687,15 +697,12 @@ void i8042_mm_init(qemu_irq kbd_irq, qemu_irq mouse_irq,
     s->irq_mouse = mouse_irq;
     s->mask = mask;
 
-    s->extended_state = true;
-
     vmstate_register(NULL, 0, &vmstate_kbd, s);
 
     memory_region_init_io(region, NULL, &i8042_mmio_ops, s, "i8042", size);
 
     s->kbd = ps2_kbd_init(kbd_update_kbd_irq, s);
     s->mouse = ps2_mouse_init(kbd_update_aux_irq, s);
-    qemu_register_reset(kbd_reset, s);
 }
 
 static const TypeInfo i8042_mmio_info = {
-- 
2.20.1


