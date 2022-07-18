Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1424578A55
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 21:10:36 +0200 (CEST)
Received: from localhost ([::1]:41554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDW8Z-0004j9-SP
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 15:10:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oDVao-0000uH-64
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 14:35:43 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:49168)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oDVam-0005ph-9l
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 14:35:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:
 Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yB/cwCQMDTXd/QgLpPYRFpnL03O7QfeSgAQu9p0yxwU=; b=y5r/qECaErgEeVTkjNibIckOEM
 XxrAlQQfs3Z/NTkYPadF7nVNKrcozRIbKMGTVMe1iZosSykPwEpbMSxPuAFr7yTNvvkN6k/GWK9Lw
 ffNOEfXx2dSYASSozZU5RlJgFEA9mL8g9tzQ0Vl8h4VI7POF8YJbYIwPxGr7POwdU/WoYVvx7eMHb
 7NRafeGhQ9G1ouCA694yFBlnz9px2zintZ5RxLYTIjO08i0PfPlI13UvA1CEP3nxUp67CIbnW0qCw
 CKOiQJO1Act6RRQgZSs3M/Vq7UXeT7Z+ZJ2sd7dKOe22qJepVBlE0QE/FfWV+7TciWISvghmZNyXz
 AukozEH7jiZNNZiPOkRRGf4oLOFZZf6SZAtOj7nAojkgRX24ovt7K4aD5U4e/CWgl8qd9Lx2i/wJX
 TmNsN0lXgTVC432gAxYWXlYCL9V6QrOvPoQdG3o395kmTEtkh5TbsnreNUztroHJs6udbX3moYM3G
 o3LmCfbj7Frau6p1kNGvzWMikGYT7qhWufpeHQHi0/lskmQGiZdQZeA67ux6TUJc15UjM89iem+3E
 bD9i0KQ/s5IZS+DnzXGCbj2S54iz7o43EfNezgk+/WrK0O5kIWch9vy8JdGZpmJmHWjWk01dy62uA
 YqYJD1JVVSScI1LCuOJurBOQuJg5VX0rzzAIBaTYU=;
Received: from [2a00:23c4:8ba6:5100:d563:eb67:74b1:7b0] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oDVZF-000B51-Pb; Mon, 18 Jul 2022 19:34:09 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Date: Mon, 18 Jul 2022 19:33:23 +0100
Message-Id: <20220718183339.124253-25-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220718183339.124253-1-mark.cave-ayland@ilande.co.uk>
References: <20220718183339.124253-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba6:5100:d563:eb67:74b1:7b0
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PULL 24/40] lasips2: introduce port IRQ and new lasips2_port_init()
 function
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

Introduce a new lasips2_port_init() QOM init function for the LASIPS2_PORT type
and use it to initialise a new gpio for use as a port IRQ. Add a new qemu_irq
representing the gpio as a new irq field within LASIPS2Port.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Tested-by: Helge Deller <deller@gmx.de>
Acked-by: Helge Deller <deller@gmx.de>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20220712215251.7944-25-mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/input/lasips2.c         | 8 ++++++++
 include/hw/input/lasips2.h | 1 +
 2 files changed, 9 insertions(+)

diff --git a/hw/input/lasips2.c b/hw/input/lasips2.c
index 49e5c90b73..6b53153838 100644
--- a/hw/input/lasips2.c
+++ b/hw/input/lasips2.c
@@ -322,9 +322,17 @@ static const TypeInfo lasips2_info = {
     .class_init    = lasips2_class_init,
 };
 
+static void lasips2_port_init(Object *obj)
+{
+    LASIPS2Port *s = LASIPS2_PORT(obj);
+
+    qdev_init_gpio_out(DEVICE(obj), &s->irq, 1);
+}
+
 static const TypeInfo lasips2_port_info = {
     .name          = TYPE_LASIPS2_PORT,
     .parent        = TYPE_DEVICE,
+    .instance_init = lasips2_port_init,
     .instance_size = sizeof(LASIPS2Port),
     .abstract      = true,
 };
diff --git a/include/hw/input/lasips2.h b/include/hw/input/lasips2.h
index 4c4b471737..a05f26cbd9 100644
--- a/include/hw/input/lasips2.h
+++ b/include/hw/input/lasips2.h
@@ -41,6 +41,7 @@ struct LASIPS2Port {
     uint8_t buf;
     bool loopback_rbne;
     bool birq;
+    qemu_irq irq;
 };
 
 #define TYPE_LASIPS2_KBD_PORT "lasips2-kbd-port"
-- 
2.30.2


