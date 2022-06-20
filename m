Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D5C0552720
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 00:51:29 +0200 (CEST)
Received: from localhost ([::1]:51986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3QEx-0003IV-N2
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 18:51:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1o3QDU-0002bN-Ld
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 18:49:56 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:55172)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1o3QDP-0002Wq-Un
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 18:49:56 -0400
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25KMLrE9000954;
 Mon, 20 Jun 2022 22:49:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=5Q+l/njBcij0fIkhO0w6QhI7etk3UxXa8/TiIKQ2ePs=;
 b=REBowLrPkezGyor2ty0amQBeoQui/BQJmxUorj5JHqmS1E1D5W1vOrIFwOvxWw8f0lzw
 pdTr7HWFKDrGXzMDUBBiDgEyI8qZ4GbHveXAONiLSgRHt5l1eFQetC6ss020UgMWQYsr
 rqJJns9J/vZewErBFsOrO5UYOUv8ecHzZS5KbHY+EeWxty1ErGfHsgQjnkURk7wtA+dt
 9lLkPY1wlXtGcED1bcJohzFQCXxb2Wuojiz7YAJZkYcFhuw5t97yEgVB90c7bhE5iWQA
 Ur6CT9kdcPISVaocmBosnz1m83u4XlvZ4EnsNtdFdmexoyPZEq0jE5eu2ObaetCE5/su fA== 
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gu1mdgdfx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Jun 2022 22:49:43 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 25KMbpSA013315;
 Mon, 20 Jun 2022 22:49:41 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma04fra.de.ibm.com with ESMTP id 3gs6b8tdjm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Jun 2022 22:49:41 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 25KMncmI18481622
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 20 Jun 2022 22:49:38 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 36879A404D;
 Mon, 20 Jun 2022 22:49:38 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BF90FA4040;
 Mon, 20 Jun 2022 22:49:37 +0000 (GMT)
Received: from heavy.ibmuc.com (unknown [9.171.12.179])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 20 Jun 2022 22:49:37 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Laurent Vivier <laurent@vivier.eu>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Simon Hausmann <Simon.Hausmann@qt.io>, Chris Fallin <chris@cfallin.org>,
 Ulrich Weigand <ulrich.weigand@de.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH] linux-user: Add partial support for MADV_DONTNEED
Date: Tue, 21 Jun 2022 00:49:36 +0200
Message-Id: <20220620224936.52623-1-iii@linux.ibm.com>
X-Mailer: git-send-email 2.35.3
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: dWGJMToRCZdYoKaSp5BynDZuRqNJmAIy
X-Proofpoint-ORIG-GUID: dWGJMToRCZdYoKaSp5BynDZuRqNJmAIy
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-20_06,2022-06-17_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0
 malwarescore=0 bulkscore=0 clxscore=1011 mlxscore=0 mlxlogscore=999
 spamscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206200101
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
---
 linux-user/mmap.c      | 68 ++++++++++++++++++++++++++++++++++++++++++
 linux-user/syscall.c   |  6 +---
 linux-user/user-mmap.h |  1 +
 3 files changed, 70 insertions(+), 5 deletions(-)

diff --git a/linux-user/mmap.c b/linux-user/mmap.c
index 48e1373796..900df7b28c 100644
--- a/linux-user/mmap.c
+++ b/linux-user/mmap.c
@@ -835,3 +835,71 @@ abi_long target_mremap(abi_ulong old_addr, abi_ulong old_size,
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
+int target_madvise(abi_ulong start, abi_ulong len_in, int advice)
+{
+    abi_ulong len, end;
+    int ret = 0;
+
+    if (start & ~TARGET_PAGE_MASK) {
+        errno = EINVAL;
+        return -1;
+    }
+    len = TARGET_PAGE_ALIGN(len_in);
+
+    if (len_in && !len) {
+        errno = EINVAL;
+        return -1;
+    }
+
+    end = start + len;
+    if (end < start) {
+        errno = EINVAL;
+        return -1;
+    }
+
+    if (end == start) {
+        return 0;
+    }
+
+    if (!guest_range_valid_untagged(start, len)) {
+        errno = EINVAL;
+        return -1;
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
+        ret = madvise(g2h_untagged(start), len, MADV_DONTNEED);
+    }
+    mmap_unlock();
+
+    return ret;
+}
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index f55cdebee5..d25759b992 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -11807,11 +11807,7 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
 
 #ifdef TARGET_NR_madvise
     case TARGET_NR_madvise:
-        /* A straight passthrough may not be safe because qemu sometimes
-           turns private file-backed mappings into anonymous mappings.
-           This will break MADV_DONTNEED.
-           This is a hint, so ignoring and returning success is ok.  */
-        return 0;
+        return get_errno(target_madvise(arg1, arg2, arg3));
 #endif
 #ifdef TARGET_NR_fcntl64
     case TARGET_NR_fcntl64:
diff --git a/linux-user/user-mmap.h b/linux-user/user-mmap.h
index d1dec99c02..41cd358c7a 100644
--- a/linux-user/user-mmap.h
+++ b/linux-user/user-mmap.h
@@ -25,6 +25,7 @@ int target_munmap(abi_ulong start, abi_ulong len);
 abi_long target_mremap(abi_ulong old_addr, abi_ulong old_size,
                        abi_ulong new_size, unsigned long flags,
                        abi_ulong new_addr);
+int target_madvise(abi_ulong start, abi_ulong len_in, int advice);
 extern unsigned long last_brk;
 extern abi_ulong mmap_next_start;
 abi_ulong mmap_find_vma(abi_ulong, abi_ulong, abi_ulong);
-- 
2.35.3


