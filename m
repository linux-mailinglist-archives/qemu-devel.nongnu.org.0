Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE88F38F77B
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 03:22:51 +0200 (CEST)
Received: from localhost ([::1]:53578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llLmU-00087U-Rm
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 21:22:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLUh-0001m7-Np
 for qemu-devel@nongnu.org; Mon, 24 May 2021 21:04:29 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:39733)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLUQ-0001k0-Vi
 for qemu-devel@nongnu.org; Mon, 24 May 2021 21:04:27 -0400
Received: by mail-pg1-x52d.google.com with SMTP id v14so18677719pgi.6
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 18:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YmkDxU3EI1YasUomfQhOObIJxE4RDefqjrp+VfccipQ=;
 b=cwu4i28GagnlRArerYF4uTyMSYH2rikYBgYT4tdVIUFvsUCAQDcjNYPZEKyN3Z7tn6
 TenkMLdEEbp+6V+qOth24KW5r35hiqChezxaSvZ7qboXoP6lYjWj52WQziokzvTT162+
 JCACWa7PRQWB+sGrojG01iyv4U52+Q4Xsmm1r+HGeXoMffdf2gVT/rW51e5YKjOUGQLm
 YlH3zsh/oY0rtU1wydVjXEaVYUCWig27TKRot4azJMRyrEMPIqEpVdHVOuTQwye5rJIx
 r5H8bitHpaWM2CbLbFYkBUv90OaFYCzD3jWanyrEAHtM8vEeuzmpmCTMy/QixTDzxGxe
 QTGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YmkDxU3EI1YasUomfQhOObIJxE4RDefqjrp+VfccipQ=;
 b=F3iaVtrvr6+rSZQclLp7N/KqXEwPjp+qUDJmQxYN5tjVdY8O8ZCcQASEcIFa5rJUMx
 Hz6OAh/okNfHJkt1zLqvoeB48mX6p272267yEKVI5k/UnXd01af96JtYtfahMI+OAou7
 QwDu306Lpm5whtvHSTY2LmopekF1jp1P5Xiw7Mhld5wLhsfEt86nGV7RnD+Z64LMmqAs
 z9MgpOTd4+RxRollwXM+QWx135DDPh8sV9C0PxmPAfzByLY8IYfzNPlgvXN4t58cIoy8
 96Du8ot5y0+9m85hgMnhuCnuCcXdq7uUn3KbPNLdM7YxoH1dF1W9vehBSRbUxRU9jevT
 Zsog==
X-Gm-Message-State: AOAM530AxSzSo/ZqRivfzEnELq6Ec4c+lJzEuQKt8BbXPwll4pV72D+l
 taHJorNUvGZi3y53j6nu4ruEh3QNP3sG6w==
X-Google-Smtp-Source: ABdhPJxjVXkNvUsFKf0hivBq47hWbxtELHXEbBht0uaf08K+Lbo4olFTXk18UHS9ZW/2ebtcahGebA==
X-Received: by 2002:a62:1cd4:0:b029:2d9:f0ef:2b42 with SMTP id
 c203-20020a621cd40000b02902d9f0ef2b42mr27038164pfc.36.1621904649530; 
 Mon, 24 May 2021 18:04:09 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id b1sm13742645pgf.84.2021.05.24.18.04.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 18:04:09 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 16/92] target/arm: Implement SVE2 bitwise exclusive-or
 interleaved
