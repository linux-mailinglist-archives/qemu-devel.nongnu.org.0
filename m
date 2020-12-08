Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A4212D323D
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 19:35:15 +0100 (CET)
Received: from localhost ([::1]:38892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmhpS-00024Z-6A
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 13:35:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kmhJF-00088h-3Z
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 13:01:57 -0500
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:42315)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kmhJD-0006Pf-4M
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 13:01:56 -0500
Received: by mail-ot1-x344.google.com with SMTP id 11so16602563oty.9
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 10:01:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=p4ZvDwBTziZmZdqk805FY1f/U8VtmHM73z1nIW++Hok=;
 b=XPnZ76HdHl6ih/rkKOb/3fSqNXGxRbgSyDIPnSd5FZuFged9ULPhs7zggMjClJggrP
 jsHRNdSn3lw6yIfZG6pwOQjpky7kmRfUAmjLwF7kzHxM+eI+rKLDkE2eKjeSIWPk8zkD
 UHIIabOwX0aTNeTVDkLgDjwBtm+05Y94okTXRclDFcpjjIvcVK+sz8GAJmarvnOwizgQ
 AvH8ZBUQgnhg9w1UZVrL14iPwDCSyn6lXWGeKELdfe+VdJRrRyNZHoxo4v42kwckYQZB
 GzuMhzGIupYMPaDCxpdQTOj7ul50L6U1ktS/+KxVcSZi71352DuTfkU6BMs9WeF075bE
 lI1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=p4ZvDwBTziZmZdqk805FY1f/U8VtmHM73z1nIW++Hok=;
 b=GD80+TZKxTuygML6jgHq21QQxJJTY0/+xfnWxiy9h6TQpV6WsBfIzJ8h1F8zTwjlr3
 zGwIL6/OrJyFj5NUKCUHI9qMk8LqrdYTZasemR4Yw2ssbhs/E//5FGvZAUoTQViIq3zH
 URQ4tAiLKGQkLUZ4sbLKl7oerN/Id9DKq/3ddOptocPTzSsKvyCcjjQ/M7x72WdD20sP
 0Ne6VHoGSq8lgUGCFbP6bq/xYoxHdUeU5HZ82L4rO/35LhofoYmZRRBY5cbowcgz34Kz
 J/1YjgOoMeDDfvGH6lQ9uJhuR+ZgUe7E0l9rgCKeFt01ruI8bE0SqdWrtNGUrSeEhmoV
 4uPw==
X-Gm-Message-State: AOAM531ztDgcRyYVmzNy/DeOoHwOLPGg/A40P29b9F8R51fs0l80V56n
 CikDMpsxErauA/lAG47leB4G579MaTRLr901
X-Google-Smtp-Source: ABdhPJyo1aje1yK7SbzdWDAQj7uNKiyTpNUmI+K/bmYI3neVRbafRoP/paxi4tdJUX7/1S0KqtxwSw==
X-Received: by 2002:a05:6830:90f:: with SMTP id
 v15mr13881486ott.223.1607450513685; 
 Tue, 08 Dec 2020 10:01:53 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id k20sm3886805oig.35.2020.12.08.10.01.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 10:01:51 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 17/24] target/arm: Use finalize_memop for aa64 gpr
 load/store
Date: Tue,  8 Dec 2020 12:01:11 -0600
Message-Id: <20201208180118.157911-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201208180118.157911-1-richard.henderson@linaro.org>
References: <20201208180118.157911-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::344;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x344.google.com
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

In the case of gpr load, merge the size and is_signed arguments;
otherwise, simply convert size to memop.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 78 ++++++++++++++++----------------------
 1 file changed, 33 insertions(+), 45 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 2e3fdfdf6b..d34ec892c6 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -880,19 +880,19 @@ static void gen_adc_CC(int sf, TCGv_i64 dest, TCGv_i64 t0, TCGv_i64 t1)
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
@@ -903,37 +903,28 @@ static void do_gpr_st_memidx(DisasContext *s, TCGv_i64 source,
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
 
@@ -941,8 +932,8 @@ static void do_gpr_ld_memidx(DisasContext *s,
         uint32_t syn;
 
         syn = syn_data_abort_with_iss(0,
-                                      size,
-                                      is_signed,
+                                      (memop & MO_SIZE),
+                                      (memop & MO_SIGN) != 0,
                                       iss_srt,
                                       iss_sf,
                                       iss_ar,
@@ -951,14 +942,12 @@ static void do_gpr_ld_memidx(DisasContext *s,
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
 
@@ -2687,7 +2676,7 @@ static void disas_ldst_excl(DisasContext *s, uint32_t insn)
         }
         clean_addr = gen_mte_check1(s, cpu_reg_sp(s, rn),
                                     false, rn != 31, size);
-        do_gpr_ld(s, cpu_reg(s, rt), clean_addr, size, false, false, true, rt,
+        do_gpr_ld(s, cpu_reg(s, rt), clean_addr, size, false, true, rt,
                   disas_ldst_compute_iss_sf(size, false, 0), is_lasr);
         tcg_gen_mb(TCG_MO_ALL | TCG_BAR_LDAQ);
         return;
@@ -2800,8 +2789,8 @@ static void disas_ld_lit(DisasContext *s, uint32_t insn)
         /* Only unsigned 32bit loads target 32bit registers.  */
         bool iss_sf = opc != 0;
 
-        do_gpr_ld(s, tcg_rt, clean_addr, size, is_signed, false,
-                  true, rt, iss_sf, false);
+        do_gpr_ld(s, tcg_rt, clean_addr, size + is_signed * MO_SIGN,
+                  false, true, rt, iss_sf, false);
     }
     tcg_temp_free_i64(clean_addr);
 }
@@ -2960,11 +2949,11 @@ static void disas_ldst_pair(DisasContext *s, uint32_t insn)
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
@@ -3095,8 +3084,8 @@ static void disas_ldst_reg_imm9(DisasContext *s, uint32_t insn,
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
@@ -3200,9 +3189,8 @@ static void disas_ldst_reg_roffset(DisasContext *s, uint32_t insn,
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
@@ -3285,8 +3273,8 @@ static void disas_ldst_reg_unsigned_imm(DisasContext *s, uint32_t insn,
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
@@ -3373,7 +3361,7 @@ static void disas_ldst_atomic(DisasContext *s, uint32_t insn,
          * full load-acquire (we only need "load-acquire processor consistent"),
          * but we choose to implement them as full LDAQ.
          */
-        do_gpr_ld(s, cpu_reg(s, rt), clean_addr, size, false, false,
+        do_gpr_ld(s, cpu_reg(s, rt), clean_addr, size, false,
                   true, rt, disas_ldst_compute_iss_sf(size, false, 0), true);
         tcg_gen_mb(TCG_MO_ALL | TCG_BAR_LDAQ);
         return;
@@ -3446,7 +3434,7 @@ static void disas_ldst_pac(DisasContext *s, uint32_t insn,
                                 is_wback || rn != 31, size);
 
     tcg_rt = cpu_reg(s, rt);
-    do_gpr_ld(s, tcg_rt, clean_addr, size, /* is_signed */ false,
+    do_gpr_ld(s, tcg_rt, clean_addr, size,
               /* extend */ false, /* iss_valid */ !is_wback,
               /* iss_srt */ rt, /* iss_sf */ true, /* iss_ar */ false);
 
@@ -3531,8 +3519,8 @@ static void disas_ldst_ldapr_stlr(DisasContext *s, uint32_t insn)
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
2.25.1


