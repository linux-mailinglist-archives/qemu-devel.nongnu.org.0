Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E33B1510363
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 18:34:15 +0200 (CEST)
Received: from localhost ([::1]:33144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njO8l-0007vl-1G
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 12:34:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njO5Z-0002vr-My
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 12:30:58 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:43520)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njO5U-0003la-Iz
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 12:30:55 -0400
Received: by mail-pl1-x631.google.com with SMTP id d15so30707356pll.10
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 09:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2HNcB10e1b3D3OclvFOXZv0dsDEHKDzY1ubkZqlSbYM=;
 b=cDLCuArvWStZ5rJPsSbYWHgXpybzZhqssif+aHapW56kBUGCAod6X2ysC3MwmXg4lr
 z+2NjB2WbbMgwI5A4Vxyfnh+1OrwtWApyuIWE5UqzWKueMLKrsLdSCr5nJB+Ks8kNPlZ
 xUhdcUhfE8ptf475fMAr04EKEV9rIC1AhSG5E3wkN/NuiMiEJelerE686lhTetuiOAqy
 4OL6guy4zl7bqtuzzMCv7GbfYkL0YwlSi2ALlWLQ81+Tefq5xcId0fW35GxQXxY1rAUg
 WgVlBJ3EJs2C3vsgJq2u2HKylJzWk+zv0FAIocuUto1X+7LqkvrNtOor3kpcK1MCT92H
 DZqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2HNcB10e1b3D3OclvFOXZv0dsDEHKDzY1ubkZqlSbYM=;
 b=slk79CWcXWiSmfQ43m7N+oQ/o55t8fo40Eax4l6Syrke3lC/lXJVisekTzBF74KZjM
 pj5rrgJTjOra7eBhK//qI8qQIW+kd5t/CBAyot6cz5FozL8ENcl2Zq5gb+oT4fU/zWXK
 PMWnYCgTJ7J7WFK7DJC7qQEvfy27JqqH6dI0Mqsc55sp+rkXr5gzfDzBsT+CZcvxFJ1Q
 LKMzfpp1qEFdQPUY9OSTACgizSclFHVCHtWzkiRo2vclvFSNV8A7mHILd+aziIy3k5WK
 Gdrk0A92A5aM6im5e2C1gwVBnOmmv5OXdujStrLhYkrjmGVcRzCmUe9CS468ad88DaEH
 jSmg==
X-Gm-Message-State: AOAM531XXceS/NUDrlF0D1zqjqEcAQ3lisy8UrY6I34MxwTg/CEDIhHJ
 /ptY2uGscNjjYb5anNGsr328e4Cr6h9jVQ==
X-Google-Smtp-Source: ABdhPJw8mWembtyz4kAdBqGb/N/CnyH/CFbxxTN0A/nwA71DgvWMddYRP7+dpVTRhHutaUNSOalCUQ==
X-Received: by 2002:a17:902:8644:b0:153:9f01:2090 with SMTP id
 y4-20020a170902864400b001539f012090mr23561369plt.101.1650990647987; 
 Tue, 26 Apr 2022 09:30:47 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 y131-20020a626489000000b00505a8f36965sm15655813pfb.184.2022.04.26.09.30.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 09:30:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 03/47] target/arm: Use tcg_constant in gen_exception*
Date: Tue, 26 Apr 2022 09:29:59 -0700
Message-Id: <20220426163043.100432-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220426163043.100432-1-richard.henderson@linaro.org>
References: <20220426163043.100432-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 7b5bfb0889..b0b5e8b26d 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -338,11 +338,8 @@ static void gen_rebuild_hflags(DisasContext *s)
 
 static void gen_exception_internal(int excp)
 {
-    TCGv_i32 tcg_excp = tcg_const_i32(excp);
-
     assert(excp_is_internal(excp));
-    gen_helper_exception_internal(cpu_env, tcg_excp);
-    tcg_temp_free_i32(tcg_excp);
+    gen_helper_exception_internal(cpu_env, tcg_constant_i32(excp));
 }
 
 static void gen_exception_internal_insn(DisasContext *s, uint64_t pc, int excp)
@@ -354,12 +351,8 @@ static void gen_exception_internal_insn(DisasContext *s, uint64_t pc, int excp)
 
 static void gen_exception_bkpt_insn(DisasContext *s, uint32_t syndrome)
 {
-    TCGv_i32 tcg_syn;
-
     gen_a64_set_pc_im(s->pc_curr);
-    tcg_syn = tcg_const_i32(syndrome);
-    gen_helper_exception_bkpt_insn(cpu_env, tcg_syn);
-    tcg_temp_free_i32(tcg_syn);
+    gen_helper_exception_bkpt_insn(cpu_env, tcg_constant_i32(syndrome));
     s->base.is_jmp = DISAS_NORETURN;
 }
 
-- 
2.34.1


