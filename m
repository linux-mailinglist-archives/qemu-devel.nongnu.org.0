Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7D936F54E5
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 11:37:45 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu8ul-000637-Ay; Wed, 03 May 2023 05:36:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <harshpb@linux.ibm.com>)
 id 1pu8ug-00061E-Rh; Wed, 03 May 2023 05:36:42 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <harshpb@linux.ibm.com>)
 id 1pu8ue-0008Bk-IC; Wed, 03 May 2023 05:36:42 -0400
Received: from pps.filterd (m0353723.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3439NWtT009236; Wed, 3 May 2023 09:36:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=r4ve6hdPKJzSy2AGgjoMVN1JUZ5KzhshIlJfT142M4M=;
 b=VrqpM1RwoTujzzlJwp+T3RkPQkTsHoro4s/sA8ZGk1X31FVGMA62pJCd6PUyewBhZbzU
 dfWpz1PX6GnG5DUgxnfsoc6zHrYXXi1Z7nlPPwp+TR9hQCf52Yr8FavYvasTbOIf4VbA
 z8Wf9ZyPKkJdSUgALLsffeujegwEFRiVO/lPs/8UYxlUuyYWZGfvixCL8QsZRs/vIeGW
 UZuiqduiaPeUogbED8yYQo2aS7ZgecJeIvKE+vQMDA76gYLSkbXcIvlWgKgpzSPj9mns
 o1FGmEOh7SldJdwYwRDwVxiFeHAG9bFeMPjLmn4tKrf/dWpquwM2Zue/YtPxXsoYkCcz jQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qbhjbdr7j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 May 2023 09:36:37 +0000
Received: from m0353723.ppops.net (m0353723.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3439Z8Zr028280;
 Wed, 3 May 2023 09:36:36 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qbhjbdr5f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 May 2023 09:36:36 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3436a5pi021302;
 Wed, 3 May 2023 09:36:34 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
 by ppma04ams.nl.ibm.com (PPS) with ESMTPS id 3q8tv6t3vw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 May 2023 09:36:34 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com
 [10.20.54.101])
 by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 3439aWCC52691282
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 3 May 2023 09:36:32 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 279782004E;
 Wed,  3 May 2023 09:36:32 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B12BD2004B;
 Wed,  3 May 2023 09:36:30 +0000 (GMT)
Received: from li-1901474c-32f3-11b2-a85c-fc5ff2c001f3.in.ibm.com (unknown
 [9.109.242.129])
 by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Wed,  3 May 2023 09:36:30 +0000 (GMT)
From: Harsh Prateek Bora <harshpb@linux.ibm.com>
To: qemu-ppc@nongnu.org
Cc: qemu-devel@nongnu.org, farosas@suse.de, npiggin@gmail.com,
 danielhb413@gmail.com
Subject: [PATCH v3 1/2] ppc: spapr: cleanup cr get/set with helpers.
Date: Wed,  3 May 2023 15:06:18 +0530
Message-Id: <20230503093619.2530487-2-harshpb@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230503093619.2530487-1-harshpb@linux.ibm.com>
References: <20230503093619.2530487-1-harshpb@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: JKu_VmNK6qMOG5CFv6cmOEDVjeq8DLWZ
X-Proofpoint-GUID: Us8aF6i85SW2Tt1IkeqTAEoccZvjf2VJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-03_05,2023-04-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0
 bulkscore=0 adultscore=0 mlxlogscore=999 suspectscore=0 clxscore=1015
 mlxscore=0 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2305030075
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

The bits in cr reg are grouped into eight 4-bit fields represented
by env->crf[8] and the related calculations should be abstracted to
keep the calling routines simpler to read. This is a step towards
cleaning up the related/calling code for better readability.

Signed-off-by: Harsh Prateek Bora <harshpb@linux.ibm.com>
Reviewed-by: Fabiano Rosas <farosas@suse.de>
---
 hw/ppc/spapr_hcall.c      | 18 ++----------------
 linux-user/elfload.c      |  4 +---
 linux-user/ppc/signal.c   |  9 ++-------
 target/ppc/cpu.c          | 17 +++++++++++++++++
 target/ppc/cpu.h          |  2 ++
 target/ppc/gdbstub.c      | 22 ++++------------------
 target/ppc/kvm.c          | 13 ++-----------
 target/ppc/ppc-qmp-cmds.c |  6 +-----
 8 files changed, 31 insertions(+), 60 deletions(-)

diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
index ec4def62f8..1c102c8c0d 100644
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
+    ppc_set_cr(env, regs->ccr);
 
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
diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index f1370a7a8b..703f7434a0 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -961,9 +961,7 @@ static void elf_core_copy_regs(target_elf_gregset_t *regs, const CPUPPCState *en
     (*regs)[36] = tswapreg(env->lr);
     (*regs)[37] = tswapreg(cpu_read_xer(env));
 
-    for (i = 0; i < ARRAY_SIZE(env->crf); i++) {
-        ccr |= env->crf[i] << (32 - ((i + 1) * 4));
-    }
+    ccr = ppc_get_cr(env);
     (*regs)[38] = tswapreg(ccr);
 }
 
diff --git a/linux-user/ppc/signal.c b/linux-user/ppc/signal.c
index 07729c1653..a616f20efb 100644
--- a/linux-user/ppc/signal.c
+++ b/linux-user/ppc/signal.c
@@ -243,9 +243,7 @@ static void save_user_regs(CPUPPCState *env, struct target_mcontext *frame)
     __put_user(env->lr, &frame->mc_gregs[TARGET_PT_LNK]);
     __put_user(cpu_read_xer(env), &frame->mc_gregs[TARGET_PT_XER]);
 
-    for (i = 0; i < ARRAY_SIZE(env->crf); i++) {
-        ccr |= env->crf[i] << (32 - ((i + 1) * 4));
-    }
+    ccr = ppc_get_cr(env);
     __put_user(ccr, &frame->mc_gregs[TARGET_PT_CCR]);
 
     /* Save Altivec registers if necessary.  */
@@ -335,10 +333,7 @@ static void restore_user_regs(CPUPPCState *env,
     cpu_write_xer(env, xer);
 
     __get_user(ccr, &frame->mc_gregs[TARGET_PT_CCR]);
-    for (i = 0; i < ARRAY_SIZE(env->crf); i++) {
-        env->crf[i] = (ccr >> (32 - ((i + 1) * 4))) & 0xf;
-    }
-
+    ppc_set_cr(env, ccr);
     if (!sig) {
         env->gpr[2] = save_r2;
     }
diff --git a/target/ppc/cpu.c b/target/ppc/cpu.c
index 1a97b41c6b..241d9e27e5 100644
--- a/target/ppc/cpu.c
+++ b/target/ppc/cpu.c
@@ -67,6 +67,23 @@ uint32_t ppc_get_vscr(CPUPPCState *env)
     return env->vscr | (sat << VSCR_SAT);
 }
 
+void ppc_set_cr(CPUPPCState *env, uint64_t cr)
+{
+    for (int i = 7; i >= 0; i--) {
+        env->crf[i] = cr & 0xf;
+        cr >>= 4;
+    }
+}
+
+uint64_t ppc_get_cr(CPUPPCState *env)
+{
+    uint64_t cr = 0;
+    for (int i = 0; i < 8; i++) {
+        cr |= (env->crf[i] & 0xf) << (4 * (7 - i));
+    }
+    return cr;
+}
+
 /* GDBstub can read and write MSR... */
 void ppc_store_msr(CPUPPCState *env, target_ulong value)
 {
diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 557d736dab..0af94170d0 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -2773,6 +2773,8 @@ void dump_mmu(CPUPPCState *env);
 void ppc_maybe_bswap_register(CPUPPCState *env, uint8_t *mem_buf, int len);
 void ppc_store_vscr(CPUPPCState *env, uint32_t vscr);
 uint32_t ppc_get_vscr(CPUPPCState *env);
+void ppc_set_cr(CPUPPCState *env, uint64_t cr);
+uint64_t ppc_get_cr(CPUPPCState *env);
 
 /*****************************************************************************/
 /* Power management enable checks                                            */
diff --git a/target/ppc/gdbstub.c b/target/ppc/gdbstub.c
index d2bc1d7c53..63c9abe4f1 100644
--- a/target/ppc/gdbstub.c
+++ b/target/ppc/gdbstub.c
@@ -145,11 +145,7 @@ int ppc_cpu_gdb_read_register(CPUState *cs, GByteArray *buf, int n)
             break;
         case 66:
             {
-                uint32_t cr = 0;
-                int i;
-                for (i = 0; i < 8; i++) {
-                    cr |= env->crf[i] << (32 - ((i + 1) * 4));
-                }
+                uint32_t cr = ppc_get_cr(env);
                 gdb_get_reg32(buf, cr);
                 break;
             }
@@ -203,11 +199,7 @@ int ppc_cpu_gdb_read_register_apple(CPUState *cs, GByteArray *buf, int n)
             break;
         case 66 + 32:
             {
-                uint32_t cr = 0;
-                int i;
-                for (i = 0; i < 8; i++) {
-                    cr |= env->crf[i] << (32 - ((i + 1) * 4));
-                }
+                uint32_t cr = ppc_get_cr(env);
                 gdb_get_reg32(buf, cr);
                 break;
             }
@@ -257,10 +249,7 @@ int ppc_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
         case 66:
             {
                 uint32_t cr = ldl_p(mem_buf);
-                int i;
-                for (i = 0; i < 8; i++) {
-                    env->crf[i] = (cr >> (32 - ((i + 1) * 4))) & 0xF;
-                }
+                ppc_set_cr(env, cr);
                 break;
             }
         case 67:
@@ -307,10 +296,7 @@ int ppc_cpu_gdb_write_register_apple(CPUState *cs, uint8_t *mem_buf, int n)
         case 66 + 32:
             {
                 uint32_t cr = ldl_p(mem_buf);
-                int i;
-                for (i = 0; i < 8; i++) {
-                    env->crf[i] = (cr >> (32 - ((i + 1) * 4))) & 0xF;
-                }
+                ppc_set_cr(env, cr);
                 break;
             }
         case 67 + 32:
diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
index 78f6fc50cd..336e663bc3 100644
--- a/target/ppc/kvm.c
+++ b/target/ppc/kvm.c
@@ -927,10 +927,7 @@ int kvm_arch_put_registers(CPUState *cs, int level)
         regs.gpr[i] = env->gpr[i];
     }
 
-    regs.cr = 0;
-    for (i = 0; i < 8; i++) {
-        regs.cr |= (env->crf[i] & 15) << (4 * (7 - i));
-    }
+    regs.cr = ppc_get_cr(env);
 
     ret = kvm_vcpu_ioctl(cs, KVM_SET_REGS, &regs);
     if (ret < 0) {
@@ -1205,7 +1202,6 @@ int kvm_arch_get_registers(CPUState *cs)
     PowerPCCPU *cpu = POWERPC_CPU(cs);
     CPUPPCState *env = &cpu->env;
     struct kvm_regs regs;
-    uint32_t cr;
     int i, ret;
 
     ret = kvm_vcpu_ioctl(cs, KVM_GET_REGS, &regs);
@@ -1213,12 +1209,7 @@ int kvm_arch_get_registers(CPUState *cs)
         return ret;
     }
 
-    cr = regs.cr;
-    for (i = 7; i >= 0; i--) {
-        env->crf[i] = cr & 15;
-        cr >>= 4;
-    }
-
+    ppc_set_cr(env, regs.cr);
     env->ctr = regs.ctr;
     env->lr = regs.lr;
     cpu_write_xer(env, regs.xer);
diff --git a/target/ppc/ppc-qmp-cmds.c b/target/ppc/ppc-qmp-cmds.c
index 36e5b5eff8..f9acc21056 100644
--- a/target/ppc/ppc-qmp-cmds.c
+++ b/target/ppc/ppc-qmp-cmds.c
@@ -37,12 +37,8 @@ static target_long monitor_get_ccr(Monitor *mon, const struct MonitorDef *md,
 {
     CPUArchState *env = mon_get_cpu_env(mon);
     unsigned int u;
-    int i;
 
-    u = 0;
-    for (i = 0; i < 8; i++) {
-        u |= env->crf[i] << (32 - (4 * (i + 1)));
-    }
+    u = ppc_get_cr(env);
 
     return u;
 }
-- 
2.31.1


