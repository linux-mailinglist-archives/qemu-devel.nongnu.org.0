Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D361D403CDF
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 17:52:24 +0200 (CEST)
Received: from localhost ([::1]:41702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNzs7-0002EK-Tn
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 11:52:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mNzkI-0006My-Uu
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 11:44:19 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:38730)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mNzkF-0002OR-0p
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 11:44:18 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 k5-20020a05600c1c8500b002f76c42214bso1973405wms.3
 for <qemu-devel@nongnu.org>; Wed, 08 Sep 2021 08:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eY2syHKW8+/+tOctowrU2xTp/Drli4kQUZttPCAOy+w=;
 b=DMMC4bF/k7BF0QqZ7KtXXFc8t6bPe3yYDzpVE8X2yFUd+9S9mVm7lcyIUKwxooSRNX
 TYHJnTDXC1iQZ86fPfYZmoxLYYhpgiEKxu73uMb6AQ08ocum/mexaH8xO/r5smPlMyEJ
 IGTFUGbkTwLVfoP6tkFysLh2aVxVykL9wGXOhncr6mJznyM/iKUPt43T3tDRp0GONnu8
 LlSTUs5vMX/pm+0/C9IKo92wtrlF9F7HlT8S7jUL31R3g2pA5mw5+e5zsCjbTyeYjhlW
 /LW9QAB9ZBtc9piBp4Vgywq1A4S9j6tt0zjLCzhIQVounec62G2KbMsiUpNNtVtHjdwH
 SNcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eY2syHKW8+/+tOctowrU2xTp/Drli4kQUZttPCAOy+w=;
 b=cRIciiv7O2DnBbTCpwuac7KgapYHPmzswJGUi9vlh6Ni3Y4vpdO+R+gkP4xcluu7jd
 BBE4iiA/urnfbbrYTKGGFqdZMNls1Y/9TqWXkv5eHUQtbQlIQltLRCjDNnkAvWM4ZMLd
 Q/w7gpCUFwle208pEUI3Gcy3oli2FCjaJI6Fn7d00SHuYtPrYWCkjzqr1Ti64bjBjZnf
 X3Vq42+lQp0UCR1mYPee+P2MhAVAEBi0tJmvSK5vb+2Slb5LE9H/UG0FM7v2g9KdRn2X
 2Z04rlrIjpYLCf4UOHBcnKy2VPSlUu711RuusA7CaNahxLGR3L2MjMKs9XTimyHbIKt5
 0C6g==
X-Gm-Message-State: AOAM533mFbUKry1dDDYhBWnh1rZR3aT8GPM1yfZtkppHQJr/Y2ccrydP
 Etws66DlVxA858EbDr/Qj0e9Bc4WH4baMg==
X-Google-Smtp-Source: ABdhPJxcfhGMFM/2ZKGozFdP2Sih6uLvSWA+X5flQ3/Fm4C031n/vjRhrz3KB5ThSnIHozjlPSiATQ==
X-Received: by 2002:a1c:7e8a:: with SMTP id z132mr4172999wmc.75.1631115853269; 
 Wed, 08 Sep 2021 08:44:13 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id s10sm2587307wrg.42.2021.09.08.08.44.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 08:44:13 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 7/9] linux-user: Split linux-user internals out of qemu.h
Date: Wed,  8 Sep 2021 16:44:03 +0100
Message-Id: <20210908154405.15417-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210908154405.15417-1-peter.maydell@linaro.org>
References: <20210908154405.15417-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
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
Cc: Riku Voipio <riku.voipio@iki.fi>, Laurent Vivier <laurent@vivier.eu>
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
index 5cac76f67b0..5425b85659a 100644
--- a/linux-user/aarch64/cpu_loop.c
+++ b/linux-user/aarch64/cpu_loop.c
@@ -20,6 +20,7 @@
 #include "qemu/osdep.h"
 #include "qemu-common.h"
 #include "qemu.h"
+#include "user-internals.h"
 #include "cpu_loop-common.h"
 #include "signal-common.h"
 #include "qemu/guest-random.h"
diff --git a/linux-user/aarch64/signal.c b/linux-user/aarch64/signal.c
index 662bcd1c4e5..49025648cb4 100644
--- a/linux-user/aarch64/signal.c
+++ b/linux-user/aarch64/signal.c
@@ -18,6 +18,7 @@
  */
 #include "qemu/osdep.h"
 #include "qemu.h"
