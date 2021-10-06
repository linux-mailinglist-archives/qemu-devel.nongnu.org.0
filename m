Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8459D424554
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 19:55:04 +0200 (CEST)
Received: from localhost ([::1]:55322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYB8B-0005sL-8W
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 13:55:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYAds-0007rm-2x
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 13:23:44 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:39904)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYAdp-0008M5-Jx
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 13:23:43 -0400
Received: by mail-pf1-x42c.google.com with SMTP id g2so2970489pfc.6
 for <qemu-devel@nongnu.org>; Wed, 06 Oct 2021 10:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+wPooOVVd+7W1fIqkSEIV0ksz3zAPabhZeYGfx9EMt4=;
 b=DmRdBiKPZAT2Ye2q+AIGTbqTHQiLD1vdlm7zyEKnNMwMEd1cUTbLJirgNJIUgbw8EW
 TlNMnPBlqdoPG5I3NLfxzEGQz/PmiievL1VRJQX/A8VM9VGZzG4Th1D842DgqlQpzQwM
 fLt+/89ua9G/9oYgH4zyg4FzasexXjkofnGrjJNa4day+atBrh3B+Zc/kkd6HFp07DnX
 0K1VILnaXLCjB3XxEqOOrgOfDbXNG0ph9xDL1Re8zqEM/35LWKW/yPxJMb+yb67v/E/g
 OnzPA40ZUtaeSRbrgOnU8mOUn4Tvaw6Ikw7jFC3kXR0veD+Yhit6qrDCniolwGblHI4Z
 KxQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+wPooOVVd+7W1fIqkSEIV0ksz3zAPabhZeYGfx9EMt4=;
 b=F6tbSXiTnJCw3src9R9qVf8waDf/vguqt1jWqI9hvh/WYQYzi8SWbZcyoKhH7xYBze
 xXma4rSF5VSqnt+fl92YNdXEmd/L6eC9/GZRHsdR8IXcoJh5zQCTZUWsK6mCbgOQ7P4b
 Vo2lqvCieJXwp8YAfo5vh2ygDg+oKWgLCSdngLqv606P9vlEHP7eezPjjA/gdU2Sxjip
 SlIk8P+tIu9cjGWT23vNhSSQXLQhxm91yxNgGKgMpFUVBgu44k3BdijLRvR3sL+5XF+v
 xbjkNwUdu4y4MtQOH7ZXpYez3aXvJTQAPK/UxHAIhCDPKkSvJB3Rkh7uaYys42FqgMy3
 SpEw==
X-Gm-Message-State: AOAM533rBZUGUNcFspPErHnY4OPdgnFD5uxRj/nCE4KXNhDq5FBDdI8s
 LjyYiJyKQaUrfKchDK1UzlkxunUW8AEG2w==
X-Google-Smtp-Source: ABdhPJxQpbXXos9IXAjHInh9B/w6bihZ9lJXdeMSoIN3+GX01vmN0ga7mZ0Aj0s9Z8ypVxCKmy0piw==
X-Received: by 2002:a62:4e87:0:b0:447:ce02:c32e with SMTP id
 c129-20020a624e87000000b00447ce02c32emr37398771pfb.33.1633541020429; 
 Wed, 06 Oct 2021 10:23:40 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id w7sm21606929pfj.189.2021.10.06.10.23.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 10:23:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 38/41] target/sh4: Make sh4_cpu_tlb_fill sysemu only
Date: Wed,  6 Oct 2021 10:23:04 -0700
Message-Id: <20211006172307.780893-39-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211006172307.780893-1-richard.henderson@linaro.org>
References: <20211006172307.780893-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
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
 Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The fallback code in cpu_loop_exit_sigsegv is sufficient
for sh4 linux-user.

Remove the code from cpu_loop that raised SIGSEGV.

Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/sh4/cpu.h          | 6 +++---
 linux-user/sh4/cpu_loop.c | 8 --------
 target/sh4/cpu.c          | 2 +-
 target/sh4/helper.c       | 9 +--------
 4 files changed, 5 insertions(+), 20 deletions(-)

