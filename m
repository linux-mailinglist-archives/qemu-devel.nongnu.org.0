Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C7965728E9
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jul 2022 00:00:45 +0200 (CEST)
Received: from localhost ([::1]:43086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBNvw-0003W6-Ho
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 18:00:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oBNot-0008SB-I7; Tue, 12 Jul 2022 17:53:27 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:42024)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oBNos-0007oQ-3U; Tue, 12 Jul 2022 17:53:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uDT2uipZT8z6bkAKveew0pvhFqY6LzU+aWOiOwvHlLw=; b=MbUPoKBjTS6HqTfJcq8pFHI+sf
 KJbKrM7DpvfPAs41K2pZW1CBMDbl23KjIYna+YzWIhVr1pbq7N30ONraoY3gdTW5pIi4aieQLAXrf
 4q/m5OudPLpf8V7/hxODzU9f8f9jdV7h4ub8kumcXbXVvqKczl+OvSfKyH+Lq30OfnMRmG1UlFIxp
 8pE0jkGEY17ZPitKSBWgF0PEnRxazi3tSGbpfYAVtbqS9PmsPlUyZP+mIyz/RyXiO6dXLiSM3IBiS
 8Tio/0znBaml+n4EHJ4C43Q1zAhOc8XxZm8ySsKWaebvAXMDTJsUQwgZprEJI8fmNMx26mELJpxbe
 WP/3N2vKwM+12Apf3gKVEe5QAp2sH4F6ZvkhkfsCcfAWLRneS8e+jzNkMVerjgelWZaPAwU4EBJJq
 YxVKc8Z0ANnxcDn+g+G+p7JVREdnmpRQONLeK+R1nS2ltLDsBjW3wXwqI+2QJsvxXlf0NYm3ZJqgL
 P4nhA3f4W+SAc6OeQ6XU1SWqNOqg+FT4i31YB8ySi7NRVbWkqhS1XM4XBoUGqR6DoNBO4eQhPLtxK
 UVIkO6LnRjGBCcil2GcihZzyfmCwMgvKlg7v9xCa1BPxrW48v4tnE5ftEJ2YMfKHzYovPX8uYBnMa
 l92xeCVR1HimqJyrw/8+DqeJapmfOPMTH2HIDSdGA=;
Received: from [2a00:23c4:8ba5:df00:fd7d:1c3a:1dd0:c576] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oBNnP-000Bqt-Gx; Tue, 12 Jul 2022 22:51:59 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, svens@stackframe.org,
 pbonzini@redhat.com, peter.maydell@linaro.org, hpoussin@reactos.org,
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Date: Tue, 12 Jul 2022 22:52:15 +0100
Message-Id: <20220712215251.7944-5-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220712215251.7944-1-mark.cave-ayland@ilande.co.uk>
References: <20220712215251.7944-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba5:df00:fd7d:1c3a:1dd0:c576
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 04/40] pl050: introduce new PL050_KBD_DEVICE QOM type
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


