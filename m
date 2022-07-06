Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFBC756826F
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 11:08:23 +0200 (CEST)
Received: from localhost ([::1]:51666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o911C-0003cj-IB
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 05:08:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o90L7-0005wP-3C
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 04:24:54 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:38810)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o90Kz-0000O1-5B
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 04:24:48 -0400
Received: by mail-pl1-x62a.google.com with SMTP id m14so13058329plg.5
 for <qemu-devel@nongnu.org>; Wed, 06 Jul 2022 01:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eMDZljSMa7lgcdxc4v8wiBGe99d03Zr6CetA/Z+JkFo=;
 b=GOWVfcePYSz5k/iq92KMZdyKm3lTK9q0yHLDuhFWv/amV0LHTMrLxmc75iBvAbnmc+
 9lD/mztlfIVFf1ggMPmBGrhuaGKdP0XnjN8RmXAv+kh9jBdpEqOApMcejGMhu5EFEZsF
 DoXpRxLk2rSXvzoMFKeww3ci2zGW047KNiyXj9b7kL5fzTNTk75vVcnwtFCNBCHioKpN
 /JiGJ09v9xr/qkUABmndvltgRDUdFm2GrpRS5xvMVwqXn2rJtT5RXADuu5xpHe5aqPTf
 BvXP105/i9FTvg6lp5bx01R7XzTP/qv8xbn8xo1zz7HkLRsBb+oTOQJDLBexRX0tPtVo
 OLlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eMDZljSMa7lgcdxc4v8wiBGe99d03Zr6CetA/Z+JkFo=;
 b=tm3G6lxJKC13N/ezoJlJYmGunCxy8ervP6HO6B5j2q7nxaoTaBm2CNETt5bfS5XzVH
 +u1mX1Lkov1w1L1arLPlgooJPKCbFm4l78nNyVnRZQx8GFWIVEZqcdcb4NYaoYizN5XN
 gDTNZidcrD4Xv68mVS4qiAjXdq5+pCOQhh4p2MVqFuMDLh1HB6JDWQb27Cnlox6yZNVy
 mx+uo92krQLbDsCqmNyC/7/gRm1VMIpiy76Oauo6VmorgHeO7hOS5yTbqUrECcjI58LQ
 lSc/Dhu7dqWqBBeC2+udEDFik8/hs1ASIurmJeVJs9lSVro1B+fV7RIu3XfXJTQn3jWJ
 ltDg==
X-Gm-Message-State: AJIora9kHDPLWZeNihuiOFNcg23RjtHIYh7a6KM2qoiQbrgQ5fU4ByM8
 0hf+K8sfJcHWYjjldyF6Lc9UGQbT8IeGI+J+
X-Google-Smtp-Source: AGRyM1s76qVoOVLGZIzuG9ZmWA9TEbWtgFZoIPcmBfCcMFdyTnM4oGKCNoHKzBAujE+evumQgGOgbQ==
X-Received: by 2002:a17:90b:4a92:b0:1ed:5294:49b4 with SMTP id
 lp18-20020a17090b4a9200b001ed529449b4mr48602841pjb.127.1657095882204; 
 Wed, 06 Jul 2022 01:24:42 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 t17-20020a170902e85100b00162529828aesm25199256plg.109.2022.07.06.01.24.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jul 2022 01:24:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v5 10/45] target/arm: Mark string/histo/crypto as non-streaming
Date: Wed,  6 Jul 2022 13:53:36 +0530
Message-Id: <20220706082411.1664825-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220706082411.1664825-1-richard.henderson@linaro.org>
References: <20220706082411.1664825-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
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

Mark these as non-streaming instructions, which should trap
if full a64 support is not enabled in streaming mode.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sme-fa64.decode |  1 -
 target/arm/translate-sve.c | 35 ++++++++++++++++++-----------------
 2 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/target/arm/sme-fa64.decode b/target/arm/sme-fa64.decode
index 3260ea2d64..fe462d2ccc 100644
--- a/target/arm/sme-fa64.decode
+++ b/target/arm/sme-fa64.decode
@@ -59,7 +59,6 @@ FAIL    0001 1110 0111 1110 0000 00-- ---- ----   # FJCVTZS
 #       --11 1100 --1- ---- ---- ---- ---- --10   # Load/store FP register (register offset)
 #       --11 1101 ---- ---- ---- ---- ---- ----   # Load/store FP register (scaled imm)
 
-FAIL    0100 0101 --1- ---- 1--- ---- ---- ----   # SVE2 string/histo/crypto instructions
 FAIL    1000 010- -00- ---- 10-- ---- ---- ----   # SVE2 32-bit gather NT load (vector+scalar)
 FAIL    1000 010- -00- ---- 111- ---- ---- ----   # SVE 32-bit gather prefetch (vector+imm)
 FAIL    1000 0100 0-1- ---- 0--- ---- ---- ----   # SVE 32-bit gather prefetch (scalar+vector)
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 9bbf44f008..f8e0716474 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -7110,21 +7110,21 @@ DO_SVE2_ZZZ_NARROW(RSUBHNT, rsubhnt)
 static gen_helper_gvec_flags_4 * const match_fns[4] = {
     gen_helper_sve2_match_ppzz_b, gen_helper_sve2_match_ppzz_h, NULL, NULL
 };
