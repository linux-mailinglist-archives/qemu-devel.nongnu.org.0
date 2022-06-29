Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ED365601C6
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jun 2022 15:57:34 +0200 (CEST)
Received: from localhost ([::1]:39608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6YCC-00039N-2N
	for lists+qemu-devel@lfdr.de; Wed, 29 Jun 2022 09:57:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o6X1i-0001vY-Ul; Wed, 29 Jun 2022 08:42:40 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:51458)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o6X1h-0005lP-Cd; Wed, 29 Jun 2022 08:42:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Clx57WYUXUjNNQfrKpTM8wNwVS7PvSdLNJ1LxgN4uw0=; b=zwfdKV5BhnKQM/FzFcKBFeIgXe
 odpOj9guSorEim2wUPHt/G7tbLPrFxI8XB3LCB5dcbS8+4v9pe3M2Dsc85eZailOqUhSQi+CWIq1l
 dgmHO9J2Vujgav7CxaniFyRpf5No1bhRQ7omAq+cIFuKaMO4POzIo1jsATkus0ZXuPLBpzv9FYEFe
 JUKvhxSFHjmRjheN2ky6KDsem/V2HyH01OIGN3u3P1w+BNc4uhkbFBJ2/wJTXwPho5+9sO4mSeUp0
 Qn46QDWEVnJAWg9MQsoXycbmWgCJaHQko2VFqz+9pCAi/e1EHs+HCSV2y+06vjWJynLUeaOeJmH5Y
 87RmpYqwJEDGvZx/cBv4BKPDfvk5XXv3P/jEK59/JZ2ydC6/z8exSvne/fTSpD1BvSUA48OhRvPAf
 ScgzUu5ZcQ7UpK1GzE0fMZU4r5NtsHIqbdZkLutuyy9F+jZQt5WANg/o0bX8O62BKfuCsTBnXVNej
 tFtOjZagdib5lPEA7LoiTbp8UWCS5bGzwr73+OEKjlHpBfbywbmAHAo2mZtE5QqLzTDyaiWyCvEok
 LHz3GXX04W2DXSA1ynk9rv1dRhdidcNCZinoP7VOqkr2gxJ5Eiz3M9Mhv11DcTds61n06+e+kExCM
 WuBx6x99dRI5j3B09seFOn9aBWAJKSmzkXEfwdDzg=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o6X02-0002tZ-8s; Wed, 29 Jun 2022 13:40:58 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, svens@stackframe.org,
 mst@redhat.com, pbonzini@redhat.com, peter.maydell@linaro.org,
 hpoussin@reactos.org, aleksandar.rikalo@syrmia.com, f4bug@amsat.org,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org
Date: Wed, 29 Jun 2022 13:40:26 +0100
Message-Id: <20220629124026.1077021-41-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220629124026.1077021-1-mark.cave-ayland@ilande.co.uk>
References: <20220629124026.1077021-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 40/40] pckbd: remove legacy i8042_mm_init() function
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

This legacy function is only used during the initialisation of the MIPS magnum
machine, so inline its functionality directly into mips_jazz_init() and then
remove it.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/input/pckbd.c         | 16 ----------------
 hw/mips/jazz.c           | 13 ++++++++++---
 include/hw/input/i8042.h |  2 --
 3 files changed, 10 insertions(+), 21 deletions(-)

diff --git a/hw/input/pckbd.c b/hw/input/pckbd.c
index 0fc1af403e..b92b63bedc 100644
--- a/hw/input/pckbd.c
+++ b/hw/input/pckbd.c
@@ -762,22 +762,6 @@ static void i8042_mmio_class_init(ObjectClass *klass, void *data)
     set_bit(DEVICE_CATEGORY_INPUT, dc->categories);
 }
 
-MMIOKBDState *i8042_mm_init(qemu_irq kbd_irq, qemu_irq mouse_irq,
-                            ram_addr_t size, hwaddr mask)
-{
-    DeviceState *dev;
-
-    dev = qdev_new(TYPE_I8042_MMIO);
-    qdev_prop_set_uint64(dev, "mask", mask);
-    qdev_prop_set_uint32(dev, "size", size);
-    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
-
-    qdev_connect_gpio_out(dev, I8042_KBD_IRQ, kbd_irq);
-    qdev_connect_gpio_out(dev, I8042_MOUSE_IRQ, mouse_irq);
-
-    return I8042_MMIO(dev);
-}
-
 static const TypeInfo i8042_mmio_info = {
     .name          = TYPE_I8042_MMIO,
     .parent        = TYPE_SYS_BUS_DEVICE,
diff --git a/hw/mips/jazz.c b/hw/mips/jazz.c
index 1eb8bd5018..6aefe9a61b 100644
--- a/hw/mips/jazz.c
+++ b/hw/mips/jazz.c
@@ -361,9 +361,16 @@ static void mips_jazz_init(MachineState *machine,
     memory_region_add_subregion(address_space, 0x80004000, rtc);
 
     /* Keyboard (i8042) */
-    i8042 = i8042_mm_init(qdev_get_gpio_in(rc4030, 6),
-                          qdev_get_gpio_in(rc4030, 7),
-                          0x1000, 0x1);
+    i8042 = I8042_MMIO(qdev_new(TYPE_I8042_MMIO));
+    qdev_prop_set_uint64(DEVICE(i8042), "mask", 1);
+    qdev_prop_set_uint32(DEVICE(i8042), "size", 0x1000);
+    sysbus_realize_and_unref(SYS_BUS_DEVICE(i8042), &error_fatal);
+
+    qdev_connect_gpio_out(DEVICE(i8042), I8042_KBD_IRQ,
+                          qdev_get_gpio_in(rc4030, 6));
+    qdev_connect_gpio_out(DEVICE(i8042), I8042_MOUSE_IRQ,
+                          qdev_get_gpio_in(rc4030, 7));
+
     memory_region_add_subregion(address_space, 0x80005000,
                                 sysbus_mmio_get_region(SYS_BUS_DEVICE(i8042),
                                                        0));
diff --git a/include/hw/input/i8042.h b/include/hw/input/i8042.h
index e199f1ece8..9fb3f8d787 100644
--- a/include/hw/input/i8042.h
+++ b/include/hw/input/i8042.h
@@ -88,8 +88,6 @@ struct MMIOKBDState {
 #define I8042_A20_LINE "a20"
 
 
-MMIOKBDState *i8042_mm_init(qemu_irq kbd_irq, qemu_irq mouse_irq,
-                            ram_addr_t size, hwaddr mask);
 void i8042_isa_mouse_fake_event(ISAKBDState *isa);
 void i8042_setup_a20_line(ISADevice *dev, qemu_irq a20_out);
 
-- 
2.30.2


