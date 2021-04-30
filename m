Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62C1936F8E8
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 13:03:27 +0200 (CEST)
Received: from localhost ([::1]:41164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcQve-0004cs-Dp
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 07:03:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lcQUT-0007uI-O4
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:35:23 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:35388)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lcQUE-0001OV-7k
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:35:21 -0400
Received: by mail-wr1-x42a.google.com with SMTP id a4so70023000wrr.2
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 03:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=6XTX/ivISDuqZQtLc7u0559fCih8oM9emc0tB4mriTY=;
 b=RIA50XW9EndQOZcZppiCCoPzSrAyX+PuDQEDUvyBoZOcf7DSkExJN7gUHMqkkmH5HZ
 qDXYmXSMm8i8BPSF3N3J5PvYVVY/gV0nWMUu4hVYiqm1JoGHoVwAraPdDziMEbEkXilu
 U7NjYkxtekWtTHspZe/Lnb4q1QzqxwzKJD0M3jhYHc+yNDtXxsfi5ve6Hze4bGP97fkj
 CxEQR4JpnqoHxWTsUJmdndwbQzxPXUIz256Ix67GG5XUJN54O1a/4qUSx2V1mZ/r+BY7
 +rAsDdoGB3EhNZGOCe0IyJ5TCWoUbEWanIuXdgNdqxc6wAFKKDkCk2x+2uHVWKizoW/n
 hUNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6XTX/ivISDuqZQtLc7u0559fCih8oM9emc0tB4mriTY=;
 b=oFUCyq3DMjTGXr0OMCSTfD6pvZNiIkpQsQeBxAV7GkWwoFG9ykE2MGdYD6UWf/79Ir
 9eElviGDijjOY+2r/exFJBOyYb0sQAIsBRa5mvEtnHnh9B364RktCL1Uf3Z5JUIbb9UI
 YSU5wiwX/ufVRbcznK7h11JIGZfwHSKDEaXqZ97HBvNuKatmBffxBJZOTRDUod0YeK/0
 d70JeZDGswcYNiLlMPaKyNXs9GTSs9mF+VwigFd8mfLDI6BlP8Iy0Oqj65da9v8QJdDH
 L8IfXwiKCn/XtYtt5vItjBRQ67CfvJ9aCkYyg4sGTgR/I9HMmlHAbJzQ41u4uFTpK3Iw
 dqZg==
X-Gm-Message-State: AOAM5323nlHkTwheOUNQMsATXZJIgyOOG/QOAnnC/OwiC2IhyNrUxMDA
 8EkYUZb17HTLHa2J8sVuYl/ay4NuFk/4nYNB
X-Google-Smtp-Source: ABdhPJx0Ya1Nka+6O9YcGrW/+mTqwKsS8ltmQyVZsC62r5sPiCdS1z1CPQM6wq9FHhneMLFDLhYb3g==
X-Received: by 2002:adf:f241:: with SMTP id b1mr2378596wrp.150.1619778905007; 
 Fri, 30 Apr 2021 03:35:05 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id 18sm12997817wmo.47.2021.04.30.03.35.04
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 03:35:04 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 35/43] target/arm: Use finalize_memop for aa64 gpr load/store
Date: Fri, 30 Apr 2021 11:34:29 +0100
Message-Id: <20210430103437.4140-36-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210430103437.4140-1-peter.maydell@linaro.org>
References: <20210430103437.4140-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

