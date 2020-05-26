Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3926A1AA334
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Apr 2020 15:11:25 +0200 (CEST)
Received: from localhost ([::1]:49796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jOhp6-0004tQ-6f
	for lists+qemu-devel@lfdr.de; Wed, 15 Apr 2020 09:11:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33773)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <its@irrelevant.dk>) id 1jOhgb-0007Lz-QR
 for qemu-devel@nongnu.org; Wed, 15 Apr 2020 09:02:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <its@irrelevant.dk>) id 1jOhgR-0004HJ-9m
 for qemu-devel@nongnu.org; Wed, 15 Apr 2020 09:02:37 -0400
Received: from charlie.dont.surf ([128.199.63.193]:48588)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <its@irrelevant.dk>)
 id 1jOhgO-00048m-96; Wed, 15 Apr 2020 09:02:24 -0400
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by charlie.dont.surf (Postfix) with ESMTPSA id 0A19FBFD37;
 Wed, 15 Apr 2020 13:02:23 +0000 (UTC)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-block@nongnu.org
Subject: [PATCH v2 08/16] nvme: remove redundant cmbloc/cmbsz members
Date: Wed, 15 Apr 2020 15:01:51 +0200
Message-Id: <20200415130159.611361-9-its@irrelevant.dk>
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
 hw/block/nvme.c | 7 ++-----
 hw/block/nvme.h | 2 --
 2 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 8092c1b46eb1..44856e873fd1 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -66,7 +66,7 @@ static bool nvme_addr_is_cmb(NvmeCtrl *n, hwaddr addr)
=20
 static void nvme_addr_read(NvmeCtrl *n, hwaddr addr, void *buf, int size=
)
 {
-    if (n->cmbsz && nvme_addr_is_cmb(n, addr)) {
+    if (n->bar.cmbsz && nvme_addr_is_cmb(n, addr)) {
         memcpy(buf, (void *)&n->cmbuf[addr - n->ctrl_mem.addr], size);
         return;
     }
@@ -160,7 +160,7 @@ static uint16_t nvme_map_prp(QEMUSGList *qsg, QEMUIOV=
ector *iov, uint64_t prp1,
     if (unlikely(!prp1)) {
         trace_pci_nvme_err_invalid_prp();
         return NVME_INVALID_FIELD | NVME_DNR;
-    } else if (n->cmbsz && prp1 >=3D n->ctrl_mem.addr &&
+    } else if (n->bar.cmbsz && prp1 >=3D n->ctrl_mem.addr &&
                prp1 < n->ctrl_mem.addr + int128_get64(n->ctrl_mem.size))=
 {
         qsg->nsg =3D 0;
         qemu_iovec_init(iov, num_prps);
@@ -1425,9 +1425,6 @@ static void nvme_realize(PCIDevice *pci_dev, Error =
**errp)
         NVME_CMBSZ_SET_SZU(n->bar.cmbsz, 2); /* MBs */
         NVME_CMBSZ_SET_SZ(n->bar.cmbsz, n->params.cmb_size_mb);
=20
-        n->cmbloc =3D n->bar.cmbloc;
-        n->cmbsz =3D n->bar.cmbsz;
-
         n->cmbuf =3D g_malloc0(NVME_CMBSZ_GETSIZE(n->bar.cmbsz));
         memory_region_init_io(&n->ctrl_mem, OBJECT(n), &nvme_cmb_ops, n,
                               "nvme-cmb", NVME_CMBSZ_GETSIZE(n->bar.cmbs=
z));
diff --git a/hw/block/nvme.h b/hw/block/nvme.h
index 1617787af2e9..7eecfd3a50f6 100644
--- a/hw/block/nvme.h
+++ b/hw/block/nvme.h
@@ -88,8 +88,6 @@ typedef struct NvmeCtrl {
     uint32_t    num_namespaces;
     uint32_t    max_q_ents;
     uint64_t    ns_size;
-    uint32_t    cmbsz;
-    uint32_t    cmbloc;
     uint8_t     *cmbuf;
     uint64_t    irq_status;
     uint64_t    host_timestamp;                 /* Timestamp sent by the=
 host */
--=20
2.26.0


