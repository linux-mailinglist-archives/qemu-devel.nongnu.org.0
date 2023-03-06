Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B420B6AB3BD
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 01:41:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYyu1-0004Si-Or; Sun, 05 Mar 2023 19:40:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYytg-0004QR-70
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 19:40:15 -0500
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYytd-0006ad-HG
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 19:40:11 -0500
Received: by mail-pj1-x1041.google.com with SMTP id
 y15-20020a17090aa40f00b00237ad8ee3a0so7389357pjp.2
 for <qemu-devel@nongnu.org>; Sun, 05 Mar 2023 16:40:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678063207;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=68NJ9PbR7QuZfXp7zXHdyeHEv5WpvXsTvRUFjOBjZk4=;
 b=kAFQKtrFt2F5ByQ56M4FeCfSZZmbHtGkZEMopBkNPXDF2qsaohLahrSyzVVUmMFKB8
 Wg9If9OvHiGWVJtXL9d8IRFy6cVHw7Gu6ANQhnKtT54Gl29sSw6fcGPt9y8o3DnKwFsU
 TgHi+wDU9qRUrnGzGEgpvuXqvYLktylVleppGNiu/KgVl6sXa7F6lEWpPvjJjz2wZpH8
 5U0RJCiwLhH0YHneMzZyF7GsYwHGuXztOk7lJUgar/DY01atEPPZc3nDN43ZvOF5rmpM
 E041jOohB0xFuoRZwzOKrnbYQlH6TkM8DznCWZq3+V2lZRm7u8rr1uawaF9qYjYx5c7x
 ADAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678063207;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=68NJ9PbR7QuZfXp7zXHdyeHEv5WpvXsTvRUFjOBjZk4=;
 b=N2b3DoZseqwEIOOXMz29FHpLPvnEFhLSGP5vcm0xUJDknTz0OZWRjJLSazSazbSWc5
 fYJJfFOXF0/vudzhTVZMHQEQplBFbtyEPKLBpCZgIL4KtqdfLCA6vGZJ3P4V71M89m4K
 22jstcPLGbgNnvenaI3okRM+bOEvd5g+CdDkySMHtqGqhXkvWLWf6kmCxxDHvK2gMyU5
 rhMf3UuvuBkuWi1Fs2bvkSRnqv16Y5lf8srgo5x5UVeJ6lBoJb9r91ABhHWErJZy+9FS
 moduTuyxckMbaVNEX32PCNrfvNoSJCecO1G362m3BZHjCFse4NFvDiL+jZdJiP8lFEfS
 MR+A==
X-Gm-Message-State: AO0yUKVb5mkIhS3iDQpyIUfbBXbCgpvioSQmJY+jAiL7Yw4Iy1hvff2M
 ICuXApj1JxBqjYiMYgg+BHEDGPs2Bc7HNTNQNCgcdNRy
X-Google-Smtp-Source: AK7set//s+O03C6pnWoKQ1PcbohMr8zI5iM3AQYJ2dnQjuMLb2sXwWJk64/G6GWtfKlGy3DXamsTRw==
X-Received: by 2002:a17:90b:4b4b:b0:233:a6b7:3770 with SMTP id
 mi11-20020a17090b4b4b00b00233a6b73770mr9667847pjb.14.1678063207179; 
 Sun, 05 Mar 2023 16:40:07 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:87cc:49bb:2900:c08b])
 by smtp.gmail.com with ESMTPSA id
 r13-20020a17090b050d00b002372106a5c2sm6567901pjz.37.2023.03.05.16.40.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Mar 2023 16:40:06 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org
Subject: [PULL 13/84] accel/tcg: Remove translator_loop_temp_check
Date: Sun,  5 Mar 2023 16:38:43 -0800
Message-Id: <20230306003954.1866998-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230306003954.1866998-1-richard.henderson@linaro.org>
References: <20230306003954.1866998-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1041;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1041.google.com
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

Finish removing tcg temp free accounting interfaces.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/translator.h      | 2 --
 accel/tcg/translator.c         | 4 ----
 target/alpha/translate.c       | 1 -
 target/arm/tcg/translate-a64.c | 2 --
 target/arm/tcg/translate.c     | 1 -
 target/ppc/translate.c         | 2 --
 6 files changed, 12 deletions(-)

diff --git a/include/exec/translator.h b/include/exec/translator.h
index 8b36690e80..797fef7515 100644
--- a/include/exec/translator.h
+++ b/include/exec/translator.h
@@ -150,8 +150,6 @@ void translator_loop(CPUState *cpu, TranslationBlock *tb, int *max_insns,
                      target_ulong pc, void *host_pc,
                      const TranslatorOps *ops, DisasContextBase *db);
 
-void translator_loop_temp_check(DisasContextBase *db);
-
 /**
  * translator_use_goto_tb
  * @db: Disassembly context
diff --git a/accel/tcg/translator.c b/accel/tcg/translator.c
index e00e7fa601..7bda43ff61 100644
--- a/accel/tcg/translator.c
+++ b/accel/tcg/translator.c
@@ -18,10 +18,6 @@
 #include "exec/plugin-gen.h"
 #include "exec/replay-core.h"
 
-void translator_loop_temp_check(DisasContextBase *db)
-{
-}
-
 bool translator_use_goto_tb(DisasContextBase *db, target_ulong dest)
 {
     /* Suppress goto_tb if requested. */
diff --git a/target/alpha/translate.c b/target/alpha/translate.c
index 716b083f39..a0afdbb465 100644
--- a/target/alpha/translate.c
+++ b/target/alpha/translate.c
@@ -2996,7 +2996,6 @@ static void alpha_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
     ctx->base.is_jmp = translate_one(ctx, insn);
 
     free_context_temps(ctx);
-    translator_loop_temp_check(&ctx->base);
 }
 
 static void alpha_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index f092aec801..f15e591293 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -14957,8 +14957,6 @@ static void aarch64_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
     if (s->btype > 0 && s->base.is_jmp != DISAS_NORETURN) {
         reset_btype(s);
     }
-
-    translator_loop_temp_check(&s->base);
 }
 
 static void aarch64_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
diff --git a/target/arm/tcg/translate.c b/target/arm/tcg/translate.c
index f042069dc2..ecf09cb12b 100644
--- a/target/arm/tcg/translate.c
+++ b/target/arm/tcg/translate.c
@@ -9600,7 +9600,6 @@ static void arm_post_translate_insn(DisasContext *dc)
         gen_set_label(dc->condlabel.label);
         dc->condjmp = 0;
     }
-    translator_loop_temp_check(&dc->base);
 }
 
 static void arm_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 37b67d5175..4c8db92168 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -7627,8 +7627,6 @@ static void ppc_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
     if (ctx->base.is_jmp == DISAS_NEXT && !(pc & ~TARGET_PAGE_MASK)) {
         ctx->base.is_jmp = DISAS_TOO_MANY;
     }
-
-    translator_loop_temp_check(&ctx->base);
 }
 
 static void ppc_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
-- 
2.34.1


