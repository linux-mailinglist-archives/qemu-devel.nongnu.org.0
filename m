Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B845367EF
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 22:14:32 +0200 (CEST)
Received: from localhost ([::1]:56302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nugLv-0000Ls-Gc
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 16:14:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuefj-0001zl-IK
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:26:53 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:43567)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuefd-0005OC-JI
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:26:50 -0400
Received: by mail-pl1-x632.google.com with SMTP id b5so4800913plx.10
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 11:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UQINzpTkLLA9ZKpu/siuyfQPd8Itx/UPUXCrJ15GNLc=;
 b=YP1KLr4q131cTI9ltXvhV9uF7FPK5Y4q9sKEmZ+7uigx81eipW9mYgi+jgxukp5TTJ
 L/RQOnPtHEaLhUG1DIzDXzKHQiTOfO+93Ht9+H0jQp24dhAAK65In5OCAA5E1Rj/gk/a
 7TaievATNgXZYEjTqL9fvO917AeJGWYU9MaNmQ9bnorNq2posWlQg1iEq+2u6CT/dA2A
 nKMysJtmEoIKlJKukozAHm+gaef6CjRgUefstIXlbbPaeBrBSlOxVfikFwMJLg+nBuNS
 KtQfpNENfnX/YmlHtLW1K905o1OGOXdWA6YFLcyHs2Vxg6Zx0AfTBYHmiKD48usoCtC0
 pZeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UQINzpTkLLA9ZKpu/siuyfQPd8Itx/UPUXCrJ15GNLc=;
 b=LvcY8KOK8sBZnuPWwf6oVjJoPVzzZbiZ1Ygu612Esgtnh7h7Bew8U3N8fbcSLEmyiy
 dJJh2iurgOJmLDrIYhG5J7agf1lQOIqqXNdcz+wcaO9UraWMTVOVwRGn4HO6dDHv1FyW
 J9iBWOmKJjKqxGtgPfEa9ZL+zD3lTV0W4yF+jWlfLIKODePiFY4GqRkPTYOHooh97rm0
 XqoZgVIWc7YZ6sxxA+M2kr0Dvx6MKx4MqwUKpDyOZl1/fR0RlvgOGmdGHiZUN5KmeCnV
 7snbe23+XecCW8RZgz9yBmD2alBze1cyWaP1/H8Z/e7i9CXiQvjsqTpilqd6BEGPDnxt
 Tnxw==
X-Gm-Message-State: AOAM532u/RemK1WP3PU24l4Ed18VFvrHQBNQIRKAmilPo3djEIogIXT1
 jHK1yv2Pk4FATUDT48yFBMvVhEgtZLmQbQ==
X-Google-Smtp-Source: ABdhPJyeSfZN8hF/c0jNuR3tzB2k8lbMdSes+UUkumre91ocH1RTUmT/oG2V0SXUtCoRKNs9k3yyJg==
X-Received: by 2002:a17:902:d582:b0:161:c681:c326 with SMTP id
 k2-20020a170902d58200b00161c681c326mr43278653plh.84.1653676003410; 
 Fri, 27 May 2022 11:26:43 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 g13-20020aa7874d000000b0050dc762816fsm3781539pfo.73.2022.05.27.11.26.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:26:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 101/114] target/arm: Introduce gen_gvec_fpst_zzzzp
Date: Fri, 27 May 2022 11:18:54 -0700
Message-Id: <20220527181907.189259-102-richard.henderson@linaro.org>
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 59 +++++++++++++++++++-------------------
 1 file changed, 29 insertions(+), 30 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index e323b2d6d5..8f50956d3b 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -289,6 +289,30 @@ static bool gen_gvec_fpst_zzzz(DisasContext *s, gen_helper_gvec_4_ptr *fn,
     return ret;
 }
 
