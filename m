Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F0647B3F9
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 20:52:01 +0100 (CET)
Received: from localhost ([::1]:44674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzOhU-0000lC-B6
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 14:52:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1mzNGE-00034E-DH; Mon, 20 Dec 2021 13:19:47 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:31694
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1mzNGC-0006o3-Ms; Mon, 20 Dec 2021 13:19:46 -0500
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BKHg5Qa024961; 
 Mon, 20 Dec 2021 18:19:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=p/TvljV6iO+8rW6DWhzVU3Y3n0V32wA1oU3x6DI8FXw=;
 b=NJNG2UAD65jLHthGzl+UDW6PapD2SbHCQVuXDvNSc4+E5V7RCKFl5QO1SQwaZTyn1Bvf
 ltmxu74BMwkm+oGiAZyXNSsImNWc4VScyLsEHUhMtC7WeDy1QM/wFZ8txyCa3me+jmBk
 AhxIFGpG+vrKfR221LgDBHCj8jCuKD3V3Oq15IRx8bdpBx7plqUFBHmmJvXjYTvlGHx3
 IGIUw61A8LLX30sceAKMDut6NcfofXFWqoAIEbmqMp+jYma008SQoiWwJspvRaap3iXD
 +koiOBx530j3NdQNRieTrzQwLsoBxOyfE3z+Ai7rgyXXGV2TucUXfg8vY6B6/YbwfnCP eg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3d1891bvjq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Dec 2021 18:19:33 +0000
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1BKHxB2Y003254;
 Mon, 20 Dec 2021 18:19:32 GMT
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3d1891bvja-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Dec 2021 18:19:32 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BKIDSNC016588;
 Mon, 20 Dec 2021 18:19:31 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma03dal.us.ibm.com with ESMTP id 3d179aa9rj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Dec 2021 18:19:31 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1BKIJU3N19464518
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 20 Dec 2021 18:19:30 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 657D1C6061;
 Mon, 20 Dec 2021 18:19:30 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DA73BC6055;
 Mon, 20 Dec 2021 18:19:28 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.60.53])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 20 Dec 2021 18:19:28 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [RFC v2 09/12] target/ppc: Use common code for Hypervisor interrupts
Date: Mon, 20 Dec 2021 15:19:00 -0300
Message-Id: <20211220181903.3456898-10-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211220181903.3456898-1-farosas@linux.ibm.com>
References: <20211220181903.3456898-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: twECGO6jLbsfinCjSHPo5oi-gbgEsFJ4
X-Proofpoint-ORIG-GUID: mAJhdgT7gNq-8bCC0CnNSGKNIpdZ4q7y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-20_08,2021-12-20_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 adultscore=0 priorityscore=1501 mlxscore=0 phishscore=0 spamscore=0
 bulkscore=0 mlxlogscore=999 clxscore=1015 malwarescore=0 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112200101
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farosas@linux.ibm.com;
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

The Hypervisor interrupts all set the MSR_HV bit, and use HSRRs
instead of SRRs, so we can use the same code to setup them all.

No functional change.

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
---
 target/ppc/interrupts.c | 128 +++++++---------------------------------
 target/ppc/ppc_intr.h   |   8 +--
 2 files changed, 21 insertions(+), 115 deletions(-)

diff --git a/target/ppc/interrupts.c b/target/ppc/interrupts.c
index 1e4fb2d6db..61a7dec682 100644
--- a/target/ppc/interrupts.c
+++ b/target/ppc/interrupts.c
@@ -364,86 +364,22 @@ void ppc_intr_system_reset(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore)
     }
 }
 
