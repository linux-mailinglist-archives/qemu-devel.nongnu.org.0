Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E70FD3B88BB
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 20:49:55 +0200 (CEST)
Received: from localhost ([::1]:47104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyfHW-000665-U1
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 14:49:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyf0w-0005iU-Eq
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 14:32:46 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:44761)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyf0u-000295-Kh
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 14:32:46 -0400
Received: by mail-pf1-x435.google.com with SMTP id g21so3294057pfc.11
 for <qemu-devel@nongnu.org>; Wed, 30 Jun 2021 11:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HmrvZ2YDmFmQRowDiyGgkhSWbFuv8fekjQLGpsBU/NM=;
 b=ekLix1XCLSvz6b8h7f8cx7/My6vueHR/trnQ/pu1a/YM14JF5iRUiL2iJxpF2Jsjn3
 9/lstKSfp9+WNxVau8TVNPQx+haTrDQy6JQVXZnKEZikaUxlEkobfqvVXc9jt4OtQ9Yy
 5uInSLRq5ua/AvsNbWd70cuBGcTz/OSytxFYu+H2OmzBd7yDxw6cG7F2nU8YntnL+zOy
 0THvF+Clw7O4b3an0nI62pXfNNkA5mQ/YJBPb8qQzoxwjE9/U++2969znzO25h04/YEo
 U36iTwCjSuZ9X7kqmhJCFvwX8Pt3qNLFMpS4CaSNLOJCrTillFyLT/uj/rMIPLZ4Vzjb
 0JAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HmrvZ2YDmFmQRowDiyGgkhSWbFuv8fekjQLGpsBU/NM=;
 b=hrW+DGr5r41RlKfFOO/cjwYJ3J3kWaX6zitn+us4ROjXUQmyA16BLsMQbkks/mZvdp
 UuM1mM9jA9iseWU0M5ObuWM7Kn7QZ3aNGP7aL4Hc4k+rxAsOGfPPMzG6oC7H13FspXdY
 +jkphn7hMTUJx4xkFg/I37aK4espJuiOmxa1WL8FdRJh2EL3w4x5EvYSmTMsFk68UWfq
 uWQSzbGuSTgqfa+lhggWWXqiGmv1OOI50ar4YZxNutZqI1tMs0Zb97Mdo2SxsWoqBneY
 HWhfYPqRxRbt7IrqWUydfu5rOtSRRM1cwPSKfVFBUFXBd0+wGMOPFqzx+rN9GYmmi7m/
 lmIw==
X-Gm-Message-State: AOAM5317gwqhtUA6z0y84ZXnPeuW8ma02ZnPdpWJOSrawSAabON4OOXV
 zHc81fq7UVON9OffQeeua3lGNvc/IbirnA==
X-Google-Smtp-Source: ABdhPJyd4CtZfyurpmEJqiDoSPcy+3iOzRnQKYJq8ee/mz9UwTkurpVLb0xeo2E+q3RrJyaoz37dXw==
X-Received: by 2002:a63:3704:: with SMTP id e4mr34965806pga.310.1625077963390; 
 Wed, 30 Jun 2021 11:32:43 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id m18sm23909517pff.88.2021.06.30.11.32.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Jun 2021 11:32:43 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 26/28] target/tricore: Use translator_use_goto_tb
Date: Wed, 30 Jun 2021 11:32:24 -0700
Message-Id: <20210630183226.3290849-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210630183226.3290849-1-richard.henderson@linaro.org>
References: <20210630183226.3290849-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
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
Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Just use translator_use_goto_tb directly at the one call site,
rather than maintaining a local wrapper.

Reviewed-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/tricore/translate.c | 17 ++---------------
 1 file changed, 2 insertions(+), 15 deletions(-)

diff --git a/target/tricore/translate.c b/target/tricore/translate.c
index 2a814263de..09465ea013 100644
--- a/target/tricore/translate.c
+++ b/target/tricore/translate.c
@@ -3225,19 +3225,6 @@ static inline void gen_save_pc(target_ulong pc)
     tcg_gen_movi_tl(cpu_PC, pc);
 }
 
-static inline bool use_goto_tb(DisasContext *ctx, target_ulong dest)
-{
-    if (unlikely(ctx->base.singlestep_enabled)) {
-        return false;
-    }
-
-#ifndef CONFIG_USER_ONLY
-    return (ctx->base.tb->pc & TARGET_PAGE_MASK) == (dest & TARGET_PAGE_MASK);
-#else
-    return true;
-#endif
-}
-
 static void generate_qemu_excp(DisasContext *ctx, int excp)
 {
     TCGv_i32 tmp = tcg_const_i32(excp);
@@ -3246,9 +3233,9 @@ static void generate_qemu_excp(DisasContext *ctx, int excp)
     tcg_temp_free(tmp);
 }
 
-static inline void gen_goto_tb(DisasContext *ctx, int n, target_ulong dest)
+static void gen_goto_tb(DisasContext *ctx, int n, target_ulong dest)
 {
-    if (use_goto_tb(ctx, dest)) {
+    if (translator_use_goto_tb(&ctx->base, dest)) {
         tcg_gen_goto_tb(n);
         gen_save_pc(dest);
         tcg_gen_exit_tb(ctx->base.tb, n);
-- 
2.25.1


