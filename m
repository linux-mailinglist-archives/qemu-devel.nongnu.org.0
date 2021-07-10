Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDB043C3535
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Jul 2021 17:39:47 +0200 (CEST)
Received: from localhost ([::1]:38262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2F50-0008Ch-V2
	for lists+qemu-devel@lfdr.de; Sat, 10 Jul 2021 11:39:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m2ExN-00053p-EF
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 11:31:53 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:39681)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m2ExL-0002EX-Hd
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 11:31:53 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 p14-20020a17090ad30eb02901731c776526so7665935pju.4
 for <qemu-devel@nongnu.org>; Sat, 10 Jul 2021 08:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YLJ230I1oEo8wIMfdqq6LnEEYsPnK+bG8iGL/6v72HE=;
 b=gVpAOqLn+f74efQ6shB0Z+7X1nZlH7rcD1oFtW0rxqglvJ8WxYJ468IGUazzmgXOqJ
 j8+MCFUpnOeGBdWZwl2O/AVH/0mnX8FmGLNLyVWZJYJLoU23B8ByYTwAblCgZI3XKA0t
 PEasLwoxttyjX4bB8/IGcrHXZhvOIBdMuKqsCIlWu9imAbCL/M/oHOrMzOVQuwFxEoTs
 zZoVdlZWiaFY0criETRISRj1fXYAZbunITZpSuZk7OhLrdRW6LtSnIxPsnRARyPMudSw
 HDITHnfh4nQJT7Umlzx15gTlZ7+YGq9pnn13PJTN59t28OKfVgmtdUrCjjr+aWUmaaJT
 ch5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YLJ230I1oEo8wIMfdqq6LnEEYsPnK+bG8iGL/6v72HE=;
 b=NDmdzssHHCLSGTZDGEvGTRJhiEx4nh+IeknVkn3nR+pZktEAVlkBc4kke6swSGDnkU
 PHP88380m3IwDyyXC0KtewNuRaGFFisk3O3n5r8NoZ0839/l9b8cyd/APt9Bh4Y2bwie
 LEQZ+qAfQJFf6U0Mq5sLyjxBJztXvTwnEzrOjX/PZ+qaVmE2bIzTdorcC2zg86Pyfe0/
 9pK6k1yW1kqw+Bkd0ieBWfpU4wwZdN66TqryVA+1ionIzzWQCpHCzY1kMJvR+g76qY1W
 2PG9WOc6y8XkKfdoMiNyNSE4SM3YbuK9uZcHft8KCxDhjM8GzDvdWO01rGsu219Z+PGt
 pSNQ==
X-Gm-Message-State: AOAM533jmsEGG5R/+hsnM+8I9kqla7r/VC5WUwgqG8hbHEdaM1iqeeD0
 gwtzNa+t7WV7iRPmcP6SPG9UJNUlQ15jfg==
X-Google-Smtp-Source: ABdhPJziXB0Dm5sk0OkzZNx+VbXOB/sYJOXpG0f1di+VcJwKQUsBlT4klI8yoY6XBJMAiHx3XtU9Mw==
X-Received: by 2002:a17:90a:86c6:: with SMTP id
 y6mr8023192pjv.16.1625931110256; 
 Sat, 10 Jul 2021 08:31:50 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id u23sm11975374pgk.38.2021.07.10.08.31.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Jul 2021 08:31:50 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 07/41] target/alpha: Remove use_exit_tb
Date: Sat, 10 Jul 2021 08:31:09 -0700
Message-Id: <20210710153143.1320521-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210710153143.1320521-1-richard.henderson@linaro.org>
References: <20210710153143.1320521-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We have not needed to end a TB for I/O since ba3e7926691
("icount: clean up cpu_can_io at the entry to the block").
We do not need to use exit_tb for singlestep, which only
means generate one insn per TB.

Which leaves only singlestep_enabled, which means raise a
debug trap after every TB, which does not use exit_tb,
which would leave the function mis-named.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/alpha/translate.c | 15 ++-------------
 1 file changed, 2 insertions(+), 13 deletions(-)

diff --git a/target/alpha/translate.c b/target/alpha/translate.c
index a607c898f4..cb2cb2de6b 100644
--- a/target/alpha/translate.c
+++ b/target/alpha/translate.c
@@ -449,19 +449,8 @@ static bool in_superpage(DisasContext *ctx, int64_t addr)
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
@@ -1270,7 +1259,7 @@ static DisasJumpType gen_call_pal(DisasContext *ctx, int palcode)
            need the page permissions check.  We'll see the existence of
            the page when we create the TB, and we'll flush all TBs if
            we change the PAL base register.  */
-        if (!use_exit_tb(ctx)) {
+        if (!ctx->base.singlestep_enabled) {
             tcg_gen_goto_tb(0);
             tcg_gen_movi_i64(cpu_pc, entry);
             tcg_gen_exit_tb(ctx->base.tb, 0);
@@ -3094,7 +3083,7 @@ static void alpha_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
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


