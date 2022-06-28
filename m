Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEE4F55BE28
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 06:25:36 +0200 (CEST)
Received: from localhost ([::1]:52632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o62n9-0004ke-MZ
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 00:25:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o62jS-0001XZ-Q7
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:21:46 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:39493)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o62jQ-0003gU-KR
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:21:46 -0400
Received: by mail-pl1-x632.google.com with SMTP id x20so4370438plx.6
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 21:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/Hax6yB4716XxH/pP7eizCJLrlEm4CvxdVgM8qrNTVI=;
 b=k1ZWGrkLf+SL3rEPFJOhJLtLJgvEuTsNtosdLJaNb5onPm6jPJ8SxBoa/j7CDutylV
 W+SZWNEQ013+oLwAyS4Mmg4wh90Q7wX2Hgh3c2yerllIXbhc0YAEOewlBmR6q+oCpU0Q
 E991g14lAHrJsjALs7pLoyeblRGw7rvVDLR+uMW1fMiDLZo+EhV5YiRy2zLGWcB6QBgL
 /M1/oMySkQ5tvaaQIKTLxs3WO6ZdUh2lao3pOLOnAEARX+VfBwFl1YGrs2tcGV+zlKRX
 jACR0rnpULltW8CIY0O0O0iLzLZHFvn0zNShDsojUEPYw1boPESDwtZtfmsG0Xm6R5e8
 YLCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/Hax6yB4716XxH/pP7eizCJLrlEm4CvxdVgM8qrNTVI=;
 b=sz69D8RlzR1eNGLbR3s9iWpcno/atI2HcHQmDZj10Y8jZolBZg6SW2Ae1QzxIv9QUM
 w3nNygeM1Sez9Hdtwwx4mo5oSaJRvivIlS3b1sJySHCab/DQqP8B67UKmKGzZBkbljGt
 mFNllOGN33MTXUDBgHrHiAAbiDCJHrjtiPSE0eP6NZUl6+kSZfdmrLkU3TtkTpNhKPVd
 WTJxGiLSamvR93FO+m6QyK8SlMlUJZHLOyXx4WOIdTNCr38e4YVRFJkMF/Jz1wJJ84D8
 eZYRqK17RqJZB+fd6LutGCPNIKuZWYD9la7pEt1tDu7FJh5l2FH5i6mJXFcJBXuAGwyo
 DmCA==
X-Gm-Message-State: AJIora8erwGUjwSbcb5ORIoF2wlLk0RJ4yo9l4NbCRcW5+ltX2ZKRBw0
 szU5cxEwLi4Zdve4Bxs/hxpvkYgGqH7/Bg==
X-Google-Smtp-Source: AGRyM1t7wfTisuP9+6vJI6liu/8MgW49mzD8yV4Fo6hv1UoJUiIjfXlFBq8sXBXM8R4/3u89VX4KTw==
X-Received: by 2002:a17:902:c2c7:b0:16a:3132:bc53 with SMTP id
 c7-20020a170902c2c700b0016a3132bc53mr1731692pla.90.1656390103202; 
 Mon, 27 Jun 2022 21:21:43 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 jg6-20020a17090326c600b0016a087cfad8sm7994929plb.264.2022.06.27.21.21.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 21:21:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v4 09/45] target/arm: Mark SMMLA, UMMLA,
 USMMLA as non-streaming
Date: Tue, 28 Jun 2022 09:50:41 +0530
Message-Id: <20220628042117.368549-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220628042117.368549-1-richard.henderson@linaro.org>
References: <20220628042117.368549-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sme-fa64.decode |  1 -
 target/arm/translate-sve.c | 12 ++++++------
 2 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/target/arm/sme-fa64.decode b/target/arm/sme-fa64.decode
index f6e10e4bbe..d3039a8bb2 100644
--- a/target/arm/sme-fa64.decode
+++ b/target/arm/sme-fa64.decode
@@ -58,7 +58,6 @@ FAIL    1100 1110 ---- ---- ---- ---- ---- ----   # Advanced SIMD cryptography e
 #       --11 1100 --1- ---- ---- ---- ---- --10   # Load/store FP register (register offset)
 #       --11 1101 ---- ---- ---- ---- ---- ----   # Load/store FP register (scaled imm)
 
-FAIL    0100 0101 --0- ---- 1001 10-- ---- ----   # SMMLA, UMMLA, USMMLA
 FAIL    0100 0101 --1- ---- 1--- ---- ---- ----   # SVE2 string/histo/crypto instructions
 FAIL    1000 010- -00- ---- 10-- ---- ---- ----   # SVE2 32-bit gather NT load (vector+scalar)
 FAIL    1000 010- -00- ---- 111- ---- ---- ----   # SVE 32-bit gather prefetch (vector+imm)
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 9d0a89215c..7524d713ab 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -7298,12 +7298,12 @@ TRANS_FEAT(FMLALT_zzxw, aa64_sve2, do_FMLAL_zzxw, a, false, true)
 TRANS_FEAT(FMLSLB_zzxw, aa64_sve2, do_FMLAL_zzxw, a, true, false)
 TRANS_FEAT(FMLSLT_zzxw, aa64_sve2, do_FMLAL_zzxw, a, true, true)
 
-TRANS_FEAT(SMMLA, aa64_sve_i8mm, gen_gvec_ool_arg_zzzz,
-           gen_helper_gvec_smmla_b, a, 0)
-TRANS_FEAT(USMMLA, aa64_sve_i8mm, gen_gvec_ool_arg_zzzz,
-           gen_helper_gvec_usmmla_b, a, 0)
-TRANS_FEAT(UMMLA, aa64_sve_i8mm, gen_gvec_ool_arg_zzzz,
-           gen_helper_gvec_ummla_b, a, 0)
+TRANS_FEAT_NONSTREAMING(SMMLA, aa64_sve_i8mm, gen_gvec_ool_arg_zzzz,
+                        gen_helper_gvec_smmla_b, a, 0)
+TRANS_FEAT_NONSTREAMING(USMMLA, aa64_sve_i8mm, gen_gvec_ool_arg_zzzz,
+                        gen_helper_gvec_usmmla_b, a, 0)
+TRANS_FEAT_NONSTREAMING(UMMLA, aa64_sve_i8mm, gen_gvec_ool_arg_zzzz,
+                        gen_helper_gvec_ummla_b, a, 0)
 
 TRANS_FEAT(BFDOT_zzzz, aa64_sve_bf16, gen_gvec_ool_arg_zzzz,
            gen_helper_gvec_bfdot, a, 0)
-- 
2.34.1


