Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85CA753679D
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 21:42:36 +0200 (CEST)
Received: from localhost ([::1]:59224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nufr1-00013V-Hl
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 15:42:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuefQ-0001et-ER
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:26:34 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:45027)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuefN-0005Il-DT
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:26:32 -0400
Received: by mail-pl1-x632.google.com with SMTP id q4so4801586plr.11
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 11:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7VHyV2eLdtRcaiX3rGCva1Xx3gPMk5WiQx2epdJ9eRg=;
 b=f4kwm5MQQIOotfZq/0u9fnFlgfKyCFe8qsNJw+8no2PKn0w4N+1fP7SAYT1fHYo3TK
 vssKuijMrGLL7TPllRLesWabxRnFidkVGWZVMSjlq14Qm+0/SWo/Y490irQur9NpP+TV
 5qQVeivrgk1uqN7AMgNqByiWwwB4m4JkrPMAZWtYB57E0aesC8VDAGbDM28xd2CV+UhK
 JH9KPhqv8AjmH8lJ6FVeQ78eceWApC+vXHMpNE1OzfHgP/Lh9XVSg1zKIqeViFXVVvcn
 j336C4GMC0aydGh7aWRR/MucnttAVA1z4ttpf/6/uegNfObaD4mn+If2W8QitRxNkn3D
 i++Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7VHyV2eLdtRcaiX3rGCva1Xx3gPMk5WiQx2epdJ9eRg=;
 b=fXhucmmUBPfblrS5UG+Dip66/P1tVwbRHjNot7nLWThO023wQxZk5gZH0zTqmoxZZE
 6QEbzBaBGkJ/7h02y2TbujOJQ7R21h8EyKaydApCMuy3TqvmJmYwP1gCD/zaTfZPtYmf
 +xzVbZ8cAbv6rSY0KjaxjiT56qMK+sBSsia0xClx+Sfa2Uw3lrGR/HnEHQdpjZfMNsY4
 WTwqvwNXb6js+pF8ALoUK7iXpZZpLixUEHmHxcVPcBUAzTk5zSZCV1n8ERccsEh4gOyt
 ZXQGfG/txyCzx9rnaNmwbLghvrmsto6aWUJ0u2ZOhM77rQeNCWqFaKbRByPepe4gt0o+
 hQbQ==
X-Gm-Message-State: AOAM532L7Yg4C90pEhiJ11Ke56fxwIo7T6XWdszt8RQLKjYFwtkAJBKl
 HsZfbJ4EfjqgltaoBvf0IgzDfwFtqWNWkA==
X-Google-Smtp-Source: ABdhPJzWCvE6hjpuitGiqtrGaJlwsE2if/nlb+6dPmduZDD+Jb/hIsjxTf3P3reuiwpjufIPAfCR2A==
X-Received: by 2002:a17:90b:4c8a:b0:1df:dedb:8bb6 with SMTP id
 my10-20020a17090b4c8a00b001dfdedb8bb6mr9828224pjb.6.1653675988017; 
 Fri, 27 May 2022 11:26:28 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 g13-20020aa7874d000000b0050dc762816fsm3781539pfo.73.2022.05.27.11.26.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:26:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 085/114] target/arm: Rename do_zzz_fp to
 gen_gvec_ool_fpst_arg_zzz
Date: Fri, 27 May 2022 11:18:38 -0700
Message-Id: <20220527181907.189259-86-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527181907.189259-1-richard.henderson@linaro.org>
References: <20220527181907.189259-1-richard.henderson@linaro.org>
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

Rename the function to match gen_gvec_ool_arg_zzz,
and move to be adjacent.  Split out gen_gvec_fpst_zzz
as a helper while we're at it.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 50 +++++++++++++++++++++++---------------
 1 file changed, 30 insertions(+), 20 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index f2939fbeb9..61bf5f5757 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -175,6 +175,35 @@ static bool gen_gvec_ool_arg_zzz(DisasContext *s, gen_helper_gvec_3 *fn,
     return gen_gvec_ool_zzz(s, fn, a->rd, a->rn, a->rm, data);
 }
 
+/* Invoke an out-of-line helper on 3 Zregs, plus float_status. */
+static bool gen_gvec_fpst_zzz(DisasContext *s, gen_helper_gvec_3_ptr *fn,
+                              int rd, int rn, int rm,
+                              int data, ARMFPStatusFlavour flavour)
+{
+    if (fn == NULL) {
+        return false;
+    }
+    if (sve_access_check(s)) {
+        unsigned vsz = vec_full_reg_size(s);
+        TCGv_ptr status = fpstatus_ptr(flavour);
+
+        tcg_gen_gvec_3_ptr(vec_full_reg_offset(s, rd),
+                           vec_full_reg_offset(s, rn),
+                           vec_full_reg_offset(s, rm),
+                           status, vsz, vsz, data, fn);
+
+        tcg_temp_free_ptr(status);
+    }
+    return true;
+}
+
+static bool gen_gvec_fpst_arg_zzz(DisasContext *s, gen_helper_gvec_3_ptr *fn,
+                                  arg_rrr_esz *a, int data)
+{
+    return gen_gvec_fpst_zzz(s, fn, a->rd, a->rn, a->rm, data,
+                             a->esz == MO_16 ? FPST_FPCR_F16 : FPST_FPCR);
+}
+
 /* Invoke an out-of-line helper on 4 Zregs. */
 static bool gen_gvec_ool_zzzz(DisasContext *s, gen_helper_gvec_4 *fn,
                               int rd, int rn, int rm, int ra, int data)
@@ -3769,25 +3798,6 @@ static bool trans_FADDA(DisasContext *s, arg_rprr_esz *a)
  *** SVE Floating Point Arithmetic - Unpredicated Group
  */
 
-static bool do_zzz_fp(DisasContext *s, arg_rrr_esz *a,
-                      gen_helper_gvec_3_ptr *fn)
-{
-    if (fn == NULL) {
-        return false;
-    }
-    if (sve_access_check(s)) {
-        unsigned vsz = vec_full_reg_size(s);
-        TCGv_ptr status = fpstatus_ptr(a->esz == MO_16 ? FPST_FPCR_F16 : FPST_FPCR);
-        tcg_gen_gvec_3_ptr(vec_full_reg_offset(s, a->rd),
-                           vec_full_reg_offset(s, a->rn),
-                           vec_full_reg_offset(s, a->rm),
-                           status, vsz, vsz, 0, fn);
-        tcg_temp_free_ptr(status);
-    }
-    return true;
-}
-
-
 #define DO_FP3(NAME, name) \
 static bool trans_##NAME(DisasContext *s, arg_rrr_esz *a)           \
 {                                                                   \
@@ -3795,7 +3805,7 @@ static bool trans_##NAME(DisasContext *s, arg_rrr_esz *a)           \
         NULL, gen_helper_gvec_##name##_h,                           \
         gen_helper_gvec_##name##_s, gen_helper_gvec_##name##_d      \
     };                                                              \
-    return do_zzz_fp(s, a, fns[a->esz]);                            \
+    return gen_gvec_fpst_arg_zzz(s, fns[a->esz], a, 0);             \
 }
 
 DO_FP3(FADD_zzz, fadd)
-- 
2.34.1


