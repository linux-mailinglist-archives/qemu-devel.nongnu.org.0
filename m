Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70CD6517EAE
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 09:20:04 +0200 (CEST)
Received: from localhost ([::1]:34486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlmpH-0002UP-D2
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 03:20:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=XF6a=VL=kaod.org=clg@ozlabs.org>)
 id 1nlmUz-00030p-Bk; Tue, 03 May 2022 02:59:05 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:40549)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=XF6a=VL=kaod.org=clg@ozlabs.org>)
 id 1nlmUx-0007S0-6y; Tue, 03 May 2022 02:59:04 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4KsrR55xFPz4ySc;
 Tue,  3 May 2022 16:58:57 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4KsrR40Lfrz4yST;
 Tue,  3 May 2022 16:58:55 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 02/19] hw: aspeed_scu: Introduce clkin_25Mhz attribute
Date: Tue,  3 May 2022 08:58:31 +0200
Message-Id: <20220503065848.125215-3-clg@kaod.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220503065848.125215-1-clg@kaod.org>
References: <20220503065848.125215-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=XF6a=VL=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
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

From: Steven Lee <steven_lee@aspeedtech.com>

AST2600 clkin is always 25MHz, introduce clkin_25Mhz attribute
for aspeed_scu_get_clkin() to return the correct clkin for ast2600.

Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <20220315075753.8591-3-steven_lee@aspeedtech.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 include/hw/misc/aspeed_scu.h | 1 +
 hw/misc/aspeed_scu.c         | 6 +++++-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/include/hw/misc/aspeed_scu.h b/include/hw/misc/aspeed_scu.h
index 8c4c8c8d5cbb..6d3f86c1abab 100644
--- a/include/hw/misc/aspeed_scu.h
+++ b/include/hw/misc/aspeed_scu.h
@@ -59,6 +59,7 @@ struct AspeedSCUClass {
     uint32_t (*get_apb)(AspeedSCUState *s);
     uint32_t apb_divider;
     uint32_t nr_regs;
+    bool clkin_25Mhz;
     const MemoryRegionOps *ops;
 };
 
diff --git a/hw/misc/aspeed_scu.c b/hw/misc/aspeed_scu.c
index d65f86df3d12..150567f98a74 100644
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
 
-- 
2.35.1


