Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C635D39C9
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Oct 2019 09:04:28 +0200 (CEST)
Received: from localhost ([::1]:46370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iIoyR-0008E7-Fc
	for lists+qemu-devel@lfdr.de; Fri, 11 Oct 2019 03:04:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58057)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <its@irrelevant.dk>) id 1iIow6-0007CE-9T
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 03:02:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <its@irrelevant.dk>) id 1iIow4-0007lR-Qe
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 03:02:01 -0400
Received: from charlie.dont.surf ([128.199.63.193]:46528)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <its@irrelevant.dk>) id 1iIow4-0007hd-KT
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 03:02:00 -0400
Received: from apples.localdomain (unknown [194.62.217.57])
 by charlie.dont.surf (Postfix) with ESMTPSA id DD0C6BF73F;
 Fri, 11 Oct 2019 07:01:57 +0000 (UTC)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/1] pci: pass along the return value of dma_memory_rw
Date: Fri, 11 Oct 2019 09:01:41 +0200
Message-Id: <20191011070141.188713-2-its@irrelevant.dk>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191011070141.188713-1-its@irrelevant.dk>
References: <20191011070141.188713-1-its@irrelevant.dk>
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Some might actually care about the return value of dma_memory_rw. So
let us pass it along instead of ignoring it.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 include/hw/pci/pci.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index f3f0ffd5fb78..4e95bb847857 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -779,8 +779,7 @@ static inline AddressSpace *pci_get_address_space(PCI=
Device *dev)
 static inline int pci_dma_rw(PCIDevice *dev, dma_addr_t addr,
                              void *buf, dma_addr_t len, DMADirection dir=
)
 {
-    dma_memory_rw(pci_get_address_space(dev), addr, buf, len, dir);
-    return 0;
+    return dma_memory_rw(pci_get_address_space(dev), addr, buf, len, dir=
);
 }
=20
 static inline int pci_dma_read(PCIDevice *dev, dma_addr_t addr,
--=20
2.23.0


