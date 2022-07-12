Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA4B5728FF
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jul 2022 00:07:42 +0200 (CEST)
Received: from localhost ([::1]:60266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBO2g-0006oB-1L
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 18:07:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oBNou-0008SX-No; Tue, 12 Jul 2022 17:53:29 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:42032)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oBNos-0007oX-QH; Tue, 12 Jul 2022 17:53:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/bhnC+2gZ9vyQLezGGYsIGnfmTZfsidizkGybMJ1bFw=; b=ANGU1DOzGqIWfgf2gyZEuvuXGL
 WOOKlldyRusoRMInLDnW3Rka7cpQCTgSsZtGQFcvu4nvHy4gd2rZF1B3mKs0NNsgQomj+tM2GGyV+
 BUgP6xfsAHvhFDb50amArXuN1GSWJG7+hj7WWMUeYV9zxaF4Ivx3qSn0TpOHZEqMqVUQeWykNEg2v
 X49apw5Rv/j4gBwlXQ7OsVQbBESpj9FyBf9F1Nod2q4/QRfJUo0d3voPVVOnsO7QSehcv3qsx7Zua
 ZfGbgi5HjK8Cpbty44cPaWsM+0XiqkoEtlMuSYLOib2Q7ChcrGq+DhP6okWqLbQSpeP2XPT+jBTxH
 IVJh+D9Xv+3/0RBK3V7cRIPrNOGId+syZnICiMHmcYetwPeH8Xn0g7i6mGtGQF0hjMvsxk5Oere+0
 GtxJzAbcdoTiwHgUyP/uhSO7+CFKmuhroZRcmFmg8/IVl820IQ+qN4IOpGIDhbNqOuSLBLWGYuWgI
 W9/NCNE/NSP1cwXX2620v2EOcDgDsPzaUpLVJJPwgthwbuu8rx3gty13rj85hbN++cDXsd0fhF2Nd
 R3sLZGBQE8d00PaVVwWTf06Jz/lj6TGZpnDJf9jqawr7uRzsvBfcvUG2paw1laZwA6QQlx+q2vfkb
 Uznl/BPbn2Wr7eEvWU/kb5CICho8de7UhL2okSqE4=;
Received: from [2a00:23c4:8ba5:df00:fd7d:1c3a:1dd0:c576] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oBNnT-000Bqt-Qa; Tue, 12 Jul 2022 22:52:00 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, svens@stackframe.org,
 pbonzini@redhat.com, peter.maydell@linaro.org, hpoussin@reactos.org,
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Date: Tue, 12 Jul 2022 22:52:16 +0100
Message-Id: <20220712215251.7944-6-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220712215251.7944-1-mark.cave-ayland@ilande.co.uk>
References: <20220712215251.7944-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba5:df00:fd7d:1c3a:1dd0:c576
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 05/40] pl050: introduce new PL050_MOUSE_DEVICE QOM type
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


