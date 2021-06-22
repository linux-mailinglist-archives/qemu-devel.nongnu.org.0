Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC54E3B0994
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 17:53:36 +0200 (CEST)
Received: from localhost ([::1]:53666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lviiV-00059c-VB
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 11:53:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lvidb-00052H-5R
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 11:48:31 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:45962)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lvidV-0005Ik-Te
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 11:48:30 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 z3-20020a17090a3983b029016bc232e40bso2510277pjb.4
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 08:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QV3NWQWmRHF/ZFVxLVNCzHlStwF0CrHnXqXVYt2I9ho=;
 b=LPARqh5YzlXvypLlxirKZ6pk3suD14Omq8/AWoWJFqVarRk1RauzAVdfJ3g8JjWBjG
 2Eui75ARk3fx6Ch0+xfjTEEFh4L74uCRZHCowC0xXUAxPp8nNWwgH699EyWIFtMbdC+K
 sAXX0cOFLPvNIXid7W26qDbWzWNEf2/uiem527ijtLhPsobzD+pU/rs45+5TWMcB3qB2
 t8j6gFFjxont3Iov1pX2LRbe8okW5J9+17fwvTrvRD20XTlhk3tJfZ14jVqli/Brvxfu
 J5vIqqVb6G93B7UkjUtkDJqftTMgM5iCPBeWoq9/4pDPFtnnADI6NvF1EX6UzEtsI21y
 iN9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QV3NWQWmRHF/ZFVxLVNCzHlStwF0CrHnXqXVYt2I9ho=;
 b=C8WGSv5m+AFRAdyMQx9n0jC+Lc9Di8QH9cdlt1hu2RKB1D5yDzzE4tKmhIxE35hSSK
 bRo/ScR/NS/mKeXSdkBx8BCREuviq2WBHmPIqQFWofI3ywo49ahUPF0SPQ8tsBvilNVW
 sK9E/HowSp/0SXjoDP44KRRe+9y/QfrQpGV8VRdeigCGA/BjFS9CUl3eDYWLAnRuUwkT
 1hhRuMoA9uAgLNMwAJNd0T0EW06r7cMDS33VBwfdc7lf2gQvV7SCuRxNWrwuoy6mB1vG
 rf0/XM7SUCJJy4Va2pf3HbeyEH0YdgbyuQHm2ODdv+1MzhdSo3WH0KLUk9c32pfkZ5mq
 GR4Q==
X-Gm-Message-State: AOAM531Q79zDzqlyC70UwQAOLGvVs4+Z8E0unMtZ+4BgYEaJr71Lf85p
 GoRh+POZgAOfZccY4xNRmIpPixbiGtlPDg==
X-Google-Smtp-Source: ABdhPJySJNO5EzzgBebED55d8MNkZCd+5qc/m7i0YEUmuMeThvJInrBV3B4GKLZvCGuBt+yBgbXUBA==
X-Received: by 2002:a17:902:222:b029:11b:9cea:eea9 with SMTP id
 31-20020a1709020222b029011b9ceaeea9mr22953587plc.11.1624376904369; 
 Tue, 22 Jun 2021 08:48:24 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id x13sm2898769pjh.30.2021.06.22.08.48.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jun 2021 08:48:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 04/15] target/cris: Mark exceptions as DISAS_NORETURN
Date: Tue, 22 Jun 2021 08:48:09 -0700
Message-Id: <20210622154820.1978982-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210622154820.1978982-1-richard.henderson@linaro.org>
References: <20210622154820.1978982-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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
Cc: edgar.iglesias@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

After we've raised the exception, we have left the TB.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/cris/translate.c         | 5 +++--
 target/cris/translate_v10.c.inc | 3 ++-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/target/cris/translate.c b/target/cris/translate.c
index e086ff9131..24dbae6d58 100644
--- a/target/cris/translate.c
+++ b/target/cris/translate.c
@@ -2873,6 +2873,7 @@ static int dec_rfe_etc(CPUCRISState *env, DisasContext *dc)
                        -offsetof(CRISCPU, env) + offsetof(CPUState, halted));
         tcg_gen_movi_tl(env_pc, dc->pc + 2);
         t_gen_raise_exception(EXCP_HLT);
+        dc->base.is_jmp = DISAS_NORETURN;
         return 2;
     }
 
@@ -2900,7 +2901,7 @@ static int dec_rfe_etc(CPUCRISState *env, DisasContext *dc)
         /* Breaks start at 16 in the exception vector.  */
         t_gen_movi_env_TN(trap_vector, dc->op1 + 16);
         t_gen_raise_exception(EXCP_BREAK);
-        dc->base.is_jmp = DISAS_UPDATE;
+        dc->base.is_jmp = DISAS_NORETURN;
         break;
     default:
         printf("op2=%x\n", dc->op2);
@@ -3188,7 +3189,7 @@ void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns)
             cris_evaluate_flags(dc);
             tcg_gen_movi_tl(env_pc, dc->pc);
             t_gen_raise_exception(EXCP_DEBUG);
-            dc->base.is_jmp = DISAS_UPDATE;
+            dc->base.is_jmp = DISAS_NORETURN;
             /* The address covered by the breakpoint must be included in
                [tb->pc, tb->pc + tb->size) in order to for it to be
                properly cleared -- thus we increment the PC here so that
diff --git a/target/cris/translate_v10.c.inc b/target/cris/translate_v10.c.inc
index dd44a7eb97..0ba2aca96f 100644
--- a/target/cris/translate_v10.c.inc
+++ b/target/cris/translate_v10.c.inc
@@ -61,6 +61,7 @@ static inline void cris_illegal_insn(DisasContext *dc)
 {
     qemu_log_mask(LOG_GUEST_ERROR, "illegal insn at pc=%x\n", dc->pc);
     t_gen_raise_exception(EXCP_BREAK);
+    dc->base.is_jmp = DISAS_NORETURN;
 }
 
 static void gen_store_v10_conditional(DisasContext *dc, TCGv addr, TCGv val,
@@ -1169,7 +1170,7 @@ static unsigned int dec10_ind(CPUCRISState *env, DisasContext *dc)
                     t_gen_mov_env_TN(trap_vector, c);
                     tcg_temp_free(c);
                     t_gen_raise_exception(EXCP_BREAK);
-                    dc->base.is_jmp = DISAS_UPDATE;
+                    dc->base.is_jmp = DISAS_NORETURN;
                     return insn_len;
                 }
                 LOG_DIS("%d: jump.%d %d r%d r%d\n", __LINE__, size,
-- 
2.25.1


