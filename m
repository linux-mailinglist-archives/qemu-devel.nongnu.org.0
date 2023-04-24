Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C18E6ED09E
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 16:49:14 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqxTl-0006dw-U1; Mon, 24 Apr 2023 10:47:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <harshpb@linux.ibm.com>)
 id 1pqxTj-0006dM-Dl; Mon, 24 Apr 2023 10:47:43 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <harshpb@linux.ibm.com>)
 id 1pqxTh-0008Sk-Mp; Mon, 24 Apr 2023 10:47:43 -0400
Received: from pps.filterd (m0353728.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33OEiuZX009960; Mon, 24 Apr 2023 14:47:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=1rtnKa9ocZEMLYzritdpolZnQ+UtK6/jtCxvwaZ6/hk=;
 b=LRolTzaL9/oiin2Nb+79qEXNr3FaW3hgv8zo4+iFK3b4VnLtEg7966Vie4+aYFSb9Y6p
 OHAVvJIm8m4wPqcP6cyQY2hRN6zcKNUENqiXrnjPcUFGEcRMBGieINyzn/UBW6UGfvlK
 G5xWKKRJBfSeTM5vm/SUEYiRyoMFPqKF6RhGQcAJop6Y6hPFk8iBJuGS52WJxmqIHKg8
 Tcd4rdeL2mXZm5mRHSzYiVxjOrcOTdQC7g3nxFmYTPEBP5pVtv2cHdC8P40ifNqSWbXy
 qDw7CDNsNF/NX9oYA/aR56cV36qUPJpO6AGd3Xw1HDFpLBFRJzWwoBPLW1mNKxatXUVJ ZQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3q46m63tve-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Apr 2023 14:47:39 +0000
Received: from m0353728.ppops.net (m0353728.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 33OEbFxm015725;
 Mon, 24 Apr 2023 14:47:38 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3q46m63tsr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Apr 2023 14:47:38 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 33OEcCTm004691;
 Mon, 24 Apr 2023 14:47:34 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
 by ppma04fra.de.ibm.com (PPS) with ESMTPS id 3q47770yt6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Apr 2023 14:47:34 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com
 [10.20.54.101])
 by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 33OElVBs29557192
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 24 Apr 2023 14:47:31 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BFE9920043;
 Mon, 24 Apr 2023 14:47:31 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BC63F20040;
 Mon, 24 Apr 2023 14:47:29 +0000 (GMT)
Received: from li-1901474c-32f3-11b2-a85c-fc5ff2c001f3.ibm.com.com (unknown
 [9.43.92.123]) by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Mon, 24 Apr 2023 14:47:29 +0000 (GMT)
From: Harsh Prateek Bora <harshpb@linux.ibm.com>
To: qemu-ppc@nongnu.org
Cc: qemu-devel@nongnu.org, farosas@suse.de, npiggin@gmail.com,
 danielhb413@gmail.com
Subject: [PATCH v2 1/4] ppc: spapr: cleanup cr get/store in
 [h_enter|spapr_exit]_nested with helpers.
Date: Mon, 24 Apr 2023 20:17:09 +0530
Message-Id: <20230424144712.1985425-2-harshpb@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230424144712.1985425-1-harshpb@linux.ibm.com>
References: <20230424144712.1985425-1-harshpb@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: k-qhqtoEpBjpdza7QVcQSRYYyPPcriwv
X-Proofpoint-GUID: qu1FRDgS7dhOkFYL98Z03yP3EdInXo3K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-24_09,2023-04-21_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=951
 priorityscore=1501 mlxscore=0 spamscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 suspectscore=0 impostorscore=0 phishscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304240131
Received-SPF: pass client-ip=148.163.156.1; envelope-from=harshpb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
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

The bits in cr reg are grouped into eight 4-bit fields represented
by env->crf[8] and the related calculations should be abstracted to
keep the calling routines simpler to read. This is a step towards
cleaning up the [h_enter|spapr_exit]_nested calls for better readability.

Signed-off-by: Harsh Prateek Bora <harshpb@linux.ibm.com>
Reviewed-by: Fabiano Rosas <farosas@suse.de>
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


