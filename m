Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 685FB472DFD
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 14:52:15 +0100 (CET)
Received: from localhost ([::1]:42110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwlkU-0003jp-J3
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 08:52:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mwlO9-0008J6-CZ
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 08:29:09 -0500
Received: from 1.mo548.mail-out.ovh.net ([178.32.121.110]:44229)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mwlO4-0000JT-6O
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 08:29:09 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.164])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id BC8E4203D3;
 Mon, 13 Dec 2021 13:28:51 +0000 (UTC)
Received: from kaod.org (37.59.142.100) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Mon, 13 Dec
 2021 14:28:51 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-100R00328ad054b-c231-4d93-ab70-7d5ab7a0567f,
 B1BC92F71A951DCA4C6DA1690085DBFA0C2EFA12) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: <qemu-ppc@nongnu.org>, <qemu-devel@nongnu.org>
Subject: [PATCH v2 09/19] ppc/pnv: Introduce a "chip" property under the PHB4
 model
Date: Mon, 13 Dec 2021 14:28:20 +0100
Message-ID: <20211213132830.108372-10-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211213132830.108372-1-clg@kaod.org>
References: <20211213132830.108372-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.100]
X-ClientProxiedBy: DAG7EX1.mxp5.local (172.16.2.61) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: d0b58da5-7f03-46e5-a882-90ecc2c1402f
X-Ovh-Tracer-Id: 5373638781729475366
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrkeekgdehfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofgjfhggtgfgihesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeehheefgeejiedtffefteejudevjeeufeeugfdtfeeuleeuteevleeihffhgfdtleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddttdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopegtlhhgsehkrghougdrohhrgh
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
Cc: Frederic Barrat <fbarrat@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, Greg Kurz <groug@kaod.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

And check the PEC index using the chip class.

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Reviewed-by: Frederic Barrat <fbarrat@linux.ibm.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 include/hw/pci-host/pnv_phb4.h | 2 ++
 hw/pci-host/pnv_phb4_pec.c     | 7 +++++++
 hw/ppc/pnv.c                   | 2 ++
 3 files changed, 11 insertions(+)

diff --git a/include/hw/pci-host/pnv_phb4.h b/include/hw/pci-host/pnv_phb4.h
index b2864233641e..8a585c9a42f7 100644
--- a/include/hw/pci-host/pnv_phb4.h
+++ b/include/hw/pci-host/pnv_phb4.h
@@ -205,6 +205,8 @@ struct PnvPhb4PecState {
     #define PHB4_PEC_MAX_STACKS     3
     uint32_t num_stacks;
     PnvPhb4PecStack stacks[PHB4_PEC_MAX_STACKS];
+
+    PnvChip *chip;
 };
 
 
diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
index 9f722729ac50..4b32b5ae6ed4 100644
--- a/hw/pci-host/pnv_phb4_pec.c
+++ b/hw/pci-host/pnv_phb4_pec.c
@@ -382,6 +382,11 @@ static void pnv_pec_realize(DeviceState *dev, Error **errp)
 
     assert(pec->system_memory);
 
+    if (pec->index >= PNV_CHIP_GET_CLASS(pec->chip)->num_pecs) {
+        error_setg(errp, "invalid PEC index: %d", pec->index);
+        return;
+    }
+
     /* Create stacks */
     for (i = 0; i < pec->num_stacks; i++) {
         PnvPhb4PecStack *stack = &pec->stacks[i];
@@ -462,6 +467,8 @@ static Property pnv_pec_properties[] = {
         DEFINE_PROP_UINT32("index", PnvPhb4PecState, index, 0),
         DEFINE_PROP_UINT32("num-stacks", PnvPhb4PecState, num_stacks, 0),
         DEFINE_PROP_UINT32("chip-id", PnvPhb4PecState, chip_id, 0),
+        DEFINE_PROP_LINK("chip", PnvPhb4PecState, chip, TYPE_PNV_CHIP,
+                         PnvChip *),
         DEFINE_PROP_LINK("system-memory", PnvPhb4PecState, system_memory,
                      TYPE_MEMORY_REGION, MemoryRegion *),
         DEFINE_PROP_END_OF_LIST(),
diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index ecfe373e45e7..2f8d0c19aab7 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -1402,6 +1402,8 @@ static void pnv_chip_power9_phb_realize(PnvChip *chip, Error **errp)
                                 &error_fatal);
         object_property_set_int(OBJECT(pec), "chip-id", chip->chip_id,
                                 &error_fatal);
+        object_property_set_link(OBJECT(pec), "chip", OBJECT(chip),
+                                 &error_fatal);
         object_property_set_link(OBJECT(pec), "system-memory",
                                  OBJECT(get_system_memory()), &error_abort);
         if (!qdev_realize(DEVICE(pec), NULL, errp)) {
-- 
2.31.1


