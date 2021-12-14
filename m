Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA79B47398A
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Dec 2021 01:28:36 +0100 (CET)
Received: from localhost ([::1]:58560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwvgJ-0002OG-Mx
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 19:28:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mwve1-0007pK-AZ
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 19:26:13 -0500
Received: from [2607:f8b0:4864:20::631] (port=33617
 helo=mail-pl1-x631.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mwvdx-0005RC-TJ
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 19:26:12 -0500
Received: by mail-pl1-x631.google.com with SMTP id y7so12411256plp.0
 for <qemu-devel@nongnu.org>; Mon, 13 Dec 2021 16:26:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GufoDHfjYxZ3FYh1AK2uby8vthRBQr9IHhcQ3lafcZ8=;
 b=yjzXfZyfYf+Mvfxj5BBbborIX0lsD7UproEquB/yVmxB6UeuIt4FChaookwrBLOFi2
 J6V6VOOvhLuh893IC6NKk2driswgruSX7vf+N/E5S+CSSRrTHuNgFAsmT+pHae7pkzWE
 5bQdktJB7fQyq4PsFykEvXwpJu8mh1uC/QFd31IfCRhwjpIci5lPCoxKQa7kdNjxtMta
 fXPpTNzF/IbSSlhaosWCndxD8Zg39W4iFGVQ7VDWAOQnlYVTOCAszX3k8s21aiDTNtyF
 wY+yAnyWHMZDvyWrk5IxYE4cVEnrq67RYj5iKVSlKhvvXaOANlaOgXZt9kZsV6qvI67Z
 WAkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GufoDHfjYxZ3FYh1AK2uby8vthRBQr9IHhcQ3lafcZ8=;
 b=R3/5KxuAJ88Y6JKC3NJ9gVS83IUeQe1swy/TJMGAYtZCvtxTEzhMoG509cxfOJC04I
 4eGHwaVKis0H8RyuO7HqeyPtlBiPmBDgg7Wc0ZKZRKeBxGROrc4yGq7W5Rm1487S6GWj
 m/6J962ObkFtig4rBwEjv2NfLUwMwK+7xZ1DVjdo0T43HehW1qRnK5N30r/Hw9WbZ2Wd
 QL4jhxrderE0347a2/XYRxjy/bevJKcZUIRVSOOa6zKoS6+9aJREs7XqLPTzq1ttitKB
 /RKj+vqMKHNl0J+264i8aFMOAd5EAGYQSBhw4T3Ik0MHOlGF4OWJYkDFudOQHwQ4Oner
 mPdg==
X-Gm-Message-State: AOAM531AzgNt6jzgYdwI6HirCNKdmsPElaViKxSTs09uyLqkBFDLbYSp
 wVMx6UNSqfDFhf9hlHBuK19oMUaLZWN20A==
X-Google-Smtp-Source: ABdhPJytuHtHkAhbf33dbHmq5ygRDS/gXGqByZzeJ9LyrAxf/y+svNEloeL4qpKRmSjrbbev4VrcIg==
X-Received: by 2002:a17:902:ce85:b0:141:de7d:514e with SMTP id
 f5-20020a170902ce8500b00141de7d514emr2428011plg.0.1639441568452; 
 Mon, 13 Dec 2021 16:26:08 -0800 (PST)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id w7sm11320253pgo.56.2021.12.13.16.26.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Dec 2021 16:26:07 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 02/15] linux-user: Move syscall error detection into
 safe_syscall_base
Date: Mon, 13 Dec 2021 16:25:51 -0800
Message-Id: <20211214002604.161983-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211214002604.161983-1-richard.henderson@linaro.org>
References: <20211214002604.161983-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::631
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: git@xen0n.name, laurent@vivier.eu, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The current api from safe_syscall_base() is to return -errno, which is
the interface provided by *some* linux kernel abis.  The wrapper macro,
safe_syscall(), detects error, stores into errno, and returns -1, to
match the api of the system syscall().

For those kernel abis that do not return -errno natively, this leads
to double syscall error detection.  E.g. Linux ppc64, which sets the
SO flag for error.

Simplify the usage from C by moving the error detection into assembly,
and usage from assembly by providing a C helper with which to set errno.

Reviewed-by: Warner Losh <imp@bsdimp.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/safe-syscall.h                  | 16 +++-------
 linux-user/safe-syscall-error.c            | 28 ++++++++++++++++
 linux-user/host/aarch64/safe-syscall.inc.S | 20 ++++++------
 linux-user/host/arm/safe-syscall.inc.S     | 27 ++++++++++------
 linux-user/host/i386/safe-syscall.inc.S    | 37 +++++++++++++++-------
 linux-user/host/ppc64/safe-syscall.inc.S   | 24 +++++++-------
 linux-user/host/riscv/safe-syscall.inc.S   | 20 ++++++------
 linux-user/host/s390x/safe-syscall.inc.S   | 32 ++++++++++++-------
 linux-user/host/x86_64/safe-syscall.inc.S  | 29 +++++++++--------
 linux-user/meson.build                     |  1 +
 10 files changed, 147 insertions(+), 87 deletions(-)
 create mode 100644 linux-user/safe-syscall-error.c

diff --git a/linux-user/safe-syscall.h b/linux-user/safe-syscall.h
index aaa9ffc0e2..97837faddb 100644
--- a/linux-user/safe-syscall.h
+++ b/linux-user/safe-syscall.h
@@ -127,21 +127,15 @@
 #ifdef HAVE_SAFE_SYSCALL
 /* The core part of this function is implemented in assembly */
 extern long safe_syscall_base(int *pending, long number, ...);
+extern long safe_syscall_set_errno_tail(int value);
+
 /* These are defined by the safe-syscall.inc.S file */
 extern char safe_syscall_start[];
 extern char safe_syscall_end[];
 
-#define safe_syscall(...)                                               \
-    ({                                                                  \
-        long ret_;                                                      \
-        int *psp_ = &((TaskState *)thread_cpu->opaque)->signal_pending; \
-        ret_ = safe_syscall_base(psp_, __VA_ARGS__);                    \
-        if (is_error(ret_)) {                                           \
-            errno = -ret_;                                              \
-            ret_ = -1;                                                  \
-        }                                                               \
-        ret_;                                                           \
-    })
+#define safe_syscall(...)                                                 \
+    safe_syscall_base(&((TaskState *)thread_cpu->opaque)->signal_pending, \
+                      __VA_ARGS__)
 
 #else
 
diff --git a/linux-user/safe-syscall-error.c b/linux-user/safe-syscall-error.c
new file mode 100644
index 0000000000..d7e2700f81
--- /dev/null
+++ b/linux-user/safe-syscall-error.c
@@ -0,0 +1,28 @@
+/*
+ * safe-syscall-error.c: errno setting fragment
+ * This is intended to be invoked by safe-syscall.S
+ *
+ * Written by Richard Henderson <rth@twiddle.net>
+ * Copyright (C) 2021 Red Hat, Inc.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "hostdep.h"
+#include "safe-syscall.h"
+
+#ifdef HAVE_SAFE_SYSCALL
+/*
+ * This is intended to be invoked via tail-call on the error path
+ * from the assembly in host/arch/safe-syscall.inc.S.  This takes
+ * care of the host specific addressing of errno.
+ * Return -1 to finalize the return value for safe_syscall_base.
+ */
+long safe_syscall_set_errno_tail(int value)
+{
+    errno = value;
+    return -1;
+}
+#endif
diff --git a/linux-user/host/aarch64/safe-syscall.inc.S b/linux-user/host/aarch64/safe-syscall.inc.S
index e2e726ef55..76a0a18a6c 100644
--- a/linux-user/host/aarch64/safe-syscall.inc.S
+++ b/linux-user/host/aarch64/safe-syscall.inc.S
@@ -22,15 +22,12 @@
          * first argument an 'int *' to the signal_pending flag, the
          * second one the system call number (as a 'long'), and all further
          * arguments being syscall arguments (also 'long').
-         * We return a long which is the syscall's return value, which
-         * may be negative-errno on failure. Conversion to the
-         * -1-and-errno-set convention is done by the calling wrapper.
          */
 safe_syscall_base:
         .cfi_startproc
         /* The syscall calling convention isn't the same as the
          * C one:
-         * we enter with x0 == *signal_pending
+         * we enter with x0 == &signal_pending
          *               x1 == syscall number
          *               x2 ... x7, (stack) == syscall arguments
          *               and return the result in x0
@@ -60,16 +57,21 @@ safe_syscall_base:
 safe_syscall_start:
         /* if signal_pending is non-zero, don't do the call */
         ldr     w10, [x9]
-        cbnz    w10, 0f
+        cbnz    w10, 2f
         svc     0x0
 safe_syscall_end:
         /* code path for having successfully executed the syscall */
+        cmp     x0, #-4096
+        b.hi    0f
         ret
 
-0:
+        /* code path setting errno */
+0:      neg     w0, w0
+        b       safe_syscall_set_errno_tail
+
         /* code path when we didn't execute the syscall */
-        mov     x0, #-TARGET_ERESTARTSYS
-        ret
-        .cfi_endproc
+2:      mov     w0, #TARGET_ERESTARTSYS
+        b       safe_syscall_set_errno_tail
 
+        .cfi_endproc
         .size   safe_syscall_base, .-safe_syscall_base
diff --git a/linux-user/host/arm/safe-syscall.inc.S b/linux-user/host/arm/safe-syscall.inc.S
index 1f1ee8327b..618112c6bf 100644
--- a/linux-user/host/arm/safe-syscall.inc.S
+++ b/linux-user/host/arm/safe-syscall.inc.S
@@ -27,9 +27,6 @@
          * first argument an 'int *' to the signal_pending flag, the
          * second one the system call number (as a 'long'), and all further
          * arguments being syscall arguments (also 'long').
-         * We return a long which is the syscall's return value, which
-         * may be negative-errno on failure. Conversion to the
-         * -1-and-errno-set convention is done by the calling wrapper.
          */
 safe_syscall_base:
         .fnstart
@@ -46,7 +43,7 @@ safe_syscall_base:
         .cfi_rel_offset lr, 20
 
         /* The syscall calling convention isn't the same as the C one:
-         * we enter with r0 == *signal_pending
+         * we enter with r0 == &signal_pending
          *               r1 == syscall number
          *               r2, r3, [sp+0] ... [sp+12] == syscall arguments
          *               and return the result in r0
@@ -74,17 +71,29 @@ safe_syscall_start:
         /* if signal_pending is non-zero, don't do the call */
         ldr     r12, [r8]               /* signal_pending */
         tst     r12, r12
-        bne     1f
+        bne     2f
         swi     0
 safe_syscall_end:
         /* code path for having successfully executed the syscall */
+        cmp     r0, #-4096
+        neghi   r0, r0
+        bhi     1f
         pop     { r4, r5, r6, r7, r8, pc }
 
-1:
         /* code path when we didn't execute the syscall */
-        ldr     r0, =-TARGET_ERESTARTSYS
-        pop     { r4, r5, r6, r7, r8, pc }
+2:      mov     r0, #TARGET_ERESTARTSYS
+
+        /* code path setting errno */
+1:      pop     { r4, r5, r6, r7, r8, lr }
+        .cfi_adjust_cfa_offset -24
+        .cfi_restore r4
+        .cfi_restore r5
+        .cfi_restore r6
+        .cfi_restore r7
+        .cfi_restore r8
+        .cfi_restore lr
+        b       safe_syscall_set_errno_tail
+
         .fnend
         .cfi_endproc
-
         .size   safe_syscall_base, .-safe_syscall_base
diff --git a/linux-user/host/i386/safe-syscall.inc.S b/linux-user/host/i386/safe-syscall.inc.S
index e425aa54d8..f5883234bb 100644
--- a/linux-user/host/i386/safe-syscall.inc.S
+++ b/linux-user/host/i386/safe-syscall.inc.S
@@ -20,9 +20,6 @@
          * first argument an 'int *' to the signal_pending flag, the
          * second one the system call number (as a 'long'), and all further
          * arguments being syscall arguments (also 'long').
-         * We return a long which is the syscall's return value, which
-         * may be negative-errno on failure. Conversion to the
-         * -1-and-errno-set convention is done by the calling wrapper.
          */
 safe_syscall_base:
         .cfi_startproc
@@ -41,7 +38,7 @@ safe_syscall_base:
 
         /* The syscall calling convention isn't the same as the C one:
          * we enter with 0(%esp) == return address
-         *               4(%esp) == *signal_pending
+         *               4(%esp) == &signal_pending
          *               8(%esp) == syscall number
          *               12(%esp) ... 32(%esp) == syscall arguments
          *               and return the result in eax
@@ -70,11 +67,13 @@ safe_syscall_start:
         /* if signal_pending is non-zero, don't do the call */
         mov     4+16(%esp), %eax        /* signal_pending */
         cmpl    $0, (%eax)
-        jnz     1f
+        jnz     2f
         mov     8+16(%esp), %eax        /* syscall number */
         int     $0x80
 safe_syscall_end:
         /* code path for having successfully executed the syscall */
+        cmp     $-4095, %eax
+        jae     0f
         pop     %ebx
         .cfi_remember_state
         .cfi_adjust_cfa_offset -4
@@ -89,12 +88,28 @@ safe_syscall_end:
         .cfi_adjust_cfa_offset -4
         .cfi_restore ebp
         ret
-
-1:
-        /* code path when we didn't execute the syscall */
         .cfi_restore_state
-        mov     $-TARGET_ERESTARTSYS, %eax
-        jmp     safe_syscall_end
-        .cfi_endproc
 
+0:      neg     %eax
+        jmp     1f
+
+        /* code path when we didn't execute the syscall */
+2:      mov     $TARGET_ERESTARTSYS, %eax
+
+        /* code path setting errno */
+1:      pop     %ebx
+        .cfi_adjust_cfa_offset -4
+        .cfi_restore ebx
+        pop     %edi
+        .cfi_adjust_cfa_offset -4
+        .cfi_restore edi
+        pop     %esi
+        .cfi_adjust_cfa_offset -4
+        .cfi_restore esi
+        pop     %ebp
+        .cfi_adjust_cfa_offset -4
+        .cfi_restore ebp
+        jmp     safe_syscall_set_errno_tail
+
+        .cfi_endproc
         .size   safe_syscall_base, .-safe_syscall_base
diff --git a/linux-user/host/ppc64/safe-syscall.inc.S b/linux-user/host/ppc64/safe-syscall.inc.S
index 4b57440585..3a640cfc04 100644
--- a/linux-user/host/ppc64/safe-syscall.inc.S
+++ b/linux-user/host/ppc64/safe-syscall.inc.S
@@ -22,9 +22,6 @@
          * first argument an 'int *' to the signal_pending flag, the
          * second one the system call number (as a 'long'), and all further
          * arguments being syscall arguments (also 'long').
-         * We return a long which is the syscall's return value, which
-         * may be negative-errno on failure. Conversion to the
-         * -1-and-errno-set convention is done by the calling wrapper.
          */
 #if _CALL_ELF == 2
 safe_syscall_base:
@@ -39,7 +36,7 @@ safe_syscall_base:
 .L.safe_syscall_base:
         .cfi_startproc
 #endif
-        /* We enter with r3 == *signal_pending
+        /* We enter with r3 == &signal_pending
          *               r4 == syscall number
          *               r5 ... r10 == syscall arguments
          *               and return the result in r3
@@ -71,21 +68,22 @@ safe_syscall_start:
         /* if signal_pending is non-zero, don't do the call */
         lwz     12, 0(14)
         cmpwi   0, 12, 0
-        bne-    0f
+        bne-    2f
         sc
 safe_syscall_end:
         /* code path when we did execute the syscall */
-        ld 14, 16(1) /* restore r14 to its original value */
-        bnslr+
-
-        /* syscall failed; return negative errno */
-        neg     3, 3
+        ld      14, 16(1) /* restore r14 */
+        bso-    1f
         blr
 
         /* code path when we didn't execute the syscall */
-0:      addi    3, 0, -TARGET_ERESTARTSYS
-        ld 14, 16(1) /* restore r14 to its original value */
-        blr
+2:      ld      14, 16(1) /* restore r14 */
+        addi    3, 0, TARGET_ERESTARTSYS
+
+        /* code path setting errno */
+1:      b       safe_syscall_set_errno_tail
+        nop     /* per abi, for the linker to modify */
+
         .cfi_endproc
 
 #if _CALL_ELF == 2
diff --git a/linux-user/host/riscv/safe-syscall.inc.S b/linux-user/host/riscv/safe-syscall.inc.S
index 95c4832de2..54c2e23f75 100644
--- a/linux-user/host/riscv/safe-syscall.inc.S
+++ b/linux-user/host/riscv/safe-syscall.inc.S
@@ -23,15 +23,12 @@
          * first argument an 'int *' to the signal_pending flag, the
          * second one the system call number (as a 'long'), and all further
          * arguments being syscall arguments (also 'long').
-         * We return a long which is the syscall's return value, which
-         * may be negative-errno on failure. Conversion to the
-         * -1-and-errno-set convention is done by the calling wrapper.
          */
 safe_syscall_base:
         .cfi_startproc
         /*
          * The syscall calling convention is nearly the same as C:
-         * we enter with a0 == *signal_pending
+         * we enter with a0 == &signal_pending
          *               a1 == syscall number
          *               a2 ... a7 == syscall arguments
          *               and return the result in a0
@@ -62,16 +59,21 @@ safe_syscall_base:
 safe_syscall_start:
         /* If signal_pending is non-zero, don't do the call */
         lw      t1, 0(t0)
-        bnez    t1, 0f
+        bnez    t1, 2f
         scall
 safe_syscall_end:
         /* code path for having successfully executed the syscall */
+        li      t2, -4096
+        bgtu    a0, t2, 0f
         ret
 
-0:
+        /* code path setting errno */
+0:      neg     a0, a0
+        j       safe_syscall_set_errno_tail
+
         /* code path when we didn't execute the syscall */
-        li      a0, -TARGET_ERESTARTSYS
-        ret
-        .cfi_endproc
+2:      li      a0, TARGET_ERESTARTSYS
+        j       safe_syscall_set_errno_tail
 
+        .cfi_endproc
         .size   safe_syscall_base, .-safe_syscall_base
diff --git a/linux-user/host/s390x/safe-syscall.inc.S b/linux-user/host/s390x/safe-syscall.inc.S
index d97d27458e..899dab39e9 100644
--- a/linux-user/host/s390x/safe-syscall.inc.S
+++ b/linux-user/host/s390x/safe-syscall.inc.S
@@ -20,9 +20,6 @@
          * first argument an 'int *' to the signal_pending flag, the
          * second one the system call number (as a 'long'), and all further
          * arguments being syscall arguments (also 'long').
-         * We return a long which is the syscall's return value, which
-         * may be negative-errno on failure. Conversion to the
-         * -1-and-errno-set convention is done by the calling wrapper.
          */
 safe_syscall_base:
         .cfi_startproc
@@ -44,9 +41,9 @@ safe_syscall_base:
         stg     %r1,0(%r15)             /* store back chain */
         stg     %r0,8(%r15)             /* store eos */
 
-        /* The syscall calling convention isn't the same as the
-         * C one:
-         * we enter with r2 == *signal_pending
+        /*
+         * The syscall calling convention isn't the same as the C one:
+         * we enter with r2 == &signal_pending
          *               r3 == syscall number
          *               r4, r5, r6, (stack) == syscall arguments
          *               and return the result in r2
@@ -77,14 +74,25 @@ safe_syscall_start:
         svc     0
 safe_syscall_end:
 
-1:      lg      %r15,0(%r15)            /* load back chain */
+        /* code path for having successfully executed the syscall */
+        lg      %r15,0(%r15)            /* load back chain */
         .cfi_remember_state
         .cfi_adjust_cfa_offset -160
         lmg     %r6,%r15,48(%r15)       /* load saved registers */
-        br      %r14
-        .cfi_restore_state
-2:      lghi    %r2, -TARGET_ERESTARTSYS
-        j       1b
-        .cfi_endproc
 
+        lghi    %r0, -4095              /* check for syscall error */
+        clgr    %r2, %r0
+        blr     %r14                    /* return on success */
+        lcr     %r2, %r2                /* create positive errno */
+        jg      safe_syscall_set_errno_tail
+        .cfi_restore_state
+
+        /* code path when we didn't execute the syscall */
+2:      lg      %r15,0(%r15)            /* load back chain */
+        .cfi_adjust_cfa_offset -160
+        lmg     %r6,%r15,48(%r15)       /* load saved registers */
+        lghi    %r2, TARGET_ERESTARTSYS
+        jg      safe_syscall_set_errno_tail
+
+        .cfi_endproc
         .size   safe_syscall_base, .-safe_syscall_base
diff --git a/linux-user/host/x86_64/safe-syscall.inc.S b/linux-user/host/x86_64/safe-syscall.inc.S
index 158225553e..39b64250c3 100644
--- a/linux-user/host/x86_64/safe-syscall.inc.S
+++ b/linux-user/host/x86_64/safe-syscall.inc.S
@@ -19,9 +19,6 @@
          * first argument an 'int *' to the signal_pending flag, the
          * second one the system call number (as a 'long'), and all further
          * arguments being syscall arguments (also 'long').
-         * We return a long which is the syscall's return value, which
-         * may be negative-errno on failure. Conversion to the
-         * -1-and-errno-set convention is done by the calling wrapper.
          */
 safe_syscall_base:
         .cfi_startproc
@@ -35,9 +32,9 @@ safe_syscall_base:
         .cfi_adjust_cfa_offset 8
         .cfi_rel_offset rbp, 0
 
-        /* The syscall calling convention isn't the same as the
-         * C one:
-         * we enter with rdi == *signal_pending
+        /*
+         * The syscall calling convention isn't the same as the C one:
+         * we enter with rdi == &signal_pending
          *               rsi == syscall number
          *               rdx, rcx, r8, r9, (stack), (stack) == syscall arguments
          *               and return the result in rax
@@ -68,24 +65,30 @@ safe_syscall_base:
 safe_syscall_start:
         /* if signal_pending is non-zero, don't do the call */
         cmpl    $0, (%rbp)
-        jnz     1f
+        jnz     2f
         syscall
 safe_syscall_end:
         /* code path for having successfully executed the syscall */
+        cmp     $-4095, %rax
+        jae     0f
         pop     %rbp
         .cfi_remember_state
         .cfi_def_cfa_offset 8
         .cfi_restore rbp
         ret
-
-1:
-        /* code path when we didn't execute the syscall */
         .cfi_restore_state
-        mov     $-TARGET_ERESTARTSYS, %rax
-        pop     %rbp
+
+0:      neg     %eax
+        jmp     1f
+
+        /* code path when we didn't execute the syscall */
+2:      mov     $TARGET_ERESTARTSYS, %eax
+
+        /* code path setting errno */
+1:      pop     %rbp
         .cfi_def_cfa_offset 8
         .cfi_restore rbp
-        ret
+        jmp     safe_syscall_set_errno_tail
         .cfi_endproc
 
         .size   safe_syscall_base, .-safe_syscall_base
diff --git a/linux-user/meson.build b/linux-user/meson.build
index bf62c13e37..94ac3c58ce 100644
--- a/linux-user/meson.build
+++ b/linux-user/meson.build
@@ -10,6 +10,7 @@ linux_user_ss.add(files(
   'main.c',
   'mmap.c',
   'safe-syscall.S',
+  'safe-syscall-error.c',
   'signal.c',
   'strace.c',
   'syscall.c',
-- 
2.25.1


