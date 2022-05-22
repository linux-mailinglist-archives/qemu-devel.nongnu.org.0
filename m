Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90507530560
	for <lists+qemu-devel@lfdr.de>; Sun, 22 May 2022 21:12:48 +0200 (CEST)
Received: from localhost ([::1]:33012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nsr0R-0001E0-Lh
	for lists+qemu-devel@lfdr.de; Sun, 22 May 2022 15:12:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsqBp-0007yz-T4; Sun, 22 May 2022 14:20:33 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:47862)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsqBo-0003pL-Fk; Sun, 22 May 2022 14:20:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=obfm0WA/cOM8kbIYlnDo2jKbTT3t2cD7xEJBM72jgyw=; b=Q7DCVcIb4xPA9cU5jy9ERDLbo/
 JW/ITBo/iPJmt1Pg+dKVZOUDgA/Ytc+xAus7CmYTyO6oThLOfr6Zd+nVKDK2yFQTESWn0jiJbAISr
 Wr0D0pln2tknx7/IifGLhHsjtrAjx9Qe4FTMpha2Uo6hsTcMdpjBUyxVx3pwIFGdbzUspLrj632WB
 d0xamCPco1hB6fSgg0h0aSsJ1dtxDbH1vwiCcmYa1Fb6qi4GVKYVPCACGCLLfxsdW7VRxGVfFYpRC
 rqICC3Ox/NthPQ3pHGw5uj48nvUjlGJkpeZGIblMLiZqo1AQZPuG05R+wT12UJI8cH0C6aJxJsA/n
 rKd0cRMFZ44l+r6sLDHq06gJE+6Zz1DIapTdSOvVUNR3pVeEd2cig23/NYGsj1eKfzWorJUA0axMS
 Exwtxl56TnHxa8uLJOK6pLFOJxkPutiy94MyJJ32mssYIOBjZxLVVKq0yZyH8gCKcA39USKeDsQsv
 f0EChnDwl7GhrtMSaKhtLrY13PfHj8+5+wvmW9z5NVtdpZu0ftPdvgYP4aFzWjocK3V9HumGx5U4O
 Yo4J+ZrMVLcZy4iWlV8E14dnmmMi8kVFDkKgWw1d/f6oARGmJCv3Eye3dplfasU5MY2bwuUeh+2U6
 J8NscAR6IVqUg19Zu0A3pWQ0NLKq6Ag+foE9z3u0c=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsqAL-0007pH-Sr; Sun, 22 May 2022 19:18:58 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com,
 pbonzini@redhat.com, peter.maydell@linaro.org, hpoussin@reactos.org,
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, jiaxun.yang@flygoat.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Date: Sun, 22 May 2022 19:18:15 +0100
Message-Id: <20220522181836.864-30-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
References: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 29/50] pckbd: more vmstate_register() from i8042_mm_init() to
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

Note in this case it is not possible to register a (new) VMStateDescription in
the DeviceClass without breaking migration compatibility for the MIPS magnum
machine.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/input/pckbd.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/input/pckbd.c b/hw/input/pckbd.c
index eb77ad193e..7f3578aa4d 100644
--- a/hw/input/pckbd.c
+++ b/hw/input/pckbd.c
@@ -681,6 +681,9 @@ static void i8042_mmio_realize(DeviceState *dev, Error **errp)
 
     memory_region_init_io(&s->region, OBJECT(dev), &i8042_mmio_ops, ks,
                           "i8042", s->size);
+
+    /* Note we can't use dc->vmsd without breaking migration compatibility */
+    vmstate_register(NULL, 0, &vmstate_kbd, ks);
 }
 
 static void i8042_mmio_init(Object *obj)
@@ -721,8 +724,6 @@ MMIOKBDState *i8042_mm_init(qemu_irq kbd_irq, qemu_irq mouse_irq,
     s->irq_kbd = kbd_irq;
     s->irq_mouse = mouse_irq;
 
-    vmstate_register(NULL, 0, &vmstate_kbd, s);
-
     s->kbd = ps2_kbd_init(kbd_update_kbd_irq, s);
     s->mouse = ps2_mouse_init(kbd_update_aux_irq, s);
 
-- 
2.20.1