diff --git a/target/sh4/cpu.h b/target/sh4/cpu.h
index dc81406646..4cfb109f56 100644
--- a/target/sh4/cpu.h
+++ b/target/sh4/cpu.h
@@ -213,12 +213,12 @@ void superh_cpu_do_unaligned_access(CPUState *cpu, vaddr addr,
                                     uintptr_t retaddr) QEMU_NORETURN;
 
 void sh4_translate_init(void);
+void sh4_cpu_list(void);
+
+#if !defined(CONFIG_USER_ONLY)
 bool superh_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                          MMUAccessType access_type, int mmu_idx,
                          bool probe, uintptr_t retaddr);
-
-void sh4_cpu_list(void);
-#if !defined(CONFIG_USER_ONLY)
 void superh_cpu_do_interrupt(CPUState *cpu);
 bool superh_cpu_exec_interrupt(CPUState *cpu, int int_req);
 void cpu_sh4_invalidate_tlb(CPUSH4State *s);
diff --git a/linux-user/sh4/cpu_loop.c b/linux-user/sh4/cpu_loop.c
index 65b8972e3c..ac9b01840c 100644
--- a/linux-user/sh4/cpu_loop.c
+++ b/linux-user/sh4/cpu_loop.c
@@ -65,14 +65,6 @@ void cpu_loop(CPUSH4State *env)
             info.si_code = TARGET_TRAP_BRKPT;
             queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
             break;
-        case 0xa0:
-        case 0xc0:
-            info.si_signo = TARGET_SIGSEGV;
-            info.si_errno = 0;
-            info.si_code = TARGET_SEGV_MAPERR;
-            info._sifields._sigfault._addr = env->tea;
-            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
-            break;
         case EXCP_ATOMIC:
             cpu_exec_step_atomic(cs);
             arch_interrupt = false;
diff --git a/target/sh4/cpu.c b/target/sh4/cpu.c
index 2047742d03..06b2691dc4 100644
--- a/target/sh4/cpu.c
+++ b/target/sh4/cpu.c
@@ -236,9 +236,9 @@ static const struct SysemuCPUOps sh4_sysemu_ops = {
 static const struct TCGCPUOps superh_tcg_ops = {
     .initialize = sh4_translate_init,
     .synchronize_from_tb = superh_cpu_synchronize_from_tb,
-    .tlb_fill = superh_cpu_tlb_fill,
 
 #ifndef CONFIG_USER_ONLY
+    .tlb_fill = superh_cpu_tlb_fill,
     .cpu_exec_interrupt = superh_cpu_exec_interrupt,
     .do_interrupt = superh_cpu_do_interrupt,
     .do_unaligned_access = superh_cpu_do_unaligned_access,
diff --git a/target/sh4/helper.c b/target/sh4/helper.c
index 53cb9c3b63..6a620e36fc 100644
--- a/target/sh4/helper.c
+++ b/target/sh4/helper.c
@@ -796,8 +796,6 @@ bool superh_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
     return false;
 }
 
-#endif /* !CONFIG_USER_ONLY */
-
 bool superh_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                          MMUAccessType access_type, int mmu_idx,
                          bool probe, uintptr_t retaddr)
@@ -806,11 +804,6 @@ bool superh_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
     CPUSH4State *env = &cpu->env;
     int ret;
 
-#ifdef CONFIG_USER_ONLY
-    ret = (access_type == MMU_DATA_STORE ? MMU_DTLB_VIOLATION_WRITE :
-           access_type == MMU_INST_FETCH ? MMU_ITLB_VIOLATION :
-           MMU_DTLB_VIOLATION_READ);
-#else
     target_ulong physical;
     int prot;
 
@@ -829,7 +822,6 @@ bool superh_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
     if (ret != MMU_DTLB_MULTIPLE && ret != MMU_ITLB_MULTIPLE) {
         env->pteh = (env->pteh & PTEH_ASID_MASK) | (address & PTEH_VPN_MASK);
     }
-#endif
 
     env->tea = address;
     switch (ret) {
@@ -868,3 +860,4 @@ bool superh_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
     }
     cpu_loop_exit_restore(cs, retaddr);
 }
+#endif /* !CONFIG_USER_ONLY */
-- 
2.25.1


