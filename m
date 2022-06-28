Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA4E055BECF
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 08:38:23 +0200 (CEST)
Received: from localhost ([::1]:35974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o64re-0003j1-W5
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 02:38:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o63Fe-0003GH-F6
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:55:03 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:37444)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o63Fc-0008Lk-TT
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:55:02 -0400
Received: by mail-pf1-x435.google.com with SMTP id bo5so10957168pfb.4
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 21:54:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=97oCc36lcB1BPvxIKIrtIrCafpxgp+n+HDsHM7STsDo=;
 b=W4New5dCkHRHgaHOrYGtDqAhzNjhDlaLyP3CITzTlSwcPfTlyAAdwSdr6nr6XxjAtq
 I2wNfTJPeufqD2OhC7n/H55w2sevvhsTEctC1y5xbi8G5McgWjfxJ5y0mUTpZMvJelaw
 vV67swn4zGzmMGsmjDP5lFHyPGDt52lIn9gNo6OzfH7P+OXzXqFpGxfwz+C1lfoy9Z3u
 RXBMsuzseSNGHBeknl86LGwjxRifKO63gnDyD6qInaMhIAVQy1IbNHBipCTVHUcd71Ey
 qF0bmmOcTHEJYIf6fKU0uSMBg0l1fj7ahA1ITxU1/i3zCilxVcy/wjVRQiT0wk0GwB0+
 mstA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=97oCc36lcB1BPvxIKIrtIrCafpxgp+n+HDsHM7STsDo=;
 b=yOnfq/PnvPowkwLynTs5FAY+zcLJg6CFHtVDJV9BwIryTsTRSkGEKcdj42OvPMVqpR
 htOSWbZ8QKwHPuEIBevs9qdyLghEOvDyrLXNadljaTeARdceX4AFgHMO8aY2NFee9p4V
 BSLSZ5RbyZJ4Kgd1WlCRpxqdZZhP7+B1YudHPaxPPfKpGT8fanR8OkYKiW1l3aLFANah
 0qP+4CLAKXOPcfrMOUmG2riOCaBtveYPS0rvcsEj1TzU+Pq+LBdqM5A7DdnNoQNYX5wM
 QnpmtBlLUNxfv7O9tWaIEKq4uq0IdoHdVvNgCr63jKQKzb95LKFIQ09o27N0u8AUZl8L
 2wyQ==
X-Gm-Message-State: AJIora/wG1JrqJCBgine+JgFx/WFz8SxNDhoDN64xZKDcnZs6PmWCRUu
 omZCKxpw2Gbhr/OixltfORUzlEhQOetkXw==
X-Google-Smtp-Source: AGRyM1sIVMWbor2lWrWsNB7AdCS81jwVXOE/KlClaeLEaAET+WTe8pcXaRsZ7Z4Pjpg2KEb6ImgF8g==
X-Received: by 2002:a63:a749:0:b0:40c:57e0:86c0 with SMTP id
 w9-20020a63a749000000b0040c57e086c0mr15924234pgo.265.1656392098640; 
 Mon, 27 Jun 2022 21:54:58 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 w8-20020a1709026f0800b00168c523032fsm8073735plk.269.2022.06.27.21.54.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 21:54:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 21/60] semihosting: Split is_64bit_semihosting per target
Date: Tue, 28 Jun 2022 10:23:24 +0530
Message-Id: <20220628045403.508716-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220628045403.508716-1-richard.henderson@linaro.org>
References: <20220628045403.508716-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
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


