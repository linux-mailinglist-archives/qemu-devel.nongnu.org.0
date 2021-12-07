Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7730946B76D
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Dec 2021 10:35:12 +0100 (CET)
Received: from localhost ([::1]:49076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muWsQ-0000hx-KP
	for lists+qemu-devel@lfdr.de; Tue, 07 Dec 2021 04:35:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1muWmj-0005H1-MG; Tue, 07 Dec 2021 04:29:17 -0500
Received: from beetle.greensocs.com ([5.135.226.135]:35466)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1muWmh-0008NJ-CD; Tue, 07 Dec 2021 04:29:17 -0500
Received: from crumble.bar.greensocs.com (unknown [172.17.10.6])
 by beetle.greensocs.com (Postfix) with ESMTPS id C769120775;
 Tue,  7 Dec 2021 09:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1638869350;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=q+wsgEKYHH0GZAcD6mbppeicxI3uNfV0UmrKJ4XSx78=;
 b=sazD7xCBpLFcRsyFWiBO6YtzC+1RjhIHeH1SQwrrYfVALWVgQFCxfNh3KP0NXXWKg5dKNN
 je1rkjhEMUcOUZsK5l4OdGDUA/lOIldBAJL8PUroUmt26GojtohbH+DKwSHqcN1G6jayTj
 wAEY3HhQK3lw/XaqsiEby1+PeVHkgks=
From: Damien Hedde <damien.hedde@greensocs.com>
To: qemu-devel@nongnu.org
Subject: 
Date: Tue,  7 Dec 2021 10:29:09 +0100
Message-Id: <20211207092909.2933-1-damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.34.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=damien.hedde@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Peter Maydell <peter.maydell@linaro.org>, shashi.mallela@linaro.org,
 qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Subject: [PATCH for 6.2?] gicv3: fix ICH_MISR's LRENP computation

According to the "Arm Generic Interrupt Controller Architecture
Specification GIC architecture version 3 and 4" (version G: page 345
for aarch64 or 509 for aarch32):
LRENP bit of ICH_MISR is set when ICH_HCR.LRENPIE==1 and
ICH_HCR.EOIcount is non-zero.

When only LRENPIE was set (and EOI count was zero), the LRENP bit was
wrongly set and MISR value was wrong.

As an additional consequence, if an hypervisor set ICH_HCR.LRENPIE,
the maintenance interrupt was constantly fired. It happens since patch
9cee1efe92 ("hw/intc: Set GIC maintenance interrupt level to only 0 or 1")
which fixed another bug about maintenance interrupt (most significant
bits of misr, including this one, were ignored in the interrupt trigger).

Fixes: 83f036fe3d ("hw/intc/arm_gicv3: Add accessors for ICH_ system registers")
Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
---
The gic doc is available here:
https://developer.arm.com/documentation/ihi0069/g
---
 hw/intc/arm_gicv3_cpuif.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
index 7fba931450..85fc369e55 100644
--- a/hw/intc/arm_gicv3_cpuif.c
+++ b/hw/intc/arm_gicv3_cpuif.c
@@ -351,7 +351,8 @@ static uint32_t maintenance_interrupt_state(GICv3CPUState *cs)
     /* Scan list registers and fill in the U, NP and EOI bits */
     eoi_maintenance_interrupt_state(cs, &value);
 
-    if (cs->ich_hcr_el2 & (ICH_HCR_EL2_LRENPIE | ICH_HCR_EL2_EOICOUNT_MASK)) {
+    if ((cs->ich_hcr_el2 & ICH_HCR_EL2_LRENPIE) &&
+        (cs->ich_hcr_el2 & ICH_HCR_EL2_EOICOUNT_MASK)) {
         value |= ICH_MISR_EL2_LRENP;
     }
 
-- 
2.34.0


