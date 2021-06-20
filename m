Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DFD83ADD3B
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Jun 2021 07:28:55 +0200 (CEST)
Received: from localhost ([::1]:49392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luq0s-0004Ei-Ir
	for lists+qemu-devel@lfdr.de; Sun, 20 Jun 2021 01:28:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lupxu-0006zO-3q
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 01:25:50 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:42953)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lupxr-00085i-7v
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 01:25:49 -0400
Received: by mail-pl1-x62c.google.com with SMTP id v13so6749578ple.9
 for <qemu-devel@nongnu.org>; Sat, 19 Jun 2021 22:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vOSYcR5bhsrCjJ6PbKl43sOwPlBS+THlM2yD0LGuQ1A=;
 b=ybLIjJb1Dpqgv3q28ldpZA3BixuGtLgFsrhUFaN+3fj6fiiaD/QdLVma5sun4yYxFW
 1sU1TsVfJS9HW2qQ6aC/uwZpB/rG6/oTtK8yYCsbWVHcYwCC1utXcANieK5TuWsgKkJN
 p+hZ65p5kUwuL69t+o131WXsfbq7+MlVd5oix210OBZsWUzU3bYKkW1saWHcEH7BPyhj
 QfeWXOs2NrTvVm/Z1NuEeZEw57kuaHtAjypSg9jBVpdfUTlZJ5wDf0f+0eOhrhb1HsrE
 tC6MCvpc1Gjzf+rwhGlvCTtePXqhtFYrD7xUHtBnz+ExL/HLbo3Ara9x0kTZYr2gQOFY
 B73Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vOSYcR5bhsrCjJ6PbKl43sOwPlBS+THlM2yD0LGuQ1A=;
 b=tAU1ebmp1sutAr1JF387hYILIw5Yuv2h+ciB30d35SD9sG1USsdaW1tWr3Mil/OWlu
 EdqNcD0/ZYa7vodsbPealsjrA+JsRZHHs7T2d9rMZJGVgaObedRwnTiRxxfWpWJluE5q
 BZkulRu87PZ8SDc4Xd+to2mGx+qHd2AIS9ELyIgzFkVhrUngo86ui/faTPg103FIGw3L
 jtgWaM2GHz0ew2yzjBTLDaLTdnF2AjFwYGGEiJMHx/wFU9DWGYcdCqNs9wa1WRbLhmSn
 Ut2eL0yAOXOIbb5TjtIejK2El2CpxlBqMDuGPGQSlMt1Vk5iLAFLsYOGmdzumBYYTNsm
 rcKA==
X-Gm-Message-State: AOAM532R8lXACWIMytMsjulUDpVkzAGs4zeNt66q7IyMl8imWo6VGo7D
 JoU/HUHIvM05hLG9CxpFxDAe1YaLuN5VmQ==
X-Google-Smtp-Source: ABdhPJzm4qZURbyTD6T42TIop5j80txW9v/Ovsax6mvWgQlwP2MriwFqP8BWQQK16DjgMxuwhetwcQ==
X-Received: by 2002:a17:902:ab96:b029:117:1f9a:9ad4 with SMTP id
 f22-20020a170902ab96b02901171f9a9ad4mr12062621plr.21.1624166746058; 
 Sat, 19 Jun 2021 22:25:46 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id 21sm11409741pfh.103.2021.06.19.22.25.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Jun 2021 22:25:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/7] target/nios2: Use global cpu_env
Date: Sat, 19 Jun 2021 22:25:38 -0700
Message-Id: <20210620052543.1315091-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210620052543.1315091-1-richard.henderson@linaro.org>
References: <20210620052543.1315091-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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


