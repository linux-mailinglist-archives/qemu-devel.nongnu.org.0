Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58436560193
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jun 2022 15:43:02 +0200 (CEST)
Received: from localhost ([::1]:39098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6Xy8-0007wr-Fx
	for lists+qemu-devel@lfdr.de; Wed, 29 Jun 2022 09:43:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o6X1M-00011r-Us; Wed, 29 Jun 2022 08:42:17 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:51346)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o6X1L-0004n3-Da; Wed, 29 Jun 2022 08:42:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tAy9NgdA5GPOeHj/u5tB8saemL7EGKA4bnbLFTt3o5g=; b=E6Ic/EIo7bxE2VsBaaefaPY/h9
 psVFhr7/B+4NZ0mqMFLW8CCpWJ3gB0ZGqan7vakygxcXgUrWR0WZ/Qty6H9UdqtUc7G+vKjZ9sxYy
 Gz4SAUGTMFapicdHqU7L8fwDg4XB7lfx5jLlPTxDXHEkK4Wguo8JDI/cyp/7nbOIcwXiBEvdDOKt/
 EudtKn+wJ4Eq37qYgjxgkzxrNE49i2S0oiUyvMGFD29owNq517YAfiZFzA0BVl2Y1o6qRMLpSbdX6
 8GSbXLOFLXhr00Yc/pqQhi7HUCaoQb9eNWWKyWcmNJyvBKmOHCvnPGcaZV4Jso1dUn0sNzV3++6Vx
 RT5iAIDaeR7AHXQvPLsM+rPnReY/AmpTq7H3RX5YBYD6YkcXavCARTwXlG6S52PbNFc/8g3Qn58zz
 ee9KrbJ3f0QN3sTilK9sGxVreYsuBBvXpppBfFG0wPJCqqG1d41dK1BShcAhGWnSOAHn87O29sc2E
 bWgsbAgUcAk7Y1nl7H4oM/FbmtdmgExMjIvC0iWEpYVxKBUFsWiVj3OltMtAzETG/+g1VqUXwULyK
 aMNkaZNofM01EAtr5kCbAFDSZDF6zeHYv3yy1wr0i4IwhE1kcrh2nKmm8exqjFrhtfiPwo6hPdhGT
 8Mhm2fNk39hF34HplqGnlyWE6HXnhtLsZ6pAmKXR4=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o6Wzm-0002tZ-CP; Wed, 29 Jun 2022 13:40:38 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, svens@stackframe.org,
 mst@redhat.com, pbonzini@redhat.com, peter.maydell@linaro.org,
 hpoussin@reactos.org, aleksandar.rikalo@syrmia.com, f4bug@amsat.org,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org
Date: Wed, 29 Jun 2022 13:40:18 +0100
Message-Id: <20220629124026.1077021-33-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220629124026.1077021-1-mark.cave-ayland@ilande.co.uk>
References: <20220629124026.1077021-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 32/40] lasips2: don't use legacy ps2_kbd_init() function
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


