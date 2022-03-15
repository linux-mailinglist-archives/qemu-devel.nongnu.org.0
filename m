Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 464E24D95D4
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 09:02:02 +0100 (CET)
Received: from localhost ([::1]:39504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nU280-000376-5o
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 04:02:00 -0400
Received: from eggs.gnu.org ([209.51.188.92]:32788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven_lee@aspeedtech.com>)
 id 1nU24p-0000dG-Q4; Tue, 15 Mar 2022 03:58:43 -0400
Received: from twspam01.aspeedtech.com ([211.20.114.71]:22718)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven_lee@aspeedtech.com>)
 id 1nU24m-0003jb-9i; Tue, 15 Mar 2022 03:58:43 -0400
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 22F7loYs061296;
 Tue, 15 Mar 2022 15:47:51 +0800 (GMT-8)
 (envelope-from steven_lee@aspeedtech.com)
Received: from localhost.localdomain (192.168.70.100) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 15 Mar
 2022 15:57:56 +0800
From: Steven Lee <steven_lee@aspeedtech.com>
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>, Joel Stanley
 <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, "open
 list:All patches CC here" <qemu-devel@nongnu.org>
Subject: [PATCH v2 2/2] hw: aspeed_scu: Introduce clkin_25Mhz attribute
Date: Tue, 15 Mar 2022 15:57:53 +0800
Message-ID: <20220315075753.8591-3-steven_lee@aspeedtech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220315075753.8591-1-steven_lee@aspeedtech.com>
References: <20220315075753.8591-1-steven_lee@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [192.168.70.100]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 22F7loYs061296
Received-SPF: pass client-ip=211.20.114.71;
 envelope-from=steven_lee@aspeedtech.com; helo=twspam01.aspeedtech.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Cc: jamin_lin@aspeedtech.com, troy_lee@aspeedtech.com,
 steven_lee@aspeedtech.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

AST2600 clkin is always 25MHz, introduce clkin_25Mhz attribute
for aspeed_scu_get_clkin() to return the correct clkin for ast2600.

Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
---
 hw/misc/aspeed_scu.c         | 6 +++++-
 include/hw/misc/aspeed_scu.h | 1 +
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/hw/misc/aspeed_scu.c b/hw/misc/aspeed_scu.c
index d65f86df3d..150567f98a 100644
--- a/hw/misc/aspeed_scu.c
+++ b/hw/misc/aspeed_scu.c
@@ -371,7 +371,8 @@ static const MemoryRegionOps aspeed_ast2500_scu_ops = {
 
 static uint32_t aspeed_scu_get_clkin(AspeedSCUState *s)
 {
-    if (s->hw_strap1 & SCU_HW_STRAP_CLK_25M_IN) {
+    if (s->hw_strap1 & SCU_HW_STRAP_CLK_25M_IN ||
+        ASPEED_SCU_GET_CLASS(s)->clkin_25Mhz) {
         return 25000000;
     } else if (s->hw_strap1 & SCU_HW_STRAP_CLK_48M_IN) {
         return 48000000;
@@ -562,6 +563,7 @@ static void aspeed_2400_scu_class_init(ObjectClass *klass, void *data)
     asc->get_apb = aspeed_2400_scu_get_apb_freq;
     asc->apb_divider = 2;
     asc->nr_regs = ASPEED_SCU_NR_REGS;
+    asc->clkin_25Mhz = false;
     asc->ops = &aspeed_ast2400_scu_ops;
 }
 
@@ -583,6 +585,7 @@ static void aspeed_2500_scu_class_init(ObjectClass *klass, void *data)
     asc->get_apb = aspeed_2400_scu_get_apb_freq;
     asc->apb_divider = 4;
     asc->nr_regs = ASPEED_SCU_NR_REGS;
+    asc->clkin_25Mhz = false;
     asc->ops = &aspeed_ast2500_scu_ops;
 }
 
@@ -756,6 +759,7 @@ static void aspeed_2600_scu_class_init(ObjectClass *klass, void *data)
     asc->get_apb = aspeed_2600_scu_get_apb_freq;
     asc->apb_divider = 4;
     asc->nr_regs = ASPEED_AST2600_SCU_NR_REGS;
+    asc->clkin_25Mhz = true;
     asc->ops = &aspeed_ast2600_scu_ops;
 }
 
diff --git a/include/hw/misc/aspeed_scu.h b/include/hw/misc/aspeed_scu.h
index 6bf67589e8..fdc721846c 100644
--- a/include/hw/misc/aspeed_scu.h
+++ b/include/hw/misc/aspeed_scu.h
@@ -59,6 +59,7 @@ struct AspeedSCUClass {
     uint32_t (*get_apb)(AspeedSCUState *s);
     uint32_t apb_divider;
     uint32_t nr_regs;
+    bool clkin_25Mhz;
     const MemoryRegionOps *ops;
 };
 
-- 
2.17.1


