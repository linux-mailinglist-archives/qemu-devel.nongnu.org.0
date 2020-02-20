Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FE84165595
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Feb 2020 04:24:51 +0100 (CET)
Received: from localhost ([::1]:35230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j4cSI-0006RK-KC
	for lists+qemu-devel@lfdr.de; Wed, 19 Feb 2020 22:24:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41253)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1j4cR6-0004bK-Sf
 for qemu-devel@nongnu.org; Wed, 19 Feb 2020 22:23:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1j4cR5-0008Jw-H5
 for qemu-devel@nongnu.org; Wed, 19 Feb 2020 22:23:36 -0500
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:53671 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1j4cR5-0008I9-6Y; Wed, 19 Feb 2020 22:23:35 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 48NKg03Mbxz9sSJ; Thu, 20 Feb 2020 14:23:24 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1582169004;
 bh=4XiokVgfdNhjja2TStYKYuF9QU8EUX+Y1oGsbrdG1jU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=i/p0jqN/L01wQ78NvsC3HBoxRAzGgxgPmiW8EjmP9zPDCxJWH5Sne6zfndwuENpXS
 LiOyURvHHLsDjb1lD7npLgtvq4XT7SyAs92tLgIUrLhLLIjgUKBdOMlg0jR0v2pYox
 Dl+4asVLhJtSDZHQcDVTZt6zwzrJvnzV5xYdi7EM=
From: David Gibson <david@gibson.dropbear.id.au>
To: qemu-ppc@nongnu.org,
	groug@kaod.org,
	clg@kaod.org
Subject: [PATCH v5 04/18] target/ppc: Introduce ppc_hash64_use_vrma() helper
Date: Thu, 20 Feb 2020 14:23:02 +1100
Message-Id: <20200220032317.96884-5-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200220032317.96884-1-david@gibson.dropbear.id.au>
References: <20200220032317.96884-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: lvivier@redhat.com, Thomas Huth <thuth@redhat.com>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, aik@ozlabs.ru,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, paulus@samba.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When running guests under a hypervisor, the hypervisor obviously needs to
be protected from guest accesses even if those are in what the guest
considers real mode (translation off).  The POWER hardware provides two
ways of doing that: The old way has guest real mode accesses simply offse=
t
and bounds checked into host addresses.  It works, but requires that a
significant chunk of the guest's memory - the RMA - be physically
contiguous in the host, which is pretty inconvenient.  The new way, known
as VRMA, has guest real mode accesses translated in roughly the normal wa=
y
but with some special parameters.

In POWER7 and POWER8 the LPCR[VPM0] bit selected between the two modes, b=
ut
in POWER9 only VRMA mode is supported and LPCR[VPM0] no longer exists.  W=
e
handle that difference in behaviour in ppc_hash64_set_isi().. but not in
other places that we blindly check LPCR[VPM0].

Correct those instances with a new helper to tell if we should be in VRMA
mode.

Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/mmu-hash64.c | 43 ++++++++++++++++++++---------------------
 1 file changed, 21 insertions(+), 22 deletions(-)

diff --git a/target/ppc/mmu-hash64.c b/target/ppc/mmu-hash64.c
index 392f90e0ae..0f9c0149e8 100644
--- a/target/ppc/mmu-hash64.c
+++ b/target/ppc/mmu-hash64.c
@@ -668,6 +668,21 @@ unsigned ppc_hash64_hpte_page_shift_noslb(PowerPCCPU=
 *cpu,
     return 0;
 }
