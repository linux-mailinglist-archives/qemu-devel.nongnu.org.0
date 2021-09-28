Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6A5741A552
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 04:25:59 +0200 (CEST)
Received: from localhost ([::1]:38512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mV2og-00058i-Tx
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 22:25:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mV2Qa-0004mB-QB
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 22:01:04 -0400
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732]:36368)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mV2QX-0005rK-8g
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 22:01:04 -0400
Received: by mail-qk1-x732.google.com with SMTP id p4so39282011qki.3
 for <qemu-devel@nongnu.org>; Mon, 27 Sep 2021 19:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MmSCGYIFzfMZzarwBYHnm0N3s8Oxz8OvMDOHLBQ9iBw=;
 b=GPOgNSWjjNNRF0VqZN898vKjB2eCzkY5cfWSrvJ8IpE66kZnjB3//CR/p+Q51Da8gk
 qEqcYkzrW7078W9jg1yrjqiWZpptfp7ZqOMuKwtkdIlFjVOqy1wNVZcTsJqLCTg9SnUt
 4bOhKD27p0n6MwUt/1aAc05uE8vUjW2s4i3Q0TXrsjswkM7PtOzmJ/zfsPGilH63GJ82
 MwhMFNcPREgeodH6CmNyUTnNxLCxzMZjldWd4QYxCcod+qzTvQJIXWENiY4OPIeK0xtG
 UUTmRy0p8TQpr/4JXFnt11dNanFCTYsVGfURvYJV34LEe4GvcW3sR3Fo7qj/4uKBSjEc
 8qlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MmSCGYIFzfMZzarwBYHnm0N3s8Oxz8OvMDOHLBQ9iBw=;
 b=y/hKwZlOY5mGzc5vK8N7AQ9+EvY4aWZgJ+iDS5ZFU7OAhU6VwABi3uQ+T4dGxWJW9X
 7qR+EtV/F+yXYXs7ozRyaa2YoR2Ej+HJONtQ7X03H5qTSTOCtXskPSOHwC6gl5Ldwd9P
 y6gDzL+o3VaWA9787PflGPdzOadms4jy+atYTPTNESsPib3tYjj4hwobXOGVr/+CXXfq
 KRaCEFxmWMl/Q4yYO1DPwhVIcxaqkKb9vvF/ng2TrqMzs/bOQ0TA7LMxRLOFe9XJpY9n
 1ZsQ9W7yk5lbtVp4k4OPMnnhgQ/w8CJwz3P/EBMW0sSQEbbJzpkG0BtvtxOhX7nU3diY
 IyQQ==
X-Gm-Message-State: AOAM53302mO20sAOaBg6cOmJXWzr0IkFel3uyZgk7yHneggyreXDgaZi
 UOCN2RZfG3cDN3JCSJP6E7mJ67qC4twS2A==
X-Google-Smtp-Source: ABdhPJyfEYvZ/Eu+HID/2wdtiGe0OznAGBkc7i0MYTh3tIUDozlYn3AfopBbHGTsRPxRxUFwrTFs3w==
X-Received: by 2002:a37:41c1:: with SMTP id o184mr3127881qka.95.1632794458027; 
 Mon, 27 Sep 2021 19:00:58 -0700 (PDT)
Received: from localhost.localdomain (cpe-24-31-215-130.sc.res.rr.com.
 [24.31.215.130])
 by smtp.gmail.com with ESMTPSA id g12sm12530370qtm.59.2021.09.27.19.00.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Sep 2021 19:00:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 19/25] linux-user/ppc: Implement setup_sigtramp
Date: Mon, 27 Sep 2021 22:00:33 -0400
Message-Id: <20210928020039.184412-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210928020039.184412-1-richard.henderson@linaro.org>
References: <20210928020039.184412-1-richard.henderson@linaro.org>
MIME-Version: 1.0
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
Cc: peter.maydell@linaro.org, qemu-ppc@nongnu.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Create and record the two signal trampolines.

Cc: qemu-ppc@nongnu.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/ppc/target_signal.h |  2 ++
 linux-user/ppc/signal.c        | 34 ++++++++++++++++++----------------
 2 files changed, 20 insertions(+), 16 deletions(-)

