Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E3E51A9A99
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Apr 2020 12:33:20 +0200 (CEST)
Received: from localhost ([::1]:47396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jOfM7-0007CP-NQ
	for lists+qemu-devel@lfdr.de; Wed, 15 Apr 2020 06:33:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43054)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <its@irrelevant.dk>) id 1jOfE8-0003Ya-NR
 for qemu-devel@nongnu.org; Wed, 15 Apr 2020 06:25:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <its@irrelevant.dk>) id 1jOfE7-000507-Jh
 for qemu-devel@nongnu.org; Wed, 15 Apr 2020 06:25:04 -0400
Received: from charlie.dont.surf ([128.199.63.193]:48182)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <its@irrelevant.dk>)
 id 1jOfE4-0004vp-LG; Wed, 15 Apr 2020 06:25:00 -0400
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by charlie.dont.surf (Postfix) with ESMTPSA id 87540BF7AF;
 Wed, 15 Apr 2020 10:24:59 +0000 (UTC)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-block@nongnu.org
Subject: [PATCH 10/16] nvme: factor out device state setup
Date: Wed, 15 Apr 2020 12:24:39 +0200
Message-Id: <20200415102445.564803-11-its@irrelevant.dk>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200415102445.564803-1-its@irrelevant.dk>
References: <20200415102445.564803-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 128.199.63.193
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, Beata Michalska <beata.michalska@linaro.org>,
 Klaus Jensen <k.jensen@samsung.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Klaus Jensen <its@irrelevant.dk>,
 Keith Busch <kbusch@kernel.org>, Javier Gonzalez <javier.gonz@samsung.com>,
 Maxim Levitsky <mlevitsk@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 635292d6fac4..e67f578fbf79 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -1339,6 +1339,15 @@ static int nvme_check_constraints(NvmeCtrl *n, Err=
or **errp)
     return 0;
 }
=20
+static void nvme_init_state(NvmeCtrl *n)
+{
+    n->num_namespaces =3D 1;
+    n->reg_size =3D pow2ceil(0x1008 + 2 * (n->params.max_ioqpairs) * 4);
+    n->namespaces =3D g_new0(NvmeNamespace, n->num_namespaces);
+    n->sq =3D g_new0(NvmeSQueue *, n->params.max_ioqpairs + 1);
+    n->cq =3D g_new0(NvmeCQueue *, n->params.max_ioqpairs + 1);
+}
+
 static void nvme_realize(PCIDevice *pci_dev, Error **errp)
 {
     NvmeCtrl *n =3D NVME(pci_dev);
@@ -1352,6 +1361,8 @@ static void nvme_realize(PCIDevice *pci_dev, Error =
**errp)
         return;
     }
=20
+    nvme_init_state(n);
+
     bs_size =3D blk_getlength(n->conf.blk);
     if (bs_size < 0) {
         error_setg(errp, "could not get backing file size");
@@ -1370,14 +1381,8 @@ static void nvme_realize(PCIDevice *pci_dev, Error=
 **errp)
     pci_config_set_class(pci_dev->config, PCI_CLASS_STORAGE_EXPRESS);
     pcie_endpoint_cap_init(pci_dev, 0x80);
=20
-    n->num_namespaces =3D 1;
-    n->reg_size =3D pow2ceil(0x1008 + 2 * (n->params.max_ioqpairs) * 4);
     n->ns_size =3D bs_size / (uint64_t)n->num_namespaces;
=20
-    n->namespaces =3D g_new0(NvmeNamespace, n->num_namespaces);
-    n->sq =3D g_new0(NvmeSQueue *, n->params.max_ioqpairs + 1);
-    n->cq =3D g_new0(NvmeCQueue *, n->params.max_ioqpairs + 1);
-
     memory_region_init_io(&n->iomem, OBJECT(n), &nvme_mmio_ops, n,
                           "nvme", n->reg_size);
     pci_register_bar(pci_dev, 0,
--=20
2.26.0


