Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 663DB3B6AD8
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 00:10:36 +0200 (CEST)
Received: from localhost ([::1]:46708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxzSd-0003nu-FN
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 18:10:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lxzQU-000114-Sg
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 18:08:24 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:41903)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lxzQM-0006H2-0O
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 18:08:22 -0400
Received: by mail-pl1-x62a.google.com with SMTP id z4so435606plg.8
 for <qemu-devel@nongnu.org>; Mon, 28 Jun 2021 15:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8bBekJoN92H0aYPF+hL0RhFsQgD+q2xSW84THBsT56U=;
 b=tu0bFAk63j/JYbN3rNBI6Akes4EfykXJ72JCgHlHZJBUtBsifxSVQzfRjoXaYzPR8F
 0+af/nJ2Qx64Nxc2hiO1omdHeE4cfswdP0C5UqoVyEiXpcmAIiEVwBzVypDSwLKlUTKI
 Qbkx0Dyr3nwcHPWbv9cj0RdXlRTA1AuX0P57UNbZ23VbThf1OhaHVPf2Noykv06mPzjY
 5kE+RK/74dCu7Dj7C0R536tAyKoffvor7awA1t9NnEHiBTxfzJsLPIZjxmabWBek/KJr
 OKf0uZJcbai8RMFZ6xUl9pWP8bibjixCu0aH4GNJ6hFkzVXRURWaZbbIAw5ogweZcnSw
 JYnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8bBekJoN92H0aYPF+hL0RhFsQgD+q2xSW84THBsT56U=;
 b=FU0c6ETFp/GZSvr8yZQwI9Il5mr751Pa5kjQytPuYRIlkVBkvzvUr0hH0IK0FS6v1i
 Acm6NdyHQ5fmmjFnzGOJswJpUbcSbjm/QIVPXdn9L5PepKN2jYEQDJ0inJNCJp6sHzdl
 Od4XRFbm3zFmZxhIecwDko9W1CZ4zIf+xqAIm1AVWWEvwWNvoaVxxRJwEGajyCX0EFDa
 gpumD0f7P47H94ejRcirXsfgiJGLHYb9NXqBtBAm0Jg25hH+TCYgs6S2jF7MVz6vE2t0
 7g+Xc5vGaUOZTno7YFfKzthCrbX/AFNcu388I40xEFTYnLqIFyYIOGbvh0dUPfjptIei
 /UDA==
X-Gm-Message-State: AOAM532n90KNoa5bT4cbgfX9wMxNHrrffowJgKvuLWICjGdLBYy1AQn/
 7/0PRIuZjdRMLDuKsxO3eMMhN6o+KUmuRg==
X-Google-Smtp-Source: ABdhPJwOhD/R+oqrVkYs/u8HGWbgONd4JzHefW7PSvl7W8F2WxHdLPBXV7iisy4YNqRoNKQN77wTaA==
X-Received: by 2002:a17:902:bb83:b029:120:512b:86c0 with SMTP id
 m3-20020a170902bb83b0290120512b86c0mr24485855pls.32.1624918092612; 
 Mon, 28 Jun 2021 15:08:12 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id l6sm16030164pgh.34.2021.06.28.15.08.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Jun 2021 15:08:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 2/9] target/nios2: Use global cpu_env
Date: Mon, 28 Jun 2021 15:08:03 -0700
Message-Id: <20210628220810.2919600-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210628220810.2919600-1-richard.henderson@linaro.org>
References: <20210628220810.2919600-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: marex@denx.de, Peter Maydell <peter.maydell@linaro.org>, crwulff@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We do not need to copy this into DisasContext.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/translate.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index 388fae93a2..39538e1870 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -97,7 +97,6 @@
     }
 
 typedef struct DisasContext {
-    TCGv_ptr          cpu_env;
     TCGv             *cpu_R;
     TCGv_i32          zero;
     int               is_jmp;
@@ -147,7 +146,7 @@ static void t_gen_helper_raise_exception(DisasContext *dc,
     TCGv_i32 tmp = tcg_const_i32(index);
 
     tcg_gen_movi_tl(dc->cpu_R[R_PC], dc->pc);
-    gen_helper_raise_exception(dc->cpu_env, tmp);
+    gen_helper_raise_exception(cpu_env, tmp);
     tcg_temp_free_i32(tmp);
     dc->is_jmp = DISAS_NORETURN;
 }
@@ -474,7 +473,7 @@ static void rdctl(DisasContext *dc, uint32_t code, uint32_t flags)
             tcg_gen_mov_tl(dc->cpu_R[instr.c], dc->cpu_R[instr.imm5 + CR_BASE]);
 #ifdef DEBUG_MMU
             TCGv_i32 tmp = tcg_const_i32(instr.imm5 + CR_BASE);
-            gen_helper_mmu_read_debug(dc->cpu_R[instr.c], dc->cpu_env, tmp);
+            gen_helper_mmu_read_debug(dc->cpu_R[instr.c], cpu_env, tmp);
             tcg_temp_free_i32(tmp);
 #endif
         }
@@ -504,7 +503,7 @@ static void wrctl(DisasContext *dc, uint32_t code, uint32_t flags)
     {
 #if !defined(CONFIG_USER_ONLY)
         TCGv_i32 tmp = tcg_const_i32(instr.imm5 + CR_BASE);
-        gen_helper_mmu_write(dc->cpu_env, tmp, load_gpr(dc, instr.a));
+        gen_helper_mmu_write(cpu_env, tmp, load_gpr(dc, instr.a));
         tcg_temp_free_i32(tmp);
 #endif
         break;
@@ -521,7 +520,7 @@ static void wrctl(DisasContext *dc, uint32_t code, uint32_t flags)
         if (tb_cflags(dc->tb) & CF_USE_ICOUNT) {
             gen_io_start();
         }
-        gen_helper_check_interrupts(dc->cpu_env);
+        gen_helper_check_interrupts(cpu_env);
         dc->is_jmp = DISAS_UPDATE;
     }
 #endif
@@ -817,7 +816,6 @@ void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns)
     int num_insns;
 
     /* Initialize DC */
-    dc->cpu_env = cpu_env;
     dc->cpu_R   = cpu_R;
     dc->is_jmp  = DISAS_NEXT;
     dc->pc      = tb->pc;
-- 
2.25.1


