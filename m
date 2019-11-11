Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 871B1F741B
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Nov 2019 13:37:46 +0100 (CET)
Received: from localhost ([::1]:51904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iU8wy-00045U-Tm
	for lists+qemu-devel@lfdr.de; Mon, 11 Nov 2019 07:37:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36956)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <its@irrelevant.dk>) id 1iU8lk-0007hA-RP
 for qemu-devel@nongnu.org; Mon, 11 Nov 2019 07:26:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <its@irrelevant.dk>) id 1iU8lf-0003Qp-Iz
 for qemu-devel@nongnu.org; Mon, 11 Nov 2019 07:26:08 -0500
Received: from charlie.dont.surf ([128.199.63.193]:52158)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <its@irrelevant.dk>)
 id 1iU8lc-0003Nf-IF; Mon, 11 Nov 2019 07:26:00 -0500
Received: from apples.localdomain (unknown [194.62.217.57])
 by charlie.dont.surf (Postfix) with ESMTPSA id 9CD64BF80B;
 Mon, 11 Nov 2019 12:25:58 +0000 (UTC)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-block@nongnu.org
Subject: [PATCH v3 05/21] nvme: allow completion queues in the cmb
Date: Mon, 11 Nov 2019 13:25:29 +0100
Message-Id: <20191111122545.252478-6-its@irrelevant.dk>
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

Allow completion queues in the controller memory buffer.

This also inlines the nvme_addr_{read,write} functions and adds an
nvme_addr_is_cmb helper.

Signed-off-by: Klaus Jensen <klaus.jensen@cnexlabs.com>
---
 hw/block/nvme.c | 38 +++++++++++++++++++++++++++++---------
 1 file changed, 29 insertions(+), 9 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 16f0fba10b08..daa2367b0863 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -52,14 +52,34 @@
=20
 static void nvme_process_sq(void *opaque);
=20
-static void nvme_addr_read(NvmeCtrl *n, hwaddr addr, void *buf, int size=
)
+static inline bool nvme_addr_is_cmb(NvmeCtrl *n, hwaddr addr)
 {
-    if (n->cmbsz && addr >=3D n->ctrl_mem.addr &&
-                addr < (n->ctrl_mem.addr + int128_get64(n->ctrl_mem.size=
))) {
-        memcpy(buf, (void *)&n->cmbuf[addr - n->ctrl_mem.addr], size);
-    } else {
-        pci_dma_read(&n->parent_obj, addr, buf, size);
+    hwaddr low =3D n->ctrl_mem.addr;
+    hwaddr hi  =3D n->ctrl_mem.addr + int128_get64(n->ctrl_mem.size);
+
+    return addr >=3D low && addr < hi;
+}
+
+static inline void nvme_addr_read(NvmeCtrl *n, hwaddr addr, void *buf,
+    int size)
+{
+    if (n->cmbsz && nvme_addr_is_cmb(n, addr)) {
+        memcpy(buf, (void *) &n->cmbuf[addr - n->ctrl_mem.addr], size);
+        return;
     }
+
+    pci_dma_read(&n->parent_obj, addr, buf, size);
+}
+
+static inline void nvme_addr_write(NvmeCtrl *n, hwaddr addr, void *buf,
+    int size)
+{
+    if (n->cmbsz && nvme_addr_is_cmb(n, addr)) {
+        memcpy((void *) &n->cmbuf[addr - n->ctrl_mem.addr], buf, size);
+        return;
+    }
+
+    pci_dma_write(&n->parent_obj, addr, buf, size);
 }
=20
 static int nvme_check_sqid(NvmeCtrl *n, uint16_t sqid)
@@ -281,6 +301,7 @@ static void nvme_post_cqes(void *opaque)
=20
     QTAILQ_FOREACH_SAFE(req, &cq->req_list, entry, next) {
         NvmeSQueue *sq;
+        NvmeCqe *cqe =3D &req->cqe;
         hwaddr addr;
=20
         if (nvme_cq_full(cq)) {
@@ -294,8 +315,7 @@ static void nvme_post_cqes(void *opaque)
         req->cqe.sq_head =3D cpu_to_le16(sq->head);
         addr =3D cq->dma_addr + cq->tail * n->cqe_size;
         nvme_inc_cq_tail(cq);
-        pci_dma_write(&n->parent_obj, addr, (void *)&req->cqe,
-            sizeof(req->cqe));
+        nvme_addr_write(n, addr, (void *) cqe, sizeof(*cqe));
         QTAILQ_INSERT_TAIL(&sq->req_list, req, entry);
     }
     if (cq->tail !=3D cq->head) {
@@ -1401,7 +1421,7 @@ static void nvme_realize(PCIDevice *pci_dev, Error =
**errp)
         NVME_CMBLOC_SET_OFST(n->bar.cmbloc, 0);
=20
         NVME_CMBSZ_SET_SQS(n->bar.cmbsz, 1);
-        NVME_CMBSZ_SET_CQS(n->bar.cmbsz, 0);
+        NVME_CMBSZ_SET_CQS(n->bar.cmbsz, 1);
         NVME_CMBSZ_SET_LISTS(n->bar.cmbsz, 0);
         NVME_CMBSZ_SET_RDS(n->bar.cmbsz, 1);
         NVME_CMBSZ_SET_WDS(n->bar.cmbsz, 1);
--=20
2.24.0


