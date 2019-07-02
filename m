Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A35AC5C949
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Jul 2019 08:25:48 +0200 (CEST)
Received: from localhost ([::1]:49468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hiCEd-0002QT-Qh
	for lists+qemu-devel@lfdr.de; Tue, 02 Jul 2019 02:25:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58298)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <dgibson@ozlabs.org>) id 1hiByh-0004q2-8w
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 02:09:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1hiByg-0002rp-8y
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 02:09:19 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:45063 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1hiByf-0002oM-St; Tue, 02 Jul 2019 02:09:18 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 45dDMh41Nkz9sPV; Tue,  2 Jul 2019 16:09:03 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1562047744;
 bh=3F+jk8VVvZ9vfLbmklIoqbioDxmS4k/G4NBEFvQeU4M=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=m+DoEOUh1VZgQ42ZGpCLo6+gehicK0ynGtODMubfhy9pxLIzuvWzlB6h3pmUBJ3YV
 cYQIHLYuP11NpzTN7abqt5dwfOvw6WyJ2/22F/kwMpJ9BILEuIgr3eID7uBvKdaaBy
 zOqcXMc5ipxNVg84b8d37bYrnEx0gUcNDvye235k=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Date: Tue,  2 Jul 2019 16:08:24 +1000
Message-Id: <20190702060857.3926-17-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190702060857.3926-1-david@gibson.dropbear.id.au>
References: <20190702060857.3926-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 203.11.71.1
Subject: [Qemu-devel] [PULL 16/49] spapr_pci: Drop useless CONFIG_KVM
 ifdefery
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
 qemu-ppc@nongnu.org, clg@kaod.org, David Gibson <david@gibson.dropbear.id.au>,
 rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Greg Kurz <groug@kaod.org>

kvm_enabled() expands to (0) when CONFIG_KVM is not defined.

Signed-off-by: Greg Kurz <groug@kaod.org>
Message-Id: <156051052977.224162.17306829691809502082.stgit@bahia.lan>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/spapr_pci.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/hw/ppc/spapr_pci.c b/hw/ppc/spapr_pci.c
index 2dca1e57f3..5591723bb2 100644
--- a/hw/ppc/spapr_pci.c
+++ b/hw/ppc/spapr_pci.c
@@ -1951,11 +1951,9 @@ static void spapr_phb_realize(DeviceState *dev, Er=
ror **errp)
      * For KVM we want to ensure that this memory is a full page so that
      * our memory slot is of page size granularity.
      */
-#ifdef CONFIG_KVM
     if (kvm_enabled()) {
         msi_window_size =3D getpagesize();
     }
-#endif
=20
     memory_region_init_io(&sphb->msiwindow, OBJECT(sphb), &spapr_msi_ops=
, spapr,
                           "msi", msi_window_size);
--=20
2.21.0