+#include "user-internals.h"
 #include "signal-common.h"
 #include "linux-user/trace.h"
 
diff --git a/linux-user/alpha/cpu_loop.c b/linux-user/alpha/cpu_loop.c
index 8464047368a..1b00a81385b 100644
--- a/linux-user/alpha/cpu_loop.c
+++ b/linux-user/alpha/cpu_loop.c
@@ -20,6 +20,7 @@
 #include "qemu/osdep.h"
 #include "qemu-common.h"
 #include "qemu.h"
+#include "user-internals.h"
 #include "cpu_loop-common.h"
 #include "signal-common.h"
 
diff --git a/linux-user/alpha/signal.c b/linux-user/alpha/signal.c
index 1129ffeea1d..3a820f616b3 100644
--- a/linux-user/alpha/signal.c
+++ b/linux-user/alpha/signal.c
@@ -18,6 +18,7 @@
  */
 #include "qemu/osdep.h"
 #include "qemu.h"
+#include "user-internals.h"
 #include "signal-common.h"
 #include "linux-user/trace.h"
 
diff --git a/linux-user/arm/cpu_loop.c b/linux-user/arm/cpu_loop.c
index 5556d381463..07032b30061 100644
--- a/linux-user/arm/cpu_loop.c
+++ b/linux-user/arm/cpu_loop.c
@@ -20,6 +20,7 @@
 #include "qemu/osdep.h"
 #include "qemu-common.h"
 #include "qemu.h"
+#include "user-internals.h"
 #include "elf.h"
 #include "cpu_loop-common.h"
 #include "signal-common.h"
diff --git a/linux-user/arm/signal.c b/linux-user/arm/signal.c
index 1dfcfd2d57b..ed144f9455d 100644
--- a/linux-user/arm/signal.c
+++ b/linux-user/arm/signal.c
@@ -18,6 +18,7 @@
  */
 #include "qemu/osdep.h"
 #include "qemu.h"
+#include "user-internals.h"
 #include "signal-common.h"
 #include "linux-user/trace.h"
 
diff --git a/linux-user/cris/cpu_loop.c b/linux-user/cris/cpu_loop.c
index 8c9fc3127ec..b9085619c4c 100644
--- a/linux-user/cris/cpu_loop.c
+++ b/linux-user/cris/cpu_loop.c
@@ -20,6 +20,7 @@
 #include "qemu/osdep.h"
 #include "qemu-common.h"
 #include "qemu.h"
+#include "user-internals.h"
 #include "cpu_loop-common.h"
 #include "signal-common.h"
 
diff --git a/linux-user/cris/signal.c b/linux-user/cris/signal.c
index 1e02194377b..2c39bdf7277 100644
--- a/linux-user/cris/signal.c
+++ b/linux-user/cris/signal.c
@@ -18,6 +18,7 @@
  */
 #include "qemu/osdep.h"
 #include "qemu.h"
+#include "user-internals.h"
 #include "signal-common.h"
 #include "linux-user/trace.h"
 
diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index c291f3cee09..5f9e2141ad1 100644
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
index 527e29cbc19..68a3a6f9df0 100644
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
index 48203c1af9d..69410899590 100644
--- a/linux-user/fd-trans.c
+++ b/linux-user/fd-trans.c
@@ -27,6 +27,7 @@
 #include <linux/if_bridge.h>
 #endif
 #include "qemu.h"
+#include "user-internals.h"
 #include "fd-trans.h"
 #include "signal-common.h"
 
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
index 348d2dc3413..bee2a9e4ea9 100644
--- a/linux-user/hexagon/cpu_loop.c
+++ b/linux-user/hexagon/cpu_loop.c
@@ -20,6 +20,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu.h"
+#include "user-internals.h"
 #include "cpu_loop-common.h"
 #include "signal-common.h"
 #include "internal.h"
diff --git a/linux-user/hexagon/signal.c b/linux-user/hexagon/signal.c
index 85eab5e9438..c7f0bf6b928 100644
--- a/linux-user/hexagon/signal.c
+++ b/linux-user/hexagon/signal.c
@@ -19,6 +19,7 @@
  */
 #include "qemu/osdep.h"
 #include "qemu.h"
