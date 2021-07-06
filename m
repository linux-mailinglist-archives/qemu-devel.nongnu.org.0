Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39AA93BDFF8
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 01:59:27 +0200 (CEST)
Received: from localhost ([::1]:39592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0uyM-0004wq-4e
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 19:59:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m0up8-0001Rz-JY
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 19:49:54 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:46026)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m0up1-0006ee-II
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 19:49:54 -0400
Received: by mail-pl1-x634.google.com with SMTP id s13so41736plg.12
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 16:49:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9iNrkNfNiht6gNc7s+Sfth7iEg29J37zPd797X3OxQE=;
 b=i5JUERA2/P2iYZkHrcjPM2IRemKJ5K1KdtgYYi03sONM+hSiyLpaqK0LzBP7ORIEZ3
 GbVgwwdj7KgFH5N+rxO71klw3sXEkYMCYv+boyhfUOCO4t5LoHo/DEjVCvzho7xUZaNc
 gjJZETrLTeYORoivRka+TyZpArsaOHxdzQeCkjya9Z4Ygb3GgPnvPaVIGFyUe9vS/+PU
 h1jmZDceyz+K9LyB6NXhfo57/AgM1brySZjRiGmR7r8Vvtz3SykqYXklOKQIz6LDQ55D
 ZmrOWUbZth/KAi1MDOTKUuHuEK1nw0dsfYU0X+Z8B3tCUYh0RYjrmrWOoBSSwtVHFiYZ
 H01w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9iNrkNfNiht6gNc7s+Sfth7iEg29J37zPd797X3OxQE=;
 b=HgZ2kAlphNYMLJewMMgr+wSnkvK7gSlywHz1M1DNuiHvpaHrtpNlku1XfzF6IIOTCE
 91maqZ6V0SewrR90PIFgzlUSDQaFopHExD1oNmuDotPn7TnIjrpvv/lr+tnoCh+WRsby
 Zlaby93nDoiEQMMKJSNhU5o8w2qt1/dk8+x51q4oVkSLGj9br27YZVvJKPiBAzC8g2eR
 TETxwzkmQouWpuPPyei+JWBuez5P8eOBMVC/HcM0FfGr+9CeQOaVW1AHnEo96dHK+oxG
 1WeWGWquLG/b7p0Xmsu5O98TPrvHAX0IGKCF7H+pPtOobz6XIJstNtsASGxTYz+RVpPa
 +B+A==
X-Gm-Message-State: AOAM531EaQengkm05BfE/TIqaqms1MiShRsb1BnDF6h3yAiEMZ8O/gVT
 7ZEMIbAQIO71nL7Xf3UBjAm6KcqJlJgVTA==
X-Google-Smtp-Source: ABdhPJzPCbd2qn6lVM4LLR1iQuL5nNvaQUkY/Azg5AIPT4uPcLSvOk01HDpFhx6YqkKrXG8JoxkQAQ==
X-Received: by 2002:a17:902:8d82:b029:120:4377:8e0e with SMTP id
 v2-20020a1709028d82b029012043778e0emr18967194plo.32.1625615385958; 
 Tue, 06 Jul 2021 16:49:45 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id b3sm18058114pfi.179.2021.07.06.16.49.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 16:49:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 19/36] linux-user/hexagon: Implement setup_sigtramp
Date: Tue,  6 Jul 2021 16:49:15 -0700
Message-Id: <20210706234932.356913-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210706234932.356913-1-richard.henderson@linaro.org>
References: <20210706234932.356913-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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
Cc: Taylor Simpson <tsimpson@quicinc.com>, alex.bennee@linaro.org,
 laurent@vivier.eu, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Continue to initialize the words on the stack, as documented.
However, use the off-stack trampoline.

Cc: Taylor Simpson <tsimpson@quicinc.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/hexagon/target_signal.h |  2 ++
 linux-user/hexagon/signal.c        | 19 +++++++++++++++++--
 2 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/linux-user/hexagon/target_signal.h b/linux-user/hexagon/target_signal.h
index 345cf1cbb8..9e0223d322 100644
--- a/linux-user/hexagon/target_signal.h
+++ b/linux-user/hexagon/target_signal.h
@@ -31,4 +31,6 @@ typedef struct target_sigaltstack {
 
 #include "../generic/signal.h"
 
+#define TARGET_ARCH_HAS_SIGTRAMP_PAGE 1
+
 #endif /* TARGET_SIGNAL_H */
diff --git a/linux-user/hexagon/signal.c b/linux-user/hexagon/signal.c
index 85eab5e943..bd0f9b1c85 100644
--- a/linux-user/hexagon/signal.c
+++ b/linux-user/hexagon/signal.c
@@ -161,6 +161,11 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
 
     setup_ucontext(&frame->uc, env, set);
     tswap_siginfo(&frame->info, info);
+    /*
+     * The on-stack signal trampoline is no longer executed;
+     * however, the libgcc signal frame unwinding code checks
+     * for the presence of these two numeric magic values.
+     */
     install_sigtramp(frame->tramp);
 
     env->gpr[HEX_REG_PC] = ka->_sa_handler;
@@ -170,8 +175,7 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
         frame_addr + offsetof(struct target_rt_sigframe, info);
     env->gpr[HEX_REG_R02] =
         frame_addr + offsetof(struct target_rt_sigframe, uc);
-    env->gpr[HEX_REG_LR] =
-        frame_addr + offsetof(struct target_rt_sigframe, tramp);
+    env->gpr[HEX_REG_LR] = default_rt_sigreturn;
 
     return;
 
@@ -270,3 +274,14 @@ badframe:
     force_sig(TARGET_SIGSEGV);
     return 0;
 }
+
+void setup_sigtramp(abi_ulong sigtramp_page)
+{
+    uint32_t *tramp = lock_user(VERIFY_WRITE, sigtramp_page, 4 * 2, 0);
+    assert(tramp != NULL);
+
+    default_rt_sigreturn = sigtramp_page;
+    install_sigtramp(tramp);
+
+    unlock_user(tramp, sigtramp_page, 4 * 2);
+}
-- 
2.25.1


