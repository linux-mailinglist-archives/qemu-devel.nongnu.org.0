Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B80E3725F8
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 08:52:12 +0200 (CEST)
Received: from localhost ([::1]:52810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldouh-0007uH-Cd
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 02:52:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ldo11-0006jK-E9; Tue, 04 May 2021 01:54:39 -0400
Received: from ozlabs.org ([203.11.71.1]:56557)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ldo0z-0005MS-Ae; Tue, 04 May 2021 01:54:38 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FZ8CQ3FMvz9sVb; Tue,  4 May 2021 15:53:22 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1620107602;
 bh=qTTd1acHEOLOLfCLmBJ/7G0wh8ppvnqr7BiunJk5cBw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=KuXWazCA+HIwtktR57Act7U3z5Fm5dslu/f4x6xt+pufQ5u0FeeEbIBHfhJXAbgUo
 +94WUT+02G8ZVUhN+0fegWTYT+SgRNUYC2uiCnfgu0AKPVP6OlvhCeus3EYqOUMWf+
 0PISQbH4P2/+eyIkMY6kjRJHTq6D5vC/NyRtx/HM=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 44/46] hw/intc/spapr_xive: Use device_cold_reset() instead of
 device_legacy_reset()
Date: Tue,  4 May 2021 15:53:10 +1000
Message-Id: <20210504055312.306823-45-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210504055312.306823-1-david@gibson.dropbear.id.au>
References: <20210504055312.306823-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Maydell <peter.maydell@linaro.org>

The h_int_reset() function resets the XIVE interrupt controller via
device_legacy_reset().  We know that the interrupt controller does
not have a qbus of its own, so the new device_cold_reset() function
(which resets both the device and its child buses) is equivalent here
to device_legacy_reset() and we can just switch to the new API.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20210503151849.8766-2-peter.maydell@linaro.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/intc/spapr_xive.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/intc/spapr_xive.c b/hw/intc/spapr_xive.c
index 801bc19341..89cfa018f5 100644
--- a/hw/intc/spapr_xive.c
+++ b/hw/intc/spapr_xive.c
@@ -1798,7 +1798,7 @@ static target_ulong h_int_reset(PowerPCCPU *cpu,
         return H_PARAMETER;
     }
 
-    device_legacy_reset(DEVICE(xive));
+    device_cold_reset(DEVICE(xive));
 
     if (spapr_xive_in_kernel(xive)) {
         Error *local_err = NULL;
-- 
2.31.1


