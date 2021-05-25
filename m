Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 228543906DD
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 18:46:53 +0200 (CEST)
Received: from localhost ([::1]:51412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llaCi-0006lg-79
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 12:46:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llYeq-0002Sr-KX
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:07:48 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:34726)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llYel-0006rQ-9c
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:07:48 -0400
Received: by mail-wr1-x431.google.com with SMTP id r12so32628993wrp.1
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 08:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=3onK/GN8iQ6Ju6s9Y0+MxHW9EqnWrachOzY5XlNzcVQ=;
 b=gOmHZcHtxjZGlVBv25e86JaOn5KBaH6Ym2Hn8i7NUmu2zGoiY6Mbzz+tteyeNhZwMS
 TLp/k/DDoesrCJV4KYwN6DdLAo3KHIxq03YaAaayEybI3R8MqsvUFTkOeRxXWQQ7zIKR
 nKsnwwNz7otHTnMem69jqN91hJXhnT4nJcUBPIz/ctZjs89l8Tda/62Rv/1AdPvGiwa4
 wr+60fKl0DSXzQ55gHCFhSyBoQNMtNZ3i6MFD55zQAXY5x2nEXYVTfryP+Svgozz8zVi
 BLmg7FXSffdMQYqHNOjfyVYXqEGzRM/Rk+rBOL5qFVvY9k8yDrkVZg7BEGZWLtYVguN9
 Fzvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3onK/GN8iQ6Ju6s9Y0+MxHW9EqnWrachOzY5XlNzcVQ=;
 b=YBqU/sz/h1vh8Z2avVJ78e7HPIeiYAYg+GEe/JQ8e98BcJXx8XkJPnpLfFqLNGy3Af
 fFbAPf07q4i/4gxW9SnMAa/EWvYRLDrBuPVfsmrDSuoVS001e3UNkyClVkeiW0ERpauS
 9nh71Y1HLfevY8eNl21tLRL7aCx4Y7Uxt2zKeSyDzNjRNcan09PcgKdEr3CpHxyo0kGX
 NcNyet12qzCD+kNDmVJC9lA3i4jNIRWEjJjwXwGePT0tbS6zGF2fKbEKcjkWEswmipYY
 /cD25DN9UbsERLQ/JPYqOZXZnDSfagdS2vZIfaTPjgASfoSzxSJmGxRJ6mSE2O2eHmaU
 VP8Q==
X-Gm-Message-State: AOAM530UHoDOKk0iHi1im3GQumPMHGF57n0DPBOONw3zMZZt4+wiK1Gj
 uPbBAb+xyVzBBguOjpqsMSNPJznUxSKYv9U7
X-Google-Smtp-Source: ABdhPJzBa9MfNLPnhB193V8uRTEJt8GanST99ZskPyEHqRBY4pfSh6YJ/hk0PY3VQvLtdMpWoctPUA==
X-Received: by 2002:a5d:638b:: with SMTP id p11mr27904670wru.90.1621955259092; 
 Tue, 25 May 2021 08:07:39 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id a11sm16643357wrr.48.2021.05.25.08.07.38
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 08:07:38 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 096/114] target/arm: Implement SVE2 FCVTXNT, FCVTX
Date: Tue, 25 May 2021 16:07:18 +0100
Message-Id: <20210525150736.32695-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210525150736.32695-1-peter.maydell@linaro.org>
References: <20210525150736.32695-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
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

From: Stephen Long <steplong@quicinc.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Stephen Long <steplong@quicinc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210525010358.152808-75-richard.henderson@linaro.org
Message-Id: <20200428174332.17162-4-steplong@quicinc.com>
[rth: Use do_frint_mode, which avoids a specific runtime helper.]
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/sve.decode      |  2 ++
 target/arm/translate-sve.c | 49 ++++++++++++++++++++++++++++++--------
 2 files changed, 41 insertions(+), 10 deletions(-)

diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 1be35154708..5dcc79759e0 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1582,6 +1582,8 @@ SM4EKEY         01000101 00 1 ..... 11110 0 ..... .....  @rd_rn_rm_e0
 RAX1            01000101 00 1 ..... 11110 1 ..... .....  @rd_rn_rm_e0
 
 ### SVE2 floating-point convert precision odd elements
