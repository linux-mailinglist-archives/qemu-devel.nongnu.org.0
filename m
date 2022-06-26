Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C6D355B37A
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Jun 2022 20:23:05 +0200 (CEST)
Received: from localhost ([::1]:54440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5WuW-0002gj-NR
	for lists+qemu-devel@lfdr.de; Sun, 26 Jun 2022 14:23:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o5WNV-0005EH-BF
 for qemu-devel@nongnu.org; Sun, 26 Jun 2022 13:48:58 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:45272)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o5WNT-0000HC-IB
 for qemu-devel@nongnu.org; Sun, 26 Jun 2022 13:48:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mXD61TUWWwbSsZip6Rgqx/ZdPGKlksXhFJeeHmwGPh0=; b=b9Xvrr8IGKX2HR05YW1UOlu3df
 tXapiSSvLsqRMddlGwnKzCGvAw18kI0W3XRLlNWVowTU3fKsjHSTgqyPZzAtbCvfxisMPh0Q+wRLx
 mNypf9g0SHk+Ce84rkqNEhbq4N+tpSHo29U+N6DCVgUTfWQHRP47Hl7Fbr3iUuAEXx2r/yKnTHiWl
 9yyHCQfeL26Ci6O0mS9eYGasFlBY3L3mM3uxUvwRDwEzGYX3NYMSe5d7XWEexjXQogJpjlzOLWrA8
 yJAC/rvpYBz1T61Xv2d5wOdXZEGSZUFPajxM2inkQicNLJRRm4pB7Z7M6dkHRQl9k0yFG4YKWiOTs
 9ZmDhbG2mn4zjmKseWPR6rmlFw0oP6zZdCi882bXcnpocvs8ZXOW8sPuGrH68WNv8eUJnE63M1XT8
 Wf+PUcYriT58QqO3HjquknUnkz9ydP+Tf+CdI2paD/mKoSCzWwrOkXcUisR8r8xYBIDybiklY+A5A
 PVGyCmsrAAlqagnKCSDHBh/cH8FP/wlyfjRLhU2KadpsU1k4X+sURqPNE0huLGtIHYyooEpoBUgwF
 f2ZVIVcWh6KnLJJK2jFzGi0v6vQm1rVTw1Xn4pviyJ6d6IlmfihYM+4Qpff+oZ3o7wTH8A3M+epQ1
 yfZ+XDyNb1hYXYHjEEfW3293zyl4nnGBf3GOCeTHk=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o5WM6-0007KY-6i; Sun, 26 Jun 2022 18:47:33 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org,
	qemu-devel@nongnu.org
Date: Sun, 26 Jun 2022 18:45:25 +0100
Message-Id: <20220626174531.969187-50-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220626174531.969187-1-mark.cave-ayland@ilande.co.uk>
References: <20220626174531.969187-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PULL 49/55] pckbd: switch I8042_MMIO device from update_irq()
 function to PS2 device gpio
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

Define a new qdev input gpio for handling incoming PS2 IRQs, and then wire up the
PS2 keyboard and mouse devices to use it. At the same time set update_irq() and
update_arg to NULL in ps2_kbd_init() and ps2_mouse_init() to ensure that any
accidental attempt to use the legacy update_irq() function will cause a NULL
pointer dereference.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Acked-by: Helge Deller <deller@gmx.de>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20220624134109.881989-50-mark.cave-ayland@ilande.co.uk>
---
 hw/input/pckbd.c | 38 ++++++++++++++++++++++++++++++++------
 1 file changed, 32 insertions(+), 6 deletions(-)

diff --git a/hw/input/pckbd.c b/hw/input/pckbd.c
index 5d7c969fc6..ee306428a3 100644
--- a/hw/input/pckbd.c
+++ b/hw/input/pckbd.c
@@ -665,6 +665,22 @@ static const MemoryRegionOps i8042_mmio_ops = {
     .endianness = DEVICE_NATIVE_ENDIAN,
 };
 
+static void i8042_mmio_set_kbd_irq(void *opaque, int n, int level)
+{
+    MMIOKBDState *s = I8042_MMIO(opaque);
+    KBDState *ks = &s->kbd;
+
+    kbd_update_kbd_irq(ks, level);
+}
+
+static void i8042_mmio_set_mouse_irq(void *opaque, int n, int level)
+{
+    MMIOKBDState *s = I8042_MMIO(opaque);
+    KBDState *ks = &s->kbd;
+
+    kbd_update_aux_irq(ks, level);
+}
+
 static void i8042_mmio_reset(DeviceState *dev)
 {
     MMIOKBDState *s = I8042_MMIO(dev);
@@ -686,8 +702,14 @@ static void i8042_mmio_realize(DeviceState *dev, Error **errp)
     /* Note we can't use dc->vmsd without breaking migration compatibility */
     vmstate_register(NULL, 0, &vmstate_kbd, ks);
 
-    ks->kbd = ps2_kbd_init(kbd_update_kbd_irq, ks);
-    ks->mouse = ps2_mouse_init(kbd_update_aux_irq, ks);
+    ks->kbd = ps2_kbd_init(NULL, NULL);
+    qdev_connect_gpio_out(DEVICE(ks->kbd), PS2_DEVICE_IRQ,
+                          qdev_get_gpio_in_named(dev, "ps2-kbd-input-irq",
+                                                 0));
+    ks->mouse = ps2_mouse_init(NULL, NULL);
+    qdev_connect_gpio_out(DEVICE(ks->mouse), PS2_DEVICE_IRQ,
+                          qdev_get_gpio_in_named(dev, "ps2-mouse-input-irq",
+                                                 0));
 }
 
 static void i8042_mmio_init(Object *obj)
@@ -696,6 +718,12 @@ static void i8042_mmio_init(Object *obj)
     KBDState *ks = &s->kbd;
 
     ks->extended_state = true;
+
+    qdev_init_gpio_out(DEVICE(obj), ks->irqs, 2);
+    qdev_init_gpio_in_named(DEVICE(obj), i8042_mmio_set_kbd_irq,
+                            "ps2-kbd-input-irq", 1);
+    qdev_init_gpio_in_named(DEVICE(obj), i8042_mmio_set_mouse_irq,
+                            "ps2-mouse-input-irq", 1);
 }
 
 static Property i8042_mmio_properties[] = {
@@ -718,16 +746,14 @@ MMIOKBDState *i8042_mm_init(qemu_irq kbd_irq, qemu_irq mouse_irq,
                             ram_addr_t size, hwaddr mask)
 {
     DeviceState *dev;
-    KBDState *s;
 
     dev = qdev_new(TYPE_I8042_MMIO);
     qdev_prop_set_uint64(dev, "mask", mask);
     qdev_prop_set_uint32(dev, "size", size);
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
-    s = &I8042_MMIO(dev)->kbd;
 
-    s->irqs[I8042_KBD_IRQ] = kbd_irq;
-    s->irqs[I8042_MOUSE_IRQ] = mouse_irq;
+    qdev_connect_gpio_out(dev, I8042_KBD_IRQ, kbd_irq);
+    qdev_connect_gpio_out(dev, I8042_MOUSE_IRQ, mouse_irq);
 
     return I8042_MMIO(dev);
 }
-- 
2.30.2


