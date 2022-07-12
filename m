Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B681A57296E
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jul 2022 00:42:52 +0200 (CEST)
Received: from localhost ([::1]:47802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBOah-0006zV-RG
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 18:42:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oBNqg-0004bQ-Mj; Tue, 12 Jul 2022 17:55:18 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:42486)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oBNqe-0007yX-Qw; Tue, 12 Jul 2022 17:55:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+jSBSyd4C4ehACelQLdKlML+HIzWsgEtoa7QkB+ZJRM=; b=PR0cxbOKsr0HWNjyQ9dCvlejUN
 igLGRnzR4rBt3PAp1h+alcB2JTqYSAgjsVjYojYw9E8N015n8JZaqOgElBJo+XCPY/t6brtZdIHJt
 siu1YSKnnWYRXBnLFfwP7oREN4gqMO6Yof2UOokaUfv+yza3sIAJWSafaxZrdcXSydKSCsk9kL0XJ
 rW0tTvvPA723P4x0PwiO3AWZ3qTsc/h8unIz1Exw26Lk+/aSJOojgsziSwSnDtTvxl2WssZogpenq
 Oxf9tCvqMcTpi8oyfmbpl/4QJibXaruCBfzz7IU1K7HnvEdhEK3qV01Z6bV4eXXNo8zTvaTXQmR5m
 C9FkYDF73edJVYyansdJbrjVq7hONTbLH6ZXa3LO5DOUbIc2Y7QmkoEm9XW/OPOdyra9vBwtwz9kU
 q9L/2R/0PuyPJ/3UdIWyXTPxZD0KCLLFklAuiUF4CLjAGFgv1aBRhhvxDYhCI+CTjCN7m1dfytFCP
 RpYmct4IL2gESLtY78wMmk26CC4OMQbmpe1uWt7+dugSuSe57YwRFoUgRTZzw9lkCES4oha3hUVGv
 QIOyjk6Ok4UuYnAUfMkecOeAMJSnXK7+jBbC8m96NGnOVLQ+ycww0TbVKUJ/PBNyf9lajPlALwcpa
 QphQxNLlHaD2ozrYtSiGJhk4D7S54HHeSah4SbFR4=;
Received: from [2a00:23c4:8ba5:df00:fd7d:1c3a:1dd0:c576] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oBNoy-000Bqt-0v; Tue, 12 Jul 2022 22:53:35 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, svens@stackframe.org,
 pbonzini@redhat.com, peter.maydell@linaro.org, hpoussin@reactos.org,
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Date: Tue, 12 Jul 2022 22:52:43 +0100
Message-Id: <20220712215251.7944-33-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220712215251.7944-1-mark.cave-ayland@ilande.co.uk>
References: <20220712215251.7944-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba5:df00:fd7d:1c3a:1dd0:c576
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 32/40] lasips2: don't use legacy ps2_kbd_init() function
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

Instantiate the PS2 keyboard device within LASIPS2KbdPort using
object_initialize_child() in lasips2_kbd_port_init() and realize it in
lasips2_kbd_port_realize() accordingly.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Tested-by: Helge Deller <deller@gmx.de>
Acked-by: Helge Deller <deller@gmx.de>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/input/lasips2.c         | 10 +++++++++-
 include/hw/input/lasips2.h |  2 ++
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/hw/input/lasips2.c b/hw/input/lasips2.c
index 7bf6077b58..4b3264a02d 100644
--- a/hw/input/lasips2.c
+++ b/hw/input/lasips2.c
@@ -353,10 +353,15 @@ static const TypeInfo lasips2_port_info = {
 
 static void lasips2_kbd_port_realize(DeviceState *dev, Error **errp)
 {
+    LASIPS2KbdPort *s = LASIPS2_KBD_PORT(dev);
     LASIPS2Port *lp = LASIPS2_PORT(dev);
     LASIPS2PortDeviceClass *lpdc = LASIPS2_PORT_GET_CLASS(lp);
 
-    lp->ps2dev = ps2_kbd_init();
+    if (!sysbus_realize(SYS_BUS_DEVICE(&s->kbd), errp)) {
+        return;
+    }
+
+    lp->ps2dev = PS2_DEVICE(&s->kbd);
     lpdc->parent_realize(dev, errp);
 }
 
@@ -367,6 +372,9 @@ static void lasips2_kbd_port_init(Object *obj)
 
     memory_region_init_io(&lp->reg, obj, &lasips2_reg_ops, lp, "lasips2-kbd",
                           0x100);
+
+    object_initialize_child(obj, "kbd", &s->kbd, TYPE_PS2_KBD_DEVICE);
+
     lp->id = 0;
     lp->lasips2 = container_of(s, LASIPS2State, kbd_port);
 }
diff --git a/include/hw/input/lasips2.h b/include/hw/input/lasips2.h
index 9fe9e63a66..4a0ad999d7 100644
--- a/include/hw/input/lasips2.h
+++ b/include/hw/input/lasips2.h
@@ -52,6 +52,8 @@ OBJECT_DECLARE_SIMPLE_TYPE(LASIPS2KbdPort, LASIPS2_KBD_PORT)
 
 struct LASIPS2KbdPort {
     LASIPS2Port parent_obj;
+
+    PS2KbdState kbd;
 };
 
 #define TYPE_LASIPS2_MOUSE_PORT "lasips2-mouse-port"
-- 
2.30.2


