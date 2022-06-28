Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A88BF55BE32
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 06:32:49 +0200 (CEST)
Received: from localhost ([::1]:42472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o62u8-0000JA-OV
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 00:32:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o62jR-0001VW-0e
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:21:45 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:51719)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o62jO-0003g2-Dn
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:21:44 -0400
Received: by mail-pj1-x102a.google.com with SMTP id l2so10192691pjf.1
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 21:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SksqHNC/l5yANeknCXnVaq3xFh4B6hnCEdNlTHjrkLE=;
 b=j4S5+zkenHHxqZGQczeQSz/c/aCaKpjxjusfdX+FeL79pSwkrG+T8Im82Ua2LX4aJj
 qhrje18BiWb7HBenSuhMtOliiAQ42aPxwn2X0NWE+M42wPEuxhcO1qcWTmC1LIEV2caC
 KQ+D0qfx9D8cxcwDZaSc9Q/+M3GcrTayzd2IkgjOsZz9z55km7SHuZqgmL6739HPgs3f
 /ZHzxwqUYKAfli6kByERe2mmYVE4HN6LM5MuiwBOXYw3WwbGp94ABVTuuNrG8d4znyBv
 EQqJjYo8ppur75LT3jT5nfyf/9Od2jtKmZ7TbGg6lZuqGqGT9YmB6y7j7Xt9CQghANJ5
 e4yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SksqHNC/l5yANeknCXnVaq3xFh4B6hnCEdNlTHjrkLE=;
 b=Z7svg/VgI/Lx72qZSoNbRUWYyImI9S6MDJ03tCFqmWQXLiHMNa5oqT9Q1eccMZ8yVm
 HIUDTJMOxPlSfbD7FrCL/Ui16eutFmbIak3WBNR3nvbRr90Whw1KlywMhbK8D7f276sC
 w8Je9MsXIBHWL86RkgZMS8Gg169m4d/veZwJZdFHIFnsNOj7YhU1qxzo8BK2FoX4SMkP
 ehe6rB5Fo6J8hh2Ajik58roKHTeXj/To/Uh/7n6amdmBuBl3desrz9Mj220JN+cmdKVB
 0tYouJb+poznV5KWru7+kkx7Bt95Fb5i9a+XQqd+EzLrxd+/2Qk+u38mOLtDJItFP6Kq
 B8+w==
X-Gm-Message-State: AJIora/apiQZeeCk23uz2HAm7ZU8flzXKZxUZxkUj2COj9JWXKc2wc0J
 dz/LRpdfz9zLJMQhJlE3xBFnCQn4DYV4lg==
X-Google-Smtp-Source: AGRyM1uSAw2gaWNIX9nYnzccDBNDI2pCWllbqneL4g7rQtRhicyiORA/E5joRf1ehNy6y1B+ftnakQ==
X-Received: by 2002:a17:90b:503:b0:1e2:f129:5135 with SMTP id
 r3-20020a17090b050300b001e2f1295135mr19321010pjz.22.1656390101040; 
 Mon, 27 Jun 2022 21:21:41 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 jg6-20020a17090326c600b0016a087cfad8sm7994929plb.264.2022.06.27.21.21.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 21:21:40 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v4 08/45] target/arm: Mark FTSMUL, FTMAD,
 FADDA as non-streaming
Date: Tue, 28 Jun 2022 09:50:40 +0530
Message-Id: <20220628042117.368549-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220628042117.368549-1-richard.henderson@linaro.org>
References: <20220628042117.368549-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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
 target/arm/sme-fa64.decode |  3 ---
 target/arm/translate-sve.c | 15 +++++++++++----
 2 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/target/arm/sme-fa64.decode b/target/arm/sme-fa64.decode
index c75a94e0fc..f6e10e4bbe 100644
--- a/target/arm/sme-fa64.decode
+++ b/target/arm/sme-fa64.decode
@@ -58,9 +58,6 @@ FAIL    1100 1110 ---- ---- ---- ---- ---- ----   # Advanced SIMD cryptography e
 #       --11 1100 --1- ---- ---- ---- ---- --10   # Load/store FP register (register offset)
 #       --11 1101 ---- ---- ---- ---- ---- ----   # Load/store FP register (scaled imm)
 
-FAIL    0110 0101 --0- ---- 0000 11-- ---- ----   # FTSMUL
-FAIL    0110 0101 --01 0--- 100- ---- ---- ----   # FTMAD
-FAIL    0110 0101 --01 1--- 001- ---- ---- ----   # FADDA
 FAIL    0100 0101 --0- ---- 1001 10-- ---- ----   # SMMLA, UMMLA, USMMLA
 FAIL    0100 0101 --1- ---- 1--- ---- ---- ----   # SVE2 string/histo/crypto instructions
 FAIL    1000 010- -00- ---- 10-- ---- ---- ----   # SVE2 32-bit gather NT load (vector+scalar)
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 130432654e..9d0a89215c 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -3861,9 +3861,9 @@ static gen_helper_gvec_3_ptr * const ftmad_fns[4] = {
     NULL,                   gen_helper_sve_ftmad_h,
     gen_helper_sve_ftmad_s, gen_helper_sve_ftmad_d,
 };
-TRANS_FEAT(FTMAD, aa64_sve, gen_gvec_fpst_zzz,
-           ftmad_fns[a->esz], a->rd, a->rn, a->rm, a->imm,
-           a->esz == MO_16 ? FPST_FPCR_F16 : FPST_FPCR)
+TRANS_FEAT_NONSTREAMING(FTMAD, aa64_sve, gen_gvec_fpst_zzz,
+                        ftmad_fns[a->esz], a->rd, a->rn, a->rm, a->imm,
+                        a->esz == MO_16 ? FPST_FPCR_F16 : FPST_FPCR)
 
 /*
  *** SVE Floating Point Accumulating Reduction Group
@@ -3886,6 +3886,7 @@ static bool trans_FADDA(DisasContext *s, arg_rprr_esz *a)
     if (a->esz == 0 || !dc_isar_feature(aa64_sve, s)) {
         return false;
     }
+    s->is_nonstreaming = true;
     if (!sve_access_check(s)) {
         return true;
     }
@@ -3923,12 +3924,18 @@ static bool trans_FADDA(DisasContext *s, arg_rprr_esz *a)
 DO_FP3(FADD_zzz, fadd)
 DO_FP3(FSUB_zzz, fsub)
 DO_FP3(FMUL_zzz, fmul)
-DO_FP3(FTSMUL, ftsmul)
 DO_FP3(FRECPS, recps)
 DO_FP3(FRSQRTS, rsqrts)
 
 #undef DO_FP3
 
+static gen_helper_gvec_3_ptr * const ftsmul_fns[4] = {
+    NULL,                     gen_helper_gvec_ftsmul_h,
+    gen_helper_gvec_ftsmul_s, gen_helper_gvec_ftsmul_d
+};
+TRANS_FEAT_NONSTREAMING(FTSMUL, aa64_sve, gen_gvec_fpst_arg_zzz,
+                        ftsmul_fns[a->esz], a, 0)
+
 /*
  *** SVE Floating Point Arithmetic - Predicated Group
  */
-- 
2.34.1


