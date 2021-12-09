Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A7CF46F230
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Dec 2021 18:37:05 +0100 (CET)
Received: from localhost ([::1]:35748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvNLs-0008AA-CU
	for lists+qemu-devel@lfdr.de; Thu, 09 Dec 2021 12:37:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1mvNJu-0006an-GR; Thu, 09 Dec 2021 12:35:02 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:46698
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1mvNJq-0003HL-H7; Thu, 09 Dec 2021 12:35:02 -0500
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B9HCGj6030974; 
 Thu, 9 Dec 2021 17:34:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=pp1;
 bh=eafw23upgUDI7+F39IUD/sU80yOjuW0qlQdb4ECYGfg=;
 b=fzxx9sHXBy9VAkigxyZbH/9UOzmBS+qyhIFphaoDI0sgmas7QuVHGzWj8Sf8/0iZ8Hhe
 K5tvYUe65MwarPyFaS7EaxmZeMMy/et5mRG5I4Ma84k3KKocvJzjzrEQNtflqJBc5hnT
 xqq0rw7KRiMoL3AcZ3U1lbnx92icnIKnIOEuNPg+pKataNLPTNY82xpRiIDpfwoWGHZz
 0ojbIsHmXYnNlFRq0DUqVUDagRxe57CotW5xlZASeg+7ykNWQgFIFA1fb/X3uTaNh3xe
 0imF2BGmvk0EWtIRzgsefoVqIOQYP+IUqWr9IYPc2moFIgTCDmEMLUjQY2rMyQjNSdvs yw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3cup018fnp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Dec 2021 17:34:49 +0000
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1B9HDPJJ001454;
 Thu, 9 Dec 2021 17:34:49 GMT
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3cup018fnc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Dec 2021 17:34:49 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1B9HYLaQ013246;
 Thu, 9 Dec 2021 17:34:48 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma02dal.us.ibm.com with ESMTP id 3cqyycppcj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Dec 2021 17:34:46 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1B9HXVaD27853112
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 9 Dec 2021 17:33:31 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E593CBE04F;
 Thu,  9 Dec 2021 17:33:30 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 20F61BE054;
 Thu,  9 Dec 2021 17:33:29 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.163.12.190])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu,  9 Dec 2021 17:33:28 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] Revert "target/ppc: Move SPR_DSISR setting to powerpc_excp"
Date: Thu,  9 Dec 2021 14:33:23 -0300
Message-Id: <20211209173323.2166642-1-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: L5B5USPJkkQVITnhCXmZ12FWpkd9N3tE
X-Proofpoint-ORIG-GUID: Cc4adecPQskmkp5ABaELbMKazgxqhqEW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-09_08,2021-12-08_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=755
 impostorscore=0 phishscore=0 mlxscore=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 adultscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112090091
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farosas@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: danielhb413@gmail.com, richard.henderson@linaro.org, qemu-ppc@nongnu.org,
 clg@kaod.org, philmd@redhat.com, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This reverts commit 336e91f85332dda0ede4c1d15b87a19a0fb898a2.

It breaks the --disable-tcg build:

 ../target/ppc/excp_helper.c:463:29: error: implicit declaration of
 function ‘cpu_ldl_code’ [-Werror=implicit-function-declaration]

We should not have TCG code in powerpc_excp because some kvm-only
routines use it indirectly to dispatch interrupts. See
kvm_handle_debug, spapr_mce_req_event and
spapr_do_system_reset_on_cpu.

We can re-introduce the change once we have split the interrupt
injection code between KVM and TCG.

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
---
 target/ppc/excp_helper.c | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index 17607adbe4..1c8b373078 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -454,15 +454,13 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp)
         break;
     }
     case POWERPC_EXCP_ALIGN:     /* Alignment exception                      */
+        /* Get rS/rD and rA from faulting opcode */
         /*
-         * Get rS/rD and rA from faulting opcode.
-         * Note: We will only invoke ALIGN for atomic operations,
-         * so all instructions are X-form.
+         * Note: the opcode fields will not be set properly for a
+         * direct store load/store, but nobody cares as nobody
+         * actually uses direct store segments.
          */
-        {
-            uint32_t insn = cpu_ldl_code(env, env->nip);
-            env->spr[SPR_DSISR] |= (insn & 0x03FF0000) >> 16;
-        }
+        env->spr[SPR_DSISR] |= (env->error_code & 0x03FF0000) >> 16;
         break;
     case POWERPC_EXCP_PROGRAM:   /* Program exception                        */
         switch (env->error_code & ~0xF) {
@@ -1461,6 +1459,11 @@ void ppc_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr,
                                  int mmu_idx, uintptr_t retaddr)
 {
     CPUPPCState *env = cs->env_ptr;
+    uint32_t insn;
+
+    /* Restore state and reload the insn we executed, for filling in DSISR.  */
+    cpu_restore_state(cs, retaddr, true);
+    insn = cpu_ldl_code(env, env->nip);
 
     switch (env->mmu_model) {
     case POWERPC_MMU_SOFT_4xx:
@@ -1477,8 +1480,8 @@ void ppc_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr,
     }
 
     cs->exception_index = POWERPC_EXCP_ALIGN;
-    env->error_code = 0;
-    cpu_loop_exit_restore(cs, retaddr);
+    env->error_code = insn & 0x03FF0000;
+    cpu_loop_exit(cs);
 }
 #endif /* CONFIG_TCG */
 #endif /* !CONFIG_USER_ONLY */
-- 
2.33.1


