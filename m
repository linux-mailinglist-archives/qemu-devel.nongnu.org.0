Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D21D3475E53
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 18:16:23 +0100 (CET)
Received: from localhost ([::1]:46384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxXt8-0007fS-Vo
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 12:16:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mxXcU-0005Z7-5D
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 11:59:10 -0500
Received: from 5.mo552.mail-out.ovh.net ([188.165.45.220]:45201)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mxXcL-0003Vv-Ix
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 11:59:09 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.140])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id D1AA921283;
 Wed, 15 Dec 2021 16:58:59 +0000 (UTC)
Received: from kaod.org (37.59.142.95) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Wed, 15 Dec
 2021 17:58:59 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G0015e70c0e1-3a38-42a8-9558-d2b2f1ef08d8,
 DB2000250E14A505ED1736C7348301D5E40ED0AA) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 90.76.172.47
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: <qemu-ppc@nongnu.org>, <qemu-devel@nongnu.org>
Subject: [PULL 011/102] pci-host: Allow extended config space access for
 PowerNV PHB4 model
Date: Wed, 15 Dec 2021 17:57:16 +0100
Message-ID: <20211215165847.321042-12-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211215165847.321042-1-clg@kaod.org>
References: <20211215165847.321042-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG8EX2.mxp5.local (172.16.2.72) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: ece84a36-1d44-412f-b801-07571fb86b02
X-Ovh-Tracer-Id: 2221119045429726057
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrledvgdeljecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofgjfhggtgfgihesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeehheefgeejiedtffefteejudevjeeufeeugfdtfeeuleeuteevleeihffhgfdtleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleehnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheptghlgheskhgrohgurdhorhhg
Received-SPF: pass client-ip=188.165.45.220; envelope-from=clg@kaod.org;
 helo=5.mo552.mail-out.ovh.net
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
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Christophe Lombard <clombard@linux.vnet.ibm.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Christophe Lombard <clombard@linux.vnet.ibm.com>

The PCIe extended configuration space on the device is not currently
accessible to the host. if by default,  it is still inaccessible for
conventional for PCIe buses, add the current flag
PCI_BUS_EXTENDED_CONFIG_SPACE on the root bus permits PCI-E extended
config space access.

Signed-off-by: Christophe Lombard <clombard@linux.vnet.ibm.com>
Reviewed-by: Frederic Barrat <fbarrat@linux.ibm.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <20211109145053.43524-1-clombard@linux.vnet.ibm.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/pci-host/pnv_phb4.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
index 5c375a9f285d..40b793201a34 100644
--- a/hw/pci-host/pnv_phb4.c
+++ b/hw/pci-host/pnv_phb4.c
@@ -1205,6 +1205,7 @@ static void pnv_phb4_realize(DeviceState *dev, Error **errp)
                                      &phb->pci_mmio, &phb->pci_io,
                                      0, 4, TYPE_PNV_PHB4_ROOT_BUS);
     pci_setup_iommu(pci->bus, pnv_phb4_dma_iommu, phb);
+    pci->bus->flags |= PCI_BUS_EXTENDED_CONFIG_SPACE;
 
     /* Add a single Root port */
     qdev_prop_set_uint8(DEVICE(&phb->root), "chassis", phb->chip_id);
-- 
2.31.1


