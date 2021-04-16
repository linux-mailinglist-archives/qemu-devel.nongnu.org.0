Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D61DB36288D
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 21:22:52 +0200 (CEST)
Received: from localhost ([::1]:47220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXU3H-0008UH-Vf
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 15:22:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXTiD-00046x-K6
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 15:01:05 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:37501)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXThf-0004VK-21
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 15:01:05 -0400
Received: by mail-pg1-x532.google.com with SMTP id p2so4355076pgh.4
 for <qemu-devel@nongnu.org>; Fri, 16 Apr 2021 12:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zsvdYXq6ehB6Yi/U879OLLmvPBBL5YJ5lhH9C+FI0w0=;
 b=HCKE/RTuzwdMoopodiWGlcV8Lg6/4kqC1kjNOZUBCv8qF8BO9rrGeSx4+F12t2epvN
 UiogMdj92B8uWMzXd9fOhPtnGLHZ4LWjrU2FL2D/C2LZGGmwhSlVn6gFNsdV85CydOfc
 5LQMmRCrT3g5+REKRVrn5xi2B1bKRMTcoT047+6uGrZAHlP/fcyVT30Qjlj0Cvj6Bssa
 Zrk76TWWNUXZRZdySZkaGs8KnMJXqlbD4TKq1I/ICdiwQCrAo+ZbZj+QESsHuMBbqOZh
 sCHQRt3gSaAs5SsJ6sSaUOx096/abAfOA60ON2fVqbb59QSe3x4T9iX6H7zRhpHsR21p
 yzIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zsvdYXq6ehB6Yi/U879OLLmvPBBL5YJ5lhH9C+FI0w0=;
 b=SkWuF3GrBXx4HUWv4CmdWGyrpBpy1x+hUVJDK4dpijkdWdoL1R/NsCrhKB9NGWITCK
 7NKejx74Q8CKzkszObwrB4atb8f7dClylMOO0Cc6goNprw5sAjkjIrbBMPS2J8JyCU//
 VhEdI/Eb6Kp/d5iyvoMU+A8yLP1Kh2d3pztQKWTMswYfIJG6RXBaH8gMB830EZ+Oi0wF
 fiT1SVYb5lPvXU4skW0SCVJEl7X2X5A+FACZvWQw2pFfa/HwEhidkaCYP47tP+VpRgTP
 9iuQC44D6GIgkHNiT2tHi9cohzZ2qRhH+bS/+X+sGbMNfWWz/bWr06ECpyzyhjv7zAqQ
 9hGA==
X-Gm-Message-State: AOAM532BBTjcMVhYXTmlIuotpJj1TQyn9E51VbgRsW7ZysB/d9UcjYWv
 M+O3n4mT/OCDFtjCZAedXhRf1fvD/w1R+A==
X-Google-Smtp-Source: ABdhPJyQxrXYfmqyw1BF7L6JhIRpSe0ej4pyOzzAq42boyTQJNrtr2akjzRfuGIr1nFYifD9oqM6Og==
X-Received: by 2002:a63:5004:: with SMTP id e4mr466189pgb.61.1618599629297;
 Fri, 16 Apr 2021 12:00:29 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id d7sm1988337pfv.197.2021.04.16.12.00.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 12:00:28 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 29/30] target/arm: Enforce alignment for aa64 vector
 LDn/STn (single)
Date: Fri, 16 Apr 2021 11:59:58 -0700
Message-Id: <20210416185959.1520974-30-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210416185959.1520974-1-richard.henderson@linaro.org>
References: <20210416185959.1520974-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 2a82dbbd6d..95897e63af 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -3815,6 +3815,7 @@ static void disas_ldst_single_struct(DisasContext *s, uint32_t insn)
     int index = is_q << 3 | S << 2 | size;
     int xs, total;
     TCGv_i64 clean_addr, tcg_rn, tcg_ebytes;
+    MemOp mop;
 
     if (extract32(insn, 31, 1)) {
         unallocated_encoding(s);
@@ -3876,6 +3877,7 @@ static void disas_ldst_single_struct(DisasContext *s, uint32_t insn)
 
     clean_addr = gen_mte_checkN(s, tcg_rn, !is_load, is_postidx || rn != 31,
                                 total);
+    mop = finalize_memop(s, scale);
 
     tcg_ebytes = tcg_const_i64(1 << scale);
     for (xs = 0; xs < selem; xs++) {
@@ -3883,8 +3885,7 @@ static void disas_ldst_single_struct(DisasContext *s, uint32_t insn)
             /* Load and replicate to all elements */
             TCGv_i64 tcg_tmp = tcg_temp_new_i64();
 
-            tcg_gen_qemu_ld_i64(tcg_tmp, clean_addr,
-                                get_mem_index(s), s->be_data + scale);
+            tcg_gen_qemu_ld_i64(tcg_tmp, clean_addr, get_mem_index(s), mop);
             tcg_gen_gvec_dup_i64(scale, vec_full_reg_offset(s, rt),
                                  (is_q + 1) * 8, vec_full_reg_size(s),
                                  tcg_tmp);
@@ -3892,9 +3893,9 @@ static void disas_ldst_single_struct(DisasContext *s, uint32_t insn)
         } else {
             /* Load/store one element per register */
             if (is_load) {
-                do_vec_ld(s, rt, index, clean_addr, scale | s->be_data);
+                do_vec_ld(s, rt, index, clean_addr, mop);
             } else {
-                do_vec_st(s, rt, index, clean_addr, scale | s->be_data);
+                do_vec_st(s, rt, index, clean_addr, mop);
             }
         }
         tcg_gen_add_i64(clean_addr, clean_addr, tcg_ebytes);
-- 
2.25.1


