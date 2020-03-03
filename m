Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AAE2176DA2
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Mar 2020 04:45:23 +0100 (CET)
Received: from localhost ([::1]:41562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j8yUj-0006FO-Mb
	for lists+qemu-devel@lfdr.de; Mon, 02 Mar 2020 22:45:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35134)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1j8yTQ-0004h3-LQ
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 22:44:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1j8yTP-0002Ai-BX
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 22:44:00 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:40803 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1j8yTO-00025k-Fa; Mon, 02 Mar 2020 22:43:59 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 48WjY56Wp2z9sSM; Tue,  3 Mar 2020 14:43:53 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1583207033;
 bh=105uZzjK8EWkPkmRVAazKF6ikIMHnp8INylkLfXtmRo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=TS0me6qKYnfiRrjpKnsgJO2cwuKdjiwOJtliex+pzd85H4X5yZtKGSDXzhsEdh7xx
 dhsfbMBOqO0LHbuEiZQv+fPCOorx3m8VZq6Mp+IUDWW9KPK0grCO7w+MkKjx4uHWyN
 RvS1GXqxsiFINgUP1plx9LuflhlDVAPhfWYG9Xh4=
From: David Gibson <david@gibson.dropbear.id.au>
To: qemu-ppc@nongnu.org, clg@kaod.org, qemu-devel@nongnu.org, groug@kaod.org
Subject: [PATCH v7 03/17] target/ppc: Correct handling of real mode accesses
 with vhyp on hash MMU
Date: Tue,  3 Mar 2020 14:43:37 +1100
Message-Id: <20200303034351.333043-4-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200303034351.333043-1-david@gibson.dropbear.id.au>
References: <20200303034351.333043-1-david@gibson.dropbear.id.au>
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
Cc: lvivier@redhat.com, Thomas Huth <thuth@redhat.com>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>, farosas@linux.ibm.com,
 aik@ozlabs.ru, "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Paolo Bonzini <pbonzini@redhat.com>, paulus@samba.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On ppc we have the concept of virtual hypervisor ("vhyp") mode, where we
only model the non-hypervisor-privileged parts of the cpu.  Essentially w=
e
model the hypervisor's behaviour from the point of view of a guest OS, bu=
t
we don't model the hypervisor's execution.

In particular, in this mode, qemu's notion of target physical address is
a guest physical address from the vcpu's point of view.  So accesses in
guest real mode don't require translation.  If we were modelling the
hypervisor mode, we'd need to translate the guest physical address into
a host physical address.

Currently, we handle this sloppily: we rely on setting up the virtual LPC=
R
and RMOR registers so that GPAs are simply HPAs plus an offset, which we
set to zero.  This is already conceptually dubious, since the LPCR and RM=
OR
registers don't exist in the non-hypervisor portion of the CPU.  It gets
worse with POWER9, where RMOR and LPCR[VPM0] no longer exist at all.

Clean this up by explicitly handling the vhyp case.  While we're there,
remove some unnecessary nesting of if statements that made the logic to
select the correct real mode behaviour a bit less clear than it could be.

Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
Reviewed-by: Greg Kurz <groug@kaod.org>
---
 target/ppc/mmu-hash64.c | 60 ++++++++++++++++++++++++-----------------
 1 file changed, 35 insertions(+), 25 deletions(-)

