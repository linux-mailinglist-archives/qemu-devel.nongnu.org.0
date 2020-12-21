Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C6742DFD26
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Dec 2020 16:02:13 +0100 (CET)
Received: from localhost ([::1]:57906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krMhN-0007ks-7Q
	for lists+qemu-devel@lfdr.de; Mon, 21 Dec 2020 10:02:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1krMR3-0004p2-JV
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 09:45:20 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:37443)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1krMQs-0007j6-5S
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 09:45:09 -0500
Received: by mail-wr1-x42d.google.com with SMTP id i9so11318406wrc.4
 for <qemu-devel@nongnu.org>; Mon, 21 Dec 2020 06:45:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=15OOeZsk+mcTfoUWFloM2Ma8zdgqacvLaanjGdJWlmI=;
 b=dTZmcNagvfKMQCOLMim0ZfUdygCcx8YgmGcYIyRvMoC18xniaaQ6XPTmvZP1eX9Uok
 l4Ho3cksNQoET3br5TFdz327FxcOpJPs1obgIHf7vJPMfdnhBhtwoz/ayQTidBxSdZIQ
 0t6auO86niGPWx2fbJvaGH4+M0hJFz2l633+d0gp+99Bfv+mOy1uX9mUaHCBgTpR8PiI
 ImoaX8mD76Y/WPFCm4SvUUfMGcCEOFLx1ufPoNDHtcD0abrIzWOs533sNzW0a8P3xSzV
 GdowQ9Y37osVYba3ZjCHnwt263Lz/ZN89ANyTViGAO82Oq5YtzzsDTkixp0dhYGVbBtA
 z4mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=15OOeZsk+mcTfoUWFloM2Ma8zdgqacvLaanjGdJWlmI=;
 b=br2VVoiEdfCH6j3FprAFv/XhG70j8vSUknHmUHjBQPECV0xHI95IOywMyumqLfrZX3
 8VsZl9fVnxyxMszzcrUEcfgqAHz0yzG2pjW0mwX5zLPxHNd19S++Pu7gea9lOsVIG3lX
 43cxggL2Tvg89YDC3a0pUFgPwld3AaD8MNpDR9mtDSiWZaPQUD1B8mPS5/wGxMGJT0hx
 jhsUscXvfXJxQx8Atr41RqSV8YrHvuPfHMQVDtTxU6dH1wNn4z127fkco5CUhY1uwj6g
 2cJ+QzwFiPVchUx4y/gLFqEkyQ6e67RmPlLizZmjXieAsFf8dexo39/ahXf1bEywROIl
 i8cQ==
X-Gm-Message-State: AOAM530k23rvyruqRdJT7Ix8z0ManwrysaSRrNviyXfuw3+rg7EiTgdx
 gZ+RxBoBtc/J2n3c8UjcjP4kCT2ewW0=
X-Google-Smtp-Source: ABdhPJxshuGukNtVKahnAw1lDcYR2piF5psn1isuYtas/s/PE35A8g+D0kBE33ZiG2BwbVp6lbh7Nw==
X-Received: by 2002:adf:dc08:: with SMTP id t8mr18917878wri.195.1608561904553; 
 Mon, 21 Dec 2020 06:45:04 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id l5sm27439627wrv.44.2020.12.21.06.45.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Dec 2020 06:45:04 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 17/55] cfi: Initial support for cfi-icall in QEMU
Date: Mon, 21 Dec 2020 15:44:09 +0100
Message-Id: <20201221144447.26161-18-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201221144447.26161-1-pbonzini@redhat.com>
References: <20201221144447.26161-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Daniele Buono <dbuono@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniele Buono <dbuono@linux.vnet.ibm.com>

LLVM/Clang, supports runtime checks for forward-edge Control-Flow
Integrity (CFI).

CFI on indirect function calls (cfi-icall) ensures that, in indirect
function calls, the function called is of the right signature for the
pointer type defined at compile time.

For this check to work, the code must always respect the function
signature when using function pointer, the function must be defined
at compile time, and be compiled with link-time optimization.

This rules out, for example, shared libraries that are dynamically loaded
(given that functions are not known at compile time), and code that is
dynamically generated at run-time.

This patch:

1) Introduces the CONFIG_CFI flag to support cfi in QEMU

2) Introduces a decorator to allow the definition of "sensitive"
functions, where a non-instrumented function may be called at runtime
through a pointer. The decorator will take care of disabling cfi-icall
checks on such functions, when cfi is enabled.

3) Marks functions currently in QEMU that exhibit such behavior,
in particular:
- The function in TCG that calls pre-compiled TBs
- The function in TCI that interprets instructions
- Functions in the plugin infrastructures that jump to callbacks
- Functions in util that directly call a signal handler

