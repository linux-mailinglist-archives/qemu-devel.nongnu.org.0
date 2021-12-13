Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A46BA472DF4
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 14:51:49 +0100 (CET)
Received: from localhost ([::1]:39570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwlk4-0001u6-QJ
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 08:51:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mwlO1-0007mg-S1
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 08:29:01 -0500
Received: from 10.mo548.mail-out.ovh.net ([46.105.77.235]:57941)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mwlNv-0000KM-4a
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 08:29:01 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.62])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id ED89021503;
 Mon, 13 Dec 2021 13:28:53 +0000 (UTC)
Received: from kaod.org (37.59.142.100) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Mon, 13 Dec
 2021 14:28:53 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-100R0034ca5e4e5-5d3f-482a-9523-f63e16999128,
 B1BC92F71A951DCA4C6DA1690085DBFA0C2EFA12) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: <qemu-ppc@nongnu.org>, <qemu-devel@nongnu.org>
Subject: [PATCH v2 14/19] ppc/pnv: Use QOM hierarchy to scan PEC PHB4 devices
Date: Mon, 13 Dec 2021 14:28:25 +0100
Message-ID: <20211213132830.108372-15-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211213132830.108372-1-clg@kaod.org>
References: <20211213132830.108372-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.100]
X-ClientProxiedBy: DAG7EX1.mxp5.local (172.16.2.61) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 02b644ad-c69a-41d0-889e-2924cf8153fd
X-Ovh-Tracer-Id: 5374201734556388134
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

When -nodefaults is supported for PHB4 devices, the pecs array under
the chip will be empty. This will break the 'info pic' HMP command.

Do a QOM loop on the chip children and look for PEC PHB4 devices
instead.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/ppc/pnv.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index 08b037f4e753..9de8b8353014 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -659,20 +659,26 @@ static void pnv_chip_power8_pic_print_info(PnvChip *chip, Monitor *mon)
                          pnv_chip_power8_pic_print_info_child, mon);
 }
 
+static int pnv_chip_power9_pic_print_info_child(Object *child, void *opaque)
+{
+    Monitor *mon = opaque;
+    PnvPHB4 *phb4 = (PnvPHB4 *) object_dynamic_cast(child, TYPE_PNV_PHB4);
+
+    if (phb4) {
+        pnv_phb4_pic_print_info(phb4, mon);
+    }
+    return 0;
+}
+
 static void pnv_chip_power9_pic_print_info(PnvChip *chip, Monitor *mon)
 {
     Pnv9Chip *chip9 = PNV9_CHIP(chip);
-    int i, j;
 
     pnv_xive_pic_print_info(&chip9->xive, mon);
     pnv_psi_pic_print_info(&chip9->psi, mon);
 
-    for (i = 0; i < chip->num_pecs; i++) {
-        PnvPhb4PecState *pec = &chip9->pecs[i];
-        for (j = 0; j < pec->num_stacks; j++) {
-            pnv_phb4_pic_print_info(&pec->stacks[j].phb, mon);
-        }
-    }
+    object_child_foreach_recursive(OBJECT(chip),
+                         pnv_chip_power9_pic_print_info_child, mon);
 }
 
 static uint64_t pnv_chip_power8_xscom_core_base(PnvChip *chip,
-- 
2.31.1


