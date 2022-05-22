Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8FA5530540
	for <lists+qemu-devel@lfdr.de>; Sun, 22 May 2022 20:46:49 +0200 (CEST)
Received: from localhost ([::1]:46212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nsqbI-0003Q9-Vb
	for lists+qemu-devel@lfdr.de; Sun, 22 May 2022 14:46:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsqCV-0000mw-3r; Sun, 22 May 2022 14:21:12 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:48130)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsqCR-0003vj-7b; Sun, 22 May 2022 14:21:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=22bIroDhBreWsaaHwndPgcAMeyX+9wuBvAN28qBFq9Y=; b=w/2sVlKRI8mbXml953Tg8Zd9v2
 7SEUII3Pa7Onm4HcNHI+kW+1AQ2sHb3M+f7C2atxUiHYK7Y/plWEQ1oMeZg4F+kmetoAr/He1CYfc
 f8HYMezcsnKbFlZSHnH2mqzH9uUyd4VWiLBbCgkCo2Ds7zx7uJJ8sL8SOwjSfo3m92YUWyG6JZTaY
 /3mzNPV20av2nV/JfkJmDRfuKXmreDXV1vdLskRkAmf1UsMp8x2iQX8lvArXfD2L5o4+FiuBjgq2W
 oH4Jzpy83DMqniISz/bMVYxCzZoGniPoAXyB7AvxqyMELs/0vUwRwnDz9sEY+GTZx6RRbSAdhqeQG
 8mTUNcEF1m2TNbApIxjtm8L7MDRHblfc3RCyeFdqb6GdWAo+WkbD3Y1G6PCUMU0blys+1cDfMReHC
 eLqJ2G1mb//qFVn2fc+2kkECnKC7N9KgfMS9QZGPjmwZUwA/sNJA/BL+9M7Rj7YVZJ3G2UfmkqkII
 SgFlgx7EZk4arxu51kK2UsU1hgUCztJqVezasJT+lrqIamA9vGonnEchsfhom5S1weLQPdhcJDl5A
 60WxXyO40UJP6nzCJUmsisFj0g1Xc17qh1cdNPYQeA17sxpYBlMI32bDuizdKHu40+67uBlSQfwoJ
 wwjsmP/L7CtvPpRmkV9Nj0htLZnJ2rZYRsju/CcPc=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsqAv-0007pH-Or; Sun, 22 May 2022 19:19:34 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com,
 pbonzini@redhat.com, peter.maydell@linaro.org, hpoussin@reactos.org,
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, jiaxun.yang@flygoat.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Date: Sun, 22 May 2022 19:18:30 +0100
Message-Id: <20220522181836.864-45-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
References: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 44/50] lasips2: implement lasips2_realize()
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
---
 hw/input/lasips2.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/hw/input/lasips2.c b/hw/input/lasips2.c
index a7c7192c07..6849b71e5c 100644
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
2.20.1


