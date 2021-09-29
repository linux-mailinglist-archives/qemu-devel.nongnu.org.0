Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 335F041C594
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 15:27:47 +0200 (CEST)
Received: from localhost ([::1]:50782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVZcg-0005Sw-8C
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 09:27:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mVZI8-0007Bf-VO
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 09:06:34 -0400
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e]:44858)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mVZI7-0006Hu-9L
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 09:06:32 -0400
Received: by mail-ot1-x32e.google.com with SMTP id
 h9-20020a9d2f09000000b005453f95356cso2727579otb.11
 for <qemu-devel@nongnu.org>; Wed, 29 Sep 2021 06:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+2oTGkDFDH981BJQF84oTMrfB4/Msl13jtU0KS59bkI=;
 b=yQalZLwSDg5ZFirqsBlAFEQOUZvpKzeEXIa/RTYaP7XrqYcoL7BfojymlHoOsoFcNV
 oru5Y7tVr+XoPnXMRQHbIphDfS4Hk1Hbgifnwx6EK6tGmNY3gJ6/Zu3oVXwcL+VFi3fP
 wh6jfe9gA6posjz5wrkSWfC97out/vQEhudMWGlwZP+Zaw/wnX9g4XG3I4duNqbfy8DY
 wH7q9q3Sh81sm4kW6E/I5qnfDAUPtE6KufN/cG/vQlWcVYmiFDKKkNrq+Eu6Od2zY2Rw
 ujQ4PWFnN6/zOP3r8siFy9bL3mmFcV7WZ7ZU3x+8+4M/WJ7TLmbD9/7rijAIU17jK46z
 l3Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+2oTGkDFDH981BJQF84oTMrfB4/Msl13jtU0KS59bkI=;
 b=jbFGs2sm+osKmD0D0XP1KhVNxpbpM0vYHV8n+g9G7oH4z7j/epKYtS2zFvTAQkKJYd
 4OWweThxTpXoLb6x6QUZlrZRYUf2HQhXi7XaXIRprQaW0SG7TciO2m0dkYFdilWVX0mC
 2U919JbcSucWWzuJHkpn+2mdRswuLoBBQIdPc3g0e9/Xr68nwz++IXAG1HXlP7AjNfbs
 AxXBwFGiC37y9ZZgHmd3xgpGYXcDpTRyRlag0Oc10CsoDXIBnq1SM0flEt1SCjCIXgGw
 0jfWkEmEYE7ZGPvAo3JhWlia2oUeZOcOJzfkj/FLVhpTqQ1DFcWBl7us+eGnMLYPsJP3
 Hn7w==
X-Gm-Message-State: AOAM530qHP7YWeHVl8u9nuQqUPJkTFQ8EnKuFlfIj/sLIv2KM9lukWT+
 4sQiOtSJTfHcndekpQTYAuBjqv3vzhtpvw==
X-Google-Smtp-Source: ABdhPJwwxEl7SCr/R+T0+h8XJq/RLsY88L+S2vF9gr/ckNXZJ94oE/DfJ9Lp3gdeEwSRxgHUKOmjdw==
X-Received: by 2002:a9d:4595:: with SMTP id x21mr9954291ote.273.1632920790125; 
 Wed, 29 Sep 2021 06:06:30 -0700 (PDT)
Received: from localhost.localdomain ([172.58.171.248])
 by smtp.gmail.com with ESMTPSA id w1sm442823ote.41.2021.09.29.06.06.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Sep 2021 06:06:29 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 15/26] linux-user/mips: Implement setup_sigtramp
Date: Wed, 29 Sep 2021 09:05:42 -0400
Message-Id: <20210929130553.121567-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210929130553.121567-1-richard.henderson@linaro.org>
References: <20210929130553.121567-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32e;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32e.google.com
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
index 64072779b9..8f79e405ec 100644
--- a/linux-user/mips/signal.c
+++ b/linux-user/mips/signal.c
@@ -209,8 +209,6 @@ void setup_frame(int sig, struct target_sigaction * ka,
         goto give_sigsegv;
     }
 
-    install_sigtramp(frame->sf_code, TARGET_NR_sigreturn);
-
     setup_sigcontext(regs, &frame->sf_sc);
 
     for(i = 0; i < TARGET_NSIG_WORDS; i++) {
@@ -231,7 +229,7 @@ void setup_frame(int sig, struct target_sigaction * ka,
     regs->active_tc.gpr[ 5] = 0;
     regs->active_tc.gpr[ 6] = frame_addr + offsetof(struct sigframe, sf_sc);
     regs->active_tc.gpr[29] = frame_addr;
-    regs->active_tc.gpr[31] = frame_addr + offsetof(struct sigframe, sf_code);
+    regs->active_tc.gpr[31] = default_sigreturn;
     /* The original kernel code sets CP0_EPC to the handler
     * since it returns to userland using eret
     * we cannot do this here, and we must set PC directly */
@@ -305,8 +303,6 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
         goto give_sigsegv;
     }
 
-    install_sigtramp(frame->rs_code, TARGET_NR_rt_sigreturn);
-
     tswap_siginfo(&frame->rs_info, info);
 
     __put_user(0, &frame->rs_uc.tuc_flags);
@@ -335,11 +331,13 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
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
@@ -379,3 +377,19 @@ badframe:
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


