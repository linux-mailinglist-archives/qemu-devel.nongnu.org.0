Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C76025D93
	for <lists+qemu-devel@lfdr.de>; Wed, 22 May 2019 07:26:56 +0200 (CEST)
Received: from localhost ([127.0.0.1]:36394 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hTJmB-0005ZA-KE
	for lists+qemu-devel@lfdr.de; Wed, 22 May 2019 01:26:55 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48273)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1hTJA7-0004R5-A3
	for qemu-devel@nongnu.org; Wed, 22 May 2019 00:47:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1hTJA6-0007JJ-3o
	for qemu-devel@nongnu.org; Wed, 22 May 2019 00:47:35 -0400
Received: from ozlabs.org ([203.11.71.1]:35951)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
	id 1hTJA5-00079S-Hn; Wed, 22 May 2019 00:47:34 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 4580T31KHMz9sDn; Wed, 22 May 2019 14:46:13 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1558500375;
	bh=BjiFSb1b89t8ZsTeXhXZ6WzYs2aJf3rKsJujYhnowoo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lRfyuO/xSbXliSUA2hOulpzu6GUfrBfnD+FQRT0XXb5wZ9C4roR3cIPL/VukFYqr8
	i8c6VC6Mx5y0ptoI6Fpd+fLOl2ywYOQznhTL0Renqv1iXW8GhSZNvGIt1VthySJY7+
	tSqIfnfkoZivzhjZtS1+5Z4WcZCBAmu0NzF4GaWo=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Date: Wed, 22 May 2019 14:45:41 +1000
Message-Id: <20190522044600.16534-20-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190522044600.16534-1-david@gibson.dropbear.id.au>
References: <20190522044600.16534-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 203.11.71.1
Subject: [Qemu-devel] [PULL 19/38] spapr/xive: Sanity checks of OV5 during
 CAS
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: lvivier@redhat.com, qemu-devel@nongnu.org, groug@kaod.org,
	Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>, clg@kaod.org,
	qemu-ppc@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Greg Kurz <groug@kaod.org>

If a machine is started with ic-mode=3Dxive but the guest only knows
about XICS, eg. an RHEL 7.6 guest, the kernel panics. This is
expected but a bit unfortunate since the crash doesn't provide
much information for the end user to guess what's happening.

Detect that during CAS and exit QEMU with a proper error message
instead, like it is already done for the MMU.

Even if this is less likely to happen, the opposite case of a guest
that only knows about XIVE would certainly fail all the same if the
machine is started with ic-mode=3Dxics.

Also, the only valid values a guest can pass in byte 23 of OV5 during
CAS are 0b00 (XIVE legacy mode) and 0b01 (XIVE exploitation mode). Any
other value is a bug, at least with the current spec. Again, it does
not seem right to let the guest go on without a precise idea of the
interrupt mode it asked for.

Handle these cases as well.

Reported-by: Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>
Signed-off-by: Greg Kurz <groug@kaod.org>
Message-Id: <155793986451.464434.12887933000007255549.stgit@bahia.lan>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/spapr_hcall.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
index 6c16d2b120..63a55614b8 100644
--- a/hw/ppc/spapr_hcall.c
+++ b/hw/ppc/spapr_hcall.c
@@ -1513,6 +1513,7 @@ static target_ulong h_client_architecture_support(P=
owerPCCPU *cpu,
     bool guest_radix;
     Error *local_err =3D NULL;
     bool raw_mode_supported =3D false;
+    bool guest_xive;
=20
     cas_pvr =3D cas_check_pvr(spapr, cpu, &addr, &raw_mode_supported, &l=
ocal_err);
     if (local_err) {
@@ -1545,10 +1546,17 @@ static target_ulong h_client_architecture_support=
(PowerPCCPU *cpu,
         error_report("guest requested hash and radix MMU, which is inval=
id.");
         exit(EXIT_FAILURE);
     }
+    if (spapr_ovec_test(ov5_guest, OV5_XIVE_BOTH)) {
+        error_report("guest requested an invalid interrupt mode");
+        exit(EXIT_FAILURE);
+    }
+
     /* The radix/hash bit in byte 24 requires special handling: */
     guest_radix =3D spapr_ovec_test(ov5_guest, OV5_MMU_RADIX_300);
     spapr_ovec_clear(ov5_guest, OV5_MMU_RADIX_300);
=20
+    guest_xive =3D spapr_ovec_test(ov5_guest, OV5_XIVE_EXPLOIT);
+
     /*
      * HPT resizing is a bit of a special case, because when enabled
      * we assume an HPT guest will support it until it says it
@@ -1632,6 +1640,22 @@ static target_ulong h_client_architecture_support(=
PowerPCCPU *cpu,
                                           ov5_updates) !=3D 0);
     }
=20
+    /*
+     * Ensure the guest asks for an interrupt mode we support; otherwise
+     * terminate the boot.
+     */
+    if (guest_xive) {
+        if (spapr->irq->ov5 =3D=3D SPAPR_OV5_XIVE_LEGACY) {
+            error_report("Guest requested unavailable interrupt mode (XI=
VE)");
+            exit(EXIT_FAILURE);
+        }
+    } else {
+        if (spapr->irq->ov5 =3D=3D SPAPR_OV5_XIVE_EXPLOIT) {
+            error_report("Guest requested unavailable interrupt mode (XI=
CS)");
+            exit(EXIT_FAILURE);
+        }
+    }
+
     /*
      * Generate a machine reset when we have an update of the
      * interrupt mode. Only required when the machine supports both
--=20
2.21.0


