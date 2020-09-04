Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05C7B25D015
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Sep 2020 05:57:43 +0200 (CEST)
Received: from localhost ([::1]:44914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kE2r8-0003Z7-3X
	for lists+qemu-devel@lfdr.de; Thu, 03 Sep 2020 23:57:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kE2hW-0002WO-Rt; Thu, 03 Sep 2020 23:47:46 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:55029 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kE2hU-0004uo-4P; Thu, 03 Sep 2020 23:47:46 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4BjNsp2F2dz9sVf; Fri,  4 Sep 2020 13:47:26 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1599191246;
 bh=L+ql0mFkJJ6RIqHIX4UIYSGet1NsQYu3ApRmEert8Mg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=e+6hw/qNEs2FgLUaR8VnPIjq87TXgukaUkiSNLrIsF9PgiAFIHO7ystW7Mlo4jYGd
 X3oPEnB1WSgxk3AFVsMFKmW2avsdRDBQpPZVzBawCe/m4E4lf7k4cyWitRMV0BeBX8
 5ytxLEYYTLwNRGb0DHLKlfMkEdoK2U0WVBAoHUfg=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 07/30] spapr/xive: Use the xics flag to check for XIVE-only IRQ
 backends
Date: Fri,  4 Sep 2020 13:46:56 +1000
Message-Id: <20200904034719.673626-8-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200904034719.673626-1-david@gibson.dropbear.id.au>
References: <20200904034719.673626-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: danielhb413@gmail.com, qemu-devel@nongnu.org, groug@kaod.org,
 qemu-ppc@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 bauerman@linux.ibm.com, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Cédric Le Goater <clg@kaod.org>

The sPAPR machine has four different IRQ backends, each implementing
the XICS or XIVE interrupt mode or both in the case of the 'dual'
backend.

If a machine is started in P8 compat mode, QEMU should necessarily
support the XICS interrupt mode and in that case, the XIVE-only IRQ
backend is invalid. Currently, spapr_irq_check() tests the pointer
value to the IRQ backend to check for this condition, instead use the
'xics' flag. It's equivalent and it will ease the introduction of new
XIVE-only IRQ backends if needed.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <20200820140106.2357228-1-clg@kaod.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/spapr_irq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/ppc/spapr_irq.c b/hw/ppc/spapr_irq.c
index 72bb938375..f59960339e 100644
--- a/hw/ppc/spapr_irq.c
+++ b/hw/ppc/spapr_irq.c
@@ -172,7 +172,7 @@ static int spapr_irq_check(SpaprMachineState *spapr, Error **errp)
          * To cover both and not confuse the OS, add an early failure in
          * QEMU.
          */
-        if (spapr->irq == &spapr_irq_xive) {
+        if (!spapr->irq->xics) {
             error_setg(errp, "XIVE-only machines require a POWER9 CPU");
             return -1;
         }
-- 
2.26.2


