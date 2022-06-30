Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20CD05620B9
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jun 2022 19:01:08 +0200 (CEST)
Received: from localhost ([::1]:42490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6xXO-0003na-PM
	for lists+qemu-devel@lfdr.de; Thu, 30 Jun 2022 13:01:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1o6xVb-0001zp-9G
 for qemu-devel@nongnu.org; Thu, 30 Jun 2022 12:59:15 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:48160)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1o6xVY-0006Ql-Mv
 for qemu-devel@nongnu.org; Thu, 30 Jun 2022 12:59:15 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25UGx66i017536;
 Thu, 30 Jun 2022 16:59:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=P8UFrr5gpUmRhjWQEDy6OwZzpQI7/SbyImIQYpU6Eyw=;
 b=pFmxnKqNMes8/GIE+3DQLWP+4UcI1aeZgfZE4Glyb7NanCkp3UnDvhjb5qyrTePmE/4c
 dXagHKu/DUybya/bWul14lirk2Be314pp45bbn9f3zDvmhqWl5d72dqylky6NjDLeNPJ
 lyY9UT0q6p2mJmqH0s+L335uPiAIvcMFRWPUmJHREvDA2jTT/dOclP7I7iEqn5lKAfwF
 VeIzZBVt0ombDrjBUczvYhFapHL1yozR+xqDQ+kXcMq9XhgzLAGlsp18ciXXNOBxxbho
 2XoQ1R39PkFzRmzuBIR4f+fgajopMsc2+B7UJimp0wpaOso3FeyUz1qik5f8Jzxr+uLO Cg== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3h1fu50017-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 30 Jun 2022 16:59:08 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 25UGoqvv004867;
 Thu, 30 Jun 2022 16:59:06 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma04ams.nl.ibm.com with ESMTP id 3gwt090fca-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 30 Jun 2022 16:59:06 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 25UGx3lC17629688
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 30 Jun 2022 16:59:03 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F3E914C044;
 Thu, 30 Jun 2022 16:59:02 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C3B424C040;
 Thu, 30 Jun 2022 16:59:02 +0000 (GMT)
Received: from heavy.ibmmodules.com (unknown [9.155.208.113])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 30 Jun 2022 16:59:02 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Laurent Vivier <laurent@vivier.eu>
Cc: qemu-devel@nongnu.org, Christian Borntraeger <borntraeger@de.ibm.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH] linux-user: Fix stracing in-memory mmap arguments
Date: Thu, 30 Jun 2022 18:59:01 +0200
Message-Id: <20220630165901.2459135-1-iii@linux.ibm.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: UZk7n1cPyswfEc4Q50Mawl_pFQhMj5H3
X-Proofpoint-GUID: UZk7n1cPyswfEc4Q50Mawl_pFQhMj5H3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-06-30_12,2022-06-28_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 lowpriorityscore=0 malwarescore=0 mlxscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 mlxlogscore=999 clxscore=1015
 bulkscore=0 suspectscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2204290000 definitions=main-2206300066
Received-SPF: pass client-ip=148.163.156.1; envelope-from=iii@linux.ibm.com;
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On some architectures mmap() arguments are passed via an in-memory
array, and qemu's strace support does not recognize that. Fix by
sharing the argument fetching logic between mmap() implementation and
tracing.

An alternative approach would be to fetch arguments only once at the
beginning of do_syscall(), however, that would change what the
qemu_plugin_register_vcpu_syscall_cb() users get.

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
---
 linux-user/mmap.c      | 20 ++++++++++++++++++++
 linux-user/strace.c    | 24 ++++++++++++++++++++----
 linux-user/syscall.c   | 25 +++----------------------
 linux-user/user-mmap.h | 12 ++++++++++++
 4 files changed, 55 insertions(+), 26 deletions(-)

diff --git a/linux-user/mmap.c b/linux-user/mmap.c
index 4e7a6be6ee..fbb50e3e98 100644
--- a/linux-user/mmap.c
+++ b/linux-user/mmap.c
@@ -899,3 +899,23 @@ abi_long target_madvise(abi_ulong start, abi_ulong len_in, int advice)
 
     return ret;
 }
+
+abi_long old_mmap_get_args(abi_long *arg1, abi_long *arg2, abi_long *arg3,
+                           abi_long *arg4, abi_long *arg5, abi_long *arg6)
+{
+    abi_long orig_arg1 = *arg1, *v;
+
+    v = lock_user(VERIFY_READ, orig_arg1, 6 * sizeof(abi_ulong), 1);
+    if (!v) {
+        return -TARGET_EFAULT;
+    }
+    *arg1 = tswapal(v[0]);
+    *arg2 = tswapal(v[1]);
+    *arg3 = tswapal(v[2]);
+    *arg4 = tswapal(v[3]);
+    *arg5 = tswapal(v[4]);
+    *arg6 = tswapal(v[5]);
+    unlock_user(v, orig_arg1, 0);
+
+    return 0;
+}
diff --git a/linux-user/strace.c b/linux-user/strace.c
index 7d882526da..f25195ae85 100644
--- a/linux-user/strace.c
+++ b/linux-user/strace.c
@@ -16,6 +16,7 @@
 #include <sched.h>
 #include "qemu.h"
 #include "user-internals.h"
