Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85DCD3905E7
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 17:53:57 +0200 (CEST)
Received: from localhost ([::1]:36952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llZNU-00080B-JQ
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 11:53:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llYbr-0003u8-Lf
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:04:43 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:38894)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llYbc-0004aM-S5
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:04:43 -0400
Received: by mail-wr1-x42e.google.com with SMTP id j14so30852527wrq.5
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 08:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=xTr540Mo6mzYd6S5l3nyCJx96RZhSbsUPKsGBOrPLgk=;
 b=cqB9j3tp6eArspr9zDSV0ABqy5KRkAOej3ythvm36IuBjAZr4ilBzSS1K6EyT4bzXF
 0mcdi22WLTm375SU5GWTeaJ8rj9Rwdg8uED3DKEPg3rInn4SVLAYopiVGTTxsAYzMn9O
 Qwd6gqlawz5z2zv0GpdkLWAzmsH5IH3YLM7beOKLMJaOc6ac6WWU+wz3QQfxJegprhQZ
 S/qvdW3oAF/sL/hEyrcA4mZ61wOnMGu5WiKCmMUBYK1JhhIgUo0GtbbxB+Q6HQf5DEmX
 4vYVmX/t1I439lFN1BOFbiLgqyXEFhpX/umcFDWP8zEha4D15AE9m/VzYapfPjhuea7Y
 I7mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xTr540Mo6mzYd6S5l3nyCJx96RZhSbsUPKsGBOrPLgk=;
 b=lo7uWpJUIXdrNBeQbBLwHjCo+1b8GyfGuGV+RM+VRKUpiFxzTYPzC8PrE1cGe+Ct+7
 FTHlzvQeoHIN6/kF1dyn1A02Dh25V+B2GNLn4y4tDFwqODtJArrgA07m71wBQjkR143S
 zo+vQIV+/EyahQyDLguOnqObS0WzNWobvk69kqipkK5mCjMAc/dFQteHzTFl9RMKkXeM
 ziJbm1ikdAebfNxuD2UA6ljBq4xFJ2ECe8ZtBJA0d9E7pDdiFi/pdWuos1L9Iwz7GX5j
 /LEyZlRIwov+Mhsj9FcG0uwZVEpUx0Kt0FwKDxxd1O1ZK5QrTg+7dGsDlMbcps/JXgv2
 TnNg==
X-Gm-Message-State: AOAM53151VPKbCOMLn+XcCtZjHDcEsGTSObiwCFm+oHJkFkKJJum9FQO
 3PedKtytguvYcnyqbDnJ7VxFwZW8P0z0HQBH
