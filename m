Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D87F3698AFC
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 04:11:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSUeB-0007Qe-15; Wed, 15 Feb 2023 22:09:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSUe5-0007MB-HK
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 22:09:18 -0500
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSUe3-0000A0-KT
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 22:09:17 -0500
Received: by mail-pg1-x531.google.com with SMTP id x31so428166pgl.6
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 19:09:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a0tYDB8IQXSc08aG5pUrvVghYnFW8gqBhheBrsscIzw=;
 b=iJJZQx4kn8mmBW/eVe1m9hPx3OEkPsCdJzYroC55G+FkDYHzStPjoEdkSkO3nlzUxN
 1WzXB7RDC8xiw2c37/ySXOeuoOX1D3JWRGEC7afY2Z0NXJFxXirqaxym1lsg211u1A6d
 43Cnu9FMcgU/1eKdbzIkIETrZhsSWcjUUUrBrVw9BojN5VDUVEhWNYhLKO0uFyEvRVz4
 hAzquJYZlOmapd/Ky5xvapw26fnAEuIbeYkf7YCBBx+WDowvBO6Apif651v8KfQr8EHf
 UN2gvMqwfa0wcgutCPA2ezjeS/+EcNbavwCWckQaRl65pSm1HGc83OkT1W22mJbK5Y94
 zIsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=a0tYDB8IQXSc08aG5pUrvVghYnFW8gqBhheBrsscIzw=;
 b=f225anah5fSduHFhEZg0vGCFy7PMqnVWmXxwmXCUU/rliFxzU47+SYHehPySBXF6i3
 4giYeGqGss4H05G3nQwHSbthygIXyrIzitmS9Sw+uvTWSHcScEJpacdh3tUXxS6Q6GXy
 pK89+aq1zlLrA8vC3mx/TWK2wPx/O3giUW7vS3FNh8l5x2FZ3wx7aMZDp1F+hqQuLVG2
 d9dxlBLuXhlN9ntGhqJso0Uew2qx/QBW7dSCnv50dmGTPK/xeuAtH7tDZEnoy3w8ouGF
 w5BTSrMWFEv3MhHjXwdWBzE09MFN9WHbQq4lHC3B3SBZmR9NMMGYhk/WJZ9XuzlGH9pl
 XJFA==
X-Gm-Message-State: AO0yUKWoYI1Kgou9H+wQ4ru0od4YQBxoDA21MbUp2qTFRqUiq7m6X8B5
 CT95rvrGOl6sC61DECCPuFjgBOkfzrGv+naSzuE=
X-Google-Smtp-Source: AK7set+xMmwrsD0zabAr6GrbAjXQkIdPZXq47McoVRiKBWkfEXoW60vDm2MlCJCWLtyFsP3tBUS+SA==
X-Received: by 2002:a62:1d14:0:b0:5a8:718c:5ee9 with SMTP id
 d20-20020a621d14000000b005a8718c5ee9mr3749770pfd.25.1676516953960; 
 Wed, 15 Feb 2023 19:09:13 -0800 (PST)
Received: from stoup.. (rrcs-74-87-59-234.west.biz.rr.com. [74.87.59.234])
 by smtp.gmail.com with ESMTPSA id
 i25-20020aa79099000000b005810a54fdefsm79051pfa.114.2023.02.15.19.09.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 19:09:13 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v1 11/19] target/arm: Hoist finalize_memop out of do_fp_{ld,
 st}
Date: Wed, 15 Feb 2023 17:08:46 -1000
Message-Id: <20230216030854.1212208-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230216030854.1212208-1-richard.henderson@linaro.org>
References: <20230216030854.1212208-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

