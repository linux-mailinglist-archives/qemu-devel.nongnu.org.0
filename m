Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F0FF559B8B
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 16:32:21 +0200 (CEST)
Received: from localhost ([::1]:54244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4kM8-0002Uq-Lf
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 10:32:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o4jlC-0001pD-9C; Fri, 24 Jun 2022 09:54:10 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:42512)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o4jlA-000708-Ma; Fri, 24 Jun 2022 09:54:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eH7hkdl2ISoZCCcIwkBaDuhaHgBX+ivlSlQA/a1XMq4=; b=wiTCFruB/j/zQJR6iskXeWOtHG
 KI3QvLzkvrJPm4Vx2plCBuDQinriqB1lcSnryG4v99h81NC5aItq8Rpht8rgGW8bvgpR+ItzCR5zc
 xdNL8nTOuM5CiG/Uv3UWKD29yib5QzbT9RgaLjhwSpAZiYUMsSijGeINKn1kZshraeJmJTvBZHeue
 Fgltz6BgdUks5184lMA5ul5ldCLkg9r2bpKNTZFilx/EXU0778d/F+gBL07rqOSEseZBuAqRuIaOu
 NpFhazSanzlnoUB9zY9xdAy2ZVWx+18NyY8ZiGZUwV60P7FDXlY1rZ7HAtJuzFqxfPPxDw1JaiIGU
 d5M7DVT4zSgNaHy5SZ9YxOcNVGGagZUZGjLbmTXyXM0mINcqgua3BC1j6tf5oLteIUAMuljYFrjas
 yrBZZhOc3kHUGdEWdtwjxkyNeQIBRjS7SHherCyERXPeTWF2jEn8qum8xX2IeIglPyP6f29zttwAS
 61QMuDpXvVzqHo19AuGBAamCa27+KqE9UarnxnaFBtyE5I2SKi/mJNLFQBn8ECwdrQhfYpd228QOG
 wFieLFECR48hFT4Duf4LvVDdo5K7NVDI9n9nx0Y7Gm/KYDINte7roEnHoP2nkTlh21dYFP6nl8M/P
 qsgElvK4K+BxppQ/+kwBC5oLQHOFRbADQwnCOvrjg=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o4jaS-00037t-S2; Fri, 24 Jun 2022 14:43:05 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com,
 pbonzini@redhat.com, peter.maydell@linaro.org, hpoussin@reactos.org,
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, jiaxun.yang@flygoat.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Date: Fri, 24 Jun 2022 14:41:07 +0100
Message-Id: <20220624134109.881989-53-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220624134109.881989-1-mark.cave-ayland@ilande.co.uk>
References: <20220624134109.881989-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 52/54] pckbd: switch I8042 device from update_irq()
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
---
 hw/input/pckbd.c | 37 +++++++++++++++++++++++++++++++++----
 1 file changed, 33 insertions(+), 4 deletions(-)

diff --git a/hw/input/pckbd.c b/hw/input/pckbd.c
index ff76c0636d..18f27abc58 100644
--- a/hw/input/pckbd.c
+++ b/hw/input/pckbd.c
@@ -808,6 +808,23 @@ static const MemoryRegionOps i8042_cmd_ops = {
     .endianness = DEVICE_LITTLE_ENDIAN,
 };
 
+static void i8042_set_kbd_irq(void *opaque, int n, int level)
+{
+    ISAKBDState *s = I8042(opaque);
+    KBDState *ks = &s->kbd;
+
+    kbd_update_kbd_irq(ks, level);
+}
+
+static void i8042_set_mouse_irq(void *opaque, int n, int level)
+{
+    ISAKBDState *s = I8042(opaque);
+    KBDState *ks = &s->kbd;
+
+    kbd_update_aux_irq(ks, level);
+}
+
+
 static void i8042_reset(DeviceState *dev)
 {
     ISAKBDState *s = I8042(dev);
@@ -827,6 +844,12 @@ static void i8042_initfn(Object *obj)
                           "i8042-cmd", 1);
 
     qdev_init_gpio_out_named(DEVICE(obj), &s->a20_out, I8042_A20_LINE, 1);
+
+    qdev_init_gpio_out(DEVICE(obj), s->irqs, 2);
+    qdev_init_gpio_in_named(DEVICE(obj), i8042_set_kbd_irq,
+                            "ps2-kbd-input-irq", 1);
+    qdev_init_gpio_in_named(DEVICE(obj), i8042_set_mouse_irq,
+                            "ps2-mouse-input-irq", 1);
 }
 
 static void i8042_realizefn(DeviceState *dev, Error **errp)
@@ -847,14 +870,20 @@ static void i8042_realizefn(DeviceState *dev, Error **errp)
         return;
     }
 
-    s->irqs[I8042_KBD_IRQ] = isa_get_irq(isadev, isa_s->kbd_irq);
-    s->irqs[I8042_MOUSE_IRQ] = isa_get_irq(isadev, isa_s->mouse_irq);
+    isa_connect_gpio_out(isadev, I8042_KBD_IRQ, isa_s->kbd_irq);
+    isa_connect_gpio_out(isadev, I8042_MOUSE_IRQ, isa_s->mouse_irq);
 
     isa_register_ioport(isadev, isa_s->io + 0, 0x60);
     isa_register_ioport(isadev, isa_s->io + 1, 0x64);
 
-    s->kbd = ps2_kbd_init(kbd_update_kbd_irq, s);
-    s->mouse = ps2_mouse_init(kbd_update_aux_irq, s);
+    s->kbd = ps2_kbd_init(NULL, NULL);
+    qdev_connect_gpio_out(DEVICE(s->kbd), PS2_DEVICE_IRQ,
+                          qdev_get_gpio_in_named(dev, "ps2-kbd-input-irq",
+                                                 0));
+    s->mouse = ps2_mouse_init(NULL, NULL);
+    qdev_connect_gpio_out(DEVICE(s->mouse), PS2_DEVICE_IRQ,
+                          qdev_get_gpio_in_named(dev, "ps2-mouse-input-irq",
+                                                 0));
     if (isa_s->kbd_throttle && !isa_s->kbd.extended_state) {
         warn_report(TYPE_I8042 ": can't enable kbd-throttle without"
                     " extended-state, disabling kbd-throttle");
-- 
2.30.2


