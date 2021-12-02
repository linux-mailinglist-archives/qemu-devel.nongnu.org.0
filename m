Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B19364665CE
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Dec 2021 15:50:46 +0100 (CET)
Received: from localhost ([::1]:35506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msnQ5-0007ke-QM
	for lists+qemu-devel@lfdr.de; Thu, 02 Dec 2021 09:50:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1msnIQ-0000iA-U7; Thu, 02 Dec 2021 09:42:50 -0500
Received: from smtpout3.mo529.mail-out.ovh.net ([46.105.54.81]:39815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1msnII-0005Fi-LV; Thu, 02 Dec 2021 09:42:50 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.144])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 66C1ECF7055B;
 Thu,  2 Dec 2021 15:42:40 +0100 (CET)
Received: from kaod.org (37.59.142.95) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Thu, 2 Dec
 2021 15:42:39 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G001689af2c5-4570-4a04-a51c-d74a3bf8b7e4,
 53AF7497412F6E71185D8D05EFDE7032E43CC10F) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: <qemu-ppc@nongnu.org>, <qemu-devel@nongnu.org>
Subject: [PATCH 06/14] ppc/pnv: Complete user created PHB3 devices
Date: Thu, 2 Dec 2021 15:42:27 +0100
Message-ID: <20211202144235.1276352-7-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211202144235.1276352-1-clg@kaod.org>
References: <20211202144235.1276352-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG3EX1.mxp5.local (172.16.2.21) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: dd2c64cc-2904-4595-8723-2ca7f6afd080
X-Ovh-Tracer-Id: 15807634695089916710
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrieehgdeijecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofgjfhggtgfgihesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeehheefgeejiedtffefteejudevjeeufeeugfdtfeeuleeuteevleeihffhgfdtleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheptghlgheskhgrohgurdhorhhg
Received-SPF: pass client-ip=46.105.54.81; envelope-from=clg@kaod.org;
 helo=smtpout3.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

PHB3s ared SysBus devices and should be allowed to be dynamically
created.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/pci-host/pnv_phb3.c | 9 +++++++++
 hw/ppc/pnv.c           | 2 ++
 2 files changed, 11 insertions(+)

diff --git a/hw/pci-host/pnv_phb3.c b/hw/pci-host/pnv_phb3.c
index e91f658b0060..b61f9c369f64 100644
--- a/hw/pci-host/pnv_phb3.c
+++ b/hw/pci-host/pnv_phb3.c
@@ -1000,6 +1000,9 @@ static void pnv_phb3_realize(DeviceState *dev, Error **errp)
 
     /* User created devices */
     if (!phb->chip) {
+        Error *local_err = NULL;
+        BusState *s;
+
         phb->chip = pnv_get_chip(pnv, phb->chip_id);
         if (!phb->chip) {
             error_setg(errp, "invalid chip id: %d", phb->chip_id);
@@ -1011,6 +1014,12 @@ static void pnv_phb3_realize(DeviceState *dev, Error **errp)
          * correctly the device tree.
          */
         pnv_chip_parent_fixup(phb->chip, OBJECT(phb), phb->phb_id);
+
+        s = qdev_get_parent_bus(DEVICE(phb->chip));
+        if (!qdev_set_parent_bus(DEVICE(phb), s, &local_err)) {
+            error_propagate(errp, local_err);
+            return;
+        }
     }
 
     /* LSI sources */
diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index 9a458655efd9..45d8ecbf2bf7 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -1927,6 +1927,8 @@ static void pnv_machine_power8_class_init(ObjectClass *oc, void *data)
 
     pmc->compat = compat;
     pmc->compat_size = sizeof(compat);
+
+    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_PNV_PHB3);
 }
 
 static void pnv_machine_power9_class_init(ObjectClass *oc, void *data)
-- 
2.31.1


