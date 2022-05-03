Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 821EA518E75
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 22:13:21 +0200 (CEST)
Received: from localhost ([::1]:38848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlytc-0005u3-Hu
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 16:13:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nlyWA-0001ad-9V
 for qemu-devel@nongnu.org; Tue, 03 May 2022 15:49:06 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:42985)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nlyW7-0003Yr-98
 for qemu-devel@nongnu.org; Tue, 03 May 2022 15:49:05 -0400
Received: by mail-pl1-x62b.google.com with SMTP id d22so5697110plr.9
 for <qemu-devel@nongnu.org>; Tue, 03 May 2022 12:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=coOzTtMwr9rrGl+3cyhDbkXBtamsk22lDxbutCmvHoo=;
 b=ABLpqbmLIoquJFUWi+oSPoFUFfiF7nk7imQAanAZPuu1+Vxsy7Hf4rSQSeayvWro0U
 HShbzROH+ZuHaxWTV+FVC287e81nDwtXaPjcnXsMph7pvWwZCRSz88QAlr7MAv9Dvx/z
 AHAIXnvlRsdErNhdHCOJanZZVIs6OfLoXPZORGUnyDwbH93FaKiYnzG5NHYQPHodSBS5
 Gs2GoANWopj/KAOCXAZg1q5OpM12/+hVsEuQHCPpl2/52eN8vm12toIjXwsEh/jTCKfW
 toTjpNQy6WhkbDCnFWrV7mARI8Uh/oXwP6ZZCPetvb5GS2In8ATFRhcP8KZ7Un0dRfJ5
 tBzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=coOzTtMwr9rrGl+3cyhDbkXBtamsk22lDxbutCmvHoo=;
 b=P+TFdeK6QdBNSpihgsaeh/27bqEsrXKFOUqaHNqQeSdW6vVvvPciewTpTMviCzqn+o
 JT08A9W/8OpQBHeHsljfLXX/t98rhgoOUueLxY2Sjkh6bH9W9/kjDsGbTlANPcgM9xZH
 vW+2Na7nssHUBJgHh0S69Vm9sb+w4wU9cYYqcmsc7WKh3ZXaWiyzvoIB+ljBLpKuijsA
 bQX2pwWtC3s6V+rBMON8VQA9vsAlZsMsKusbn3+JqO0BnJktv6zkl9EFzLmWB9gp1cfV
 1tnB5ka4LSfIV88pwARNVM166AUdFVpMJtNmCkx+d/U912A2IVZJrxdbjoCFT1/vjTJ9
 feRw==
X-Gm-Message-State: AOAM531u0Uhq7qVQBr1SCEH0Rp8nQSDuU2qlCe0t7ZS/vvcoDfg1K8BX
 uPmi+g00jf9L7SgW/qaefZFutJdXwQASQg==
X-Google-Smtp-Source: ABdhPJxWUcHmfP09cGHep/9BRXGaksl+nEf3IfVFoOQjsZXKxeWXhsAi0JHnlAW5Xj7BgqKdHO7OZQ==
X-Received: by 2002:a17:903:32c9:b0:15e:a1b8:c1ef with SMTP id
 i9-20020a17090332c900b0015ea1b8c1efmr12299316plr.173.1651607341940; 
 Tue, 03 May 2022 12:49:01 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 p11-20020a17090ad30b00b001cd4989fed3sm1712383pju.31.2022.05.03.12.49.01
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 May 2022 12:49:01 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 16/74] semihosting: Split is_64bit_semihosting per target
Date: Tue,  3 May 2022 12:47:45 -0700
Message-Id: <20220503194843.1379101-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220503194843.1379101-1-richard.henderson@linaro.org>
References: <20220503194843.1379101-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We already have some larger ifdef blocks for ARM and RISCV;
split the function into multiple implementations per arch.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 semihosting/arm-compat-semi.c | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index a6c6e5baf6..7fc60e223a 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -213,6 +213,10 @@ common_semi_sys_exit_extended(CPUState *cs, int nr)
     return (nr == TARGET_SYS_EXIT_EXTENDED || is_a64(cs->env_ptr));
 }
 
+static inline bool is_64bit_semihosting(CPUArchState *env)
+{
+    return is_a64(env);
+}
 #endif /* TARGET_ARM */
 
 #ifdef TARGET_RISCV
@@ -238,6 +242,10 @@ common_semi_sys_exit_extended(CPUState *cs, int nr)
     return (nr == TARGET_SYS_EXIT_EXTENDED || sizeof(target_ulong) == 8);
 }
 
+static inline bool is_64bit_semihosting(CPUArchState *env)
+{
+    return riscv_cpu_mxl(env) != MXL_RV32;
+}
 #endif
 
 /*
@@ -586,17 +594,6 @@ static const GuestFDFunctions guestfd_fns[] = {
  * call if the memory read fails. Eventually we could use a generic
  * CPUState helper function here.
  */
-static inline bool is_64bit_semihosting(CPUArchState *env)
-{
-#if defined(TARGET_ARM)
-    return is_a64(env);
-#elif defined(TARGET_RISCV)
-    return riscv_cpu_mxl(env) != MXL_RV32;
-#else
-#error un-handled architecture
-#endif
-}
-
 
 #define GET_ARG(n) do {                                 \
     if (is_64bit_semihosting(env)) {                    \
-- 
2.34.1


