Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FB35472D94
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 14:40:42 +0100 (CET)
Received: from localhost ([::1]:42792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwlZJ-0000ao-Bh
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 08:40:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mwlNx-0007WW-4D
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 08:28:57 -0500
Received: from smtpout4.mo529.mail-out.ovh.net ([217.182.185.173]:37887)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mwlNu-0000En-0k
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 08:28:56 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.27])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id C0927D19BEB4;
 Mon, 13 Dec 2021 14:28:43 +0100 (CET)
Received: from kaod.org (37.59.142.100) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Mon, 13 Dec
 2021 14:28:42 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-100R00376504725-c465-4e87-b4e5-60221bb66a39,
 B1BC92F71A951DCA4C6DA1690085DBFA0C2EFA12) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: <qemu-ppc@nongnu.org>, <qemu-devel@nongnu.org>
Subject: [PATCH v2 06/19] ppc/pnv: Use QOM hierarchy to scan PHB3 devices
Date: Mon, 13 Dec 2021 14:28:17 +0100
Message-ID: <20211213132830.108372-7-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211213132830.108372-1-clg@kaod.org>
References: <20211213132830.108372-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.100]
X-ClientProxiedBy: DAG7EX1.mxp5.local (172.16.2.61) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: c4c30209-ab32-4a86-972c-5542b70ae557
X-Ovh-Tracer-Id: 5371386980891069222
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrkeekgdehfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofgjfhggtgfgihesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeehheefgeejiedtffefteejudevjeeufeeugfdtfeeuleeuteevleeihffhgfdtleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddttdenucevlhhushhtvghrufhiiigvpeefnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopegtlhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=217.182.185.173; envelope-from=clg@kaod.org;
 helo=smtpout4.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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

When -nodefaults is supported for PHB3 devices, the phbs array under
the chip will be empty. This will break the XICSFabric handlers, and
all interrupt delivery, and the 'info pic' HMP command.

Do a QOM loop on the chip children and look for PHB3 devices instead.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/ppc/pnv.c | 72 +++++++++++++++++++++++++++++++++++++++-------------
 1 file changed, 54 insertions(+), 18 deletions(-)

diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index 65196a2a5d00..cbc3f8ed62f7 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -638,16 +638,25 @@ static ISABus *pnv_isa_create(PnvChip *chip, Error **errp)
     return PNV_CHIP_GET_CLASS(chip)->isa_create(chip, errp);
 }
 
+static int pnv_chip_power8_pic_print_info_child(Object *child, void *opaque)
+{
+    Monitor *mon = opaque;
+    PnvPHB3 *phb3 = (PnvPHB3 *) object_dynamic_cast(child, TYPE_PNV_PHB3);
+
+    if (phb3) {
+        pnv_phb3_msi_pic_print_info(&phb3->msis, mon);
+        ics_pic_print_info(&phb3->lsis, mon);
+    }
+    return 0;
+}
+
 static void pnv_chip_power8_pic_print_info(PnvChip *chip, Monitor *mon)
 {
     Pnv8Chip *chip8 = PNV8_CHIP(chip);
-    int i;
 
     ics_pic_print_info(&chip8->psi.ics, mon);
-    for (i = 0; i < chip->num_phbs; i++) {
-        pnv_phb3_msi_pic_print_info(&chip8->phbs[i].msis, mon);
-        ics_pic_print_info(&chip8->phbs[i].lsis, mon);
-    }
+    object_child_foreach(OBJECT(chip),
+                         pnv_chip_power8_pic_print_info_child, mon);
 }
 
 static void pnv_chip_power9_pic_print_info(PnvChip *chip, Monitor *mon)
@@ -1789,10 +1798,32 @@ PowerPCCPU *pnv_chip_find_cpu(PnvChip *chip, uint32_t pir)
     return NULL;
 }
 
+typedef struct ForeachPhb3Args {
+    int irq;
+    ICSState *ics;
+} ForeachPhb3Args;
+
+static int pnv_ics_get_child(Object *child, void *opaque)
+{
+    ForeachPhb3Args *args = opaque;
+    PnvPHB3 *phb3 = (PnvPHB3 *) object_dynamic_cast(child, TYPE_PNV_PHB3);
+
+    if (phb3) {
+        if (ics_valid_irq(&phb3->lsis, args->irq)) {
+            args->ics = &phb3->lsis;
+        }
+        if (ics_valid_irq(ICS(&phb3->msis), args->irq)) {
+            args->ics = ICS(&phb3->msis);
+        }
+    }
+    return args->ics ? 1 : 0;
+}
+
 static ICSState *pnv_ics_get(XICSFabric *xi, int irq)
 {
     PnvMachineState *pnv = PNV_MACHINE(xi);
-    int i, j;
+    ForeachPhb3Args args = { irq, NULL };
+    int i;
 
     for (i = 0; i < pnv->num_chips; i++) {
         PnvChip *chip = pnv->chips[i];
@@ -1801,32 +1832,37 @@ static ICSState *pnv_ics_get(XICSFabric *xi, int irq)
         if (ics_valid_irq(&chip8->psi.ics, irq)) {
             return &chip8->psi.ics;
         }
-        for (j = 0; j < chip->num_phbs; j++) {
-            if (ics_valid_irq(&chip8->phbs[j].lsis, irq)) {
-                return &chip8->phbs[j].lsis;
-            }
-            if (ics_valid_irq(ICS(&chip8->phbs[j].msis), irq)) {
-                return ICS(&chip8->phbs[j].msis);
-            }
+
+        object_child_foreach(OBJECT(chip), pnv_ics_get_child, &args);
+        if (args.ics) {
+            return args.ics;
         }
     }
     return NULL;
 }
 
+static int pnv_ics_resend_child(Object *child, void *opaque)
+{
+    PnvPHB3 *phb3 = (PnvPHB3 *) object_dynamic_cast(child, TYPE_PNV_PHB3);
+
+    if (phb3) {
+        ics_resend(&phb3->lsis);
+        ics_resend(ICS(&phb3->msis));
+    }
+    return 0;
+}
+
 static void pnv_ics_resend(XICSFabric *xi)
 {
     PnvMachineState *pnv = PNV_MACHINE(xi);
-    int i, j;
+    int i;
 
     for (i = 0; i < pnv->num_chips; i++) {
         PnvChip *chip = pnv->chips[i];
         Pnv8Chip *chip8 = PNV8_CHIP(pnv->chips[i]);
 
         ics_resend(&chip8->psi.ics);
-        for (j = 0; j < chip->num_phbs; j++) {
-            ics_resend(&chip8->phbs[j].lsis);
-            ics_resend(ICS(&chip8->phbs[j].msis));
-        }
+        object_child_foreach(OBJECT(chip), pnv_ics_resend_child, NULL);
     }
 }
 
-- 
2.31.1


