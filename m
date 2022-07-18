Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B645B5789CC
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 20:51:56 +0200 (CEST)
Received: from localhost ([::1]:36774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDVqU-0002kO-Py
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 14:51:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oDVZm-00005p-Qx
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 14:34:40 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:49090)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oDVZl-0005b9-4j
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 14:34:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:
 Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9a7xSGwHAN3Vts25IJdZBEbXE8c5BX9khQiciiHNtJI=; b=Jx3VVtCq1XN9XbKkI0/XsxSBz7
 cxMKmxUs87WnEifgd/k3cL+XzwTD+pJPKBggY2UoBEbyAs/BM0MANepoDgBm116khCTP//mBeuLXk
 u671mfgYVwdIf1PTO3fOcsrnn9VgZv5lmG3ZSpLt0f8uPwuDkkVVIZ8e2x9pxXcfbp7bNOITlYLvA
 OwngNt9PbfsnF1MHKsO0MzQhtHJ4cGhhGQ5Zxbj8MjccAHjdBUHXSUIEsAwt0ndm4Mg7KJb8OzsRJ
 v4CWEnK0Ll5/KNm2lwwRop0g9kvGAUDeZI+gnWTNtZ2nqgXP8w6hSTyXHBSeha/zGzs3AT1Sysc1f
 sJ5aDq5vXtOyJdDIQn1trBaWCaR1MEqpR91GYFX4YBQrFid8+L02rKTiIsIDt0vTl538Ajqv68ZKz
 KXvusIgTqouDHDmVXph62fooDN7r2IzhT/0hsoEKv3DwTuWFW8S4vWBoAzybT9wjZig1IXdQvq9lT
 Y4AvgomhE5e8+4e8XvJfCJwmjTvVXgwUKOVB3ZI3hxg3am95te1BDfpf1buH3QQxE6ASDbEBZJSy2
 teE+i+y3r8cEf+PXG5AKFd+iV2Heajwm0ibke138zqpq+I+r0oVCwoz73GJ7NqghwR4Bg0+Yv2UFi
 XNTx9LQ8FtJ/V1izHHS7jKBi4xLiZRumkHoLrqcWQ=;
Received: from [2a00:23c4:8ba6:5100:d563:eb67:74b1:7b0] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oDVYP-000B51-FY; Mon, 18 Jul 2022 19:33:17 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Date: Mon, 18 Jul 2022 19:33:10 +0100
Message-Id: <20220718183339.124253-12-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220718183339.124253-1-mark.cave-ayland@ilande.co.uk>
References: <20220718183339.124253-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba6:5100:d563:eb67:74b1:7b0
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PULL 11/40] pl050: don't use legacy ps2_mouse_init() function
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

Instantiate the PS2 mouse device within PL050MouseState using
object_initialize_child() in pl050_mouse_init() and realize it in
pl050_mouse_realize() accordingly.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Tested-by: Helge Deller <deller@gmx.de>
Acked-by: Helge Deller <deller@gmx.de>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20220712215251.7944-12-mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/input/pl050.c         | 13 ++++++++++---
 include/hw/input/pl050.h |  2 ++
 2 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/hw/input/pl050.c b/hw/input/pl050.c
index 64b579e877..ec5e19285e 100644
--- a/hw/input/pl050.c
+++ b/hw/input/pl050.c
@@ -183,17 +183,24 @@ static void pl050_kbd_init(Object *obj)
 static void pl050_mouse_realize(DeviceState *dev, Error **errp)
 {
     PL050DeviceClass *pdc = PL050_GET_CLASS(dev);
+    PL050MouseState *s = PL050_MOUSE_DEVICE(dev);
     PL050State *ps = PL050(dev);
 
-    ps->ps2dev = ps2_mouse_init();
+    if (!sysbus_realize(SYS_BUS_DEVICE(&s->mouse), errp)) {
+        return;
+    }
+
+    ps->ps2dev = PS2_DEVICE(&s->mouse);
     pdc->parent_realize(dev, errp);
 }
 
 static void pl050_mouse_init(Object *obj)
 {
-    PL050State *s = PL050(obj);
+    PL050MouseState *s = PL050_MOUSE_DEVICE(obj);
+    PL050State *ps = PL050(obj);
 
-    s->is_mouse = true;
+    ps->is_mouse = true;
+    object_initialize_child(obj, "mouse", &s->mouse, TYPE_PS2_MOUSE_DEVICE);
 }
 
 static void pl050_kbd_class_init(ObjectClass *oc, void *data)
diff --git a/include/hw/input/pl050.h b/include/hw/input/pl050.h
index 28f6216dc3..89ec4fafc9 100644
--- a/include/hw/input/pl050.h
+++ b/include/hw/input/pl050.h
@@ -52,6 +52,8 @@ OBJECT_DECLARE_SIMPLE_TYPE(PL050MouseState, PL050_MOUSE_DEVICE)
 
 struct PL050MouseState {
     PL050State parent_obj;
+
+    PS2MouseState mouse;
 };
 
 #endif
-- 
2.30.2


