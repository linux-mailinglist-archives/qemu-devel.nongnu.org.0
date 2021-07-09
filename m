Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 044F03C1E78
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 06:34:29 +0200 (CEST)
Received: from localhost ([::1]:41744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1iDb-00016A-U0
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 00:34:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1i5s-0006EM-1e
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 00:26:28 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:38613)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1i5f-0001Uv-H8
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 00:26:27 -0400
Received: by mail-pg1-x536.google.com with SMTP id h4so8694135pgp.5
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 21:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=szhSmb+IJx7ewakRoFrjDYHYotl3MpERiZt5zOnrFx0=;
 b=q7uMINchCES1mQq+pX+G8iVgE775IJn5ShMM9umTHDf3gf//6wdJ/f2A2FhH2l5z1k
 u7GrAC/UF8rqBX3vcd1s13JDghVlPsLNYulg2TBTE+bAFAn0E8gIl4lCnYSQA2ZWOLc6
 awBgUQIzKRqjU0Wj9ftICavliqUWYhP3dPLiSZeVSrVXVqZIYRZ7rl+86nb0IUbL6ew1
 YCLEZdjBAW5839prdg/q90nzY/WG/FaS9D14r6bCTB0avK+LADa4OtIEXqPrLtA85ZY6
 HFe+0NP8RwSss60qGlZVOJBUCAW/ctwyJQlLizccbJa0Np/Qm2h2wQH8h5xEFgWzNuTd
 S9vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=szhSmb+IJx7ewakRoFrjDYHYotl3MpERiZt5zOnrFx0=;
 b=cG7LBTOxMYB+vBDE7XTJkz0QfDcI2xwI2767ErZIVDkSy4QlhnIbexWu8rOaLT3Gp8
 K0r2vHmjrhFGTBBHUtGx1D27cJxkyozhFGyu61sI54Tmw7yx+wdxKwpMFj8RzQ5X3hnC
 qFx1KmZoLxzz5pAQ2PB0+bhW2jS/gre6WCy+BZ+71eIy8GYo2SqLAhjsSxLWWeI917mX
 088hYp4DrdwttJOkbPY7kQEOB53jRzpaRn9W+ZmpM35CrNShwF9mtFdiQ9u7hdnOseP8
 ytu2sy0vxIoT7Mt4piatgaADKcHB6yHI+23+gfE9whzCXi6gw+oTbVTY8LIeNgCkjVOR
 S7lw==
X-Gm-Message-State: AOAM532OeiHnQVGKQGuuwazoK9jgaLzTWiLEV9Hs2ylZG+8FN1KcvBdp
 f4s2kKioRwqNeCUngzqw+C+vc55cQ5Vlow==
X-Google-Smtp-Source: ABdhPJzDFJlA+1adNAVf/9FyK+TJL+Y74duNcirZaBVNmcrKGHnGuvXpLXRDkmCOlh96fTwnnoPm2w==
X-Received: by 2002:a63:170b:: with SMTP id x11mr8807075pgl.253.1625804773889; 
 Thu, 08 Jul 2021 21:26:13 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id y16sm4406727pfe.70.2021.07.08.21.26.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 21:26:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 07/17] target/riscv: Use gpr_{src,dst} for integer load/store
Date: Thu,  8 Jul 2021 21:25:58 -0700
Message-Id: <20210709042608.883256-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210709042608.883256-1-richard.henderson@linaro.org>
References: <20210709042608.883256-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
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
Cc: alistair.francis@wdc.com, qemu-riscv@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn_trans/trans_rvi.c.inc | 45 +++++++++++++++----------
 1 file changed, 28 insertions(+), 17 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_trans/trans_rvi.c.inc
index a603925637..a422dc9ef4 100644
--- a/target/riscv/insn_trans/trans_rvi.c.inc
+++ b/target/riscv/insn_trans/trans_rvi.c.inc
@@ -138,15 +138,21 @@ static bool trans_bgeu(DisasContext *ctx, arg_bgeu *a)
 
 static bool gen_load(DisasContext *ctx, arg_lb *a, MemOp memop)
 {
-    TCGv t0 = tcg_temp_new();
-    TCGv t1 = tcg_temp_new();
-    gen_get_gpr(t0, a->rs1);
-    tcg_gen_addi_tl(t0, t0, a->imm);
+    TCGv dest = gpr_dst(ctx, a->rd);
+    TCGv addr = gpr_src(ctx, a->rs1);
+    TCGv temp = NULL;
 
-    tcg_gen_qemu_ld_tl(t1, t0, ctx->mem_idx, memop);
-    gen_set_gpr(a->rd, t1);
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
+    if (a->imm) {
+        temp = tcg_temp_new();
+        tcg_gen_addi_tl(temp, addr, a->imm);
+        addr = temp;
+    }
+
+    tcg_gen_qemu_ld_tl(dest, addr, ctx->mem_idx, memop);
+
+    if (temp) {
+        tcg_temp_free(temp);
+    }
     return true;
 }
 
@@ -177,19 +183,24 @@ static bool trans_lhu(DisasContext *ctx, arg_lhu *a)
 
 static bool gen_store(DisasContext *ctx, arg_sb *a, MemOp memop)
 {
-    TCGv t0 = tcg_temp_new();
-    TCGv dat = tcg_temp_new();
-    gen_get_gpr(t0, a->rs1);
-    tcg_gen_addi_tl(t0, t0, a->imm);
-    gen_get_gpr(dat, a->rs2);
+    TCGv addr = gpr_src(ctx, a->rs1);
+    TCGv data = gpr_src(ctx, a->rs2);
+    TCGv temp = NULL;
 
-    tcg_gen_qemu_st_tl(dat, t0, ctx->mem_idx, memop);
-    tcg_temp_free(t0);
-    tcg_temp_free(dat);
+    if (a->imm) {
+        temp = tcg_temp_new();
+        tcg_gen_addi_tl(temp, addr, a->imm);
+        addr = temp;
+    }
+
+    tcg_gen_qemu_st_tl(data, addr, ctx->mem_idx, memop);
+
+    if (temp) {
+        tcg_temp_free(temp);
+    }
     return true;
 }
 
-
 static bool trans_sb(DisasContext *ctx, arg_sb *a)
 {
     return gen_store(ctx, a, MO_SB);
-- 
2.25.1


