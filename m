Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 779FA403CE7
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 17:54:12 +0200 (CEST)
Received: from localhost ([::1]:48220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNztr-0006YH-Hc
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 11:54:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mNzkO-0006jz-M5
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 11:44:24 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:45775)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mNzkB-0002Kt-7I
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 11:44:24 -0400
Received: by mail-wr1-x430.google.com with SMTP id n5so3938026wro.12
 for <qemu-devel@nongnu.org>; Wed, 08 Sep 2021 08:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QvziMJ91H8LMLRTvJvH26eA/5p0/Ta8zU8fplRpgkvk=;
 b=gh6H/mhEZZKrJYbCKi7IMGPduT5uKQoG6Y5YUNWms4e7J+TlaKeGFPW7hGYjL+GP6t
 0bkxBmpCDkXNpxjpxUhprbEEl1m2IFsmF0X9ALCRqcZyd1sVr3OLEC2B19dL8uLOhmj+
 xQpC8PQMfq7BVQcngs/6Y4R9eKsVq7Dsz19MMiaK6TjOjcIt/MZ6aX/97o4YUxyQmz5V
 iPXnaeW0cCz7Xzn9tSUIok3ErqRhpPf41mgz/vSQzHGAnQaTYKhADcFeQCsL5KeUgYvX
 kn50THhTLZwGDNe13DIQ1ii0Y7Fzj+34gMnhWX8t2grRjBLpzQ9UihGSJhBWqEHBLwlc
 8OXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QvziMJ91H8LMLRTvJvH26eA/5p0/Ta8zU8fplRpgkvk=;
 b=aDIj72DAAOxLOmAdn4IE0sgMOt/I/Avb1pukZSi1RE3oSB1BE3CuB7D9NMi6Y6q36g
 p1oDkLZyy4eRfMNuKBWsrfTQRwv76ZSiYYIBctkPZP9LMSS1iEgfEdYQEBfcDIXGdCnT
 voFJXRZaM4j+GXcSqxIGWAXC1a23Vu0Dj96tfYdKgrYvmH6eM4HGxHg6IlSPHJX1ijOr
 RBPxyNXcVhGcO05R2T6L95+9XSZzCyvZ9DBPbA/VTuzEUUD9gyrw6R+YWhxqMdiuUA5I
 JvWn6Usg6Homw29t0v2H2cQ8DrmMoZVvkO4lmqz4c+t8xTtI3WlwgsparwB64pz79bsa
 AHCg==
X-Gm-Message-State: AOAM533F5nqhCZypPjOKBdwbdtZDj0RhJYSB7maBgv5F0ONlitJyCeOp
 Tdy965FttiHk26dXC1JMcRtTx2FYRoo4LA==
X-Google-Smtp-Source: ABdhPJwByF5N5Y3fOInEwRKAgVBfLVJnUHSm0eJWjeJqvbPVU6iI2//OeNeFsZ4+88Yj9ZQlPUVqqg==
X-Received: by 2002:adf:e404:: with SMTP id g4mr4802228wrm.143.1631115849641; 
 Wed, 08 Sep 2021 08:44:09 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id s10sm2587307wrg.42.2021.09.08.08.44.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 08:44:09 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/9] linux-user: Split signal-related prototypes into
 signal-common.h
Date: Wed,  8 Sep 2021 16:43:59 +0100
Message-Id: <20210908154405.15417-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210908154405.15417-1-peter.maydell@linaro.org>
References: <20210908154405.15417-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
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

