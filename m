Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAB7C1AA2B9
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Apr 2020 15:05:08 +0200 (CEST)
Received: from localhost ([::1]:49628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jOhj1-0000td-Lh
	for lists+qemu-devel@lfdr.de; Wed, 15 Apr 2020 09:05:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33634)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <its@irrelevant.dk>) id 1jOhgR-00076q-Hf
 for qemu-devel@nongnu.org; Wed, 15 Apr 2020 09:02:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <its@irrelevant.dk>) id 1jOhgQ-0004Fd-Au
 for qemu-devel@nongnu.org; Wed, 15 Apr 2020 09:02:27 -0400
Received: from charlie.dont.surf ([128.199.63.193]:48568)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <its@irrelevant.dk>)
 id 1jOhgN-00046E-FC; Wed, 15 Apr 2020 09:02:23 -0400
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by charlie.dont.surf (Postfix) with ESMTPSA id 3C1C8BFD2C;
 Wed, 15 Apr 2020 13:02:22 +0000 (UTC)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-block@nongnu.org
Subject: [PATCH v2 06/16] nvme: refactor nvme_addr_read
Date: Wed, 15 Apr 2020 15:01:49 +0200
Message-Id: <20200415130159.611361-7-its@irrelevant.dk>
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

Pull the controller memory buffer check to its own function. The check
will be used on its own in later patches.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
Acked-by: Keith Busch <kbusch@kernel.org>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/block/nvme.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 563cccae6795..d026985f62d0 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -55,14 +55,22 @@
=20
 static void nvme_process_sq(void *opaque);
=20
+static bool nvme_addr_is_cmb(NvmeCtrl *n, hwaddr addr)
+{
+    hwaddr low =3D n->ctrl_mem.addr;
+    hwaddr hi  =3D n->ctrl_mem.addr + int128_get64(n->ctrl_mem.size);
+
+    return addr >=3D low && addr < hi;
+}
+
 static void nvme_addr_read(NvmeCtrl *n, hwaddr addr, void *buf, int size=
)
 {
-    if (n->cmbsz && addr >=3D n->ctrl_mem.addr &&
-                addr < (n->ctrl_mem.addr + int128_get64(n->ctrl_mem.size=
))) {
+    if (n->cmbsz && nvme_addr_is_cmb(n, addr)) {
         memcpy(buf, (void *)&n->cmbuf[addr - n->ctrl_mem.addr], size);
-    } else {
-        pci_dma_read(&n->parent_obj, addr, buf, size);
+        return;
     }
+
+    pci_dma_read(&n->parent_obj, addr, buf, size);
 }
=20
 static int nvme_check_sqid(NvmeCtrl *n, uint16_t sqid)
--=20
2.26.0


