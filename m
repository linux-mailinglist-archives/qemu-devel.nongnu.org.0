Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1CDF560093
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jun 2022 14:57:42 +0200 (CEST)
Received: from localhost ([::1]:55348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6XGH-00017x-JE
	for lists+qemu-devel@lfdr.de; Wed, 29 Jun 2022 08:57:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o6X0J-0007fP-UN; Wed, 29 Jun 2022 08:41:12 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:50984)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o6X0I-0004fH-AE; Wed, 29 Jun 2022 08:41:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yz0K/2/6sAI8vUyT+jZ9KZjZnqLO/rs0fjmlxuZVCwk=; b=poB9uQjmxd/YqaOaoPa3oFCzqr
 LZlE1hegHVmL5f0MN8boUtfknSf2s22DOdIUgQAYR1XA8gIMuahfb0LGHtCUgGG0iAxZoYeeKBL13
 /qyRMySJCWXFtOU2T2G8WwcFr0OLVLe4eaS/mghtf7stGkxj0d8FGQbfS4IipWRKjKmjBzzSrCWnG
 5YAbVz18SNq2l2Xtw8VlkEAZGrIWY1KtETEth8tJblYzdajayUtDriMaglK07R0Xd60mon1ZGw4xj
 lI0lG3UuQqf8fh5ASXz/GvwHIGCinByGPZiz0pm0SYnXgzL4pxJLLmb7/f9Y9MjhkEzV6qJGM/EKm
 l6pPTBp9zH6lKs/zTDOdjN4pZgYMVGiesps8w1IFRYYG3UZtYvmfgUS07SnAKakfY+7mwD4XtjlDS
 h/FNw6UxcEvBwSlrvk4bNYw07hBVtr2alc2wdc4hp8q4G9z5s2JSKe8WZme5a/qa1moYkTgm/NItK
 mv+p/IYoyf0IrzSeo4mYVQFA+iBDMegVODPo6ojIOMdAq4hweb6QkYlRIn2Cq8IZ+C434OE65ADAj
 03XCCdMZlg3Zr399ndIyxj7u9si09C+LrfLm61AjKHEGcOaX3JfH8yvbTTKWUG3LD6MjXH4ZktMV+
 qpZlhvGpgTe2kMnzaUng14TbDwSizIh5v6K9e+MGs=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o6Wyx-0002tZ-Bn; Wed, 29 Jun 2022 13:39:51 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, svens@stackframe.org,
 mst@redhat.com, pbonzini@redhat.com, peter.maydell@linaro.org,
 hpoussin@reactos.org, aleksandar.rikalo@syrmia.com, f4bug@amsat.org,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org
Date: Wed, 29 Jun 2022 13:39:55 +0100
Message-Id: <20220629124026.1077021-10-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220629124026.1077021-1-mark.cave-ayland@ilande.co.uk>
References: <20220629124026.1077021-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 09/40] pl050: introduce pl050_mouse_class_init() and
 pl050_mouse_realize()
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

Introduce a new pl050_mouse_class_init() function containing a call to
device_class_set_parent_realize() which calls a new pl050_mouse_realize()
function to initialise the PS2 mouse device.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/input/pl050.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/hw/input/pl050.c b/hw/input/pl050.c
index 24363c007e..fcc40758a3 100644
--- a/hw/input/pl050.c
+++ b/hw/input/pl050.c
@@ -153,10 +153,6 @@ static void pl050_realize(DeviceState *dev, Error **errp)
 {
     PL050State *s = PL050(dev);
 
-    if (s->is_mouse) {
-        s->ps2dev = ps2_mouse_init();
-    }
-
     qdev_connect_gpio_out(DEVICE(s->ps2dev), PS2_DEVICE_IRQ,
                           qdev_get_gpio_in_named(dev, "ps2-input-irq", 0));
 }
@@ -177,6 +173,15 @@ static void pl050_kbd_init(Object *obj)
     s->is_mouse = false;
 }
 
+static void pl050_mouse_realize(DeviceState *dev, Error **errp)
+{
+    PL050DeviceClass *pdc = PL050_GET_CLASS(dev);
+    PL050State *ps = PL050(dev);
+
+    ps->ps2dev = ps2_mouse_init();
+    pdc->parent_realize(dev, errp);
+}
+
 static void pl050_mouse_init(Object *obj)
 {
     PL050State *s = PL050(obj);
@@ -201,11 +206,21 @@ static const TypeInfo pl050_kbd_info = {
     .class_init    = pl050_kbd_class_init,
 };
 
+static void pl050_mouse_class_init(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+    PL050DeviceClass *pdc = PL050_CLASS(oc);
+
+    device_class_set_parent_realize(dc, pl050_mouse_realize,
+                                    &pdc->parent_realize);
+}
+
 static const TypeInfo pl050_mouse_info = {
     .name          = TYPE_PL050_MOUSE_DEVICE,
     .parent        = TYPE_PL050,
     .instance_init = pl050_mouse_init,
     .instance_size = sizeof(PL050MouseState),
+    .class_init    = pl050_mouse_class_init,
 };
 
 static void pl050_init(Object *obj)
-- 
2.30.2


