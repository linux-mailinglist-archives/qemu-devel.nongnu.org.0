Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7468015518A
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Feb 2020 05:32:42 +0100 (CET)
Received: from localhost ([::1]:49904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1izvJo-0008IV-QU
	for lists+qemu-devel@lfdr.de; Thu, 06 Feb 2020 23:32:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44171)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1izvIO-00076Y-0Z
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 23:31:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1izvIM-00072r-HN
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 23:31:11 -0500
Received: from ozlabs.org ([2401:3900:2:1::2]:49209)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1izvIL-0005aK-8E; Thu, 06 Feb 2020 23:31:10 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 48DMmy4mzNz9sSJ; Fri,  7 Feb 2020 15:30:58 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1581049858;
 bh=FtoKJ8jCKmMdy3M3VT71W+IwDmPpyCpOIPMGaQlg4zk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fBlJuoWpN8UFo9YhifQnaYQLF0NoCKl5MUmkPOSfpUmRfyysiuI0ePSLBmCq2UKSz
 vZB/La7d5PRIfr2E7zQ2jAGHhbcU5PYTE6LsR4T0DG5soLsisj+6WqOEE1hon6APwO
 xvQ0K/BsDXqwtvUZZ9OJgb6JsTJOs0Y/ekXyJ7rc=
From: David Gibson <david@gibson.dropbear.id.au>
To: groug@kaod.org,
	clg@kaod.org,
	pair@us.ibm.com
Subject: [PATCH 2/2] spapr: Enable virtio iommu_platform=on by default
Date: Fri,  7 Feb 2020 15:30:55 +1100
Message-Id: <20200207043055.218856-3-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200207043055.218856-1-david@gibson.dropbear.id.au>
References: <20200207043055.218856-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2401:3900:2:1::2
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
Cc: mst@redhat.com, aik@ozlabs.ru, qemu-devel@nongnu.org, paulus@samba.org,
 mdroth@us.ibm.com, qemu-ppc@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Traditionally, virtio devices don't do DMA by the usual path on the
guest platform.  In particular they usually bypass any virtual IOMMU
the guest has, using hypervisor magic to access untranslated guest
physical addresses.

There's now the optional iommu_platform flag which can tell virtio
devices to use the platform's normal DMA path, including any IOMMUs.
That flag was motiviated for the case of hardware virtio
implementations, but there are other reasons to want it.

Specifically, the fact that the virtio device doesn't use vIOMMU
translation means that virtio devices are unsafe to pass to nested
guests, or to use with VFIO userspace drivers inside the guest.  This
is particularly noticeable on the pseries platform which *always* has
a guest-visible vIOMMU.

Not using the normal DMA path also causes difficulties for the guest
side driver when using the upcoming POWER Secure VMs (a.k.a. PEF).
While it's theoretically possible to handle this on the guest side,
it's really fiddly.  Given the other problems with the non-translated
virtio device, let's just enable vIOMMU translation for virtio devices
by default in the pseries-5.0 (and later) machine types.

Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/spapr.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 216d3b34dc..78e031e80a 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -4518,6 +4518,7 @@ static void spapr_machine_5_0_class_options(Machine=
Class *mc)
      * default behaviour for virtio */
     static GlobalProperty compat[] =3D {
         { TYPE_VIRTIO_PCI, "disable-legacy", "on", },
+        { TYPE_VIRTIO_DEVICE, "iommu_platform", "on", },
     };
=20
     compat_props_add(mc->compat_props, compat, G_N_ELEMENTS(compat));
@@ -4533,6 +4534,7 @@ static void spapr_machine_4_2_class_options(Machine=
Class *mc)
     SpaprMachineClass *smc =3D SPAPR_MACHINE_CLASS(mc);
     static GlobalProperty compat[] =3D {
         { TYPE_VIRTIO_PCI, "disable-legacy", "auto" },
+        { TYPE_VIRTIO_DEVICE, "iommu_platform", "off", },
     };
=20
     spapr_machine_5_0_class_options(mc);
--=20
2.24.1


