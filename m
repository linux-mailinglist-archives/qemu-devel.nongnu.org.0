Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E581F7435
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Nov 2019 13:42:35 +0100 (CET)
Received: from localhost ([::1]:51974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iU91e-0000p4-Gm
	for lists+qemu-devel@lfdr.de; Mon, 11 Nov 2019 07:42:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37165)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <its@irrelevant.dk>) id 1iU8m5-0008ED-TZ
 for qemu-devel@nongnu.org; Mon, 11 Nov 2019 07:26:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <its@irrelevant.dk>) id 1iU8m3-0003ZH-K0
 for qemu-devel@nongnu.org; Mon, 11 Nov 2019 07:26:29 -0500
Received: from charlie.dont.surf ([128.199.63.193]:52274)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <its@irrelevant.dk>)
 id 1iU8lz-0003QT-Rd; Mon, 11 Nov 2019 07:26:24 -0500
Received: from apples.localdomain (unknown [194.62.217.57])
 by charlie.dont.surf (Postfix) with ESMTPSA id C4A26BFB12;
 Mon, 11 Nov 2019 12:26:02 +0000 (UTC)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-block@nongnu.org
Subject: [PATCH v3 17/21] nvme: bump controller pci device id
Date: Mon, 11 Nov 2019 13:25:41 +0100
Message-Id: <20191111122545.252478-18-its@irrelevant.dk>
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

Since commits 9d6459d21a6e ("nvme: fix write zeroes offset and count")
and c7fe50bcf1f1 ("nvme: support multiple namespaces") the controller
device no longer has the quirks that the Linux kernel think it has.

As the quirks are applied based on pci vendor and device id, bump the
device id to get rid of them.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 7bd5c1bb2f55..57e3a465c688 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -2496,7 +2496,7 @@ static void nvme_init_pci(NvmeCtrl *n, PCIDevice *p=
ci_dev)
     pci_conf[PCI_INTERRUPT_PIN] =3D 1;
     pci_config_set_prog_interface(pci_conf, 0x2);
     pci_config_set_vendor_id(pci_conf, PCI_VENDOR_ID_INTEL);
-    pci_config_set_device_id(pci_conf, 0x5845);
+    pci_config_set_device_id(pci_conf, 0x5846);
     pci_config_set_class(pci_conf, PCI_CLASS_STORAGE_EXPRESS);
     pcie_endpoint_cap_init(pci_dev, 0x80);
=20
@@ -2652,7 +2652,7 @@ static void nvme_class_init(ObjectClass *oc, void *=
data)
     pc->exit =3D nvme_exit;
     pc->class_id =3D PCI_CLASS_STORAGE_EXPRESS;
     pc->vendor_id =3D PCI_VENDOR_ID_INTEL;
-    pc->device_id =3D 0x5845;
+    pc->device_id =3D 0x5846;
     pc->revision =3D 2;
=20
     set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
--=20
2.24.0


