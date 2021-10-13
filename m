Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D60142CCFE
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 23:42:48 +0200 (CEST)
Received: from localhost ([::1]:45236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mam1P-0002nq-L1
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 17:42:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1malzY-0008W9-Ld
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 17:40:52 -0400
Received: from smtpout2.mo529.mail-out.ovh.net ([79.137.123.220]:42353)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1malzU-0004ql-8A
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 17:40:52 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.25])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 97967C48051B;
 Wed, 13 Oct 2021 23:40:45 +0200 (CEST)
Received: from kaod.org (37.59.142.103) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Wed, 13 Oct
 2021 23:40:44 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G0056b96a2a2-7312-4745-9c13-921adb59834f,
 ADB6EDD73587FDF9B2583A0B30D51DAD1F8B0393) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
Subject: [PATCH 2/3] ppc/spapr: Implement mce injection
Date: Wed, 13 Oct 2021 23:40:41 +0200
Message-ID: <20211013214042.618918-3-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211013214042.618918-1-clg@kaod.org>
References: <20211013214042.618918-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG6EX2.mxp5.local (172.16.2.52) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 436201db-4069-4e1a-aa7a-1f9adedace79
X-Ovh-Tracer-Id: 5934899884115790630
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrvddutddgudeivdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofgjfhggtgfgihesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeehheefgeejiedtffefteejudevjeeufeeugfdtfeeuleeuteevleeihffhgfdtleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheptghlgheskhgrohgurdhorhhg
Received-SPF: pass client-ip=79.137.123.220; envelope-from=clg@kaod.org;
 helo=smtpout2.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 Nicholas Piggin <npiggin@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Nicholas Piggin <npiggin@gmail.com>

This implements mce injection for spapr.

  (qemu) mce 0 0x200000 0x80 0xdeadbeef 1

    Disabling lock debugging due to kernel taint
    MCE: CPU0: machine check (Severe) Host SLB Multihit DAR: 00000000deadbeef [Recovered]
    MCE: CPU0: machine check (Severe) Host SLB Multihit [Recovered]
    MCE: CPU0: PID: 495 Comm: a NIP: [0000000130ee07c8]
    MCE: CPU0: Initiator CPU
    MCE: CPU0: Unknown
[   71.567193] MCE: CPU0: NIP: [c0000000000d7f6c] plpar_hcall_norets+0x1c/0x28
[   71.567249] MCE: CPU0: Initiator CPU
[   71.567308] MCE: CPU0: Unknown

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
[ clg: - simplified injection and moved code under spapr_cpu_core.c ]
Message-Id: <20200325144147.221875-5-npiggin@gmail.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 include/hw/ppc/spapr_cpu_core.h |  2 ++
 hw/ppc/spapr.c                  |  4 ++++
 hw/ppc/spapr_cpu_core.c         | 27 +++++++++++++++++++++++++++
 3 files changed, 33 insertions(+)

diff --git a/include/hw/ppc/spapr_cpu_core.h b/include/hw/ppc/spapr_cpu_core.h
index dab3dfc76c0a..6734c7a89640 100644
--- a/include/hw/ppc/spapr_cpu_core.h
+++ b/include/hw/ppc/spapr_cpu_core.h
@@ -9,6 +9,7 @@
 #ifndef HW_SPAPR_CPU_CORE_H
 #define HW_SPAPR_CPU_CORE_H
 
+#include "hw/ppc/mce.h"
 #include "hw/cpu/core.h"
 #include "hw/qdev-core.h"
 #include "target/ppc/cpu-qom.h"
@@ -40,6 +41,7 @@ const char *spapr_get_cpu_core_type(const char *cpu_type);
 void spapr_cpu_set_entry_state(PowerPCCPU *cpu, target_ulong nip,
                                target_ulong r1, target_ulong r3,
                                target_ulong r4);
