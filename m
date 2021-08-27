Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B08B83F9508
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Aug 2021 09:22:31 +0200 (CEST)
Received: from localhost ([::1]:49514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJWC1-00005b-NZ
	for lists+qemu-devel@lfdr.de; Fri, 27 Aug 2021 03:22:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mJW06-00010T-7w; Fri, 27 Aug 2021 03:10:06 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:50049 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mJW03-0007SQ-Qh; Fri, 27 Aug 2021 03:10:05 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GwrSZ3JFXz9sWd; Fri, 27 Aug 2021 17:09:50 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1630048190;
 bh=va9gDSdsAlOXmXWPG7o/9EszwysLvmLJ6dOnM86bfaE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fl7dRJv92n7oDTljAlpbr2qsuP/DTcYb5IJPBPWLzrR3WFDj5QKph39ElFcKjftu+
 GwL2ORrA6L29LBn4I2sWg93KGJ4HR++ySpwMUZ/GMSvpWmlpwiqvwNdRMqw1Ort+kE
 bF12mjfPDKUUe85C4Tbce3CpHmwDNP6Zix4eIPDc=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 08/18] ppc/pnv: Change the POWER10 machine to support DD2 only
Date: Fri, 27 Aug 2021 17:09:36 +1000
Message-Id: <20210827070946.219970-9-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210827070946.219970-1-david@gibson.dropbear.id.au>
References: <20210827070946.219970-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: David Gibson <david@gibson.dropbear.id.au>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Cédric Le Goater <clg@kaod.org>

There is no need to keep the DD1 chip model as it will never be
publicly available.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <20210809134547.689560-3-clg@kaod.org>
Reviewed-by: Greg Kurz <groug@kaod.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/pnv.c         | 2 +-
 hw/ppc/pnv_core.c    | 2 +-
 include/hw/ppc/pnv.h | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index d16dd2d080..b122251d1a 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -1916,7 +1916,7 @@ static void pnv_machine_power10_class_init(ObjectClass *oc, void *data)
     static const char compat[] = "qemu,powernv10\0ibm,powernv";
 
     mc->desc = "IBM PowerNV (Non-Virtualized) POWER10";
-    mc->default_cpu_type = POWERPC_CPU_TYPE_NAME("power10_v1.0");
+    mc->default_cpu_type = POWERPC_CPU_TYPE_NAME("power10_v2.0");
 
     pmc->compat = compat;
     pmc->compat_size = sizeof(compat);
diff --git a/hw/ppc/pnv_core.c b/hw/ppc/pnv_core.c
index 8c2a15a0fb..4de8414df2 100644
--- a/hw/ppc/pnv_core.c
+++ b/hw/ppc/pnv_core.c
@@ -347,7 +347,7 @@ static const TypeInfo pnv_core_infos[] = {
     DEFINE_PNV_CORE_TYPE(power8, "power8_v2.0"),
     DEFINE_PNV_CORE_TYPE(power8, "power8nvl_v1.0"),
     DEFINE_PNV_CORE_TYPE(power9, "power9_v2.0"),
-    DEFINE_PNV_CORE_TYPE(power10, "power10_v1.0"),
+    DEFINE_PNV_CORE_TYPE(power10, "power10_v2.0"),
 };
 
 DEFINE_TYPES(pnv_core_infos)
diff --git a/include/hw/ppc/pnv.h b/include/hw/ppc/pnv.h
index d69cee17b2..3fec7c87d8 100644
--- a/include/hw/ppc/pnv.h
+++ b/include/hw/ppc/pnv.h
@@ -170,7 +170,7 @@ DECLARE_INSTANCE_CHECKER(PnvChip, PNV_CHIP_POWER8NVL,
 DECLARE_INSTANCE_CHECKER(PnvChip, PNV_CHIP_POWER9,
                          TYPE_PNV_CHIP_POWER9)
 
-#define TYPE_PNV_CHIP_POWER10 PNV_CHIP_TYPE_NAME("power10_v1.0")
+#define TYPE_PNV_CHIP_POWER10 PNV_CHIP_TYPE_NAME("power10_v2.0")
 DECLARE_INSTANCE_CHECKER(PnvChip, PNV_CHIP_POWER10,
                          TYPE_PNV_CHIP_POWER10)
 
-- 
2.31.1


