Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D58F3AE0DB
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 00:16:47 +0200 (CEST)
Received: from localhost ([::1]:39050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lv5kD-0003Ft-Tw
	for lists+qemu-devel@lfdr.de; Sun, 20 Jun 2021 18:16:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lv5eX-0001Z3-Nk
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 18:10:53 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:40667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lv5eT-0007qx-SL
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 18:10:53 -0400
Received: by mail-pl1-x635.google.com with SMTP id m17so4303711plx.7
 for <qemu-devel@nongnu.org>; Sun, 20 Jun 2021 15:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vOSYcR5bhsrCjJ6PbKl43sOwPlBS+THlM2yD0LGuQ1A=;
 b=ksDyy6L1svmn0A53RK+Vj788pHYOCKIAP5A6a+J9eMrtH8wIy+5dDi0RNT1+J2JEbM
 ncpxXkoObVCw6TbiQsHrBuQvjdMuyETJpHliG8o11WAkzIRFBoH97iLgworclCvqVqBO
 nA+BdZsKYkEzg7GaWMSN++5uQw8wF4azuMj8OKbRiOFtrd5n5Deg5iMtKEOdNkOUHVJc
 bsOUX8FOxprCFi0leOT2itgURl1oDrRDSN9MVWJvnhUvMFLhQYjK7wLvg6CdxnodK3vT
 YEZlFHgGl5uyHA8skf6Ev/Z1+ztuIwPokTqHzYtmbG2BV+yT86Sc11yCqLB7YqaAAXcC
 4vtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vOSYcR5bhsrCjJ6PbKl43sOwPlBS+THlM2yD0LGuQ1A=;
 b=SSFs28pXAnN110Wn+X1yeG0nRbvIe1VP6GfribFy18RZoB9lyt6YCbjgl3FoC02NQo
 SyG/yZTonXmAf7Rw8DE1SM/1yu3Ck3UlAEcM9QsqoyYCjSCMKsbE5eF4rqrYbTBIS/h/
 RKL/21tQ3LZb+iN5ddtACE+24WqOUVGDc+iMb5bQEebs8Ey2NgJcUdUzAe6ddp1tylJg
 CuQ8okvQehm+KBBzC0XJDehlh+ZGD9Vl348xwvvl/k6FaFISjhMYzfY8TwvVKXyRVbaI
 dRSkPvglhhhmXS2AVogbtq+/ipK8+CGgJsHddkLSmZwt4ufIqTdNo4Et7LxyIefZmzPK
 GuTA==
X-Gm-Message-State: AOAM531XlmMDzoeUGXCAwpSiRqk3ALP+VkhiKUrdLmGVocuUIEs55hPZ
 26Mkb1nG0ip/e0Bwge7vLVuIjXMbFvdOgw==
X-Google-Smtp-Source: ABdhPJwpcwa5JgMbUGiNrrpDuAN543tN0eCcaIVFGkDqptm9lec3+2QTodWvjecEIGhKLuTS1YdOXQ==
X-Received: by 2002:a17:90b:4b91:: with SMTP id
 lr17mr9570714pjb.69.1624227048632; 
 Sun, 20 Jun 2021 15:10:48 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id 135sm11122961pgf.20.2021.06.20.15.10.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Jun 2021 15:10:48 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/7] target/nios2: Use global cpu_env
Date: Sun, 20 Jun 2021 15:10:41 -0700
Message-Id: <20210620221046.1526418-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210620221046.1526418-1-richard.henderson@linaro.org>
References: <20210620221046.1526418-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
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
Cc: marex@denx.de, crwulff@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We do not need to copy this into DisasContext.

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


