Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6073442A963
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 18:27:32 +0200 (CEST)
Received: from localhost ([::1]:59322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maKcl-0006Ed-8E
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 12:27:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maKXa-00069A-Bo
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 12:22:10 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:35827)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maKXX-00043P-O6
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 12:22:09 -0400
Received: by mail-pg1-x532.google.com with SMTP id e7so14350206pgk.2
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 09:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=l8F0yKfEV2474L4Ct30BbTSDAfxIN/YXChfrODh7eN4=;
 b=g/LVaS2IVTh4FTFsMgoFarMzBSENpkDD/XkvePL/52UKKZ/kBYP0MESwSILah9IFRU
 2Dr3Ki9mgb4AZv+KRt9/QpjJDehbNJFW7mpYVV/zcVHiptnlHBzrQsAFxShCdG3d5my/
 BdwGxdTd431VQkkgjAkpOFQfsNwAOD9FrzqEQSA1BXsEzHDo9xWR8/b4DshxchaFPwXE
 UE5ZyvalItCpUMAeeuFp/w2qJy6YEaYCkhFAm4zafqa6xDc6O7w24qhRFwcyVvkKKBAv
 Y7+U15qYPp8R5C4uUSXYytMMlgmIKWcAuyNw2hLtnOAGSix6WkLHiNTYtx8iEjYKRd1e
 TJdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=l8F0yKfEV2474L4Ct30BbTSDAfxIN/YXChfrODh7eN4=;
 b=1cm22r9+ydRcFYzFoG/jN6cOjinXtlboHCvgQ3W/CKK2EegRgbOYx4Pb5nQuk6UBcB
 58YFbCmbRjbc1tYXJnq0No5t0G/sSFazmK8JiRpYg7NCddmTc5A+zvDEuIPzoRD+o5uK
 cxwqLHF7qFgULBJ9KHWLBkCWD8GIWW73dFjw7VEhOdinqjJBEEdFQ9R5w1NUyuo3PPP+
 kHsVm7MAjBKrVrDeF5C7C0It296qjsuTp9GJHE7HSZDhlb2iGJ2ejdeaITZf1TSDO0pK
 KgN64pdJ5pMgyPmaO0WQzI1BqxJQ2QxkoBmjHhJBCbcE5AaRXVE4QlGa4FLK3BnkNiB9
 FzTg==
X-Gm-Message-State: AOAM531KHuxyDpdwF6ady2vWWETGIxDIpSkQRafguj1miGtyeTjnpAWY
 ZLj1PwqSoB5k53VUSxNMU4+8F4MsLxBwwg==
X-Google-Smtp-Source: ABdhPJzNSeXTxfPhPfT/nvkAK3gKtFW3szO37PGBi+0AckBuHInih5KwH2eqE8zsAhjtGIu2jc9suQ==
X-Received: by 2002:a63:b349:: with SMTP id x9mr17084219pgt.421.1634055726405; 
 Tue, 12 Oct 2021 09:22:06 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id k190sm11525023pfd.211.2021.10.12.09.22.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 09:22:06 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 07/23] target/hppa: Drop checks for singlestep_enabled
Date: Tue, 12 Oct 2021 09:21:43 -0700
Message-Id: <20211012162159.471406-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211012162159.471406-1-richard.henderson@linaro.org>
References: <20211012162159.471406-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
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
 target/hppa/translate.c | 17 ++++-------------
 1 file changed, 4 insertions(+), 13 deletions(-)

diff --git a/target/hppa/translate.c b/target/hppa/translate.c
index c3698cf067..3b9744deb4 100644
--- a/target/hppa/translate.c
+++ b/target/hppa/translate.c
@@ -814,11 +814,7 @@ static void gen_goto_tb(DisasContext *ctx, int which,
     } else {
         copy_iaoq_entry(cpu_iaoq_f, f, cpu_iaoq_b);
         copy_iaoq_entry(cpu_iaoq_b, b, ctx->iaoq_n_var);
-        if (ctx->base.singlestep_enabled) {
-            gen_excp_1(EXCP_DEBUG);
-        } else {
-            tcg_gen_lookup_and_goto_ptr();
-        }
+        tcg_gen_lookup_and_goto_ptr();
     }
 }
 
@@ -2346,11 +2342,7 @@ static bool do_rfi(DisasContext *ctx, bool rfi_r)
         gen_helper_rfi(cpu_env);
     }
     /* Exit the TB to recognize new interrupts.  */
-    if (ctx->base.singlestep_enabled) {
-        gen_excp_1(EXCP_DEBUG);
-    } else {
-        tcg_gen_exit_tb(NULL, 0);
-    }
+    tcg_gen_exit_tb(NULL, 0);
     ctx->base.is_jmp = DISAS_NORETURN;
 
     return nullify_end(ctx);
@@ -4274,10 +4266,9 @@ static void hppa_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
         nullify_save(ctx);
         /* FALLTHRU */
     case DISAS_IAQ_N_UPDATED:
-        if (ctx->base.singlestep_enabled) {
-            gen_excp_1(EXCP_DEBUG);
-        } else if (is_jmp != DISAS_IAQ_N_STALE_EXIT) {
+        if (is_jmp != DISAS_IAQ_N_STALE_EXIT) {
             tcg_gen_lookup_and_goto_ptr();
+            break;
         }
         /* FALLTHRU */
     case DISAS_EXIT:
-- 
2.25.1


