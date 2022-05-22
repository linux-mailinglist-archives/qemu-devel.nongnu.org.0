Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC61530575
	for <lists+qemu-devel@lfdr.de>; Sun, 22 May 2022 21:34:39 +0200 (CEST)
Received: from localhost ([::1]:51524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nsrLa-0001pB-9i
	for lists+qemu-devel@lfdr.de; Sun, 22 May 2022 15:34:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsqCU-0000k4-Rz; Sun, 22 May 2022 14:21:12 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:48148)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsqCR-0003wZ-71; Sun, 22 May 2022 14:21:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/7Xk7MW3L+6OR4js6piTEuV3VzyW4LoopXb+vIlieq8=; b=Uk25omJPA4uEfiy46/Qmr/oV+7
 kpisCmTUMSRc3PgX/gW65hcmo1++Qmlojbz0c6rVDzXRWU55YFI0oJyKnoVYmnOiugheT5a3x989A
 oYejaUcmW1KInUH+ar1ibmj94CpT8ZiKMHrqdvYBGGdGcWkv2l2MfGnaF7gxBvFjnl9vNO3EKOLZk
 MiZyPgB3G3sF/e0B1kPfPzSk4IATbsOMT97HRTUiLYqqkRtgJTWA12fDB4HAloGu0/iLRDWEWSpSs
 MJEMvueZ+1qbjiP0pzfXkgMIJAVxhiWpU64MFhsZPEmoBGd2NlE1cn7epUHhZbK7EC1RHjsb44/e1
 P5FiR7QSv3Y6/PK1c6TWi134CuNf67bf/o2xqT16+HcCN8Q4rcJMtCOLZ+UmQ/LueLbDiHQz+5kxH
 mlp94tGZv+peuiSnDHCvvQSYfKVFN+FxvkIlGHdpD1yOW9albpWT6tpubQABaAvkOmqTYELW1DRIn
 xmvSz9RbjsYMLjH/BSJq12KiNYeIHP6TnxoKSUy7makRvoeOSm01xSLMRfbhwumpCZHuyl+0PQ8zo
 SmPhPK7/z8Yr4wR413+/HGMyg4wVPccljSDuB9+EMcEB/RVtqzbVp63/3Zh5eHok7qJvs1B7pzlE7
 J2xJqI8jEu3P4HnH6yUTBsmcKAhrmMXcYffvoaTxg=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsqB2-0007pH-9c; Sun, 22 May 2022 19:19:40 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com,
 pbonzini@redhat.com, peter.maydell@linaro.org, hpoussin@reactos.org,
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, jiaxun.yang@flygoat.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Date: Sun, 22 May 2022 19:18:35 +0100
Message-Id: <20220522181836.864-50-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
References: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 49/50] pckbd: switch I8042 device from update_irq() function
 to PS2 device gpio
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
---
 hw/input/pckbd.c | 27 +++++++++++++++++++++++----
 1 file changed, 23 insertions(+), 4 deletions(-)

diff --git a/hw/input/pckbd.c b/hw/input/pckbd.c
index b2fdd1c999..f1eeab9952 100644
--- a/hw/input/pckbd.c
+++ b/hw/input/pckbd.c
@@ -801,6 +801,18 @@ static const MemoryRegionOps i8042_cmd_ops = {
     .endianness = DEVICE_LITTLE_ENDIAN,
 };
 
+static void i8042_set_irq(void *opaque, int n, int level)
+{
+    ISAKBDState *s = I8042(opaque);
+    KBDState *ks = &s->kbd;
+
+    if (n) {
+        kbd_update_aux_irq(ks, level);
+    } else {
+        kbd_update_kbd_irq(ks, level);
+    }
+}
+
 static void i8042_reset(DeviceState *dev)
 {
     ISAKBDState *s = I8042(dev);
@@ -820,6 +832,9 @@ static void i8042_initfn(Object *obj)
                           "i8042-cmd", 1);
 
     qdev_init_gpio_out_named(DEVICE(obj), &s->a20_out, I8042_A20_LINE, 1);
+
+    qdev_init_gpio_out(DEVICE(obj), s->irqs, 2);
+    qdev_init_gpio_in(DEVICE(obj), i8042_set_irq, 2);
 }
 
 static void i8042_realizefn(DeviceState *dev, Error **errp)
@@ -840,14 +855,18 @@ static void i8042_realizefn(DeviceState *dev, Error **errp)
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
+                          qdev_get_gpio_in(dev, I8042_KBD_INPUT_IRQ));
+    s->mouse = ps2_mouse_init(NULL, NULL);
+    qdev_connect_gpio_out(DEVICE(s->mouse), PS2_DEVICE_IRQ,
+                          qdev_get_gpio_in(dev, I8042_MOUSE_INPUT_IRQ));
     if (isa_s->kbd_throttle && !isa_s->kbd.extended_state) {
         warn_report(TYPE_I8042 ": can't enable kbd-throttle without"
                     " extended-state, disabling kbd-throttle");
-- 
2.20.1


