Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18FC641D37A
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 08:35:13 +0200 (CEST)
Received: from localhost ([::1]:34246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVpex-0004C1-V1
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 02:35:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mVoss-00021o-PU; Thu, 30 Sep 2021 01:45:32 -0400
Received: from gandalf.ozlabs.org ([2404:9400:2:0:216:3eff:fee2:21ea]:40713)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mVosg-000400-Ec; Thu, 30 Sep 2021 01:45:29 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4HKhyR3ksDz4xc5; Thu, 30 Sep 2021 15:44:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1632980671;
 bh=tEV66u/ER4tbPfc0Fs+aJ16ZrVhBFtkocO5b7T2c9Qg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=c5wklyMePusL8KHALEpdlJF+wKDuD5SurcthgP0iCIrvCFSS1DkMDvGmXcjWAsiSn
 Ws+jWIvmg4M3y7mQtnRJGKX+FfUDezBRtnzW7CivMcSSB4mnOimkARykl6lQ4N1wxs
 Vr/QrD98hH+YL2s6s08vdMt6enIKUo+dDeGRHvxM=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 34/44] hw/intc: openpic: Correct the reset value of IPIDR for
 FSL chipset
Date: Thu, 30 Sep 2021 15:44:16 +1000
Message-Id: <20210930054426.357344-35-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210930054426.357344-1-david@gibson.dropbear.id.au>
References: <20210930054426.357344-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2:0:216:3eff:fee2:21ea;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
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
Cc: Bin Meng <bmeng.cn@gmail.com>, Bin Meng <bin.meng@windriver.com>,
 mark.cave-ayland@ilande.co.uk, qemu-devel@nongnu.org, groug@kaod.org,
 hpoussin@reactos.org, clg@kaod.org, qemu-ppc@nongnu.org, philmd@redhat.com,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bmeng.cn@gmail.com>

The reset value of IPIDR should be zero for Freescale chipset, per
the following 2 manuals I checked:

- P2020RM (https://www.nxp.com/webapp/Download?colCode=P2020RM)
- P4080RM (https://www.nxp.com/webapp/Download?colCode=P4080RM)

Currently it is set to 1, which leaves the IPI enabled on core 0
after power-on reset. Such may cause unexpected interrupt to be
delivered to core 0 if the IPI is triggered from core 0 to other
cores later.

Fixes: ffd5e9fe0276 ("openpic: Reset IRQ source private members")
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/584
Signed-off-by: Bin Meng <bin.meng@windriver.com>
Message-Id: <20210918032653.646370-1-bin.meng@windriver.com>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/intc/openpic.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/hw/intc/openpic.c b/hw/intc/openpic.c
index 9b4c17854d..2790c6710a 100644
--- a/hw/intc/openpic.c
+++ b/hw/intc/openpic.c
@@ -1276,6 +1276,15 @@ static void openpic_reset(DeviceState *d)
             break;
         }
 
+        /* Mask all IPI interrupts for Freescale OpenPIC */
+        if ((opp->model == OPENPIC_MODEL_FSL_MPIC_20) ||
+            (opp->model == OPENPIC_MODEL_FSL_MPIC_42)) {
+            if (i >= opp->irq_ipi0 && i < opp->irq_tim0) {
+                write_IRQreg_idr(opp, i, 0);
+                continue;
+            }
+        }
+
         write_IRQreg_idr(opp, i, opp->idr_reset);
     }
     /* Initialise IRQ destinations */
-- 
2.31.1


