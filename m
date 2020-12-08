Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19BB82D3253
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 19:45:00 +0100 (CET)
Received: from localhost ([::1]:56042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmhyt-00014F-4H
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 13:44:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kmhJP-0008Ij-JN
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 13:02:07 -0500
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:46436)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kmhJN-0006Rr-Fl
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 13:02:07 -0500
Received: by mail-oi1-x244.google.com with SMTP id k2so20300880oic.13
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 10:02:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jrS4YN7W+7NBTb0aYWu3j+MLNMtf7Sqw2+Bh5j7akD8=;
 b=Js5NFBdLH3DabQVBsvkfls7euQYa6P+mszjiyENSLaLlp27Wl3BU0gCUoPjQ1SsNnl
 DJPR4MTLrhWri8dWx/UT3YCnW8qOsJP3+6pEa23V69ZyHGDaZ/CZVISt9B5QSPlSpruI
 eBbsDPpg22VZb0QSVbSTFgSwAp9Dn5ONtcrq2QHHt8V5jw7WlC4a5QOCiS6gGS8R61Ec
 Wcz9KGB+0Y4B2x5F/GU+0Ul+Di5aemvRnhzNzzn/z75kvrhe0Fzh83m0XrSX7Cqgt4mB
 S/wzWITFaOTNoouGH4keCln+KKUAtnHTjUJEGToeWMsOZaLoL0plkhOu8QQXE+Ojyywu
 hCuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jrS4YN7W+7NBTb0aYWu3j+MLNMtf7Sqw2+Bh5j7akD8=;
 b=e8VQrmdJ53+7+uLnVCeWXzqdJccNHSgDTa2cOqEp62LQJoKHEuR3uwlLERmTGrwgG8
 TnhpDSKHfxojOUUqRovHNplVJNtWG+312sq9u1+5RkVnJ+6PbzNWzAJFEQFNQIo+mNhH
 JRX2fAdpU3f3QUiAvmRAtePgbXvGXCghFIByZ5179gNzJtQLS7Y7/PaF5OWkqtFf1G7O
 qjDY0KYHvD4NzRLjLhCBR849GQ/LXZehLDjqISSOgqMvqY89hafECx5slqCa6P8xuZYl
 7oVKgATaj+VIlyrY4IRIQE39oKZevsVfekIOqGOGkvHLH0xChfNeRmIiGKfMCHJL2ugd
 Y2hw==
X-Gm-Message-State: AOAM532ZjK+X8lGweCCSdKukwsZ41hWUPSDGmKfA56itS7ovV6bYNw1F
 VHyEyAh9dcMi0ukzNB0fz1DnY00+6Qs8mkyJ
X-Google-Smtp-Source: ABdhPJxMXw1gzNXlxwIHb4CAY5lP9Wa8miP0MmwEK3XDC1CP0d+r+lMVMI074B6mcMPQLOcjE4umsw==
X-Received: by 2002:aca:5a42:: with SMTP id o63mr3498827oib.69.1607450523604; 
 Tue, 08 Dec 2020 10:02:03 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id k20sm3886805oig.35.2020.12.08.10.02.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 10:02:02 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 24/24] target/arm: Enforce alignment for sve unpredicated
 LDR/STR
Date: Tue,  8 Dec 2020 12:01:18 -0600
Message-Id: <20201208180118.157911-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201208180118.157911-1-richard.henderson@linaro.org>
References: <20201208180118.157911-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::244;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x244.google.com
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 58 +++++++++++++++++++++++++++++---------
 1 file changed, 45 insertions(+), 13 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 6125e734af..b481e97428 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -4263,7 +4263,8 @@ static bool trans_UCVTF_dd(DisasContext *s, arg_rpr_esz *a)
  * The load should begin at the address Rn + IMM.
  */
 
