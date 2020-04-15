Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 510171AA3A7
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Apr 2020 15:16:09 +0200 (CEST)
Received: from localhost ([::1]:49924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jOhtg-0004P3-DT
	for lists+qemu-devel@lfdr.de; Wed, 15 Apr 2020 09:16:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33929)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <its@irrelevant.dk>) id 1jOhgv-0007ZZ-Jl
 for qemu-devel@nongnu.org; Wed, 15 Apr 2020 09:02:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <its@irrelevant.dk>) id 1jOhgu-0004bM-FK
 for qemu-devel@nongnu.org; Wed, 15 Apr 2020 09:02:57 -0400
Received: from charlie.dont.surf ([128.199.63.193]:48660)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <its@irrelevant.dk>)
 id 1jOhgl-0004H0-QV; Wed, 15 Apr 2020 09:02:47 -0400
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by charlie.dont.surf (Postfix) with ESMTPSA id 76ECFBFD5F;
 Wed, 15 Apr 2020 13:02:26 +0000 (UTC)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-block@nongnu.org
Subject: [PATCH v2 16/16] nvme: factor out controller identify setup
Date: Wed, 15 Apr 2020 15:01:59 +0200
Message-Id: <20200415130159.611361-17-its@irrelevant.dk>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200415130159.611361-1-its@irrelevant.dk>
References: <20200415130159.611361-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/block/nvme.c | 52 +++++++++++++++++++++++++++----------------------
 1 file changed, 29 insertions(+), 23 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 4c28d75e0fc8..804f24719dce 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -1422,32 +1422,11 @@ static void nvme_init_pci(NvmeCtrl *n, PCIDevice =
*pci_dev)
     }
 }
=20
-static void nvme_realize(PCIDevice *pci_dev, Error **errp)
+static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
 {
-    NvmeCtrl *n =3D NVME(pci_dev);
     NvmeIdCtrl *id =3D &n->id_ctrl;
-    Error *err =3D NULL;
+    uint8_t *pci_conf =3D pci_dev->config;
=20
-    int i;
-    uint8_t *pci_conf;
-
-    nvme_check_constraints(n, &err);
-    if (err) {
-        error_propagate(errp, err);
-        return;
-    }
-
-    nvme_init_state(n);
-
-    nvme_init_blk(n, &err);
-    if (err) {
-        error_propagate(errp, err);
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
@@ -1481,6 +1460,33 @@ static void nvme_realize(PCIDevice *pci_dev, Error=
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
+    Error *err =3D NULL;
+
+    int i;
+
+    nvme_check_constraints(n, &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+
+
+    nvme_init_state(n);
+    nvme_init_blk(n, &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+
+    nvme_init_pci(n, pci_dev);
+    nvme_init_ctrl(n, pci_dev);
+
     for (i =3D 0; i < n->num_namespaces; i++) {
         nvme_init_namespace(n, &n->namespaces[i], &err);
         if (err) {
--=20
2.26.0


