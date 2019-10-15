Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D5CD7390
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Oct 2019 12:42:51 +0200 (CEST)
Received: from localhost ([::1]:40158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iKKHy-0001ZP-87
	for lists+qemu-devel@lfdr.de; Tue, 15 Oct 2019 06:42:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47674)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <its@irrelevant.dk>) id 1iKKEY-0007Nh-S3
 for qemu-devel@nongnu.org; Tue, 15 Oct 2019 06:39:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <its@irrelevant.dk>) id 1iKKEX-0006Eq-HH
 for qemu-devel@nongnu.org; Tue, 15 Oct 2019 06:39:18 -0400
Received: from charlie.dont.surf ([128.199.63.193]:54784)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <its@irrelevant.dk>)
 id 1iKKEU-0006B4-NN; Tue, 15 Oct 2019 06:39:14 -0400
Received: from apples.localdomain (unknown [194.62.217.57])
 by charlie.dont.surf (Postfix) with ESMTPSA id 0B004BF80B;
 Tue, 15 Oct 2019 10:39:13 +0000 (UTC)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-block@nongnu.org
Subject: [PATCH v2 04/20] nvme: populate the mandatory subnqn and ver fields
Date: Tue, 15 Oct 2019 12:38:44 +0200
Message-Id: <20191015103900.313928-5-its@irrelevant.dk>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191015103900.313928-1-its@irrelevant.dk>
References: <20191015103900.313928-1-its@irrelevant.dk>
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Javier Gonzalez <javier@javigon.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Keith Busch <keith.busch@intel.com>,
 Paul Durrant <Paul.Durrant@citrix.com>, Stephen Bates <sbates@raithlin.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Required for compliance with NVMe revision 1.2.1 or later. See NVM
Express 1.2.1, Section 5.11 ("Identify command"), Figure 90 and Section
7.9 ("NVMe Qualified Names").

This also bumps the supported version to 1.2.1.

Signed-off-by: Klaus Jensen <klaus.jensen@cnexlabs.com>
---
 hw/block/nvme.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 277700fdcc58..16f0fba10b08 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -9,9 +9,9 @@
  */
=20
 /**
- * Reference Specs: http://www.nvmexpress.org, 1.2, 1.1, 1.0e
+ * Reference Specification: NVM Express 1.2.1
  *
- *  http://www.nvmexpress.org/resources/
+ *   https://nvmexpress.org/resources/specifications/
  */
=20
 /**
@@ -1366,6 +1366,7 @@ static void nvme_realize(PCIDevice *pci_dev, Error =
**errp)
     id->ieee[0] =3D 0x00;
     id->ieee[1] =3D 0x02;
     id->ieee[2] =3D 0xb3;
+    id->ver =3D cpu_to_le32(0x00010201);
     id->oacs =3D cpu_to_le16(0);
     id->frmw =3D 7 << 1;
     id->lpa =3D 1 << 0;
@@ -1373,6 +1374,10 @@ static void nvme_realize(PCIDevice *pci_dev, Error=
 **errp)
     id->cqes =3D (0x4 << 4) | 0x4;
     id->nn =3D cpu_to_le32(n->num_namespaces);
     id->oncs =3D cpu_to_le16(NVME_ONCS_WRITE_ZEROS | NVME_ONCS_TIMESTAMP=
);
+
+    strcpy((char *) id->subnqn, "nqn.2019-08.org.qemu:");
+    pstrcat((char *) id->subnqn, sizeof(id->subnqn), n->params.serial);
+
     id->psd[0].mp =3D cpu_to_le16(0x9c4);
     id->psd[0].enlat =3D cpu_to_le32(0x10);
     id->psd[0].exlat =3D cpu_to_le32(0x4);
@@ -1387,7 +1392,7 @@ static void nvme_realize(PCIDevice *pci_dev, Error =
**errp)
     NVME_CAP_SET_CSS(n->bar.cap, 1);
     NVME_CAP_SET_MPSMAX(n->bar.cap, 4);
=20
-    n->bar.vs =3D 0x00010200;
+    n->bar.vs =3D 0x00010201;
     n->bar.intmc =3D n->bar.intms =3D 0;
=20
     if (n->params.cmb_size_mb) {
--=20
2.23.0


