Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7808447B34C
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 19:58:23 +0100 (CET)
Received: from localhost ([::1]:52978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzNra-00057K-BC
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 13:58:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1mzNG5-0002r5-SW; Mon, 20 Dec 2021 13:19:37 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:61646)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1mzNG3-0006kX-JK; Mon, 20 Dec 2021 13:19:37 -0500
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BKI329r005406; 
 Mon, 20 Dec 2021 18:19:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=983gXqUUJJVWku1XoS5bjtmvEk8wqflKgL2VjdNaRcM=;
 b=BAUZV6w6wPsyUtx4nsF4xlS1f3TELNqySdAdbAWFXdGuri/BPpqJ9WP9ifZGO6guQVWj
 Elmfu/VSFgd6RS/fCTNMUkftGd1w8hldTU1jYLw0nvKpmDEeBy4Uz7ETPJeUcuf0LyMk
 xHpCvSXQkR+djqViYYyWP0EhDuqOxH6gRKo1AsmZlRPm1esrHfCTafPU0+csT0xiFXZe
 eUG4aVGFxtxCgGivIP/NUK7c3I18aDAhFqgFOOhAlAaZ5KoBV54gW00x7JH5W/p41IBG
 ZXTvE5zqjASH3mwqrNNqiyNswZ9DzMKvvibYS/2sRgBX//DYxmn4ieqCNzDq8vsK9QoJ +Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3d2q0jtp6h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Dec 2021 18:19:29 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1BKIF1d0029159;
 Mon, 20 Dec 2021 18:19:29 GMT
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3d2q0jtp5y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Dec 2021 18:19:29 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BKIEVkb022792;
 Mon, 20 Dec 2021 18:19:27 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma04dal.us.ibm.com with ESMTP id 3d179aa5nw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Dec 2021 18:19:27 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1BKIJQK327853246
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 20 Dec 2021 18:19:26 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 99D78C605D;
 Mon, 20 Dec 2021 18:19:26 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 15F82C6055;
 Mon, 20 Dec 2021 18:19:25 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.60.53])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 20 Dec 2021 18:19:24 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [RFC v2 07/12] target/ppc: Introduce PPCInterrupt
Date: Mon, 20 Dec 2021 15:18:58 -0300
Message-Id: <20211220181903.3456898-8-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211220181903.3456898-1-farosas@linux.ibm.com>
References: <20211220181903.3456898-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: xWRlBSBIZUS6sYUDOs9hfmA-8vXAeFng
X-Proofpoint-ORIG-GUID: KA197xII_D6LiKIc670dyjce8cXjqvyy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-20_08,2021-12-20_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0
 impostorscore=0 bulkscore=0 clxscore=1015 mlxlogscore=999 phishscore=0
 adultscore=0 suspectscore=0 priorityscore=1501 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

Now that each interrupt has its own routine, we can have an array of
interrupts and drop the big switch in powerpc_excp(). That will allow
us to later split the interrupt list between the various powerpc
implementations (book3s, booke, 32bit, kvm, etc).

No functional change.

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
---
 target/ppc/excp_helper.c | 172 +++----------------------------
 target/ppc/interrupts.c  | 212 +++++++++++++++++++++++++++++++++++++++
 target/ppc/ppc_intr.h    |   9 ++
 3 files changed, 236 insertions(+), 157 deletions(-)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index bc20499b6c..4f8a6c4ec8 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -31,7 +31,6 @@
 
 #ifdef CONFIG_TCG
 #include "exec/helper-proto.h"
-#include "exec/cpu_ldst.h"
 #endif
 
 /*****************************************************************************/
@@ -274,11 +273,17 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp)
     CPUPPCState *env = &cpu->env;
     int excp_model = env->excp_model;
     PPCIntrArgs regs;
+    PPCInterrupt *intr;
     bool ignore = false;
 
     qemu_log_mask(CPU_LOG_INT, "Raise exception at " TARGET_FMT_lx
                   " => %08x (%02x)\n", env->nip, excp, env->error_code);
 
