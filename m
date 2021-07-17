Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C2D73CC6BE
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Jul 2021 01:23:13 +0200 (CEST)
Received: from localhost ([::1]:58604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4teK-0004gx-1r
	for lists+qemu-devel@lfdr.de; Sat, 17 Jul 2021 19:23:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m4tcU-0001p1-DK
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 19:21:18 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:44715)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m4tcO-0000jI-S4
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 19:21:18 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 f10-20020a05600c4e8ab029023e8d74d693so3047000wmq.3
 for <qemu-devel@nongnu.org>; Sat, 17 Jul 2021 16:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7xrqCHIReux/ltyywe/O+adH4mu57w6rfCAz7uRcwHA=;
 b=Q9Lyvi0fK+AMVLQ5mnBGs257omEEMSyr1KrUxkajAiZkCUe9Rqxg5sbRn/gOf90C4x
 FVimpcYwV1iAOGfcjxn8ezf6M+1/UcCusLtMKeK+dNcSjPhkDHlYFuVneFLSCN2OiZ6q
 MBuEuiSvfJBEtf8oYEnrOeCrNBpVo7E1kbPTWvMrm0d4NTylK1JJmdNZ6E1z04Axt5uG
 nJE772bq0rT4la2jH/tZi0UHHmKeWSrd8dJ0NcFfjqsF5VdTrVCxyHmOM9eoS0pjM8+I
 HM2Fm1MRiQamqi1AodgA6jmSICy50YWSQnm9cKDiOu+QzBJotSoOK0qL0S6PbUH7HvJb
 Cllg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7xrqCHIReux/ltyywe/O+adH4mu57w6rfCAz7uRcwHA=;
 b=FDn47gOSvOzEGt/zSyhWEmaR1KwSdZChedwF+HLNdic5ANxVpn8HDfU6+5/IVc49JQ
 LQUapT0uVAb7pDJgzFe8SgVY8Ip4dBbqnmIHx2ht2mo609J9s/GawJf85Vi0X5jg3IYa
 dVk/nlFkSTHHEA/E/yNWzn+UiSgRAeOlWNNEbsYlBmstNM8mLUnB5NnT7cQpTFtWREaN
 0k5orvey84YMbqMdSOLf/N9QU1SVXNpZ7QtOEz4qcwgwLPl5cjAF0raJdCV8xof8hte+
 9tm/xNL8Ogjs9nwgXU19B+4s9Xf1dMRQPads5dzSoGKf6mR3xPiKpX4IucvX8O3YU0Hb
 aSgA==
X-Gm-Message-State: AOAM532nfz+UrPXCvzgI16Ct43CNwhDFh00iWCi6O2gGlii1er6yC2H+
 5rJkIpb+Sa4bUoIPhzYTXeySRtyNwWQkSA==
X-Google-Smtp-Source: ABdhPJy1gtifyq+DGmjqhFwAdYdN46K68SAUWH5eLe4IPtT2mhEiReVd9o7WG0VACioB2eE02aCaJA==
X-Received: by 2002:a7b:c84d:: with SMTP id c13mr24870600wml.30.1626564071244; 
 Sat, 17 Jul 2021 16:21:11 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id o15sm7082517wmh.40.2021.07.17.16.21.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Jul 2021 16:21:10 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.2 07/10] linux-user: Split linux-user internals out of
 qemu.h
Date: Sun, 18 Jul 2021 00:21:00 +0100
Message-Id: <20210717232103.18047-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210717232103.18047-1-peter.maydell@linaro.org>
References: <20210717232103.18047-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
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
Cc: Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

qemu.h is included in various non-linux-user files (which
mostly want the TaskState struct and the functions for
doing usermode access to guest addresses like lock_user(),
unlock_user(), get_user*(), etc).

Split out the parts that are only used in linux-user itself
into a new user-internals.h. This leaves qemu.h with basically
three things:
 * the definition of the TaskState struct
 * the user-access functions and macros
 * do_brk()
all of which are needed by code outside linux-user that
includes qemu.h.

The addition of all the extra #include lines was done with
  sed -i '/include.*qemu\.h/a #include "user-internals.h"' $(git grep -l 'include.*qemu\.h' linux-user)
