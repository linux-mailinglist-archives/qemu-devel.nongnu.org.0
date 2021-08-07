Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C7523E3759
	for <lists+qemu-devel@lfdr.de>; Sun,  8 Aug 2021 00:07:37 +0200 (CEST)
Received: from localhost ([::1]:49686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mCUTg-0007fI-NM
	for lists+qemu-devel@lfdr.de; Sat, 07 Aug 2021 18:07:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mCU6P-0008Qn-B5
 for qemu-devel@nongnu.org; Sat, 07 Aug 2021 17:43:33 -0400
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42]:37536)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mCU6M-0005Ij-PT
 for qemu-devel@nongnu.org; Sat, 07 Aug 2021 17:43:33 -0400
Received: by mail-io1-xd42.google.com with SMTP id l20so17749390iom.4
 for <qemu-devel@nongnu.org>; Sat, 07 Aug 2021 14:43:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tAIPPJm6zxDq+3s8RtiwvzCdGXD+I5V+8YLL7QmlLYE=;
 b=0Sx7wN7mG8CyP0xccqH1GruTnoPwJzHu4RwW3kTh1f7zzA0ZleQjlZxYeA/RCpk29+
 HROFlus4s2stTN5td8JdSCXPjcGn6HFo+pgi6z09gWOi9p/uLEYYrZRGhHi5x1BwCP12
 iKTR/Q2VM2WrfsJaDKI4frwokagtPqIY6PD8/aEaB6/+3TaUQWtd6EUWmcELS8rZWh30
 Z0FQnzj3jrOpnpmoRDDmFutopj0v68E+vGDU49RTG9nvv2Gkcj+y7J6nUJ2RmAECO10Y
 NTn0LaU5upcN5J2h6na7OeNsHFBZV65e6s0eAxg5g01XODzF71FlJMCOZKD9SZ90wERY
 VDZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tAIPPJm6zxDq+3s8RtiwvzCdGXD+I5V+8YLL7QmlLYE=;
 b=LyQgc+7qC6YV/SuXPa/dEHu+dGEfL311sxXiPjjq6OqXzZeHj9/SP1h32k12rvqVhm
 HRYHlbK9jb45NyQOMnrTEHKj8aKUtzC4gf0TkAsikUjebSAoxm1xE6sGFoue5nz/CNko
 uKx3d+4WWLYAYVL7BXXoXhpQLVYpGDkJCRtwNzf1ZBf8VrxdEcjQACA7T3U7JD1UT8IE
 6vS2eRhCqJylct/3Z3x5pKu7NKgYEaX8k9LFYvCpGO2FxOaLHGzx49jLAmvg+i3eHQyE
 sM+5JRDF8pqqiVwovLIkJx9hY0bZVo2Nye8tDorxVqevYIcBc99n+D4Ftcz15OkEgGxE
 RZ3Q==
X-Gm-Message-State: AOAM5318Av71GsEGLwfbqVerWNO0PgO1vAYSEQUJj2LnrCO6RFVYr0NO
 y3oBhABidAnzSRrjI07Jo+6xZ9o1YeRh4Vl4
X-Google-Smtp-Source: ABdhPJw6sZjZWgbd/k24Dwf5KGnIVa6GuFuJ4aF1/Ex6BtNNR5/XiCrH2gdGAHEFjerxJx/smYF7rg==
X-Received: by 2002:a02:2506:: with SMTP id g6mr15483263jag.77.1628372609395; 
 Sat, 07 Aug 2021 14:43:29 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id a17sm8062827ios.36.2021.08.07.14.43.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Aug 2021 14:43:29 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for 6.2 38/49] bsd-user: Update mapping to handle reserved and
 starting conditions
Date: Sat,  7 Aug 2021 15:42:31 -0600
Message-Id: <20210807214242.82385-39-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210807214242.82385-1-imp@bsdimp.com>
References: <20210807214242.82385-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d42;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd42.google.com
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
Cc: kevans@freebsd.org, Warner Losh <imp@FreeBSD.org>,
 Warner Losh <imp@bsdimp.com>,
 =?UTF-8?q?Mika=C3=ABl=20Urankar?= <mikael.urankar@gmail.com>,
 Stacey Son <sson@FreeBSD.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Warner Losh <imp@FreeBSD.org>

