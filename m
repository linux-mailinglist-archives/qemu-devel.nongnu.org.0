Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61AB741F395
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Oct 2021 19:48:38 +0200 (CEST)
Received: from localhost ([::1]:47048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWMeD-0002XF-Cy
	for lists+qemu-devel@lfdr.de; Fri, 01 Oct 2021 13:48:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mWM52-0004xo-JB
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 13:12:16 -0400
Received: from mail-qv1-xf2c.google.com ([2607:f8b0:4864:20::f2c]:34491)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mWM4z-00059N-Oo
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 13:12:16 -0400
Received: by mail-qv1-xf2c.google.com with SMTP id x8so6002966qvp.1
 for <qemu-devel@nongnu.org>; Fri, 01 Oct 2021 10:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FDhkJIE1evS1cLhaEMVaF6n1Obdz81Be/9kGft2ow5k=;
 b=IxmO67Fn+ZCw5T/2r+lQs5TbtTW7RgrJywsRyuNJBDJABRkSgHl5XaYj5BE2bYvro7
 nt/CGRqe8HIwZVR+TkDGZMSwed89KZR3OVHtQiLFLi30D2wFl31P0f4b8KNxD8Rhs03a
 ozYRD9fmqjBL9COM13tQNPpIgKiRaMMpcj2I8q9y8WSjcWWcCUjkoD0k+oXPeQAYuVI6
 w0T75olVB9nZf+RN2pnregVoUu9qkTmOwz84cF4fgMiRQc1e/YEf6ozu2ARrwc6AvnDt
 aX6JZmb+N+Z6OxwCZycxXTNwPuhvrJj8YKY99mu5woCtV10qGQrZvLeS8NvGt2e3hDwV
 87xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FDhkJIE1evS1cLhaEMVaF6n1Obdz81Be/9kGft2ow5k=;
 b=Uuagc4+uzjXvYTBvsO9ITEjAGbMekFoT/yButjoPTg36AnDSnSEwR86bOSvRfvdzrO
 KnH4lSaztjska7bvkhS1vbewHU7ugZviJBdrNpXTn4lfemXvrUtWbsNq+1CCeI6werct
 vGaZOIZh+hxhGKx31aD11UpPgICziFx5Dup7E1j2lEb6l6yk0NkFmjzCxx83+yCCsnDl
 v8dIUeIPDvqH75WaIkkTiP1h3/NBz8ylc2JFjFmnCUtTZt1eDKqQy7lrPtthvzJWtVIi
 v2NxbIvwpdtVYgoaxQNLoDrU0mCMWSPR4Q1re7jUZr+Z196tiycf5CDLffLJypXEzaj5
 LQgA==
X-Gm-Message-State: AOAM5337YioT8SZN5muCeRpk5yaOJeHgxpFBTqyEsmvQAC6kseMuUcpM
 jFchBYufKG9jPXtLgW9cOANa651bTTFpUQ==
X-Google-Smtp-Source: ABdhPJzR2HxBc3Xbtru9DFidsdu6cWMRl8WQsUPY6BvTMWFwKiXE/u2bcu1EeuBlIk+LXy+j0gXtSg==
X-Received: by 2002:a05:6214:3e1:: with SMTP id
 cf1mr9867136qvb.43.1633108331086; 
 Fri, 01 Oct 2021 10:12:11 -0700 (PDT)
Received: from localhost.localdomain (c-67-174-166-185.hsd1.ga.comcast.net.
 [67.174.166.185])
 by smtp.gmail.com with ESMTPSA id y15sm3557250qko.78.2021.10.01.10.12.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Oct 2021 10:12:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 20/41] linux-user: Add cpu_loop_exit_segv
Date: Fri,  1 Oct 2021 13:11:30 -0400
Message-Id: <20211001171151.1739472-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211001171151.1739472-1-richard.henderson@linaro.org>
References: <20211001171151.1739472-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2c;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf2c.google.com
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
Cc: alex.bennee@linaro.org, laurent@vivier.eu,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
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
index 5dd663c153..14e554d27d 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -685,6 +685,21 @@ MMUAccessType adjust_signal_pc(uintptr_t *pc, bool is_write);
 bool handle_sigsegv_accerr_write(CPUState *cpu, sigset_t *old_set,
                                  uintptr_t host_pc, abi_ptr guest_addr);
 
+/**
+ * cpu_loop_exit_segv:
+ * @cpu: the cpu context
+ * @addr: the guest address of the fault
+ * @access_type: access was read/write/execute
+ * @maperr: true for invalid page, false for permission fault
+ * @ra: host pc for unwinding
+ *
+ * Use the TCGCPUOps hook to record cpu state, do guest operating system
+ * specific things to raise SIGSEGV, and jump to the main cpu loop.
+ */
+void QEMU_NORETURN cpu_loop_exit_segv(CPUState *cpu, target_ulong addr,
+                                      MMUAccessType access_type,
+                                      bool maperr, uintptr_t ra);
+
 #else
 static inline void mmap_lock(void) {}
 static inline void mmap_unlock(void) {}
diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index 01e7e69e7f..1fd38ea624 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -143,35 +143,38 @@ static int probe_access_internal(CPUArchState *env, target_ulong addr,
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
+    cpu_loop_exit_segv(env_cpu(env), addr, access_type, maperr, ra);
 }
 
 int probe_access_flags(CPUArchState *env, target_ulong addr,
diff --git a/linux-user/signal.c b/linux-user/signal.c
index 537c6c41c0..8c22f711f1 100644
--- a/linux-user/signal.c
+++ b/linux-user/signal.c
@@ -685,9 +685,27 @@ void force_sigsegv(int oldsig)
     }
     force_sig(TARGET_SIGSEGV);
 }
-
 #endif
 
+void cpu_loop_exit_segv(CPUState *cpu, target_ulong addr,
+                        MMUAccessType access_type, bool maperr, uintptr_t ra)
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
@@ -803,7 +821,7 @@ static void host_signal_handler(int host_sig, siginfo_t *info, void *puc)
         access_type = adjust_signal_pc(&pc, is_write);
 
         if (host_sig == SIGSEGV) {
-            const struct TCGCPUOps *tcg_ops;
+            bool maperr = true;
 
             if (info->si_code == SEGV_ACCERR && h2g_valid(host_addr)) {
                 /* If this was a write to a TB protected page, restart. */
@@ -818,18 +836,14 @@ static void host_signal_handler(int host_sig, siginfo_t *info, void *puc)
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
+            cpu_loop_exit_segv(cpu, guest_addr, access_type, maperr, pc);
         } else {
             sigprocmask(SIG_SETMASK, &uc->uc_sigmask, NULL);
         }
-- 
2.25.1