(and then undoing the change to fpa11.h).

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 linux-user/qemu.h                | 164 +--------------------------
 linux-user/user-internals.h      | 184 +++++++++++++++++++++++++++++++
 linux-user/aarch64/cpu_loop.c    |   1 +
 linux-user/aarch64/signal.c      |   1 +
 linux-user/alpha/cpu_loop.c      |   1 +
 linux-user/alpha/signal.c        |   1 +
 linux-user/arm/cpu_loop.c        |   1 +
 linux-user/arm/signal.c          |   1 +
 linux-user/cris/cpu_loop.c       |   1 +
 linux-user/cris/signal.c         |   1 +
 linux-user/elfload.c             |   1 +
 linux-user/exit.c                |   1 +
 linux-user/fd-trans.c            |   1 +
 linux-user/flatload.c            |   1 +
 linux-user/hexagon/cpu_loop.c    |   1 +
 linux-user/hexagon/signal.c      |   1 +
 linux-user/hppa/cpu_loop.c       |   1 +
 linux-user/hppa/signal.c         |   1 +
 linux-user/i386/cpu_loop.c       |   1 +
 linux-user/i386/signal.c         |   1 +
 linux-user/linuxload.c           |   1 +
 linux-user/m68k/cpu_loop.c       |   1 +
 linux-user/m68k/signal.c         |   1 +
 linux-user/main.c                |   1 +
 linux-user/microblaze/cpu_loop.c |   1 +
 linux-user/microblaze/signal.c   |   1 +
 linux-user/mips/cpu_loop.c       |   1 +
 linux-user/mips/signal.c         |   1 +
 linux-user/mmap.c                |   1 +
 linux-user/nios2/cpu_loop.c      |   1 +
 linux-user/nios2/signal.c        |   1 +
 linux-user/openrisc/cpu_loop.c   |   1 +
 linux-user/openrisc/signal.c     |   1 +
 linux-user/ppc/cpu_loop.c        |   1 +
 linux-user/ppc/signal.c          |   1 +
 linux-user/riscv/cpu_loop.c      |   1 +
 linux-user/riscv/signal.c        |   1 +
 linux-user/s390x/cpu_loop.c      |   1 +
 linux-user/s390x/signal.c        |   1 +
 linux-user/semihost.c            |   1 +
 linux-user/sh4/cpu_loop.c        |   1 +
 linux-user/sh4/signal.c          |   1 +
 linux-user/signal.c              |   1 +
 linux-user/sparc/cpu_loop.c      |   1 +
 linux-user/sparc/signal.c        |   1 +
 linux-user/strace.c              |   1 +
 linux-user/syscall.c             |   1 +
 linux-user/uaccess.c             |   1 +
 linux-user/uname.c               |   1 +
 linux-user/vm86.c                |   1 +
 linux-user/xtensa/cpu_loop.c     |   1 +
 linux-user/xtensa/signal.c       |   1 +
 52 files changed, 235 insertions(+), 163 deletions(-)
 create mode 100644 linux-user/user-internals.h

diff --git a/linux-user/qemu.h b/linux-user/qemu.h
index a82a46236e6..92290a55c0d 100644
--- a/linux-user/qemu.h
+++ b/linux-user/qemu.h
@@ -1,7 +1,6 @@
 #ifndef QEMU_H
 #define QEMU_H
 
-#include "hostdep.h"
 #include "cpu.h"
 #include "exec/exec-all.h"
 #include "exec/cpu_ldst.h"
@@ -10,7 +9,6 @@
 
 #include "exec/user/abitypes.h"
 
-#include "exec/user/thunk.h"
 #include "syscall_defs.h"
 #include "target_syscall.h"
 #include "exec/gdbstub.h"
@@ -166,93 +164,9 @@ typedef struct TaskState {
     struct target_sigaltstack sigaltstack_used;
 } __attribute__((aligned(16))) TaskState;
 
-extern char *exec_path;
-void init_task_state(TaskState *ts);
-void task_settid(TaskState *);
-void stop_all_tasks(void);
-extern const char *qemu_uname_release;
-extern unsigned long mmap_min_addr;
-
-typedef struct IOCTLEntry IOCTLEntry;
-
-typedef abi_long do_ioctl_fn(const IOCTLEntry *ie, uint8_t *buf_temp,
-                             int fd, int cmd, abi_long arg);
-
-struct IOCTLEntry {
-    int target_cmd;
-    unsigned int host_cmd;
-    const char *name;
-    int access;
-    do_ioctl_fn *do_ioctl;
-    const argtype arg_type[5];
-};
-
-extern IOCTLEntry ioctl_entries[];
-
-#define IOC_R 0x0001
-#define IOC_W 0x0002
-#define IOC_RW (IOC_R | IOC_W)
-
-/*
- * Returns true if the image uses the FDPIC ABI. If this is the case,
- * we have to provide some information (loadmap, pt_dynamic_info) such
- * that the program can be relocated adequately. This is also useful
- * when handling signals.
- */
-int info_is_fdpic(struct image_info *info);
-
-void target_set_brk(abi_ulong new_brk);
-abi_long do_brk(abi_ulong new_brk);
-void syscall_init(void);
-abi_long do_syscall(void *cpu_env, int num, abi_long arg1,
-                    abi_long arg2, abi_long arg3, abi_long arg4,
-                    abi_long arg5, abi_long arg6, abi_long arg7,
-                    abi_long arg8);
-extern __thread CPUState *thread_cpu;
-void cpu_loop(CPUArchState *env);
-const char *target_strerror(int err);
-int get_osversion(void);
-void init_qemu_uname_release(void);
-void fork_start(void);
-void fork_end(int child);
-
-/**
- * probe_guest_base:
- * @image_name: the executable being loaded
- * @loaddr: the lowest fixed address in the executable
- * @hiaddr: the highest fixed address in the executable
- *
- * Creates the initial guest address space in the host memory space.
- *
- * If @loaddr == 0, then no address in the executable is fixed,
- * i.e. it is fully relocatable.  In that case @hiaddr is the size
- * of the executable.
- *
- * This function will not return if a valid value for guest_base
- * cannot be chosen.  On return, the executable loader can expect
- *
- *    target_mmap(loaddr, hiaddr - loaddr, ...)
- *
- * to succeed.
- */
-void probe_guest_base(const char *image_name,
-                      abi_ulong loaddr, abi_ulong hiaddr);
-
 #include "qemu/log.h"
 
-/* syscall.c */
-int host_to_target_waitstatus(int status);
-
-#ifdef TARGET_I386
-/* vm86.c */
-void save_v86_state(CPUX86State *env);
-void handle_vm86_trap(CPUX86State *env, int trapno);
-void handle_vm86_fault(CPUX86State *env);
-int do_vm86(CPUX86State *env, long subfunction, abi_ulong v86_addr);
-#elif defined(TARGET_SPARC64)
-void sparc64_set_context(CPUSPARCState *env);
-void sparc64_get_context(CPUSPARCState *env);
-#endif
+abi_long do_brk(abi_ulong new_brk);
 
 /* user access */
 
