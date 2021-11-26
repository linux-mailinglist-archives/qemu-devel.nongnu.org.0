Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C051745ED53
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Nov 2021 13:03:33 +0100 (CET)
Received: from localhost ([::1]:58580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqZwy-0000zt-JD
	for lists+qemu-devel@lfdr.de; Fri, 26 Nov 2021 07:03:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mqZnq-0003Ro-PN
 for qemu-devel@nongnu.org; Fri, 26 Nov 2021 06:54:08 -0500
Received: from smtpout2.mo529.mail-out.ovh.net ([79.137.123.220]:39201)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mqZnj-0007TO-2b
 for qemu-devel@nongnu.org; Fri, 26 Nov 2021 06:54:06 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.98])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 7C744CE26F09;
 Fri, 26 Nov 2021 12:53:57 +0100 (CET)
Received: from kaod.org (37.59.142.105) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Fri, 26 Nov
 2021 12:53:56 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-105G0069182db2c-3b1c-4620-948e-bf96c87a154a,
 B8303126CBA279BD35B7DF0844B381DDFAFB7782) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: <qemu-ppc@nongnu.org>, <qemu-devel@nongnu.org>
Subject: [PATCH v3 10/18] ppc/xive: Add support for PQ state bits offload
Date: Fri, 26 Nov 2021 12:53:41 +0100
Message-ID: <20211126115349.2737605-11-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211126115349.2737605-1-clg@kaod.org>
References: <20211126115349.2737605-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.105]
X-ClientProxiedBy: DAG1EX2.mxp5.local (172.16.2.2) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: b8ee750a-923a-4a5e-ac7f-efc470fdae3d
X-Ovh-Tracer-Id: 14615588167642614636
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrhedvgdefvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofgjfhggtgfgihesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeehheefgeejiedtffefteejudevjeeufeeugfdtfeeuleeuteevleeihffhgfdtleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtheenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopegtlhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=79.137.123.220; envelope-from=clg@kaod.org;
 helo=smtpout2.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, Greg Kurz <groug@kaod.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Frederic Barrat <fbarrat@linux.ibm.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The trigger message coming from a HW source contains a special bit
informing the XIVE interrupt controller that the PQ bits have been
checked at the source or not. Depending on the value, the IC can
perform the check and the state transition locally using its own PQ
state bits.

The following changes add new accessors to the XiveRouter required to
query and update the PQ state bits. This only applies to the PowerNV
machine. sPAPR accessors are provided but the pSeries machine should
not be concerned by such complex configuration for the moment.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 include/hw/ppc/xive.h  |  8 +++++--
 include/hw/ppc/xive2.h |  6 +++++-
 hw/intc/pnv_xive.c     | 37 +++++++++++++++++++++++++++++---
 hw/intc/pnv_xive2.c    | 37 +++++++++++++++++++++++++++++---
 hw/intc/spapr_xive.c   | 25 ++++++++++++++++++++++
 hw/intc/xive.c         | 48 ++++++++++++++++++++++++++++++++++++------
 hw/intc/xive2.c        | 42 +++++++++++++++++++++++++++++++++++-
 hw/pci-host/pnv_phb4.c |  9 ++++++--
 hw/ppc/pnv_psi.c       |  8 +++++--
 9 files changed, 199 insertions(+), 21 deletions(-)

