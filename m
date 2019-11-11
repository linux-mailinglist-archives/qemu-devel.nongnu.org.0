Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BAD0F7428
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Nov 2019 13:38:07 +0100 (CET)
Received: from localhost ([::1]:51924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iU8xJ-0004dD-VQ
	for lists+qemu-devel@lfdr.de; Mon, 11 Nov 2019 07:38:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37166)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <its@irrelevant.dk>) id 1iU8m5-0008EI-Tj
 for qemu-devel@nongnu.org; Mon, 11 Nov 2019 07:26:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <its@irrelevant.dk>) id 1iU8m3-0003ZU-Re
 for qemu-devel@nongnu.org; Mon, 11 Nov 2019 07:26:29 -0500
Received: from charlie.dont.surf ([128.199.63.193]:52298)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <its@irrelevant.dk>)
 id 1iU8m0-0003R5-I2; Mon, 11 Nov 2019 07:26:24 -0500
Received: from apples.localdomain (unknown [194.62.217.57])
 by charlie.dont.surf (Postfix) with ESMTPSA id 72ED1BFB17;
 Mon, 11 Nov 2019 12:26:03 +0000 (UTC)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-block@nongnu.org
Subject: [PATCH v3 19/21] nvme: make lba data size configurable
Date: Mon, 11 Nov 2019 13:25:43 +0100
Message-Id: <20191111122545.252478-20-its@irrelevant.dk>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191111122545.252478-1-its@irrelevant.dk>
References: <20191111122545.252478-1-its@irrelevant.dk>
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
Cc: Kevin Wolf <kwolf@redhat.com>, Javier Gonzalez <javier@javigon.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Paul Durrant <Paul.Durrant@citrix.com>, Keith Busch <kbusch@kernel.org>,
 Stephen Bates <sbates@raithlin.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme-ns.c | 2 +-
 hw/block/nvme-ns.h | 4 +++-
 hw/block/nvme.c    | 1 +
 3 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/hw/block/nvme-ns.c b/hw/block/nvme-ns.c
index 36deedee07a6..dc7e63b01037 100644
--- a/hw/block/nvme-ns.c
+++ b/hw/block/nvme-ns.c
@@ -18,7 +18,7 @@ static int nvme_ns_init(NvmeNamespace *ns)
 {
     NvmeIdNs *id_ns =3D &ns->id_ns;
=20
-    id_ns->lbaf[0].ds =3D BDRV_SECTOR_BITS;
+    id_ns->lbaf[0].ds =3D ns->params.lbads;
     id_ns->nuse =3D id_ns->ncap =3D id_ns->nsze =3D
         cpu_to_le64(nvme_ns_nlbas(ns));
=20
diff --git a/hw/block/nvme-ns.h b/hw/block/nvme-ns.h
index b564bac25f6d..9d519182c3a5 100644
--- a/hw/block/nvme-ns.h
+++ b/hw/block/nvme-ns.h
@@ -7,10 +7,12 @@
=20
 #define DEFINE_NVME_NS_PROPERTIES(_state, _props) \
     DEFINE_PROP_DRIVE("drive", _state, blk), \
-    DEFINE_PROP_UINT32("nsid", _state, _props.nsid, 0)
+    DEFINE_PROP_UINT32("nsid", _state, _props.nsid, 0), \
+    DEFINE_PROP_UINT8("lbads", _state, _props.lbads, 9)
=20
 typedef struct NvmeNamespaceParams {
     uint32_t nsid;
+    uint8_t  lbads;
 } NvmeNamespaceParams;
=20
 typedef struct NvmeNamespace {
diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 81322bb79e4c..3acbaaa79008 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -2599,6 +2599,7 @@ static void nvme_realize(PCIDevice *pci_dev, Error =
**errp)
     if (n->namespace.blk) {
         ns =3D &n->namespace;
         ns->params.nsid =3D 1;
+        ns->params.lbads =3D 9;
=20
         if (nvme_ns_setup(n, ns, &local_err)) {
             error_propagate_prepend(errp, local_err, "nvme_ns_setup: ");
--=20
2.24.0


