Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0E3B515DB8
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Apr 2022 15:40:00 +0200 (CEST)
Received: from localhost ([::1]:40424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nknKK-0007sO-2p
	for lists+qemu-devel@lfdr.de; Sat, 30 Apr 2022 09:40:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nknAY-0004mB-Fl
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 09:29:57 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:46969)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nknAV-0006GP-IF
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 09:29:53 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 cq17-20020a17090af99100b001dc0386cd8fso4074301pjb.5
 for <qemu-devel@nongnu.org>; Sat, 30 Apr 2022 06:29:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=coOzTtMwr9rrGl+3cyhDbkXBtamsk22lDxbutCmvHoo=;
 b=MYaCNupZQcz9zdXBtHousQTz09lzKoi2dZ1ko0Snmyp28RtEpgk5d51uCvWhkykBMu
 f/55TT/wZpORgIk5nheoXb6iA3wFSvzfEkqAy8A+yiK+DlHb88L2r7QYj3ofh1hwMEwX
 ElwSQDiLBrpbgPHlZqQ5NWeSDn4J7ln/VvWlhQ0bcUKnVuZye4pSaHUQt4DjMeZ+fuE9
 8/c82Mf12/dwfGUkrtcWVjXmBSgmteGRaFoxMKpRn9HPv7B8bRI4xAc88v3Nqmcjblg/
 Lo3lZxJD+6/u1RvLpPLOzqzkLgPrz9EBfsXm3058ZJvOwgrQfRoD45v97bSlkihbVe0v
 QR3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=coOzTtMwr9rrGl+3cyhDbkXBtamsk22lDxbutCmvHoo=;
 b=n09o7FiLn+1rg0GNOZOq5CkpXbb+M9eQHxeK7ki35gq2uEs07RJQpqyzV45KjLtZ8L
 vlMnVamp984fj1+zog1q6lSjdY5HJc5/r5Y7NQpPzvzF5kLZZ0jKxJlR//MBETYvUrdJ
 tM+8p6HmMb+3RS0GmRYtfBi30ZhpSJ3/6N1QyuL8v4D8os9DZEoFx+s41V2uXEg2FUWw
 B23Wa7CSbCR46n0QEFXvhmeo4zvpnOfToL6ioqh0E+2ULhI5nQwaRnLM3Div3P/OgcUl
 kJMRk6cCggf6CJ2YksJpO+PkWBykEzFMD/KN6JLI/dbsnofOjHzA7qWaRn+4nfHxlq62
 k9JQ==
X-Gm-Message-State: AOAM533J0RonkSmWDM2yDSZd+WFym9oR7IXeZp07V0w5ahZ9/jW3jE3G
 ARby5Xd8UH2gJhhst919na4rNfM92g2uFA==
X-Google-Smtp-Source: ABdhPJzE+p3pQ02Mqlc+zvjJxQaeTAtJVgThqGguHS4aiuhX2vFtvW0DYMmXBuxJW0VlVATQfSZo3g==
X-Received: by 2002:a17:903:230f:b0:15e:6e55:3230 with SMTP id
 d15-20020a170903230f00b0015e6e553230mr3877760plh.35.1651325389346; 
 Sat, 30 Apr 2022 06:29:49 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 x5-20020aa793a5000000b0050dc7628201sm1522606pff.219.2022.04.30.06.29.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Apr 2022 06:29:48 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 15/43] semihosting: Split is_64bit_semihosting per target
Date: Sat, 30 Apr 2022 06:29:04 -0700
Message-Id: <20220430132932.324018-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220430132932.324018-1-richard.henderson@linaro.org>
References: <20220430132932.324018-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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
Cc: crwulff@gmail.com, alex.bennee@linaro.org, f4bug@amsat.org,
 laurent@vivier.eu
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


