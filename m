Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 767412560B7
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Aug 2020 20:43:33 +0200 (CEST)
Received: from localhost ([::1]:35770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kBjLY-00079n-AN
	for lists+qemu-devel@lfdr.de; Fri, 28 Aug 2020 14:43:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kBjCa-0002Ak-9n
 for qemu-devel@nongnu.org; Fri, 28 Aug 2020 14:34:16 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:46379)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kBjCQ-0005vv-AB
 for qemu-devel@nongnu.org; Fri, 28 Aug 2020 14:34:15 -0400
Received: by mail-wr1-x442.google.com with SMTP id i7so23327wre.13
 for <qemu-devel@nongnu.org>; Fri, 28 Aug 2020 11:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=6nNyus9jKbQ4YkB+NOZJt4muEZyHicfYGFub6gPtb28=;
 b=WrI4oCcxKsGUvQrDp+ny/1jodmCrCcLr8vbHO0UxtryeB+W4jk8m3aXYNzSEnSyiCJ
 gXmtYmOfJWgQLNxLUS5Fz3113W+pwd7s9kNcxqER87nkebEpoSf5mfKBv3CiOckHAi/q
 UzchvqIXOmiJE785+cwE5Bo2i02KB1chCV/9ivuEbnR0AkZzdeoJF4l+Ld1vw9gs1Wvf
 QymAbD6yRzvvspObq+Obfv/4RH7bOiq85QAv8wJxI/Vd+EHQyar3eothRSC5v1p/1sNr
 STH32Mymjilf7ilUmRNBZ3e+hWTa97WpS4wCQOPitmFUgrtLdgYXKcYl7gj7iJGKf37w
 dRyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6nNyus9jKbQ4YkB+NOZJt4muEZyHicfYGFub6gPtb28=;
 b=nbpRUEs7gafeL9iiW6zoCHmVQeS6mnsyEFsqhcn40C5tvoXP8XZ5PwZpHhtdslr0KK
 DPl5MKTTnTNJ3gtn9qy8yABnOdUAAkCXPtul2uWkBxp6cKsdCn1a/SXekmh4dxj0rslT
 A3erLJP0OoN14/VWrxis45PxUe9aogbaYGlGKa1nFEFNttR15GiF177HwzAq0WzX4tqX
 KE2vFV0jRk1nn5cZQEmI7Id7mTqfgi9wkve4ZFzf6oV44XD9Ru0vXfvz6xZWGjuepJ69
 XPCI4vjoxYyCTrOvV6U33sWv+UQ3JRbhbwFzVxTPINEdDmQsbWjngmpLjuB2X7IGF67z
 OMYw==
X-Gm-Message-State: AOAM532/ohAvssaUQt/N9fqHHT1G/fGUpW633jnHmlWDiXoJDF5WWoJ0
 VsLuzJZbxBpyVnvi3H02AMS3ZA==
X-Google-Smtp-Source: ABdhPJwJcPI0crOf6LvHu/zpdmSBWRNi7hd+mmNAiQOYDg9kWICH1MmBpADQYQTUo15X5WOEzcG9EQ==
X-Received: by 2002:a5d:6946:: with SMTP id r6mr280159wrw.308.1598639641772;
 Fri, 28 Aug 2020 11:34:01 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id s20sm356251wmh.21.2020.08.28.11.34.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Aug 2020 11:34:00 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 04/45] target/arm: Implement VFP fp16 VMLA, VMLS, VNMLS,
 VNMLA, VNMUL
Date: Fri, 28 Aug 2020 19:33:13 +0100
Message-Id: <20200828183354.27913-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200828183354.27913-1-peter.maydell@linaro.org>
References: <20200828183354.27913-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::442;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x442.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Implement fp16 versions of the VFP VMLA, VMLS, VNMLS, VNMLA, VNMUL
instructions. (These are all the remaining ones which we implement
via do_vfp_3op_[hsd]p().)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.h            |  1 +
 target/arm/vfp.decode          |  5 ++
 target/arm/vfp_helper.c        |  5 ++
 target/arm/translate-vfp.c.inc | 84 ++++++++++++++++++++++++++++++++++
 4 files changed, 95 insertions(+)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index 61e4e938861..58f9c4e933e 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -125,6 +125,7 @@ DEF_HELPER_3(vfp_maxnumd, f64, f64, f64, ptr)
 DEF_HELPER_3(vfp_minnumh, f16, f16, f16, ptr)
 DEF_HELPER_3(vfp_minnums, f32, f32, f32, ptr)
 DEF_HELPER_3(vfp_minnumd, f64, f64, f64, ptr)
+DEF_HELPER_1(vfp_negh, f16, f16)
 DEF_HELPER_1(vfp_negs, f32, f32)
 DEF_HELPER_1(vfp_negd, f64, f64)
 DEF_HELPER_1(vfp_abss, f32, f32)
