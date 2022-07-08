Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A09056BCE3
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jul 2022 17:27:18 +0200 (CEST)
Received: from localhost ([::1]:47416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9psz-0006cB-78
	for lists+qemu-devel@lfdr.de; Fri, 08 Jul 2022 11:27:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9piM-0002JL-Lq
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 11:16:18 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:41565)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9piJ-00028v-HE
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 11:16:18 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 o31-20020a17090a0a2200b001ef7bd037bbso2077454pjo.0
 for <qemu-devel@nongnu.org>; Fri, 08 Jul 2022 08:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5diXjDkZ8lDduwnyqU3jDTWthnVlvOOyK5gnN0aC3a8=;
 b=Xs3H7pLUVLv3IoFcOon/LnA0jyYXOtIP3GG0z5bduOSK+/4xR6NraKw3xYUIV7FQJv
 4LiUjycXwmCFTnB1seIu8ult4nKMsQH7edhVNKeN50mCwDLJys4JFOraULBTvmLbgHuJ
 sAlsknEevjBqTLzX7/RG+2ijUsBes8oVWjtgPKiuExUylfqHlgDFH5EojSOgOBJoxRAj
 HAfgKRGtIIiGt3N9oxjkNOjhivcvd9+bUpNdg/0Xa0xgy+rYxDaYCjLVx8YBGrmkBZuv
 hc+oyz4jrrPKkRbINfy1UcDJaJNBS7KfV4tQh09YhHdxUVsfsMxoHPKGIslvCZRyIkJP
 r8Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5diXjDkZ8lDduwnyqU3jDTWthnVlvOOyK5gnN0aC3a8=;
 b=dtlUnM97XXKE385RAgnc7MV68GZuoLFGWvtLENqlZEQE3no7/hTJP0AEpK7kfB6TX7
 +p06NfpJpk48IXgHnlOeqwtPwA+i4Cd53VY5868/bhy1E7pgUzEVW2x5AtImyb7OMwEb
 zIFCg6KF7436PDkDEhXseeiPBhFHd/YqrIPcA1AE7DCoAERVXECy7RsouLHjs4FxHgh8
 STBS2PCqxF7ffnmF1XWcGljpYADv0JzH6jyNbvtI7CW+KsfJnBOD+SBqi5/0MWMslWrB
 Ptpa4KRtvAahK/fgYefW0eEPZ9nFYJPYcem2dQE+euYOwm5Plr0eKpIIpgkcHO27C2/f
 SZMQ==
X-Gm-Message-State: AJIora+fHl1OTup0FvPlBFN0MehFhzzBxI3nBdVVIwHcJLBijFHHK2Ot
 fbPP1eVFh+27PlRrGYW10MXbu2aTUXmT4OOE
X-Google-Smtp-Source: AGRyM1uYZKvvrVrVV7Dhd3fT8IP4/ZZjIR90JRf64CMeFoRTE2dQ7sCCJYQkutgystlu9Xoe5AFkJg==
X-Received: by 2002:a17:902:aa47:b0:16b:8e4c:93d2 with SMTP id
 c7-20020a170902aa4700b0016b8e4c93d2mr4211237plr.27.1657293373640; 
 Fri, 08 Jul 2022 08:16:13 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 n17-20020a056a0007d100b0051bada81bc7sm29085774pfu.161.2022.07.08.08.16.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jul 2022 08:16:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v6 09/45] target/arm: Mark SMMLA, UMMLA,
 USMMLA as non-streaming
Date: Fri,  8 Jul 2022 20:45:04 +0530
Message-Id: <20220708151540.18136-10-richard.henderson@linaro.org>
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

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sme-fa64.decode |  1 -
 target/arm/translate-sve.c | 12 ++++++------
 2 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/target/arm/sme-fa64.decode b/target/arm/sme-fa64.decode
index b5eaa2d0fa..3260ea2d64 100644
--- a/target/arm/sme-fa64.decode
+++ b/target/arm/sme-fa64.decode
@@ -59,7 +59,6 @@ FAIL    0001 1110 0111 1110 0000 00-- ---- ----   # FJCVTZS
 #       --11 1100 --1- ---- ---- ---- ---- --10   # Load/store FP register (register offset)
 #       --11 1101 ---- ---- ---- ---- ---- ----   # Load/store FP register (scaled imm)
 
-FAIL    0100 0101 --0- ---- 1001 10-- ---- ----   # SMMLA, UMMLA, USMMLA
 FAIL    0100 0101 --1- ---- 1--- ---- ---- ----   # SVE2 string/histo/crypto instructions
 FAIL    1000 010- -00- ---- 10-- ---- ---- ----   # SVE2 32-bit gather NT load (vector+scalar)
 FAIL    1000 010- -00- ---- 111- ---- ---- ----   # SVE 32-bit gather prefetch (vector+imm)
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index d5aad53923..9bbf44f008 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -7302,12 +7302,12 @@ TRANS_FEAT(FMLALT_zzxw, aa64_sve2, do_FMLAL_zzxw, a, false, true)
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


