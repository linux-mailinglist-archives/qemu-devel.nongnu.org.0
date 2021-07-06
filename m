Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00C743BE007
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 02:04:22 +0200 (CEST)
Received: from localhost ([::1]:56984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0v36-0008Nl-Sm
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 20:04:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m0upD-0001hD-Ih
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 19:49:59 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:37828)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m0up5-0006fz-SS
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 19:49:59 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 22-20020a17090a0c16b0290164a5354ad0so2565252pjs.2
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 16:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fJ2heq9/ybEPRov+oRcE6gMbBb+FglnKkmzlhd1SVGQ=;
 b=E9K+SH4Unbda+auBY33R347EmbKk1XZsC8gWxhGImBUvaDzupvIFTd6dJM95nUe22p
 wvyUmL5XKXQTfxYB9ugcD7YRohaAqfYGQt2nDl3OmUXSumWXEVlQzYXkeNwqFSlizpni
 D02NRXegqZIOiuAjzrwMIWWNKN6EeEWbuGeQs62fJkiRRNDuhqZBc2XIWFba+84frKM+
 zNJor1SXm5HCvmoxYK06D4x9ibK7XJD7MOnxAjgs4XDan8DPeuA0pAwc/ten/kjZ8QDU
 7Nb7da/eA9FbfKLimyuSXEVdyCvJ35sdxwfN9EMymhRXhE1b4ibUjxKuShEWNG1pzKvS
 vb+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fJ2heq9/ybEPRov+oRcE6gMbBb+FglnKkmzlhd1SVGQ=;
 b=c+gxOys8Qvon7bSO8hQBg5q3N75zDCX3CD+4NNAsG8v32wnbCeipffRbgnCMc+PhYt
 ZkpYhgALrpafKyZ5K8QX85zwQfUABTQmlI2zkC/Zd1ww3RoZwUvN4AXBUN/ZoP72429t
 /SbJr9SM0/WzYQS53t0b0JxsY/wwywBAl4Pcb6K52GoETVYwgDxHt0lJhvyuPU6TOomU
 VMD8e5P08rSqQMomkqR9oKQA6Pto76/dLv6yNYIAyt/kL0k3eOXCsD9N6SnNvpdA+2if
 x/ojFp6P6q7ZncW/Nzmh4t/uHbi17ZdHSBg38y/1KZ2kf0QoaTVmx7HpIEVGC8VmEEs4
 hu+Q==
X-Gm-Message-State: AOAM533S4oECFTmexL3w3b/RXM/mKmOgL+TwMmHjCbBau7RR9qMeGCu4
 Qxxk8ZK5r0Cz7dv3q9Gmk3VnEGtETuD8VQ==
X-Google-Smtp-Source: ABdhPJwQe9uYdpOvny+AlA+Umgil9NLyJKpTaOsNmwXXmrA6svBSulVMvImQ0GdleefsD5JIHl083A==
X-Received: by 2002:a17:90b:806:: with SMTP id bk6mr649448pjb.13.1625615390675; 
 Tue, 06 Jul 2021 16:49:50 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id b3sm18058114pfi.179.2021.07.06.16.49.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 16:49:50 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 27/36] linux-user/mips: Implement setup_sigtramp
Date: Tue,  6 Jul 2021 16:49:23 -0700
Message-Id: <20210706234932.356913-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210706234932.356913-1-richard.henderson@linaro.org>
References: <20210706234932.356913-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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

Create and record the two signal trampolines.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/mips/target_signal.h   |  1 +
 linux-user/mips64/target_signal.h |  2 ++
 linux-user/mips/signal.c          | 34 ++++++++++++++++++++++---------
 3 files changed, 27 insertions(+), 10 deletions(-)

