Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21ACB2D31DB
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 19:14:09 +0100 (CET)
Received: from localhost ([::1]:56972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmhV2-0002Vx-5n
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 13:14:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kmhJL-0008Da-7q
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 13:02:03 -0500
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:36431)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kmhJG-0006Q9-Oy
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 13:02:02 -0500
Received: by mail-ot1-x341.google.com with SMTP id y24so16645135otk.3
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 10:01:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fercAGK8YQyiVry22f4HwuGxBL5M6y/uB9CpbtGGXJs=;
 b=KD9zBPdoQoHt/DYMPtmuyY8Gp0D6FAeRXOPpYvg6cBh3EE2Rz0JomAI7k0LZPGexGZ
 Lw6lilmJXlx0Uklk9zUbeiLIvcCpN0hIQLfggb8fQh5FfxmE9zpozam0JG2O3kxPwMMr
 rJ1CVplBocDBYY79Oi1IQxZEIjZwW3adEgzHuqUJP/jJjLyh1r2pVTbFwxSGZwGBokVA
 o2iqyu3Peic7iTzZhutRhjVhtCtQoGYOXZ/Suvw6O5gXy7WAKesO6YiJG3oTeL3gGtWw
 a7fqNCW6E01Pf02NZwJD0MAh6Au5HlF9xeqvIMqFMPorzUQGausA/8usyAqoWo1HeOyc
 j5eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fercAGK8YQyiVry22f4HwuGxBL5M6y/uB9CpbtGGXJs=;
 b=jsG4/pVIOLWVTInw+thHmb+HCEVE1HbAAnzlkqlpW0M5OYpM56RTHELW4VuPQI8kpB
 RVs2NY4rNBSUcirKN11NidOomofjy7VuA/ZnaUiPjutZBBeixcgd1O86rZV0mhweSqe3
 szcS8V9rzzKQvWSE7DpzPNfAC+rRvnnBjyN2i2AgODOWNAjwlLg4OHekdOBwSQucMDOR
 FwOR9qbagy0d2/zuV+A2bQBYHfzRsEzz5Ya2fW7p495im4jui9UivS72PAUZmdfNfom7
 KA+jnDkYBuGSpcb5VrRUFu/YjKghHCs13fLkAeBwxYfEHS/7FxMfuJaUIrZgddPBXhzD
 1BOA==
X-Gm-Message-State: AOAM530SbxLGGCwpN7GcBD1G/fEGX7mgzK/pKPQjST8y13VIaVewD8j1
 xqku1UNR6AuH/ba+11+oN/HqqmeVx1eAmUi0
X-Google-Smtp-Source: ABdhPJzkh13rSIAcTv2O71qYG33I9kVqv00R8xDFAhRtRYjdUDcUcuk1TYp8paL2brlP1m43qorQJw==
X-Received: by 2002:a9d:7c98:: with SMTP id q24mr17538772otn.147.1607450516518; 
 Tue, 08 Dec 2020 10:01:56 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id k20sm3886805oig.35.2020.12.08.10.01.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 10:01:55 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 19/24] target/arm: Enforce alignment for aa64
 load-acq/store-rel
Date: Tue,  8 Dec 2020 12:01:13 -0600
Message-Id: <20201208180118.157911-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201208180118.157911-1-richard.henderson@linaro.org>
References: <20201208180118.157911-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::341;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x341.google.com
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
 target/arm/translate-a64.c | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 152a0a37ab..67a9b3bb09 100644
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


