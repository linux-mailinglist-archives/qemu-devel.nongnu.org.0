Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F14A4BB7F8
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Feb 2022 12:23:29 +0100 (CET)
Received: from localhost ([::1]:51236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nL1MG-0004Gg-5I
	for lists+qemu-devel@lfdr.de; Fri, 18 Feb 2022 06:23:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nL0fW-00012y-7T; Fri, 18 Feb 2022 05:39:20 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:40384)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nL0fN-0005fk-3M; Fri, 18 Feb 2022 05:39:17 -0500
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21IAMJIH016776; 
 Fri, 18 Feb 2022 10:38:44 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ea9n68cn7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Feb 2022 10:38:44 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21IAVDTd019706;
 Fri, 18 Feb 2022 10:38:43 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ea9n68cmc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Feb 2022 10:38:43 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21IAcMGd002021;
 Fri, 18 Feb 2022 10:38:41 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma03fra.de.ibm.com with ESMTP id 3e64hapsyf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Feb 2022 10:38:41 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21IAccXF44171690
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 18 Feb 2022 10:38:38 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9F2B9A4079;
 Fri, 18 Feb 2022 10:38:38 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 48DA7A4072;
 Fri, 18 Feb 2022 10:38:38 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Fri, 18 Feb 2022 10:38:38 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.87.94])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 75E642201F1;
 Fri, 18 Feb 2022 11:38:37 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 12/39] spapr: implement nested-hv capability for the virtual
 hypervisor
Date: Fri, 18 Feb 2022 11:38:00 +0100
Message-Id: <20220218103827.682032-13-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220218103827.682032-1-clg@kaod.org>
References: <20220218103827.682032-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: pweNd8NGqboY2C0Itlsz1IS6YPWfCeIR
X-Proofpoint-GUID: 6ccOXoBZLCFrnSp8kddEoN63eOr99ADS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-18_04,2022-02-18_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0
 clxscore=1034 priorityscore=1501 mlxscore=0 suspectscore=0 bulkscore=0
 adultscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202180067
Received-SPF: softfail client-ip=148.163.156.1; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Nicholas Piggin <npiggin@gmail.com>, Fabiano Rosas <farosas@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Nicholas Piggin <npiggin@gmail.com>

This implements the Nested KVM HV hcall API for spapr under TCG.

The L2 is switched in when the H_ENTER_NESTED hcall is made, and the
L1 is switched back in returned from the hcall when a HV exception
is sent to the vhyp. Register state is copied in and out according to
the nested KVM HV hcall API specification.

The hdecr timer is started when the L2 is switched in, and it provides
the HDEC / 0x980 return to L1.

The MMU re-uses the bare metal radix 2-level page table walker by
using the get_pate method to point the MMU to the nested partition
table entry. MMU faults due to partition scope errors raise HV
exceptions and accordingly are routed back to the L1.

The MMU does not tag translations for the L1 (direct) vs L2 (nested)
guests, so the TLB is flushed on any L1<->L2 transition (hcall entry
and exit).

Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
[ clg: checkpatch fixes ]
Message-Id: <20220216102545.1808018-10-npiggin@gmail.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 include/hw/ppc/spapr.h          |  74 ++++++-
 include/hw/ppc/spapr_cpu_core.h |   5 +
 hw/ppc/spapr.c                  |  37 +++-
 hw/ppc/spapr_caps.c             |  14 +-
 hw/ppc/spapr_hcall.c            | 333 ++++++++++++++++++++++++++++++++
 5 files changed, 452 insertions(+), 11 deletions(-)

diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
index 727b2a0e7fc9..f5c33dcc8616 100644
--- a/include/hw/ppc/spapr.h
+++ b/include/hw/ppc/spapr.h
@@ -197,6 +197,9 @@ struct SpaprMachineState {
     bool has_graphics;
     uint32_t vsmt;       /* Virtual SMT mode (KVM's "core stride") */
=20
+    /* Nested HV support (TCG only) */
+    uint64_t nested_ptcr;
+
     Notifier epow_notifier;
     QTAILQ_HEAD(, SpaprEventLogEntry) pending_events;
     bool use_hotplug_event_source;
@@ -579,7 +582,14 @@ struct SpaprMachineState {
 #define KVMPPC_H_UPDATE_DT      (KVMPPC_HCALL_BASE + 0x3)
 /* 0x4 was used for KVMPPC_H_UPDATE_PHANDLE in SLOF */
 #define KVMPPC_H_VOF_CLIENT     (KVMPPC_HCALL_BASE + 0x5)
-#define KVMPPC_HCALL_MAX        KVMPPC_H_VOF_CLIENT
+
+/* Platform-specific hcalls used for nested HV KVM */
+#define KVMPPC_H_SET_PARTITION_TABLE   (KVMPPC_HCALL_BASE + 0x800)
+#define KVMPPC_H_ENTER_NESTED          (KVMPPC_HCALL_BASE + 0x804)
+#define KVMPPC_H_TLB_INVALIDATE        (KVMPPC_HCALL_BASE + 0x808)
+#define KVMPPC_H_COPY_TOFROM_GUEST     (KVMPPC_HCALL_BASE + 0x80C)
+
+#define KVMPPC_HCALL_MAX        KVMPPC_H_COPY_TOFROM_GUEST
=20
 /*
  * The hcall range 0xEF00 to 0xEF80 is reserved for use in facilitating
@@ -589,6 +599,65 @@ struct SpaprMachineState {
 #define SVM_H_TPM_COMM              0xEF10
 #define SVM_HCALL_MAX               SVM_H_TPM_COMM
=20
+/*
+ * Register state for entering a nested guest with H_ENTER_NESTED.
+ * New member must be added at the end.
+ */
+struct kvmppc_hv_guest_state {
+    uint64_t version;      /* version of this structure layout, must be =
first */
+    uint32_t lpid;
+    uint32_t vcpu_token;
+    /* These registers are hypervisor privileged (at least for writing) =
*/
+    uint64_t lpcr;
+    uint64_t pcr;
+    uint64_t amor;
+    uint64_t dpdes;
+    uint64_t hfscr;
+    int64_t tb_offset;
+    uint64_t dawr0;
+    uint64_t dawrx0;
+    uint64_t ciabr;
+    uint64_t hdec_expiry;
+    uint64_t purr;
+    uint64_t spurr;
+    uint64_t ic;
+    uint64_t vtb;
+    uint64_t hdar;
+    uint64_t hdsisr;
+    uint64_t heir;
+    uint64_t asdr;
+    /* These are OS privileged but need to be set late in guest entry */
+    uint64_t srr0;
+    uint64_t srr1;
+    uint64_t sprg[4];
+    uint64_t pidr;
+    uint64_t cfar;
+    uint64_t ppr;
+    /* Version 1 ends here */
+    uint64_t dawr1;
+    uint64_t dawrx1;
+    /* Version 2 ends here */
+};
+
+/* Latest version of hv_guest_state structure */
+#define HV_GUEST_STATE_VERSION  2
+
+/* Linux 64-bit powerpc pt_regs struct, used by nested HV */
+struct kvmppc_pt_regs {
+    uint64_t gpr[32];
+    uint64_t nip;
+    uint64_t msr;
+    uint64_t orig_gpr3;    /* Used for restarting system calls */
+    uint64_t ctr;
+    uint64_t link;
+    uint64_t xer;
+    uint64_t ccr;
+    uint64_t softe;        /* Soft enabled/disabled */
+    uint64_t trap;         /* Reason for being here */
+    uint64_t dar;          /* Fault registers */
+    uint64_t dsisr;        /* on 4xx/Book-E used for ESR */
+    uint64_t result;       /* Result of a system call */
+};
=20
 typedef struct SpaprDeviceTreeUpdateHeader {
     uint32_t version_id;
@@ -606,6 +675,9 @@ typedef target_ulong (*spapr_hcall_fn)(PowerPCCPU *cp=
u, SpaprMachineState *sm,
 void spapr_register_hypercall(target_ulong opcode, spapr_hcall_fn fn);
 target_ulong spapr_hypercall(PowerPCCPU *cpu, target_ulong opcode,
                              target_ulong *args);
+
+void spapr_exit_nested(PowerPCCPU *cpu, int excp);
+
 target_ulong softmmu_resize_hpt_prepare(PowerPCCPU *cpu, SpaprMachineSta=
te *spapr,
                                          target_ulong shift);
 target_ulong softmmu_resize_hpt_commit(PowerPCCPU *cpu, SpaprMachineStat=
e *spapr,
diff --git a/include/hw/ppc/spapr_cpu_core.h b/include/hw/ppc/spapr_cpu_c=
ore.h
index dab3dfc76c0a..b560514560df 100644
--- a/include/hw/ppc/spapr_cpu_core.h
+++ b/include/hw/ppc/spapr_cpu_core.h
@@ -48,6 +48,11 @@ typedef struct SpaprCpuState {
     bool prod; /* not migrated, only used to improve dispatch latencies =
*/
     struct ICPState *icp;
     struct XiveTCTX *tctx;
+
+    /* Fields for nested-HV support */
+    bool in_nested; /* true while the L2 is executing */
+    CPUPPCState *nested_host_state; /* holds the L1 state while L2 execu=
tes */
+    int64_t nested_tb_offset; /* L1->L2 TB offset */
 } SpaprCpuState;
=20
 static inline SpaprCpuState *spapr_cpu_state(PowerPCCPU *cpu)
diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 51ba8615f281..f0b75b22bb61 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -1270,6 +1270,8 @@ static void emulate_spapr_hypercall(PPCVirtualHyper=
visor *vhyp,
     /* The TCG path should also be holding the BQL at this point */
     g_assert(qemu_mutex_iothread_locked());
=20
+    g_assert(!vhyp_cpu_in_nested(cpu));
+
     if (msr_pr) {
         hcall_dprintf("Hypercall made with MSR[PR]=3D1\n");
         env->gpr[3] =3D H_PRIVILEGE;
@@ -1313,12 +1315,34 @@ static bool spapr_get_pate(PPCVirtualHypervisor *=
vhyp, PowerPCCPU *cpu,
                            target_ulong lpid, ppc_v3_pate_t *entry)
 {
     SpaprMachineState *spapr =3D SPAPR_MACHINE(vhyp);
+    SpaprCpuState *spapr_cpu =3D spapr_cpu_state(cpu);
=20
-    assert(lpid =3D=3D 0);
+    if (!spapr_cpu->in_nested) {
+        assert(lpid =3D=3D 0);
=20
-    /* Copy PATE1:GR into PATE0:HR */
-    entry->dw0 =3D spapr->patb_entry & PATE0_HR;
-    entry->dw1 =3D spapr->patb_entry;
+        /* Copy PATE1:GR into PATE0:HR */
+        entry->dw0 =3D spapr->patb_entry & PATE0_HR;
+        entry->dw1 =3D spapr->patb_entry;
+
+    } else {
+        uint64_t patb, pats;
+
+        assert(lpid !=3D 0);
+
+        patb =3D spapr->nested_ptcr & PTCR_PATB;
+        pats =3D spapr->nested_ptcr & PTCR_PATS;
+
+        /* Calculate number of entries */
+        pats =3D 1ull << (pats + 12 - 4);
+        if (pats <=3D lpid) {
+            return false;
+        }
+
+        /* Grab entry */
+        patb +=3D 16 * lpid;
+        entry->dw0 =3D ldq_phys(CPU(cpu)->as, patb);
+        entry->dw1 =3D ldq_phys(CPU(cpu)->as, patb + 8);
+    }
=20
     return true;
 }
@@ -4474,7 +4498,9 @@ PowerPCCPU *spapr_find_cpu(int vcpu_id)
=20
 static bool spapr_cpu_in_nested(PowerPCCPU *cpu)
 {
-    return false;
+    SpaprCpuState *spapr_cpu =3D spapr_cpu_state(cpu);
+
+    return spapr_cpu->in_nested;
 }
=20
 static void spapr_cpu_exec_enter(PPCVirtualHypervisor *vhyp, PowerPCCPU =
*cpu)
@@ -4586,6 +4612,7 @@ static void spapr_machine_class_init(ObjectClass *o=
c, void *data)
     nc->nmi_monitor_handler =3D spapr_nmi;
     smc->phb_placement =3D spapr_phb_placement;
     vhc->cpu_in_nested =3D spapr_cpu_in_nested;
+    vhc->deliver_hv_excp =3D spapr_exit_nested;
     vhc->hypercall =3D emulate_spapr_hypercall;
     vhc->hpt_mask =3D spapr_hpt_mask;
     vhc->map_hptes =3D spapr_map_hptes;
diff --git a/hw/ppc/spapr_caps.c b/hw/ppc/spapr_caps.c
index ed7c077a0d90..616743127164 100644
--- a/hw/ppc/spapr_caps.c
+++ b/hw/ppc/spapr_caps.c
@@ -444,19 +444,23 @@ static void cap_nested_kvm_hv_apply(SpaprMachineSta=
te *spapr,
 {
     ERRP_GUARD();
     PowerPCCPU *cpu =3D POWERPC_CPU(first_cpu);
+    CPUPPCState *env =3D &cpu->env;
=20
     if (!val) {
         /* capability disabled by default */
         return;
     }
=20
-    if (tcg_enabled()) {
-        error_setg(errp, "No Nested KVM-HV support in TCG");
+    if (!(env->insns_flags2 & PPC2_ISA300)) {
+        error_setg(errp, "Nested-HV only supported on POWER9 and later")=
;
         error_append_hint(errp, "Try appending -machine cap-nested-hv=3D=
off\n");
-    } else if (kvm_enabled()) {
+        return;
+    }
+
+    if (kvm_enabled()) {
         if (!ppc_check_compat(cpu, CPU_POWERPC_LOGICAL_3_00, 0,
                               spapr->max_compat_pvr)) {
-            error_setg(errp, "Nested KVM-HV only supported on POWER9");
+            error_setg(errp, "Nested-HV only supported on POWER9 and lat=
er");
             error_append_hint(errp,
                               "Try appending -machine max-cpu-compat=3Dp=
ower9\n");
             return;
@@ -464,7 +468,7 @@ static void cap_nested_kvm_hv_apply(SpaprMachineState=
 *spapr,
=20
         if (!kvmppc_has_cap_nested_kvm_hv()) {
             error_setg(errp,
-                       "KVM implementation does not support Nested KVM-H=
V");
+                       "KVM implementation does not support Nested-HV");
             error_append_hint(errp,
                               "Try appending -machine cap-nested-hv=3Dof=
f\n");
         } else if (kvmppc_set_cap_nested_kvm_hv(val) < 0) {
diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
index 222c1b6bbdb6..f0082907872c 100644
--- a/hw/ppc/spapr_hcall.c
+++ b/hw/ppc/spapr_hcall.c
@@ -9,6 +9,7 @@
 #include "qemu/error-report.h"
 #include "exec/exec-all.h"
 #include "helper_regs.h"
+#include "hw/ppc/ppc.h"
 #include "hw/ppc/spapr.h"
 #include "hw/ppc/spapr_cpu_core.h"
 #include "mmu-hash64.h"
@@ -1497,6 +1498,333 @@ static void hypercall_register_softmmu(void)
 }
 #endif
=20
+/* TCG only */
+#define PRTS_MASK      0x1f
+
+static target_ulong h_set_ptbl(PowerPCCPU *cpu,
+                               SpaprMachineState *spapr,
+                               target_ulong opcode,
+                               target_ulong *args)
+{
+    target_ulong ptcr =3D args[0];
+
+    if (!spapr_get_cap(spapr, SPAPR_CAP_NESTED_KVM_HV)) {
+        return H_FUNCTION;
+    }
+
+    if ((ptcr & PRTS_MASK) + 12 - 4 > 12) {
+        return H_PARAMETER;
+    }
+
+    spapr->nested_ptcr =3D ptcr; /* Save new partition table */
+
+    return H_SUCCESS;
+}
+
+static target_ulong h_tlb_invalidate(PowerPCCPU *cpu,
+                                     SpaprMachineState *spapr,
+                                     target_ulong opcode,
+                                     target_ulong *args)
+{
+    /*
+     * The spapr virtual hypervisor nested HV implementation retains no =
L2
+     * translation state except for TLB. And the TLB is always invalidat=
ed
+     * across L1<->L2 transitions, so nothing is required here.
+     */
+
+    return H_SUCCESS;
+}
+
+static target_ulong h_copy_tofrom_guest(PowerPCCPU *cpu,
+                                        SpaprMachineState *spapr,
+                                        target_ulong opcode,
+                                        target_ulong *args)
+{
+    /*
+     * This HCALL is not required, L1 KVM will take a slow path and walk=
 the
+     * page tables manually to do the data copy.
+     */
+    return H_FUNCTION;
+}
+
+/*
+ * When this handler returns, the environment is switched to the L2 gues=
t
+ * and TCG begins running that. spapr_exit_nested() performs the switch =
from
+ * L2 back to L1 and returns from the H_ENTER_NESTED hcall.
+ */
+static target_ulong h_enter_nested(PowerPCCPU *cpu,
+                                   SpaprMachineState *spapr,
+                                   target_ulong opcode,
+                                   target_ulong *args)
+{
+    PowerPCCPUClass *pcc =3D POWERPC_CPU_GET_CLASS(cpu);
+    CPUState *cs =3D CPU(cpu);
+    CPUPPCState *env =3D &cpu->env;
+    SpaprCpuState *spapr_cpu =3D spapr_cpu_state(cpu);
+    target_ulong hv_ptr =3D args[0];
+    target_ulong regs_ptr =3D args[1];
+    target_ulong hdec, now =3D cpu_ppc_load_tbl(env);
+    target_ulong lpcr, lpcr_mask;
+    struct kvmppc_hv_guest_state *hvstate;
+    struct kvmppc_hv_guest_state hv_state;
+    struct kvmppc_pt_regs *regs;
+    hwaddr len;
+    uint64_t cr;
+    int i;
+
+    if (spapr->nested_ptcr =3D=3D 0) {
+        return H_NOT_AVAILABLE;
+    }
+
+    len =3D sizeof(*hvstate);
+    hvstate =3D address_space_map(CPU(cpu)->as, hv_ptr, &len, false,
+                                MEMTXATTRS_UNSPECIFIED);
+    if (len !=3D sizeof(*hvstate)) {
+        address_space_unmap(CPU(cpu)->as, hvstate, len, 0, false);
+        return H_PARAMETER;
+    }
+
+    memcpy(&hv_state, hvstate, len);
+
+    address_space_unmap(CPU(cpu)->as, hvstate, len, len, false);
+
+    /*
+     * We accept versions 1 and 2. Version 2 fields are unused because T=
CG
+     * does not implement DAWR*.
+     */
+    if (hv_state.version > HV_GUEST_STATE_VERSION) {
+        return H_PARAMETER;
+    }
+
+    spapr_cpu->nested_host_state =3D g_try_malloc(sizeof(CPUPPCState));
+    if (!spapr_cpu->nested_host_state) {
+        return H_NO_MEM;
+    }
+
+    memcpy(spapr_cpu->nested_host_state, env, sizeof(CPUPPCState));
+
+    len =3D sizeof(*regs);
+    regs =3D address_space_map(CPU(cpu)->as, regs_ptr, &len, false,
+                                MEMTXATTRS_UNSPECIFIED);
+    if (!regs || len !=3D sizeof(*regs)) {
+        address_space_unmap(CPU(cpu)->as, regs, len, 0, false);
+        g_free(spapr_cpu->nested_host_state);
+        return H_P2;
+    }
+
+    len =3D sizeof(env->gpr);
+    assert(len =3D=3D sizeof(regs->gpr));
+    memcpy(env->gpr, regs->gpr, len);
+
+    env->lr =3D regs->link;
+    env->ctr =3D regs->ctr;
+    cpu_write_xer(env, regs->xer);
+
+    cr =3D regs->ccr;
+    for (i =3D 7; i >=3D 0; i--) {
+        env->crf[i] =3D cr & 15;
+        cr >>=3D 4;
+    }
+
+    env->msr =3D regs->msr;
+    env->nip =3D regs->nip;
+
+    address_space_unmap(CPU(cpu)->as, regs, len, len, false);
+
+    env->cfar =3D hv_state.cfar;
+
+    assert(env->spr[SPR_LPIDR] =3D=3D 0);
+    env->spr[SPR_LPIDR] =3D hv_state.lpid;
+
+    lpcr_mask =3D LPCR_DPFD | LPCR_ILE | LPCR_AIL | LPCR_LD | LPCR_MER;
+    lpcr =3D (env->spr[SPR_LPCR] & ~lpcr_mask) | (hv_state.lpcr & lpcr_m=
ask);
+    lpcr |=3D LPCR_HR | LPCR_UPRT | LPCR_GTSE | LPCR_HVICE | LPCR_HDICE;
+    lpcr &=3D ~LPCR_LPES0;
+    env->spr[SPR_LPCR] =3D lpcr & pcc->lpcr_mask;
+
+    env->spr[SPR_PCR] =3D hv_state.pcr;
+    /* hv_state.amor is not used */
+    env->spr[SPR_DPDES] =3D hv_state.dpdes;
+    env->spr[SPR_HFSCR] =3D hv_state.hfscr;
+    hdec =3D hv_state.hdec_expiry - now;
+    spapr_cpu->nested_tb_offset =3D hv_state.tb_offset;
+    /* TCG does not implement DAWR*, CIABR, PURR, SPURR, IC, VTB, HEIR S=
PRs*/
+    env->spr[SPR_SRR0] =3D hv_state.srr0;
+    env->spr[SPR_SRR1] =3D hv_state.srr1;
+    env->spr[SPR_SPRG0] =3D hv_state.sprg[0];
+    env->spr[SPR_SPRG1] =3D hv_state.sprg[1];
+    env->spr[SPR_SPRG2] =3D hv_state.sprg[2];
+    env->spr[SPR_SPRG3] =3D hv_state.sprg[3];
+    env->spr[SPR_BOOKS_PID] =3D hv_state.pidr;
+    env->spr[SPR_PPR] =3D hv_state.ppr;
+
+    cpu_ppc_hdecr_init(env);
+    cpu_ppc_store_hdecr(env, hdec);
+
+    /*
+     * The hv_state.vcpu_token is not needed. It is used by the KVM
+     * implementation to remember which L2 vCPU last ran on which physic=
al
+     * CPU so as to invalidate process scope translations if it is moved
+     * between physical CPUs. For now TLBs are always flushed on L1<->L2
+     * transitions so this is not a problem.
+     *
+     * Could validate that the same vcpu_token does not attempt to run o=
n
+     * different L1 vCPUs at the same time, but that would be a L1 KVM b=
ug
+     * and it's not obviously worth a new data structure to do it.
+     */
+
+    env->tb_env->tb_offset +=3D spapr_cpu->nested_tb_offset;
+    spapr_cpu->in_nested =3D true;
+
+    hreg_compute_hflags(env);
+    tlb_flush(cs);
+    env->reserve_addr =3D -1; /* Reset the reservation */
+
+    /*
+     * The spapr hcall helper sets env->gpr[3] to the return value, but =
at
+     * this point the L1 is not returning from the hcall but rather we
+     * start running the L2, so r3 must not be clobbered, so return env-=
>gpr[3]
+     * to leave it unchanged.
+     */
+    return env->gpr[3];
+}
+
+void spapr_exit_nested(PowerPCCPU *cpu, int excp)
+{
+    CPUState *cs =3D CPU(cpu);
+    CPUPPCState *env =3D &cpu->env;
+    SpaprCpuState *spapr_cpu =3D spapr_cpu_state(cpu);
+    target_ulong r3_return =3D env->excp_vectors[excp]; /* hcall return =
value */
+    target_ulong hv_ptr =3D spapr_cpu->nested_host_state->gpr[4];
+    target_ulong regs_ptr =3D spapr_cpu->nested_host_state->gpr[5];
+    struct kvmppc_hv_guest_state *hvstate;
+    struct kvmppc_pt_regs *regs;
+    hwaddr len;
+    uint64_t cr;
+    int i;
+
+    assert(spapr_cpu->in_nested);
+
+    cpu_ppc_hdecr_exit(env);
+
+    len =3D sizeof(*hvstate);
+    hvstate =3D address_space_map(CPU(cpu)->as, hv_ptr, &len, true,
+                                MEMTXATTRS_UNSPECIFIED);
+    if (len !=3D sizeof(*hvstate)) {
+        address_space_unmap(CPU(cpu)->as, hvstate, len, 0, true);
+        r3_return =3D H_PARAMETER;
+        goto out_restore_l1;
+    }
+
+    hvstate->cfar =3D env->cfar;
+    hvstate->lpcr =3D env->spr[SPR_LPCR];
+    hvstate->pcr =3D env->spr[SPR_PCR];
+    hvstate->dpdes =3D env->spr[SPR_DPDES];
+    hvstate->hfscr =3D env->spr[SPR_HFSCR];
+
+    if (excp =3D=3D POWERPC_EXCP_HDSI) {
+        hvstate->hdar =3D env->spr[SPR_HDAR];
+        hvstate->hdsisr =3D env->spr[SPR_HDSISR];
+        hvstate->asdr =3D env->spr[SPR_ASDR];
+    } else if (excp =3D=3D POWERPC_EXCP_HISI) {
+        hvstate->asdr =3D env->spr[SPR_ASDR];
+    }
+
+    /* HEIR should be implemented for HV mode and saved here. */
+    hvstate->srr0 =3D env->spr[SPR_SRR0];
+    hvstate->srr1 =3D env->spr[SPR_SRR1];
+    hvstate->sprg[0] =3D env->spr[SPR_SPRG0];
+    hvstate->sprg[1] =3D env->spr[SPR_SPRG1];
+    hvstate->sprg[2] =3D env->spr[SPR_SPRG2];
+    hvstate->sprg[3] =3D env->spr[SPR_SPRG3];
+    hvstate->pidr =3D env->spr[SPR_BOOKS_PID];
+    hvstate->ppr =3D env->spr[SPR_PPR];
+
+    /* Is it okay to specify write length larger than actual data writte=
n? */
+    address_space_unmap(CPU(cpu)->as, hvstate, len, len, true);
+
+    len =3D sizeof(*regs);
+    regs =3D address_space_map(CPU(cpu)->as, regs_ptr, &len, true,
+                                MEMTXATTRS_UNSPECIFIED);
+    if (!regs || len !=3D sizeof(*regs)) {
+        address_space_unmap(CPU(cpu)->as, regs, len, 0, true);
+        r3_return =3D H_P2;
+        goto out_restore_l1;
+    }
+
+    len =3D sizeof(env->gpr);
+    assert(len =3D=3D sizeof(regs->gpr));
+    memcpy(regs->gpr, env->gpr, len);
+
+    regs->link =3D env->lr;
+    regs->ctr =3D env->ctr;
+    regs->xer =3D cpu_read_xer(env);
+
+    cr =3D 0;
+    for (i =3D 0; i < 8; i++) {
+        cr |=3D (env->crf[i] & 15) << (4 * (7 - i));
+    }
+    regs->ccr =3D cr;
+
+    if (excp =3D=3D POWERPC_EXCP_MCHECK ||
+        excp =3D=3D POWERPC_EXCP_RESET ||
+        excp =3D=3D POWERPC_EXCP_SYSCALL) {
+        regs->nip =3D env->spr[SPR_SRR0];
+        regs->msr =3D env->spr[SPR_SRR1] & env->msr_mask;
+    } else {
+        regs->nip =3D env->spr[SPR_HSRR0];
+        regs->msr =3D env->spr[SPR_HSRR1] & env->msr_mask;
+    }
+
+    /* Is it okay to specify write length larger than actual data writte=
n? */
+    address_space_unmap(CPU(cpu)->as, regs, len, len, true);
+
+out_restore_l1:
+    memcpy(env->gpr, spapr_cpu->nested_host_state->gpr, sizeof(env->gpr)=
);
+    env->lr =3D spapr_cpu->nested_host_state->lr;
+    env->ctr =3D spapr_cpu->nested_host_state->ctr;
+    memcpy(env->crf, spapr_cpu->nested_host_state->crf, sizeof(env->crf)=
);
+    env->cfar =3D spapr_cpu->nested_host_state->cfar;
+    env->xer =3D spapr_cpu->nested_host_state->xer;
+    env->so =3D spapr_cpu->nested_host_state->so;
+    env->ov =3D spapr_cpu->nested_host_state->ov;
+    env->ov32 =3D spapr_cpu->nested_host_state->ov32;
+    env->ca32 =3D spapr_cpu->nested_host_state->ca32;
+    env->msr =3D spapr_cpu->nested_host_state->msr;
+    env->nip =3D spapr_cpu->nested_host_state->nip;
+
+    assert(env->spr[SPR_LPIDR] !=3D 0);
+    env->spr[SPR_LPCR] =3D spapr_cpu->nested_host_state->spr[SPR_LPCR];
+    env->spr[SPR_LPIDR] =3D spapr_cpu->nested_host_state->spr[SPR_LPIDR]=
;
+    env->spr[SPR_PCR] =3D spapr_cpu->nested_host_state->spr[SPR_PCR];
+    env->spr[SPR_DPDES] =3D 0;
+    env->spr[SPR_HFSCR] =3D spapr_cpu->nested_host_state->spr[SPR_HFSCR]=
;
+    env->spr[SPR_SRR0] =3D spapr_cpu->nested_host_state->spr[SPR_SRR0];
+    env->spr[SPR_SRR1] =3D spapr_cpu->nested_host_state->spr[SPR_SRR1];
+    env->spr[SPR_SPRG0] =3D spapr_cpu->nested_host_state->spr[SPR_SPRG0]=
;
+    env->spr[SPR_SPRG1] =3D spapr_cpu->nested_host_state->spr[SPR_SPRG1]=
;
+    env->spr[SPR_SPRG2] =3D spapr_cpu->nested_host_state->spr[SPR_SPRG2]=
;
+    env->spr[SPR_SPRG3] =3D spapr_cpu->nested_host_state->spr[SPR_SPRG3]=
;
+    env->spr[SPR_BOOKS_PID] =3D spapr_cpu->nested_host_state->spr[SPR_BO=
OKS_PID];
+    env->spr[SPR_PPR] =3D spapr_cpu->nested_host_state->spr[SPR_PPR];
+
+    /*
+     * Return the interrupt vector address from H_ENTER_NESTED to the L1
+     * (or error code).
+     */
+    env->gpr[3] =3D r3_return;
+
+    env->tb_env->tb_offset -=3D spapr_cpu->nested_tb_offset;
+    spapr_cpu->in_nested =3D false;
+
+    hreg_compute_hflags(env);
+    tlb_flush(cs);
+    env->reserve_addr =3D -1; /* Reset the reservation */
+
+    g_free(spapr_cpu->nested_host_state);
+    spapr_cpu->nested_host_state =3D NULL;
+}
+
 static void hypercall_register_types(void)
 {
     hypercall_register_softmmu();
@@ -1552,6 +1880,11 @@ static void hypercall_register_types(void)
     spapr_register_hypercall(KVMPPC_H_CAS, h_client_architecture_support=
);
=20
     spapr_register_hypercall(KVMPPC_H_UPDATE_DT, h_update_dt);
+
+    spapr_register_hypercall(KVMPPC_H_SET_PARTITION_TABLE, h_set_ptbl);
+    spapr_register_hypercall(KVMPPC_H_ENTER_NESTED, h_enter_nested);
+    spapr_register_hypercall(KVMPPC_H_TLB_INVALIDATE, h_tlb_invalidate);
+    spapr_register_hypercall(KVMPPC_H_COPY_TOFROM_GUEST, h_copy_tofrom_g=
uest);
 }
=20
 type_init(hypercall_register_types)
--=20
2.34.1


