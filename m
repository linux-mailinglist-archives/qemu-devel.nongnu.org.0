Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F90C6A2805
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Feb 2023 10:01:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVqQF-0001Vf-23; Sat, 25 Feb 2023 04:00:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqPo-0000il-Om
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 04:00:24 -0500
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqPn-000563-2L
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 04:00:24 -0500
Received: by mail-pg1-x529.google.com with SMTP id 130so918693pgg.3
 for <qemu-devel@nongnu.org>; Sat, 25 Feb 2023 01:00:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YhL2WzjGmls46D+quq34ze/ulksmGA+cQwYE9pUognw=;
 b=U4pTq6vxCP6zcKw4gcQiaxpzLlQU13mHUQjvgluIiae1ly45yWuYQdwCfxIJBreKon
 cCkd4zyx6YYv74wA8fxeeR/McRxht6wQWY+WcAonRfIZapX+aeHbJhQ6YdnfOFl1v9oF
 6/uqpoC6YGIEs6ohndFLqDEfCjaja3l/NnBgswEImJFfrCHG4jXJdj0DDkFwMoZuZAnE
 T5+trmPFc9ozDPfK69cWzAwJOboT/f0cwrU0E8f2UimSIV7K0kQ6D52vo3j4wW8Zsx0L
 JZUbF1ozUWgdB2KD9u/QqBjKdsmsdwGvMLMUi8ztgs/8xBksuNmdz1F+NLjY8Q69YRdg
 WymQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YhL2WzjGmls46D+quq34ze/ulksmGA+cQwYE9pUognw=;
 b=MFkuZDqcmDXlwdkrF/lpFL2x8O8UcVgK0b8DX7Lq7hvihzGdZ20D7FEemDHMLjKgsG
 cdUIHKzU8h7tnozISly68feURuzrjA0odzyWG2vk5dvXMj2/KMOC/dp9SefdXCuIsoAX
 o6/IO+HOVHHjHCPDbG9nKMMlLfi7nJTlIY5EeCAd2NN0Ch5UpR/OO/axjhxzaVJWE1UT
 w4Fb/Mdag07xTjK4FFGUO92+4anKO3ZLrYMlKilHALthRwVVOvtHFquJNdxLc5I4MdKy
 S5NvftnKJA2dM8u8msuWWpR29Wd58NRi45Qfz/ERubk4ntBpvZvJn/gicO1Mouyqx1N1
 wVEA==
X-Gm-Message-State: AO0yUKVfvVry6a2AtWicXxYvEmOuIviI1ZT5vrSP/5WAgymjEA7uZ7oK
 wrKC0VKSd/fU1wNFnUeuhUByve1JULiPKKSBjT4=
X-Google-Smtp-Source: AK7set+WEya50kwZeZZ3c2h7IjBu2PtM6ZXmUg8NgTLTUb9ATYmwXOMJQ+OZnrqlqBMdYWEIHtGIRw==
X-Received: by 2002:a05:6a00:f95:b0:5a8:d3d9:e03a with SMTP id
 ct21-20020a056a000f9500b005a8d3d9e03amr2585856pfb.0.1677315620205; 
 Sat, 25 Feb 2023 01:00:20 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 s17-20020a639251000000b00502ecb91940sm715546pgn.55.2023.02.25.01.00.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Feb 2023 01:00:19 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 21/30] target/cris: Don't use tcg_temp_local_new
Date: Fri, 24 Feb 2023 22:59:36 -1000
Message-Id: <20230225085945.1798188-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230225085945.1798188-1-richard.henderson@linaro.org>
References: <20230225085945.1798188-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Since tcg_temp_new is now identical, use that.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/cris/translate.c         |  6 +++---
 target/cris/translate_v10.c.inc | 10 +++++-----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/target/cris/translate.c b/target/cris/translate.c
index 905d01288e..a959b27373 100644
--- a/target/cris/translate.c
+++ b/target/cris/translate.c
@@ -1621,7 +1621,7 @@ static int dec_bound_r(CPUCRISState *env, DisasContext *dc)
     LOG_DIS("bound.%c $r%u, $r%u\n",
             memsize_char(size), dc->op1, dc->op2);
     cris_cc_mask(dc, CC_MASK_NZ);
-    l0 = tcg_temp_local_new();
+    l0 = tcg_temp_new();
     dec_prep_move_r(dc, dc->op1, dc->op2, size, 0, l0);
     cris_alu(dc, CC_OP_BOUND, cpu_R[dc->op2], cpu_R[dc->op2], l0, 4);
     tcg_temp_free(l0);
@@ -2404,8 +2404,8 @@ static int dec_bound_m(CPUCRISState *env, DisasContext *dc)
             dc->op1, dc->postinc ? "+]" : "]",
             dc->op2);
 
-    l[0] = tcg_temp_local_new();
-    l[1] = tcg_temp_local_new();
+    l[0] = tcg_temp_new();
+    l[1] = tcg_temp_new();
         insn_len = dec_prep_alu_m(env, dc, 0, memsize, l[0], l[1]);
     cris_cc_mask(dc, CC_MASK_NZ);
     cris_alu(dc, CC_OP_BOUND, cpu_R[dc->op2], l[0], l[1], 4);
diff --git a/target/cris/translate_v10.c.inc b/target/cris/translate_v10.c.inc
index f500e93447..9660f28584 100644
--- a/target/cris/translate_v10.c.inc
+++ b/target/cris/translate_v10.c.inc
@@ -68,9 +68,9 @@ static void gen_store_v10_conditional(DisasContext *dc, TCGv addr, TCGv val,
                        unsigned int size, int mem_index)
 {
     TCGLabel *l1 = gen_new_label();
-    TCGv taddr = tcg_temp_local_new();
-    TCGv tval = tcg_temp_local_new();
-    TCGv t1 = tcg_temp_local_new();
+    TCGv taddr = tcg_temp_new();
+    TCGv tval = tcg_temp_new();
+    TCGv t1 = tcg_temp_new();
     dc->postinc = 0;
     cris_evaluate_flags(dc);
 
@@ -434,7 +434,7 @@ static void dec10_reg_bound(DisasContext *dc, int size)
 {
     TCGv t;
 
-    t = tcg_temp_local_new();
+    t = tcg_temp_new();
     t_gen_zext(t, cpu_R[dc->src], size);
     cris_alu(dc, CC_OP_BOUND, cpu_R[dc->dst], cpu_R[dc->dst], t, 4);
     tcg_temp_free(t);
@@ -935,7 +935,7 @@ static int dec10_ind_bound(CPUCRISState *env, DisasContext *dc,
     int rd = dc->dst;
     TCGv t;
 
-    t = tcg_temp_local_new();
+    t = tcg_temp_new();
     insn_len += dec10_prep_move_m(env, dc, 0, size, t);
     cris_alu(dc, CC_OP_BOUND, cpu_R[dc->dst], cpu_R[rd], t, 4);
     if (dc->dst == 15) {
-- 
2.34.1


