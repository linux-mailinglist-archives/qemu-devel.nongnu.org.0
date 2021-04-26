Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D218C36AAFC
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Apr 2021 05:11:20 +0200 (CEST)
Received: from localhost ([::1]:41528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lareZ-00025Y-Tc
	for lists+qemu-devel@lfdr.de; Sun, 25 Apr 2021 23:11:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1larNq-0008AV-IH
 for qemu-devel@nongnu.org; Sun, 25 Apr 2021 22:54:02 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:41763)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1larNj-0007cn-6f
 for qemu-devel@nongnu.org; Sun, 25 Apr 2021 22:54:02 -0400
Received: by mail-pf1-x42a.google.com with SMTP id w6so23453055pfc.8
 for <qemu-devel@nongnu.org>; Sun, 25 Apr 2021 19:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=4dEXnmO9hOXDvdXXk+ajJvzuRRReNQGYxLFLm0Cm/fM=;
 b=Um/068tipITshPHgK2tZAuhMnI1NFoAyU5M5dq5GdVoG1X4Nt9iGd1CBtajD3Qjyb2
 1tS8wYWBjgWfqvxP0fVaPHUigkkfDMieRRPymYNGycHrosrXziBN2j/beYp6IEtn9CjD
 Nnpb51OP+HKejgSoHd77+4ZH+zIAUSG4OYOMmY/UXEma7iPIHvheoD5tN+qaDfDXkeEE
 1aKEQkyWxBs8aLhj79yvMGQz7gegCc6NS6kHexqrdPGRGeCymIUt5TVgmyTirpC5PkxQ
 gcbJehKoISgy0dVssmhQ5gg5lx04+2RSvp6y1R/kn3wSR1qQL/DCFYeVi0lbtiyqLkED
 d3sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4dEXnmO9hOXDvdXXk+ajJvzuRRReNQGYxLFLm0Cm/fM=;
 b=OexHmtYWxLZmPXr+rtE6hQmz5NmY+5pphFSNi11r3McjR2FFcGXJb/n44aR8QWmcNM
 qL+AvtrrqteFPJNCbmxZubiEpRrZ83jSiZA+3q7ja3t9nK4T9sLvpywCvz0x/TwMRkIG
 jOSMk7N2Q9y7vPadumOjZSDq0a+3S82MPGy660OrMrh+khpAS9I1YkK7obcGKXClO1g6
 17OhTzUkNf1AZPB8pUyjnECxqqYhL1QDVfQXzGiLL+PC7uw6Gdm0ydI/m3FFVQ0Uuptq
 YFNUCxa09Xs2AzMBVOXm/vCCaHOYVwqkrGAuRxVize/J4UQwoOMUKGI989BilqrS5SGR
 FuHg==
X-Gm-Message-State: AOAM532KYFNjDyyVdVFYtXu9pH3TVxreod2n4mdUHUFf+hmoqfwgNxLX
 O5OFyTrB04I9tyshAEQhJvrM1pk+6yBdGQ==
X-Google-Smtp-Source: ABdhPJy4EEMu1JLK0lEP7bMaDGsmgRa0gzJWC7jzdaiuFrFOMkJqqpFlxdi6lCtUATpX7K44K1H+Yg==
X-Received: by 2002:aa7:8001:0:b029:272:7347:9b58 with SMTP id
 j1-20020aa780010000b029027273479b58mr8593380pfi.1.1619405631548; 
 Sun, 25 Apr 2021 19:53:51 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id e23sm9805680pgg.76.2021.04.25.19.53.51
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Apr 2021 19:53:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 24/25] linux-user/sparc: Implement sparc64 rt signals
Date: Sun, 25 Apr 2021 19:53:33 -0700
Message-Id: <20210426025334.1168495-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210426025334.1168495-1-richard.henderson@linaro.org>
References: <20210426025334.1168495-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/sparc/target_signal.h |  2 ++
 linux-user/sparc/signal.c        | 27 ++++++++++++++++++++++++++-
 2 files changed, 28 insertions(+), 1 deletion(-)

