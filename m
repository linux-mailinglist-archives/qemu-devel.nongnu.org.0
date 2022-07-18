Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05A045789E1
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 20:55:50 +0200 (CEST)
Received: from localhost ([::1]:45610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDVuG-0001XM-2v
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 14:55:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oDVa7-0000Uh-34
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 14:35:12 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:49114)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oDVa1-0005cE-Lq
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 14:34:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:
 Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=G436LThKlKLcqcm30aGWo8tiEAnUiQvcyf3D3183dck=; b=VJ7uugJQ7YIDGkeDwViCtyQii4
 xKa5mq8yA4FWItzoEcpxBNfAlpC52GWa/Td6Mogp/NKeHDhuT3rfHmwOYOyc2EFXfrn9Ap6Zginkr
 VMo18Nskv0SA+ZwpySc0B6Yht/HqWwoX98rDmCwzli9GMbsAe9KR/4ZZnafId1lIr+9IghSa8QPaN
 BCZHt/RptVh4NYYiCTb7XrhhLVbbsxkdDbJeYFAo6n5keQSaTW/RtbYHiiucFsi99WKXIIzeonD2E
 TFzM0y3/1hFLpFvlCLGabwabcNbEqhYlskB0SkX2XKf3KvKY922rmrExknhaADw1p3ksS568O8ITf
 aM1zI5FImOUHRAOF78TshhdYke0Iqg8+HtuuD+YinrqUnts28yIKPQ88GJt1MHEwTfr9c3H0LJ4Hq
 u6T2N3Hn/46Vs/scjDKJsZ8xBnug1E56oFAar7gh2tiicgz16zbvOhcvPTBDptg1YSB/WqP93tgdU
 HBeq0BCFlDEthaW6jSTjkpUD1chzSD4Wmd43rcpOMsTk89oFtIdXat7mts5NdaZF14BZ+Deh0Styi
 gDBSsonIwvbQKmZgVtNyfYTrV6mC3ZEyQqLW6HHDs8f43z7eTCR2BtptOWs2MiB0/VGgrphR2PAQb
 jvln2m4eCDtnwoThaK3QJWA9R18HCKZYQ0i784qPs=;
Received: from [2a00:23c4:8ba6:5100:d563:eb67:74b1:7b0] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oDVYf-000B51-E0; Mon, 18 Jul 2022 19:33:33 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Date: Mon, 18 Jul 2022 19:33:14 +0100
Message-Id: <20220718183339.124253-16-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220718183339.124253-1-mark.cave-ayland@ilande.co.uk>
References: <20220718183339.124253-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba6:5100:d563:eb67:74b1:7b0
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PULL 15/40] lasips2: change LASIPS2State dev pointer from void to
 PS2State
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

This allows the compiler to enforce that the PS2 device pointer is always of
type PS2State. Update the name of the pointer from dev to ps2dev to emphasise
this type change.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Tested-by: Helge Deller <deller@gmx.de>
Acked-by: Helge Deller <deller@gmx.de>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20220712215251.7944-16-mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/input/lasips2.c         | 16 ++++++++--------
 include/hw/input/lasips2.h |  3 ++-
 2 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/hw/input/lasips2.c b/hw/input/lasips2.c
index 48237816a3..b539c4de7a 100644
--- a/hw/input/lasips2.c
+++ b/hw/input/lasips2.c
@@ -146,9 +146,9 @@ static void lasips2_reg_write(void *opaque, hwaddr addr, uint64_t val,
         }
 
         if (port->id) {
-            ps2_write_mouse(port->dev, val);
+            ps2_write_mouse(PS2_MOUSE_DEVICE(port->ps2dev), val);
         } else {
-            ps2_write_keyboard(port->dev, val);
+            ps2_write_keyboard(PS2_KBD_DEVICE(port->ps2dev), val);
         }
         break;
 
@@ -181,7 +181,7 @@ static uint64_t lasips2_reg_read(void *opaque, hwaddr addr, unsigned size)
             break;
         }
 
-        ret = ps2_read_data(port->dev);
+        ret = ps2_read_data(port->ps2dev);
         break;
 
     case REG_PS2_CONTROL:
@@ -206,7 +206,7 @@ static uint64_t lasips2_reg_read(void *opaque, hwaddr addr, unsigned size)
                 ret |= LASIPS2_STATUS_RBNE;
             }
         } else {
-            if (!ps2_queue_empty(port->dev)) {
+            if (!ps2_queue_empty(port->ps2dev)) {
                 ret |= LASIPS2_STATUS_RBNE;
             }
         }
@@ -259,12 +259,12 @@ static void lasips2_realize(DeviceState *dev, Error **errp)
 {
     LASIPS2State *s = LASIPS2(dev);
 
-    s->kbd.dev = ps2_kbd_init();
-    qdev_connect_gpio_out(DEVICE(s->kbd.dev), PS2_DEVICE_IRQ,
+    s->kbd.ps2dev = ps2_kbd_init();
+    qdev_connect_gpio_out(DEVICE(s->kbd.ps2dev), PS2_DEVICE_IRQ,
                           qdev_get_gpio_in_named(dev, "ps2-kbd-input-irq",
                                                  0));
-    s->mouse.dev = ps2_mouse_init();
-    qdev_connect_gpio_out(DEVICE(s->mouse.dev), PS2_DEVICE_IRQ,
+    s->mouse.ps2dev = ps2_mouse_init();
+    qdev_connect_gpio_out(DEVICE(s->mouse.ps2dev), PS2_DEVICE_IRQ,
                           qdev_get_gpio_in_named(dev, "ps2-mouse-input-irq",
                                                  0));
 }
diff --git a/include/hw/input/lasips2.h b/include/hw/input/lasips2.h
index 868c5521d7..9746b7a132 100644
--- a/include/hw/input/lasips2.h
+++ b/include/hw/input/lasips2.h
@@ -23,12 +23,13 @@
 
 #include "exec/hwaddr.h"
 #include "hw/sysbus.h"
+#include "hw/input/ps2.h"
 
 struct LASIPS2State;
 typedef struct LASIPS2Port {
     struct LASIPS2State *parent;
     MemoryRegion reg;
-    void *dev;
+    PS2State *ps2dev;
     uint8_t id;
     uint8_t control;
     uint8_t buf;
-- 
2.30.2


