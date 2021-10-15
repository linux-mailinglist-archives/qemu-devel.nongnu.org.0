Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E55942E7DA
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 06:25:55 +0200 (CEST)
Received: from localhost ([::1]:41172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbEn4-0004Sx-By
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 00:25:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbEYp-00078M-Us
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 00:11:11 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:46882)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbEYn-0000Fv-Oh
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 00:11:11 -0400
Received: by mail-pg1-x52c.google.com with SMTP id m21so7413728pgu.13
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 21:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yx+lHUm4xHRTq+oGBCcGRXU4RqMZyaNJqFFfjCahKRo=;
 b=Lgc2zpGZqXm7CyOJfiC9Skl5ehvkC+tlzr3c3BDJJBx14Vdipx2NMaMzzquR8Yg6Bs
 WSVw6VoTUrjMx72Va8fmipgjdatNapd0C+kS6eNwweeWP7nhYJ51EpaHN9jdQizEBQc1
 Y8eAJve82wqreyBURLSV6xmD8kSaIAQzJhWFmF7gTDfEZzzAKLw3A9lfNVhQuAu2QOUE
 cd3OS3DtUZUzCKB3n5iHar3ucGa6mP6QKHcDB0td5n0KuGN0Q42ImzsFFKbWNnvKlq+0
 FCwnCsdLQgSa8Bqrt5eeT+8xyJk0+b7HUBgtu5NSYsj7BX0YcVc5DgCQd/I8ganhzH78
 tbsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yx+lHUm4xHRTq+oGBCcGRXU4RqMZyaNJqFFfjCahKRo=;
 b=4dFNarg4t6m0ZTan44rOMQyMe4qKntKGcS1G9Z0sDdVTkDHXp4ilriKoudopRDRWZ5
 keT5CTPaihNOS29P+7hRAIxLrabLsV3NheuhYFN5rND6BKGRC4SUojrZsByKPLTHAzPI
 Z7uVNNOcE/CwFFlqSUSh+NhFFuxHU3FZ23AiQ5HTFBFqRccrIIXonw6PFOm4euzF7aIk
 TH4f6Vh/R9rfUyOXA5bQEChgj39z8L6OZrPYgsf6z6CH8QpYmQw5RCxxYxvYDOkcv7q9
 lrTVaMGLsiO12BXwelzZVpdJ8LCaM8k2rhDA4pEfJapvmJW6hMnzo6DrBbbxTnz8af7p
 fPmw==
X-Gm-Message-State: AOAM530nvtAuKbvlYO5x9M6lpr2e0P3UWtTQUyE1iiNVm5UHjHBjRkhI
 wqOBCbDkQN91iqnfFnJIrJYwX5FG1Hh5nw==
X-Google-Smtp-Source: ABdhPJwiFEpvLe1Jn6rSE7enwqwhOXWUy9KW/riTNzr2QIL+7Fdflugi8W4KjySZw14eUbXKO03mGw==
X-Received: by 2002:a65:64d7:: with SMTP id t23mr7219602pgv.237.1634271068252; 
 Thu, 14 Oct 2021 21:11:08 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id me12sm5718006pjb.27.2021.10.14.21.11.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 21:11:07 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 15/67] linux-user/host/riscv: Populate host_signal.h
Date: Thu, 14 Oct 2021 21:10:01 -0700
Message-Id: <20211015041053.2769193-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211015041053.2769193-1-richard.henderson@linaro.org>
References: <20211015041053.2769193-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
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
Cc: Alistair Francis <alistair.francis@wdc.com>, alex.bennee@linaro.org,
 laurent@vivier.eu, imp@bsdimp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Split host_signal_pc and host_signal_write out of user-exec.c.

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/host/riscv/host-signal.h |  85 +++++++++++++++++-
 accel/tcg/user-exec.c               | 134 ----------------------------
 2 files changed, 84 insertions(+), 135 deletions(-)

diff --git a/linux-user/host/riscv/host-signal.h b/linux-user/host/riscv/host-signal.h
index f4b4d65031..5860dce7d7 100644
--- a/linux-user/host/riscv/host-signal.h
+++ b/linux-user/host/riscv/host-signal.h
@@ -1 +1,84 @@
-#define HOST_SIGNAL_PLACEHOLDER
+/*
+ * host-signal.h: signal info dependent on the host architecture
+ *
+ * Copyright (C) 2021 Linaro Limited
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#ifndef RISCV_HOST_SIGNAL_H
+#define RISCV_HOST_SIGNAL_H
+
+static inline uintptr_t host_signal_pc(ucontext_t *uc)
+{
+    return uc->uc_mcontext.__gregs[REG_PC];
+}
+
+static inline bool host_signal_write(siginfo_t *info, ucontext_t *uc)
+{
+    uint32_t insn = *(uint32_t *)host_signal_pc(uc);
+
+    /*
+     * Detect store by reading the instruction at the program
+     * counter. Note: we currently only generate 32-bit
+     * instructions so we thus only detect 32-bit stores
+     */
+    switch (((insn >> 0) & 0b11)) {
+    case 3:
+        switch (((insn >> 2) & 0b11111)) {
+        case 8:
+            switch (((insn >> 12) & 0b111)) {
+            case 0: /* sb */
+            case 1: /* sh */
+            case 2: /* sw */
+            case 3: /* sd */
+            case 4: /* sq */
+                return true;
+            default:
+                break;
+            }
+            break;
+        case 9:
+            switch (((insn >> 12) & 0b111)) {
+            case 2: /* fsw */
+            case 3: /* fsd */
+            case 4: /* fsq */
+                return true;
+            default:
+                break;
+            }
+            break;
+        default:
+            break;
+        }
+    }
+
+    /* Check for compressed instructions */
+    switch (((insn >> 13) & 0b111)) {
+    case 7:
+        switch (insn & 0b11) {
+        case 0: /*c.sd */
+        case 2: /* c.sdsp */
+            return true;
+        default:
+            break;
+        }
+        break;
+    case 6:
+        switch (insn & 0b11) {
+        case 0: /* c.sw */
+        case 3: /* c.swsp */
+            return true;
+        default:
+            break;
+        }
+        break;
+    default:
+        break;
+    }
+
+    return false;
+}
+
+#endif
diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index 287f03dac5..2d9ab0a8b8 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -139,64 +139,6 @@ bool handle_sigsegv_accerr_write(CPUState *cpu, sigset_t *old_set,
     }
 }
 
