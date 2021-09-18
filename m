Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45B2C41084B
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Sep 2021 21:09:45 +0200 (CEST)
Received: from localhost ([::1]:43036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRfia-0005gs-Bs
	for lists+qemu-devel@lfdr.de; Sat, 18 Sep 2021 15:09:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mRfLQ-00057t-Pn
 for qemu-devel@nongnu.org; Sat, 18 Sep 2021 14:45:53 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:35500)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mRfLL-0006oE-C4
 for qemu-devel@nongnu.org; Sat, 18 Sep 2021 14:45:48 -0400
Received: by mail-pg1-x52d.google.com with SMTP id e7so13099145pgk.2
 for <qemu-devel@nongnu.org>; Sat, 18 Sep 2021 11:45:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=b88MeJ0VB21CqXeC9kfaVd7KTqjTS4pXJD2Bd6nXvIA=;
 b=LdR2CNYFfn+r1kbcWbDWOAIkh2kHJcp6BQGe+aDGcm5DVMhe5ygdAsn2O1vHbrQoIM
 0YI+pGSVvdoFFwlrB1G40x2gWqEotTJtmGn9vi0YUdT1VjTOqsuNij3I5KUkDAdW972D
 u5ZpDcYyMegV9r81yi7lsvGibWUBaQTUrK6sHYuyaGhpSRqMVTxhv/jIYTL5IQO/0o6g
 uksGaSO1rP6BRuV5Pz3Jvkf+LN+HuR/AJNkNuNLnd4zMS4u4LvOhjRk86i5gKeSIv4Nm
 qfwvul+A26beSCR+JrYHyyxZ6x5IdaIbVZLa0GvxU5nbaqsz9Z2fRD/2qt/2rMbGMpZ5
 /xgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=b88MeJ0VB21CqXeC9kfaVd7KTqjTS4pXJD2Bd6nXvIA=;
 b=tUZH7St2Cp+k9coV0JKHARyjPwfYtI4igDG6nfkusz1Z98fSpRq5UPzlJmHXzLadfy
 lyntbmMz6hlADEJmrcqDX85ds8b2Pf0kaBM7crUzLHl45jHfPhAz63bakhSPClCJv6Tf
 w0B9Xl/W6IY7WylIWNGi+ElVDYU9UNSAID5kGeR9CWpTNkqKUPgULFuDtsvZmAnkkhBX
 ML2DYZVYxWstHKHOyaXDEIqqTw1JuMTSZqtw2w4bO+Dyx330wqkYJCD7OOuLSeXe4bf1
 ffGce28mmhE3Po5dLqiJpqkiIx/R8PwQHVtfdd9DmwpmWS1zFvQVfLCBMfcj051KLPGw
 xYpw==
X-Gm-Message-State: AOAM531mXMvG2JEx39UCbUBwLLDHF7k0ehslPjP/3wqsU+Ns1X62utCs
 WwWJlT2TyNGoKnOr1N/mK2URUlLF/jb58Q==
X-Google-Smtp-Source: ABdhPJwaW/pYoc+X7R60tK44q+NJKSrRNavPa6fD177dLQKHyVAbJIpMyUw8OoVxBw55n1iE+VGUlA==
X-Received: by 2002:aa7:953d:0:b0:438:c168:df09 with SMTP id
 c29-20020aa7953d000000b00438c168df09mr16913236pfp.59.1631990741766; 
 Sat, 18 Sep 2021 11:45:41 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id y26sm9555858pfe.69.2021.09.18.11.45.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Sep 2021 11:45:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 15/41] linux-user/host/riscv: Populate host_signal.h
Date: Sat, 18 Sep 2021 11:45:01 -0700
Message-Id: <20210918184527.408540-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210918184527.408540-1-richard.henderson@linaro.org>
References: <20210918184527.408540-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
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
Cc: laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Split host_signal_pc and host_signal_write out of user-exec.c.

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
index 42d1ad189b..01e7e69e7f 100644
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
 
 uint32_t cpu_ldub_data(CPUArchState *env, abi_ptr ptr)
-- 
2.25.1


