Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAF484665FB
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Dec 2021 15:58:49 +0100 (CET)
Received: from localhost ([::1]:59108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msnXs-0007Jw-DX
	for lists+qemu-devel@lfdr.de; Thu, 02 Dec 2021 09:58:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1msnIV-00011x-IB; Thu, 02 Dec 2021 09:42:55 -0500
Received: from smtpout4.mo529.mail-out.ovh.net ([217.182.185.173]:55249)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1msnIL-0005Hz-PQ; Thu, 02 Dec 2021 09:42:55 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.236])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 46011CF7057B;
 Thu,  2 Dec 2021 15:42:44 +0100 (CET)
Received: from kaod.org (37.59.142.95) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Thu, 2 Dec
 2021 15:42:43 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G001ab10da8b-573e-48cb-a964-9ba54b462eb3,
 53AF7497412F6E71185D8D05EFDE7032E43CC10F) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: <qemu-ppc@nongnu.org>, <qemu-devel@nongnu.org>
Subject: [PATCH 14/14] ppc/pnv: Introduce support for user created PHB4 devices
Date: Thu, 2 Dec 2021 15:42:35 +0100
Message-ID: <20211202144235.1276352-15-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211202144235.1276352-1-clg@kaod.org>
References: <20211202144235.1276352-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG3EX1.mxp5.local (172.16.2.21) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 61452d42-a747-4717-9989-e542ef658382
X-Ovh-Tracer-Id: 15808760594829183782
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrieehgdeijecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofgjfhggtgfgihesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeehheefgeejiedtffefteejudevjeeufeeugfdtfeeuleeuteevleeihffhgfdtleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheptghlgheskhgrohgurdhorhhg
Received-SPF: pass client-ip=217.182.185.173; envelope-from=clg@kaod.org;
 helo=smtpout4.mo529.mail-out.ovh.net
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

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/pci-host/pnv_phb4_pec.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
index 9b081d543057..4ee92f11945c 100644
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
-- 
2.31.1


