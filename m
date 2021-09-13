Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBF59409F83
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 00:12:34 +0200 (CEST)
Received: from localhost ([::1]:36196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPuBl-0003yQ-Sg
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 18:12:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPu5Q-0001oq-GG
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 18:06:01 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:41782)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPu5O-0007N7-8X
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 18:05:59 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 m21-20020a17090a859500b00197688449c4so1182502pjn.0
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 15:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BSr8CpzMFsO2CignfsD0RiKPN4BnIAAHYciYbFsOhR4=;
 b=OLyHwgIS+D2qb8pv8ZfNrVtS7FJVPpae9zPZNIG7KPLgQyVeCSJuJiRjJ8ZrPgL77Q
 eV2PDH4/CvlSBZ2rLFUyAHsmfjr104fIeisnNuC1QUAzqKk35wOdE6G46RXDAZ8aKw2y
 v4VpZ8s4segcQ7O65w1t05dlcqffIsvUHFcKM9R+1uqFA4sxys+R4yKG0IQSXqqPhZrk
 tVC2PfQl8eI6Ufcrp8DmcBcH4K/buT7p91pF79mFSttGZZTgVpYQcPyte4r8kqNGyv9x
 0bjbe6mQ4hqlwyp1Q6MdBDrIWz8ecPs3kQmj/VeGvU7fXWeTsyfbnmbPWTNGQW6kL7pd
 cOEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BSr8CpzMFsO2CignfsD0RiKPN4BnIAAHYciYbFsOhR4=;
 b=cyhIKfXKyZ+tHwMAyTR3cfmfgZll0UMPsN+/M7hLf9PdgnrBBH4xhvphQ/xFGz7hlA
 gTyxQKank5dEvQIVbk6kt5KJOwddF1+bjbDrXbvDHUbaN62HDR32HWbpL/2+OlghGLYd
 ngJMLlkV96xZ1XBwpQZZ42Ua9sd1rTiD2qJkfHn0GBxGe6QwLKIdalaMFnE4BUm4okop
 IG3QhaONkN+BWEqaYvcqLGF63kTLKFeHydnsrSEDZFljw53F6nGdezXpEvzbvEZDG2Oy
 NGgsPjH89GZnCeTuoVBHBntkCwnXy2s0jif7yVh5Wohl+y9Waf/4MkM0fuJ+GJWwKKaV
 7QkA==
X-Gm-Message-State: AOAM5334Kr+uyJ3A7UVHCAGghrwkLjOi8S3HsEFEm/Dgl5XLokteW5p1
 NgPu6VhN14SORdA1FTvrY1l4KFoC0+4d2w==
X-Google-Smtp-Source: ABdhPJwQoanx4+sMRxYa7hQqGu2isZTBjtH6bh3mWabbXhu0wYjlS8SjuxRqLthNaBA5JWfeacY6sA==
X-Received: by 2002:a17:902:ba98:b0:139:93:7e26 with SMTP id
 k24-20020a170902ba9800b0013900937e26mr12290790pls.55.1631570756904; 
 Mon, 13 Sep 2021 15:05:56 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id 17sm7721404pfx.167.2021.09.13.15.05.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 15:05:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 3/7] accel/tcg: Split out handle_sigsegv_accerr_write
Date: Mon, 13 Sep 2021 15:05:48 -0700
Message-Id: <20210913220552.604064-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210913220552.604064-1-richard.henderson@linaro.org>
References: <20210913220552.604064-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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
Cc: peter.maydell@linaro.org, laurent@vivier.eu, imp@bsdimp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is the major portion of handle_cpu_signal which is specific
to tcg, handling the page protections for the translations.
Most of the rest will migrate to linux-user/ shortly.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/exec-all.h | 12 ++++++
 accel/tcg/user-exec.c   | 96 +++++++++++++++++++++++++----------------
 2 files changed, 72 insertions(+), 36 deletions(-)

diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index 7207912306..f582d3e688 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -671,6 +671,18 @@ static inline tb_page_addr_t get_page_addr_code_hostp(CPUArchState *env,
  */
 uintptr_t adjust_signal_pc(uintptr_t pc);
 
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
+                                 uintptr_t host_pc, uintptr_t host_addr);
+
 /**
  * cpu_signal_handler
  * @signum: host signal number
diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index 1f7b7a3692..daef34a426 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -112,6 +112,60 @@ uintptr_t adjust_signal_pc(uintptr_t pc)
     }
 }
 
+/**
+ * handle_sigsegv_accerr_write:
+ * @cpu: the cpu context
+ * @old_set: the sigset_t from the signal ucontext_t
+ * @host_pc: the host pc, adjusted for the signal
+ * @host_addr: the host address of the fault
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
+                                 uintptr_t host_pc, uintptr_t host_addr)
+{
+    if (!h2g_valid(host_addr)) {
+        return false;
+    }
+
+    switch (page_unprotect(h2g(host_addr), host_pc)) {
+    case 0:
+        /*
+         * Fault not caused by a page marked unwritable to protect
+         * cached translations, must be the guest binary's problem.
+         */
+        return false;
+    case 1:
+        /*
+         * Fault caused by protection of cached translation; TBs
+         * invalidated, so resume execution.  Retain helper_retaddr
+         * for a possible second fault.
+         */
+        return true;
+    case 2:
+        /*
+         * Fault caused by protection of cached translation, and the
+         * currently executing TB was modified and must be exited
+         * immediately.  Clear helper_retaddr for next execution.
+         */
+        clear_helper_retaddr();
+        cpu_exit_tb_from_sighandler(cpu, old_set);
+        /* NORETURN */
+
+    default:
+        g_assert_not_reached();
+    }
+}
+
 /* 'pc' is the host PC at which the exception was raised. 'address' is
    the effective address of the memory exception. 'is_write' is 1 if a
    write caused the exception and otherwise 0'. 'old_set' is the
@@ -150,43 +204,13 @@ static inline int handle_cpu_signal(uintptr_t pc, siginfo_t *info,
     printf("qemu: SIGSEGV pc=0x%08lx address=%08lx w=%d oldset=0x%08lx\n",
            pc, address, is_write, *(unsigned long *)old_set);
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
-            clear_helper_retaddr();
-            cpu_exit_tb_from_sighandler(cpu, old_set);
-            /* NORETURN */
 
-        default:
-            g_assert_not_reached();
-        }
+    /* XXX: locking issue */
+    if (is_write &&
+        info->si_signo == SIGSEGV &&
+        info->si_code == SEGV_ACCERR &&
+        handle_sigsegv_accerr_write(cpu, old_set, pc, address)) {
+        return 1;
     }
 
     /* Convert forcefully to guest address space, invalid addresses
-- 
2.25.1


