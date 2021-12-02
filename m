Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE7544665D7
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Dec 2021 15:52:08 +0100 (CET)
Received: from localhost ([::1]:39884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msnRQ-0002Jw-2x
	for lists+qemu-devel@lfdr.de; Thu, 02 Dec 2021 09:52:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1msnIS-0000oA-Dm
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 09:42:52 -0500
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:57707)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1msnIJ-0005Gr-P5
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 09:42:52 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.25])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 142B4CF7056F;
 Thu,  2 Dec 2021 15:42:42 +0100 (CET)
Received: from kaod.org (37.59.142.95) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Thu, 2 Dec
 2021 15:42:41 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G001c435d69f-61e6-4c6e-b78a-1fa9c6053399,
 53AF7497412F6E71185D8D05EFDE7032E43CC10F) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: <qemu-ppc@nongnu.org>, <qemu-devel@nongnu.org>
Subject: [PATCH 10/14] ppc/pnv: Introduce a num_stack class attribute
Date: Thu, 2 Dec 2021 15:42:31 +0100
Message-ID: <20211202144235.1276352-11-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211202144235.1276352-1-clg@kaod.org>
References: <20211202144235.1276352-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG3EX1.mxp5.local (172.16.2.21) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 09048327-06d9-4c28-a928-7763698ef16c
X-Ovh-Tracer-Id: 15807916167105121062
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrieehgdeijecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofgjfhggtgfgihesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeehheefgeejiedtffefteejudevjeeufeeugfdtfeeuleeuteevleeihffhgfdtleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheptghlgheskhgrohgurdhorhhg
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
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

Each PEC devices of the POWER9 chip has a predefined number of stacks,
equivalent of a root port complex:

  PEC0 -> 1 stack
  PEC1 -> 2 stacks
  PEC2 -> 3 stacks

Introduce a class attribute to hold these values and remove the
"num-stacks" property.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 include/hw/pci-host/pnv_phb4.h |  1 +
 hw/pci-host/pnv_phb4_pec.c     | 17 ++++++++++++++++-
 hw/ppc/pnv.c                   |  7 -------
 3 files changed, 17 insertions(+), 8 deletions(-)

diff --git a/include/hw/pci-host/pnv_phb4.h b/include/hw/pci-host/pnv_phb4.h
index 8a585c9a42f7..60de3031a622 100644
--- a/include/hw/pci-host/pnv_phb4.h
+++ b/include/hw/pci-host/pnv_phb4.h
@@ -223,6 +223,7 @@ struct PnvPhb4PecClass {
     int stk_compat_size;
     uint64_t version;
     uint64_t device_id;
+    const uint32_t *num_stacks;
 };
 
 #endif /* PCI_HOST_PNV_PHB4_H */
diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
index e9750c41c595..293909b5cb90 100644
--- a/hw/pci-host/pnv_phb4_pec.c
+++ b/hw/pci-host/pnv_phb4_pec.c
@@ -377,11 +377,19 @@ static void pnv_pec_instance_init(Object *obj)
 static void pnv_pec_realize(DeviceState *dev, Error **errp)
 {
     PnvPhb4PecState *pec = PNV_PHB4_PEC(dev);
+    PnvPhb4PecClass *pecc = PNV_PHB4_PEC_GET_CLASS(pec);
     char name[64];
     int i;
 
     assert(pec->system_memory);
 
+    if (pec->index >= PNV_CHIP_GET_CLASS(pec->chip)->num_pecs) {
+        error_setg(errp, "invalid PEC index: %d", pec->index);
+        return;
+    }
+
+    pec->num_stacks = pecc->num_stacks[pec->index];
+
     /* Create stacks */
     for (i = 0; i < pec->num_stacks; i++) {
         PnvPhb4PecStack *stack = &pec->stacks[i];
@@ -460,7 +468,6 @@ static int pnv_pec_dt_xscom(PnvXScomInterface *dev, void *fdt,
 
 static Property pnv_pec_properties[] = {
         DEFINE_PROP_UINT32("index", PnvPhb4PecState, index, 0),
-        DEFINE_PROP_UINT32("num-stacks", PnvPhb4PecState, num_stacks, 0),
         DEFINE_PROP_UINT32("chip-id", PnvPhb4PecState, chip_id, 0),
         DEFINE_PROP_LINK("chip", PnvPhb4PecState, chip, TYPE_PNV_CHIP,
                          PnvChip *),
@@ -479,6 +486,13 @@ static uint32_t pnv_pec_xscom_nest_base(PnvPhb4PecState *pec)
     return PNV9_XSCOM_PEC_NEST_BASE + 0x400 * pec->index;
 }
 
+/*
+ * PEC0 -> 1 stack
+ * PEC1 -> 2 stacks
+ * PEC2 -> 3 stacks
+ */
+static const uint32_t pnv_pec_num_stacks[] = { 1, 2, 3 };
+
 static void pnv_pec_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
@@ -503,6 +517,7 @@ static void pnv_pec_class_init(ObjectClass *klass, void *data)
     pecc->stk_compat_size = sizeof(stk_compat);
     pecc->version = PNV_PHB4_VERSION;
     pecc->device_id = PNV_PHB4_DEVICE_ID;
+    pecc->num_stacks = pnv_pec_num_stacks;
 }
 
 static const TypeInfo pnv_pec_type_info = {
diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index 76b2f5468b38..957f0bdfaa6b 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -1380,13 +1380,6 @@ static void pnv_chip_power9_phb_realize(PnvChip *chip, Error **errp)
         uint32_t pec_pci_base;
 
         object_property_set_int(OBJECT(pec), "index", i, &error_fatal);
-        /*
-         * PEC0 -> 1 stack
-         * PEC1 -> 2 stacks
-         * PEC2 -> 3 stacks
-         */
-        object_property_set_int(OBJECT(pec), "num-stacks", i + 1,
-                                &error_fatal);
         object_property_set_int(OBJECT(pec), "chip-id", chip->chip_id,
                                 &error_fatal);
         object_property_set_link(OBJECT(pec), "chip", OBJECT(chip),
-- 
2.31.1


