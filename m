Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2224559ABF
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 15:57:38 +0200 (CEST)
Received: from localhost ([::1]:46306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4joX-0004nA-QY
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 09:57:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o4jZY-0008P4-Gu; Fri, 24 Jun 2022 09:42:08 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:41766)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o4jZW-00058B-UD; Fri, 24 Jun 2022 09:42:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:
 Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eOPw1kWpdkn/vwpylukOqUCehgCzJr4tYfEfjjP1ZSw=; b=Ai37ZG6YqXd2nrSM9+Rmfizzvw
 C/AT1+vVM6R6cbdzybakHR2ykAwvdmenBPHAd+QtzWiRaRZctUTAS8Xg6nPPWTmyqDIdrYHwm0bPU
 pyvsOxjPbhI8FEA8KwJa5+sxIk8BnhluCbF7zWjjoqLMTTUMCoQlKlbyw5tkZUbzkXqlD/0Cr/TqJ
 JReCi5al4C1GpGVWUox6erJmbgCSKogUcRGwvmqz0skhDRa2OmR7KXngD3YM1skqsQU2bIFZQ50If
 i1umxLoTTmYK6fNDuvqVKgGjU3odb2+2RFI0ZxHZZZ7yvz4s/VbzlwX4eHy+SV8FJDnKDEpM/qtpz
 Wg0e1EOkNSX0Kw19djajU2Mi/CHTWHGPpVH9IZDz19kuEqLmeVnKQAUFTtml+ON4kGevuMbC8BZq/
 tY8Rv9DvYeY370+ubPfsGdZRBPd3TJhIUmxDlFTYi1uTLdCEJyV60jrH9Z72WaNHO3RtBEwxq5Byy
 Qf1gX94w4A+YdtNj1yC3zrgCl72vsYCxanwrMGRR9sxkPYsu/rQ+u+sSbhX0hQu7hpcEXm7lhw389
 mCY7IHOHQ90wpifvZJ1dNwOtSo2kO4XfY396uj021lsUeb8yke4kUA5xtqFYkJu4Ka4Ky70NGgXvH
 PL16Au5xtcNT+abautY/32xfYxa0Zo/JjtOY3psoU=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o4jYE-00037t-7i; Fri, 24 Jun 2022 14:40:50 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com,
 pbonzini@redhat.com, peter.maydell@linaro.org, hpoussin@reactos.org,
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, jiaxun.yang@flygoat.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Date: Fri, 24 Jun 2022 14:40:27 +0100
Message-Id: <20220624134109.881989-13-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220624134109.881989-1-mark.cave-ayland@ilande.co.uk>
References: <20220624134109.881989-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 12/54] ps2: don't use vmstate_register() in ps2_kbd_init()
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

Since PS2_KBD_DEVICE is a qdev device then vmstate_ps2_keyboard can be registered
using the DeviceClass vmsd field instead. There is no need to use
qdev_set_legacy_instance_id() to ensure migration compatibility since the first 2
parameters to vmstate_register() are NULL and 0 respectively.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Acked-by: Helge Deller <deller@gmx.de>
---
 hw/input/ps2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/input/ps2.c b/hw/input/ps2.c
index eae7df2096..97e9172ba5 100644
--- a/hw/input/ps2.c
+++ b/hw/input/ps2.c
@@ -1232,7 +1232,6 @@ void *ps2_kbd_init(void (*update_irq)(void *, int), void *update_arg)
     trace_ps2_kbd_init(s);
     ps2->update_irq = update_irq;
     ps2->update_arg = update_arg;
-    vmstate_register(NULL, 0, &vmstate_ps2_keyboard, s);
 
     return s;
 }
@@ -1274,6 +1273,7 @@ static void ps2_kbd_class_init(ObjectClass *klass, void *data)
 
     dc->realize = ps2_kbd_realize;
     device_class_set_parent_reset(dc, ps2_kbd_reset, &ps2dc->parent_reset);
+    dc->vmsd = &vmstate_ps2_keyboard;
 }
 
 static const TypeInfo ps2_kbd_info = {
-- 
2.30.2


