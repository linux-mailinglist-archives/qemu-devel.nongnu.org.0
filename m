Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8788F4665A3
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Dec 2021 15:44:35 +0100 (CET)
Received: from localhost ([::1]:46578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msnK6-0004TP-L6
	for lists+qemu-devel@lfdr.de; Thu, 02 Dec 2021 09:44:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1msnIL-0000PL-0v; Thu, 02 Dec 2021 09:42:45 -0500
Received: from 1.mo548.mail-out.ovh.net ([178.32.121.110]:36967)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1msnIH-0005Ex-5I; Thu, 02 Dec 2021 09:42:44 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.21])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id E6A2F20150;
 Thu,  2 Dec 2021 14:42:38 +0000 (UTC)
Received: from kaod.org (37.59.142.95) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Thu, 2 Dec
 2021 15:42:38 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G0019997a271-f489-41ce-823a-ec629069c59c,
 53AF7497412F6E71185D8D05EFDE7032E43CC10F) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: <qemu-ppc@nongnu.org>, <qemu-devel@nongnu.org>
Subject: [PATCH 03/14] ppc/pnv: Move mapping of the PHB3 CQ regions under
 pnv_pbcq_realize()
Date: Thu, 2 Dec 2021 15:42:24 +0100
Message-ID: <20211202144235.1276352-4-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211202144235.1276352-1-clg@kaod.org>
References: <20211202144235.1276352-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG3EX1.mxp5.local (172.16.2.21) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 91896406-4726-455b-afad-9abf0772fa54
X-Ovh-Tracer-Id: 15807071742924524326
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrieehgdeijecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofgjfhggtgfgihesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeehheefgeejiedtffefteejudevjeeufeeugfdtfeeuleeuteevleeihffhgfdtleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheptghlgheskhgrohgurdhorhhg
Received-SPF: pass client-ip=178.32.121.110; envelope-from=clg@kaod.org;
 helo=1.mo548.mail-out.ovh.net
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
Cc: Frederic Barrat <fbarrat@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, Greg Kurz <groug@kaod.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This requires a link to the chip to add the regions under the XSCOM
address space. This change will help us providing support for user
created PHB3 devices.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 include/hw/pci-host/pnv_phb3.h |  3 +++
 hw/pci-host/pnv_phb3.c         |  1 +
 hw/pci-host/pnv_phb3_pbcq.c    | 11 +++++++++++
 hw/ppc/pnv.c                   | 14 ++------------
 4 files changed, 17 insertions(+), 12 deletions(-)

diff --git a/include/hw/pci-host/pnv_phb3.h b/include/hw/pci-host/pnv_phb3.h
index e2a2e3624532..e9c13e6bd821 100644
--- a/include/hw/pci-host/pnv_phb3.h
+++ b/include/hw/pci-host/pnv_phb3.h
@@ -16,6 +16,7 @@
 #include "qom/object.h"
 
 typedef struct PnvPHB3 PnvPHB3;
+typedef struct PnvChip PnvChip;
 
 /*
  * PHB3 XICS Source for MSIs
@@ -157,6 +158,8 @@ struct PnvPHB3 {
     PnvPHB3RootPort root;
 
     QLIST_HEAD(, PnvPhb3DMASpace) dma_spaces;
+
+    PnvChip *chip;
 };
 
 uint64_t pnv_phb3_reg_read(void *opaque, hwaddr off, unsigned size);
diff --git a/hw/pci-host/pnv_phb3.c b/hw/pci-host/pnv_phb3.c
index a7f96850055a..3aa42ef9d4b9 100644
--- a/hw/pci-host/pnv_phb3.c
+++ b/hw/pci-host/pnv_phb3.c
@@ -1092,6 +1092,7 @@ static const char *pnv_phb3_root_bus_path(PCIHostState *host_bridge,
 static Property pnv_phb3_properties[] = {
         DEFINE_PROP_UINT32("index", PnvPHB3, phb_id, 0),
         DEFINE_PROP_UINT32("chip-id", PnvPHB3, chip_id, 0),
+        DEFINE_PROP_LINK("chip", PnvPHB3, chip, TYPE_PNV_CHIP, PnvChip *),
         DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/hw/pci-host/pnv_phb3_pbcq.c b/hw/pci-host/pnv_phb3_pbcq.c
index a0526aa1eca3..c7426cd27a20 100644
--- a/hw/pci-host/pnv_phb3_pbcq.c
+++ b/hw/pci-host/pnv_phb3_pbcq.c
@@ -284,6 +284,17 @@ static void pnv_pbcq_realize(DeviceState *dev, Error **errp)
     pnv_xscom_region_init(&pbcq->xscom_spci_regs, OBJECT(dev),
                           &pnv_pbcq_spci_xscom_ops, pbcq, name,
                           PNV_XSCOM_PBCQ_SPCI_SIZE);
+
+    /* Populate the XSCOM address space. */
+    pnv_xscom_add_subregion(phb->chip,
+                            PNV_XSCOM_PBCQ_NEST_BASE + 0x400 * phb->phb_id,
+                            &pbcq->xscom_nest_regs);
+    pnv_xscom_add_subregion(phb->chip,
+                            PNV_XSCOM_PBCQ_PCI_BASE + 0x400 * phb->phb_id,
+                            &pbcq->xscom_pci_regs);
+    pnv_xscom_add_subregion(phb->chip,
+                            PNV_XSCOM_PBCQ_SPCI_BASE + 0x040 * phb->phb_id,
+                            &pbcq->xscom_spci_regs);
 }
 
 static int pnv_pbcq_dt_xscom(PnvXScomInterface *dev, void *fdt,
diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index 988b305398b2..de277c457838 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -1221,25 +1221,15 @@ static void pnv_chip_power8_realize(DeviceState *dev, Error **errp)
     /* PHB3 controllers */
     for (i = 0; i < chip->num_phbs; i++) {
         PnvPHB3 *phb = &chip8->phbs[i];
-        PnvPBCQState *pbcq = &phb->pbcq;
 
         object_property_set_int(OBJECT(phb), "index", i, &error_fatal);
         object_property_set_int(OBJECT(phb), "chip-id", chip->chip_id,
                                 &error_fatal);
+        object_property_set_link(OBJECT(phb), "chip", OBJECT(chip),
+                                 &error_fatal);
         if (!sysbus_realize(SYS_BUS_DEVICE(phb), errp)) {
             return;
         }
-
-        /* Populate the XSCOM address space. */
-        pnv_xscom_add_subregion(chip,
-                                PNV_XSCOM_PBCQ_NEST_BASE + 0x400 * phb->phb_id,
-                                &pbcq->xscom_nest_regs);
-        pnv_xscom_add_subregion(chip,
-                                PNV_XSCOM_PBCQ_PCI_BASE + 0x400 * phb->phb_id,
-                                &pbcq->xscom_pci_regs);
-        pnv_xscom_add_subregion(chip,
-                                PNV_XSCOM_PBCQ_SPCI_BASE + 0x040 * phb->phb_id,
-                                &pbcq->xscom_spci_regs);
     }
 }
 
-- 
2.31.1


