Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39D075789AB
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 20:41:28 +0200 (CEST)
Received: from localhost ([::1]:48570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDVgN-00070m-8d
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 14:41:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oDVZM-0007xk-Rz
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 14:34:14 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:49048)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oDVZI-0005XB-BB
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 14:34:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:
 Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Gr7YLlgAy48sbeLbkDWIb/hxbkEXcQZ1G3ofTyo7spo=; b=Nj1WzobHaN3syM9BTvkP8L3OIj
 Ie9Qth7x9MEL9JaNQhkVhFuu0rspZl3Ep1CeFN8QjdcdL6G0lqJ1Kphg5fBOHorfKZNJpX15NDSmd
 fGX+VrB5kE9vD7IIvX5q3DO03K5y1dgA4qhn8XEpxCA6jkCICWMKImEM/vFyZBCiSHIiYC3GQBeNN
 MyvyO4bIHVe68m1+xiB+iHj+4/ZLdJLHuDfWUjsTnNJgK6nGADvLkeNs8pHAwREZQWfmrBB8zM+70
 P6NAW6OhQfTWpM1JaC0pcX3HwOQf2OBby6cfsmENAvQkmATcqtRLJHQwMPCyYuQ6IWcNXhBFnjHLR
 vyQtou6oPApQo9ROP5UQTqMF66UOYtMkHuwdcLEr5YIOEi9fBcgajBNL+rKcVT124Qa/AH0vX3rYC
 TIx/m7Qg2Khmuhr2NUx2ts8T03bs5VQKIZ6zRVwYeUA6n3NBq9EKLdszYB5+cbSIJVyg8oGeoQwqd
 ausw0rRNiCquzmhMi+bsJMZLovXoh7oSBrVSNtAz0TryLsqab6SqLdIuTm6wP8e6BMlLOdOpEASdl
 VJGKOH2CN+w8Vd/gkYMM/zwopC2SRW9ALNxJNz6Uxmc3HPOnmhXHng7Ndy8JuRQvEe9a5zuv/X2/c
 FEH6AWeM4Vi+R+uvMyL+VL1JM7xYhushLRZPtQAbI=;
Received: from [2a00:23c4:8ba6:5100:d563:eb67:74b1:7b0] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oDVXx-000B51-2c; Mon, 18 Jul 2022 19:32:48 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Date: Mon, 18 Jul 2022 19:33:03 +0100
Message-Id: <20220718183339.124253-5-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220718183339.124253-1-mark.cave-ayland@ilande.co.uk>
References: <20220718183339.124253-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba6:5100:d563:eb67:74b1:7b0
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PULL 04/40] pl050: introduce new PL050_KBD_DEVICE QOM type
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

This will be soon be used to hold the underlying PS2_KBD_DEVICE object.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Tested-by: Helge Deller <deller@gmx.de>
Acked-by: Helge Deller <deller@gmx.de>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20220712215251.7944-5-mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/input/pl050.c         | 3 ++-
 include/hw/input/pl050.h | 7 +++++++
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/hw/input/pl050.c b/hw/input/pl050.c
index 0d91b0eaea..7f4ac99081 100644
--- a/hw/input/pl050.c
+++ b/hw/input/pl050.c
@@ -182,9 +182,10 @@ static void pl050_mouse_init(Object *obj)
 }
 
 static const TypeInfo pl050_kbd_info = {
-    .name          = "pl050_keyboard",
+    .name          = TYPE_PL050_KBD_DEVICE,
     .parent        = TYPE_PL050,
     .instance_init = pl050_kbd_init,
+    .instance_size = sizeof(PL050KbdState),
 };
 
 static const TypeInfo pl050_mouse_info = {
diff --git a/include/hw/input/pl050.h b/include/hw/input/pl050.h
index c1f6c5a1fb..9ce8794bd0 100644
--- a/include/hw/input/pl050.h
+++ b/include/hw/input/pl050.h
@@ -32,4 +32,11 @@ struct PL050State {
     bool is_mouse;
 };
 
+#define TYPE_PL050_KBD_DEVICE "pl050_keyboard"
+OBJECT_DECLARE_SIMPLE_TYPE(PL050KbdState, PL050_KBD_DEVICE)
+
+struct PL050KbdState {
+    PL050State parent_obj;
+};
+
 #endif
-- 
2.30.2


