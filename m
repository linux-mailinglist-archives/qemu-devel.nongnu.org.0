Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AE7A511039
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 06:38:14 +0200 (CEST)
Received: from localhost ([::1]:47096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njZRN-0000Te-7E
	for lists+qemu-devel@lfdr.de; Wed, 27 Apr 2022 00:38:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>)
 id 1njZQC-00083w-My; Wed, 27 Apr 2022 00:37:00 -0400
Received: from ozlabs.ru ([107.174.27.60]:58160)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aik@ozlabs.ru>)
 id 1njZQA-0007Fc-IR; Wed, 27 Apr 2022 00:37:00 -0400
Received: from fstn1-p1.ozlabs.ibm.com. (localhost [IPv6:::1])
 by ozlabs.ru (Postfix) with ESMTP id 157A480517;
 Wed, 27 Apr 2022 00:36:52 -0400 (EDT)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: qemu-ppc@nongnu.org
Subject: [PATCH qemu] spapr_pci: Disable IRQFD resampling on XIVE
Date: Wed, 27 Apr 2022 14:36:51 +1000
Message-Id: <20220427043651.1162403-1-aik@ozlabs.ru>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=107.174.27.60; envelope-from=aik@ozlabs.ru;
 helo=ozlabs.ru
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Alex Williamson <alex.williamson@redhat.com>,
 Alexey Kardashevskiy <aik@ozlabs.ru>, qemu-devel@nongnu.org,
 Timothy Pearson <tpearson@raptorengineering.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Frederic Barrat <fbarrat@linux.ibm.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

VFIO-PCI has an "KVM_IRQFD_FLAG_RESAMPLE" optimization for INTx EOI
handling when KVM can unmask PCI INTx (level triggered interrupt) without
switching to the userspace (==QEMU).

Unfortunately XIVE does not support level interrupts, QEMU emulates them
and therefore there is no existing code path to kick the resamplefd.
The problem appears when passing through a PCI adapter with
the "pci=nomsi" kernel parameter - the adapter's interrupt interrupt
count in /proc/interrupts will stuck at "1".

This disables resampler when the XIVE interrupt controller is configured.
This should not be very visible though KVM already exits to QEMU for INTx
and XIVE-capable boxes (POWER9 and newer) do not seem to have
performance-critical INTx-only capable devices.

Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---


Cédric, this is what I meant when I said that spapr_pci.c was unaware of
the interrupt controller type, neither xics nor xive was mentioned
in the file before.


---
 hw/ppc/spapr_pci.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/hw/ppc/spapr_pci.c b/hw/ppc/spapr_pci.c
index 5bfd4aa9e5aa..2675052601db 100644
--- a/hw/ppc/spapr_pci.c
+++ b/hw/ppc/spapr_pci.c
@@ -729,11 +729,19 @@ static void pci_spapr_set_irq(void *opaque, int irq_num, int level)
 
 static PCIINTxRoute spapr_route_intx_pin_to_irq(void *opaque, int pin)
 {
+    SpaprMachineState *spapr = SPAPR_MACHINE(qdev_get_machine());
     SpaprPhbState *sphb = SPAPR_PCI_HOST_BRIDGE(opaque);
-    PCIINTxRoute route;
+    PCIINTxRoute route = { .mode = PCI_INTX_DISABLED };
 
-    route.mode = PCI_INTX_ENABLED;
-    route.irq = sphb->lsi_table[pin].irq;
+    /*
+     * Disable IRQFD resampler on XIVE as it does not support LSI and QEMU
+     * emulates those so the KVM kernel resamplefd kick is skipped and EOI
+     * is not delivered to VFIO-PCI.
+     */
+    if (!spapr->xive) {
+        route.mode = PCI_INTX_ENABLED;
+        route.irq = sphb->lsi_table[pin].irq;
+    }
 
     return route;
 }
-- 
2.30.2


