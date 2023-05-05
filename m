Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C01A6F8AFC
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 23:28:30 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pv2vA-0000c5-Nu; Fri, 05 May 2023 17:24:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pv2v8-0000aY-I2
 for qemu-devel@nongnu.org; Fri, 05 May 2023 17:24:54 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pv2v6-0004Ni-Jx
 for qemu-devel@nongnu.org; Fri, 05 May 2023 17:24:54 -0400
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-30644c18072so1555776f8f.2
 for <qemu-devel@nongnu.org>; Fri, 05 May 2023 14:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683321890; x=1685913890;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jDjzkdTI/MWyIO68yFYfphv3aGgKEw/onagZANA7ylI=;
 b=Sy+JawUOvpXkrqtoQ/p1KsSZugG75Wg+XQ5C8aaIuR+FugQKWCzZhOCp30nypFp+D6
 Dybg3e2ThFU8T7ijEkinmRXN5GZxhY5SEdXluvlCwFnyRXYEBrjM2lu5ZKBBjBgzjEqQ
 S+h14z+0ON9e5DM56aLlI4xBcCAosck+7SY/SErgdP22vmjMoteIMC9k7GLuDNm3UROj
 KtS3bQJZSADb3wV+0yAxqsCsLsa+jhiKle6uM+c0YUyVVUdQi0VxZ0CJ4vmQ6pkFRzje
 p14ztSyo68lle55BOuqhh6LZGDXSQ6hvPZx0bmTBtPa/NTn3HQ6WjgcZAHBnt1ZEbiKJ
 UQWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683321890; x=1685913890;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jDjzkdTI/MWyIO68yFYfphv3aGgKEw/onagZANA7ylI=;
 b=dqmOdOMVyE/Ajk2nrjev+6ous0S+K7jSc7LGfhhBnw/rbNrHebhvSsyGKOLGvPDkHl
 x2jsI+G68sRldJIu/fYEELZIWgBUk+QLRucFOjoImewwtTPek+Cr3LTGFMh9pMTo7VHj
 qRGzP5DhZ+jYKUG1nmZb0XBQAnphuoiwKRj4qjlIIaNY3NNHq5rB/hmOZgLZUGzaVUXd
 KNz4Ta0wXY2c78va4HL1uObpuTHGfgH2mdR/TeybXpEGryDzZtrm5+kfCarN+2VvAvPE
 QMFeVistYS3Qi0CglwRGNhQjCqlzWlTIpbpMeaqUM1wCUcKjiGDt8bD56hekgCcwk7uf
 tnpg==
X-Gm-Message-State: AC+VfDxOBPKmeK/V2cklGzIjaovGFl35aX0EAvnjUhaw31AKJJWBm1fi
 RGHpjIowmTvsCw8ecseFMb76IMsXzsJKIGwH4FCdWA==
X-Google-Smtp-Source: ACHHUZ55kOmnQAj2yO3iEWXV1bXbw7tv7IsFPwH3vHbQozkqdrgv2NJhFGrN10q/A4tgx0Dh+SewDA==
X-Received: by 2002:adf:f1d1:0:b0:306:30e2:c84c with SMTP id
 z17-20020adff1d1000000b0030630e2c84cmr2285242wro.49.1683321890086; 
 Fri, 05 May 2023 14:24:50 -0700 (PDT)
Received: from stoup.. ([212.241.182.8]) by smtp.gmail.com with ESMTPSA id
 t14-20020a5d460e000000b003047ae72b14sm3426709wrq.82.2023.05.05.14.24.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 May 2023 14:24:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Anton Johansson <anjo@rev.ng>
Subject: [PULL 02/42] target/avr: Finish conversion to tcg_gen_qemu_{ld,st}_*
Date: Fri,  5 May 2023 22:24:07 +0100
Message-Id: <20230505212447.374546-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230505212447.374546-1-richard.henderson@linaro.org>
References: <20230505212447.374546-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x436.google.com
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

Convert away from the old interface with the implicit
MemOp argument.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Anton Johansson <anjo@rev.ng>
Message-Id: <20230502135741.1158035-2-richard.henderson@linaro.org>
---
 target/avr/translate.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/target/avr/translate.c b/target/avr/translate.c
