Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F4DC56015E
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jun 2022 15:34:50 +0200 (CEST)
Received: from localhost ([::1]:54612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6XqD-0007W7-0Q
	for lists+qemu-devel@lfdr.de; Wed, 29 Jun 2022 09:34:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o6X1E-0000ca-N3; Wed, 29 Jun 2022 08:42:08 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:51246)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o6X1D-0004lJ-1d; Wed, 29 Jun 2022 08:42:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Bm0AmbIopbDzGsdRpV1cZL58cmfY4WmhYkgYFaqorhE=; b=ap8NEtjMWAv4ZJ/QxK8rSfRgiU
 lVv6T7fazgUiqQ9Iuti73lzNk85C5mKyvDtyA1hMl/+7M83RlRQBJlTxK/J/tH0Sb06tON+0eGcTS
 DrtwNPGZuCsispra5z74yJEqUypFIZ6p0ITp8UHg8uzQYwsCHC6E3h/klstpe6y+0cuv5mP2DqJrB
 WcE8W14PhHjHmrnSfWmIiyZBBajjQ9YQC9gLTjgPkWE6YTchzJbhfqCXzBVhUcOzeAZVgfHVrAqQv
 9RmJE+OhiUlaGIC+XpJmom7rXfVdCSqO1RcbUHjvHP2YBDn7j3Q6lSnhqeaDvJwnj8t2Q7FYBPlu+
 MKz9rX6XhB++lMlDvnmZ6iFcB6/oByWF6AjQcOkmJhEoHX/xw3eC78kunhK7mmJTPn0b/RvZdssTV
 XToKYNwuINuiA72x2sKjabljoXA6LpwLLwK1eoD/zUMplVS6ezTx2Lx6E784Y/Vn4KOLH8mUfzyaG
 m/nmOLwe22U6I4gw29R/UVnkwqdL5GDK2tDJ92mRsIw3mlM+7o/ZcHJTZBairwsztC48nOoOM4sV0
 C6OerqlTmRKmoXuf9X8pYVmH2SbIqNU5l6jF3PcCPZ+1jvN8iN6raLAVTLgWOvR5sFLz1Sp0R8gdR
 GkgJUglbVdToLnDlYzpEhoeDoJCZSYcK33k8z9Z/k=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o6Wza-0002tZ-Q5; Wed, 29 Jun 2022 13:40:27 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, svens@stackframe.org,
 mst@redhat.com, pbonzini@redhat.com, peter.maydell@linaro.org,
 hpoussin@reactos.org, aleksandar.rikalo@syrmia.com, f4bug@amsat.org,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org
Date: Wed, 29 Jun 2022 13:40:12 +0100
Message-Id: <20220629124026.1077021-27-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220629124026.1077021-1-mark.cave-ayland@ilande.co.uk>
References: <20220629124026.1077021-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 26/40] lasips2: add named input gpio to port for downstream
 PS2 device IRQ
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

The named input gpio is to be connected to the IRQ output of the downstream
PS2 device and used to drive the port IRQ. Initialise the named input gpio
in lasips2_port_init() and add new lasips2_port_class_init() and
lasips2_port_realize() functions to connect the PS2 device output gpio to
the new named input gpio.

Note that the reference to lasips2_port_realize() is stored in
LASIPS2PortDeviceClass but not yet used.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/input/lasips2.c         | 32 ++++++++++++++++++++++++++++++--
 include/hw/input/lasips2.h |  2 ++
 2 files changed, 32 insertions(+), 2 deletions(-)

diff --git a/hw/input/lasips2.c b/hw/input/lasips2.c
index 10494a2322..ec1661a8f1 100644
--- a/hw/input/lasips2.c
+++ b/hw/input/lasips2.c
@@ -322,11 +322,35 @@ static const TypeInfo lasips2_info = {
     .class_init    = lasips2_class_init,
 };
 
+static void lasips2_port_set_irq(void *opaque, int n, int level)
+{
+    LASIPS2Port *s = LASIPS2_PORT(opaque);
+
+    qemu_set_irq(s->irq, level);
+}
+
+static void lasips2_port_realize(DeviceState *dev, Error **errp)
+{
+    LASIPS2Port *s = LASIPS2_PORT(dev);
+
+    qdev_connect_gpio_out(DEVICE(s->ps2dev), PS2_DEVICE_IRQ,
+                          qdev_get_gpio_in_named(dev, "ps2-input-irq", 0));
+}
+
 static void lasips2_port_init(Object *obj)
 {
     LASIPS2Port *s = LASIPS2_PORT(obj);
 
     qdev_init_gpio_out(DEVICE(obj), &s->irq, 1);
+    qdev_init_gpio_in_named(DEVICE(obj), lasips2_port_set_irq,
+                            "ps2-input-irq", 1);
+}
+
+static void lasips2_port_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->realize = lasips2_port_realize;
 }
 
 static const TypeInfo lasips2_port_info = {
@@ -360,8 +384,10 @@ static void lasips2_kbd_port_init(Object *obj)
 static void lasips2_kbd_port_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
+    LASIPS2PortDeviceClass *lpdc = LASIPS2_PORT_CLASS(klass);
 
-    dc->realize = lasips2_kbd_port_realize;
+    device_class_set_parent_realize(dc, lasips2_kbd_port_realize,
+                                    &lpdc->parent_realize);
 }
 
 static const TypeInfo lasips2_kbd_port_info = {
@@ -393,8 +419,10 @@ static void lasips2_mouse_port_init(Object *obj)
 static void lasips2_mouse_port_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
+    LASIPS2PortDeviceClass *lpdc = LASIPS2_PORT_CLASS(klass);
 
-    dc->realize = lasips2_mouse_port_realize;
+    device_class_set_parent_realize(dc, lasips2_mouse_port_realize,
+                                    &lpdc->parent_realize);
 }
 
 static const TypeInfo lasips2_mouse_port_info = {
diff --git a/include/hw/input/lasips2.h b/include/hw/input/lasips2.h
index 426aa1371f..35e0aa26eb 100644
--- a/include/hw/input/lasips2.h
+++ b/include/hw/input/lasips2.h
@@ -30,6 +30,8 @@ OBJECT_DECLARE_TYPE(LASIPS2Port, LASIPS2PortDeviceClass, LASIPS2_PORT)
 
 struct LASIPS2PortDeviceClass {
     DeviceClass parent;
+
+    DeviceRealize parent_realize;
 };
 
 typedef struct LASIPS2State LASIPS2State;
-- 
2.30.2


