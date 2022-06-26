Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E687A55B368
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Jun 2022 20:13:53 +0200 (CEST)
Received: from localhost ([::1]:55214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5Wld-0000lK-07
	for lists+qemu-devel@lfdr.de; Sun, 26 Jun 2022 14:13:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o5WNG-0004bA-KA
 for qemu-devel@nongnu.org; Sun, 26 Jun 2022 13:48:42 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:45248)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o5WNF-0000G3-60
 for qemu-devel@nongnu.org; Sun, 26 Jun 2022 13:48:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yX9EeOMaBsxuZOXfnnKXJiaeqWK7gCVY11wECuSrFpA=; b=BV6+hk6+vQokBZeQZeGHX58mFC
 tlVpwJLAaiVCik2G89PJaTzUeD/t8kHWRQycKY/KOBu9Ag3LbM4JgOCVtBNRA2QwawM3ekGQWecG6
 jmZIWjDJamStiIb2TvNWvxIQWm+RdGYnKupA6X+gwVEnevRUDa7+424crutuubMjwX3C+eFQHMhpQ
 s5GVsucNKTg2McqYzZrolLIyqMDmmW+BlDyQsJR8nVO6htqESL1Nm/xHyBvxWM356Oz4xAIZBxlmo
 J38XMNAwJffPUrIlJko3AU1u1A2WwMY8bS4lyZoa1TRhC2ZcjbMggPdWE+CZIcVOVorotfQsoj6Ny
 0xUnKsOl5JTFww27bGYiSUfukW+JgB4poCRQM+iTfeU4AxeMPo3s4QLLVne4PoQEhdtQVEiCsESLg
 tyuUPrF9ExS7D9EE5eKIKomzCVEK38cGqLnf/8X4oXbbkeZLU4x/fH7rpeYLd3U0UvNyb3U2yNvaU
 XwxUSlw47497YctaBtozD4o50zvZJOrYIUfAPPrJbFdYZ2raK27ROkgmgPlrHbz36Fx8f71ue7iW+
 FF869QutFo3UpCdirYNOgjRGfXTdNjwVXsyASfUwgLp7S5XDtJpy0SanJ2vltAGL38FbrfD1lA9Ws
 OWKq6Gu5YA1xS8UX1ooU0m+r6nEstXtaGJWXBIGlU=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o5WLq-0007KY-KR; Sun, 26 Jun 2022 18:47:18 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org,
	qemu-devel@nongnu.org
Date: Sun, 26 Jun 2022 18:45:21 +0100
Message-Id: <20220626174531.969187-46-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220626174531.969187-1-mark.cave-ayland@ilande.co.uk>
References: <20220626174531.969187-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PULL 45/55] lasips2: implement lasips2_realize()
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

Move ps2_kbd_init() and ps2_mouse_init() from lasips2_initfn() to lasips2_realize.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Acked-by: Helge Deller <deller@gmx.de>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20220624134109.881989-46-mark.cave-ayland@ilande.co.uk>
---
 hw/input/lasips2.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/hw/input/lasips2.c b/hw/input/lasips2.c
index 81beb5b614..49405191cb 100644
--- a/hw/input/lasips2.c
+++ b/hw/input/lasips2.c
@@ -256,13 +256,17 @@ LASIPS2State *lasips2_initfn(hwaddr base, qemu_irq irq)
     s = LASIPS2(dev);
 
     s->irq = irq;
+    return s;
+}
+
+static void lasips2_realize(DeviceState *dev, Error **errp)
+{
+    LASIPS2State *s = LASIPS2(dev);
 
-    vmstate_register(NULL, base, &vmstate_lasips2, s);
+    vmstate_register(NULL, s->base, &vmstate_lasips2, s);
 
     s->kbd.dev = ps2_kbd_init(lasips2_port_set_irq, &s->kbd);
     s->mouse.dev = ps2_mouse_init(lasips2_port_set_irq, &s->mouse);
-
-    return s;
 }
 
 static void lasips2_init(Object *obj)
@@ -292,6 +296,7 @@ static void lasips2_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
 
+    dc->realize = lasips2_realize;
     device_class_set_props(dc, lasips2_properties);
     set_bit(DEVICE_CATEGORY_INPUT, dc->categories);
 }
-- 
2.30.2


