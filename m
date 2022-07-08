Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C85256BCDE
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jul 2022 17:24:38 +0200 (CEST)
Received: from localhost ([::1]:39294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9pqP-0001De-FM
	for lists+qemu-devel@lfdr.de; Fri, 08 Jul 2022 11:24:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9piC-0002Cs-4e
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 11:16:08 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:37718)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9piA-00027j-Il
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 11:16:07 -0400
Received: by mail-pf1-x42c.google.com with SMTP id w185so20054379pfb.4
 for <qemu-devel@nongnu.org>; Fri, 08 Jul 2022 08:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hqPebj8e+A/slNwJFXKTlqvHw3rlOVkEOFZ7HeJe4nE=;
 b=kXgJ9LljZCm79DFXUXbuhkRulo8yv+p8i3+9PHDQv6J0cHJIJV4ExvhaI2on95XwVx
 Yfuly0cxUh9SOzHGYIXeCqLPSqgIX2di/iR2yn52keYIIbUfaKthCZXbnd/LNXlSySwI
 qSeXA8WOBRyXq4qHNJ7Nw51p1gQVvzgkjQ2Qe97HjD4U4z1bH2B54gWq6jCXJJ61Gw8T
 pGdTMDio/RkCcXPIDqECMPIj4E5XKZzJHKDHnAxnKcXP1S0UE0on0XMfOnZS2PsanNtG
 bPNKB8QwUgjIT08+EvMgmv88h3KzTny4mS3JK70ILoRbVHvpyXOJiK5owhoRaCOR1udU
 gVNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hqPebj8e+A/slNwJFXKTlqvHw3rlOVkEOFZ7HeJe4nE=;
 b=JEmNOaQDXoxT9oZbHP+4pmctiu5B2Vl+kTedkZK9oiP9aOSit5tKdbBDL3Xd4wR91m
 m/C7AKDz3kOQYSIMiVRyTpVqfE8wDDiFBn4S/VhLk1CWjE0W1jAePWaH0eht+cdNkMjb
 pa/Q4mROhNIIOMDJ2ZVk+aSspRIfWb29hgFDttL15Sossyg9z8PbrHBxTk3AUfDZz+FZ
 pVl+ILcFu0tSuUfnHKoS3B4aWPfFqJqn3qjrPiT21Tlx8cbrToanUdcDevv+uXd6vw+a
 9EMFksX+TzMdQwLSnwwk4preY+gAyrN/gqC6uxqbHaK+GT58eFVOMZATSITQ/lnRjduV
 0BVQ==
X-Gm-Message-State: AJIora9CmmwqzNhh9ZfzuCx3FnAcEf9mI9pBVnkN7jykIvmJ1IxWRjkd
 o5UTGF8pDBzPvppk7iGWH7fEUCCcp5maCwUW
X-Google-Smtp-Source: AGRyM1uWqDt4uZ+y+i3b/StG5sO5CP3NHBjpuyW1ihj+8JFJL5azmEgX9xVBXltx4Cm0vR240h0FXg==
X-Received: by 2002:a63:150:0:b0:412:acfc:b6bf with SMTP id
 77-20020a630150000000b00412acfcb6bfmr3742308pgb.377.1657293365192; 
 Fri, 08 Jul 2022 08:16:05 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 n17-20020a056a0007d100b0051bada81bc7sm29085774pfu.161.2022.07.08.08.16.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jul 2022 08:16:04 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v6 06/45] target/arm: Mark BDEP, BEXT, BGRP, COMPACT, FEXPA,
 FTSSEL as non-streaming
Date: Fri,  8 Jul 2022 20:45:01 +0530
Message-Id: <20220708151540.18136-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220708151540.18136-1-richard.henderson@linaro.org>
References: <20220708151540.18136-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
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
 target/arm/sme-fa64.decode |  3 ---
 target/arm/translate-sve.c | 22 ++++++++++++----------
 2 files changed, 12 insertions(+), 13 deletions(-)

diff --git a/target/arm/sme-fa64.decode b/target/arm/sme-fa64.decode
index fa2b5cbf1a..4f515939d9 100644
--- a/target/arm/sme-fa64.decode
+++ b/target/arm/sme-fa64.decode
@@ -59,9 +59,6 @@ FAIL    0001 1110 0111 1110 0000 00-- ---- ----   # FJCVTZS
 #       --11 1100 --1- ---- ---- ---- ---- --10   # Load/store FP register (register offset)
 #       --11 1101 ---- ---- ---- ---- ---- ----   # Load/store FP register (scaled imm)
 
