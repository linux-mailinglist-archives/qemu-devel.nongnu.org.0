Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2DAD6D17DF
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Mar 2023 08:55:39 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pi8eZ-0004Rc-NY; Fri, 31 Mar 2023 02:54:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <harshpb@linux.ibm.com>)
 id 1pi8eF-0004OM-Mq; Fri, 31 Mar 2023 02:54:07 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <harshpb@linux.ibm.com>)
 id 1pi8eD-0007Zn-TY; Fri, 31 Mar 2023 02:54:07 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32V697en005539; Fri, 31 Mar 2023 06:54:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=vv++is7LMFyammPuHbzgaJWo2kjJjI3tZwdpNVH5VpI=;
 b=mD7UnagpARz5ksMCcGJzOO7X8SXfKGP0LuTNZC/955KjKBZsYTnpIDqsYYxKnN+eyiUo
 N0oIr3JN0HMCsyaYwIKUgM2q6C7XBO2dXmu2bjyxNyJ/gIylRIrxy4r7gX4cS33w3fQr
 PWzQJxEEjKYPAoynlygXxafhQNqsNe6+7GFdyyh8EcZO8SKMrHtAaRSTix2OiexobSos
 h2BCIWz7Okz/roc/RQ7AoYUJJbLbrvVmPS69+WZz5KHo/u2lu4ZkYdB/UrlD8E3KVDJi
 NF0keya95Y713+DLx5KhAE+Sn1+273H30WweOmNoQUku44T4MwD+1cDh8/kR4e9yK91j qQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pnkvryx8h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 31 Mar 2023 06:54:04 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32V6H5Mq020475;
 Fri, 31 Mar 2023 06:54:03 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pnkvryx84-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 31 Mar 2023 06:54:03 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32UMQneU009344;
 Fri, 31 Mar 2023 06:54:00 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
 by ppma04ams.nl.ibm.com (PPS) with ESMTPS id 3phrk6pgfm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 31 Mar 2023 06:54:00 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com
 [10.20.54.101])
 by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 32V6rwuU24183440
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 31 Mar 2023 06:53:58 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2899E20043;
 Fri, 31 Mar 2023 06:53:58 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E049C20040;
 Fri, 31 Mar 2023 06:53:56 +0000 (GMT)
Received: from li-1901474c-32f3-11b2-a85c-fc5ff2c001f3.ibm.com.com (unknown
 [9.43.10.55]) by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Fri, 31 Mar 2023 06:53:56 +0000 (GMT)
From: Harsh Prateek Bora <harshpb@linux.ibm.com>
To: qemu-ppc@nongnu.org
Cc: qemu-devel@nongnu.org, danielhb413@gmail.com
Subject: [PATCH 4/5] ppc: spapr: cleanup spapr_exit_nested() with helper
 routines.
Date: Fri, 31 Mar 2023 12:23:43 +0530
Message-Id: <20230331065344.112341-5-harshpb@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230331065344.112341-1-harshpb@linux.ibm.com>
References: <20230331065344.112341-1-harshpb@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: E7mZsYQJCAM5PDRAk8o-27_OSOyWlViE
X-Proofpoint-ORIG-GUID: JVimB5MB8KgWfBPCMdZ-LIanlnV82XPM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-31_02,2023-03-30_04,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 impostorscore=0
 mlxlogscore=999 phishscore=0 mlxscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2303200000 definitions=main-2303310053
Received-SPF: pass client-ip=148.163.156.1; envelope-from=harshpb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 hw/ppc/spapr_hcall.c | 132 +++++++++++++++++++++++++------------------
 1 file changed, 78 insertions(+), 54 deletions(-)

diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
index a77b4c9076..ed3a21471d 100644
--- a/hw/ppc/spapr_hcall.c
+++ b/hw/ppc/spapr_hcall.c
@@ -1701,36 +1701,23 @@ static target_ulong h_enter_nested(PowerPCCPU *cpu,
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
-    hvstate->cfar = env->cfar;
-    hvstate->lpcr = env->spr[SPR_LPCR];
-    hvstate->pcr = env->spr[SPR_PCR];
-    hvstate->dpdes = env->spr[SPR_DPDES];
-    hvstate->hfscr = env->spr[SPR_HFSCR];
+    hvstate->cfar    = env->cfar;
+    hvstate->lpcr    = env->spr[SPR_LPCR];
+    hvstate->pcr     = env->spr[SPR_PCR];
+    hvstate->dpdes   = env->spr[SPR_DPDES];
+    hvstate->hfscr   = env->spr[SPR_HFSCR];
+    /* HEIR should be implemented for HV mode and saved here. */
+    hvstate->srr0    = env->spr[SPR_SRR0];
+    hvstate->srr1    = env->spr[SPR_SRR1];
+    hvstate->sprg[0] = env->spr[SPR_SPRG0];
+    hvstate->sprg[1] = env->spr[SPR_SPRG1];
+    hvstate->sprg[2] = env->spr[SPR_SPRG2];
+    hvstate->sprg[3] = env->spr[SPR_SPRG3];
+    hvstate->pidr    = env->spr[SPR_BOOKS_PID];
+    hvstate->ppr     = env->spr[SPR_PPR];
 
     if (excp == POWERPC_EXCP_HDSI) {
         hvstate->hdar = env->spr[SPR_HDAR];
@@ -1739,38 +1726,36 @@ void spapr_exit_nested(PowerPCCPU *cpu, int excp)
     } else if (excp == POWERPC_EXCP_HISI) {
         hvstate->asdr = env->spr[SPR_ASDR];
     }
+}
 
-    /* HEIR should be implemented for HV mode and saved here. */
-    hvstate->srr0 = env->spr[SPR_SRR0];
-    hvstate->srr1 = env->spr[SPR_SRR1];
-    hvstate->sprg[0] = env->spr[SPR_SPRG0];
-    hvstate->sprg[1] = env->spr[SPR_SPRG1];
-    hvstate->sprg[2] = env->spr[SPR_SPRG2];
-    hvstate->sprg[3] = env->spr[SPR_SPRG3];
-    hvstate->pidr = env->spr[SPR_BOOKS_PID];
-    hvstate->ppr = env->spr[SPR_PPR];
-
-    /* Is it okay to specify write length larger than actual data written? */
-    address_space_unmap(CPU(cpu)->as, hvstate, len, len, true);
+static int map_and_restore_hvstate(PowerPCCPU *cpu, int excp, target_ulong *r3)
+{
+    CPUPPCState *env = &cpu->env;
+    SpaprCpuState *spapr_cpu = spapr_cpu_state(cpu);
+    target_ulong hv_ptr = spapr_cpu->nested_host_state->gpr[4];
+    struct kvmppc_hv_guest_state *hvstate;
+    hwaddr len = sizeof(*hvstate);
 
-    len = sizeof(*regs);
-    regs = address_space_map(CPU(cpu)->as, regs_ptr, &len, true,
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
@@ -1780,11 +1765,50 @@ void spapr_exit_nested(PowerPCCPU *cpu, int excp)
         regs->nip = env->spr[SPR_HSRR0];
         regs->msr = env->spr[SPR_HSRR1] & env->msr_mask;
     }
+    regs->link = env->lr;
+    regs->ctr  = env->ctr;
+    regs->xer  = cpu_read_xer(env);
+    regs->ccr  = ppc_get_cr(env);
+}
 
+static int map_and_restore_ptregs(PowerPCCPU *cpu, int excp, target_ulong *r3)
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
+   if (!map_and_restore_hvstate(cpu, excp, &r3_return)) {
+       map_and_restore_ptregs (cpu, excp, &r3_return);
+   }
 
-out_restore_l1:
+    /* out_restore_l1 */
     memcpy(env->gpr, spapr_cpu->nested_host_state->gpr, sizeof(env->gpr));
     env->lr = spapr_cpu->nested_host_state->lr;
     env->ctr = spapr_cpu->nested_host_state->ctr;
-- 
2.31.1


