Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8079E3B7898
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 21:28:09 +0200 (CEST)
Received: from localhost ([::1]:43342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyJOy-0004Zt-IU
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 15:28:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyIsw-0007u4-0r
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 14:55:03 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:39678)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyIst-0000qC-5R
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 14:55:01 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 in17-20020a17090b4391b0290170ba0ec7fcso2259633pjb.4
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 11:54:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8bBekJoN92H0aYPF+hL0RhFsQgD+q2xSW84THBsT56U=;
 b=wMnJJn3V0pObWksXLngzsyIuBEmxyvc6yIQhu+duDfnVclXnvbdouEqy51iLbgw0+w
 gTI5E3HBbDuaBymnxv8kX+UhUZ7SGuwA2ggImpLv7h+32YvGoVeSD7I5Jvk/fRVhBpnk
 PDDlQiSYrNj0mGogOcOIXQCj7ieB3mp9Q60cVhzZq4CD9E2xo1w0BuC+OtjolJLQYcNe
 A7aAg71Q3AOCjk1qpRXwQkfdctVP+dFN5sAk33rD9GlmliRJEWFhOcJ/LBEOo0l7S52Z
 C0fz40Kp4fBPXNv6nJh5h6SB+x4KNQix1AxudL6g9xONHAnbYtKOWj7X+G7NOdDIvSdD
 uDXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8bBekJoN92H0aYPF+hL0RhFsQgD+q2xSW84THBsT56U=;
 b=MCzkCSMWjMDSbly42nlssa7Gecm8v5oPqyRicr6GpNevB9QzqIjbaBi8sjXm8pS8X/
 9lbo54owc1QEtCqyS44++0CDrePZZrJ/LKQMtH4ZOPjaAMRVUBQgD1ObIQEIQ7z14ilA
 v1d1lAatbAzQ0fVx5wo8YbDea10gEee0exh11mb2jbDiLtEhUzbVhCgDNm4n3TM7gk21
 s48qOeLAkzbMls0BYFOdUPMQhylwF0Rz+0Ll0Aaa6zjcHqpxg7V3uQ4OVityNJTeHzCm
 Ua1vbAYkUk4RuVzE/7SfoGtvP2YsuziwurXCObX/Jg8Nk9PidHyrR2vAzEILAPvAJs3b
 4Jcg==
X-Gm-Message-State: AOAM532BKfc7KG7Tarie08XRAf8hRfIxUPuh3yGgkTT0451TNxJoBH1m
 aHwqcKp4LS1nmYMAMx9qbjuHIZOyCweQPA==
X-Google-Smtp-Source: ABdhPJxGTjt6gsNRoZwASiVYGSIu4x8wYSwOCdVBDfnXTdQLxNSq5bWVbsH63fZSH/S2VUNA1aMqVA==
X-Received: by 2002:a17:902:6902:b029:106:50e3:b2db with SMTP id
 j2-20020a1709026902b029010650e3b2dbmr28832677plk.35.1624992897325; 
 Tue, 29 Jun 2021 11:54:57 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id j2sm18811253pfb.53.2021.06.29.11.54.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jun 2021 11:54:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 02/63] target/nios2: Use global cpu_env
Date: Tue, 29 Jun 2021 11:53:54 -0700
Message-Id: <20210629185455.3131172-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210629185455.3131172-1-richard.henderson@linaro.org>
References: <20210629185455.3131172-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>
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