@@ -437,80 +351,4 @@ void *lock_user_string(abi_ulong guest_addr);
     unlock_user(host_ptr, guest_addr, (copy) ? sizeof(*host_ptr) : 0)
 
 #include <pthread.h>
-
-static inline int is_error(abi_long ret)
-{
-    return (abi_ulong)ret >= (abi_ulong)(-4096);
-}
-
-#if TARGET_ABI_BITS == 32
-static inline uint64_t target_offset64(uint32_t word0, uint32_t word1)
-{
-#ifdef TARGET_WORDS_BIGENDIAN
-    return ((uint64_t)word0 << 32) | word1;
-#else
-    return ((uint64_t)word1 << 32) | word0;
-#endif
-}
-#else /* TARGET_ABI_BITS == 32 */
-static inline uint64_t target_offset64(uint64_t word0, uint64_t word1)
-{
-    return word0;
-}
-#endif /* TARGET_ABI_BITS != 32 */
-
-void print_termios(void *arg);
-
-/* ARM EABI and MIPS expect 64bit types aligned even on pairs or registers */
-#ifdef TARGET_ARM
-static inline int regpairs_aligned(void *cpu_env, int num)
-{
-    return ((((CPUARMState *)cpu_env)->eabi) == 1) ;
-}
-#elif defined(TARGET_MIPS) && (TARGET_ABI_BITS == 32)
-static inline int regpairs_aligned(void *cpu_env, int num) { return 1; }
-#elif defined(TARGET_PPC) && !defined(TARGET_PPC64)
-/*
- * SysV AVI for PPC32 expects 64bit parameters to be passed on odd/even pairs
- * of registers which translates to the same as ARM/MIPS, because we start with
- * r3 as arg1
- */
-static inline int regpairs_aligned(void *cpu_env, int num) { return 1; }
-#elif defined(TARGET_SH4)
-/* SH4 doesn't align register pairs, except for p{read,write}64 */
-static inline int regpairs_aligned(void *cpu_env, int num)
-{
-    switch (num) {
-    case TARGET_NR_pread64:
-    case TARGET_NR_pwrite64:
-        return 1;
-
-    default:
-        return 0;
-    }
-}
-#elif defined(TARGET_XTENSA)
-static inline int regpairs_aligned(void *cpu_env, int num) { return 1; }
-#elif defined(TARGET_HEXAGON)
-static inline int regpairs_aligned(void *cpu_env, int num) { return 1; }
-#else
-static inline int regpairs_aligned(void *cpu_env, int num) { return 0; }
-#endif
-
-/**
- * preexit_cleanup: housekeeping before the guest exits
- *
- * env: the CPU state
- * code: the exit code
- */
-void preexit_cleanup(CPUArchState *env, int code);
-
-/*
- * Include target-specific struct and function definitions;
- * they may need access to the target-independent structures
- * above, so include them last.
- */
-#include "target_cpu.h"
-#include "target_structs.h"
-
 #endif /* QEMU_H */
