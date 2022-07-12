Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7ABC572918
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jul 2022 00:15:04 +0200 (CEST)
Received: from localhost ([::1]:52464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBO9n-00044A-PO
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 18:15:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oBNp6-0000Au-5j; Tue, 12 Jul 2022 17:53:40 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:42092)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oBNp4-0007qY-NB; Tue, 12 Jul 2022 17:53:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JcVLl+rVpXhXb/s1IJ5coMAKF4+1LDw77VNDrbWtlDA=; b=Umv5GFMJrw+wVo1BZKV5Y/0op/
 EsYEHDXvD+qUrHzXRuNGpIa0Ie+Q+SZgm9XlS8Ueghad+/d1VFcXIVaYmUdS0rbB0I+tlvDTs/V9x
 u+0T7rMJ5PA/abkKRdseB711wRbKZxD/KYaIdnh5zv38MMqkocUjphGQ0S56jieDI+97kvbN8KsNA
 FHXzP/6L/+KGUYvQBPY5VQKkSa1MUaRv53HI5Sm5Ek2BPOBeeBMKjNE00qZRxxi5wYvR1YXsbmNbd
 Qj1QAMUVvSrFUs6okn/TY2etBo5sczRiuq3NkP4RkkNbiaMjN7hpRNbiI4OCeZMp9z2tXzQP7RBYW
 dlsVhvKZsSwFwMzw6r46xaGTyrvxRtOJ1Uw1iQ8cFWkkDqGCi5nenheSG+dkTtSNH6GvHuwND7TeP
 qr4VP/Wy5M7T2BWpwUl3jehwfW8ACl7ORYvCJiDLu+4HgaxXcLODXieJypa3FcwfdKwtPg/12TU6h
 qLLT7H3Ew6Id+7pEl4mpvXtTMXXyZaU80w1lmZh8gUYXqNQGVDQW1mvPuA3T7HHgwlhKNN9dNevth
 xJPWRq2H6YVym0YKWkjmqx1u2b/g8sepjV40jrOjBhJXpLiiRIWsvVMLIZHF2tYO+Frbq+6b+egxx
 hw9xWbjxfem6rwPfj/pCJT8BoJ2FV0Et9K4kmTC3M=;
Received: from [2a00:23c4:8ba5:df00:fd7d:1c3a:1dd0:c576] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oBNnh-000Bqt-2Q; Tue, 12 Jul 2022 22:52:16 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, svens@stackframe.org,
 pbonzini@redhat.com, peter.maydell@linaro.org, hpoussin@reactos.org,
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Date: Tue, 12 Jul 2022 22:52:21 +0100
Message-Id: <20220712215251.7944-11-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220712215251.7944-1-mark.cave-ayland@ilande.co.uk>
References: <20220712215251.7944-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba5:df00:fd7d:1c3a:1dd0:c576
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 10/40] pl050: don't use legacy ps2_kbd_init() function
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

Instantiate the PS2 keyboard device within PL050KbdState using
object_initialize_child() in pl050_kbd_init() and realize it in
pl050_kbd_realize() accordingly.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Tested-by: Helge Deller <deller@gmx.de>
Acked-by: Helge Deller <deller@gmx.de>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/input/pl050.c         | 13 ++++++++++---
 include/hw/input/pl050.h |  2 ++
 2 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/hw/input/pl050.c b/hw/input/pl050.c
index fcc40758a3..64b579e877 100644
--- a/hw/input/pl050.c
+++ b/hw/input/pl050.c
@@ -160,17 +160,24 @@ static void pl050_realize(DeviceState *dev, Error **errp)
 static void pl050_kbd_realize(DeviceState *dev, Error **errp)
 {
     PL050DeviceClass *pdc = PL050_GET_CLASS(dev);
+    PL050KbdState *s = PL050_KBD_DEVICE(dev);
     PL050State *ps = PL050(dev);
 
-    ps->ps2dev = ps2_kbd_init();
+    if (!sysbus_realize(SYS_BUS_DEVICE(&s->kbd), errp)) {
+        return;
+    }
+
+    ps->ps2dev = PS2_DEVICE(&s->kbd);
     pdc->parent_realize(dev, errp);
 }
 
 static void pl050_kbd_init(Object *obj)
 {
-    PL050State *s = PL050(obj);
+    PL050KbdState *s = PL050_KBD_DEVICE(obj);
+    PL050State *ps = PL050(obj);
 
-    s->is_mouse = false;
+    ps->is_mouse = false;
+    object_initialize_child(obj, "kbd", &s->kbd, TYPE_PS2_KBD_DEVICE);
 }
 
 static void pl050_mouse_realize(DeviceState *dev, Error **errp)
diff --git a/include/hw/input/pl050.h b/include/hw/input/pl050.h
index 203f03a194..28f6216dc3 100644
--- a/include/hw/input/pl050.h
+++ b/include/hw/input/pl050.h
@@ -43,6 +43,8 @@ OBJECT_DECLARE_SIMPLE_TYPE(PL050KbdState, PL050_KBD_DEVICE)
 
 struct PL050KbdState {
     PL050State parent_obj;
+
+    PS2KbdState kbd;
 };
 
 #define TYPE_PL050_MOUSE_DEVICE "pl050_mouse"
-- 
2.30.2