Split the signal related prototypes into the existing header file
signal-common.h, and include it in those places that now require it.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
v1->v2: use existing signal-common.h instead of new header
---
 linux-user/qemu.h                | 36 --------------------------------
 linux-user/signal-common.h       | 36 ++++++++++++++++++++++++++++++++
 linux-user/aarch64/cpu_loop.c    |  1 +
 linux-user/alpha/cpu_loop.c      |  1 +
 linux-user/arm/cpu_loop.c        |  1 +
 linux-user/cris/cpu_loop.c       |  1 +
 linux-user/fd-trans.c            |  1 +
 linux-user/hexagon/cpu_loop.c    |  1 +
 linux-user/hppa/cpu_loop.c       |  1 +
 linux-user/i386/cpu_loop.c       |  1 +
 linux-user/m68k/cpu_loop.c       |  1 +
 linux-user/main.c                |  1 +
 linux-user/microblaze/cpu_loop.c |  1 +
 linux-user/mips/cpu_loop.c       |  1 +
 linux-user/nios2/cpu_loop.c      |  1 +
 linux-user/openrisc/cpu_loop.c   |  1 +
 linux-user/ppc/cpu_loop.c        |  1 +
 linux-user/riscv/cpu_loop.c      |  1 +
 linux-user/s390x/cpu_loop.c      |  1 +
 linux-user/sh4/cpu_loop.c        |  1 +
 linux-user/sparc/cpu_loop.c      |  1 +
 linux-user/syscall.c             |  1 +
 linux-user/xtensa/cpu_loop.c     |  1 +
 23 files changed, 57 insertions(+), 36 deletions(-)

diff --git a/linux-user/qemu.h b/linux-user/qemu.h
index ad2d49fed9f..76d3f5e7eb9 100644
--- a/linux-user/qemu.h
+++ b/linux-user/qemu.h
@@ -415,42 +415,6 @@ extern long safe_syscall_base(int *pending, long number, ...);
 /* syscall.c */
 int host_to_target_waitstatus(int status);
 
-/* signal.c */
-void process_pending_signals(CPUArchState *cpu_env);
-void signal_init(void);
-int queue_signal(CPUArchState *env, int sig, int si_type,
-                 target_siginfo_t *info);
-void host_to_target_siginfo(target_siginfo_t *tinfo, const siginfo_t *info);
-void target_to_host_siginfo(siginfo_t *info, const target_siginfo_t *tinfo);
-int target_to_host_signal(int sig);
-int host_to_target_signal(int sig);
-long do_sigreturn(CPUArchState *env);
-long do_rt_sigreturn(CPUArchState *env);
-abi_long do_sigaltstack(abi_ulong uss_addr, abi_ulong uoss_addr,
-                        CPUArchState *env);
-int do_sigprocmask(int how, const sigset_t *set, sigset_t *oldset);
-abi_long do_swapcontext(CPUArchState *env, abi_ulong uold_ctx,
-                        abi_ulong unew_ctx, abi_long ctx_size);
-/**
- * block_signals: block all signals while handling this guest syscall
- *
- * Block all signals, and arrange that the signal mask is returned to
- * its correct value for the guest before we resume execution of guest code.
- * If this function returns non-zero, then the caller should immediately
- * return -TARGET_ERESTARTSYS to the main loop, which will take the pending
- * signal and restart execution of the syscall.
- * If block_signals() returns zero, then the caller can continue with
- * emulation of the system call knowing that no signals can be taken
- * (and therefore that no race conditions will result).
- * This should only be called once, because if it is called a second time
- * it will always return non-zero. (Think of it like a mutex that can't
- * be recursively locked.)
- * Signals will be unblocked again by process_pending_signals().
- *
- * Return value: non-zero if there was a pending signal, zero if not.
- */
-int block_signals(void); /* Returns non zero if signal pending */
-
 #ifdef TARGET_I386
 /* vm86.c */
 void save_v86_state(CPUX86State *env);
