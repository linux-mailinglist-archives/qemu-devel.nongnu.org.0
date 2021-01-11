Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0BB62F1F8A
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 20:33:03 +0100 (CET)
Received: from localhost ([::1]:55672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kz2w2-00088C-VA
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 14:33:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz2S7-0006QM-Ga
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 14:02:08 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:37369)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz2S3-0006X9-Rb
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 14:02:07 -0500
Received: by mail-pj1-x1029.google.com with SMTP id b5so107117pjk.2
 for <qemu-devel@nongnu.org>; Mon, 11 Jan 2021 11:02:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lAlv71XV4SKUNxt7geYws+zgzPBGM/IzIZrTaZWAMU4=;
 b=q2uySl2J4wtk/YcI7vLoMM8s8/yTn1lxkCvT9/kIfY6w2RDzxyue/Y0l1k+SpuzBUg
 KE9R2TnDn6yNJXxXOphsVG6Dj62wyIJ5X27Gzn5McmevJCQ5obhMPElX7+v+rgU/V26t
 hQ5Eb9OL4gkCZAfXU4uIvcXuuOAB9aw6OKWIlNFfGUSrafwk9M27Iu52ogZVQsSA5lJr
 PK9JBxoLlJ8iMu0IDI3d4BR/WpLThJKr1VbjgsDoNGYtijulhWrTVIjH3lVyf7/aaNL+
 KFGe3m1Z62L9hPXK2SLKXbCcFYeWgkYHLCjPicBqrBXtnXteIjGJ8Aq5NAVFGjQ8K4TE
 UP2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lAlv71XV4SKUNxt7geYws+zgzPBGM/IzIZrTaZWAMU4=;
 b=Gpyl5MMcmQt7E6GqPRTbmTmU2Kv0ei0+dazHZf2TOyqk8wLSaasU7/QNE51uld/p7J
 d4ksvn0suIjtgqH4VqfIeMev7FqW0F35ONFrFbF1DWbQi8TEUr0HbrvHfJuQYmaYtgBy
 CyNhNZ3MccH90TMg+edZdISUObFco7sjdH9wn+hezISncGOnaNOEBuuTrxKHza29sj2w
 aW5uCzx917cuSonWORApsThozqSlYvPGWHz/3aj7SDQFWZwgbw6y5aeq48uB2r6ap2cn
 WasI9jU4BUSMmVs6KeB9MRjNLFMvVw/noCjtRTcQ+cC8Aft80lsEMozC42857r85d2o1
 PQaw==
X-Gm-Message-State: AOAM533Kipa9z7+1++HS2aPCcTOInFOhec6WArJl3q0xGOKip4Oq430D
 VbClIRhoUK1gk8XKohCxkxGSjtWYrHVNlA==
X-Google-Smtp-Source: ABdhPJyAEtmlNFJSNcp01/AfGlPsYQP4DnV84Vbsktk7x/wxfhzS8Fe54o01HbfsYw7WAlpBi9zyLw==
X-Received: by 2002:a17:902:ee02:b029:db:c0d6:57f9 with SMTP id
 z2-20020a170902ee02b02900dbc0d657f9mr1132017plb.65.1610391722178; 
 Mon, 11 Jan 2021 11:02:02 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id n195sm350395pfd.169.2021.01.11.11.02.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 11:02:01 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 26/30] target/arm: Enforce alignment for aa64
 load-acq/store-rel
Date: Mon, 11 Jan 2021 09:01:09 -1000
Message-Id: <20210111190113.303726-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210111190113.303726-1-richard.henderson@linaro.org>
References: <20210111190113.303726-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 9255763ea7..7f37f8bb12 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -2669,7 +2669,8 @@ static void disas_ldst_excl(DisasContext *s, uint32_t insn)
         tcg_gen_mb(TCG_MO_ALL | TCG_BAR_STRL);
         clean_addr = gen_mte_check1(s, cpu_reg_sp(s, rn),
                                     true, rn != 31, size);
