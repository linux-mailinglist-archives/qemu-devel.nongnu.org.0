Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40E43681C18
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 22:02:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMbFu-0007uS-2N; Mon, 30 Jan 2023 15:59:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pMbFk-0007Uj-M3
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 15:59:52 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pMbFh-0005CO-Uj
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 15:59:48 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 cq16-20020a17090af99000b0022c9791ac39so4460979pjb.4
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 12:59:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xFvqAHF0H7zlHj/UyRlhV/svGJlbiV6IqpGGJulMnWU=;
 b=NbfjuhzYSSAp2+tG98w7BryokOrxZwABs2Xi9khPQ33Uzb/MXZLHkZXYj7rL6Ar3oa
 lZCGPO3nm8xIXJMb4QmeCh/DPs3neA5p+0eXU20HSYOHG2NlYpNcfAeDzKFIsjw0sMVY
 j17V0fdJG43gyywzLXrXeYNUHHsAWz1U179Gy6yCwARVLpbMQ8YDHn7U2+Tjm4E11Bwa
 Ma+S0FiJX0BCXk8gCU2dlhpfgGLqZSRgt+CSVKU9thrLmr899RqsU7PfACRYdEw9Ad38
 RkytkOgq4WKVXJj1SbB6q5upbPesRRUAE6Frw/+MC15h2c3SlkGWkoIDLcZmOUROKds/
 hatA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xFvqAHF0H7zlHj/UyRlhV/svGJlbiV6IqpGGJulMnWU=;
 b=GEPxwxxjgsG//xECvLDcjVBlUROvEyYN8WjPluSnDfAap4ONlWPgtfXSd2VkCiTiCR
 JE8QsOjSg8bWyRpsgqRterKG1GfteNLcMeRr4PmnYYDIGZ8GfJQ8zJkmFuQ1uxWgQFWM
 /oXJ8tx4e0eZeY+e5P1orqvKsLn+/MoTxsoksUsLe2/3qjeRu84EAFTVtrPaYjfW/tgE
 mW7trOKdxx+5/csZSOUQS2PD2Nsf43dKVe+WPMxKdGOsTyjBd0RGqCjD82OS76MqO7WA
 p92PhHCCEKCKcYC7yLjlJiG5f24wUtbCqWCgnpHN/hOI3rE3dbWAmyHn96FR8ndR6oox
 jFWA==
X-Gm-Message-State: AO0yUKWq+cNuVTE9PbVu+Q48zhmIOmmCjlO052MrHLPgPpURlwY3o1AC
 MT7bFdkFkvGplzDPOLp9c1+aQqcVFUf7C7mZ
X-Google-Smtp-Source: AK7set+1VIiPX5Eel65JMLb/CQfvmYi06FQbi+eXTCd5xeAlSPWUuiBQRM8uhiUj6PAuZNRVprScww==
X-Received: by 2002:a05:6a21:6d92:b0:bd:132b:8e77 with SMTP id
 wl18-20020a056a216d9200b000bd132b8e77mr6221953pzb.18.1675112383800; 
 Mon, 30 Jan 2023 12:59:43 -0800 (PST)
Received: from stoup.. (rrcs-173-197-98-118.west.biz.rr.com. [173.197.98.118])
 by smtp.gmail.com with ESMTPSA id
 x10-20020aa79a4a000000b00593eb3a5e44sm102933pfj.37.2023.01.30.12.59.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 12:59:43 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	cota@braap.org
Subject: [PATCH 02/27] accel/tcg: Pass max_insn to gen_intermediate_code by
 pointer
Date: Mon, 30 Jan 2023 10:59:10 -1000
Message-Id: <20230130205935.1157347-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230130205935.1157347-1-richard.henderson@linaro.org>
References: <20230130205935.1157347-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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

In preparation for returning the number of insns generated
via the same pointer.  Adjust only the prototypes so far.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/translator.h     | 4 ++--
 accel/tcg/translate-all.c     | 2 +-
 accel/tcg/translator.c        | 4 ++--
 target/alpha/translate.c      | 2 +-
 target/arm/translate.c        | 2 +-
 target/avr/translate.c        | 2 +-
 target/cris/translate.c       | 2 +-
 target/hexagon/translate.c    | 2 +-
 target/hppa/translate.c       | 2 +-
 target/i386/tcg/translate.c   | 2 +-
 target/loongarch/translate.c  | 2 +-
 target/m68k/translate.c       | 2 +-
 target/microblaze/translate.c | 2 +-
 target/mips/tcg/translate.c   | 2 +-
 target/nios2/translate.c      | 2 +-
 target/openrisc/translate.c   | 2 +-
 target/ppc/translate.c        | 2 +-
 target/riscv/translate.c      | 2 +-
 target/rx/translate.c         | 2 +-
 target/s390x/tcg/translate.c  | 2 +-
 target/sh4/translate.c        | 2 +-
 target/sparc/translate.c      | 2 +-
 target/tricore/translate.c    | 2 +-
 target/xtensa/translate.c     | 2 +-
 24 files changed, 26 insertions(+), 26 deletions(-)

