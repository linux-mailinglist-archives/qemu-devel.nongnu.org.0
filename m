Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28CB33F0C2D
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 21:57:17 +0200 (CEST)
Received: from localhost ([::1]:39854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGRga-0004Vl-6X
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 15:57:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGR6b-0000xl-Vf
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 15:20:06 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:37542)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGR6Z-0000KS-Sm
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 15:20:05 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 cp15-20020a17090afb8fb029017891959dcbso9626676pjb.2
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 12:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+nSj7OTbfA5ZP9C2nrakzWmaQ+ciQS/xl93YDyaz/3Q=;
 b=SyJnafEuvMEaDhNFVtV7MhW8H34mqBCHGEZRqLf/++Nnm7sgYRw1qiGpAgx4OcaDBV
 CHhCe+zGbDEs3fS6yc3SZ2mLQ9CJvCtX9thwzG2tvhUMxdhPe0xy69w3zFqyRkzsT+af
 FrMOCAQQXeAlsjJeRfVYvatHTx7MJNxXR/pcyTnPFm09orwK/wUJugVaecGtjljZdojh
 l3wZOp6B7c0MkJOTLpS/2yWW7pWRnWHTICFaMaRe8Wp87w6a8AKxKG2JPINDMhKb8RpF
 Zhr3JYiVoKl+1bfUsfsVZHgYoYVHGL80WSyFx5BtriS30EC8S5t5KR3uPl+JJ0voG7q9
 5VBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+nSj7OTbfA5ZP9C2nrakzWmaQ+ciQS/xl93YDyaz/3Q=;
 b=kAYjLGf13rzpIxOPNz4wh5nBsFDp23+aqW+B7uFf0cXi8DoGILlRZAvx/c75w+KhNG
 Ynkm/pkPSt4Xp9Pzkab8N50mCKI+zW2P3ndLJVbeGG0QsaEgKonAYPtV4KSxpMP1PCrw
 INxSCwRx8WjZByTAaykRdKM45NNbFgLGDDZoaXRk2ktKKgI9HXhtLJu0UFPKwcgjHMKl
 y58z9PPkMqS1ZgOYYPg0dqofj4tUGrywxH9OjRkucV3/adBTmN2okGmyjG/gUaXl3FTS
 pVzWRPlPkCQGEOIsNv+leyTTE1WH7A0Ng3mUibbatLGnTH/9S606MfaKOkD7zpwMVI0d
 1J6g==
X-Gm-Message-State: AOAM531XTJnQ4pZ2sRVAmRuGN9pvuBsfCUkd+cYeRw9Ncx6DCj/uA5hd
 Utky5BGD6FPalWO/H55suhBkBhORbMzlDQ==
X-Google-Smtp-Source: ABdhPJycTPVLt77/FwBZysVEZugpQIJBhH03SPKsObuGPJ1jTpEjzhYeNvVW8GgACOTnQeygN6f2Cg==
X-Received: by 2002:a17:902:e291:b0:12d:9d9b:7e5b with SMTP id
 o17-20020a170902e29100b0012d9d9b7e5bmr8441690plc.4.1629314401767; 
 Wed, 18 Aug 2021 12:20:01 -0700 (PDT)
Received: from localhost.localdomain ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id a6sm524108pjs.40.2021.08.18.12.20.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 12:20:01 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 32/66] target/ppc: Use MO_128 for 16 byte atomics
Date: Wed, 18 Aug 2021 09:18:46 -1000
Message-Id: <20210818191920.390759-33-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210818191920.390759-1-richard.henderson@linaro.org>
References: <20210818191920.390759-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc: qemu-ppc@nongnu.org
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/translate.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 171b216e17..540efa858f 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -3461,10 +3461,12 @@ static void gen_std(DisasContext *ctx)
             if (HAVE_ATOMIC128) {
                 TCGv_i32 oi = tcg_temp_new_i32();
                 if (ctx->le_mode) {
-                    tcg_gen_movi_i32(oi, make_memop_idx(MO_LEQ, ctx->mem_idx));
+                    tcg_gen_movi_i32(oi, make_memop_idx(MO_LE | MO_128,
+                                                        ctx->mem_idx));
                     gen_helper_stq_le_parallel(cpu_env, EA, lo, hi, oi);
                 } else {
-                    tcg_gen_movi_i32(oi, make_memop_idx(MO_BEQ, ctx->mem_idx));
+                    tcg_gen_movi_i32(oi, make_memop_idx(MO_BE | MO_128,
+                                                        ctx->mem_idx));
                     gen_helper_stq_be_parallel(cpu_env, EA, lo, hi, oi);
                 }
                 tcg_temp_free_i32(oi);
@@ -4066,11 +4068,11 @@ static void gen_lqarx(DisasContext *ctx)
         if (HAVE_ATOMIC128) {
             TCGv_i32 oi = tcg_temp_new_i32();
             if (ctx->le_mode) {
-                tcg_gen_movi_i32(oi, make_memop_idx(MO_LEQ | MO_ALIGN_16,
+                tcg_gen_movi_i32(oi, make_memop_idx(MO_LE | MO_128 | MO_ALIGN,
                                                     ctx->mem_idx));
                 gen_helper_lq_le_parallel(lo, cpu_env, EA, oi);
             } else {
-                tcg_gen_movi_i32(oi, make_memop_idx(MO_BEQ | MO_ALIGN_16,
+                tcg_gen_movi_i32(oi, make_memop_idx(MO_BE | MO_128 | MO_ALIGN,
                                                     ctx->mem_idx));
                 gen_helper_lq_be_parallel(lo, cpu_env, EA, oi);
             }
@@ -4121,7 +4123,7 @@ static void gen_stqcx_(DisasContext *ctx)
 
     if (tb_cflags(ctx->base.tb) & CF_PARALLEL) {
         if (HAVE_CMPXCHG128) {
-            TCGv_i32 oi = tcg_const_i32(DEF_MEMOP(MO_Q) | MO_ALIGN_16);
+            TCGv_i32 oi = tcg_const_i32(DEF_MEMOP(MO_128) | MO_ALIGN);
             if (ctx->le_mode) {
                 gen_helper_stqcx_le_parallel(cpu_crf[0], cpu_env,
                                              EA, lo, hi, oi);
-- 
2.25.1