We are going to need the complete memop beforehand,
so let's not compute it twice.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 42 +++++++++++++++++---------------------
 1 file changed, 19 insertions(+), 23 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index fd499a208d..cc857d60d7 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -955,16 +955,14 @@ static void do_gpr_ld(DisasContext *s, TCGv_i64 dest, TCGv_i64 tcg_addr,
 /*
  * Store from FP register to memory
  */
-static void do_fp_st(DisasContext *s, int srcidx, TCGv_i64 tcg_addr, int size)
+static void do_fp_st(DisasContext *s, int srcidx, TCGv_i64 tcg_addr, MemOp mop)
 {
     /* This writes the bottom N bits of a 128 bit wide vector to memory */
     TCGv_i64 tmplo = tcg_temp_new_i64();
-    MemOp mop;
 
     tcg_gen_ld_i64(tmplo, cpu_env, fp_reg_offset(s, srcidx, MO_64));
 
-    if (size < MO_128) {
-        mop = finalize_memop(s, size);
+    if ((mop & MO_SIZE) < MO_128) {
         tcg_gen_qemu_st_i64(tmplo, tcg_addr, get_mem_index(s), mop);
     } else {
         TCGv_i64 tmphi = tcg_temp_new_i64();
@@ -974,7 +972,6 @@ static void do_fp_st(DisasContext *s, int srcidx, TCGv_i64 tcg_addr, int size)
         tcg_gen_concat_i64_i128(t16, tmplo, tmphi);
         tcg_temp_free_i64(tmphi);
 
-        mop = finalize_memop(s, size);
         tcg_gen_qemu_st_i128(t16, tcg_addr, get_mem_index(s), mop);
         tcg_temp_free_i128(t16);
     }
@@ -985,20 +982,17 @@ static void do_fp_st(DisasContext *s, int srcidx, TCGv_i64 tcg_addr, int size)
 /*
  * Load from memory to FP register
  */
-static void do_fp_ld(DisasContext *s, int destidx, TCGv_i64 tcg_addr, int size)
+static void do_fp_ld(DisasContext *s, int destidx, TCGv_i64 tcg_addr, MemOp mop)
 {
     /* This always zero-extends and writes to a full 128 bit wide vector */
     TCGv_i64 tmplo = tcg_temp_new_i64();
     TCGv_i64 tmphi = NULL;
-    MemOp mop;
 
-    if (size < MO_128) {
-        mop = finalize_memop(s, size);
+    if ((mop & MO_SIZE) < MO_128) {
         tcg_gen_qemu_ld_i64(tmplo, tcg_addr, get_mem_index(s), mop);
     } else {
         TCGv_i128 t16 = tcg_temp_new_i128();
 
-        mop = finalize_memop(s, size);
         tcg_gen_qemu_ld_i128(t16, tcg_addr, get_mem_index(s), mop);
 
         tmphi = tcg_temp_new_i64();
@@ -2910,6 +2904,7 @@ static void disas_ld_lit(DisasContext *s, uint32_t insn)
     bool is_signed = false;
     int size = 2;
     TCGv_i64 tcg_rt, clean_addr;
+    MemOp mop;
 
     if (is_vector) {
         if (opc == 3) {
@@ -2933,13 +2928,13 @@ static void disas_ld_lit(DisasContext *s, uint32_t insn)
 
     clean_addr = new_tmp_a64(s);
     gen_pc_plus_diff(s, clean_addr, imm);
+
+    mop = finalize_memop(s, size + is_signed * MO_SIGN);
     if (is_vector) {
-        do_fp_ld(s, rt, clean_addr, size);
+        do_fp_ld(s, rt, clean_addr, mop);
     } else {
         /* Only unsigned 32bit loads target 32bit registers.  */
         bool iss_sf = opc != 0;
-        MemOp memop = finalize_memop(s, size + is_signed * MO_SIGN);
-
         do_gpr_ld(s, tcg_rt, clean_addr, mop, false, true, rt, iss_sf, false);
     }
 }
@@ -3076,16 +3071,17 @@ static void disas_ldst_pair(DisasContext *s, uint32_t insn)
                                 (wback || rn != 31) && !set_tag, 2 << size);
 
     if (is_vector) {
+        MemOp mop = finalize_memop(s, size);
         if (is_load) {
-            do_fp_ld(s, rt, clean_addr, size);
+            do_fp_ld(s, rt, clean_addr, mop);
         } else {
-            do_fp_st(s, rt, clean_addr, size);
+            do_fp_st(s, rt, clean_addr, mop);
         }
         tcg_gen_addi_i64(clean_addr, clean_addr, 1 << size);
         if (is_load) {
-            do_fp_ld(s, rt2, clean_addr, size);
+            do_fp_ld(s, rt2, clean_addr, mop);
         } else {
-            do_fp_st(s, rt2, clean_addr, size);
+            do_fp_st(s, rt2, clean_addr, mop);
         }
     } else {
         TCGv_i64 tcg_rt = cpu_reg(s, rt);
@@ -3269,9 +3265,9 @@ static void disas_ldst_reg_imm9(DisasContext *s, uint32_t insn,
 
     if (is_vector) {
         if (is_store) {
-            do_fp_st(s, rt, clean_addr, size);
+            do_fp_st(s, rt, clean_addr, memop);
         } else {
-            do_fp_ld(s, rt, clean_addr, size);
+            do_fp_ld(s, rt, clean_addr, memop);
         }
     } else {
         TCGv_i64 tcg_rt = cpu_reg(s, rt);
@@ -3377,9 +3373,9 @@ static void disas_ldst_reg_roffset(DisasContext *s, uint32_t insn,
 
     if (is_vector) {
         if (is_store) {
-            do_fp_st(s, rt, clean_addr, size);
+            do_fp_st(s, rt, clean_addr, memop);
         } else {
-            do_fp_ld(s, rt, clean_addr, size);
+            do_fp_ld(s, rt, clean_addr, memop);
         }
     } else {
         TCGv_i64 tcg_rt = cpu_reg(s, rt);
@@ -3463,9 +3459,9 @@ static void disas_ldst_reg_unsigned_imm(DisasContext *s, uint32_t insn,
 
     if (is_vector) {
         if (is_store) {
-            do_fp_st(s, rt, clean_addr, size);
+            do_fp_st(s, rt, clean_addr, memop);
         } else {
-            do_fp_ld(s, rt, clean_addr, size);
+            do_fp_ld(s, rt, clean_addr, memop);
         }
     } else {
         TCGv_i64 tcg_rt = cpu_reg(s, rt);
-- 
2.34.1


