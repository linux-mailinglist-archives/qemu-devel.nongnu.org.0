Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CFEF53055A
	for <lists+qemu-devel@lfdr.de>; Sun, 22 May 2022 21:08:49 +0200 (CEST)
Received: from localhost ([::1]:54954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nsqwa-0004hi-IL
	for lists+qemu-devel@lfdr.de; Sun, 22 May 2022 15:08:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsqBp-0007z0-Vg; Sun, 22 May 2022 14:20:33 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:47874)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsqBo-0003pl-Iy; Sun, 22 May 2022 14:20:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=71d35CBsgISWSQOprS2V351VeSYus1+Hg2yafeitT/I=; b=IaYL6kxaISiV4DQSO6/fFWKf+Y
 QmfUySIvz3yv+u3b4+CoSzc19wbTmIZN/iEU4wpnh0vW2Lo1VSY9GbI/TMTfH9R4a2JbV5TO8eXnv
 oXPO3ieRMiKKim0gdRWq5cu1BdvwtY4GzO4RZaNl3WmpL43C3bw5sk5BF+tdp/XHhLbAVbkAUg7xG
 XJyFbG9KgX0V74BeL6ZnVN1ylPGhwNyy5iiHtO/LTHfw/Igwmgj/duP+mrW7Dum3VjOy/3rHduj1J
 yNTM75zCAVSBRfrPYFGdRV2jNnRnCfILm1LaGfgUUP0goenrd0Nffp3suVCCTdFJPkRfma4/7Vny/
 C0UmJtX+FEcZCMr15tKfq0fdHfdXeb9cAzX+A44OLYLC/AqzpK6NHwVCvfBrTzDr5lxqalg/FwtCz
 pGxSjCj4IlqhYbsgUCmzc9xVprvG6LLKxmQ5lNtVxYGHokxxmcsMTnLzuW+4Aja+Q7+d/xS6I5Iv1
 kCeqeOf8E2I8a2A2pDaGHFVTPR2Y0hwnHtzSuzVLulHal9L2WgzDugmtQoK3rJb+p6pRdZ732JJei
 hLh5O+M+/REu6WNxP53VOeMpqNZs8viEKa99IsqKQhS/MXWbOxQUV2Mc30n6Cknps+OBmiVSnqaBj
 Dswm0mSSxP/HWVN0UrSqia8/aHBnmX2GS7NnLPVfc=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsqAM-0007pH-II; Sun, 22 May 2022 19:18:58 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com,
 pbonzini@redhat.com, peter.maydell@linaro.org, hpoussin@reactos.org,
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, jiaxun.yang@flygoat.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Date: Sun, 22 May 2022 19:18:16 +0100
Message-Id: <20220522181836.864-31-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
References: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 30/50] pckbd: move ps2_kbd_init() and ps2_mouse_init() to
 i8042_mmio_realize()
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

Move ps2_kbd_init() and ps2_mouse_init() from i8042_mm_init() to
i8042_mmio_realize() to further reduce the initialisation logic done in
i8042_mm_init().

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/input/pckbd.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/input/pckbd.c b/hw/input/pckbd.c
index 7f3578aa4d..1c61c55123 100644
--- a/hw/input/pckbd.c
+++ b/hw/input/pckbd.c
@@ -684,6 +684,9 @@ static void i8042_mmio_realize(DeviceState *dev, Error **errp)
 
     /* Note we can't use dc->vmsd without breaking migration compatibility */
     vmstate_register(NULL, 0, &vmstate_kbd, ks);
+
+    ks->kbd = ps2_kbd_init(kbd_update_kbd_irq, ks);
+    ks->mouse = ps2_mouse_init(kbd_update_aux_irq, ks);
 }
 
 static void i8042_mmio_init(Object *obj)
@@ -724,9 +727,6 @@ MMIOKBDState *i8042_mm_init(qemu_irq kbd_irq, qemu_irq mouse_irq,
     s->irq_kbd = kbd_irq;
     s->irq_mouse = mouse_irq;
 
-    s->kbd = ps2_kbd_init(kbd_update_kbd_irq, s);
-    s->mouse = ps2_mouse_init(kbd_update_aux_irq, s);
-
     return I8042_MMIO(dev);
 }
 
-- 
2.20.1


