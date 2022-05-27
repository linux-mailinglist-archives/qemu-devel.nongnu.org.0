Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D16053677D
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 21:30:27 +0200 (CEST)
Received: from localhost ([::1]:33792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuffG-0008Is-K2
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 15:30:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuecX-00042C-NM
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:23:33 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:37510)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuecM-0004VO-4R
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:23:33 -0400
Received: by mail-pl1-x635.google.com with SMTP id t4so1899212pld.4
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 11:23:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bkaSejNiykp7LpPG5wJu2pOvy7PO5RL7VgLGFhoRfts=;
 b=oRvnsXvsrOduUJj2k4XC+eL/WxAdJKT0RqlfCL6o5EfGEqhGg/N0AaEd7AMkby1BsF
 UaqjvisofDAR1YEKwuceMo0xu8zxBe2bbCF7PHCNlSSVAxLNdYkjDeaLa8eF1egc3Ggi
 /HnGz31YNYyDJ5U6jfXU2fto8zt6nF7oA8HQKOclHkmosvj0eU3ooBwQh5VQTKE7THve
 cs1L61fZNxIvCuYehPQgeCjHIKVMEOcOQiHXa1Ms5p46OC7C8iOqAk0sPSLzAsQz/hRG
 Bbwu/ZP2WOggLUR2Q5ghMXmK/460yClajS/khpLRBA32Ae1/siZNmUVbv8iPTpUUtF7t
 F2Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bkaSejNiykp7LpPG5wJu2pOvy7PO5RL7VgLGFhoRfts=;
 b=dxK6vXpKZkiry1pK5OXB8DxwZRR/YB9ScO0F3+BYcHbaMwmwYu5vKovTrRwiAK7Jwz
 hdRtn33ZkKy8nz/AhzstaXxGfC1Luk1hErSxX/cDknZwrv4cFijcLKOIAOCB+biaEcR9
 GwKIGhOqjP3ZBbrc+hi0+COOogm3D4fEXWVsg17M+cZTF79S2fMR1veEeRZidlPby+8W
 e5UiKeoCjx7DDwsKH5ArnATJg8/bkn1Wd+IMQWu1+dTGeRLCzKIQXZfy95FVucW4Fom+
 7Dnvj+9/zLeOvGDQmVKOBLu5eXjLA9oXReS5j56FxAuhmK75VGoKdcx3t3Phr7MYRDzY
 f/Ng==
X-Gm-Message-State: AOAM533arSFW5isZXeR88zoVZqLKjZHJIsFpBsJ8bjMxQ0ISZ584fuNv
 IFBDZA54EczAwRnzRHtWtm0ptdb0Rz5k/A==
X-Google-Smtp-Source: ABdhPJw18EsuIzbqzy09VZpLQub9SRWeaCY63uWA912T3up/AQpbdmVFqyGXp5jC8w1xECcasjHJ1w==
X-Received: by 2002:a17:902:e74b:b0:163:5f93:4f0e with SMTP id
 p11-20020a170902e74b00b001635f934f0emr13544957plf.12.1653675800192; 
 Fri, 27 May 2022 11:23:20 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 b15-20020a170903228f00b00163552a0953sm4033534plh.159.2022.05.27.11.23.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:23:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 078/114] target/arm: Use TRANS_FEAT for FMMLA
Date: Fri, 27 May 2022 11:18:31 -0700
Message-Id: <20220527181907.189259-79-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527181907.189259-1-richard.henderson@linaro.org>
References: <20220527181907.189259-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
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

Being able to specify the feature predicate in TRANS_FEAT
makes it easier to split trans_FMMLA by element size,
which also happens to simplify the decode.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sve.decode      |  7 +++----
 target/arm/translate-sve.c | 27 ++++-----------------------
 2 files changed, 7 insertions(+), 27 deletions(-)

diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 7e79198f5b..a54feb2f61 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1598,10 +1598,9 @@ SQRDCMLAH_zzzz  01000100 esz:2 0 rm:5 0011 rot:2 rn:5 rd:5  ra=%reg_movprfx
 USDOT_zzzz      01000100 .. 0 ..... 011 110 ..... .....  @rda_rn_rm
 
 ### SVE2 floating point matrix multiply accumulate
-{
-  BFMMLA        01100100 01 1 ..... 111 001 ..... .....  @rda_rn_rm_e0
-  FMMLA         01100100 .. 1 ..... 111 001 ..... .....  @rda_rn_rm
-}
+BFMMLA          01100100 01 1 ..... 111 001 ..... .....  @rda_rn_rm_e0
+FMMLA_s         01100100 10 1 ..... 111 001 ..... .....  @rda_rn_rm_e0
+FMMLA_d         01100100 11 1 ..... 111 001 ..... .....  @rda_rn_rm_e0
 
 ### SVE2 Memory Gather Load Group
 
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index a799ce3110..364e419f3e 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -7318,29 +7318,10 @@ DO_SVE2_ZPZZ_FP(FMINP, fminp)
  * SVE Integer Multiply-Add (unpredicated)
  */
 
-static bool trans_FMMLA(DisasContext *s, arg_rrrr_esz *a)
-{
-    gen_helper_gvec_4_ptr *fn;
-
-    switch (a->esz) {
-    case MO_32:
-        if (!dc_isar_feature(aa64_sve_f32mm, s)) {
-            return false;
-        }
-        fn = gen_helper_fmmla_s;
-        break;
-    case MO_64:
-        if (!dc_isar_feature(aa64_sve_f64mm, s)) {
-            return false;
-        }
-        fn = gen_helper_fmmla_d;
-        break;
-    default:
-        return false;
-    }
-
-    return gen_gvec_fpst_zzzz(s, fn, a->rd, a->rn, a->rm, a->ra, 0, FPST_FPCR);
-}
+TRANS_FEAT(FMMLA_s, aa64_sve_f32mm, gen_gvec_fpst_zzzz, gen_helper_fmmla_s,
+           a->rd, a->rn, a->rm, a->ra, 0, FPST_FPCR)
+TRANS_FEAT(FMMLA_d, aa64_sve_f64mm, gen_gvec_fpst_zzzz, gen_helper_fmmla_d,
+           a->rd, a->rn, a->rm, a->ra, 0, FPST_FPCR)
 
 static gen_helper_gvec_4 * const sqdmlal_zzzw_fns[] = {
     NULL,                           gen_helper_sve2_sqdmlal_zzzw_h,
-- 
2.34.1