+#include "user-internals.h"
 #include "signal-common.h"
 #include "linux-user/trace.h"
 
diff --git a/linux-user/hppa/cpu_loop.c b/linux-user/hppa/cpu_loop.c
index c3661994a57..81607a9b271 100644
--- a/linux-user/hppa/cpu_loop.c
+++ b/linux-user/hppa/cpu_loop.c
@@ -19,6 +19,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu.h"
+#include "user-internals.h"
 #include "cpu_loop-common.h"
 #include "signal-common.h"
 
diff --git a/linux-user/hppa/signal.c b/linux-user/hppa/signal.c
index 0e266f472d5..c2fbc26ebb6 100644
--- a/linux-user/hppa/signal.c
+++ b/linux-user/hppa/signal.c
@@ -18,6 +18,7 @@
  */
 #include "qemu/osdep.h"
 #include "qemu.h"
+#include "user-internals.h"
 #include "signal-common.h"
 #include "linux-user/trace.h"
 
diff --git a/linux-user/i386/cpu_loop.c b/linux-user/i386/cpu_loop.c
index fcc410a426a..f6a1cc632b1 100644
--- a/linux-user/i386/cpu_loop.c
+++ b/linux-user/i386/cpu_loop.c
@@ -20,6 +20,7 @@
 #include "qemu/osdep.h"
 #include "qemu-common.h"
 #include "qemu.h"
+#include "user-internals.h"
 #include "cpu_loop-common.h"
 #include "signal-common.h"
 #include "user-mmap.h"
diff --git a/linux-user/i386/signal.c b/linux-user/i386/signal.c
index 841cd196510..3b4b55fc0a2 100644
--- a/linux-user/i386/signal.c
+++ b/linux-user/i386/signal.c
@@ -18,6 +18,7 @@
  */
 #include "qemu/osdep.h"
 #include "qemu.h"
+#include "user-internals.h"
 #include "signal-common.h"
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
index 3a330401bf2..ebf32be78f8 100644
--- a/linux-user/m68k/cpu_loop.c
+++ b/linux-user/m68k/cpu_loop.c
@@ -20,6 +20,7 @@
 #include "qemu/osdep.h"
 #include "qemu-common.h"
 #include "qemu.h"
+#include "user-internals.h"
 #include "cpu_loop-common.h"
 #include "signal-common.h"
 
diff --git a/linux-user/m68k/signal.c b/linux-user/m68k/signal.c
index d06230655e9..4f8eb6f727e 100644
--- a/linux-user/m68k/signal.c
+++ b/linux-user/m68k/signal.c
@@ -18,6 +18,7 @@
  */
 #include "qemu/osdep.h"
 #include "qemu.h"
+#include "user-internals.h"
 #include "signal-common.h"
 #include "linux-user/trace.h"
 
diff --git a/linux-user/main.c b/linux-user/main.c
index a76aec73368..9edc0b22207 100644
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
index 0d2c8f8dea8..52222eb93fb 100644
--- a/linux-user/microblaze/cpu_loop.c
+++ b/linux-user/microblaze/cpu_loop.c
@@ -20,6 +20,7 @@
 #include "qemu/osdep.h"
 #include "qemu-common.h"
 #include "qemu.h"
+#include "user-internals.h"
 #include "cpu_loop-common.h"
 #include "signal-common.h"
 
diff --git a/linux-user/microblaze/signal.c b/linux-user/microblaze/signal.c
index 4c483bd8c60..b822679d180 100644
--- a/linux-user/microblaze/signal.c
+++ b/linux-user/microblaze/signal.c
@@ -18,6 +18,7 @@
  */
 #include "qemu/osdep.h"
 #include "qemu.h"
+#include "user-internals.h"
 #include "signal-common.h"
 #include "linux-user/trace.h"
 
diff --git a/linux-user/mips/cpu_loop.c b/linux-user/mips/cpu_loop.c
index 7dfaa0cb1e1..cb03fb066b9 100644
--- a/linux-user/mips/cpu_loop.c
+++ b/linux-user/mips/cpu_loop.c
@@ -20,6 +20,7 @@
 #include "qemu/osdep.h"
 #include "qemu-common.h"
 #include "qemu.h"
