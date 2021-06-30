Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED6B93B8899
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 20:39:30 +0200 (CEST)
Received: from localhost ([::1]:49234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyf7R-0005KD-Nh
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 14:39:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyf0j-00055R-Ex
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 14:32:33 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:44751)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyf0g-0001xy-FI
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 14:32:33 -0400
Received: by mail-pf1-x42c.google.com with SMTP id g21so3293517pfc.11
 for <qemu-devel@nongnu.org>; Wed, 30 Jun 2021 11:32:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=3aENiAfNt4e6plWtqF3mZo/s7tnSV/nuj/JuhYL6FAk=;
 b=ATtaXdMXnhF5nQIO17QxLhyrN5NbccW8YtyBbOw/u2/7eJSP7qonNirtNNNltd2ChL
 iEIXR0exj9zSh638oocrajTwMEvQngr6BZ5ksdfcO/1wktm87Y2IiFq4yXCQFbNBcdPo
 P2cAdGGTWOraR9ifmssxIvWkpugFyhbAZpXKJzYXZlKQDgp8Cvorb5SP3+rrp7qRWEsh
 pPthfkjQJS4q++N9VUyfhZ7UJGU73W12xbc3vNJsClbpcxn1EC5p7OI3pbDNA3ZtWMoV
 uRx2qSFVJy7oVUG2usVVOozC534i4I/rudZu4ARE6lyVd1HYrs3WRDAiHhzcN7olYv26
 sadg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3aENiAfNt4e6plWtqF3mZo/s7tnSV/nuj/JuhYL6FAk=;
 b=biaGbIdgWhxifB11pHkpCLtXCEGprkXIPrEwZ0LJ/5/svN/vuXxAMAwsuAeSovi6xY
 IiefAGRg+NUJBnNIG+pFWPT4tUirgWw2e17WZHi+xNdAbqsIp9LeQHUmM8kWXgvaoBgp
 d4tW1Xv9tuPtZCpVLLlQr29MIWJL0xVD0Z8LIkD1VflmiWF9ONwyfCpziC/7plVYTMx1
 wFk8EZJadjmNoL7yBah8l2njP/HPs1ydXA4rXdiGPuBKTV0vnz+MkSsW6x4HJ2jYeWZk
 Y5+XVyRbAfrrt3V7R29XJDKgSV0VGAa1WpkJ3uOMEc3CethYX4sH/c2XTekgGxOgtElC
 6DsA==
X-Gm-Message-State: AOAM530mN14cAia3/DjW3HP4BTevXEqqbRgcod8fEJzSZq8enXk/il1c
 pP66tikxSdBo3Tinp1XyKr/+CY5CCxmnoA==
X-Google-Smtp-Source: ABdhPJxDUX4YhAi0YT+T/9H5ShHyob3y9sj+rKnwsXtXLghWdwQtj0GSvE6mpv/ORYXAHuuzcOwHuQ==
X-Received: by 2002:a05:6a00:882:b029:30d:cd4e:79f with SMTP id
 q2-20020a056a000882b029030dcd4e079fmr12899320pfj.75.1625077949212; 
 Wed, 30 Jun 2021 11:32:29 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id m18sm23909517pff.88.2021.06.30.11.32.28
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Jun 2021 11:32:29 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 02/28] target/alpha: Remove use_exit_tb
Date: Wed, 30 Jun 2021 11:32:00 -0700
Message-Id: <20210630183226.3290849-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210630183226.3290849-1-richard.henderson@linaro.org>
References: <20210630183226.3290849-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
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

We have not needed to end a TB for I/O since ba3e7926691
("icount: clean up cpu_can_io at the entry to the block").
We do not need to use exit_tb for singlestep, which only
means generate one insn per TB.

Which leaves only singlestep_enabled, which means raise a
debug trap after every TB, which does not use exit_tb,
which would leave the function mis-named.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/alpha/translate.c | 15 ++-------------
 1 file changed, 2 insertions(+), 13 deletions(-)

diff --git a/target/alpha/translate.c b/target/alpha/translate.c
index f2922f5f8c..aaedf78116 100644
--- a/target/alpha/translate.c
+++ b/target/alpha/translate.c
@@ -450,19 +450,8 @@ static bool in_superpage(DisasContext *ctx, int64_t addr)
 #endif
 }
 
-static bool use_exit_tb(DisasContext *ctx)
-{
-    return ((tb_cflags(ctx->base.tb) & CF_LAST_IO)
-            || ctx->base.singlestep_enabled
-            || singlestep);
-}
-
 static bool use_goto_tb(DisasContext *ctx, uint64_t dest)
 {
-    /* Suppress goto_tb in the case of single-steping and IO.  */
-    if (unlikely(use_exit_tb(ctx))) {
-        return false;
-    }
 #ifndef CONFIG_USER_ONLY
     /* If the destination is in the superpage, the page perms can't change.  */
     if (in_superpage(ctx, dest)) {
@@ -1271,7 +1260,7 @@ static DisasJumpType gen_call_pal(DisasContext *ctx, int palcode)
            need the page permissions check.  We'll see the existence of
            the page when we create the TB, and we'll flush all TBs if
            we change the PAL base register.  */
-        if (!use_exit_tb(ctx)) {
+        if (!ctx->base.singlestep_enabled) {
             tcg_gen_goto_tb(0);
             tcg_gen_movi_i64(cpu_pc, entry);
             tcg_gen_exit_tb(ctx->base.tb, 0);
@@ -3095,7 +3084,7 @@ static void alpha_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
         tcg_gen_movi_i64(cpu_pc, ctx->base.pc_next);
         /* FALLTHRU */
     case DISAS_PC_UPDATED:
-        if (!use_exit_tb(ctx)) {
+        if (!ctx->base.singlestep_enabled) {
             tcg_gen_lookup_and_goto_ptr();
             break;
         }
-- 
2.25.1


