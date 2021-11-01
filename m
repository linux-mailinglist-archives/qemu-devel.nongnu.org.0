Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57664441F95
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 18:50:54 +0100 (CET)
Received: from localhost ([::1]:33616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhbSP-0002Dw-FC
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 13:50:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhb65-0003mD-4n
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 13:27:49 -0400
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c]:33666)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhb5z-0000d9-IN
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 13:27:48 -0400
Received: by mail-qt1-x82c.google.com with SMTP id h16so12100578qtk.0
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 10:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=h74jAt7hxYWJ8vb//ZptaTN1DfaIP6MJ1JsKHfl8Ic0=;
 b=on5tq4qo+tJLbWVX7GnVUcuIup7bOn+pSBjxneGmik30TkVcs51qfKeR2fc/T7meQt
 vfxOcNqdcpsLQ7ANoLioYgvWwzTsusSTF9UQ9zv6qr6JRa//azhXjU01n+xZh0Efe0//
 32liyiS2Lp69c/IsL17yqflUVQBNj4Oq2nMvUwlMRFQYTgZ/w63g3K8l1tbXYBB3SSPU
 5cG1BuSUJ1CBIvh7MlAZZEm2U4L2VvaVkSkOoj4l0v3IUixiL0btOl/tcnrz7XxZM/Zl
 9sK41XeWRfHA8mPLAegVHFfgSeKavN1Mz4bwJxvs7p7yOiie7eoDIE9g/b42lv72IMha
 Qpdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=h74jAt7hxYWJ8vb//ZptaTN1DfaIP6MJ1JsKHfl8Ic0=;
 b=fNNxyQYGt0MiIiwtTxiNZ6QXL8fryZBg6KqITvJPdP5wqCCONMvXHZZvl1mAo60rVA
 WZ9UdtM2UiiNFGzh0sskKn3bBLkXcCTPeg1QSSyMhdHdQUJmh/Ij6E69B2dxRSzGkZbH
 IeGwkM/atHPQdF8KtdUC3U2OfrWBHU8SPUhbyWqSDjXUAaQdeObHRpQ+sJsRzvVkFZln
 7c2+H1jX8KWwJBe5oYol3VfI0l+iQhSDvvvEaDWs+gEZsiHvRLi25MCQe7D5hax204p0
 HGIqHGU2Vzqp52MjyatEJixNfCJCaG1PtLif/i+Kmie6ePKGCYWbn9HwQ00NBSp7ueh3
 ugiw==
X-Gm-Message-State: AOAM533e2WiN1xpiCzhksatBoDzVmCNU41oVii2nuTX5nMkl3oD6WVhT
 no/8q/ptPzFwb6SeFOsajOtdgxazMZfAKw==
X-Google-Smtp-Source: ABdhPJwdP1dvSxl+r4hXMWngHPmTLkNbUS5ve6yggIJIsYc7h2QhvG+iO4EOpxU+34eizXl1a1MUUA==
X-Received: by 2002:ac8:56f9:: with SMTP id 25mr31617190qtu.374.1635787662581; 
 Mon, 01 Nov 2021 10:27:42 -0700 (PDT)
Received: from localhost.localdomain (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id t5sm6075331qkf.34.2021.11.01.10.27.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Nov 2021 10:27:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 20/60] linux-user: Add cpu_loop_exit_sigsegv
Date: Mon,  1 Nov 2021 13:26:49 -0400
Message-Id: <20211101172729.23149-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211101172729.23149-1-richard.henderson@linaro.org>
References: <20211101172729.23149-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82c;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82c.google.com
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a new interface to be provided by the os emulator for
raising SIGSEGV on fault.  Use the new record_sigsegv target hook.

Reviewed by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/exec-all.h | 15 +++++++++++++++
 accel/tcg/user-exec.c   | 33 ++++++++++++++++++---------------
 linux-user/signal.c     | 30 ++++++++++++++++++++++--------
 3 files changed, 55 insertions(+), 23 deletions(-)

diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index 5dd663c153..f74578500c 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -685,6 +685,21 @@ MMUAccessType adjust_signal_pc(uintptr_t *pc, bool is_write);
 bool handle_sigsegv_accerr_write(CPUState *cpu, sigset_t *old_set,
                                  uintptr_t host_pc, abi_ptr guest_addr);
 
+/**
+ * cpu_loop_exit_sigsegv:
+ * @cpu: the cpu context
+ * @addr: the guest address of the fault
+ * @access_type: access was read/write/execute
+ * @maperr: true for invalid page, false for permission fault
+ * @ra: host pc for unwinding
+ *
+ * Use the TCGCPUOps hook to record cpu state, do guest operating system
+ * specific things to raise SIGSEGV, and jump to the main cpu loop.
+ */
+void QEMU_NORETURN cpu_loop_exit_sigsegv(CPUState *cpu, target_ulong addr,
+                                         MMUAccessType access_type,
+                                         bool maperr, uintptr_t ra);
+
 #else
 static inline void mmap_lock(void) {}
 static inline void mmap_unlock(void) {}
diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index a0cba61e83..c4f69908e9 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -141,35 +141,38 @@ static int probe_access_internal(CPUArchState *env, target_ulong addr,
                                  int fault_size, MMUAccessType access_type,
                                  bool nonfault, uintptr_t ra)
 {
-    int flags;
+    int acc_flag;
+    bool maperr;
 
     switch (access_type) {
     case MMU_DATA_STORE:
-        flags = PAGE_WRITE;
+        acc_flag = PAGE_WRITE_ORG;
         break;
     case MMU_DATA_LOAD:
-        flags = PAGE_READ;
+        acc_flag = PAGE_READ;
         break;
     case MMU_INST_FETCH:
-        flags = PAGE_EXEC;
+        acc_flag = PAGE_EXEC;
         break;
     default:
         g_assert_not_reached();
     }
 
-    if (!guest_addr_valid_untagged(addr) ||
-        page_check_range(addr, 1, flags) < 0) {
-        if (nonfault) {
-            return TLB_INVALID_MASK;
-        } else {
-            CPUState *cpu = env_cpu(env);
-            CPUClass *cc = CPU_GET_CLASS(cpu);
-            cc->tcg_ops->tlb_fill(cpu, addr, fault_size, access_type,
-                                  MMU_USER_IDX, false, ra);
-            g_assert_not_reached();
+    if (guest_addr_valid_untagged(addr)) {
+        int page_flags = page_get_flags(addr);
+        if (page_flags & acc_flag) {
+            return 0; /* success */
         }
+        maperr = !(page_flags & PAGE_VALID);
+    } else {
+        maperr = true;
     }
-    return 0;
+
+    if (nonfault) {
+        return TLB_INVALID_MASK;
+    }
+
+    cpu_loop_exit_sigsegv(env_cpu(env), addr, access_type, maperr, ra);
 }
 
 int probe_access_flags(CPUArchState *env, target_ulong addr,
diff --git a/linux-user/signal.c b/linux-user/signal.c
index b816678ba5..135983747d 100644
--- a/linux-user/signal.c
+++ b/linux-user/signal.c
@@ -688,9 +688,27 @@ void force_sigsegv(int oldsig)
     }
     force_sig(TARGET_SIGSEGV);
 }
-
 #endif
 
+void cpu_loop_exit_sigsegv(CPUState *cpu, target_ulong addr,
+                           MMUAccessType access_type, bool maperr, uintptr_t ra)
+{
+    const struct TCGCPUOps *tcg_ops = CPU_GET_CLASS(cpu)->tcg_ops;
+
+    if (tcg_ops->record_sigsegv) {
+        tcg_ops->record_sigsegv(cpu, addr, access_type, maperr, ra);
+    } else if (tcg_ops->tlb_fill) {
+        tcg_ops->tlb_fill(cpu, addr, 0, access_type, MMU_USER_IDX, false, ra);
+        g_assert_not_reached();
+    }
+
+    force_sig_fault(TARGET_SIGSEGV,
+                    maperr ? TARGET_SEGV_MAPERR : TARGET_SEGV_ACCERR,
+                    addr);
+    cpu->exception_index = EXCP_INTERRUPT;
+    cpu_loop_exit_restore(cpu, ra);
+}
+
 /* abort execution with signal */
 static void QEMU_NORETURN dump_core_and_abort(int target_sig)
 {
@@ -806,7 +824,7 @@ static void host_signal_handler(int host_sig, siginfo_t *info, void *puc)
         access_type = adjust_signal_pc(&pc, is_write);
 
         if (host_sig == SIGSEGV) {
-            const struct TCGCPUOps *tcg_ops;
+            bool maperr = true;
 
             if (info->si_code == SEGV_ACCERR && h2g_valid(host_addr)) {
                 /* If this was a write to a TB protected page, restart. */
@@ -821,18 +839,14 @@ static void host_signal_handler(int host_sig, siginfo_t *info, void *puc)
                  * which means that we may get ACCERR when we want MAPERR.
                  */
                 if (page_get_flags(guest_addr) & PAGE_VALID) {
-                    /* maperr = false; */
+                    maperr = false;
                 } else {
                     info->si_code = SEGV_MAPERR;
                 }
             }
 
             sigprocmask(SIG_SETMASK, &uc->uc_sigmask, NULL);
-
-            tcg_ops = CPU_GET_CLASS(cpu)->tcg_ops;
-            tcg_ops->tlb_fill(cpu, guest_addr, 0, access_type,
-                              MMU_USER_IDX, false, pc);
-            g_assert_not_reached();
+            cpu_loop_exit_sigsegv(cpu, guest_addr, access_type, maperr, pc);
         } else {
             sigprocmask(SIG_SETMASK, &uc->uc_sigmask, NULL);
         }
-- 
2.25.1