diff --git a/linux-user/user-internals.h b/linux-user/user-internals.h
new file mode 100644
index 00000000000..1729a8b62e1
--- /dev/null
+++ b/linux-user/user-internals.h
@@ -0,0 +1,184 @@
+/*
+ * user-internals.h: prototypes etc internal to the linux-user implementation
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License as published by
+ *  the Free Software Foundation; either version 2 of the License, or
+ *  (at your option) any later version.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *  GNU General Public License for more details.
+ *
+ *  You should have received a copy of the GNU General Public License
+ *  along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef LINUX_USER_USER_INTERNALS_H
+#define LINUX_USER_USER_INTERNALS_H
+
+#include "hostdep.h"
+#include "exec/user/thunk.h"
+
+extern char *exec_path;
+void init_task_state(TaskState *ts);
+void task_settid(TaskState *);
+void stop_all_tasks(void);
+extern const char *qemu_uname_release;
+extern unsigned long mmap_min_addr;
+
+typedef struct IOCTLEntry IOCTLEntry;
+
+typedef abi_long do_ioctl_fn(const IOCTLEntry *ie, uint8_t *buf_temp,
+                             int fd, int cmd, abi_long arg);
+
+struct IOCTLEntry {
+    int target_cmd;
+    unsigned int host_cmd;
+    const char *name;
+    int access;
+    do_ioctl_fn *do_ioctl;
+    const argtype arg_type[5];
+};
+
+extern IOCTLEntry ioctl_entries[];
+
+#define IOC_R 0x0001
+#define IOC_W 0x0002
+#define IOC_RW (IOC_R | IOC_W)
+
+/*
+ * Returns true if the image uses the FDPIC ABI. If this is the case,
+ * we have to provide some information (loadmap, pt_dynamic_info) such
+ * that the program can be relocated adequately. This is also useful
+ * when handling signals.
+ */
+int info_is_fdpic(struct image_info *info);
+
+void target_set_brk(abi_ulong new_brk);
+void syscall_init(void);
+abi_long do_syscall(void *cpu_env, int num, abi_long arg1,
+                    abi_long arg2, abi_long arg3, abi_long arg4,
+                    abi_long arg5, abi_long arg6, abi_long arg7,
+                    abi_long arg8);
+extern __thread CPUState *thread_cpu;
+void cpu_loop(CPUArchState *env);
+const char *target_strerror(int err);
+int get_osversion(void);
+void init_qemu_uname_release(void);
+void fork_start(void);
+void fork_end(int child);
+
+/**
+ * probe_guest_base:
+ * @image_name: the executable being loaded
+ * @loaddr: the lowest fixed address in the executable
+ * @hiaddr: the highest fixed address in the executable
+ *
+ * Creates the initial guest address space in the host memory space.
+ *
+ * If @loaddr == 0, then no address in the executable is fixed,
+ * i.e. it is fully relocatable.  In that case @hiaddr is the size
+ * of the executable.
+ *
+ * This function will not return if a valid value for guest_base
+ * cannot be chosen.  On return, the executable loader can expect
+ *
+ *    target_mmap(loaddr, hiaddr - loaddr, ...)
+ *
+ * to succeed.
+ */
+void probe_guest_base(const char *image_name,
+                      abi_ulong loaddr, abi_ulong hiaddr);
+
+/* syscall.c */
+int host_to_target_waitstatus(int status);
+
+#ifdef TARGET_I386
+/* vm86.c */
+void save_v86_state(CPUX86State *env);
+void handle_vm86_trap(CPUX86State *env, int trapno);
+void handle_vm86_fault(CPUX86State *env);
+int do_vm86(CPUX86State *env, long subfunction, abi_ulong v86_addr);
+#elif defined(TARGET_SPARC64)
+void sparc64_set_context(CPUSPARCState *env);
+void sparc64_get_context(CPUSPARCState *env);
+#endif
+
+static inline int is_error(abi_long ret)
+{
+    return (abi_ulong)ret >= (abi_ulong)(-4096);
+}
+
+#if TARGET_ABI_BITS == 32
+static inline uint64_t target_offset64(uint32_t word0, uint32_t word1)
+{
+#ifdef TARGET_WORDS_BIGENDIAN
+    return ((uint64_t)word0 << 32) | word1;
+#else
+    return ((uint64_t)word1 << 32) | word0;
+#endif
+}
+#else /* TARGET_ABI_BITS == 32 */
+static inline uint64_t target_offset64(uint64_t word0, uint64_t word1)
+{
+    return word0;
+}
+#endif /* TARGET_ABI_BITS != 32 */
+
+void print_termios(void *arg);
+
+/* ARM EABI and MIPS expect 64bit types aligned even on pairs or registers */
+#ifdef TARGET_ARM
+static inline int regpairs_aligned(void *cpu_env, int num)
+{
+    return ((((CPUARMState *)cpu_env)->eabi) == 1) ;
+}
+#elif defined(TARGET_MIPS) && (TARGET_ABI_BITS == 32)
+static inline int regpairs_aligned(void *cpu_env, int num) { return 1; }
+#elif defined(TARGET_PPC) && !defined(TARGET_PPC64)
+/*
+ * SysV AVI for PPC32 expects 64bit parameters to be passed on odd/even pairs
+ * of registers which translates to the same as ARM/MIPS, because we start with
+ * r3 as arg1
+ */
+static inline int regpairs_aligned(void *cpu_env, int num) { return 1; }
+#elif defined(TARGET_SH4)
+/* SH4 doesn't align register pairs, except for p{read,write}64 */
+static inline int regpairs_aligned(void *cpu_env, int num)
+{
+    switch (num) {
+    case TARGET_NR_pread64:
+    case TARGET_NR_pwrite64:
+        return 1;
+
+    default:
+        return 0;
+    }
+}
+#elif defined(TARGET_XTENSA)
+static inline int regpairs_aligned(void *cpu_env, int num) { return 1; }
+#elif defined(TARGET_HEXAGON)
+static inline int regpairs_aligned(void *cpu_env, int num) { return 1; }
+#else
+static inline int regpairs_aligned(void *cpu_env, int num) { return 0; }
+#endif
+
+/**
+ * preexit_cleanup: housekeeping before the guest exits
+ *
+ * env: the CPU state
+ * code: the exit code
+ */
+void preexit_cleanup(CPUArchState *env, int code);
+
+/*
+ * Include target-specific struct and function definitions;
+ * they may need access to the target-independent structures
+ * above, so include them last.
+ */
+#include "target_cpu.h"
+#include "target_structs.h"
+
+#endif
diff --git a/linux-user/aarch64/cpu_loop.c b/linux-user/aarch64/cpu_loop.c
index 459efdf2ec2..e4484778681 100644
--- a/linux-user/aarch64/cpu_loop.c
+++ b/linux-user/aarch64/cpu_loop.c
@@ -20,6 +20,7 @@
 #include "qemu/osdep.h"
 #include "qemu-common.h"
 #include "qemu.h"
+#include "user-internals.h"
 #include "cpu_loop-common.h"
 #include "sighandling.h"
 #include "qemu/guest-random.h"
diff --git a/linux-user/aarch64/signal.c b/linux-user/aarch64/signal.c
index 75073dd3ec6..56d4b4460f3 100644
--- a/linux-user/aarch64/signal.c
+++ b/linux-user/aarch64/signal.c
@@ -18,6 +18,7 @@
  */
 #include "qemu/osdep.h"
 #include "qemu.h"
+#include "user-internals.h"
 #include "signal-common.h"
 #include "sighandling.h"
 #include "linux-user/trace.h"
