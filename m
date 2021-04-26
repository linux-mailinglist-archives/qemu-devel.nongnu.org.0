Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D694A36AAFB
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Apr 2021 05:11:12 +0200 (CEST)
Received: from localhost ([::1]:40816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lareR-0001kE-Uu
	for lists+qemu-devel@lfdr.de; Sun, 25 Apr 2021 23:11:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1larNr-0008Dc-Mi
 for qemu-devel@nongnu.org; Sun, 25 Apr 2021 22:54:03 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:52198)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1larNg-0007ch-2W
 for qemu-devel@nongnu.org; Sun, 25 Apr 2021 22:54:03 -0400
Received: by mail-pj1-x1034.google.com with SMTP id lt13so17272959pjb.1
 for <qemu-devel@nongnu.org>; Sun, 25 Apr 2021 19:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=SmrYBduu8XiD8xaK9Yr5agU3X7gzZZGLVjMDIyMBOdY=;
 b=XbhoGFb1F1DxIiJmy6IQL8RF/T/rqUap2pcpauGbmlBnL6y2tw24y+9bFQH8PZAE16
 03aIjoCAFed0zb164uG5lD2B3VMRL8NCiOgmJisg+KtLwqXUBXpKB3f1hFKt1IX3Vjsu
 ZCoOBFXoQm0p9KCSaZLicapgYCXRqu6zW5fDkxtTDx9SOD3nyc6XqFH/Kzw0KllYfL56
 zILHbyblwuIyPKc73SYlvQF4h4u1jZ1KKTAMiCWU5BA6seZ1KG8JBYyzU6TykJzcgflE
 /ZVOmNBpbUDT4kfps46cb1Fgh47zc/VByu3LgHAt80N+wCj35vuQFKTPmOkSYkFlOH01
 +OYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SmrYBduu8XiD8xaK9Yr5agU3X7gzZZGLVjMDIyMBOdY=;
 b=VouEGIA1BBgzcu/+x+WIbWfP9dkVQETB9mGJWoiyw1nuCpZEPhjo1nli1+mEUWOGDc
 vB5lzXvasjvcy+bsWVoS7cBpHnjKQG5t4eDSvJePLkmITwY17Xo2okrhB7uegPJj4I4a
 q7d1R4LekQzCtfkwUMlRlJW9F8MAjGKBtPKUfPmvIX4RjEh1G0mCFmDkr2tzdBLZg8z2
 AosHsnwkmh02go3TAC0TtY1Ye6VyvzREexw+3u37WWwvRG3ABX+C+0Ngu2gib60DxOjb
 LD8KvIAwBra/twoiplNj0w3DJOTHU7KHf0cgFpaR8sBeoX6KLPEoqi2aXrLxg9AbPlnp
 nkdw==
X-Gm-Message-State: AOAM532P1yvJE9Wec8pVPYZTrSX8ozOP3qm6MvAKV3OqtrL8qekAW0mG
 15K6R6iRlu7IlNAWFr16gtpaj5Ba0DJsow==
X-Google-Smtp-Source: ABdhPJy0fhgdbvdLPRSKt0DdPK5Ip1YYoaOxuV8NAxKCh1UQA+XVsGvyYNmwrM5DNdhW+oM48J7Yig==
X-Received: by 2002:a17:90a:c58a:: with SMTP id
 l10mr19305120pjt.134.1619405630843; 
 Sun, 25 Apr 2021 19:53:50 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id e23sm9805680pgg.76.2021.04.25.19.53.50
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Apr 2021 19:53:50 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 23/25] linux-user/sparc: Implement sparc32 rt signals
Date: Sun, 25 Apr 2021 19:53:32 -0700
Message-Id: <20210426025334.1168495-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210426025334.1168495-1-richard.henderson@linaro.org>
References: <20210426025334.1168495-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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
 linux-user/sparc/signal.c | 126 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 122 insertions(+), 4 deletions(-)

diff --git a/linux-user/sparc/signal.c b/linux-user/sparc/signal.c
index 41a8b33bac..362993da02 100644
--- a/linux-user/sparc/signal.c
+++ b/linux-user/sparc/signal.c
@@ -72,6 +72,18 @@ struct target_signal_frame {
     abi_ulong rwin_save;
 };
 
+struct target_rt_signal_frame {
+    struct target_stackf ss;
+    target_siginfo_t info;
+    struct target_pt_regs regs;
+    target_sigset_t mask;
+    abi_ulong fpu_save;
+    uint32_t insns[2];
+    target_stack_t stack;
+    abi_ulong extra_size; /* Should be 0 */
+    abi_ulong rwin_save;
+};
+
 static abi_ulong get_sigframe(struct target_sigaction *sa,
                               CPUSPARCState *env,
                               size_t framesize)
