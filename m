Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D104D33689A
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 01:28:45 +0100 (CET)
Received: from localhost ([::1]:44092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK9C0-0004q9-RG
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 19:28:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lK95v-0004su-SI
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 19:22:27 -0500
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330]:38136)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lK95h-0001LT-FQ
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 19:22:27 -0500
Received: by mail-ot1-x330.google.com with SMTP id a17so18335801oto.5
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 16:22:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1kd3z5f3F5IgA4tmLR2z9IlG5FeR5TPlOdPkW3kV5W4=;
 b=DQ3tA3pUfIkyZiLVMWBICsgUQQOMQ4mbNfBTwLZJ3oUrzDMTVFolzsFCvoYg2NuF19
 Jz5ZVvXfiEa0DMdVrAf6eUq4MqZVEiNuGpLJ+VtlxFgoH48ghfiJgk1rDeLltAGnDRNB
 jOdVeKinwNIunKmvIVEKYC/MkEGiJibibpL4V6BgPXoyyc3Mb55COs9ojkFuW0lonpwn
 P3DUG//tLwbNiC72dNEg+iFaGQhraZWl5Vz8vMim8ozBNlOF7mXM5Ovfd6BGZI4UF3/D
 dlUz8nAKMLSHYwXh14YESxHBbUz/CgNw+1ciwW3aNc0Vlp7miCbDT3iFhA2AXgaWq6GJ
 WnGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1kd3z5f3F5IgA4tmLR2z9IlG5FeR5TPlOdPkW3kV5W4=;
 b=jYidq213TQPc3mhw7Ly9oODBT4EzUg9pJQcrSGMzcZilawXadQJ87hfSgqRzDXK8ar
 t/82dnIxzaKDh6UyW+bh2aeqr5c8dPAxspAQKLkXO60VLmiT0S64o7yvxo0dUJryw343
 UPQPtaSfkuBtz/jLq3xtgJYcjVkTZaWa1D5upk4J4H/Lf5kjk43t/zD7WzL0gq4OBAwY
 9amcydR6UDgEPqz4hFCMq6CNbFs9h/YkWUlbXUDaqg3Eld2V13nNVE3YGsMZ+1iB3WMu
 18UxHtjdYYXqUzoCCFkHm2Rqe7nNbNmsOunrxjgOdoyxN0PV4+mRiF4SpDEOx/het+qr
 vxwA==
X-Gm-Message-State: AOAM533B70pBRF0PwHfXtPTbys7jB8x9Vm+ZJH0MaW52NPcGNedFZbjs
 Thwl4Lmdj505U3n08HilKNMo9GNlGtOdMq2X
X-Google-Smtp-Source: ABdhPJxkKuks8orw1jTOIRuzsgm8GD+QlGbiDeEK3SESkdG9tkbKIR8qtIPfndtF0RhMSK35PqZoUQ==
X-Received: by 2002:a9d:68ce:: with SMTP id i14mr4506381oto.151.1615422132046; 
 Wed, 10 Mar 2021 16:22:12 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id a6sm300962otq.79.2021.03.10.16.22.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Mar 2021 16:22:11 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 10/26] accel/tcg: Move alloc_code_gen_buffer to tcg/region.c
Date: Wed, 10 Mar 2021 18:21:40 -0600
Message-Id: <20210311002156.253711-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210311002156.253711-1-richard.henderson@linaro.org>
References: <20210311002156.253711-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::330;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: r.bolshakov@yadro.com, j@getutm.app
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Buffer management is integral to tcg.  Do not leave the allocation
to code outside of tcg/.  This is code movement, with further
cleanups to follow.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg.h         |   2 +-
 accel/tcg/translate-all.c | 414 +------------------------------------
 tcg/region.c              | 421 +++++++++++++++++++++++++++++++++++++-
 3 files changed, 418 insertions(+), 419 deletions(-)

diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index 0f0695e90d..7a435bf807 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -874,7 +874,7 @@ void *tcg_malloc_internal(TCGContext *s, int size);
 void tcg_pool_reset(TCGContext *s);
 TranslationBlock *tcg_tb_alloc(TCGContext *s);
 
-void tcg_region_init(void);
+void tcg_region_init(size_t tb_size, int splitwx);
 void tb_destroy(TranslationBlock *tb);
 void tcg_region_reset_all(void);
 
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 6d3184e7da..4071edda16 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -18,7 +18,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu/units.h"
 #include "qemu-common.h"
 
 #define NO_CPU_IO_DEFS
@@ -51,7 +50,6 @@
 #include "exec/tb-hash.h"
 #include "exec/translate-all.h"
 #include "qemu/bitmap.h"
-#include "qemu/error-report.h"
 #include "qemu/qemu-print.h"
 #include "qemu/timer.h"
 #include "qemu/main-loop.h"
@@ -895,408 +893,6 @@ static void page_lock_pair(PageDesc **ret_p1, tb_page_addr_t phys1,
     }
 }
 
