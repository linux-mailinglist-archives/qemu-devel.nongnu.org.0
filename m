Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9AD7578A9F
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 21:23:09 +0200 (CEST)
Received: from localhost ([::1]:33566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDWKi-00040L-TP
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 15:23:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oDVbc-0002GQ-BT
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 14:36:37 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:49224)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oDVbK-0005zd-BP
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 14:36:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:
 Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZNpXkDLXb7DbN/EHahUd4QzaCvr3AnH2e8q+s2Ts1EY=; b=qmT7ZBKevzI14yhCqwEYc5gx/X
 2jWKphl4FuauccLfxGro3tWv5Jnotk9QTWW2qffmmQ4JRaqOPj5vDtLoMig/c/2Uib8CaUDLyx8nZ
 ym/T0+m9b111dkIURBME6VzzfbM+79NvBo4fYpFcNmfX0U5Exf/2g/BbepECPTEC4DqXdvPKhsIe+
 Kl8IOKDCrn6CtOlqyHYn8oNByKsSeVLeL7cX9yQ5ZOjnkL2vg4RpkPS/S1ZsWj47IwkFyMmvE7TFM
 wzqIo59BR+C01ePBgb/yDYgX4lgzhRSshOmUlGkFJpbUXUpB4cDMqFyDu1xal/R1ovFfUvqbUyWRP
 Hp7oOlAH5YIm68ieiwJqZdxPyFAJPmGIoDDODIgVUvRxJ41uTTfmgQN+L0mt+eRVoTYw+pm73frGW
 tTrDBJu7b2GanS+j+vh8ULh1ftdMccSUS5pofARzE6tYZkn+6NRNzaV9SstDEMOaGvYS72yJAmlv1
 GSUKbxdUPNaHY29ezPWnIe9Qy9jDoYV6c8jyG0HKoLDBpqgnCj1W5AKk6ZrRYbrDz9Fh8VHGa18M2
 e32ctOK4XmNoa/GQFHdMlifnW39/6ahwT+3wsJU7DzHeaOnlpAJ0o+WIams3QJD57n7ziNRp7/7XO
 2D8Lt/uNDVWE2Spx5lFAY9L5iktJBgP8WDkAKy0Tk=;
Received: from [2a00:23c4:8ba6:5100:d563:eb67:74b1:7b0] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oDVZo-000B51-DN; Mon, 18 Jul 2022 19:34:44 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Date: Mon, 18 Jul 2022 19:33:32 +0100
Message-Id: <20220718183339.124253-34-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220718183339.124253-1-mark.cave-ayland@ilande.co.uk>
References: <20220718183339.124253-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba6:5100:d563:eb67:74b1:7b0
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PULL 33/40] lasips2: don't use legacy ps2_mouse_init() function
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

Instantiate the PS2 mouse device within LASIPS2MousePort using
object_initialize_child() in lasips2_mouse_port_init() and realize it in
lasips2_mouse_port_realize() accordingly.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Tested-by: Helge Deller <deller@gmx.de>
Acked-by: Helge Deller <deller@gmx.de>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20220712215251.7944-34-mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/input/lasips2.c         | 10 +++++++++-
 include/hw/input/lasips2.h |  2 ++
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/hw/input/lasips2.c b/hw/input/lasips2.c
index 4b3264a02d..e602e3c986 100644
--- a/hw/input/lasips2.c
+++ b/hw/input/lasips2.c
@@ -398,10 +398,15 @@ static const TypeInfo lasips2_kbd_port_info = {
 
 static void lasips2_mouse_port_realize(DeviceState *dev, Error **errp)
 {
+    LASIPS2MousePort *s = LASIPS2_MOUSE_PORT(dev);
     LASIPS2Port *lp = LASIPS2_PORT(dev);
     LASIPS2PortDeviceClass *lpdc = LASIPS2_PORT_GET_CLASS(lp);
 
-    lp->ps2dev = ps2_mouse_init();
+    if (!sysbus_realize(SYS_BUS_DEVICE(&s->mouse), errp)) {
+        return;
+    }
+
+    lp->ps2dev = PS2_DEVICE(&s->mouse);
     lpdc->parent_realize(dev, errp);
 }
 
@@ -412,6 +417,9 @@ static void lasips2_mouse_port_init(Object *obj)
 
     memory_region_init_io(&lp->reg, obj, &lasips2_reg_ops, lp, "lasips2-mouse",
                           0x100);
+
+    object_initialize_child(obj, "mouse", &s->mouse, TYPE_PS2_MOUSE_DEVICE);
+
     lp->id = 1;
     lp->lasips2 = container_of(s, LASIPS2State, mouse_port);
 }
diff --git a/include/hw/input/lasips2.h b/include/hw/input/lasips2.h
index 4a0ad999d7..01911c50f9 100644
--- a/include/hw/input/lasips2.h
+++ b/include/hw/input/lasips2.h
@@ -61,6 +61,8 @@ OBJECT_DECLARE_SIMPLE_TYPE(LASIPS2MousePort, LASIPS2_MOUSE_PORT)
 
 struct LASIPS2MousePort {
     LASIPS2Port parent_obj;
+
+    PS2MouseState mouse;
 };
 
 struct LASIPS2State {
-- 
2.30.2