diff --git a/linux-user/ppc/target_signal.h b/linux-user/ppc/target_signal.h
index 72fcdd9bfa..82184ab8f2 100644
--- a/linux-user/ppc/target_signal.h
+++ b/linux-user/ppc/target_signal.h
@@ -24,4 +24,6 @@ typedef struct target_sigaltstack {
 #if !defined(TARGET_PPC64)
 #define TARGET_ARCH_HAS_SETUP_FRAME
 #endif
+#define TARGET_ARCH_HAS_SIGTRAMP_PAGE 1
+
 #endif /* PPC_TARGET_SIGNAL_H */
diff --git a/linux-user/ppc/signal.c b/linux-user/ppc/signal.c
index 77f37b9f01..c37744c8fc 100644
--- a/linux-user/ppc/signal.c
+++ b/linux-user/ppc/signal.c
@@ -203,9 +203,6 @@ struct target_func_ptr {
 
 #endif
 
-/* We use the mc_pad field for the signal return trampoline.  */
-#define tramp mc_pad
-
 /* See arch/powerpc/kernel/signal.c.  */
 static target_ulong get_sigframe(struct target_sigaction *ka,
                                  CPUPPCState *env,
@@ -436,12 +433,7 @@ void setup_frame(int sig, struct target_sigaction *ka,
     /* Save user regs.  */
     save_user_regs(env, &frame->mctx);
 
-    /* Construct the trampoline code on the stack. */
-    encode_trampoline(TARGET_NR_sigreturn, (uint32_t *)&frame->mctx.tramp);
-
-    /* The kernel checks for the presence of a VDSO here.  We don't
-       emulate a vdso, so use a sigreturn system call.  */
-    env->lr = (target_ulong) h2g(frame->mctx.tramp);
+    env->lr = default_sigreturn;
 
     /* Turn off all fp exceptions.  */
     env->fpscr = 0;
@@ -477,7 +469,6 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
                     target_sigset_t *set, CPUPPCState *env)
 {
     struct target_rt_sigframe *rt_sf;
-    uint32_t *trampptr = 0;
     struct target_mcontext *mctx = 0;
     target_ulong rt_sf_addr, newsp = 0;
     int i, err = 0;
@@ -507,22 +498,17 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
 
 #if defined(TARGET_PPC64)
     mctx = &rt_sf->uc.tuc_sigcontext.mcontext;
-    trampptr = &rt_sf->trampoline[0];
 
     sc = &rt_sf->uc.tuc_sigcontext;
     __put_user(h2g(mctx), &sc->regs);
     __put_user(sig, &sc->signal);
 #else
     mctx = &rt_sf->uc.tuc_mcontext;
-    trampptr = (uint32_t *)&rt_sf->uc.tuc_mcontext.tramp;
 #endif
 
     save_user_regs(env, mctx);
-    encode_trampoline(TARGET_NR_rt_sigreturn, trampptr);
 
-    /* The kernel checks for the presence of a VDSO here.  We don't
-       emulate a vdso, so use a sigreturn system call.  */
-    env->lr = (target_ulong) h2g(trampptr);
+    env->lr = default_rt_sigreturn;
 
     /* Turn off all fp exceptions.  */
     env->fpscr = 0;
@@ -720,3 +706,19 @@ abi_long do_swapcontext(CPUArchState *env, abi_ulong uold_ctx,
 
     return 0;
 }
+
+void setup_sigtramp(abi_ulong sigtramp_page)
+{
+    uint32_t *tramp = lock_user(VERIFY_WRITE, sigtramp_page, 2 * 8, 0);
+    assert(tramp != NULL);
+
+#ifdef TARGET_ARCH_HAS_SETUP_FRAME
+    default_sigreturn = sigtramp_page;
+    encode_trampoline(TARGET_NR_sigreturn, tramp + 0);
+#endif
+
+    default_rt_sigreturn = sigtramp_page + 8;
+    encode_trampoline(TARGET_NR_rt_sigreturn, tramp + 2);
+
+    unlock_user(tramp, sigtramp_page, 2 * 8);
+}
-- 
2.25.1


