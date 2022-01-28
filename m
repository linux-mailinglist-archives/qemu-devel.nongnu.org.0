Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 214024A04B8
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Jan 2022 01:01:23 +0100 (CET)
Received: from localhost ([::1]:59856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDbBC-0007Ab-5X
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 19:01:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nDafm-0000fn-CQ
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 18:28:54 -0500
Received: from [2607:f8b0:4864:20::d2f] (port=35494
 helo=mail-io1-xd2f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nDafg-0001b0-Ob
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 18:28:53 -0500
Received: by mail-io1-xd2f.google.com with SMTP id 9so9733318iou.2
 for <qemu-devel@nongnu.org>; Fri, 28 Jan 2022 15:28:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hAe6rnov1L/1Q8gAAU9EYHXCUv7q8m8Zw5gDaFIXI5o=;
 b=i590g+HIdO2YPXG1Jc+7+1DbgGl3NDXJCJ81jg8KH3F4Nw7G+h/VftksJZ/HYGilTD
 l8OLaJlvTzQjWroCJfSYJs31TK7xP7U0tyjj8wnu1mHSaAQaH1XduipPGKPBgXNGhW/A
 7dWGWCWqXUBbChKOv9yGi5GL7rg31zRp6qAsResRyUWu7WGvNZYgaYrHWJ3nmSBqaW7M
 42YnA85KkfcHavUEJGYZSaPMaarCAtstbaREnWeHaORtbfhbkC337x2cab4TEDmEcXrn
 ZDLEO8WsHtRSyj6frSBrbS7KWWSzPm5+Au1GwaJ75Vg5RMTvo6yGPDscQQ4WptrKeccx
 HkVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hAe6rnov1L/1Q8gAAU9EYHXCUv7q8m8Zw5gDaFIXI5o=;
 b=qP1VoL1Rmr4QKwOTDCnNWnRrCR9MWnXJeVxqj+FLeWWGWzo3DLWApLjyh2m3uAFSMZ
 88HYLQab8Mle5Rk0ivmAVkBJFIZ4t3kQzEew6BS5LTEWArXv1DihX0tkZfFbu8ubpzzo
 Rob1iGP8h6031iZg9yJlI4I+NMkZvtLGQnsDemTGXV7sSsvNW7EIsuKL3dtJU8K7zsqS
 xP1R20kHa1wYR0sDj9+C0/10iDQSbY3bt7P9lasg6O/jYaryDLxrNuNpDY2RVy6UzIFE
 x4ufoOinVxHxVbbXbTsFv4STvsZ5lOA41rPW/F1eTMFOQi6DK0Tsjf/JcDn+ZwkLtq8D
 fNoQ==
X-Gm-Message-State: AOAM531iEMQavWYbtAVCl/3CJYq0pmw7tVLhLkc0l71ODl9iPLpl3qWz
 qNF0XHXW58y8P7XPF6UGtiLhwpjMV4/Kjw==
X-Google-Smtp-Source: ABdhPJyJqborm+GJ2Fcp9KcUWVpvvLxEhN0ooSP7tkftZaELuHIcznbVeNwTB+JzYaVzBBxsOi1vTA==
X-Received: by 2002:a05:6638:12d6:: with SMTP id
 v22mr3423242jas.202.1643412510967; 
 Fri, 28 Jan 2022 15:28:30 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id o11sm14323111ilm.20.2022.01.28.15.28.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jan 2022 15:28:30 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 26/40] bsd-user/signal.c: Implement host_signal_handler
Date: Fri, 28 Jan 2022 16:27:51 -0700
Message-Id: <20220128232805.86191-27-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220128232805.86191-1-imp@bsdimp.com>
References: <20220128232805.86191-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d2f
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d2f;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2f.google.com
X-Spam_score_int: 8
X-Spam_score: 0.8
X-Spam_bar: /
X-Spam_report: (0.8 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Stacey Son <sson@FreeBSD.org>,
 Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>, def@FreeBSD.org,
 jrtc27@FreeBSD.org, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Implement host_signal_handler to handle signals generated by the host
and to do safe system calls.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Kyle Evans <kevans@freebsd.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/signal.c | 105 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 105 insertions(+)

diff --git a/bsd-user/signal.c b/bsd-user/signal.c
index 454aef2993e..24cf4b1120b 100644
--- a/bsd-user/signal.c
+++ b/bsd-user/signal.c
@@ -223,6 +223,111 @@ void force_sig_fault(int sig, int code, abi_ulong addr)
 
 static void host_signal_handler(int host_sig, siginfo_t *info, void *puc)
 {
+    CPUArchState *env = thread_cpu->env_ptr;
+    CPUState *cpu = env_cpu(env);
+    TaskState *ts = cpu->opaque;
+    target_siginfo_t tinfo;
+    ucontext_t *uc = puc;
+    struct emulated_sigtable *k;
+    int guest_sig;
+    uintptr_t pc = 0;
+    bool sync_sig = false;
+
+    /*
+     * Non-spoofed SIGSEGV and SIGBUS are synchronous, and need special
+     * handling wrt signal blocking and unwinding.
+     */
+    if ((host_sig == SIGSEGV || host_sig == SIGBUS) && info->si_code > 0) {
+        MMUAccessType access_type;
+        uintptr_t host_addr;
+        abi_ptr guest_addr;
+        bool is_write;
+
+        host_addr = (uintptr_t)info->si_addr;
+
+        /*
+         * Convert forcefully to guest address space: addresses outside
+         * reserved_va are still valid to report via SEGV_MAPERR.
+         */
+        guest_addr = h2g_nocheck(host_addr);
+
+        pc = host_signal_pc(uc);
+        is_write = host_signal_write(info, uc);
+        access_type = adjust_signal_pc(&pc, is_write);
+
+        if (host_sig == SIGSEGV) {
+            bool maperr = true;
+
+            if (info->si_code == SEGV_ACCERR && h2g_valid(host_addr)) {
+                /* If this was a write to a TB protected page, restart. */
+                if (is_write &&
+                    handle_sigsegv_accerr_write(cpu, &uc->uc_sigmask,
+                                                pc, guest_addr)) {
+                    return;
+                }
+
+                /*
+                 * With reserved_va, the whole address space is PROT_NONE,
+                 * which means that we may get ACCERR when we want MAPERR.
+                 */
+                if (page_get_flags(guest_addr) & PAGE_VALID) {
+                    maperr = false;
+                } else {
+                    info->si_code = SEGV_MAPERR;
+                }
+            }
+
+            sigprocmask(SIG_SETMASK, &uc->uc_sigmask, NULL);
+            cpu_loop_exit_sigsegv(cpu, guest_addr, access_type, maperr, pc);
+        } else {
+            sigprocmask(SIG_SETMASK, &uc->uc_sigmask, NULL);
+            if (info->si_code == BUS_ADRALN) {
+                cpu_loop_exit_sigbus(cpu, guest_addr, access_type, pc);
+            }
+        }
+
+        sync_sig = true;
+    }
+
+    /* Get the target signal number. */
+    guest_sig = host_to_target_signal(host_sig);
+    if (guest_sig < 1 || guest_sig > TARGET_NSIG) {
+        return;
+    }
+    trace_user_host_signal(cpu, host_sig, guest_sig);
+
+    host_to_target_siginfo_noswap(&tinfo, info);
+
+    k = &ts->sigtab[guest_sig - 1];
+    k->info = tinfo;
+    k->pending = guest_sig;
+    ts->signal_pending = 1;
+
+    /*
+     * For synchronous signals, unwind the cpu state to the faulting
+     * insn and then exit back to the main loop so that the signal
+     * is delivered immediately.
+     */
+    if (sync_sig) {
+        cpu->exception_index = EXCP_INTERRUPT;
+        cpu_loop_exit_restore(cpu, pc);
+    }
+
+    rewind_if_in_safe_syscall(puc);
+
+    /*
+     * Block host signals until target signal handler entered. We
+     * can't block SIGSEGV or SIGBUS while we're executing guest
+     * code in case the guest code provokes one in the window between
+     * now and it getting out to the main loop. Signals will be
+     * unblocked again in process_pending_signals().
+     */
+    sigfillset(&uc->uc_sigmask);
+    sigdelset(&uc->uc_sigmask, SIGSEGV);
+    sigdelset(&uc->uc_sigmask, SIGBUS);
+
+    /* Interrupt the virtual CPU as soon as possible. */
+    cpu_exit(thread_cpu);
 }
 
 void signal_init(void)
-- 
2.33.1