+/* Invoke an out-of-line helper on 4 Zregs, 1 Preg, plus fpst. */
+static bool gen_gvec_fpst_zzzzp(DisasContext *s, gen_helper_gvec_5_ptr *fn,
+                                int rd, int rn, int rm, int ra, int pg,
+                                int data, ARMFPStatusFlavour flavour)
+{
+    if (fn == NULL) {
+        return false;
+    }
+    if (sve_access_check(s)) {
+        unsigned vsz = vec_full_reg_size(s);
+        TCGv_ptr status = fpstatus_ptr(flavour);
+
+        tcg_gen_gvec_5_ptr(vec_full_reg_offset(s, rd),
+                           vec_full_reg_offset(s, rn),
+                           vec_full_reg_offset(s, rm),
+                           vec_full_reg_offset(s, ra),
+                           pred_full_reg_offset(s, pg),
+                           status, vsz, vsz, data, fn);
+
+        tcg_temp_free_ptr(status);
+    }
+    return true;
+}
+
 /* Invoke an out-of-line helper on 2 Zregs and a predicate. */
 static bool gen_gvec_ool_zzp(DisasContext *s, gen_helper_gvec_3 *fn,
                              int rd, int rn, int pg, int data)
@@ -3977,21 +4001,8 @@ TRANS_FEAT(FCADD, aa64_sve, gen_gvec_fpst_zzzp, fcadd_fns[a->esz],
 static bool do_fmla(DisasContext *s, arg_rprrr_esz *a,
                     gen_helper_gvec_5_ptr *fn)
 {
-    if (a->esz == 0) {
-        return false;
-    }
-    if (sve_access_check(s)) {
-        unsigned vsz = vec_full_reg_size(s);
-        TCGv_ptr status = fpstatus_ptr(a->esz == MO_16 ? FPST_FPCR_F16 : FPST_FPCR);
-        tcg_gen_gvec_5_ptr(vec_full_reg_offset(s, a->rd),
-                           vec_full_reg_offset(s, a->rn),
-                           vec_full_reg_offset(s, a->rm),
-                           vec_full_reg_offset(s, a->ra),
-                           pred_full_reg_offset(s, a->pg),
-                           status, vsz, vsz, 0, fn);
-        tcg_temp_free_ptr(status);
-    }
-    return true;
+    return gen_gvec_fpst_zzzzp(s, fn, a->rd, a->rn, a->rm, a->ra, a->pg, 0,
+                               a->esz == MO_16 ? FPST_FPCR_F16 : FPST_FPCR);
 }
 
 #define DO_FMLA(NAME, name) \
@@ -4020,21 +4031,9 @@ static bool trans_FCMLA_zpzzz(DisasContext *s, arg_FCMLA_zpzzz *a)
         gen_helper_sve_fcmla_zpzzz_d,
     };
 
-    if (a->esz == 0) {
-        return false;
-    }
-    if (sve_access_check(s)) {
-        unsigned vsz = vec_full_reg_size(s);
-        TCGv_ptr status = fpstatus_ptr(a->esz == MO_16 ? FPST_FPCR_F16 : FPST_FPCR);
-        tcg_gen_gvec_5_ptr(vec_full_reg_offset(s, a->rd),
-                           vec_full_reg_offset(s, a->rn),
-                           vec_full_reg_offset(s, a->rm),
-                           vec_full_reg_offset(s, a->ra),
-                           pred_full_reg_offset(s, a->pg),
-                           status, vsz, vsz, a->rot, fns[a->esz]);
-        tcg_temp_free_ptr(status);
-    }
-    return true;
+    return gen_gvec_fpst_zzzzp(s, fns[a->esz], a->rd, a->rn, a->rm,
+                               a->ra, a->pg, a->rot,
+                               a->esz == MO_16 ? FPST_FPCR_F16 : FPST_FPCR);
 }
 
 static bool trans_FCMLA_zzxz(DisasContext *s, arg_FCMLA_zzxz *a)
-- 
2.34.1


