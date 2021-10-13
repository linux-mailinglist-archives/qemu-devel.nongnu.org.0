Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F95D42CCFF
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 23:43:01 +0200 (CEST)
Received: from localhost ([::1]:46444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mam1c-0003dR-Gq
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 17:43:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1malzb-0000Dr-6x
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 17:40:55 -0400
Received: from smtpout3.mo529.mail-out.ovh.net ([46.105.54.81]:34659)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1malzU-0004qm-IA
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 17:40:54 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.25])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id DB0B4C48051D;
 Wed, 13 Oct 2021 23:40:45 +0200 (CEST)
Received: from kaod.org (37.59.142.103) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Wed, 13 Oct
 2021 23:40:45 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G005dec8fab3-1005-49e0-9718-e20915549239,
 ADB6EDD73587FDF9B2583A0B30D51DAD1F8B0393) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
Subject: [PATCH 3/3] ppc/pnv: Implement mce injection
Date: Wed, 13 Oct 2021 23:40:42 +0200
Message-ID: <20211013214042.618918-4-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211013214042.618918-1-clg@kaod.org>
References: <20211013214042.618918-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG6EX2.mxp5.local (172.16.2.52) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: f81329d9-1043-4d3b-b79c-2e31025cd780
X-Ovh-Tracer-Id: 5934899884953864998
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrvddutddgudeivdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofgjfhggtgfgihesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeehheefgeejiedtffefteejudevjeeufeeugfdtfeeuleeuteevleeihffhgfdtleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheptghlgheskhgrohgurdhorhhg
Received-SPF: pass client-ip=46.105.54.81; envelope-from=clg@kaod.org;
 helo=smtpout3.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

This implements mce injection for pnv.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
[ clg: - simplified injection and moved code under pnv_core.c
       - removed superfluous cpu_synchronize_state()
       - clear previous setting in SPR_SRR1 ]
Message-Id: <20200325144147.221875-6-npiggin@gmail.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 include/hw/ppc/pnv_core.h |  4 ++++
 target/ppc/cpu.h          |  1 +
 hw/ppc/pnv.c              |  3 +++
 hw/ppc/pnv_core.c         | 27 +++++++++++++++++++++++++++
 target/ppc/excp_helper.c  | 12 ++++++++++++
 5 files changed, 47 insertions(+)

diff --git a/include/hw/ppc/pnv_core.h b/include/hw/ppc/pnv_core.h
index c22eab2e1f69..7ed7a52077ea 100644
--- a/include/hw/ppc/pnv_core.h
+++ b/include/hw/ppc/pnv_core.h
@@ -23,6 +23,7 @@
 #include "hw/cpu/core.h"
 #include "target/ppc/cpu.h"
 #include "qom/object.h"
