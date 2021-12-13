Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 309D2472DCC
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 14:49:45 +0100 (CET)
Received: from localhost ([::1]:33562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwli4-0006FM-A3
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 08:49:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mwlO7-0008Bm-CH
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 08:29:07 -0500
Received: from 5.mo548.mail-out.ovh.net ([188.165.49.213]:46801)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mwlNy-0000MB-UG
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 08:29:07 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.17])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 89A8920339;
 Mon, 13 Dec 2021 13:28:57 +0000 (UTC)
Received: from kaod.org (37.59.142.100) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Mon, 13 Dec
 2021 14:28:55 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-100R00336f944fc-94ac-45bc-96d5-6901a470c2a5,
 B1BC92F71A951DCA4C6DA1690085DBFA0C2EFA12) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: <qemu-ppc@nongnu.org>, <qemu-devel@nongnu.org>
Subject: [PATCH v2 18/19] ppc/pnv: Introduce support for user created PHB4
 devices
Date: Mon, 13 Dec 2021 14:28:29 +0100
Message-ID: <20211213132830.108372-19-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211213132830.108372-1-clg@kaod.org>
References: <20211213132830.108372-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.100]
X-ClientProxiedBy: DAG7EX1.mxp5.local (172.16.2.61) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 409071c2-6e28-4837-b1ae-341b7de27b4b
X-Ovh-Tracer-Id: 5375327633280043814
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrkeekgdehfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofgjfhggtgfgihesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeehheefgeejiedtffefteejudevjeeufeeugfdtfeeuleeuteevleeihffhgfdtleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddttdenucevlhhushhtvghrufhiiigvpedutdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheptghlgheskhgrohgurdhorhhg
Received-SPF: pass client-ip=188.165.49.213; envelope-from=clg@kaod.org;
 helo=5.mo548.mail-out.ovh.net
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
Cc: Frederic Barrat <fbarrat@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, Greg Kurz <groug@kaod.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

PHB4 devices and PCI devices can now be added to the powernv9 machine
using:

  -device pnv-phb4-pec,chip-id=0,index=0
  -device nec-usb-xhci,bus=pci.0,addr=0x0

In case of user created devices, a lookup on 'chip-id' is required to
assign the owning chip.

To be noted, that the PEC PHB4 devices can add more than one PHB4
devices:

  * PEC0 provides 1 PHB  (PHB0)
  * PEC1 provides 2 PHBs (PHB1 and PHB2)
  * PEC2 provides 3 PHBs (PHB3, PHB4 and PHB5)

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Reviewed-by: Frederic Barrat <fbarrat@linux.ibm.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/pci-host/pnv_phb4_pec.c | 19 ++++++++++++++++++-
 hw/ppc/pnv.c               |  5 +++--
 2 files changed, 21 insertions(+), 3 deletions(-)

diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
index 24a3adcae326..4fbb8061455d 100644
--- a/hw/pci-host/pnv_phb4_pec.c
+++ b/hw/pci-host/pnv_phb4_pec.c
@@ -394,6 +394,17 @@ static void pnv_pec_realize(DeviceState *dev, Error **errp)
     char name[64];
     int i;
 
+    /* User created devices */
+    if (!pec->chip) {
+        PnvMachineState *pnv = PNV_MACHINE(qdev_get_machine());
+
+        pec->chip = pnv_get_chip(pnv, pec->chip_id);
+        if (!pec->chip) {
+            error_setg(errp, "invalid chip id: %d", pec->chip_id);
+            return;
+        }
+    }
+
     if (pec->index >= PNV_CHIP_GET_CLASS(pec->chip)->num_pecs) {
         error_setg(errp, "invalid PEC index: %d", pec->index);
         return;
@@ -401,6 +412,12 @@ static void pnv_pec_realize(DeviceState *dev, Error **errp)
 
     pec->num_stacks = pecc->num_stacks[pec->index];
 
+    /*
+     * Reparent user created devices to the chip to build correctly
+     * the device tree.
+     */
+    pnv_chip_parent_fixup(pec->chip, OBJECT(pec), pec->index);
+
     /* Create stacks */
     for (i = 0; i < pec->num_stacks; i++) {
         PnvPhb4PecStack *stack = &pec->stacks[i];
@@ -516,7 +533,7 @@ static void pnv_pec_class_init(ObjectClass *klass, void *data)
 
     dc->realize = pnv_pec_realize;
     device_class_set_props(dc, pnv_pec_properties);
-    dc->user_creatable = false;
+    dc->user_creatable = true;
 
     pecc->xscom_nest_base = pnv_pec_xscom_nest_base;
     pecc->xscom_pci_base  = pnv_pec_xscom_pci_base;
diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index 9c45aae1befe..2b027e299d27 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -1350,8 +1350,9 @@ static void pnv_chip_power9_instance_init(Object *obj)
 
     object_initialize_child(obj, "homer", &chip9->homer, TYPE_PNV9_HOMER);
 
-    /* Number of PECs is the chip default */
-    chip->num_pecs = pcc->num_pecs;
+    if (defaults_enabled()) {
+        chip->num_pecs = pcc->num_pecs;
+    }
 
     for (i = 0; i < chip->num_pecs; i++) {
         object_initialize_child(obj, "pec[*]", &chip9->pecs[i],
-- 
2.31.1


