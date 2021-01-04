Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FBED2EA0B3
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 00:26:24 +0100 (CET)
Received: from localhost ([::1]:36222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwZF1-0007n3-6m
	for lists+qemu-devel@lfdr.de; Mon, 04 Jan 2021 18:26:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kwZCA-00065p-MZ; Mon, 04 Jan 2021 18:23:26 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:55660)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kwZC7-0007yl-PB; Mon, 04 Jan 2021 18:23:25 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 95DE57470EE;
 Tue,  5 Jan 2021 00:23:20 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 116DF7470E0; Tue,  5 Jan 2021 00:23:20 +0100 (CET)
Message-Id: <49fd899c9767a5ed08905b7bbb2b19d0531cf7ec.1609802040.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1609802040.git.balaton@eik.bme.hu>
References: <cover.1609802040.git.balaton@eik.bme.hu>
Subject: [PATCH v4 1/4] ppc440_pcix: Improve comment for IRQ mapping
Date: Tue, 05 Jan 2021 00:14:00 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org,
    qemu-ppc@nongnu.org
X-Spam-Probability: 8%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, f4bug@amsat.org,
 Guenter Roeck <linux@roeck-us.net>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: BALATON Zoltan <balaton@eik.bme.hu>
From: BALATON Zoltan via <qemu-devel@nongnu.org>

The code mapping all PCI interrupts to a single CPU IRQ works but is
not trivial so document it in a comment.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/ppc/ppc440_pcix.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/hw/ppc/ppc440_pcix.c b/hw/ppc/ppc440_pcix.c
index ee952314c8..eb1290ffc8 100644
--- a/hw/ppc/ppc440_pcix.c
+++ b/hw/ppc/ppc440_pcix.c
@@ -415,8 +415,15 @@ static void ppc440_pcix_reset(DeviceState *dev)
     s->sts = 0;
 }
 
-/* All pins from each slot are tied to a single board IRQ.
- * This may need further refactoring for other boards. */
+/*
+ * All four IRQ[ABCD] pins from all slots are tied to a single board
+ * IRQ, so our mapping function here maps everything to IRQ 0.
+ * The code in pci_change_irq_level() tracks the number of times
+ * the mapped IRQ is asserted and deasserted, so if multiple devices
+ * assert an IRQ at the same time the behaviour is correct.
+ *
+ * This may need further refactoring for boards that use multiple IRQ lines.
+ */
 static int ppc440_pcix_map_irq(PCIDevice *pci_dev, int irq_num)
 {
     trace_ppc440_pcix_map_irq(pci_dev->devfn, irq_num, 0);
-- 
2.21.3