diff --git a/target/arm/vfp.decode b/target/arm/vfp.decode
index 1ecd5e28ca0..e5545076a51 100644
--- a/target/arm/vfp.decode
+++ b/target/arm/vfp.decode
@@ -103,15 +103,19 @@ VLDM_VSTM_dp ---- 1101 0.1 l:1 rn:4 .... 1011 imm:8 \
              vd=%vd_dp p=1 u=0 w=1
 
 # 3-register VFP data-processing; bits [23,21:20,6] identify the operation.
+VMLA_hp      ---- 1110 0.00 .... .... 1001 .0.0 ....        @vfp_dnm_s
 VMLA_sp      ---- 1110 0.00 .... .... 1010 .0.0 ....        @vfp_dnm_s
 VMLA_dp      ---- 1110 0.00 .... .... 1011 .0.0 ....        @vfp_dnm_d
 
+VMLS_hp      ---- 1110 0.00 .... .... 1001 .1.0 ....        @vfp_dnm_s
 VMLS_sp      ---- 1110 0.00 .... .... 1010 .1.0 ....        @vfp_dnm_s
 VMLS_dp      ---- 1110 0.00 .... .... 1011 .1.0 ....        @vfp_dnm_d
 
+VNMLS_hp     ---- 1110 0.01 .... .... 1001 .0.0 ....        @vfp_dnm_s
 VNMLS_sp     ---- 1110 0.01 .... .... 1010 .0.0 ....        @vfp_dnm_s
 VNMLS_dp     ---- 1110 0.01 .... .... 1011 .0.0 ....        @vfp_dnm_d
 
+VNMLA_hp     ---- 1110 0.01 .... .... 1001 .1.0 ....        @vfp_dnm_s
 VNMLA_sp     ---- 1110 0.01 .... .... 1010 .1.0 ....        @vfp_dnm_s
 VNMLA_dp     ---- 1110 0.01 .... .... 1011 .1.0 ....        @vfp_dnm_d
 
@@ -119,6 +123,7 @@ VMUL_hp      ---- 1110 0.10 .... .... 1001 .0.0 ....        @vfp_dnm_s
 VMUL_sp      ---- 1110 0.10 .... .... 1010 .0.0 ....        @vfp_dnm_s
 VMUL_dp      ---- 1110 0.10 .... .... 1011 .0.0 ....        @vfp_dnm_d
 
+VNMUL_hp     ---- 1110 0.10 .... .... 1001 .1.0 ....        @vfp_dnm_s
 VNMUL_sp     ---- 1110 0.10 .... .... 1010 .1.0 ....        @vfp_dnm_s
 VNMUL_dp     ---- 1110 0.10 .... .... 1011 .1.0 ....        @vfp_dnm_d
 
diff --git a/target/arm/vfp_helper.c b/target/arm/vfp_helper.c
index b8ca744bccc..f93ddf0b208 100644
--- a/target/arm/vfp_helper.c
+++ b/target/arm/vfp_helper.c
@@ -261,6 +261,11 @@ VFP_BINOP(minnum)
 VFP_BINOP(maxnum)
 #undef VFP_BINOP
 
+dh_ctype_f16 VFP_HELPER(neg, h)(dh_ctype_f16 a)
+{
+    return float16_chs(a);
+}
+
 float32 VFP_HELPER(neg, s)(float32 a)
 {
     return float32_chs(a);
diff --git a/target/arm/translate-vfp.c.inc b/target/arm/translate-vfp.c.inc
index 01a5fd65115..15bb23688bd 100644
--- a/target/arm/translate-vfp.c.inc
+++ b/target/arm/translate-vfp.c.inc
@@ -1547,6 +1547,21 @@ static bool do_vfp_2op_dp(DisasContext *s, VFPGen2OpDPFn *fn, int vd, int vm)
     return true;
 }
 
+static void gen_VMLA_hp(TCGv_i32 vd, TCGv_i32 vn, TCGv_i32 vm, TCGv_ptr fpst)
+{
+    /* Note that order of inputs to the add matters for NaNs */
+    TCGv_i32 tmp = tcg_temp_new_i32();
+
+    gen_helper_vfp_mulh(tmp, vn, vm, fpst);
+    gen_helper_vfp_addh(vd, vd, tmp, fpst);
+    tcg_temp_free_i32(tmp);
+}
+
+static bool trans_VMLA_hp(DisasContext *s, arg_VMLA_sp *a)
+{
+    return do_vfp_3op_hp(s, gen_VMLA_hp, a->vd, a->vn, a->vm, true);
+}
+
 static void gen_VMLA_sp(TCGv_i32 vd, TCGv_i32 vn, TCGv_i32 vm, TCGv_ptr fpst)
 {
     /* Note that order of inputs to the add matters for NaNs */
@@ -1577,6 +1592,25 @@ static bool trans_VMLA_dp(DisasContext *s, arg_VMLA_dp *a)
     return do_vfp_3op_dp(s, gen_VMLA_dp, a->vd, a->vn, a->vm, true);
 }
 
