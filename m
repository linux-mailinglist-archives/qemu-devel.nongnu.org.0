Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A84C4578AE9
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 21:31:42 +0200 (CEST)
Received: from localhost ([::1]:49476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDWSz-0007e4-B5
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 15:31:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oDVbn-0002O3-QW
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 14:36:44 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:49264)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oDVbm-00062U-2y
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 14:36:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:
 Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OZ9BtdNlBrsJUplHq8XISjD3aktmtsBHWCy0DKeWwIc=; b=EUZdr841Qx9InWjsDqZ//6KBYW
 /JkmcOttnJw9Zg5KNOk5A9BwMFH6kI5RjJz+YUSVDEyRv0UHEk2MWUTbpRIvcP8Xd7+33zK/g2EKX
 6UvYXdYMuIJNJ68bJsxM2HzD+k99g3ezoiNCcSQzw1cuDMfRSd66yECC+xGVyfBcXt1LySIfO7AYK
 vxuGUY9/Rz56Fdb9Pvhjp/YRoJVNelnGq1PKWj0rHRehv4Ce+5shhuQVqBwBJC7CIw5qtf92zDpLa
 NtcIsy4WPXgDgL8YLGocuo/ePUBSW38yqC3z1r/l1hXpL+C8BxRcB8DIlEgzuPdVvIt8Y9aMaSDpO
 evMtjDj5VYILLx6j3gd9uuFkINJjzvUiztj6sOaJZRDlLCyp2F9PC77JkcJJcwweWa+LshK4l/7NO
 jJZgEYfhOcjyTUVzAg6i/Esacpdzjygj9MtohBRjvZqzCDmkhUFZfp/gHkLfOigN0yBvNBA55JOqs
 6fqAGqOq5RYumAHJAu6nSlVDRtB+JZcli0cDOXi7gkZ/c7Y3NGAPOQQsLePl2ylrjVIZEOsLhwHju
 dYFyfSoi5u+XtHyLN+t5DmKVU4n2PYh5gWugaBHlcrYYtF+uCRCUXfEygqzHuA+AoNMmEEjJIq7ti
 EOiFpcDKTGk8m0PDehedliwmwB0c5J+M992tAo9gU=;
Received: from [2a00:23c4:8ba6:5100:d563:eb67:74b1:7b0] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oDVaG-000B51-4k; Mon, 18 Jul 2022 19:35:11 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Date: Mon, 18 Jul 2022 19:33:39 +0100
Message-Id: <20220718183339.124253-41-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220718183339.124253-1-mark.cave-ayland@ilande.co.uk>
References: <20220718183339.124253-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba6:5100:d563:eb67:74b1:7b0
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PULL 40/40] pckbd: remove legacy i8042_mm_init() function
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
Tested-by: Helge Deller <deller@gmx.de>
Acked-by: Helge Deller <deller@gmx.de>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20220712215251.7944-41-mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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


