Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE3586A3A61
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 06:30:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWW1E-0006ui-4E; Mon, 27 Feb 2023 00:25:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWW0o-0006e9-NW
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 00:25:24 -0500
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWW0j-000791-Gh
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 00:25:20 -0500
Received: by mail-pl1-x643.google.com with SMTP id bh1so5498445plb.11
 for <qemu-devel@nongnu.org>; Sun, 26 Feb 2023 21:25:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9BPaQYLLp4+nmOO9gXaqu9l3zT8hpHGLtGA7cjOsUko=;
 b=cC6KasIgcfgFhHc0ZB5CO3YGMa5Zi8yzHQ9e+3yw8UjpJiBdchIp3TWvi8hvzT5jFo
 T5i0y/iyyO30fCAPC/PH6C5iMzTc40o7lU2W9slISetRnJr1xjWad23uNrrHePz5+rI8
 XZjWEDuTxGWcJzEGeZGi+mIUdbMJJv1027DidFfEHd2gtF/PuyGMM8nUGTAtaosCWeJZ
 fE3Wt9wsurYGTBrMCQ6ooKIlOzBOxE+cSKZXZbi7mXt7BjhEVY8tqfnwO9trv/4zJ27f
 RXlFRgWzMytxuWipTAWXg07VFSPT27wQRQ7EKpaxkDv5J7N9iR/tZm21dAQPTJNc5WG3
 msyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9BPaQYLLp4+nmOO9gXaqu9l3zT8hpHGLtGA7cjOsUko=;
 b=QHNgi4loCXP7dYb2fJ67vvezMgfOuGfERU/id3s9c5qdh30k6WJoxEgCDiQ5ZdN6SF
 /2uSsz895KBbxIQQ/XOb0VuIiU6YDF8wLuf+rZuAGWwH13hnUhSMA0gg4ZKkNLrWb53/
 BNATyHhq5e8iDk1/IaBtKoUTWIRyu2LicmR+wmyYNEMoezw5sihPbxDlLdqGvd1i4tdq
 nhFZeNckAeWOFz47Qmn/I6FLMSs2/rddI3qaO8PejYj6Ed4NfAwuChIaA4Of7W2/rRY9
 ojc0nzte1OsRVnG5jpz+mhvj9dzwhDBsbvqdN5aJChBZv5u0X7PMZZBjAjdl4bqsXh1W
 l5Pw==
X-Gm-Message-State: AO0yUKXeOH1bE7bpgZWALUJRtffWgEcGdiaFJ0jakJGmIkI9COcIq1Ku
 +LXmn/WwAgywsFp+AGjBpWES7A16fe/ecLbx4dMYCw==
X-Google-Smtp-Source: AK7set/D+clYVKbDxAFqrP5s99INO/hQHt+v9opJ9ki0tZ9jzZ4NpHle/Ziu/ae8NmeFAXXYIDS/2w==
X-Received: by 2002:a17:902:c407:b0:19b:dbf7:f9d1 with SMTP id
 k7-20020a170902c40700b0019bdbf7f9d1mr26066194plk.37.1677475515545; 
 Sun, 26 Feb 2023 21:25:15 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 a14-20020a170902ecce00b0019a837be977sm3513341plh.271.2023.02.26.21.25.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:25:15 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH v2 02/76] accel/tcg: Remove translator_loop_temp_check
Date: Sun, 26 Feb 2023 19:23:51 -1000
Message-Id: <20230227052505.352889-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227052505.352889-1-richard.henderson@linaro.org>
References: <20230227052505.352889-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::643;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x643.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/translator.h  | 2 --
 accel/tcg/translator.c     | 4 ----
 target/alpha/translate.c   | 1 -
 target/arm/translate-a64.c | 2 --
 target/arm/translate.c     | 1 -
 target/ppc/translate.c     | 2 --
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
index 88567a88d1..b4183d0278 100644
--- a/accel/tcg/translator.c
+++ b/accel/tcg/translator.c
@@ -18,10 +18,6 @@
 #include "exec/plugin-gen.h"
 #include "sysemu/replay.h"
 
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
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 9da5010fe1..98537bc2ef 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -14957,8 +14957,6 @@ static void aarch64_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
     if (s->btype > 0 && s->base.is_jmp != DISAS_NORETURN) {
         reset_btype(s);
     }
-
-    translator_loop_temp_check(&s->base);
 }
 
 static void aarch64_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 9c8e1ac04c..614c438786 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -9600,7 +9600,6 @@ static void arm_post_translate_insn(DisasContext *dc)
         gen_set_label(dc->condlabel.label);
         dc->condjmp = 0;
     }
-    translator_loop_temp_check(&dc->base);
 }
 
 static void arm_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 2956021e89..c179f26f64 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -7618,8 +7618,6 @@ static void ppc_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
     if (ctx->base.is_jmp == DISAS_NEXT && !(pc & ~TARGET_PAGE_MASK)) {
         ctx->base.is_jmp = DISAS_TOO_MANY;
     }
-
-    translator_loop_temp_check(&ctx->base);
 }
 
 static void ppc_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
-- 
2.34.1


