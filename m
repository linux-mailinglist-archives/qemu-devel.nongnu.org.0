Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC568572935
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jul 2022 00:22:28 +0200 (CEST)
Received: from localhost ([::1]:43714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBOGx-00019c-Rz
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 18:22:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oBNpk-0002DO-47; Tue, 12 Jul 2022 17:54:20 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:42200)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oBNpi-0007sC-L7; Tue, 12 Jul 2022 17:54:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5TC/JZ0XeVhmOyPKf5/Y8r3bSWr1ARm+/kCLXuMQ4xM=; b=PhxGgFBosLMtBotqh5aWrOVyBh
 LSOBaXkLUqnp2tuPz6ycsLaUvdQUm/cZRTCEIyOkSNvhVtccZW6TjUUhPFWGPILAizlBS4APeZy58
 9QoWAgEYA8S8kXFLos8BOXOHzJFJRk6D7RakZuqr9c9PUBh2eHC7vMEQpU9+mjUdJlWAv+YpTsrTH
 d1fgPfnif+/tU7eXepM5BFNg5iuOqFtr6AY7474FKtTof7+SPCL4O9tq/FKZRW/YCjwelf7dmIXcG
 BFdg1lDF6dwa7kNDLoMr6Nkhh86Oj0pskeHrUfUEue1IzqBIg1MV6RclXBhaeeZBESDe13vLsg4Bf
 ykWMAAoO6b404BWNf5KwYol1zFe+sM6125yKRx6q+soXXGZgfFw16AJQvvDEyizsb+nNbLY/lNmRy
 0YV5KqKsI4KIHaLJNJos2QfNG5QKBo3KRGa1QKEsp2/ql4CAWJjjenIrjkfj8ejxTa+A+8bHiNjva
 VbyhZYdAEdYmtmqcEJDVgIRHQphmBgiDEoVCVlByFOGy0Htv86Iw1vcl6ysMPuJ2H/6wyrVb1wLF8
 3WSuEhV5RriDAesMc3FaJm2uGgX7ogrwmjPP42wG7hZ5BMdwt7kAdN6AZ3eEjwnnZ2owUC23Xu0oB
 lIsFrv1Wbs7a5pZUyGARex53ZTwlbf5jq4JkP1n2A=;
Received: from [2a00:23c4:8ba5:df00:fd7d:1c3a:1dd0:c576] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oBNnw-000Bqt-Uj; Tue, 12 Jul 2022 22:52:32 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, svens@stackframe.org,
 pbonzini@redhat.com, peter.maydell@linaro.org, hpoussin@reactos.org,
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Date: Tue, 12 Jul 2022 22:52:25 +0100
Message-Id: <20220712215251.7944-15-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220712215251.7944-1-mark.cave-ayland@ilande.co.uk>
References: <20220712215251.7944-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba5:df00:fd7d:1c3a:1dd0:c576
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 14/40] lasips2: remove legacy lasips2_initfn() function
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

There is only one user of the legacy lasips2_initfn() function which is in
machine_hppa_init(), so inline its functionality into machine_hppa_init() and
then remove it.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Tested-by: Helge Deller <deller@gmx.de>
Acked-by: Helge Deller <deller@gmx.de>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/hppa/machine.c          |  6 ++++--
 hw/input/lasips2.c         | 12 ------------
 include/hw/input/lasips2.h |  2 --
 3 files changed, 4 insertions(+), 16 deletions(-)

diff --git a/hw/hppa/machine.c b/hw/hppa/machine.c
index 6080037cf1..e53d5f0fa7 100644
--- a/hw/hppa/machine.c
+++ b/hw/hppa/machine.c
@@ -280,8 +280,10 @@ static void machine_hppa_init(MachineState *machine)
     }
 
     /* PS/2 Keyboard/Mouse */
-    dev = DEVICE(lasips2_initfn(qdev_get_gpio_in(lasi_dev,
-                                                 LASI_IRQ_PS2KBD_HPA)));
+    dev = qdev_new(TYPE_LASIPS2);
+    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
+    sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0,
+                       qdev_get_gpio_in(lasi_dev, LASI_IRQ_PS2KBD_HPA));
     memory_region_add_subregion(addr_space, LASI_PS2KBD_HPA,
                                 sysbus_mmio_get_region(SYS_BUS_DEVICE(dev),
                                                        0));
diff --git a/hw/input/lasips2.c b/hw/input/lasips2.c
index 40f77baf3e..48237816a3 100644
--- a/hw/input/lasips2.c
+++ b/hw/input/lasips2.c
@@ -255,18 +255,6 @@ static void lasips2_set_mouse_irq(void *opaque, int n, int level)
     lasips2_update_irq(port->parent);
 }
 
-LASIPS2State *lasips2_initfn(qemu_irq irq)
-{
-    DeviceState *dev;
-
-    dev = qdev_new(TYPE_LASIPS2);
-    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
-
-    sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, irq);
-
-    return LASIPS2(dev);
-}
-
 static void lasips2_realize(DeviceState *dev, Error **errp)
 {
     LASIPS2State *s = LASIPS2(dev);
diff --git a/include/hw/input/lasips2.h b/include/hw/input/lasips2.h
index f051c970f0..868c5521d7 100644
--- a/include/hw/input/lasips2.h
+++ b/include/hw/input/lasips2.h
@@ -47,6 +47,4 @@ struct LASIPS2State {
 #define TYPE_LASIPS2 "lasips2"
 OBJECT_DECLARE_SIMPLE_TYPE(LASIPS2State, LASIPS2)
 
-LASIPS2State *lasips2_initfn(qemu_irq irq);
-
 #endif /* HW_INPUT_LASIPS2_H */
-- 
2.30.2


