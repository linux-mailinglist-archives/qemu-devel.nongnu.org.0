Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1B7D541E13
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 00:24:59 +0200 (CEST)
Received: from localhost ([::1]:42388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyhdD-0001hz-00
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 18:24:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyg5k-0007Gq-NV
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:46:23 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:45667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyg5j-0001Ol-5y
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:46:20 -0400
Received: by mail-pf1-x433.google.com with SMTP id b135so16505623pfb.12
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 13:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=97oCc36lcB1BPvxIKIrtIrCafpxgp+n+HDsHM7STsDo=;
 b=yCKb9adgUi6AZH33vd+4TvNRdEzeOCQ1mPCrFK3GKa3Z0CJFu0wKrvk19tH/cth8yS
 OFj5OmAo92jH8HkVY+loDtFTAzb92IyWbndp9iNHApF0rdGNmv2hY43SsZcbHyEH/uJy
 BWh4mCTxhZb3PFd8CdnnO9hNXKEPKqVaoScr4p6yNz4Ihb0W+3wkpcEHCTw9P08U8iWh
 XChWeemHzgPgUEvuFZNZLoxLiOm787cJrGxkqe/kn8wDdBg6pyYdMMeXutrxzUKC+nYR
 YWgpC+FOakGLa6T7P952H/H2eCS2gzZs+wNir0cbgpMVXH4Q1GAqzwd8TKx//HBpCBcw
 mFyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=97oCc36lcB1BPvxIKIrtIrCafpxgp+n+HDsHM7STsDo=;
 b=PDFx3L5tSyIfioYdr4Xf5seKQieduK3N1AmjFoGzCw8SmFfvsLYzBveTT1P3tAfVkg
 kFl9Hpf9RhSvIiaBTbo26aFeJRfxGk5SFrysDHvx2oZ3hblN4Cx7e17fMwadI2hhucw4
 P+8YcLTVKEJC4ym7kppdPS2E5xIXGjb7Jad0AQ8Hju069l/iD45GgycqTrsVxM2ZnlD8
 /7LsqlfeNGNx3jXJ1ysOY/2WNrKnNQxG/3It267+oz6cVw7YkSAP/TV7Qx8sz65EZArR
 g6Fd0rOIeqnmMR7lCRYXO2GFGHFfRyK5kNWUvcCsdJtuDYddu8zTYpApj7AmolepjfVx
 garw==
X-Gm-Message-State: AOAM530URLjyjRLZnRCXKXlXTJAd+2FYnCTOvPt34UtmrU/gz0sBPmPt
 lGFMVlRHgO6DNcOe7lYB/2qpfha/8oQqHg==
X-Google-Smtp-Source: ABdhPJw9IJ/HMXcTwbLNFzPO3V5fhZ7L4bjaHgE1c5fmq9AMIRQkvdtlSgAjp8hJ3n9rns6hPsUixA==
X-Received: by 2002:a63:f312:0:b0:3fd:12b7:193b with SMTP id
 l18-20020a63f312000000b003fd12b7193bmr21855777pgh.9.1654634777892; 
 Tue, 07 Jun 2022 13:46:17 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3cf2:c634:5b19:25f6])
 by smtp.gmail.com with ESMTPSA id
 r6-20020a170902be0600b00162037fbacdsm12971279pls.187.2022.06.07.13.46.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 13:46:17 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v4 21/53] semihosting: Split is_64bit_semihosting per target
Date: Tue,  7 Jun 2022 13:45:25 -0700
Message-Id: <20220607204557.658541-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607204557.658541-1-richard.henderson@linaro.org>
References: <20220607204557.658541-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
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

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 semihosting/arm-compat-semi.c | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index a9e488886a..d2ce214078 100644
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
@@ -587,17 +595,6 @@ static const GuestFDFunctions guestfd_fns[] = {
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


