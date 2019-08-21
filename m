Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F6A397359
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Aug 2019 09:28:43 +0200 (CEST)
Received: from localhost ([::1]:44426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i0L2w-0006SB-0E
	for lists+qemu-devel@lfdr.de; Wed, 21 Aug 2019 03:28:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41942)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1i0L0G-0004Ol-42
 for qemu-devel@nongnu.org; Wed, 21 Aug 2019 03:25:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1i0L0E-0007so-W6
 for qemu-devel@nongnu.org; Wed, 21 Aug 2019 03:25:55 -0400
Received: from ozlabs.org ([203.11.71.1]:46439)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1i0L0E-0007qR-4p; Wed, 21 Aug 2019 03:25:54 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 46Czj8724gz9sNm; Wed, 21 Aug 2019 17:25:48 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1566372348;
 bh=s3rP9nOYw6dbdVMOG48CakC3NHOqA8jLpQtmp70iOPY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=IZ7xWkTKythI5rZJ3biZJ6SrrGXgDv7Cki0dXLwoOYeyIikB4+G2iqCN9BHnA+USf
 1Ix9/YkwjEr26IZtDXLcS/Q4HQehV0L4Ag8dbV20gS7MZ/sq/EZgcYUpCk2IWTYUjP
 UEgodGWK72bvpjlP9jHaIqAnyIMmIBBEv/w7bF48=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Date: Wed, 21 Aug 2019 17:25:04 +1000
Message-Id: <20190821072542.23090-5-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190821072542.23090-1-david@gibson.dropbear.id.au>
References: <20190821072542.23090-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 203.11.71.1
Subject: [Qemu-devel] [PULL 04/42] spapr_pci: Allow 2MiB and 16MiB IOMMU
 pagesizes by default
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
 qemu-ppc@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We've had the qemu and kernel KVM infrastructure to handle larger TCE
page sizes for a while, but forgot to update the defaults to actually
allow them.  This turns that change on.

Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/spapr.c     | 6 ++++++
 hw/ppc/spapr_pci.c | 3 ++-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 6587d9b559..22a45c3737 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -4445,8 +4445,14 @@ DEFINE_SPAPR_MACHINE(4_2, "4.2", true);
  */
 static void spapr_machine_4_1_class_options(MachineClass *mc)
 {
+    static GlobalProperty compat[] =3D {
+        /* Only allow 4kiB and 64kiB IOMMU pagesizes */
+        { TYPE_SPAPR_PCI_HOST_BRIDGE, "pgsz", "0x11000" },
+    };
+
     spapr_machine_4_2_class_options(mc);
     compat_props_add(mc->compat_props, hw_compat_4_1, hw_compat_4_1_len)=
;
+    compat_props_add(mc->compat_props, compat, G_N_ELEMENTS(compat));
 }
=20
 DEFINE_SPAPR_MACHINE(4_1, "4.1", false);
diff --git a/hw/ppc/spapr_pci.c b/hw/ppc/spapr_pci.c
index bf31fd854c..4c5420c465 100644
--- a/hw/ppc/spapr_pci.c
+++ b/hw/ppc/spapr_pci.c
@@ -2093,7 +2093,8 @@ static Property spapr_phb_properties[] =3D {
                        0x800000000000000ULL),
     DEFINE_PROP_BOOL("ddw", SpaprPhbState, ddw_enabled, true),
     DEFINE_PROP_UINT64("pgsz", SpaprPhbState, page_size_mask,
-                       (1ULL << 12) | (1ULL << 16)),
+                       (1ULL << 12) | (1ULL << 16)
+                       | (1ULL << 21) | (1ULL << 24)),
     DEFINE_PROP_UINT32("numa_node", SpaprPhbState, numa_node, -1),
     DEFINE_PROP_BOOL("pre-2.8-migration", SpaprPhbState,
                      pre_2_8_migration, false),
--=20
2.21.0


