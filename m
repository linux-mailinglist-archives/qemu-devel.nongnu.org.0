Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B13B0553515
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 16:59:35 +0200 (CEST)
Received: from localhost ([::1]:44396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3fLq-0000UC-NU
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 10:59:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1o3f5O-0003z9-Js
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 10:42:36 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:7854)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1o3f59-0006h9-H8
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 10:42:34 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25LEEW6g010299;
 Tue, 21 Jun 2022 14:42:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=xSAMTVU0c3HD1ZvHyf6K9wyzVblK+6qj+mQoc1iJyh4=;
 b=fekT6LvmXCMrUZ1Sk68KSKEPdPS4DG3XqOKJhriKZIYNkhtZ4YKWHCj7qhPUCA/ed30N
 DtTA6zW0na2J++ALa3xUph7Q/COqPsx6HtwnZJ1g2Ac8fKbNNfL9pqoIZFx9MKkb+D1n
 rWwhdXhHckO5MXr8BRvvUjJLXJwrO1expWe1Hk0vgUxMsTUsi76M856BZfTjnE4D1o6E
 efaep0CPo+zmsasSl1GVCzOtt0379lIIbA0Qlefod3rB7Fcn+acSgFpvpTQUSeLVwTe3
 +OooWl7SO6xt52+HOlE+RIwCk8sB5zu3ocSLWA1PbSQ4nA45TaRGfMAVsoB4GIpn5Gpq dA== 
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gufjxs2fu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Jun 2022 14:42:16 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 25LELJCI027725;
 Tue, 21 Jun 2022 14:42:14 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma04fra.de.ibm.com with ESMTP id 3gs6b8u9km-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Jun 2022 14:42:14 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 25LEgBKw23068932
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 21 Jun 2022 14:42:11 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E88A74C046;
 Tue, 21 Jun 2022 14:42:10 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7BF084C044;
 Tue, 21 Jun 2022 14:42:10 +0000 (GMT)
Received: from heavy.ibmuc.com (unknown [9.171.12.179])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 21 Jun 2022 14:42:10 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Laurent Vivier <laurent@vivier.eu>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Simon Hausmann <Simon.Hausmann@qt.io>, Chris Fallin <chris@cfallin.org>,
 Ulrich Weigand <ulrich.weigand@de.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v2] linux-user: Add partial support for MADV_DONTNEED
Date: Tue, 21 Jun 2022 16:42:05 +0200
Message-Id: <20220621144205.158452-1-iii@linux.ibm.com>
X-Mailer: git-send-email 2.35.3
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: GmkOA3c1KBUKdikGlz54lJrm7shhqtHc
X-Proofpoint-ORIG-GUID: GmkOA3c1KBUKdikGlz54lJrm7shhqtHc
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-21_07,2022-06-21_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 adultscore=0 clxscore=1015 mlxlogscore=999 priorityscore=1501 bulkscore=0
 malwarescore=0 impostorscore=0 mlxscore=0 phishscore=0 suspectscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206210063
Received-SPF: pass client-ip=148.163.158.5; envelope-from=iii@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Currently QEMU ignores madvise(MADV_DONTNEED), which break apps that
rely on this for zeroing out memory [1]. Improve the situation by doing
a passthrough when the range in question is a host-page-aligned
anonymous mapping.