=20
+static bool ppc_hash64_use_vrma(CPUPPCState *env)
+{
+    switch (env->mmu_model) {
+    case POWERPC_MMU_3_00:
+        /*
+         * ISAv3.0 (POWER9) always uses VRMA, the VPM0 field and RMOR
+         * register no longer exist
+         */
+        return true;
+
+    default:
+        return !!(env->spr[SPR_LPCR] & LPCR_VPM0);
+    }
+}
+
 static void ppc_hash64_set_isi(CPUState *cs, uint64_t error_code)
 {
     CPUPPCState *env =3D &POWERPC_CPU(cs)->env;
@@ -676,15 +691,7 @@ static void ppc_hash64_set_isi(CPUState *cs, uint64_=
t error_code)
     if (msr_ir) {
         vpm =3D !!(env->spr[SPR_LPCR] & LPCR_VPM1);
     } else {
-        switch (env->mmu_model) {
-        case POWERPC_MMU_3_00:
-            /* Field deprecated in ISAv3.00 - interrupts always go to hy=
perv */
-            vpm =3D true;
-            break;
-        default:
-            vpm =3D !!(env->spr[SPR_LPCR] & LPCR_VPM0);
-            break;
-        }
+        vpm =3D ppc_hash64_use_vrma(env);
     }
     if (vpm && !msr_hv) {
         cs->exception_index =3D POWERPC_EXCP_HISI;
@@ -702,15 +709,7 @@ static void ppc_hash64_set_dsi(CPUState *cs, uint64_=
t dar, uint64_t dsisr)
     if (msr_dr) {
         vpm =3D !!(env->spr[SPR_LPCR] & LPCR_VPM1);
     } else {
-        switch (env->mmu_model) {
-        case POWERPC_MMU_3_00:
-            /* Field deprecated in ISAv3.00 - interrupts always go to hy=
perv */
-            vpm =3D true;
-            break;
-        default:
-            vpm =3D !!(env->spr[SPR_LPCR] & LPCR_VPM0);
-            break;
-        }
+        vpm =3D ppc_hash64_use_vrma(env);
     }
     if (vpm && !msr_hv) {
         cs->exception_index =3D POWERPC_EXCP_HDSI;
@@ -799,7 +798,7 @@ int ppc_hash64_handle_mmu_fault(PowerPCCPU *cpu, vadd=
r eaddr,
             if (!(eaddr >> 63)) {
                 raddr |=3D env->spr[SPR_HRMOR];
             }
-        } else if (env->spr[SPR_LPCR] & LPCR_VPM0) {
+        } else if (ppc_hash64_use_vrma(env)) {
             /* Emulated VRMA mode */
             slb =3D &env->vrma_slb;
             if (!slb->sps) {
@@ -967,7 +966,7 @@ hwaddr ppc_hash64_get_phys_page_debug(PowerPCCPU *cpu=
, target_ulong addr)
         } else if ((msr_hv || !env->has_hv_mode) && !(addr >> 63)) {
             /* In HV mode, add HRMOR if top EA bit is clear */
             return raddr | env->spr[SPR_HRMOR];
-        } else if (env->spr[SPR_LPCR] & LPCR_VPM0) {
+        } else if (ppc_hash64_use_vrma(env)) {
             /* Emulated VRMA mode */
             slb =3D &env->vrma_slb;
             if (!slb->sps) {
@@ -1056,8 +1055,7 @@ static void ppc_hash64_update_vrma(PowerPCCPU *cpu)
     slb->sps =3D NULL;
=20
     /* Is VRMA enabled ? */
-    lpcr =3D env->spr[SPR_LPCR];
-    if (!(lpcr & LPCR_VPM0)) {
+    if (ppc_hash64_use_vrma(env)) {
         return;
     }
=20
@@ -1065,6 +1063,7 @@ static void ppc_hash64_update_vrma(PowerPCCPU *cpu)
      * Make one up. Mostly ignore the ESID which will not be needed
      * for translation
      */
+    lpcr =3D env->spr[SPR_LPCR];
     vsid =3D SLB_VSID_VRMA;
     vrmasd =3D (lpcr & LPCR_VRMASD) >> LPCR_VRMASD_SHIFT;
     vsid |=3D (vrmasd << 4) & (SLB_VSID_L | SLB_VSID_LP);
--=20
2.24.1


