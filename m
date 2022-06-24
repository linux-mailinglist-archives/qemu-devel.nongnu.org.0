Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4A2E559B28
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 16:12:44 +0200 (CEST)
Received: from localhost ([::1]:60606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4k39-0000og-UX
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 10:12:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o4jbA-0003EF-3k; Fri, 24 Jun 2022 09:43:48 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:42166)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o4jb8-0005KI-Co; Fri, 24 Jun 2022 09:43:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uN402QgSw/Cr83OhPai4+mtyu5uxvKgWxkPyPh9lHLE=; b=c7y+2/gS3fntWGZ9Q9yiPPtgdJ
 5bvn1U9hz3Dg0IUAXIzJQJXTctUG/Q3BKTTicY5yxSvkVkNa930ieuZxwp10/kVjM5Nn5HlJHvkfL
 9sTUlPC67MJZcOGmnOtgFng+CipQ92aIJGVEvkKcAckArz1wtOWHtpn4orFs+xr6HBr2C4gLGKhEh
 Vkgo9ATBlu555WdIHX0UtGKGqaKn5EhW7gO+H4LUmmG+oOjpgWgsLykjhzhMyOaKVlzAW+HW03Jii
 +cG3SAXZqIGEkBCDavx+L9V19NADGTg426LBmfL3/eDRAsICkjdaHfEL+2uf5QQKHTRydGjwJvrr3
 zEbyEntc4FcE8LAxPKRhm4nZMbf8pjCgLgw2KXXdUAY52S5/tVe0/CYa6uPGd/FeHwMvo8P3KMewo
 IrPN647KgLg164EGYrfI1mP47yB+Bq9gaC9BKYLVftiKZKZZwCiCCPdGpEn67JRoP8VdzSWhsbGuN
 wyezhact1S1iYdKclAmd7mbTL1Pz7lrvi+6jUsSacAt5NVTB463O7B4d43rux4klxNm6+20+phMxG
 SzAsexKnXjU4IvKq8Np/qPPKdfyfa0KNTxvWuU7e4ZZ9Y4b2ZT70UALkc9kIpKdjbHdlIZgJbrmoP
 6T7R5F+8kVg7uOsMPufPow4EWkuIBQkR9HXzUBQIk=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o4jZV-00037t-3H; Fri, 24 Jun 2022 14:42:08 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com,
 pbonzini@redhat.com, peter.maydell@linaro.org, hpoussin@reactos.org,
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, jiaxun.yang@flygoat.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Date: Fri, 24 Jun 2022 14:40:49 +0100
Message-Id: <20220624134109.881989-35-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220624134109.881989-1-mark.cave-ayland@ilande.co.uk>
References: <20220624134109.881989-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 34/54] ps2: add gpio for output IRQ and optionally use it
 in ps2_raise_irq() and ps2_lower_irq()
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

Define the gpio for the PS2 output IRQ in ps2_init() and add logic to optionally
use it in ps2_raise_irq() and ps2_lower_irq() if the gpio is connected. If the
gpio is not connected then call the legacy update_irq() function as before.

This allows the incremental conversion of devices from the legacy update_irq()
function to use gpios instead.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Acked-by: Helge Deller <deller@gmx.de>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/input/ps2.c         | 21 +++++++++++++++++++--
 include/hw/input/ps2.h |  4 ++++
 2 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/hw/input/ps2.c b/hw/input/ps2.c
index bc0bcf1789..98c6206fb8 100644
--- a/hw/input/ps2.c
+++ b/hw/input/ps2.c
@@ -24,6 +24,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu/log.h"
+#include "hw/irq.h"
 #include "hw/sysbus.h"
 #include "hw/input/ps2.h"
 #include "migration/vmstate.h"
@@ -174,12 +175,20 @@ void ps2_queue_noirq(PS2State *s, int b)
 
 static void ps2_raise_irq(PS2State *s)
 {
-    s->update_irq(s->update_arg, 1);
+    if (qemu_irq_is_connected(s->irq)) {
+        qemu_set_irq(s->irq, 1);
+    } else {
+        s->update_irq(s->update_arg, 1);
+    }
 }
 
 static void ps2_lower_irq(PS2State *s)
 {
-    s->update_irq(s->update_arg, 0);
+    if (qemu_irq_is_connected(s->irq)) {
+        qemu_set_irq(s->irq, 0);
+    } else {
+        s->update_irq(s->update_arg, 0);
+    }
 }
 
 void ps2_queue(PS2State *s, int b)
@@ -1305,6 +1314,13 @@ static const TypeInfo ps2_mouse_info = {
     .class_init    = ps2_mouse_class_init
 };
 
+static void ps2_init(Object *obj)
+{
+    PS2State *s = PS2_DEVICE(obj);
+
+    qdev_init_gpio_out(DEVICE(obj), &s->irq, 1);
+}
+
 static void ps2_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
@@ -1316,6 +1332,7 @@ static void ps2_class_init(ObjectClass *klass, void *data)
 static const TypeInfo ps2_info = {
     .name          = TYPE_PS2_DEVICE,
     .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_init = ps2_init,
     .instance_size = sizeof(PS2State),
     .class_init    = ps2_class_init,
     .class_size    = sizeof(PS2DeviceClass),
diff --git a/include/hw/input/ps2.h b/include/hw/input/ps2.h
index 410ec66baf..5422aee9aa 100644
--- a/include/hw/input/ps2.h
+++ b/include/hw/input/ps2.h
@@ -50,11 +50,15 @@ typedef struct {
     int rptr, wptr, cwptr, count;
 } PS2Queue;
 
+/* Output IRQ */
+#define PS2_DEVICE_IRQ      0
+
 struct PS2State {
     SysBusDevice parent_obj;
 
     PS2Queue queue;
     int32_t write_cmd;
+    qemu_irq irq;
     void (*update_irq)(void *, int);
     void *update_arg;
 };
-- 
2.30.2