Update the reserved base based on what platform we're on, as well as the
start of the mmap range. Update routines that find va ranges to interact
with the reserved ranges as well as properly align the mapping (this is
especially important for targets whose page size does not match the
host's). Loop where appropriate when the initial address space offered
by mmap does not meet the contraints.

Signed-off-by: Mikaël Urankar <mikael.urankar@gmail.com>
Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/main.c |  23 ++-
 bsd-user/mmap.c | 372 ++++++++++++++++++++++++++++++++++++++++--------
 bsd-user/qemu.h |   5 +-
 3 files changed, 335 insertions(+), 65 deletions(-)

diff --git a/bsd-user/main.c b/bsd-user/main.c
index 93ef9298b8..36852604f8 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -49,12 +49,29 @@
 #include "target_arch_cpu.h"
 
 int singlestep;
-unsigned long mmap_min_addr;
 uintptr_t guest_base;
 static const char *cpu_model;
 static const char *cpu_type;
 bool have_guest_base;
+#if (TARGET_LONG_BITS == 32) && (HOST_LONG_BITS == 64)
+/*
+ * When running 32-on-64 we should make sure we can fit all of the possible
+ * guest address space into a contiguous chunk of virtual host memory.
+ *
+ * This way we will never overlap with our own libraries or binaries or stack
+ * or anything else that QEMU maps.
+ */
+# ifdef TARGET_MIPS
+/* MIPS only supports 31 bits of virtual address space for user space */
+unsigned long reserved_va = 0x77000000;
+# elif defined(TARGET_PPC64)
+unsigned long reserved_va = 0xfffff000;
+# else
+unsigned long reserved_va = 0xf7000000;
+# endif
+#else
 unsigned long reserved_va;
+#endif
 
 static const char *interp_prefix = CONFIG_QEMU_INTERP_PREFIX;
 const char *qemu_uname_release;
@@ -399,6 +416,10 @@ int main(int argc, char **argv)
     target_environ = envlist_to_environ(envlist, NULL);
     envlist_free(envlist);
 
+    if (reserved_va) {
+            mmap_next_start = reserved_va;
+    }
+
     /*
      * Now that page sizes are configured we can do
      * proper page alignment for guest_base.
diff --git a/bsd-user/mmap.c b/bsd-user/mmap.c
index 99563d61aa..07e985b0c5 100644
--- a/bsd-user/mmap.c
+++ b/bsd-user/mmap.c
@@ -188,64 +188,191 @@ static int mmap_frag(abi_ulong real_start,
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
+/* Subroutine of mmap_find_vma, used when we have pre-allocated a chunk
+   of guest address space.  */
+static abi_ulong mmap_find_vma_reserved(abi_ulong start, abi_ulong size, abi_ulong alignment)
 {
-    abi_ulong addr, addr1, addr_start;
+    abi_ulong addr;
+    abi_ulong end_addr;
     int prot;
-    unsigned long new_brk;
-
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
+
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
+    if (alignment != 0)
+        addr = (addr + alignment) & ~(alignment - 1);
+    return addr;
+}
+
+/*
+ * Find and reserve a free memory area of size 'size'. The search
+ * starts at 'start'.
+ * It must be called with mmap_lock() held.
+ * Return -1 if error.
+ */
+static abi_ulong mmap_find_vma_aligned(abi_ulong start, abi_ulong size, abi_ulong alignment)
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
+    flags = MAP_ANONYMOUS|MAP_PRIVATE;
+#ifdef MAP_ALIGNED
+    if (alignment != 0)
+		flags |= MAP_ALIGNED(alignment);
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
+        /* Count the number of sequential returns of the same address.
+           This is used to modify the search algorithm below.  */
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
+                /* Assume the result that the kernel gave us is the
+                   first with enough free space, so start again at the
+                   next higher target page.  */
+                addr = TARGET_PAGE_ALIGN(addr);
+                break;
+            case 1:
+                /* Sometimes the kernel decides to perform the allocation
+                   at the top end of memory instead.  */
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
+            /* Since the result the kernel gave didn't fit, start
+               again at low memory.  If any repetition, fail.  */
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
+            /* Don't actually use 0 when wrapping, instead indicate
+               that we'd truly like an allocation in low memory.  */
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
@@ -284,43 +411,112 @@ abi_long target_mmap(abi_ulong start, abi_ulong len, int prot,
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
+#if defined(__FreeBSD_version) && __FreeBSD_version >= 1200035
+    if ((flags & MAP_GUARD) && (prot != PROT_NONE || fd != -1 ||
+        offset != 0 || (flags & (MAP_SHARED | MAP_PRIVATE | /* MAP_PREFAULT | */ /* MAP_PREFAULT not in mman.h */
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
 
+    /* If the user is asking for the kernel to find a location, do that
+       before we truncate the length for mapping files below.  */
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
+    }
+
+    /* When mapping files into a memory area larger than the file, accesses
+       to pages beyond the file size will cause a SIGBUS.
+
+       For example, if mmaping a file of 100 bytes on a host with 4K pages
+       emulating a target with 8K pages, the target expects to be able to
+       access the first 8K. But the host will trap us on any access beyond
+       4K.
+
+       When emulating a target with a larger page-size than the hosts, we
+       may need to truncate file maps at EOF and add extra anonymous pages
+       up to the targets page boundary.  */
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
+            /* If so, truncate the file map at eof aligned with
+               the hosts real pagesize. Additional anonymous maps
+               will be created beyond EOF.  */
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
         /* Note: we prefer to control the mapping address. It is
            especially important if qemu_host_page_size >
            qemu_real_host_page_size */
-        p = mmap(g2h_untagged(mmap_start),
-                 host_len, prot, flags | MAP_FIXED, fd, host_offset);
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
@@ -328,13 +524,17 @@ abi_long target_mmap(abi_ulong start, abi_ulong len, int prot,
         end = start + len;
         real_end = HOST_PAGE_ALIGN(end);
 
-        for (addr = real_start; addr < real_end; addr += TARGET_PAGE_SIZE) {
-            flg = page_get_flags(addr);
-            if (flg & PAGE_RESERVED) {
-                errno = ENXIO;
-                goto fail;
-            }
+	/*
+	 * Test if requested memory area fits target address space
+	 * It can fail only on 64-bit host with 32-bit target.
+	 * On any other target/host host mmap() handles this error correctly.
+	 */
+#if TARGET_ABI_BITS == 32 && HOST_LONG_BITS == 64
+        if ((unsigned long)start + len - 1 > (abi_ulong) -1) {
+            errno = EINVAL;
+            goto fail;
         }
+#endif
 
         /* worst case: we cannot map the file because the offset is not
            aligned, so we read it */
@@ -382,7 +582,7 @@ abi_long target_mmap(abi_ulong start, abi_ulong len, int prot,
         /* handle the end of the mapping */
         if (end < real_end) {
             ret = mmap_frag(real_end - qemu_host_page_size,
-                            real_end - qemu_host_page_size, real_end,
+                            real_end - qemu_host_page_size, end,
                             prot, flags, fd,
                             offset + real_end - qemu_host_page_size - start);
             if (ret == -1)
@@ -412,6 +612,7 @@ abi_long target_mmap(abi_ulong start, abi_ulong len, int prot,
     page_dump(stdout);
     printf("\n");
 #endif
+    tb_invalidate_phys_range(start, start + len);
     mmap_unlock();
     return start;
 fail:
@@ -419,6 +620,47 @@ fail:
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
+        if (prot != 0)
+            real_start += qemu_host_page_size;
+    }
+    if (end < real_end) {
+        prot = 0;
+        for (addr = end; addr < real_end; addr += TARGET_PAGE_SIZE) {
+            prot |= page_get_flags(addr);
+        }
+        if (prot != 0)
+            real_end -= qemu_host_page_size;
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
@@ -466,11 +708,17 @@ int target_munmap(abi_ulong start, abi_ulong len)
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
index bfd7b8eaa5..a85abb8fe1 100644
--- a/bsd-user/qemu.h
+++ b/bsd-user/qemu.h
@@ -104,7 +104,6 @@ typedef struct TaskState {
 
 void init_task_state(TaskState *ts);
 extern const char *qemu_uname_release;
-extern unsigned long mmap_min_addr;
 
 /*
  * TARGET_ARG_MAX defines the number of bytes allocated for arguments
@@ -212,13 +211,15 @@ abi_long do_sigaltstack(abi_ulong uss_addr, abi_ulong uoss_addr, abi_ulong sp);
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


