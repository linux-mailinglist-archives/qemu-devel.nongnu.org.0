Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E269700A9E
	for <lists+qemu-devel@lfdr.de>; Fri, 12 May 2023 16:46:54 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxTxZ-00070f-HK; Fri, 12 May 2023 10:41:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pxTxW-0006wU-1y
 for qemu-devel@nongnu.org; Fri, 12 May 2023 10:41:26 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pxTxI-0004hw-9O
 for qemu-devel@nongnu.org; Fri, 12 May 2023 10:41:24 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-3f423ac6e2dso45987705e9.2
 for <qemu-devel@nongnu.org>; Fri, 12 May 2023 07:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683902471; x=1686494471;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fCW6odWriUlkFP9ztOtiryfrd1rXN9E7W52Klvr/U7Q=;
 b=Ae3zuFBX6iD0ZHS5CXameQJP07VptOLYx0nVeFvsTkPsCOgu/YEX25Lrbf3lF4Foaf
 rIQE5rlKyrtCGvp+doZVeMdKd8TAcGvAv1wzzrBKAJT65TrZosqDTRx3t40hVzEggXBF
 VsqSBEdovPymT7X//8PZFho4mtpzREecVCHRAwdyad+3kgUBTgwDl4puiPoW2BOyrSrn
 OMJutdCZolZgXk6Z9bTOh/Z7bbR628lQ4fbhCGOXA2hYkpakfql9QX0Y8RDiR1Frk6Tc
 GaEVCAU0u8JHUzrlDijT4rwHJ62ngEKup8RPgWF4n8ZUChK9Qg4m1hBObGagbwugRBBC
 KXdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683902471; x=1686494471;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fCW6odWriUlkFP9ztOtiryfrd1rXN9E7W52Klvr/U7Q=;
 b=c893tYTDrMr4unE0bfTDkjCI47+FD/q07BjMFGv4AJIHISVE7Mtu6oHQZdU6otfOG4
 nt0qtqo6i4sUN25cZRsbPsFeTX8qeQ7twSDY5YHpXvnAelejf8YU/e5Ll8LX1epLhlzx
 OZxuIMH9UVRXGlqo5uYSGrcpbtrnX9Mj/ckPu4LY+KDlwjCzlZ/LmoFZQUxdts+m8b5y
 YIiXRM6sVqAxULoLCsF8UZyXtlP23e0FP+xUZunjgYP1fWiLtX4KEuF+dCoiS76xDM3o
 IbgQtuXPs/3palGjCvY0fO5fpkaZ7g4N+6+Vh7nAdabDmZvL1iOC76mScuFp6Q7T4Gt8
 GrVw==
X-Gm-Message-State: AC+VfDydSFQL+7Xi4g6X53OGHwl2bFt48SikFklisllQaUcPnwS1eKcJ
 WHWyqKVcJt1u5s/rxnDGa856KYsMQhSk4B+QUHo=
X-Google-Smtp-Source: ACHHUZ7WxeAvcshpytxwswMldmIlrFBJFpwx/pOIhs+wv7GP7ro+AlkoiM21yuTH8OfyoqqOFOYtbw==
X-Received: by 2002:a7b:cc93:0:b0:3f4:2bb3:a5c9 with SMTP id
 p19-20020a7bcc93000000b003f42bb3a5c9mr9520770wma.8.1683902471015; 
 Fri, 12 May 2023 07:41:11 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 f12-20020a7bcc0c000000b003f17848673fsm28916167wmh.27.2023.05.12.07.41.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 May 2023 07:41:10 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH 06/20] target/arm: Convert Add/subtract (immediate) to
 decodetree
Date: Fri, 12 May 2023 15:40:52 +0100
Message-Id: <20230512144106.3608981-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230512144106.3608981-1-peter.maydell@linaro.org>
References: <20230512144106.3608981-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Richard Henderson <richard.henderson@linaro.org>

Convert the ADD and SUB (immediate) instructions.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
[PMM: Rebased; adjusted to use translate.h's TRANS macro]
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/tcg/translate.h     |  5 +++
 target/arm/tcg/a64.decode      | 17 ++++++++
 target/arm/tcg/translate-a64.c | 73 ++++++++++------------------------
 3 files changed, 42 insertions(+), 53 deletions(-)

diff --git a/target/arm/tcg/translate.h b/target/arm/tcg/translate.h
index f02d4685b4c..a9d1f4adc28 100644
--- a/target/arm/tcg/translate.h
+++ b/target/arm/tcg/translate.h
@@ -220,6 +220,11 @@ static inline int rsub_8(DisasContext *s, int x)
     return 8 - x;
 }
 
