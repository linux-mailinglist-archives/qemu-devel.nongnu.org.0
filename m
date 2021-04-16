Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6020D362872
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 21:14:55 +0200 (CEST)
Received: from localhost ([::1]:46426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXTva-0004jH-CQ
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 15:14:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXTi6-000440-UD
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 15:00:59 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:53815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXThb-0004TZ-VB
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 15:00:57 -0400
Received: by mail-pj1-x1033.google.com with SMTP id nk8so1353253pjb.3
 for <qemu-devel@nongnu.org>; Fri, 16 Apr 2021 12:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4YmyrCHsuRewu4q7IzToC9sV4YEHbKzZOaqHia3EHmw=;
 b=IwAjoN70hRWeh3MYx/1PnYv+cGIuW9RRGf5UqDkUYjqI6Uwyh+naFo570QuneTnhvD
 KObAhv6AyqucCb7hiJ+MMf/dNAtf8azE1hUPKZvkzcXAUnoRJWOTbctpQIT38UHjhlgj
 T+1FwJJsrjv5kUW5BKOBOkRFHfXioLYgIya6RmKJ9jYTGBzHAa/JjdgHfm1X00qzoAsf
 865dAbSifzHBq0G9r+onnMDtP4zH2cerRJ6G3exNYedOq9e5AlzOOexp0MRl7KXrsQ0P
 R/KFMOsMA8nSO/YPDoscw9KujsA26lhTyKnStch7dm2j8PkK675swKJduuGfUH77jPdO
 8Ltw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4YmyrCHsuRewu4q7IzToC9sV4YEHbKzZOaqHia3EHmw=;
 b=hQxN4agdRr5sTG05mvb+irjn/4+hfqqqO6Y4GiHq4Cj1Yv5C6aRcey8WWO21O34oHm
 wgXk6RIxG7/XD//D8TNCkrKHDfEXsl8MQzrciFT2+aAModGUFoOzVoTUJjjzvKZmr6bD
 3sMpemduL9NB4HpIm/vHBNcxnchr8+T1xEkCYD6qocw6CNceNz8NiC54PAo9gkHjJ0Vd
 MqNs4FlV1OwfJhhGSNmuZ4toLl6EuQXVD/E1NOrV+70E0yypOwUmQIBEGUkgQlU+mW9h
 4k0C5+Z/g9NUKTsWRwsEdEI3+2u7QbeMwEiIiwmIh7bKe/bQbcHSQG4Uysxo4nWSTLmM
 482g==
X-Gm-Message-State: AOAM5316My+NeqG2jlrW3iX5DiYNN/X4+BSqmCWxLdlR7iuPScXlTq4f
 UKJoeo7emPoRa9j56dZ+ikDxqOVrZrFFrw==
X-Google-Smtp-Source: ABdhPJwWqJvtwLknmjimqdv9A2xw4XfUddLpeV7zL1NahQ0BJ805sXO406A/SAgafbvdGsL7xOSibg==
X-Received: by 2002:a17:90a:6396:: with SMTP id
 f22mr11221502pjj.91.1618599626461; 
 Fri, 16 Apr 2021 12:00:26 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id d7sm1988337pfv.197.2021.04.16.12.00.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 12:00:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 26/30] target/arm: Enforce alignment for aa64
 load-acq/store-rel
Date: Fri, 16 Apr 2021 11:59:55 -0700
Message-Id: <20210416185959.1520974-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210416185959.1520974-1-richard.henderson@linaro.org>
References: <20210416185959.1520974-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index b90d6880e7..ac60dcf760 100644
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
2.25.1