diff --git a/include/exec/translator.h b/include/exec/translator.h
index af2ff95cd5..8b36690e80 100644
--- a/include/exec/translator.h
+++ b/include/exec/translator.h
@@ -37,7 +37,7 @@
  * This function must be provided by the target, which should create
  * the target-specific DisasContext, and then invoke translator_loop.
  */
-void gen_intermediate_code(CPUState *cpu, TranslationBlock *tb, int max_insns,
+void gen_intermediate_code(CPUState *cpu, TranslationBlock *tb, int *max_insns,
                            target_ulong pc, void *host_pc);
 
 /**
@@ -146,7 +146,7 @@ typedef struct TranslatorOps {
  * - When single-stepping is enabled (system-wide or on the current vCPU).
  * - When too many instructions have been translated.
  */
-void translator_loop(CPUState *cpu, TranslationBlock *tb, int max_insns,
+void translator_loop(CPUState *cpu, TranslationBlock *tb, int *max_insns,
                      target_ulong pc, void *host_pc,
                      const TranslatorOps *ops, DisasContextBase *db);
 
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 9e925c10f3..b7b361959e 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -281,7 +281,7 @@ static int setjmp_gen_code(CPUArchState *env, TranslationBlock *tb,
     tcg_func_start(tcg_ctx);
 
     tcg_ctx->cpu = env_cpu(env);
-    gen_intermediate_code(env_cpu(env), tb, *max_insns, pc, host_pc);
+    gen_intermediate_code(env_cpu(env), tb, max_insns, pc, host_pc);
     assert(tb->size != 0);
     tcg_ctx->cpu = NULL;
     *max_insns = tb->icount;
diff --git a/accel/tcg/translator.c b/accel/tcg/translator.c
index 061519691f..08a816bffe 100644
--- a/accel/tcg/translator.c
+++ b/accel/tcg/translator.c
@@ -42,7 +42,7 @@ bool translator_use_goto_tb(DisasContextBase *db, target_ulong dest)
     return ((db->pc_first ^ dest) & TARGET_PAGE_MASK) == 0;
 }
 
-void translator_loop(CPUState *cpu, TranslationBlock *tb, int max_insns,
+void translator_loop(CPUState *cpu, TranslationBlock *tb, int *max_insns,
                      target_ulong pc, void *host_pc,
                      const TranslatorOps *ops, DisasContextBase *db)
 {
@@ -55,7 +55,7 @@ void translator_loop(CPUState *cpu, TranslationBlock *tb, int max_insns,
     db->pc_next = pc;
     db->is_jmp = DISAS_NEXT;
     db->num_insns = 0;
-    db->max_insns = max_insns;
+    db->max_insns = *max_insns;
     db->singlestep_enabled = cflags & CF_SINGLE_STEP;
     db->host_addr[0] = host_pc;
     db->host_addr[1] = NULL;
diff --git a/target/alpha/translate.c b/target/alpha/translate.c
index f9bcdeb717..716b083f39 100644
--- a/target/alpha/translate.c
+++ b/target/alpha/translate.c
@@ -3043,7 +3043,7 @@ static const TranslatorOps alpha_tr_ops = {
     .disas_log          = alpha_tr_disas_log,
 };
 
-void gen_intermediate_code(CPUState *cpu, TranslationBlock *tb, int max_insns,
+void gen_intermediate_code(CPUState *cpu, TranslationBlock *tb, int *max_insns,
                            target_ulong pc, void *host_pc)
 {
     DisasContext dc;
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 365e02fb0b..12eeada122 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -9937,7 +9937,7 @@ static const TranslatorOps thumb_translator_ops = {
 };
 
 /* generate intermediate code for basic block 'tb'.  */
-void gen_intermediate_code(CPUState *cpu, TranslationBlock *tb, int max_insns,
+void gen_intermediate_code(CPUState *cpu, TranslationBlock *tb, int *max_insns,
                            target_ulong pc, void *host_pc)
 {
     DisasContext dc = { };
diff --git a/target/avr/translate.c b/target/avr/translate.c
index 2bed56f135..e40d8e9681 100644
--- a/target/avr/translate.c
+++ b/target/avr/translate.c
@@ -3049,7 +3049,7 @@ static const TranslatorOps avr_tr_ops = {
     .disas_log          = avr_tr_disas_log,
 };
 
-void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns,
+void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int *max_insns,
                            target_ulong pc, void *host_pc)
 {
     DisasContext dc = { };
diff --git a/target/cris/translate.c b/target/cris/translate.c
index fbc3fd5865..905d01288e 100644
--- a/target/cris/translate.c
+++ b/target/cris/translate.c
@@ -3286,7 +3286,7 @@ static const TranslatorOps cris_tr_ops = {
     .disas_log          = cris_tr_disas_log,
 };
 
-void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns,
+void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int *max_insns,
                            target_ulong pc, void *host_pc)
 {
     DisasContext dc;
diff --git a/target/hexagon/translate.c b/target/hexagon/translate.c
index 75f28e08ad..fc3061a540 100644
--- a/target/hexagon/translate.c
+++ b/target/hexagon/translate.c
@@ -962,7 +962,7 @@ static const TranslatorOps hexagon_tr_ops = {
     .disas_log          = hexagon_tr_disas_log,
 };
 
-void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns,
+void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int *max_insns,
                            target_ulong pc, void *host_pc)
 {
     DisasContext ctx;
diff --git a/target/hppa/translate.c b/target/hppa/translate.c
index 981f8ee03d..0102cf451b 100644
--- a/target/hppa/translate.c
+++ b/target/hppa/translate.c
@@ -4359,7 +4359,7 @@ static const TranslatorOps hppa_tr_ops = {
     .disas_log          = hppa_tr_disas_log,
 };
 
-void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns,
+void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int *max_insns,
                            target_ulong pc, void *host_pc)
 {
     DisasContext ctx;
diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 9d9392b009..a47d60f057 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -7158,7 +7158,7 @@ static const TranslatorOps i386_tr_ops = {
 };
 
 /* generate intermediate code for basic block 'tb'.  */
-void gen_intermediate_code(CPUState *cpu, TranslationBlock *tb, int max_insns,
+void gen_intermediate_code(CPUState *cpu, TranslationBlock *tb, int *max_insns,
                            target_ulong pc, void *host_pc)
 {
     DisasContext dc;
diff --git a/target/loongarch/translate.c b/target/loongarch/translate.c
index 38ced69803..bc7cff5f3f 100644
--- a/target/loongarch/translate.c
+++ b/target/loongarch/translate.c
@@ -246,7 +246,7 @@ static const TranslatorOps loongarch_tr_ops = {
     .disas_log          = loongarch_tr_disas_log,
 };
 
-void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns,
+void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int *max_insns,
                            target_ulong pc, void *host_pc)
 {
     DisasContext ctx;
diff --git a/target/m68k/translate.c b/target/m68k/translate.c
index 18418312b1..9e6b6d07d0 100644
--- a/target/m68k/translate.c
+++ b/target/m68k/translate.c
@@ -6389,7 +6389,7 @@ static const TranslatorOps m68k_tr_ops = {
     .disas_log          = m68k_tr_disas_log,
 };
 
-void gen_intermediate_code(CPUState *cpu, TranslationBlock *tb, int max_insns,
+void gen_intermediate_code(CPUState *cpu, TranslationBlock *tb, int *max_insns,
                            target_ulong pc, void *host_pc)
 {
     DisasContext dc;
diff --git a/target/microblaze/translate.c b/target/microblaze/translate.c
index 974f21eb31..037a652cb9 100644
--- a/target/microblaze/translate.c
+++ b/target/microblaze/translate.c
@@ -1849,7 +1849,7 @@ static const TranslatorOps mb_tr_ops = {
     .disas_log          = mb_tr_disas_log,
 };
 
-void gen_intermediate_code(CPUState *cpu, TranslationBlock *tb, int max_insns,
+void gen_intermediate_code(CPUState *cpu, TranslationBlock *tb, int *max_insns,
                            target_ulong pc, void *host_pc)
 {
     DisasContext dc;
diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
index 624e6b7786..6dbd262ebc 100644
--- a/target/mips/tcg/translate.c
+++ b/target/mips/tcg/translate.c
@@ -16160,7 +16160,7 @@ static const TranslatorOps mips_tr_ops = {
     .disas_log          = mips_tr_disas_log,
 };
 
-void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns,
+void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int *max_insns,
                            target_ulong pc, void *host_pc)
 {
     DisasContext ctx;
diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index 4db8b47744..b0dab8d460 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -1039,7 +1039,7 @@ static const TranslatorOps nios2_tr_ops = {
     .disas_log          = nios2_tr_disas_log,
 };
 
-void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns,
+void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int *max_insns,
                            target_ulong pc, void *host_pc)
 {
     DisasContext dc;
diff --git a/target/openrisc/translate.c b/target/openrisc/translate.c
index 2f3d7c5fd1..b8cd8e0964 100644
--- a/target/openrisc/translate.c
+++ b/target/openrisc/translate.c
@@ -1705,7 +1705,7 @@ static const TranslatorOps openrisc_tr_ops = {
     .disas_log          = openrisc_tr_disas_log,
 };
 
-void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns,
+void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int *max_insns,
                            target_ulong pc, void *host_pc)
 {
     DisasContext ctx;
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 1c17d5a558..5fe6aa641e 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -7707,7 +7707,7 @@ static const TranslatorOps ppc_tr_ops = {
     .disas_log          = ppc_tr_disas_log,
 };
 
-void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns,
+void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int *max_insns,
                            target_ulong pc, void *host_pc)
 {
     DisasContext ctx;
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 01cc30a365..479fc2b128 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -1277,7 +1277,7 @@ static const TranslatorOps riscv_tr_ops = {
     .disas_log          = riscv_tr_disas_log,
 };
 
-void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns,
+void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int *max_insns,
                            target_ulong pc, void *host_pc)
 {
     DisasContext ctx;
diff --git a/target/rx/translate.c b/target/rx/translate.c
index 87a3f54adb..af23876cb3 100644
--- a/target/rx/translate.c
+++ b/target/rx/translate.c
@@ -2363,7 +2363,7 @@ static const TranslatorOps rx_tr_ops = {
     .disas_log          = rx_tr_disas_log,
 };
 
-void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns,
+void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int *max_insns,
                            target_ulong pc, void *host_pc)
 {
     DisasContext dc;
diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index ac5bd98f04..339c1672e9 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -6759,7 +6759,7 @@ static const TranslatorOps s390x_tr_ops = {
     .disas_log          = s390x_tr_disas_log,
 };
 
-void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns,
+void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int *max_insns,
                            target_ulong pc, void *host_pc)
 {
     DisasContext dc;
diff --git a/target/sh4/translate.c b/target/sh4/translate.c
index 7db3468b01..23563024e0 100644
--- a/target/sh4/translate.c
+++ b/target/sh4/translate.c
@@ -2374,7 +2374,7 @@ static const TranslatorOps sh4_tr_ops = {
     .disas_log          = sh4_tr_disas_log,
 };
 
-void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns,
+void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int *max_insns,
                            target_ulong pc, void *host_pc)
 {
     DisasContext ctx;
diff --git a/target/sparc/translate.c b/target/sparc/translate.c
index 150aeecd14..3b0044aa66 100644
--- a/target/sparc/translate.c
+++ b/target/sparc/translate.c
@@ -5904,7 +5904,7 @@ static const TranslatorOps sparc_tr_ops = {
     .disas_log          = sparc_tr_disas_log,
 };
 
-void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns,
+void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int *max_insns,
                            target_ulong pc, void *host_pc)
 {
     DisasContext dc = {};
diff --git a/target/tricore/translate.c b/target/tricore/translate.c
index df9e46c649..59d48faf11 100644
--- a/target/tricore/translate.c
+++ b/target/tricore/translate.c
@@ -8878,7 +8878,7 @@ static const TranslatorOps tricore_tr_ops = {
 };
 
 
-void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns,
+void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int *max_insns,
                            target_ulong pc, void *host_pc)
 {
     DisasContext ctx;
diff --git a/target/xtensa/translate.c b/target/xtensa/translate.c
index 77bcd71030..8d7bf566de 100644
--- a/target/xtensa/translate.c
+++ b/target/xtensa/translate.c
@@ -1279,7 +1279,7 @@ static const TranslatorOps xtensa_translator_ops = {
     .disas_log          = xtensa_tr_disas_log,
 };
 
-void gen_intermediate_code(CPUState *cpu, TranslationBlock *tb, int max_insns,
+void gen_intermediate_code(CPUState *cpu, TranslationBlock *tb, int *max_insns,
                            target_ulong pc, void *host_pc)
 {
     DisasContext dc = {};
-- 
2.34.1