-/* Minimum size of the code gen buffer.  This number is randomly chosen,
-   but not so small that we can't have a fair number of TB's live.  */
-#define MIN_CODE_GEN_BUFFER_SIZE     (1 * MiB)
-
-/* Maximum size of the code gen buffer we'd like to use.  Unless otherwise
-   indicated, this is constrained by the range of direct branches on the
-   host cpu, as used by the TCG implementation of goto_tb.  */
-#if defined(__x86_64__)
-# define MAX_CODE_GEN_BUFFER_SIZE  (2 * GiB)
-#elif defined(__sparc__)
-# define MAX_CODE_GEN_BUFFER_SIZE  (2 * GiB)
-#elif defined(__powerpc64__)
-# define MAX_CODE_GEN_BUFFER_SIZE  (2 * GiB)
-#elif defined(__powerpc__)
-# define MAX_CODE_GEN_BUFFER_SIZE  (32 * MiB)
-#elif defined(__aarch64__)
-# define MAX_CODE_GEN_BUFFER_SIZE  (2 * GiB)
-#elif defined(__s390x__)
-  /* We have a +- 4GB range on the branches; leave some slop.  */
-# define MAX_CODE_GEN_BUFFER_SIZE  (3 * GiB)
-#elif defined(__mips__)
-  /* We have a 256MB branch region, but leave room to make sure the
-     main executable is also within that region.  */
-# define MAX_CODE_GEN_BUFFER_SIZE  (128 * MiB)
-#else
-# define MAX_CODE_GEN_BUFFER_SIZE  ((size_t)-1)
-#endif
-
-#if TCG_TARGET_REG_BITS == 32
-#define DEFAULT_CODE_GEN_BUFFER_SIZE_1 (32 * MiB)
-#ifdef CONFIG_USER_ONLY
-/*
- * For user mode on smaller 32 bit systems we may run into trouble
- * allocating big chunks of data in the right place. On these systems
- * we utilise a static code generation buffer directly in the binary.
- */
-#define USE_STATIC_CODE_GEN_BUFFER
-#endif
-#else /* TCG_TARGET_REG_BITS == 64 */
-#ifdef CONFIG_USER_ONLY
-/*
- * As user-mode emulation typically means running multiple instances
- * of the translator don't go too nuts with our default code gen
- * buffer lest we make things too hard for the OS.
- */
-#define DEFAULT_CODE_GEN_BUFFER_SIZE_1 (128 * MiB)
-#else
-/*
- * We expect most system emulation to run one or two guests per host.
- * Users running large scale system emulation may want to tweak their
- * runtime setup via the tb-size control on the command line.
- */
-#define DEFAULT_CODE_GEN_BUFFER_SIZE_1 (1 * GiB)
-#endif
-#endif
-
-#define DEFAULT_CODE_GEN_BUFFER_SIZE \
-  (DEFAULT_CODE_GEN_BUFFER_SIZE_1 < MAX_CODE_GEN_BUFFER_SIZE \
-   ? DEFAULT_CODE_GEN_BUFFER_SIZE_1 : MAX_CODE_GEN_BUFFER_SIZE)
-
-static size_t size_code_gen_buffer(size_t tb_size)
-{
-    /* Size the buffer.  */
-    if (tb_size == 0) {
-        size_t phys_mem = qemu_get_host_physmem();
-        if (phys_mem == 0) {
-            tb_size = DEFAULT_CODE_GEN_BUFFER_SIZE;
-        } else {
-            tb_size = MIN(DEFAULT_CODE_GEN_BUFFER_SIZE, phys_mem / 8);
-        }
-    }
-    if (tb_size < MIN_CODE_GEN_BUFFER_SIZE) {
-        tb_size = MIN_CODE_GEN_BUFFER_SIZE;
-    }
-    if (tb_size > MAX_CODE_GEN_BUFFER_SIZE) {
-        tb_size = MAX_CODE_GEN_BUFFER_SIZE;
-    }
-    return tb_size;
-}
-
-#ifdef __mips__
-/* In order to use J and JAL within the code_gen_buffer, we require
-   that the buffer not cross a 256MB boundary.  */
-static inline bool cross_256mb(void *addr, size_t size)
-{
-    return ((uintptr_t)addr ^ ((uintptr_t)addr + size)) & ~0x0ffffffful;
-}
-
-/* We weren't able to allocate a buffer without crossing that boundary,
-   so make do with the larger portion of the buffer that doesn't cross.
-   Returns the new base of the buffer, and adjusts code_gen_buffer_size.  */
-static inline void *split_cross_256mb(void *buf1, size_t size1)
-{
-    void *buf2 = (void *)(((uintptr_t)buf1 + size1) & ~0x0ffffffful);
-    size_t size2 = buf1 + size1 - buf2;
-
-    size1 = buf2 - buf1;
-    if (size1 < size2) {
-        size1 = size2;
-        buf1 = buf2;
-    }
-
-    tcg_ctx->code_gen_buffer_size = size1;
-    return buf1;
-}
-#endif
-
-#ifdef USE_STATIC_CODE_GEN_BUFFER
-static uint8_t static_code_gen_buffer[DEFAULT_CODE_GEN_BUFFER_SIZE]
-    __attribute__((aligned(CODE_GEN_ALIGN)));
-
-static bool alloc_code_gen_buffer(size_t tb_size, int splitwx, Error **errp)
-{
-    void *buf, *end;
-    size_t size;
-
-    if (splitwx > 0) {
-        error_setg(errp, "jit split-wx not supported");
-        return false;
-    }
-
-    /* page-align the beginning and end of the buffer */
-    buf = static_code_gen_buffer;
-    end = static_code_gen_buffer + sizeof(static_code_gen_buffer);
-    buf = QEMU_ALIGN_PTR_UP(buf, qemu_real_host_page_size);
-    end = QEMU_ALIGN_PTR_DOWN(end, qemu_real_host_page_size);
-
-    size = end - buf;
-
-    /* Honor a command-line option limiting the size of the buffer.  */
-    if (size > tb_size) {
-        size = QEMU_ALIGN_DOWN(tb_size, qemu_real_host_page_size);
-    }
-    tcg_ctx->code_gen_buffer_size = size;
-
-#ifdef __mips__
-    if (cross_256mb(buf, size)) {
-        buf = split_cross_256mb(buf, size);
-        size = tcg_ctx->code_gen_buffer_size;
-    }
-#endif
-
-    if (qemu_mprotect_rwx(buf, size)) {
-        error_setg_errno(errp, errno, "mprotect of jit buffer");
-        return false;
-    }
-    qemu_madvise(buf, size, QEMU_MADV_HUGEPAGE);
-
-    tcg_ctx->code_gen_buffer = buf;
-    return true;
-}
-#elif defined(_WIN32)
-static bool alloc_code_gen_buffer(size_t size, int splitwx, Error **errp)
-{
-    void *buf;
-
-    if (splitwx > 0) {
-        error_setg(errp, "jit split-wx not supported");
-        return false;
-    }
-
-    buf = VirtualAlloc(NULL, size, MEM_RESERVE | MEM_COMMIT,
-                             PAGE_EXECUTE_READWRITE);
-    if (buf == NULL) {
-        error_setg_win32(errp, GetLastError(),
-                         "allocate %zu bytes for jit buffer", size);
-        return false;
-    }
-
-    tcg_ctx->code_gen_buffer = buf;
-    tcg_ctx->code_gen_buffer_size = size;
-    return true;
-}
-#else
-static bool alloc_code_gen_buffer_anon(size_t size, int prot,
-                                       int flags, Error **errp)
-{
-    void *buf;
-
-    buf = mmap(NULL, size, prot, flags, -1, 0);
-    if (buf == MAP_FAILED) {
-        error_setg_errno(errp, errno,
-                         "allocate %zu bytes for jit buffer", size);
-        return false;
-    }
-    tcg_ctx->code_gen_buffer_size = size;
-
-#ifdef __mips__
-    if (cross_256mb(buf, size)) {
-        /*
-         * Try again, with the original still mapped, to avoid re-acquiring
-         * the same 256mb crossing.
-         */
-        size_t size2;
-        void *buf2 = mmap(NULL, size, prot, flags, -1, 0);
-        switch ((int)(buf2 != MAP_FAILED)) {
-        case 1:
-            if (!cross_256mb(buf2, size)) {
-                /* Success!  Use the new buffer.  */
-                munmap(buf, size);
-                break;
-            }
-            /* Failure.  Work with what we had.  */
-            munmap(buf2, size);
-            /* fallthru */
-        default:
-            /* Split the original buffer.  Free the smaller half.  */
-            buf2 = split_cross_256mb(buf, size);
-            size2 = tcg_ctx->code_gen_buffer_size;
-            if (buf == buf2) {
-                munmap(buf + size2, size - size2);
-            } else {
-                munmap(buf, size - size2);
-            }
-            size = size2;
-            break;
-        }
-        buf = buf2;
-    }
-#endif
-
-    /* Request large pages for the buffer.  */
-    qemu_madvise(buf, size, QEMU_MADV_HUGEPAGE);
-
-    tcg_ctx->code_gen_buffer = buf;
-    return true;
-}
-
-#ifndef CONFIG_TCG_INTERPRETER
-#ifdef CONFIG_POSIX
-#include "qemu/memfd.h"
-
-static bool alloc_code_gen_buffer_splitwx_memfd(size_t size, Error **errp)
-{
-    void *buf_rw = NULL, *buf_rx = MAP_FAILED;
-    int fd = -1;
-
-#ifdef __mips__
-    /* Find space for the RX mapping, vs the 256MiB regions. */
-    if (!alloc_code_gen_buffer_anon(size, PROT_NONE,
-                                    MAP_PRIVATE | MAP_ANONYMOUS |
-                                    MAP_NORESERVE, errp)) {
-        return false;
-    }
-    /* The size of the mapping may have been adjusted. */
-    size = tcg_ctx->code_gen_buffer_size;
-    buf_rx = tcg_ctx->code_gen_buffer;
-#endif
-
-    buf_rw = qemu_memfd_alloc("tcg-jit", size, 0, &fd, errp);
-    if (buf_rw == NULL) {
-        goto fail;
-    }
-
-#ifdef __mips__
-    void *tmp = mmap(buf_rx, size, PROT_READ | PROT_EXEC,
-                     MAP_SHARED | MAP_FIXED, fd, 0);
-    if (tmp != buf_rx) {
-        goto fail_rx;
-    }
-#else
-    buf_rx = mmap(NULL, size, PROT_READ | PROT_EXEC, MAP_SHARED, fd, 0);
-    if (buf_rx == MAP_FAILED) {
-        goto fail_rx;
-    }
-#endif
-
-    close(fd);
-    tcg_ctx->code_gen_buffer = buf_rw;
-    tcg_ctx->code_gen_buffer_size = size;
-    tcg_splitwx_diff = buf_rx - buf_rw;
-
-    /* Request large pages for the buffer and the splitwx.  */
-    qemu_madvise(buf_rw, size, QEMU_MADV_HUGEPAGE);
-    qemu_madvise(buf_rx, size, QEMU_MADV_HUGEPAGE);
-    return true;
-
- fail_rx:
-    error_setg_errno(errp, errno, "failed to map shared memory for execute");
- fail:
-    if (buf_rx != MAP_FAILED) {
-        munmap(buf_rx, size);
-    }
-    if (buf_rw) {
-        munmap(buf_rw, size);
-    }
-    if (fd >= 0) {
-        close(fd);
-    }
-    return false;
-}
-#endif /* CONFIG_POSIX */
-
-#ifdef CONFIG_DARWIN
-#include <mach/mach.h>
-
-extern kern_return_t mach_vm_remap(vm_map_t target_task,
-                                   mach_vm_address_t *target_address,
-                                   mach_vm_size_t size,
-                                   mach_vm_offset_t mask,
-                                   int flags,
-                                   vm_map_t src_task,
-                                   mach_vm_address_t src_address,
-                                   boolean_t copy,
-                                   vm_prot_t *cur_protection,
-                                   vm_prot_t *max_protection,
-                                   vm_inherit_t inheritance);
-
-static bool alloc_code_gen_buffer_splitwx_vmremap(size_t size, Error **errp)
-{
-    kern_return_t ret;
-    mach_vm_address_t buf_rw, buf_rx;
-    vm_prot_t cur_prot, max_prot;
-
-    /* Map the read-write portion via normal anon memory. */
-    if (!alloc_code_gen_buffer_anon(size, PROT_READ | PROT_WRITE,
-                                    MAP_PRIVATE | MAP_ANONYMOUS, errp)) {
-        return false;
-    }
-
-    buf_rw = (mach_vm_address_t)tcg_ctx->code_gen_buffer;
-    buf_rx = 0;
-    ret = mach_vm_remap(mach_task_self(),
-                        &buf_rx,
-                        size,
-                        0,
-                        VM_FLAGS_ANYWHERE,
-                        mach_task_self(),
-                        buf_rw,
-                        false,
-                        &cur_prot,
-                        &max_prot,
-                        VM_INHERIT_NONE);
-    if (ret != KERN_SUCCESS) {
-        /* TODO: Convert "ret" to a human readable error message. */
-        error_setg(errp, "vm_remap for jit splitwx failed");
-        munmap((void *)buf_rw, size);
-        return false;
-    }
-
-    if (mprotect((void *)buf_rx, size, PROT_READ | PROT_EXEC) != 0) {
-        error_setg_errno(errp, errno, "mprotect for jit splitwx");
-        munmap((void *)buf_rx, size);
-        munmap((void *)buf_rw, size);
-        return false;
-    }
-
-    tcg_splitwx_diff = buf_rx - buf_rw;
-    return true;
-}
-#endif /* CONFIG_DARWIN */
-#endif /* CONFIG_TCG_INTERPRETER */
-
-static bool alloc_code_gen_buffer_splitwx(size_t size, Error **errp)
-{
-#ifndef CONFIG_TCG_INTERPRETER
-# ifdef CONFIG_DARWIN
-    return alloc_code_gen_buffer_splitwx_vmremap(size, errp);
-# endif
-# ifdef CONFIG_POSIX
-    return alloc_code_gen_buffer_splitwx_memfd(size, errp);
-# endif
-#endif
-    error_setg(errp, "jit split-wx not supported");
-    return false;
-}
-
-static bool alloc_code_gen_buffer(size_t size, int splitwx, Error **errp)
-{
-    ERRP_GUARD();
-    int prot, flags;
-
-    if (splitwx) {
-        if (alloc_code_gen_buffer_splitwx(size, errp)) {
-            return true;
-        }
-        /*
-         * If splitwx force-on (1), fail;
-         * if splitwx default-on (-1), fall through to splitwx off.
-         */
-        if (splitwx > 0) {
-            return false;
-        }
-        error_free_or_abort(errp);
-    }
-
-    prot = PROT_READ | PROT_WRITE | PROT_EXEC;
-    flags = MAP_PRIVATE | MAP_ANONYMOUS;
-#ifdef CONFIG_TCG_INTERPRETER
-    /* The tcg interpreter does not need execute permission. */
-    prot = PROT_READ | PROT_WRITE;
-#elif defined(CONFIG_DARWIN)
-    /* Applicable to both iOS and macOS (Apple Silicon). */
-    if (!splitwx) {
-        flags |= MAP_JIT;
-    }
-#endif
-
-    return alloc_code_gen_buffer_anon(size, prot, flags, errp);
-}
-#endif /* USE_STATIC_CODE_GEN_BUFFER, WIN32, POSIX */
-
 static bool tb_cmp(const void *ap, const void *bp)
 {
     const TranslationBlock *a = ap;
@@ -1323,19 +919,11 @@ static void tb_htable_init(void)
    size. */
 void tcg_exec_init(unsigned long tb_size, int splitwx)
 {
-    bool ok;
-
     tcg_allowed = true;
     tcg_context_init(&tcg_init_ctx);
     page_init();
     tb_htable_init();
-
-    ok = alloc_code_gen_buffer(size_code_gen_buffer(tb_size),
-                               splitwx, &error_fatal);
-    assert(ok);
-
-    /* TODO: allocating regions is hand-in-glove with code_gen_buffer. */
-    tcg_region_init();
+    tcg_region_init(tb_size, splitwx);
 
 #if defined(CONFIG_SOFTMMU)
     /* There's no guest base to take into account, so go ahead and
diff --git a/tcg/region.c b/tcg/region.c
index af45a0174e..8d88144a22 100644
--- a/tcg/region.c
+++ b/tcg/region.c
@@ -23,6 +23,8 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/units.h"
+#include "qapi/error.h"
 #include "exec/exec-all.h"
 #include "tcg/tcg.h"
 #if !defined(CONFIG_USER_ONLY)
@@ -406,6 +408,408 @@ static size_t tcg_n_regions(void)
 }
 #endif
 
+/* Minimum size of the code gen buffer.  This number is randomly chosen,
+   but not so small that we can't have a fair number of TB's live.  */
+#define MIN_CODE_GEN_BUFFER_SIZE     (1 * MiB)
+
+/* Maximum size of the code gen buffer we'd like to use.  Unless otherwise
+   indicated, this is constrained by the range of direct branches on the
+   host cpu, as used by the TCG implementation of goto_tb.  */
+#if defined(__x86_64__)
+# define MAX_CODE_GEN_BUFFER_SIZE  (2 * GiB)
+#elif defined(__sparc__)
+# define MAX_CODE_GEN_BUFFER_SIZE  (2 * GiB)
+#elif defined(__powerpc64__)
+# define MAX_CODE_GEN_BUFFER_SIZE  (2 * GiB)
+#elif defined(__powerpc__)
+# define MAX_CODE_GEN_BUFFER_SIZE  (32 * MiB)
+#elif defined(__aarch64__)
+# define MAX_CODE_GEN_BUFFER_SIZE  (2 * GiB)
+#elif defined(__s390x__)
+  /* We have a +- 4GB range on the branches; leave some slop.  */
+# define MAX_CODE_GEN_BUFFER_SIZE  (3 * GiB)
+#elif defined(__mips__)
+  /* We have a 256MB branch region, but leave room to make sure the
+     main executable is also within that region.  */
+# define MAX_CODE_GEN_BUFFER_SIZE  (128 * MiB)
+#else
+# define MAX_CODE_GEN_BUFFER_SIZE  ((size_t)-1)
+#endif
+
+#if TCG_TARGET_REG_BITS == 32
+#define DEFAULT_CODE_GEN_BUFFER_SIZE_1 (32 * MiB)
+#ifdef CONFIG_USER_ONLY
+/*
+ * For user mode on smaller 32 bit systems we may run into trouble
+ * allocating big chunks of data in the right place. On these systems
+ * we utilise a static code generation buffer directly in the binary.
+ */
+#define USE_STATIC_CODE_GEN_BUFFER
+#endif
+#else /* TCG_TARGET_REG_BITS == 64 */
+#ifdef CONFIG_USER_ONLY
+/*
+ * As user-mode emulation typically means running multiple instances
+ * of the translator don't go too nuts with our default code gen
+ * buffer lest we make things too hard for the OS.
+ */
+#define DEFAULT_CODE_GEN_BUFFER_SIZE_1 (128 * MiB)
+#else
+/*
+ * We expect most system emulation to run one or two guests per host.
+ * Users running large scale system emulation may want to tweak their
+ * runtime setup via the tb-size control on the command line.
+ */
+#define DEFAULT_CODE_GEN_BUFFER_SIZE_1 (1 * GiB)
+#endif
+#endif
+
+#define DEFAULT_CODE_GEN_BUFFER_SIZE \
+  (DEFAULT_CODE_GEN_BUFFER_SIZE_1 < MAX_CODE_GEN_BUFFER_SIZE \
+   ? DEFAULT_CODE_GEN_BUFFER_SIZE_1 : MAX_CODE_GEN_BUFFER_SIZE)
+
+static size_t size_code_gen_buffer(size_t tb_size)
+{
+    /* Size the buffer.  */
+    if (tb_size == 0) {
+        size_t phys_mem = qemu_get_host_physmem();
+        if (phys_mem == 0) {
+            tb_size = DEFAULT_CODE_GEN_BUFFER_SIZE;
+        } else {
+            tb_size = MIN(DEFAULT_CODE_GEN_BUFFER_SIZE, phys_mem / 8);
+        }
+    }
+    if (tb_size < MIN_CODE_GEN_BUFFER_SIZE) {
+        tb_size = MIN_CODE_GEN_BUFFER_SIZE;
+    }
+    if (tb_size > MAX_CODE_GEN_BUFFER_SIZE) {
+        tb_size = MAX_CODE_GEN_BUFFER_SIZE;
+    }
+    return tb_size;
+}
+
+#ifdef __mips__
+/* In order to use J and JAL within the code_gen_buffer, we require
+   that the buffer not cross a 256MB boundary.  */
+static inline bool cross_256mb(void *addr, size_t size)
+{
+    return ((uintptr_t)addr ^ ((uintptr_t)addr + size)) & ~0x0ffffffful;
+}
+
+/* We weren't able to allocate a buffer without crossing that boundary,
+   so make do with the larger portion of the buffer that doesn't cross.
+   Returns the new base of the buffer, and adjusts code_gen_buffer_size.  */
+static inline void *split_cross_256mb(void *buf1, size_t size1)
+{
+    void *buf2 = (void *)(((uintptr_t)buf1 + size1) & ~0x0ffffffful);
+    size_t size2 = buf1 + size1 - buf2;
+
+    size1 = buf2 - buf1;
+    if (size1 < size2) {
+        size1 = size2;
+        buf1 = buf2;
+    }
+
+    tcg_ctx->code_gen_buffer_size = size1;
+    return buf1;
+}
+#endif
+
+#ifdef USE_STATIC_CODE_GEN_BUFFER
+static uint8_t static_code_gen_buffer[DEFAULT_CODE_GEN_BUFFER_SIZE]
+    __attribute__((aligned(CODE_GEN_ALIGN)));
+
+static bool alloc_code_gen_buffer(size_t tb_size, int splitwx, Error **errp)
+{
+    void *buf, *end;
+    size_t size;
+
+    if (splitwx > 0) {
+        error_setg(errp, "jit split-wx not supported");
+        return false;
+    }
+
+    /* page-align the beginning and end of the buffer */
+    buf = static_code_gen_buffer;
+    end = static_code_gen_buffer + sizeof(static_code_gen_buffer);
+    buf = QEMU_ALIGN_PTR_UP(buf, qemu_real_host_page_size);
+    end = QEMU_ALIGN_PTR_DOWN(end, qemu_real_host_page_size);
+
+    size = end - buf;
+
+    /* Honor a command-line option limiting the size of the buffer.  */
+    if (size > tb_size) {
+        size = QEMU_ALIGN_DOWN(tb_size, qemu_real_host_page_size);
+    }
+    tcg_ctx->code_gen_buffer_size = size;
+
+#ifdef __mips__
+    if (cross_256mb(buf, size)) {
+        buf = split_cross_256mb(buf, size);
+        size = tcg_ctx->code_gen_buffer_size;
+    }
+#endif
+
+    if (qemu_mprotect_rwx(buf, size)) {
+        error_setg_errno(errp, errno, "mprotect of jit buffer");
+        return false;
+    }
+    qemu_madvise(buf, size, QEMU_MADV_HUGEPAGE);
+
+    tcg_ctx->code_gen_buffer = buf;
+    return true;
+}
+#elif defined(_WIN32)
+static bool alloc_code_gen_buffer(size_t size, int splitwx, Error **errp)
+{
+    void *buf;
+
+    if (splitwx > 0) {
+        error_setg(errp, "jit split-wx not supported");
+        return false;
+    }
+
+    buf = VirtualAlloc(NULL, size, MEM_RESERVE | MEM_COMMIT,
+                             PAGE_EXECUTE_READWRITE);
+    if (buf == NULL) {
+        error_setg_win32(errp, GetLastError(),
+                         "allocate %zu bytes for jit buffer", size);
+        return false;
+    }
+
+    tcg_ctx->code_gen_buffer = buf;
+    tcg_ctx->code_gen_buffer_size = size;
+    return true;
+}
+#else
+static bool alloc_code_gen_buffer_anon(size_t size, int prot,
+                                       int flags, Error **errp)
+{
+    void *buf;
+
+    buf = mmap(NULL, size, prot, flags, -1, 0);
+    if (buf == MAP_FAILED) {
+        error_setg_errno(errp, errno,
+                         "allocate %zu bytes for jit buffer", size);
+        return false;
+    }
+    tcg_ctx->code_gen_buffer_size = size;
+
+#ifdef __mips__
+    if (cross_256mb(buf, size)) {
+        /*
+         * Try again, with the original still mapped, to avoid re-acquiring
+         * the same 256mb crossing.
+         */
+        size_t size2;
+        void *buf2 = mmap(NULL, size, prot, flags, -1, 0);
+        switch ((int)(buf2 != MAP_FAILED)) {
+        case 1:
+            if (!cross_256mb(buf2, size)) {
+                /* Success!  Use the new buffer.  */
+                munmap(buf, size);
+                break;
+            }
+            /* Failure.  Work with what we had.  */
+            munmap(buf2, size);
+            /* fallthru */
+        default:
+            /* Split the original buffer.  Free the smaller half.  */
+            buf2 = split_cross_256mb(buf, size);
+            size2 = tcg_ctx->code_gen_buffer_size;
+            if (buf == buf2) {
+                munmap(buf + size2, size - size2);
+            } else {
+                munmap(buf, size - size2);
+            }
+            size = size2;
+            break;
+        }
+        buf = buf2;
+    }
+#endif
+
+    /* Request large pages for the buffer.  */
+    qemu_madvise(buf, size, QEMU_MADV_HUGEPAGE);
+
+    tcg_ctx->code_gen_buffer = buf;
+    return true;
+}
+
+#ifndef CONFIG_TCG_INTERPRETER
+#ifdef CONFIG_POSIX
+#include "qemu/memfd.h"
+
+static bool alloc_code_gen_buffer_splitwx_memfd(size_t size, Error **errp)
+{
+    void *buf_rw = NULL, *buf_rx = MAP_FAILED;
+    int fd = -1;
+
+#ifdef __mips__
+    /* Find space for the RX mapping, vs the 256MiB regions. */
+    if (!alloc_code_gen_buffer_anon(size, PROT_NONE,
+                                    MAP_PRIVATE | MAP_ANONYMOUS |
+                                    MAP_NORESERVE, errp)) {
+        return false;
+    }
+    /* The size of the mapping may have been adjusted. */
+    size = tcg_ctx->code_gen_buffer_size;
+    buf_rx = tcg_ctx->code_gen_buffer;
+#endif
+
+    buf_rw = qemu_memfd_alloc("tcg-jit", size, 0, &fd, errp);
+    if (buf_rw == NULL) {
+        goto fail;
+    }
+
+#ifdef __mips__
+    void *tmp = mmap(buf_rx, size, PROT_READ | PROT_EXEC,
+                     MAP_SHARED | MAP_FIXED, fd, 0);
+    if (tmp != buf_rx) {
+        goto fail_rx;
+    }
+#else
+    buf_rx = mmap(NULL, size, PROT_READ | PROT_EXEC, MAP_SHARED, fd, 0);
+    if (buf_rx == MAP_FAILED) {
+        goto fail_rx;
+    }
+#endif
+
+    close(fd);
+    tcg_ctx->code_gen_buffer = buf_rw;
+    tcg_ctx->code_gen_buffer_size = size;
+    tcg_splitwx_diff = buf_rx - buf_rw;
+
+    /* Request large pages for the buffer and the splitwx.  */
+    qemu_madvise(buf_rw, size, QEMU_MADV_HUGEPAGE);
+    qemu_madvise(buf_rx, size, QEMU_MADV_HUGEPAGE);
+    return true;
+
+ fail_rx:
+    error_setg_errno(errp, errno, "failed to map shared memory for execute");
+ fail:
+    if (buf_rx != MAP_FAILED) {
+        munmap(buf_rx, size);
+    }
+    if (buf_rw) {
+        munmap(buf_rw, size);
+    }
+    if (fd >= 0) {
+        close(fd);
+    }
+    return false;
+}
+#endif /* CONFIG_POSIX */
+
+#ifdef CONFIG_DARWIN
+#include <mach/mach.h>
+
+extern kern_return_t mach_vm_remap(vm_map_t target_task,
+                                   mach_vm_address_t *target_address,
+                                   mach_vm_size_t size,
+                                   mach_vm_offset_t mask,
+                                   int flags,
+                                   vm_map_t src_task,
+                                   mach_vm_address_t src_address,
+                                   boolean_t copy,
+                                   vm_prot_t *cur_protection,
+                                   vm_prot_t *max_protection,
+                                   vm_inherit_t inheritance);
+
+static bool alloc_code_gen_buffer_splitwx_vmremap(size_t size, Error **errp)
+{
+    kern_return_t ret;
+    mach_vm_address_t buf_rw, buf_rx;
+    vm_prot_t cur_prot, max_prot;
+
+    /* Map the read-write portion via normal anon memory. */
+    if (!alloc_code_gen_buffer_anon(size, PROT_READ | PROT_WRITE,
+                                    MAP_PRIVATE | MAP_ANONYMOUS, errp)) {
+        return false;
+    }
+
+    buf_rw = (mach_vm_address_t)tcg_ctx->code_gen_buffer;
+    buf_rx = 0;
+    ret = mach_vm_remap(mach_task_self(),
+                        &buf_rx,
+                        size,
+                        0,
+                        VM_FLAGS_ANYWHERE,
+                        mach_task_self(),
+                        buf_rw,
+                        false,
+                        &cur_prot,
+                        &max_prot,
+                        VM_INHERIT_NONE);
+    if (ret != KERN_SUCCESS) {
+        /* TODO: Convert "ret" to a human readable error message. */
+        error_setg(errp, "vm_remap for jit splitwx failed");
+        munmap((void *)buf_rw, size);
+        return false;
+    }
+
+    if (mprotect((void *)buf_rx, size, PROT_READ | PROT_EXEC) != 0) {
+        error_setg_errno(errp, errno, "mprotect for jit splitwx");
+        munmap((void *)buf_rx, size);
+        munmap((void *)buf_rw, size);
+        return false;
+    }
+
+    tcg_splitwx_diff = buf_rx - buf_rw;
+    return true;
+}
+#endif /* CONFIG_DARWIN */
+#endif /* CONFIG_TCG_INTERPRETER */
+
+static bool alloc_code_gen_buffer_splitwx(size_t size, Error **errp)
+{
+#ifndef CONFIG_TCG_INTERPRETER
+# ifdef CONFIG_DARWIN
+    return alloc_code_gen_buffer_splitwx_vmremap(size, errp);
+# endif
+# ifdef CONFIG_POSIX
+    return alloc_code_gen_buffer_splitwx_memfd(size, errp);
+# endif
+#endif
+    error_setg(errp, "jit split-wx not supported");
+    return false;
+}
+
+static bool alloc_code_gen_buffer(size_t size, int splitwx, Error **errp)
+{
+    ERRP_GUARD();
+    int prot, flags;
+
+    if (splitwx) {
+        if (alloc_code_gen_buffer_splitwx(size, errp)) {
+            return true;
+        }
+        /*
+         * If splitwx force-on (1), fail;
+         * if splitwx default-on (-1), fall through to splitwx off.
+         */
+        if (splitwx > 0) {
+            return false;
+        }
+        error_free_or_abort(errp);
+    }
+
+    prot = PROT_READ | PROT_WRITE | PROT_EXEC;
+    flags = MAP_PRIVATE | MAP_ANONYMOUS;
+#ifdef CONFIG_TCG_INTERPRETER
+    /* The tcg interpreter does not need execute permission. */
+    prot = PROT_READ | PROT_WRITE;
+#elif defined(CONFIG_DARWIN)
+    /* Applicable to both iOS and macOS (Apple Silicon). */
+    if (!splitwx) {
+        flags |= MAP_JIT;
+    }
+#endif
+
+    return alloc_code_gen_buffer_anon(size, prot, flags, errp);
+}
+#endif /* USE_STATIC_CODE_GEN_BUFFER, WIN32, POSIX */
+
 /*
  * Initializes region partitioning.
  *
@@ -434,17 +838,24 @@ static size_t tcg_n_regions(void)
  * in practice. Multi-threaded guests share most if not all of their translated
  * code, which makes parallel code generation less appealing than in softmmu.
  */
-void tcg_region_init(void)
+void tcg_region_init(size_t tb_size, int splitwx)
 {
-    void *buf = tcg_init_ctx.code_gen_buffer;
-    void *aligned;
-    size_t size = tcg_init_ctx.code_gen_buffer_size;
-    size_t page_size = qemu_real_host_page_size;
+    void *buf, *aligned;
+    size_t size;
+    size_t page_size;
     size_t region_size;
     size_t n_regions;
     size_t i;
     uintptr_t splitwx_diff;
+    bool ok;
 
+    ok = alloc_code_gen_buffer(size_code_gen_buffer(tb_size),
+                               splitwx, &error_fatal);
+    assert(ok);
+
+    buf = tcg_init_ctx.code_gen_buffer;
+    size = tcg_init_ctx.code_gen_buffer_size;
+    page_size = qemu_real_host_page_size;
     n_regions = tcg_n_regions();
 
     /* The first region will be 'aligned - buf' bytes larger than the others */
-- 
2.25.1


