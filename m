Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 156EF42A960
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 18:27:27 +0200 (CEST)
Received: from localhost ([::1]:59066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maKcg-00064l-14
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 12:27:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maKXh-0006ZB-Pq
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 12:22:17 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:39741)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maKXe-00047O-4M
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 12:22:17 -0400
Received: by mail-pl1-x635.google.com with SMTP id c4so13873247pls.6
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 09:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RZhqGge9vu+6Bc5Ne+L+64OR4mcrgGsrXPqV5KkLFEY=;
 b=qoflFB00Kmd4hh29Hpa2RQDAgTvIBVC2FRsSJAam2z8R2rB5tdbguf1wsCS1GQ72xW
 iAzfzHPllAUSX+5yNh6L4gHHttJ6Y8y1qV/TN+VVifSPiZUDNo7Uxj5dEzD+tLKCr3Br
 yyFSiGjjuwCcrm1J3am+jo/0O1FuYfT01g5g730mhrCnqPbd71xylEtd5z6M2OdNfAT1
 h2whYIb2Vc7VDrjGJZgeTwXcUlEWAiTjY5t54yxSqmuX5zBqtkLOZzqQHvPl5zgTU123
 WQRR1mSCSzyrWamfBMcU82vUAlWKh+Vna/k5DbqnbR0wGCcxFQQV1Tjt+y//eT8TqqfQ
 woqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RZhqGge9vu+6Bc5Ne+L+64OR4mcrgGsrXPqV5KkLFEY=;
 b=ilDZj9OUrp//l3t6StIbaW3YIcjPan6TFbyr4G5R4VnGeYs+FK3U9K5/1BZXTsXZPM
 76gExJst74u5nxg2xU0w7Qk01XW0zxKrCi9fp7g9hi4RcWL5wv73Lq/9iWweXsBdQjvN
 Tu9vrdzAQ3IT1Ln09u/Q/yC/bn8jpIhAnOvOBArCmZGlBHdR5qxeR4/CwEdhZLUGPEtx
 /k/7n971V7WY+IzrQcrRjtqKFiNzV+cHrNyqMx51NtharCQY/MyZYXKmMPGU04S17khQ
 xH6ETNyioYcyraaS0nkV/kCLiCF66LICuthmvGDOuADl7CgCOtkJcOv2HskEp2egX0qj
 Ak3A==
X-Gm-Message-State: AOAM530/JBHfRwTjEwmPIBVAzxL7ocrz/CGixI5JlX0tQHM+uWMyO4G7
 d6FffR0hh0ySJ9a4Xn7LgIa1QCtGzpgeAw==
X-Google-Smtp-Source: ABdhPJzXgbo7yzhHB/fkNf+zNxFAwslGTBWW07pzfeZJsJfirzIF5F3GR6Fdl/RLRddoFrxt1Z4ZQw==
X-Received: by 2002:a17:903:22d0:b0:13f:507:6414 with SMTP id
 y16-20020a17090322d000b0013f05076414mr31124613plg.69.1634055731690; 
 Tue, 12 Oct 2021 09:22:11 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id k190sm11525023pfd.211.2021.10.12.09.22.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 09:22:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 14/23] target/mips: Drop exit checks for singlestep_enabled
Date: Tue, 12 Oct 2021 09:21:50 -0700
Message-Id: <20211012162159.471406-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211012162159.471406-1-richard.henderson@linaro.org>
References: <20211012162159.471406-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

GDB single-stepping is now handled generically.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/mips/tcg/translate.c | 50 +++++++++++++------------------------
 1 file changed, 18 insertions(+), 32 deletions(-)

diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
index f239f9ffc0..0e59b97190 100644
--- a/target/mips/tcg/translate.c
+++ b/target/mips/tcg/translate.c
@@ -4823,12 +4823,7 @@ static void gen_goto_tb(DisasContext *ctx, int n, target_ulong dest)
         tcg_gen_exit_tb(ctx->base.tb, n);
     } else {
         gen_save_pc(dest);
-        if (ctx->base.singlestep_enabled) {
-            save_cpu_state(ctx, 0);
-            gen_helper_raise_exception_debug(cpu_env);
-        } else {
-            tcg_gen_lookup_and_goto_ptr();
-        }
+        tcg_gen_lookup_and_goto_ptr();
     }
 }
 
@@ -11788,10 +11783,6 @@ static void gen_branch(DisasContext *ctx, int insn_bytes)
             } else {
                 tcg_gen_mov_tl(cpu_PC, btarget);
             }
-            if (ctx->base.singlestep_enabled) {
-                save_cpu_state(ctx, 0);
-                gen_helper_raise_exception_debug(cpu_env);
-            }
             tcg_gen_lookup_and_goto_ptr();
             break;
         default:
@@ -16111,28 +16102,23 @@ static void mips_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
 {
     DisasContext *ctx = container_of(dcbase, DisasContext, base);
 
-    if (ctx->base.singlestep_enabled && ctx->base.is_jmp != DISAS_NORETURN) {
-        save_cpu_state(ctx, ctx->base.is_jmp != DISAS_EXIT);
-        gen_helper_raise_exception_debug(cpu_env);
-    } else {
-        switch (ctx->base.is_jmp) {
-        case DISAS_STOP:
-            gen_save_pc(ctx->base.pc_next);
-            tcg_gen_lookup_and_goto_ptr();
-            break;
-        case DISAS_NEXT:
-        case DISAS_TOO_MANY:
-            save_cpu_state(ctx, 0);
-            gen_goto_tb(ctx, 0, ctx->base.pc_next);
-            break;
-        case DISAS_EXIT:
-            tcg_gen_exit_tb(NULL, 0);
-            break;
-        case DISAS_NORETURN:
-            break;
-        default:
-            g_assert_not_reached();
-        }
+    switch (ctx->base.is_jmp) {
+    case DISAS_STOP:
+        gen_save_pc(ctx->base.pc_next);
+        tcg_gen_lookup_and_goto_ptr();
+        break;
+    case DISAS_NEXT:
+    case DISAS_TOO_MANY:
+        save_cpu_state(ctx, 0);
+        gen_goto_tb(ctx, 0, ctx->base.pc_next);
+        break;
+    case DISAS_EXIT:
+        tcg_gen_exit_tb(NULL, 0);
+        break;
+    case DISAS_NORETURN:
+        break;
+    default:
+        g_assert_not_reached();
     }
 }
 
-- 
2.25.1