diff --git a/linux-user/alpha/cpu_loop.c b/linux-user/alpha/cpu_loop.c
index 2939ef5c845..3082dbf7b15 100644
--- a/linux-user/alpha/cpu_loop.c
+++ b/linux-user/alpha/cpu_loop.c
@@ -20,6 +20,7 @@
 #include "qemu/osdep.h"
 #include "qemu-common.h"
 #include "qemu.h"
+#include "user-internals.h"
 #include "cpu_loop-common.h"
 #include "sighandling.h"
 
diff --git a/linux-user/alpha/signal.c b/linux-user/alpha/signal.c
index 7f5dd3eef2f..207162a92cc 100644
--- a/linux-user/alpha/signal.c
+++ b/linux-user/alpha/signal.c
@@ -18,6 +18,7 @@
  */
 #include "qemu/osdep.h"
 #include "qemu.h"
+#include "user-internals.h"
 #include "signal-common.h"
 #include "sighandling.h"
 #include "linux-user/trace.h"
diff --git a/linux-user/arm/cpu_loop.c b/linux-user/arm/cpu_loop.c
index 7a66079fd9c..1b26bda9969 100644
--- a/linux-user/arm/cpu_loop.c
+++ b/linux-user/arm/cpu_loop.c
@@ -20,6 +20,7 @@
 #include "qemu/osdep.h"
 #include "qemu-common.h"
 #include "qemu.h"
+#include "user-internals.h"
 #include "elf.h"
 #include "cpu_loop-common.h"
 #include "sighandling.h"
diff --git a/linux-user/arm/signal.c b/linux-user/arm/signal.c
index bd0f29b3016..7c779701e01 100644
--- a/linux-user/arm/signal.c
+++ b/linux-user/arm/signal.c
@@ -18,6 +18,7 @@
  */
 #include "qemu/osdep.h"
 #include "qemu.h"
+#include "user-internals.h"
 #include "signal-common.h"
 #include "sighandling.h"
 #include "linux-user/trace.h"
diff --git a/linux-user/cris/cpu_loop.c b/linux-user/cris/cpu_loop.c
index 00c652b9a56..c499ab6dc53 100644
--- a/linux-user/cris/cpu_loop.c
+++ b/linux-user/cris/cpu_loop.c
@@ -20,6 +20,7 @@
 #include "qemu/osdep.h"
 #include "qemu-common.h"
 #include "qemu.h"
+#include "user-internals.h"
 #include "cpu_loop-common.h"
 #include "sighandling.h"
 
diff --git a/linux-user/cris/signal.c b/linux-user/cris/signal.c
index 093a9758423..a09be6fc6b7 100644
--- a/linux-user/cris/signal.c
+++ b/linux-user/cris/signal.c
@@ -18,6 +18,7 @@
  */
 #include "qemu/osdep.h"
 #include "qemu.h"
+#include "user-internals.h"
 #include "signal-common.h"
 #include "sighandling.h"
 #include "linux-user/trace.h"
diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index f770de31672..f2c5d857d12 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -6,6 +6,7 @@
 #include <sys/shm.h>
 
 #include "qemu.h"
+#include "user-internals.h"
 #include "loader.h"
 #include "user-mmap.h"
 #include "disas/disas.h"
diff --git a/linux-user/exit.c b/linux-user/exit.c
index 70b344048c0..371a0803ece 100644
--- a/linux-user/exit.c
+++ b/linux-user/exit.c
@@ -18,6 +18,7 @@
  */
 #include "qemu/osdep.h"
 #include "qemu.h"
+#include "user-internals.h"
 #ifdef CONFIG_GPROF
 #include <sys/gmon.h>
 #endif
diff --git a/linux-user/fd-trans.c b/linux-user/fd-trans.c
index 8cdb97b81d1..629446a6f96 100644
--- a/linux-user/fd-trans.c
+++ b/linux-user/fd-trans.c
@@ -27,6 +27,7 @@
 #include <linux/if_bridge.h>
 #endif
 #include "qemu.h"
+#include "user-internals.h"
 #include "fd-trans.h"
 #include "sighandling.h"
 
diff --git a/linux-user/flatload.c b/linux-user/flatload.c
index 99550061db8..e4c2f89a226 100644
--- a/linux-user/flatload.c
+++ b/linux-user/flatload.c
@@ -36,6 +36,7 @@
 #include "qemu/osdep.h"
 
 #include "qemu.h"
+#include "user-internals.h"
 #include "loader.h"
 #include "user-mmap.h"
 #include "flat.h"
diff --git a/linux-user/hexagon/cpu_loop.c b/linux-user/hexagon/cpu_loop.c
index aeddb91526d..900b44c5cb4 100644
--- a/linux-user/hexagon/cpu_loop.c
+++ b/linux-user/hexagon/cpu_loop.c
@@ -20,6 +20,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu.h"
+#include "user-internals.h"
 #include "cpu_loop-common.h"
 #include "sighandling.h"
 #include "internal.h"
diff --git a/linux-user/hexagon/signal.c b/linux-user/hexagon/signal.c
index 58ff2caa7e3..9b95f60648f 100644
--- a/linux-user/hexagon/signal.c
+++ b/linux-user/hexagon/signal.c
@@ -19,6 +19,7 @@
  */
 #include "qemu/osdep.h"
 #include "qemu.h"
+#include "user-internals.h"
 #include "signal-common.h"
 #include "sighandling.h"
 #include "linux-user/trace.h"
