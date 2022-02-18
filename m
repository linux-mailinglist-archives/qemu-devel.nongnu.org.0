Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 375134BB7ED
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Feb 2022 12:18:50 +0100 (CET)
Received: from localhost ([::1]:44644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nL1Hl-0007x2-BJ
	for lists+qemu-devel@lfdr.de; Fri, 18 Feb 2022 06:18:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nL0fV-00012o-Tq; Fri, 18 Feb 2022 05:39:21 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:50524)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nL0fN-0005gE-3R; Fri, 18 Feb 2022 05:39:17 -0500
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21I9UWok020668; 
 Fri, 18 Feb 2022 10:38:42 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ea8vvsc56-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Feb 2022 10:38:42 +0000
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21IAGvpc032115;
 Fri, 18 Feb 2022 10:38:42 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ea8vvsc4b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Feb 2022 10:38:42 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21IAbrx2011029;
 Fri, 18 Feb 2022 10:38:40 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma06ams.nl.ibm.com with ESMTP id 3e645khcdv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Feb 2022 10:38:39 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21IAcbgt44826988
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 18 Feb 2022 10:38:37 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BDA9852050;
 Fri, 18 Feb 2022 10:38:37 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with SMTP id 7B26F5204F;
 Fri, 18 Feb 2022 10:38:37 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.87.94])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id CCD54220294;
 Fri, 18 Feb 2022 11:38:36 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 11/39] target/ppc: Introduce a vhyp framework for nested HV
 support
Date: Fri, 18 Feb 2022 11:37:59 +0100
Message-Id: <20220218103827.682032-12-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220218103827.682032-1-clg@kaod.org>
References: <20220218103827.682032-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: JB5M2Vs_uSWCWJLxi54V5sHmI1JLVmPw
X-Proofpoint-GUID: Q-VAW5ugOJY85b38wWxNdc62N21PUCBT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-18_04,2022-02-18_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 malwarescore=0 clxscore=1034 priorityscore=1501 mlxlogscore=999
 suspectscore=0 lowpriorityscore=0 adultscore=0 mlxscore=0 spamscore=0
 phishscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

Introduce virtual hypervisor methods that can support a "Nested KVM HV"
implementation using the bare metal 2-level radix MMU, and using HV
exceptions to return from H_ENTER_NESTED (rather than cause interrupts).

HV exceptions can now be raised in the TCG spapr machine when running a
nested KVM HV guest. The main ones are the lev=3D=3D1 syscall, the hdecr,
hdsi and hisi, hv fu, and hv emu, and h_virt external interrupts.

HV exceptions are intercepted in the exception handler code and instead
of causing interrupts in the guest and switching the machine to HV mode,
they go to the vhyp where it may exit the H_ENTER_NESTED hcall with the
interrupt vector numer as return value as required by the hcall API.

