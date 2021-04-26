Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F98036AAFD
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Apr 2021 05:11:26 +0200 (CEST)
Received: from localhost ([::1]:41750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1laref-0002CE-7w
	for lists+qemu-devel@lfdr.de; Sun, 25 Apr 2021 23:11:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1larNo-00085X-M4
 for qemu-devel@nongnu.org; Sun, 25 Apr 2021 22:54:00 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:44786)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1larNe-0007b4-1l
 for qemu-devel@nongnu.org; Sun, 25 Apr 2021 22:54:00 -0400
Received: by mail-pf1-x429.google.com with SMTP id m11so37993884pfc.11
 for <qemu-devel@nongnu.org>; Sun, 25 Apr 2021 19:53:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=GSv2Lia+YkHhF9npusGlZUh4XoenFbWxLOhoblxXxWk=;
 b=TC5yAY5nlL1QlIoPabHLmXTVToWEHf9frlzUl/gTizOEt/ACgV4xG8pFxqAMw3xUnH
 rMriPwAmGqBwNrw3RBC2/oSS/67zxCIiN/V2MFctUI73lNcTCUBcJhdDx1td8WRYrSe2
 QUC40u88e2bWZD3M6ygC5pFJGtSdqSUlvEBnezbrPirdfpK1m1q3EYqJ0TWjVPeHVXge
 WpvHUTOoRMl6n/2H482ZOhvYwanO91Rik8CF7lMe+BppT6DyY7F97J6fMgKck0EyNC33
 zezxZc1LgxBEb7HYLKwHgXth4RxJGFpj1ScN9XOQ3+j1v2L6Tx8TuLQK4+rHryxM3Bhr
 BG1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GSv2Lia+YkHhF9npusGlZUh4XoenFbWxLOhoblxXxWk=;
 b=aU4015xE+whRaGFP8/PkjkhjlxooMmUtA0hHtDVEWT84h/ZTkIdKAMrscsMLZKwKVN
 AcAtS1VuD8CKD7yjF9UK3Ifhf40T0CG0o/xVyLMaK8H19ObrexfQ64gCBZHG4P5Ld8OF
 +2wY8NMKU+7lLSvPLr8q/buO8TW70kqssDOVKb5DTg0ljwnnrYSp9+i4BI7LkpRIEJZq
 PMoONnX0J/W0NEterzUXeaSDM7FS41anvCiTa3/V+JEfkWgweT7nNcu97fgbgPJyzm4A
 xEUl2+GY2YwdzIuxutoXD8h3WhzrRORjVpEBKvfffRPvWSrixbuTcOpOXJyLFaBO82Jh
 cZFg==
X-Gm-Message-State: AOAM530XSQbZG2t4CC6UXYv8v8+XsJCAQ3P26SeESLLbyS8LXWUG2AH9
 4UL0Nnv79yH4GplZwpxutmg///Bb+8lYBQ==
X-Google-Smtp-Source: ABdhPJzmRJV7BnM1YvDB/1PPTbRDOWEENdPf5iaHcCkUhgWU07KCYcNpVr4Mf2zCJtp0vg3nRP58lg==
X-Received: by 2002:a05:6a00:1a4a:b029:261:d9ed:fd80 with SMTP id
 h10-20020a056a001a4ab0290261d9edfd80mr15542470pfv.20.1619405627960; 
 Sun, 25 Apr 2021 19:53:47 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id e23sm9805680pgg.76.2021.04.25.19.53.47
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Apr 2021 19:53:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 18/25] linux-user/sparc: Save and restore fpu in signal
 frame
Date: Sun, 25 Apr 2021 19:53:27 -0700
Message-Id: <20210426025334.1168495-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210426025334.1168495-1-richard.henderson@linaro.org>
References: <20210426025334.1168495-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
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
 linux-user/sparc/signal.c | 84 ++++++++++++++++++++++++---------------
 1 file changed, 51 insertions(+), 33 deletions(-)

diff --git a/linux-user/sparc/signal.c b/linux-user/sparc/signal.c
index 57dbc72c99..59bb449512 100644
--- a/linux-user/sparc/signal.c
+++ b/linux-user/sparc/signal.c
@@ -43,26 +43,25 @@ struct target_stackf {
     abi_ulong xargs[8];
 };
 
