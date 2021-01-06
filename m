Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D00092EB8B1
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jan 2021 04:53:05 +0100 (CET)
Received: from localhost ([::1]:60290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwzse-0006tb-Te
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 22:53:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kwzer-0005pR-SV; Tue, 05 Jan 2021 22:38:49 -0500
Received: from ozlabs.org ([2401:3900:2:1::2]:56225)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kwzeq-0006M8-2j; Tue, 05 Jan 2021 22:38:49 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4D9ZpH2xQ6z9sWP; Wed,  6 Jan 2021 14:38:31 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1609904311;
 bh=1ICu7Dy0E2CqEKsjhRtSLgFtZSAlwOdBnbetZ9cN0Yc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WnlKnB3Ps+tcD2tw96wQmBFpmLzlWL2Ig5X6iwApkLNT6kVLOpH1Kc7vj8p86fnAK
 4+K0fLagCtuuykoqQbCAZwKMIxMMWP5GHLdEwwyfCPYpWaF/aTA2hswHR88G/OlvBa
 u1t2j+QlT09DutEWuDmyJ1SZdgp/Do2APY+p+j5U=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 13/22] spapr: Use spapr_drc_reset_all() at machine reset
Date: Wed,  6 Jan 2021 14:38:07 +1100
Message-Id: <20210106033816.232598-14-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210106033816.232598-1-david@gibson.dropbear.id.au>
References: <20210106033816.232598-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Greg Kurz <groug@kaod.org>

Documentation of object_child_foreach_recursive() clearly stipulates
that "it is forbidden to add or remove children from @obj from the @fn
callback". But this is exactly what we do during machine reset. The call
to spapr_drc_reset() can finalize the hot-unplug sequence of a PHB or a
PCI bridge, both of which will then in turn destroy their PCI DRCs. This
could potentially invalidate the iterator used by do_object_child_foreach().
It is pure luck that this haven't caused any issues so far.

Use spapr_drc_reset_all() since it can cope with DRC removal.

Signed-off-by: Greg Kurz <groug@kaod.org>
Message-Id: <20201218103400.689660-5-groug@kaod.org>
Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Tested-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/spapr.c | 15 +--------------
 1 file changed, 1 insertion(+), 14 deletions(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 9f89b1c298..2c403b574e 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -1566,19 +1566,6 @@ void spapr_setup_hpt(SpaprMachineState *spapr)
     }
 }
 
-static int spapr_reset_drcs(Object *child, void *opaque)
-{
-    SpaprDrc *drc =
-        (SpaprDrc *) object_dynamic_cast(child,
-                                                 TYPE_SPAPR_DR_CONNECTOR);
-
-    if (drc) {
-        spapr_drc_reset(drc);
-    }
-
-    return 0;
-}
-
 static void spapr_machine_reset(MachineState *machine)
 {
     SpaprMachineState *spapr = SPAPR_MACHINE(machine);
@@ -1633,7 +1620,7 @@ static void spapr_machine_reset(MachineState *machine)
      * will crash QEMU if the DIMM holding the vring goes away). To avoid such
      * situations, we reset DRCs after all devices have been reset.
      */
-    object_child_foreach_recursive(object_get_root(), spapr_reset_drcs, NULL);
+    spapr_drc_reset_all(spapr);
 
     spapr_clear_pending_events(spapr);
 
-- 
2.29.2


