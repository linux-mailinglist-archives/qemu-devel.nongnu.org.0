Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BC7257292A
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jul 2022 00:18:55 +0200 (CEST)
Received: from localhost ([::1]:35376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBODW-0003nS-JO
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 18:18:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oBNqL-0003zi-9x; Tue, 12 Jul 2022 17:54:58 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:42386)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oBNqJ-0007wD-TV; Tue, 12 Jul 2022 17:54:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qfdox4qJpMUTcQpbHl7qZW4eWAZxZYenk7ZkJR0Fvk8=; b=f/oV69JKuh9NKSdOB3lQx9YEVk
 iqcHlySEXB0BfpIWYVPNsXrGmeRFaatSRT1W27RS+iiv2ACXMZzg6zIOOYkxpBMBpd9+CBas9zso1
 gWPlHe2QaSud8YeCJPKIWAn3vC+hw2tTB29CM0eVxrJIwFLeWOC8woSwmoz7UjHBaLy2ezsCEH1iU
 pLaLY6CotDN9WihVZFwGCnOlZNtRQLQZMaBRZD2YcoG/F20JJAjCpbSHjnc32S+JJWc/+Qt/cdZD9
 Uq2FJMrUacqO5JQEkdlmtDNlSgihswessHGfWZ0GlJpvCepDBeF14UFaJTB0j80Zj4d+dDiidTkXe
 b+jwAmtSXjlfCPZzG1rGOSbvXgDxLPbL+3ohdJNFBA12UmJRMSUUYabodLrNv3l0qDyW4vs0hyqZ9
 0mls27WAwmVUIkeWgZkkPZyun6LV6gCSa59HPT0IZBsYBf4N8xkiZHMTb/U6nBGwtKwjOhJOFNUwW
 FV0LIb+QBQx9bHPbzw73Jtu6ds+jQLowDD54v2W+RLPw7UZp7y+VGaEHYACRfKnlMZ3CxlMVy17LH
 dK1t/lbLusxMqku2oeES+DNpKbbVJX+jgJtPUx0jsu4SHEdkHiOl/lId/mqAkoMf+POXjrEG/+wsO
 q2+Ubx4MGWNu4jT2bA6MgrCyjbSgoyaGnkAqImOxM=;
Received: from [2a00:23c4:8ba5:df00:fd7d:1c3a:1dd0:c576] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oBNoa-000Bqt-UH; Tue, 12 Jul 2022 22:53:12 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, svens@stackframe.org,
 pbonzini@redhat.com, peter.maydell@linaro.org, hpoussin@reactos.org,
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Date: Tue, 12 Jul 2022 22:52:36 +0100
Message-Id: <20220712215251.7944-26-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220712215251.7944-1-mark.cave-ayland@ilande.co.uk>
References: <20220712215251.7944-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba5:df00:fd7d:1c3a:1dd0:c576
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 25/40] lasips2: introduce LASIPS2PortDeviceClass for the
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


