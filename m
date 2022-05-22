Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D398B530534
	for <lists+qemu-devel@lfdr.de>; Sun, 22 May 2022 20:36:43 +0200 (CEST)
Received: from localhost ([::1]:54582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nsqRW-0006Uy-V0
	for lists+qemu-devel@lfdr.de; Sun, 22 May 2022 14:36:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsqC7-0008II-5U; Sun, 22 May 2022 14:20:47 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:47896)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsqBp-0003q8-0v; Sun, 22 May 2022 14:20:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lRk97FSn/zFjn/zLFI1vCEGQSUKky7kiDMJ+Xl85PTQ=; b=IsmYHelKcYPaB5QLB9Ynwo5U9q
 bJPB08YialFfIizV/2xrWopd3twpBZhvo48bCoByMn33IURY+YxFGpbe+ijIHb6Kr/Tl6G8WroKO9
 Wm15XFNTi3stXBZHalwFP2I65mX4B6WYKWCnHLtlHN3VUBrL1hJ1Lo/xVuEwSPridU1SaHAf/IhRA
 nNkANf9waIVI+jQUEv6rBggrj19z1yhR1AvCOysAE5l80vM/g8fB1HeAk+LkKU/hP6eqnMzABgN+d
 4U9VNUYUnDKb3q+8gFLGqr7CCWbUziFJ/PEMUHQ7ckEVRRvUZyrFVuOdjF6R9l3ODv3Tq3a9CPA9S
 Us+vLRLfgZh7J0CBxkrulbCT56Cf072D0mmeyxXx8SxCw42JQ584bTdirpKc73yTqD15Et+k9xwRe
 VP8thI1dSnIVDAv03nI2kRefxn0heUqcL5TyIT0SaZFsRY0fihhw7/M5+LXGCL9fRzJsLuryB4tDv
 Zs8Qh/tU8mBPXOdeBUOYDGaRtyvFZ8DrBKFz+oX6uAqDdWfenLTdAEBUnkFXxWMAIRC9jr0qDl8n2
 yzUMzCMu8AZN49UOp9VK4cEcZI++XJ6P/7cFAv5++ik0WxqMD3o3Ti7PWZLnOVDXbyzY2/bESnrFF
 2K0kd4MR8I2qyi1anqMx8xCs4EQmYcHJlrQxi3T4A=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsqAO-0007pH-RM; Sun, 22 May 2022 19:19:01 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com,
 pbonzini@redhat.com, peter.maydell@linaro.org, hpoussin@reactos.org,
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, jiaxun.yang@flygoat.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Date: Sun, 22 May 2022 19:18:20 +0100
Message-Id: <20220522181836.864-35-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
References: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 34/50] ps2: add gpio for output IRQ and optionally use it in
 ps2_raise_irq() and ps2_lower_irq()
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
---
 hw/input/ps2.c         | 21 +++++++++++++++++++--
 include/hw/input/ps2.h |  4 ++++
 2 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/hw/input/ps2.c b/hw/input/ps2.c
index 214dda60bf..891eb7181c 100644
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
+    if (s->irq) {
+        qemu_set_irq(s->irq, 1);
+    } else {
+        s->update_irq(s->update_arg, 1);
+    }
 }
 
 static void ps2_lower_irq(PS2State *s)
 {
-    s->update_irq(s->update_arg, 0);
+    if (s->irq) {
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
     .abstract      = true
diff --git a/include/hw/input/ps2.h b/include/hw/input/ps2.h
index d04d291287..6e5c404cb5 100644
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
2.20.1


