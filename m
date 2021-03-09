Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09FE0332C8B
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 17:49:24 +0100 (CET)
Received: from localhost ([::1]:52832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJfXv-0005U8-11
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 11:49:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lJefk-0004z9-Qz
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 10:53:24 -0500
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c]:36609)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lJefd-0001Ge-Bj
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 10:53:24 -0500
Received: by mail-oi1-x22c.google.com with SMTP id o22so5674990oic.3
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 07:53:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uJkC/FaooZirGuu0VHFDubkoDlztZCrLbkateUX9i2Q=;
 b=QoHwiL9y4fzf+dOnsRyy5W6s+l4wLngmQ+/gNxTJhChHcL3uz9vhjUZmanKsPU9DYs
 C0KGGUwt1vM9YSObJbOgRtrvQFg4yOVMuypeazoXsk9f8chybDaBltywLFfwigGex/Yr
 /UsjzLRQZFZrDg9MPvgiWyl5S/UbCe5Jrx/dEkDikxZPrsJ24stN7f+/CQnPuANJj78C
 YOXp6pEM6o34Sxj75oOpb5YUimMvNC1YZmb2JFvymZ6XIoJDh7kJyVI+unFEdFUZWNIW
 hAHB3CbVcJ+EaUG+kf3n5ivgPCi9vwJm142lFohBTMhrqs5efPGRq93bm1hI56fWA53R
 dEMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uJkC/FaooZirGuu0VHFDubkoDlztZCrLbkateUX9i2Q=;
 b=BffgTK7WtnCxbcYUGlD/zuc7o2z4iXQPxYj/VRWUskgzvDAoe4I9yowXMB9IRmTPXA
 18bSxF2OIHOaQ0og/zaNpcc1t9meNWymwjKiPzg9oNM817I38Z6mzxpqVLuiy2Hd2Ktu
 NAvafGdpIW1YPyTtv5N22zkO4a1dC27cJbeif6NeW8Y0s1OuOZuNQOhm4oOJWkn4WiEr
 F15aedWYIxWpa9dAlVEJNkzgRGFQ6cDccUkFZWCos6VGYOyciOeN4iYTyyuUSk7IM1/J
 hm/VO/BRgjK25XsieD2pQDbagWKtBrjZGEsSNnFUEqB+QyJG0NbZPn/OYzwYSzQP4EIq
 YKxQ==
X-Gm-Message-State: AOAM531/KZM0fA/tycJfmuWgDXv1qQ9sYEVlMoMEzpA73NGxURxlV7nU
 SpXKBORTGipxpPEdM+jRdsiJ/f/3RHKWxnGy
X-Google-Smtp-Source: ABdhPJxdN7kGSh3ihQoOYEwEX+tgxqXj9jj9ZX8SLTEZr+1hcQ6nXeUpGr1LaV/a5MwWSfNZIHe4Pg==
X-Received: by 2002:aca:dad4:: with SMTP id r203mr3330198oig.14.1615305196310; 
 Tue, 09 Mar 2021 07:53:16 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id b14sm2952539ooj.26.2021.03.09.07.53.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 07:53:16 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 7/8] target/arm: Update WHILE for PREDDESC
Date: Tue,  9 Mar 2021 07:53:04 -0800
Message-Id: <20210309155305.11301-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210309155305.11301-1-richard.henderson@linaro.org>
References: <20210309155305.11301-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22c;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22c.google.com
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since b64ee454a4a0, all predicate operations should be
using these field macros for predicates.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sve_helper.c    | 4 ++--
 target/arm/translate-sve.c | 7 ++++---
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index a95bbece4f..6f4bc3a3cc 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -2850,8 +2850,8 @@ uint64_t HELPER(sve_cntp)(void *vn, void *vg, uint32_t pred_desc)
 
 uint32_t HELPER(sve_while)(void *vd, uint32_t count, uint32_t pred_desc)
 {
-    uintptr_t oprsz = extract32(pred_desc, 0, SIMD_OPRSZ_BITS) + 2;
-    intptr_t esz = extract32(pred_desc, SIMD_DATA_SHIFT, 2);
+    intptr_t oprsz = FIELD_EX32(pred_desc, PREDDESC, OPRSZ);
+    intptr_t esz = FIELD_EX32(pred_desc, PREDDESC, ESZ);
     uint64_t esz_mask = pred_esz_masks[esz];
     ARMPredicateReg *d = vd;
     uint32_t flags;
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 722805cf99..2420cd741b 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -3097,7 +3097,8 @@ static bool trans_WHILE(DisasContext *s, arg_WHILE *a)
     TCGv_i64 op0, op1, t0, t1, tmax;
     TCGv_i32 t2, t3;
     TCGv_ptr ptr;
-    unsigned desc, vsz = vec_full_reg_size(s);
+    unsigned vsz = vec_full_reg_size(s);
+    unsigned desc = 0;
     TCGCond cond;
 
     if (!sve_access_check(s)) {
@@ -3161,8 +3162,8 @@ static bool trans_WHILE(DisasContext *s, arg_WHILE *a)
     /* Scale elements to bits.  */
     tcg_gen_shli_i32(t2, t2, a->esz);
 
-    desc = (vsz / 8) - 2;
-    desc = deposit32(desc, SIMD_DATA_SHIFT, 2, a->esz);
+    desc = FIELD_DP32(desc, PREDDESC, OPRSZ, vsz / 8);
+    desc = FIELD_DP32(desc, PREDDESC, ESZ, a->esz);
     t3 = tcg_const_i32(desc);
 
     ptr = tcg_temp_new_ptr();
-- 
2.25.1


