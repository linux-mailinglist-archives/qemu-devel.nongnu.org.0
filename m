Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0631F472D6B
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 14:34:44 +0100 (CET)
Received: from localhost ([::1]:34806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwlTW-00030t-Pi
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 08:34:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mwlNw-0007WO-Sq; Mon, 13 Dec 2021 08:28:56 -0500
Received: from smtpout2.mo529.mail-out.ovh.net ([79.137.123.220]:39371)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mwlNu-0000Cq-9s; Mon, 13 Dec 2021 08:28:56 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.206])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 5E203D19BEA1;
 Mon, 13 Dec 2021 14:28:41 +0100 (CET)
Received: from kaod.org (37.59.142.100) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Mon, 13 Dec
 2021 14:28:40 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-100R00397d45a91-5e47-4011-bc7c-9db01472d232,
 B1BC92F71A951DCA4C6DA1690085DBFA0C2EFA12) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: <qemu-ppc@nongnu.org>, <qemu-devel@nongnu.org>
Subject: [PATCH v2 02/19] ppc/pnv: Introduce a "chip" property under PHB3
Date: Mon, 13 Dec 2021 14:28:13 +0100
Message-ID: <20211213132830.108372-3-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211213132830.108372-1-clg@kaod.org>
References: <20211213132830.108372-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.100]
X-ClientProxiedBy: DAG7EX1.mxp5.local (172.16.2.61) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 74066975-1654-477d-96ac-70fc8c1da4a0
X-Ovh-Tracer-Id: 5370824033535626022
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrkeekgdehfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofgjfhggtgfgihesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeehheefgeejiedtffefteejudevjeeufeeugfdtfeeuleeuteevleeihffhgfdtleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddttdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopegtlhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=79.137.123.220; envelope-from=clg@kaod.org;
 helo=smtpout2.mo529.mail-out.ovh.net
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

This change will help us move the mapping of XSCOM regions under the
PHB3 realize routine, which will be necessary for user created PHB3
devices.

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Reviewed-by: Frederic Barrat <fbarrat@linux.ibm.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 include/hw/pci-host/pnv_phb3.h | 3 +++
 hw/pci-host/pnv_phb3.c         | 1 +
 hw/ppc/pnv.c                   | 2 ++
 3 files changed, 6 insertions(+)

diff --git a/include/hw/pci-host/pnv_phb3.h b/include/hw/pci-host/pnv_phb3.h
index e2a2e3624532..e9c13e6bd821 100644
--- a/include/hw/pci-host/pnv_phb3.h
+++ b/include/hw/pci-host/pnv_phb3.h
@@ -16,6 +16,7 @@
 #include "qom/object.h"
 
 typedef struct PnvPHB3 PnvPHB3;
+typedef struct PnvChip PnvChip;
 
 /*
  * PHB3 XICS Source for MSIs
@@ -157,6 +158,8 @@ struct PnvPHB3 {
     PnvPHB3RootPort root;
 
     QLIST_HEAD(, PnvPhb3DMASpace) dma_spaces;
+
+    PnvChip *chip;
 };
 
 uint64_t pnv_phb3_reg_read(void *opaque, hwaddr off, unsigned size);
diff --git a/hw/pci-host/pnv_phb3.c b/hw/pci-host/pnv_phb3.c
index a7f96850055a..3aa42ef9d4b9 100644
--- a/hw/pci-host/pnv_phb3.c
+++ b/hw/pci-host/pnv_phb3.c
@@ -1092,6 +1092,7 @@ static const char *pnv_phb3_root_bus_path(PCIHostState *host_bridge,
 static Property pnv_phb3_properties[] = {
         DEFINE_PROP_UINT32("index", PnvPHB3, phb_id, 0),
         DEFINE_PROP_UINT32("chip-id", PnvPHB3, chip_id, 0),
+        DEFINE_PROP_LINK("chip", PnvPHB3, chip, TYPE_PNV_CHIP, PnvChip *),
         DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index 6359bce549ca..74c25c1c5d98 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -1231,6 +1231,8 @@ static void pnv_chip_power8_realize(DeviceState *dev, Error **errp)
         object_property_set_int(OBJECT(phb), "index", i, &error_fatal);
         object_property_set_int(OBJECT(phb), "chip-id", chip->chip_id,
                                 &error_fatal);
+        object_property_set_link(OBJECT(phb), "chip", OBJECT(chip),
+                                 &error_fatal);
         if (!sysbus_realize(SYS_BUS_DEVICE(phb), errp)) {
             return;
         }
-- 
2.31.1


