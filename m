Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 904B93FEE9D
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 15:25:01 +0200 (CEST)
Received: from localhost ([::1]:38828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLmiC-0000tx-Ix
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 09:25:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mLmTP-0005ud-TM
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 09:09:43 -0400
Received: from 2.mo52.mail-out.ovh.net ([178.33.105.233]:42076)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mLmTL-0001xm-RR
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 09:09:43 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.48])
 by mo52.mail-out.ovh.net (Postfix) with ESMTPS id 71C15295ECF;
 Thu,  2 Sep 2021 15:09:38 +0200 (CEST)
Received: from kaod.org (37.59.142.101) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Thu, 2 Sep
 2021 15:09:36 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-101G00495fe6b5e-d002-4dac-b4db-7b7e8ed82878,
 0F69C8711EE098B745CC44F7BEC1CAFBB1DDDEDC) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
Subject: [PATCH v2 13/20] ppc/pnv: Add support for PQ offload on PHB5
Date: Thu, 2 Sep 2021 15:09:21 +0200
Message-ID: <20210902130928.528803-14-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210902130928.528803-1-clg@kaod.org>
References: <20210902130928.528803-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.101]
X-ClientProxiedBy: DAG5EX1.mxp5.local (172.16.2.41) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 37cd8b45-cb29-46b9-a303-476feb875f7c
X-Ovh-Tracer-Id: 14776310380851399587
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddruddvhedgieduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffojghfgggtgfhisehtkeertdertdejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepheehfeegjeeitdfffeetjeduveejueefuefgtdefueelueetveeliefhhffgtdelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopegtlhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=178.33.105.233; envelope-from=clg@kaod.org;
 helo=2.mo52.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The PQ_disable configuration bit disables the check done on the PQ
state bits when processing new MSI interrupts. When bit 9 is enabled,
the PHB forwards any MSI trigger to the XIVE interrupt controller
without checking the PQ state bits. The XIVE IC knows from the trigger
message that the PQ bits have not been checked and performs the check
locally.

This configuration bit only applies to MSIs and LSIs are still checked
on the PHB to handle the assertion level.

PQ_disable enablement is a requirement for StoreEOI.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 include/hw/pci-host/pnv_phb4_regs.h |  1 +
 include/hw/ppc/xive.h               |  1 +
 hw/intc/xive.c                      | 22 +++++++++++++++++++++-
 hw/pci-host/pnv_phb4.c              |  9 +++++++++
 4 files changed, 32 insertions(+), 1 deletion(-)

diff --git a/include/hw/pci-host/pnv_phb4_regs.h b/include/hw/pci-host/pnv_phb4_regs.h
index 55df2c3e5ece..64f326b7158e 100644
--- a/include/hw/pci-host/pnv_phb4_regs.h
+++ b/include/hw/pci-host/pnv_phb4_regs.h
@@ -225,6 +225,7 @@
 /* Fundamental register set B */
 #define PHB_VERSION                     0x800
 #define PHB_CTRLR                       0x810
+#define   PHB_CTRLR_IRQ_PQ_DISABLE      PPC_BIT(9)   /* P10 */
 #define   PHB_CTRLR_IRQ_PGSZ_64K        PPC_BIT(11)
 #define   PHB_CTRLR_IRQ_STORE_EOI       PPC_BIT(12)
 #define   PHB_CTRLR_MMIO_RD_STRICT      PPC_BIT(13)
diff --git a/include/hw/ppc/xive.h b/include/hw/ppc/xive.h
index fa77de7c0e6b..f5294001d3f7 100644
--- a/include/hw/ppc/xive.h
+++ b/include/hw/ppc/xive.h
@@ -176,6 +176,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(XiveSource, XIVE_SOURCE)
  */
 #define XIVE_SRC_H_INT_ESB     0x1 /* ESB managed with hcall H_INT_ESB */
 #define XIVE_SRC_STORE_EOI     0x2 /* Store EOI supported */
+#define XIVE_SRC_PQ_DISABLE    0x4 /* Disable check on the PQ state bits */
 
 struct XiveSource {
     DeviceState parent;
diff --git a/hw/intc/xive.c b/hw/intc/xive.c
index 6771f6b1d2ae..3a04dc803176 100644
--- a/hw/intc/xive.c
+++ b/hw/intc/xive.c
@@ -886,6 +886,16 @@ static bool xive_source_lsi_trigger(XiveSource *xsrc, uint32_t srcno)
     }
 }
 
+/*
+ * Sources can be configured with PQ offloading in which case the check
+ * on the PQ state bits of MSIs is disabled
+ */
+static bool xive_source_esb_disabled(XiveSource *xsrc, uint32_t srcno)
+{
+    return (xsrc->esb_flags & XIVE_SRC_PQ_DISABLE) &&
+        !xive_source_irq_is_lsi(xsrc, srcno);
+}
+
 /*
  * Returns whether the event notification should be forwarded.
  */
@@ -895,6 +905,10 @@ static bool xive_source_esb_trigger(XiveSource *xsrc, uint32_t srcno)
 
     assert(srcno < xsrc->nr_irqs);
 
+    if (xive_source_esb_disabled(xsrc, srcno)) {
+        return true;
+    }
+
     ret = xive_esb_trigger(&xsrc->status[srcno]);
 
     if (xive_source_irq_is_lsi(xsrc, srcno) &&
@@ -915,6 +929,11 @@ static bool xive_source_esb_eoi(XiveSource *xsrc, uint32_t srcno)
 
     assert(srcno < xsrc->nr_irqs);
 
+    if (xive_source_esb_disabled(xsrc, srcno)) {
+        qemu_log_mask(LOG_GUEST_ERROR, "XIVE: invalid EOI for IRQ %d\n", srcno);
+        return false;
+    }
+
     ret = xive_esb_eoi(&xsrc->status[srcno]);
 
     /*
@@ -936,9 +955,10 @@ static bool xive_source_esb_eoi(XiveSource *xsrc, uint32_t srcno)
 static void xive_source_notify(XiveSource *xsrc, int srcno)
 {
     XiveNotifierClass *xnc = XIVE_NOTIFIER_GET_CLASS(xsrc->xive);
+    bool pq_checked = !xive_source_esb_disabled(xsrc, srcno);
 
     if (xnc->notify) {
-        xnc->notify(xsrc->xive, srcno, true);
+        xnc->notify(xsrc->xive, srcno, pq_checked);
     }
 }
 
diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
index 3edd5845ebde..cf506d1623c3 100644
--- a/hw/pci-host/pnv_phb4.c
+++ b/hw/pci-host/pnv_phb4.c
@@ -475,6 +475,15 @@ static void pnv_phb4_update_xsrc(PnvPHB4 *phb)
         flags = 0;
     }
 
+    /*
+     * When the PQ disable configuration bit is set, the check on the
+     * PQ state bits is disabled on the PHB side (for MSI only) and it
+     * is performed on the IC side instead.
+     */
+    if (phb->regs[PHB_CTRLR >> 3] & PHB_CTRLR_IRQ_PQ_DISABLE) {
+        flags |= XIVE_SRC_PQ_DISABLE;
+    }
+
     phb->xsrc.esb_shift = shift;
     phb->xsrc.esb_flags = flags;
 
-- 
2.31.1


