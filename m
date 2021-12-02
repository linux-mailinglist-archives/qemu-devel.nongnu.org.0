Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 028254665C5
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Dec 2021 15:49:00 +0100 (CET)
Received: from localhost ([::1]:58192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msnOM-0003uk-3M
	for lists+qemu-devel@lfdr.de; Thu, 02 Dec 2021 09:48:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1msnIM-0000Sr-Ku
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 09:42:46 -0500
Received: from 4.mo548.mail-out.ovh.net ([188.165.42.229]:42123)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1msnIH-0005FC-FO
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 09:42:46 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.93])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 6F0E7202BE;
 Thu,  2 Dec 2021 14:42:39 +0000 (UTC)
Received: from kaod.org (37.59.142.95) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Thu, 2 Dec
 2021 15:42:38 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G001de07ed27-88a9-4667-8bd6-cd484fbe08ed,
 53AF7497412F6E71185D8D05EFDE7032E43CC10F) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: <qemu-ppc@nongnu.org>, <qemu-devel@nongnu.org>
Subject: [PATCH 04/14] ppc/pnv: Introduce support for user created PHB3 devices
Date: Thu, 2 Dec 2021 15:42:25 +0100
Message-ID: <20211202144235.1276352-5-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211202144235.1276352-1-clg@kaod.org>
References: <20211202144235.1276352-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG3EX1.mxp5.local (172.16.2.21) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 1f72c7e6-de8a-4737-96f0-4a98aab11f12
X-Ovh-Tracer-Id: 15807353219267136294
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrieehgdeijecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofgjfhggtgfgihesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeehheefgeejiedtffefteejudevjeeufeeugfdtfeeuleeuteevleeihffhgfdtleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheptghlgheskhgrohgurdhorhhg
Received-SPF: pass client-ip=188.165.42.229; envelope-from=clg@kaod.org;
 helo=4.mo548.mail-out.ovh.net
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

PHB3 devices and PCI devices can now be added to the powernv8 machine
using :

  -device pnv-phb3,chip-id=0,index=1 \
  -device nec-usb-xhci,bus=pci.1,addr=0x0

The 'index' property identifies the PHB3 in the chip. In case of user
created devices, a lookup on 'chip-id' is required to assign the
owning chip.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 include/hw/ppc/pnv.h   |  2 ++
 hw/pci-host/pnv_phb3.c | 11 ++++++++++-
 hw/ppc/pnv.c           | 23 ++++++++++++++++++-----
 3 files changed, 30 insertions(+), 6 deletions(-)

diff --git a/include/hw/ppc/pnv.h b/include/hw/ppc/pnv.h
index 6f498c8f1b5f..0710673a7fd8 100644
--- a/include/hw/ppc/pnv.h
+++ b/include/hw/ppc/pnv.h
@@ -215,6 +215,8 @@ struct PnvMachineState {
     hwaddr       fw_load_addr;
 };
 
+PnvChip *pnv_get_chip(PnvMachineState *pnv, uint32_t chip_id);
+
 #define PNV_FDT_ADDR          0x01000000
 #define PNV_TIMEBASE_FREQ     512000000ULL
 
diff --git a/hw/pci-host/pnv_phb3.c b/hw/pci-host/pnv_phb3.c
index 3aa42ef9d4b9..dd1cf37288a0 100644
--- a/hw/pci-host/pnv_phb3.c
+++ b/hw/pci-host/pnv_phb3.c
@@ -998,6 +998,15 @@ static void pnv_phb3_realize(DeviceState *dev, Error **errp)
         return;
     }
 
+    /* User created devices */
+    if (!phb->chip) {
+        phb->chip = pnv_get_chip(pnv, phb->chip_id);
+        if (!phb->chip) {
+            error_setg(errp, "invalid chip id: %d", phb->chip_id);
+            return;
+        }
+    }
+
     /* LSI sources */
     object_property_set_link(OBJECT(&phb->lsis), "xics", OBJECT(pnv),
                              &error_abort);
@@ -1105,7 +1114,7 @@ static void pnv_phb3_class_init(ObjectClass *klass, void *data)
     dc->realize = pnv_phb3_realize;
     device_class_set_props(dc, pnv_phb3_properties);
     set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
-    dc->user_creatable = false;
+    dc->user_creatable = true;
 }
 
 static const TypeInfo pnv_phb3_type_info = {
diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index de277c457838..d7fe92cb082d 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -1097,14 +1097,14 @@ static void pnv_chip_power8_instance_init(Object *obj)
 
     object_initialize_child(obj, "homer", &chip8->homer, TYPE_PNV8_HOMER);
 
-    for (i = 0; i < pcc->num_phbs; i++) {
+    if (defaults_enabled()) {
+        chip->num_phbs = pcc->num_phbs;
+    }
+
+    for (i = 0; i < chip->num_phbs; i++) {
         object_initialize_child(obj, "phb[*]", &chip8->phbs[i], TYPE_PNV_PHB3);
     }
 
-    /*
-     * Number of PHBs is the chip default
-     */
-    chip->num_phbs = pcc->num_phbs;
 }
 
 static void pnv_chip_icp_realize(Pnv8Chip *chip8, Error **errp)
@@ -1784,6 +1784,19 @@ PowerPCCPU *pnv_chip_find_cpu(PnvChip *chip, uint32_t pir)
     return NULL;
 }
 
+PnvChip *pnv_get_chip(PnvMachineState *pnv, uint32_t chip_id)
+{
+    int i;
+
+    for (i = 0; i < pnv->num_chips; i++) {
+        PnvChip *chip = pnv->chips[i];
+        if (chip->chip_id == chip_id) {
+            return chip;
+        }
+    }
+    return NULL;
+}
+
 static ICSState *pnv_ics_get(XICSFabric *xi, int irq)
 {
     PnvMachineState *pnv = PNV_MACHINE(xi);
-- 
2.31.1


