Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B815578A97
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 21:22:21 +0200 (CEST)
Received: from localhost ([::1]:32804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDWJw-0003GR-3z
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 15:22:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oDVaR-0000j9-U8
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 14:35:23 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:49134)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oDVaQ-0005nH-G5
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 14:35:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:
 Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BEqno6/eg1pj4ClJT0V1T+CbReX3oI9Z9ZpDBVPcz2U=; b=jrrl0bwkBu4zwPgFYC2xKlQRMI
 u/cLqQiHjmHLCAz/RZ4ibMjgzPyAZocwUTFp6j7QunwfVYNZYIG4VJZfEx3jH09JjkRMShQvI2wWY
 m9ixJ5l9vlCZgcBiUMRHB268EIWxZF5iG/HgK5QbC+XTlLiMz54i9bVnMq+OahHMeBfuP2S1e1yMi
 iBob6LDbOpWf+HEH8WkfsZd58waixMCBoF8Wi/AqZYxVPXHBMfdFyS0DLwFKqHndpvRLjqJTQEsrQ
 prXaDk92wtw6oYW30twFQ2l+VzzTY9bpvDQjS2JI3sLdiGBtjZdObhsu3C6A8VJoHM1P1tKnmjxOG
 TnEgp4O7s9ZG8piBj/34TQISpbpWM4gMLfaQjO1w235ZPE4W6VcSpx6SW3cNnOzyMuevff/fRqqJt
 LyC9VdFjF1mzGVguuUJhNldyL01hFJv8aUKlnxlDqfT9izEyoj8RaquWZoUBFnaLHkFruB0WQvapl
 MAPPp3RKpOTRyBm/XnYzulDNsPq/AzkJ2oVrlt5tL29Lry81pVLsUg/PDpwA+UyuqGkGZNaOAD5eG
 aVOoR1odijA92Rn6qAI7biSU6lAyjCTTxYf45gaJPJzAl36seaLfIZsbKzI7tp+8I/6SR52XzzTAi
 meiZZfwuyoGFdnKETR0lC7AS2JNC/DjpoKodfvNBM=;
Received: from [2a00:23c4:8ba6:5100:d563:eb67:74b1:7b0] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oDVYq-000B51-Uj; Mon, 18 Jul 2022 19:33:45 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Date: Mon, 18 Jul 2022 19:33:17 +0100
Message-Id: <20220718183339.124253-19-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220718183339.124253-1-mark.cave-ayland@ilande.co.uk>
References: <20220718183339.124253-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba6:5100:d563:eb67:74b1:7b0
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PULL 18/40] lasips2: introduce new LASIPS2_MOUSE_PORT QOM type
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
Message-Id: <20220712215251.7944-19-mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/input/lasips2.c         | 7 +++++++
 include/hw/input/lasips2.h | 7 +++++++
 2 files changed, 14 insertions(+)

diff --git a/hw/input/lasips2.c b/hw/input/lasips2.c
index b043f2e264..f70cf893f6 100644
--- a/hw/input/lasips2.c
+++ b/hw/input/lasips2.c
@@ -324,11 +324,18 @@ static const TypeInfo lasips2_kbd_port_info = {
     .instance_size = sizeof(LASIPS2KbdPort),
 };
 
+static const TypeInfo lasips2_mouse_port_info = {
+    .name          = TYPE_LASIPS2_MOUSE_PORT,
+    .parent        = TYPE_LASIPS2_PORT,
+    .instance_size = sizeof(LASIPS2MousePort),
+};
+
 static void lasips2_register_types(void)
 {
     type_register_static(&lasips2_info);
     type_register_static(&lasips2_port_info);
     type_register_static(&lasips2_kbd_port_info);
+    type_register_static(&lasips2_mouse_port_info);
 }
 
 type_init(lasips2_register_types)
diff --git a/include/hw/input/lasips2.h b/include/hw/input/lasips2.h
index 504e2c06de..aab6a3500c 100644
--- a/include/hw/input/lasips2.h
+++ b/include/hw/input/lasips2.h
@@ -50,6 +50,13 @@ struct LASIPS2KbdPort {
     LASIPS2Port parent_obj;
 };
 
+#define TYPE_LASIPS2_MOUSE_PORT "lasips2-mouse-port"
+OBJECT_DECLARE_SIMPLE_TYPE(LASIPS2MousePort, LASIPS2_MOUSE_PORT)
+
+struct LASIPS2MousePort {
+    LASIPS2Port parent_obj;
+};
+
 struct LASIPS2State {
     SysBusDevice parent_obj;
 
-- 
2.30.2


