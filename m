Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81998559B33
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 16:17:12 +0200 (CEST)
Received: from localhost ([::1]:43848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4k7T-0000Dx-9x
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 10:17:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o4jay-0002dD-VH; Fri, 24 Jun 2022 09:43:36 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:42090)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o4jaw-0005Is-Eg; Fri, 24 Jun 2022 09:43:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Z4qA3/1hYsiS6ZW/BnMtqinTFQCNOn+Y9xsOxn0ZmaU=; b=ItWC8fac3aXz+XADHNME1iC1x3
 w4sNLjFXmb+BH+1l5lnjg6k/hljjmAW1Q0Y6mCLVz3EMN83nOnCg6NQuphOERPmSWQGSPg4yUGr6Z
 Hj3/Sa65WX/DYoVpsS26wTyGDOXWDu3qV6S+N6GE0aZwvCNIsWhLBigSqkeHOI9rftj1jtx8GbKlw
 6N45jhYcERLarv/qnHLc3XxwTTiBzea68nbuF4IWoJhdrqMT0lvp6oSvfvpmslEclUXxwmhNEKW9Z
 vjEr44Ox6jNC7VQnPqcwt5DwpgylAwqwjwpRAIDO8aED/j+i47RBj+QCuOfsojH183LxoJ+nuwHCi
 0AypYX/KQ9gX3frWv6AlPQoW8t2XyXeOIGUq+sh6G49TyLQy6FScxaLX/6znQf9dlMwYKss5tjeO/
 DJ/251Jkebhz9po/Hf4DmKQYzBD78yRqBTL7gEX5GqP5Ue7Uuqeem0B+I/5OClWvrj1brc6+1RczB
 PfmQUenMHxtNGx5+cQpdgBMzcUqI1aecRii2l8q5iVUI8q4+2FmcaHxQ9uXx2eX/rMAOBOjuuuW4x
 8mQohMP1SXhanWSCAUYdLz8VsINy6EGjWO3EHaoTvs7soev2+3yqwh9Es42TaVT86+mimiCQrmN/c
 fl+r09Jb5CC/vAsnH6zxNH//5NuE8q+i4pY7irLMw=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o4jZI-00037t-Vq; Fri, 24 Jun 2022 14:41:56 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com,
 pbonzini@redhat.com, peter.maydell@linaro.org, hpoussin@reactos.org,
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, jiaxun.yang@flygoat.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Date: Fri, 24 Jun 2022 14:40:45 +0100
Message-Id: <20220624134109.881989-31-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220624134109.881989-1-mark.cave-ayland@ilande.co.uk>
References: <20220624134109.881989-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 30/54] pckbd: move ps2_kbd_init() and ps2_mouse_init() to
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
Acked-by: Helge Deller <deller@gmx.de>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/input/pckbd.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/input/pckbd.c b/hw/input/pckbd.c
index 1ab76793ea..72843f770e 100644
--- a/hw/input/pckbd.c
+++ b/hw/input/pckbd.c
@@ -685,6 +685,9 @@ static void i8042_mmio_realize(DeviceState *dev, Error **errp)
 
     /* Note we can't use dc->vmsd without breaking migration compatibility */
     vmstate_register(NULL, 0, &vmstate_kbd, ks);
+
+    ks->kbd = ps2_kbd_init(kbd_update_kbd_irq, ks);
+    ks->mouse = ps2_mouse_init(kbd_update_aux_irq, ks);
 }
 
 static void i8042_mmio_init(Object *obj)
@@ -726,9 +729,6 @@ MMIOKBDState *i8042_mm_init(qemu_irq kbd_irq, qemu_irq mouse_irq,
     s->irq_kbd = kbd_irq;
     s->irq_mouse = mouse_irq;
 
-    s->kbd = ps2_kbd_init(kbd_update_kbd_irq, s);
-    s->mouse = ps2_mouse_init(kbd_update_aux_irq, s);
-
     return I8042_MMIO(dev);
 }
 
-- 
2.30.2


