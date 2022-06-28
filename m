Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CF5955BE34
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 06:33:54 +0200 (CEST)
Received: from localhost ([::1]:44560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o62vB-0001qD-EH
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 00:33:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o62jO-0001Ti-9Y
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:21:43 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:43813)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o62jM-0003fe-3F
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:21:41 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 dw10-20020a17090b094a00b001ed00a16eb4so11432400pjb.2
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 21:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2QmVLtbyxFuao4V1znU2cRG0WtNL/n+crCqH//cwECY=;
 b=QAHVBfyxYinr1OKMHpdZIu3Jmf9BNDUYbrVCkbdHleuEC/eMGrCBN6zN8x6vazhrU1
 AP/oniKlxOegD4z6D6RZ+aOJscJYqtNqj3BpMmg/YbZqGQgg3aL5A4RvrJR3I/BBFJDy
 bev/+DHMkqcwdqOpmf9sL7mZohmkMTY5Ip4y5gluOHRjyNSjaME9eiGzsESAohIudUx/
 GznGeoAdvpyr1c0e3SKxqxgvQ2YlXCSZ81EZwsctrgwZK4vtR9MvXKm/mAHeRf2k1Nf4
 WMbHF1/cqjf2wqBljsSum1CjDgT4N1EWYP/0NYq6NE7Puj8uh+A42Avrv20CkaW0jroz
 2dNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2QmVLtbyxFuao4V1znU2cRG0WtNL/n+crCqH//cwECY=;
 b=bv0rAvHGqp0yik/cUJo/HHkF20+85W/JP0Sq1XS9EndsFbxk/R/we8VWQzQOex2qMm
 PdXXxhZmwtIrI2SkFd6k+NsDV9BbAvtLLl+Hg08tjuglcX061C1svMwq8F81YT7nXuCL
 juNiPWjq0C51uhRBhq/qEUOgs1lnMqf6I+kXu23AWKJ1Ttx4/nHcAxovIkPCquwhh9Py
 vWPd7Tk4NYSzIawSWsjT5WrglGp9xSbo9nBliEp1Qyh2IK/fofBJ7hU3L9jR70jvmpN1
 pm74X3+T5TYNQg2lzHfoMRWjILtupZRN3PJCQcoU/Xq6uT8QJQNuq0PqkMm0MrC6OJzG
 6/Ug==
X-Gm-Message-State: AJIora+K/SatU/vCmPSan6/Qf9Zno42isXjDYW0TkOwRh0YP1MNWob/V
 SNHX/bmuWFcjM8WNIyhwjiEjLGNM7ZExAA==
X-Google-Smtp-Source: AGRyM1sa7ZaL4x2Wy5oTxzKUmhbza8omRoaZY++CQ2a/QPEjyXT6NRcScqygubFQjFOiXG/j0mjwWQ==
X-Received: by 2002:a17:902:ef92:b0:16a:1ef1:22db with SMTP id
 iz18-20020a170902ef9200b0016a1ef122dbmr1653841plb.2.1656390098754; 
 Mon, 27 Jun 2022 21:21:38 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 jg6-20020a17090326c600b0016a087cfad8sm7994929plb.264.2022.06.27.21.21.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 21:21:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v4 07/45] target/arm: Mark PMULL, FMMLA as non-streaming
Date: Tue, 28 Jun 2022 09:50:39 +0530
Message-Id: <20220628042117.368549-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220628042117.368549-1-richard.henderson@linaro.org>
References: <20220628042117.368549-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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
 target/arm/sme-fa64.decode |  2 --
 target/arm/translate-sve.c | 18 ++++++++++--------
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/target/arm/sme-fa64.decode b/target/arm/sme-fa64.decode
index c25bad5ee5..c75a94e0fc 100644
--- a/target/arm/sme-fa64.decode
+++ b/target/arm/sme-fa64.decode
@@ -58,8 +58,6 @@ FAIL    1100 1110 ---- ---- ---- ---- ---- ----   # Advanced SIMD cryptography e
 #       --11 1100 --1- ---- ---- ---- ---- --10   # Load/store FP register (register offset)
 #       --11 1101 ---- ---- ---- ---- ---- ----   # Load/store FP register (scaled imm)
 
