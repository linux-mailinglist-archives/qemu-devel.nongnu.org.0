Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5DC741D304
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 08:04:31 +0200 (CEST)
Received: from localhost ([::1]:33186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVpBG-0005ci-KT
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 02:04:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mVos9-00012C-Vt; Thu, 30 Sep 2021 01:44:46 -0400
Received: from gandalf.ozlabs.org ([2404:9400:2:0:216:3eff:fee2:21ea]:44903)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mVos4-0003Qg-Kn; Thu, 30 Sep 2021 01:44:45 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4HKhyR0Zpvz4xbX; Thu, 30 Sep 2021 15:44:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1632980671;
 bh=arwTfhg6v1PQHggBw8kAfRW4zT5ULa24cgyZ0nUkC2E=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=X51/sJA6f1Stnt9zn+kF/nZc1MFJOrPyZvdAvPpp6Uo8ReOpaCJcXOba/7DE4tBb1
 JKQPPmiozOiRJxJotgwHpIISkGiwPtCBddpHqMU/yM/LVuzzthpwhwiPQZsnzMRVCD
 ssoECHwdtKn09NVkzzZe/By4MyvvQwNmM5YrH7js=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 06/44] ppc/pnv: Add a comment on the "primary-topology-index"
 property
Date: Thu, 30 Sep 2021 15:43:48 +1000
Message-Id: <20210930054426.357344-7-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210930054426.357344-1-david@gibson.dropbear.id.au>
References: <20210930054426.357344-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2:0:216:3eff:fee2:21ea;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 SPF_PASS=-0.001, T_SPF_HELO_TEMPERROR=0.01 autolearn=no autolearn_force=no
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
Cc: mark.cave-ayland@ilande.co.uk, qemu-devel@nongnu.org, groug@kaod.org,
 hpoussin@reactos.org, clg@kaod.org, qemu-ppc@nongnu.org, philmd@redhat.com,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Cédric Le Goater <clg@kaod.org>

On P10, the chip id is calculated from the "Primary topology table
index". See skiboot commits for more information [1].

This information is extracted from the hdata on real systems which
QEMU needs to emulate. Add this property for all machines even if it
is only used on POWER10.

[1] https://github.com/open-power/skiboot/commit/2ce3f083f399
    https://github.com/open-power/skiboot/commit/a2d4d7f9e14a

Signed-off-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <20210901094153.227671-4-clg@kaod.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/pnv_xscom.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/ppc/pnv_xscom.c b/hw/ppc/pnv_xscom.c
index faa488e311..9ce018dbc2 100644
--- a/hw/ppc/pnv_xscom.c
+++ b/hw/ppc/pnv_xscom.c
@@ -284,6 +284,10 @@ int pnv_dt_xscom(PnvChip *chip, void *fdt, int root_offset,
     _FDT(xscom_offset);
     g_free(name);
     _FDT((fdt_setprop_cell(fdt, xscom_offset, "ibm,chip-id", chip->chip_id)));
+    /*
+     * On P10, the xscom bus id has been deprecated and the chip id is
+     * calculated from the "Primary topology table index". See skiboot.
+     */
     _FDT((fdt_setprop_cell(fdt, xscom_offset, "ibm,primary-topology-index",
                            chip->chip_id)));
     _FDT((fdt_setprop_cell(fdt, xscom_offset, "#address-cells", 1)));
-- 
2.31.1


