Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A05F5366F0
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 20:31:15 +0200 (CEST)
Received: from localhost ([::1]:44774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuejy-0007Xo-Kj
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 14:31:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueYM-00064e-56
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:19:14 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:34690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueYJ-0003Uj-AP
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:19:13 -0400
Received: by mail-pg1-x530.google.com with SMTP id g184so4598017pgc.1
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 11:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wBj7wD3EZwBWZdMnSujfJ9Rscn9pYSbetKjmngE0EI0=;
 b=KKhQyTYk7oOAnVdOWH2xjCFQSvPF3r1o5aN3opKENtqop7BSpgdqFuhydaV+Cchy5J
 y4Lutf+fi5fMK1kgw2XTJwO8A42vKNyRh3bFIMAfC89rrkHGxCJI0pbHjBsr0wDQnJI4
 /w6bWZ5MCtyzcnM1hg0gf+41Uu5VFHU0YuYNEQQjtslE7NA5N9PVkck/KhOdfyr0cQoi
 pVYsYbbzHR2qH1Wmxaw68OhP4vEDCZ280nnq8sLHF3E1SjYAAe2O3CF1BUAsrOu1NzbS
 Bj26aRalW4EYv3uB9i4eUp2cTjFstjL1eoSOKvXsKkwCmbkSc+7kahYrL+IRRc0irVIX
 C0Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wBj7wD3EZwBWZdMnSujfJ9Rscn9pYSbetKjmngE0EI0=;
 b=dynpZ1IgR6E+qBw1/hsCBVag2oIEZBOyz5D9gS7TBMeyO1psTor5ZvYmFg7QqMYhjJ
 iFjSUK+4Jf/JZNuEOVfMOFOJk5ixWfelwcXtPffMUenr5urQ/Tp5GuOIHNcBJHMQNOJ/
 5Mnk9O1MJ46L92cPAyPLZ40FYQYo+v419fsDl3Or2x/R3nvrqYL0mGRch5oRBwhK0h7L
 hblM9Z7MXhWZUvxK5OhjVfshiCm7VpihyfvE+y4kTwvM8Sz01wyVJZfyZLpjTL5sSqrl
 uqxkszEIvIPZc3mtU2NDp+yTOEqXyfNB2r2++DWYz/6aq1s2nkmDhZ6YSX7rc+Eg22Gm
 R/fw==
X-Gm-Message-State: AOAM5331F3mXry9Jhmf0FBt7g+7owhwbBEQ4qW20X2/g5icEZ2xx9prJ
 po1W4maZWIuY0hKSidg9tD3OHH4iny+BYg==
X-Google-Smtp-Source: ABdhPJz+0q7R4w4WGenvDn7mKLVGpj5Ai4H5pThoRWHLL8PqYVtBEetAUJvvWI6YfD7MrKuPGjVUhQ==
X-Received: by 2002:a05:6a00:1a44:b0:510:a043:3b09 with SMTP id
 h4-20020a056a001a4400b00510a0433b09mr44687177pfv.62.1653675549968; 
 Fri, 27 May 2022 11:19:09 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 t5-20020a17090ae50500b001deb3cbd8f1sm1911612pjy.27.2022.05.27.11.19.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:19:09 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 001/114] target/arm: Introduce TRANS, TRANS_FEAT
Date: Fri, 27 May 2022 11:17:14 -0700
Message-Id: <20220527181907.189259-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527181907.189259-1-richard.henderson@linaro.org>
References: <20220527181907.189259-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
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

Steal the idea for these leaf function expanders from PowerPC.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/target/arm/translate.h b/target/arm/translate.h
index 6f0ebdc88e..9f0bb270c5 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -576,4 +576,15 @@ static inline MemOp finalize_memop(DisasContext *s, MemOp opc)
  */
 uint64_t asimd_imm_const(uint32_t imm, int cmode, int op);
 
+/*
+ * Helpers for implementing sets of trans_* functions.
+ * Defer the implementation of NAME to FUNC, with optional extra arguments.
+ */
+#define TRANS(NAME, FUNC, ...) \
+    static bool trans_##NAME(DisasContext *s, arg_##NAME *a) \
+    { return FUNC(s, __VA_ARGS__); }
+#define TRANS_FEAT(NAME, FEAT, FUNC, ...) \
+    static bool trans_##NAME(DisasContext *s, arg_##NAME *a) \
+    { return dc_isar_feature(FEAT, s) && FUNC(s, __VA_ARGS__); }
+
 #endif /* TARGET_ARM_TRANSLATE_H */
-- 
2.34.1