diff --git a/linux-user/sparc/target_signal.h b/linux-user/sparc/target_signal.h
index 911a3f5af5..34f9a12519 100644
--- a/linux-user/sparc/target_signal.h
+++ b/linux-user/sparc/target_signal.h
@@ -67,7 +67,9 @@ typedef struct target_sigaltstack {
 #define TARGET_MINSIGSTKSZ	4096
 #define TARGET_SIGSTKSZ		16384
 
+#ifdef TARGET_ABI32
 #define TARGET_ARCH_HAS_SETUP_FRAME
+#endif
 
 /* bit-flags */
 #define TARGET_SS_AUTODISARM (1U << 31) /* disable sas during sighandling */
diff --git a/linux-user/sparc/signal.c b/linux-user/sparc/signal.c
index 362993da02..0cc3db5570 100644
--- a/linux-user/sparc/signal.c
+++ b/linux-user/sparc/signal.c
@@ -61,6 +61,7 @@ struct target_siginfo_fpu {
 #endif
 };
 
+#ifdef TARGET_ARCH_HAS_SETUP_FRAME
 struct target_signal_frame {
     struct target_stackf ss;
     struct target_pt_regs regs;
@@ -71,16 +72,23 @@ struct target_signal_frame {
     abi_ulong extra_size; /* Should be 0 */
     abi_ulong rwin_save;
 };
+#endif
 
 struct target_rt_signal_frame {
     struct target_stackf ss;
     target_siginfo_t info;
     struct target_pt_regs regs;
+#if defined(TARGET_SPARC64) && !defined(TARGET_ABI32)
+    abi_ulong fpu_save;
+    target_stack_t stack;
+    target_sigset_t mask;
+#else
     target_sigset_t mask;
     abi_ulong fpu_save;
     uint32_t insns[2];
     target_stack_t stack;
     abi_ulong extra_size; /* Should be 0 */
+#endif
     abi_ulong rwin_save;
 };
 
@@ -232,6 +240,7 @@ static void restore_fpu(struct target_siginfo_fpu *fpu, CPUSPARCState *env)
 #endif
 }
 
+#ifdef TARGET_ARCH_HAS_SETUP_FRAME
 void setup_frame(int sig, struct target_sigaction *ka,
                  target_sigset_t *set, CPUSPARCState *env)
 {
@@ -291,6 +300,7 @@ void setup_frame(int sig, struct target_sigaction *ka,
     }
     unlock_user(sf, sf_addr, sf_size);
 }
+#endif /* TARGET_ARCH_HAS_SETUP_FRAME */
 
 void setup_rt_frame(int sig, struct target_sigaction *ka,
                     target_siginfo_t *info,
@@ -322,21 +332,28 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
     tswap_sigset(&sf->mask, set);
     target_save_altstack(&sf->stack, env);
 
+#ifdef TARGET_ABI32
     __put_user(0, &sf->extra_size);
+#endif
 
     /* 3. signal handler back-trampoline and parameters */
-    env->regwptr[WREG_SP] = sf_addr;
+    env->regwptr[WREG_SP] = sf_addr - TARGET_STACK_BIAS;
     env->regwptr[WREG_O0] = sig;
     env->regwptr[WREG_O1] =
         sf_addr + offsetof(struct target_rt_signal_frame, info);
+#ifdef TARGET_ABI32
     env->regwptr[WREG_O2] =
         sf_addr + offsetof(struct target_rt_signal_frame, regs);
+#else
+    env->regwptr[WREG_O2] = env->regwptr[WREG_O1];
+#endif
 
     /* 4. signal handler */
     env->pc = ka->_sa_handler;
     env->npc = env->pc + 4;
 
     /* 5. return to kernel instructions */
+#ifdef TARGET_ABI32
     if (ka->ka_restorer) {
         env->regwptr[WREG_O7] = ka->ka_restorer;
     } else {
@@ -348,11 +365,16 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
         /* t 0x10 */
         __put_user(0x91d02010u, &sf->insns[1]);
     }
+#else
+    env->regwptr[WREG_O7] = ka->ka_restorer;
+#endif
+
     unlock_user(sf, sf_addr, sf_size);
 }
 
 long do_sigreturn(CPUSPARCState *env)
 {
+#ifdef TARGET_ARCH_HAS_SETUP_FRAME
     abi_ulong sf_addr;
     struct target_signal_frame *sf = NULL;
     abi_ulong pc, npc, ptr;
@@ -416,6 +438,9 @@ long do_sigreturn(CPUSPARCState *env)
     unlock_user_struct(sf, sf_addr, 0);
     force_sig(TARGET_SIGSEGV);
     return -TARGET_QEMU_ESIGRETURN;
+#else
+    return -TARGET_ENOSYS;
+#endif
 }
 
 long do_rt_sigreturn(CPUSPARCState *env)
-- 
2.25.1