index a6aeae6dfa..cd82f5d591 100644
--- a/target/avr/translate.c
+++ b/target/avr/translate.c
@@ -1492,7 +1492,7 @@ static void gen_data_store(DisasContext *ctx, TCGv data, TCGv addr)
     if (ctx->base.tb->flags & TB_FLAGS_FULL_ACCESS) {
         gen_helper_fullwr(cpu_env, data, addr);
     } else {
-        tcg_gen_qemu_st8(data, addr, MMU_DATA_IDX); /* mem[addr] = data */
+        tcg_gen_qemu_st_tl(data, addr, MMU_DATA_IDX, MO_UB);
     }
 }
 
@@ -1501,7 +1501,7 @@ static void gen_data_load(DisasContext *ctx, TCGv data, TCGv addr)
     if (ctx->base.tb->flags & TB_FLAGS_FULL_ACCESS) {
         gen_helper_fullrd(data, cpu_env, addr);
     } else {
-        tcg_gen_qemu_ld8u(data, addr, MMU_DATA_IDX); /* data = mem[addr] */
+        tcg_gen_qemu_ld_tl(data, addr, MMU_DATA_IDX, MO_UB);
     }
 }
 
@@ -1979,7 +1979,7 @@ static bool trans_LPM1(DisasContext *ctx, arg_LPM1 *a)
 
     tcg_gen_shli_tl(addr, H, 8); /* addr = H:L */
     tcg_gen_or_tl(addr, addr, L);
-    tcg_gen_qemu_ld8u(Rd, addr, MMU_CODE_IDX); /* Rd = mem[addr] */
+    tcg_gen_qemu_ld_tl(Rd, addr, MMU_CODE_IDX, MO_UB);
     return true;
 }
 
@@ -1996,7 +1996,7 @@ static bool trans_LPM2(DisasContext *ctx, arg_LPM2 *a)
 
     tcg_gen_shli_tl(addr, H, 8); /* addr = H:L */
     tcg_gen_or_tl(addr, addr, L);
-    tcg_gen_qemu_ld8u(Rd, addr, MMU_CODE_IDX); /* Rd = mem[addr] */
+    tcg_gen_qemu_ld_tl(Rd, addr, MMU_CODE_IDX, MO_UB);
     return true;
 }
 
@@ -2013,7 +2013,7 @@ static bool trans_LPMX(DisasContext *ctx, arg_LPMX *a)
 
     tcg_gen_shli_tl(addr, H, 8); /* addr = H:L */
     tcg_gen_or_tl(addr, addr, L);
-    tcg_gen_qemu_ld8u(Rd, addr, MMU_CODE_IDX); /* Rd = mem[addr] */
+    tcg_gen_qemu_ld_tl(Rd, addr, MMU_CODE_IDX, MO_UB);
     tcg_gen_addi_tl(addr, addr, 1); /* addr = addr + 1 */
     tcg_gen_andi_tl(L, addr, 0xff);
     tcg_gen_shri_tl(addr, addr, 8);
@@ -2045,7 +2045,7 @@ static bool trans_ELPM1(DisasContext *ctx, arg_ELPM1 *a)
     TCGv Rd = cpu_r[0];
     TCGv addr = gen_get_zaddr();
 
-    tcg_gen_qemu_ld8u(Rd, addr, MMU_CODE_IDX); /* Rd = mem[addr] */
+    tcg_gen_qemu_ld_tl(Rd, addr, MMU_CODE_IDX, MO_UB);
     return true;
 }
 
@@ -2058,7 +2058,7 @@ static bool trans_ELPM2(DisasContext *ctx, arg_ELPM2 *a)
     TCGv Rd = cpu_r[a->rd];
     TCGv addr = gen_get_zaddr();
 
-    tcg_gen_qemu_ld8u(Rd, addr, MMU_CODE_IDX); /* Rd = mem[addr] */
+    tcg_gen_qemu_ld_tl(Rd, addr, MMU_CODE_IDX, MO_UB);
     return true;
 }
 
@@ -2071,7 +2071,7 @@ static bool trans_ELPMX(DisasContext *ctx, arg_ELPMX *a)
     TCGv Rd = cpu_r[a->rd];
     TCGv addr = gen_get_zaddr();
 
-    tcg_gen_qemu_ld8u(Rd, addr, MMU_CODE_IDX); /* Rd = mem[addr] */
+    tcg_gen_qemu_ld_tl(Rd, addr, MMU_CODE_IDX, MO_UB);
     tcg_gen_addi_tl(addr, addr, 1); /* addr = addr + 1 */
     gen_set_zaddr(addr);
     return true;
-- 
2.34.1


