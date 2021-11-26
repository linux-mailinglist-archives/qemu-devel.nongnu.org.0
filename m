Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71DCA45ED48
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Nov 2021 13:00:33 +0100 (CET)
Received: from localhost ([::1]:55612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqZu4-0007Nh-GR
	for lists+qemu-devel@lfdr.de; Fri, 26 Nov 2021 07:00:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mqZnq-0003Rl-MR
 for qemu-devel@nongnu.org; Fri, 26 Nov 2021 06:54:06 -0500
Received: from 9.mo552.mail-out.ovh.net ([87.98.180.222]:33791)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mqZni-0007Sl-Ix
 for qemu-devel@nongnu.org; Fri, 26 Nov 2021 06:54:04 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.188])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 549662240C;
 Fri, 26 Nov 2021 11:53:56 +0000 (UTC)
Received: from kaod.org (37.59.142.105) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Fri, 26 Nov
 2021 12:53:55 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-105G006d5d745e1-9a84-40f7-ab4f-50c8e5903bb4,
 B8303126CBA279BD35B7DF0844B381DDFAFB7782) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: <qemu-ppc@nongnu.org>, <qemu-devel@nongnu.org>
Subject: [PATCH v3 08/18] ppc/psi: Add support for StoreEOI and 64k ESB pages
 (POWER10)
Date: Fri, 26 Nov 2021 12:53:39 +0100
Message-ID: <20211126115349.2737605-9-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211126115349.2737605-1-clg@kaod.org>
References: <20211126115349.2737605-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.105]
X-ClientProxiedBy: DAG1EX2.mxp5.local (172.16.2.2) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 5271db7c-852d-4728-a9b9-4fa94cb547d2
X-Ovh-Tracer-Id: 14615306694962350956
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrhedvgdefvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofgjfhggtgfgihesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeehheefgeejiedtffefteejudevjeeufeeugfdtfeeuleeuteevleeihffhgfdtleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopegtlhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=87.98.180.222; envelope-from=clg@kaod.org;
 helo=9.mo552.mail-out.ovh.net
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

POWER10 adds support for StoreEOI operation and 64K ESB pages on PSIHB
to be consistent with the other interrupt sources of the system.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/ppc/pnv.c     |  6 ++++++
 hw/ppc/pnv_psi.c | 30 ++++++++++++++++++++++++------
 2 files changed, 30 insertions(+), 6 deletions(-)

diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index d510d2e1d917..96c908c753cb 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -1526,6 +1526,9 @@ static void pnv_chip_power9_realize(DeviceState *dev, Error **errp)
     /* Processor Service Interface (PSI) Host Bridge */
     object_property_set_int(OBJECT(&chip9->psi), "bar", PNV9_PSIHB_BASE(chip),
                             &error_fatal);
+    /* This is the only device with 4k ESB pages */
+    object_property_set_int(OBJECT(&chip9->psi), "shift", XIVE_ESB_4K,
+                            &error_fatal);
     if (!qdev_realize(DEVICE(&chip9->psi), NULL, errp)) {
         return;
     }
@@ -1768,6 +1771,9 @@ static void pnv_chip_power10_realize(DeviceState *dev, Error **errp)
     /* Processor Service Interface (PSI) Host Bridge */
     object_property_set_int(OBJECT(&chip10->psi), "bar",
                             PNV10_PSIHB_BASE(chip), &error_fatal);
+    /* PSI can now be configured to use 64k ESB pages on POWER10 */
+    object_property_set_int(OBJECT(&chip10->psi), "shift", XIVE_ESB_64K,
+                            &error_fatal);
     if (!qdev_realize(DEVICE(&chip10->psi), NULL, errp)) {
         return;
     }
