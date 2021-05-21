Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1405938BCD8
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 05:06:04 +0200 (CEST)
Received: from localhost ([::1]:49072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljvUB-0000ru-4a
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 23:06:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1ljvQG-0004uC-0H; Thu, 20 May 2021 23:02:01 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:59424)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1ljvQD-0005TU-D0; Thu, 20 May 2021 23:01:59 -0400
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14L31KhU087426; Thu, 20 May 2021 23:01:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : content-transfer-encoding
 : mime-version; s=pp1; bh=22m50fiSLeBHOdZdA4sQ34246OSA3gzmLME2W4y6lqs=;
 b=rx3v4byQPTTxUJenD4s+vZSlrFF6k3cKDkdQPyPDk4eoP9n+YY25W3W81WUdUqTBNS7H
 ceSH//5IuBueKTq0PFKIbofUpbQM26oL5yH30wtoVP6Gs5U3pSej+0ond4bM9LuPu57Q
 Vp+12m65FxKjc0mZKqIfZR6NNS5yXSoAeUxHOD1uBJClklQNIvxqcDX2HGLp3BkJsCyN
 5HMH578sZ9RFcjXlYlnzjQcICQK5UvNodJHu2DiQIbnRPdXKaKsqzeicwZyoMTZAo/sg
 3kOlnaUvIsMU+frS/DXA5JB2fOpaGDi5YDUEsSVyyXxCdGrR5zx/qXrmF0sY/cN0+SLm Aw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38p4kfr0ew-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 May 2021 23:01:54 -0400
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 14L31dvH089420;
 Thu, 20 May 2021 23:01:54 -0400
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38p4kfr0dy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 May 2021 23:01:54 -0400
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 14L2qUXg000544;
 Fri, 21 May 2021 03:01:52 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma06fra.de.ibm.com with ESMTP id 38j5jh1md5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 May 2021 03:01:51 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 14L31mkD42074522
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 21 May 2021 03:01:48 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B2F31A404D;
 Fri, 21 May 2021 03:01:48 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4F398A4040;
 Fri, 21 May 2021 03:01:48 +0000 (GMT)
Received: from vm.lan (unknown [9.145.39.144])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 21 May 2021 03:01:48 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH 1/2] target/s390x: Fix SIGILL psw.addr reporting
Date: Fri, 21 May 2021 05:01:45 +0200
Message-Id: <20210521030146.2831663-2-iii@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210521030146.2831663-1-iii@linux.ibm.com>
References: <20210521030146.2831663-1-iii@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: N30MkflzXhlATIMVWW26-vlBhCcbTmgk
X-Proofpoint-GUID: 8cVdPEWST42dXcjU1dIX8SSbx9zHCaDM
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-21_02:2021-05-20,
 2021-05-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 phishscore=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 bulkscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105210017
Received-SPF: pass client-ip=148.163.156.1; envelope-from=iii@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org, Ilya Leoshkevich <iii@linux.ibm.com>,
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

Buglink: https://bugs.launchpad.net/qemu/+bug/1920913
Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
---
 linux-user/s390x/cpu_loop.c |  6 +++-
 target/s390x/excp_helper.c  | 69 ++++++++++++++++++++-----------------
 target/s390x/internal.h     |  1 +
 3 files changed, 43 insertions(+), 33 deletions(-)

diff --git a/linux-user/s390x/cpu_loop.c b/linux-user/s390x/cpu_loop.c
index f2d1215fb1..6f5462d4f8 100644
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
@@ -66,6 +69,7 @@ void cpu_loop(CPUS390XState *env)
             n = TARGET_TRAP_BRKPT;
             goto do_signal_pc;
         case EXCP_PGM:
+            s390_cpu_program_interrupt_advance_psw(env);
             n = env->int_pgm_code;
             switch (n) {
             case PGM_OPERATION:
@@ -131,7 +135,7 @@ void cpu_loop(CPUS390XState *env)
             break;
 
         do_signal_pc:
-            addr = env->psw.addr;
+            addr = excp_psw_addr;
         do_signal:
             info.si_signo = sig;
             info.si_errno = 0;
diff --git a/target/s390x/excp_helper.c b/target/s390x/excp_helper.c
index 20625c2c8f..0a323967ae 100644
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
-- 
2.31.1


