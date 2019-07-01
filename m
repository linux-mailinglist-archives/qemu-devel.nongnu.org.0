Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 290432D683
	for <lists+qemu-devel@lfdr.de>; Wed, 29 May 2019 09:38:54 +0200 (CEST)
Received: from localhost ([127.0.0.1]:49133 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hVtAj-0006XH-9Q
	for lists+qemu-devel@lfdr.de; Wed, 29 May 2019 03:38:53 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47877)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1hVsQ7-0008NR-Ln
	for qemu-devel@nongnu.org; Wed, 29 May 2019 02:50:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1hVsQ5-0002g4-Cy
	for qemu-devel@nongnu.org; Wed, 29 May 2019 02:50:43 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:54189 helo=ozlabs.org)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
	id 1hVsQ4-0002c6-JL; Wed, 29 May 2019 02:50:41 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 45DLv53tKwz9sPV; Wed, 29 May 2019 16:50:22 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1559112625;
	bh=BjiFSb1b89t8ZsTeXhXZ6WzYs2aJf3rKsJujYhnowoo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=p+f90RFrVaycNWvl2ZJGJxFZnM+aRqFKxWdOG57udOVj5/vxqsg2FAArs4tlEkXpO
	ngix4EOj6O5yO51k3DuJEgAfGIjqOQpXCQD2+DX4CX2ePBru/GWeMzfubWJ7OSS0Kf
	F5dazwXVbh8Q+TjnX6CH7hXJMeR32aqohQA5NZ2o=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Date: Wed, 29 May 2019 16:49:53 +1000
Message-Id: <20190529065017.15149-21-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190529065017.15149-1-david@gibson.dropbear.id.au>
References: <20190529065017.15149-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2401:3900:2:1::2
Subject: [Qemu-devel] [PULL 20/44] spapr/xive: Sanity checks of OV5 during
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
	qemu-ppc@nongnu.org, clg@kaod.org,
	Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>,
	David Gibson <david@gibson.dropbear.id.au>, rth@twiddle.net
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


