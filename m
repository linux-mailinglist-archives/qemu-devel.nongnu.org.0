Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3769E3F94EC
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Aug 2021 09:15:55 +0200 (CEST)
Received: from localhost ([::1]:35556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJW5d-0007Hh-7U
	for lists+qemu-devel@lfdr.de; Fri, 27 Aug 2021 03:15:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mJW06-00010E-6W; Fri, 27 Aug 2021 03:10:06 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:49547)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mJW03-0007SV-AH; Fri, 27 Aug 2021 03:10:04 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GwrSZ3y3vz9sWl; Fri, 27 Aug 2021 17:09:50 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1630048190;
 bh=d8jC+ZtS8niMVyL1mleSB5dcdhoQ/l952YdNs5qMSYI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=g1kAL/QoH8xnDYMfuBaBPtO2cDKCeLzPbOMXysezggdEfh3Bj2wC1SuAopeUyssr0
 TU6dFeurxHfXjANQ4U4gjTkZH9HjY075HJZbqr2iF1aDSpWothS8Ccb0O8sfJjncgw
 eYcm8Zu0Y0ub9ICdBj6384UyubtT4f/lkqZ89pM8=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 12/18] ppc/pnv: add a chip topology index for POWER10
Date: Fri, 27 Aug 2021 17:09:40 +1000
Message-Id: <20210827070946.219970-13-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210827070946.219970-1-david@gibson.dropbear.id.au>
References: <20210827070946.219970-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: 1
X-Spam_score: 0.1
X-Spam_bar: /
X-Spam_report: (0.1 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_PASS=-0.001,
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

Signed-off-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <20210809134547.689560-7-clg@kaod.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/pnv_xscom.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/ppc/pnv_xscom.c b/hw/ppc/pnv_xscom.c
index be7018e8ac..faa488e311 100644
--- a/hw/ppc/pnv_xscom.c
+++ b/hw/ppc/pnv_xscom.c
@@ -284,6 +284,8 @@ int pnv_dt_xscom(PnvChip *chip, void *fdt, int root_offset,
     _FDT(xscom_offset);
     g_free(name);
     _FDT((fdt_setprop_cell(fdt, xscom_offset, "ibm,chip-id", chip->chip_id)));
+    _FDT((fdt_setprop_cell(fdt, xscom_offset, "ibm,primary-topology-index",
+                           chip->chip_id)));
     _FDT((fdt_setprop_cell(fdt, xscom_offset, "#address-cells", 1)));
     _FDT((fdt_setprop_cell(fdt, xscom_offset, "#size-cells", 1)));
     _FDT((fdt_setprop(fdt, xscom_offset, "reg", reg, sizeof(reg))));
-- 
2.31.1