Date: Mon, 24 May 2021 18:02:42 -0700
Message-Id: <20210525010358.152808-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210525010358.152808-1-richard.henderson@linaro.org>
References: <20210525010358.152808-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
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
 target/arm/helper-sve.h    |  5 +++++
 target/arm/sve.decode      |  5 +++++
 target/arm/sve_helper.c    | 20 ++++++++++++++++++++
 target/arm/translate-sve.c | 19 +++++++++++++++++++
 4 files changed, 49 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index 740939e7a8..f65818da05 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -2372,3 +2372,8 @@ DEF_HELPER_FLAGS_3(sve2_sshll_d, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
 DEF_HELPER_FLAGS_3(sve2_ushll_h, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
 DEF_HELPER_FLAGS_3(sve2_ushll_s, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
 DEF_HELPER_FLAGS_3(sve2_ushll_d, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(sve2_eoril_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_eoril_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_eoril_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_eoril_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index a3191eba7b..0922a44829 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1215,3 +1215,8 @@ SSHLLB          01000101 .. 0 ..... 1010 00 ..... .....  @rd_rn_tszimm_shl
 SSHLLT          01000101 .. 0 ..... 1010 01 ..... .....  @rd_rn_tszimm_shl
 USHLLB          01000101 .. 0 ..... 1010 10 ..... .....  @rd_rn_tszimm_shl
 USHLLT          01000101 .. 0 ..... 1010 11 ..... .....  @rd_rn_tszimm_shl
+
+## SVE2 bitwise exclusive-or interleaved
+
+EORBT           01000101 .. 0 ..... 10010 0 ..... .....  @rd_rn_rm
+EORTB           01000101 .. 0 ..... 10010 1 ..... .....  @rd_rn_rm
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 79b268cbba..1af6dfde8e 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -1226,6 +1226,26 @@ DO_ZZZ_WTB(sve2_usubw_d, uint64_t, uint32_t,     , H1_4, DO_SUB)
 
 #undef DO_ZZZ_WTB
 
+#define DO_ZZZ_NTB(NAME, TYPE, H, OP)                                   \
+void HELPER(NAME)(void *vd, void *vn, void *vm, uint32_t desc)          \
+{                                                                       \
+    intptr_t i, opr_sz = simd_oprsz(desc);                              \
+    intptr_t sel1 = extract32(desc, SIMD_DATA_SHIFT, 1) * sizeof(TYPE); \
+    intptr_t sel2 = extract32(desc, SIMD_DATA_SHIFT + 1, 1) * sizeof(TYPE); \
+    for (i = 0; i < opr_sz; i += 2 * sizeof(TYPE)) {                    \
+        TYPE nn = *(TYPE *)(vn + H(i + sel1));                          \
+        TYPE mm = *(TYPE *)(vm + H(i + sel2));                          \
+        *(TYPE *)(vd + H(i + sel1)) = OP(nn, mm);                       \
+    }                                                                   \
+}
+
+DO_ZZZ_NTB(sve2_eoril_b, uint8_t, H1, DO_EOR)
+DO_ZZZ_NTB(sve2_eoril_h, uint16_t, H1_2, DO_EOR)
+DO_ZZZ_NTB(sve2_eoril_s, uint32_t, H1_4, DO_EOR)
+DO_ZZZ_NTB(sve2_eoril_d, uint64_t,     , DO_EOR)
+
+#undef DO_ZZZ_NTB
+
 #define DO_ZZI_SHLL(NAME, TYPEW, TYPEN, HW, HN) \
 void HELPER(NAME)(void *vd, void *vn, uint32_t desc)           \
 {                                                              \
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index da7308d1af..d2c1fafc5f 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -6030,6 +6030,25 @@ DO_SVE2_ZZZ_TB(SMULLT_zzz, smull_zzz, true, true)
 DO_SVE2_ZZZ_TB(UMULLB_zzz, umull_zzz, false, false)
 DO_SVE2_ZZZ_TB(UMULLT_zzz, umull_zzz, true, true)
 
+static bool do_eor_tb(DisasContext *s, arg_rrr_esz *a, bool sel1)
+{
+    static gen_helper_gvec_3 * const fns[4] = {
+        gen_helper_sve2_eoril_b, gen_helper_sve2_eoril_h,
+        gen_helper_sve2_eoril_s, gen_helper_sve2_eoril_d,
+    };
+    return do_sve2_zzw_ool(s, a, fns[a->esz], (!sel1 << 1) | sel1);
+}
+
+static bool trans_EORBT(DisasContext *s, arg_rrr_esz *a)
+{
+    return do_eor_tb(s, a, false);
+}
+
+static bool trans_EORTB(DisasContext *s, arg_rrr_esz *a)
+{
+    return do_eor_tb(s, a, true);
+}
+
 static bool do_trans_pmull(DisasContext *s, arg_rrr_esz *a, bool sel)
 {
     static gen_helper_gvec_3 * const fns[4] = {
-- 
2.25.1