-FAIL    0000 0100 --1- ---- 1011 -0-- ---- ----   # FTSSEL, FEXPA
-FAIL    0000 0101 --10 0001 100- ---- ---- ----   # COMPACT
-FAIL    0100 0101 --0- ---- 1011 ---- ---- ----   # BDEP, BEXT, BGRP
 FAIL    0100 0101 000- ---- 0110 1--- ---- ----   # PMULLB, PMULLT (128b result)
 FAIL    0110 0100 --1- ---- 1110 01-- ---- ----   # FMMLA, BFMMLA
 FAIL    0110 0101 --0- ---- 0000 11-- ---- ----   # FTSMUL
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index d6faec15fe..ae48040aa4 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -1333,14 +1333,15 @@ static gen_helper_gvec_2 * const fexpa_fns[4] = {
     NULL,                   gen_helper_sve_fexpa_h,
     gen_helper_sve_fexpa_s, gen_helper_sve_fexpa_d,
 };
-TRANS_FEAT(FEXPA, aa64_sve, gen_gvec_ool_zz,
-           fexpa_fns[a->esz], a->rd, a->rn, 0)
+TRANS_FEAT_NONSTREAMING(FEXPA, aa64_sve, gen_gvec_ool_zz,
+                        fexpa_fns[a->esz], a->rd, a->rn, 0)
 
 static gen_helper_gvec_3 * const ftssel_fns[4] = {
     NULL,                    gen_helper_sve_ftssel_h,
     gen_helper_sve_ftssel_s, gen_helper_sve_ftssel_d,
 };
-TRANS_FEAT(FTSSEL, aa64_sve, gen_gvec_ool_arg_zzz, ftssel_fns[a->esz], a, 0)
+TRANS_FEAT_NONSTREAMING(FTSSEL, aa64_sve, gen_gvec_ool_arg_zzz,
+                        ftssel_fns[a->esz], a, 0)
 
 /*
  *** SVE Predicate Logical Operations Group
@@ -2536,7 +2537,8 @@ TRANS_FEAT(TRN2_q, aa64_sve_f64mm, gen_gvec_ool_arg_zzz,
 static gen_helper_gvec_3 * const compact_fns[4] = {
     NULL, NULL, gen_helper_sve_compact_s, gen_helper_sve_compact_d
 };
-TRANS_FEAT(COMPACT, aa64_sve, gen_gvec_ool_arg_zpz, compact_fns[a->esz], a, 0)
+TRANS_FEAT_NONSTREAMING(COMPACT, aa64_sve, gen_gvec_ool_arg_zpz,
+                        compact_fns[a->esz], a, 0)
 
 /* Call the helper that computes the ARM LastActiveElement pseudocode
  * function, scaled by the element size.  This includes the not found
@@ -6374,22 +6376,22 @@ static gen_helper_gvec_3 * const bext_fns[4] = {
     gen_helper_sve2_bext_b, gen_helper_sve2_bext_h,
     gen_helper_sve2_bext_s, gen_helper_sve2_bext_d,
 };
-TRANS_FEAT(BEXT, aa64_sve2_bitperm, gen_gvec_ool_arg_zzz,
-           bext_fns[a->esz], a, 0)
+TRANS_FEAT_NONSTREAMING(BEXT, aa64_sve2_bitperm, gen_gvec_ool_arg_zzz,
+                        bext_fns[a->esz], a, 0)
 
 static gen_helper_gvec_3 * const bdep_fns[4] = {
     gen_helper_sve2_bdep_b, gen_helper_sve2_bdep_h,
     gen_helper_sve2_bdep_s, gen_helper_sve2_bdep_d,
 };
-TRANS_FEAT(BDEP, aa64_sve2_bitperm, gen_gvec_ool_arg_zzz,
-           bdep_fns[a->esz], a, 0)
+TRANS_FEAT_NONSTREAMING(BDEP, aa64_sve2_bitperm, gen_gvec_ool_arg_zzz,
+                        bdep_fns[a->esz], a, 0)
 
 static gen_helper_gvec_3 * const bgrp_fns[4] = {
     gen_helper_sve2_bgrp_b, gen_helper_sve2_bgrp_h,
     gen_helper_sve2_bgrp_s, gen_helper_sve2_bgrp_d,
 };
-TRANS_FEAT(BGRP, aa64_sve2_bitperm, gen_gvec_ool_arg_zzz,
-           bgrp_fns[a->esz], a, 0)
+TRANS_FEAT_NONSTREAMING(BGRP, aa64_sve2_bitperm, gen_gvec_ool_arg_zzz,
+                        bgrp_fns[a->esz], a, 0)
 
 static gen_helper_gvec_3 * const cadd_fns[4] = {
     gen_helper_sve2_cadd_b, gen_helper_sve2_cadd_h,
-- 
2.34.1


