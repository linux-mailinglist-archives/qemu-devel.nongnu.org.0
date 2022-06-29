Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EED5560102
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jun 2022 15:13:23 +0200 (CEST)
Received: from localhost ([::1]:50400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6XVR-0000yY-DE
	for lists+qemu-devel@lfdr.de; Wed, 29 Jun 2022 09:13:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o6X0h-0008Gm-Ra; Wed, 29 Jun 2022 08:41:35 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:51032)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o6X0g-0004hd-Bv; Wed, 29 Jun 2022 08:41:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lYrEWN/BLHwdROY2hmdP1qINLeuTOZK6l8P6pnd6VOg=; b=y+nYScIUHHkJeAqTYF8b88Ys+g
 IviYe1ivuFv4xQ4OXKYHs0+k++FgKwJ1IDa9Fj5CH1ImfJ84/JipQ7xQHfOVz/+5dadEBL+f2ZFAp
 csv+zBQxbrqCGLrizQaUN570pJMyBFzbnqHerCBsNABeT6NqG7CXbDAiirF046b4R+rypLI38Za5N
 mSmdCAIRICOstm0oHJx0ozymldIJ4w329LCcwXeOQ/z1aQeVSJ6wVtEeQRvPHY9HjIIER/l8vJdDM
 cFTIQVXlkDL30GlYCfEBvCuMW1Jhdmtw3nzbfUMFV12v8n2l1ewQ6DLNGRhjFhwp+7mzDEUDvUkz2
 P8wUeT/vZvLgswTKDRHlRqNW0zWmAtd4a0ngfOE3VCvBjDr/9s7q3hWENDvI0QZtPiDQcCAHc1F0G
 wHF0uX2uWrn5lQVG4xQYBQ5Nhx7gu7cFwe/JHG09FnF3L+aB6Wpgwac2t0GTcN/NxUL+UXDtr5KbN
 x+ftQZIMMaZKZiwdfmLGNvltPfrORYEiygxUwiVrAJ+laK+/Ai1UOsErckxGsWnLvumUGa3VqEnUv
 qaDRqM/hqD9/g1nDFHPbfJo1XFDoKXEvu+AB87FPp98oPe/HIwPRcAiKQUvUTzRT0wI7hnjQJ/ENB
 uHTgBFI8A2WJr38AgkQm5ES0a1rIDkEbeBGO/xPzg=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o6Wz1-0002tZ-Mf; Wed, 29 Jun 2022 13:39:51 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, svens@stackframe.org,
 mst@redhat.com, pbonzini@redhat.com, peter.maydell@linaro.org,
 hpoussin@reactos.org, aleksandar.rikalo@syrmia.com, f4bug@amsat.org,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org
Date: Wed, 29 Jun 2022 13:39:56 +0100
Message-Id: <20220629124026.1077021-11-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220629124026.1077021-1-mark.cave-ayland@ilande.co.uk>
References: <20220629124026.1077021-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 10/40] pl050: don't use legacy ps2_kbd_init() function
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


