Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1D8D5A8DCE
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 07:56:49 +0200 (CEST)
Received: from localhost ([::1]:46854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTdC4-0005wT-P0
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 01:56:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oTd4S-00074P-4v
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 01:48:57 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:46621)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oTd4P-0002TD-6T
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 01:48:55 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 k6-20020a05600c1c8600b003a54ecc62f6so761539wms.5
 for <qemu-devel@nongnu.org>; Wed, 31 Aug 2022 22:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=osXM6kebf211jyJTnRVlg1LBiYlRKdmijrWPSS9x4Wo=;
 b=x2uGWdT/ZYePepG3NSmVyD9zoGF6zyfvPZ5OcAfQxyFzIYvrb+GXL/vNJP4ALg6cHY
 KWG8X4ZVfEQc1K6sbonJ3dNoi0yqwVrNs/aPmIeo84hSZms4mscZkORiIhFSw4sjszwg
 6jmC16xkNPpXzmU784EbkZ3EZ9q3jP83XxUSzslb4rLODnTRtY8H2cO24BJMHdt3W2d3
 GEHlDHWUq0sQb3+qRKizl4VzUOuVbw5DAitU9P6eeBNjG+r6h2X2tsel1+eXiGY98lsh
 B9/3wF1rrmlPmvvFyj87yMUssxaY+j+5TUJ8jibyhzuZEVERNKN/s/u/OI4Q8Q1kI0Q1
 G/4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=osXM6kebf211jyJTnRVlg1LBiYlRKdmijrWPSS9x4Wo=;
 b=rCI+sYQt5pQM62LAcGSk7ky1i3yx61jJrJOl974yfhDY/wCwbNl65KO83pvTM6iaPE
 IuPOTeqvzVbosJGBsS2JVayVTlWI7icTje/gkUq+27z6iloppWzukDdQFwAx0qq7/vfw
 LX/soBykfUpxizvKHZKnBtzj3WR9CIGFcw6h7d0E0qVcyNzawD1qJdWU1hq5/OC+Q/Mn
 snTH1XAneEmr7m83Xz/wnWj4w3CDre8Lh20kjNf+cN69FgGXfpWOIvL8l9FPGM/CW5YY
 8pk1UvAbPidNq+68GNs1FRErmJSKTJnIv8/u03Jn2b+SrX3FgpnWkPrpRp7A2TOB3z7Q
 xM/A==
X-Gm-Message-State: ACgBeo3AWNeFpAOEuwqdjYouprXMhdbnmkFDEMs3m1I1OLMZJyyOkmaA
 1uCHna5At9CBDNDOOr9M6cvTjKRGwgBgeXLPMhE=
X-Google-Smtp-Source: AA6agR4DkKIm1RiyFgpRCOQPd0qwt9hnJ9iAnBr/ig6ci8QcU2N3z9zUpMPl5BC3/zttHqoqpKR3EA==
X-Received: by 2002:a05:600c:1d14:b0:3a5:e8ba:f394 with SMTP id
 l20-20020a05600c1d1400b003a5e8baf394mr3894705wms.137.1662011331566; 
 Wed, 31 Aug 2022 22:48:51 -0700 (PDT)
Received: from localhost.localdomain ([87.192.221.83])
 by smtp.gmail.com with ESMTPSA id
 q13-20020adff78d000000b0022533c4fa48sm13429938wrp.55.2022.08.31.22.48.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Aug 2022 22:48:50 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Michael Rolnik <mrolnik@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL 4/4] target/avr: Disable interrupts when env->skip set
Date: Thu,  1 Sep 2022 06:48:43 +0100
Message-Id: <20220901054843.31646-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220901054843.31646-1-richard.henderson@linaro.org>
References: <20220901054843.31646-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x335.google.com
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


