Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70F771655A2
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Feb 2020 04:28:46 +0100 (CET)
Received: from localhost ([::1]:35310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j4cW5-0005ZW-Hb
	for lists+qemu-devel@lfdr.de; Wed, 19 Feb 2020 22:28:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41329)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1j4cR8-0004dS-GO
 for qemu-devel@nongnu.org; Wed, 19 Feb 2020 22:23:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1j4cR6-0008LT-In
 for qemu-devel@nongnu.org; Wed, 19 Feb 2020 22:23:38 -0500
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:44713 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1j4cR6-0008IZ-8Z; Wed, 19 Feb 2020 22:23:36 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 48NKg10cTLz9sSW; Thu, 20 Feb 2020 14:23:25 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1582169005;
 bh=pvwsDEYE4Sh8lhF4sfzNlBn6swIslRJZWqjlh3D2SbM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SCOA0Fdnjz7fP0Jcqy6RdfPF1AXX45I069o3JgaJXq4f56luCbOBJQ7Nr8VpkrFq9
 yfx2+iYk+V45UE1phiEy/9TJdb9R83yM1U1qDyrDZidsY/V6yBYzq5+THoSmdvQcx4
 jy1nO404KrSICQ/0fUxxlhekveEDCp9JoIrlrv6c=
From: David Gibson <david@gibson.dropbear.id.au>
To: qemu-ppc@nongnu.org,
	groug@kaod.org,
	clg@kaod.org
Subject: [PATCH v5 10/18] target/ppc: Only calculate RMLS derived RMA limit on
 demand
Date: Thu, 20 Feb 2020 14:23:08 +1100
Message-Id: <20200220032317.96884-11-david@gibson.dropbear.id.au>
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
Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/cpu.h        | 1 -
 target/ppc/mmu-hash64.c | 8 +++++---
 2 files changed, 5 insertions(+), 4 deletions(-)

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
index 46690bc79b..203a41cca1 100644
--- a/target/ppc/mmu-hash64.c
+++ b/target/ppc/mmu-hash64.c
@@ -844,8 +844,10 @@ int ppc_hash64_handle_mmu_fault(PowerPCCPU *cpu, vad=
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
@@ -1007,8 +1009,9 @@ hwaddr ppc_hash64_get_phys_page_debug(PowerPCCPU *c=
pu, target_ulong addr)
                 return -1;
             }
         } else {
+            target_ulong limit =3D rmls_limit(cpu);
             /* Emulated old-style RMO mode, bounds check against RMLS */
-            if (raddr >=3D env->rmls) {
+            if (raddr >=3D limit) {
                 return -1;
             }
             return raddr | env->spr[SPR_RMOR];
@@ -1098,7 +1101,6 @@ void ppc_store_lpcr(PowerPCCPU *cpu, target_ulong v=
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