diff --git a/linux-user/signal-common.h b/linux-user/signal-common.h
index ea86328b289..58ea23f6ea9 100644
--- a/linux-user/signal-common.h
+++ b/linux-user/signal-common.h
@@ -47,4 +47,40 @@ void setup_frame(int sig, struct target_sigaction *ka,
 void setup_rt_frame(int sig, struct target_sigaction *ka,
                     target_siginfo_t *info,
                     target_sigset_t *set, CPUArchState *env);
+
+void process_pending_signals(CPUArchState *cpu_env);
+void signal_init(void);
+int queue_signal(CPUArchState *env, int sig, int si_type,
+                 target_siginfo_t *info);
+void host_to_target_siginfo(target_siginfo_t *tinfo, const siginfo_t *info);
+void target_to_host_siginfo(siginfo_t *info, const target_siginfo_t *tinfo);
+int target_to_host_signal(int sig);
+int host_to_target_signal(int sig);
+long do_sigreturn(CPUArchState *env);
+long do_rt_sigreturn(CPUArchState *env);
+abi_long do_sigaltstack(abi_ulong uss_addr, abi_ulong uoss_addr,
+                        CPUArchState *env);
+int do_sigprocmask(int how, const sigset_t *set, sigset_t *oldset);
+abi_long do_swapcontext(CPUArchState *env, abi_ulong uold_ctx,
+                        abi_ulong unew_ctx, abi_long ctx_size);
+/**
+ * block_signals: block all signals while handling this guest syscall
+ *
+ * Block all signals, and arrange that the signal mask is returned to
+ * its correct value for the guest before we resume execution of guest code.
+ * If this function returns non-zero, then the caller should immediately
+ * return -TARGET_ERESTARTSYS to the main loop, which will take the pending
+ * signal and restart execution of the syscall.
+ * If block_signals() returns zero, then the caller can continue with
+ * emulation of the system call knowing that no signals can be taken
+ * (and therefore that no race conditions will result).
+ * This should only be called once, because if it is called a second time
+ * it will always return non-zero. (Think of it like a mutex that can't
+ * be recursively locked.)
+ * Signals will be unblocked again by process_pending_signals().
+ *
+ * Return value: non-zero if there was a pending signal, zero if not.
+ */
+int block_signals(void); /* Returns non zero if signal pending */
+
 #endif
diff --git a/linux-user/aarch64/cpu_loop.c b/linux-user/aarch64/cpu_loop.c
index ee72a1c20f0..5cac76f67b0 100644
--- a/linux-user/aarch64/cpu_loop.c
+++ b/linux-user/aarch64/cpu_loop.c
@@ -21,6 +21,7 @@
 #include "qemu-common.h"
 #include "qemu.h"
 #include "cpu_loop-common.h"
+#include "signal-common.h"
 #include "qemu/guest-random.h"
 #include "semihosting/common-semi.h"
 #include "target/arm/syndrome.h"
diff --git a/linux-user/alpha/cpu_loop.c b/linux-user/alpha/cpu_loop.c
index 7ce2461a028..8464047368a 100644
--- a/linux-user/alpha/cpu_loop.c
+++ b/linux-user/alpha/cpu_loop.c
@@ -21,6 +21,7 @@
 #include "qemu-common.h"
 #include "qemu.h"
 #include "cpu_loop-common.h"
+#include "signal-common.h"
 
 void cpu_loop(CPUAlphaState *env)
 {
diff --git a/linux-user/arm/cpu_loop.c b/linux-user/arm/cpu_loop.c
index 69632d15be1..5556d381463 100644
--- a/linux-user/arm/cpu_loop.c
+++ b/linux-user/arm/cpu_loop.c
@@ -22,6 +22,7 @@
 #include "qemu.h"
 #include "elf.h"
 #include "cpu_loop-common.h"
+#include "signal-common.h"
 #include "semihosting/common-semi.h"
 
 #define get_user_code_u32(x, gaddr, env)                \
diff --git a/linux-user/cris/cpu_loop.c b/linux-user/cris/cpu_loop.c
index 334edddd1e2..8c9fc3127ec 100644
--- a/linux-user/cris/cpu_loop.c
+++ b/linux-user/cris/cpu_loop.c
@@ -21,6 +21,7 @@
 #include "qemu-common.h"
 #include "qemu.h"
 #include "cpu_loop-common.h"
+#include "signal-common.h"
 
 void cpu_loop(CPUCRISState *env)
 {
diff --git a/linux-user/fd-trans.c b/linux-user/fd-trans.c
index 86b6f484d30..48203c1af9d 100644
--- a/linux-user/fd-trans.c
+++ b/linux-user/fd-trans.c
@@ -28,6 +28,7 @@
 #endif
 #include "qemu.h"
 #include "fd-trans.h"
+#include "signal-common.h"
 
 enum {
     QEMU_IFLA_BR_UNSPEC,
diff --git a/linux-user/hexagon/cpu_loop.c b/linux-user/hexagon/cpu_loop.c
index bc34f5d7c30..348d2dc3413 100644
--- a/linux-user/hexagon/cpu_loop.c
+++ b/linux-user/hexagon/cpu_loop.c
@@ -21,6 +21,7 @@
 #include "qemu/osdep.h"
 #include "qemu.h"
 #include "cpu_loop-common.h"
+#include "signal-common.h"
 #include "internal.h"
 
 void cpu_loop(CPUHexagonState *env)
diff --git a/linux-user/hppa/cpu_loop.c b/linux-user/hppa/cpu_loop.c
index 82d8183821a..c3661994a57 100644
--- a/linux-user/hppa/cpu_loop.c
+++ b/linux-user/hppa/cpu_loop.c
@@ -20,6 +20,7 @@
 #include "qemu/osdep.h"
 #include "qemu.h"
 #include "cpu_loop-common.h"
+#include "signal-common.h"
 
 static abi_ulong hppa_lws(CPUHPPAState *env)
 {
diff --git a/linux-user/i386/cpu_loop.c b/linux-user/i386/cpu_loop.c
index f813e87294a..ee2e139a063 100644
--- a/linux-user/i386/cpu_loop.c
+++ b/linux-user/i386/cpu_loop.c
@@ -21,6 +21,7 @@
 #include "qemu-common.h"
 #include "qemu.h"
 #include "cpu_loop-common.h"
+#include "signal-common.h"
 
 /***********************************************************/
 /* CPUX86 core interface */
diff --git a/linux-user/m68k/cpu_loop.c b/linux-user/m68k/cpu_loop.c
index c7a500b58c4..3a330401bf2 100644
--- a/linux-user/m68k/cpu_loop.c
+++ b/linux-user/m68k/cpu_loop.c
@@ -21,6 +21,7 @@
 #include "qemu-common.h"
 #include "qemu.h"
 #include "cpu_loop-common.h"
+#include "signal-common.h"
 
 void cpu_loop(CPUM68KState *env)
 {
diff --git a/linux-user/main.c b/linux-user/main.c
index a6094563b6b..4f516707357 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -49,6 +49,7 @@
 #include "cpu_loop-common.h"
 #include "crypto/init.h"
 #include "fd-trans.h"
+#include "signal-common.h"
 
 #ifndef AT_FLAGS_PRESERVE_ARGV0
 #define AT_FLAGS_PRESERVE_ARGV0_BIT 0
diff --git a/linux-user/microblaze/cpu_loop.c b/linux-user/microblaze/cpu_loop.c
index c3396a6e09b..0d2c8f8dea8 100644
--- a/linux-user/microblaze/cpu_loop.c
+++ b/linux-user/microblaze/cpu_loop.c
@@ -21,6 +21,7 @@
 #include "qemu-common.h"
 #include "qemu.h"
 #include "cpu_loop-common.h"
+#include "signal-common.h"
 
 void cpu_loop(CPUMBState *env)
 {
diff --git a/linux-user/mips/cpu_loop.c b/linux-user/mips/cpu_loop.c
index 9d813ece4e7..7dfaa0cb1e1 100644
--- a/linux-user/mips/cpu_loop.c
+++ b/linux-user/mips/cpu_loop.c
@@ -21,6 +21,7 @@
 #include "qemu-common.h"
 #include "qemu.h"
 #include "cpu_loop-common.h"
+#include "signal-common.h"
 #include "elf.h"
 #include "internal.h"
 #include "fpu_helper.h"
diff --git a/linux-user/nios2/cpu_loop.c b/linux-user/nios2/cpu_loop.c
index 9869083fa19..68f95d7ad7b 100644
--- a/linux-user/nios2/cpu_loop.c
+++ b/linux-user/nios2/cpu_loop.c
@@ -20,6 +20,7 @@
 #include "qemu/osdep.h"
 #include "qemu.h"
 #include "cpu_loop-common.h"
+#include "signal-common.h"
 
 void cpu_loop(CPUNios2State *env)
 {
diff --git a/linux-user/openrisc/cpu_loop.c b/linux-user/openrisc/cpu_loop.c
index b33fa777187..f6c67859887 100644
--- a/linux-user/openrisc/cpu_loop.c
+++ b/linux-user/openrisc/cpu_loop.c
@@ -21,6 +21,7 @@
 #include "qemu-common.h"
 #include "qemu.h"
 #include "cpu_loop-common.h"
+#include "signal-common.h"
 
 void cpu_loop(CPUOpenRISCState *env)
 {
diff --git a/linux-user/ppc/cpu_loop.c b/linux-user/ppc/cpu_loop.c
index fa91ea0eed9..ace431238c2 100644
--- a/linux-user/ppc/cpu_loop.c
+++ b/linux-user/ppc/cpu_loop.c
@@ -21,6 +21,7 @@
 #include "qemu-common.h"
 #include "qemu.h"
 #include "cpu_loop-common.h"
+#include "signal-common.h"
 
 static inline uint64_t cpu_ppc_get_tb(CPUPPCState *env)
 {
diff --git a/linux-user/riscv/cpu_loop.c b/linux-user/riscv/cpu_loop.c
index 74a9628dc9b..47978c4e354 100644
--- a/linux-user/riscv/cpu_loop.c
+++ b/linux-user/riscv/cpu_loop.c
@@ -22,6 +22,7 @@
 #include "qemu/error-report.h"
 #include "qemu.h"
 #include "cpu_loop-common.h"
+#include "signal-common.h"
 #include "elf.h"
 #include "semihosting/common-semi.h"
 
diff --git a/linux-user/s390x/cpu_loop.c b/linux-user/s390x/cpu_loop.c
index 6a69a6dd260..ae70f630532 100644
--- a/linux-user/s390x/cpu_loop.c
+++ b/linux-user/s390x/cpu_loop.c
@@ -21,6 +21,7 @@
 #include "qemu-common.h"
 #include "qemu.h"
 #include "cpu_loop-common.h"
+#include "signal-common.h"
 
 /* s390x masks the fault address it reports in si_addr for SIGSEGV and SIGBUS */
 #define S390X_FAIL_ADDR_MASK -4096LL
diff --git a/linux-user/sh4/cpu_loop.c b/linux-user/sh4/cpu_loop.c
index 222ed1c670c..06e4a4d0075 100644
--- a/linux-user/sh4/cpu_loop.c
+++ b/linux-user/sh4/cpu_loop.c
@@ -21,6 +21,7 @@
 #include "qemu-common.h"
 #include "qemu.h"
 #include "cpu_loop-common.h"
+#include "signal-common.h"
 
 void cpu_loop(CPUSH4State *env)
 {
diff --git a/linux-user/sparc/cpu_loop.c b/linux-user/sparc/cpu_loop.c
index 02532f198df..b2c06111943 100644
--- a/linux-user/sparc/cpu_loop.c
+++ b/linux-user/sparc/cpu_loop.c
@@ -21,6 +21,7 @@
 #include "qemu-common.h"
 #include "qemu.h"
 #include "cpu_loop-common.h"
+#include "signal-common.h"
 
 #define SPARC64_STACK_BIAS 2047
 
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 4ac2801e495..ad635ed3a5f 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -128,6 +128,7 @@
 
 #include "qemu.h"
 #include "strace.h"
+#include "signal-common.h"
 #include "qemu/guest-random.h"
 #include "qemu/selfmap.h"
 #include "user/syscall-trace.h"
diff --git a/linux-user/xtensa/cpu_loop.c b/linux-user/xtensa/cpu_loop.c
index 64831c91996..bb5335e2b6c 100644
--- a/linux-user/xtensa/cpu_loop.c
+++ b/linux-user/xtensa/cpu_loop.c
@@ -20,6 +20,7 @@
 #include "qemu/osdep.h"
 #include "qemu.h"
 #include "cpu_loop-common.h"
+#include "signal-common.h"
 
 static void xtensa_rfw(CPUXtensaState *env)
 {
-- 
2.20.1