-static void do_ldr(DisasContext *s, uint32_t vofs, int len, int rn, int imm)
+static void do_ldr(DisasContext *s, uint32_t vofs, int len,
+                   MemOp align, int rn, int imm)
 {
     int len_align = QEMU_ALIGN_DOWN(len, 8);
     int len_remain = len % 8;
@@ -4276,6 +4277,10 @@ static void do_ldr(DisasContext *s, uint32_t vofs, int len, int rn, int imm)
     clean_addr = gen_mte_checkN(s, dirty_addr, false, rn != 31, len, MO_8);
     tcg_temp_free_i64(dirty_addr);
 
+    if (!s->align_mem) {
+        align = 0;
+    }
+
     /*
      * Note that unpredicated load/store of vector/predicate registers
      * are defined as a stream of bytes, which equates to little-endian
@@ -4288,7 +4293,8 @@ static void do_ldr(DisasContext *s, uint32_t vofs, int len, int rn, int imm)
 
         t0 = tcg_temp_new_i64();
         for (i = 0; i < len_align; i += 8) {
-            tcg_gen_qemu_ld_i64(t0, clean_addr, midx, MO_LEQ);
+            tcg_gen_qemu_ld_i64(t0, clean_addr, midx, MO_LEQ | align);
+            align = 0;
             tcg_gen_st_i64(t0, cpu_env, vofs + i);
             tcg_gen_addi_i64(clean_addr, clean_addr, 8);
         }
@@ -4302,6 +4308,16 @@ static void do_ldr(DisasContext *s, uint32_t vofs, int len, int rn, int imm)
         clean_addr = new_tmp_a64_local(s);
         tcg_gen_mov_i64(clean_addr, t0);
 
+        if (align > MO_ALIGN_8) {
+            t0 = tcg_temp_new_i64();
+            tcg_gen_qemu_ld_i64(t0, clean_addr, midx, MO_LEQ | align);
+            tcg_gen_addi_i64(clean_addr, clean_addr, 8);
+            tcg_gen_addi_ptr(i, i, 8);
+            tcg_gen_st_i64(t0, cpu_env, vofs);
+            tcg_temp_free_i64(t0);
+            align = 0;
+        }
+
         gen_set_label(loop);
 
         t0 = tcg_temp_new_i64();
@@ -4330,12 +4346,12 @@ static void do_ldr(DisasContext *s, uint32_t vofs, int len, int rn, int imm)
         case 4:
         case 8:
             tcg_gen_qemu_ld_i64(t0, clean_addr, midx,
-                                MO_LE | ctz32(len_remain));
+                                MO_LE | ctz32(len_remain) | align);
             break;
 
         case 6:
             t1 = tcg_temp_new_i64();
-            tcg_gen_qemu_ld_i64(t0, clean_addr, midx, MO_LEUL);
+            tcg_gen_qemu_ld_i64(t0, clean_addr, midx, MO_LEUL | align);
             tcg_gen_addi_i64(clean_addr, clean_addr, 4);
             tcg_gen_qemu_ld_i64(t1, clean_addr, midx, MO_LEUW);
             tcg_gen_deposit_i64(t0, t0, t1, 32, 32);
@@ -4351,7 +4367,8 @@ static void do_ldr(DisasContext *s, uint32_t vofs, int len, int rn, int imm)
 }
 
 /* Similarly for stores.  */
-static void do_str(DisasContext *s, uint32_t vofs, int len, int rn, int imm)
+static void do_str(DisasContext *s, uint32_t vofs, int len, MemOp align,
+                   int rn, int imm)
 {
     int len_align = QEMU_ALIGN_DOWN(len, 8);
     int len_remain = len % 8;
@@ -4364,6 +4381,10 @@ static void do_str(DisasContext *s, uint32_t vofs, int len, int rn, int imm)
     clean_addr = gen_mte_checkN(s, dirty_addr, false, rn != 31, len, MO_8);
     tcg_temp_free_i64(dirty_addr);
 
+    if (!s->align_mem) {
+        align = 0;
+    }
+
     /* Note that unpredicated load/store of vector/predicate registers
      * are defined as a stream of bytes, which equates to little-endian
      * operations on larger quantities.  There is no nice way to force
@@ -4378,7 +4399,8 @@ static void do_str(DisasContext *s, uint32_t vofs, int len, int rn, int imm)
         t0 = tcg_temp_new_i64();
         for (i = 0; i < len_align; i += 8) {
             tcg_gen_ld_i64(t0, cpu_env, vofs + i);
-            tcg_gen_qemu_st_i64(t0, clean_addr, midx, MO_LEQ);
+            tcg_gen_qemu_st_i64(t0, clean_addr, midx, MO_LEQ | align);
+            align = 0;
             tcg_gen_addi_i64(clean_addr, clean_addr, 8);
         }
         tcg_temp_free_i64(t0);
@@ -4391,6 +4413,16 @@ static void do_str(DisasContext *s, uint32_t vofs, int len, int rn, int imm)
         clean_addr = new_tmp_a64_local(s);
         tcg_gen_mov_i64(clean_addr, t0);
 
+        if (align > MO_ALIGN_8) {
+            t0 = tcg_temp_new_i64();
+            tcg_gen_ld_i64(t0, cpu_env, vofs);
+            tcg_gen_qemu_st_i64(t0, clean_addr, midx, MO_LEQ | align);
+            tcg_gen_addi_i64(clean_addr, clean_addr, 8);
+            tcg_gen_addi_ptr(i, i, 8);
+            tcg_temp_free_i64(t0);
+            align = 0;
+        }
+
         gen_set_label(loop);
 
         t0 = tcg_temp_new_i64();
@@ -4400,7 +4432,7 @@ static void do_str(DisasContext *s, uint32_t vofs, int len, int rn, int imm)
         tcg_gen_addi_ptr(i, i, 8);
         tcg_temp_free_ptr(tp);
 
-        tcg_gen_qemu_st_i64(t0, clean_addr, midx, MO_LEQ);
+        tcg_gen_qemu_st_i64(t0, clean_addr, midx, MO_LEQ | align);
         tcg_gen_addi_i64(clean_addr, clean_addr, 8);
         tcg_temp_free_i64(t0);
 
@@ -4418,11 +4450,11 @@ static void do_str(DisasContext *s, uint32_t vofs, int len, int rn, int imm)
         case 4:
         case 8:
             tcg_gen_qemu_st_i64(t0, clean_addr, midx,
-                                MO_LE | ctz32(len_remain));
+                                MO_LE | ctz32(len_remain) | align);
             break;
 
         case 6:
-            tcg_gen_qemu_st_i64(t0, clean_addr, midx, MO_LEUL);
+            tcg_gen_qemu_st_i64(t0, clean_addr, midx, MO_LEUL | align);
             tcg_gen_addi_i64(clean_addr, clean_addr, 4);
             tcg_gen_shri_i64(t0, t0, 32);
             tcg_gen_qemu_st_i64(t0, clean_addr, midx, MO_LEUW);
@@ -4440,7 +4472,7 @@ static bool trans_LDR_zri(DisasContext *s, arg_rri *a)
     if (sve_access_check(s)) {
         int size = vec_full_reg_size(s);
         int off = vec_full_reg_offset(s, a->rd);
-        do_ldr(s, off, size, a->rn, a->imm * size);
+        do_ldr(s, off, size, MO_ALIGN_16, a->rn, a->imm * size);
     }
     return true;
 }
@@ -4450,7 +4482,7 @@ static bool trans_LDR_pri(DisasContext *s, arg_rri *a)
     if (sve_access_check(s)) {
         int size = pred_full_reg_size(s);
         int off = pred_full_reg_offset(s, a->rd);
-        do_ldr(s, off, size, a->rn, a->imm * size);
+        do_ldr(s, off, size, MO_ALIGN_2, a->rn, a->imm * size);
     }
     return true;
 }
@@ -4460,7 +4492,7 @@ static bool trans_STR_zri(DisasContext *s, arg_rri *a)
     if (sve_access_check(s)) {
         int size = vec_full_reg_size(s);
         int off = vec_full_reg_offset(s, a->rd);
-        do_str(s, off, size, a->rn, a->imm * size);
+        do_str(s, off, size, MO_ALIGN_16, a->rn, a->imm * size);
     }
     return true;
 }
@@ -4470,7 +4502,7 @@ static bool trans_STR_pri(DisasContext *s, arg_rri *a)
     if (sve_access_check(s)) {
         int size = pred_full_reg_size(s);
         int off = pred_full_reg_offset(s, a->rd);
-        do_str(s, off, size, a->rn, a->imm * size);
+        do_str(s, off, size, MO_ALIGN_2, a->rn, a->imm * size);
     }
     return true;
 }
-- 
2.25.1