diff --git a/hw/ppc/pnv_psi.c b/hw/ppc/pnv_psi.c
index cd9a2c5952a6..737486046d5a 100644
--- a/hw/ppc/pnv_psi.c
+++ b/hw/ppc/pnv_psi.c
@@ -601,7 +601,6 @@ static const TypeInfo pnv_psi_power8_info = {
 #define   PSIHB9_IRQ_METHOD             PPC_BIT(0)
 #define   PSIHB9_IRQ_RESET              PPC_BIT(1)
 #define PSIHB9_ESB_CI_BASE              0x60
-#define   PSIHB9_ESB_CI_64K             PPC_BIT(1)
 #define   PSIHB9_ESB_CI_ADDR_MASK       PPC_BITMASK(8, 47)
 #define   PSIHB9_ESB_CI_VALID           PPC_BIT(63)
 #define PSIHB9_ESB_NOTIF_ADDR           0x68
@@ -646,6 +645,14 @@ static const TypeInfo pnv_psi_power8_info = {
 #define   PSIHB9_IRQ_STAT_DIO           PPC_BIT(12)
 #define   PSIHB9_IRQ_STAT_PSU           PPC_BIT(13)
 
+/* P10 register extensions */
+
+#define PSIHB10_CR                       PSIHB9_CR
+#define    PSIHB10_CR_STORE_EOI          PPC_BIT(12)
+
+#define PSIHB10_ESB_CI_BASE              PSIHB9_ESB_CI_BASE
+#define   PSIHB10_ESB_CI_64K             PPC_BIT(1)
+
 static void pnv_psi_notify(XiveNotifier *xf, uint32_t srcno)
 {
     PnvPsi *psi = PNV_PSI(xf);
@@ -704,6 +711,13 @@ static void pnv_psi_p9_mmio_write(void *opaque, hwaddr addr,
 
     switch (addr) {
     case PSIHB9_CR:
+        if (val & PSIHB10_CR_STORE_EOI) {
+            psi9->source.esb_flags |= XIVE_SRC_STORE_EOI;
+        } else {
+            psi9->source.esb_flags &= ~XIVE_SRC_STORE_EOI;
+        }
+        break;
+
     case PSIHB9_SEMR:
         /* FSP stuff */
         break;
@@ -715,15 +729,20 @@ static void pnv_psi_p9_mmio_write(void *opaque, hwaddr addr,
         break;
 
     case PSIHB9_ESB_CI_BASE:
+        if (val & PSIHB10_ESB_CI_64K) {
+            psi9->source.esb_shift = XIVE_ESB_64K;
+        } else {
+            psi9->source.esb_shift = XIVE_ESB_4K;
+        }
         if (!(val & PSIHB9_ESB_CI_VALID)) {
             if (psi->regs[reg] & PSIHB9_ESB_CI_VALID) {
                 memory_region_del_subregion(sysmem, &psi9->source.esb_mmio);
             }
         } else {
             if (!(psi->regs[reg] & PSIHB9_ESB_CI_VALID)) {
-                memory_region_add_subregion(sysmem,
-                                        val & ~PSIHB9_ESB_CI_VALID,
-                                        &psi9->source.esb_mmio);
+                hwaddr addr = val & ~(PSIHB9_ESB_CI_VALID | PSIHB10_ESB_CI_64K);
+                memory_region_add_subregion(sysmem, addr,
+                                            &psi9->source.esb_mmio);
             }
         }
         psi->regs[reg] = val;
@@ -831,6 +850,7 @@ static void pnv_psi_power9_instance_init(Object *obj)
     Pnv9Psi *psi = PNV9_PSI(obj);
 
     object_initialize_child(obj, "source", &psi->source, TYPE_XIVE_SOURCE);
+    object_property_add_alias(obj, "shift", OBJECT(&psi->source), "shift");
 }
 
 static void pnv_psi_power9_realize(DeviceState *dev, Error **errp)
@@ -839,8 +859,6 @@ static void pnv_psi_power9_realize(DeviceState *dev, Error **errp)
     XiveSource *xsrc = &PNV9_PSI(psi)->source;
     int i;
 
-    /* This is the only device with 4k ESB pages */
-    object_property_set_int(OBJECT(xsrc), "shift", XIVE_ESB_4K, &error_fatal);
     object_property_set_int(OBJECT(xsrc), "nr-irqs", PSIHB9_NUM_IRQS,
                             &error_fatal);
     object_property_set_link(OBJECT(xsrc), "xive", OBJECT(psi), &error_abort);
-- 
2.31.1


