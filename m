Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03511534180
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 18:28:44 +0200 (CEST)
Received: from localhost ([::1]:52688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nttsJ-0001F6-4E
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 12:28:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=Lufh=WB=kaod.org=clg@ozlabs.org>)
 id 1nttSX-00074j-IX; Wed, 25 May 2022 12:02:07 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:57471)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=Lufh=WB=kaod.org=clg@ozlabs.org>)
 id 1nttST-00049Z-Ss; Wed, 25 May 2022 12:02:04 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4L7bRT6BYCz4xZv;
 Thu, 26 May 2022 02:01:57 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4L7bRS0dmYz4xXj;
 Thu, 26 May 2022 02:01:55 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Peter Delevoryas <pdel@fb.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 06/15] hw: aspeed: Add missing UART's
Date: Wed, 25 May 2022 18:01:27 +0200
Message-Id: <20220525160136.556277-7-clg@kaod.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220525160136.556277-1-clg@kaod.org>
References: <20220525160136.556277-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=Lufh=WB=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

From: Peter Delevoryas <pdel@fb.com>

This adds the missing UART memory and IRQ mappings for the AST2400, AST2500,
AST2600, and AST1030.

This also includes the new UART interfaces added in the AST2600 and AST1030
from UART6 to UART13. The addresses and interrupt numbers for these two
later chips are identical.

Signed-off-by: Peter Delevoryas <pdel@fb.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <20220516062328.298336-2-pdel@fb.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 include/hw/arm/aspeed_soc.h |  8 ++++++++
 hw/arm/aspeed_ast10x0.c     | 24 ++++++++++++++++++++++++
 hw/arm/aspeed_ast2600.c     | 19 +++++++++++++++++++
 hw/arm/aspeed_soc.c         |  6 ++++++
 4 files changed, 57 insertions(+)

diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
index 3789f38603e5..709a78285b59 100644
--- a/include/hw/arm/aspeed_soc.h
+++ b/include/hw/arm/aspeed_soc.h
@@ -105,6 +105,14 @@ enum {
     ASPEED_DEV_UART3,
     ASPEED_DEV_UART4,
     ASPEED_DEV_UART5,
+    ASPEED_DEV_UART6,
+    ASPEED_DEV_UART7,
+    ASPEED_DEV_UART8,
+    ASPEED_DEV_UART9,
+    ASPEED_DEV_UART10,
+    ASPEED_DEV_UART11,
+    ASPEED_DEV_UART12,
+    ASPEED_DEV_UART13,
     ASPEED_DEV_VUART,
     ASPEED_DEV_FMC,
     ASPEED_DEV_SPI1,
diff --git a/hw/arm/aspeed_ast10x0.c b/hw/arm/aspeed_ast10x0.c
index 9ae9efaac144..fa2cc4406c0d 100644
--- a/hw/arm/aspeed_ast10x0.c
+++ b/hw/arm/aspeed_ast10x0.c
@@ -33,14 +33,38 @@ static const hwaddr aspeed_soc_ast1030_memmap[] = {
     [ASPEED_DEV_SBC]       = 0x7E6F2000,
     [ASPEED_DEV_GPIO]      = 0x7E780000,
     [ASPEED_DEV_TIMER1]    = 0x7E782000,
+    [ASPEED_DEV_UART1]     = 0x7E783000,
+    [ASPEED_DEV_UART2]     = 0x7E78D000,
+    [ASPEED_DEV_UART3]     = 0x7E78E000,
+    [ASPEED_DEV_UART4]     = 0x7E78F000,
     [ASPEED_DEV_UART5]     = 0x7E784000,
+    [ASPEED_DEV_UART6]     = 0x7E790000,
+    [ASPEED_DEV_UART7]     = 0x7E790100,
+    [ASPEED_DEV_UART8]     = 0x7E790200,
+    [ASPEED_DEV_UART9]     = 0x7E790300,
+    [ASPEED_DEV_UART10]    = 0x7E790400,
+    [ASPEED_DEV_UART11]    = 0x7E790500,
+    [ASPEED_DEV_UART12]    = 0x7E790600,
+    [ASPEED_DEV_UART13]    = 0x7E790700,
     [ASPEED_DEV_WDT]       = 0x7E785000,
     [ASPEED_DEV_LPC]       = 0x7E789000,
     [ASPEED_DEV_I2C]       = 0x7E7B0000,
 };
 
 static const int aspeed_soc_ast1030_irqmap[] = {
+    [ASPEED_DEV_UART1]     = 47,
+    [ASPEED_DEV_UART2]     = 48,
+    [ASPEED_DEV_UART3]     = 49,
+    [ASPEED_DEV_UART4]     = 50,
     [ASPEED_DEV_UART5]     = 8,
+    [ASPEED_DEV_UART6]     = 57,
+    [ASPEED_DEV_UART7]     = 58,
+    [ASPEED_DEV_UART8]     = 59,
+    [ASPEED_DEV_UART9]     = 60,
+    [ASPEED_DEV_UART10]    = 61,
+    [ASPEED_DEV_UART11]    = 62,
+    [ASPEED_DEV_UART12]    = 63,
+    [ASPEED_DEV_UART13]    = 64,
     [ASPEED_DEV_GPIO]      = 11,
     [ASPEED_DEV_TIMER1]    = 16,
     [ASPEED_DEV_TIMER2]    = 17,
diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index 4161a0cc4bbe..f3ecc0f3b7c0 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -61,7 +61,18 @@ static const hwaddr aspeed_soc_ast2600_memmap[] = {
     [ASPEED_DEV_IBT]       = 0x1E789140,
     [ASPEED_DEV_I2C]       = 0x1E78A000,
     [ASPEED_DEV_UART1]     = 0x1E783000,
+    [ASPEED_DEV_UART2]     = 0x1E78D000,
+    [ASPEED_DEV_UART3]     = 0x1E78E000,
+    [ASPEED_DEV_UART4]     = 0x1E78F000,
     [ASPEED_DEV_UART5]     = 0x1E784000,
+    [ASPEED_DEV_UART6]     = 0x1E790000,
+    [ASPEED_DEV_UART7]     = 0x1E790100,
+    [ASPEED_DEV_UART8]     = 0x1E790200,
+    [ASPEED_DEV_UART9]     = 0x1E790300,
+    [ASPEED_DEV_UART10]    = 0x1E790400,
+    [ASPEED_DEV_UART11]    = 0x1E790500,
+    [ASPEED_DEV_UART12]    = 0x1E790600,
+    [ASPEED_DEV_UART13]    = 0x1E790700,
     [ASPEED_DEV_VUART]     = 0x1E787000,
     [ASPEED_DEV_I3C]       = 0x1E7A0000,
     [ASPEED_DEV_SDRAM]     = 0x80000000,
@@ -78,6 +89,14 @@ static const int aspeed_soc_ast2600_irqmap[] = {
     [ASPEED_DEV_UART3]     = 49,
     [ASPEED_DEV_UART4]     = 50,
     [ASPEED_DEV_UART5]     = 8,
+    [ASPEED_DEV_UART6]     = 57,
+    [ASPEED_DEV_UART7]     = 58,
+    [ASPEED_DEV_UART8]     = 59,
+    [ASPEED_DEV_UART9]     = 60,
+    [ASPEED_DEV_UART10]    = 61,
+    [ASPEED_DEV_UART11]    = 62,
+    [ASPEED_DEV_UART12]    = 63,
+    [ASPEED_DEV_UART13]    = 64,
     [ASPEED_DEV_VUART]     = 8,
     [ASPEED_DEV_FMC]       = 39,
     [ASPEED_DEV_SDMC]      = 0,
diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index c339b5c74de5..96bc060680c9 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -48,6 +48,9 @@ static const hwaddr aspeed_soc_ast2400_memmap[] = {
     [ASPEED_DEV_ETH1]   = 0x1E660000,
     [ASPEED_DEV_ETH2]   = 0x1E680000,
     [ASPEED_DEV_UART1]  = 0x1E783000,
+    [ASPEED_DEV_UART2]  = 0x1E78D000,
+    [ASPEED_DEV_UART3]  = 0x1E78E000,
+    [ASPEED_DEV_UART4]  = 0x1E78F000,
     [ASPEED_DEV_UART5]  = 0x1E784000,
     [ASPEED_DEV_VUART]  = 0x1E787000,
     [ASPEED_DEV_SDRAM]  = 0x40000000,
@@ -80,6 +83,9 @@ static const hwaddr aspeed_soc_ast2500_memmap[] = {
     [ASPEED_DEV_ETH1]   = 0x1E660000,
     [ASPEED_DEV_ETH2]   = 0x1E680000,
     [ASPEED_DEV_UART1]  = 0x1E783000,
+    [ASPEED_DEV_UART2]  = 0x1E78D000,
+    [ASPEED_DEV_UART3]  = 0x1E78E000,
+    [ASPEED_DEV_UART4]  = 0x1E78F000,
     [ASPEED_DEV_UART5]  = 0x1E784000,
     [ASPEED_DEV_VUART]  = 0x1E787000,
     [ASPEED_DEV_SDRAM]  = 0x80000000,
-- 
2.35.3