+FCVTXNT_ds      01100100 00 0010 10 101 ... ..... .....  @rd_pg_rn_e0
+FCVTX_ds        01100101 00 0010 10 101 ... ..... .....  @rd_pg_rn_e0
 FCVTNT_sh       01100100 10 0010 00 101 ... ..... .....  @rd_pg_rn_e0
 FCVTLT_hs       01100100 10 0010 01 101 ... ..... .....  @rd_pg_rn_e0
 FCVTNT_ds       01100100 11 0010 10 101 ... ..... .....  @rd_pg_rn_e0
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 7490094d172..0a2718c4810 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -4777,11 +4777,9 @@ static bool trans_FRINTX(DisasContext *s, arg_rpr_esz *a)
     return do_zpz_ptr(s, a->rd, a->rn, a->pg, a->esz == MO_16, fns[a->esz - 1]);
 }
 
-static bool do_frint_mode(DisasContext *s, arg_rpr_esz *a, int mode)
+static bool do_frint_mode(DisasContext *s, arg_rpr_esz *a,
+                          int mode, gen_helper_gvec_3_ptr *fn)
 {
-    if (a->esz == 0) {
-        return false;
-    }
     if (sve_access_check(s)) {
         unsigned vsz = vec_full_reg_size(s);
         TCGv_i32 tmode = tcg_const_i32(mode);
@@ -4792,7 +4790,7 @@ static bool do_frint_mode(DisasContext *s, arg_rpr_esz *a, int mode)
         tcg_gen_gvec_3_ptr(vec_full_reg_offset(s, a->rd),
                            vec_full_reg_offset(s, a->rn),
                            pred_full_reg_offset(s, a->pg),
-                           status, vsz, vsz, 0, frint_fns[a->esz - 1]);
+                           status, vsz, vsz, 0, fn);
 
         gen_helper_set_rmode(tmode, tmode, status);
         tcg_temp_free_i32(tmode);
@@ -4803,27 +4801,42 @@ static bool do_frint_mode(DisasContext *s, arg_rpr_esz *a, int mode)
 
 static bool trans_FRINTN(DisasContext *s, arg_rpr_esz *a)
 {
-    return do_frint_mode(s, a, float_round_nearest_even);
+    if (a->esz == 0) {
+        return false;
+    }
+    return do_frint_mode(s, a, float_round_nearest_even, frint_fns[a->esz - 1]);
 }
 
 static bool trans_FRINTP(DisasContext *s, arg_rpr_esz *a)
 {
-    return do_frint_mode(s, a, float_round_up);
+    if (a->esz == 0) {
+        return false;
+    }
+    return do_frint_mode(s, a, float_round_up, frint_fns[a->esz - 1]);
 }
 
 static bool trans_FRINTM(DisasContext *s, arg_rpr_esz *a)
 {
-    return do_frint_mode(s, a, float_round_down);
+    if (a->esz == 0) {
+        return false;
+    }
+    return do_frint_mode(s, a, float_round_down, frint_fns[a->esz - 1]);
 }
 
 static bool trans_FRINTZ(DisasContext *s, arg_rpr_esz *a)
 {
-    return do_frint_mode(s, a, float_round_to_zero);
+    if (a->esz == 0) {
+        return false;
+    }
+    return do_frint_mode(s, a, float_round_to_zero, frint_fns[a->esz - 1]);
 }
 
 static bool trans_FRINTA(DisasContext *s, arg_rpr_esz *a)
 {
-    return do_frint_mode(s, a, float_round_ties_away);
+    if (a->esz == 0) {
+        return false;
+    }
+    return do_frint_mode(s, a, float_round_ties_away, frint_fns[a->esz - 1]);
 }
 
 static bool trans_FRECPX(DisasContext *s, arg_rpr_esz *a)
@@ -8278,3 +8291,19 @@ static bool trans_FCVTLT_sd(DisasContext *s, arg_rpr_esz *a)
     }
     return do_zpz_ptr(s, a->rd, a->rn, a->pg, false, gen_helper_sve2_fcvtlt_sd);
 }
+
+static bool trans_FCVTX_ds(DisasContext *s, arg_rpr_esz *a)
+{
+    if (!dc_isar_feature(aa64_sve2, s)) {
+        return false;
+    }
+    return do_frint_mode(s, a, float_round_to_odd, gen_helper_sve_fcvt_ds);
+}
+
+static bool trans_FCVTXNT_ds(DisasContext *s, arg_rpr_esz *a)
+{
+    if (!dc_isar_feature(aa64_sve2, s)) {
+        return false;
+    }
+    return do_frint_mode(s, a, float_round_to_odd, gen_helper_sve2_fcvtnt_ds);
+}
-- 
2.20.1


