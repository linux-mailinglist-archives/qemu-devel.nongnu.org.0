Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C018F5103B5
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 18:40:09 +0200 (CEST)
Received: from localhost ([::1]:51400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njOES-0003cP-Sg
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 12:40:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njO5j-0002yY-8M
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 12:31:14 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:41662)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njO5g-0003po-98
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 12:31:06 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 z5-20020a17090a468500b001d2bc2743c4so3041061pjf.0
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 09:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gFJtz7mXovIodl3Pn8jknNQvAg/DFZpCh2wNdDtbl9o=;
 b=Ks7pGRW1zFL1h6Nd1Okq2b3emtfV2o46s8XYDlo9E/Iz5coB4UUnqR41kMfjaexc28
 mMd0MLX4J3e2GrDFkYpNYJO1fozpsrlDuZglBgNq2BauCfEGefCeknF2HNp3SlRAwm5O
 sZQNBuLFtuk9NjOsa0+RXRnHYxmvI54bH4N8gnvvdojMMNob4oxOvKtuiH/qG2PUsH++
 Y3csPS/38FWSBRpNWlO29GFnpDn92+aMdvqZLN5Wrly34wDnflwduk4yAfVy+zwEFr+w
 +GItD68rE2y0iFijzjD2i3c92EQKDIVpkeJkZ8T0GXXjGcROreXWtEhpLJL9lRLMXrtj
 Zclw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gFJtz7mXovIodl3Pn8jknNQvAg/DFZpCh2wNdDtbl9o=;
 b=pNx3Vvu+t49QRvWDej3KxdPhqlG20cmxcvt/QoOvTKUy/3rWI55vWyOmlMWUpJOu1V
 DGaAZojXDxegwHflce5QvevZqZeVb+1ydys8pjP2yWHW08IUl4SVTkzAsEllUkIdEoVf
 tZXeYwUgPd8/lw3KiMPz+nj4OEwDFWYpEfiUAsaQZEVCl6dQdBxjwKjXaSqwjk9K3/KT
 rrfILySnmPJ1+XHer5E7Prhtb/4FDHYmDI7I/lDJp2pwGZXGCjlDHpaw0idzkH7Y5ZIR
 vgMf7oSYkJYau7bmldBucxvjXqdUvpWVjHVMv3PpOG8wNef5PiDve6Wby9Z4G1fplNfJ
 3tlQ==
X-Gm-Message-State: AOAM533XGSYi2gg9nF/UeSNOy0F/QLnutdzK9/OlARYKBx+1uokICDJR
 wWrLq3ID6Hkr8/adjtKMDbr1kFKstee/1A==
X-Google-Smtp-Source: ABdhPJzKX/wvjj+huljRh9w0ojsHjrrCis1ragMqrlTHhW2BH3Gu26mQMtx6mj/EF4I7o2kbRTOpIA==
X-Received: by 2002:a17:90b:1bd2:b0:1d7:dce1:77c2 with SMTP id
 oa18-20020a17090b1bd200b001d7dce177c2mr26522885pjb.31.1650990662446; 
 Tue, 26 Apr 2022 09:31:02 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 y131-20020a626489000000b00505a8f36965sm15655813pfb.184.2022.04.26.09.31.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 09:31:02 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 17/47] target/arm: Use tcg_constant in disas_fp*
