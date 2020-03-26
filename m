Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94E2619380B
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Mar 2020 06:45:08 +0100 (CET)
Received: from localhost ([::1]:46814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jHLKF-00007P-M5
	for lists+qemu-devel@lfdr.de; Thu, 26 Mar 2020 01:45:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46190)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1jHLFb-00039s-OP
 for qemu-devel@nongnu.org; Thu, 26 Mar 2020 01:40:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1jHLFa-0000pt-Ny
 for qemu-devel@nongnu.org; Thu, 26 Mar 2020 01:40:19 -0400
Received: from ozlabs.org ([203.11.71.1]:51025)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1jHLFZ-0000nW-SX; Thu, 26 Mar 2020 01:40:18 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 48nv2k5nlVz9sSM; Thu, 26 Mar 2020 16:40:14 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1585201214;
 bh=Xnj7Byw+xZ7EE+Dq9Ql9GDjnSE2VDcNynX+uZRnbRPQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=K9sdZRC0LpsZlSYRBILHxE5EHaFwe3r7ljsn1XdIgPWfp+XsmFrL/NlEb0D7mqPHC
 3H0+kZmNgKWipKclijGwVe7UfsOeXuIDVxioaejSjHDezea+LWpzTbxER7ay4cx0iE
 H/xKNYloFbs0Wa3moPm5l4+u4rWvJb7lbfGyrQYM=
From: David Gibson <david@gibson.dropbear.id.au>
To: aik@ozlabs.ru,
	groug@kaod.org
Subject: [RFC for-5.1 2/4] spapr: Helper to determine if a device is NVLink2
 related
Date: Thu, 26 Mar 2020 16:40:07 +1100
Message-Id: <20200326054009.454477-3-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200326054009.454477-1-david@gibson.dropbear.id.au>
References: <20200326054009.454477-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 203.11.71.1
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
Cc: David Gibson <david@gibson.dropbear.id.au>, qemu-ppc@nongnu.org,
 clg@kaod.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This adds a simple exported helper function which determins if a given
(supposedly) PCI device is actually an NVLink2 device, which has some
special considerations.

Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/spapr_pci_nvlink2.c  | 5 +++++
 include/hw/pci-host/spapr.h | 1 +
 2 files changed, 6 insertions(+)

diff --git a/hw/ppc/spapr_pci_nvlink2.c b/hw/ppc/spapr_pci_nvlink2.c
index 7d3a685421..0cec1ae02b 100644
--- a/hw/ppc/spapr_pci_nvlink2.c
+++ b/hw/ppc/spapr_pci_nvlink2.c
@@ -449,6 +449,11 @@ static bool is_nvnpu(PCIDevice *dev, SpaprPhbState *=
sphb, int *slot, int *link)
     return false;
 }
=20
+bool spapr_phb_is_nvlink_dev(PCIDevice *dev, SpaprPhbState *sphb)
+{
+    return is_nvgpu(dev, sphb, NULL) || is_nvnpu(dev, sphb, NULL, NULL);
+}
+
 void spapr_phb_nvgpu_populate_pcidev_dt(PCIDevice *dev, void *fdt, int o=
ffset,
                                         SpaprPhbState *sphb)
 {
diff --git a/include/hw/pci-host/spapr.h b/include/hw/pci-host/spapr.h
index 8877ff51fb..eaba4a5825 100644
--- a/include/hw/pci-host/spapr.h
+++ b/include/hw/pci-host/spapr.h
@@ -156,6 +156,7 @@ void spapr_phb_nvgpu_free(SpaprPhbState *sphb);
 void spapr_phb_nvgpu_populate_dt(SpaprPhbState *sphb, void *fdt, int bus=
_off,
                                  Error **errp);
 void spapr_phb_nvgpu_ram_populate_dt(SpaprPhbState *sphb, void *fdt);
+bool spapr_phb_is_nvlink_dev(PCIDevice *dev, SpaprPhbState *sphb);
 void spapr_phb_nvgpu_populate_pcidev_dt(PCIDevice *dev, void *fdt, int o=
ffset,
                                         SpaprPhbState *sphb);
 #else
--=20
2.25.1


