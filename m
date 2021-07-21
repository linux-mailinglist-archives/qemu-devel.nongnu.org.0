Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B6C63D095A
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 09:05:21 +0200 (CEST)
Received: from localhost ([::1]:45950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m66IC-00026W-Dy
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 03:05:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m65vz-0005DW-5b
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 02:42:23 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:38629)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m65vx-0005iR-Kn
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 02:42:22 -0400
Received: by mail-pl1-x62d.google.com with SMTP id u3so482238plf.5
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 23:42:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=lWWxg8MR6KKJ1tBQpQnAGh32uFzHWDCE77XSSdScV5I=;
 b=ku3qfA/5bxKlMBqFkkKnVZMLEi+qiILhIlbk4twfDj+R28IOJB+y+WDSQ9HAhw4EH1
 Oo1KHPn/VJanUm8nonUZ2VlKh0jqYgi/65rk7yIbj4695VLWb34juKDD8L1bzt8nUg8P
 mQ1Mg+n094a4VjGYNXsvdqj9uj+uuLr5CeXWgPpRaIro6s9+O8JtsI29+TOKpqxoY4/O
 /slEBjI+nMhBPhxDqzc2d9auDJDYsh75qzce/Xt9uD7Gs7YIKm/eHRDXJDizkF+Di2YD
 oFMEtjNYcxL1nJDhNxCRxDhIik62W3lct+hSZvV2fnWydRi8WUkaW4vewA7xlMUaKC9r
 fpZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lWWxg8MR6KKJ1tBQpQnAGh32uFzHWDCE77XSSdScV5I=;
 b=pv3rorwPDZWLurBrzvgFRnQilKzw4rKeqvbL4+zKl4xUrvpVHsz0Ok+kzXf3H14cuQ
 O6c+jKsQ3jOtmbTFO7OBXGpKFwVwyzKXVuGa96KtLjcTbhnauytrhj1b4Kw8wD0WclKJ
 Y42oaXkm0P8MxOCQBv9PUy/eX71IgXy300m+O8wO3z4RpV2wDgGcpoMQLEXrAuJbGDEq
 LUuPcLQbGUdZ00Z0b9eGC71Pxea5bm8j4yIRbVUC9bYTF/+HkCi9MFqlGIjCx7Wz1s9N
 a0bLXU30eY4j4M39i/6MYgL557FaVnav19N7AjQhjg6CQScTR7XTVQ3YD7mubskRM7W5
 SIcg==
X-Gm-Message-State: AOAM530yx+TVvd1KIUm/FZkUCgGrU8TXsk59QlvJMIuq+LNTF1ftX2RE
 yLBnySACTOBgsvms6ycJDDLqSM9yL1/KEg==
X-Google-Smtp-Source: ABdhPJxOJ2Wj48/RV526VqFkU84Trzg0xeFRBRvq4427fLc9qc+GYZItaRJQXi8IGo0FI/j5n7lKVg==
X-Received: by 2002:a17:90b:4c92:: with SMTP id
 my18mr33134150pjb.167.1626849740328; 
 Tue, 20 Jul 2021 23:42:20 -0700 (PDT)
Received: from localhost.localdomain (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id q17sm21146132pjd.42.2021.07.20.23.42.19
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 23:42:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.2 22/23] target/tricore: Drop check for
 singlestep_enabled
Date: Tue, 20 Jul 2021 20:41:54 -1000
Message-Id: <20210721064155.645508-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210721064155.645508-1-richard.henderson@linaro.org>
References: <20210721064155.645508-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

GDB single-stepping is now handled generically.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/tricore/helper.h    |  1 -
 target/tricore/op_helper.c |  7 -------
 target/tricore/translate.c | 14 +-------------
 3 files changed, 1 insertion(+), 21 deletions(-)

diff --git a/target/tricore/helper.h b/target/tricore/helper.h
index 78176aa17a..b64780c37d 100644
--- a/target/tricore/helper.h
+++ b/target/tricore/helper.h
@@ -153,4 +153,3 @@ DEF_HELPER_2(psw_write, void, env, i32)
 DEF_HELPER_1(psw_read, i32, env)
 /* Exceptions */
 DEF_HELPER_3(raise_exception_sync, noreturn, env, i32, i32)
-DEF_HELPER_2(qemu_excp, noreturn, env, i32)
diff --git a/target/tricore/op_helper.c b/target/tricore/op_helper.c
index 32c2bc1699..9476d10d00 100644
--- a/target/tricore/op_helper.c
+++ b/target/tricore/op_helper.c
@@ -107,13 +107,6 @@ static void raise_exception_sync_helper(CPUTriCoreState *env, uint32_t class,
     raise_exception_sync_internal(env, class, tin, pc, 0);
 }
 
-void helper_qemu_excp(CPUTriCoreState *env, uint32_t excp)
-{
-    CPUState *cs = env_cpu(env);
-    cs->exception_index = excp;
-    cpu_loop_exit(cs);
-}
-
 /* Addressing mode helper */
 
 static uint16_t reverse16(uint16_t val)
diff --git a/target/tricore/translate.c b/target/tricore/translate.c
index a0cc0f1cb3..07084407cb 100644
--- a/target/tricore/translate.c
+++ b/target/tricore/translate.c
@@ -3225,14 +3225,6 @@ static inline void gen_save_pc(target_ulong pc)
     tcg_gen_movi_tl(cpu_PC, pc);
 }
 
-static void generate_qemu_excp(DisasContext *ctx, int excp)
-{
-    TCGv_i32 tmp = tcg_const_i32(excp);
-    gen_helper_qemu_excp(cpu_env, tmp);
-    ctx->base.is_jmp = DISAS_NORETURN;
-    tcg_temp_free(tmp);
-}
-
 static void gen_goto_tb(DisasContext *ctx, int n, target_ulong dest)
 {
     if (translator_use_goto_tb(&ctx->base, dest)) {
@@ -3241,11 +3233,7 @@ static void gen_goto_tb(DisasContext *ctx, int n, target_ulong dest)
         tcg_gen_exit_tb(ctx->base.tb, n);
     } else {
         gen_save_pc(dest);
-        if (ctx->base.singlestep_enabled) {
-            generate_qemu_excp(ctx, EXCP_DEBUG);
-        } else {
-            tcg_gen_lookup_and_goto_ptr();
-        }
+        tcg_gen_lookup_and_goto_ptr();
     }
 }
 
-- 
2.25.1


