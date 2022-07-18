Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F345578A56
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 21:12:03 +0200 (CEST)
Received: from localhost ([::1]:43260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDW9y-00069E-5n
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 15:12:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oDVas-00010G-4f
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 14:35:46 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:49174)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oDVao-0005pz-4h
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 14:35:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:
 Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9+FMW7LjstdFdpzp3c7sQ46vC/RqUjVRJirEPrrbirI=; b=Fgbym5JgJCKDfkwtB25MK+44d2
 98g4LAMJnvSmgVnTC+uidbhlYRTCDIAoMCmijK2MU15reuefQX/kQ6L8ZShYDlZ0Fq5kGWTIVPWbk
 3d8XKJWzheN3uAJV1aSOX4UtKHqM0T14//A2fWeEmE7xY6VV5Mwx02QGqu6RptKtQrXMNvnw3h1hN
 a+1YFlDo3IY2Gb+UBbgKqBuouH7AlzCKBvD345sOdDBr32/JPqIe5iPeLQkv7wQOEFozWWcJJxb+q
 6WHRe7619Qp1SD0bh7N3WvPUZB0JsNb6BfTJaYubftc8GluYiwz2UHNQtk/RSajUy8ESLwb8dpv3D
 vsPTRCSutM7pNKsPWFMTr9zD+or6bZnxLNICItzu89wFdNdZD0AMAGuNX/Z2DwkDl9hRQ2ok93OpW
 jWN1YRx+RbEgX1W0mWqg8ckBOYgbYs00ahmuc6dq6AJTR/sB851Ex2ZQ7YmQO661LLFjUfb2bO8p2
 o1AQbSSH1qbgiZZy9PsdHX7HDlPzyutU2y9pOC0YNrmwd6cbOJEl+FifFZwnH0l2yEFYp17sBmsPr
 U/oLIZ3NNQ1+Ty89BeBiLhrJxEeOLAneZ8mbx0LZQcrOxuQW3GPcvGlYS+ldUqAFZ4f+d2etSbMK2
 E1aGbm/XE0e7Jk7xDnH/iVjkNlJ+JuHah4Eew2+rY=;
Received: from [2a00:23c4:8ba6:5100:d563:eb67:74b1:7b0] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oDVZJ-000B51-Ft; Mon, 18 Jul 2022 19:34:12 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Date: Mon, 18 Jul 2022 19:33:24 +0100
Message-Id: <20220718183339.124253-26-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220718183339.124253-1-mark.cave-ayland@ilande.co.uk>
References: <20220718183339.124253-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba6:5100:d563:eb67:74b1:7b0
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PULL 25/40] lasips2: introduce LASIPS2PortDeviceClass for the
 LASIPS2_PORT device
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

This will soon be used to store the reference to the LASIPS2_PORT parent device
for LASIPS2_KBD_PORT and LASIPS2_MOUSE_PORT.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Tested-by: Helge Deller <deller@gmx.de>
Acked-by: Helge Deller <deller@gmx.de>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20220712215251.7944-26-mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/input/lasips2.c         | 2 ++
 include/hw/input/lasips2.h | 6 +++++-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/hw/input/lasips2.c b/hw/input/lasips2.c
index 6b53153838..10494a2322 100644
--- a/hw/input/lasips2.c
+++ b/hw/input/lasips2.c
@@ -334,6 +334,8 @@ static const TypeInfo lasips2_port_info = {
     .parent        = TYPE_DEVICE,
     .instance_init = lasips2_port_init,
     .instance_size = sizeof(LASIPS2Port),
+    .class_init    = lasips2_port_class_init,
+    .class_size    = sizeof(LASIPS2PortDeviceClass),
     .abstract      = true,
 };
 
diff --git a/include/hw/input/lasips2.h b/include/hw/input/lasips2.h
index a05f26cbd9..426aa1371f 100644
--- a/include/hw/input/lasips2.h
+++ b/include/hw/input/lasips2.h
@@ -26,7 +26,11 @@
 #include "hw/input/ps2.h"
 
 #define TYPE_LASIPS2_PORT "lasips2-port"
-OBJECT_DECLARE_SIMPLE_TYPE(LASIPS2Port, LASIPS2_PORT)
+OBJECT_DECLARE_TYPE(LASIPS2Port, LASIPS2PortDeviceClass, LASIPS2_PORT)
+
+struct LASIPS2PortDeviceClass {
+    DeviceClass parent;
+};
 
 typedef struct LASIPS2State LASIPS2State;
 
-- 
2.30.2