-/*
- * 'pc' is the host PC at which the exception was raised.
- * 'address' is the effective address of the memory exception.
- * 'is_write' is 1 if a write caused the exception and otherwise 0.
- * 'old_set' is the signal set which should be restored.
- */
-static inline int handle_cpu_signal(uintptr_t pc, siginfo_t *info,
-                                    int is_write, sigset_t *old_set)
-{
-    CPUState *cpu = current_cpu;
-    CPUClass *cc;
-    unsigned long host_addr = (unsigned long)info->si_addr;
-    MMUAccessType access_type = adjust_signal_pc(&pc, is_write);
-    abi_ptr guest_addr;
-
-    /* For synchronous signals we expect to be coming from the vCPU
-     * thread (so current_cpu should be valid) and either from running
-     * code or during translation which can fault as we cross pages.
-     *
-     * If neither is true then something has gone wrong and we should
-     * abort rather than try and restart the vCPU execution.
-     */
-    if (!cpu || !cpu->running) {
-        printf("qemu:%s received signal outside vCPU context @ pc=0x%"
-               PRIxPTR "\n",  __func__, pc);
-        abort();
-    }
-
-#if defined(DEBUG_SIGNAL)
-    printf("qemu: SIGSEGV pc=0x%08lx address=%08lx w=%d oldset=0x%08lx\n",
-           pc, host_addr, is_write, *(unsigned long *)old_set);
-#endif
-
-    /* Convert forcefully to guest address space, invalid addresses
-       are still valid segv ones */
-    guest_addr = h2g_nocheck(host_addr);
-
-    /* XXX: locking issue */
-    if (is_write &&
-        info->si_signo == SIGSEGV &&
-        info->si_code == SEGV_ACCERR &&
-        h2g_valid(host_addr) &&
-        handle_sigsegv_accerr_write(cpu, old_set, pc, guest_addr)) {
-        return 1;
-    }
-
-    /*
-     * There is no way the target can handle this other than raising
-     * an exception.  Undo signal and retaddr state prior to longjmp.
-     */
-    sigprocmask(SIG_SETMASK, old_set, NULL);
-
-    cc = CPU_GET_CLASS(cpu);
-    cc->tcg_ops->tlb_fill(cpu, guest_addr, 0, access_type,
-                          MMU_USER_IDX, false, pc);
-    g_assert_not_reached();
-}
-
 static int probe_access_internal(CPUArchState *env, target_ulong addr,
                                  int fault_size, MMUAccessType access_type,
                                  bool nonfault, uintptr_t ra)
@@ -255,82 +197,6 @@ void *probe_access(CPUArchState *env, target_ulong addr, int size,
     return size ? g2h(env_cpu(env), addr) : NULL;
 }
 
-#if defined(__riscv)
-
-int cpu_signal_handler(int host_signum, void *pinfo,
-                       void *puc)
-{
-    siginfo_t *info = pinfo;
-    ucontext_t *uc = puc;
-    greg_t pc = uc->uc_mcontext.__gregs[REG_PC];
-    uint32_t insn = *(uint32_t *)pc;
-    int is_write = 0;
-
-    /* Detect store by reading the instruction at the program
-       counter. Note: we currently only generate 32-bit
-       instructions so we thus only detect 32-bit stores */
-    switch (((insn >> 0) & 0b11)) {
-    case 3:
-        switch (((insn >> 2) & 0b11111)) {
-        case 8:
-            switch (((insn >> 12) & 0b111)) {
-            case 0: /* sb */
-            case 1: /* sh */
-            case 2: /* sw */
-            case 3: /* sd */
-            case 4: /* sq */
-                is_write = 1;
-                break;
-            default:
-                break;
-            }
-            break;
-        case 9:
-            switch (((insn >> 12) & 0b111)) {
-            case 2: /* fsw */
-            case 3: /* fsd */
-            case 4: /* fsq */
-                is_write = 1;
-                break;
-            default:
-                break;
-            }
-            break;
-        default:
-            break;
-        }
-    }
-
-    /* Check for compressed instructions */
-    switch (((insn >> 13) & 0b111)) {
-    case 7:
-        switch (insn & 0b11) {
-        case 0: /*c.sd */
-        case 2: /* c.sdsp */
-            is_write = 1;
-            break;
-        default:
-            break;
-        }
-        break;
-    case 6:
-        switch (insn & 0b11) {
-        case 0: /* c.sw */
-        case 3: /* c.swsp */
-            is_write = 1;
-            break;
-        default:
-            break;
-        }
-        break;
-    default:
-        break;
-    }
-
-    return handle_cpu_signal(pc, info, is_write, &uc->uc_sigmask);
-}
-#endif
-
 /* The softmmu versions of these helpers are in cputlb.c.  */
 
 /*
-- 
2.25.1