-TRANS_FEAT(MATCH, aa64_sve2, do_ppzz_flags, a, match_fns[a->esz])
+TRANS_FEAT_NONSTREAMING(MATCH, aa64_sve2, do_ppzz_flags, a, match_fns[a->esz])
 
 static gen_helper_gvec_flags_4 * const nmatch_fns[4] = {
     gen_helper_sve2_nmatch_ppzz_b, gen_helper_sve2_nmatch_ppzz_h, NULL, NULL
 };
-TRANS_FEAT(NMATCH, aa64_sve2, do_ppzz_flags, a, nmatch_fns[a->esz])
+TRANS_FEAT_NONSTREAMING(NMATCH, aa64_sve2, do_ppzz_flags, a, nmatch_fns[a->esz])
 
 static gen_helper_gvec_4 * const histcnt_fns[4] = {
     NULL, NULL, gen_helper_sve2_histcnt_s, gen_helper_sve2_histcnt_d
 };
-TRANS_FEAT(HISTCNT, aa64_sve2, gen_gvec_ool_arg_zpzz,
-           histcnt_fns[a->esz], a, 0)
+TRANS_FEAT_NONSTREAMING(HISTCNT, aa64_sve2, gen_gvec_ool_arg_zpzz,
+                        histcnt_fns[a->esz], a, 0)
 
-TRANS_FEAT(HISTSEG, aa64_sve2, gen_gvec_ool_arg_zzz,
-           a->esz == 0 ? gen_helper_sve2_histseg : NULL, a, 0)
+TRANS_FEAT_NONSTREAMING(HISTSEG, aa64_sve2, gen_gvec_ool_arg_zzz,
+                        a->esz == 0 ? gen_helper_sve2_histseg : NULL, a, 0)
 
 DO_ZPZZ_FP(FADDP, aa64_sve2, sve2_faddp_zpzz)
 DO_ZPZZ_FP(FMAXNMP, aa64_sve2, sve2_fmaxnmp_zpzz)
@@ -7238,20 +7238,21 @@ TRANS_FEAT(SQRDCMLAH_zzzz, aa64_sve2, gen_gvec_ool_zzzz,
 TRANS_FEAT(USDOT_zzzz, aa64_sve_i8mm, gen_gvec_ool_arg_zzzz,
            a->esz == 2 ? gen_helper_gvec_usdot_b : NULL, a, 0)
 
-TRANS_FEAT(AESMC, aa64_sve2_aes, gen_gvec_ool_zz,
-           gen_helper_crypto_aesmc, a->rd, a->rd, a->decrypt)
+TRANS_FEAT_NONSTREAMING(AESMC, aa64_sve2_aes, gen_gvec_ool_zz,
+                        gen_helper_crypto_aesmc, a->rd, a->rd, a->decrypt)
 
-TRANS_FEAT(AESE, aa64_sve2_aes, gen_gvec_ool_arg_zzz,
-           gen_helper_crypto_aese, a, false)
-TRANS_FEAT(AESD, aa64_sve2_aes, gen_gvec_ool_arg_zzz,
-           gen_helper_crypto_aese, a, true)
+TRANS_FEAT_NONSTREAMING(AESE, aa64_sve2_aes, gen_gvec_ool_arg_zzz,
+                        gen_helper_crypto_aese, a, false)
+TRANS_FEAT_NONSTREAMING(AESD, aa64_sve2_aes, gen_gvec_ool_arg_zzz,
+                        gen_helper_crypto_aese, a, true)
 
-TRANS_FEAT(SM4E, aa64_sve2_sm4, gen_gvec_ool_arg_zzz,
-           gen_helper_crypto_sm4e, a, 0)
-TRANS_FEAT(SM4EKEY, aa64_sve2_sm4, gen_gvec_ool_arg_zzz,
-           gen_helper_crypto_sm4ekey, a, 0)
+TRANS_FEAT_NONSTREAMING(SM4E, aa64_sve2_sm4, gen_gvec_ool_arg_zzz,
+                        gen_helper_crypto_sm4e, a, 0)
+TRANS_FEAT_NONSTREAMING(SM4EKEY, aa64_sve2_sm4, gen_gvec_ool_arg_zzz,
+                        gen_helper_crypto_sm4ekey, a, 0)
 
-TRANS_FEAT(RAX1, aa64_sve2_sha3, gen_gvec_fn_arg_zzz, gen_gvec_rax1, a)
+TRANS_FEAT_NONSTREAMING(RAX1, aa64_sve2_sha3, gen_gvec_fn_arg_zzz,
+                        gen_gvec_rax1, a)
 
 TRANS_FEAT(FCVTNT_sh, aa64_sve2, gen_gvec_fpst_arg_zpz,
            gen_helper_sve2_fcvtnt_sh, a, 0, FPST_FPCR)
-- 
2.34.1


