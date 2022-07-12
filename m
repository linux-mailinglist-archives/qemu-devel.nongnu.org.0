Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 313B85728EB
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jul 2022 00:01:32 +0200 (CEST)
Received: from localhost ([::1]:44342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBNwh-0004Kw-5h
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 18:01:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oBNpA-0000P5-Eu; Tue, 12 Jul 2022 17:53:44 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:42110)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oBNp8-0007qx-Rb; Tue, 12 Jul 2022 17:53:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9y+Fhp33BhsQPg8m0LLJmcIdzq/PCsnONU1JLPoEowE=; b=n8ctcx873ZmIchiAcvSDnD3+Fo
 sBieY9E8ShuvznbLMoPggZc7H76MOQomaeIbDn2iLuZr9nN8+DYJPok8S1MPexbUKlpoVp4Q35iZ9
 TZr2jxCgVbYGuHiaNbIvJWbCVRLTeKvV+vV4Q/HHSELuhAjLMKHhIfJO5ddUs9IavGEWwBy5zO7xd
 dRjFeiCEzlU+MzhnGG77jKSCttLVxXNeN8RPlT4viWmgjoDFnJcsf6JMDaAOk9JnNI2FdXJZCq1qw
 NDLz7Is43WyGqiH7P1xY+5ftCI3Ap2sW3TagZZcn+btqrUwizEleYiJ/ebW+9AZtF16qbYbs3TKY5
 4+ClhOIZmYM2Kav0GAgX0Iy3XjRmLK3QyMuA1qo3PsONh8UUmOn2q+jxqDVirdgVVFFKMxj7uMYEl
 mg2pQrTX5PxemBSJRXP3CFxIxVykjNxacB+S1HUlb8fD1P1jhx/QU8pbL0xEbZSKRkoZrQk3/En8J
 b9CQ/9wdha6jdHaaNIpKwTIQT43jFvkLys3oQOMOHrQ5tlmD6OzOH4BJ+7NIklomkqqaJK/+eEHaP
 FxiliJhCqXOqaf/Obc5ufjU/SS5ESqbrM1PH6Xh0oBHvTNu6tGZ0zwel+qJKpHwdvD+mpfbmYtHpO
 O9MMZcgpCv2bhc6y2SiAyJ8gT9kvjJn7Op8hDsWfg=;
Received: from [2a00:23c4:8ba5:df00:fd7d:1c3a:1dd0:c576] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oBNnk-000Bqt-Lx; Tue, 12 Jul 2022 22:52:20 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, svens@stackframe.org,
 pbonzini@redhat.com, peter.maydell@linaro.org, hpoussin@reactos.org,
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Date: Tue, 12 Jul 2022 22:52:22 +0100
Message-Id: <20220712215251.7944-12-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220712215251.7944-1-mark.cave-ayland@ilande.co.uk>
References: <20220712215251.7944-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba5:df00:fd7d:1c3a:1dd0:c576
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 11/40] pl050: don't use legacy ps2_mouse_init() function
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


