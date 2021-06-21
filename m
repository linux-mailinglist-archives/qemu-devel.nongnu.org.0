Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60D873AF897
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 00:33:53 +0200 (CEST)
Received: from localhost ([::1]:35668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvSUK-0001wO-Cs
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 18:33:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1lvST2-0008C5-Jr; Mon, 21 Jun 2021 18:32:32 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:52360)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1lvSSy-0002Fm-Me; Mon, 21 Jun 2021 18:32:32 -0400
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15LM3VOO079065; Mon, 21 Jun 2021 18:32:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : content-transfer-encoding
 : mime-version; s=pp1; bh=3oxkLdzLMiwGVR49MTM8vKjJttzgXQJKVHejqJ/kURA=;
 b=Bec7vUvkUgxSeVjO3eed1g/xdTINJHjCq8iAR/cbV/5lcyYj9c31BHTVY0d6grIR5x05
 s/bIzn9fyz8hnf352eWU8uPMxFR4um2Q6aFGm/xBewm6mxMlKziSSRnUujka/zHHgr8d
 k+hdxlmlhiMzmGNR1IafOZMbgJYTTX5GpoeDlO5Mk9XECiH/B0vDc25MSc9ceB14Oksb
 FwhB4CM5JfPxbHqUkOY6fRGJ5DVzLuE0jma/I/RxBTmfM/c4zDqGvo+rghaWA4S7WWxv
 jcjz9KsEDhiNNJyNCGE/jT78Fhb4fH0j7pKFIJzxVHb/IK/q1jNbukHLRWECcAgOHM+k Tg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39aufmqvcv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Jun 2021 18:32:26 -0400
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15LM4AlG083545;
 Mon, 21 Jun 2021 18:32:25 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39aufmqvc1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Jun 2021 18:32:25 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15LMQUNC014957;
 Mon, 21 Jun 2021 22:32:23 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma04ams.nl.ibm.com with ESMTP id 399878942k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Jun 2021 22:32:23 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15LMWKx918153820
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 21 Jun 2021 22:32:20 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EFE1B42176;
 Mon, 21 Jun 2021 22:32:19 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7C62A42175;
 Mon, 21 Jun 2021 22:32:19 +0000 (GMT)
Received: from vm.lan (unknown [9.145.39.144])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 21 Jun 2021 22:32:19 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Cornelia Huck <cohuck@redhat.com>
Subject: [PATCH v4 1/2] target/s390x: Fix SIGILL psw.addr reporting
Date: Tue, 22 Jun 2021 00:32:16 +0200
Message-Id: <20210621223217.3642303-2-iii@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210621223217.3642303-1-iii@linux.ibm.com>
References: <20210621223217.3642303-1-iii@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: rIorFxQO4H6kuzTiJUg94tj6JGBauYbd
X-Proofpoint-ORIG-GUID: wZThNnKrn3xZXwdb4WZdxCGGGOFiGaYD
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-21_13:2021-06-21,
 2021-06-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 clxscore=1015 mlxlogscore=999 malwarescore=0 mlxscore=0 impostorscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106210130
Received-SPF: pass client-ip=148.163.156.1; envelope-from=iii@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "jonathan . albrecht" <jonathan.albrecht@linux.vnet.ibm.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, qemu-devel@nongnu.org,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Andreas Krebbel <krebbel@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When a s390x CPU attempts to execute an illegal instruction, an
operation exception is recognized. This is a suppressing exception,
which means that the PSW is advanced by the length of the illegal
instruction.

On the real hardware or in qemu-system-s390x the kernel then raises
SIGILL with si_addr pointing to the suppressed instruction and
psw.addr containing the updated PSW.

Unfortunately qemu-s390x sets both to the address of the suppressed
instruction at the moment. Fix by sharing the PSW advancement logic
with qemu-system-s390x and setting si_addr to the address of the
instruction that raised the exception.

Sharing the PSW advancement logic means, however, that now the helpers
and the CPU loop must follow the hardware and the kernel a little bit
more strictly. In particular:

* Unmapped memory accesses should result in a translation rather than
  in an addressing exception.
* Protection exception must rewind psw.addr.
* Translation exception must cause a SIGSEGV.

While at it, also fix the handling of addressing and privileged
operation exceptions.

