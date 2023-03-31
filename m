Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C60BC6D17DD
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Mar 2023 08:55:39 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pi8eQ-0004OU-Tq; Fri, 31 Mar 2023 02:54:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <harshpb@linux.ibm.com>)
 id 1pi8eA-0004LZ-MP; Fri, 31 Mar 2023 02:54:02 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <harshpb@linux.ibm.com>)
 id 1pi8e8-0007Yo-84; Fri, 31 Mar 2023 02:54:02 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32V6YCPa011271; Fri, 31 Mar 2023 06:53:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=02KQrx2wNtLqJ3bL/mt3XKnoflLs8PdT1RYC4qK3KF4=;
 b=dITAH93RC+KLpnvjd0H09YJPygKttv5BzQTR5ApB8mzNaRKEV50LDOGThR+HwN7x565j
 ekPs7zEJ6tkkasDLgKAxLGYkF8xa0hWei06MY2ha2cP1bp+dykuSijOcoRbIUc2SDdON
 EkskAa/8X9dBHl2Q2fKYST/A2qsf7zuGi50/+nDhe+uZEAdgraQifQAGrlvqCDHTFsGV
 ztapuJoil1Thqabz7dBFuRt4W2r1wC1qKOFQRmq/im3qGks2v/UbIoNg68Nu0Zf0JUpV
 O72JtF/6Jy8s803cqDPYX37MzKyBIcbci2UdGXmI8KwUAeqcotQiXjbVQWIPm1M/Rjg8 RQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pnfvnda7b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 31 Mar 2023 06:53:59 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32V6o5j6023937;
 Fri, 31 Mar 2023 06:53:58 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pnfvnda6u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 31 Mar 2023 06:53:58 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32UM4LPH019418;
 Fri, 31 Mar 2023 06:53:56 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
 by ppma03ams.nl.ibm.com (PPS) with ESMTPS id 3phrk6phq7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 31 Mar 2023 06:53:56 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com
 [10.20.54.101])
 by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 32V6rsGw18350724
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 31 Mar 2023 06:53:54 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 55D2D20043;
 Fri, 31 Mar 2023 06:53:54 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0601E20040;
 Fri, 31 Mar 2023 06:53:53 +0000 (GMT)
Received: from li-1901474c-32f3-11b2-a85c-fc5ff2c001f3.ibm.com.com (unknown
 [9.43.10.55]) by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Fri, 31 Mar 2023 06:53:52 +0000 (GMT)
From: Harsh Prateek Bora <harshpb@linux.ibm.com>
To: qemu-ppc@nongnu.org
Cc: qemu-devel@nongnu.org, danielhb413@gmail.com
Subject: [PATCH 2/5] ppc: spapr: cleanup h_enter_nested() with helper routines.
Date: Fri, 31 Mar 2023 12:23:41 +0530
Message-Id: <20230331065344.112341-3-harshpb@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230331065344.112341-1-harshpb@linux.ibm.com>
References: <20230331065344.112341-1-harshpb@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: YNw_wQfd7NX80J-KKW306M_LAEvOJfkm
X-Proofpoint-ORIG-GUID: CKeHIfo0x6qoazcg2fnU0MwVNFpfbhwZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-31_02,2023-03-30_04,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 suspectscore=0 phishscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 mlxlogscore=962 priorityscore=1501 spamscore=0 clxscore=1015 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2303310053
Received-SPF: pass client-ip=148.163.158.5; envelope-from=harshpb@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

h_enter_nested() currently does a lot of register specific operations
which should be abstracted logically to simplify the code for better
readability. This patch breaks down relevant blocks into respective
helper routines to make use of them for better readability/maintenance.

Signed-off-by: Harsh Prateek Bora <harshpb@linux.ibm.com>
---
 hw/ppc/spapr_hcall.c | 99 +++++++++++++++++++++++++++-----------------
 1 file changed, 60 insertions(+), 39 deletions(-)

diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
index 124cee5e53..a13e5256ab 100644
--- a/hw/ppc/spapr_hcall.c
+++ b/hw/ppc/spapr_hcall.c
@@ -1544,6 +1544,62 @@ static target_ulong h_copy_tofrom_guest(PowerPCCPU *cpu,
     return H_FUNCTION;
 }
 