diff --git a/include/hw/ppc/xive.h b/include/hw/ppc/xive.h
index 875c7f639689..649b58a08f0c 100644
--- a/include/hw/ppc/xive.h
+++ b/include/hw/ppc/xive.h
@@ -160,7 +160,7 @@ DECLARE_CLASS_CHECKERS(XiveNotifierClass, XIVE_NOTIFIER,
 
 struct XiveNotifierClass {
     InterfaceClass parent;
-    void (*notify)(XiveNotifier *xn, uint32_t lisn);
+    void (*notify)(XiveNotifier *xn, uint32_t lisn, bool pq_checked);
 };
 
 /*
@@ -386,6 +386,10 @@ struct XiveRouterClass {
     /* XIVE table accessors */
     int (*get_eas)(XiveRouter *xrtr, uint8_t eas_blk, uint32_t eas_idx,
                    XiveEAS *eas);
+    int (*get_pq)(XiveRouter *xrtr, uint8_t eas_blk, uint32_t eas_idx,
+                  uint8_t *pq);
+    int (*set_pq)(XiveRouter *xrtr, uint8_t eas_blk, uint32_t eas_idx,
+                  uint8_t *pq);
     int (*get_end)(XiveRouter *xrtr, uint8_t end_blk, uint32_t end_idx,
                    XiveEND *end);
     int (*write_end)(XiveRouter *xrtr, uint8_t end_blk, uint32_t end_idx,
@@ -407,7 +411,7 @@ int xive_router_get_nvt(XiveRouter *xrtr, uint8_t nvt_blk, uint32_t nvt_idx,
                         XiveNVT *nvt);
 int xive_router_write_nvt(XiveRouter *xrtr, uint8_t nvt_blk, uint32_t nvt_idx,
                           XiveNVT *nvt, uint8_t word_number);
-void xive_router_notify(XiveNotifier *xn, uint32_t lisn);
+void xive_router_notify(XiveNotifier *xn, uint32_t lisn, bool pq_checked);
 
 /*
  * XIVE Presenter
diff --git a/include/hw/ppc/xive2.h b/include/hw/ppc/xive2.h
index e881c039d9c0..9222b5b36979 100644
--- a/include/hw/ppc/xive2.h
+++ b/include/hw/ppc/xive2.h
@@ -31,6 +31,10 @@ typedef struct Xive2RouterClass {
     /* XIVE table accessors */
     int (*get_eas)(Xive2Router *xrtr, uint8_t eas_blk, uint32_t eas_idx,
                    Xive2Eas *eas);
+    int (*get_pq)(Xive2Router *xrtr, uint8_t eas_blk, uint32_t eas_idx,
+                  uint8_t *pq);
+    int (*set_pq)(Xive2Router *xrtr, uint8_t eas_blk, uint32_t eas_idx,
+                  uint8_t *pq);
     int (*get_end)(Xive2Router *xrtr, uint8_t end_blk, uint32_t end_idx,
                    Xive2End *end);
     int (*write_end)(Xive2Router *xrtr, uint8_t end_blk, uint32_t end_idx,
@@ -53,7 +57,7 @@ int xive2_router_get_nvp(Xive2Router *xrtr, uint8_t nvp_blk, uint32_t nvp_idx,
 int xive2_router_write_nvp(Xive2Router *xrtr, uint8_t nvp_blk, uint32_t nvp_idx,
                           Xive2Nvp *nvp, uint8_t word_number);
 
-void xive2_router_notify(XiveNotifier *xn, uint32_t lisn);
+void xive2_router_notify(XiveNotifier *xn, uint32_t lisn, bool pq_checked);
 
 /*
  * XIVE2 Presenter (POWER10)
diff --git a/hw/intc/pnv_xive.c b/hw/intc/pnv_xive.c
index ad43483612e5..5022f85350f4 100644
--- a/hw/intc/pnv_xive.c
+++ b/hw/intc/pnv_xive.c
@@ -393,6 +393,34 @@ static int pnv_xive_get_eas(XiveRouter *xrtr, uint8_t blk, uint32_t idx,
     return pnv_xive_vst_read(xive, VST_TSEL_IVT, blk, idx, eas);
 }
 
+static int pnv_xive_get_pq(XiveRouter *xrtr, uint8_t blk, uint32_t idx,
+                           uint8_t *pq)
+{
+    PnvXive *xive = PNV_XIVE(xrtr);
+
+    if (pnv_xive_block_id(xive) != blk) {
+        xive_error(xive, "VST: EAS %x is remote !?", XIVE_EAS(blk, idx));
+        return -1;
+    }
+
+    *pq = xive_source_esb_get(&xive->ipi_source, idx);
+    return 0;
+}
+
+static int pnv_xive_set_pq(XiveRouter *xrtr, uint8_t blk, uint32_t idx,
+                           uint8_t *pq)
+{
+    PnvXive *xive = PNV_XIVE(xrtr);
+
+    if (pnv_xive_block_id(xive) != blk) {
+        xive_error(xive, "VST: EAS %x is remote !?", XIVE_EAS(blk, idx));
+        return -1;
+    }
+
+    *pq = xive_source_esb_set(&xive->ipi_source, idx, *pq);
+    return 0;
+}
+
 /*
  * One bit per thread id. The first register PC_THREAD_EN_REG0 covers
  * the first cores 0-15 (normal) of the chip or 0-7 (fused). The
@@ -489,12 +517,12 @@ static PnvXive *pnv_xive_tm_get_xive(PowerPCCPU *cpu)
  * event notification to the Router. This is required on a multichip
  * system.
  */
-static void pnv_xive_notify(XiveNotifier *xn, uint32_t srcno)
+static void pnv_xive_notify(XiveNotifier *xn, uint32_t srcno, bool pq_checked)
 {
     PnvXive *xive = PNV_XIVE(xn);
     uint8_t blk = pnv_xive_block_id(xive);
 
-    xive_router_notify(xn, XIVE_EAS(blk, srcno));
+    xive_router_notify(xn, XIVE_EAS(blk, srcno), pq_checked);
 }
 
 /*
@@ -1336,7 +1364,8 @@ static void pnv_xive_ic_hw_trigger(PnvXive *xive, hwaddr addr, uint64_t val)
     blk = XIVE_EAS_BLOCK(val);
     idx = XIVE_EAS_INDEX(val);
 
-    xive_router_notify(XIVE_NOTIFIER(xive), XIVE_EAS(blk, idx));
+    xive_router_notify(XIVE_NOTIFIER(xive), XIVE_EAS(blk, idx),
+                       !!(val & XIVE_TRIGGER_PQ));
 }
 
 static void pnv_xive_ic_notify_write(void *opaque, hwaddr addr, uint64_t val,
@@ -1956,6 +1985,8 @@ static void pnv_xive_class_init(ObjectClass *klass, void *data)
     device_class_set_props(dc, pnv_xive_properties);
 
     xrc->get_eas = pnv_xive_get_eas;
+    xrc->get_pq = pnv_xive_get_pq;
+    xrc->set_pq = pnv_xive_set_pq;
     xrc->get_end = pnv_xive_get_end;
     xrc->write_end = pnv_xive_write_end;
     xrc->get_nvt = pnv_xive_get_nvt;
diff --git a/hw/intc/pnv_xive2.c b/hw/intc/pnv_xive2.c
index b9abd022cf08..186ab66e105d 100644
--- a/hw/intc/pnv_xive2.c
+++ b/hw/intc/pnv_xive2.c
@@ -284,6 +284,34 @@ static int pnv_xive2_vst_write(PnvXive2 *xive, uint32_t type, uint8_t blk,
     return 0;
 }
 
+static int pnv_xive2_get_pq(Xive2Router *xrtr, uint8_t blk, uint32_t idx,
+                             uint8_t *pq)
+{
+    PnvXive2 *xive = PNV_XIVE2(xrtr);
+
+    if (pnv_xive2_block_id(xive) != blk) {
+        xive2_error(xive, "VST: EAS %x is remote !?", XIVE_EAS(blk, idx));
+        return -1;
+    }
+
+    *pq = xive_source_esb_get(&xive->ipi_source, idx);
+    return 0;
+}
+
+static int pnv_xive2_set_pq(Xive2Router *xrtr, uint8_t blk, uint32_t idx,
+                             uint8_t *pq)
+{
+    PnvXive2 *xive = PNV_XIVE2(xrtr);
+
+    if (pnv_xive2_block_id(xive) != blk) {
+        xive2_error(xive, "VST: EAS %x is remote !?", XIVE_EAS(blk, idx));
+        return -1;
+    }
+
+    *pq = xive_source_esb_set(&xive->ipi_source, idx, *pq);
+    return 0;
+}
+
 static int pnv_xive2_get_end(Xive2Router *xrtr, uint8_t blk, uint32_t idx,
                              Xive2End *end)
 {
@@ -486,12 +514,12 @@ static PnvXive2 *pnv_xive2_tm_get_xive(PowerPCCPU *cpu)
  * source interrupt number before forwarding the source event
  * notification to the Router. This is required on a multichip system.
  */
-static void pnv_xive2_notify(XiveNotifier *xn, uint32_t srcno)
+static void pnv_xive2_notify(XiveNotifier *xn, uint32_t srcno, bool pq_checked)
 {
     PnvXive2 *xive = PNV_XIVE2(xn);
     uint8_t blk = pnv_xive2_block_id(xive);
 
-    xive2_router_notify(xn, XIVE_EAS(blk, srcno));
+    xive2_router_notify(xn, XIVE_EAS(blk, srcno), pq_checked);
 }
 
 /*
@@ -1380,7 +1408,8 @@ static void pnv_xive2_ic_hw_trigger(PnvXive2 *xive, hwaddr addr,
     blk = XIVE_EAS_BLOCK(val);
     idx = XIVE_EAS_INDEX(val);
 
-    xive2_router_notify(XIVE_NOTIFIER(xive), XIVE_EAS(blk, idx));
+    xive2_router_notify(XIVE_NOTIFIER(xive), XIVE_EAS(blk, idx),
+                         !!(val & XIVE_TRIGGER_PQ));
 }
 
 static void pnv_xive2_ic_notify_write(void *opaque, hwaddr offset,
@@ -1879,6 +1908,8 @@ static void pnv_xive2_class_init(ObjectClass *klass, void *data)
     device_class_set_props(dc, pnv_xive2_properties);
 
     xrc->get_eas   = pnv_xive2_get_eas;
+    xrc->get_pq    = pnv_xive2_get_pq;
+    xrc->set_pq    = pnv_xive2_set_pq;
     xrc->get_end   = pnv_xive2_get_end;
     xrc->write_end = pnv_xive2_write_end;
     xrc->get_nvp   = pnv_xive2_get_nvp;
diff --git a/hw/intc/spapr_xive.c b/hw/intc/spapr_xive.c
index 4ec659b93e13..9ea7c83f3cc3 100644
--- a/hw/intc/spapr_xive.c
+++ b/hw/intc/spapr_xive.c
@@ -480,6 +480,29 @@ static uint8_t spapr_xive_get_block_id(XiveRouter *xrtr)
     return SPAPR_XIVE_BLOCK_ID;
 }
 
+static int spapr_xive_get_pq(XiveRouter *xrtr, uint8_t blk, uint32_t idx,
+                             uint8_t *pq)
+{
+    SpaprXive *xive = SPAPR_XIVE(xrtr);
+
+    assert(SPAPR_XIVE_BLOCK_ID == blk);
+
+    *pq = xive_source_esb_get(&xive->source, idx);
+    return 0;
+}
+
+static int spapr_xive_set_pq(XiveRouter *xrtr, uint8_t blk, uint32_t idx,
+                             uint8_t *pq)
+{
+    SpaprXive *xive = SPAPR_XIVE(xrtr);
+
+    assert(SPAPR_XIVE_BLOCK_ID == blk);
+
+    *pq = xive_source_esb_set(&xive->source, idx, *pq);
+    return 0;
+}
+
+
 static const VMStateDescription vmstate_spapr_xive_end = {
     .name = TYPE_SPAPR_XIVE "/end",
     .version_id = 1,
@@ -788,6 +811,8 @@ static void spapr_xive_class_init(ObjectClass *klass, void *data)
     dc->vmsd    = &vmstate_spapr_xive;
 
     xrc->get_eas = spapr_xive_get_eas;
+    xrc->get_pq  = spapr_xive_get_pq;
+    xrc->set_pq  = spapr_xive_set_pq;
     xrc->get_end = spapr_xive_get_end;
     xrc->write_end = spapr_xive_write_end;
     xrc->get_nvt = spapr_xive_get_nvt;
diff --git a/hw/intc/xive.c b/hw/intc/xive.c
index 2c73ab5ca9d6..3cc439a84655 100644
--- a/hw/intc/xive.c
+++ b/hw/intc/xive.c
@@ -938,7 +938,7 @@ static void xive_source_notify(XiveSource *xsrc, int srcno)
     XiveNotifierClass *xnc = XIVE_NOTIFIER_GET_CLASS(xsrc->xive);
 
     if (xnc->notify) {
-        xnc->notify(xsrc->xive, srcno);
+        xnc->notify(xsrc->xive, srcno, true);
     }
 }
 
@@ -1369,6 +1369,24 @@ int xive_router_get_eas(XiveRouter *xrtr, uint8_t eas_blk, uint32_t eas_idx,
     return xrc->get_eas(xrtr, eas_blk, eas_idx, eas);
 }
 
+static
+int xive_router_get_pq(XiveRouter *xrtr, uint8_t eas_blk, uint32_t eas_idx,
+                       uint8_t *pq)
+{
+    XiveRouterClass *xrc = XIVE_ROUTER_GET_CLASS(xrtr);
+
+    return xrc->get_pq(xrtr, eas_blk, eas_idx, pq);
+}
+
+static
+int xive_router_set_pq(XiveRouter *xrtr, uint8_t eas_blk, uint32_t eas_idx,
+                       uint8_t *pq)
+{
+    XiveRouterClass *xrc = XIVE_ROUTER_GET_CLASS(xrtr);
+
+    return xrc->set_pq(xrtr, eas_blk, eas_idx, pq);
+}
+
 int xive_router_get_end(XiveRouter *xrtr, uint8_t end_blk, uint32_t end_idx,
                         XiveEND *end)
 {
@@ -1720,7 +1738,7 @@ do_escalation:
                            xive_get_field32(END_W5_ESC_END_DATA,  end.w5));
 }
 
-void xive_router_notify(XiveNotifier *xn, uint32_t lisn)
+void xive_router_notify(XiveNotifier *xn, uint32_t lisn, bool pq_checked)
 {
     XiveRouter *xrtr = XIVE_ROUTER(xn);
     uint8_t eas_blk = XIVE_EAS_BLOCK(lisn);
@@ -1733,11 +1751,27 @@ void xive_router_notify(XiveNotifier *xn, uint32_t lisn)
         return;
     }
 
-    /*
-     * The IVRE checks the State Bit Cache at this point. We skip the
-     * SBC lookup because the state bits of the sources are modeled
-     * internally in QEMU.
-     */
+    if (!pq_checked) {
+        bool notify;
+        uint8_t pq;
+
+        /* PQ cache lookup */
+        if (xive_router_get_pq(xrtr, eas_blk, eas_idx, &pq)) {
+            /* Set FIR */
+            g_assert_not_reached();
+        }
+
+        notify = xive_esb_trigger(&pq);
+
+        if (xive_router_set_pq(xrtr, eas_blk, eas_idx, &pq)) {
+            /* Set FIR */
+            g_assert_not_reached();
+        }
+
+        if (!notify) {
+            return;
+        }
+    }
 
     if (!xive_eas_is_valid(&eas)) {
         qemu_log_mask(LOG_GUEST_ERROR, "XIVE: invalid LISN %x\n", lisn);
diff --git a/hw/intc/xive2.c b/hw/intc/xive2.c
index d474476b5a55..26af08a5de07 100644
--- a/hw/intc/xive2.c
+++ b/hw/intc/xive2.c
@@ -170,6 +170,24 @@ int xive2_router_get_eas(Xive2Router *xrtr, uint8_t eas_blk, uint32_t eas_idx,
     return xrc->get_eas(xrtr, eas_blk, eas_idx, eas);
 }
 
+static
+int xive2_router_get_pq(Xive2Router *xrtr, uint8_t eas_blk, uint32_t eas_idx,
+                       uint8_t *pq)
+{
+    Xive2RouterClass *xrc = XIVE2_ROUTER_GET_CLASS(xrtr);
+
+    return xrc->get_pq(xrtr, eas_blk, eas_idx, pq);
+}
+
+static
+int xive2_router_set_pq(Xive2Router *xrtr, uint8_t eas_blk, uint32_t eas_idx,
+                       uint8_t *pq)
+{
+    Xive2RouterClass *xrc = XIVE2_ROUTER_GET_CLASS(xrtr);
+
+    return xrc->set_pq(xrtr, eas_blk, eas_idx, pq);
+}
+
 int xive2_router_get_end(Xive2Router *xrtr, uint8_t end_blk, uint32_t end_idx,
                          Xive2End *end)
 {
@@ -479,7 +497,7 @@ do_escalation:
                            xive_get_field32(END2_W5_ESC_END_DATA,  end.w5));
 }
 
-void xive2_router_notify(XiveNotifier *xn, uint32_t lisn)
+void xive2_router_notify(XiveNotifier *xn, uint32_t lisn, bool pq_checked)
 {
     Xive2Router *xrtr = XIVE2_ROUTER(xn);
     uint8_t eas_blk = XIVE_EAS_BLOCK(lisn);
@@ -492,6 +510,28 @@ void xive2_router_notify(XiveNotifier *xn, uint32_t lisn)
         return;
     }
 
+    if (!pq_checked) {
+        bool notify;
+        uint8_t pq;
+
+        /* PQ cache lookup */
+        if (xive2_router_get_pq(xrtr, eas_blk, eas_idx, &pq)) {
+            /* Set FIR */
+            g_assert_not_reached();
+        }
+
+        notify = xive_esb_trigger(&pq);
+
+        if (xive2_router_set_pq(xrtr, eas_blk, eas_idx, &pq)) {
+            /* Set FIR */
+            g_assert_not_reached();
+        }
+
+        if (!notify) {
+            return;
+        }
+    }
+
     if (!xive2_eas_is_valid(&eas)) {
         qemu_log_mask(LOG_GUEST_ERROR, "XIVE: Invalid LISN %x\n", lisn);
         return;
diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
index 5c375a9f285d..3edd5845ebde 100644
--- a/hw/pci-host/pnv_phb4.c
+++ b/hw/pci-host/pnv_phb4.c
@@ -1250,14 +1250,19 @@ static const char *pnv_phb4_root_bus_path(PCIHostState *host_bridge,
     return phb->bus_path;
 }
 
-static void pnv_phb4_xive_notify(XiveNotifier *xf, uint32_t srcno)
+static void pnv_phb4_xive_notify(XiveNotifier *xf, uint32_t srcno,
+                                 bool pq_checked)
 {
     PnvPHB4 *phb = PNV_PHB4(xf);
     uint64_t notif_port = phb->regs[PHB_INT_NOTIFY_ADDR >> 3];
     uint32_t offset = phb->regs[PHB_INT_NOTIFY_INDEX >> 3];
-    uint64_t data = XIVE_TRIGGER_PQ | offset | srcno;
+    uint64_t data = offset | srcno;
     MemTxResult result;
 
+    if (pq_checked) {
+        data |= XIVE_TRIGGER_PQ;
+    }
+
     trace_pnv_phb4_xive_notify(notif_port, data);
 
     address_space_stq_be(&address_space_memory, notif_port, data,
diff --git a/hw/ppc/pnv_psi.c b/hw/ppc/pnv_psi.c
index 737486046d5a..466fb7979887 100644
--- a/hw/ppc/pnv_psi.c
+++ b/hw/ppc/pnv_psi.c
@@ -653,7 +653,7 @@ static const TypeInfo pnv_psi_power8_info = {
 #define PSIHB10_ESB_CI_BASE              PSIHB9_ESB_CI_BASE
 #define   PSIHB10_ESB_CI_64K             PPC_BIT(1)
 
-static void pnv_psi_notify(XiveNotifier *xf, uint32_t srcno)
+static void pnv_psi_notify(XiveNotifier *xf, uint32_t srcno, bool pq_checked)
 {
     PnvPsi *psi = PNV_PSI(xf);
     uint64_t notif_port = psi->regs[PSIHB_REG(PSIHB9_ESB_NOTIF_ADDR)];
@@ -662,9 +662,13 @@ static void pnv_psi_notify(XiveNotifier *xf, uint32_t srcno)
 
     uint32_t offset =
         (psi->regs[PSIHB_REG(PSIHB9_IVT_OFFSET)] >> PSIHB9_IVT_OFF_SHIFT);
-    uint64_t data = XIVE_TRIGGER_PQ | offset | srcno;
+    uint64_t data = offset | srcno;
     MemTxResult result;
 
+    if (pq_checked) {
+        data |= XIVE_TRIGGER_PQ;
+    }
+
     if (!valid) {
         return;
     }
-- 
2.31.1


