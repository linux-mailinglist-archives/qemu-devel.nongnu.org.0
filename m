Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5917AA11B8
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Aug 2019 08:25:42 +0200 (CEST)
Received: from localhost ([::1]:45818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i3DsL-00039Z-FH
	for lists+qemu-devel@lfdr.de; Thu, 29 Aug 2019 02:25:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35528)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1i3DcM-0004kT-Ni
 for qemu-devel@nongnu.org; Thu, 29 Aug 2019 02:09:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1i3DcL-0003uJ-3J
 for qemu-devel@nongnu.org; Thu, 29 Aug 2019 02:09:10 -0400
Received: from ozlabs.org ([203.11.71.1]:51627)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1i3DcK-0003hA-DT; Thu, 29 Aug 2019 02:09:08 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 46JscN6gnQz9sPl; Thu, 29 Aug 2019 16:08:36 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1567058916;
 bh=U8/6ImttswcTXTyQikTYu8Q2SyMvk8f/u/noroeDGcw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FWYJ1q/jBLGc9kSXAFoU23KEomd8yOWUADWqmttzGsZDnIh+psswWU4gol3XBmzQg
 SawlNbSCK2SXHfN2ctzlxQtUbF2SkbY8xoMWmBuLYUyWnSBY65WV+oXM4rotnqtFQt
 6pYjWSENkqPhV8sJcT7obvIi9lIfA5KZV+N/TgJ8=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Date: Thu, 29 Aug 2019 16:08:23 +1000
Message-Id: <20190829060827.25731-16-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190829060827.25731-1-david@gibson.dropbear.id.au>
References: <20190829060827.25731-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 203.11.71.1
Subject: [Qemu-devel] [PULL 15/19] powerpc/spapr: Add host threads parameter
 to ibm, get_system_parameter
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
Cc: lvivier@redhat.com, aik@ozlabs.ru, groug@kaod.org, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org, Suraj Jitindar Singh <sjitindarsingh@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Suraj Jitindar Singh <sjitindarsingh@gmail.com>

The ibm,get_system_parameter rtas call is used by the guest to retrieve
data relating to certain parameters of the system. The SPLPAR
characteristics option (token 20) is used to determine characteristics of
the environment in which the lpar will run.

It may be useful for a guest to know the number of physical host threads
present on the underlying system where it is being run. Add the
characteristic "HostThrs" to the SPLPAR Characteristics
ibm,get_system_parameter rtas call to expose this information to a
guest. Add a n_host_threads property to the processor class which is
then used to retrieve this information and define it for POWER8 and
POWER9. Other processors will default to 0 and the charateristic won't
be added.

Signed-off-by: Suraj Jitindar Singh <sjitindarsingh@gmail.com>

Message-Id: <20190827045751.22123-1-sjitindarsingh@gmail.com>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/spapr_rtas.c             | 15 +++++++++++++++
 target/ppc/cpu-qom.h            |  1 +
 target/ppc/translate_init.inc.c |  2 ++
 3 files changed, 18 insertions(+)

diff --git a/hw/ppc/spapr_rtas.c b/hw/ppc/spapr_rtas.c
index 526b489297..bee3835214 100644
--- a/hw/ppc/spapr_rtas.c
+++ b/hw/ppc/spapr_rtas.c
@@ -266,6 +266,7 @@ static void rtas_ibm_get_system_parameter(PowerPCCPU =
*cpu,
                                           target_ulong args,
                                           uint32_t nret, target_ulong re=
ts)
 {
+    PowerPCCPUClass *pcc =3D POWERPC_CPU_GET_CLASS(cpu);
     MachineState *ms =3D MACHINE(qdev_get_machine());
     unsigned int max_cpus =3D ms->smp.max_cpus;
     target_ulong parameter =3D rtas_ld(args, 0);
@@ -283,6 +284,20 @@ static void rtas_ibm_get_system_parameter(PowerPCCPU=
 *cpu,
                                           current_machine->ram_size / Mi=
B,
                                           ms->smp.cpus,
                                           max_cpus);
+        if (pcc->n_host_threads > 0) {
+            char *hostthr_val, *old =3D param_val;
+
+            /*
+             * Add HostThrs property. This property is not present in PA=
PR but
+             * is expected by some guests to communicate the number of p=
hysical
+             * host threads per core on the system so that they can scal=
e
+             * information which varies based on the thread configuratio=
n.
+             */
+            hostthr_val =3D g_strdup_printf(",HostThrs=3D%d", pcc->n_hos=
t_threads);
+            param_val =3D g_strconcat(param_val, hostthr_val, NULL);
+            g_free(hostthr_val);
+            g_free(old);
+        }
         ret =3D sysparm_st(buffer, length, param_val, strlen(param_val) =
+ 1);
         g_free(param_val);
         break;
diff --git a/target/ppc/cpu-qom.h b/target/ppc/cpu-qom.h
index 7ffdb0a706..e499575dc8 100644
--- a/target/ppc/cpu-qom.h
+++ b/target/ppc/cpu-qom.h
@@ -191,6 +191,7 @@ typedef struct PowerPCCPUClass {
     const PPCHash64Options *hash64_opts;
     struct ppc_radix_page_info *radix_page_info;
     uint32_t lrg_decr_bits;
+    int n_host_threads;
     void (*init_proc)(CPUPPCState *env);
     int  (*check_pow)(CPUPPCState *env);
     int (*handle_mmu_fault)(PowerPCCPU *cpu, vaddr eaddr, int rwx, int m=
mu_idx);
diff --git a/target/ppc/translate_init.inc.c b/target/ppc/translate_init.=
inc.c
index 023138c2f9..0fb11c7ac6 100644
--- a/target/ppc/translate_init.inc.c
+++ b/target/ppc/translate_init.inc.c
@@ -8770,6 +8770,7 @@ POWERPC_FAMILY(POWER8)(ObjectClass *oc, void *data)
     pcc->handle_mmu_fault =3D ppc_hash64_handle_mmu_fault;
     pcc->hash64_opts =3D &ppc_hash64_opts_POWER7;
     pcc->lrg_decr_bits =3D 32;
+    pcc->n_host_threads =3D 8;
 #endif
     pcc->excp_model =3D POWERPC_EXCP_POWER8;
     pcc->bus_model =3D PPC_FLAGS_INPUT_POWER7;
@@ -8981,6 +8982,7 @@ POWERPC_FAMILY(POWER9)(ObjectClass *oc, void *data)
     pcc->hash64_opts =3D &ppc_hash64_opts_POWER7;
     pcc->radix_page_info =3D &POWER9_radix_page_info;
     pcc->lrg_decr_bits =3D 56;
+    pcc->n_host_threads =3D 4;
 #endif
     pcc->excp_model =3D POWERPC_EXCP_POWER9;
     pcc->bus_model =3D PPC_FLAGS_INPUT_POWER9;
--=20
2.21.0