@@ -284,7 +296,59 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
                     target_siginfo_t *info,
                     target_sigset_t *set, CPUSPARCState *env)
 {
-    qemu_log_mask(LOG_UNIMP, "setup_rt_frame: not implemented\n");
+    abi_ulong sf_addr;
+    struct target_rt_signal_frame *sf;
+    size_t sf_size = sizeof(*sf) + sizeof(struct target_siginfo_fpu);
+
+    sf_addr = get_sigframe(ka, env, sf_size);
+    trace_user_setup_rt_frame(env, sf_addr);
+
+    sf = lock_user(VERIFY_WRITE, sf_addr, sf_size, 0);
+    if (!sf) {
+        force_sigsegv(sig);
+        return;
+    }
+
+    /* 2. Save the current process state */
+    save_reg_win(&sf->ss.win, env);
+    save_pt_regs(&sf->regs, env);
+
+    save_fpu((struct target_siginfo_fpu *)(sf + 1), env);
+    __put_user(sf_addr + sizeof(*sf), &sf->fpu_save);
+
+    __put_user(0, &sf->rwin_save);  /* TODO: save_rwin_state */
+
+    tswap_siginfo(&sf->info, info);
+    tswap_sigset(&sf->mask, set);
+    target_save_altstack(&sf->stack, env);
+
+    __put_user(0, &sf->extra_size);
+
+    /* 3. signal handler back-trampoline and parameters */
+    env->regwptr[WREG_SP] = sf_addr;
+    env->regwptr[WREG_O0] = sig;
+    env->regwptr[WREG_O1] =
+        sf_addr + offsetof(struct target_rt_signal_frame, info);
+    env->regwptr[WREG_O2] =
+        sf_addr + offsetof(struct target_rt_signal_frame, regs);
+
+    /* 4. signal handler */
+    env->pc = ka->_sa_handler;
+    env->npc = env->pc + 4;
+
+    /* 5. return to kernel instructions */
+    if (ka->ka_restorer) {
+        env->regwptr[WREG_O7] = ka->ka_restorer;
+    } else {
+        env->regwptr[WREG_O7] =
+            sf_addr + offsetof(struct target_rt_signal_frame, insns) - 2 * 4;
+
+        /* mov __NR_rt_sigreturn, %g1 */
+        __put_user(0x82102065u, &sf->insns[0]);
+        /* t 0x10 */
+        __put_user(0x91d02010u, &sf->insns[1]);
+    }
+    unlock_user(sf, sf_addr, sf_size);
 }
 
 long do_sigreturn(CPUSPARCState *env)
@@ -356,9 +420,63 @@ long do_sigreturn(CPUSPARCState *env)
 
 long do_rt_sigreturn(CPUSPARCState *env)
 {
-    trace_user_do_rt_sigreturn(env, 0);
-    qemu_log_mask(LOG_UNIMP, "do_rt_sigreturn: not implemented\n");
-    return -TARGET_ENOSYS;
+    abi_ulong sf_addr, tpc, tnpc, ptr;
+    struct target_rt_signal_frame *sf = NULL;
+    sigset_t set;
+
+    sf_addr = get_sp_from_cpustate(env);
+    trace_user_do_rt_sigreturn(env, sf_addr);
+
+    /* 1. Make sure we are not getting garbage from the user */
+    if ((sf_addr & 15) || !lock_user_struct(VERIFY_READ, sf, sf_addr, 1)) {
+        goto segv_and_exit;
+    }
+
+    /* Validate SP alignment.  */
+    __get_user(ptr, &sf->regs.u_regs[8 + WREG_SP]);
+    if ((ptr + TARGET_STACK_BIAS) & 7) {
+        goto segv_and_exit;
+    }
+
+    /* Validate PC and NPC alignment.  */
+    __get_user(tpc, &sf->regs.pc);
+    __get_user(tnpc, &sf->regs.npc);
+    if ((tpc | tnpc) & 3) {
+        goto segv_and_exit;
+    }
+
+    /* 2. Restore the state */
+    restore_pt_regs(&sf->regs, env);
+
+    __get_user(ptr, &sf->fpu_save);
+    if (ptr) {
+        struct target_siginfo_fpu *fpu;
+        if ((ptr & 7) || !lock_user_struct(VERIFY_READ, fpu, ptr, 1)) {
+            goto segv_and_exit;
+        }
+        restore_fpu(fpu, env);
+        unlock_user_struct(fpu, ptr, 0);
+    }
+
+    __get_user(ptr, &sf->rwin_save);
+    if (ptr) {
+        goto segv_and_exit;  /* TODO: restore_rwin_state */
+    }
+
+    target_restore_altstack(&sf->stack, env);
+    target_to_host_sigset(&set, &sf->mask);
+    set_sigmask(&set);
+
+    env->pc = tpc;
+    env->npc = tnpc;
+
+    unlock_user_struct(sf, sf_addr, 0);
+    return -TARGET_QEMU_ESIGRETURN;
+
+ segv_and_exit:
+    unlock_user_struct(sf, sf_addr, 0);
+    force_sig(TARGET_SIGSEGV);
+    return -TARGET_QEMU_ESIGRETURN;
 }
 
 #if defined(TARGET_SPARC64) && !defined(TARGET_ABI32)
-- 
2.25.1


