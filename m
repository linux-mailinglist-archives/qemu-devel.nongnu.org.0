Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13C243C17D9
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 19:11:58 +0200 (CEST)
Received: from localhost ([::1]:43188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1XZ7-0002uq-2i
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 13:11:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1X5C-0001XM-Ff
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 12:41:02 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:39849)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1X53-00089w-Hk
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 12:41:02 -0400
Received: by mail-pg1-x529.google.com with SMTP id a2so6596333pgi.6
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 09:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wSdjr/g6ebURffabwRVQ49phX7WVAZtuCPeYDJ3HffQ=;
 b=ng0PfcGHdqzM5NoXu6ao5ZApl6JorEieP90ngJ2UgWItpRAgZAqk11xUqvok1H/KBr
 jcnWbemeNj9ZLv/4Akt70PgfhUxFcQDKSfIQ/LRjXyq80USiYA/snkzoA4D/ajdvxBJn
 Azm+JTf6r/daNXiWn4UdQkvIjGTIFbXJY0+E1LyBqpVc0YbUAenNSMH0Cu4Fxop/wd8C
 PAN74WefLZ9+9EIrbZKYbWKhQDsoidki7q5m4OgHN6lbrtm6R6M5rIcLlTPeenjOvAFP
 sYOiF15h3F2Ndo1haw6/WcOs4eF7X4/SiDoV0Hd3L6mBqD+nDssOiVKELqLRtGG4KAnS
 26PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wSdjr/g6ebURffabwRVQ49phX7WVAZtuCPeYDJ3HffQ=;
 b=aEsFIIftf3hFPBRPC1sqwENNOWfkqwtXyTkgxFj/Z1/pb0Wbm1vqqpKy86xfmFg+0W
 YxEdqRBx/8wg1nOIdJsdnt3B3sflfDYd6BKE1dPkYRrJeZcm6UX5XYwZrvW+8LBnqfTx
 rrepa84Y9aWcsLslRV7LFOo2Xuv9I+3/1S86ZqjyUKUu0uf/jUp6sSnZy8GcbPLiQ2ke
 HIcVwhFU3smdBla4AomPIps/PIo2i79ilw7vQOhqjWwtVxUK7lGtra+Fl4uju44sJf5J
 GtJXjEs1dxAJW/e+aHCu4fDfyw+mEMGh//zwUhkI7L9VYanI+Q7BPnVHWKNhOkJ5pT+a
 /7Iw==
X-Gm-Message-State: AOAM533qAiEIUBpAC7ZfmkmckIJA5wxf+u9rZ/r9YSvgd1QkibSoNXj/
 I06x7arEucbLFBEh/e1eGtoWGTCIzwOsOA==
X-Google-Smtp-Source: ABdhPJxp/8cy4S/6NxZbp/bV38OqsOutH1sjnkSZjxO41zlipgXkL3DYsVSyf1UzXGr6Lex/K/nJhg==
X-Received: by 2002:a63:5156:: with SMTP id r22mr33647059pgl.264.1625762452094; 
 Thu, 08 Jul 2021 09:40:52 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id j129sm3465678pfb.132.2021.07.08.09.40.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 09:40:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 02/28] target/alpha: Remove use_exit_tb
Date: Thu,  8 Jul 2021 09:40:24 -0700
Message-Id: <20210708164050.711967-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210708164050.711967-1-richard.henderson@linaro.org>
References: <20210708164050.711967-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
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