This is based on the patches from Simon Hausmann [2] and Chris Fallin
[3]. The structure is taken from Simon's patch. The PAGE_MAP_ANONYMOUS
bits are superseded by commit 26bab757d41b ("linux-user: Introduce
PAGE_ANON"). In the end the patch acts like the one from Chris: we
either pass-through the entire syscall, or do nothing, since doing this
only partially would not help the affected applications much. Finally,
add some extra checks to match the behavior of the Linux kernel [4].

[1] https://gitlab.com/qemu-project/qemu/-/issues/326
[2] https://patchew.org/QEMU/20180827084037.25316-1-simon.hausmann@qt.io/
[3] https://github.com/bytecodealliance/wasmtime/blob/v0.37.0/ci/qemu-madvise.patch
[4] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/mm/madvise.c?h=v5.19-rc3#n1368

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
---

v1: https://lists.gnu.org/archive/html/qemu-devel/2022-06/msg03572.html
v1 -> v2:
* Make get_errno() extern.
* Simplify errno handling (Laurent).

 linux-user/mmap.c           | 64 +++++++++++++++++++++++++++++++++++++
 linux-user/syscall.c        |  8 ++---
 linux-user/user-internals.h |  1 +
 linux-user/user-mmap.h      |  1 +
 4 files changed, 68 insertions(+), 6 deletions(-)

diff --git a/linux-user/mmap.c b/linux-user/mmap.c
index 48e1373796..4e7a6be6ee 100644
--- a/linux-user/mmap.c
+++ b/linux-user/mmap.c
@@ -835,3 +835,67 @@ abi_long target_mremap(abi_ulong old_addr, abi_ulong old_size,
     mmap_unlock();
     return new_addr;
 }
+
+static bool can_passthrough_madv_dontneed(abi_ulong start, abi_ulong end)
+{
+    ulong addr;
+
+    if ((start | end) & ~qemu_host_page_mask) {
+        return false;
+    }
+
+    for (addr = start; addr < end; addr += TARGET_PAGE_SIZE) {
+        if (!(page_get_flags(addr) & PAGE_ANON)) {
+            return false;
+        }
+    }
+
+    return true;
+}
+
+abi_long target_madvise(abi_ulong start, abi_ulong len_in, int advice)
+{
+    abi_ulong len, end;
+    int ret = 0;
+
+    if (start & ~TARGET_PAGE_MASK) {
+        return -TARGET_EINVAL;
+    }
+    len = TARGET_PAGE_ALIGN(len_in);
+
+    if (len_in && !len) {
+        return -TARGET_EINVAL;
+    }
+
+    end = start + len;
+    if (end < start) {
+        return -TARGET_EINVAL;
+    }
+
+    if (end == start) {
+        return 0;
+    }
+
+    if (!guest_range_valid_untagged(start, len)) {
+        return -TARGET_EINVAL;
+    }
+
+    /*
+     * A straight passthrough may not be safe because qemu sometimes turns
+     * private file-backed mappings into anonymous mappings.
+     *
+     * This is a hint, so ignoring and returning success is ok.
+     *
+     * This breaks MADV_DONTNEED, completely implementing which is quite
+     * complicated. However, there is one low-hanging fruit: host-page-aligned
+     * anonymous mappings. In this case passthrough is safe, so do it.
+     */
+    mmap_lock();
+    if ((advice & MADV_DONTNEED) &&
+        can_passthrough_madv_dontneed(start, end)) {
+        ret = get_errno(madvise(g2h_untagged(start), len, MADV_DONTNEED));
+    }
+    mmap_unlock();
+
+    return ret;
+}
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index f55cdebee5..8f68f255c0 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -538,7 +538,7 @@ static inline int target_to_host_errno(int target_errno)
     }
 }
 
-static inline abi_long get_errno(abi_long ret)
+abi_long get_errno(abi_long ret)
 {
     if (ret == -1)
         return -host_to_target_errno(errno);
@@ -11807,11 +11807,7 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
 
 #ifdef TARGET_NR_madvise
     case TARGET_NR_madvise:
-        /* A straight passthrough may not be safe because qemu sometimes
-           turns private file-backed mappings into anonymous mappings.
-           This will break MADV_DONTNEED.
-           This is a hint, so ignoring and returning success is ok.  */
-        return 0;
+        return target_madvise(arg1, arg2, arg3);
 #endif
 #ifdef TARGET_NR_fcntl64
     case TARGET_NR_fcntl64:
diff --git a/linux-user/user-internals.h b/linux-user/user-internals.h
index 6175ce53db..0280e76add 100644
--- a/linux-user/user-internals.h
+++ b/linux-user/user-internals.h
@@ -65,6 +65,7 @@ abi_long do_syscall(CPUArchState *cpu_env, int num, abi_long arg1,
                     abi_long arg8);
 extern __thread CPUState *thread_cpu;
 G_NORETURN void cpu_loop(CPUArchState *env);
+abi_long get_errno(abi_long ret);
 const char *target_strerror(int err);
 int get_osversion(void);
 void init_qemu_uname_release(void);
diff --git a/linux-user/user-mmap.h b/linux-user/user-mmap.h
index d1dec99c02..480ce1c114 100644
--- a/linux-user/user-mmap.h
+++ b/linux-user/user-mmap.h
@@ -25,6 +25,7 @@ int target_munmap(abi_ulong start, abi_ulong len);
 abi_long target_mremap(abi_ulong old_addr, abi_ulong old_size,
                        abi_ulong new_size, unsigned long flags,
                        abi_ulong new_addr);
+abi_long target_madvise(abi_ulong start, abi_ulong len_in, int advice);
 extern unsigned long last_brk;
 extern abi_ulong mmap_next_start;
 abi_ulong mmap_find_vma(abi_ulong, abi_ulong, abi_ulong);
-- 
2.35.3


