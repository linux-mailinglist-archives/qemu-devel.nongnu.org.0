Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 382895C956
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Jul 2019 08:31:59 +0200 (CEST)
Received: from localhost ([::1]:49510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hiCKc-0006Wk-DW
	for lists+qemu-devel@lfdr.de; Tue, 02 Jul 2019 02:31:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58476)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <dgibson@ozlabs.org>) id 1hiBym-00052h-2y
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 02:09:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1hiByk-0002ws-RI
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 02:09:23 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:47737 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1hiByk-0002tu-FL; Tue, 02 Jul 2019 02:09:22 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 45dDMk1vVdz9sPx; Tue,  2 Jul 2019 16:09:05 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1562047746;
 bh=09nmdt2mnEgWjykDd8wkcLUHPddK/xdAwW+pmFnNR/0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=C5u9f5SRy1kQ6CBdVrL71bNPGi15A1du9yn50xRwPwlG/zekSvy6NePKPrfxSg8Jc
 sRAF9aztCzj38SJ9Q0Id+kEnnQgsUeiv5ICG69U1naGstmSB/zgQGMCXmRz6mtIeij
 ILexO62FxBLa95rZ4LNxBnskN46QCBsvdFViaBCA=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Date: Tue,  2 Jul 2019 16:08:36 +1000
Message-Id: <20190702060857.3926-29-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190702060857.3926-1-david@gibson.dropbear.id.au>
References: <20190702060857.3926-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 203.11.71.1
Subject: [Qemu-devel] [PULL 28/49] target/ppc/machine: Add
 kvmppc_pvr_workaround_required() stub
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

This allows to drop the CONFIG_KVM guard from the code.

Signed-off-by: Greg Kurz <groug@kaod.org>
Message-Id: <156051056289.224162.15553539098911498678.stgit@bahia.lan>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/kvm_ppc.h | 5 +++++
 target/ppc/machine.c | 2 --
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/target/ppc/kvm_ppc.h b/target/ppc/kvm_ppc.h
index e642aaaf92..98bd7d5da6 100644
--- a/target/ppc/kvm_ppc.h
+++ b/target/ppc/kvm_ppc.h
@@ -399,6 +399,11 @@ static inline int kvmppc_resize_hpt_commit(PowerPCCP=
U *cpu,
     return -ENOSYS;
 }
=20
+static inline bool kvmppc_pvr_workaround_required(PowerPCCPU *cpu)
+{
+    return false;
+}
+
 #endif
=20
 #ifndef CONFIG_KVM
diff --git a/target/ppc/machine.c b/target/ppc/machine.c
index 5ad7b40f45..e82f5de9db 100644
--- a/target/ppc/machine.c
+++ b/target/ppc/machine.c
@@ -378,11 +378,9 @@ static int cpu_post_load(void *opaque, int version_i=
d)
      * receive the PVR it expects as a workaround.
      *
      */
-#if defined(CONFIG_KVM)
     if (kvmppc_pvr_workaround_required(cpu)) {
         env->spr[SPR_PVR] =3D env->spr_cb[SPR_PVR].default_value;
     }
-#endif
=20
     env->lr =3D env->spr[SPR_LR];
     env->ctr =3D env->spr[SPR_CTR];
--=20
2.21.0