+#include "user-internals.h"
 #include "cpu_loop-common.h"
 #include "signal-common.h"
 #include "elf.h"
diff --git a/linux-user/mips/signal.c b/linux-user/mips/signal.c
index e6be807a81a..d174b3453cc 100644
--- a/linux-user/mips/signal.c
+++ b/linux-user/mips/signal.c
@@ -18,6 +18,7 @@
  */
 #include "qemu/osdep.h"
 #include "qemu.h"
+#include "user-internals.h"
 #include "signal-common.h"
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
index 68f95d7ad7b..34290fb3b51 100644
--- a/linux-user/nios2/cpu_loop.c
+++ b/linux-user/nios2/cpu_loop.c
@@ -19,6 +19,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu.h"
+#include "user-internals.h"
 #include "cpu_loop-common.h"
 #include "signal-common.h"
 
diff --git a/linux-user/nios2/signal.c b/linux-user/nios2/signal.c
index cc3872f11da..a77e8a40f46 100644
--- a/linux-user/nios2/signal.c
+++ b/linux-user/nios2/signal.c
@@ -18,6 +18,7 @@
  */
 #include "qemu/osdep.h"
 #include "qemu.h"
+#include "user-internals.h"
 #include "signal-common.h"
 #include "linux-user/trace.h"
 
diff --git a/linux-user/openrisc/cpu_loop.c b/linux-user/openrisc/cpu_loop.c
index f6c67859887..f6360db47c2 100644
--- a/linux-user/openrisc/cpu_loop.c
+++ b/linux-user/openrisc/cpu_loop.c
@@ -20,6 +20,7 @@
 #include "qemu/osdep.h"
 #include "qemu-common.h"
 #include "qemu.h"
+#include "user-internals.h"
 #include "cpu_loop-common.h"
 #include "signal-common.h"
 
diff --git a/linux-user/openrisc/signal.c b/linux-user/openrisc/signal.c
index 5c5640a2848..ca2532bf500 100644
--- a/linux-user/openrisc/signal.c
+++ b/linux-user/openrisc/signal.c
@@ -18,6 +18,7 @@
  */
 #include "qemu/osdep.h"
 #include "qemu.h"
+#include "user-internals.h"
 #include "signal-common.h"
 #include "linux-user/trace.h"
 
diff --git a/linux-user/ppc/cpu_loop.c b/linux-user/ppc/cpu_loop.c
index ace431238c2..840b23736bf 100644
--- a/linux-user/ppc/cpu_loop.c
+++ b/linux-user/ppc/cpu_loop.c
@@ -20,6 +20,7 @@
 #include "qemu/osdep.h"
 #include "qemu-common.h"
 #include "qemu.h"
+#include "user-internals.h"
 #include "cpu_loop-common.h"
 #include "signal-common.h"
 
diff --git a/linux-user/ppc/signal.c b/linux-user/ppc/signal.c
index edfad28a375..e4d0dfa3bf7 100644
--- a/linux-user/ppc/signal.c
+++ b/linux-user/ppc/signal.c
@@ -18,6 +18,7 @@
  */
 #include "qemu/osdep.h"
 #include "qemu.h"
+#include "user-internals.h"
 #include "signal-common.h"
 #include "linux-user/trace.h"
 
diff --git a/linux-user/riscv/cpu_loop.c b/linux-user/riscv/cpu_loop.c
index 47978c4e354..9859a366e42 100644
--- a/linux-user/riscv/cpu_loop.c
+++ b/linux-user/riscv/cpu_loop.c
@@ -21,6 +21,7 @@
 #include "qemu-common.h"
 #include "qemu/error-report.h"
 #include "qemu.h"
+#include "user-internals.h"
 #include "cpu_loop-common.h"
 #include "signal-common.h"
 #include "elf.h"
diff --git a/linux-user/riscv/signal.c b/linux-user/riscv/signal.c
index 9405c7fd9af..f7f33bc90ae 100644
--- a/linux-user/riscv/signal.c
+++ b/linux-user/riscv/signal.c
@@ -18,6 +18,7 @@
  */
 #include "qemu/osdep.h"
 #include "qemu.h"