-typedef struct {
-    abi_ulong  si_float_regs[32];
-    unsigned   long si_fsr;
-    unsigned   long si_fpqdepth;
+struct target_siginfo_fpu {
+    /* It is more convenient for qemu to move doubles, not singles. */
+    uint64_t si_double_regs[16];
+    uint32_t si_fsr;
+    uint32_t si_fpqdepth;
     struct {
-        unsigned long *insn_addr;
-        unsigned long insn;
+        uint32_t insn_addr;
+        uint32_t insn;
     } si_fpqueue [16];
-} qemu_siginfo_fpu_t;
-
+};
 
 struct target_signal_frame {
     struct target_stackf ss;
     struct target_pt_regs regs;
-    uint32_t            si_mask;
-    abi_ulong           fpu_save;
-    uint32_t            insns[2] QEMU_ALIGNED(8);
-    abi_ulong           extramask[TARGET_NSIG_WORDS - 1];
-    abi_ulong           extra_size; /* Should be 0 */
-    qemu_siginfo_fpu_t fpu_state;
+    uint32_t si_mask;
+    abi_ulong fpu_save;
+    uint32_t insns[2] QEMU_ALIGNED(8);
+    abi_ulong extramask[TARGET_NSIG_WORDS - 1];
+    abi_ulong extra_size; /* Should be 0 */
 };
 
 static abi_ulong get_sigframe(struct target_sigaction *sa,
@@ -163,33 +162,51 @@ static void save_reg_win(struct target_reg_window *win, CPUSPARCState *env)
     }
 }
 
-#define NF_ALIGNEDSZ  (((sizeof(struct target_signal_frame) + 7) & (~7)))
+static void save_fpu(struct target_siginfo_fpu *fpu, CPUSPARCState *env)
+{
+    int i;
+
+    for (i = 0; i < 16; ++i) {
+        __put_user(env->fpr[i].ll, &fpu->si_double_regs[i]);
+    }
+    __put_user(env->fsr, &fpu->si_fsr);
+    __put_user(0, &fpu->si_fpqdepth);
+}
+
+static void restore_fpu(struct target_siginfo_fpu *fpu, CPUSPARCState *env)
+{
+    int i;
+
+    for (i = 0; i < 16; ++i) {
+        __get_user(env->fpr[i].ll, &fpu->si_double_regs[i]);
+    }
+    __get_user(env->fsr, &fpu->si_fsr);
+}
 
 void setup_frame(int sig, struct target_sigaction *ka,
                  target_sigset_t *set, CPUSPARCState *env)
 {
     abi_ulong sf_addr;
     struct target_signal_frame *sf;
-    int sigframe_size, i;
+    size_t sf_size = sizeof(*sf) + sizeof(struct target_siginfo_fpu);
+    int i;
 
     /* 1. Make sure everything is clean */
-    //synchronize_user_stack();
 
-    sigframe_size = NF_ALIGNEDSZ;
-    sf_addr = get_sigframe(ka, env, sigframe_size);
+    sf_addr = get_sigframe(ka, env, sf_size);
     trace_user_setup_frame(env, sf_addr);
 
-    sf = lock_user(VERIFY_WRITE, sf_addr,
-                   sizeof(struct target_signal_frame), 0);
+    sf = lock_user(VERIFY_WRITE, sf_addr, sf_size, 0);
     if (!sf) {
         goto sigsegv;
     }
+
     /* 2. Save the current process state */
     save_pt_regs(&sf->regs, env);
     __put_user(0, &sf->extra_size);
 
-    //save_fpu_state(regs, &sf->fpu_state);
-    //__put_user(&sf->fpu_state, &sf->fpu_save);
+    save_fpu((struct target_siginfo_fpu *)(sf + 1), env);
+    __put_user(sf_addr + sizeof(*sf), &sf->fpu_save);
 
     __put_user(set->sig[0], &sf->si_mask);
     for (i = 0; i < TARGET_NSIG_WORDS - 1; i++) {
@@ -226,7 +243,7 @@ void setup_frame(int sig, struct target_sigaction *ka,
         val32 = 0x91d02010;
         __put_user(val32, &sf->insns[1]);
     }
-    unlock_user(sf, sf_addr, sizeof(struct target_signal_frame));
+    unlock_user(sf, sf_addr, sf_size);
     return;
 #if 0
 sigill_and_return:
@@ -248,7 +265,7 @@ long do_sigreturn(CPUSPARCState *env)
 {
     abi_ulong sf_addr;
     struct target_signal_frame *sf;
-    abi_ulong pc, npc;
+    abi_ulong pc, npc, ptr;
     target_sigset_t set;
     sigset_t host_set;
     int i;
@@ -276,14 +293,15 @@ long do_sigreturn(CPUSPARCState *env)
     env->pc = pc;
     env->npc = npc;
 
-    /* FIXME: implement FPU save/restore:
-     * __get_user(fpu_save, &sf->fpu_save);
-     * if (fpu_save) {
-     *     if (restore_fpu_state(env, fpu_save)) {
-     *         goto segv_and_exit;
-     *     }
-     * }
-     */
+    __get_user(ptr, &sf->fpu_save);
+    if (ptr) {
+        struct target_siginfo_fpu *fpu;
+        if ((ptr & 3) || !lock_user_struct(VERIFY_READ, fpu, ptr, 1)) {
+            goto segv_and_exit;
+        }
+        restore_fpu(fpu, env);
+        unlock_user_struct(fpu, ptr, 0);
+    }
 
     __get_user(set.sig[0], &sf->si_mask);
     for (i = 1; i < TARGET_NSIG_WORDS; i++) {
-- 
2.25.1


