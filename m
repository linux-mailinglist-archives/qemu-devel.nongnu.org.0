Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 282743FEED9
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 15:40:42 +0200 (CEST)
Received: from localhost ([::1]:53920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLmxN-0005sr-8u
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 09:40:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mLmTh-0006uV-Lg
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 09:10:01 -0400
Received: from 8.mo52.mail-out.ovh.net ([46.105.37.156]:40363)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mLmTW-00029m-F0
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 09:10:01 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.48])
 by mo52.mail-out.ovh.net (Postfix) with ESMTPS id 96323295EB4;
 Thu,  2 Sep 2021 15:09:38 +0200 (CEST)
Received: from kaod.org (37.59.142.101) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Thu, 2 Sep
 2021 15:09:36 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-101G00496daaba9-c6ab-4a9f-9831-8c0b8bf64dd7,
 0F69C8711EE098B745CC44F7BEC1CAFBB1DDDEDC) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
Subject: [PATCH v2 14/20] ppc/pnv: Add support for PHB5 "Address-based
 trigger" mode
Date: Thu, 2 Sep 2021 15:09:22 +0200
Message-ID: <20210902130928.528803-15-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210902130928.528803-1-clg@kaod.org>
References: <20210902130928.528803-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.101]
X-ClientProxiedBy: DAG5EX1.mxp5.local (172.16.2.41) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: b841be7a-9120-4833-86eb-d0090c21b93e
X-Ovh-Tracer-Id: 14776310380422532003
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddruddvhedgieduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffojghfgggtgfhisehtkeertdertdejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepheehfeegjeeitdfffeetjeduveejueefuefgtdefueelueetveeliefhhffgtdelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopegtlhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=46.105.37.156; envelope-from=clg@kaod.org;
 helo=8.mo52.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

When the Address-Based Interrupt Trigger mode is activated, the PHB
maps the interrupt source number into the interrupt command address.
The PHB directly triggers the IC ESB page of the interrupt number and
not the notify page of the IC anymore.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 include/hw/pci-host/pnv_phb4_regs.h |  2 +
 hw/pci-host/pnv_phb4.c              | 73 ++++++++++++++++++++++++++---
 hw/pci-host/trace-events            |  2 +
 3 files changed, 71 insertions(+), 6 deletions(-)

diff --git a/include/hw/pci-host/pnv_phb4_regs.h b/include/hw/pci-host/pnv_phb4_regs.h
index 64f326b7158e..4a0d3b28efb3 100644
--- a/include/hw/pci-host/pnv_phb4_regs.h
+++ b/include/hw/pci-host/pnv_phb4_regs.h
@@ -220,12 +220,14 @@
 #define   PHB_PAPR_ERR_INJ_MASK_MMIO            PPC_BITMASK(16, 63)
 #define PHB_ETU_ERR_SUMMARY             0x2c8
 #define PHB_INT_NOTIFY_ADDR             0x300
+#define   PHB_INT_NOTIFY_ADDR_64K       PPC_BIT(1)   /* P10 */
 #define PHB_INT_NOTIFY_INDEX            0x308
 
 /* Fundamental register set B */
 #define PHB_VERSION                     0x800
 #define PHB_CTRLR                       0x810
 #define   PHB_CTRLR_IRQ_PQ_DISABLE      PPC_BIT(9)   /* P10 */
+#define   PHB_CTRLR_IRQ_ABT_MODE        PPC_BIT(10)  /* P10 */
 #define   PHB_CTRLR_IRQ_PGSZ_64K        PPC_BIT(11)
 #define   PHB_CTRLR_IRQ_STORE_EOI       PPC_BIT(12)
 #define   PHB_CTRLR_MMIO_RD_STRICT      PPC_BIT(13)
diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
index cf506d1623c3..353ce6617743 100644
--- a/hw/pci-host/pnv_phb4.c
+++ b/hw/pci-host/pnv_phb4.c
@@ -1259,10 +1259,54 @@ static const char *pnv_phb4_root_bus_path(PCIHostState *host_bridge,
     return phb->bus_path;
 }
 
