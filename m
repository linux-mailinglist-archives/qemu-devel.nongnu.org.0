Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CA7151050F
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 19:16:25 +0200 (CEST)
Received: from localhost ([::1]:32914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njOnY-0001v0-2k
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 13:16:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njO90-0002Qf-K7
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 12:34:30 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:41743)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njO8y-0004N6-Pq
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 12:34:30 -0400
Received: by mail-pl1-x631.google.com with SMTP id s14so30701144plk.8
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 09:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kPxIS+LQrrhxi7Eame1RQNPrYQBPPNss7eTNHNv+3lM=;
 b=bxoGJiRe37S552M0O4XuxvuVIrEhxICi8kCQhmTYATI4lk2FO8NxJVDHWYY2eNCbMt
 oz66wPo7eQ1xVM4CRV/puJZjy5K4g0rca/uXDKj/r1NdazXN/D2ERehtE71NULzFtF8/
 ipGTAVcML4IHW3ZY7V3PuhMoOytl3NDDvgak5+Jnvp3R5/l8rHpppoQ/M+0DBmjIfScw
 8BwrSoCRJODy5ZXTJIy5+vm2MfAl3j2+mAD9ie+HpEWDAFFgkPlOMd3i89VI02iNsmNW
 9MaGdICRBKPcs9GBDjtGM7O9zf+LnsY6egr/sDipc0O4ERJbYPlxGX6th1wpbpSRM9dW
 eraQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kPxIS+LQrrhxi7Eame1RQNPrYQBPPNss7eTNHNv+3lM=;
 b=XwlfqEXNxP4OnDObOSscaYS2hEFl6yQ0wVlCw5Ia1PjazAirsbjEbKg8c+D3DExa8E
 osivuC29EphUXU0mNcYeX0MtH2ze/9cFy4pc2eNpHCLJd+aMxqjurzB9CKMIiyW5QRzB
 WwBC0+T5D5pdiAssrZf/UmLHeSUocM/LqoPX4sahN4Tzif5ugemPTMbrjwK3iQx29Oe5
 cjnBS9TBvDBeFIDVT30eIyYfxWnnf8BnAjEGy8LAFtBi+a9IQyRR91oggFrsR1FrUSRH
 FswGxz2rtg6nFkXLK2fxtxhihguKQKKlDw8Q58NX+S5GbeCjAulIxERAkClAojPjIu/V
 2zYw==
X-Gm-Message-State: AOAM533l7CLpGnqpdJet8Yr4biWL8P3rN2xxlCI2QX3xPkJloi1A5Ryv
 HwIkDEb30PI0n3TlwjfU1wfJJvU/Vo2nLA==
X-Google-Smtp-Source: ABdhPJxf1RqgGPDVorAONcKzKcXGJQ6jLKhGlyKr+byE1ufFV+TV80MzBLtIMOASeYbQNTLFnXXAdQ==
X-Received: by 2002:a17:90a:4bc2:b0:1b8:cdd3:53e2 with SMTP id
 u2-20020a17090a4bc200b001b8cdd353e2mr37949436pjl.219.1650990867473; 
 Tue, 26 Apr 2022 09:34:27 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 a13-20020a17090acb8d00b001d953eb2412sm1132834pju.19.2022.04.26.09.34.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 09:34:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 45/47] target/arm: Use tcg_constant for predicate descriptors
Date: Tue, 26 Apr 2022 09:30:41 -0700
Message-Id: <20220426163043.100432-46-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220426163043.100432-1-richard.henderson@linaro.org>
References: <20220426163043.100432-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In these cases, 't' did double-duty as zero source and
temporary destination.  Split the two uses.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index a684d489d2..e812f910ce 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -282,13 +282,12 @@ static void do_predtest(DisasContext *s, int dofs, int gofs, int words)
 {
     TCGv_ptr dptr = tcg_temp_new_ptr();
     TCGv_ptr gptr = tcg_temp_new_ptr();
-    TCGv_i32 t;
+    TCGv_i32 t = tcg_temp_new_i32();
 
     tcg_gen_addi_ptr(dptr, cpu_env, dofs);
     tcg_gen_addi_ptr(gptr, cpu_env, gofs);
-    t = tcg_const_i32(words);
 
-    gen_helper_sve_predtest(t, dptr, gptr, t);
+    gen_helper_sve_predtest(t, dptr, gptr, tcg_constant_i32(words));
     tcg_temp_free_ptr(dptr);
     tcg_temp_free_ptr(gptr);
 
@@ -1880,9 +1879,9 @@ static bool do_pfirst_pnext(DisasContext *s, arg_rr_esz *a,
 
     tcg_gen_addi_ptr(t_pd, cpu_env, pred_full_reg_offset(s, a->rd));
     tcg_gen_addi_ptr(t_pg, cpu_env, pred_full_reg_offset(s, a->rn));
-    t = tcg_const_i32(desc);
+    t = tcg_temp_new_i32();
 
-    gen_fn(t, t_pd, t_pg, t);
+    gen_fn(t, t_pd, t_pg, tcg_constant_i32(desc));
     tcg_temp_free_ptr(t_pd);
     tcg_temp_free_ptr(t_pg);
 
@@ -3176,7 +3175,7 @@ static bool do_ppzz_flags(DisasContext *s, arg_rprr_esz *a,
     }
 
     vsz = vec_full_reg_size(s);
-    t = tcg_const_i32(simd_desc(vsz, vsz, 0));
+    t = tcg_temp_new_i32();
     pd = tcg_temp_new_ptr();
     zn = tcg_temp_new_ptr();
     zm = tcg_temp_new_ptr();
@@ -3187,7 +3186,7 @@ static bool do_ppzz_flags(DisasContext *s, arg_rprr_esz *a,
     tcg_gen_addi_ptr(zm, cpu_env, vec_full_reg_offset(s, a->rm));
     tcg_gen_addi_ptr(pg, cpu_env, pred_full_reg_offset(s, a->pg));
 
-    gen_fn(t, pd, zn, zm, pg, t);
+    gen_fn(t, pd, zn, zm, pg, tcg_constant_i32(simd_desc(vsz, vsz, 0)));
 
     tcg_temp_free_ptr(pd);
     tcg_temp_free_ptr(zn);
@@ -3261,7 +3260,7 @@ static bool do_ppzi_flags(DisasContext *s, arg_rpri_esz *a,
     }
 
     vsz = vec_full_reg_size(s);
-    t = tcg_const_i32(simd_desc(vsz, vsz, a->imm));
+    t = tcg_temp_new_i32();
     pd = tcg_temp_new_ptr();
     zn = tcg_temp_new_ptr();
     pg = tcg_temp_new_ptr();
@@ -3270,7 +3269,7 @@ static bool do_ppzi_flags(DisasContext *s, arg_rpri_esz *a,
     tcg_gen_addi_ptr(zn, cpu_env, vec_full_reg_offset(s, a->rn));
     tcg_gen_addi_ptr(pg, cpu_env, pred_full_reg_offset(s, a->pg));
 
-    gen_fn(t, pd, zn, pg, t);
+    gen_fn(t, pd, zn, pg, tcg_constant_i32(simd_desc(vsz, vsz, a->imm)));
 
     tcg_temp_free_ptr(pd);
     tcg_temp_free_ptr(zn);
-- 
2.34.1