+#include "user-mmap.h"
 #include "strace.h"
 
 struct syscallname {
@@ -3532,9 +3533,9 @@ print_utimensat(CPUArchState *cpu_env, const struct syscallname *name,
 
 #if defined(TARGET_NR_mmap) || defined(TARGET_NR_mmap2)
 static void
-print_mmap(CPUArchState *cpu_env, const struct syscallname *name,
-           abi_long arg0, abi_long arg1, abi_long arg2,
-           abi_long arg3, abi_long arg4, abi_long arg5)
+print_mmap2(CPUArchState *cpu_env, const struct syscallname *name,
+            abi_long arg0, abi_long arg1, abi_long arg2,
+            abi_long arg3, abi_long arg4, abi_long arg5)
 {
     print_syscall_prologue(name);
     print_pointer(arg0, 0);
@@ -3545,7 +3546,22 @@ print_mmap(CPUArchState *cpu_env, const struct syscallname *name,
     print_raw_param("%#x", arg5, 1);
     print_syscall_epilogue(name);
 }
-#define print_mmap2     print_mmap
+#endif
+
+#if defined(TARGET_NR_mmap)
+static void
+print_mmap(CPUArchState *cpu_env, const struct syscallname *name,
+           abi_long arg0, abi_long arg1, abi_long arg2,
+           abi_long arg3, abi_long arg4, abi_long arg5)
+{
+    if (mmap_get_args(&arg0, &arg1, &arg2, &arg3, &arg4, &arg5)) {
+        print_syscall_prologue(name);
+        print_pointer(arg0, 0);
+        print_syscall_epilogue(name);
+        return;
+    }
+    print_mmap2(cpu_env, name, arg0, arg1, arg2, arg3, arg4, arg5);
+}
 #endif
 
 #ifdef TARGET_NR_mprotect
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 669add74c1..00d4be9094 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -9917,33 +9917,14 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
         return ret;
 #ifdef TARGET_NR_mmap
     case TARGET_NR_mmap:
-#if (defined(TARGET_I386) && defined(TARGET_ABI32)) || \
-    (defined(TARGET_ARM) && defined(TARGET_ABI32)) || \
-    defined(TARGET_M68K) || defined(TARGET_CRIS) || defined(TARGET_MICROBLAZE) \
-    || defined(TARGET_S390X)
-        {
-            abi_ulong *v;
-            abi_ulong v1, v2, v3, v4, v5, v6;
-            if (!(v = lock_user(VERIFY_READ, arg1, 6 * sizeof(abi_ulong), 1)))
-                return -TARGET_EFAULT;
-            v1 = tswapal(v[0]);
-            v2 = tswapal(v[1]);
-            v3 = tswapal(v[2]);
-            v4 = tswapal(v[3]);
-            v5 = tswapal(v[4]);
-            v6 = tswapal(v[5]);
-            unlock_user(v, arg1, 0);
-            ret = get_errno(target_mmap(v1, v2, v3,
-                                        target_to_host_bitmask(v4, mmap_flags_tbl),
-                                        v5, v6));
+        ret = mmap_get_args(&arg1, &arg2, &arg3, &arg4, &arg5, &arg6);
+        if (ret) {
+            return ret;
         }
-#else
-        /* mmap pointers are always untagged */
         ret = get_errno(target_mmap(arg1, arg2, arg3,
                                     target_to_host_bitmask(arg4, mmap_flags_tbl),
                                     arg5,
                                     arg6));
-#endif
         return ret;
 #endif
 #ifdef TARGET_NR_mmap2
diff --git a/linux-user/user-mmap.h b/linux-user/user-mmap.h
index 480ce1c114..f48474bd1d 100644
--- a/linux-user/user-mmap.h
+++ b/linux-user/user-mmap.h
@@ -31,5 +31,17 @@ extern abi_ulong mmap_next_start;
 abi_ulong mmap_find_vma(abi_ulong, abi_ulong, abi_ulong);
 void mmap_fork_start(void);
 void mmap_fork_end(int child);
+abi_long old_mmap_get_args(abi_long *arg1, abi_long *arg2, abi_long *arg3,
+                           abi_long *arg4, abi_long *arg5, abi_long *arg6);
+
+#if (defined(TARGET_I386) && defined(TARGET_ABI32)) || \
+    (defined(TARGET_ARM) && defined(TARGET_ABI32)) || \
+    defined(TARGET_M68K) || defined(TARGET_CRIS) || \
+    defined(TARGET_MICROBLAZE) || defined(TARGET_S390X)
+/* __ARCH_WANT_SYS_OLD_MMAP */
+#define mmap_get_args old_mmap_get_args
+#else
+#define mmap_get_args(arg1, arg2, arg3, arg4, arg5, arg6) 0
+#endif
 
 #endif /* LINUX_USER_USER_MMAP_H */
-- 
2.35.3