diff --git a/linux-user/mips/target_signal.h b/linux-user/mips/target_signal.h
index d521765f6b..780a4ddf29 100644
--- a/linux-user/mips/target_signal.h
+++ b/linux-user/mips/target_signal.h
@@ -73,6 +73,7 @@ typedef struct target_sigaltstack {
 /* compare linux/arch/mips/kernel/signal.c:setup_frame() */
 #define TARGET_ARCH_HAS_SETUP_FRAME
 #endif
+#define TARGET_ARCH_HAS_SIGTRAMP_PAGE 1
 
 /* bit-flags */
 #define TARGET_SS_AUTODISARM (1U << 31) /* disable sas during sighandling */
diff --git a/linux-user/mips64/target_signal.h b/linux-user/mips64/target_signal.h
index d857c55e4c..275e9b7f9a 100644
--- a/linux-user/mips64/target_signal.h
+++ b/linux-user/mips64/target_signal.h
@@ -76,4 +76,6 @@ typedef struct target_sigaltstack {
 /* compare linux/arch/mips/kernel/signal.c:setup_frame() */
 #define TARGET_ARCH_HAS_SETUP_FRAME
 #endif
+#define TARGET_ARCH_HAS_SIGTRAMP_PAGE 1
+
 #endif /* MIPS64_TARGET_SIGNAL_H */
diff --git a/linux-user/mips/signal.c b/linux-user/mips/signal.c
index 7cad7526ea..a3db08bfec 100644
--- a/linux-user/mips/signal.c
+++ b/linux-user/mips/signal.c
@@ -208,8 +208,6 @@ void setup_frame(int sig, struct target_sigaction * ka,
         goto give_sigsegv;
     }
 
-    install_sigtramp(frame->sf_code, TARGET_NR_sigreturn);
-
     setup_sigcontext(regs, &frame->sf_sc);
 
     for(i = 0; i < TARGET_NSIG_WORDS; i++) {
@@ -230,7 +228,7 @@ void setup_frame(int sig, struct target_sigaction * ka,
     regs->active_tc.gpr[ 5] = 0;
     regs->active_tc.gpr[ 6] = frame_addr + offsetof(struct sigframe, sf_sc);
     regs->active_tc.gpr[29] = frame_addr;
-    regs->active_tc.gpr[31] = frame_addr + offsetof(struct sigframe, sf_code);
+    regs->active_tc.gpr[31] = default_sigreturn;
     /* The original kernel code sets CP0_EPC to the handler
     * since it returns to userland using eret
     * we cannot do this here, and we must set PC directly */
@@ -304,8 +302,6 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
         goto give_sigsegv;
     }
 
-    install_sigtramp(frame->rs_code, TARGET_NR_rt_sigreturn);
-
     tswap_siginfo(&frame->rs_info, info);
 
     __put_user(0, &frame->rs_uc.tuc_flags);
@@ -334,11 +330,13 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
     env->active_tc.gpr[ 6] = frame_addr
                              + offsetof(struct target_rt_sigframe, rs_uc);
     env->active_tc.gpr[29] = frame_addr;
-    env->active_tc.gpr[31] = frame_addr
-                             + offsetof(struct target_rt_sigframe, rs_code);
-    /* The original kernel code sets CP0_EPC to the handler
-    * since it returns to userland using eret
-    * we cannot do this here, and we must set PC directly */
+    env->active_tc.gpr[31] = default_rt_sigreturn;
+
+    /*
+     * The original kernel code sets CP0_EPC to the handler
+     * since it returns to userland using eret
+     * we cannot do this here, and we must set PC directly
+     */
     env->active_tc.PC = env->active_tc.gpr[25] = ka->_sa_handler;
     mips_set_hflags_isa_mode_from_pc(env);
     unlock_user_struct(frame, frame_addr, 1);
@@ -378,3 +376,19 @@ badframe:
     force_sig(TARGET_SIGSEGV);
     return -TARGET_QEMU_ESIGRETURN;
 }
+
+void setup_sigtramp(abi_ulong sigtramp_page)
+{
+    uint32_t *tramp = lock_user(VERIFY_WRITE, sigtramp_page, 2 * 8, 0);
+    assert(tramp != NULL);
+
+#ifdef TARGET_ARCH_HAS_SETUP_FRAME
+    default_sigreturn = sigtramp_page;
+    install_sigtramp(tramp, TARGET_NR_sigreturn);
+#endif
+
+    default_rt_sigreturn = sigtramp_page + 8;
+    install_sigtramp(tramp + 2, TARGET_NR_rt_sigreturn);
+
+    unlock_user(tramp, sigtramp_page, 2 * 8);
+}
-- 
2.25.1