Date: Tue, 26 Apr 2022 09:30:13 -0700
Message-Id: <20220426163043.100432-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220426163043.100432-1-richard.henderson@linaro.org>
References: <20220426163043.100432-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 24 +++++++-----------------
 1 file changed, 7 insertions(+), 17 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 358f42026c..847da725ea 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -5875,7 +5875,7 @@ static void handle_fp_compare(DisasContext *s, int size,
 
         tcg_vn = read_fp_dreg(s, rn);
         if (cmp_with_zero) {
-            tcg_vm = tcg_const_i64(0);
+            tcg_vm = tcg_constant_i64(0);
         } else {
             tcg_vm = read_fp_dreg(s, rm);
         }
@@ -5985,7 +5985,6 @@ static void disas_fp_compare(DisasContext *s, uint32_t insn)
 static void disas_fp_ccomp(DisasContext *s, uint32_t insn)
 {
     unsigned int mos, type, rm, cond, rn, op, nzcv;
-    TCGv_i64 tcg_flags;
     TCGLabel *label_continue = NULL;
     int size;
 
@@ -6029,9 +6028,7 @@ static void disas_fp_ccomp(DisasContext *s, uint32_t insn)
         label_continue = gen_new_label();
         arm_gen_test_cc(cond, label_match);
         /* nomatch: */
-        tcg_flags = tcg_const_i64(nzcv << 28);
-        gen_set_nzcv(tcg_flags);
-        tcg_temp_free_i64(tcg_flags);
+        gen_set_nzcv(tcg_constant_i64(nzcv << 28));
         tcg_gen_br(label_continue);
         gen_set_label(label_match);
     }
@@ -6052,7 +6049,7 @@ static void disas_fp_ccomp(DisasContext *s, uint32_t insn)
 static void disas_fp_csel(DisasContext *s, uint32_t insn)
 {
     unsigned int mos, type, rm, cond, rn, rd;
-    TCGv_i64 t_true, t_false, t_zero;
+    TCGv_i64 t_true, t_false;
     DisasCompare64 c;
     MemOp sz;
 
@@ -6097,10 +6094,8 @@ static void disas_fp_csel(DisasContext *s, uint32_t insn)
     read_vec_element(s, t_false, rm, 0, sz);
 
     a64_test_cc(&c, cond);
-    t_zero = tcg_const_i64(0);
-    tcg_gen_movcond_i64(c.cond, t_true, c.value, t_zero, t_true, t_false);
-    tcg_temp_free_i64(t_zero);
-    tcg_temp_free_i64(t_false);
+    tcg_gen_movcond_i64(c.cond, t_true, c.value, tcg_constant_i64(0),
+                        t_true, t_false);
     a64_free_cc(&c);
 
     /* Note that sregs & hregs write back zeros to the high bits,
@@ -6881,7 +6876,6 @@ static void disas_fp_imm(DisasContext *s, uint32_t insn)
     int type = extract32(insn, 22, 2);
     int mos = extract32(insn, 29, 3);
     uint64_t imm;
-    TCGv_i64 tcg_res;
     MemOp sz;
 
     if (mos || imm5) {
@@ -6912,10 +6906,7 @@ static void disas_fp_imm(DisasContext *s, uint32_t insn)
     }
 
     imm = vfp_expand_imm(sz, imm8);
-
-    tcg_res = tcg_const_i64(imm);
-    write_fp_dreg(s, rd, tcg_res);
-    tcg_temp_free_i64(tcg_res);
+    write_fp_dreg(s, rd, tcg_constant_i64(imm));
 }
 
 /* Handle floating point <=> fixed point conversions. Note that we can
@@ -6933,7 +6924,7 @@ static void handle_fpfpcvt(DisasContext *s, int rd, int rn, int opcode,
 
     tcg_fpstatus = fpstatus_ptr(type == 3 ? FPST_FPCR_F16 : FPST_FPCR);
 
-    tcg_shift = tcg_const_i32(64 - scale);
+    tcg_shift = tcg_constant_i32(64 - scale);
 
     if (itof) {
         TCGv_i64 tcg_int = cpu_reg(s, rn);
@@ -7092,7 +7083,6 @@ static void handle_fpfpcvt(DisasContext *s, int rd, int rn, int opcode,
     }
 
     tcg_temp_free_ptr(tcg_fpstatus);
-    tcg_temp_free_i32(tcg_shift);
 }
 
 /* Floating point <-> fixed point conversions
-- 
2.34.1


