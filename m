Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75AD5534154
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 18:20:38 +0200 (CEST)
Received: from localhost ([::1]:35898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nttkT-00064I-Gh
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 12:20:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=Lufh=WB=kaod.org=clg@ozlabs.org>)
 id 1nttSb-00076f-9T; Wed, 25 May 2022 12:02:10 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]:51697
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=Lufh=WB=kaod.org=clg@ozlabs.org>)
 id 1nttSU-00049r-IW; Wed, 25 May 2022 12:02:08 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4L7bRX19Rtz4xbt;
 Thu, 26 May 2022 02:02:00 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4L7bRV2jprz4xXj;
 Thu, 26 May 2022 02:01:58 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Peter Delevoryas <pdel@fb.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 07/15] hw: aspeed: Add uarts_num SoC attribute
Date: Wed, 25 May 2022 18:01:28 +0200
Message-Id: <20220525160136.556277-8-clg@kaod.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220525160136.556277-1-clg@kaod.org>
References: <20220525160136.556277-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
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

AST2400 and AST2500 have 5 UART's, while the AST2600 and AST1030 have 13.

Signed-off-by: Peter Delevoryas <pdel@fb.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <20220516062328.298336-3-pdel@fb.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 include/hw/arm/aspeed_soc.h | 1 +
 hw/arm/aspeed_ast10x0.c     | 1 +
 hw/arm/aspeed_ast2600.c     | 1 +
 hw/arm/aspeed_soc.c         | 2 ++
 4 files changed, 5 insertions(+)

diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
index 709a78285b59..669bc4985571 100644
--- a/include/hw/arm/aspeed_soc.h
+++ b/include/hw/arm/aspeed_soc.h
@@ -91,6 +91,7 @@ struct AspeedSoCClass {
     int ehcis_num;
     int wdts_num;
     int macs_num;
+    int uarts_num;
     const int *irqmap;
     const hwaddr *memmap;
     uint32_t num_cpus;
diff --git a/hw/arm/aspeed_ast10x0.c b/hw/arm/aspeed_ast10x0.c
index fa2cc4406c0d..bb8177e86c87 100644
--- a/hw/arm/aspeed_ast10x0.c
+++ b/hw/arm/aspeed_ast10x0.c
@@ -301,6 +301,7 @@ static void aspeed_soc_ast1030_class_init(ObjectClass *klass, void *data)
     sc->ehcis_num = 0;
     sc->wdts_num = 4;
     sc->macs_num = 1;
+    sc->uarts_num = 13;
     sc->irqmap = aspeed_soc_ast1030_irqmap;
     sc->memmap = aspeed_soc_ast1030_memmap;
     sc->num_cpus = 1;
diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index f3ecc0f3b7c0..a9523074a089 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -588,6 +588,7 @@ static void aspeed_soc_ast2600_class_init(ObjectClass *oc, void *data)
     sc->ehcis_num    = 2;
     sc->wdts_num     = 4;
     sc->macs_num     = 4;
+    sc->uarts_num    = 13;
     sc->irqmap       = aspeed_soc_ast2600_irqmap;
     sc->memmap       = aspeed_soc_ast2600_memmap;
     sc->num_cpus     = 2;
diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index 96bc060680c9..7008cd1af716 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -490,6 +490,7 @@ static void aspeed_soc_ast2400_class_init(ObjectClass *oc, void *data)
     sc->ehcis_num    = 1;
     sc->wdts_num     = 2;
     sc->macs_num     = 2;
+    sc->uarts_num    = 5;
     sc->irqmap       = aspeed_soc_ast2400_irqmap;
     sc->memmap       = aspeed_soc_ast2400_memmap;
     sc->num_cpus     = 1;
@@ -516,6 +517,7 @@ static void aspeed_soc_ast2500_class_init(ObjectClass *oc, void *data)
     sc->ehcis_num    = 2;
     sc->wdts_num     = 3;
     sc->macs_num     = 2;
+    sc->uarts_num    = 5;
     sc->irqmap       = aspeed_soc_ast2500_irqmap;
     sc->memmap       = aspeed_soc_ast2500_memmap;
     sc->num_cpus     = 1;
-- 
2.35.3


