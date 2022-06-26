Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEEB055B34F
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Jun 2022 19:58:16 +0200 (CEST)
Received: from localhost ([::1]:40446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5WWV-00055V-SO
	for lists+qemu-devel@lfdr.de; Sun, 26 Jun 2022 13:58:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o5WL8-0002SK-Jy
 for qemu-devel@nongnu.org; Sun, 26 Jun 2022 13:46:35 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:45048)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o5WL7-0008PT-1p
 for qemu-devel@nongnu.org; Sun, 26 Jun 2022 13:46:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:
 Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=v3BeuKvN1HFFVFyhxPG45d5c0zcz/a+eu42PlpVEBdw=; b=jXecmCYOf/jDrdPnCBbDxFQvYZ
 JNbiGsfTbXYfVDlCaj7YAVryvpmNGE3RJ+dP9F+MkV2XTwAGhKlp/U9z1cOG6/w1fIg/0p89YIPcO
 WU43jrjMOazrhvlfsLjf3GQqNxDUdy8dXlote3PW5aFHlFK9Ov6gsHcHmRWKmAkshnbYDPOtyHETL
 cEoIcA/Kk2468GfwpDJkfRHuuVFytbuj1JgnZ5eUaM9Vml/FN6H/o58WsXHsxT8LVjlla6jO+TtrZ
 OMNhVd9lkqQ70+TmLR0rXDU+KKoiiGLQrMzKnNl3FzKu+E4o9kNvOeR+1aHFVQK5OOI6uLcjPdmzC
 PneupnsbdmwRONrVDsKPRiL768/iPQLWNuGYCchgGpJarLiSwSfBQTKDYzMCXeJjt3i2cDqtO7a+I
 7+wr6qcZxJQEyJSRRRXE/64AkOSSO8y7ZIsJiZJbu6LsS5l9UieNnhxw1FudIfk5Q2vVAf+rIVYcd
 CmVIKlcbLrcomz/XcbIyln7H2M5uhREog792EVorAqQrs3GkUvhsFtmLOM/FPB/R6mRdz0e1gVaOn
 eZvgWuRjrrCX03Yc77f71e2VSLvzmsk/7VZ6d6jOwfAdesxcpy0KrkqqaiLPBLzxoY8EKHftuyoIC
 9fQFcXcvLajhF55sJeF8XhvdemRv4REbqofEgIGB4=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o5WJt-0007KY-5o; Sun, 26 Jun 2022 18:45:16 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org,
	qemu-devel@nongnu.org
Date: Sun, 26 Jun 2022 18:44:48 +0100
Message-Id: <20220626174531.969187-13-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220626174531.969187-1-mark.cave-ayland@ilande.co.uk>
References: <20220626174531.969187-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PULL 12/55] ps2: don't use vmstate_register() in ps2_kbd_init()
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
Message-Id: <20220624134109.881989-13-mark.cave-ayland@ilande.co.uk>
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


