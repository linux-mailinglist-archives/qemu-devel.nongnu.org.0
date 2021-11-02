Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57F94442C98
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 12:32:07 +0100 (CET)
Received: from localhost ([::1]:56458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhs1O-0007vF-C0
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 07:32:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhreB-0003nV-OD
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 07:08:07 -0400
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732]:38639)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhrdz-0000uv-Hn
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 07:07:59 -0400
Received: by mail-qk1-x732.google.com with SMTP id bi29so19207636qkb.5
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 04:07:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=h74jAt7hxYWJ8vb//ZptaTN1DfaIP6MJ1JsKHfl8Ic0=;
 b=BZWt8kLBePsFpxw8g79nSKzp6BLk5ZhJztL5mVP3ZGLkJwLRWyRFU8gfgtBEeOts4L
 w+thPrkljJd/mi6sVVMXKFoZ6OZv/yX/PLoepkfxEerX2+c8vPq7wwigK4TBjNYzKraI
 bK0vqucqAqi9wVW63DGACU+lpJyfgq/d1vTzE1ArhLA9s/KJiJnOS5O3TddJy5AAtzEq
 OuZdsFpb6gjxdxbK+EJ0Pmscug26nNZ96NGLGky9Y5JzE32zNJv8K/vXsjC8mWV6N/tQ
 9OnmbhHVskd4PYBEpV7lS0VrRENGxxMRzTuVkGU6lfOKcMV8rVH1wrBX0GeI4yKF5A1j
 FCfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=h74jAt7hxYWJ8vb//ZptaTN1DfaIP6MJ1JsKHfl8Ic0=;
 b=AosfJlDKtGSRnzkncgIFPCmg8w8I0mKoHMQCFLEXY67hIdCSOrGxM8G2gYjDSFBgGk
 Mhv/Cv3aYOG06csyBIQVu6IvXTSgUrIJcW8KbnHeu7Ol1o0EpmxF6H9mdxlzgg0v/RYV
 lQ+gckeECLADo1edv/5glpnYEQmeTayyXPWIYuJYQRP6T/7ynCjKB5qZnxVjR94PcTtt
 jRIIya/rxc92+s2s6aj9nLSQ321HKrh+HrhlTEyHs6IrlOKtfUsmhEb211AoZA2OjgtU
 a3fLLjjnJQXsfySWRYvnEThxhC1pTkbyhk0SxCMrSMeraQFdnc8NjZCDPn9Ov533p6fm
 OlvQ==
X-Gm-Message-State: AOAM531WmHI+NpciZ9C79qJ3CJKAreU3C5NL7riNLzCLm5XKXUQJQuXA
 gMXIcsMRddaxFvBwlV/6d4zJEzoVrEMywg==
X-Google-Smtp-Source: ABdhPJwvbopvusDaafZ0PO6Ob5BeEiFE+qG5EfxdtvAM3n5lqblV7WtJaAQGq4+vVyeHcsgEfgYtbg==
X-Received: by 2002:a05:620a:2808:: with SMTP id
 f8mr6816341qkp.434.1635851273327; 
 Tue, 02 Nov 2021 04:07:53 -0700 (PDT)
Received: from localhost.localdomain (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id bm7sm3568612qkb.86.2021.11.02.04.07.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 04:07:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 20/60] linux-user: Add cpu_loop_exit_sigsegv
Date: Tue,  2 Nov 2021 07:07:00 -0400
Message-Id: <20211102110740.215699-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211102110740.215699-1-richard.henderson@linaro.org>
References: <20211102110740.215699-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::732;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x732.google.com
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


