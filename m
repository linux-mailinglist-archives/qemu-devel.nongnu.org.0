Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE5857291E
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jul 2022 00:15:52 +0200 (CEST)
Received: from localhost ([::1]:54694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBOAZ-0005db-NJ
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 18:15:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oBNqH-0003xC-NZ; Tue, 12 Jul 2022 17:54:53 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:42356)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oBNqF-0007vl-EQ; Tue, 12 Jul 2022 17:54:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VP5Fwzm42ZTCNRvG0VaHyDLuRuuzk1FrlrJGokcaSnc=; b=TCZh71vBJh9J4C3YGbT//xrRAQ
 p5cW/CwlVEWQhBUsjAPBpPqjowf0bxHBjhcoF3hZjUdCsSrot5W/JTOh99ARan0q9m4QomtNbDJDh
 SQ0jjLrkilkTl4QPmzkKA9eHcaCl86W9d374+LLrizz6NCSzaYg0f8wmEfLSN+PT0LjPQk/28v1FT
 Gf3kZrbZtgPaBA0uav8AIu7PuHpGrrabnXyJLLeO3H7Hk1la0XzRexhKbDS8lkAY+kVXG4dM6/2S0
 te149+h63MDTTqlCNcWObZ4PkM1j820mK1Died2IF1KDSI+rTBwQAPwWJ+rZAQcBVwl6s4HscSPzB
 XKJiC+HMsbdx4khOfgVtGCNDHslWVdTA5IVXg4e8lMFXDY/U/s6xt1LqFoJm4tinJkdL4nwnHTyZp
 GQsA3Xrc3BUbe+6zuzXovGayz9ijTP2rj7cq1JMCn2wHT/RMv2P95ErQvdl4su+i9HF15/UD2Tdzh
 B6RFEsOpxq7y5W5W6sKyVOEfJCqVU0ZuAgfeTRb41HIPhzN4vufjCBQKwz4xR/l6o/M1qdRt/KIB2
 LKI5jIE1bKHZEo1WLtdigiTkPRkX5aN0FneUmwaA0byGBvxvbFsE0IrTayGqfRIhP79z2DatAFDFB
 OYB7sNn++hKlvFcSkCBebW0kuZCrQvhVWsrK1bsxM=;
Received: from [2a00:23c4:8ba5:df00:fd7d:1c3a:1dd0:c576] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oBNoX-000Bqt-BG; Tue, 12 Jul 2022 22:53:08 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, svens@stackframe.org,
 pbonzini@redhat.com, peter.maydell@linaro.org, hpoussin@reactos.org,
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Date: Tue, 12 Jul 2022 22:52:35 +0100
Message-Id: <20220712215251.7944-25-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220712215251.7944-1-mark.cave-ayland@ilande.co.uk>
References: <20220712215251.7944-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba5:df00:fd7d:1c3a:1dd0:c576
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 24/40] lasips2: introduce port IRQ and new
 lasips2_port_init() function
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


