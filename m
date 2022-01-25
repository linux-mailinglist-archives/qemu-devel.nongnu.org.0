Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E76A349A237
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 02:58:22 +0100 (CET)
Received: from localhost ([::1]:41272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCB6E-000625-1P
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 20:58:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nCAfH-0002Hy-EC
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 20:30:34 -0500
Received: from [2607:f8b0:4864:20::135] (port=44598
 helo=mail-il1-x135.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nCAfB-0001eY-5Q
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 20:30:28 -0500
Received: by mail-il1-x135.google.com with SMTP id i14so15512728ila.11
 for <qemu-devel@nongnu.org>; Mon, 24 Jan 2022 17:30:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CtYVvWfH9x9cRnCoXF+LtmvVjtc64lkASxqj16OdIm0=;
 b=g2Pkys/OJh0vOkRRy89SUh3Xi5gEtIHn4I3LviN6wVizrjaDvI4r/+GzYTZ8RWbCcO
 jBHPkyhLuga6L9FjoyAf7xMfKBhyyM16dWsO1vC31YHSLgqEK112Dw1vNxoz7JNEhq3K
 3Hla0xYu/aXYcKcrfDkIwCnYsobb7kZLohP+E3O6/nJs6DnGMaNH6x1rI/mno7p98giZ
 ugXl9c7Ic/pFj3ZquXm1VYhjaIa0arVpJTWVzrN/w8e8CA6Gq5E1EwS8XvX/axvf3zUz
 AHIGSLZv+wQmqDitTO7f7ChqzxFESUt4th1qRFh35ovNv84J8Qn4NMb7bYT146Ztizn0
 Mrbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CtYVvWfH9x9cRnCoXF+LtmvVjtc64lkASxqj16OdIm0=;
 b=fnmRyObso/oAq2zgXYB7cxwhyxK7BXc0RiauX/KcKEcSs9Q4T9iFiKs0sA3N17Kxp9
 SylVx3Ai1kqKsN4+B/eNRx7jPse0Xt4NcbtUM6G+++bSHbVE/hZDcGW210tX9CDbsH0I
 BiECE4Fi8/9p3v+z/PxtJrvB7oOTdeBp5InBwLzK0nljQ8YZm/OYOMT5Vy0C0dEh1CWG
 bbZDWrLK0TF2r3P6ErJzDCT+JrCfk39eh1eS44V74N6pRr4SEdu+q1eqTZ9nH6M6ZIXy
 kgNdn75SIkHu0QQ3MlhXt+Yc2RtjSyxSH0fbTXg2jmoUtPwYbcIxxrImPDjzvCN7wdsj
 USRw==
X-Gm-Message-State: AOAM531Vb7UUIrbe0IjzE8c6Kfja7xaKD58jq2WTa51ni+EdkFdrv+Hd
 MoQw6Xu5X1xGiYqCbm9ROXbcsxiyo8MiOg==
X-Google-Smtp-Source: ABdhPJyNxQWIKlDJEsFMdjYHa19GPSVpTCaLhaJ3uaU8NAW6NG8sXdBa892C23UPe4ggM6JFyTtKiA==
X-Received: by 2002:a05:6e02:1aa7:: with SMTP id
 l7mr10687773ilv.193.1643074218901; 
 Mon, 24 Jan 2022 17:30:18 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id q14sm2061687ilo.63.2022.01.24.17.30.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 17:30:18 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 26/40] bsd-user/signal.c: Implement host_signal_handler
Date: Mon, 24 Jan 2022 18:29:33 -0700
Message-Id: <20220125012947.14974-27-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220125012947.14974-1-imp@bsdimp.com>
References: <20220125012947.14974-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::135
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::135;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x135.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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


