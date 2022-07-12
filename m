Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09DF75728F5
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jul 2022 00:05:25 +0200 (CEST)
Received: from localhost ([::1]:54108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBO0S-0002YU-5D
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 18:05:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oBNpG-0000eA-1f; Tue, 12 Jul 2022 17:53:50 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:42130)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oBNpD-0007rF-Hu; Tue, 12 Jul 2022 17:53:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ylf5mOMVt6EWrnSvuLiTfCcQfmoY4p/+xw/H0xk9fhk=; b=bSgf6Ku0L1ZqmIvbjbxhBmrSNN
 rEgSp8AczUhgn3iQw/oAzRWC0C8E/gBTns2JGn+dZ7SvFKDcds77aNzW/EDrKuXJfqrDqJYCNc9l8
 Crw77KJFtpPCFuQ3r9c2yoebsaWI6rEfdXlhBmRVvVf+AHz9HYWFUsXO0/4OlqYbPth2rNGXahHdc
 ccWZ4NMQRBK4c2XwTG/u+YIOMoMBIEldc+ecxIRhPXc1UF/8TBZ1Wp1QX6rZFuuBjb/7eLSedTB6I
 D5TEOudK66z23inNb+/ZHib2NkbOzxXnahdCC3BJTJ4P4hsGa1rR4hqeiAjpY2mg+18hBm965/bdS
 oDgUq525DneX3UCGjZMnWz/8TI1fpIcLJpVLqoKwdXVg5fsfdBxnFz0tS7gTIAJOQdLAbXQppMqNT
 k+ejyvhV3ojtA1xkYoA2QQ1guWNpb6AUv+sztnRfepljcwVAorSBuK8U5+B0wDHvWA+yO8BcjF01F
 HdZosahTNutgL2ymjnnrZrh2QQhECjnLMskLDs/OqFfT9LNt1KVJUNJvtdZxGWKC+rpUPBZdOts24
 0hQVUXoGxlisByFa30SMElJAeoTTGy6OSDre5y0/l3aj0A7Mauj3OFUtKDOASPZLDUmaVWf9YTIPB
 cvX1tXfo9I5PaRoqQSWkZx7XCaS3Yd4YZSy8+a4/0=;
Received: from [2a00:23c4:8ba5:df00:fd7d:1c3a:1dd0:c576] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oBNno-000Bqt-KO; Tue, 12 Jul 2022 22:52:24 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, svens@stackframe.org,
 pbonzini@redhat.com, peter.maydell@linaro.org, hpoussin@reactos.org,
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Date: Tue, 12 Jul 2022 22:52:23 +0100
Message-Id: <20220712215251.7944-13-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220712215251.7944-1-mark.cave-ayland@ilande.co.uk>
References: <20220712215251.7944-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba5:df00:fd7d:1c3a:1dd0:c576
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 12/40] lasips2: don't use vmstate_register() in
 lasips2_realize()
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

Since lasips2 is a qdev device then vmstate_ps2_mouse can be registered using
the DeviceClass vmsd field instead.

Note that due to the use of the base parameter in the original vmstate_register()
function call, this is actually a migration break for the HPPA B160L machine.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Tested-by: Helge Deller <deller@gmx.de>
Acked-by: Helge Deller <deller@gmx.de>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/input/lasips2.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/input/lasips2.c b/hw/input/lasips2.c
index 9223cb0af4..d4fa248729 100644
--- a/hw/input/lasips2.c
+++ b/hw/input/lasips2.c
@@ -272,8 +272,6 @@ static void lasips2_realize(DeviceState *dev, Error **errp)
 {
     LASIPS2State *s = LASIPS2(dev);
 
-    vmstate_register(NULL, s->base, &vmstate_lasips2, s);
-
     s->kbd.dev = ps2_kbd_init();
     qdev_connect_gpio_out(DEVICE(s->kbd.dev), PS2_DEVICE_IRQ,
                           qdev_get_gpio_in_named(dev, "ps2-kbd-input-irq",
@@ -319,6 +317,7 @@ static void lasips2_class_init(ObjectClass *klass, void *data)
     DeviceClass *dc = DEVICE_CLASS(klass);
 
     dc->realize = lasips2_realize;
+    dc->vmsd = &vmstate_lasips2;
     device_class_set_props(dc, lasips2_properties);
     set_bit(DEVICE_CATEGORY_INPUT, dc->categories);
 }
-- 
2.30.2


