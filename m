Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F22BC315F56
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 07:22:50 +0100 (CET)
Received: from localhost ([::1]:50970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9itm-0007Nq-1w
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 01:22:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l9ip5-0001ZW-56; Wed, 10 Feb 2021 01:17:59 -0500
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:46441 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l9ip3-0000MA-Fv; Wed, 10 Feb 2021 01:17:58 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Db8gl4klkz9sW1; Wed, 10 Feb 2021 17:17:39 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1612937859;
 bh=EWWlD3MZAC/MZNvPRHEsQ7wbWgU6/qlgdAUYgfGO/ek=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dHpkIqIvZ+QuCmxEqQ1BlWeuc6rzeRZZcMpK1azqcnnmJt+l1FJX2TQWWDSgbBxEV
 m1d2xZr94exLXyC/CQimfc7Z/B9aTVyZPBfOC2yVrnfz8QCIMslbv11t+DFwaf3WmZ
 B9HKL644BMxdsD1THm8lC+fk8TXATQn6Kub3YxLc=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 08/19] ppc/pnv: Simplify pnv_bmc_create()
Date: Wed, 10 Feb 2021 17:17:24 +1100
Message-Id: <20210210061735.304384-9-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210210061735.304384-1-david@gibson.dropbear.id.au>
References: <20210210061735.304384-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

and reuse pnv_bmc_set_pnor() to share the setting of the PNOR.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <20210126171059.307867-5-clg@kaod.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/pnv_bmc.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/hw/ppc/pnv_bmc.c b/hw/ppc/pnv_bmc.c
index 67ebb16c4d..86d16b4935 100644
--- a/hw/ppc/pnv_bmc.c
+++ b/hw/ppc/pnv_bmc.c
@@ -260,13 +260,8 @@ IPMIBmc *pnv_bmc_create(PnvPnor *pnor)
     Object *obj;
 
     obj = object_new(TYPE_IPMI_BMC_SIMULATOR);
-    object_ref(OBJECT(pnor));
-    object_property_add_const_link(obj, "pnor", OBJECT(pnor));
     qdev_realize(DEVICE(obj), NULL, &error_fatal);
-
-    /* Install the HIOMAP protocol handlers to access the PNOR */
-    ipmi_sim_register_netfn(IPMI_BMC_SIMULATOR(obj), IPMI_NETFN_OEM,
-                            &hiomap_netfn);
+    pnv_bmc_set_pnor(IPMI_BMC(obj), pnor);
 
     return IPMI_BMC(obj);
 }
-- 
2.29.2


