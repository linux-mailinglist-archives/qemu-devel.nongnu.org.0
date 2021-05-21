Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06A9738C599
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 13:23:34 +0200 (CEST)
Received: from localhost ([::1]:41368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lk3Fd-00068I-4f
	for lists+qemu-devel@lfdr.de; Fri, 21 May 2021 07:23:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1lk3Bb-0001p4-Gy; Fri, 21 May 2021 07:19:23 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:38624)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1lk3BW-0002wE-2a; Fri, 21 May 2021 07:19:23 -0400
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14LB2wbN087971; Fri, 21 May 2021 07:19:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : content-transfer-encoding
 : mime-version; s=pp1; bh=0g4EDmGF4OFQPQsPWy5sNATKbu6bT529mCg4NkUhXO4=;
 b=nF9v+QFrK473nvba1cxZDiwEkIICZMkusSymYYN4xm2FfacfcKyX46h5tXrI9Vlsp3me
 nGPVGamDGuuPUOhjLxE9gyj5jAmYqmRf35Gd1kU7z8EVXn+xX2RsxjNin4XLAXuk7cwd
 c0ex96NHFSesvllCal6gRwCJtgcjdcuOZNUftX1Zk8C3BdZo59GlGH70hr2d7DiFv93l
 JKGwH8PzdarCd3zwnVL6nKueEjV+KfEigYSEksN/qfq46Xj5KuIZjoCHkL9T8QxZ8giv
 OvYRK2EKCMELAiKekmcoL+SZ1WNah79Q4EjZI6XPcS5ardMohfvbdBKC5wEy3EiPIVDR SQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38p9kvux18-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 May 2021 07:19:16 -0400
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 14LB3t6V092157;
 Fri, 21 May 2021 07:19:16 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38p9kvux0p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 May 2021 07:19:16 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 14LB8B1U001794;
 Fri, 21 May 2021 11:19:14 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma04ams.nl.ibm.com with ESMTP id 38j5x8b3w5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 May 2021 11:19:14 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 14LBJBob45416936
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 21 May 2021 11:19:11 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 09A98AE05F;
 Fri, 21 May 2021 11:19:11 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9B944AE057;
 Fri, 21 May 2021 11:19:10 +0000 (GMT)
Received: from vm.lan (unknown [9.145.39.144])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 21 May 2021 11:19:10 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Cornelia Huck <cohuck@redhat.com>
Subject: [PATCH v2 1/2] target/s390x: Fix SIGILL psw.addr reporting
Date: Fri, 21 May 2021 13:19:07 +0200
Message-Id: <20210521111908.2843735-2-iii@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210521111908.2843735-1-iii@linux.ibm.com>
References: <20210521111908.2843735-1-iii@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: xnhQifvN3KbTk6W5o0nRWtJVyJy8_HbW
X-Proofpoint-ORIG-GUID: o_6_FsR3BmHJxoiPH-RWgjI4HJ_6R_62
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-21_04:2021-05-20,
 2021-05-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxlogscore=999
 impostorscore=0 suspectscore=0 clxscore=1015 bulkscore=0 adultscore=0
 priorityscore=1501 mlxscore=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105210069
Received-SPF: pass client-ip=148.163.158.5; envelope-from=iii@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

Buglink: https://gitlab.com/qemu-project/qemu/-/issues/319
Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
Reviewed-by: David Hildenbrand <david@redhat.com>
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


