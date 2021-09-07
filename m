Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 958A9403118
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 00:32:38 +0200 (CEST)
Received: from localhost ([::1]:38822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNjdt-00050p-MK
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 18:32:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mNj2q-0006jE-C7
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 17:54:20 -0400
Received: from mail-io1-xd43.google.com ([2607:f8b0:4864:20::d43]:34628)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mNj2n-0001CV-II
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 17:54:20 -0400
Received: by mail-io1-xd43.google.com with SMTP id y18so492446ioc.1
 for <qemu-devel@nongnu.org>; Tue, 07 Sep 2021 14:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qx/VzLtbsVoiAcayWvMx8RQL5UeVXBQwPj1coyekThM=;
 b=VGLZ7DGKxvtjioO5IP71VJmWJ6s3uT6Fpimy3ztJijEtpvw4ReoxJLx5X+zObOlXy9
 7eXex8zpKxEsUGruFQiy4W7TwMVic9xOEEh7IlrRTNxo/hCPk4TFIzLMuxyigLwSOH3K
 sehwn+42sMZ0n2B+wh+nocjlSsiEC+ZmeY3QQlUynKup0p+an4jULY6p6Y3I+piWugeG
 YHe+zLiDnQKFtXcnWh824yvfCZi2kjZsrG9/6ToZTETRz7CvBN3iu1y7kgLLAmkvJRIK
 OXhd1cz7cbbIUnrUwot+gjx/XstveznyDA/G60j7LmeLEnV+9nDUTSP8JjmYc7rM/Z1g
 cboA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qx/VzLtbsVoiAcayWvMx8RQL5UeVXBQwPj1coyekThM=;
 b=Mfy+WanOBIZIMU7OO6heoQ21SHPB+4EZKHJpdKpiidYBZXkWXecfpy+xNhpEfrWDD+
 Q+WKO1OTmPCASlYbn0vIfv8w/fVAvaqqW6XQ+7EbGD/41jSW+9a+YxnPaDx9TlVA/pVD
 xEV4VHEBLjemWVnxPkuLE0OybaA8zYhQ6XgiQ+6krZBGaXM6Mt/QOw4GGYkxvdXSTGjZ
 vg3ZKmypWZ9tdNZBke9YA52qVjQj7zGnNQ/6DOkgANybtCO6jaCtEHZrrzZv8lLL3/02
 k5M03U5DvR+n5ZgZUMu1FYZlGEogRBj6N5kzyqmZR7M8kionMeKevu/28Q/Vw1CXUstM
 QaAw==
X-Gm-Message-State: AOAM533+URzNRDhURWZCxeLBKM/DrikOpf3QoSnJyQI+geNayBzx647i
 1J7TNvpuinwygiHIRGgjt9JZsPoCQgCig9XZBO8=
X-Google-Smtp-Source: ABdhPJxax/xCEW64Ifv5txff+qjdV0IvPqfErvyoc1OvP72/3mRTblx1FVmfqFDRPN/SXBR2+WPaDw==
X-Received: by 2002:a6b:c80f:: with SMTP id y15mr306657iof.80.1631051656140;
 Tue, 07 Sep 2021 14:54:16 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id t17sm192477iln.24.2021.09.07.14.54.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Sep 2021 14:54:15 -0700 (PDT)
From: imp@bsdimp.com
To: qemu-devel@nongnu.org
Subject: [PULL 42/42] bsd-user: Update mapping to handle reserved and starting
 conditions
Date: Tue,  7 Sep 2021 15:53:32 -0600
Message-Id: <20210907215332.30737-43-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210907215332.30737-1-imp@bsdimp.com>
References: <20210907215332.30737-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d43;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd43.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Stacey Son <sson@FreeBSD.org>, Kyle Evans <kevans@FreeBSD.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Mika=C3=ABl=20Urankar?= <mikael.urankar@gmail.com>,
 Warner Losh <imp@FreeBSD.org>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Warner Losh <imp@FreeBSD.org>

Update the reserved base based on what platform we're on, as well as the
start of the mmap range. Update routines that find va ranges to interact
with the reserved ranges as well as properly align the mapping (this is
especially important for targets whose page size does not match the
host's). Loop where appropriate when the initial address space offered
by mmap does not meet the contraints.

This has 18e80c55bb6 from linux-user folded in to the upstream
bsd-user code as well.

Signed-off-by: Mikaël Urankar <mikael.urankar@gmail.com>
Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Acked-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Kyle Evans <kevans@FreeBSD.org>
---
 bsd-user/main.c |  43 ++++-
 bsd-user/mmap.c | 415 ++++++++++++++++++++++++++++++++++++++++--------
 bsd-user/qemu.h |   5 +-
 3 files changed, 392 insertions(+), 71 deletions(-)

diff --git a/bsd-user/main.c b/bsd-user/main.c
index 6df4f4f011..48643eeabc 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -52,10 +52,47 @@
 #include "target_arch_cpu.h"
 
 int singlestep;
-unsigned long mmap_min_addr;
 uintptr_t guest_base;
 bool have_guest_base;
+/*
+ * When running 32-on-64 we should make sure we can fit all of the possible
+ * guest address space into a contiguous chunk of virtual host memory.
+ *
+ * This way we will never overlap with our own libraries or binaries or stack
+ * or anything else that QEMU maps.
+ *
+ * Many cpus reserve the high bit (or more than one for some 64-bit cpus)
+ * of the address for the kernel.  Some cpus rely on this and user space
+ * uses the high bit(s) for pointer tagging and the like.  For them, we
+ * must preserve the expected address space.
+ */
+#ifndef MAX_RESERVED_VA
+# if HOST_LONG_BITS > TARGET_VIRT_ADDR_SPACE_BITS
+#  if TARGET_VIRT_ADDR_SPACE_BITS == 32 && \
+      (TARGET_LONG_BITS == 32 || defined(TARGET_ABI32))
+/*
+ * There are a number of places where we assign reserved_va to a variable
+ * of type abi_ulong and expect it to fit.  Avoid the last page.
+ */
+#   define MAX_RESERVED_VA  (0xfffffffful & TARGET_PAGE_MASK)
+#  else
+#   define MAX_RESERVED_VA  (1ul << TARGET_VIRT_ADDR_SPACE_BITS)
+#  endif
+# else
+#  define MAX_RESERVED_VA  0
+# endif
+#endif
+
+/*
+ * That said, reserving *too* much vm space via mmap can run into problems
+ * with rlimits, oom due to page table creation, etc.  We will still try it,
+ * if directed by the command-line option, but not by default.
+ */
+#if HOST_LONG_BITS == 64 && TARGET_VIRT_ADDR_SPACE_BITS <= 32
+unsigned long reserved_va = MAX_RESERVED_VA;
+#else
 unsigned long reserved_va;
+#endif
 
 static const char *interp_prefix = CONFIG_QEMU_INTERP_PREFIX;
 const char *qemu_uname_release;
@@ -439,6 +476,10 @@ int main(int argc, char **argv)
     target_environ = envlist_to_environ(envlist, NULL);
     envlist_free(envlist);
 
+    if (reserved_va) {
+            mmap_next_start = reserved_va;
+    }
+
     {
         Error *err = NULL;
         if (seed_optarg != NULL) {
diff --git a/bsd-user/mmap.c b/bsd-user/mmap.c
index 8918c4ae68..b40ab9045f 100644
--- a/bsd-user/mmap.c
+++ b/bsd-user/mmap.c
@@ -188,64 +188,207 @@ static int mmap_frag(abi_ulong real_start,
     return 0;
 }
 
-static abi_ulong mmap_next_start = 0x40000000;
+#if HOST_LONG_BITS == 64 && TARGET_ABI_BITS == 64
+# define TASK_UNMAPPED_BASE  (1ul << 38)
+#else
+# define TASK_UNMAPPED_BASE  0x40000000
+#endif
+abi_ulong mmap_next_start = TASK_UNMAPPED_BASE;
 
 unsigned long last_brk;
 
-/* find a free memory area of size 'size'. The search starts at
-   'start'. If 'start' == 0, then a default start address is used.
-   Return -1 if error.
-*/
-/* page_init() marks pages used by the host as reserved to be sure not
-   to use them. */
-static abi_ulong mmap_find_vma(abi_ulong start, abi_ulong size)
+/*
+ * Subroutine of mmap_find_vma, used when we have pre-allocated a chunk of guest
+ * address space.
+ */
+static abi_ulong mmap_find_vma_reserved(abi_ulong start, abi_ulong size,
+                                        abi_ulong alignment)
 {
-    abi_ulong addr, addr1, addr_start;
+    abi_ulong addr;
+    abi_ulong end_addr;
     int prot;
-    unsigned long new_brk;
+    int looped = 0;
+
+    if (size > reserved_va) {
+        return (abi_ulong)-1;
+    }
+
+    size = HOST_PAGE_ALIGN(size) + alignment;
+    end_addr = start + size;
+    if (end_addr > reserved_va) {
+        end_addr = reserved_va;
+    }
+    addr = end_addr - qemu_host_page_size;
 
-    new_brk = (unsigned long)sbrk(0);
-    if (last_brk && last_brk < new_brk && last_brk == (target_ulong)last_brk) {
-        /* This is a hack to catch the host allocating memory with brk().
-           If it uses mmap then we loose.
-           FIXME: We really want to avoid the host allocating memory in
-           the first place, and maybe leave some slack to avoid switching
-           to mmap.  */
-        page_set_flags(last_brk & TARGET_PAGE_MASK,
-                       TARGET_PAGE_ALIGN(new_brk),
-                       PAGE_RESERVED);
+    while (1) {
+        if (addr > end_addr) {
+            if (looped) {
+                return (abi_ulong)-1;
+            }
+            end_addr = reserved_va;
+            addr = end_addr - qemu_host_page_size;
+            looped = 1;
+            continue;
+        }
+        prot = page_get_flags(addr);
+        if (prot) {
+            end_addr = addr;
+        }
+        if (end_addr - addr >= size) {
+            break;
+        }
+        addr -= qemu_host_page_size;
+    }
+
+    if (start == mmap_next_start) {
+        mmap_next_start = addr;
+    }
+    /* addr is sufficiently low to align it up */
+    if (alignment != 0) {
+        addr = (addr + alignment) & ~(alignment - 1);
+    }
+    return addr;
+}
+
+/*
+ * Find and reserve a free memory area of size 'size'. The search
+ * starts at 'start'.
+ * It must be called with mmap_lock() held.
+ * Return -1 if error.
+ */
+static abi_ulong mmap_find_vma_aligned(abi_ulong start, abi_ulong size,
+                                       abi_ulong alignment)
+{
+    void *ptr, *prev;
+    abi_ulong addr;
+    int flags;
+    int wrapped, repeat;
+
+    /* If 'start' == 0, then a default start address is used. */
+    if (start == 0) {
+        start = mmap_next_start;
+    } else {
+        start &= qemu_host_page_mask;
     }
-    last_brk = new_brk;
 
     size = HOST_PAGE_ALIGN(size);
-    start = start & qemu_host_page_mask;
+
+    if (reserved_va) {
+        return mmap_find_vma_reserved(start, size,
+            (alignment != 0 ? 1 << alignment : 0));
+    }
+
     addr = start;
-    if (addr == 0)
-        addr = mmap_next_start;
-    addr_start = addr;
-    for (;;) {
-        prot = 0;
-        for (addr1 = addr; addr1 < (addr + size); addr1 += TARGET_PAGE_SIZE) {
-            prot |= page_get_flags(addr1);
+    wrapped = repeat = 0;
+    prev = 0;
+    flags = MAP_ANONYMOUS | MAP_PRIVATE;
+#ifdef MAP_ALIGNED
+    if (alignment != 0) {
+        flags |= MAP_ALIGNED(alignment);
+    }
+#else
+    /* XXX TODO */
+#endif
+
+    for (;; prev = ptr) {
+        /*
+         * Reserve needed memory area to avoid a race.
+         * It should be discarded using:
+         *  - mmap() with MAP_FIXED flag
+         *  - mremap() with MREMAP_FIXED flag
+         *  - shmat() with SHM_REMAP flag
+         */
+        ptr = mmap(g2h_untagged(addr), size, PROT_NONE,
+                   flags, -1, 0);
+
+        /* ENOMEM, if host address space has no memory */
+        if (ptr == MAP_FAILED) {
+            return (abi_ulong)-1;
         }
-        if (prot == 0)
-            break;
-        addr += qemu_host_page_size;
-        /* we found nothing */
-        if (addr == addr_start)
+
+        /*
+         * Count the number of sequential returns of the same address.
+         * This is used to modify the search algorithm below.
+         */
+        repeat = (ptr == prev ? repeat + 1 : 0);
+
+        if (h2g_valid(ptr + size - 1)) {
+            addr = h2g(ptr);
+
+            if ((addr & ~TARGET_PAGE_MASK) == 0) {
+                /* Success.  */
+                if (start == mmap_next_start && addr >= TASK_UNMAPPED_BASE) {
+                    mmap_next_start = addr + size;
+                }
+                return addr;
+            }
+
+            /* The address is not properly aligned for the target.  */
+            switch (repeat) {
+            case 0:
+                /*
+                 * Assume the result that the kernel gave us is the
+                 * first with enough free space, so start again at the
+                 * next higher target page.
+                 */
+                addr = TARGET_PAGE_ALIGN(addr);
+                break;
+            case 1:
+                /*
+                 * Sometimes the kernel decides to perform the allocation
+                 * at the top end of memory instead.
+                 */
+                addr &= TARGET_PAGE_MASK;
+                break;
+            case 2:
+                /* Start over at low memory.  */
+                addr = 0;
+                break;
+            default:
+                /* Fail.  This unaligned block must the last.  */
+                addr = -1;
+                break;
+            }
+        } else {
+            /*
+             * Since the result the kernel gave didn't fit, start
+             * again at low memory.  If any repetition, fail.
+             */
+            addr = (repeat ? -1 : 0);
+        }
+
+        /* Unmap and try again.  */
+        munmap(ptr, size);
+
+        /* ENOMEM if we checked the whole of the target address space.  */
+        if (addr == (abi_ulong)-1) {
+            return (abi_ulong)-1;
+        } else if (addr == 0) {
+            if (wrapped) {
+                return (abi_ulong)-1;
+            }
+            wrapped = 1;
+            /*
+             * Don't actually use 0 when wrapping, instead indicate
+             * that we'd truly like an allocation in low memory.
+             */
+            addr = TARGET_PAGE_SIZE;
+        } else if (wrapped && addr >= start) {
             return (abi_ulong)-1;
+        }
     }
-    if (start == 0)
-        mmap_next_start = addr + size;
-    return addr;
+}
+
+abi_ulong mmap_find_vma(abi_ulong start, abi_ulong size)
+{
+    return mmap_find_vma_aligned(start, size, 0);
 }
 
 /* NOTE: all the constants are the HOST ones */
 abi_long target_mmap(abi_ulong start, abi_ulong len, int prot,
-                     int flags, int fd, abi_ulong offset)
+                     int flags, int fd, off_t offset)
 {
     abi_ulong ret, end, real_start, real_end, retaddr, host_offset, host_len;
-    unsigned long host_start;
 
     mmap_lock();
 #ifdef DEBUG_MMAP
@@ -294,43 +437,121 @@ abi_long target_mmap(abi_ulong start, abi_ulong len, int prot,
     }
 #endif
 
+    if ((flags & MAP_ANONYMOUS) && fd != -1) {
+        errno = EINVAL;
+        goto fail;
+    }
+#ifdef MAP_STACK
+    if (flags & MAP_STACK) {
+        if ((fd != -1) || ((prot & (PROT_READ | PROT_WRITE)) !=
+                    (PROT_READ | PROT_WRITE))) {
+            errno = EINVAL;
+            goto fail;
+        }
+    }
+#endif /* MAP_STACK */
+#ifdef MAP_GUARD
+    if ((flags & MAP_GUARD) && (prot != PROT_NONE || fd != -1 ||
+        offset != 0 || (flags & (MAP_SHARED | MAP_PRIVATE |
+        /* MAP_PREFAULT | */ /* MAP_PREFAULT not in mman.h */
+        MAP_PREFAULT_READ | MAP_ANON | MAP_STACK)) != 0)) {
+        errno = EINVAL;
+        goto fail;
+    }
+#endif
+
     if (offset & ~TARGET_PAGE_MASK) {
         errno = EINVAL;
         goto fail;
     }
 
     len = TARGET_PAGE_ALIGN(len);
-    if (len == 0)
-        goto the_end;
+    if (len == 0) {
+        errno = EINVAL;
+        goto fail;
+    }
     real_start = start & qemu_host_page_mask;
+    host_offset = offset & qemu_host_page_mask;
 
+    /*
+     * If the user is asking for the kernel to find a location, do that
+     * before we truncate the length for mapping files below.
+     */
     if (!(flags & MAP_FIXED)) {
-        abi_ulong mmap_start;
-        void *p;
-        host_offset = offset & qemu_host_page_mask;
         host_len = len + offset - host_offset;
         host_len = HOST_PAGE_ALIGN(host_len);
-        mmap_start = mmap_find_vma(real_start, host_len);
-        if (mmap_start == (abi_ulong)-1) {
+        if ((flags & MAP_ALIGNMENT_MASK) != 0)
+            start = mmap_find_vma_aligned(real_start, host_len,
+                (flags & MAP_ALIGNMENT_MASK) >> MAP_ALIGNMENT_SHIFT);
+        else
+            start = mmap_find_vma(real_start, host_len);
+        if (start == (abi_ulong)-1) {
             errno = ENOMEM;
             goto fail;
         }
-        /* Note: we prefer to control the mapping address. It is
-           especially important if qemu_host_page_size >
-           qemu_real_host_page_size */
-        p = mmap(g2h_untagged(mmap_start),
-                 host_len, prot, flags | MAP_FIXED, fd, host_offset);
+    }
+
+    /*
+     * When mapping files into a memory area larger than the file, accesses
+     * to pages beyond the file size will cause a SIGBUS.
+     *
+     * For example, if mmaping a file of 100 bytes on a host with 4K pages
+     * emulating a target with 8K pages, the target expects to be able to
+     * access the first 8K. But the host will trap us on any access beyond
+     * 4K.
+     *
+     * When emulating a target with a larger page-size than the hosts, we
+     * may need to truncate file maps at EOF and add extra anonymous pages
+     * up to the targets page boundary.
+     */
+
+    if ((qemu_real_host_page_size < qemu_host_page_size) && fd != -1) {
+        struct stat sb;
+
+        if (fstat(fd, &sb) == -1) {
+            goto fail;
+        }
+
+        /* Are we trying to create a map beyond EOF?.  */
+        if (offset + len > sb.st_size) {
+            /*
+             * If so, truncate the file map at eof aligned with
+             * the hosts real pagesize. Additional anonymous maps
+             * will be created beyond EOF.
+             */
+            len = REAL_HOST_PAGE_ALIGN(sb.st_size - offset);
+        }
+    }
+
+    if (!(flags & MAP_FIXED)) {
+        unsigned long host_start;
+        void *p;
+
+        host_len = len + offset - host_offset;
+        host_len = HOST_PAGE_ALIGN(host_len);
+
+        /*
+         * Note: we prefer to control the mapping address. It is
+         * especially important if qemu_host_page_size >
+         * qemu_real_host_page_size
+         */
+        p = mmap(g2h_untagged(start), host_len, prot,
+                 flags | MAP_FIXED | ((fd != -1) ? MAP_ANONYMOUS : 0), -1, 0);
         if (p == MAP_FAILED)
             goto fail;
         /* update start so that it points to the file position at 'offset' */
         host_start = (unsigned long)p;
-        if (!(flags & MAP_ANON))
+        if (fd != -1) {
+            p = mmap(g2h_untagged(start), len, prot,
+                     flags | MAP_FIXED, fd, host_offset);
+            if (p == MAP_FAILED) {
+                munmap(g2h_untagged(start), host_len);
+                goto fail;
+            }
             host_start += offset - host_offset;
+        }
         start = h2g(host_start);
     } else {
-        int flg;
-        target_ulong addr;
-
         if (start & ~TARGET_PAGE_MASK) {
             errno = EINVAL;
             goto fail;
@@ -338,20 +559,28 @@ abi_long target_mmap(abi_ulong start, abi_ulong len, int prot,
         end = start + len;
         real_end = HOST_PAGE_ALIGN(end);
 
-        for (addr = real_start; addr < real_end; addr += TARGET_PAGE_SIZE) {
-            flg = page_get_flags(addr);
-            if (flg & PAGE_RESERVED) {
-                errno = ENXIO;
-                goto fail;
-            }
+        /*
+         * Test if requested memory area fits target address space
+         * It can fail only on 64-bit host with 32-bit target.
+         * On any other target/host host mmap() handles this error correctly.
+         */
+#if TARGET_ABI_BITS == 32 && HOST_LONG_BITS == 64
+        if ((unsigned long)start + len - 1 > (abi_ulong) -1) {
+            errno = EINVAL;
+            goto fail;
         }
+#endif
 
-        /* worst case: we cannot map the file because the offset is not
-           aligned, so we read it */
+        /*
+         * worst case: we cannot map the file because the offset is not
+         * aligned, so we read it
+         */
         if (!(flags & MAP_ANON) &&
             (offset & ~qemu_host_page_mask) != (start & ~qemu_host_page_mask)) {
-            /* msync() won't work here, so we return an error if write is
-               possible while it is a shared mapping */
+            /*
+             * msync() won't work here, so we return an error if write is
+             * possible while it is a shared mapping
+             */
             if ((flags & TARGET_BSD_MAP_FLAGMASK) == MAP_SHARED &&
                 (prot & PROT_WRITE)) {
                 errno = EINVAL;
@@ -392,7 +621,7 @@ abi_long target_mmap(abi_ulong start, abi_ulong len, int prot,
         /* handle the end of the mapping */
         if (end < real_end) {
             ret = mmap_frag(real_end - qemu_host_page_size,
-                            real_end - qemu_host_page_size, real_end,
+                            real_end - qemu_host_page_size, end,
                             prot, flags, fd,
                             offset + real_end - qemu_host_page_size - start);
             if (ret == -1)
@@ -422,6 +651,7 @@ abi_long target_mmap(abi_ulong start, abi_ulong len, int prot,
     page_dump(stdout);
     printf("\n");
 #endif
+    tb_invalidate_phys_range(start, start + len);
     mmap_unlock();
     return start;
 fail:
@@ -429,6 +659,49 @@ fail:
     return -1;
 }
 
+static void mmap_reserve(abi_ulong start, abi_ulong size)
+{
+    abi_ulong real_start;
+    abi_ulong real_end;
+    abi_ulong addr;
+    abi_ulong end;
+    int prot;
+
+    real_start = start & qemu_host_page_mask;
+    real_end = HOST_PAGE_ALIGN(start + size);
+    end = start + size;
+    if (start > real_start) {
+        /* handle host page containing start */
+        prot = 0;
+        for (addr = real_start; addr < start; addr += TARGET_PAGE_SIZE) {
+            prot |= page_get_flags(addr);
+        }
+        if (real_end == real_start + qemu_host_page_size) {
+            for (addr = end; addr < real_end; addr += TARGET_PAGE_SIZE) {
+                prot |= page_get_flags(addr);
+            }
+            end = real_end;
+        }
+        if (prot != 0) {
+            real_start += qemu_host_page_size;
+        }
+    }
+    if (end < real_end) {
+        prot = 0;
+        for (addr = end; addr < real_end; addr += TARGET_PAGE_SIZE) {
+            prot |= page_get_flags(addr);
+        }
+        if (prot != 0) {
+            real_end -= qemu_host_page_size;
+        }
+    }
+    if (real_start != real_end) {
+        mmap(g2h_untagged(real_start), real_end - real_start, PROT_NONE,
+                 MAP_FIXED | MAP_ANONYMOUS | MAP_PRIVATE,
+                 -1, 0);
+    }
+}
+
 int target_munmap(abi_ulong start, abi_ulong len)
 {
     abi_ulong end, real_start, real_end, addr;
@@ -476,11 +749,17 @@ int target_munmap(abi_ulong start, abi_ulong len)
     ret = 0;
     /* unmap what we can */
     if (real_start < real_end) {
-        ret = munmap(g2h_untagged(real_start), real_end - real_start);
+        if (reserved_va) {
+            mmap_reserve(real_start, real_end - real_start);
+        } else {
+            ret = munmap(g2h_untagged(real_start), real_end - real_start);
+        }
     }
 
-    if (ret == 0)
+    if (ret == 0) {
         page_set_flags(start, start + len, 0);
+        tb_invalidate_phys_range(start, start + len);
+    }
     mmap_unlock();
     return ret;
 }
diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
index 8d20554688..522d6c4031 100644
--- a/bsd-user/qemu.h
+++ b/bsd-user/qemu.h
@@ -105,7 +105,6 @@ typedef struct TaskState {
 
 void init_task_state(TaskState *ts);
 extern const char *qemu_uname_release;
-extern unsigned long mmap_min_addr;
 
 /*
  * TARGET_ARG_MAX defines the number of bytes allocated for arguments
@@ -215,13 +214,15 @@ abi_long do_sigaltstack(abi_ulong uss_addr, abi_ulong uoss_addr, abi_ulong sp);
 /* mmap.c */
 int target_mprotect(abi_ulong start, abi_ulong len, int prot);
 abi_long target_mmap(abi_ulong start, abi_ulong len, int prot,
-                     int flags, int fd, abi_ulong offset);
+                     int flags, int fd, off_t offset);
 int target_munmap(abi_ulong start, abi_ulong len);
 abi_long target_mremap(abi_ulong old_addr, abi_ulong old_size,
                        abi_ulong new_size, unsigned long flags,
                        abi_ulong new_addr);
 int target_msync(abi_ulong start, abi_ulong len, int flags);
 extern unsigned long last_brk;
+extern abi_ulong mmap_next_start;
+abi_ulong mmap_find_vma(abi_ulong start, abi_ulong size);
 void mmap_fork_start(void);
 void mmap_fork_end(int child);
 
-- 
2.32.0