+void ppc_intr_hv(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore)
+{
+    CPUPPCState *env = &cpu->env;
+
+    regs->sprn_srr0 = SPR_HSRR0;
+    regs->sprn_srr1 = SPR_HSRR1;
+    regs->new_msr |= (target_ulong)MSR_HVB;
+    regs->new_msr |= env->msr & ((target_ulong)1 << MSR_RI);
+}
+
 void ppc_intr_hv_insn_storage(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore)
 {
     CPUPPCState *env = &cpu->env;
 
     regs->msr |= env->error_code;
-
-    regs->sprn_srr0 = SPR_HSRR0;
-    regs->sprn_srr1 = SPR_HSRR1;
-    regs->new_msr |= (target_ulong)MSR_HVB;
-    regs->new_msr |= env->msr & ((target_ulong)1 << MSR_RI);
-}
-
-void ppc_intr_hv_decrementer(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore)
-{
-    CPUPPCState *env = &cpu->env;
-
-    regs->sprn_srr0 = SPR_HSRR0;
-    regs->sprn_srr1 = SPR_HSRR1;
-    regs->new_msr |= (target_ulong)MSR_HVB;
-    regs->new_msr |= env->msr & ((target_ulong)1 << MSR_RI);
-}
-
-void ppc_intr_hv_data_storage(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore)
-{
-    CPUPPCState *env = &cpu->env;
-
-    regs->sprn_srr0 = SPR_HSRR0;
-    regs->sprn_srr1 = SPR_HSRR1;
-    regs->new_msr |= (target_ulong)MSR_HVB;
-    regs->new_msr |= env->msr & ((target_ulong)1 << MSR_RI);
-}
-
-void ppc_intr_hv_data_segment(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore)
-{
-    CPUPPCState *env = &cpu->env;
-
-    regs->sprn_srr0 = SPR_HSRR0;
-    regs->sprn_srr1 = SPR_HSRR1;
-    regs->new_msr |= (target_ulong)MSR_HVB;
-    regs->new_msr |= env->msr & ((target_ulong)1 << MSR_RI);
-}
-
-void ppc_intr_hv_insn_segment(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore)
-{
-    CPUPPCState *env = &cpu->env;
-
-    regs->sprn_srr0 = SPR_HSRR0;
-    regs->sprn_srr1 = SPR_HSRR1;
-    regs->new_msr |= (target_ulong)MSR_HVB;
-    regs->new_msr |= env->msr & ((target_ulong)1 << MSR_RI);
-}
-
-void ppc_intr_hv_doorbell(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore)
-{
-    CPUPPCState *env = &cpu->env;
-
-    regs->sprn_srr0 = SPR_HSRR0;
-    regs->sprn_srr1 = SPR_HSRR1;
-    regs->new_msr |= (target_ulong)MSR_HVB;
-    regs->new_msr |= env->msr & ((target_ulong)1 << MSR_RI);
-}
-
-void ppc_intr_hv_emulation(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore)
-{
-    CPUPPCState *env = &cpu->env;
-
-    regs->sprn_srr0 = SPR_HSRR0;
-    regs->sprn_srr1 = SPR_HSRR1;
-    regs->new_msr |= (target_ulong)MSR_HVB;
-    regs->new_msr |= env->msr & ((target_ulong)1 << MSR_RI);
-}
-
-void ppc_intr_hv_virtualization(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore)
-{
-    CPUPPCState *env = &cpu->env;
-
-    regs->sprn_srr0 = SPR_HSRR0;
-    regs->sprn_srr1 = SPR_HSRR1;
-    regs->new_msr |= (target_ulong)MSR_HVB;
-    regs->new_msr |= env->msr & ((target_ulong)1 << MSR_RI);
+    ppc_intr_hv(cpu, regs, ignore);
 }
 
 void ppc_intr_facility_unavail(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore)
@@ -459,11 +395,7 @@ void ppc_intr_hv_facility_unavail(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *igno
 #ifdef TARGET_PPC64
     CPUPPCState *env = &cpu->env;
     env->spr[SPR_FSCR] |= ((target_ulong)env->error_code << FSCR_IC_POS);
-
-    regs->sprn_srr0 = SPR_HSRR0;
-    regs->sprn_srr1 = SPR_HSRR1;
-    regs->new_msr |= (target_ulong)MSR_HVB;
-    regs->new_msr |= env->msr & ((target_ulong)1 << MSR_RI);
+    ppc_intr_hv(cpu, regs, ignore);
 #endif
 }
 
@@ -571,34 +503,10 @@ PPCInterrupt interrupts[POWERPC_EXCP_NB] = {
         "Facility unavailable", ppc_intr_facility_unavail
     },
 