-FAIL    0100 0101 000- ---- 0110 1--- ---- ----   # PMULLB, PMULLT (128b result)
-FAIL    0110 0100 --1- ---- 1110 01-- ---- ----   # FMMLA, BFMMLA
 FAIL    0110 0101 --0- ---- 0000 11-- ---- ----   # FTSMUL
 FAIL    0110 0101 --01 0--- 100- ---- ---- ----   # FTMAD
 FAIL    0110 0101 --01 1--- 001- ---- ---- ----   # FADDA
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index ae48040aa4..130432654e 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -6194,8 +6194,8 @@ static bool do_trans_pmull(DisasContext *s, arg_rrr_esz *a, bool sel)
     return gen_gvec_ool_arg_zzz(s, fns[a->esz], a, sel);
 }
 
-TRANS_FEAT(PMULLB, aa64_sve2, do_trans_pmull, a, false)
-TRANS_FEAT(PMULLT, aa64_sve2, do_trans_pmull, a, true)
+TRANS_FEAT_NONSTREAMING(PMULLB, aa64_sve2, do_trans_pmull, a, false)
+TRANS_FEAT_NONSTREAMING(PMULLT, aa64_sve2, do_trans_pmull, a, true)
 
 static gen_helper_gvec_3 * const saddw_fns[4] = {
     NULL,                    gen_helper_sve2_saddw_h,
@@ -7125,10 +7125,12 @@ DO_ZPZZ_FP(FMINP, aa64_sve2, sve2_fminp_zpzz)
  * SVE Integer Multiply-Add (unpredicated)
  */
 
-TRANS_FEAT(FMMLA_s, aa64_sve_f32mm, gen_gvec_fpst_zzzz, gen_helper_fmmla_s,
-           a->rd, a->rn, a->rm, a->ra, 0, FPST_FPCR)
-TRANS_FEAT(FMMLA_d, aa64_sve_f64mm, gen_gvec_fpst_zzzz, gen_helper_fmmla_d,
-           a->rd, a->rn, a->rm, a->ra, 0, FPST_FPCR)
+TRANS_FEAT_NONSTREAMING(FMMLA_s, aa64_sve_f32mm, gen_gvec_fpst_zzzz,
+                        gen_helper_fmmla_s, a->rd, a->rn, a->rm, a->ra,
+                        0, FPST_FPCR)
+TRANS_FEAT_NONSTREAMING(FMMLA_d, aa64_sve_f64mm, gen_gvec_fpst_zzzz,
+                        gen_helper_fmmla_d, a->rd, a->rn, a->rm, a->ra,
+                        0, FPST_FPCR)
 
 static gen_helper_gvec_4 * const sqdmlal_zzzw_fns[] = {
     NULL,                           gen_helper_sve2_sqdmlal_zzzw_h,
@@ -7301,8 +7303,8 @@ TRANS_FEAT(BFDOT_zzzz, aa64_sve_bf16, gen_gvec_ool_arg_zzzz,
 TRANS_FEAT(BFDOT_zzxz, aa64_sve_bf16, gen_gvec_ool_arg_zzxz,
            gen_helper_gvec_bfdot_idx, a)
 
-TRANS_FEAT(BFMMLA, aa64_sve_bf16, gen_gvec_ool_arg_zzzz,
-           gen_helper_gvec_bfmmla, a, 0)
+TRANS_FEAT_NONSTREAMING(BFMMLA, aa64_sve_bf16, gen_gvec_ool_arg_zzzz,
+                        gen_helper_gvec_bfmmla, a, 0)
 
 static bool do_BFMLAL_zzzw(DisasContext *s, arg_rrrr_esz *a, bool sel)
 {
-- 
2.34.1


