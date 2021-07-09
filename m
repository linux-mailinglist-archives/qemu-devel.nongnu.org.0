Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3DFF3C1E93
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 06:45:21 +0200 (CEST)
Received: from localhost ([::1]:48588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1iO8-0001F2-SC
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 00:45:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1i5l-0006Cr-Qb
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 00:26:25 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:41519)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1i5d-0001St-3G
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 00:26:21 -0400
Received: by mail-pf1-x430.google.com with SMTP id f17so7582277pfj.8
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 21:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DkRSjZK4s1X6JiwKyTRkh9Sv6TW6zjiR4pJsIp26yK4=;
 b=dYpR5sCQ/MBKQk+9TLiHzrj2ulvjmAuAd1wwtBlGHkxzlYrLO7GY+EBa88gM6m07rL
 v+drd/gYuUlRWVRQgwlcFv0XgRyAZ/laoF5ydVKtKj1IISxrbDxHUdccKyWi+EKifhob
 giijSTAtuXNRDhQ1E7tyb2JG1WkBQDaGdNpHLmKDB1TkjDlBhXEvtAwFq+0WtIHeMbYb
 Q5EDYz6aErTiPtTBH6qc44Wk7yq5Z9/za/GMrzC1ThAO/766sQKQneHep06QJajOmbvE
 UOKFGoppp7HQk0qdx24F3u8YYsGh4ciX57NNdeY7il2CPk9E5QbjjpY89vlHWCT8UWDO
 W2IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DkRSjZK4s1X6JiwKyTRkh9Sv6TW6zjiR4pJsIp26yK4=;
 b=EIbUU1777Zgt/0L5GOBxe+k5xe1OtvdpO2cJbhfmVv35MFs+sJY6FcGieaio19HRjT
 50bPaV+O5kwS4FWdD8fCw12xAEHHc4eCkl701HxwcjCQkEwI06PqzMu1N31ejgb3apGK
 qUg9BqK8TUS7Lul94NB7Y/vjWv51c1H4rtsmgHpH8isv0rO+s9R2psjuxxXBDt8Tv2Xf
 G+x6Yvm6V2k4olcoBFjJ01LirSOb8c9V+/WoV8hfa843XVz247QYwgcppoCEVqRcKRNH
 WYNq8lYM1tCKx2tPww4dcyjg1xaHEZ/Pywv7a1w/MGNcdXCduYglRWxpTyhO3vkPR0yZ
 TZuA==
X-Gm-Message-State: AOAM530UamGGXCJo66e0AVax+LkieNDc5PQ9fbdMhE1Onw1n+9pRak9v
 Nb6qg0aHe6Q1koxeQ6Jmz7rPjrYHVoEusA==
X-Google-Smtp-Source: ABdhPJyuubcrSP8Nsl6YWMhgWUEHvsG9aF1VeYJ8TDU8ntkUScv/w9VfxcnHaDRxyV8RyRtuthzpdA==
X-Received: by 2002:a63:fa50:: with SMTP id g16mr36247530pgk.16.1625804771424; 
 Thu, 08 Jul 2021 21:26:11 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id y16sm4406727pfe.70.2021.07.08.21.26.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 21:26:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 03/17] target/riscv: Use gpr_{src,dst} in shift operations
Date: Thu,  8 Jul 2021 21:25:54 -0700
Message-Id: <20210709042608.883256-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210709042608.883256-1-richard.henderson@linaro.org>
References: <20210709042608.883256-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
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