diff --git a/linux-user/hppa/cpu_loop.c b/linux-user/hppa/cpu_loop.c
index 3ddaa4155c4..42e175d963e 100644
--- a/linux-user/hppa/cpu_loop.c
+++ b/linux-user/hppa/cpu_loop.c
@@ -19,6 +19,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu.h"
+#include "user-internals.h"
 #include "cpu_loop-common.h"
 #include "sighandling.h"
 
diff --git a/linux-user/hppa/signal.c b/linux-user/hppa/signal.c
index 4e08a3d74bb..27074382c5d 100644
--- a/linux-user/hppa/signal.c
+++ b/linux-user/hppa/signal.c
@@ -18,6 +18,7 @@
  */
 #include "qemu/osdep.h"
 #include "qemu.h"
+#include "user-internals.h"
 #include "signal-common.h"
 #include "sighandling.h"
 #include "linux-user/trace.h"
diff --git a/linux-user/i386/cpu_loop.c b/linux-user/i386/cpu_loop.c
index fca0a75d8a1..bdcb2eccba4 100644
--- a/linux-user/i386/cpu_loop.c
+++ b/linux-user/i386/cpu_loop.c
@@ -20,6 +20,7 @@
 #include "qemu/osdep.h"
 #include "qemu-common.h"
 #include "qemu.h"
+#include "user-internals.h"
 #include "cpu_loop-common.h"
 #include "sighandling.h"
 #include "user-mmap.h"
diff --git a/linux-user/i386/signal.c b/linux-user/i386/signal.c
index 79a81f4e7c7..821b5645762 100644
--- a/linux-user/i386/signal.c
+++ b/linux-user/i386/signal.c
@@ -18,6 +18,7 @@
  */
 #include "qemu/osdep.h"
 #include "qemu.h"
+#include "user-internals.h"
 #include "signal-common.h"
 #include "sighandling.h"
 #include "linux-user/trace.h"
diff --git a/linux-user/linuxload.c b/linux-user/linuxload.c
index 27be7090d8f..2ed5fc45ed8 100644
--- a/linux-user/linuxload.c
+++ b/linux-user/linuxload.c
@@ -2,6 +2,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu.h"
+#include "user-internals.h"
 #include "loader.h"
 
 #define NGROUPS 32
diff --git a/linux-user/m68k/cpu_loop.c b/linux-user/m68k/cpu_loop.c
index cbbcce729da..3fefe1528e2 100644
--- a/linux-user/m68k/cpu_loop.c
+++ b/linux-user/m68k/cpu_loop.c
@@ -20,6 +20,7 @@
 #include "qemu/osdep.h"
 #include "qemu-common.h"
 #include "qemu.h"
+#include "user-internals.h"
 #include "cpu_loop-common.h"
 #include "sighandling.h"
 
diff --git a/linux-user/m68k/signal.c b/linux-user/m68k/signal.c
index c3a1c99d6d5..ea4e58e815b 100644
--- a/linux-user/m68k/signal.c
+++ b/linux-user/m68k/signal.c
@@ -18,6 +18,7 @@
  */
 #include "qemu/osdep.h"
 #include "qemu.h"
+#include "user-internals.h"
 #include "signal-common.h"
 #include "sighandling.h"
 #include "linux-user/trace.h"
diff --git a/linux-user/main.c b/linux-user/main.c
index dfcdd80a563..21fe674de3d 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -30,6 +30,7 @@
 
 #include "qapi/error.h"
 #include "qemu.h"
+#include "user-internals.h"
 #include "qemu/path.h"
 #include "qemu/queue.h"
 #include "qemu/config-file.h"
diff --git a/linux-user/microblaze/cpu_loop.c b/linux-user/microblaze/cpu_loop.c
index 3549ebe08bc..3b00047321a 100644
--- a/linux-user/microblaze/cpu_loop.c
+++ b/linux-user/microblaze/cpu_loop.c
@@ -20,6 +20,7 @@
 #include "qemu/osdep.h"
 #include "qemu-common.h"
 #include "qemu.h"
+#include "user-internals.h"
 #include "cpu_loop-common.h"
 #include "sighandling.h"
 
diff --git a/linux-user/microblaze/signal.c b/linux-user/microblaze/signal.c
index ba04c3cc588..1f1aa479e32 100644
--- a/linux-user/microblaze/signal.c
+++ b/linux-user/microblaze/signal.c
@@ -18,6 +18,7 @@
  */
 #include "qemu/osdep.h"
 #include "qemu.h"
+#include "user-internals.h"
 #include "signal-common.h"
 #include "sighandling.h"
 #include "linux-user/trace.h"
diff --git a/linux-user/mips/cpu_loop.c b/linux-user/mips/cpu_loop.c
index 929e29f60f1..01ea7e00e69 100644
--- a/linux-user/mips/cpu_loop.c
+++ b/linux-user/mips/cpu_loop.c
@@ -20,6 +20,7 @@
 #include "qemu/osdep.h"
 #include "qemu-common.h"
 #include "qemu.h"
+#include "user-internals.h"
 #include "cpu_loop-common.h"
 #include "sighandling.h"
 #include "elf.h"
diff --git a/linux-user/mips/signal.c b/linux-user/mips/signal.c
index fa242536315..d7e953d7d03 100644
--- a/linux-user/mips/signal.c
+++ b/linux-user/mips/signal.c
@@ -18,6 +18,7 @@
  */
 #include "qemu/osdep.h"
 #include "qemu.h"
+#include "user-internals.h"
 #include "signal-common.h"
 #include "sighandling.h"
 #include "linux-user/trace.h"
