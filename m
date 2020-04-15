Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B5D11A9309
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Apr 2020 08:15:40 +0200 (CEST)
Received: from localhost ([::1]:43914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jObKl-0000na-57
	for lists+qemu-devel@lfdr.de; Wed, 15 Apr 2020 02:15:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35939)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <its@irrelevant.dk>) id 1jOazL-0003Si-VD
 for qemu-devel@nongnu.org; Wed, 15 Apr 2020 01:53:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <its@irrelevant.dk>) id 1jOazK-00036g-QZ
 for qemu-devel@nongnu.org; Wed, 15 Apr 2020 01:53:31 -0400
Received: from charlie.dont.surf ([128.199.63.193]:47606)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <its@irrelevant.dk>)
 id 1jOazH-0002lj-43; Wed, 15 Apr 2020 01:53:27 -0400
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by charlie.dont.surf (Postfix) with ESMTPSA id E39BABFE23;
 Wed, 15 Apr 2020 05:52:35 +0000 (UTC)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-block@nongnu.org
Subject: [PATCH v7 48/48] nvme: make lba data size configurable
Date: Wed, 15 Apr 2020 07:51:40 +0200
Message-Id: <20200415055140.466900-49-its@irrelevant.dk>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200415055140.466900-1-its@irrelevant.dk>
References: <20200415055140.466900-1-its@irrelevant.dk>
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
 Maxim Levitsky <mlevitsk@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
Acked-by: Keith Busch <kbusch@kernel.org>
Reviewed-by: Maxim Levitsky <mlevitsk@redhat.com>
---
 hw/block/nvme-ns.c | 7 ++++++-
 hw/block/nvme-ns.h | 4 +++-
 hw/block/nvme.c    | 1 +
 3 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/hw/block/nvme-ns.c b/hw/block/nvme-ns.c
index bd64d4a94632..d34b6b2439f1 100644
--- a/hw/block/nvme-ns.c
+++ b/hw/block/nvme-ns.c
@@ -18,7 +18,7 @@ static int nvme_ns_init(NvmeNamespace *ns)
 {
     NvmeIdNs *id_ns =3D &ns->id_ns;
=20
-    id_ns->lbaf[0].ds =3D BDRV_SECTOR_BITS;
+    id_ns->lbaf[0].ds =3D ns->params.lbads;
     id_ns->nsze =3D cpu_to_le64(nvme_ns_nlbas(ns));
=20
     /* no thin provisioning */
@@ -78,6 +78,11 @@ static int nvme_ns_check_constraints(NvmeNamespace *ns=
, Error **errp)
         return -1;
     }
=20
+    if (ns->params.lbads < 9 || ns->params.lbads > 12) {
+        error_setg(errp, "unsupported lbads (supported: 9-12)");
+        return 1;
+    }
+
     return 0;
 }
=20
diff --git a/hw/block/nvme-ns.h b/hw/block/nvme-ns.h
index 3c3651d485d0..43b78f8b8d9c 100644
--- a/hw/block/nvme-ns.h
+++ b/hw/block/nvme-ns.h
@@ -7,10 +7,12 @@
=20
 #define DEFINE_NVME_NS_PROPERTIES(_state, _props) \
     DEFINE_PROP_DRIVE("drive", _state, blk), \
-    DEFINE_PROP_UINT32("nsid", _state, _props.nsid, 0)
+    DEFINE_PROP_UINT32("nsid", _state, _props.nsid, 0), \
+    DEFINE_PROP_UINT8("lbads", _state, _props.lbads, BDRV_SECTOR_BITS)
=20
 typedef struct NvmeNamespaceParams {
     uint32_t nsid;
+    uint8_t  lbads;
 } NvmeNamespaceParams;
=20
 typedef struct NvmeNamespace {
diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 40a400333828..dd2759a4ce2e 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -2690,6 +2690,7 @@ static void nvme_realize(PCIDevice *pci_dev, Error =
**errp)
     if (n->namespace.blk) {
         ns =3D &n->namespace;
         ns->params.nsid =3D 1;
+        ns->params.lbads =3D BDRV_SECTOR_BITS;
=20
         if (nvme_ns_setup(n, ns, errp)) {
             return;
--=20
2.26.0