+static void restore_hdec_from_hvstate(CPUPPCState *dst,
+                                      struct kvmppc_hv_guest_state *hv_state,
+                                      target_ulong now)
+{
+    target_ulong hdec;
+    assert(hv_state);
+    hdec = hv_state->hdec_expiry - now;
+    cpu_ppc_hdecr_init(dst);
+    cpu_ppc_store_hdecr(dst, hdec);
+}
+
+static void restore_lpcr_from_hvstate(PowerPCCPU *cpu,
+                                      struct kvmppc_hv_guest_state *hv_state)
+{
+    PowerPCCPUClass *pcc = POWERPC_CPU_GET_CLASS(cpu);
+    CPUPPCState *dst = &cpu->env;
+    target_ulong lpcr, lpcr_mask;
+    assert(hv_state);
+    lpcr_mask = LPCR_DPFD | LPCR_ILE | LPCR_AIL | LPCR_LD | LPCR_MER;
+    lpcr = (dst->spr[SPR_LPCR] & ~lpcr_mask) | (hv_state->lpcr & lpcr_mask);
+    lpcr |= LPCR_HR | LPCR_UPRT | LPCR_GTSE | LPCR_HVICE | LPCR_HDICE;
+    lpcr &= ~LPCR_LPES0;
+    dst->spr[SPR_LPCR] = lpcr & pcc->lpcr_mask;
+}
+
+static void restore_env_from_ptregs_hvstate(CPUPPCState *env,
+                                            struct kvmppc_pt_regs *regs,
+                                            struct kvmppc_hv_guest_state *hv_state)
+{
+    assert(env);
+    assert(regs);
+    assert(hv_state);
+    assert(sizeof(env->gpr) == sizeof(regs->gpr));
+    memcpy(env->gpr, regs->gpr, sizeof(env->gpr));
+    env->nip = regs->nip;
+    env->msr = regs->msr;
+    env->lr = regs->link;
+    env->ctr = regs->ctr;
+    cpu_write_xer(env, regs->xer);
+    ppc_store_cr(env, regs->ccr);
+    /* hv_state->amor is not used in api v1 */
+    env->spr[SPR_HFSCR] = hv_state->hfscr;
+    /* TCG does not implement DAWR*, CIABR, PURR, SPURR, IC, VTB, HEIR SPRs*/
+    env->cfar = hv_state->cfar;
+    env->spr[SPR_PCR]      = hv_state->pcr;
+    env->spr[SPR_DPDES]     = hv_state->dpdes;
+    env->spr[SPR_SRR0]      = hv_state->srr0;
+    env->spr[SPR_SRR1]      = hv_state->srr1;
+    env->spr[SPR_SPRG0]     = hv_state->sprg[0];
+    env->spr[SPR_SPRG1]     = hv_state->sprg[1];
+    env->spr[SPR_SPRG2]     = hv_state->sprg[2];
+    env->spr[SPR_SPRG3]     = hv_state->sprg[3];
+    env->spr[SPR_BOOKS_PID] = hv_state->pidr;
+    env->spr[SPR_PPR]       = hv_state->ppr;
+}
+
 /*
  * When this handler returns, the environment is switched to the L2 guest
  * and TCG begins running that. spapr_exit_nested() performs the switch from
@@ -1554,14 +1610,12 @@ static target_ulong h_enter_nested(PowerPCCPU *cpu,
                                    target_ulong opcode,
                                    target_ulong *args)
 {
-    PowerPCCPUClass *pcc = POWERPC_CPU_GET_CLASS(cpu);
     CPUState *cs = CPU(cpu);
     CPUPPCState *env = &cpu->env;
     SpaprCpuState *spapr_cpu = spapr_cpu_state(cpu);
     target_ulong hv_ptr = args[0];
     target_ulong regs_ptr = args[1];
-    target_ulong hdec, now = cpu_ppc_load_tbl(env);
-    target_ulong lpcr, lpcr_mask;
+    target_ulong now = cpu_ppc_load_tbl(env);
     struct kvmppc_hv_guest_state *hvstate;
     struct kvmppc_hv_guest_state hv_state;
     struct kvmppc_pt_regs *regs;
@@ -1607,49 +1661,16 @@ static target_ulong h_enter_nested(PowerPCCPU *cpu,
         return H_P2;
     }
 
-    len = sizeof(env->gpr);
-    assert(len == sizeof(regs->gpr));
-    memcpy(env->gpr, regs->gpr, len);
-
-    env->lr = regs->link;
-    env->ctr = regs->ctr;
-    cpu_write_xer(env, regs->xer);
-    ppc_store_cr(env, regs->ccr);
-
-    env->msr = regs->msr;
-    env->nip = regs->nip;
+    restore_env_from_ptregs_hvstate(env, regs, &hv_state);
+    restore_lpcr_from_hvstate(cpu, &hv_state);
+    restore_hdec_from_hvstate(env, &hv_state, now);
 
     address_space_unmap(CPU(cpu)->as, regs, len, len, false);
 
-    env->cfar = hv_state.cfar;
-
     assert(env->spr[SPR_LPIDR] == 0);
     env->spr[SPR_LPIDR] = hv_state.lpid;
 
-    lpcr_mask = LPCR_DPFD | LPCR_ILE | LPCR_AIL | LPCR_LD | LPCR_MER;
-    lpcr = (env->spr[SPR_LPCR] & ~lpcr_mask) | (hv_state.lpcr & lpcr_mask);
-    lpcr |= LPCR_HR | LPCR_UPRT | LPCR_GTSE | LPCR_HVICE | LPCR_HDICE;
-    lpcr &= ~LPCR_LPES0;
-    env->spr[SPR_LPCR] = lpcr & pcc->lpcr_mask;
-
-    env->spr[SPR_PCR] = hv_state.pcr;
-    /* hv_state.amor is not used */
-    env->spr[SPR_DPDES] = hv_state.dpdes;
-    env->spr[SPR_HFSCR] = hv_state.hfscr;
-    hdec = hv_state.hdec_expiry - now;
     spapr_cpu->nested_tb_offset = hv_state.tb_offset;
-    /* TCG does not implement DAWR*, CIABR, PURR, SPURR, IC, VTB, HEIR SPRs*/
-    env->spr[SPR_SRR0] = hv_state.srr0;
-    env->spr[SPR_SRR1] = hv_state.srr1;
-    env->spr[SPR_SPRG0] = hv_state.sprg[0];
-    env->spr[SPR_SPRG1] = hv_state.sprg[1];
-    env->spr[SPR_SPRG2] = hv_state.sprg[2];
-    env->spr[SPR_SPRG3] = hv_state.sprg[3];
-    env->spr[SPR_BOOKS_PID] = hv_state.pidr;
-    env->spr[SPR_PPR] = hv_state.ppr;
-
-    cpu_ppc_hdecr_init(env);
-    cpu_ppc_store_hdecr(env, hdec);
 
     /*
      * The hv_state.vcpu_token is not needed. It is used by the KVM
-- 
2.31.1


