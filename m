Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E999166DE5
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Feb 2020 04:41:04 +0100 (CET)
Received: from localhost ([::1]:51722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j4zBX-0007Ig-93
	for lists+qemu-devel@lfdr.de; Thu, 20 Feb 2020 22:41:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48504)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1j4z7l-0001sV-FD
 for qemu-devel@nongnu.org; Thu, 20 Feb 2020 22:37:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1j4z7k-0007wI-5A
 for qemu-devel@nongnu.org; Thu, 20 Feb 2020 22:37:09 -0500
Received: from ozlabs.org ([203.11.71.1]:38549)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1j4z7j-0007bh-PW; Thu, 20 Feb 2020 22:37:08 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 48NxwC0CKXz9sSK; Fri, 21 Feb 2020 14:36:58 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1582256219;
 bh=FjJLB2zzPGkBiMrFMYAkMVDtFMOLndxHvkxuqSMX2e0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FlHvSQKPV5us27lkNBJixkBY8gSm1m1aWbJMDOF9mQcgC7GvGYiHgxqw2aA1GavAt
 DFkGtGFTtn1myZUc3BwM/5ZMKalctrK0PPhu0iWdG64kCF0IbfiLf9/LXBINTOD8ca
 qvxjXFbyIGFsBbEo3brSl77wiUOd5fjeb1aqTfG0=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 03/20] ppc/pnv: Fix PCI_EXPRESS dependency
Date: Fri, 21 Feb 2020 14:36:33 +1100
Message-Id: <20200221033650.444386-4-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200221033650.444386-1-david@gibson.dropbear.id.au>
References: <20200221033650.444386-1-david@gibson.dropbear.id.au>
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
Cc: lvivier@redhat.com, aik@ozlabs.ru, qemu-devel@nongnu.org, groug@kaod.org,
 qemu-ppc@nongnu.org, clg@kaod.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Laurent Vivier <lvivier@redhat.com>

When PHB4 bridge has been added, the dependencies to PCIE_PORT has been
added to XIVE_SPAPR and indirectly to PSERIES.
The build of the PowerNV machine is fine while we also build the PSERIES
machine.
If we disable the PSERIES machine, the PowerNV build fails because the
PCI Express files are not built:

/usr/bin/ld: hw/ppc/pnv.o: in function `pnv_chip_power8_pic_print_info':
.../hw/ppc/pnv.c:623: undefined reference to `pnv_phb3_msi_pic_print_info=
'
/usr/bin/ld: hw/ppc/pnv.o: in function `pnv_chip_power9_pic_print_info':
.../hw/ppc/pnv.c:639: undefined reference to `pnv_phb4_pic_print_info'
/usr/bin/ld: ../hw/usb/hcd-ehci-pci.o: in function `usb_ehci_pci_write_co=
nfig':
.../hw/usb/hcd-ehci-pci.c:129: undefined reference to `pci_default_write_=
config'
/usr/bin/ld: ../hw/usb/hcd-ehci-pci.o: in function `usb_ehci_pci_realize'=
:
.../hw/usb/hcd-ehci-pci.c:68: undefined reference to `pci_allocate_irq'
/usr/bin/ld: .../hw/usb/hcd-ehci-pci.c:72: undefined reference to `pci_re=
gister_bar'
/usr/bin/ld: ../hw/usb/hcd-ehci-pci.o:(.data.rel+0x50): undefined referen=
ce to `vmstate_pci_device'

This patch fixes the problem by adding needed dependencies to POWERNV.

Fixes: 4f9924c4d4cf ("ppc/pnv: Add models for POWER9 PHB4 PCIe Host bridg=
e")
Signed-off-by: Laurent Vivier <lvivier@redhat.com>
Message-Id: <20200205232016.588202-3-lvivier@redhat.com>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/ppc/Kconfig b/hw/ppc/Kconfig
index 354828bf13..dd86e664d2 100644
--- a/hw/ppc/Kconfig
+++ b/hw/ppc/Kconfig
@@ -29,6 +29,8 @@ config POWERNV
     select XICS
     select XIVE
     select FDT_PPC
+    select PCI_EXPRESS
+    select MSI_NONBROKEN
=20
 config PPC405
     bool
@@ -135,8 +137,6 @@ config XIVE_SPAPR
     default y
     depends on PSERIES
     select XIVE
-    select PCI
-    select PCIE_PORT
=20
 config XIVE_KVM
     bool
--=20
2.24.1


