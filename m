Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 443CA6D17E0
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Mar 2023 08:55:40 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pi8eF-0004Nm-Kj; Fri, 31 Mar 2023 02:54:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <harshpb@linux.ibm.com>)
 id 1pi8eA-0004LR-Db; Fri, 31 Mar 2023 02:54:02 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <harshpb@linux.ibm.com>)
 id 1pi8e8-0007Yc-2S; Fri, 31 Mar 2023 02:54:02 -0400
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32V6EbfM031334; Fri, 31 Mar 2023 06:53:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=3E8XAZjhBHePBeLD/1SYR74ZmvuJ3DZ9yHkeaXxHeKU=;
 b=sbDDbjstLis78Zonksgauc3jk8oPazb1qiLwQMyGUigFF0kcskBISb4lWyREd0W1A1Ey
 D+Dg83H2fQyOHYeah56YJuZSRZ+BYThtz2IeB2Fo7dtcz7uf6vHs2tP2vDrSHDO6egfV
 Zyvl5JxVwtKFm+Sbgg9y+i9mv6wVqcBsOTf2Jesta/iYA/EkqRVbe93hIxbJavaOTtbY
 AGX33P0l3lTogqCOSEHPrfaYZ4IQNUoUZKy4ogZagrQipuCxircmXfyxO+m+9z2EdaQf
 j55BHtRU/FLKZZdW8ZeO9Pht+lPLeRHij5Dic7CcjSwRBqWFmNgtpvxovnBsp2AIoBjv Pg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pnt32ru15-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 31 Mar 2023 06:53:57 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32V6eMGK006396;
 Fri, 31 Mar 2023 06:53:57 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pnt32ru0t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 31 Mar 2023 06:53:56 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32V4fAgb008961;
 Fri, 31 Mar 2023 06:53:55 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
 by ppma02fra.de.ibm.com (PPS) with ESMTPS id 3phrk6wa3p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 31 Mar 2023 06:53:54 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com
 [10.20.54.101])
 by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 32V6rqWJ45679084
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 31 Mar 2023 06:53:52 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9296920043;
 Fri, 31 Mar 2023 06:53:52 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 70EF420040;
 Fri, 31 Mar 2023 06:53:51 +0000 (GMT)
Received: from li-1901474c-32f3-11b2-a85c-fc5ff2c001f3.ibm.com.com (unknown
 [9.43.10.55]) by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Fri, 31 Mar 2023 06:53:51 +0000 (GMT)
From: Harsh Prateek Bora <harshpb@linux.ibm.com>
To: qemu-ppc@nongnu.org
Cc: qemu-devel@nongnu.org, danielhb413@gmail.com
Subject: [PATCH 1/5] ppc: spapr: cleanup cr get/store with helper routines.
Date: Fri, 31 Mar 2023 12:23:40 +0530
Message-Id: <20230331065344.112341-2-harshpb@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230331065344.112341-1-harshpb@linux.ibm.com>
References: <20230331065344.112341-1-harshpb@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: T9IZFfA0B_qBD4GK1nrWz0wgX5iNt1MR
X-Proofpoint-GUID: OnM4UC9C_9sUPT-0SogGpK0h3D8i9a8o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-31_02,2023-03-30_04,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 mlxlogscore=947 impostorscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2303310053
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

The bits in cr reg are grouped into eight 4-bit fields represented
by env->crf[8] and the related calculations should be abstracted to
keep the calling routines simpler to read. This is a step towards
cleaning up the [h_enter|spapr_exit]_nested calls for better readability.

Signed-off-by: Harsh Prateek Bora <harshpb@linux.ibm.com>
---
 hw/ppc/spapr_hcall.c | 18 ++----------------
 target/ppc/cpu.c     | 17 +++++++++++++++++
 target/ppc/cpu.h     |  2 ++
 3 files changed, 21 insertions(+), 16 deletions(-)

diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
index ec4def62f8..124cee5e53 100644
--- a/hw/ppc/spapr_hcall.c
+++ b/hw/ppc/spapr_hcall.c
@@ -1566,8 +1566,6 @@ static target_ulong h_enter_nested(PowerPCCPU *cpu,
     struct kvmppc_hv_guest_state hv_state;
     struct kvmppc_pt_regs *regs;
     hwaddr len;
-    uint64_t cr;
-    int i;
 
     if (spapr->nested_ptcr == 0) {
         return H_NOT_AVAILABLE;
@@ -1616,12 +1614,7 @@ static target_ulong h_enter_nested(PowerPCCPU *cpu,
     env->lr = regs->link;
     env->ctr = regs->ctr;
     cpu_write_xer(env, regs->xer);
-
-    cr = regs->ccr;
-    for (i = 7; i >= 0; i--) {
-        env->crf[i] = cr & 15;
-        cr >>= 4;
-    }
+    ppc_store_cr(env, regs->ccr);
 
     env->msr = regs->msr;
     env->nip = regs->nip;
@@ -1698,8 +1691,6 @@ void spapr_exit_nested(PowerPCCPU *cpu, int excp)
     struct kvmppc_hv_guest_state *hvstate;
     struct kvmppc_pt_regs *regs;
     hwaddr len;
-    uint64_t cr;
-    int i;
 
     assert(spapr_cpu->in_nested);
 
@@ -1757,12 +1748,7 @@ void spapr_exit_nested(PowerPCCPU *cpu, int excp)
     regs->link = env->lr;
     regs->ctr = env->ctr;
     regs->xer = cpu_read_xer(env);
-
-    cr = 0;
-    for (i = 0; i < 8; i++) {
-        cr |= (env->crf[i] & 15) << (4 * (7 - i));
-    }
-    regs->ccr = cr;
+    regs->ccr = ppc_get_cr(env);
 
     if (excp == POWERPC_EXCP_MCHECK ||
         excp == POWERPC_EXCP_RESET ||
diff --git a/target/ppc/cpu.c b/target/ppc/cpu.c
index 1a97b41c6b..3b444e58b5 100644
--- a/target/ppc/cpu.c
+++ b/target/ppc/cpu.c
@@ -67,6 +67,23 @@ uint32_t ppc_get_vscr(CPUPPCState *env)
     return env->vscr | (sat << VSCR_SAT);
 }
 
+void ppc_store_cr(CPUPPCState *env, uint64_t cr)
+{
+    for (int i = 7; i >= 0; i--) {
+        env->crf[i] = cr & 15;
+        cr >>= 4;
+    }
+}
+
+uint64_t ppc_get_cr(CPUPPCState *env)
+{
+    uint64_t cr = 0;
+    for (int i = 0; i < 8; i++) {
+        cr |= (env->crf[i] & 15) << (4 * (7 - i));
+    }
+    return cr;
+}
+
 /* GDBstub can read and write MSR... */
 void ppc_store_msr(CPUPPCState *env, target_ulong value)
 {
diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 557d736dab..b4c21459f1 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -2773,6 +2773,8 @@ void dump_mmu(CPUPPCState *env);
 void ppc_maybe_bswap_register(CPUPPCState *env, uint8_t *mem_buf, int len);
 void ppc_store_vscr(CPUPPCState *env, uint32_t vscr);
 uint32_t ppc_get_vscr(CPUPPCState *env);
+void ppc_store_cr(CPUPPCState *env, uint64_t cr);
+uint64_t ppc_get_cr(CPUPPCState *env);
 
 /*****************************************************************************/
 /* Power management enable checks                                            */
-- 
2.31.1


