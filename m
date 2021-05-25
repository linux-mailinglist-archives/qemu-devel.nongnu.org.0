Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC65238F7CD
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 04:01:10 +0200 (CEST)
Received: from localhost ([::1]:60814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llMNZ-0003te-TY
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 22:01:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLYh-0001JM-8Y
 for qemu-devel@nongnu.org; Mon, 24 May 2021 21:08:35 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:51800)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLXw-0004AY-25
 for qemu-devel@nongnu.org; Mon, 24 May 2021 21:08:34 -0400
Received: by mail-pj1-x102c.google.com with SMTP id k5so15869469pjj.1
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 18:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Z9DRAdUOD4ldpl5ZERKtO3bYlQxPDPcXj1lLMIABjys=;
 b=iL79QFz2aZPbiiuLRXrYcr0su/MhbNuUx0gGpQsOfSUdTqpk6DiaEUniSgwDjKFK37
 JHsMYrROAGjJW12c+HTIkbuECOICID5UL1ljvQCpcEhHYzWDvutkmwbOKt7Yk6Eel0ei
 nIqgCKi9VlEgYriRFeuVWkYEVRog6VWaEU+1s5ePUAMsxxGtlGPx8wIqBO8E7flAGAOo
 DObi5mpCMiA6P5uKWMys+RkRm5NAqZsZ4Q22zRmrqsZNsPG6mzpEtCcMZzKdNkTS7Aab
 4JOv0hzjM8dp6r1TUwDlkfPZJ3X0CjdGfC8uEcxrKdgLe13Sa7Pu0Sl4zeYn48HnBJJY
 9UhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Z9DRAdUOD4ldpl5ZERKtO3bYlQxPDPcXj1lLMIABjys=;
 b=dZQvsLoWtrsVLDYPdM/KwTEI2gnWmKv7ygbFxalFFjYNiE4JaO+o5BrxTfYVuuLQxK
 HB+TulrICc/S6QsoAKrywBelsfou3WaJ7o9bc0nB3fw71y1dS+782LrV2gRf2mEPMobz
 xrabd2bhJcrig8TRYOHvxXo4gE1qWZ2IAaleIjSBBOkVYXf/46anSwsDk4F4RDUYupl5
 TXLgE5O51HdEbKNroLTDd+OVac2lWvnb2yIZ40viR1wCuCJq2/LydKkx3LYJbfzpUSRT
 UfvFdnw0Zq0BFyPOn2n987G+Nti2KGox9IK7GHKLW12obkdZg7RhadKa4uYzEeT8x0Ct
 /DIA==
X-Gm-Message-State: AOAM5327LYQJ8FstW7nvmPQIlSEpu2seiCBswNYZJ5bCVHhI+dIg8VIF
 3df/hMYINcz5v/l8dbITpDnoHj22Kt8JPA==
X-Google-Smtp-Source: ABdhPJwl1IJDqUfI5tJoBuJSOAIJv8olH6K43bH1otok226K9rqIeAT3jRM0B2qp1HQ1RM5Gn2tWRg==
X-Received: by 2002:a17:90a:e7c6:: with SMTP id
 kb6mr27407785pjb.81.1621904866788; 
 Mon, 24 May 2021 18:07:46 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id b16sm11748176pju.35.2021.05.24.18.07.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 18:07:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 77/92] target/arm: Tidy do_ldrq
Date: Mon, 24 May 2021 18:03:43 -0700
Message-Id: <20210525010358.152808-78-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210525010358.152808-1-richard.henderson@linaro.org>
References: <20210525010358.152808-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use tcg_constant_i32 for passing the simd descriptor,
as this hashed value does not need to be freed.
Rename dofs to doff to match poff.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 54c50349ab..a213450583 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -5580,13 +5580,9 @@ static void do_ldrq(DisasContext *s, int zt, int pg, TCGv_i64 addr, int dtype)
 {
     unsigned vsz = vec_full_reg_size(s);
     TCGv_ptr t_pg;
-    TCGv_i32 t_desc;
-    int desc, poff;
+    int poff;
 
     /* Load the first quadword using the normal predicated load helpers.  */
-    desc = simd_desc(16, 16, zt);
-    t_desc = tcg_const_i32(desc);
-
     poff = pred_full_reg_offset(s, pg);
     if (vsz > 16) {
         /*
@@ -5611,15 +5607,14 @@ static void do_ldrq(DisasContext *s, int zt, int pg, TCGv_i64 addr, int dtype)
 
     gen_helper_gvec_mem *fn
         = ldr_fns[s->mte_active[0]][s->be_data == MO_BE][dtype][0];
-    fn(cpu_env, t_pg, addr, t_desc);
+    fn(cpu_env, t_pg, addr, tcg_constant_i32(simd_desc(16, 16, zt)));
 
     tcg_temp_free_ptr(t_pg);
-    tcg_temp_free_i32(t_desc);
 
     /* Replicate that first quadword.  */
     if (vsz > 16) {
-        unsigned dofs = vec_full_reg_offset(s, zt);
-        tcg_gen_gvec_dup_mem(4, dofs + 16, dofs, vsz - 16, vsz - 16);
+        int doff = vec_full_reg_offset(s, zt);
+        tcg_gen_gvec_dup_mem(4, doff + 16, doff, vsz - 16, vsz - 16);
     }
 }
 
-- 
2.25.1


