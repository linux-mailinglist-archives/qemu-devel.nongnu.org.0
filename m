Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E486578B27
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 21:46:28 +0200 (CEST)
Received: from localhost ([::1]:40000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDWhH-0004KY-Jk
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 15:46:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oDVbT-0001xU-FW
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 14:36:23 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:49236)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oDVbR-00060d-Vr
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 14:36:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:
 Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KhoNyLSXDyPwsqbuQ2Iro7IACVLd5Ou9KUQmbqcY2HU=; b=RdCJLk6ECCdtYPe25ywMlCqutY
 nwghQTsTzRC29L0XO+x5ZcEHXuR0Qptauk8kiGPA+3kGoVpeCsFs5p6jKBNZevVQc4Gp31zFFWGy2
 sfU8jAMeyDkUl3z1c6n/hrofwyeyvyGWkO0H3aNtVjmnqTZ2FenO4/EWkN26nhZJ/nVsILz+b3bwe
 n3Dat/+Mu8rZ7oXZX1FDCrFjsF1xH8HbXWmLsCoFRuLV3s2DJ64LXSVmhxfbTYPZRkR34jj8esKaX
 iSMFAiv8oCWvHG/KGwYANAiiBO+kaliGZTdPADK4kMBlGbI8BOu8XxBdC5KfBuk8iy7yTpRw8ngX3
 Szr8zO2+nSGrydPO2mFs38MD6fkjWMKWhYcbjQV1PKY/0UNavlo8gDtgL1Pkl+h4rbvU+K+MD37lN
 bQamb8Q9pgAWWKluDDAvyyy0g9Pp8EYnoz0gyULv7ZHoa9OOrwbe2qMlC3VdqEVlsccbeITXw08tp
 XcaBrYry8lkN8aSPFU5MRURPZapnhNES6IG9im/PrmYeVXQoGWCgnKNoHj4tq/dg78r/xq3wwK2Ye
 fkK41qONTNwHEhg6nenqw0wvz4sPlbIRQ7L2dX1hrNsUJweSvquLbTfMbCg3sOA9k0QLtXFmlcBu2
 D0jT+JJ4vMikytt2xnplVaPEEIALWLVOitxIZEE1Q=;
Received: from [2a00:23c4:8ba6:5100:d563:eb67:74b1:7b0] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oDVZw-000B51-NB; Mon, 18 Jul 2022 19:34:52 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Date: Mon, 18 Jul 2022 19:33:34 +0100
Message-Id: <20220718183339.124253-36-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220718183339.124253-1-mark.cave-ayland@ilande.co.uk>
References: <20220718183339.124253-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba6:5100:d563:eb67:74b1:7b0
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PULL 35/40] pckbd: introduce new vmstate_kbd_mmio VMStateDescription
 for the I8042_MMIO device
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

This enables us to register the VMStateDescription using the DeviceClass vmsd
property rather than having to call vmstate_register() from i8042_mmio_realize().

Note that this is a migration break for the MIPS magnum machine which is the only
user of the I8042_MMIO device.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Tested-by: Helge Deller <deller@gmx.de>
Acked-by: Helge Deller <deller@gmx.de>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20220712215251.7944-36-mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/input/pckbd.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/hw/input/pckbd.c b/hw/input/pckbd.c
index 9184411c3e..195a64f520 100644
--- a/hw/input/pckbd.c
+++ b/hw/input/pckbd.c
@@ -699,9 +699,6 @@ static void i8042_mmio_realize(DeviceState *dev, Error **errp)
 
     sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->region);
 
-    /* Note we can't use dc->vmsd without breaking migration compatibility */
-    vmstate_register(NULL, 0, &vmstate_kbd, ks);
-
     ks->kbd = ps2_kbd_init();
     qdev_connect_gpio_out(DEVICE(ks->kbd), PS2_DEVICE_IRQ,
                           qdev_get_gpio_in_named(dev, "ps2-kbd-input-irq",
@@ -732,12 +729,23 @@ static Property i8042_mmio_properties[] = {
     DEFINE_PROP_END_OF_LIST(),
 };
 
+static const VMStateDescription vmstate_kbd_mmio = {
+    .name = "pckbd-mmio",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_STRUCT(kbd, MMIOKBDState, 0, vmstate_kbd, KBDState),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
 static void i8042_mmio_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
 
     dc->realize = i8042_mmio_realize;
     dc->reset = i8042_mmio_reset;
+    dc->vmsd = &vmstate_kbd_mmio;
     device_class_set_props(dc, i8042_mmio_properties);
     set_bit(DEVICE_CATEGORY_INPUT, dc->categories);
 }
-- 
2.30.2


