Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9D105789F4
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 20:59:54 +0200 (CEST)
Received: from localhost ([::1]:52820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDVyD-0007jo-TF
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 14:59:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oDVZj-0008W7-0G
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 14:34:38 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:49086)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oDVZg-0005ah-MR
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 14:34:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:
 Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tjFhHSw3zB10mQiwL5g5ScMLvNBYRGN1yjFyUwrQztY=; b=osgWpIZoyoDmANi6L3LoODD6oL
 MhZl/CdsXPSgky2jLl4T5y1fJliNMGtqgJ1qhwbKA2Y/xrKcPe3slQ+eAib982tGljNfEyQItPjUK
 HV7YMOrSp2qOCdoRu+9Ps/+e7E8KB0bKrRgkYJU8cYcxr6HDYHhs69B7aEeKkxL+p/pZcxiqf9SiH
 Klz2EbCMtq44PiE1wCNdXGfzAbaCNmxRog461o/p4+G3L5yE4tSK0Ml0zsuvjogu/cRRn9sPWsvN2
 2wTR2I90Ac3jvLnLkm4B7pKh0+8RKwCB0UU0Vg7lYu0ApWrPRSngDvLEOoSQA7KaFxkX2P969KNuL
 ANICAcNrGUNqo8QKzneAuLC2h4RLXbXzSN+z9RqXzPRHxn3aDoG8OnBc0PYiUM/4yPX+M4ZhPWwu4
 8c8Dedosp8M79iMUQ66gh8iwVXe9iEz9Jyg9fDZQIBfJpT4wnkb6aCx3KZb69s4XExHewXazcETnV
 NtdRNkCbuMrwg30GTJTWP4ThKCp7pW/2gi4gw4/j4VRwFDXueXxu6aMbQVwrN3YEjTu92D1AOJkEW
 0GFn34XzkQTwa1eB5SskZw5UIpHsKFfewvNeaJ7qbc4IVBlx3NAH1wxuHZCMAGLNgc067NxClFRgW
 Z987QmthDBv2waOdWM/nu5B2Y7ASORlQ8/rzDR/zc=;
Received: from [2a00:23c4:8ba6:5100:d563:eb67:74b1:7b0] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oDVYL-000B51-8U; Mon, 18 Jul 2022 19:33:13 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Date: Mon, 18 Jul 2022 19:33:09 +0100
Message-Id: <20220718183339.124253-11-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220718183339.124253-1-mark.cave-ayland@ilande.co.uk>
References: <20220718183339.124253-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba6:5100:d563:eb67:74b1:7b0
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PULL 10/40] pl050: don't use legacy ps2_kbd_init() function
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

Instantiate the PS2 keyboard device within PL050KbdState using
object_initialize_child() in pl050_kbd_init() and realize it in
pl050_kbd_realize() accordingly.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Tested-by: Helge Deller <deller@gmx.de>
Acked-by: Helge Deller <deller@gmx.de>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20220712215251.7944-11-mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/input/pl050.c         | 13 ++++++++++---
 include/hw/input/pl050.h |  2 ++
 2 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/hw/input/pl050.c b/hw/input/pl050.c
index fcc40758a3..64b579e877 100644
--- a/hw/input/pl050.c
+++ b/hw/input/pl050.c
@@ -160,17 +160,24 @@ static void pl050_realize(DeviceState *dev, Error **errp)
 static void pl050_kbd_realize(DeviceState *dev, Error **errp)
 {
     PL050DeviceClass *pdc = PL050_GET_CLASS(dev);
+    PL050KbdState *s = PL050_KBD_DEVICE(dev);
     PL050State *ps = PL050(dev);
 
-    ps->ps2dev = ps2_kbd_init();
+    if (!sysbus_realize(SYS_BUS_DEVICE(&s->kbd), errp)) {
+        return;
+    }
+
+    ps->ps2dev = PS2_DEVICE(&s->kbd);
     pdc->parent_realize(dev, errp);
 }
 
 static void pl050_kbd_init(Object *obj)
 {
-    PL050State *s = PL050(obj);
+    PL050KbdState *s = PL050_KBD_DEVICE(obj);
+    PL050State *ps = PL050(obj);
 
-    s->is_mouse = false;
+    ps->is_mouse = false;
+    object_initialize_child(obj, "kbd", &s->kbd, TYPE_PS2_KBD_DEVICE);
 }
 
 static void pl050_mouse_realize(DeviceState *dev, Error **errp)
diff --git a/include/hw/input/pl050.h b/include/hw/input/pl050.h
index 203f03a194..28f6216dc3 100644
--- a/include/hw/input/pl050.h
+++ b/include/hw/input/pl050.h
@@ -43,6 +43,8 @@ OBJECT_DECLARE_SIMPLE_TYPE(PL050KbdState, PL050_KBD_DEVICE)
 
 struct PL050KbdState {
     PL050State parent_obj;
+
+    PS2KbdState kbd;
 };
 
 #define TYPE_PL050_MOUSE_DEVICE "pl050_mouse"
-- 
2.30.2


