Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35450559AA8
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 15:50:59 +0200 (CEST)
Received: from localhost ([::1]:57298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4ji6-0001C5-6a
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 09:50:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o4jZU-00089J-9E; Fri, 24 Jun 2022 09:42:04 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:41726)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o4jZQ-00056T-M0; Fri, 24 Jun 2022 09:42:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:
 Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3GMYTZq/oG6w9IgbD4uu+eD8m6J8IC0/qUwZbwO8zGM=; b=Pcql3pZAT8HMTKLD9bTABJCQcV
 L7gu+4EYmqZWbhcjK7x5RzKP5/qm8i1oCTjp5KuQmI7e8lt/JWwkIcFshb6+x/I4dZLi8xqHX33JW
 CfG1obXYzpSowA3zy3BrLFTyiLQsH3QZjhUb5unu0nWkqVy4roZpLT77Zm1edDt4rkxpUuqkkjPts
 7QxeFatFnZhXAUGL02VU4ZzL9MbSjJwPwoCsEBlgOtculSeWQaGWARmSX4MkTMMg2Z8Yhrs8uh2EV
 Rv/JC4Y5LyfZnC3IjFHSd133qCFelj46IagSdhTvvs03Yv/dWaAIS2FcpxS/vEBnpu3pUxPSqP0F2
 g4xst+/0xGU+ORdTVWWNpTQZGLayPoztqH1lf6yRjYtrcLA4Tv2gUvCI/8DAeFMw/XvMralST6PNs
 BXoe9LWejWBeVhQcSsiaDM5vTdwIMxFNHAS+/TBYwqZW2RtJ4s1yLbZACQ3jkoj684sd/RdLQ4hKB
 maFX+EopIDvoC+afyKr1JZLqQE44Amet2SF8Oi2iwBMW/m/QqSl4cYISDgdIlESh3Nm66+imh/1V9
 3pgpuwUUnymwYSnh5RK1tz1wZGjrmdWSJA3dbYb/dv8YlQczqfAeQo8XCUWF5C3gYLK95c7pqUJZy
 3SjeOALMlZTCWssg5LGLwloF2RvEalUHsGaz2C9ms=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o4jY5-00037t-Ps; Fri, 24 Jun 2022 14:40:41 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com,
 pbonzini@redhat.com, peter.maydell@linaro.org, hpoussin@reactos.org,
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, jiaxun.yang@flygoat.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Date: Fri, 24 Jun 2022 14:40:24 +0100
Message-Id: <20220624134109.881989-10-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220624134109.881989-1-mark.cave-ayland@ilande.co.uk>
References: <20220624134109.881989-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 09/54] ps2: remove duplicate setting of scancode_set in
 ps2_kbd_init()
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

The default value for scancode_set is already set in ps2_kbd_reset() so there is no
need to duplicate this in ps2_kbd_init().

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Acked-by: Helge Deller <deller@gmx.de>
---
 hw/input/ps2.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/input/ps2.c b/hw/input/ps2.c
index f6f5514f0b..8018e39b17 100644
--- a/hw/input/ps2.c
+++ b/hw/input/ps2.c
@@ -1227,7 +1227,6 @@ void *ps2_kbd_init(void (*update_irq)(void *, int), void *update_arg)
     trace_ps2_kbd_init(s);
     ps2->update_irq = update_irq;
     ps2->update_arg = update_arg;
-    s->scancode_set = 2;
     vmstate_register(NULL, 0, &vmstate_ps2_keyboard, s);
     qemu_input_handler_register((DeviceState *)s,
                                 &ps2_keyboard_handler);
-- 
2.30.2


