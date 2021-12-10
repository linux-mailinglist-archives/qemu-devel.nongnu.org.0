Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8B5D46FD9B
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Dec 2021 10:22:29 +0100 (CET)
Received: from localhost ([::1]:46544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvc6m-0004wW-Rz
	for lists+qemu-devel@lfdr.de; Fri, 10 Dec 2021 04:22:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <troy_lee@aspeedtech.com>)
 id 1mvbJE-0001kO-57; Fri, 10 Dec 2021 03:31:16 -0500
Received: from twspam01.aspeedtech.com ([211.20.114.71]:37460)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <troy_lee@aspeedtech.com>)
 id 1mvbJ7-0000uB-D9; Fri, 10 Dec 2021 03:31:14 -0500
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 1BA85Umf088928;
 Fri, 10 Dec 2021 16:05:30 +0800 (GMT-8)
 (envelope-from troy_lee@aspeedtech.com)
Received: from localhost.localdomain (192.168.10.10) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 10 Dec
 2021 16:30:35 +0800
From: Troy Lee <troy_lee@aspeedtech.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v1] Add dummy Aspeed AST2600 Display Port MCU (DPMCU)
Date: Fri, 10 Dec 2021 16:30:34 +0800
Message-ID: <20211210083034.726610-1-troy_lee@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [192.168.10.10]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 1BA85Umf088928
Received-SPF: pass client-ip=211.20.114.71;
 envelope-from=troy_lee@aspeedtech.com; helo=twspam01.aspeedtech.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 leetroy@gmail.com, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

AST2600 Display Port MCU introduces 0x18000000~0x1803FFFF as it's memory
and io address. If guest machine try to access DPMCU memory, it will
cause a fatal error.

Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
---
 hw/arm/aspeed_ast2600.c     | 8 ++++++++
 include/hw/arm/aspeed_soc.h | 2 ++
 2 files changed, 10 insertions(+)

diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index 0384357a95..e33483fb5d 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -19,9 +19,11 @@
 #include "sysemu/sysemu.h"
 
 #define ASPEED_SOC_IOMEM_SIZE       0x00200000
+#define ASPEED_SOC_DPMCU_SIZE       0x00040000
 
 static const hwaddr aspeed_soc_ast2600_memmap[] = {
     [ASPEED_DEV_SRAM]      = 0x10000000,
+    [ASPEED_DEV_DPMCU]     = 0x18000000,
     /* 0x16000000     0x17FFFFFF : AHB BUS do LPC Bus bridge */
     [ASPEED_DEV_IOMEM]     = 0x1E600000,
     [ASPEED_DEV_PWM]       = 0x1E610000,
@@ -44,6 +46,7 @@ static const hwaddr aspeed_soc_ast2600_memmap[] = {
     [ASPEED_DEV_SCU]       = 0x1E6E2000,
     [ASPEED_DEV_XDMA]      = 0x1E6E7000,
     [ASPEED_DEV_ADC]       = 0x1E6E9000,
+    [ASPEED_DEV_DP]        = 0x1E6EB000,
     [ASPEED_DEV_VIDEO]     = 0x1E700000,
     [ASPEED_DEV_SDHCI]     = 0x1E740000,
     [ASPEED_DEV_EMMC]      = 0x1E750000,
@@ -104,6 +107,7 @@ static const int aspeed_soc_ast2600_irqmap[] = {
     [ASPEED_DEV_ETH3]      = 32,
     [ASPEED_DEV_ETH4]      = 33,
     [ASPEED_DEV_KCS]       = 138,   /* 138 -> 142 */
+    [ASPEED_DEV_DP]        = 62,
 };
 
 static qemu_irq aspeed_soc_get_irq(AspeedSoCState *s, int ctrl)
@@ -298,6 +302,10 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
     memory_region_add_subregion(get_system_memory(),
                                 sc->memmap[ASPEED_DEV_SRAM], &s->sram);
 
+    /* DPMCU */
+    create_unimplemented_device("aspeed.dpmcu", sc->memmap[ASPEED_DEV_DPMCU],
+                                ASPEED_SOC_DPMCU_SIZE);
+
     /* SCU */
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->scu), errp)) {
         return;
diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
index 8139358549..18fb7eed46 100644
--- a/include/hw/arm/aspeed_soc.h
+++ b/include/hw/arm/aspeed_soc.h
@@ -139,6 +139,8 @@ enum {
     ASPEED_DEV_EMMC,
     ASPEED_DEV_KCS,
     ASPEED_DEV_HACE,
+    ASPEED_DEV_DPMCU,
+    ASPEED_DEV_DP,
 };
 
 #endif /* ASPEED_SOC_H */
-- 
2.25.1


