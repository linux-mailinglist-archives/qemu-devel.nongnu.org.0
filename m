Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6257F472DCE
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 14:49:57 +0100 (CET)
Received: from localhost ([::1]:34770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwliG-00072Z-5u
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 08:49:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mwlO4-0007xz-Cu
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 08:29:04 -0500
Received: from 7.mo548.mail-out.ovh.net ([46.105.33.25]:46757)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mwlNw-0000L9-8Y
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 08:29:04 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.22])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 0D301217FB;
 Mon, 13 Dec 2021 13:28:55 +0000 (UTC)
Received: from kaod.org (37.59.142.100) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Mon, 13 Dec
 2021 14:28:54 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-100R0032b7d66c4-2cc6-4c08-9471-516ecdeb0b40,
 B1BC92F71A951DCA4C6DA1690085DBFA0C2EFA12) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: <qemu-ppc@nongnu.org>, <qemu-devel@nongnu.org>
Subject: [PATCH v2 16/19] ppc/pnv: Reparent user created PHB3 devices to the
 PnvChip
Date: Mon, 13 Dec 2021 14:28:27 +0100
Message-ID: <20211213132830.108372-17-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211213132830.108372-1-clg@kaod.org>
References: <20211213132830.108372-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.100]
X-ClientProxiedBy: DAG7EX1.mxp5.local (172.16.2.61) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: e3293306-5d5b-4d28-a1e0-88376f293907
X-Ovh-Tracer-Id: 5374483207635110694
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrkeekgdehfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofgjfhggtgfgihesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeehheefgeejiedtffefteejudevjeeufeeugfdtfeeuleeuteevleeihffhgfdtleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddttdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopegtlhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=46.105.33.25; envelope-from=clg@kaod.org;
 helo=7.mo548.mail-out.ovh.net
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

The powernv machine uses the object hierarchy to populate the device
tree and each device should be parented to the chip it belongs to.
This is not the case for user created devices which are parented to
the container "/unattached".

Make sure a PHB3 device is parented to its chip by reparenting the
object if necessary.

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Reviewed-by: Frederic Barrat <fbarrat@linux.ibm.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 include/hw/ppc/pnv.h   |  1 +
 hw/pci-host/pnv_phb3.c |  6 ++++++
 hw/ppc/pnv.c           | 17 +++++++++++++++++
 3 files changed, 24 insertions(+)

diff --git a/include/hw/ppc/pnv.h b/include/hw/ppc/pnv.h
index 9b06a9e9948d..ca27bd39f0ac 100644
--- a/include/hw/ppc/pnv.h
+++ b/include/hw/ppc/pnv.h
@@ -177,6 +177,7 @@ DECLARE_INSTANCE_CHECKER(PnvChip, PNV_CHIP_POWER10,
                          TYPE_PNV_CHIP_POWER10)
 
 PowerPCCPU *pnv_chip_find_cpu(PnvChip *chip, uint32_t pir);
+void pnv_chip_parent_fixup(PnvChip *chip, Object *obj, int index);
 
 #define TYPE_PNV_MACHINE       MACHINE_TYPE_NAME("powernv")
 typedef struct PnvMachineClass PnvMachineClass;
diff --git a/hw/pci-host/pnv_phb3.c b/hw/pci-host/pnv_phb3.c
index 4a022de7c1dc..62a184c9ddc9 100644
--- a/hw/pci-host/pnv_phb3.c
+++ b/hw/pci-host/pnv_phb3.c
@@ -1000,6 +1000,12 @@ static void pnv_phb3_realize(DeviceState *dev, Error **errp)
             error_setg(errp, "invalid chip id: %d", phb->chip_id);
             return;
         }
+
+        /*
+         * Reparent user created devices to the chip to build
+         * correctly the device tree.
+         */
+        pnv_chip_parent_fixup(phb->chip, OBJECT(phb), phb->phb_id);
     }
 
     if (phb->phb_id >= PNV_CHIP_GET_CLASS(phb->chip)->num_phbs) {
diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index d134eca0ee9d..ac048a0a5d24 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -1806,6 +1806,23 @@ static ICSState *pnv_ics_get(XICSFabric *xi, int irq)
     return NULL;
 }
 
+void pnv_chip_parent_fixup(PnvChip *chip, Object *obj, int index)
+{
+    Object *parent = OBJECT(chip);
+    g_autofree char *default_id =
+        g_strdup_printf("%s[%d]", object_get_typename(obj), index);
+
+    if (obj->parent == parent) {
+        return;
+    }
+
+    object_ref(obj);
+    object_unparent(obj);
+    object_property_add_child(
+        parent, DEVICE(obj)->id ? DEVICE(obj)->id : default_id, obj);
+    object_unref(obj);
+}
+
 PnvChip *pnv_get_chip(PnvMachineState *pnv, uint32_t chip_id)
 {
     int i;
-- 
2.31.1


