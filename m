Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CF1A4665CD
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Dec 2021 15:50:42 +0100 (CET)
Received: from localhost ([::1]:35152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msnQ1-0007VX-2n
	for lists+qemu-devel@lfdr.de; Thu, 02 Dec 2021 09:50:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1msnIQ-0000hN-Pf
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 09:42:50 -0500
Received: from 9.mo548.mail-out.ovh.net ([46.105.48.137]:57471)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1msnIJ-0005GY-9A
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 09:42:50 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.2])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 3A268201DB;
 Thu,  2 Dec 2021 14:42:41 +0000 (UTC)
Received: from kaod.org (37.59.142.95) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Thu, 2 Dec
 2021 15:42:40 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G00159944977-c1ce-40ff-8b4e-dc3528f362da,
 53AF7497412F6E71185D8D05EFDE7032E43CC10F) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: <qemu-ppc@nongnu.org>, <qemu-devel@nongnu.org>
Subject: [PATCH 08/14] ppc/pnv: Introduce version and device_id class
 atributes for PHB4 devices
Date: Thu, 2 Dec 2021 15:42:29 +0100
Message-ID: <20211202144235.1276352-9-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211202144235.1276352-1-clg@kaod.org>
References: <20211202144235.1276352-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG3EX1.mxp5.local (172.16.2.21) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: f53d931a-0249-4215-bcb2-fa80a0218ca4
X-Ovh-Tracer-Id: 15807916169039022886
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrieehgdeijecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofgjfhggtgfgihesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeehheefgeejiedtffefteejudevjeeufeeugfdtfeeuleeuteevleeihffhgfdtleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheptghlgheskhgrohgurdhorhhg
Received-SPF: pass client-ip=46.105.48.137; envelope-from=clg@kaod.org;
 helo=9.mo548.mail-out.ovh.net
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

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 include/hw/pci-host/pnv_phb4.h | 2 ++
 hw/pci-host/pnv_phb4_pec.c     | 2 ++
 hw/ppc/pnv.c                   | 4 ++--
 3 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/include/hw/pci-host/pnv_phb4.h b/include/hw/pci-host/pnv_phb4.h
index 27556ae53425..b2864233641e 100644
--- a/include/hw/pci-host/pnv_phb4.h
+++ b/include/hw/pci-host/pnv_phb4.h
@@ -219,6 +219,8 @@ struct PnvPhb4PecClass {
     int compat_size;
     const char *stk_compat;
     int stk_compat_size;
+    uint64_t version;
+    uint64_t device_id;
 };
 
 #endif /* PCI_HOST_PNV_PHB4_H */
diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
index 741ddc90ed8d..9f722729ac50 100644
--- a/hw/pci-host/pnv_phb4_pec.c
+++ b/hw/pci-host/pnv_phb4_pec.c
@@ -499,6 +499,8 @@ static void pnv_pec_class_init(ObjectClass *klass, void *data)
     pecc->compat_size = sizeof(compat);
     pecc->stk_compat = stk_compat;
     pecc->stk_compat_size = sizeof(stk_compat);
+    pecc->version = PNV_PHB4_VERSION;
+    pecc->device_id = PNV_PHB4_DEVICE_ID;
 }
 
 static const TypeInfo pnv_pec_type_info = {
diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index 185464a1d443..0c65e1e88cf5 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -1408,9 +1408,9 @@ static void pnv_chip_power9_phb_realize(PnvChip *chip, Error **errp)
             object_property_set_int(obj, "index", phb_id, &error_fatal);
             object_property_set_int(obj, "chip-id", chip->chip_id,
                                     &error_fatal);
-            object_property_set_int(obj, "version", PNV_PHB4_VERSION,
+            object_property_set_int(obj, "version", pecc->version,
                                     &error_fatal);
-            object_property_set_int(obj, "device-id", PNV_PHB4_DEVICE_ID,
+            object_property_set_int(obj, "device-id", pecc->device_id,
                                     &error_fatal);
             object_property_set_link(obj, "stack", OBJECT(stack),
                                      &error_abort);
-- 
2.31.1


