Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30D823905DF
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 17:51:23 +0200 (CEST)
Received: from localhost ([::1]:56664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llZL0-0002AP-6T
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 11:51:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llYbo-0003iW-IV
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:04:40 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:44912)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llYbb-0004a8-NJ
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:04:40 -0400
Received: by mail-wr1-x432.google.com with SMTP id i17so32600341wrq.11
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 08:04:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=355zTeaZvH6hps0lYj+Ebjq3a3BuRMa/qCtvqN6WVEo=;
 b=ccwTZN4RIjdfbbi8auoE9DF4c+9Kv8EsjXEPBbXpZ9Mh1gS76tandOCRGuBePDqjXB
 o0CEIRrFsaPxffwKxrPom0KXHFkOOP1eHxMT1tohVsaGrcblPUoxY+7cr+26ab7MnLyj
 tSGND/IaCe04nse90gwrb5ySMPj1GkvrXf8NAU1hNqrfIh3b+h41/B8Ki8J3c7/hmkZq
 5OqObTwqBXl8+9OalDnjf+Ard24LgaUk3aMpHDVIJs17O92jCk306ZW5+RzarYE5/d+F
 l19BrMnBsgHxYD9MsSPbgl3vhfFqbwDXMNCgM/nlK3ecETnuZtvy1BZKm8za2r0NfLCu
 KSSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=355zTeaZvH6hps0lYj+Ebjq3a3BuRMa/qCtvqN6WVEo=;
 b=sXMy92c8ZiyiNxoW03U3iydhPnU+TpnrWJIJcmQT3mu4m5DD7ry2eHQNLlJZSIpXXD
 5mp6EKY0/nGHEun7an42acelIo9LbEKLbA0U4GdqSinLaRyIn+GQkGm7NcjjdYpGu3i7
 Am74cPpc909HQJiCnHEHsFbDaqUH+QMRgfAHLMu+NNuCufoKQxhCmm5MsJ8EJFHU0bTv
 A45CsPJac8fvu+z0FCZaF+mUJpuGJDQiD9Gm17TrhaBeOwIGXCN28V1tfxtzhafNB9fu
 cgnNV2l9x+SVJkLHr3pxH0AJUTADcPRTN7j5G/JD20eVXDw4Je6lcYy3gH0KI5ve54em
 ye0g==
X-Gm-Message-State: AOAM531/wbwKA+4xqb3Wbf62IXG5tlT9aPgFajtlOQTP7XuStS/how0M
 IOGIBn0izetj5q9lcfy4l43PXJqD2Y6nKvty