In the case of gpr load, merge the size and is_signed arguments;
otherwise, simply convert size to memop.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210419202257.161730-26-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-a64.c | 78 ++++++++++++++++----------------------
 1 file changed, 33 insertions(+), 45 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 92a62b1a751..f2995d2b74d 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -886,19 +886,19 @@ static void gen_adc_CC(int sf, TCGv_i64 dest, TCGv_i64 t0, TCGv_i64 t1)
  * Store from GPR register to memory.
  */
 static void do_gpr_st_memidx(DisasContext *s, TCGv_i64 source,
-                             TCGv_i64 tcg_addr, int size, int memidx,
+                             TCGv_i64 tcg_addr, MemOp memop, int memidx,
                              bool iss_valid,
                              unsigned int iss_srt,
                              bool iss_sf, bool iss_ar)
 {
-    g_assert(size <= 3);
-    tcg_gen_qemu_st_i64(source, tcg_addr, memidx, s->be_data + size);
+    memop = finalize_memop(s, memop);
+    tcg_gen_qemu_st_i64(source, tcg_addr, memidx, memop);
 
     if (iss_valid) {
         uint32_t syn;
 
         syn = syn_data_abort_with_iss(0,
-                                      size,
+                                      (memop & MO_SIZE),
                                       false,
                                       iss_srt,
                                       iss_sf,
@@ -909,37 +909,28 @@ static void do_gpr_st_memidx(DisasContext *s, TCGv_i64 source,
 }
 
 static void do_gpr_st(DisasContext *s, TCGv_i64 source,
-                      TCGv_i64 tcg_addr, int size,
+                      TCGv_i64 tcg_addr, MemOp memop,
                       bool iss_valid,
                       unsigned int iss_srt,
                       bool iss_sf, bool iss_ar)
 {
-    do_gpr_st_memidx(s, source, tcg_addr, size, get_mem_index(s),
+    do_gpr_st_memidx(s, source, tcg_addr, memop, get_mem_index(s),
                      iss_valid, iss_srt, iss_sf, iss_ar);
 }
 
 /*
  * Load from memory to GPR register
  */
-static void do_gpr_ld_memidx(DisasContext *s,
-                             TCGv_i64 dest, TCGv_i64 tcg_addr,
-                             int size, bool is_signed,
-                             bool extend, int memidx,
+static void do_gpr_ld_memidx(DisasContext *s, TCGv_i64 dest, TCGv_i64 tcg_addr,
+                             MemOp memop, bool extend, int memidx,
                              bool iss_valid, unsigned int iss_srt,
                              bool iss_sf, bool iss_ar)
 {
-    MemOp memop = s->be_data + size;
-
-    g_assert(size <= 3);
-
-    if (is_signed) {
-        memop += MO_SIGN;
-    }
-
+    memop = finalize_memop(s, memop);
     tcg_gen_qemu_ld_i64(dest, tcg_addr, memidx, memop);
 
-    if (extend && is_signed) {
-        g_assert(size < 3);
+    if (extend && (memop & MO_SIGN)) {
+        g_assert((memop & MO_SIZE) <= MO_32);
         tcg_gen_ext32u_i64(dest, dest);
     }
 
@@ -947,8 +938,8 @@ static void do_gpr_ld_memidx(DisasContext *s,
         uint32_t syn;
 
         syn = syn_data_abort_with_iss(0,
-                                      size,
-                                      is_signed,
+                                      (memop & MO_SIZE),
+                                      (memop & MO_SIGN) != 0,
                                       iss_srt,
                                       iss_sf,
                                       iss_ar,
@@ -957,14 +948,12 @@ static void do_gpr_ld_memidx(DisasContext *s,
     }
 }
 
-static void do_gpr_ld(DisasContext *s,
-                      TCGv_i64 dest, TCGv_i64 tcg_addr,
-                      int size, bool is_signed, bool extend,
+static void do_gpr_ld(DisasContext *s, TCGv_i64 dest, TCGv_i64 tcg_addr,
+                      MemOp memop, bool extend,
                       bool iss_valid, unsigned int iss_srt,
                       bool iss_sf, bool iss_ar)
 {
-    do_gpr_ld_memidx(s, dest, tcg_addr, size, is_signed, extend,
-                     get_mem_index(s),
+    do_gpr_ld_memidx(s, dest, tcg_addr, memop, extend, get_mem_index(s),
                      iss_valid, iss_srt, iss_sf, iss_ar);
 }
 
@@ -2717,7 +2706,7 @@ static void disas_ldst_excl(DisasContext *s, uint32_t insn)
         }
         clean_addr = gen_mte_check1(s, cpu_reg_sp(s, rn),
                                     false, rn != 31, size);
-        do_gpr_ld(s, cpu_reg(s, rt), clean_addr, size, false, false, true, rt,
+        do_gpr_ld(s, cpu_reg(s, rt), clean_addr, size, false, true, rt,
                   disas_ldst_compute_iss_sf(size, false, 0), is_lasr);
         tcg_gen_mb(TCG_MO_ALL | TCG_BAR_LDAQ);
         return;
@@ -2830,8 +2819,8 @@ static void disas_ld_lit(DisasContext *s, uint32_t insn)
         /* Only unsigned 32bit loads target 32bit registers.  */
         bool iss_sf = opc != 0;
 
-        do_gpr_ld(s, tcg_rt, clean_addr, size, is_signed, false,
-                  true, rt, iss_sf, false);
+        do_gpr_ld(s, tcg_rt, clean_addr, size + is_signed * MO_SIGN,
+                  false, true, rt, iss_sf, false);
     }
     tcg_temp_free_i64(clean_addr);
 }
@@ -2989,11 +2978,11 @@ static void disas_ldst_pair(DisasContext *s, uint32_t insn)
             /* Do not modify tcg_rt before recognizing any exception
              * from the second load.
              */
-            do_gpr_ld(s, tmp, clean_addr, size, is_signed, false,
-                      false, 0, false, false);
+            do_gpr_ld(s, tmp, clean_addr, size + is_signed * MO_SIGN,
+                      false, false, 0, false, false);
             tcg_gen_addi_i64(clean_addr, clean_addr, 1 << size);
-            do_gpr_ld(s, tcg_rt2, clean_addr, size, is_signed, false,
-                      false, 0, false, false);
+            do_gpr_ld(s, tcg_rt2, clean_addr, size + is_signed * MO_SIGN,
+                      false, false, 0, false, false);
 
             tcg_gen_mov_i64(tcg_rt, tmp);
             tcg_temp_free_i64(tmp);
@@ -3124,8 +3113,8 @@ static void disas_ldst_reg_imm9(DisasContext *s, uint32_t insn,
             do_gpr_st_memidx(s, tcg_rt, clean_addr, size, memidx,
                              iss_valid, rt, iss_sf, false);
         } else {
-            do_gpr_ld_memidx(s, tcg_rt, clean_addr, size,
-                             is_signed, is_extended, memidx,
+            do_gpr_ld_memidx(s, tcg_rt, clean_addr, size + is_signed * MO_SIGN,
+                             is_extended, memidx,
                              iss_valid, rt, iss_sf, false);
         }
     }
@@ -3229,9 +3218,8 @@ static void disas_ldst_reg_roffset(DisasContext *s, uint32_t insn,
             do_gpr_st(s, tcg_rt, clean_addr, size,
                       true, rt, iss_sf, false);
         } else {
-            do_gpr_ld(s, tcg_rt, clean_addr, size,
-                      is_signed, is_extended,
-                      true, rt, iss_sf, false);
+            do_gpr_ld(s, tcg_rt, clean_addr, size + is_signed * MO_SIGN,
+                      is_extended, true, rt, iss_sf, false);
         }
     }
 }
@@ -3314,8 +3302,8 @@ static void disas_ldst_reg_unsigned_imm(DisasContext *s, uint32_t insn,
             do_gpr_st(s, tcg_rt, clean_addr, size,
                       true, rt, iss_sf, false);
         } else {
-            do_gpr_ld(s, tcg_rt, clean_addr, size, is_signed, is_extended,
-                      true, rt, iss_sf, false);
+            do_gpr_ld(s, tcg_rt, clean_addr, size + is_signed * MO_SIGN,
+                      is_extended, true, rt, iss_sf, false);
         }
     }
 }
@@ -3402,7 +3390,7 @@ static void disas_ldst_atomic(DisasContext *s, uint32_t insn,
          * full load-acquire (we only need "load-acquire processor consistent"),
          * but we choose to implement them as full LDAQ.
          */
-        do_gpr_ld(s, cpu_reg(s, rt), clean_addr, size, false, false,
+        do_gpr_ld(s, cpu_reg(s, rt), clean_addr, size, false,
                   true, rt, disas_ldst_compute_iss_sf(size, false, 0), true);
         tcg_gen_mb(TCG_MO_ALL | TCG_BAR_LDAQ);
         return;
@@ -3475,7 +3463,7 @@ static void disas_ldst_pac(DisasContext *s, uint32_t insn,
                                 is_wback || rn != 31, size);
 
     tcg_rt = cpu_reg(s, rt);
-    do_gpr_ld(s, tcg_rt, clean_addr, size, /* is_signed */ false,
+    do_gpr_ld(s, tcg_rt, clean_addr, size,
               /* extend */ false, /* iss_valid */ !is_wback,
               /* iss_srt */ rt, /* iss_sf */ true, /* iss_ar */ false);
 
@@ -3560,8 +3548,8 @@ static void disas_ldst_ldapr_stlr(DisasContext *s, uint32_t insn)
          * Load-AcquirePC semantics; we implement as the slightly more
          * restrictive Load-Acquire.
          */
-        do_gpr_ld(s, cpu_reg(s, rt), clean_addr, size, is_signed, extend,
-                  true, rt, iss_sf, true);
+        do_gpr_ld(s, cpu_reg(s, rt), clean_addr, size + is_signed * MO_SIGN,
+                  extend, true, rt, iss_sf, true);
         tcg_gen_mb(TCG_MO_ALL | TCG_BAR_LDAQ);
     }
 }
-- 
2.20.1


