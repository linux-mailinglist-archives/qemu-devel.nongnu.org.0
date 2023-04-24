Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D9BE6ED099
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 16:48:48 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqxTp-0006fP-Mb; Mon, 24 Apr 2023 10:47:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <harshpb@linux.ibm.com>)
 id 1pqxTl-0006eE-CX; Mon, 24 Apr 2023 10:47:45 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <harshpb@linux.ibm.com>)
 id 1pqxTj-0008T3-CI; Mon, 24 Apr 2023 10:47:44 -0400
Received: from pps.filterd (m0353723.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33OEeJoZ024198; Mon, 24 Apr 2023 14:47:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=EUAy9e/TI1dkwPKI/oSfycj9p+qVrndm9JBaJqNGilY=;
 b=YG7NY2PYLrPehekjQ9a7auLg3fZg/s4BQSE3Dj6eZLeJepww4B2GMD5h5PuVgraHT34J
 ht/v79UMzhAlfjoQyfiCP/6B4NIxpmPx8r0FgUIZg+mXDFDSTYnK5FelUQWkNySO9uG3
 R2xCnBOYSFCooyMUkGZmvDdToNV14Nm+g/XfZLWWm0rL6SIzejTlEgtoBz6eLDcjHNRQ
 cCjP3Kudj8YihTPqWDXnXapbJXB80p9cw7pajrJryVgXcolAd8fR+J4I3MguHqoEPM3m
 0fpYy6uUJrroN7JgYWO6gTn0DvPGf2o7dyWLZ1i1mKK3gIvQG83ce8wZ626mp/7t6bFZ 0g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3q4510rccb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Apr 2023 14:47:41 +0000
Received: from m0353723.ppops.net (m0353723.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 33OEfg8Q000479;
 Mon, 24 Apr 2023 14:47:41 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3q4510rcat-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Apr 2023 14:47:41 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 33OEbUI5006305;
 Mon, 24 Apr 2023 14:47:39 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
 by ppma06fra.de.ibm.com (PPS) with ESMTPS id 3q46ug0ywc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Apr 2023 14:47:39 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com
 [10.20.54.101])
 by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 33OElaXj18350840
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 24 Apr 2023 14:47:36 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C63C020043;
 Mon, 24 Apr 2023 14:47:36 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BA30C20040;
 Mon, 24 Apr 2023 14:47:34 +0000 (GMT)
Received: from li-1901474c-32f3-11b2-a85c-fc5ff2c001f3.ibm.com.com (unknown
 [9.43.92.123]) by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Mon, 24 Apr 2023 14:47:34 +0000 (GMT)
From: Harsh Prateek Bora <harshpb@linux.ibm.com>
To: qemu-ppc@nongnu.org
Cc: qemu-devel@nongnu.org, farosas@suse.de, npiggin@gmail.com,
 danielhb413@gmail.com
Subject: [PATCH v2 3/4] ppc: spapr: cleanup spapr_exit_nested() with helper
 routines.
Date: Mon, 24 Apr 2023 20:17:11 +0530
Message-Id: <20230424144712.1985425-4-harshpb@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230424144712.1985425-1-harshpb@linux.ibm.com>
References: <20230424144712.1985425-1-harshpb@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: SA600k7atVZMc-8tfs28emFqyfPXQZez
X-Proofpoint-ORIG-GUID: 7iKl-2qpDjDpcTimCcHQ8zOqWlTCfo1n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-24_09,2023-04-21_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 clxscore=1015 malwarescore=0 adultscore=0 mlxlogscore=981 mlxscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0 impostorscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304240131
Received-SPF: pass client-ip=148.163.158.5; envelope-from=harshpb@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Currently, in spapr_exit_nested(), it does a lot of register state
restoring from ptregs/hvstate after mapping each of those before
restoring the L1 host state. This patch breaks down those set of ops
to respective helper routines for better code readability/maintenance.

Signed-off-by: Harsh Prateek Bora <harshpb@linux.ibm.com>
---
 hw/ppc/spapr_hcall.c | 120 ++++++++++++++++++++++++++-----------------
 1 file changed, 72 insertions(+), 48 deletions(-)

diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
index f24d4b368e..e69634bc22 100644
--- a/hw/ppc/spapr_hcall.c
+++ b/hw/ppc/spapr_hcall.c
@@ -1719,45 +1719,14 @@ static target_ulong h_enter_nested(PowerPCCPU *cpu,
     return env->gpr[3];
 }
 
-void spapr_exit_nested(PowerPCCPU *cpu, int excp)
+static void restore_hvstate_from_env(struct kvmppc_hv_guest_state *hvstate,
+                                     CPUPPCState *env, int excp)
 {
-    CPUState *cs = CPU(cpu);
-    CPUPPCState *env = &cpu->env;
-    SpaprCpuState *spapr_cpu = spapr_cpu_state(cpu);
-    target_ulong r3_return = env->excp_vectors[excp]; /* hcall return value */
-    target_ulong hv_ptr = spapr_cpu->nested_host_state->gpr[4];
-    target_ulong regs_ptr = spapr_cpu->nested_host_state->gpr[5];
-    struct kvmppc_hv_guest_state *hvstate;
-    struct kvmppc_pt_regs *regs;
-    hwaddr len;
-
-    assert(spapr_cpu->in_nested);
-
-    cpu_ppc_hdecr_exit(env);
-
-    len = sizeof(*hvstate);
-    hvstate = address_space_map(CPU(cpu)->as, hv_ptr, &len, true,
-                                MEMTXATTRS_UNSPECIFIED);
-    if (len != sizeof(*hvstate)) {
-        address_space_unmap(CPU(cpu)->as, hvstate, len, 0, true);
-        r3_return = H_PARAMETER;
-        goto out_restore_l1;
-    }
-
     hvstate->cfar = env->cfar;
     hvstate->lpcr = env->spr[SPR_LPCR];
     hvstate->pcr = env->spr[SPR_PCR];
     hvstate->dpdes = env->spr[SPR_DPDES];
     hvstate->hfscr = env->spr[SPR_HFSCR];
-
-    if (excp == POWERPC_EXCP_HDSI) {
-        hvstate->hdar = env->spr[SPR_HDAR];
-        hvstate->hdsisr = env->spr[SPR_HDSISR];
-        hvstate->asdr = env->spr[SPR_ASDR];
-    } else if (excp == POWERPC_EXCP_HISI) {
-        hvstate->asdr = env->spr[SPR_ASDR];
-    }
-
     /* HEIR should be implemented for HV mode and saved here. */
     hvstate->srr0 = env->spr[SPR_SRR0];
     hvstate->srr1 = env->spr[SPR_SRR1];
@@ -1768,27 +1737,43 @@ void spapr_exit_nested(PowerPCCPU *cpu, int excp)
     hvstate->pidr = env->spr[SPR_BOOKS_PID];
     hvstate->ppr = env->spr[SPR_PPR];
 
-    /* Is it okay to specify write length larger than actual data written? */
-    address_space_unmap(CPU(cpu)->as, hvstate, len, len, true);
+    if (excp == POWERPC_EXCP_HDSI) {
+        hvstate->hdar = env->spr[SPR_HDAR];
+        hvstate->hdsisr = env->spr[SPR_HDSISR];
+        hvstate->asdr = env->spr[SPR_ASDR];
+    } else if (excp == POWERPC_EXCP_HISI) {
+        hvstate->asdr = env->spr[SPR_ASDR];
+    }
+}
 
-    len = sizeof(*regs);
-    regs = address_space_map(CPU(cpu)->as, regs_ptr, &len, true,
+static int map_and_restore_l2_hvstate(PowerPCCPU *cpu, int excp, target_ulong *r3)
+{
+    CPUPPCState *env = &cpu->env;
+    SpaprCpuState *spapr_cpu = spapr_cpu_state(cpu);
+    target_ulong hv_ptr = spapr_cpu->nested_host_state->gpr[4];
+    struct kvmppc_hv_guest_state *hvstate;
+    hwaddr len = sizeof(*hvstate);
+
+    hvstate = address_space_map(CPU(cpu)->as, hv_ptr, &len, true,
                                 MEMTXATTRS_UNSPECIFIED);
-    if (!regs || len != sizeof(*regs)) {
-        address_space_unmap(CPU(cpu)->as, regs, len, 0, true);
-        r3_return = H_P2;
-        goto out_restore_l1;
+    if (len != sizeof(*hvstate)) {
+        address_space_unmap(CPU(cpu)->as, hvstate, len, 0, true);
+        *r3 = H_PARAMETER;
+        return -1;
     }
+    restore_hvstate_from_env(hvstate, env, excp);
+    /* Is it okay to specify write length larger than actual data written? */
+    address_space_unmap(CPU(cpu)->as, hvstate, len, len, true);
+    return 0;
+}
 
+static void restore_ptregs_from_env(struct kvmppc_pt_regs *regs,
+                                    CPUPPCState *env, int excp)
+{
+    hwaddr len;
     len = sizeof(env->gpr);
     assert(len == sizeof(regs->gpr));
     memcpy(regs->gpr, env->gpr, len);
-
-    regs->link = env->lr;
-    regs->ctr = env->ctr;
-    regs->xer = cpu_read_xer(env);
-    regs->ccr = ppc_get_cr(env);
-
     if (excp == POWERPC_EXCP_MCHECK ||
         excp == POWERPC_EXCP_RESET ||
         excp == POWERPC_EXCP_SYSCALL) {
@@ -1798,11 +1783,50 @@ void spapr_exit_nested(PowerPCCPU *cpu, int excp)
         regs->nip = env->spr[SPR_HSRR0];
         regs->msr = env->spr[SPR_HSRR1] & env->msr_mask;
     }
+    regs->link = env->lr;
+    regs->ctr = env->ctr;
+    regs->xer = cpu_read_xer(env);
+    regs->ccr = ppc_get_cr(env);
+}
 
+static int map_and_restore_l2_ptregs(PowerPCCPU *cpu, int excp, target_ulong *r3)
+{
+    CPUPPCState *env = &cpu->env;
+    SpaprCpuState *spapr_cpu = spapr_cpu_state(cpu);
+    target_ulong regs_ptr = spapr_cpu->nested_host_state->gpr[5];
+    hwaddr len;
+    struct kvmppc_pt_regs *regs = NULL;
+
+    len = sizeof(*regs);
+    regs = address_space_map(CPU(cpu)->as, regs_ptr, &len, true,
+                             MEMTXATTRS_UNSPECIFIED);
+    if (!regs || len != sizeof(*regs)) {
+        address_space_unmap(CPU(cpu)->as, regs, len, 0, true);
+        *r3 = H_P2;
+        return -1;
+    }
+    restore_ptregs_from_env(regs, env, excp);
     /* Is it okay to specify write length larger than actual data written? */
     address_space_unmap(CPU(cpu)->as, regs, len, len, true);
+    return 0;
+}
+
+void spapr_exit_nested(PowerPCCPU *cpu, int excp)
+{
+    CPUState *cs = CPU(cpu);
+    CPUPPCState *env = &cpu->env;
+    SpaprCpuState *spapr_cpu = spapr_cpu_state(cpu);
+    target_ulong r3_return = env->excp_vectors[excp]; /* hcall return value */
+
+    assert(spapr_cpu->in_nested);
+
+    cpu_ppc_hdecr_exit(env);
+
+   if (!map_and_restore_l2_hvstate(cpu, excp, &r3_return)) {
+       map_and_restore_l2_ptregs (cpu, excp, &r3_return);
+   }
 
-out_restore_l1:
+    /* out_restore_l1 */
     memcpy(env->gpr, spapr_cpu->nested_host_state->gpr, sizeof(env->gpr));
     env->lr = spapr_cpu->nested_host_state->lr;
     env->ctr = spapr_cpu->nested_host_state->ctr;
-- 
2.31.1


