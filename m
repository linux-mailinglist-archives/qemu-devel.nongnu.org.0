Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B2CC68D3C1
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 11:11:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPKuF-0000nN-HP; Tue, 07 Feb 2023 05:08:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=a43c=6D=kaod.org=clg@ozlabs.org>)
 id 1pPKu3-0000Y0-4d; Tue, 07 Feb 2023 05:08:45 -0500
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=a43c=6D=kaod.org=clg@ozlabs.org>)
 id 1pPKu1-0002Uw-8C; Tue, 07 Feb 2023 05:08:42 -0500
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4P9zNk3yXnz4xxJ;
 Tue,  7 Feb 2023 21:08:38 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4P9zNh3rblz4xyd;
 Tue,  7 Feb 2023 21:08:36 +1100 (AEDT)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Delevoryas <peter@pjd.dev>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 17/25] hw/watchdog/wdt_aspeed: Log unimplemented registers as
 UNIMP level
Date: Tue,  7 Feb 2023 11:07:36 +0100
Message-Id: <20230207100744.698694-18-clg@kaod.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230207100744.698694-1-clg@kaod.org>
References: <20230207100744.698694-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=a43c=6D=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Philippe Mathieu-Daudé <philmd@linaro.org>

Add more Aspeed watchdog registers from [*].

Since guests can righteously access them, log the access at
'unimplemented' level instead of 'guest-errors'.

[*] https://github.com/AspeedTech-BMC/zephyr/blob/v00.01.08/drivers/watchdog/wdt_aspeed.c#L31

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Peter Delevoryas <peter@pjd.dev>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 include/hw/watchdog/wdt_aspeed.h |  2 +-
 hw/watchdog/wdt_aspeed.c         | 13 +++++++++++++
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/include/hw/watchdog/wdt_aspeed.h b/include/hw/watchdog/wdt_aspeed.h
index db91ee6b51..e90ef86651 100644
--- a/include/hw/watchdog/wdt_aspeed.h
+++ b/include/hw/watchdog/wdt_aspeed.h
@@ -21,7 +21,7 @@ OBJECT_DECLARE_TYPE(AspeedWDTState, AspeedWDTClass, ASPEED_WDT)
 #define TYPE_ASPEED_2600_WDT TYPE_ASPEED_WDT "-ast2600"
 #define TYPE_ASPEED_1030_WDT TYPE_ASPEED_WDT "-ast1030"
 
-#define ASPEED_WDT_REGS_MAX        (0x20 / 4)
+#define ASPEED_WDT_REGS_MAX        (0x30 / 4)
 
 struct AspeedWDTState {
     /*< private >*/
diff --git a/hw/watchdog/wdt_aspeed.c b/hw/watchdog/wdt_aspeed.c
index eefca31ae4..d267aa185c 100644
--- a/hw/watchdog/wdt_aspeed.c
+++ b/hw/watchdog/wdt_aspeed.c
@@ -42,6 +42,11 @@
 #define     WDT_PUSH_PULL_MAGIC         (0xA8 << 24)
 #define     WDT_OPEN_DRAIN_MAGIC        (0x8A << 24)
 #define WDT_RESET_MASK1                 (0x1c / 4)
+#define WDT_RESET_MASK2                 (0x20 / 4)
+
+#define WDT_SW_RESET_CTRL               (0x24 / 4)
+#define WDT_SW_RESET_MASK1              (0x28 / 4)
+#define WDT_SW_RESET_MASK2              (0x2c / 4)
 
 #define WDT_TIMEOUT_STATUS              (0x10 / 4)
 #define WDT_TIMEOUT_CLEAR               (0x14 / 4)
@@ -83,6 +88,10 @@ static uint64_t aspeed_wdt_read(void *opaque, hwaddr offset, unsigned size)
         return s->regs[WDT_RESET_MASK1];
     case WDT_TIMEOUT_STATUS:
     case WDT_TIMEOUT_CLEAR:
+    case WDT_RESET_MASK2:
+    case WDT_SW_RESET_CTRL:
+    case WDT_SW_RESET_MASK1:
+    case WDT_SW_RESET_MASK2:
         qemu_log_mask(LOG_UNIMP,
                       "%s: uninmplemented read at offset 0x%" HWADDR_PRIx "\n",
                       __func__, offset);
@@ -190,6 +199,10 @@ static void aspeed_wdt_write(void *opaque, hwaddr offset, uint64_t data,
 
     case WDT_TIMEOUT_STATUS:
     case WDT_TIMEOUT_CLEAR:
+    case WDT_RESET_MASK2:
+    case WDT_SW_RESET_CTRL:
+    case WDT_SW_RESET_MASK1:
+    case WDT_SW_RESET_MASK2:
         qemu_log_mask(LOG_UNIMP,
                       "%s: uninmplemented write at offset 0x%" HWADDR_PRIx "\n",
                       __func__, offset);
-- 
2.39.1


