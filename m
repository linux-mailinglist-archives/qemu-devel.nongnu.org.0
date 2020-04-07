Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B1AD1A05D3
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Apr 2020 06:39:12 +0200 (CEST)
Received: from localhost ([::1]:41026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jLg11-0004Lv-Io
	for lists+qemu-devel@lfdr.de; Tue, 07 Apr 2020 00:39:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52292)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1jLfyL-0007xw-1l
 for qemu-devel@nongnu.org; Tue, 07 Apr 2020 00:36:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1jLfyJ-0004BS-U5
 for qemu-devel@nongnu.org; Tue, 07 Apr 2020 00:36:24 -0400
Received: from ozlabs.org ([203.11.71.1]:56779)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1jLfyH-00045T-Ip; Tue, 07 Apr 2020 00:36:23 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 48xF3K281Fz9sSX; Tue,  7 Apr 2020 14:36:13 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1586234173;
 bh=nkDRj1wvJrBLoal+xipqMmvSP+zZGScABzO4k5J7ffk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=iE+BQ1mgVXj75X3NS88G2mNjV3mTYFIC5qN2qgdBFmAV5y3d0qSGUKxzdZz5XY0fO
 3r5NjAFXuQkPaKaeMrrJTrF7BV4iFAmgcH6xthmYt6RzEtYF/sgfFUvmONbMFX9wV4
 eYs3O2uBXx5B2QBV2ttcelXEBaTtjoT9ABmSHexM=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 03/10] ppc/spapr: KVM FWNMI should not be enabled until guest
 requests it
Date: Tue,  7 Apr 2020 14:35:59 +1000
Message-Id: <20200407043606.291546-4-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.25.2
In-Reply-To: <20200407043606.291546-1-david@gibson.dropbear.id.au>
References: <20200407043606.291546-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
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
Cc: aik@ozlabs.ru, qemu-devel@nongnu.org, Nicholas Piggin <npiggin@gmail.com>,
 groug@kaod.org, qemu-ppc@nongnu.org, clg@kaod.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Nicholas Piggin <npiggin@gmail.com>

The KVM FWNMI capability should be enabled with the "ibm,nmi-register"
rtas call. Although MCEs from KVM will be delivered as architected
interrupts to the guest before "ibm,nmi-register" is called, KVM has
different behaviour depending on whether the guest has enabled FWNMI
(it attempts to do more recovery on behalf of a non-FWNMI guest).

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
Message-Id: <20200325142906.221248-2-npiggin@gmail.com>
Reviewed-by: Greg Kurz <groug@kaod.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/spapr_caps.c  | 7 ++++---
 hw/ppc/spapr_rtas.c  | 7 +++++++
 target/ppc/kvm.c     | 7 +++++++
 target/ppc/kvm_ppc.h | 6 ++++++
 4 files changed, 24 insertions(+), 3 deletions(-)

diff --git a/hw/ppc/spapr_caps.c b/hw/ppc/spapr_caps.c
index 679ae7959f..eb54f94227 100644
--- a/hw/ppc/spapr_caps.c
+++ b/hw/ppc/spapr_caps.c
@@ -517,9 +517,10 @@ static void cap_fwnmi_apply(SpaprMachineState *spapr=
, uint8_t val,
     }
=20
     if (kvm_enabled()) {
-        if (kvmppc_set_fwnmi() < 0) {
-            error_setg(errp, "Firmware Assisted Non-Maskable Interrupts(=
FWNMI) "
-                             "not supported by KVM");
+        if (!kvmppc_get_fwnmi()) {
+            error_setg(errp,
+"Firmware Assisted Non-Maskable Interrupts(FWNMI) not supported by KVM."=
);
+            error_append_hint(errp, "Try appending -machine cap-fwnmi=3D=
off\n");
         }
     }
 }
diff --git a/hw/ppc/spapr_rtas.c b/hw/ppc/spapr_rtas.c
index 9fb8c8632a..29abe66d01 100644
--- a/hw/ppc/spapr_rtas.c
+++ b/hw/ppc/spapr_rtas.c
@@ -437,6 +437,13 @@ static void rtas_ibm_nmi_register(PowerPCCPU *cpu,
         return;
     }
=20
+    if (kvm_enabled()) {
+        if (kvmppc_set_fwnmi() < 0) {
+            rtas_st(rets, 0, RTAS_OUT_NOT_SUPPORTED);
+            return;
+        }
+    }
+
     spapr->fwnmi_system_reset_addr =3D sreset_addr;
     spapr->fwnmi_machine_check_addr =3D mce_addr;
=20
diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
index 597f72be1b..03d0667e8f 100644
--- a/target/ppc/kvm.c
+++ b/target/ppc/kvm.c
@@ -88,6 +88,7 @@ static int cap_ppc_safe_indirect_branch;
 static int cap_ppc_count_cache_flush_assist;
 static int cap_ppc_nested_kvm_hv;
 static int cap_large_decr;
+static int cap_fwnmi;
=20
 static uint32_t debug_inst_opcode;
=20
@@ -136,6 +137,7 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
     kvmppc_get_cpu_characteristics(s);
     cap_ppc_nested_kvm_hv =3D kvm_vm_check_extension(s, KVM_CAP_PPC_NEST=
ED_HV);
     cap_large_decr =3D kvmppc_get_dec_bits();
+    cap_fwnmi =3D kvm_vm_check_extension(s, KVM_CAP_PPC_FWNMI);
     /*
      * Note: setting it to false because there is not such capability
      * in KVM at this moment.
@@ -2064,6 +2066,11 @@ void kvmppc_set_mpic_proxy(PowerPCCPU *cpu, int mp=
ic_proxy)
     }
 }
=20
+bool kvmppc_get_fwnmi(void)
+{
+    return cap_fwnmi;
+}
+
 int kvmppc_set_fwnmi(void)
 {
     PowerPCCPU *cpu =3D POWERPC_CPU(first_cpu);
diff --git a/target/ppc/kvm_ppc.h b/target/ppc/kvm_ppc.h
index 332fa0aa1c..fcaf745516 100644
--- a/target/ppc/kvm_ppc.h
+++ b/target/ppc/kvm_ppc.h
@@ -27,6 +27,7 @@ void kvmppc_enable_h_page_init(void);
 void kvmppc_set_papr(PowerPCCPU *cpu);
 int kvmppc_set_compat(PowerPCCPU *cpu, uint32_t compat_pvr);
 void kvmppc_set_mpic_proxy(PowerPCCPU *cpu, int mpic_proxy);
+bool kvmppc_get_fwnmi(void);
 int kvmppc_set_fwnmi(void);
 int kvmppc_smt_threads(void);
 void kvmppc_error_append_smt_possible_hint(Error *const *errp);
@@ -163,6 +164,11 @@ static inline void kvmppc_set_mpic_proxy(PowerPCCPU =
*cpu, int mpic_proxy)
 {
 }
=20
+static inline bool kvmppc_get_fwnmi(void)
+{
+    return false;
+}
+
 static inline int kvmppc_set_fwnmi(void)
 {
     return -1;
--=20
2.25.2