Address translation is provided by the 2-level page table walker that is
implemented for the bare metal radix MMU. The partition scope page table
is pointed to the L1's partition scope by the get_pate vhc method.

Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
Message-Id: <20220216102545.1808018-9-npiggin@gmail.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/cpu.h         |  7 +++++
 hw/ppc/pegasos2.c        |  6 ++++
 hw/ppc/spapr.c           |  6 ++++
 target/ppc/excp_helper.c | 64 +++++++++++++++++++++++++++++++++-------
 target/ppc/mmu-radix64.c | 11 +++++--
 5 files changed, 81 insertions(+), 13 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index c79ae74f10de..2baa750729fd 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -1311,6 +1311,8 @@ PowerPCCPUClass *ppc_cpu_get_family_class(PowerPCCP=
UClass *pcc);
 #ifndef CONFIG_USER_ONLY
 struct PPCVirtualHypervisorClass {
     InterfaceClass parent;
+    bool (*cpu_in_nested)(PowerPCCPU *cpu);
+    void (*deliver_hv_excp)(PowerPCCPU *cpu, int excp);
     void (*hypercall)(PPCVirtualHypervisor *vhyp, PowerPCCPU *cpu);
     hwaddr (*hpt_mask)(PPCVirtualHypervisor *vhyp);
     const ppc_hash_pte64_t *(*map_hptes)(PPCVirtualHypervisor *vhyp,
@@ -1330,6 +1332,11 @@ struct PPCVirtualHypervisorClass {
 #define TYPE_PPC_VIRTUAL_HYPERVISOR "ppc-virtual-hypervisor"
 DECLARE_OBJ_CHECKERS(PPCVirtualHypervisor, PPCVirtualHypervisorClass,
                      PPC_VIRTUAL_HYPERVISOR, TYPE_PPC_VIRTUAL_HYPERVISOR=
)
+
+static inline bool vhyp_cpu_in_nested(PowerPCCPU *cpu)
+{
+    return PPC_VIRTUAL_HYPERVISOR_GET_CLASS(cpu->vhyp)->cpu_in_nested(cp=
u);
+}
 #endif /* CONFIG_USER_ONLY */
=20
 void ppc_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
diff --git a/hw/ppc/pegasos2.c b/hw/ppc/pegasos2.c
index 298e6b93e2dd..d45008ac7131 100644
--- a/hw/ppc/pegasos2.c
+++ b/hw/ppc/pegasos2.c
@@ -449,6 +449,11 @@ static target_ulong pegasos2_rtas(PowerPCCPU *cpu, P=
egasos2MachineState *pm,
     }
 }
=20
+static bool pegasos2_cpu_in_nested(PowerPCCPU *cpu)
+{
+    return false;
+}
+
 static void pegasos2_hypercall(PPCVirtualHypervisor *vhyp, PowerPCCPU *c=
pu)
 {
     Pegasos2MachineState *pm =3D PEGASOS2_MACHINE(vhyp);
@@ -504,6 +509,7 @@ static void pegasos2_machine_class_init(ObjectClass *=
oc, void *data)
     mc->default_ram_id =3D "pegasos2.ram";
     mc->default_ram_size =3D 512 * MiB;
=20
+    vhc->cpu_in_nested =3D pegasos2_cpu_in_nested;
     vhc->hypercall =3D pegasos2_hypercall;
     vhc->cpu_exec_enter =3D vhyp_nop;
     vhc->cpu_exec_exit =3D vhyp_nop;
diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 4fdff12a9625..51ba8615f281 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -4472,6 +4472,11 @@ PowerPCCPU *spapr_find_cpu(int vcpu_id)
     return NULL;
 }
=20
+static bool spapr_cpu_in_nested(PowerPCCPU *cpu)
+{
+    return false;
+}
+
 static void spapr_cpu_exec_enter(PPCVirtualHypervisor *vhyp, PowerPCCPU =
*cpu)
 {
     SpaprCpuState *spapr_cpu =3D spapr_cpu_state(cpu);
@@ -4580,6 +4585,7 @@ static void spapr_machine_class_init(ObjectClass *o=
c, void *data)
     fwc->get_dev_path =3D spapr_get_fw_dev_path;
     nc->nmi_monitor_handler =3D spapr_nmi;
     smc->phb_placement =3D spapr_phb_placement;
+    vhc->cpu_in_nested =3D spapr_cpu_in_nested;
     vhc->hypercall =3D emulate_spapr_hypercall;
     vhc->hpt_mask =3D spapr_hpt_mask;
     vhc->map_hptes =3D spapr_map_hptes;
diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index 7499fa187f6f..f44b9da2a53c 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -1280,6 +1280,18 @@ static void powerpc_excp_booke(PowerPCCPU *cpu, in=
t excp)
     powerpc_set_excp_state(cpu, vector, new_msr);
 }
=20
+/*
+ * When running a nested HV guest under vhyp, external interrupts are
+ * delivered as HVIRT.
+ */
+static bool books_vhyp_promotes_external_to_hvirt(PowerPCCPU *cpu)
+{
+    if (cpu->vhyp) {
+        return vhyp_cpu_in_nested(cpu);
+    }
+    return false;
+}
+
 #ifdef TARGET_PPC64
 /*
  * When running under vhyp, hcalls are always intercepted and sent to th=
e
@@ -1288,7 +1300,21 @@ static void powerpc_excp_booke(PowerPCCPU *cpu, in=
t excp)
 static bool books_vhyp_handles_hcall(PowerPCCPU *cpu)
 {
     if (cpu->vhyp) {
-        return true;
+        return !vhyp_cpu_in_nested(cpu);
+    }
+    return false;
+}
+
+/*
+ * When running a nested KVM HV guest under vhyp, HV exceptions are not
+ * delivered to the guest (because there is no concept of HV support), b=
ut
+ * rather they are sent tothe vhyp to exit from the L2 back to the L1 an=
d
+ * return from the H_ENTER_NESTED hypercall.
+ */
+static bool books_vhyp_handles_hv_excp(PowerPCCPU *cpu)
+{
+    if (cpu->vhyp) {
+        return vhyp_cpu_in_nested(cpu);
     }
     return false;
 }
@@ -1541,12 +1567,6 @@ static void powerpc_excp_books(PowerPCCPU *cpu, in=
t excp)
         break;
     }
=20
-    /* Sanity check */
-    if (!(env->msr_mask & MSR_HVB) && srr0 =3D=3D SPR_HSRR0) {
-        cpu_abort(cs, "Trying to deliver HV exception (HSRR) %d with "
-                  "no HV support\n", excp);
-    }
-
     /*
      * Sort out endianness of interrupt, this differs depending on the
      * CPU, the HV mode, etc...
@@ -1565,10 +1585,26 @@ static void powerpc_excp_books(PowerPCCPU *cpu, i=
nt excp)
         env->spr[srr1] =3D msr;
     }
=20
-    /* This can update new_msr and vector if AIL applies */
-    ppc_excp_apply_ail(cpu, excp, msr, &new_msr, &vector);
+    if ((new_msr & MSR_HVB) && books_vhyp_handles_hv_excp(cpu)) {
+        PPCVirtualHypervisorClass *vhc =3D
+            PPC_VIRTUAL_HYPERVISOR_GET_CLASS(cpu->vhyp);
+        /* Deliver interrupt to L1 by returning from the H_ENTER_NESTED =
call */
+        vhc->deliver_hv_excp(cpu, excp);
=20
-    powerpc_set_excp_state(cpu, vector, new_msr);
+        powerpc_reset_excp_state(cpu);
+
+    } else {
+        /* Sanity check */
+        if (!(env->msr_mask & MSR_HVB) && srr0 =3D=3D SPR_HSRR0) {
+            cpu_abort(cs, "Trying to deliver HV exception (HSRR) %d with=
 "
+                      "no HV support\n", excp);
+        }
+
+        /* This can update new_msr and vector if AIL applies */
+        ppc_excp_apply_ail(cpu, excp, msr, &new_msr, &vector);
+
+        powerpc_set_excp_state(cpu, vector, new_msr);
+    }
 }
 #else
 static inline void powerpc_excp_books(PowerPCCPU *cpu, int excp)