diff --git a/linux-user/mmap.c b/linux-user/mmap.c
index 4b182444bbd..c125031b904 100644
--- a/linux-user/mmap.c
+++ b/linux-user/mmap.c
@@ -20,6 +20,7 @@
 #include "trace.h"
 #include "exec/log.h"
 #include "qemu.h"
+#include "user-internals.h"
 #include "user-mmap.h"
 
 static pthread_mutex_t mmap_mutex = PTHREAD_MUTEX_INITIALIZER;
diff --git a/linux-user/nios2/cpu_loop.c b/linux-user/nios2/cpu_loop.c
index d3c042b8d0a..c724156964c 100644
--- a/linux-user/nios2/cpu_loop.c
+++ b/linux-user/nios2/cpu_loop.c
@@ -19,6 +19,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu.h"
+#include "user-internals.h"
 #include "cpu_loop-common.h"
 #include "sighandling.h"
 
diff --git a/linux-user/nios2/signal.c b/linux-user/nios2/signal.c
index fb8ae7b4f92..9fd3189ae38 100644
--- a/linux-user/nios2/signal.c
+++ b/linux-user/nios2/signal.c
@@ -18,6 +18,7 @@
  */
 #include "qemu/osdep.h"
 #include "qemu.h"
+#include "user-internals.h"
 #include "signal-common.h"
 #include "sighandling.h"
 #include "linux-user/trace.h"
diff --git a/linux-user/openrisc/cpu_loop.c b/linux-user/openrisc/cpu_loop.c
index 7d24d3891d8..9e951565e4d 100644
--- a/linux-user/openrisc/cpu_loop.c
+++ b/linux-user/openrisc/cpu_loop.c
@@ -20,6 +20,7 @@
 #include "qemu/osdep.h"
 #include "qemu-common.h"
 #include "qemu.h"
+#include "user-internals.h"
 #include "cpu_loop-common.h"
 #include "sighandling.h"
 
diff --git a/linux-user/openrisc/signal.c b/linux-user/openrisc/signal.c
index 62f85d18e4d..1d05f1f7adf 100644
--- a/linux-user/openrisc/signal.c
+++ b/linux-user/openrisc/signal.c
@@ -18,6 +18,7 @@
  */
 #include "qemu/osdep.h"
 #include "qemu.h"
+#include "user-internals.h"
 #include "signal-common.h"
 #include "sighandling.h"
 #include "linux-user/trace.h"
diff --git a/linux-user/ppc/cpu_loop.c b/linux-user/ppc/cpu_loop.c
index 61367d53b74..91e4e33bb52 100644
--- a/linux-user/ppc/cpu_loop.c
+++ b/linux-user/ppc/cpu_loop.c
@@ -20,6 +20,7 @@
 #include "qemu/osdep.h"
 #include "qemu-common.h"
 #include "qemu.h"
+#include "user-internals.h"
 #include "cpu_loop-common.h"
 #include "sighandling.h"
 
diff --git a/linux-user/ppc/signal.c b/linux-user/ppc/signal.c
index d9a41723a0f..9725c5b2a30 100644
--- a/linux-user/ppc/signal.c
+++ b/linux-user/ppc/signal.c
@@ -18,6 +18,7 @@
  */
 #include "qemu/osdep.h"
 #include "qemu.h"
+#include "user-internals.h"
 #include "signal-common.h"
 #include "sighandling.h"
 #include "linux-user/trace.h"
diff --git a/linux-user/riscv/cpu_loop.c b/linux-user/riscv/cpu_loop.c
index d6a5d2d8975..4825750320f 100644
--- a/linux-user/riscv/cpu_loop.c
+++ b/linux-user/riscv/cpu_loop.c
@@ -21,6 +21,7 @@
 #include "qemu-common.h"
 #include "qemu/error-report.h"
 #include "qemu.h"
+#include "user-internals.h"
 #include "cpu_loop-common.h"
 #include "sighandling.h"
 #include "elf.h"
diff --git a/linux-user/riscv/signal.c b/linux-user/riscv/signal.c
index 29a93d28932..52470c2a750 100644
--- a/linux-user/riscv/signal.c
+++ b/linux-user/riscv/signal.c
@@ -18,6 +18,7 @@
  */
 #include "qemu/osdep.h"
 #include "qemu.h"
+#include "user-internals.h"
 #include "signal-common.h"
 #include "sighandling.h"
 #include "linux-user/trace.h"
diff --git a/linux-user/s390x/cpu_loop.c b/linux-user/s390x/cpu_loop.c
index f3d345986d8..1b32b9b8ad0 100644
--- a/linux-user/s390x/cpu_loop.c
+++ b/linux-user/s390x/cpu_loop.c
@@ -20,6 +20,7 @@
 #include "qemu/osdep.h"
 #include "qemu-common.h"
 #include "qemu.h"
+#include "user-internals.h"
 #include "cpu_loop-common.h"
 #include "sighandling.h"
 
diff --git a/linux-user/s390x/signal.c b/linux-user/s390x/signal.c
index 4f900fee422..e84703e9bdb 100644
--- a/linux-user/s390x/signal.c
+++ b/linux-user/s390x/signal.c
@@ -18,6 +18,7 @@
  */
 #include "qemu/osdep.h"
 #include "qemu.h"
+#include "user-internals.h"
 #include "signal-common.h"
 #include "sighandling.h"
 #include "linux-user/trace.h"
diff --git a/linux-user/semihost.c b/linux-user/semihost.c
index f53ab526fba..17f074ac565 100644
--- a/linux-user/semihost.c
+++ b/linux-user/semihost.c
@@ -13,6 +13,7 @@
 #include "qemu/osdep.h"
 #include "semihosting/console.h"
 #include "qemu.h"
