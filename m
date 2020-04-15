Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0B211A9A6E
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Apr 2020 12:29:15 +0200 (CEST)
Received: from localhost ([::1]:47294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jOfIA-0001So-Nc
	for lists+qemu-devel@lfdr.de; Wed, 15 Apr 2020 06:29:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43345)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <its@irrelevant.dk>) id 1jOfEd-0004DB-Ix
 for qemu-devel@nongnu.org; Wed, 15 Apr 2020 06:25:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <its@irrelevant.dk>) id 1jOfEb-0005Gb-Vm
 for qemu-devel@nongnu.org; Wed, 15 Apr 2020 06:25:35 -0400
Received: from charlie.dont.surf ([128.199.63.193]:48242)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <its@irrelevant.dk>)
 id 1jOfER-0004yV-3T; Wed, 15 Apr 2020 06:25:23 -0400
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by charlie.dont.surf (Postfix) with ESMTPSA id E608CBFD52;
 Wed, 15 Apr 2020 10:25:01 +0000 (UTC)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-block@nongnu.org
Subject: [PATCH 16/16] nvme: factor out controller identify setup
Date: Wed, 15 Apr 2020 12:24:45 +0200
Message-Id: <20200415102445.564803-17-its@irrelevant.dk>
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
 hw/block/nvme.c | 42 ++++++++++++++++++++++++------------------
 1 file changed, 24 insertions(+), 18 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 7387cf409f96..d1566b56381d 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -1428,27 +1428,11 @@ static void nvme_init_pci(NvmeCtrl *n, PCIDevice =
*pci_dev)
     }
 }
=20
-static void nvme_realize(PCIDevice *pci_dev, Error **errp)
+static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
 {
-    NvmeCtrl *n =3D NVME(pci_dev);
     NvmeIdCtrl *id =3D &n->id_ctrl;
+    uint8_t *pci_conf =3D pci_dev->config;
=20
-    int i;
-    uint8_t *pci_conf;
-
-    if (nvme_check_constraints(n, errp)) {
-        return;
-    }
-
-    nvme_init_state(n);
-
-    if (nvme_init_blk(n, errp)) {
-        return;
-    }
-
-    nvme_init_pci(n, pci_dev);
-
-    pci_conf =3D pci_dev->config;
     id->vid =3D cpu_to_le16(pci_get_word(pci_conf + PCI_VENDOR_ID));
     id->ssvid =3D cpu_to_le16(pci_get_word(pci_conf + PCI_SUBSYSTEM_VEND=
OR_ID));
     strpadcpy((char *)id->mn, sizeof(id->mn), "QEMU NVMe Ctrl", ' ');
@@ -1482,6 +1466,28 @@ static void nvme_realize(PCIDevice *pci_dev, Error=
 **errp)
     n->bar.vs =3D 0x00010200;
     n->bar.intmc =3D n->bar.intms =3D 0;
=20
+
+}
+
+static void nvme_realize(PCIDevice *pci_dev, Error **errp)
+{
+    NvmeCtrl *n =3D NVME(pci_dev);
+
+    int i;
+
+    if (nvme_check_constraints(n, errp)) {
+        return;
+    }
+
+    nvme_init_state(n);
+
+    if (nvme_init_blk(n, errp)) {
+        return;
+    }
+
+    nvme_init_pci(n, pci_dev);
+    nvme_init_ctrl(n, pci_dev);
+
     for (i =3D 0; i < n->num_namespaces; i++) {
         if (nvme_init_namespace(n, &n->namespaces[i], errp)) {
             return;
--=20
2.26.0


