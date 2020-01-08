Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AB67133B42
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jan 2020 06:37:42 +0100 (CET)
Received: from localhost ([::1]:37148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ip42G-0005bS-Pi
	for lists+qemu-devel@lfdr.de; Wed, 08 Jan 2020 00:37:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47629)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1ip3od-0003uX-6q
 for qemu-devel@nongnu.org; Wed, 08 Jan 2020 00:23:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1ip3ob-0002mV-FX
 for qemu-devel@nongnu.org; Wed, 08 Jan 2020 00:23:34 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:40825 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1ip3ob-0002iM-30; Wed, 08 Jan 2020 00:23:33 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 47syMD0xJsz9sSn; Wed,  8 Jan 2020 16:23:19 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1578461000;
 bh=AnbkEiT1BQ6rz3nLFKt2A8qOIR88lQ+k+2ql0A6KFek=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CBGFrrXqipAb/TaS8qa28ZjxMgZcJ2YItdCVySISliQ+FmdkO0aQkTpInt89baxVh
 fYRdn6UgPebNZcap8S7XumedE9m1cjYKj1z0mO0abNsRsqni9qpCoMyipd37qbDzhe
 Ne0j9VLqsNASSs7pxg58CQdGq2ndAldmFpEkUdI4=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 21/26] spapr/xive: Deduce the SpaprXive pointer from
 XiveTCTX::xptr
Date: Wed,  8 Jan 2020 16:23:07 +1100
Message-Id: <20200108052312.238710-22-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200108052312.238710-1-david@gibson.dropbear.id.au>
References: <20200108052312.238710-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: lvivier@redhat.com, qemu-devel@nongnu.org, groug@kaod.org,
 qemu-ppc@nongnu.org, clg@kaod.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Greg Kurz <groug@kaod.org>

And use it instead of reaching out to the machine. This allows to get rid
of a call to qdev_get_machine() and to reduce the scope of another one so
that it is only used within the argument list of error_append_hint(). Thi=
s
is an acceptable tradeoff compared to all it would require to know about
the maximum number of CPUs here without calling qdev_get_machine().

Signed-off-by: Greg Kurz <groug@kaod.org>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Message-Id: <20200106145645.4539-10-clg@kaod.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/intc/spapr_xive_kvm.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/hw/intc/spapr_xive_kvm.c b/hw/intc/spapr_xive_kvm.c
index 32b2809210..edb7ee0e74 100644
--- a/hw/intc/spapr_xive_kvm.c
+++ b/hw/intc/spapr_xive_kvm.c
@@ -75,7 +75,7 @@ static void kvm_cpu_disable_all(void)
=20
 void kvmppc_xive_cpu_set_state(XiveTCTX *tctx, Error **errp)
 {
-    SpaprXive *xive =3D SPAPR_MACHINE(qdev_get_machine())->xive;
+    SpaprXive *xive =3D SPAPR_XIVE(tctx->xptr);
     uint64_t state[2];
     int ret;
=20
@@ -97,7 +97,7 @@ void kvmppc_xive_cpu_set_state(XiveTCTX *tctx, Error **=
errp)
=20
 void kvmppc_xive_cpu_get_state(XiveTCTX *tctx, Error **errp)
 {
-    SpaprXive *xive =3D SPAPR_MACHINE(qdev_get_machine())->xive;
+    SpaprXive *xive =3D SPAPR_XIVE(tctx->xptr);
     uint64_t state[2] =3D { 0 };
     int ret;
=20
@@ -152,8 +152,7 @@ void kvmppc_xive_cpu_synchronize_state(XiveTCTX *tctx=
, Error **errp)
=20
 void kvmppc_xive_cpu_connect(XiveTCTX *tctx, Error **errp)
 {
-    MachineState *ms =3D MACHINE(qdev_get_machine());
-    SpaprXive *xive =3D SPAPR_MACHINE(ms)->xive;
+    SpaprXive *xive =3D SPAPR_XIVE(tctx->xptr);
     unsigned long vcpu_id;
     int ret;
=20
@@ -179,7 +178,7 @@ void kvmppc_xive_cpu_connect(XiveTCTX *tctx, Error **=
errp)
                    vcpu_id, strerror(errno));
         if (errno =3D=3D ENOSPC) {
             error_append_hint(&local_err, "Try -smp maxcpus=3DN with N <=
 %u\n",
-                              ms->smp.max_cpus);
+                              MACHINE(qdev_get_machine())->smp.max_cpus)=
;
         }
         error_propagate(errp, local_err);
         return;
--=20
2.24.1


