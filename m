Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3295756006E
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jun 2022 14:54:14 +0200 (CEST)
Received: from localhost ([::1]:47896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6XCv-0004Mt-5l
	for lists+qemu-devel@lfdr.de; Wed, 29 Jun 2022 08:54:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o6X05-0007aS-T5; Wed, 29 Jun 2022 08:40:59 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:50840)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o6X04-0004dI-76; Wed, 29 Jun 2022 08:40:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=K58nP7E9CBrEEek8QjHRKoTv4vo360i8kURBjo2RHJg=; b=oIb3NfkM/uJEdccOLx61l0FPiG
 pPMBQTaymJ2PKRSe4wJ8+l7CY6pMxmETFVsohiecNGNs98BiPnrCvOUwdC5BZoVbvCe20LXf0MeZB
 AhIoGBsCW0qplOy9vbC6BjWLgIoZAuo282mRiZ+WhqIWA6p6QHs4J6F0iGY/AiEi/5GTj/U36nBXy
 oV8E11KVaiuWoAoNfHgv+8Sbl5M3khIQwfvmvSzz2a2zSS5QENWvrOJ9HVGUOuMFhVFv0DarNjZN9
 mVL2ksKNX3MCtLNIVoaZQHRwv74KLEWUCmBUxNjyARagoJQvUq8kPP4WnqnFGlIK4/hGGbzZ7Y0Ig
 6hPgoBGoCKkvqjOjyqcYpYF57bX5B6yyVYMJ5E2Lw1yxZU0aAGKe8azxKvEopHFtiY/EK3E870XvO
 D3xZIZn3EsekWtU+d+Mnxm1RKdt78fZ90qnPM1wF1H2SUShu3enEQB2LWXPw2WBMD04PIuD4HRkc/
 GSmeDHJx3INMQY38UDu3sOOtjjXvyGC4kGEfys9VZ1RJOUVVLwt8JkT3BfckZeJFsFEhwXioS0wrg
 Aosm/Mn8kRhYYrALhvnwI0KioJHhkaoL+i0+zfmrPgeU0Cm8qJxBaYe+1fTyj2zCNDdx3/mfuGLeS
 daQ8fftHNWubmurKiCkmGuQWL8zC+UO7I2dv9xYq0=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o6Wyn-0002tZ-KB; Wed, 29 Jun 2022 13:39:37 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, svens@stackframe.org,
 mst@redhat.com, pbonzini@redhat.com, peter.maydell@linaro.org,
 hpoussin@reactos.org, aleksandar.rikalo@syrmia.com, f4bug@amsat.org,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org
Date: Wed, 29 Jun 2022 13:39:51 +0100
Message-Id: <20220629124026.1077021-6-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220629124026.1077021-1-mark.cave-ayland@ilande.co.uk>
References: <20220629124026.1077021-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 05/40] pl050: introduce new PL050_MOUSE_DEVICE QOM type
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

This will be soon be used to hold the underlying PS2_MOUSE_DEVICE object.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/input/pl050.c         | 3 ++-
 include/hw/input/pl050.h | 7 +++++++
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/hw/input/pl050.c b/hw/input/pl050.c
index 7f4ac99081..88459997e0 100644
--- a/hw/input/pl050.c
+++ b/hw/input/pl050.c
@@ -189,9 +189,10 @@ static const TypeInfo pl050_kbd_info = {
 };
 
 static const TypeInfo pl050_mouse_info = {
-    .name          = "pl050_mouse",
+    .name          = TYPE_PL050_MOUSE_DEVICE,
     .parent        = TYPE_PL050,
     .instance_init = pl050_mouse_init,
+    .instance_size = sizeof(PL050MouseState),
 };
 
 static void pl050_init(Object *obj)
diff --git a/include/hw/input/pl050.h b/include/hw/input/pl050.h
index 9ce8794bd0..bb0e87ff45 100644
--- a/include/hw/input/pl050.h
+++ b/include/hw/input/pl050.h
@@ -39,4 +39,11 @@ struct PL050KbdState {
     PL050State parent_obj;
 };
 
+#define TYPE_PL050_MOUSE_DEVICE "pl050_mouse"
+OBJECT_DECLARE_SIMPLE_TYPE(PL050MouseState, PL050_MOUSE_DEVICE)
+
+struct PL050MouseState {
+    PL050State parent_obj;
+};
+
 #endif
-- 
2.30.2


