Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBA6E6AB3CD
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 01:42:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYyuD-0004Xq-28; Sun, 05 Mar 2023 19:40:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYytt-0004Ug-4x
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 19:40:25 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYytr-0006hr-AY
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 19:40:24 -0500
Received: by mail-pl1-x629.google.com with SMTP id p6so8576281plf.0
 for <qemu-devel@nongnu.org>; Sun, 05 Mar 2023 16:40:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678063222;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gG2oKG/kLJGas2vlZnz5XZRX0MzlnRR2HnANmQM92r0=;
 b=YSIpKqC0APOEDLQirg71w5eMI5gpOgD0d5kjUbBh+ZdHgI6Ug3pa8oUR8ID/IzZ1h6
 a6NeErCEhZlm1p3bz/GfozCUDkPT63ITbBCYkouQZPQxurPt0JXzzCfbp9BPpP24anFT
 vdZTpHiTZAPvX3Q/q6bYM8OOTY98SJ+WnDAmWK0V1NCybvTTcngOh2rI1Ac35U3Cvw9l
 ZnbwtECs8JRTQ0dEYAmt3b1V8mh0bt4HM6V2VdydciwFNzu/vZQ6aB1de8ICqjL/6Kw/
 16J7/O9bC7zenxtsTRTPv6K4i1AmY1GDliwGlbvtpZQR7SJNH+5cx8kul2EOti8i6mXV
 8CRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678063222;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gG2oKG/kLJGas2vlZnz5XZRX0MzlnRR2HnANmQM92r0=;
 b=j6Ybad2Ai3jejlBPZ84Y1gY1SCv2Hb17zeVnywAXe480nQiV3wdWeQC8LpiyO/9olX
 Vr8pWBLFAHU+qBCaQWXLlG5m90XArFSL3LLtLIC6ulGXoWQd4zFPUVfEgx/AFpGqn4jS
 DyxRHBHRCslwC1CPKJRiw0ruZ5FS/uon5yXuTSRAoN/IOS9KXztO+kjY1RNfi1Giscwn
 YH7hHNQ4aBPcFtKKJo3uK16nWMjIjL+/wg6N+XMxAswq+/2KKwwNiOqzs+dbq07SGje6
 +eHJIHQYuXQh283pCTemlb/iO6KOZuDC8bD9uPxMRGFBG++tp+5M5DJzxEznragRVlvC
 s2UQ==
X-Gm-Message-State: AO0yUKUFAvZCNgXwSjxE0QiKcoBlKMGt5TVidGsJeXAmrJzj9SZDHtWf
 jqL9nW//6syq1hfzblabuDLJF6CMKmK3kdrU5SqWSg==
X-Google-Smtp-Source: AK7set/oxpiAvlpoLMWNoFbhydNrtMZDmT1Xr2oCc20HQN/9To6ggpD6IJvHPanJ3qT769Q8dcaFnQ==
X-Received: by 2002:a17:90b:3b4f:b0:237:5dc6:ce14 with SMTP id
 ot15-20020a17090b3b4f00b002375dc6ce14mr9492354pjb.7.1678063221727; 
 Sun, 05 Mar 2023 16:40:21 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:87cc:49bb:2900:c08b])
 by smtp.gmail.com with ESMTPSA id
 r13-20020a17090b050d00b002372106a5c2sm6567901pjz.37.2023.03.05.16.40.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Mar 2023 16:40:21 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org
Subject: [PULL 29/84] target/avr: Drop DisasContext.free_skip_var0
Date: Sun,  5 Mar 2023 16:38:59 -0800
Message-Id: <20230306003954.1866998-30-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230306003954.1866998-1-richard.henderson@linaro.org>
References: <20230306003954.1866998-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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

Translators are no longer required to free tcg temporaries,
therefore there's no need to record for later freeing.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/avr/translate.c | 19 -------------------
 1 file changed, 19 deletions(-)

diff --git a/target/avr/translate.c b/target/avr/translate.c
index e40d8e9681..e7f0e2bbe3 100644
--- a/target/avr/translate.c
+++ b/target/avr/translate.c
@@ -107,11 +107,6 @@ struct DisasContext {
      *     tcg_gen_brcond_tl(skip_cond, skip_var0, skip_var1, skip_label);
      * }
      *
-     * if (free_skip_var0) {
-     *     tcg_temp_free(skip_var0);
-     *     free_skip_var0 = false;
-     * }
-     *
      * translate(ctx);
      *
      * if (skip_label) {
@@ -121,7 +116,6 @@ struct DisasContext {
     TCGv skip_var0;
     TCGv skip_var1;
     TCGCond skip_cond;
-    bool free_skip_var0;
 };
 
 void avr_cpu_tcg_init(void)
@@ -1375,7 +1369,6 @@ static bool trans_SBRC(DisasContext *ctx, arg_SBRC *a)
 
     ctx->skip_cond = TCG_COND_EQ;
     ctx->skip_var0 = tcg_temp_new();
-    ctx->free_skip_var0 = true;
 
     tcg_gen_andi_tl(ctx->skip_var0, Rr, 1 << a->bit);
     return true;
@@ -1391,7 +1384,6 @@ static bool trans_SBRS(DisasContext *ctx, arg_SBRS *a)
 
     ctx->skip_cond = TCG_COND_NE;
     ctx->skip_var0 = tcg_temp_new();
-    ctx->free_skip_var0 = true;
 
     tcg_gen_andi_tl(ctx->skip_var0, Rr, 1 << a->bit);
     return true;
@@ -1410,7 +1402,6 @@ static bool trans_SBIC(DisasContext *ctx, arg_SBIC *a)
     tcg_gen_andi_tl(temp, temp, 1 << a->bit);
     ctx->skip_cond = TCG_COND_EQ;
     ctx->skip_var0 = temp;
-    ctx->free_skip_var0 = true;
 
     return true;
 }
@@ -1428,7 +1419,6 @@ static bool trans_SBIS(DisasContext *ctx, arg_SBIS *a)
     tcg_gen_andi_tl(temp, temp, 1 << a->bit);
     ctx->skip_cond = TCG_COND_NE;
     ctx->skip_var0 = temp;
-    ctx->free_skip_var0 = true;
 
     return true;
 }
@@ -2886,10 +2876,6 @@ static bool canonicalize_skip(DisasContext *ctx)
         ctx->skip_cond = TCG_COND_NE;
         break;
     }
-    if (ctx->free_skip_var0) {
-        tcg_temp_free(ctx->skip_var0);
-        ctx->free_skip_var0 = false;
-    }
     ctx->skip_var0 = cpu_skip;
     return true;
 }
@@ -2944,7 +2930,6 @@ static void avr_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
              * This ensures that cpu_skip is non-zero after the label
              * if and only if the skipped insn itself sets a skip.
              */
-            ctx->free_skip_var0 = true;
             ctx->skip_var0 = tcg_temp_new();
             tcg_gen_mov_tl(ctx->skip_var0, cpu_skip);
             tcg_gen_movi_tl(cpu_skip, 0);
@@ -2956,10 +2941,6 @@ static void avr_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
                               ctx->skip_var1, skip_label);
             ctx->skip_var1 = NULL;
         }
-        if (ctx->free_skip_var0) {
-            tcg_temp_free(ctx->skip_var0);
-            ctx->free_skip_var0 = false;
-        }
         ctx->skip_cond = TCG_COND_NEVER;
         ctx->skip_var0 = NULL;
     }
-- 
2.34.1


