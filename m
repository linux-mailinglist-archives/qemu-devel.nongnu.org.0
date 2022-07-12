Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51FE3572913
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jul 2022 00:13:26 +0200 (CEST)
Received: from localhost ([::1]:46886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBO8D-0000K9-E1
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 18:13:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oBNqA-0003gk-Aw; Tue, 12 Jul 2022 17:54:46 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:42318)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oBNq8-0007vC-QC; Tue, 12 Jul 2022 17:54:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=r2pnpZLiuVfDdUSID++oSoOnSDmULM/mAx/TWvtVan4=; b=E6/h7RrNsPdryMg/QN22mt6p0z
 8jf3Coq9L/dzCPfWqQLyZ0am8nzuyPcqVVRo/go4P53ulSiU3mym9BPvgtvZ0LooqHC+LGpTSmYsY
 reDnJBJ24sSH2ss9nJXMuZTxFM7CUF+7Rhhrf7pCzonQ+iBHfnU5xsDvFeOBV6o/msogW4Q3Li6lH
 0+8xTQTyEC6mfRejDnUlGLGwC868djB7s+UME1NM+hX8HrXzf9VBJ1rnT5XpSpjffnHIaNcJ2+r9B
 pNyLvJfnARmWJ6thcr7/Q9QbfiHVRUKObdFF5nSKyRG2Q51l7/Egk/9W9m492PPj7gZJOtdWB/Bcj
 Ugdgq1K3SoJMkpnkJZQHkPjyWOYo6LrwKD8+yVNGwTd5Ravnhcow3lmWfZZD5bXFhE11vW5NoF4Kg
 7ydU1BsHTLWt+fwWArurpfqiFfG2clTVWEI4Bmu5Oc0Ul/rrYY76hBC21DV7Uoc9BGLyryXdFOgPF
 cnwGASTFxT69hSsZKpCQXV7wi7G1sULigC+M6gHYDe0cacgnpWIMT7K845qAPCm2dkvKbkEs7k41v
 SalWy4HHcB/Ug713Cu5RvhZmkZDTMsFILONEFNfAmTx2HQ1i33WrQsxPS+7VtHecidgg1FHEWSz1k
 Z1zGo+/F+sk9T2X576diYzN6EoNilNdKEnoEiXpA0=;
Received: from [2a00:23c4:8ba5:df00:fd7d:1c3a:1dd0:c576] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oBNoL-000Bqt-D8; Tue, 12 Jul 2022 22:52:57 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, svens@stackframe.org,
 pbonzini@redhat.com, peter.maydell@linaro.org, hpoussin@reactos.org,
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Date: Tue, 12 Jul 2022 22:52:32 +0100
Message-Id: <20220712215251.7944-22-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220712215251.7944-1-mark.cave-ayland@ilande.co.uk>
References: <20220712215251.7944-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba5:df00:fd7d:1c3a:1dd0:c576
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 21/40] lasips2: introduce lasips2_kbd_port_class_init() and
 lasips2_kbd_port_realize()
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

Introduce a new lasips2_kbd_port_class_init() function which uses a new
lasips2_kbd_port_realize() function to initialise the PS2 keyboard device.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Tested-by: Helge Deller <deller@gmx.de>
Acked-by: Helge Deller <deller@gmx.de>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/input/lasips2.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/hw/input/lasips2.c b/hw/input/lasips2.c
index 9535cab268..b4fdaed5cb 100644
--- a/hw/input/lasips2.c
+++ b/hw/input/lasips2.c
@@ -268,7 +268,6 @@ static void lasips2_realize(DeviceState *dev, Error **errp)
         return;
     }
 
-    lp->ps2dev = ps2_kbd_init();
     qdev_connect_gpio_out(DEVICE(lp->ps2dev), PS2_DEVICE_IRQ,
                           qdev_get_gpio_in_named(dev, "ps2-kbd-input-irq",
                                                  0));
@@ -331,6 +330,13 @@ static const TypeInfo lasips2_port_info = {
     .abstract      = true,
 };
 
+static void lasips2_kbd_port_realize(DeviceState *dev, Error **errp)
+{
+    LASIPS2Port *lp = LASIPS2_PORT(dev);
+
+    lp->ps2dev = ps2_kbd_init();
+}
+
 static void lasips2_kbd_port_init(Object *obj)
 {
     LASIPS2KbdPort *s = LASIPS2_KBD_PORT(obj);
@@ -342,11 +348,19 @@ static void lasips2_kbd_port_init(Object *obj)
     lp->parent = container_of(s, LASIPS2State, kbd_port);
 }
 
+static void lasips2_kbd_port_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->realize = lasips2_kbd_port_realize;
+}
+
 static const TypeInfo lasips2_kbd_port_info = {
     .name          = TYPE_LASIPS2_KBD_PORT,
     .parent        = TYPE_LASIPS2_PORT,
     .instance_size = sizeof(LASIPS2KbdPort),
     .instance_init = lasips2_kbd_port_init,
+    .class_init    = lasips2_kbd_port_class_init,
 };
 
 static void lasips2_mouse_port_init(Object *obj)
-- 
2.30.2


