Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9119B3AE16F
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 03:39:14 +0200 (CEST)
Received: from localhost ([::1]:47716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lv8u9-0003eq-H8
	for lists+qemu-devel@lfdr.de; Sun, 20 Jun 2021 21:39:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lv8pq-0003eK-Qb
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 21:34:46 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:37756)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lv8pn-00058Z-HV
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 21:34:46 -0400
Received: by mail-pg1-x52b.google.com with SMTP id t9so12822723pgn.4
 for <qemu-devel@nongnu.org>; Sun, 20 Jun 2021 18:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=N8g+aqSIVx1gl+cogu+CC6dpxUuqUQpSlSSilhD6d5A=;
 b=LV2ilcqQXl3yoBtJxClrtrEJZquWSmfBxWuCV63iW3VeP+l+QEkf+w11XgYBBFQjUJ
 hdKb5hRYfNes4A4CquRGr4FO5eGHUHlm4G/QoZMSvkfCrGjqrFWlMwgZxnLRgrZZX9KO
 Jg3q6ulSOdYom3xvt21aEA7Iht/4AlOH6HIXzmS/kJgvPjr2LJ4BJwjY0H6/p1quii7O
 W1JUg7MeUkcj9beoYdUcKg4nxyfA6xY+Ixg27uzqRNzaZ1YxfWkhIkBcvpfWk8pNu+HO
 Wi35iNJj4bMxbIHQcfUsDH6Za28pRD9OWDMouwAWowF/D5MU7UmqvfrsWDMAySwFk3YB
 wnLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=N8g+aqSIVx1gl+cogu+CC6dpxUuqUQpSlSSilhD6d5A=;
 b=bMmYfLv43ppE6MmeAYP632SXujGHtLKwp6J3szkIDzSWygsDXenNiJNEgfJO8MGKfq
 Xzpr5aFOU5iuWNXlxXqJmagLC9wmAaLjwVuZ3zsYjWGMuC3EeRvmQZNyl0X08L4QXKfK
 pnz22n/zedoa+fgwI61aqxYD4EQAppQQ2P3zsbnSXYOWByGHjmWlP9Rd3sbkIfX8+wBR
 sWdmsEg/vlZbfd37LqvaRYVvkkFuZXX0O0eNLehwMUvtJy0x826ld2S13OCGC0DwmfLr
 6xhyIubzNmZx2vF4oZRfTIQCKTuTWAmPcyRBduqv8YrPKMoPwqWy8JLNAaWvW44rXdWp
 7Apw==
X-Gm-Message-State: AOAM531acAAZoiwstC55rhXji3a1GMQY6+aOVdZVKHOY9wUDnoc2wn4T
 GtfzLB+WllCuTSKa8UKkD/4t9+sRl3azbg==
X-Google-Smtp-Source: ABdhPJws38Cplzea8cGUKAI0U2QS5xV3A64yRqD9Mzsi+pkFyVEVT+yB0vLAQmibyC6tDETXKYbn4w==
X-Received: by 2002:a62:d447:0:b029:291:19f7:ddcd with SMTP id
 u7-20020a62d4470000b029029119f7ddcdmr17030953pfl.54.1624239282158; 
 Sun, 20 Jun 2021 18:34:42 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id s27sm1495628pfg.169.2021.06.20.18.34.41
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Jun 2021 18:34:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 02/26] target/alpha: Remove use_exit_tb
Date: Sun, 20 Jun 2021 18:34:15 -0700
Message-Id: <20210621013439.1791385-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210621013439.1791385-1-richard.henderson@linaro.org>
References: <20210621013439.1791385-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
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
index f454adea5e..70ba4a67c7 100644
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
@@ -3020,7 +3009,7 @@ static void alpha_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
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