-        do_gpr_st(s, cpu_reg(s, rt), clean_addr, size, true, rt,
+        /* TODO: ARMv8.4-LSE SCTLR.nAA */
+        do_gpr_st(s, cpu_reg(s, rt), clean_addr, size | MO_ALIGN, true, rt,
                   disas_ldst_compute_iss_sf(size, false, 0), is_lasr);
         return;
 
@@ -2686,8 +2687,9 @@ static void disas_ldst_excl(DisasContext *s, uint32_t insn)
         }
         clean_addr = gen_mte_check1(s, cpu_reg_sp(s, rn),
                                     false, rn != 31, size);
-        do_gpr_ld(s, cpu_reg(s, rt), clean_addr, size, false, true, rt,
-                  disas_ldst_compute_iss_sf(size, false, 0), is_lasr);
+        /* TODO: ARMv8.4-LSE SCTLR.nAA */
+        do_gpr_ld(s, cpu_reg(s, rt), clean_addr, size | MO_ALIGN, false, true,
+                  rt, disas_ldst_compute_iss_sf(size, false, 0), is_lasr);
         tcg_gen_mb(TCG_MO_ALL | TCG_BAR_LDAQ);
         return;
 
@@ -3476,15 +3478,18 @@ static void disas_ldst_ldapr_stlr(DisasContext *s, uint32_t insn)
     int size = extract32(insn, 30, 2);
     TCGv_i64 clean_addr, dirty_addr;
     bool is_store = false;
-    bool is_signed = false;
     bool extend = false;
     bool iss_sf;
+    MemOp mop;
 
     if (!dc_isar_feature(aa64_rcpc_8_4, s)) {
         unallocated_encoding(s);
         return;
     }
 
+    /* TODO: ARMv8.4-LSE SCTLR.nAA */
+    mop = size | MO_ALIGN;
+
     switch (opc) {
     case 0: /* STLURB */
         is_store = true;
@@ -3496,21 +3501,21 @@ static void disas_ldst_ldapr_stlr(DisasContext *s, uint32_t insn)
             unallocated_encoding(s);
             return;
         }
-        is_signed = true;
+        mop |= MO_SIGN;
         break;
     case 3: /* LDAPURS* 32-bit variant */
         if (size > 1) {
             unallocated_encoding(s);
             return;
         }
-        is_signed = true;
+        mop |= MO_SIGN;
         extend = true; /* zero-extend 32->64 after signed load */
         break;
     default:
         g_assert_not_reached();
     }
 
-    iss_sf = disas_ldst_compute_iss_sf(size, is_signed, opc);
+    iss_sf = disas_ldst_compute_iss_sf(size, (mop & MO_SIGN) != 0, opc);
 
     if (rn == 31) {
         gen_check_sp_alignment(s);
@@ -3523,13 +3528,13 @@ static void disas_ldst_ldapr_stlr(DisasContext *s, uint32_t insn)
     if (is_store) {
         /* Store-Release semantics */
         tcg_gen_mb(TCG_MO_ALL | TCG_BAR_STRL);
-        do_gpr_st(s, cpu_reg(s, rt), clean_addr, size, true, rt, iss_sf, true);
+        do_gpr_st(s, cpu_reg(s, rt), clean_addr, mop, true, rt, iss_sf, true);
     } else {
         /*
          * Load-AcquirePC semantics; we implement as the slightly more
          * restrictive Load-Acquire.
          */
-        do_gpr_ld(s, cpu_reg(s, rt), clean_addr, size + is_signed * MO_SIGN,
+        do_gpr_ld(s, cpu_reg(s, rt), clean_addr, mop,
                   extend, true, rt, iss_sf, true);
         tcg_gen_mb(TCG_MO_ALL | TCG_BAR_LDAQ);
     }
-- 
2.25.1


