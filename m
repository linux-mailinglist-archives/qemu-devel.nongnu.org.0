Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E31F47B3EE
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 20:49:58 +0100 (CET)
Received: from localhost ([::1]:42376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzOfV-0007Ui-Gk
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 14:49:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1mzNGC-00031E-Rp; Mon, 20 Dec 2021 13:19:45 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:59464)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1mzNGA-0006nc-GY; Mon, 20 Dec 2021 13:19:44 -0500
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BKGBn6X012997; 
 Mon, 20 Dec 2021 18:19:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=JXdwpZss8Fzk+HcoOa1M7naY1vZ3MWYfHVtGE/uBdwc=;
 b=RmfDZM4xfozhMF8CYnVpw+L5GTP5+zkRXuB1UeoBwucVeTRyZh6u+VtQ8x/j91PK6KNg
 yhNyEej3KyfTO/XMosRTnfHPB9ol31rSb8zNqB9jPqELVKk92uPd9QyqD7KljWa2pLAR
 j/qQQW6zI+Enx/tmawBXKUeHm96wr2b5fDPkFW3XnnMk7bd3PipjGQWc1oQcxtk4Cyi+
 YicPVCUT/0q7M9Peme0s3pY/AI+FLHUt9XMCHjaRTjxdg2/9dvaA350YJXE2TiexQwZ8
 lf9XmaswExIDoY+m4byiXsEnrRpTE1tOXGDs6Qd/uXkjmsLP5x1xXStzWyo4En4vzSf4 VQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3d1s4wt311-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Dec 2021 18:19:31 +0000
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1BKIIYLm021136;
 Mon, 20 Dec 2021 18:19:30 GMT
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3d1s4wt30r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Dec 2021 18:19:30 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BKIEV0j022789;
 Mon, 20 Dec 2021 18:19:29 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma04dal.us.ibm.com with ESMTP id 3d179aa5pn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Dec 2021 18:19:29 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1BKIJSKR23265668
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 20 Dec 2021 18:19:28 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 80505C6059;
 Mon, 20 Dec 2021 18:19:28 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0A610C6065;
 Mon, 20 Dec 2021 18:19:27 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.60.53])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 20 Dec 2021 18:19:26 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [RFC v2 08/12] target/ppc: Remove unimplemented interrupt code
Date: Mon, 20 Dec 2021 15:18:59 -0300
Message-Id: <20211220181903.3456898-9-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211220181903.3456898-1-farosas@linux.ibm.com>
References: <20211220181903.3456898-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: IVCqGZ41Hu7eoRbBJ9sOuvqiyh99h5Xw
X-Proofpoint-GUID: Q13qKTTHJrsWZ4CpInGREjMF2PHABNub
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-20_08,2021-12-20_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015
 mlxscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 mlxlogscore=999 spamscore=0 impostorscore=0 suspectscore=0 phishscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112200101
Received-SPF: pass client-ip=148.163.156.1; envelope-from=farosas@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: danielhb413@gmail.com, qemu-ppc@nongnu.org, clg@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that PPCInterrupt holds the interrupt name, we can remove all
functions that just emitted the "unimplemented" message and leave that
to the error handling at powerpc_excp():

  if (!intr->fn) {
    cpu_abort(cs, "%s exception is not implemented yet !\n", intr->name);
  }

The user visible change here is that the error message shown when QEMU
tries to dispatch an interrupt that has no implementation will change
from a custom one depending on the exception to a standard one (above)
with the interrupt name as defined in interrupts.c.

(I added ITLBE/DTLBE which were not being handled)

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
---
 target/ppc/interrupts.c | 205 ++++------------------------------------
 target/ppc/ppc_intr.h   |  17 ----
 2 files changed, 19 insertions(+), 203 deletions(-)

diff --git a/target/ppc/interrupts.c b/target/ppc/interrupts.c
index 2dd3815167..1e4fb2d6db 100644
--- a/target/ppc/interrupts.c
+++ b/target/ppc/interrupts.c
@@ -334,33 +334,6 @@ void ppc_intr_spe_unavailable(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore)
     env->spr[SPR_BOOKE_ESR] = ESR_SPV;
 }
 
