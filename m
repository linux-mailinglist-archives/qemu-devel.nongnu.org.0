Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89432441F79
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 18:43:18 +0100 (CET)
Received: from localhost ([::1]:45156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhbL3-0007GJ-Nl
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 13:43:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhb62-0003dc-0k
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 13:27:46 -0400
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735]:43696)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhb5w-0000by-Jq
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 13:27:45 -0400
Received: by mail-qk1-x735.google.com with SMTP id bp7so11991692qkb.10
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 10:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Xgy59h5PK+sdBlw/Sd25XUenAcGDXNsVYhc2txOg2GE=;
 b=Zd7jC9f1xfgSeFQp8hijxiOCt300rxSJnkOkCJPlQ8fqDUkgSADYVpPTodIkW6+35n
 pziW+5OJuC/2b0vR+kg0it+cqaqpI6D2ERnee5gGi7yI4yVAGoQIm5cV0TzZ+1GdURHn
 Bpqe5NCG+RBS1OE4QIKidB6IwlIMiinJoMdV/6adC6+zsiRMLlFldyl/eIY0gLknth/6
 3DoIHjySWl6RFv1kmuIv1XYRxL1Mz0WoXP2+PL8u3byq3QzLf9hUWDw+fGq9Z1o9H/xS
 gXzRhOuQbwEgaZcHNlXL+j/oasvdXR4ZQS+rDyoifdRAUYg5ZABsb4mXDejaLwYdm8lH
 N+WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Xgy59h5PK+sdBlw/Sd25XUenAcGDXNsVYhc2txOg2GE=;
 b=RnevjXNqGhQyDabgFKpi7tAVouBtfS9lmjgi8bWJNO+Y0exjkX74e5yuQ9d3YqaQZa
 Aek520761v7hM9nAf8rCvkaD5phRVuJKvSbsVYkpXNV7d9QC2RKjadBYC9UUPGNCt6M1
 InvYfcvdNDyyxKCu8tYoVWkwXU270GUNyHbyLuX/k3HxvxGmyWlSEF75HtYZq7MEMuWU
 s74N4w1x/uovfNmwA+rfUtMQj33P4vRKDjyNKLyeYyoLQ/IMauWV7pXYczh6/UCxtIa9
 s7EsEpmOElEigllojADl849Ly30X+Ev+9RHW9ISym4T6jCmqfnTlJ6HH2h9EuFV0E2xT
 X9XA==
X-Gm-Message-State: AOAM530v2qx5wTFHWcFQ5RDAWBzfvOjIkKC7O0pWVNJ9gCXjiHXo9O7y
 JtCYgKPy1sDQuwmbBzPSqvTxKnrFHxaPzA==
X-Google-Smtp-Source: ABdhPJwXBHh6L7MDL9vlRtu1cK/FtWNTsf8C4l3026DYOwji6Zoa0H5QfWFFRO3cJuYEPyfsq1Uw3g==
X-Received: by 2002:a05:620a:578:: with SMTP id
 p24mr24906679qkp.237.1635787659749; 
 Mon, 01 Nov 2021 10:27:39 -0700 (PDT)
Received: from localhost.localdomain (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id t5sm6075331qkf.34.2021.11.01.10.27.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Nov 2021 10:27:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 15/60] linux-user/host/riscv: Populate host_signal.h
Date: Mon,  1 Nov 2021 13:26:44 -0400
Message-Id: <20211101172729.23149-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211101172729.23149-1-richard.henderson@linaro.org>
References: <20211101172729.23149-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::735;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x735.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Alistair Francis <alistair.francis@wdc.com>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Split host_signal_pc and host_signal_write out of user-exec.c.

Cc: Thomas Huth <thuth@redhat.com>
Reviewed-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/host/riscv/host-signal.h |  86 +++++++++++++++++-
 accel/tcg/user-exec.c               | 134 ----------------------------
 2 files changed, 85 insertions(+), 135 deletions(-)

diff --git a/linux-user/host/riscv/host-signal.h b/linux-user/host/riscv/host-signal.h
index f4b4d65031..df145b1527 100644
--- a/linux-user/host/riscv/host-signal.h
+++ b/linux-user/host/riscv/host-signal.h
@@ -1 +1,85 @@
-#define HOST_SIGNAL_PLACEHOLDER
+/*
+ * host-signal.h: signal info dependent on the host architecture
+ *
+ * Copyright (c) 2003-2005 Fabrice Bellard
+ * Copyright (c) 2021 Linaro Limited
+ *
+ * This work is licensed under the terms of the GNU LGPL, version 2.1 or later.
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
index 44c83acba5..a0cba61e83 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -137,64 +137,6 @@ bool handle_sigsegv_accerr_write(CPUState *cpu, sigset_t *old_set,
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
@@ -253,82 +195,6 @@ void *probe_access(CPUArchState *env, target_ulong addr, int size,
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