X-Google-Smtp-Source: ABdhPJzjqbEJKGWQn+jz5yUsFAxJaFRmFkRqH8QWQ7GiofykNf3jHpa6+1rti/IvO7PXRRtZ0cCIDg==
X-Received: by 2002:adf:f98f:: with SMTP id f15mr28480869wrr.4.1621955066337; 
 Tue, 25 May 2021 08:04:26 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q62sm11710284wma.42.2021.05.25.08.04.25
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 08:04:26 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 062/114] target/arm: Implement SVE2 SUBHNB, SUBHNT
Date: Tue, 25 May 2021 16:02:32 +0100
Message-Id: <20210525150324.32370-63-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210525150324.32370-1-peter.maydell@linaro.org>
References: <20210525150324.32370-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
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
Message-id: 20210525010358.152808-41-richard.henderson@linaro.org
Message-Id: <20200417162231.10374-4-steplong@quicinc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper-sve.h    |  8 ++++++++
 target/arm/sve.decode      |  2 ++
 target/arm/sve_helper.c    | 10 ++++++++++
 target/arm/translate-sve.c |  3 +++
 4 files changed, 23 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index 8d95c87694d..3642e7c8200 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -2525,6 +2525,14 @@ DEF_HELPER_FLAGS_4(sve2_raddhnt_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve2_raddhnt_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve2_raddhnt_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_4(sve2_subhnb_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_subhnb_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_subhnb_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(sve2_subhnt_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_subhnt_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_subhnt_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_5(sve2_match_ppzz_b, TCG_CALL_NO_RWG,
                    i32, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve2_match_ppzz_h, TCG_CALL_NO_RWG,
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index dfcfab4bc0f..c68bfcf6ed5 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1326,6 +1326,8 @@ ADDHNB          01000101 .. 1 ..... 011 000 ..... .....  @rd_rn_rm
 ADDHNT          01000101 .. 1 ..... 011 001 ..... .....  @rd_rn_rm
 RADDHNB         01000101 .. 1 ..... 011 010 ..... .....  @rd_rn_rm
 RADDHNT         01000101 .. 1 ..... 011 011 ..... .....  @rd_rn_rm
+SUBHNB          01000101 .. 1 ..... 011 100 ..... .....  @rd_rn_rm
+SUBHNT          01000101 .. 1 ..... 011 101 ..... .....  @rd_rn_rm
 
 ### SVE2 Character Match
 
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 8b450418c56..922df9575af 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -2145,6 +2145,7 @@ void HELPER(NAME)(void *vd, void *vn, void *vm, uint32_t desc)              \
 
 #define DO_ADDHN(N, M, SH)  ((N + M) >> SH)
 #define DO_RADDHN(N, M, SH) ((N + M + ((__typeof(N))1 << (SH - 1))) >> SH)
+#define DO_SUBHN(N, M, SH)  ((N - M) >> SH)
 
 DO_BINOPNB(sve2_addhnb_h, uint16_t, uint8_t, 8, DO_ADDHN)
 DO_BINOPNB(sve2_addhnb_s, uint32_t, uint16_t, 16, DO_ADDHN)
@@ -2162,6 +2163,15 @@ DO_BINOPNT(sve2_raddhnt_h, uint16_t, uint8_t, 8, H1_2, H1, DO_RADDHN)
 DO_BINOPNT(sve2_raddhnt_s, uint32_t, uint16_t, 16, H1_4, H1_2, DO_RADDHN)
 DO_BINOPNT(sve2_raddhnt_d, uint64_t, uint32_t, 32,     , H1_4, DO_RADDHN)
 
+DO_BINOPNB(sve2_subhnb_h, uint16_t, uint8_t, 8, DO_SUBHN)
+DO_BINOPNB(sve2_subhnb_s, uint32_t, uint16_t, 16, DO_SUBHN)
+DO_BINOPNB(sve2_subhnb_d, uint64_t, uint32_t, 32, DO_SUBHN)
+
+DO_BINOPNT(sve2_subhnt_h, uint16_t, uint8_t, 8, H1_2, H1, DO_SUBHN)
+DO_BINOPNT(sve2_subhnt_s, uint32_t, uint16_t, 16, H1_4, H1_2, DO_SUBHN)
+DO_BINOPNT(sve2_subhnt_d, uint64_t, uint32_t, 32,     , H1_4, DO_SUBHN)
+
+#undef DO_SUBHN
 #undef DO_RADDHN
 #undef DO_ADDHN
 
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index e7bf8cd9ccc..334c57b44f9 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -7477,6 +7477,9 @@ DO_SVE2_ZZZ_NARROW(ADDHNT, addhnt)
 DO_SVE2_ZZZ_NARROW(RADDHNB, raddhnb)
 DO_SVE2_ZZZ_NARROW(RADDHNT, raddhnt)
 
+DO_SVE2_ZZZ_NARROW(SUBHNB, subhnb)
+DO_SVE2_ZZZ_NARROW(SUBHNT, subhnt)
+
 static bool do_sve2_ppzz_flags(DisasContext *s, arg_rprr_esz *a,
                                gen_helper_gvec_flags_4 *fn)
 {
-- 
2.20.1