@@ -1688,7 +1724,11 @@ static void ppc_hw_interrupt(CPUPPCState *env)
         /* HEIC blocks delivery to the hypervisor */
         if ((async_deliver && !(heic && msr_hv && !msr_pr)) ||
             (env->has_hv_mode && msr_hv =3D=3D 0 && !lpes0)) {
-            powerpc_excp(cpu, POWERPC_EXCP_EXTERNAL);
+            if (books_vhyp_promotes_external_to_hvirt(cpu)) {
+                powerpc_excp(cpu, POWERPC_EXCP_HVIRT);
+            } else {
+                powerpc_excp(cpu, POWERPC_EXCP_EXTERNAL);
+            }
             return;
         }
     }
@@ -1798,6 +1838,8 @@ void ppc_cpu_do_fwnmi_machine_check(CPUState *cs, t=
arget_ulong vector)
         msr |=3D (1ULL << MSR_LE);
     }
=20
+    /* Anything for nested required here? MSR[HV] bit? */
+
     powerpc_set_excp_state(cpu, vector, msr);
 }
=20
diff --git a/target/ppc/mmu-radix64.c b/target/ppc/mmu-radix64.c
index 9c557c6de97a..67c38f065ba2 100644
--- a/target/ppc/mmu-radix64.c
+++ b/target/ppc/mmu-radix64.c
@@ -355,12 +355,19 @@ static int ppc_radix64_partition_scoped_xlate(Power=
PCCPU *cpu,
 }
=20
 /*
- * The spapr vhc has a flat partition scope provided by qemu memory.
+ * The spapr vhc has a flat partition scope provided by qemu memory when
+ * not nested.
+ *
+ * When running a nested guest, the addressing is 2-level radix on top o=
f the
+ * vhc memory, so it works practically identically to the bare metal 2-l=
evel
+ * radix. So that code is selected directly. A cleaner and more flexible=
 nested
+ * hypervisor implementation would allow the vhc to provide a ->nested_x=
late()
+ * function but that is not required for the moment.
  */
 static bool vhyp_flat_addressing(PowerPCCPU *cpu)
 {
     if (cpu->vhyp) {
-        return true;
+        return !vhyp_cpu_in_nested(cpu);
     }
     return false;
 }
--=20
2.34.1