+void spapr_cpu_inject_mce(CPUState *cs, PPCMceInjectionParams *p);
 
 typedef struct SpaprCpuState {
     uint64_t vpa_addr;
diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 087449f93871..c4ff63a79313 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -56,6 +56,7 @@
 #include "hw/core/cpu.h"
 
 #include "hw/ppc/ppc.h"
+#include "hw/ppc/mce.h"
 #include "hw/loader.h"
 
 #include "hw/ppc/fdt.h"
@@ -4522,6 +4523,7 @@ static void spapr_machine_class_init(ObjectClass *oc, void *data)
     InterruptStatsProviderClass *ispc = INTERRUPT_STATS_PROVIDER_CLASS(oc);
     XiveFabricClass *xfc = XIVE_FABRIC_CLASS(oc);
     VofMachineIfClass *vmc = VOF_MACHINE_CLASS(oc);
+    PPCMceInjectionClass *mcec = PPC_MCE_INJECTION_CLASS(oc);
 
     mc->desc = "pSeries Logical Partition (PAPR compliant)";
     mc->ignore_boot_device_suffixes = true;
@@ -4615,6 +4617,7 @@ static void spapr_machine_class_init(ObjectClass *oc, void *data)
     vmc->client_architecture_support = spapr_vof_client_architecture_support;
     vmc->quiesce = spapr_vof_quiesce;
     vmc->setprop = spapr_vof_setprop;
+    mcec->inject_mce = spapr_cpu_inject_mce;
 }
 
 static const TypeInfo spapr_machine_info = {
@@ -4635,6 +4638,7 @@ static const TypeInfo spapr_machine_info = {
         { TYPE_INTERRUPT_STATS_PROVIDER },
         { TYPE_XIVE_FABRIC },
         { TYPE_VOF_MACHINE_IF },
+        { TYPE_PPC_MCE_INJECTION },
         { }
     },
 };
diff --git a/hw/ppc/spapr_cpu_core.c b/hw/ppc/spapr_cpu_core.c
index 58e7341cb784..360efc16b1d6 100644
--- a/hw/ppc/spapr_cpu_core.c
+++ b/hw/ppc/spapr_cpu_core.c
@@ -9,6 +9,7 @@
 
 #include "qemu/osdep.h"
 #include "hw/cpu/core.h"
+#include "hw/core/cpu.h"
 #include "hw/ppc/spapr_cpu_core.h"
 #include "hw/qdev-properties.h"
 #include "migration/vmstate.h"
@@ -19,12 +20,38 @@
 #include "sysemu/kvm.h"
 #include "target/ppc/kvm_ppc.h"
 #include "hw/ppc/ppc.h"
+#include "hw/ppc/mce.h"
 #include "target/ppc/mmu-hash64.h"
 #include "sysemu/numa.h"
 #include "sysemu/reset.h"
 #include "sysemu/hw_accel.h"
 #include "qemu/error-report.h"
 
+static void spapr_cpu_inject_mce_on_cpu(CPUState *cs, run_on_cpu_data data)
+{
+    PPCMceInjectionParams *params = (PPCMceInjectionParams *) data.host_ptr;
+    PowerPCCPU *cpu = POWERPC_CPU(cs);
+    CPUPPCState *env = &cpu->env;
+    uint64_t srr1_mce_bits = PPC_BITMASK(42, 45) | PPC_BIT(36);
+
+    cpu_synchronize_state(cs);
+
+    env->spr[SPR_SRR0] = env->nip;
+    env->spr[SPR_SRR1] = (env->msr & ~srr1_mce_bits) |
+                         (params->srr1_mask & srr1_mce_bits);
+    if (params->dsisr) {
+        env->spr[SPR_DSISR] = params->dsisr;
+        env->spr[SPR_DAR] = params->dar;
+    }
+
+    spapr_mce_req_event(cpu, params->recovered);
+}
+
+void spapr_cpu_inject_mce(CPUState *cs, PPCMceInjectionParams *p)
+{
+    run_on_cpu(cs, spapr_cpu_inject_mce_on_cpu, RUN_ON_CPU_HOST_PTR(p));
+}
+
 static void spapr_reset_vcpu(PowerPCCPU *cpu)
 {
     CPUState *cs = CPU(cpu);
-- 
2.31.1


