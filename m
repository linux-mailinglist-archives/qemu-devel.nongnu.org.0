Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E16CE3F15E4
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 11:11:45 +0200 (CEST)
Received: from localhost ([::1]:43378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGe5Q-0004NE-Rh
	for lists+qemu-devel@lfdr.de; Thu, 19 Aug 2021 05:11:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGdzP-0006VO-OV
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 05:05:31 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:43840)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGdzN-0000Jf-MR
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 05:05:31 -0400
Received: by mail-pl1-x634.google.com with SMTP id x1so972940plg.10
 for <qemu-devel@nongnu.org>; Thu, 19 Aug 2021 02:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=L1Ca37LIpmgaqyZMi4/RcqkPLdV3DVwanjjFT5Igphs=;
 b=JWLOZrwTYbAU8Y9hLog5LDUip/t6W3JnY+ZoocOEvXmTQ6ItK/yVdkxUrAjUG7RH8z
 Q14Tw7a5Bq3fUBWGV8c+aNluJExi1v5cMTWXKhnXERJO8XhTW/4wL8NaWfnBqKFQY9hB
 TKjXiqilbx5PleY5O0WWfA7ZxG6ahbUxcYxmWL98FDkk3MLNSwYUukn9wpXwsTQiFBO9
 4Q5jmMqPw08ho0sU+TSkfvXLLi+svq3M2Y4ijne/hO0XD0MliMpLcGM12BrGTD0itEAk
 vVG4vmYPa5wL3D8NOO3T13SgqdCoGvO6vQB+oWYmn2zIvxBQAkqcEgpQ4WxR/ADMrEOm
 Pq8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=L1Ca37LIpmgaqyZMi4/RcqkPLdV3DVwanjjFT5Igphs=;
 b=bHleB2fE0mloF4MLh+vUwdtunKzk9dJwykXoBa2WbRhdBcU0HMW4BWIAOzxL8BZfm1
 F0YCwFa5Nuf3KL6UeZq+/+0KQ9zWUn0hTdkLDV6sIHenV/md9vppH9CjVFa+RSOfUfEq
 ppczjdgecAJPXqTZgci7iDqgiAEecoL+4NjHWCIk5PWMJtDcBe8U9pHZyTvmYzbJELb4
 EaivUpA1d5e8Kuqp3LooIFupzH0UxAsW+thij52iyk+661pA403HqoV19OngSn8ipS0N
 1Wb3XyLYjyMSVLSqmVY4VMxyayv1NO7p4AGYDKs9bPl+OIrDyrYQJdxDF+uK5/2jlEbt
 lGGg==
X-Gm-Message-State: AOAM533GGBonyqTHIVHgRkWucuk0RSXcAPAihSr5+dTX1b/2jIiQb2AH
 EcY4q33ihUb7sSX24JxUVPK+S0YRMvV4Xg==
X-Google-Smtp-Source: ABdhPJxKQDAFkZm0bPd3oD9De7/l5ljjb8VfEqkLruIRcrBOYOh+pH/+C9Ruslz9NuewqeWDP/HYyw==
X-Received: by 2002:a17:90a:eb17:: with SMTP id
 j23mr13984091pjz.229.1629363928236; 
 Thu, 19 Aug 2021 02:05:28 -0700 (PDT)
Received: from localhost.localdomain ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id j13sm2944707pgp.29.2021.08.19.02.05.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 02:05:28 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 14/21] target/riscv: Use {get,
 dest}_gpr for integer load/store
Date: Wed, 18 Aug 2021 23:04:55 -1000
Message-Id: <20210819090502.428068-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210819090502.428068-1-richard.henderson@linaro.org>
References: <20210819090502.428068-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: alistair.francis@wdc.com, bin.meng@windriver.com, qemu-riscv@nongnu.org,
 Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn_trans/trans_rvi.c.inc | 36 +++++++++++++------------
 1 file changed, 19 insertions(+), 17 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_trans/trans_rvi.c.inc
index af3e0bc0e6..f616a26c82 100644
--- a/target/riscv/insn_trans/trans_rvi.c.inc
+++ b/target/riscv/insn_trans/trans_rvi.c.inc
@@ -138,15 +138,17 @@ static bool trans_bgeu(DisasContext *ctx, arg_bgeu *a)
 
 static bool gen_load(DisasContext *ctx, arg_lb *a, MemOp memop)
 {
-    TCGv t0 = tcg_temp_new();
-    TCGv t1 = tcg_temp_new();
-    gen_get_gpr(ctx, t0, a->rs1);
-    tcg_gen_addi_tl(t0, t0, a->imm);
+    TCGv dest = dest_gpr(ctx, a->rd);
+    TCGv addr = get_gpr(ctx, a->rs1, EXT_NONE);
 
-    tcg_gen_qemu_ld_tl(t1, t0, ctx->mem_idx, memop);
-    gen_set_gpr(ctx, a->rd, t1);
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
+    if (a->imm) {
+        TCGv temp = temp_new(ctx);
+        tcg_gen_addi_tl(temp, addr, a->imm);
+        addr = temp;
+    }
+
+    tcg_gen_qemu_ld_tl(dest, addr, ctx->mem_idx, memop);
+    gen_set_gpr(ctx, a->rd, dest);
     return true;
 }
 
@@ -177,19 +179,19 @@ static bool trans_lhu(DisasContext *ctx, arg_lhu *a)
 
 static bool gen_store(DisasContext *ctx, arg_sb *a, MemOp memop)
 {
-    TCGv t0 = tcg_temp_new();
-    TCGv dat = tcg_temp_new();
-    gen_get_gpr(ctx, t0, a->rs1);
-    tcg_gen_addi_tl(t0, t0, a->imm);
-    gen_get_gpr(ctx, dat, a->rs2);
+    TCGv addr = get_gpr(ctx, a->rs1, EXT_NONE);
+    TCGv data = get_gpr(ctx, a->rs2, EXT_NONE);
 
-    tcg_gen_qemu_st_tl(dat, t0, ctx->mem_idx, memop);
-    tcg_temp_free(t0);
-    tcg_temp_free(dat);
+    if (a->imm) {
+        TCGv temp = temp_new(ctx);
+        tcg_gen_addi_tl(temp, addr, a->imm);
+        addr = temp;
+    }
+
+    tcg_gen_qemu_st_tl(data, addr, ctx->mem_idx, memop);
     return true;
 }
 
-
 static bool trans_sb(DisasContext *ctx, arg_sb *a)
 {
     return gen_store(ctx, a, MO_SB);
-- 
2.25.1


