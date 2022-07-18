Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2446578A4B
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 21:07:03 +0200 (CEST)
Received: from localhost ([::1]:33204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDW58-0005zQ-Oj
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 15:07:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oDVZq-00007z-Rj
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 14:34:43 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:49096)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oDVZp-0005bS-By
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 14:34:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:
 Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Y7dS4l/41bQu4s4Aa0fRuzzEhNMxdlYGsLuwjL0xBiU=; b=N2EeiLJnTJHl+px3j/vYzFjND5
 NX6UwCLX5PWN8zIJZvDselzqR1o5VHWPVEcUOTFKh6nlsG39Bn3LON0+dOt1Qngx9Q4rZRaYOUvYA
 ibxTMQNG+dkRkgb48icd16sAD3rT42RAIKhjz2qdlUG8E+LEoKC1/jt5kWDv4sJp68oHE5s1XfYfj
 Kp1/kNOUCzBB+chzRn5Q8YErn/LFaxP90ZLuOEnZ5T0f/H0EhK1Tq+z+tHvoWuh+DFGAmMW/0f8f2
 ax/3Kewy55LZDa5mUwpeZPteSBJfpJywQPc1tG0OdTxv9B+qCr92koPocdnLSGC+S8GSDdUGIe2tT
 Od61S/3bNon2WFGIYxgELmzCS9sQiVHV4kXkvuWOz02Ey3CpL8xumKXwvhIM4pCQ0hb6csUvg6h2m
 8Apuq0MoCzNQcJk4+ZRKTjjKuLE8AFwKrLHOCkBhUBDoo+dl9KGRDmRWLu0qxra/+QM4ot8DoM+xK
 2wRPiBhJ754wW9dzerDP6S2vu9gnO/CU6bYlRRLbC7sY0EZnRDGxQY28++BeiW0MkNylJrgZvI8/d
 jApICwZYfPT2eT6BEpQIkad7z5hrlB8YrNfjsA6i6/pKcUGdF3PDlVYxQ7y2kuFseGlotKYQ3tfdt
 YSsLdoJnWc4JWR1n8HFp/tUQ4/MikhhT4izSh7oUA=;
Received: from [2a00:23c4:8ba6:5100:d563:eb67:74b1:7b0] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oDVYT-000B51-CF; Mon, 18 Jul 2022 19:33:21 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Date: Mon, 18 Jul 2022 19:33:11 +0100
Message-Id: <20220718183339.124253-13-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220718183339.124253-1-mark.cave-ayland@ilande.co.uk>
References: <20220718183339.124253-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba6:5100:d563:eb67:74b1:7b0
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PULL 12/40] lasips2: don't use vmstate_register() in
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
Message-Id: <20220712215251.7944-13-mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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


