Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E87C578B1D
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 21:41:03 +0200 (CEST)
Received: from localhost ([::1]:32808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDWc1-0007Nb-Vz
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 15:41:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oDVbI-0001ZA-7J
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 14:36:12 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:49218)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oDVbF-0005z1-IK
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 14:36:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:
 Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3kG1SY1CDSPQvec7E2a+2BCWWsQarJFWKiv1EmKjpIY=; b=rOtVMw3allV0GXS3xU4k5WODco
 R1xgUT3MDwoh+3Vhzc6QrjMMJpzY/CXmByXyUUPcKIPfa4l9x6ZsT31EcEHGrMOGm/b/kcMmzI8Ae
 9peofpuwDBYj1EKXhAgeEsc1UbQw4NFHrkmo39BULpFmbJFugcXnPhDnK+0Dh2Qr1NDxMjo65vuuE
 c7HnAD0IhXMLwoLsjZwjg9kV0yLR5dCmE7pm308VN+q3tV1W8I33pq13u64Fb4uHox7hp13cW5ynX
 j5O+EpHBDeUvoVa+rno4Sfmw5e5RtZC99QkQhDQFPCM7BM3DhbTTMWIoijArqq96p6lhfCvSYMUoA
 rEnwJeMCGm9ZpJXriySyNAenLlHEdaT8KNska5ZFoleYQL0nA1nm8aYMfPTspQfyohtAxMeT1XTPK
 tHO5BKZt8R91yW0JP5xxRKIu63DpY4XmKdAMbI2AQ8bR5BGgrhmax1F1k7TvhH1P0vf3GqTfeFWQG
 1ZAY1WItBnBpGBWPHisMSnM90UV8ct5q0RinNZo1YLLVCkywK+J1c3/gsF6JWJoF6Rt5dwpZ8o6lh
 fL0D7/h7cRw6ED9KHiHGXh8HUrDp8mbCexMwSghLTh3auU0SObgqsdeDYs8P6eb3s4XFQI8jtnKS/
 oxGUyZreNV7qFktiHWpcy9IF1JpCQSNJCMB6XCp4I=;
Received: from [2a00:23c4:8ba6:5100:d563:eb67:74b1:7b0] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oDVZk-000B51-OJ; Mon, 18 Jul 2022 19:34:40 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Date: Mon, 18 Jul 2022 19:33:31 +0100
Message-Id: <20220718183339.124253-33-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220718183339.124253-1-mark.cave-ayland@ilande.co.uk>
References: <20220718183339.124253-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba6:5100:d563:eb67:74b1:7b0
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PULL 32/40] lasips2: don't use legacy ps2_kbd_init() function
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
Message-Id: <20220712215251.7944-33-mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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