Buglink: https://gitlab.com/qemu-project/qemu/-/issues/319
Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
---
 linux-user/s390x/cpu_loop.c | 23 ++++++++++--
 target/s390x/excp_helper.c  | 71 ++++++++++++++++++++-----------------
 target/s390x/internal.h     |  1 +
 target/s390x/mem_helper.c   |  2 +-
 4 files changed, 60 insertions(+), 37 deletions(-)

diff --git a/linux-user/s390x/cpu_loop.c b/linux-user/s390x/cpu_loop.c
index f2d1215fb1..72ba9170ed 100644
--- a/linux-user/s390x/cpu_loop.c
+++ b/linux-user/s390x/cpu_loop.c
@@ -21,6 +21,7 @@
 #include "qemu-common.h"
 #include "qemu.h"
 #include "cpu_loop-common.h"
+#include "internal.h"
 
 /* s390x masks the fault address it reports in si_addr for SIGSEGV and SIGBUS */
 #define S390X_FAIL_ADDR_MASK -4096LL
@@ -29,6 +30,7 @@ void cpu_loop(CPUS390XState *env)
 {
     CPUState *cs = env_cpu(env);
     int trapnr, n, sig;
+    target_ulong excp_psw_addr;
     target_siginfo_t info;
     target_ulong addr;
     abi_long ret;
@@ -38,6 +40,7 @@ void cpu_loop(CPUS390XState *env)
         trapnr = cpu_exec(cs);
         cpu_exec_end(cs);
         process_queued_cpu_work(cs);
+        excp_psw_addr = env->psw.addr;
 
         switch (trapnr) {
         case EXCP_INTERRUPT:
@@ -66,15 +69,29 @@ void cpu_loop(CPUS390XState *env)
             n = TARGET_TRAP_BRKPT;
             goto do_signal_pc;
         case EXCP_PGM:
+            s390_cpu_program_interrupt_advance_psw(env);
             n = env->int_pgm_code;
             switch (n) {
             case PGM_OPERATION:
-            case PGM_PRIVILEGED:
                 sig = TARGET_SIGILL;
                 n = TARGET_ILL_ILLOPC;
                 goto do_signal_pc;
-            case PGM_PROTECTION:
+            case PGM_PRIVILEGED:
+                sig = TARGET_SIGILL;
+                n = TARGET_ILL_PRVOPC;
+                goto do_signal_pc;
             case PGM_ADDRESSING:
+                sig = TARGET_SIGILL;
+                n = TARGET_ILL_ILLADR;
+                goto do_signal_pc;
+            case PGM_PROTECTION:
+                /*
+                 * Protection exception handler is special: it is the only one
+                 * that rewinds psw.addr.
+                 */
+                env->psw.addr = excp_psw_addr;
+                /* FALL THROUGH */
+            case PGM_PAGE_TRANS:
                 sig = TARGET_SIGSEGV;
                 /* XXX: check env->error_code */
                 n = TARGET_SEGV_MAPERR;
@@ -131,7 +148,7 @@ void cpu_loop(CPUS390XState *env)
             break;
 
         do_signal_pc:
-            addr = env->psw.addr;
+            addr = excp_psw_addr;
         do_signal:
             info.si_signo = sig;
             info.si_errno = 0;
diff --git a/target/s390x/excp_helper.c b/target/s390x/excp_helper.c
index 20625c2c8f..4133e93978 100644
--- a/target/s390x/excp_helper.c
+++ b/target/s390x/excp_helper.c
@@ -82,6 +82,42 @@ void HELPER(data_exception)(CPUS390XState *env, uint32_t dxc)
     tcg_s390_data_exception(env, dxc, GETPC());
 }
 
+void s390_cpu_program_interrupt_advance_psw(CPUS390XState *env)
+{
+    switch (env->int_pgm_code) {
+    case PGM_PER:
+        if (env->per_perc_atmid & PER_CODE_EVENT_NULLIFICATION) {
+            break;
+        }
+        /* FALL THROUGH */
+    case PGM_OPERATION:
+    case PGM_PRIVILEGED:
+    case PGM_EXECUTE:
+    case PGM_PROTECTION:
+    case PGM_ADDRESSING:
+    case PGM_SPECIFICATION:
+    case PGM_DATA:
+    case PGM_FIXPT_OVERFLOW:
+    case PGM_FIXPT_DIVIDE:
+    case PGM_DEC_OVERFLOW:
+    case PGM_DEC_DIVIDE:
+    case PGM_HFP_EXP_OVERFLOW:
+    case PGM_HFP_EXP_UNDERFLOW:
+    case PGM_HFP_SIGNIFICANCE:
+    case PGM_HFP_DIVIDE:
+    case PGM_TRANS_SPEC:
+    case PGM_SPECIAL_OP:
+    case PGM_OPERAND:
+    case PGM_HFP_SQRT:
+    case PGM_PC_TRANS_SPEC:
+    case PGM_ALET_SPEC:
+    case PGM_MONITOR:
+        /* advance the PSW if our exception is not nullifying */
+        env->psw.addr += env->int_pgm_ilen;
+        break;
+    }
+}
+
 #if defined(CONFIG_USER_ONLY)
 
 void s390_cpu_do_interrupt(CPUState *cs)
@@ -95,7 +131,7 @@ bool s390_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
 {
     S390CPU *cpu = S390_CPU(cs);
 
-    trigger_pgm_exception(&cpu->env, PGM_ADDRESSING);
+    trigger_pgm_exception(&cpu->env, PGM_PAGE_TRANS);
     /* On real machines this value is dropped into LowMem.  Since this
        is userland, simply put this someplace that cpu_loop can find it.  */
     cpu->env.__excp_addr = address;
@@ -202,38 +238,7 @@ static void do_program_interrupt(CPUS390XState *env)
 
     assert(ilen == 2 || ilen == 4 || ilen == 6);
 
-    switch (env->int_pgm_code) {
-    case PGM_PER:
-        if (env->per_perc_atmid & PER_CODE_EVENT_NULLIFICATION) {
-            break;
-        }
-        /* FALL THROUGH */
-    case PGM_OPERATION:
-    case PGM_PRIVILEGED:
-    case PGM_EXECUTE:
-    case PGM_PROTECTION:
-    case PGM_ADDRESSING:
-    case PGM_SPECIFICATION:
-    case PGM_DATA:
-    case PGM_FIXPT_OVERFLOW:
-    case PGM_FIXPT_DIVIDE:
-    case PGM_DEC_OVERFLOW:
-    case PGM_DEC_DIVIDE:
-    case PGM_HFP_EXP_OVERFLOW:
-    case PGM_HFP_EXP_UNDERFLOW:
-    case PGM_HFP_SIGNIFICANCE:
-    case PGM_HFP_DIVIDE:
-    case PGM_TRANS_SPEC:
-    case PGM_SPECIAL_OP:
-    case PGM_OPERAND:
-    case PGM_HFP_SQRT:
-    case PGM_PC_TRANS_SPEC:
-    case PGM_ALET_SPEC:
-    case PGM_MONITOR:
-        /* advance the PSW if our exception is not nullifying */
-        env->psw.addr += ilen;
-        break;
-    }
+    s390_cpu_program_interrupt_advance_psw(env);
 
     qemu_log_mask(CPU_LOG_INT,
                   "%s: code=0x%x ilen=%d psw: %" PRIx64 " %" PRIx64 "\n",
diff --git a/target/s390x/internal.h b/target/s390x/internal.h
index 11515bb617..9f1665ccbf 100644
--- a/target/s390x/internal.h
+++ b/target/s390x/internal.h
@@ -272,6 +272,7 @@ bool s390_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
 void s390x_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
                                    MMUAccessType access_type,
                                    int mmu_idx, uintptr_t retaddr);
+void s390_cpu_program_interrupt_advance_psw(CPUS390XState *cpu);
 
 
 /* fpu_helper.c */
diff --git a/target/s390x/mem_helper.c b/target/s390x/mem_helper.c
index f6a7d29273..dff19cba60 100644
--- a/target/s390x/mem_helper.c
+++ b/target/s390x/mem_helper.c
@@ -147,7 +147,7 @@ static int s390_probe_access(CPUArchState *env, target_ulong addr, int size,
     flags = page_get_flags(addr);
     if (!(flags & (access_type == MMU_DATA_LOAD ?  PAGE_READ : PAGE_WRITE_ORG))) {
         env->__excp_addr = addr;
-        flags = (flags & PAGE_VALID) ? PGM_PROTECTION : PGM_ADDRESSING;
+        flags = (flags & PAGE_VALID) ? PGM_PROTECTION : PGM_PAGE_TRANS;
         if (nonfault) {
             return flags;
         }
-- 
2.31.1


