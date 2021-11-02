Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CE37442C68
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 12:21:20 +0100 (CET)
Received: from localhost ([::1]:50278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhrqx-00012Q-I1
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 07:21:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhrdq-0003eJ-Ta
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 07:07:46 -0400
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835]:35365)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhrdo-0000rB-0S
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 07:07:46 -0400
Received: by mail-qt1-x835.google.com with SMTP id n2so18482462qta.2
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 04:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=shTlPwSm/VaKjDDgx3jqfEVE3VVxFJ7ui9L4q5qHESI=;
 b=rrOPzkRAbEbIhstLJhHVEz1EefNEBeszVBUyML71IR03hKlYFfVh5eNxo8qlgylg30
 Q3gzRiBss58E5iENjaX1ryIln/e5xHC0MZ3kKDRH/Iu4lYUwn49n/CKda+BMY+sNkQ/Z
 eTX1vquUt0x7qLhymX6MDacizi8S1rJssJLoDfNYKoYxf66caQuE5wIIVUvEKieLfKAd
 bAdVA+A3JfT07BidvIn5RT9LQmxgMbJlWLP3UfHxM8VnnsH+RkoEwkaSVTec13t8eChp
 L/zH8j4JysdJHoIrNuJj1zyD0wWm1OuV+0apTESzagmTFEgSySlL57gybmlVqOkMCcmM
 Q8vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=shTlPwSm/VaKjDDgx3jqfEVE3VVxFJ7ui9L4q5qHESI=;
 b=KtmDo8y9OVlJdezSNECOHxJIxWEvPwlipp8YZ3VSlZsn0bSK5VMFPQOeDKr4Nw9Vz8
 dYQaPKosBcY9XkYR7vVHe2ma6mxEfzuQZUdnPJ94WEYRTX1uRwcMsYYTXHRg0PXiE3m6
 FsE0daxnmEzKCLiRuStLNj7Rx+zGPXUBQ7XyTidoE9N+TR+vu8cAJvJqiHE8+erXFaiK
 af6XMn8oBt7p588WQU/w6kPRM5cie/YfRPtTQ9dOIGjvoTBy0+vEnxAnIo6T0MVv3qhM
 sT0oUv9s7S4nOPJsFCyPzU5wUFXTM26HtkDuC4zIOEDxFUNmTHCQdYctMPiMnKsa4Ret
 hv4Q==
X-Gm-Message-State: AOAM531kxs0I1LLpA4bdnBlQ2+BXy4HmIlsRqmOysMptXvvL+JUMT/Gg
 frkzofMwWnz6RPLh9rFAUS3/OfWtcr3bCA==
X-Google-Smtp-Source: ABdhPJxUpr1MrDfYIK7ceilQY28s7ruTZAgqwye79D5wSMtATu8Y1XXtiu6Ed35XthjX0Q/JfUAomA==
X-Received: by 2002:ac8:7f84:: with SMTP id z4mr20917416qtj.81.1635851263048; 
 Tue, 02 Nov 2021 04:07:43 -0700 (PDT)
Received: from localhost.localdomain (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id bm7sm3568612qkb.86.2021.11.02.04.07.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 04:07:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 03/60] accel/tcg: Split out handle_sigsegv_accerr_write
Date: Tue,  2 Nov 2021 07:06:43 -0400
Message-Id: <20211102110740.215699-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211102110740.215699-1-richard.henderson@linaro.org>
References: <20211102110740.215699-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::835;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x835.google.com
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is the major portion of handle_cpu_signal which is specific
to tcg, handling the page protections for the translations.
Most of the rest will migrate to linux-user/ shortly.

Reviewed-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Pass guest address to handle_sigsegv_accerr_write.
---
 include/exec/exec-all.h |  12 +++++
 accel/tcg/user-exec.c   | 101 ++++++++++++++++++++++++----------------
 2 files changed, 72 insertions(+), 41 deletions(-)

diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index e54f8e5d65..5f94d799aa 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -673,6 +673,18 @@ static inline tb_page_addr_t get_page_addr_code_hostp(CPUArchState *env,
  */
 MMUAccessType adjust_signal_pc(uintptr_t *pc, bool is_write);
 
+/**
+ * handle_sigsegv_accerr_write:
+ * @cpu: the cpu context
+ * @old_set: the sigset_t from the signal ucontext_t
+ * @host_pc: the host pc, adjusted for the signal
+ * @host_addr: the host address of the fault
+ *
+ * Return true if the write fault has been handled, and should be re-tried.
+ */
+bool handle_sigsegv_accerr_write(CPUState *cpu, sigset_t *old_set,
+                                 uintptr_t host_pc, abi_ptr guest_addr);
+
 /**
  * cpu_signal_handler
  * @signum: host signal number
diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index 3f3e793b7b..b83f8d12f4 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -114,6 +114,52 @@ MMUAccessType adjust_signal_pc(uintptr_t *pc, bool is_write)
     return is_write ? MMU_DATA_STORE : MMU_DATA_LOAD;
 }
 
+/**
+ * handle_sigsegv_accerr_write:
+ * @cpu: the cpu context
+ * @old_set: the sigset_t from the signal ucontext_t
+ * @host_pc: the host pc, adjusted for the signal
+ * @guest_addr: the guest address of the fault
+ *
+ * Return true if the write fault has been handled, and should be re-tried.
+ *
+ * Note that it is important that we don't call page_unprotect() unless
+ * this is really a "write to nonwriteable page" fault, because
+ * page_unprotect() assumes that if it is called for an access to
+ * a page that's writeable this means we had two threads racing and
+ * another thread got there first and already made the page writeable;
+ * so we will retry the access. If we were to call page_unprotect()
+ * for some other kind of fault that should really be passed to the
+ * guest, we'd end up in an infinite loop of retrying the faulting access.
+ */
+bool handle_sigsegv_accerr_write(CPUState *cpu, sigset_t *old_set,
+                                 uintptr_t host_pc, abi_ptr guest_addr)
+{
+    switch (page_unprotect(guest_addr, host_pc)) {
+    case 0:
+        /*
+         * Fault not caused by a page marked unwritable to protect
+         * cached translations, must be the guest binary's problem.
+         */
+        return false;
+    case 1:
+        /*
+         * Fault caused by protection of cached translation; TBs
+         * invalidated, so resume execution.
+         */
+        return true;
+    case 2:
+        /*
+         * Fault caused by protection of cached translation, and the
+         * currently executing TB was modified and must be exited immediately.
+         */
+        cpu_exit_tb_from_sighandler(cpu, old_set);
+        /* NORETURN */
+    default:
+        g_assert_not_reached();
+    }
+}
+
 /*
  * 'pc' is the host PC at which the exception was raised.
  * 'address' is the effective address of the memory exception.
@@ -125,8 +171,9 @@ static inline int handle_cpu_signal(uintptr_t pc, siginfo_t *info,
 {
     CPUState *cpu = current_cpu;
     CPUClass *cc;
-    unsigned long address = (unsigned long)info->si_addr;
+    unsigned long host_addr = (unsigned long)info->si_addr;
     MMUAccessType access_type = adjust_signal_pc(&pc, is_write);
+    abi_ptr guest_addr;
 
     /* For synchronous signals we expect to be coming from the vCPU
      * thread (so current_cpu should be valid) and either from running
@@ -143,49 +190,21 @@ static inline int handle_cpu_signal(uintptr_t pc, siginfo_t *info,
 
 #if defined(DEBUG_SIGNAL)
     printf("qemu: SIGSEGV pc=0x%08lx address=%08lx w=%d oldset=0x%08lx\n",
-           pc, address, is_write, *(unsigned long *)old_set);
+           pc, host_addr, is_write, *(unsigned long *)old_set);
 #endif
-    /* XXX: locking issue */
-    /* Note that it is important that we don't call page_unprotect() unless
-     * this is really a "write to nonwriteable page" fault, because
-     * page_unprotect() assumes that if it is called for an access to
-     * a page that's writeable this means we had two threads racing and
-     * another thread got there first and already made the page writeable;
-     * so we will retry the access. If we were to call page_unprotect()
-     * for some other kind of fault that should really be passed to the
-     * guest, we'd end up in an infinite loop of retrying the faulting
-     * access.
-     */
-    if (is_write && info->si_signo == SIGSEGV && info->si_code == SEGV_ACCERR &&
-        h2g_valid(address)) {
-        switch (page_unprotect(h2g(address), pc)) {
-        case 0:
-            /* Fault not caused by a page marked unwritable to protect
-             * cached translations, must be the guest binary's problem.
-             */
-            break;
-        case 1:
-            /* Fault caused by protection of cached translation; TBs
-             * invalidated, so resume execution.  Retain helper_retaddr
-             * for a possible second fault.
-             */
-            return 1;
-        case 2:
-            /* Fault caused by protection of cached translation, and the
-             * currently executing TB was modified and must be exited
-             * immediately.  Clear helper_retaddr for next execution.
-             */
-            cpu_exit_tb_from_sighandler(cpu, old_set);
-            /* NORETURN */
-
-        default:
-            g_assert_not_reached();
-        }
-    }
 
     /* Convert forcefully to guest address space, invalid addresses
        are still valid segv ones */
-    address = h2g_nocheck(address);
+    guest_addr = h2g_nocheck(host_addr);
+
+    /* XXX: locking issue */
+    if (is_write &&
+        info->si_signo == SIGSEGV &&
+        info->si_code == SEGV_ACCERR &&
+        h2g_valid(host_addr) &&
+        handle_sigsegv_accerr_write(cpu, old_set, pc, guest_addr)) {
+        return 1;
+    }
 
     /*
      * There is no way the target can handle this other than raising
@@ -194,7 +213,7 @@ static inline int handle_cpu_signal(uintptr_t pc, siginfo_t *info,
     sigprocmask(SIG_SETMASK, old_set, NULL);
 
     cc = CPU_GET_CLASS(cpu);
-    cc->tcg_ops->tlb_fill(cpu, address, 0, access_type,
+    cc->tcg_ops->tlb_fill(cpu, guest_addr, 0, access_type,
                           MMU_USER_IDX, false, pc);
     g_assert_not_reached();
 }
-- 
2.25.1