Signed-off-by: Daniele Buono <dbuono@linux.vnet.ibm.com>
Acked-by: Alex Bennée <alex.bennee@linaro.org
Message-Id: <20201204230615.2392-3-dbuono@linux.vnet.ibm.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 accel/tcg/cpu-exec.c    | 11 +++++++++++
 include/qemu/compiler.h | 12 ++++++++++++
 plugins/core.c          | 37 +++++++++++++++++++++++++++++++++++++
 plugins/loader.c        |  7 +++++++
 tcg/tci.c               |  7 +++++++
 util/main-loop.c        | 11 +++++++++++
 util/oslib-posix.c      | 11 +++++++++++
 7 files changed, 96 insertions(+)

diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 8689c54499..fa325bb3d8 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -26,6 +26,7 @@
 #include "exec/exec-all.h"
 #include "tcg/tcg.h"
 #include "qemu/atomic.h"
+#include "qemu/compiler.h"
 #include "sysemu/qtest.h"
 #include "qemu/timer.h"
 #include "qemu/rcu.h"
@@ -144,6 +145,16 @@ static void init_delay_params(SyncClocks *sc, const CPUState *cpu)
 #endif /* CONFIG USER ONLY */
 
 /* Execute a TB, and fix up the CPU state afterwards if necessary */
+/*
+ * Disable CFI checks.
+ * TCG creates binary blobs at runtime, with the transformed code.
+ * A TB is a blob of binary code, created at runtime and called with an
+ * indirect function call. Since such function did not exist at compile time,
+ * the CFI runtime has no way to verify its signature and would fail.
+ * TCG is not considered a security-sensitive part of QEMU so this does not
+ * affect the impact of CFI in environment with high security requirements
+ */
+QEMU_DISABLE_CFI
 static inline tcg_target_ulong cpu_tb_exec(CPUState *cpu, TranslationBlock *itb)
 {
     CPUArchState *env = cpu->env_ptr;
diff --git a/include/qemu/compiler.h b/include/qemu/compiler.h
index 1b9e58e82b..ad4a02db36 100644
--- a/include/qemu/compiler.h
+++ b/include/qemu/compiler.h
@@ -222,4 +222,16 @@ extern void QEMU_NORETURN QEMU_ERROR("code path is reachable")
 #define qemu_build_not_reached()  g_assert_not_reached()
 #endif
 
+#ifdef CONFIG_CFI
+/*
+ * If CFI is enabled, use an attribute to disable cfi-icall on the following
+ * function
+ */
+#define QEMU_DISABLE_CFI __attribute__((no_sanitize("cfi-icall")))
+#else
+/* If CFI is not enabled, use an empty define to not change the behavior */
+#define QEMU_DISABLE_CFI
+#endif
+
+
 #endif /* COMPILER_H */
diff --git a/plugins/core.c b/plugins/core.c
index 51bfc94787..87b823bbc4 100644
--- a/plugins/core.c
+++ b/plugins/core.c
@@ -31,6 +31,7 @@
 #include "tcg/tcg-op.h"
 #include "trace/mem-internal.h" /* mem_info macros */
 #include "plugin.h"
+#include "qemu/compiler.h"
 
 struct qemu_plugin_cb {
     struct qemu_plugin_ctx *ctx;
@@ -90,6 +91,12 @@ void plugin_unregister_cb__locked(struct qemu_plugin_ctx *ctx,
     }
 }
 
+/*
+ * Disable CFI checks.
+ * The callback function has been loaded from an external library so we do not
+ * have type information
+ */
+QEMU_DISABLE_CFI
 static void plugin_vcpu_cb__simple(CPUState *cpu, enum qemu_plugin_event ev)
 {
     struct qemu_plugin_cb *cb, *next;
@@ -111,6 +118,12 @@ static void plugin_vcpu_cb__simple(CPUState *cpu, enum qemu_plugin_event ev)
     }
 }
 
+/*
+ * Disable CFI checks.
+ * The callback function has been loaded from an external library so we do not
+ * have type information
+ */
+QEMU_DISABLE_CFI
 static void plugin_cb__simple(enum qemu_plugin_event ev)
 {
     struct qemu_plugin_cb *cb, *next;
@@ -128,6 +141,12 @@ static void plugin_cb__simple(enum qemu_plugin_event ev)
     }
 }
 
+/*
+ * Disable CFI checks.
+ * The callback function has been loaded from an external library so we do not
+ * have type information
+ */
+QEMU_DISABLE_CFI
 static void plugin_cb__udata(enum qemu_plugin_event ev)
 {
     struct qemu_plugin_cb *cb, *next;
@@ -325,6 +344,12 @@ void plugin_register_vcpu_mem_cb(GArray **arr,
     dyn_cb->f.generic = cb;
 }
 
+/*
+ * Disable CFI checks.
+ * The callback function has been loaded from an external library so we do not
+ * have type information
+ */
+QEMU_DISABLE_CFI
 void qemu_plugin_tb_trans_cb(CPUState *cpu, struct qemu_plugin_tb *tb)
 {
     struct qemu_plugin_cb *cb, *next;
@@ -339,6 +364,12 @@ void qemu_plugin_tb_trans_cb(CPUState *cpu, struct qemu_plugin_tb *tb)
     }
 }
 