+#include "hw/ppc/mce.h"
 
 #define TYPE_PNV_CORE "powernv-cpu-core"
 OBJECT_DECLARE_TYPE(PnvCore, PnvCoreClass,
@@ -70,4 +71,7 @@ struct PnvQuad {
     uint32_t quad_id;
     MemoryRegion xscom_regs;
 };
+
+void pnv_cpu_inject_mce(CPUState *cs, PPCMceInjectionParams *p);
+
 #endif /* PPC_PNV_CORE_H */
diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index baa4e7c34d30..e0757e287718 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -1273,6 +1273,7 @@ int ppc32_cpu_write_elf32_note(WriteCoreDumpFunction f, CPUState *cs,
 void ppc_cpu_do_interrupt(CPUState *cpu);
 bool ppc_cpu_exec_interrupt(CPUState *cpu, int int_req);
 void ppc_cpu_do_system_reset(CPUState *cs);
+void ppc_cpu_do_machine_check(CPUState *cs);
 void ppc_cpu_do_fwnmi_machine_check(CPUState *cs, target_ulong vector);
 extern const VMStateDescription vmstate_ppc_cpu;
 #endif
diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index 71e45515f136..374f48ea7f1b 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -2001,6 +2001,7 @@ static void pnv_machine_class_init(ObjectClass *oc, void *data)
     MachineClass *mc = MACHINE_CLASS(oc);
     InterruptStatsProviderClass *ispc = INTERRUPT_STATS_PROVIDER_CLASS(oc);
     NMIClass *nc = NMI_CLASS(oc);
+    PPCMceInjectionClass *mcec = PPC_MCE_INJECTION_CLASS(oc);
 
     mc->desc = "IBM PowerNV (Non-Virtualized)";
     mc->init = pnv_init;
@@ -2018,6 +2019,7 @@ static void pnv_machine_class_init(ObjectClass *oc, void *data)
     mc->default_ram_id = "pnv.ram";
     ispc->print_info = pnv_pic_print_info;
     nc->nmi_monitor_handler = pnv_nmi;
+    mcec->inject_mce = pnv_cpu_inject_mce;
 
     object_class_property_add_bool(oc, "hb-mode",
                                    pnv_machine_get_hb, pnv_machine_set_hb);
@@ -2080,6 +2082,7 @@ static const TypeInfo types[] = {
         .interfaces = (InterfaceInfo[]) {
             { TYPE_INTERRUPT_STATS_PROVIDER },
             { TYPE_NMI },
+            { TYPE_PPC_MCE_INJECTION },
             { },
         },
     },
diff --git a/hw/ppc/pnv_core.c b/hw/ppc/pnv_core.c
index 19e8eb885f71..868b361f99e5 100644
--- a/hw/ppc/pnv_core.c
+++ b/hw/ppc/pnv_core.c
@@ -25,12 +25,39 @@
 #include "target/ppc/cpu.h"
 #include "hw/ppc/ppc.h"
 #include "hw/ppc/pnv.h"
+#include "hw/ppc/mce.h"
 #include "hw/ppc/pnv_core.h"
 #include "hw/ppc/pnv_xscom.h"
 #include "hw/ppc/xics.h"
 #include "hw/qdev-properties.h"
 #include "helper_regs.h"
 
+static void pnv_cpu_inject_mce_on_cpu(CPUState *cs, run_on_cpu_data data)
+{
+    PPCMceInjectionParams *params = (PPCMceInjectionParams *) data.host_ptr;
+    PowerPCCPU *cpu = POWERPC_CPU(cs);
+    CPUPPCState *env = &cpu->env;
+    uint64_t srr1_mce_bits = PPC_BITMASK(42, 45) | PPC_BIT(36);
+
+    ppc_cpu_do_machine_check(cs);
+
+    env->spr[SPR_SRR1] = (env->msr & ~srr1_mce_bits) |
+                         (params->srr1_mask & srr1_mce_bits);
+    if (params->dsisr) {
+        env->spr[SPR_DSISR] = params->dsisr;
+        env->spr[SPR_DAR] = params->dar;
+    }
+
+    if (!params->recovered) {
+        env->msr &= ~MSR_RI;
+    }
+}
+
+void pnv_cpu_inject_mce(CPUState *cs, PPCMceInjectionParams *p)
+{
+    run_on_cpu(cs, pnv_cpu_inject_mce_on_cpu, RUN_ON_CPU_HOST_PTR(p));
+}
+
 static const char *pnv_core_cpu_typename(PnvCore *pc)
 {
     const char *core_type = object_class_get_name(object_get_class(OBJECT(pc)));
diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index b7d176792098..f383f1646cc3 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -379,6 +379,10 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp)
             cs->halted = 1;
             cpu_interrupt_exittb(cs);
         }
+        if (msr_pow) {
+            /* indicate that we resumed from power save mode */
+            msr |= 0x10000;
+        }
         if (env->msr_mask & MSR_HVB) {
             /*
              * ISA specifies HV, but can be delivered to guest with HV
@@ -1071,6 +1075,14 @@ void ppc_cpu_do_system_reset(CPUState *cs)
     powerpc_excp(cpu, env->excp_model, POWERPC_EXCP_RESET);
 }
 
+void ppc_cpu_do_machine_check(CPUState *cs)
+{
+    PowerPCCPU *cpu = POWERPC_CPU(cs);
+    CPUPPCState *env = &cpu->env;
+
+    powerpc_excp(cpu, env->excp_model, POWERPC_EXCP_MCHECK);
+}
+
 void ppc_cpu_do_fwnmi_machine_check(CPUState *cs, target_ulong vector)
 {
     PowerPCCPU *cpu = POWERPC_CPU(cs);
-- 
2.31.1


