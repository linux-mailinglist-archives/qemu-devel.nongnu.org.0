Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9236455971F
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 11:57:53 +0200 (CEST)
Received: from localhost ([::1]:45732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4g4W-00040N-Jq
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 05:57:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1o4fwn-0002wH-Pq
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 05:49:57 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:36559)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1o4fwk-0001aw-On
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 05:49:53 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue009
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MoNy4-1nKNov3W5Q-00onNX; Fri, 24
 Jun 2022 11:49:46 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>,
	Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PULL 2/3] linux-user: Add partial support for MADV_DONTNEED
Date: Fri, 24 Jun 2022 11:49:42 +0200
Message-Id: <20220624094943.729568-3-laurent@vivier.eu>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220624094943.729568-1-laurent@vivier.eu>
References: <20220624094943.729568-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:4HgF63GJ+EfhK442y+27a+Vgd80zRqW6kDXoCeWB9KSyoqmfDqc
 0FvDo8Ojdxu61+/4bOkKVkMotwHsmrjT4ykZusKP3FOZ8UCL7domflScB1fb9GFoERHvA3u
 EITOiVWmSaKF9+ChmP3d1ziAdiCtrolJjrmeWP5S+MOuVpPWgfyjt5MZelpHWq3QVFrn5GZ
 6rFF0z+AU7TE+aNZip0UA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:/okCK9ar2RM=:xxD7NYbUOz/KBVgKzZ29QN
 Q5cR9amlmLpNbUubPhE6+hchMt1fPsAXpetVsk+rlQ+Qhj1WVo+Pysc+maQe7ON/QK/Q7flFt
 jYeZWCSjbC61UP4llZR7Ky5YgcYaaIRPVcHKZaZNf3RDdAqJXmriFpXjZ7Byxr4rVnCxqKQAp
 /8ZqfQnZ8yejoFjnY78qD7k9PIYBeyWWL3Pi0ngFF6YBjKP7M+MfUlsRt6PDNSCG5vtZiRg8A
 jw4Sme5gSNknHUYwK6rWG4M19H3bcEhBgVAkjEFRYSqAXEBvqBXT4bxAvYWxNXaMylQblT3su
 jTB6t1ocs34UqjczNzjFZV1lZY1Bt4svYv4kK3lBKSYyLdUX276ivvB8Zslmuft9JgzM7f1gh
 aDjXbV216kbsnpUP1gDFj1ZkoBp4YL+CJftVMLJgM787ovj5aQvWIRdnrCFZidhPsVPo+31o8
 QX/9D8f5FtH3E4kawjUUMMJzRx+noAc2nnEYUOMdI45SZ8/Hq6Z037GV/+K0ZbeThuJjzGaUn
 1ewLw6DGp1yUVAJI+WY7Ywdqp20K7v/qHQazYJn1KlE42ZnEPS4i+PxdQ93RX1bjQvQObDOQ3
 kaumqd86Y7TlwxEbbPdq4aMaUSrlVDXZl9KJvUJgzNTNzmOgVvDTRvDvocfsuRHdkkJpJdoDv
 F/wkQfesIXHitt6LxKfuxn31lmFTJVpZ3QRN7C4s68jrVqAeoD3zP+NMvud0EOur8SavdmxWq
 Xgh95S7h+XeyaiQUlXNFN42hnjYd7dA90C9K+w==
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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

From: Ilya Leoshkevich <iii@linux.ibm.com>

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
Message-Id: <20220621144205.158452-1-iii@linux.ibm.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/mmap.c           | 64 +++++++++++++++++++++++++++++++++++++
 linux-user/syscall.c        |  8 ++---
 linux-user/user-internals.h |  1 +
 linux-user/user-mmap.h      |  1 +
 4 files changed, 68 insertions(+), 6 deletions(-)

diff --git a/linux-user/mmap.c b/linux-user/mmap.c
index 48e13737962a..4e7a6be6ee19 100644
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
index f55cdebee5ab..8f68f255c0d9 100644
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
index 6175ce53dbd6..0280e76addda 100644
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
index d1dec99c0249..480ce1c11487 100644
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
2.36.1


