Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB86C36F8F3
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 13:10:24 +0200 (CEST)
Received: from localhost ([::1]:58506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcR2N-0003aF-Oz
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 07:10:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lcQUX-0007wj-Oh
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:35:25 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:42625)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lcQUF-0001Oh-NL
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:35:25 -0400
Received: by mail-wr1-x436.google.com with SMTP id l2so17690174wrm.9
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 03:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Bf/imavd9eUjfb3z2UO3I9eaVsDiw1wTDTip+/KNxIU=;
 b=kxh93zaf1/HE4dz6jqzugx5pyIh/0YhZ/tCcoAoKnjamyAA3KJO3PBB2s8CCJIV0dF
 ffjFRw35lBWZ7ETGsN9MKsBhzYILRkiOWX+7IPIPtHh9eEAhkldWAZpoTkVVMfH5skKt
 d7NNA9p6gNnvEtQ6u15Vx7I59l49I3A5iS5dnYQ+11eE1yfXSCyL74BBSkXlDrfeKtq9
 nEsS5Ow6fJSbL0jiQI3k5tYU8KXtoeQea71IpUoYN0Bn2mVK8Vf6Tog+Bp1fpQEjfLvI
 t+F4phavklpWG7rMQblYWhipCWVc0euoZAyobOLRzwPDkFFsoAiPIOj1sdAm1XkIFfT1
 ynBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Bf/imavd9eUjfb3z2UO3I9eaVsDiw1wTDTip+/KNxIU=;
 b=pcElw/B/NHO3q4OBKSB3gZN/HtDvgikRJnF2wEH25dn4ty5LdreoZUNFUAe/x2F1w+
 z36nz4WJztuHwatITrBpuocWgopPbqWuEackVHipxYVkpFTPsY6A/S5mri/hTgSn1J6L
 EgHzCPZAL3EBlFw3poApDzQ+u90FdCtjOko9b8ZY0wrQg+35VuHE60GqQa/9gbCW+Ly5
 h7P2hAZ8qU0yeuUWEd1VHDi9bFm5KHTOr8JcwHP9KqFiS9csoVyvYRiOoMzA4ZeIjPtc
 1vAtJUHT5fERJkv7d1MaBipHjPpX9oumVlUNGQn46uWLPiuG4V9PQ6EorFQClFX6EUet
 8ixg==
X-Gm-Message-State: AOAM530BSzzm12lBHOXsfIrMeza7awOWhN2ghX/j+67sFMTXup+Qcm/b
 Fxxgc87Q3Xauhkhn0uskvJVBwqfVPcxcPeMa
X-Google-Smtp-Source: ABdhPJwFWLVh9MH3ujHKV8SBzzhTXvkpDa5no9FtM0bvIL5+Xv1UUCWiqW2nnHFtzwJRSRmZ4zuylA==
X-Received: by 2002:a5d:5254:: with SMTP id k20mr3122383wrc.62.1619778906193; 
 Fri, 30 Apr 2021 03:35:06 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id 18sm12997817wmo.47.2021.04.30.03.35.05
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 03:35:05 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 37/43] target/arm: Enforce alignment for aa64 load-acq/store-rel
Date: Fri, 30 Apr 2021 11:34:31 +0100
Message-Id: <20210430103437.4140-38-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210430103437.4140-1-peter.maydell@linaro.org>
References: <20210430103437.4140-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
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

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210419202257.161730-28-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-a64.c | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index b90d6880e78..ac60dcf7602 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -2699,7 +2699,8 @@ static void disas_ldst_excl(DisasContext *s, uint32_t insn)
         tcg_gen_mb(TCG_MO_ALL | TCG_BAR_STRL);
         clean_addr = gen_mte_check1(s, cpu_reg_sp(s, rn),
                                     true, rn != 31, size);
-        do_gpr_st(s, cpu_reg(s, rt), clean_addr, size, true, rt,
+        /* TODO: ARMv8.4-LSE SCTLR.nAA */
+        do_gpr_st(s, cpu_reg(s, rt), clean_addr, size | MO_ALIGN, true, rt,
                   disas_ldst_compute_iss_sf(size, false, 0), is_lasr);
         return;
 
@@ -2716,8 +2717,9 @@ static void disas_ldst_excl(DisasContext *s, uint32_t insn)
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
 
@@ -3505,15 +3507,18 @@ static void disas_ldst_ldapr_stlr(DisasContext *s, uint32_t insn)
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
@@ -3525,21 +3530,21 @@ static void disas_ldst_ldapr_stlr(DisasContext *s, uint32_t insn)
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
@@ -3552,13 +3557,13 @@ static void disas_ldst_ldapr_stlr(DisasContext *s, uint32_t insn)
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
2.20.1


