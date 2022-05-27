Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D24E536744
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 20:58:01 +0200 (CEST)
Received: from localhost ([::1]:40946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuf9q-0002cc-Gl
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 14:58:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueYk-0007Qm-8k
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:19:38 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:39697)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueYf-0003du-Py
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:19:37 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 x2-20020a17090a1f8200b001e07a64c461so7781650pja.4
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 11:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0QyNrMvq6M6y5ny2/+zXbyIdf7AY/rWFnZiDdpANfvM=;
 b=WfNkvtHZda9qvlLLepJNU2SUe9CgWPbzHtipZ7s/Bnejju+daFJAVgMsjFNMueBk4S
 VUkZIg7hS2WYYW8W7sQER4E5MmH1Nq7s3OB0/SVZbwsZ2euez4lHt5ZxRepVKFYUJMkk
 054J48dP6rmkaTraT3rEQDgxFCZK3WH5yitgbLygCrQ6M2+z+yP5lNG8hA+Y5MI2MC58
 Z7ku3RSlNkc/lS5mq0UdP/mV9MMGLtTw/3J6wGwQvYJ0G/QdTARd2+HmxTO04boN7Zyr
 Y8fbaHe+8lBp8pJ7m/kFc2RrZPk13kL1rfUBFiu64H4o45X4CRP+x0wITeRna+MR46TS
 MmnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0QyNrMvq6M6y5ny2/+zXbyIdf7AY/rWFnZiDdpANfvM=;
 b=pjqGcjXU+QAxssqTeYavrO+QsltFGl4+b+pMnurO1+SlXatWY2Z7WtI4JuoRFcgFp0
 nb98WAULbvypWfLDmoybJICPZoxSTyvByGbk8iVAhRXVm8phkHk0jSB+7gl6ljnvyzwf
 rZIsTC5umbRPfhh5Njo63M3rMScsEWdA3CZ2q0qigNHeJty4uw9q31MpM8rG9eL1UbUh
 pAcdllqQUwkAKN3IVNBtZqFhu7NT+YRHjlPVLtqa6YZm49oKMH1iSdgPaWgmaMbi06Vr
 jmHMMLEINPetJRgwo1IS8Toc3/P/KvOEJRNQQm/U61NqoZFZX2w/gc/AE+HNmYnG40O1
 TEIQ==
X-Gm-Message-State: AOAM530gT/R2KKXsfW0r+JAXLUXF/xa6rRWPyGr3XSFBUAv6fWag2rhs
 GxCHxYAFx5e52RDw3wRJ3Pk3Dyfg6Nvv+g==
X-Google-Smtp-Source: ABdhPJzUTbPbYuUXEBn1bcK2dlPlq0HcZCugAZzUYtepV5xZ4UYMs2lT8Z55k0xo4p1vHtq8u8wATg==
X-Received: by 2002:a17:90a:d3d4:b0:1e0:a6a7:6ef with SMTP id
 d20-20020a17090ad3d400b001e0a6a706efmr9707196pjw.17.1653675572525; 
 Fri, 27 May 2022 11:19:32 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 t5-20020a17090ae50500b001deb3cbd8f1sm1911612pjy.27.2022.05.27.11.19.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:19:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 025/114] target/arm: Move null function and sve check into
 gen_gvec_ool_zzzp
Date: Fri, 27 May 2022 11:17:38 -0700
Message-Id: <20220527181907.189259-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527181907.189259-1-richard.henderson@linaro.org>
References: <20220527181907.189259-1-richard.henderson@linaro.org>
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
 target/arm/translate-sve.c | 42 ++++++++++++++++----------------------
 1 file changed, 18 insertions(+), 24 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 10614bf915..fea7164d72 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -235,15 +235,21 @@ static bool gen_gvec_ool_arg_zpzi(DisasContext *s, gen_helper_gvec_3 *fn,
 }
 
 /* Invoke an out-of-line helper on 3 Zregs and a predicate. */
-static void gen_gvec_ool_zzzp(DisasContext *s, gen_helper_gvec_4 *fn,
+static bool gen_gvec_ool_zzzp(DisasContext *s, gen_helper_gvec_4 *fn,
                               int rd, int rn, int rm, int pg, int data)
 {
-    unsigned vsz = vec_full_reg_size(s);
-    tcg_gen_gvec_4_ool(vec_full_reg_offset(s, rd),
-                       vec_full_reg_offset(s, rn),
-                       vec_full_reg_offset(s, rm),
-                       pred_full_reg_offset(s, pg),
-                       vsz, vsz, data, fn);
+    if (fn == NULL) {
+        return false;
+    }
+    if (sve_access_check(s)) {
+        unsigned vsz = vec_full_reg_size(s);
+        tcg_gen_gvec_4_ool(vec_full_reg_offset(s, rd),
+                           vec_full_reg_offset(s, rn),
+                           vec_full_reg_offset(s, rm),
+                           pred_full_reg_offset(s, pg),
+                           vsz, vsz, data, fn);
+    }
+    return true;
 }
 
 /* Invoke a vector expander on two Zregs.  */
@@ -733,13 +739,7 @@ static bool trans_UQSUB_zzz(DisasContext *s, arg_rrr_esz *a)
 
 static bool do_zpzz_ool(DisasContext *s, arg_rprr_esz *a, gen_helper_gvec_4 *fn)
 {
-    if (fn == NULL) {
-        return false;
-    }
-    if (sve_access_check(s)) {
-        gen_gvec_ool_zzzp(s, fn, a->rd, a->rn, a->rm, a->pg, 0);
-    }
-    return true;
+    return gen_gvec_ool_zzzp(s, fn, a->rd, a->rn, a->rm, a->pg, 0);
 }
 
 /* Select active elememnts from Zn and inactive elements from Zm,
@@ -2950,11 +2950,8 @@ TRANS_FEAT(REVW, aa64_sve, gen_gvec_ool_arg_zpz,
 
 static bool trans_SPLICE(DisasContext *s, arg_rprr_esz *a)
 {
-    if (sve_access_check(s)) {
-        gen_gvec_ool_zzzp(s, gen_helper_sve_splice,
-                          a->rd, a->rn, a->rm, a->pg, a->esz);
-    }
-    return true;
+    return gen_gvec_ool_zzzp(s, gen_helper_sve_splice,
+                             a->rd, a->rn, a->rm, a->pg, a->esz);
 }
 
 static bool trans_SPLICE_sve2(DisasContext *s, arg_rpr_esz *a)
@@ -2962,11 +2959,8 @@ static bool trans_SPLICE_sve2(DisasContext *s, arg_rpr_esz *a)
     if (!dc_isar_feature(aa64_sve2, s)) {
         return false;
     }
-    if (sve_access_check(s)) {
-        gen_gvec_ool_zzzp(s, gen_helper_sve_splice,
-                          a->rd, a->rn, (a->rn + 1) % 32, a->pg, a->esz);
-    }
-    return true;
+    return gen_gvec_ool_zzzp(s, gen_helper_sve_splice,
+                             a->rd, a->rn, (a->rn + 1) % 32, a->pg, a->esz);
 }
 
 /*
-- 
2.34.1


