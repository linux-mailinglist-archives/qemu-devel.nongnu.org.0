Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 253E845ED87
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Nov 2021 13:08:28 +0100 (CET)
Received: from localhost ([::1]:39838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqa1j-0007vk-76
	for lists+qemu-devel@lfdr.de; Fri, 26 Nov 2021 07:08:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mqZnr-0003S6-12
 for qemu-devel@nongnu.org; Fri, 26 Nov 2021 06:54:08 -0500
Received: from 1.mo548.mail-out.ovh.net ([178.32.121.110]:39579)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mqZnk-0007To-Kb
 for qemu-devel@nongnu.org; Fri, 26 Nov 2021 06:54:06 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.72])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 6E9A62058F;
 Fri, 26 Nov 2021 11:53:59 +0000 (UTC)
Received: from kaod.org (37.59.142.105) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Fri, 26 Nov
 2021 12:53:57 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-105G0066f68db99-bbb0-4c3e-bf72-7501addb8a16,
 B8303126CBA279BD35B7DF0844B381DDFAFB7782) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: <qemu-ppc@nongnu.org>, <qemu-devel@nongnu.org>
Subject: [PATCH v3 11/18] ppc/pnv: Add support for PQ offload on PHB5
Date: Fri, 26 Nov 2021 12:53:42 +0100
Message-ID: <20211126115349.2737605-12-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211126115349.2737605-1-clg@kaod.org>
References: <20211126115349.2737605-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.105]
X-ClientProxiedBy: DAG1EX2.mxp5.local (172.16.2.2) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 4502c139-47f2-4b23-9f96-0802032878d1
X-Ovh-Tracer-Id: 14616151117569624940
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrhedvgdefvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofgjfhggtgfgihesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeehheefgeejiedtffefteejudevjeeufeeugfdtfeeuleeuteevleeihffhgfdtleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtheenucevlhhushhtvghrufhiiigvpeegnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopegtlhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=178.32.121.110; envelope-from=clg@kaod.org;
 helo=1.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, Greg Kurz <groug@kaod.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Frederic Barrat <fbarrat@linux.ibm.com>,
 David Gibson <david@gibson.dropbear.id.au>
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
index 649b58a08f0c..126e4e2c3a17 100644
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
index 3cc439a84655..4f3d67f246b5 100644
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


