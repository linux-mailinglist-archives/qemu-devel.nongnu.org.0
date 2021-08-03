Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C8893DE561
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 06:32:07 +0200 (CEST)
Received: from localhost ([::1]:59202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAm62-0000Kj-Df
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 00:32:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mAlpt-0003p2-1X
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 00:15:27 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:52105)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mAlpr-0002SF-BX
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 00:15:24 -0400
Received: by mail-pj1-x1033.google.com with SMTP id mt6so28092524pjb.1
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 21:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+nSj7OTbfA5ZP9C2nrakzWmaQ+ciQS/xl93YDyaz/3Q=;
 b=ySdZEoAuP07eCNAGxMzB+pU91RzgTxMm+IKUsOAIl9cNdIFIeHmlGm2SAtCmCYypR7
 yheXJIDpmYqWTA0xC2xwfciODowb5LyJqEsBACY52u/3b1mGS9wJM+uKAGCcwrO1etqK
 R38yr/D85zwB7MHdUloF4uQaqaBlSsMA6Wl6wjmMnNpgrcZ37NBNcIGF/9hAyt0iZvQt
 0OhUQr/nRuSUDyK0bF8qftQHDg+xGLMAH/Koo2W4lV1Fv2cLKCwCpRGN2dzhZWxJyCVE
 lsmwtX1MLCSUfgHWnC3oINbhwwdOR2DGihvyt2qeDfu2a19JZkBBfQpFZvjiQHKU5RTT
 CCQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+nSj7OTbfA5ZP9C2nrakzWmaQ+ciQS/xl93YDyaz/3Q=;
 b=X075WTi2U7IZhLG4/7h+N45I3thJcFGzIUJdBtPgfe86lrwaqTXyYHfGyS1f+r7sjR
 15UidTScOKLEjNjq+m5RuNFbJn8hgI/ReFCp8ng34vY1Kj2EzlKOnsjIxURFvx1MM3Wp
 Itwsm56S0CMz9L0Rz/NufJmMFt1KqF2Jm7NPByznW2RuunDSwD8br9Q7jYTLpuc/HQoW
 Oe+V6nIlJD+VU5Bm0HZlGYg7Jtl+bb6WPsLhxujM8alBp2SfRbHiVRpYo6KCuxe7NAeU
 tchIZ16kSWmU/5zK/uXyo8g6mWDPpFY7R9ykM50D4FUFeuIyj/eiIiWMKs/jVFE0Bbhs
 AgSw==
X-Gm-Message-State: AOAM533DAWzp40eQ+5jXv260snFODZA4b33O2Is982rpqHsrukL7tFjE
 jtXLdOAAN6yITsXhJQ9x8Lsxperz8dojjw==
X-Google-Smtp-Source: ABdhPJw1PNXK2JD1xYc3k39a7fdMvF2IRmBQjyCADEF0HM6VODlGq8kDrEu4Eq0L0tSpxrCMMN7mnw==
X-Received: by 2002:a17:90b:3747:: with SMTP id
 ne7mr20327930pjb.64.1627964122088; 
 Mon, 02 Aug 2021 21:15:22 -0700 (PDT)
Received: from localhost.localdomain (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id c23sm13718532pfn.140.2021.08.02.21.15.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Aug 2021 21:15:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 31/55] target/ppc: Use MO_128 for 16 byte atomics
Date: Mon,  2 Aug 2021 18:14:19 -1000
Message-Id: <20210803041443.55452-32-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210803041443.55452-1-richard.henderson@linaro.org>
References: <20210803041443.55452-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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
Cc: qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc: qemu-ppc@nongnu.org
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/translate.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 171b216e17..540efa858f 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -3461,10 +3461,12 @@ static void gen_std(DisasContext *ctx)
             if (HAVE_ATOMIC128) {
                 TCGv_i32 oi = tcg_temp_new_i32();
                 if (ctx->le_mode) {
-                    tcg_gen_movi_i32(oi, make_memop_idx(MO_LEQ, ctx->mem_idx));
+                    tcg_gen_movi_i32(oi, make_memop_idx(MO_LE | MO_128,
+                                                        ctx->mem_idx));
                     gen_helper_stq_le_parallel(cpu_env, EA, lo, hi, oi);
                 } else {
-                    tcg_gen_movi_i32(oi, make_memop_idx(MO_BEQ, ctx->mem_idx));
+                    tcg_gen_movi_i32(oi, make_memop_idx(MO_BE | MO_128,
+                                                        ctx->mem_idx));
                     gen_helper_stq_be_parallel(cpu_env, EA, lo, hi, oi);
                 }
                 tcg_temp_free_i32(oi);
@@ -4066,11 +4068,11 @@ static void gen_lqarx(DisasContext *ctx)
         if (HAVE_ATOMIC128) {
             TCGv_i32 oi = tcg_temp_new_i32();
             if (ctx->le_mode) {
-                tcg_gen_movi_i32(oi, make_memop_idx(MO_LEQ | MO_ALIGN_16,
+                tcg_gen_movi_i32(oi, make_memop_idx(MO_LE | MO_128 | MO_ALIGN,
                                                     ctx->mem_idx));
                 gen_helper_lq_le_parallel(lo, cpu_env, EA, oi);
             } else {
-                tcg_gen_movi_i32(oi, make_memop_idx(MO_BEQ | MO_ALIGN_16,
+                tcg_gen_movi_i32(oi, make_memop_idx(MO_BE | MO_128 | MO_ALIGN,
                                                     ctx->mem_idx));
                 gen_helper_lq_be_parallel(lo, cpu_env, EA, oi);
             }
@@ -4121,7 +4123,7 @@ static void gen_stqcx_(DisasContext *ctx)
 
     if (tb_cflags(ctx->base.tb) & CF_PARALLEL) {
         if (HAVE_CMPXCHG128) {
-            TCGv_i32 oi = tcg_const_i32(DEF_MEMOP(MO_Q) | MO_ALIGN_16);
+            TCGv_i32 oi = tcg_const_i32(DEF_MEMOP(MO_128) | MO_ALIGN);
             if (ctx->le_mode) {
                 gen_helper_stqcx_le_parallel(cpu_crf[0], cpu_env,
                                              EA, lo, hi, oi);
-- 
2.25.1