-void ppc_intr_embedded_fp_data(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore)
-{
-    CPUPPCState *env = &cpu->env;
-
-    /* XXX: TODO */
-    cpu_abort(CPU(cpu), "Embedded floating point data exception "
-              "is not implemented yet !\n");
-    env->spr[SPR_BOOKE_ESR] = ESR_SPV;
-}
-
-void ppc_intr_embedded_fp_round(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore)
-{
-    CPUPPCState *env = &cpu->env;
-
-    /* XXX: TODO */
-    cpu_abort(CPU(cpu), "Embedded floating point round exception "
-              "is not implemented yet !\n");
-    env->spr[SPR_BOOKE_ESR] = ESR_SPV;
-}
-
-void ppc_intr_embedded_perf_monitor(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore)
-{
-    /* XXX: TODO */
-    cpu_abort(CPU(cpu),
-              "Performance counter exception is not implemented yet !\n");
-}
-
 void ppc_intr_embedded_doorbell_crit(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore)
 {
     regs->sprn_srr0 = SPR_BOOKE_CSRR0;
@@ -499,24 +472,6 @@ void ppc_intr_programmable_timer(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignor
     trace_ppc_excp_print("PIT");
 }
 
-void ppc_intr_io_error(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore)
-{
-    /* XXX: TODO */
-    cpu_abort(CPU(cpu), "601 IO error exception is not implemented yet !\n");
-}
-
-void ppc_intr_run_mode(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore)
-{
-    /* XXX: TODO */
-    cpu_abort(CPU(cpu), "601 run mode exception is not implemented yet !\n");
-}
-
-void ppc_intr_emulation(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore)
-{
-    /* XXX: TODO */
-    cpu_abort(CPU(cpu), "602 emulation trap exception is not implemented yet !\n");
-}
-
 void ppc_intr_tlb_miss(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore)
 {
     CPUPPCState *env = &cpu->env;
@@ -575,79 +530,6 @@ void ppc_intr_tlb_miss(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore)
     }
 }
 
