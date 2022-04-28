Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41D1B5137A8
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 17:04:06 +0200 (CEST)
Received: from localhost ([::1]:34156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk5gb-00084m-AD
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 11:04:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk5Ju-0005ZB-SV
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 10:40:40 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:46063)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk5Jn-0006Ne-2M
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 10:40:33 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 bi24-20020a05600c3d9800b00393ff664705so3146018wmb.4
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 07:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=+43mrvm5RN1LNDu0ww3mmagHGKAIspE6FprCzWRplb8=;
 b=ouUedrRfzVrBWcMVhEL6dAAgCM4BC1WWwQ7ByY421HXV3aSk/Sr68cwd/bFoGiwQq6
 XeqS60HGxbvbGcV+pQINfoETnlqSvmEkgOI0IkuteG71gRX27AhNoVsMfT0SK8xoXZYc
 pmEErDVBLHo5c7NnlmVeahp8gH72RxBWLV25IXRj8HS9i3Qm0y9b9OQdS5yqJNVUcfr7
 RfcZPon1XKhC1piO+XImbvETI15GH8F9/6h/CebZFWGzIy+hmSt8rFvq+ucvSb+g9OSi
 z1e1/mTyJXHzT0BsZuTnPxpjt5VLXQbMBb5+gnOczw9HVOp5dY8uo78H3fyfGfiQEE9e
 SzSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+43mrvm5RN1LNDu0ww3mmagHGKAIspE6FprCzWRplb8=;
 b=7wC5KJt4WG/k1qOk7uRSxFqUBp4QRsWYLnP9eEt2Mpxpd1NX1kg8wodhqUqVPuuVNM
 liOoD16fKA4YBDxwGLiO/Gf53KTP5v4/9650LYbl44K0Dyzs4fBN6QF9AlD8iooivRWn
 nROStgHGHUOOaFBjN+v0fzYLSnUhA3eO76VGvA864/5lfaqFujZ+WBqFVmub/knrb7tm
 PtPxHbr64VSuljRwoEeeBStUW3xygW9GcHKXqoIXkcZzHP99qob5pn5875cZ6UR/W+G1
 vUgL29lM4dUNohgfxt3Pe8aZtS/hA22H64/syhRCFDD0MSG9VUNsoa3kvObysTev80At
 UUog==
X-Gm-Message-State: AOAM530+wHtH7FVYfNwk5y65k+MTzYPncuAfRjCvOOsAGXTRpE4UacSV
 vfXXQcu5vNt3vo5AVdVUTgatRQYCcbTQzQ==
X-Google-Smtp-Source: ABdhPJwsgIkRdLSvBZMcNvOcsr0Ev31BCWA6zDFM5qRCgzhXn+luBjkoU4DmT3ZxMdKa5J0R8lfe9Q==
X-Received: by 2002:a7b:c454:0:b0:394:1b5b:62ff with SMTP id
 l20-20020a7bc454000000b003941b5b62ffmr5899wmi.47.1651156818737; 
 Thu, 28 Apr 2022 07:40:18 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bh26-20020a05600c3d1a00b003928db85759sm130221wmb.15.2022.04.28.07.40.17
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Apr 2022 07:40:18 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 17/54] target/arm: Use tcg_constant in disas_fp*
Date: Thu, 28 Apr 2022 15:39:21 +0100
Message-Id: <20220428143958.2451229-18-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220428143958.2451229-1-peter.maydell@linaro.org>
References: <20220428143958.2451229-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-id: 20220426163043.100432-18-richard.henderson@linaro.org
[PMM: Restore incorrectly removed free of t_false in disas_fp_csel()]
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-a64.c | 23 +++++++----------------
 1 file changed, 7 insertions(+), 16 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 358f42026c2..9493d2e2468 100644
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
 
@@ -6097,9 +6094,8 @@ static void disas_fp_csel(DisasContext *s, uint32_t insn)
     read_vec_element(s, t_false, rm, 0, sz);
 
     a64_test_cc(&c, cond);
-    t_zero = tcg_const_i64(0);
-    tcg_gen_movcond_i64(c.cond, t_true, c.value, t_zero, t_true, t_false);
-    tcg_temp_free_i64(t_zero);
+    tcg_gen_movcond_i64(c.cond, t_true, c.value, tcg_constant_i64(0),
+                        t_true, t_false);
     tcg_temp_free_i64(t_false);
     a64_free_cc(&c);
 
@@ -6881,7 +6877,6 @@ static void disas_fp_imm(DisasContext *s, uint32_t insn)
     int type = extract32(insn, 22, 2);
     int mos = extract32(insn, 29, 3);
     uint64_t imm;
-    TCGv_i64 tcg_res;
     MemOp sz;
 
     if (mos || imm5) {
@@ -6912,10 +6907,7 @@ static void disas_fp_imm(DisasContext *s, uint32_t insn)
     }
 
     imm = vfp_expand_imm(sz, imm8);
-
-    tcg_res = tcg_const_i64(imm);
-    write_fp_dreg(s, rd, tcg_res);
-    tcg_temp_free_i64(tcg_res);
+    write_fp_dreg(s, rd, tcg_constant_i64(imm));
 }
 
 /* Handle floating point <=> fixed point conversions. Note that we can
@@ -6933,7 +6925,7 @@ static void handle_fpfpcvt(DisasContext *s, int rd, int rn, int opcode,
 
     tcg_fpstatus = fpstatus_ptr(type == 3 ? FPST_FPCR_F16 : FPST_FPCR);
 
-    tcg_shift = tcg_const_i32(64 - scale);
+    tcg_shift = tcg_constant_i32(64 - scale);
 
     if (itof) {
         TCGv_i64 tcg_int = cpu_reg(s, rn);
@@ -7092,7 +7084,6 @@ static void handle_fpfpcvt(DisasContext *s, int rd, int rn, int opcode,
     }
 
     tcg_temp_free_ptr(tcg_fpstatus);
-    tcg_temp_free_i32(tcg_shift);
 }
 
 /* Floating point <-> fixed point conversions
-- 
2.25.1


