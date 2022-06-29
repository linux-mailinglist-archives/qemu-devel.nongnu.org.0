Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8760D560096
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jun 2022 14:57:52 +0200 (CEST)
Received: from localhost ([::1]:55954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6XGR-0001WR-KM
	for lists+qemu-devel@lfdr.de; Wed, 29 Jun 2022 08:57:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o6X07-0007ba-RE; Wed, 29 Jun 2022 08:41:00 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:50858)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o6X05-0004db-Gw; Wed, 29 Jun 2022 08:40:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oxZ0MAzwBYh2zbYHzTIWktk6Z4pgwqOLXrKUMTvOqOE=; b=gDQrYJpM2nbGfL3kP0+YvdrhWV
 ZnjWsiABIlS1gR2E78FfXEWBnbnO9bLhc5KmRPwaQLMiuaNWEf3JnL5YkKSjfs6DC315jihQe+j0Z
 nOktcNUjwj6fUsVO1vcccmEC1YBDJVq36b+0I38H+mqPGNaV+qGmeUvC0kZi2EFHb7iv9XdnVOqID
 D/T5VzGmN+WA6j9WAVtdMIzOdAXFfCF4yLQpjPaasGAlbPP674A9OK7n95EDUrOmsY22rw9TaUWZT
 a9SLrNlZqZM6mJNDxJk8rVFCZB7mBOdK2sxbJfznT0+FsP09VtXuhxOL3q9kqoXQ/Ub1eKpppaI02
 qoIEW0ELUKCJ79cbKdj+eY3PO0Nw+3cpjQOsd8RTfbmdqdIf39dT1cx/qa6u5vAY7B4fdWv0nFeuI
 PYBhfWN0mjx9gs+83L0kUC8fZ9C6fIsNwlE/LhETvzMLfCjIJEL7J61zDGiw7H5o/XHnbEzfDb80D
 ror/olwrfLJ4DjBp8cuixZZI5fHmg6g9sVZEfcAfS3HQIyW8iPbkV03MhlujtIqdGLlkVHT04kr1j
 /tc4BNvDJlONWYr4J6FmlyhKM3403n/HjFjgAESIiu+Guyc72dMjoijk/q0o4aG3hVEI4MCQAPnBU
 9Iln+poQnBrt6mCfV9cEKByo7p38KEbYO404PCJwY=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o6Wyn-0002tZ-5i; Wed, 29 Jun 2022 13:39:37 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, svens@stackframe.org,
 mst@redhat.com, pbonzini@redhat.com, peter.maydell@linaro.org,
 hpoussin@reactos.org, aleksandar.rikalo@syrmia.com, f4bug@amsat.org,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org
Date: Wed, 29 Jun 2022 13:39:50 +0100
Message-Id: <20220629124026.1077021-5-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220629124026.1077021-1-mark.cave-ayland@ilande.co.uk>
References: <20220629124026.1077021-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 04/40] pl050: introduce new PL050_KBD_DEVICE QOM type
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