+#include "user-internals.h"
 #include "signal-common.h"
 #include "linux-user/trace.h"
 
diff --git a/linux-user/s390x/cpu_loop.c b/linux-user/s390x/cpu_loop.c
index ae70f630532..69b69981f67 100644
--- a/linux-user/s390x/cpu_loop.c
+++ b/linux-user/s390x/cpu_loop.c
@@ -20,6 +20,7 @@
 #include "qemu/osdep.h"
 #include "qemu-common.h"
 #include "qemu.h"
+#include "user-internals.h"
 #include "cpu_loop-common.h"
 #include "signal-common.h"
 
diff --git a/linux-user/s390x/signal.c b/linux-user/s390x/signal.c
index bf8a8fbfe9f..80f34086d7b 100644
--- a/linux-user/s390x/signal.c
+++ b/linux-user/s390x/signal.c
@@ -18,6 +18,7 @@
  */
 #include "qemu/osdep.h"
 #include "qemu.h"
+#include "user-internals.h"
 #include "signal-common.h"
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
index 06e4a4d0075..65b8972e3c9 100644
--- a/linux-user/sh4/cpu_loop.c
+++ b/linux-user/sh4/cpu_loop.c
@@ -20,6 +20,7 @@
 #include "qemu/osdep.h"
 #include "qemu-common.h"
 #include "qemu.h"
+#include "user-internals.h"
 #include "cpu_loop-common.h"
 #include "signal-common.h"
 
diff --git a/linux-user/sh4/signal.c b/linux-user/sh4/signal.c
index 0451e65806a..d70d744befc 100644
--- a/linux-user/sh4/signal.c
+++ b/linux-user/sh4/signal.c
@@ -18,6 +18,7 @@
  */
 #include "qemu/osdep.h"
 #include "qemu.h"
+#include "user-internals.h"
 #include "signal-common.h"
 #include "linux-user/trace.h"
 
diff --git a/linux-user/signal.c b/linux-user/signal.c
index 0fa15f088b0..6af66123d0f 100644
--- a/linux-user/signal.c
+++ b/linux-user/signal.c
@@ -22,6 +22,7 @@
 #include <sys/resource.h>
 
 #include "qemu.h"
+#include "user-internals.h"
 #include "strace.h"
 #include "loader.h"
 #include "trace.h"
diff --git a/linux-user/sparc/cpu_loop.c b/linux-user/sparc/cpu_loop.c
index b2c06111943..ad29b4eb6a3 100644
--- a/linux-user/sparc/cpu_loop.c
+++ b/linux-user/sparc/cpu_loop.c
@@ -20,6 +20,7 @@
 #include "qemu/osdep.h"
 #include "qemu-common.h"
 #include "qemu.h"
+#include "user-internals.h"
 #include "cpu_loop-common.h"
 #include "signal-common.h"
 
diff --git a/linux-user/sparc/signal.c b/linux-user/sparc/signal.c
index 0cc3db5570e..3bc023d281a 100644
--- a/linux-user/sparc/signal.c
+++ b/linux-user/sparc/signal.c
@@ -18,6 +18,7 @@
  */
 #include "qemu/osdep.h"
 #include "qemu.h"
+#include "user-internals.h"
 #include "signal-common.h"
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
index 9873830b465..e4ffdec0d83 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -127,6 +127,7 @@
 #include "uname.h"
 
 #include "qemu.h"
+#include "user-internals.h"
 #include "strace.h"
 #include "signal-common.h"
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
index bb5335e2b6c..622afbcd345 100644
--- a/linux-user/xtensa/cpu_loop.c
+++ b/linux-user/xtensa/cpu_loop.c
@@ -19,6 +19,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu.h"
+#include "user-internals.h"
 #include "cpu_loop-common.h"
 #include "signal-common.h"
 
diff --git a/linux-user/xtensa/signal.c b/linux-user/xtensa/signal.c
index 72771e1294b..7a3bfb92cad 100644
--- a/linux-user/xtensa/signal.c
+++ b/linux-user/xtensa/signal.c
@@ -18,6 +18,7 @@
  */
 #include "qemu/osdep.h"
 #include "qemu.h"
+#include "user-internals.h"
 #include "signal-common.h"
 #include "linux-user/trace.h"
 
-- 
2.20.1