+static void gen_VMLS_hp(TCGv_i32 vd, TCGv_i32 vn, TCGv_i32 vm, TCGv_ptr fpst)
+{
+    /*
+     * VMLS: vd = vd + -(vn * vm)
+     * Note that order of inputs to the add matters for NaNs.
+     */
+    TCGv_i32 tmp = tcg_temp_new_i32();
+
+    gen_helper_vfp_mulh(tmp, vn, vm, fpst);
+    gen_helper_vfp_negh(tmp, tmp);
+    gen_helper_vfp_addh(vd, vd, tmp, fpst);
+    tcg_temp_free_i32(tmp);
+}
+
+static bool trans_VMLS_hp(DisasContext *s, arg_VMLS_sp *a)
+{
+    return do_vfp_3op_hp(s, gen_VMLS_hp, a->vd, a->vn, a->vm, true);
+}
+
 static void gen_VMLS_sp(TCGv_i32 vd, TCGv_i32 vn, TCGv_i32 vm, TCGv_ptr fpst)
 {
     /*
@@ -1615,6 +1649,27 @@ static bool trans_VMLS_dp(DisasContext *s, arg_VMLS_dp *a)
     return do_vfp_3op_dp(s, gen_VMLS_dp, a->vd, a->vn, a->vm, true);
 }
 
+static void gen_VNMLS_hp(TCGv_i32 vd, TCGv_i32 vn, TCGv_i32 vm, TCGv_ptr fpst)
+{
+    /*
+     * VNMLS: -fd + (fn * fm)
+     * Note that it isn't valid to replace (-A + B) with (B - A) or similar
+     * plausible looking simplifications because this will give wrong results
+     * for NaNs.
+     */
+    TCGv_i32 tmp = tcg_temp_new_i32();
+
+    gen_helper_vfp_mulh(tmp, vn, vm, fpst);
+    gen_helper_vfp_negh(vd, vd);
+    gen_helper_vfp_addh(vd, vd, tmp, fpst);
+    tcg_temp_free_i32(tmp);
+}
+
+static bool trans_VNMLS_hp(DisasContext *s, arg_VNMLS_sp *a)
+{
+    return do_vfp_3op_hp(s, gen_VNMLS_hp, a->vd, a->vn, a->vm, true);
+}
+
 static void gen_VNMLS_sp(TCGv_i32 vd, TCGv_i32 vn, TCGv_i32 vm, TCGv_ptr fpst)
 {
     /*
@@ -1657,6 +1712,23 @@ static bool trans_VNMLS_dp(DisasContext *s, arg_VNMLS_dp *a)
     return do_vfp_3op_dp(s, gen_VNMLS_dp, a->vd, a->vn, a->vm, true);
 }
 
+static void gen_VNMLA_hp(TCGv_i32 vd, TCGv_i32 vn, TCGv_i32 vm, TCGv_ptr fpst)
+{
+    /* VNMLA: -fd + -(fn * fm) */
+    TCGv_i32 tmp = tcg_temp_new_i32();
+
+    gen_helper_vfp_mulh(tmp, vn, vm, fpst);
+    gen_helper_vfp_negh(tmp, tmp);
+    gen_helper_vfp_negh(vd, vd);
+    gen_helper_vfp_addh(vd, vd, tmp, fpst);
+    tcg_temp_free_i32(tmp);
+}
+
+static bool trans_VNMLA_hp(DisasContext *s, arg_VNMLA_sp *a)
+{
+    return do_vfp_3op_hp(s, gen_VNMLA_hp, a->vd, a->vn, a->vm, true);
+}
+
 static void gen_VNMLA_sp(TCGv_i32 vd, TCGv_i32 vn, TCGv_i32 vm, TCGv_ptr fpst)
 {
     /* VNMLA: -fd + -(fn * fm) */
@@ -1706,6 +1778,18 @@ static bool trans_VMUL_dp(DisasContext *s, arg_VMUL_dp *a)
     return do_vfp_3op_dp(s, gen_helper_vfp_muld, a->vd, a->vn, a->vm, false);
 }
 
+static void gen_VNMUL_hp(TCGv_i32 vd, TCGv_i32 vn, TCGv_i32 vm, TCGv_ptr fpst)
+{
+    /* VNMUL: -(fn * fm) */
+    gen_helper_vfp_mulh(vd, vn, vm, fpst);
+    gen_helper_vfp_negh(vd, vd);
+}
+
+static bool trans_VNMUL_hp(DisasContext *s, arg_VNMUL_sp *a)
+{
+    return do_vfp_3op_hp(s, gen_VNMUL_hp, a->vd, a->vn, a->vm, false);
+}
+
 static void gen_VNMUL_sp(TCGv_i32 vd, TCGv_i32 vn, TCGv_i32 vm, TCGv_ptr fpst)
 {
     /* VNMUL: -(fn * fm) */
-- 
2.20.1


