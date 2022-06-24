Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBFB2559B21
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 16:08:50 +0200 (CEST)
Received: from localhost ([::1]:49240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4jzN-0001K5-Mi
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 10:08:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o4jat-0002Pk-Ai; Fri, 24 Jun 2022 09:43:31 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:42074)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o4jar-0005IU-QB; Fri, 24 Jun 2022 09:43:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nUCE8pBe50IIjO3hRcaQ95siTMKex3l9jFQQyIhNLvQ=; b=aZIbUXqXqV4Zct/lgYA2oME/8q
 bnE1yQPusbHf0a9UEenQHCTzlixSwyvdRZWIo0JT1M2lekSU1ZQ7VD6moXOHrgXzs8+mdtaLyu95T
 9YdB46PZ74aC3hKITbYK7J4Fdw2zjRW90nD57BV1z3O4/Hq0ObrQoQQdJNYjv9//1hh+naRDzvTqq
 hmGX8GaWB8qpgJ+pPCR7ACHkUo1+8/K7GJEt87gbB/a1nINE1ULh0KKpFGMYxNzuXEy5KH7uNVK6z
 xX7G1leNRGcRGiiFeNBTOIhiVir1SoUWwYPfB8LizfvxZF/9VEwEgfnC9IgqYE9lR/dcxiRyf67mj
 bPIDsdbN1HI80GOao1c2viYJtMuoacM9v+91gczwiD0AO+jI4FDKQOFuNc99stvxiVH7cDbtncrX5
 nY32WqF43wVjAi5kgRtAJVlo4KaLNqxBIY4b4XOsS6yCqXwAiQSH6teTBEhkqdmBaYaj8WVmiLZSK
 RpQR9SZlgA5gCSV/O5UDAx3CbWy3SA8dGmnyXwsEFqBX2a9qUvsXmByNHnXrddP6v/UExOjQ9rufZ
 X0YSa5F8v/1EoVF/qYve3TiLsPDKL4AP9vI9SsO7Ra3qpUrhS++/tbC34r2c6Cd0W7IOamn2kFlhD
 EkwU0Z5I0n/NepwFzrISe4U7ypB9EKNJ0JJstLeNc=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o4jZF-00037t-5q; Fri, 24 Jun 2022 14:41:52 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com,
 pbonzini@redhat.com, peter.maydell@linaro.org, hpoussin@reactos.org,
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, jiaxun.yang@flygoat.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Date: Fri, 24 Jun 2022 14:40:44 +0100
Message-Id: <20220624134109.881989-30-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220624134109.881989-1-mark.cave-ayland@ilande.co.uk>
References: <20220624134109.881989-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 29/54] pckbd: more vmstate_register() from i8042_mm_init()
 to i8042_mmio_realize()
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
Acked-by: Helge Deller <deller@gmx.de>
---
 hw/input/pckbd.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/input/pckbd.c b/hw/input/pckbd.c
index 8708595eed..1ab76793ea 100644
--- a/hw/input/pckbd.c
+++ b/hw/input/pckbd.c
@@ -682,6 +682,9 @@ static void i8042_mmio_realize(DeviceState *dev, Error **errp)
                           "i8042", s->size);
 
     sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->region);
+
+    /* Note we can't use dc->vmsd without breaking migration compatibility */
+    vmstate_register(NULL, 0, &vmstate_kbd, ks);
 }
 
 static void i8042_mmio_init(Object *obj)
@@ -723,8 +726,6 @@ MMIOKBDState *i8042_mm_init(qemu_irq kbd_irq, qemu_irq mouse_irq,
     s->irq_kbd = kbd_irq;
     s->irq_mouse = mouse_irq;
 
-    vmstate_register(NULL, 0, &vmstate_kbd, s);
-
     s->kbd = ps2_kbd_init(kbd_update_kbd_irq, s);
     s->mouse = ps2_mouse_init(kbd_update_aux_irq, s);
 
-- 
2.30.2