-    [POWERPC_EXCP_HDECR] = {
-        "Hypervisor decrementer", ppc_intr_hv_decrementer
-    },
-
-    [POWERPC_EXCP_HDSEG] = {
-        "Hypervisor data segment", ppc_intr_hv_data_segment
-    },
-
-    [POWERPC_EXCP_HDSI] = {
-        "Hypervisor data storage", ppc_intr_hv_data_storage
-    },
-
-    [POWERPC_EXCP_HISEG] = {
-        "Hypervisor insn segment", ppc_intr_hv_insn_segment
-    },
-
     [POWERPC_EXCP_HISI] = {
         "Hypervisor instruction storage", ppc_intr_hv_insn_storage
     },
 
-    [POWERPC_EXCP_HVIRT] = {
-        "Hypervisor virtualization", ppc_intr_hv_virtualization
-    },
-
-    [POWERPC_EXCP_HV_EMU] = {
-        "Hypervisor emulation assist", ppc_intr_hv_emulation
-    },
-
     [POWERPC_EXCP_HV_FU] = {
         "Hypervisor facility unavailable" , ppc_intr_hv_facility_unavail
     },
@@ -627,10 +535,6 @@ PPCInterrupt interrupts[POWERPC_EXCP_NB] = {
         "System reset", ppc_intr_system_reset
     },
 
-    [POWERPC_EXCP_SDOOR_HV] = {
-        "Hypervisor doorbell", ppc_intr_hv_doorbell
-    },
-
     [POWERPC_EXCP_SPEU] = {
         "SPE/embedded FP unavailable/VPU", ppc_intr_spe_unavailable
     },
@@ -655,6 +559,14 @@ PPCInterrupt interrupts[POWERPC_EXCP_NB] = {
         "Watchdog timer", ppc_intr_watchdog
     },
 
+    [POWERPC_EXCP_HDECR]    = { "Hypervisor decrementer",         ppc_intr_hv },
+    [POWERPC_EXCP_HDSEG]    = { "Hypervisor data segment",        ppc_intr_hv },
+    [POWERPC_EXCP_HDSI]     = { "Hypervisor data storage",        ppc_intr_hv },
+    [POWERPC_EXCP_HISEG]    = { "Hypervisor insn segment",        ppc_intr_hv },
+    [POWERPC_EXCP_HVIRT]    = { "Hypervisor virtualization",      ppc_intr_hv },
+    [POWERPC_EXCP_HV_EMU]   = { "Hypervisor emulation assist",    ppc_intr_hv },
+    [POWERPC_EXCP_SDOOR_HV] = { "Hypervisor doorbell",            ppc_intr_hv },
+
     [POWERPC_EXCP_APU]   = { "Aux. processor unavailable", ppc_intr_noop },
     [POWERPC_EXCP_DECR]  = { "Decrementer",                ppc_intr_noop },
     [POWERPC_EXCP_DOORI] = { "Embedded doorbell",          ppc_intr_noop },
diff --git a/target/ppc/ppc_intr.h b/target/ppc/ppc_intr.h
index a96062c583..078906ed68 100644
--- a/target/ppc/ppc_intr.h
+++ b/target/ppc/ppc_intr.h
@@ -27,15 +27,9 @@ void ppc_intr_embedded_doorbell_crit(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *i
 void ppc_intr_external(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore);
 void ppc_intr_facility_unavail(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore);
 void ppc_intr_fit(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore);
-void ppc_intr_hv_data_segment(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore);
-void ppc_intr_hv_data_storage(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore);
-void ppc_intr_hv_decrementer(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore);
-void ppc_intr_hv_doorbell(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore);
-void ppc_intr_hv_emulation(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore);
+void ppc_intr_hv(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore);
 void ppc_intr_hv_facility_unavail(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore);
-void ppc_intr_hv_insn_segment(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore);
 void ppc_intr_hv_insn_storage(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore);
-void ppc_intr_hv_virtualization(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore);
 void ppc_intr_insn_storage(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore);
 void ppc_intr_machine_check(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore);
 void ppc_intr_noop(PowerPCCPU *cpu, PPCIntrArgs *regs, bool *ignore);
-- 
2.33.1


