Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FFC56F522C
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 09:48:36 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu6tV-0004RL-1L; Wed, 03 May 2023 03:27:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6tO-0004AU-G9
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:27:14 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6tM-0005d5-7e
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:27:14 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-3f19afc4fd8so29133465e9.2
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 00:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683098830; x=1685690830;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AOmc6NTAcQj/Mp+DF3kqj7q/zDRxxcB2uZfutxprojI=;
 b=dArnKiMdUkb1btWlUordzqgiMTVTCqUfu/s3/xesEDgTX+qQVbKZI5EX0RiCAllbZ0
 A/LNPwkGuQ2BFs5E7wr1s402LonSyXDoc6csU8yzzPVeUzf2NSJMzivPPxdopTHRLCrS
 e3UugwzsSe0NHlf3HEZ60rM/PR6qYLLIH0UbADP/aKzsNIsDQxbhxQGikQN1pLmaoccm
 fZT967RmoHJdwjiYtSlngz0pt/p9iJ7ETaci1nNrAnz1oDXIEMP+C6bVfpLHdKqy2lkJ
 5bY+X2zHLAaWRYOPfJT1Vo1EhMhxxzfrfbPhV3WbQiVFjxyA4WifDy2rD3QyNGAtPdhw
 wwZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683098830; x=1685690830;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AOmc6NTAcQj/Mp+DF3kqj7q/zDRxxcB2uZfutxprojI=;
 b=ckrYT/jV7jL5skuUrK17J5Edr5Yw0/viimRRhxNZboTcpirI07nK1TrWSONd2SpdRI
 n71KR4EoQd951MLt5JSZXzjcdrfel/0mRxVkQ0pvX135mxtgb7D0WE2fCXARwi0olPJI
 HiB+Sw7vRN/144tkRy1RqBEBiAF6KExOn8X0BmOKoDTU6S7rRqghiYkHB+1A1VeQRfhv
 ekqsKl1Z1M8aVhC99PIEB6G8UFxoLaEAiupMxsY4VhoLTFD/fY5BNYpnZ1FKBXPtnlrH
 vJ/0kw7tEqCFpIsBqU2aSQERFONzbFBcdY7v6PLBNV7qzqIW2tePGDrZfGmouMkCzFL7
 nwFQ==
X-Gm-Message-State: AC+VfDzcGNMyk7r0gBbaOUX456a4PyjKpeUOO0fUa63UQRv+GAH7+SaK
 pZB1WRY2aVncOoHARM4Uoh0NMBmFns2+8XcvS7bDRQ==
X-Google-Smtp-Source: ACHHUZ5LTwgCIjTyeJJOug5mW2PLXPeJWZoce7wal6l3z5lUNBA8TJYQpais6kpo9BJ8GqQkOwOvpg==
X-Received: by 2002:a7b:ce07:0:b0:3f1:70e6:df66 with SMTP id
 m7-20020a7bce07000000b003f170e6df66mr14803337wmc.36.1683098830730; 
 Wed, 03 May 2023 00:27:10 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a7bc3c4000000b003f1745c7df3sm974315wmj.23.2023.05.03.00.27.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:27:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ale@rev.ng, philmd@linaro.org, marcel.apfelbaum@gmail.com,
 wangyanan55@huawei.com, anjo@rev.ng
Subject: [PATCH 50/84] tcg: Move temp_idx and tcgv_i32_temp debug out of line
Date: Wed,  3 May 2023 08:22:57 +0100
Message-Id: <20230503072331.1747057-51-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503072331.1747057-1-richard.henderson@linaro.org>
References: <20230503072331.1747057-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x329.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Removes a multiplicty of calls to __assert_fail, saving up
to 360kiB of .text space as measured on an x86_64 host.

Old     New     Less    %Change
9257272	8888680	368592	3.98%	qemu-system-aarch64
6100968	5911832	189136	3.10%	qemu-system-riscv64
5839112	5707032	132080	2.26%	qemu-system-mips
4447608	4341752	105856	2.38%	qemu-system-s390x

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg.h | 30 ++++++++++++++++--------------
 tcg/tcg.c         | 19 +++++++++++++++++++
 2 files changed, 35 insertions(+), 14 deletions(-)

diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index eef509b0a7..64bc7d985d 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -630,13 +630,6 @@ static inline void *tcg_splitwx_to_rw(const void *rx)
 }
 #endif
 
-static inline size_t temp_idx(TCGTemp *ts)
-{
-    ptrdiff_t n = ts - tcg_ctx->temps;
-    tcg_debug_assert(n >= 0 && n < tcg_ctx->nb_temps);
-    return n;
-}
-
 static inline TCGArg temp_arg(TCGTemp *ts)
 {
     return (uintptr_t)ts;
@@ -647,16 +640,25 @@ static inline TCGTemp *arg_temp(TCGArg a)
     return (TCGTemp *)(uintptr_t)a;
 }
 
-/* Using the offset of a temporary, relative to TCGContext, rather than
-   its index means that we don't use 0.  That leaves offset 0 free for
-   a NULL representation without having to leave index 0 unused.  */
+#ifdef CONFIG_DEBUG_TCG
+size_t temp_idx(TCGTemp *ts);
+TCGTemp *tcgv_i32_temp(TCGv_i32 v);
+#else
+static inline size_t temp_idx(TCGTemp *ts)
+{
+    return ts - tcg_ctx->temps;
+}
+
+/*
+ * Using the offset of a temporary, relative to TCGContext, rather than
+ * its index means that we don't use 0.  That leaves offset 0 free for
+ * a NULL representation without having to leave index 0 unused.
+ */
 static inline TCGTemp *tcgv_i32_temp(TCGv_i32 v)
 {
-    uintptr_t o = (uintptr_t)v;
-    TCGTemp *t = (void *)tcg_ctx + o;
-    tcg_debug_assert(offsetof(TCGContext, temps[temp_idx(t)]) == o);
-    return t;
+    return (void *)tcg_ctx + (uintptr_t)v;
 }
+#endif
 
 static inline TCGTemp *tcgv_i64_temp(TCGv_i64 v)
 {
diff --git a/tcg/tcg.c b/tcg/tcg.c
index be903d499b..3eb0903445 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -1705,6 +1705,25 @@ TCGv_vec tcg_constant_vec_matching(TCGv_vec match, unsigned vece, int64_t val)
     return tcg_constant_vec(t->base_type, vece, val);
 }
 
+#ifdef CONFIG_DEBUG_TCG
+size_t temp_idx(TCGTemp *ts)
+{
+    ptrdiff_t n = ts - tcg_ctx->temps;
+    assert(n >= 0 && n < tcg_ctx->nb_temps);
+    return n;
+}
+
+TCGTemp *tcgv_i32_temp(TCGv_i32 v)
+{
+    uintptr_t o = (uintptr_t)v - offsetof(TCGContext, temps);
+
+    assert(o < sizeof(TCGTemp) * tcg_ctx->nb_temps);
+    assert(o % sizeof(TCGTemp) == 0);
+
+    return (void *)tcg_ctx + (uintptr_t)v;
+}
+#endif /* CONFIG_DEBUG_TCG */
+
 /* Return true if OP may appear in the opcode stream.
    Test the runtime variable that controls each opcode.  */
 bool tcg_op_supported(TCGOpcode op)
-- 
2.34.1


