Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D2C572929
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jul 2022 00:18:53 +0200 (CEST)
Received: from localhost ([::1]:35272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBODU-0003j4-EF
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 18:18:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oBNqP-000473-IR; Tue, 12 Jul 2022 17:55:01 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:42410)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oBNqN-0007wi-Vx; Tue, 12 Jul 2022 17:55:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=N9uCW4I83GuTBM9+Dffp16en7+TzfXrG3yYxyvznf/k=; b=vkkyIdAJwnrq8q3xhjvXgdJ3+b
 5JhkXJ09DwBVbGf/IksqbSvC+B4zc5VIoXu4PveRbsnepwSQIWQy+WmY6NcMlhp/WCKAwpUmC/4pT
 ujiOUSfpdUtoSrOhSwH4HQXPq6M+Zy66pkgotQpA/ywMwng8rd6ukDKpn3OPsBT9x5rQfwEjoqjZ9
 9wVBddcrmeGgP4ke/B99vj4SEIgUXmQDlQ6tDgwux7ySLy07qWOWGPfVRklsFfnoXU9baoTDpW+Op
 VIyPY0Gkgfr/XLGRmDXf+y0/F+utcP9tSEwMAO8fH9Kgcmoogx/fMA5py36ecWOs2HGeN9v8NFzyx
 esKrRziwVcYsogvY8ZShmlLc3/UScI3WobgM95rAAKGoLd9frwNPOCrnPXfQhB4zDK97L2h4321/F
 w74WCBPdVVsQ/CqxkwPKGwHc4k0OB8dRcWlwrp96BHoUn8SDXvUzIq/JGsO3lY/Hi5SpiD5EbSxiA
 UoJ/bwr5iK+cNMp/N9fAW4VDr9XEfPa+wXIIc8vHlb4XKWfJclUCCt+TNH1Ojjh5/0uMjJQAiHUYC
 0uvQbX/Kzivw5Pi0n8VV6F/WEEIQHSMhestB5paQOoa/bhVyJy4gyBYlDXj4cl+NdQyAF6lducivh
 aOYUpEdu+j+4Y8y8mAqkhXQByFEQMU8+8M7D6gmQg=;
Received: from [2a00:23c4:8ba5:df00:fd7d:1c3a:1dd0:c576] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oBNof-000Bqt-Cj; Tue, 12 Jul 2022 22:53:17 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, svens@stackframe.org,
 pbonzini@redhat.com, peter.maydell@linaro.org, hpoussin@reactos.org,
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Date: Tue, 12 Jul 2022 22:52:38 +0100
Message-Id: <20220712215251.7944-28-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220712215251.7944-1-mark.cave-ayland@ilande.co.uk>
References: <20220712215251.7944-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba5:df00:fd7d:1c3a:1dd0:c576
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 27/40] lasips2: add named input gpio to handle incoming
 port IRQs
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


