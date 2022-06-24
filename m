Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53633559B88
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 16:31:03 +0200 (CEST)
Received: from localhost ([::1]:50862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4kKs-0000BR-Cu
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 10:31:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o4jbV-0003Wr-33; Fri, 24 Jun 2022 09:44:09 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:42268)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o4jbS-0005N2-IJ; Fri, 24 Jun 2022 09:44:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+5UR+S6icrtzaPmXzvPoyQy1bdWF8ctZ6s36H7Jtc9w=; b=kBLixgvUBtBqqhI/II+gQ7fHNX
 tA03XDpknIlkQhqI/ewhy4ZHAuojb54gyj3x/lgFYx6eNl+IUD3k+60op2dHnxUZdRCVK6K/RQJSn
 knDW4gunGsk+JSL5ljsOCdmzAMeyFLPfwa3aPznir5ocg8EMvejQTrS4y9Ynvu8f+8dLDLSmhrltX
 tOG48/p+Msx2YAJM8Md/0gfbHGioNzsMPPesHaYLqshb7inirMA3g6idlk0CQKH8wSZD5+7Ifcei5
 G/jzbnLw19pL5tB0BDE4AtLlDO45ObndSdDsB/CV5VCAlGQ5DpRr0JaNqRmcFn6Gd50sjyK23opx/
 FwfDB5/aCNaVocbRDE4qrwv9zkl4YZOvKCH0HWJCdTV8n/e/gD+QV5RnEFOSOuJiT6zw8LrXnk/qP
 XLz0sW742hFc0sQvq2tQa8XBqgSJ4urtyVJmJo44Ug4wNh94Kx3Fvpc2sX8mK6u3i8UcIUB8CHHHc
 65pF9NbFvIazxI2tCBsYyoOIzVxuWdeZg4fV/SBUA3Edsa7wwV5E6dvoAUbstSSQTKawYK7qWLgTL
 Mu22CvisEuKnjJbjhU7ntgyry3KwTee2w9fU8n62eBdmBFdVNCFnrLBld7DBgouJ+fXbq6pAhBadE
 bJumiJmT8blQw7lduS2n5ZR2YmlG31YGi7nWa6YNA=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o4jZp-00037t-UH; Fri, 24 Jun 2022 14:42:30 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com,
 pbonzini@redhat.com, peter.maydell@linaro.org, hpoussin@reactos.org,
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, jiaxun.yang@flygoat.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Date: Fri, 24 Jun 2022 14:40:55 +0100
Message-Id: <20220624134109.881989-41-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220624134109.881989-1-mark.cave-ayland@ilande.co.uk>
References: <20220624134109.881989-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 40/54] lasips2: rename lasips2_init() to lasips2_initfn()
 and update it to return the LASIPS2 device
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

When QOMifying a device it is typical to use _init() as the suffix for an
instance_init function, however this name is already in use by the legacy LASIPS2
wrapper function. Eventually the wrapper function will be removed, but for now
rename it to lasips2_initfn() to avoid a naming collision.

At the same time update lasips2_initfn() return the LASIPS2 device so that it
can later be accessed using qdev APIs by the HPPA machine.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Acked-by: Helge Deller <deller@gmx.de>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/hppa/machine.c          | 4 ++--
 hw/input/lasips2.c         | 6 ++++--
 include/hw/input/lasips2.h | 3 ++-
 3 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/hw/hppa/machine.c b/hw/hppa/machine.c
index 63b9dd2396..72677aeb2a 100644
--- a/hw/hppa/machine.c
+++ b/hw/hppa/machine.c
@@ -280,8 +280,8 @@ static void machine_hppa_init(MachineState *machine)
     }
 
     /* PS/2 Keyboard/Mouse */
-    lasips2_init(addr_space, LASI_PS2KBD_HPA,
-                 qdev_get_gpio_in(lasi_dev, LASI_IRQ_PS2KBD_HPA));
+    lasips2_initfn(addr_space, LASI_PS2KBD_HPA,
+                   qdev_get_gpio_in(lasi_dev, LASI_IRQ_PS2KBD_HPA));
 
     /* register power switch emulation */
     qemu_register_powerdown_notifier(&hppa_system_powerdown_notifier);
diff --git a/hw/input/lasips2.c b/hw/input/lasips2.c
index 2caa80bd3c..85da4081e3 100644
--- a/hw/input/lasips2.c
+++ b/hw/input/lasips2.c
@@ -245,8 +245,8 @@ static void lasips2_port_set_irq(void *opaque, int level)
     lasips2_update_irq(port->parent);
 }
 
-void lasips2_init(MemoryRegion *address_space,
-                  hwaddr base, qemu_irq irq)
+LASIPS2State *lasips2_initfn(MemoryRegion *address_space,
+                             hwaddr base, qemu_irq irq)
 {
     LASIPS2State *s;
     DeviceState *dev;
@@ -272,6 +272,8 @@ void lasips2_init(MemoryRegion *address_space,
     memory_region_init_io(&s->mouse.reg, NULL, &lasips2_reg_ops, &s->mouse,
                           "lasips2-mouse", 0x100);
     memory_region_add_subregion(address_space, base + 0x100, &s->mouse.reg);
+
+    return s;
 }
 
 static const TypeInfo lasips2_info = {
diff --git a/include/hw/input/lasips2.h b/include/hw/input/lasips2.h
index ddcea74c14..5a35c22f73 100644
--- a/include/hw/input/lasips2.h
+++ b/include/hw/input/lasips2.h
@@ -33,6 +33,7 @@ struct LASIPS2State {
 #define TYPE_LASIPS2 "lasips2"
 OBJECT_DECLARE_SIMPLE_TYPE(LASIPS2State, LASIPS2)
 
-void lasips2_init(MemoryRegion *address_space, hwaddr base, qemu_irq irq);
+LASIPS2State *lasips2_initfn(MemoryRegion *address_space, hwaddr base,
+                             qemu_irq irq);
 
 #endif /* HW_INPUT_LASIPS2_H */
-- 
2.30.2