-void ppc_intr_fpa(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore)
-{
-    /* XXX: TODO */
-    cpu_abort(CPU(cpu), "Floating point assist exception "
-              "is not implemented yet !\n");
-}
-
-void ppc_intr_dabr(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore)
-{
-    /* XXX: TODO */
-    cpu_abort(CPU(cpu), "DABR exception is not implemented yet !\n");
-}
-
-void ppc_intr_iabr(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore)
-{
-    /* XXX: TODO */
-    cpu_abort(CPU(cpu), "IABR exception is not implemented yet !\n");
-}
-
-void ppc_intr_smi(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore)
-{
-    /* XXX: TODO */
-    cpu_abort(CPU(cpu), "SMI exception is not implemented yet !\n");
-}
-
-void ppc_intr_therm(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore)
-{
-    /* XXX: TODO */
-    cpu_abort(CPU(cpu), "Thermal management exception "
-              "is not implemented yet !\n");
-}
-
-void ppc_intr_perfm(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore)
-{
-    /* XXX: TODO */
-    cpu_abort(CPU(cpu),
-              "Performance counter exception is not implemented yet !\n");
-}
-
-void ppc_intr_vpua(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore)
-{
-    /* XXX: TODO */
-    cpu_abort(CPU(cpu), "VPU assist exception is not implemented yet !\n");
-}
-
-void ppc_intr_softp(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore)
-{
-    /* XXX: TODO */
-    cpu_abort(CPU(cpu),
-              "970 soft-patch exception is not implemented yet !\n");
-}
-
-void ppc_intr_maint(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore)
-{
-    /* XXX: TODO */
-    cpu_abort(CPU(cpu),
-              "970 maintenance exception is not implemented yet !\n");
-}
-
-void ppc_intr_mextbr(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore)
-{
-    /* XXX: TODO */
-    cpu_abort(CPU(cpu), "Maskable external exception "
-              "is not implemented yet !\n");
-}
-
-void ppc_intr_nmextbr(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore)
-{
-    /* XXX: TODO */
-    cpu_abort(CPU(cpu), "Non maskable external exception "
-              "is not implemented yet !\n");
-}
-
 PPCInterrupt interrupts[POWERPC_EXCP_NB] = {
     [POWERPC_EXCP_ALIGN] = {
         "Alignment", ppc_intr_alignment
@@ -657,10 +539,6 @@ PPCInterrupt interrupts[POWERPC_EXCP_NB] = {
         "Critical input", ppc_intr_critical
     },
 
-    [POWERPC_EXCP_DABR] = {
-        "Data address breakpoint", ppc_intr_dabr
-    },
-
     [POWERPC_EXCP_DEBUG] = {
         "Debug", ppc_intr_debug
     },
@@ -681,22 +559,6 @@ PPCInterrupt interrupts[POWERPC_EXCP_NB] = {
         "Data store TLB error", ppc_intr_tlb_miss
     },
 
-    [POWERPC_EXCP_EFPDI] = {
-        "Embedded floating-point data", ppc_intr_embedded_fp_data
-    },
-
-    [POWERPC_EXCP_EFPRI] = {
-        "Embedded floating-point round", ppc_intr_embedded_fp_round
-    },
-
-    [POWERPC_EXCP_EMUL] = {
-        "Emulation trap", ppc_intr_emulation
-    },
-
-    [POWERPC_EXCP_EPERFM] = {
-        "Embedded perf. monitor", ppc_intr_embedded_perf_monitor
-    },
-
     [POWERPC_EXCP_EXTERNAL] = {
         "External", ppc_intr_external
     },
@@ -705,10 +567,6 @@ PPCInterrupt interrupts[POWERPC_EXCP_NB] = {
         "Fixed-interval timer", ppc_intr_fit
     },
 
-    [POWERPC_EXCP_FPA] = {
-        "Floating-point assist", ppc_intr_fpa
-    },
-
     [POWERPC_EXCP_FU] = {
         "Facility unavailable", ppc_intr_facility_unavail
     },
@@ -745,42 +603,18 @@ PPCInterrupt interrupts[POWERPC_EXCP_NB] = {
         "Hypervisor facility unavailable" , ppc_intr_hv_facility_unavail
     },
 
-    [POWERPC_EXCP_IABR] = {
-        "Insn address breakpoint", ppc_intr_iabr
-    },
-
     [POWERPC_EXCP_IFTLB] = {
         "Insn fetch TLB error", ppc_intr_tlb_miss
     },
 
-    [POWERPC_EXCP_IO] = {
-        "IO error", ppc_intr_io_error
-    },
-
     [POWERPC_EXCP_ISI] = {
         "Instruction storage", ppc_intr_insn_storage
     },
 
-    [POWERPC_EXCP_MAINT] = {
-        "Maintenance", ppc_intr_maint
-    },
-
     [POWERPC_EXCP_MCHECK] = {
         "Machine check", ppc_intr_machine_check
     },
 
-    [POWERPC_EXCP_MEXTBR] = {
-        "Maskable external", ppc_intr_mextbr
-    },
-
-    [POWERPC_EXCP_NMEXTBR] = {
-        "Non-maskable external", ppc_intr_nmextbr
-    },
-
-    [POWERPC_EXCP_PERFM] = {
-        "Performance counter", ppc_intr_perfm
-    },
-
     [POWERPC_EXCP_PIT] = {
         "Programmable interval timer", ppc_intr_programmable_timer
     },
@@ -793,22 +627,10 @@ PPCInterrupt interrupts[POWERPC_EXCP_NB] = {
         "System reset", ppc_intr_system_reset
     },
 
-    [POWERPC_EXCP_RUNM] = {
-        "Run mode", ppc_intr_run_mode
-    },
-
     [POWERPC_EXCP_SDOOR_HV] = {
         "Hypervisor doorbell", ppc_intr_hv_doorbell
     },
 
-    [POWERPC_EXCP_SMI] = {
-        "System management", ppc_intr_smi
-    },
-
-    [POWERPC_EXCP_SOFTP] = {
-        "Soft patch", ppc_intr_softp
-    },
-
     [POWERPC_EXCP_SPEU] = {
         "SPE/embedded FP unavailable/VPU", ppc_intr_spe_unavailable
     },
@@ -821,14 +643,6 @@ PPCInterrupt interrupts[POWERPC_EXCP_NB] = {
         "System call vectored", ppc_intr_system_call_vectored
     },
 
-    [POWERPC_EXCP_THERM] = {
-        "Thermal management", ppc_intr_therm
-    },
-
-    [POWERPC_EXCP_VPUA] = {
-        "Vector assist", ppc_intr_vpua
-    },
-
     [POWERPC_EXCP_VPU] = {
         "Vector unavailable", ppc_intr_facility_unavail
     },
@@ -852,6 +666,25 @@ PPCInterrupt interrupts[POWERPC_EXCP_NB] = {
     [POWERPC_EXCP_TRACE] = { "Trace",                      ppc_intr_noop },
 
 /* Not implemented */
+    [POWERPC_EXCP_DABR]     = { "Data address breakpoint" },
+    [POWERPC_EXCP_DTLBE]    = { "Data TLB error" },
+    [POWERPC_EXCP_EFPDI]    = { "Embedded floating-point data" },
+    [POWERPC_EXCP_EFPRI]    = { "Embedded floating-point round" },
+    [POWERPC_EXCP_EMUL]     = { "Emulation trap" },
+    [POWERPC_EXCP_EPERFM]   = { "Embedded perf. monitor" },
+    [POWERPC_EXCP_FPA]      = { "Floating-point assist" },
     [POWERPC_EXCP_HV_MAINT] = { "Hypervisor maintenance" },
+    [POWERPC_EXCP_IABR]     = { "Insn address breakpoint" },
+    [POWERPC_EXCP_IO]       = { "IO error" },
+    [POWERPC_EXCP_ITLBE]    = { "Instruction TLB error" },
+    [POWERPC_EXCP_MAINT]    = { "Maintenance" },
+    [POWERPC_EXCP_MEXTBR]   = { "Maskable external" },
+    [POWERPC_EXCP_NMEXTBR]  = { "Non-maskable external" },
+    [POWERPC_EXCP_PERFM]    = { "Performance counter" },
+    [POWERPC_EXCP_RUNM]     = { "Run mode" },
     [POWERPC_EXCP_SDOOR]    = { "Server doorbell" },
+    [POWERPC_EXCP_SMI]      = { "System management" },
+    [POWERPC_EXCP_SOFTP]    = { "Soft patch" },
+    [POWERPC_EXCP_THERM]    = { "Thermal management" },
+    [POWERPC_EXCP_VPUA]     = { "Vector assist" },
 };
diff --git a/target/ppc/ppc_intr.h b/target/ppc/ppc_intr.h
index 82372ca227..a96062c583 100644
--- a/target/ppc/ppc_intr.h
+++ b/target/ppc/ppc_intr.h
@@ -21,18 +21,12 @@ struct PPCInterrupt {
 
 void ppc_intr_alignment(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore);
 void ppc_intr_critical(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore);
-void ppc_intr_dabr(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore);
 void ppc_intr_data_storage(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore);
 void ppc_intr_debug(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore);
 void ppc_intr_embedded_doorbell_crit(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore);
-void ppc_intr_embedded_fp_data(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore);
-void ppc_intr_embedded_fp_round(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore);
-void ppc_intr_embedded_perf_monitor(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore);
-void ppc_intr_emulation(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore);
 void ppc_intr_external(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore);
 void ppc_intr_facility_unavail(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore);
 void ppc_intr_fit(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore);
-void ppc_intr_fpa(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore);
 void ppc_intr_hv_data_segment(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore);
 void ppc_intr_hv_data_storage(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore);
 void ppc_intr_hv_decrementer(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore);
@@ -42,27 +36,16 @@ void ppc_intr_hv_facility_unavail(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *igno
 void ppc_intr_hv_insn_segment(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore);
 void ppc_intr_hv_insn_storage(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore);
 void ppc_intr_hv_virtualization(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore);
-void ppc_intr_iabr(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore);
 void ppc_intr_insn_storage(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore);
-void ppc_intr_io_error(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore);
 void ppc_intr_machine_check(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore);
-void ppc_intr_maint(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore);
-void ppc_intr_mextbr(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore);
-void ppc_intr_nmextbr(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore);
 void ppc_intr_noop(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore);
-void ppc_intr_perfm(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore);
 void ppc_intr_program(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore);
 void ppc_intr_programmable_timer(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore);
-void ppc_intr_run_mode(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore);
-void ppc_intr_smi(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore);
-void ppc_intr_softp(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore);
 void ppc_intr_spe_unavailable(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore);
 void ppc_intr_system_call(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore);
 void ppc_intr_system_call_vectored(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore);
 void ppc_intr_system_reset(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore);
-void ppc_intr_therm(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore);
 void ppc_intr_tlb_miss(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore);
-void ppc_intr_vpua(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore);
 void ppc_intr_watchdog(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore);
 
 extern PPCInterrupt interrupts[POWERPC_EXCP_NB];
-- 
2.33.1


