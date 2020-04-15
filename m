Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66A861A9A5E
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Apr 2020 12:26:44 +0200 (CEST)
Received: from localhost ([::1]:47236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jOfFj-0005NW-DR
	for lists+qemu-devel@lfdr.de; Wed, 15 Apr 2020 06:26:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42864)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <its@irrelevant.dk>) id 1jOfE3-0003Qh-SA
 for qemu-devel@nongnu.org; Wed, 15 Apr 2020 06:25:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <its@irrelevant.dk>) id 1jOfE2-0004ur-Uu
 for qemu-devel@nongnu.org; Wed, 15 Apr 2020 06:24:59 -0400
Received: from charlie.dont.surf ([128.199.63.193]:48092)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <its@irrelevant.dk>)
 id 1jOfE0-0004tD-KM; Wed, 15 Apr 2020 06:24:56 -0400
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by charlie.dont.surf (Postfix) with ESMTPSA id 754FABF9DF;
 Wed, 15 Apr 2020 10:24:55 +0000 (UTC)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-block@nongnu.org
Subject: [PATCH 01/16] nvme: fix pci doorbell size calculation
Date: Wed, 15 Apr 2020 12:24:30 +0200
Message-Id: <20200415102445.564803-2-its@irrelevant.dk>
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

The size of the BAR is 0x1000 (main registers) + 8 bytes for each
queue. Currently, the size of the BAR is calculated like so:

    n->reg_size =3D pow2ceil(0x1004 + 2 * (n->params.num_queues + 1) * 4)=
;

Since the 'num_queues' parameter already accounts for the admin queue,
this should in any case not need to be incremented by one. Also, the
size should be initialized to (0x1000).

    n->reg_size =3D pow2ceil(0x1000 + 2 * n->params.num_queues * 4);

This, with the default value of num_queues (64), we will set aside room
for 1 admin queue and 63 I/O queues (4 bytes per doorbell, 2 doorbells
per queue).

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index d28335cbf377..77f9c151a665 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -1345,7 +1345,7 @@ static void nvme_realize(PCIDevice *pci_dev, Error =
**errp)
     pcie_endpoint_cap_init(pci_dev, 0x80);
=20
     n->num_namespaces =3D 1;
-    n->reg_size =3D pow2ceil(0x1004 + 2 * (n->num_queues + 1) * 4);
+    n->reg_size =3D pow2ceil(0x1000 + 2 * n->num_queues * 4);
     n->ns_size =3D bs_size / (uint64_t)n->num_namespaces;
=20
     n->namespaces =3D g_new0(NvmeNamespace, n->num_namespaces);
--=20
2.26.0