X-Google-Smtp-Source: ABdhPJwrg4PSHCg4aar4PvV2/aMPHx7WKRXf92RoMpLLqoQXyqM55nV4kB2Xd9SYDVpzzmWWy5FxbQ==
X-Received: by 2002:a05:6000:1acf:: with SMTP id
 i15mr20607052wry.141.1621955064967; 
 Tue, 25 May 2021 08:04:24 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q62sm11710284wma.42.2021.05.25.08.04.24
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 08:04:24 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 060/114] target/arm: Implement SVE2 ADDHNB, ADDHNT
Date: Tue, 25 May 2021 16:02:30 +0100
Message-Id: <20210525150324.32370-61-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210525150324.32370-1-peter.maydell@linaro.org>
References: <20210525150324.32370-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
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
Message-id: 20210525010358.152808-39-richard.henderson@linaro.org
Message-Id: <20200417162231.10374-2-steplong@quicinc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper-sve.h    |  8 ++++++++
 target/arm/sve.decode      |  5 +++++
 target/arm/sve_helper.c    | 36 ++++++++++++++++++++++++++++++++++++
 target/arm/translate-sve.c | 13 +++++++++++++
 4 files changed, 62 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index d1542184525..a369fd23919 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -2509,6 +2509,14 @@ DEF_HELPER_FLAGS_3(sve2_uqrshrnt_h, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
 DEF_HELPER_FLAGS_3(sve2_uqrshrnt_s, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
 DEF_HELPER_FLAGS_3(sve2_uqrshrnt_d, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_4(sve2_addhnb_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_addhnb_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_addhnb_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(sve2_addhnt_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_addhnt_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_addhnt_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_5(sve2_match_ppzz_b, TCG_CALL_NO_RWG,
                    i32, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve2_match_ppzz_h, TCG_CALL_NO_RWG,
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 936977eacbb..72dd36a5c8a 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1320,6 +1320,11 @@ UQSHRNT         01000101 .. 1 ..... 00 1101 ..... .....  @rd_rn_tszimm_shr
 UQRSHRNB        01000101 .. 1 ..... 00 1110 ..... .....  @rd_rn_tszimm_shr
 UQRSHRNT        01000101 .. 1 ..... 00 1111 ..... .....  @rd_rn_tszimm_shr
 
+## SVE2 integer add/subtract narrow high part
+
+ADDHNB          01000101 .. 1 ..... 011 000 ..... .....  @rd_rn_rm
+ADDHNT          01000101 .. 1 ..... 011 001 ..... .....  @rd_rn_rm
+
 ### SVE2 Character Match
 
 MATCH           01000101 .. 1 ..... 100 ... ..... 0 .... @pd_pg_rn_rm
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 263663cfc48..df7413f9c94 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -2121,6 +2121,42 @@ DO_SHRNT(sve2_uqrshrnt_d, uint64_t, uint32_t,     , H1_4, DO_UQRSHRN_D)
 #undef DO_SHRNB
 #undef DO_SHRNT
 
+#define DO_BINOPNB(NAME, TYPEW, TYPEN, SHIFT, OP)                           \
+void HELPER(NAME)(void *vd, void *vn, void *vm, uint32_t desc)              \
+{                                                                           \
+    intptr_t i, opr_sz = simd_oprsz(desc);                                  \
+    for (i = 0; i < opr_sz; i += sizeof(TYPEW)) {                           \
+        TYPEW nn = *(TYPEW *)(vn + i);                                      \
+        TYPEW mm = *(TYPEW *)(vm + i);                                      \
+        *(TYPEW *)(vd + i) = (TYPEN)OP(nn, mm, SHIFT);                      \
+    }                                                                       \
+}
+
+#define DO_BINOPNT(NAME, TYPEW, TYPEN, SHIFT, HW, HN, OP)                   \
+void HELPER(NAME)(void *vd, void *vn, void *vm, uint32_t desc)              \
+{                                                                           \
+    intptr_t i, opr_sz = simd_oprsz(desc);                                  \
+    for (i = 0; i < opr_sz; i += sizeof(TYPEW)) {                           \
+        TYPEW nn = *(TYPEW *)(vn + HW(i));                                  \
+        TYPEW mm = *(TYPEW *)(vm + HW(i));                                  \
+        *(TYPEN *)(vd + HN(i + sizeof(TYPEN))) = OP(nn, mm, SHIFT);         \
+    }                                                                       \
+}
+
+#define DO_ADDHN(N, M, SH)  ((N + M) >> SH)
+
+DO_BINOPNB(sve2_addhnb_h, uint16_t, uint8_t, 8, DO_ADDHN)
+DO_BINOPNB(sve2_addhnb_s, uint32_t, uint16_t, 16, DO_ADDHN)
+DO_BINOPNB(sve2_addhnb_d, uint64_t, uint32_t, 32, DO_ADDHN)
+
+DO_BINOPNT(sve2_addhnt_h, uint16_t, uint8_t, 8, H1_2, H1, DO_ADDHN)
+DO_BINOPNT(sve2_addhnt_s, uint32_t, uint16_t, 16, H1_4, H1_2, DO_ADDHN)
+DO_BINOPNT(sve2_addhnt_d, uint64_t, uint32_t, 32,     , H1_4, DO_ADDHN)
+
+#undef DO_ADDHN
+
+#undef DO_BINOPNB
+
 /* Fully general four-operand expander, controlled by a predicate.
  */
 #define DO_ZPZZZ(NAME, TYPE, H, OP)                           \
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 05d9edead4d..442bf80b826 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -7462,6 +7462,19 @@ static bool trans_UQRSHRNT(DisasContext *s, arg_rri_esz *a)
     return do_sve2_shr_narrow(s, a, ops);
 }
 
+#define DO_SVE2_ZZZ_NARROW(NAME, name)                                    \
+static bool trans_##NAME(DisasContext *s, arg_rrr_esz *a)                 \
+{                                                                         \
+    static gen_helper_gvec_3 * const fns[4] = {                           \
+        NULL,                       gen_helper_sve2_##name##_h,           \
+        gen_helper_sve2_##name##_s, gen_helper_sve2_##name##_d,           \
+    };                                                                    \
+    return do_sve2_zzz_ool(s, a, fns[a->esz]);                            \
+}
+
+DO_SVE2_ZZZ_NARROW(ADDHNB, addhnb)
+DO_SVE2_ZZZ_NARROW(ADDHNT, addhnt)
+
 static bool do_sve2_ppzz_flags(DisasContext *s, arg_rprr_esz *a,
                                gen_helper_gvec_flags_4 *fn)
 {
-- 
2.20.1


