Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C2DC559B20
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 16:08:30 +0200 (CEST)
Received: from localhost ([::1]:48532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4jz3-0000qn-8u
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 10:08:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o4jaf-0001fx-6X; Fri, 24 Jun 2022 09:43:17 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:41998)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o4jac-0005G7-Ku; Fri, 24 Jun 2022 09:43:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ds29DQKfo+WciKWPiKwA+SY/YM6305wwN7hD6NZSA7g=; b=zdcY1Kel84mnwOAS18FxypBmeA
 ueejuCwRj/QpUmJK+Ix/h/uuVe4Hph4vW+zS/YQ7Jc7vJchZkfl5/2hArtflVkuZGxlbchg0tjEv6
 vRvIUhemgg9kL6DKoji9eH5zFafHgsToyEsJLQalAu6IXtscRFdyd/LvA0zPwD/AaFgIgwN0rLmqK
 +DRD+YjsNQkgMLp02XQ8uyXQB/c9mf3EkMUvZrQGf2FvncJxG6Nf41tWxA47xXx1lEde0vx9bOcjq
 YzadyLYrT71ruceE35JhbALN0cQkhwOjPDKPjIZdgL0y+1uHeLH2xjIsQCnO/HV2ttTScFUANWNQm
 affOA7Axwkw6I6T95ygIw/9IokWFPuGdRJ8JUFhCeudqippHBjT7Ctf5qI/IOcSnzdk0bTFXdPdQ8
 jTomMsWjEwYyqXTNOlygYIc+udoCeMSmRqzmygDRTp9IJePoTDNZoMeaJsoSE4b5ForvWBwQek9PG
 ktBkGvqy9JEvNCmJmsYSD/Ir9V0JJOV0qlPl57TSV3I8sKldHHvHUspC/L8/wixZpdtGAHbXkkEm0
 61ROIl6HDQGlU0xus+3fU7P4e8d/0jHlPuN1C3AcqBJ37v9gDYrgej7uTYRjIpLyfRWjXvl9zcWih
 nsdtSVdn1kd/rSGJEZoUTsEURG+v8M9sVKjHIMI9w=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o4jYz-00037t-TM; Fri, 24 Jun 2022 14:41:37 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com,
 pbonzini@redhat.com, peter.maydell@linaro.org, hpoussin@reactos.org,
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, jiaxun.yang@flygoat.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Date: Fri, 24 Jun 2022 14:40:40 +0100
Message-Id: <20220624134109.881989-26-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220624134109.881989-1-mark.cave-ayland@ilande.co.uk>
References: <20220624134109.881989-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 25/54] pckbd: implement i8042_mmio_realize() function
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

Move the initialisation of the register memory region to the I8042_MMIO device
realize function and expose it using sysbus_init_mmio().

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Acked-by: Helge Deller <deller@gmx.de>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/input/pckbd.c         | 14 +++++++++++++-
 include/hw/input/i8042.h |  1 +
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/hw/input/pckbd.c b/hw/input/pckbd.c
index a70442e0f8..bc51f7eedd 100644
--- a/hw/input/pckbd.c
+++ b/hw/input/pckbd.c
@@ -673,6 +673,17 @@ static void i8042_mmio_reset(DeviceState *dev)
     kbd_reset(ks);
 }
 
+static void i8042_mmio_realize(DeviceState *dev, Error **errp)
+{
+    MMIOKBDState *s = I8042_MMIO(dev);
+    KBDState *ks = &s->kbd;
+
+    memory_region_init_io(&s->region, OBJECT(dev), &i8042_mmio_ops, ks,
+                          "i8042", s->size);
+
+    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->region);
+}
+
 static Property i8042_mmio_properties[] = {
     DEFINE_PROP_UINT64("mask", MMIOKBDState, kbd.mask, UINT64_MAX),
     DEFINE_PROP_UINT32("size", MMIOKBDState, size, -1),
@@ -683,6 +694,7 @@ static void i8042_mmio_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
 
+    dc->realize = i8042_mmio_realize;
     dc->reset = i8042_mmio_reset;
     device_class_set_props(dc, i8042_mmio_properties);
     set_bit(DEVICE_CATEGORY_INPUT, dc->categories);
@@ -708,7 +720,7 @@ void i8042_mm_init(qemu_irq kbd_irq, qemu_irq mouse_irq,
 
     vmstate_register(NULL, 0, &vmstate_kbd, s);
 
-    memory_region_init_io(region, NULL, &i8042_mmio_ops, s, "i8042", size);
+    region = &I8042_MMIO(dev)->region;
 
     s->kbd = ps2_kbd_init(kbd_update_kbd_irq, s);
     s->mouse = ps2_mouse_init(kbd_update_aux_irq, s);
diff --git a/include/hw/input/i8042.h b/include/hw/input/i8042.h
index ac4098b957..59d695a9dd 100644
--- a/include/hw/input/i8042.h
+++ b/include/hw/input/i8042.h
@@ -58,6 +58,7 @@ struct MMIOKBDState {
 
     KBDState kbd;
     uint32_t size;
+    MemoryRegion region;
 };
 
 #define I8042_A20_LINE "a20"
-- 
2.30.2


