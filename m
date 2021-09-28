Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3BED41A51F
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 04:09:20 +0200 (CEST)
Received: from localhost ([::1]:57498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mV2YZ-00059m-Mt
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 22:09:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mV2QT-0004cg-Cg
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 22:01:01 -0400
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c]:39525)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mV2QL-0005hf-FF
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 22:00:56 -0400
Received: by mail-qk1-x72c.google.com with SMTP id f130so39079076qke.6
 for <qemu-devel@nongnu.org>; Mon, 27 Sep 2021 19:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1f4aYpKsB+ja4QJ7hAEtER7A5IlRmh/mgnhLrHPEyy0=;
 b=JmwpBSC/6IDY0zjOmFDq0MFGYtgVaeUZpBt1O0spFK9O2OjmPAJ7Piy6cpK31Saaw4
 o6IPPE4AQj/mMj2TWXZnQTHjjtr+1tnldK249suwbYuP+BwRNDq919jGS3N2Q2NOhChF
 p2I9jfuvGXCHUKfINBRligjgIMSlDmkhhtc7THtDA75uZENGt3z/qMmOp7wlmEEzDIYn
 ZKGBIn/WI9aX1BOJp8bqxhW3bN8nAo5c92CocWgWh8Aj9WXsXmOeILYLx2oXrZ+Iv5TW
 IvcbS001hOBeI0CMg2PZ6nYouf7d3X2yZbl57QR+duBFfo/BaR7rwVcEN+KohW77LYSU
 myGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1f4aYpKsB+ja4QJ7hAEtER7A5IlRmh/mgnhLrHPEyy0=;
 b=STsCppXauKvosIELkSyy1ZPDR5gNNvWTfziDymb76lrMuVaFY0S98Qf/mFL6njp7Uq
 S8y9z2fDW7cQ/4XzgSQ7/TtNyWw4+BlbCIAfJOyTY9ZLViaR3yMOFcAL5NDreyXsr6k8
 ehbL36pHswh6/hOeSHlWSt0j2BSIfBLlazsw924HDlRGLm72bVYCHoLITg0WLwj/n4vy
 r3GtPUBwfjeBjCGTEFgyQBAQMkk1GDsOkw5GljrZ7EYWx0NO3XozqY3pnHTOQE3KQCdY
 1SKE3mDPFDTV92AZ1wHQD7aUaVJp9LgWck+/eNkEegKsnyhkGhOI5BKBj9zEYEk2kdjj
 aITQ==
X-Gm-Message-State: AOAM533NFZHDrQEbJewQFikNds5CCDqHD6tTqAT9Gx1UzaEg936PLfa3
 2gozPxV7Z8kLBe/68s94XmyuA4mn3brzmw==
X-Google-Smtp-Source: ABdhPJwNdBm5zKo67YI++MAR9KaJrb4XWSM+xJ8YcPUbzy7RRwqDwe/9ye4A/6+XJEzx8M1KMgi5BA==
X-Received: by 2002:a37:bc85:: with SMTP id m127mr3147429qkf.119.1632794448566; 
 Mon, 27 Sep 2021 19:00:48 -0700 (PDT)
Received: from localhost.localdomain (cpe-24-31-215-130.sc.res.rr.com.
 [24.31.215.130])
 by smtp.gmail.com with ESMTPSA id g12sm12530370qtm.59.2021.09.27.19.00.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Sep 2021 19:00:48 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 08/25] linux-user/hexagon: Implement setup_sigtramp
Date: Mon, 27 Sep 2021 22:00:22 -0400
Message-Id: <20210928020039.184412-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210928020039.184412-1-richard.henderson@linaro.org>
References: <20210928020039.184412-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72c;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72c.google.com
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
Cc: peter.maydell@linaro.org, Taylor Simpson <tsimpson@quicinc.com>,
 laurent@vivier.eu, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Continue to initialize the words on the stack, as documented.
However, use the off-stack trampoline.

Reviewed-by: Taylor Simpson <tsimpson@quicinc.com>
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
index c7f0bf6b92..74e61739a0 100644
--- a/linux-user/hexagon/signal.c
+++ b/linux-user/hexagon/signal.c
@@ -162,6 +162,11 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
 
     setup_ucontext(&frame->uc, env, set);
     tswap_siginfo(&frame->info, info);
+    /*
+     * The on-stack signal trampoline is no longer executed;
+     * however, the libgcc signal frame unwinding code checks
+     * for the presence of these two numeric magic values.
+     */
     install_sigtramp(frame->tramp);
 
     env->gpr[HEX_REG_PC] = ka->_sa_handler;
@@ -171,8 +176,7 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
         frame_addr + offsetof(struct target_rt_sigframe, info);
     env->gpr[HEX_REG_R02] =
         frame_addr + offsetof(struct target_rt_sigframe, uc);
-    env->gpr[HEX_REG_LR] =
-        frame_addr + offsetof(struct target_rt_sigframe, tramp);
+    env->gpr[HEX_REG_LR] = default_rt_sigreturn;
 
     return;
 
@@ -271,3 +275,14 @@ badframe:
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


