Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37E1E56BCE9
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jul 2022 17:29:51 +0200 (CEST)
Received: from localhost ([::1]:56598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9pvS-0004db-Ap
	for lists+qemu-devel@lfdr.de; Fri, 08 Jul 2022 11:29:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9piW-0002YB-1P
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 11:16:29 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:35529)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9piU-0002HZ-CK
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 11:16:27 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 x18-20020a17090a8a9200b001ef83b332f5so2221785pjn.0
 for <qemu-devel@nongnu.org>; Fri, 08 Jul 2022 08:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3fycTpR631CAyDn0p7xxlDZ9oFm740riIb23T+ghRkc=;
 b=KlqFeacpPikz8VlCkQC8zAM6eV6tmOBIgQcStlKRUSVfF8K7WzNlgrcN/WiPETLfN+
 ndWnSoUvH9msmc8ffLen0nZECoMK4JNcitWt3Wab88mFabLKgY6Vv3VyNXRG3pOh+Sdp
 zhfqGhpGoXthYzt24zTqjbEAUhR3hRG62mtY8qh1NhsaPmKJCQux8DSIY921e1S401wv
 xAlmq5neMSmnnWw80itX2n20uCm76bSENpEqrC8CjYdoEkKcl5cXKdvenxAbo5Xb67JT
 Y6HfQEBfMAjJfl0wsputEBachvP8rzbXE5lR8zgB5aiBoOxLHWFytatItiNTzj6tfHlg
 /ZlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3fycTpR631CAyDn0p7xxlDZ9oFm740riIb23T+ghRkc=;
 b=EmPCSh2WYOB1+OfVV1GUu9Lq4Ib87z3sdAWShLKAr8HOQoNOKp4aVjLDyo1SYWKjtO
 tkfqBrNMPckORWXBjik0A2ak2IL3NYNFghPil6aAHzIJQjGWU6N6UpgDeW9+/kyKxHD8
 GeByrWhZR4O5RwgXPr9lr8S07EOnqTRTH2kG9tzIIHw5PL135Dk+Y9WW6qxNNuicglwX
 sv9R2oYbyKGuwUDpC/eTbU5fXfTKYT4DvDBJcHynPTlZiJPs3ebbm8cS9Vv+N0OCSDKj
 Fj66P17Z4oTUbi1JRpUapyjR/IempV3gq2Gh7bULkkAPfBhS5Ssy/EVcSwwrdaTkawh6
 VxlQ==
X-Gm-Message-State: AJIora9IQS2aV/3HHnVnRBedQs0lDJ1ccVGVq/qMmZryQV/K5v5gAL2V
 tOqcqMjJqvqI7JMzKSU3jhsQ8F04uBkmRU4f
X-Google-Smtp-Source: AGRyM1sLULJidU4fzwcq7p9Vq99XqYQHAi4zdbebRNEB6XLLWpP/kThHoxhqCW9nshhjlWt39BY9+Q==
X-Received: by 2002:a17:90a:f415:b0:1ef:8811:e0c7 with SMTP id
 ch21-20020a17090af41500b001ef8811e0c7mr373534pjb.130.1657293385095; 
 Fri, 08 Jul 2022 08:16:25 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 n17-20020a056a0007d100b0051bada81bc7sm29085774pfu.161.2022.07.08.08.16.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jul 2022 08:16:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v6 13/45] target/arm: Mark LDFF1 and LDNF1 as non-streaming
Date: Fri,  8 Jul 2022 20:45:08 +0530
Message-Id: <20220708151540.18136-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220708151540.18136-1-richard.henderson@linaro.org>
References: <20220708151540.18136-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Mark these as a non-streaming instructions, which should trap
if full a64 support is not enabled in streaming mode.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sme-fa64.decode | 2 --
 target/arm/translate-sve.c | 2 ++
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/sme-fa64.decode b/target/arm/sme-fa64.decode
index 7d4c33fb5b..2b5432bf85 100644
--- a/target/arm/sme-fa64.decode
+++ b/target/arm/sme-fa64.decode
@@ -59,7 +59,5 @@ FAIL    0001 1110 0111 1110 0000 00-- ---- ----   # FJCVTZS
 #       --11 1100 --1- ---- ---- ---- ---- --10   # Load/store FP register (register offset)
 #       --11 1101 ---- ---- ---- ---- ---- ----   # Load/store FP register (scaled imm)
 
-FAIL    1010 010- ---- ---- 011- ---- ---- ----   # SVE contiguous FF load (scalar+scalar)
-FAIL    1010 010- ---1 ---- 101- ---- ---- ----   # SVE contiguous NF load (scalar+imm)
 FAIL    1010 010- -01- ---- 000- ---- ---- ----   # SVE load & replicate 32 bytes (scalar+scalar)
 FAIL    1010 010- -010 ---- 001- ---- ---- ----   # SVE load & replicate 32 bytes (scalar+imm)
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index bbf3bf2119..5182ee4c06 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -4805,6 +4805,7 @@ static bool trans_LDFF1_zprr(DisasContext *s, arg_rprr_load *a)
     if (!dc_isar_feature(aa64_sve, s)) {
         return false;
     }
+    s->is_nonstreaming = true;
     if (sve_access_check(s)) {
         TCGv_i64 addr = new_tmp_a64(s);
         tcg_gen_shli_i64(addr, cpu_reg(s, a->rm), dtype_msz(a->dtype));
@@ -4906,6 +4907,7 @@ static bool trans_LDNF1_zpri(DisasContext *s, arg_rpri_load *a)
     if (!dc_isar_feature(aa64_sve, s)) {
         return false;
     }
+    s->is_nonstreaming = true;
     if (sve_access_check(s)) {
         int vsz = vec_full_reg_size(s);
         int elements = vsz >> dtype_esz[a->dtype];
-- 
2.34.1


