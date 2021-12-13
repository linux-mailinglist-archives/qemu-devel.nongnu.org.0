Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F4D9472D74
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 14:35:59 +0100 (CET)
Received: from localhost ([::1]:36160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwlUd-0003zV-RL
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 08:35:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mwlNz-0007dK-JY
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 08:28:59 -0500
Received: from 10.mo548.mail-out.ovh.net ([46.105.77.235]:43917)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mwlNu-0000Je-Iv
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 08:28:59 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.52])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 5857C206ED;
 Mon, 13 Dec 2021 13:28:52 +0000 (UTC)
Received: from kaod.org (37.59.142.100) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Mon, 13 Dec
 2021 14:28:51 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-100R003dfc8aae8-4d22-443b-9747-c3617a79dc68,
 B1BC92F71A951DCA4C6DA1690085DBFA0C2EFA12) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: <qemu-ppc@nongnu.org>, <qemu-devel@nongnu.org>
Subject: [PATCH v2 10/19] ppc/pnv: Introduce a num_stack class attribute
Date: Mon, 13 Dec 2021 14:28:21 +0100
Message-ID: <20211213132830.108372-11-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211213132830.108372-1-clg@kaod.org>
References: <20211213132830.108372-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.100]
X-ClientProxiedBy: DAG7EX1.mxp5.local (172.16.2.61) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 47e45140-977c-4f8b-8f06-dedb3f9aabff
X-Ovh-Tracer-Id: 5373920256538348326
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrkeekgdehfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofgjfhggtgfgihesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeehheefgeejiedtffefteejudevjeeufeeugfdtfeeuleeuteevleeihffhgfdtleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddttdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopegtlhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=46.105.77.235; envelope-from=clg@kaod.org;
 helo=10.mo548.mail-out.ovh.net
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

Each PEC device of the POWER9 chip has a predefined number of stacks,
equivalent of a root port complex:

  PEC0 -> 1 stack
  PEC1 -> 2 stacks
  PEC2 -> 3 stacks

Introduce a class attribute to hold these values and remove the
"num-stacks" property.

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Reviewed-by: Frederic Barrat <fbarrat@linux.ibm.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 include/hw/pci-host/pnv_phb4.h |  1 +
 hw/pci-host/pnv_phb4_pec.c     | 12 +++++++++++-
 hw/ppc/pnv.c                   |  7 -------
 3 files changed, 12 insertions(+), 8 deletions(-)

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
index 4b32b5ae6ed4..293909b5cb90 100644
--- a/hw/pci-host/pnv_phb4_pec.c
+++ b/hw/pci-host/pnv_phb4_pec.c
@@ -377,6 +377,7 @@ static void pnv_pec_instance_init(Object *obj)
 static void pnv_pec_realize(DeviceState *dev, Error **errp)
 {
     PnvPhb4PecState *pec = PNV_PHB4_PEC(dev);
+    PnvPhb4PecClass *pecc = PNV_PHB4_PEC_GET_CLASS(pec);
     char name[64];
     int i;
 
@@ -387,6 +388,8 @@ static void pnv_pec_realize(DeviceState *dev, Error **errp)
         return;
     }
 
+    pec->num_stacks = pecc->num_stacks[pec->index];
+
     /* Create stacks */
     for (i = 0; i < pec->num_stacks; i++) {
         PnvPhb4PecStack *stack = &pec->stacks[i];
@@ -465,7 +468,6 @@ static int pnv_pec_dt_xscom(PnvXScomInterface *dev, void *fdt,
 
 static Property pnv_pec_properties[] = {
         DEFINE_PROP_UINT32("index", PnvPhb4PecState, index, 0),
-        DEFINE_PROP_UINT32("num-stacks", PnvPhb4PecState, num_stacks, 0),
         DEFINE_PROP_UINT32("chip-id", PnvPhb4PecState, chip_id, 0),
         DEFINE_PROP_LINK("chip", PnvPhb4PecState, chip, TYPE_PNV_CHIP,
                          PnvChip *),
@@ -484,6 +486,13 @@ static uint32_t pnv_pec_xscom_nest_base(PnvPhb4PecState *pec)
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
@@ -508,6 +517,7 @@ static void pnv_pec_class_init(ObjectClass *klass, void *data)
     pecc->stk_compat_size = sizeof(stk_compat);
     pecc->version = PNV_PHB4_VERSION;
     pecc->device_id = PNV_PHB4_DEVICE_ID;
+    pecc->num_stacks = pnv_pec_num_stacks;
 }
 
 static const TypeInfo pnv_pec_type_info = {
diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index 2f8d0c19aab7..87edbbe91e0f 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -1393,13 +1393,6 @@ static void pnv_chip_power9_phb_realize(PnvChip *chip, Error **errp)
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


