Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC4C38F79A
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 03:37:27 +0200 (CEST)
Received: from localhost ([::1]:39378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llM0b-0002pR-RY
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 21:37:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLVE-0002f6-9e
 for qemu-devel@nongnu.org; Mon, 24 May 2021 21:05:00 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:36679)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLUf-0001tg-Kp
 for qemu-devel@nongnu.org; Mon, 24 May 2021 21:04:59 -0400
Received: by mail-pf1-x42b.google.com with SMTP id c12so10680977pfl.3
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 18:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DwtbG3bSNWXAP9uBkfJM+X1tflgrIEMxL+cytHL7AWs=;
 b=XMkoJQU5q0nffPvB9OMB51OrEa8/q8PS77+tKLUTRI0Y9r75E3oob5ai6xVCM04QEF
 W43NPchohz706F/pftt7IOPwv9+reBqkKdW3Lw73i09T3f6WBhmpl15iYCgVatZMAZNE
 W443tZVLHPf7xfAroVbqTr3Lc4Uy9oX1+YEcV6rtRcNZzOkUWb/8E0hi/WxdCvxiyDbJ
 zwByEbVTdZPvJ3GK8u96/SPmnqo3ralYdQsrzbctklc86oEhy0r3Zod7cKioeeMGKXcj
 y4p29P+cpQ4LiltNvmlnFL3B+BvgBp3RIJ+Z5zS0lKV2GE4gQ3d4VX6mndFdIs4s5WUW
 UZJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DwtbG3bSNWXAP9uBkfJM+X1tflgrIEMxL+cytHL7AWs=;
 b=pD8EWL2wVwy+CWf6QdeNWRnj2v3w54g7wmpp6bLW9Q7ey9yJPx/KkWzQl3ClZbZUxO
 yQevf2BOh8iytwV1F3nFJR5Si9vYEGEGHPBQn47D3sQ3HeozuP5kZUXuunkc9DHrjmZC
 6J72onVMSGmdKB20lcDZrxUOLwuBVqL1zsANstS7qjNGExCf2kc/rcGqwsnHrvhnTlxH
 H6s43Y0vNIj0cg6F+6Io41keJvUxFgHnnhb2Cszvb/+QmzByMsphKZENWEYRlNDb30Ir
 VM3RFT5ym2herfBxi1Rd+Njvqnw5OcxM2Xv8epDxZwfUkEXME+N/oBw/IdrFqtwKn+a+
 YUHA==
X-Gm-Message-State: AOAM533jLVR/7XDoUqdmNHSAqrAnPrpG3JNmWa1tkshUlr3gr6sHCiDr
 lJIwfK/ciIQZcurmjYQgOIEumPOHDRL+jA==
X-Google-Smtp-Source: ABdhPJz1iJ9M5hp2e7mjr4g90UB+gQIVkk0upMEbG1iK762SkrOy4UVlKf6U8M7M6u45+HADQp4KNg==
X-Received: by 2002:a05:6a00:10c2:b029:2de:7333:1343 with SMTP id
 d2-20020a056a0010c2b02902de73331343mr27660202pfu.42.1621904663451; 
 Mon, 24 May 2021 18:04:23 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id b1sm13742645pgf.84.2021.05.24.18.04.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 18:04:23 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 39/92] target/arm: Implement SVE2 RADDHNB, RADDHNT