+static inline int shl_12(DisasContext *s, int x)
+{
+    return x << 12;
+}
+
 static inline int neon_3same_fp_size(DisasContext *s, int x)
 {
     /* Convert 0==fp32, 1==fp16 into a MO_* value */
diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index bcf46fc37d7..30c2ac7e271 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -20,6 +20,7 @@
 #
 
 &ri              rd imm
+&rri_sf          rd rn imm sf
 
 
 ### Data Processing - Immediate
@@ -31,3 +32,19 @@
 
 ADR             0 .. 10000 ................... .....    @pcrel
 ADRP            1 .. 10000 ................... .....    @pcrel
+
+# Add/subtract (immediate)
+
+%imm12_sh12     10:12 !function=shl_12
+@addsub_imm     sf:1 .. ...... . imm:12 rn:5 rd:5
+@addsub_imm12   sf:1 .. ...... . ............ rn:5 rd:5 imm=%imm12_sh12
+
+ADD_i           . 00 100010 0 ............ ..... .....  @addsub_imm
+ADD_i           . 00 100010 1 ............ ..... .....  @addsub_imm12
+ADDS_i          . 01 100010 0 ............ ..... .....  @addsub_imm
+ADDS_i          . 01 100010 1 ............ ..... .....  @addsub_imm12
+
+SUB_i           . 10 100010 0 ............ ..... .....  @addsub_imm
+SUB_i           . 10 100010 1 ............ ..... .....  @addsub_imm12
+SUBS_i          . 11 100010 0 ............ ..... .....  @addsub_imm
+SUBS_i          . 11 100010 1 ............ ..... .....  @addsub_imm12
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index a3bccbd708a..fb12122a3fb 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -4198,6 +4198,22 @@ static void disas_ldst(DisasContext *s, uint32_t insn)
     }
 }
 
+typedef void ArithTwoOp(TCGv_i64, TCGv_i64, TCGv_i64);
+
+static bool gen_rri(DisasContext *s, arg_rri_sf *a,
+                    bool rd_sp, bool rn_sp, ArithTwoOp *fn)
+{
+    TCGv_i64 tcg_rn = rn_sp ? cpu_reg_sp(s, a->rn) : cpu_reg(s, a->rn);
+    TCGv_i64 tcg_rd = rd_sp ? cpu_reg_sp(s, a->rd) : cpu_reg(s, a->rd);
+    TCGv_i64 tcg_imm = tcg_constant_i64(a->imm);
+
+    fn(tcg_rd, tcg_rn, tcg_imm);
+    if (!a->sf) {
+        tcg_gen_ext32u_i64(tcg_rd, tcg_rd);
+    }
+    return true;
+}
+
 /*
  * PC-rel. addressing
  */
@@ -4220,57 +4236,11 @@ static bool trans_ADRP(DisasContext *s, arg_ri *a)
 
 /*
  * Add/subtract (immediate)
- *
- *  31 30 29 28         23 22 21         10 9   5 4   0
- * +--+--+--+-------------+--+-------------+-----+-----+
- * |sf|op| S| 1 0 0 0 1 0 |sh|    imm12    |  Rn | Rd  |
- * +--+--+--+-------------+--+-------------+-----+-----+
- *
- *    sf: 0 -> 32bit, 1 -> 64bit
- *    op: 0 -> add  , 1 -> sub
- *     S: 1 -> set flags
- *    sh: 1 -> LSL imm by 12
  */
-static void disas_add_sub_imm(DisasContext *s, uint32_t insn)
-{
-    int rd = extract32(insn, 0, 5);
-    int rn = extract32(insn, 5, 5);
-    uint64_t imm = extract32(insn, 10, 12);
-    bool shift = extract32(insn, 22, 1);
-    bool setflags = extract32(insn, 29, 1);
-    bool sub_op = extract32(insn, 30, 1);
-    bool is_64bit = extract32(insn, 31, 1);
-
-    TCGv_i64 tcg_rn = cpu_reg_sp(s, rn);
-    TCGv_i64 tcg_rd = setflags ? cpu_reg(s, rd) : cpu_reg_sp(s, rd);
-    TCGv_i64 tcg_result;
-
-    if (shift) {
-        imm <<= 12;
-    }
-
-    tcg_result = tcg_temp_new_i64();
-    if (!setflags) {
-        if (sub_op) {
-            tcg_gen_subi_i64(tcg_result, tcg_rn, imm);
-        } else {
-            tcg_gen_addi_i64(tcg_result, tcg_rn, imm);
-        }
-    } else {
-        TCGv_i64 tcg_imm = tcg_constant_i64(imm);
-        if (sub_op) {
-            gen_sub_CC(is_64bit, tcg_result, tcg_rn, tcg_imm);
-        } else {
-            gen_add_CC(is_64bit, tcg_result, tcg_rn, tcg_imm);
-        }
-    }
-
-    if (is_64bit) {
-        tcg_gen_mov_i64(tcg_rd, tcg_result);
-    } else {
-        tcg_gen_ext32u_i64(tcg_rd, tcg_result);
-    }
-}
+TRANS(ADD_i, gen_rri, a, 1, 1, tcg_gen_add_i64)
+TRANS(SUB_i, gen_rri, a, 1, 1, tcg_gen_sub_i64)
+TRANS(ADDS_i, gen_rri, a, 0, 1, a->sf ? gen_add64_CC : gen_add32_CC)
+TRANS(SUBS_i, gen_rri, a, 0, 1, a->sf ? gen_sub64_CC : gen_sub32_CC)
 
 /*
  * Add/subtract (immediate, with tags)
@@ -4668,9 +4638,6 @@ static void disas_extract(DisasContext *s, uint32_t insn)
 static void disas_data_proc_imm(DisasContext *s, uint32_t insn)
 {
     switch (extract32(insn, 23, 6)) {
-    case 0x22: /* Add/subtract (immediate) */
-        disas_add_sub_imm(s, insn);
-        break;
     case 0x23: /* Add/subtract (immediate, with tags) */
         disas_add_sub_imm_with_tags(s, insn);
         break;
-- 
2.34.1


