Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73A34472D9C
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 14:41:43 +0100 (CET)
Received: from localhost ([::1]:44858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwlaI-00020c-J8
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 08:41:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mwlNz-0007eA-Rg
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 08:28:59 -0500
Received: from 7.mo552.mail-out.ovh.net ([188.165.59.253]:59337)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mwlNu-0000DG-Ga
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 08:28:59 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.84])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id A7A7422EA8;
 Mon, 13 Dec 2021 13:28:42 +0000 (UTC)
Received: from kaod.org (37.59.142.100) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Mon, 13 Dec
 2021 14:28:42 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-100R003d2c394b2-8826-4cb1-86ad-f8e9666ee95e,
 B1BC92F71A951DCA4C6DA1690085DBFA0C2EFA12) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: <qemu-ppc@nongnu.org>, <qemu-devel@nongnu.org>
Subject: [PATCH v2 05/19] ppc/pnv: Move mapping of the PHB3 CQ regions under
 pnv_pbcq_realize()
Date: Mon, 13 Dec 2021 14:28:16 +0100
Message-ID: <20211213132830.108372-6-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211213132830.108372-1-clg@kaod.org>
References: <20211213132830.108372-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.100]
X-ClientProxiedBy: DAG7EX1.mxp5.local (172.16.2.61) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 7cbcc315-6499-4aa6-ac44-9780173ca23a
X-Ovh-Tracer-Id: 5371105506932919078
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrkeekgdehfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofgjfhggtgfgihesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeehheefgeejiedtffefteejudevjeeufeeugfdtfeeuleeuteevleeihffhgfdtleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddttdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopegtlhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=188.165.59.253; envelope-from=clg@kaod.org;
 helo=7.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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

This change will help us providing support for user created PHB3
devices.

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Reviewed-by: Frederic Barrat <fbarrat@linux.ibm.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/pci-host/pnv_phb3_pbcq.c | 11 +++++++++++
 hw/ppc/pnv.c                | 12 ------------
 2 files changed, 11 insertions(+), 12 deletions(-)

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
index 0413d221b311..65196a2a5d00 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -1226,7 +1226,6 @@ static void pnv_chip_power8_realize(DeviceState *dev, Error **errp)
     /* PHB3 controllers */
     for (i = 0; i < chip->num_phbs; i++) {
         PnvPHB3 *phb = &chip8->phbs[i];
-        PnvPBCQState *pbcq = &phb->pbcq;
 
         object_property_set_int(OBJECT(phb), "index", i, &error_fatal);
         object_property_set_int(OBJECT(phb), "chip-id", chip->chip_id,
@@ -1236,17 +1235,6 @@ static void pnv_chip_power8_realize(DeviceState *dev, Error **errp)
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


