Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B61105789DA
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 20:55:07 +0200 (CEST)
Received: from localhost ([::1]:44350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDVta-0000Vt-SA
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 14:55:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oDVZO-0007yH-Th
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 14:34:15 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:49054)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oDVZN-0005XN-BS
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 14:34:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:
 Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rZGj17VptLsZWXeLYxsgFZ/iTorVUhMJW/uL07qu8HE=; b=m3meog/BfGat66EvU44tMCTvqI
 9S87E2V93s9N7S72cH//tPTy8Dg1vPalSJbN0Z+Z5FrwCRjP/Jyw5Qof/osqPc+BAGNZaDtk0v6L1
 MP+ezOzv7y+FJjN7Th4K6H4nYro1xkVOru2xARV2ngKSbTmgCzLORSISF+NkGbCoehJEUZ9AaMkSs
 lkYo0yo6f/gLtG3eN1GFLqpr8ZcQOPDr6ShFbS//dct2khrgjGAMhjT254bUOnA5yJFzK2fqR4peD
 L2XO2VovN7zfoupyoqFcdubwo5qaA1Szyh862tKW4IkbKSbgCLMDElIGXe0nrczN9XZuhZD6AIOBr
 WDrZ5YH9AKAzMZLj82Sjc31KiU2E6X+urUv2dC1AiiuxacJFtflHIemH+HBgQzVUhTMoaiOV0YAt1
 qvY8j7ZmliywjAVPQcW/ja2yt1oDQp24vAnzgPAwMlO1q68xh7Jr8LnFmA6RR7cTH2I1nCaWKVteI
 Zyyo7D6Q3vgyOZOnEt91Icuatw0I4tK6bZPlQeNkliM5Bp1JwyUOA7AQZJmcKqNo2jva3TtIv3Kzu
 erBorrdlWdxZth2zd7r2aLimDqubc3l3yPZpnasyc2uSi7I6EB4FLwVFiGQugNCgtyGBYB9HfU0Rs
 8y994qYNSKh7ekFsuVG0uMwQFCW+TE89IBPavf35c=;
Received: from [2a00:23c4:8ba6:5100:d563:eb67:74b1:7b0] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oDVY1-000B51-0q; Mon, 18 Jul 2022 19:32:53 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Date: Mon, 18 Jul 2022 19:33:04 +0100
Message-Id: <20220718183339.124253-6-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220718183339.124253-1-mark.cave-ayland@ilande.co.uk>
References: <20220718183339.124253-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba6:5100:d563:eb67:74b1:7b0
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PULL 05/40] pl050: introduce new PL050_MOUSE_DEVICE QOM type
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
Tested-by: Helge Deller <deller@gmx.de>
Acked-by: Helge Deller <deller@gmx.de>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20220712215251.7944-6-mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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