diff --git a/target/ppc/mmu-hash64.c b/target/ppc/mmu-hash64.c
index 3e0be4d55f..392f90e0ae 100644
--- a/target/ppc/mmu-hash64.c
+++ b/target/ppc/mmu-hash64.c
@@ -789,27 +789,30 @@ int ppc_hash64_handle_mmu_fault(PowerPCCPU *cpu, va=
ddr eaddr,
          */
         raddr =3D eaddr & 0x0FFFFFFFFFFFFFFFULL;
=20
-        /* In HV mode, add HRMOR if top EA bit is clear */
-        if (msr_hv || !env->has_hv_mode) {
+        if (cpu->vhyp) {
+            /*
+             * In virtual hypervisor mode, there's nothing to do:
+             *   EA =3D=3D GPA =3D=3D qemu guest address
+             */
+        } else if (msr_hv || !env->has_hv_mode) {
+            /* In HV mode, add HRMOR if top EA bit is clear */
             if (!(eaddr >> 63)) {
                 raddr |=3D env->spr[SPR_HRMOR];
             }
-        } else {
-            /* Otherwise, check VPM for RMA vs VRMA */
-            if (env->spr[SPR_LPCR] & LPCR_VPM0) {
-                slb =3D &env->vrma_slb;
-                if (slb->sps) {
-                    goto skip_slb_search;
-                }
-                /* Not much else to do here */
+        } else if (env->spr[SPR_LPCR] & LPCR_VPM0) {
+            /* Emulated VRMA mode */
+            slb =3D &env->vrma_slb;
+            if (!slb->sps) {
+                /* Invalid VRMA setup, machine check */
                 cs->exception_index =3D POWERPC_EXCP_MCHECK;
                 env->error_code =3D 0;
                 return 1;
-            } else if (raddr < env->rmls) {
-                /* RMA. Check bounds in RMLS */
-                raddr |=3D env->spr[SPR_RMOR];
-            } else {
-                /* The access failed, generate the approriate interrupt =
*/
+            }
+
+            goto skip_slb_search;
+        } else {
+            /* Emulated old-style RMO mode, bounds check against RMLS */
+            if (raddr >=3D env->rmls) {
                 if (rwx =3D=3D 2) {
                     ppc_hash64_set_isi(cs, SRR1_PROTFAULT);
                 } else {
@@ -821,6 +824,8 @@ int ppc_hash64_handle_mmu_fault(PowerPCCPU *cpu, vadd=
r eaddr,
                 }
                 return 1;
             }
+
+            raddr |=3D env->spr[SPR_RMOR];
         }
         tlb_set_page(cs, eaddr & TARGET_PAGE_MASK, raddr & TARGET_PAGE_M=
ASK,
                      PAGE_READ | PAGE_WRITE | PAGE_EXEC, mmu_idx,
@@ -953,22 +958,27 @@ hwaddr ppc_hash64_get_phys_page_debug(PowerPCCPU *c=
pu, target_ulong addr)
         /* In real mode the top 4 effective address bits are ignored */
         raddr =3D addr & 0x0FFFFFFFFFFFFFFFULL;
=20
-        /* In HV mode, add HRMOR if top EA bit is clear */
-        if ((msr_hv || !env->has_hv_mode) && !(addr >> 63)) {
+        if (cpu->vhyp) {
+            /*
+             * In virtual hypervisor mode, there's nothing to do:
+             *   EA =3D=3D GPA =3D=3D qemu guest address
+             */
+            return raddr;
+        } else if ((msr_hv || !env->has_hv_mode) && !(addr >> 63)) {
+            /* In HV mode, add HRMOR if top EA bit is clear */
             return raddr | env->spr[SPR_HRMOR];
-        }
-
-        /* Otherwise, check VPM for RMA vs VRMA */
-        if (env->spr[SPR_LPCR] & LPCR_VPM0) {
+        } else if (env->spr[SPR_LPCR] & LPCR_VPM0) {
+            /* Emulated VRMA mode */
             slb =3D &env->vrma_slb;
             if (!slb->sps) {
                 return -1;
             }
-        } else if (raddr < env->rmls) {
-            /* RMA. Check bounds in RMLS */
-            return raddr | env->spr[SPR_RMOR];
         } else {
-            return -1;
+            /* Emulated old-style RMO mode, bounds check against RMLS */
+            if (raddr >=3D env->rmls) {
+                return -1;
+            }
+            return raddr | env->spr[SPR_RMOR];
         }
     } else {
         slb =3D slb_lookup(cpu, addr);
--=20
2.24.1


