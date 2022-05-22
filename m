Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A38E530565
	for <lists+qemu-devel@lfdr.de>; Sun, 22 May 2022 21:16:47 +0200 (CEST)
Received: from localhost ([::1]:43260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nsr4I-0008RM-KL
	for lists+qemu-devel@lfdr.de; Sun, 22 May 2022 15:16:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsqC0-00087V-7C; Sun, 22 May 2022 14:20:40 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:47924)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsqBy-0003r4-LR; Sun, 22 May 2022 14:20:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=v5C0a0NiReooURhc8Z24Bys3bwXGa12fpFlV54o44Ms=; b=CGlwafyV52cPesWj4uaqP4LiCZ
 ku1AC5i5lh1V8CDdE5um2VbQ6YR/rYIe0rJgJ+RBpTvaL/hjUPmJTf/GZlZ/l2hl4QB0Sy3EiWkFX
 1Qn1LRPTRe5B0+Q6pPRY6MrvGFI5Lbn2QB39AICJcFghLU84/rvjphb1DIdryGe+1Ehr52TtSgLwF
 sgujo8e37bIY3LmrineqrdLVORfCf8AXT1YMktCp9YRdYaRHcWXWblVld9Vd0AASZ+67Q9thvXswQ
 ppdW2bX98OMyhPQZ06uzZD+/jbsF8ypEQflTZxnX2MxNowIsy7YwnYYWocpweSXUuvCFrRxXT+LrC
 6F/LiR9n75Pge41PkNGElU/oOAEeJBmlMDBx2moi9Nw8PjGmld7zJ2pqw5NXH66TiIJTEokNzxOKo
 E13C5paGkPY3wFT/uNtknZmYHreyharsFESqwWJuIgXgeHkIYmU8QHT3BYR+9N0kt7/wqCNykpu9t
 y6EOM3gyAIIJi8W3uJBrHFGZ6nxfwF8STMb1H0d5nJVuB04U5rOsUU6YjoWI5bcWDsd3/1H8vsYUB
 DAJa21nfTSQDuUK1lacDyiiSkBzMUMljZQmGfeqAEN0tswo5lUtyJzM3XHVFTAyHNwx2ufQpQebOD
 /8yPUSbJTdpj4F9XcCwPP/KZkV1MTsGLxaxFLMN0U=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsqAQ-0007pH-Ni; Sun, 22 May 2022 19:19:07 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com,
 pbonzini@redhat.com, peter.maydell@linaro.org, hpoussin@reactos.org,
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, jiaxun.yang@flygoat.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Date: Sun, 22 May 2022 19:18:22 +0100
Message-Id: <20220522181836.864-37-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
References: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 36/50] pl050: switch over from update_irq() function to PS2
 device gpio
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

Add a new pl050_init() function which initialises a qdev input gpio for handling
incoming PS2 IRQs, and then wire up the PS2 device to use it. At the same time
set update_irq() and update_arg to NULL in ps2_kbd_init() and ps2_mouse_init()
to ensure that any accidental attempt to use the legacy update_irq() function will
cause a NULL pointer dereference.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/input/pl050.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/hw/input/pl050.c b/hw/input/pl050.c
index 66f8c20d9f..fe6a281307 100644
--- a/hw/input/pl050.c
+++ b/hw/input/pl050.c
@@ -32,6 +32,8 @@ struct PL050State {
     bool is_mouse;
 };
 
+#define PL050_INPUT_IRQ    0
+
 static const VMStateDescription vmstate_pl050 = {
     .name = "pl050",
     .version_id = 2,
@@ -65,7 +67,7 @@ static void pl050_update_irq(PL050State *s)
     qemu_set_irq(s->irq, level);
 }
 
-static void pl050_set_irq(void *opaque, int level)
+static void pl050_set_irq(void *opaque, int n, int level)
 {
     PL050State *s = (PL050State *)opaque;
 
@@ -164,10 +166,12 @@ static void pl050_realize(DeviceState *dev, Error **errp)
     sysbus_init_mmio(sbd, &s->iomem);
     sysbus_init_irq(sbd, &s->irq);
     if (s->is_mouse) {
-        s->dev = ps2_mouse_init(pl050_set_irq, s);
+        s->dev = ps2_mouse_init(NULL, NULL);
     } else {
-        s->dev = ps2_kbd_init(pl050_set_irq, s);
+        s->dev = ps2_kbd_init(NULL, NULL);
     }
+    qdev_connect_gpio_out(DEVICE(s->dev), PS2_DEVICE_IRQ,
+                          qdev_get_gpio_in(dev, PL050_INPUT_IRQ));
 }
 
 static void pl050_keyboard_init(Object *obj)
@@ -196,6 +200,11 @@ static const TypeInfo pl050_mouse_info = {
     .instance_init = pl050_mouse_init,
 };
 
+static void pl050_init(Object *obj)
+{
+    qdev_init_gpio_in(DEVICE(obj), pl050_set_irq, 1);
+}
+
 static void pl050_class_init(ObjectClass *oc, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(oc);
@@ -207,6 +216,7 @@ static void pl050_class_init(ObjectClass *oc, void *data)
 static const TypeInfo pl050_type_info = {
     .name          = TYPE_PL050,
     .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_init = pl050_init,
     .instance_size = sizeof(PL050State),
     .abstract      = true,
     .class_init    = pl050_class_init,
-- 
2.20.1