Date: Mon, 24 May 2021 18:03:05 -0700
Message-Id: <20210525010358.152808-40-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210525010358.152808-1-richard.henderson@linaro.org>
References: <20210525010358.152808-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Stephen Long <steplong@quicinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stephen Long <steplong@quicinc.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Stephen Long <steplong@quicinc.com>
Message-Id: <20200417162231.10374-3-steplong@quicinc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Fix round bit type (laurent desnogues)
---
 target/arm/helper-sve.h    |  8 ++++++++
 target/arm/sve.decode      |  2 ++
 target/arm/sve_helper.c    | 10 ++++++++++
 target/arm/translate-sve.c |  2 ++
 4 files changed, 22 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index a369fd2391..8d95c87694 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -2517,6 +2517,14 @@ DEF_HELPER_FLAGS_4(sve2_addhnt_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve2_addhnt_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve2_addhnt_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_4(sve2_raddhnb_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_raddhnb_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_raddhnb_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(sve2_raddhnt_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_raddhnt_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_raddhnt_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_5(sve2_match_ppzz_b, TCG_CALL_NO_RWG,
                    i32, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve2_match_ppzz_h, TCG_CALL_NO_RWG,
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 72dd36a5c8..dfcfab4bc0 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1324,6 +1324,8 @@ UQRSHRNT        01000101 .. 1 ..... 00 1111 ..... .....  @rd_rn_tszimm_shr
 
 ADDHNB          01000101 .. 1 ..... 011 000 ..... .....  @rd_rn_rm
 ADDHNT          01000101 .. 1 ..... 011 001 ..... .....  @rd_rn_rm
+RADDHNB         01000101 .. 1 ..... 011 010 ..... .....  @rd_rn_rm
+RADDHNT         01000101 .. 1 ..... 011 011 ..... .....  @rd_rn_rm
 
 ### SVE2 Character Match
 
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index df7413f9c9..8b450418c5 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -2144,6 +2144,7 @@ void HELPER(NAME)(void *vd, void *vn, void *vm, uint32_t desc)              \
 }
 
 #define DO_ADDHN(N, M, SH)  ((N + M) >> SH)
+#define DO_RADDHN(N, M, SH) ((N + M + ((__typeof(N))1 << (SH - 1))) >> SH)
 
 DO_BINOPNB(sve2_addhnb_h, uint16_t, uint8_t, 8, DO_ADDHN)
 DO_BINOPNB(sve2_addhnb_s, uint32_t, uint16_t, 16, DO_ADDHN)
@@ -2153,6 +2154,15 @@ DO_BINOPNT(sve2_addhnt_h, uint16_t, uint8_t, 8, H1_2, H1, DO_ADDHN)
 DO_BINOPNT(sve2_addhnt_s, uint32_t, uint16_t, 16, H1_4, H1_2, DO_ADDHN)
 DO_BINOPNT(sve2_addhnt_d, uint64_t, uint32_t, 32,     , H1_4, DO_ADDHN)
 
+DO_BINOPNB(sve2_raddhnb_h, uint16_t, uint8_t, 8, DO_RADDHN)
+DO_BINOPNB(sve2_raddhnb_s, uint32_t, uint16_t, 16, DO_RADDHN)
+DO_BINOPNB(sve2_raddhnb_d, uint64_t, uint32_t, 32, DO_RADDHN)
+
+DO_BINOPNT(sve2_raddhnt_h, uint16_t, uint8_t, 8, H1_2, H1, DO_RADDHN)
+DO_BINOPNT(sve2_raddhnt_s, uint32_t, uint16_t, 16, H1_4, H1_2, DO_RADDHN)
+DO_BINOPNT(sve2_raddhnt_d, uint64_t, uint32_t, 32,     , H1_4, DO_RADDHN)
+
+#undef DO_RADDHN
 #undef DO_ADDHN
 
 #undef DO_BINOPNB
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 442bf80b82..e7bf8cd9cc 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -7474,6 +7474,8 @@ static bool trans_##NAME(DisasContext *s, arg_rrr_esz *a)                 \
 
 DO_SVE2_ZZZ_NARROW(ADDHNB, addhnb)
 DO_SVE2_ZZZ_NARROW(ADDHNT, addhnt)
+DO_SVE2_ZZZ_NARROW(RADDHNB, raddhnb)
+DO_SVE2_ZZZ_NARROW(RADDHNT, raddhnt)
 
 static bool do_sve2_ppzz_flags(DisasContext *s, arg_rprr_esz *a,
                                gen_helper_gvec_flags_4 *fn)
-- 
2.25.1


