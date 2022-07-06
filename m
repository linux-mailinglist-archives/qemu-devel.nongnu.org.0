Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD328568232
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 10:57:23 +0200 (CEST)
Received: from localhost ([::1]:33452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o90qY-00080p-Ga
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 04:57:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o90Ko-0005kp-N3
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 04:24:34 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:33400)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o90Kk-0000Lh-Qi
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 04:24:33 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 j1-20020a17090aeb0100b001ef777a7befso6444925pjz.0
 for <qemu-devel@nongnu.org>; Wed, 06 Jul 2022 01:24:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pHHLspKH8W4B5YilQ8WrGPBQ+uTIDLVeEbSmBurKp7U=;
 b=Oo9DHuJfnnmzmLrvY3NJdC9VCgy5EBfaZ0G71Cnqd4YOtS5S3Ah0mUvvuxyc+aTRq0
 mmn1Cgv9zEuSRPvxTdQUZo5SZiNlbTaN+rP7y5IGJC37yCyB6e23Jp3Xe6u5PJEltoT4
 9TQVsThDooV9fzpqRtr+Hn7D9fsre1H4XeQSTYzKG9EsE1EaWqEK8LW2UzNerAf6hqxI
 6EeNvr4uSmAm25eHVphZNjuj8zoOLcv/Cz5u2AoY9k7yhFojAWZOB5zDFdYtiKkyc01t
 GdCEDMD+mbbfHLmnZ6YcefGzxq+tq0clQuNm4ZnS8rPG9CaWnF5nxoRsBzPFkhGtmZrh
 F6Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pHHLspKH8W4B5YilQ8WrGPBQ+uTIDLVeEbSmBurKp7U=;
 b=AhFDG1RHNMb72lcwVbaQNJVADEuoHOXb1tUbuvCehdot1D02/uDEnmJ53mHEqfG+b/
 yMcfg3Rkl2Dye17C6A48an/78qRE6p9dUHdliKSHR86DQbev0wP+Lo2gqgXcUAvCHedT
 8VSTcewTAIb+zaBqqQ9BGC8oABr2aqE/ozKo/J32fY8p6e/md4LoUWgd8GT+IINcTD9M
 cVeh4C+g7KKI8iLDQHRsXmWuI2y9rfBqdzzRFe/tPEMCO3x7lDSeF1Tw2Nz5PSIy2hj4
 T+3+psWU18BFR74Mjng1AVRSPhSDAPXtxv7yb1KJUp1do9oPFP4WYb0gcKkz0LyVCvkm
 wmVQ==
X-Gm-Message-State: AJIora9/tcbXOeQKM745LtAnOeoH0zX7Rxr+b1GrV96rXsZtJnA4Yx8x
 VGmIVYiJRZiHdjJavJQDC5Z7WqUSh+9D84FD
X-Google-Smtp-Source: AGRyM1uoHoACbbRBMktbb7PttHZGC6QW2chNpv6M+8BNMlOM/kFoG2A1S7Gx9WYuH7WhD3M8xvMFQQ==
X-Received: by 2002:a17:902:c948:b0:16a:58f4:c142 with SMTP id
 i8-20020a170902c94800b0016a58f4c142mr46645631pla.103.1657095869446; 
 Wed, 06 Jul 2022 01:24:29 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 t17-20020a170902e85100b00162529828aesm25199256plg.109.2022.07.06.01.24.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jul 2022 01:24:28 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v5 05/45] target/arm: Mark RDFFR, WRFFR,
 SETFFR as non-streaming
Date: Wed,  6 Jul 2022 13:53:31 +0530
Message-Id: <20220706082411.1664825-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220706082411.1664825-1-richard.henderson@linaro.org>
References: <20220706082411.1664825-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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
 target/arm/sme-fa64.decode | 2 --
 target/arm/translate-sve.c | 9 ++++++---
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/target/arm/sme-fa64.decode b/target/arm/sme-fa64.decode
index 73c71abc46..fa2b5cbf1a 100644
--- a/target/arm/sme-fa64.decode
+++ b/target/arm/sme-fa64.decode
@@ -61,8 +61,6 @@ FAIL    0001 1110 0111 1110 0000 00-- ---- ----   # FJCVTZS
 
 FAIL    0000 0100 --1- ---- 1011 -0-- ---- ----   # FTSSEL, FEXPA
 FAIL    0000 0101 --10 0001 100- ---- ---- ----   # COMPACT
-FAIL    0010 0101 --01 100- 1111 000- ---0 ----   # RDFFR, RDFFRS
-FAIL    0010 0101 --10 1--- 1001 ---- ---- ----   # WRFFR, SETFFR
 FAIL    0100 0101 --0- ---- 1011 ---- ---- ----   # BDEP, BEXT, BGRP
 FAIL    0100 0101 000- ---- 0110 1--- ---- ----   # PMULLB, PMULLT (128b result)
 FAIL    0110 0100 --1- ---- 1110 01-- ---- ----   # FMMLA, BFMMLA
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 5d1db0d3ff..d6faec15fe 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -1785,7 +1785,8 @@ static bool do_predset(DisasContext *s, int esz, int rd, int pat, bool setflag)
 TRANS_FEAT(PTRUE, aa64_sve, do_predset, a->esz, a->rd, a->pat, a->s)
 
 /* Note pat == 31 is #all, to set all elements.  */
-TRANS_FEAT(SETFFR, aa64_sve, do_predset, 0, FFR_PRED_NUM, 31, false)
+TRANS_FEAT_NONSTREAMING(SETFFR, aa64_sve,
+                        do_predset, 0, FFR_PRED_NUM, 31, false)
 
 /* Note pat == 32 is #unimp, to set no elements.  */
 TRANS_FEAT(PFALSE, aa64_sve, do_predset, 0, a->rd, 32, false)
@@ -1799,11 +1800,13 @@ static bool trans_RDFFR_p(DisasContext *s, arg_RDFFR_p *a)
         .rd = a->rd, .pg = a->pg, .s = a->s,
         .rn = FFR_PRED_NUM, .rm = FFR_PRED_NUM,
     };
+
+    s->is_nonstreaming = true;
     return trans_AND_pppp(s, &alt_a);
 }
 
-TRANS_FEAT(RDFFR, aa64_sve, do_mov_p, a->rd, FFR_PRED_NUM)
-TRANS_FEAT(WRFFR, aa64_sve, do_mov_p, FFR_PRED_NUM, a->rn)
+TRANS_FEAT_NONSTREAMING(RDFFR, aa64_sve, do_mov_p, a->rd, FFR_PRED_NUM)
+TRANS_FEAT_NONSTREAMING(WRFFR, aa64_sve, do_mov_p, FFR_PRED_NUM, a->rn)
 
 static bool do_pfirst_pnext(DisasContext *s, arg_rr_esz *a,
                             void (*gen_fn)(TCGv_i32, TCGv_ptr,
-- 
2.34.1


