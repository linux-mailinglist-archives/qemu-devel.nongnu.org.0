Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BEC6578A3F
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 21:02:56 +0200 (CEST)
Received: from localhost ([::1]:55958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDW19-0001zr-FA
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 15:02:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oDVay-0001Hh-3q
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 14:35:52 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:49188)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oDVaw-0005sa-Ii
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 14:35:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:
 Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uYuoGHjA1mwY/aokdjYjyt039OvWgWn8a7JQvXi/wYI=; b=jOdpIA1J+y3Rp8zXVRqQha+g8v
 iREK9jfDR2YkOZLr2Y593HpINL1p9wYfoXWD29fzmsPGihlE+m3FauSRfatxB0TraIphKzGsUn6Dz
 ETurPyyrTDbDUKLsL3qKLxZYKp5mdrTDahlDxSZGGLbefOwABt6+YOfQGNscy3aOR3bmWbVLH+KLT
 QeDYK2ZmQrqodfIAyfjqpT8S1eVQ+dZG1wS3Jq7Y1gfLvsz3iUL6vxKObMhBWBsnWPRML4nGitSBQ
 dJwb/n6f/i8PiG986bPqzLhvtG4WPI6bkq1XWIQJzeQ0ZRjH2Z804cXqTZF2V2PIT4gvRsugKdJa7
 JFCdnDw5ZIwdjmHrDf1rbSetAW6e9GvciJ9vVvzJIaVZ5/kS3Cdp8FyIe6OznfXv0VsB+DivVyPfl
 SAZZkxkI2UM1mKo1Z9kC6cEhlmuYfd7/2wqb+Bh9nKMA36Ogdvne37myIC93XG++kfC7b3bW33Ak5
 cwEA96edIXf4yYlQoLr7p2U+nWPVQGGADvFoXExW6/RhrZ78OPrqrQU11CeeoZXWaWnjqa1wTI3zJ
 7Sy+aFZFJX6Du3VhOcf1LynZTw2gmFpoTocYhLSDfo5mjrbsJ09TvJtFIOz1frA2AIQ0cfNXWRhtn
 GUIKLKfCksv0wY8jqfQBuDXd0m7Lt2vwX43bbt6n0=;
Received: from [2a00:23c4:8ba6:5100:d563:eb67:74b1:7b0] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oDVZR-000B51-5R; Mon, 18 Jul 2022 19:34:21 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Date: Mon, 18 Jul 2022 19:33:26 +0100
Message-Id: <20220718183339.124253-28-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220718183339.124253-1-mark.cave-ayland@ilande.co.uk>
References: <20220718183339.124253-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba6:5100:d563:eb67:74b1:7b0
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PULL 27/40] lasips2: add named input gpio to handle incoming port
 IRQs
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

The LASIPS2 device named input gpio is soon to be connected to the port output
IRQs. Add a new int_status field to LASIPS2State which is a bitmap representing
the port input IRQ status which will be enabled in the next patch.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Tested-by: Helge Deller <deller@gmx.de>
Acked-by: Helge Deller <deller@gmx.de>
Message-Id: <20220712215251.7944-28-mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/input/lasips2.c         | 15 +++++++++++++++
 include/hw/input/lasips2.h |  1 +
 2 files changed, 16 insertions(+)

diff --git a/hw/input/lasips2.c b/hw/input/lasips2.c
index ec1661a8f1..013d891af6 100644
--- a/hw/input/lasips2.c
+++ b/hw/input/lasips2.c
@@ -125,6 +125,19 @@ static void lasips2_update_irq(LASIPS2State *s)
                          s->mouse_port.parent_obj.birq);
 }
 
+static void lasips2_set_irq(void *opaque, int n, int level)
+{
+    LASIPS2State *s = LASIPS2(opaque);
+
+    if (level) {
+        s->int_status |= BIT(n);
+    } else {
+        s->int_status &= ~BIT(n);
+    }
+
+    lasips2_update_irq(s);
+}
+
 static void lasips2_reg_write(void *opaque, hwaddr addr, uint64_t val,
                               unsigned size)
 {
@@ -303,6 +316,8 @@ static void lasips2_init(Object *obj)
                             "ps2-kbd-input-irq", 1);
     qdev_init_gpio_in_named(DEVICE(obj), lasips2_set_mouse_irq,
                             "ps2-mouse-input-irq", 1);
+    qdev_init_gpio_in_named(DEVICE(obj), lasips2_set_irq,
+                            "lasips2-port-input-irq", 2);
 }
 
 static void lasips2_class_init(ObjectClass *klass, void *data)
diff --git a/include/hw/input/lasips2.h b/include/hw/input/lasips2.h
index 35e0aa26eb..b79febf64b 100644
--- a/include/hw/input/lasips2.h
+++ b/include/hw/input/lasips2.h
@@ -69,6 +69,7 @@ struct LASIPS2State {
 
     LASIPS2KbdPort kbd_port;
     LASIPS2MousePort mouse_port;
+    uint8_t int_status;
     qemu_irq irq;
 };
 
-- 
2.30.2


