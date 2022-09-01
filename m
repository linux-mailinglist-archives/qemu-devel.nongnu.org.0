Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7BD15A8FFC
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 09:21:51 +0200 (CEST)
Received: from localhost ([::1]:53444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTeWM-0001D7-KG
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 03:21:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oTe4A-0005v5-4t
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 02:52:47 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:45914)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oTe47-0003G2-Vp
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 02:52:41 -0400
Received: by mail-wr1-x42e.google.com with SMTP id w5so4831641wrn.12
 for <qemu-devel@nongnu.org>; Wed, 31 Aug 2022 23:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=osXM6kebf211jyJTnRVlg1LBiYlRKdmijrWPSS9x4Wo=;
 b=P5WP1BaHPbW8kc19nsfqo7KRtUVJcL4r41BBgcQYOgpS3qiQbI6Afuo1dEeet9BZ+Y
 6UcKS618BMMsrW+X3lbfsHUrc6ySwVr192gEOVoolgrvMPUVJqXk+k2A/8ysCEcXLbwg
 F+gCZjta/NtZrQZkywPHT2Nl3HR3zW0jtZejKyZUhEoNFNDce5J1/g+h4aNbK1Qsd4ee
 dhBtJAOy13pl3uzoa7bXuTsKX7HqpLIoJ7C0pE9fi/dS12NIL/D/uhZ5Wxfh1eHix4C0
 0tj77MKCnN/00Wasm455yREtDF0fVljkyuvYjbpF9NnR9AT1q+fB8bNPGD8he1THYkKc
 lOOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=osXM6kebf211jyJTnRVlg1LBiYlRKdmijrWPSS9x4Wo=;
 b=seiq2gHqU3GD4btkWoIqnlEQUUrndjD2Z/JdIMxj+Fw8jrcq2m5/24qk1/0QLfhO0R
 lvu4ql24Y8WhOP/o0pzOkRtkY1+RdUwLOr7LcdddIOmO4HJ7v8zpexXmAqpcF3ZFnM2t
 GlqG7meu4gvY7eYOiupHxNSaGvQcBYKYpI3TVBDhSvCNtTLrzjA0irv54SIT5wNJTyhj
 GCVrxlwkdqnxNmuUYB8Vo7zo4swrX3myka5XejBPUA+QJ0zv1Dtkouuj0FU8pK9kf9kE
 nKFmrDiFAxIUGs8XbCcSDMn1y66zkVLzFhAxWtwiwivhZBDwqeIk56LVMHiCgJGiwwqQ
 7xwA==
X-Gm-Message-State: ACgBeo2r0ET9gWKNagq2pIHtrI8/HvLHRLqar0YE9xD+KymxwKDk/2xL
 gNcImEDMIR+JDTCLwmS2MHmcy7raQl/+GaBb
X-Google-Smtp-Source: AA6agR6p+vw0IIZK4pcdIi0ctV5Ohps4h8+o0/k0rvEJt2SRf/ukC2BDzkfuFAOdYWQEhyBPeXHAUQ==
X-Received: by 2002:a5d:64c9:0:b0:226:dfa0:3fa7 with SMTP id
 f9-20020a5d64c9000000b00226dfa03fa7mr8469555wri.350.1662015159205; 
 Wed, 31 Aug 2022 23:52:39 -0700 (PDT)
Received: from stoup.. ([87.192.221.83]) by smtp.gmail.com with ESMTPSA id
 a6-20020a5d4d46000000b00226dedf1ab7sm8308153wru.76.2022.08.31.23.52.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Aug 2022 23:52:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Michael Rolnik <mrolnik@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL 4/4] target/avr: Disable interrupts when env->skip set
Date: Thu,  1 Sep 2022 07:51:54 +0100
Message-Id: <20220901065210.117081-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220901065210.117081-1-richard.henderson@linaro.org>
References: <20220901065210.117081-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This bit is not saved across interrupts, so we must
delay delivering the interrupt until the skip has
been processed.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1118
Reviewed-by: Michael Rolnik <mrolnik@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/avr/helper.c    |  9 +++++++++
 target/avr/translate.c | 26 ++++++++++++++++++++++----
 2 files changed, 31 insertions(+), 4 deletions(-)

diff --git a/target/avr/helper.c b/target/avr/helper.c
index 34f1cbffb2..156dde4e92 100644
--- a/target/avr/helper.c
+++ b/target/avr/helper.c
@@ -31,6 +31,15 @@ bool avr_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
     AVRCPU *cpu = AVR_CPU(cs);
     CPUAVRState *env = &cpu->env;
 
+    /*
+     * We cannot separate a skip from the next instruction,
+     * as the skip would not be preserved across the interrupt.
+     * Separating the two insn normally only happens at page boundaries.
+     */
+    if (env->skip) {
+        return false;
+    }
+
     if (interrupt_request & CPU_INTERRUPT_RESET) {
         if (cpu_interrupts_enabled(env)) {
             cs->exception_index = EXCP_RESET;
diff --git a/target/avr/translate.c b/target/avr/translate.c
index dc9c3d6bcc..026753c963 100644
--- a/target/avr/translate.c
+++ b/target/avr/translate.c
@@ -2971,8 +2971,18 @@ static void avr_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
     if (skip_label) {
         canonicalize_skip(ctx);
         gen_set_label(skip_label);
-        if (ctx->base.is_jmp == DISAS_NORETURN) {
+
+        switch (ctx->base.is_jmp) {
+        case DISAS_NORETURN:
             ctx->base.is_jmp = DISAS_CHAIN;
+            break;
+        case DISAS_NEXT:
+            if (ctx->base.tb->flags & TB_FLAGS_SKIP) {
+                ctx->base.is_jmp = DISAS_TOO_MANY;
+            }
+            break;
+        default:
+            break;
         }
     }
 
@@ -2989,6 +2999,11 @@ static void avr_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
 {
     DisasContext *ctx = container_of(dcbase, DisasContext, base);
     bool nonconst_skip = canonicalize_skip(ctx);
+    /*
+     * Because we disable interrupts while env->skip is set,
+     * we must return to the main loop to re-evaluate afterward.
+     */
+    bool force_exit = ctx->base.tb->flags & TB_FLAGS_SKIP;
 
     switch (ctx->base.is_jmp) {
     case DISAS_NORETURN:
@@ -2997,7 +3012,7 @@ static void avr_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
     case DISAS_NEXT:
     case DISAS_TOO_MANY:
     case DISAS_CHAIN:
-        if (!nonconst_skip) {
+        if (!nonconst_skip && !force_exit) {
             /* Note gen_goto_tb checks singlestep.  */
             gen_goto_tb(ctx, 1, ctx->npc);
             break;
@@ -3005,8 +3020,11 @@ static void avr_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
         tcg_gen_movi_tl(cpu_pc, ctx->npc);
         /* fall through */
     case DISAS_LOOKUP:
-        tcg_gen_lookup_and_goto_ptr();
-        break;
+        if (!force_exit) {
+            tcg_gen_lookup_and_goto_ptr();
+            break;
+        }
+        /* fall through */
     case DISAS_EXIT:
         tcg_gen_exit_tb(NULL, 0);
         break;
-- 
2.34.1


