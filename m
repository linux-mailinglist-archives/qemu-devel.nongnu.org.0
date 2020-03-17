Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34794187E1E
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Mar 2020 11:20:33 +0100 (CET)
Received: from localhost ([::1]:55784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jE9Kq-0003ur-4z
	for lists+qemu-devel@lfdr.de; Tue, 17 Mar 2020 06:20:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45360)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1jE95l-00016V-8M
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 06:05:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1jE95h-0002mt-Tt
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 06:04:57 -0400
Received: from ozlabs.org ([203.11.71.1]:36463)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1jE95h-0001uZ-EG; Tue, 17 Mar 2020 06:04:53 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 48hTKw4VWVz9sSw; Tue, 17 Mar 2020 21:04:36 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1584439476;
 bh=88kztm91h2bkC3afsiHERGe38CDEWroGsrNUk9qctec=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ojU1y/fVAWoS4lnWaBx1VTEhLTVmaM09uEABtCO7JqcCp5mGdD8M+CqZCtf6tbrAy
 cAKdZtwpWJysdNDonAcXVr3rVSPTfvCF73BGPQ9ljgRh5qTSctQMPEsF6m6XwQxVtK
 JYPTi/TirxwbxTnzrHa2/caKeH67CpT8Z+GDVLGM=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 15/45] target/ppc: Only calculate RMLS derived RMA limit on
 demand
Date: Tue, 17 Mar 2020 21:03:53 +1100
Message-Id: <20200317100423.622643-16-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200317100423.622643-1-david@gibson.dropbear.id.au>
References: <20200317100423.622643-1-david@gibson.dropbear.id.au>
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
Cc: lvivier@redhat.com, aik@ozlabs.ru, mdroth@linux.vnet.ibm.com,
 qemu-devel@nongnu.org, groug@kaod.org, qemu-ppc@nongnu.org, clg@kaod.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When the LPCR is written, we update the env->rmls field with the RMA limi=
t
it implies.  Simplify things by just calculating the value directly from
the LPCR value when we need it.

It's possible this is a little slower, but it's unlikely to be significan=
t,
since this is only for real mode accesses in a translation configuration
that's not used very often, and the whole thing is behind the qemu TLB
anyway.  Therefore, keeping the number of state variables down and not
having to worry about making sure it's always in sync seems the better
option.

Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
Reviewed-by: Greg Kurz <groug@kaod.org>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 target/ppc/cpu.h        | 1 -
 target/ppc/mmu-hash64.c | 9 ++++++---
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 8077fdb068..f9871b1233 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -1046,7 +1046,6 @@ struct CPUPPCState {
     uint64_t insns_flags2;
 #if defined(TARGET_PPC64)
     ppc_slb_t vrma_slb;
-    target_ulong rmls;
 #endif
=20
     int error_code;
diff --git a/target/ppc/mmu-hash64.c b/target/ppc/mmu-hash64.c
index fcccaabb88..4fd7b7ee74 100644
--- a/target/ppc/mmu-hash64.c
+++ b/target/ppc/mmu-hash64.c
@@ -837,8 +837,10 @@ int ppc_hash64_handle_mmu_fault(PowerPCCPU *cpu, vad=
dr eaddr,
=20
             goto skip_slb_search;
         } else {
+            target_ulong limit =3D rmls_limit(cpu);
+
             /* Emulated old-style RMO mode, bounds check against RMLS */
-            if (raddr >=3D env->rmls) {
+            if (raddr >=3D limit) {
                 if (rwx =3D=3D 2) {
                     ppc_hash64_set_isi(cs, SRR1_PROTFAULT);
                 } else {
@@ -1000,8 +1002,10 @@ hwaddr ppc_hash64_get_phys_page_debug(PowerPCCPU *=
cpu, target_ulong addr)
                 return -1;
             }
         } else {
+            target_ulong limit =3D rmls_limit(cpu);
+
             /* Emulated old-style RMO mode, bounds check against RMLS */
-            if (raddr >=3D env->rmls) {
+            if (raddr >=3D limit) {
                 return -1;
             }
             return raddr | env->spr[SPR_RMOR];
@@ -1091,7 +1095,6 @@ void ppc_store_lpcr(PowerPCCPU *cpu, target_ulong v=
al)
     CPUPPCState *env =3D &cpu->env;
=20
     env->spr[SPR_LPCR] =3D val & pcc->lpcr_mask;
-    env->rmls =3D rmls_limit(cpu);
     ppc_hash64_update_vrma(cpu);
 }
=20
--=20
2.24.1


