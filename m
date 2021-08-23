Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68AFF3F51A6
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 22:03:13 +0200 (CEST)
Received: from localhost ([::1]:38468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIGA4-000576-Fb
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 16:03:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mIG2y-0006Sq-Bp
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 15:55:52 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:37576)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mIG2p-0003A6-9w
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 15:55:52 -0400
Received: by mail-pf1-x42c.google.com with SMTP id j187so16295678pfg.4
 for <qemu-devel@nongnu.org>; Mon, 23 Aug 2021 12:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3svrSKGyK2gNLdmgDufB06u2LSjvvw9Nja4N3/DHvjo=;
 b=IYklu0hY2DkuIvJjWuViiTKS2WLDUveaxGSz23O+ujEoSztmHcqo5Dk24/tOkEfFEr
 0uMs/evghT0CW5Jkq3vub5Xc18Pwo9gPoob47Z1mM/HXHcZZe6AbJXCuVXNpGA1+kX3+
 gP/wCB+0Un9gGqOwV/bg65VC/FhhK6UuB/+MoZtqFucIOczTBeO/JU7JaisZF8xg/a8f
 spWdR9DgWIME0MqkXByH1EaE3qdDUhVpaP76f2OF9S1CBnAtk/AQLEWkZdFLC3le5lJ9
 VaoxnvVNT0cHA+piZuIWitMRKtdF1q6B/Oci+va72610s6+oqHT0WSREivlBwh6hElhY
 AZiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3svrSKGyK2gNLdmgDufB06u2LSjvvw9Nja4N3/DHvjo=;
 b=rEJPgwkE0E3pSKmNmIVtlWWRUaUWjlJYC49BDCl+QQI1Br1OASQ1VLsSi6oentO8Nr
 pm+hSqNGjLDj9xd9WzNL6lRG+GjBJUHf04e7SVc71PMvpn98K+sIimRmP1IwQPwXdLSE
 PhcZorOZzPjZBS4tRvZN/LG9/o1tKYQ4+Dqk9SSPSo3AGvUBmbXcGCdF5YjL2fEz4sqP
 48WcIOFItaxwcuga8j0iPHsgxyXoUQFNSz1FSS5LxAoS/msLx7B6s+bUXjJI9uulnQGf
 MlgXsZBjXKbnxPPsPxHWTxBJ6mWROQh3rejS6slrrR2qGxIK7JOY9Z7yI8dfGCiXILtA
 h7Qw==
X-Gm-Message-State: AOAM5317DIAJT0kR0QP4FN8VAu/bz53RmX8UeT878iYRPCAKq7PSmm/5
 jEUSSvJDSIPfx+GQ0tn825yuCqqEa26Hng==
X-Google-Smtp-Source: ABdhPJw+C/SrOslihFyfmGcmrZeRGTPAqkxEs7Aoz/mG44FIfbp7d0Ht0oklkEfrltT2vxPt4IRScQ==
X-Received: by 2002:aa7:880f:0:b029:3e0:6f99:1f88 with SMTP id
 c15-20020aa7880f0000b02903e06f991f88mr35489825pfo.38.1629748541919; 
 Mon, 23 Aug 2021 12:55:41 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id v15sm16685078pff.105.2021.08.23.12.55.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Aug 2021 12:55:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 15/24] target/riscv: Use {get,
 dest}_gpr for integer load/store
Date: Mon, 23 Aug 2021 12:55:20 -0700
Message-Id: <20210823195529.560295-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210823195529.560295-1-richard.henderson@linaro.org>
References: <20210823195529.560295-1-richard.henderson@linaro.org>
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
Cc: alistair.francis@wdc.com, bin.meng@windriver.com, qemu-riscv@nongnu.org,
 Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn_trans/trans_rvi.c.inc | 36 +++++++++++++------------
 1 file changed, 19 insertions(+), 17 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_trans/trans_rvi.c.inc
index a5249e71c2..76454fb7e2 100644
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