-static void pnv_phb4_xive_notify(XiveNotifier *xf, uint32_t srcno,
-                                 bool pq_checked)
+/*
+ * Address base trigger mode (POWER10)
+ *
+ * Trigger directly the IC ESB page
+ */
+static void pnv_phb4_xive_notify_abt(PnvPHB4 *phb, uint32_t srcno,
+                                     bool pq_checked)
+{
+    uint64_t notif_port = phb->regs[PHB_INT_NOTIFY_ADDR >> 3];
+    uint64_t data = 0; /* trigger data : don't care */
+    hwaddr addr;
+    MemTxResult result;
+    int esb_shift;
+
+    if (notif_port & PHB_INT_NOTIFY_ADDR_64K) {
+        esb_shift = 16;
+    } else {
+        esb_shift = 12;
+    }
+
+    /* Compute the address of the IC ESB management page */
+    addr = (notif_port & ~PHB_INT_NOTIFY_ADDR_64K);
+    addr |= (1ull << (esb_shift + 1)) * srcno;
+    addr |= (1ull << esb_shift);
+
+    /*
+     * When the PQ state bits are checked on the PHB, the associated
+     * PQ state bits on the IC should be ignored. Use the unconditional
+     * trigger offset to inject a trigger on the IC. This is always
+     * the case for LSIs
+     */
+    if (pq_checked) {
+        addr |= XIVE_ESB_INJECT;
+    }
+
+    trace_pnv_phb4_xive_notify_ic(addr, data);
+
+    address_space_stq_be(&address_space_memory, addr, data,
+                         MEMTXATTRS_UNSPECIFIED, &result);
+    if (result != MEMTX_OK) {
+        phb_error(phb, "trigger failed @%"HWADDR_PRIx "\n", addr);
+        return;
+    }
+}
+
+static void pnv_phb4_xive_notify_ic(PnvPHB4 *phb, uint32_t srcno,
+                                    bool pq_checked)
 {
-    PnvPHB4 *phb = PNV_PHB4(xf);
     uint64_t notif_port = phb->regs[PHB_INT_NOTIFY_ADDR >> 3];
     uint32_t offset = phb->regs[PHB_INT_NOTIFY_INDEX >> 3];
     uint64_t data = offset | srcno;
@@ -1272,7 +1316,7 @@ static void pnv_phb4_xive_notify(XiveNotifier *xf, uint32_t srcno,
         data |= XIVE_TRIGGER_PQ;
     }
 
-    trace_pnv_phb4_xive_notify(notif_port, data);
+    trace_pnv_phb4_xive_notify_ic(notif_port, data);
 
     address_space_stq_be(&address_space_memory, notif_port, data,
                          MEMTXATTRS_UNSPECIFIED, &result);
@@ -1282,6 +1326,18 @@ static void pnv_phb4_xive_notify(XiveNotifier *xf, uint32_t srcno,
     }
 }
 
+static void pnv_phb4_xive_notify(XiveNotifier *xf, uint32_t srcno,
+                                 bool pq_checked)
+{
+    PnvPHB4 *phb = PNV_PHB4(xf);
+
+    if (phb->regs[PHB_CTRLR >> 3] & PHB_CTRLR_IRQ_ABT_MODE) {
+        pnv_phb4_xive_notify_abt(phb, srcno, pq_checked);
+    } else {
+        pnv_phb4_xive_notify_ic(phb, srcno, pq_checked);
+    }
+}
+
 static Property pnv_phb4_properties[] = {
         DEFINE_PROP_UINT32("index", PnvPHB4, phb_id, 0),
         DEFINE_PROP_UINT32("chip-id", PnvPHB4, chip_id, 0),
@@ -1442,10 +1498,15 @@ void pnv_phb4_update_regions(PnvPhb4PecStack *stack)
 
 void pnv_phb4_pic_print_info(PnvPHB4 *phb, Monitor *mon)
 {
+    uint64_t notif_port =
+        phb->regs[PHB_INT_NOTIFY_ADDR >> 3] & ~PHB_INT_NOTIFY_ADDR_64K;
     uint32_t offset = phb->regs[PHB_INT_NOTIFY_INDEX >> 3];
+    bool abt = !!(phb->regs[PHB_CTRLR >> 3] & PHB_CTRLR_IRQ_ABT_MODE);
 
-    monitor_printf(mon, "PHB4[%x:%x] Source %08x .. %08x\n",
+    monitor_printf(mon, "PHB4[%x:%x] Source %08x .. %08x %s @%"HWADDR_PRIx"\n",
                    phb->chip_id, phb->phb_id,
-                   offset, offset + phb->xsrc.nr_irqs - 1);
+                   offset, offset + phb->xsrc.nr_irqs - 1,
+                   abt ? "ABT" : "",
+                   notif_port);
     xive_source_pic_print_info(&phb->xsrc, 0, mon);
 }
diff --git a/hw/pci-host/trace-events b/hw/pci-host/trace-events
index 630e9fcc5e77..6e5d8d335525 100644
--- a/hw/pci-host/trace-events
+++ b/hw/pci-host/trace-events
@@ -32,3 +32,5 @@ unin_read(uint64_t addr, uint64_t value) "addr=0x%" PRIx64 " val=0x%"PRIx64
 
 # pnv_phb4.c
 pnv_phb4_xive_notify(uint64_t notif_port, uint64_t data) "notif=@0x%"PRIx64" data=0x%"PRIx64
+pnv_phb4_xive_notify_ic(uint64_t addr, uint64_t data) "addr=@0x%"PRIx64" data=0x%"PRIx64
+pnv_phb4_xive_notify_abt(uint64_t notif_port, uint64_t data) "notif=@0x%"PRIx64" data=0x%"PRIx64
-- 
2.31.1