+    if (excp == POWERPC_EXCP_NONE) {
+        /* Should never happen */
+        return;
+    }
+
     /* new srr1 value excluding must-be-zero bits */
     if (excp_model == POWERPC_EXCP_BOOKE) {
         regs.msr = env->msr;
@@ -336,165 +341,18 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp)
 
     regs.new_nip |= env->excp_prefix;
 
-    switch (excp) {
-    case POWERPC_EXCP_NONE:
-        /* Should never happen */
-        return;
-
-    case POWERPC_EXCP_CRITICAL:    /* Critical input                         */
-        ppc_intr_critical(cpu, &regs, &ignore);
-        break;
-    case POWERPC_EXCP_MCHECK:    /* Machine check exception                  */
-        ppc_intr_machine_check(cpu, &regs, &ignore);
-        break;
-    case POWERPC_EXCP_DSI:       /* Data storage exception                   */
-        ppc_intr_data_storage(cpu, &regs, &ignore);
-        break;
-    case POWERPC_EXCP_ISI:       /* Instruction storage exception            */
-        ppc_intr_insn_storage(cpu, &regs, &ignore);
-        break;
-    case POWERPC_EXCP_EXTERNAL:  /* External input                           */
-        ppc_intr_external(cpu, &regs, &ignore);
-        break;
-    case POWERPC_EXCP_ALIGN:     /* Alignment exception                      */
-        ppc_intr_alignment(cpu, &regs, &ignore);
-        break;
-    case POWERPC_EXCP_PROGRAM:   /* Program exception                        */
-        ppc_intr_program(cpu, &regs, &ignore);
-        break;
-    case POWERPC_EXCP_SYSCALL:   /* System call exception                    */
-        ppc_intr_system_call(cpu, &regs, &ignore);
-        break;
-    case POWERPC_EXCP_SYSCALL_VECTORED: /* scv exception                     */
-        ppc_intr_system_call_vectored(cpu, &regs, &ignore);
-        break;
-    case POWERPC_EXCP_FPU:       /* Floating-point unavailable exception     */
-    case POWERPC_EXCP_APU:       /* Auxiliary processor unavailable          */
-    case POWERPC_EXCP_DECR:      /* Decrementer exception                    */
-        break;
-    case POWERPC_EXCP_FIT:       /* Fixed-interval timer interrupt           */
-        ppc_intr_fit(cpu, &regs, &ignore);
-        break;
-    case POWERPC_EXCP_WDT:       /* Watchdog timer interrupt                 */
-        ppc_intr_watchdog(cpu, &regs, &ignore);
-        break;
-    case POWERPC_EXCP_DTLB:      /* Data TLB error                           */
-    case POWERPC_EXCP_ITLB:      /* Instruction TLB error                    */
-        break;
-    case POWERPC_EXCP_DEBUG:     /* Debug interrupt                          */
-        ppc_intr_debug(cpu, &regs, &ignore);
-        break;
-    case POWERPC_EXCP_SPEU:   /* SPE/embedded floating-point unavailable/VPU  */
-        ppc_intr_spe_unavailable(cpu, &regs, &ignore);
-        break;
-    case POWERPC_EXCP_EFPDI:     /* Embedded floating-point data interrupt   */
-        ppc_intr_embedded_fp_data(cpu, &regs, &ignore);
-        break;
-    case POWERPC_EXCP_EFPRI:     /* Embedded floating-point round interrupt  */
-        ppc_intr_embedded_fp_round(cpu, &regs, &ignore);
-        break;
-    case POWERPC_EXCP_EPERFM:    /* Embedded performance monitor interrupt   */
-        ppc_intr_embedded_perf_monitor(cpu, &regs, &ignore);
-        break;
-    case POWERPC_EXCP_DOORI:     /* Embedded doorbell interrupt              */
-        break;
-    case POWERPC_EXCP_DOORCI:    /* Embedded doorbell critical interrupt     */
-        ppc_intr_embedded_doorbell_crit(cpu, &regs, &ignore);
-        break;
-    case POWERPC_EXCP_RESET:     /* System reset exception                   */
-        ppc_intr_system_reset(cpu, &regs, &ignore);
-        break;
-    case POWERPC_EXCP_DSEG:      /* Data segment exception                   */
-    case POWERPC_EXCP_ISEG:      /* Instruction segment exception            */
-    case POWERPC_EXCP_TRACE:     /* Trace exception                          */
-        break;
-    case POWERPC_EXCP_HISI:      /* Hypervisor instruction storage exception */
-        ppc_intr_hv_insn_storage(cpu, &regs, &ignore);
-        break;
-    case POWERPC_EXCP_HDECR:     /* Hypervisor decrementer exception         */
-        ppc_intr_hv_decrementer(cpu, &regs, &ignore);
-        break;
-    case POWERPC_EXCP_HDSI:      /* Hypervisor data storage exception        */
-        ppc_intr_hv_data_storage(cpu, &regs, &ignore);
-        break;
-    case POWERPC_EXCP_HDSEG:     /* Hypervisor data segment exception        */
-        ppc_intr_hv_data_segment(cpu, &regs, &ignore);
-        break;
-    case POWERPC_EXCP_HISEG:     /* Hypervisor instruction segment exception */
-        ppc_intr_hv_insn_segment(cpu, &regs, &ignore);
-        break;
-    case POWERPC_EXCP_SDOOR_HV:  /* Hypervisor Doorbell interrupt            */
-        ppc_intr_hv_doorbell(cpu, &regs, &ignore);
-        break;
-    case POWERPC_EXCP_HV_EMU:
-        ppc_intr_hv_emulation(cpu, &regs, &ignore);
-        break;
-    case POWERPC_EXCP_HVIRT:     /* Hypervisor virtualization                */
-        ppc_intr_hv_virtualization(cpu, &regs, &ignore);
-        break;
-    case POWERPC_EXCP_VPU:       /* Vector unavailable exception             */
-    case POWERPC_EXCP_VSXU:       /* VSX unavailable exception               */
-    case POWERPC_EXCP_FU:         /* Facility unavailable exception          */
-        ppc_intr_facility_unavail(cpu, &regs, &ignore);
-        break;
-    case POWERPC_EXCP_HV_FU:     /* Hypervisor Facility Unavailable Exception */
-        ppc_intr_hv_facility_unavail(cpu, &regs, &ignore);
-        break;
-    case POWERPC_EXCP_PIT:       /* Programmable interval timer interrupt    */
-        ppc_intr_programmable_timer(cpu, &regs, &ignore);
-        break;
-    case POWERPC_EXCP_IO:        /* IO error exception                       */
-        ppc_intr_io_error(cpu, &regs, &ignore);
-        break;
-    case POWERPC_EXCP_RUNM:      /* Run mode exception                       */
-        ppc_intr_run_mode(cpu, &regs, &ignore);
-        break;
-    case POWERPC_EXCP_EMUL:      /* Emulation trap exception                 */
-        ppc_intr_emulation(cpu, &regs, &ignore);
-        break;
-    case POWERPC_EXCP_IFTLB:     /* Instruction fetch TLB error              */
-    case POWERPC_EXCP_DLTLB:     /* Data load TLB miss                       */
-    case POWERPC_EXCP_DSTLB:     /* Data store TLB miss                      */
-        ppc_intr_tlb_miss(cpu, &regs, &ignore);
-        break;
-    case POWERPC_EXCP_FPA:       /* Floating-point assist exception          */
-        ppc_intr_fpa(cpu, &regs, &ignore);
-        break;
-    case POWERPC_EXCP_DABR:      /* Data address breakpoint                  */
-        ppc_intr_dabr(cpu, &regs, &ignore);
-        break;
-    case POWERPC_EXCP_IABR:      /* Instruction address breakpoint           */
-        ppc_intr_iabr(cpu, &regs, &ignore);
-        break;
-    case POWERPC_EXCP_SMI:       /* System management interrupt              */
-        ppc_intr_smi(cpu, &regs, &ignore);
-        break;
-    case POWERPC_EXCP_THERM:     /* Thermal interrupt                        */
-        ppc_intr_therm(cpu, &regs, &ignore);
-        break;
-    case POWERPC_EXCP_PERFM:     /* Embedded performance monitor interrupt   */
-        ppc_intr_perfm(cpu, &regs, &ignore);
-        break;
-    case POWERPC_EXCP_VPUA:      /* Vector assist exception                  */
-        ppc_intr_vpua(cpu, &regs, &ignore);
-        break;
-    case POWERPC_EXCP_SOFTP:     /* Soft patch exception                     */
-        ppc_intr_softp(cpu, &regs, &ignore);
-        break;
-    case POWERPC_EXCP_MAINT:     /* Maintenance exception                    */
-        ppc_intr_maint(cpu, &regs, &ignore);
-        break;
-    case POWERPC_EXCP_MEXTBR:    /* Maskable external breakpoint             */
-        ppc_intr_mextbr(cpu, &regs, &ignore);
-        break;
-    case POWERPC_EXCP_NMEXTBR:   /* Non maskable external breakpoint         */
-        ppc_intr_nmextbr(cpu, &regs, &ignore);
-        break;
-    default:
+    intr = &interrupts[excp];
+    if (!intr->name) {
         cpu_abort(cs, "Invalid PowerPC exception %d. Aborting\n", excp);
-        break;
     }
 
+    if (!intr->fn) {
+        cpu_abort(cs, "%s exception is not implemented yet !\n", intr->name);
+    }
+
+    /* Setup interrupt-specific registers before dispatching */
+    intr->fn(cpu, &regs, &ignore);
+
     if (ignore) {
         /* No further setup is needed for this interrupt */
         return;
diff --git a/target/ppc/interrupts.c b/target/ppc/interrupts.c
index 0168ce03a7..2dd3815167 100644
--- a/target/ppc/interrupts.c
+++ b/target/ppc/interrupts.c
@@ -17,6 +17,10 @@
 
 /* #define DEBUG_SOFTWARE_TLB */
 
+void ppc_intr_noop(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore)
+{
+}
+
 void ppc_intr_critical(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore)
 {
     CPUPPCState *env = &cpu->env;
@@ -643,3 +647,211 @@ void ppc_intr_nmextbr(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore)
     cpu_abort(CPU(cpu), "Non maskable external exception "
               "is not implemented yet !\n");
 }
+
+PPCInterrupt interrupts[POWERPC_EXCP_NB] = {
+    [POWERPC_EXCP_ALIGN] = {
+        "Alignment", ppc_intr_alignment
+    },
+
+    [POWERPC_EXCP_CRITICAL] = {
+        "Critical input", ppc_intr_critical
+    },
+
+    [POWERPC_EXCP_DABR] = {
+        "Data address breakpoint", ppc_intr_dabr
+    },
+
+    [POWERPC_EXCP_DEBUG] = {
+        "Debug", ppc_intr_debug
+    },
+
+    [POWERPC_EXCP_DLTLB] = {
+        "Data load TLB error", ppc_intr_tlb_miss
+    },
+
+    [POWERPC_EXCP_DOORCI] = {
+        "Embedded doorbell critical", ppc_intr_embedded_doorbell_crit
+    },
+
+    [POWERPC_EXCP_DSI] = {
+        "Data storage", ppc_intr_data_storage
+    },
+
+    [POWERPC_EXCP_DSTLB] = {
+        "Data store TLB error", ppc_intr_tlb_miss
+    },
+
+    [POWERPC_EXCP_EFPDI] = {
+        "Embedded floating-point data", ppc_intr_embedded_fp_data
+    },
+
+    [POWERPC_EXCP_EFPRI] = {
+        "Embedded floating-point round", ppc_intr_embedded_fp_round
+    },
+
+    [POWERPC_EXCP_EMUL] = {
+        "Emulation trap", ppc_intr_emulation
+    },
+
+    [POWERPC_EXCP_EPERFM] = {
+        "Embedded perf. monitor", ppc_intr_embedded_perf_monitor
+    },
+
+    [POWERPC_EXCP_EXTERNAL] = {
+        "External", ppc_intr_external
+    },
+
+    [POWERPC_EXCP_FIT] = {
+        "Fixed-interval timer", ppc_intr_fit
+    },
+
+    [POWERPC_EXCP_FPA] = {
+        "Floating-point assist", ppc_intr_fpa
+    },
+
+    [POWERPC_EXCP_FU] = {
+        "Facility unavailable", ppc_intr_facility_unavail
+    },
+
+    [POWERPC_EXCP_HDECR] = {
+        "Hypervisor decrementer", ppc_intr_hv_decrementer
+    },
+
+    [POWERPC_EXCP_HDSEG] = {
+        "Hypervisor data segment", ppc_intr_hv_data_segment
+    },
+
+    [POWERPC_EXCP_HDSI] = {
+        "Hypervisor data storage", ppc_intr_hv_data_storage
+    },
+
+    [POWERPC_EXCP_HISEG] = {
+        "Hypervisor insn segment", ppc_intr_hv_insn_segment
+    },
+
+    [POWERPC_EXCP_HISI] = {
+        "Hypervisor instruction storage", ppc_intr_hv_insn_storage
+    },
+
+    [POWERPC_EXCP_HVIRT] = {
+        "Hypervisor virtualization", ppc_intr_hv_virtualization
+    },
+
+    [POWERPC_EXCP_HV_EMU] = {
+        "Hypervisor emulation assist", ppc_intr_hv_emulation
+    },
+
+    [POWERPC_EXCP_HV_FU] = {
+        "Hypervisor facility unavailable" , ppc_intr_hv_facility_unavail
+    },
+
+    [POWERPC_EXCP_IABR] = {
+        "Insn address breakpoint", ppc_intr_iabr
+    },
+
+    [POWERPC_EXCP_IFTLB] = {
+        "Insn fetch TLB error", ppc_intr_tlb_miss
+    },
+
+    [POWERPC_EXCP_IO] = {
+        "IO error", ppc_intr_io_error
+    },
+
+    [POWERPC_EXCP_ISI] = {
+        "Instruction storage", ppc_intr_insn_storage
+    },
+
+    [POWERPC_EXCP_MAINT] = {
+        "Maintenance", ppc_intr_maint
+    },
+
+    [POWERPC_EXCP_MCHECK] = {
+        "Machine check", ppc_intr_machine_check
+    },
+
+    [POWERPC_EXCP_MEXTBR] = {
+        "Maskable external", ppc_intr_mextbr
+    },
+
+    [POWERPC_EXCP_NMEXTBR] = {
+        "Non-maskable external", ppc_intr_nmextbr
+    },
+
+    [POWERPC_EXCP_PERFM] = {
+        "Performance counter", ppc_intr_perfm
+    },
+
+    [POWERPC_EXCP_PIT] = {
+        "Programmable interval timer", ppc_intr_programmable_timer
+    },
+
+    [POWERPC_EXCP_PROGRAM] = {
+        "Program", ppc_intr_program
+    },
+
+    [POWERPC_EXCP_RESET] = {
+        "System reset", ppc_intr_system_reset
+    },
+
+    [POWERPC_EXCP_RUNM] = {
+        "Run mode", ppc_intr_run_mode
+    },
+
+    [POWERPC_EXCP_SDOOR_HV] = {
+        "Hypervisor doorbell", ppc_intr_hv_doorbell
+    },
+
+    [POWERPC_EXCP_SMI] = {
+        "System management", ppc_intr_smi
+    },
+
+    [POWERPC_EXCP_SOFTP] = {
+        "Soft patch", ppc_intr_softp
+    },
+
+    [POWERPC_EXCP_SPEU] = {
+        "SPE/embedded FP unavailable/VPU", ppc_intr_spe_unavailable
+    },
+
+    [POWERPC_EXCP_SYSCALL] = {
+        "System call", ppc_intr_system_call
+    },
+
+    [POWERPC_EXCP_SYSCALL_VECTORED] = {
+        "System call vectored", ppc_intr_system_call_vectored
+    },
+
+    [POWERPC_EXCP_THERM] = {
+        "Thermal management", ppc_intr_therm
+    },
+
+    [POWERPC_EXCP_VPUA] = {
+        "Vector assist", ppc_intr_vpua
+    },
+
+    [POWERPC_EXCP_VPU] = {
+        "Vector unavailable", ppc_intr_facility_unavail
+    },
+
+    [POWERPC_EXCP_VSXU] = {
+        "VSX unavailable", ppc_intr_facility_unavail
+    },
+
+    [POWERPC_EXCP_WDT] = {
+        "Watchdog timer", ppc_intr_watchdog
+    },
+
+    [POWERPC_EXCP_APU]   = { "Aux. processor unavailable", ppc_intr_noop },
+    [POWERPC_EXCP_DECR]  = { "Decrementer",                ppc_intr_noop },
+    [POWERPC_EXCP_DOORI] = { "Embedded doorbell",          ppc_intr_noop },
+    [POWERPC_EXCP_DSEG]  = { "Data segment",               ppc_intr_noop },
+    [POWERPC_EXCP_DTLB]  = { "Data TLB error",             ppc_intr_noop },
+    [POWERPC_EXCP_FPU]   = { "Floating-point unavailable", ppc_intr_noop },
+    [POWERPC_EXCP_ISEG]  = { "Instruction segment",        ppc_intr_noop },
+    [POWERPC_EXCP_ITLB]  = { "Instruction TLB error",      ppc_intr_noop },
+    [POWERPC_EXCP_TRACE] = { "Trace",                      ppc_intr_noop },
+
+/* Not implemented */
+    [POWERPC_EXCP_HV_MAINT] = { "Hypervisor maintenance" },
+    [POWERPC_EXCP_SDOOR]    = { "Server doorbell" },
+};
diff --git a/target/ppc/ppc_intr.h b/target/ppc/ppc_intr.h
index 25c11710f9..82372ca227 100644
--- a/target/ppc/ppc_intr.h
+++ b/target/ppc/ppc_intr.h
@@ -2,6 +2,8 @@
 #define PPC_INTR_H
 
 typedef struct PPCIntrArgs PPCIntrArgs;
+typedef struct PPCInterrupt PPCInterrupt;
+typedef void (*ppc_intr_fn_t)(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore);
 
 struct PPCIntrArgs {
     target_ulong nip;
@@ -12,6 +14,11 @@ struct PPCIntrArgs {
     int sprn_srr1;
 };
 
+struct PPCInterrupt {
+    const char *name;
+    ppc_intr_fn_t fn;
+};
+
 void ppc_intr_alignment(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore);
 void ppc_intr_critical(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore);
 void ppc_intr_dabr(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore);
@@ -58,4 +65,6 @@ void ppc_intr_tlb_miss(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore);
 void ppc_intr_vpua(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore);
 void ppc_intr_watchdog(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore);
 
+extern PPCInterrupt interrupts[POWERPC_EXCP_NB];
+
 #endif /* PPC_INTR_H */
-- 
2.33.1


