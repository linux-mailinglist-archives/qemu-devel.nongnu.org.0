Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3094B578A57
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 21:12:14 +0200 (CEST)
Received: from localhost ([::1]:43916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDWA9-0006bZ-9Q
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 15:12:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oDVaJ-0000VO-Pa
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 14:35:13 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:49126)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oDVaI-0005cZ-46
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 14:35:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:
 Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bSBlhvxf82zZFHRdn6wC/5I7zowT7L6pho5M3lDfHQM=; b=SVdlrLMX4bnlrgD5AKs9WCryoF
 izd3Tg00354RGAtK5tQcu7GKK6J3U7HYSFgwyMfzqDkfZiDCjwNpqT6kKeY0NWkWoTv1oxF16EBY3
 RHZMNz/RtTHQ8BMz/2xVuyZxEjhb61yMCHguaUg7IxmVsvLgCvm7sghOdyhdmXO+ZYoR5wdUo0UKt
 yOt2ARiUsCFrUsbncWYFyjq+WDKi+Frzdu8OMq4Rrtyauqyh1TNnISdQO6WkKD/dxnS+7HOdqAJBl
 7WEztW1OhGDCpB0Nq9SbdyZK54UguTYYtrqveVjdbrYjmjzyXPYyBfydkKZMGqFXpjzOB0D73GFf3
 JQZptR4MVLp1FFLHY+Pkti3CUXU46zXurpSaKFP/r9sURLsXaNd2N/S689g0Vc0/rhijdT6xgm/RT
 +nd3L1/uGmclYVWnvcQPgZy1/Qysqf15z0fq9SXIkwmBGrIU6urctJZwpwQ6gbaSkxKX+764R5TBs
 Rd1s2wj5CT4gG8USTSnnH3teJdNOT902WWBFVuxcnWDJ/eYXbZs2uFncbvUZVKGvLqfkqslWvwyLd
 RoFu7MQW8smFJdNzkqqUe2HC6wuxjO5hZp6F0yTzMelK6RQAevhBQ7jyIkjR2jcUNjvE7nOM+AdFC
 nDKIVjBk1Jkt3LZkdBb6FobrqnQJCRuhEEkdQ0d1M=;
Received: from [2a00:23c4:8ba6:5100:d563:eb67:74b1:7b0] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oDVYn-000B51-90; Mon, 18 Jul 2022 19:33:40 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Date: Mon, 18 Jul 2022 19:33:16 +0100
Message-Id: <20220718183339.124253-18-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220718183339.124253-1-mark.cave-ayland@ilande.co.uk>
References: <20220718183339.124253-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba6:5100:d563:eb67:74b1:7b0
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PULL 17/40] lasips2: introduce new LASIPS2_KBD_PORT QOM type
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
Message-Id: <20220712215251.7944-18-mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/input/lasips2.c         | 7 +++++++
 include/hw/input/lasips2.h | 7 +++++++
 2 files changed, 14 insertions(+)

diff --git a/hw/input/lasips2.c b/hw/input/lasips2.c
index 56bfd759af..b043f2e264 100644
--- a/hw/input/lasips2.c
+++ b/hw/input/lasips2.c
@@ -318,10 +318,17 @@ static const TypeInfo lasips2_port_info = {
     .abstract      = true,
 };
 
+static const TypeInfo lasips2_kbd_port_info = {
+    .name          = TYPE_LASIPS2_KBD_PORT,
+    .parent        = TYPE_LASIPS2_PORT,
+    .instance_size = sizeof(LASIPS2KbdPort),
+};
+
 static void lasips2_register_types(void)
 {
     type_register_static(&lasips2_info);
     type_register_static(&lasips2_port_info);
+    type_register_static(&lasips2_kbd_port_info);
 }
 
 type_init(lasips2_register_types)
diff --git a/include/hw/input/lasips2.h b/include/hw/input/lasips2.h
index f4514081fe..504e2c06de 100644
--- a/include/hw/input/lasips2.h
+++ b/include/hw/input/lasips2.h
@@ -43,6 +43,13 @@ struct LASIPS2Port {
     bool irq;
 };
 
+#define TYPE_LASIPS2_KBD_PORT "lasips2-kbd-port"
+OBJECT_DECLARE_SIMPLE_TYPE(LASIPS2KbdPort, LASIPS2_KBD_PORT)
+
+struct LASIPS2KbdPort {
+    LASIPS2Port parent_obj;
+};
+
 struct LASIPS2State {
     SysBusDevice parent_obj;
 
-- 
2.30.2