These operations are slightly more complicated since
we need to crop the shift operand.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/translate.c | 68 +++++++++++++++-------------------------
 1 file changed, 26 insertions(+), 42 deletions(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 2cfcb849b8..a60b198623 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -778,18 +778,14 @@ static bool gen_arith(DisasContext *ctx, arg_r *a,
 static bool gen_shift(DisasContext *ctx, arg_r *a,
                         void(*func)(TCGv, TCGv, TCGv))
 {
-    TCGv source1 = tcg_temp_new();
-    TCGv source2 = tcg_temp_new();
+    TCGv dest = gpr_dst(ctx, a->rd);
+    TCGv src1 = gpr_src(ctx, a->rs1);
+    TCGv src2 = gpr_src(ctx, a->rs2);
+    TCGv ext2 = tcg_temp_new();
 
-    gen_get_gpr(source1, a->rs1);
-    gen_get_gpr(source2, a->rs2);
-
-    tcg_gen_andi_tl(source2, source2, TARGET_LONG_BITS - 1);
-    (*func)(source1, source1, source2);
-
-    gen_set_gpr(a->rd, source1);
-    tcg_temp_free(source1);
-    tcg_temp_free(source2);
+    tcg_gen_andi_tl(ext2, src2, TARGET_LONG_BITS - 1);
+    (*func)(dest, src1, ext2);
+    tcg_temp_free(ext2);
     return true;
 }
 
@@ -805,58 +801,46 @@ static uint32_t opcode_at(DisasContextBase *dcbase, target_ulong pc)
 static bool gen_shifti(DisasContext *ctx, arg_shift *a,
                        void(*func)(TCGv, TCGv, TCGv))
 {
+    TCGv dest, src1, src2;
+
     if (a->shamt >= TARGET_LONG_BITS) {
         return false;
     }
 
-    TCGv source1 = tcg_temp_new();
-    TCGv source2 = tcg_temp_new();
+    dest = gpr_dst(ctx, a->rd);
+    src1 = gpr_src(ctx, a->rs1);
+    src2 = tcg_constant_tl(a->shamt);
 
-    gen_get_gpr(source1, a->rs1);
-
-    tcg_gen_movi_tl(source2, a->shamt);
-    (*func)(source1, source1, source2);
-
-    gen_set_gpr(a->rd, source1);
-    tcg_temp_free(source1);
-    tcg_temp_free(source2);
+    (*func)(dest, src1, src2);
     return true;
 }
 
 static bool gen_shiftw(DisasContext *ctx, arg_r *a,
                        void(*func)(TCGv, TCGv, TCGv))
 {
-    TCGv source1 = tcg_temp_new();
-    TCGv source2 = tcg_temp_new();
+    TCGv dest = gpr_dst(ctx, a->rd);
+    TCGv src1 = gpr_src(ctx, a->rs1);
+    TCGv src2 = gpr_src(ctx, a->rs2);
+    TCGv ext2 = tcg_temp_new();
 
-    gen_get_gpr(source1, a->rs1);
-    gen_get_gpr(source2, a->rs2);
+    tcg_gen_andi_tl(ext2, src2, 31);
+    (*func)(dest, src1, ext2);
+    tcg_gen_ext32s_tl(dest, dest);
 
-    tcg_gen_andi_tl(source2, source2, 31);
-    (*func)(source1, source1, source2);
-    tcg_gen_ext32s_tl(source1, source1);
-
-    gen_set_gpr(a->rd, source1);
-    tcg_temp_free(source1);
-    tcg_temp_free(source2);
+    tcg_temp_free(ext2);
     return true;
 }
 
 static bool gen_shiftiw(DisasContext *ctx, arg_shift *a,
                         void(*func)(TCGv, TCGv, TCGv))
 {
-    TCGv source1 = tcg_temp_new();
-    TCGv source2 = tcg_temp_new();
+    TCGv dest = gpr_dst(ctx, a->rd);
+    TCGv src1 = gpr_src(ctx, a->rs1);
+    TCGv src2 = tcg_constant_tl(a->shamt);
 
-    gen_get_gpr(source1, a->rs1);
-    tcg_gen_movi_tl(source2, a->shamt);
+    (*func)(dest, src1, src2);
+    tcg_gen_ext32s_tl(dest, dest);
 
-    (*func)(source1, source1, source2);
-    tcg_gen_ext32s_tl(source1, source1);
-
-    gen_set_gpr(a->rd, source1);
-    tcg_temp_free(source1);
-    tcg_temp_free(source2);
     return true;
 }
 
-- 
2.25.1