+/*
+ * Disable CFI checks.
+ * The callback function has been loaded from an external library so we do not
+ * have type information
+ */
+QEMU_DISABLE_CFI
 void
 qemu_plugin_vcpu_syscall(CPUState *cpu, int64_t num, uint64_t a1, uint64_t a2,
                          uint64_t a3, uint64_t a4, uint64_t a5,
@@ -358,6 +389,12 @@ qemu_plugin_vcpu_syscall(CPUState *cpu, int64_t num, uint64_t a1, uint64_t a2,
     }
 }
 
+/*
+ * Disable CFI checks.
+ * The callback function has been loaded from an external library so we do not
+ * have type information
+ */
+QEMU_DISABLE_CFI
 void qemu_plugin_vcpu_syscall_ret(CPUState *cpu, int64_t num, int64_t ret)
 {
     struct qemu_plugin_cb *cb, *next;
diff --git a/plugins/loader.c b/plugins/loader.c
index 5cb9794fda..8550e61184 100644
--- a/plugins/loader.c
+++ b/plugins/loader.c
@@ -32,6 +32,7 @@
 #ifndef CONFIG_USER_ONLY
 #include "hw/boards.h"
 #endif
+#include "qemu/compiler.h"
 
 #include "plugin.h"
 
@@ -150,6 +151,12 @@ static uint64_t xorshift64star(uint64_t x)
     return x * UINT64_C(2685821657736338717);
 }
 
+/*
+ * Disable CFI checks.
+ * The install and version functions have been loaded from an external library
+ * so we do not have type information
+ */
+QEMU_DISABLE_CFI
 static int plugin_load(struct qemu_plugin_desc *desc, const qemu_info_t *info, Error **errp)
 {
     qemu_plugin_install_func_t install;
diff --git a/tcg/tci.c b/tcg/tci.c
index 82039fd163..5d97b7c71c 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -31,6 +31,7 @@
 #include "tcg/tcg.h"           /* MAX_OPC_PARAM_IARGS */
 #include "exec/cpu_ldst.h"
 #include "tcg/tcg-op.h"
+#include "qemu/compiler.h"
 
 /* Marker for missing code. */
 #define TODO() \
@@ -475,6 +476,12 @@ static bool tci_compare64(uint64_t u0, uint64_t u1, TCGCond condition)
 #endif
 
 /* Interpret pseudo code in tb. */
+/*
+ * Disable CFI checks.
+ * One possible operation in the pseudo code is a call to binary code.
+ * Therefore, disable CFI checks in the interpreter function
+ */
+QEMU_DISABLE_CFI
 uintptr_t tcg_qemu_tb_exec(CPUArchState *env, uint8_t *tb_ptr)
 {
     tcg_target_ulong regs[TCG_TARGET_NB_REGS];
diff --git a/util/main-loop.c b/util/main-loop.c
index 6470f8eae3..6bfc7c46f5 100644
--- a/util/main-loop.c
+++ b/util/main-loop.c
@@ -33,6 +33,7 @@
 #include "block/aio.h"
 #include "qemu/error-report.h"
 #include "qemu/queue.h"
+#include "qemu/compiler.h"
 
 #ifndef _WIN32
 #include <sys/wait.h>
@@ -44,6 +45,16 @@
  * use signalfd to listen for them.  We rely on whatever the current signal
  * handler is to dispatch the signals when we receive them.
  */
+/*
+ * Disable CFI checks.
+ * We are going to call a signal hander directly. Such handler may or may not
+ * have been defined in our binary, so there's no guarantee that the pointer
+ * used to set the handler is a cfi-valid pointer. Since the handlers are
+ * stored in kernel memory, changing the handler to an attacker-defined
+ * function requires being able to call a sigaction() syscall,
+ * which is not as easy as overwriting a pointer in memory.
+ */
+QEMU_DISABLE_CFI
 static void sigfd_handler(void *opaque)
 {
     int fd = (intptr_t)opaque;
diff --git a/util/oslib-posix.c b/util/oslib-posix.c
index f15234b5c0..f1e2801b11 100644
--- a/util/oslib-posix.c
+++ b/util/oslib-posix.c
@@ -39,6 +39,7 @@
 #include "qemu/thread.h"
 #include <libgen.h>
 #include "qemu/cutils.h"
+#include "qemu/compiler.h"
 
 #ifdef CONFIG_LINUX
 #include <sys/syscall.h>
@@ -773,6 +774,16 @@ void qemu_free_stack(void *stack, size_t sz)
     munmap(stack, sz);
 }
 
+/*
+ * Disable CFI checks.
+ * We are going to call a signal hander directly. Such handler may or may not
+ * have been defined in our binary, so there's no guarantee that the pointer
+ * used to set the handler is a cfi-valid pointer. Since the handlers are
+ * stored in kernel memory, changing the handler to an attacker-defined
+ * function requires being able to call a sigaction() syscall,
+ * which is not as easy as overwriting a pointer in memory.
+ */
+QEMU_DISABLE_CFI
 void sigaction_invoke(struct sigaction *action,
                       struct qemu_signalfd_siginfo *info)
 {
-- 
2.29.2