+#include "user-internals.h"
 #include <termios.h>
 
 int qemu_semihosting_console_outs(CPUArchState *env, target_ulong addr)
diff --git a/linux-user/sh4/cpu_loop.c b/linux-user/sh4/cpu_loop.c
index 059c7420eea..e383ad2f702 100644
--- a/linux-user/sh4/cpu_loop.c
+++ b/linux-user/sh4/cpu_loop.c
@@ -20,6 +20,7 @@
 #include "qemu/osdep.h"
 #include "qemu-common.h"
 #include "qemu.h"
+#include "user-internals.h"
 #include "cpu_loop-common.h"
 #include "sighandling.h"
 
diff --git a/linux-user/sh4/signal.c b/linux-user/sh4/signal.c
index df78a2032fe..ae688dcea7c 100644
--- a/linux-user/sh4/signal.c
+++ b/linux-user/sh4/signal.c
@@ -18,6 +18,7 @@
  */
 #include "qemu/osdep.h"
 #include "qemu.h"
+#include "user-internals.h"
 #include "signal-common.h"
 #include "sighandling.h"
 #include "linux-user/trace.h"
diff --git a/linux-user/signal.c b/linux-user/signal.c
index 7abcec9166e..7c14f17fb2c 100644
--- a/linux-user/signal.c
+++ b/linux-user/signal.c
@@ -22,6 +22,7 @@
 #include <sys/resource.h>
 
 #include "qemu.h"
+#include "user-internals.h"
 #include "strace.h"
 #include "sighandling.h"
 #include "loader.h"
diff --git a/linux-user/sparc/cpu_loop.c b/linux-user/sparc/cpu_loop.c
index 9b633029a92..289f72f953e 100644
--- a/linux-user/sparc/cpu_loop.c
+++ b/linux-user/sparc/cpu_loop.c
@@ -20,6 +20,7 @@
 #include "qemu/osdep.h"
 #include "qemu-common.h"
 #include "qemu.h"
+#include "user-internals.h"
 #include "cpu_loop-common.h"
 #include "sighandling.h"
 
diff --git a/linux-user/sparc/signal.c b/linux-user/sparc/signal.c
index c2b6ba88ad2..d7fab06247a 100644
--- a/linux-user/sparc/signal.c
+++ b/linux-user/sparc/signal.c
@@ -18,6 +18,7 @@
  */
 #include "qemu/osdep.h"
 #include "qemu.h"
+#include "user-internals.h"
 #include "signal-common.h"
 #include "sighandling.h"
 #include "linux-user/trace.h"
diff --git a/linux-user/strace.c b/linux-user/strace.c
index ee3429fae82..2cdbf030ba4 100644
--- a/linux-user/strace.c
+++ b/linux-user/strace.c
@@ -15,6 +15,7 @@
 #include <linux/netlink.h>
 #include <sched.h>
 #include "qemu.h"
+#include "user-internals.h"
 #include "strace.h"
 
 struct syscallname {
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 913761d16e2..ecda82668b7 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -127,6 +127,7 @@
 #include "uname.h"
 
 #include "qemu.h"
+#include "user-internals.h"
 #include "strace.h"
 #include "sighandling.h"
 #include "loader.h"
diff --git a/linux-user/uaccess.c b/linux-user/uaccess.c
index 6a5b029607c..425cbf677f7 100644
--- a/linux-user/uaccess.c
+++ b/linux-user/uaccess.c
@@ -3,6 +3,7 @@
 #include "qemu/cutils.h"
 
 #include "qemu.h"
+#include "user-internals.h"
 
 void *lock_user(int type, abi_ulong guest_addr, ssize_t len, bool copy)
 {
diff --git a/linux-user/uname.c b/linux-user/uname.c
index a09ffe1ea7b..1d82608c100 100644
--- a/linux-user/uname.c
+++ b/linux-user/uname.c
@@ -20,6 +20,7 @@
 #include "qemu/osdep.h"
 
 #include "qemu.h"
+#include "user-internals.h"
 //#include "qemu-common.h"
 #include "uname.h"
 
diff --git a/linux-user/vm86.c b/linux-user/vm86.c
index 4412522c4c4..c2facf3fc2d 100644
--- a/linux-user/vm86.c
+++ b/linux-user/vm86.c
@@ -19,6 +19,7 @@
 #include "qemu/osdep.h"
 
 #include "qemu.h"
+#include "user-internals.h"
 
 //#define DEBUG_VM86
 
diff --git a/linux-user/xtensa/cpu_loop.c b/linux-user/xtensa/cpu_loop.c
index a0710ed044a..ba414c8b161 100644
--- a/linux-user/xtensa/cpu_loop.c
+++ b/linux-user/xtensa/cpu_loop.c
@@ -19,6 +19,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu.h"
+#include "user-internals.h"
 #include "cpu_loop-common.h"
 #include "sighandling.h"
 
diff --git a/linux-user/xtensa/signal.c b/linux-user/xtensa/signal.c
index 32d666f2523..6d7c8698963 100644
--- a/linux-user/xtensa/signal.c
+++ b/linux-user/xtensa/signal.c
@@ -18,6 +18,7 @@
  */
 #include "qemu/osdep.h"
 #include "qemu.h"
+#include "user-internals.h"
 #include "signal-common.h"
 #include "sighandling.h"
 #include "linux-user/trace.h"
-- 
2.20.1


