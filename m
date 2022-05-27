Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D30F536789
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 21:36:23 +0200 (CEST)
Received: from localhost ([::1]:45540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nufl0-00083v-NQ
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 15:36:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuec6-0003N1-4T
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:23:06 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:44645)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuebx-0004JL-Up
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:23:04 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 pq9-20020a17090b3d8900b001df622bf81dso5018479pjb.3
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 11:22:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2WxAwM40s96Oyqh2/sR7/3CobKp3pYRH8H0LH0HfcWs=;
 b=LLDDS1DozQuRO1nrYbyf+Y1SSXNozCvqd1llitSTuMvbI2QK+Cthb09XjWGWnmHJic
 ohQiXjRMTSP9gwVYMfRtO/bUh/7zCN+ph219CQasnpxIOlC0Rf+z3dRK83N5WNXln/S0
 mutxe5GvFLka+31VyxCdltz6gHhQHk1LO5ZspDeGw/xPrI9f06n3Sk+551dOd/kvraVh
 kC0kvqEK5pzL6/sAgT+N01nI8iHaeOQFzZdp63/V5++pWjPyxw+mf9tr44oX1yPnnXk0
 h3fu/Yh+NuWl9do4aUtV4tn74BySZL0rpy6QV897LCrQtlQsYDvI64rctRsbZqp/Ur10
 rkyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2WxAwM40s96Oyqh2/sR7/3CobKp3pYRH8H0LH0HfcWs=;
 b=pyWmdEJLl0ToJ7qMBmJWdtZss96hqjJ6NiQnwZgLBzmZrA/0xVH+ZHf6roeSNVAOMX
 J+zn1bNwnKObczOWPCkC15RdVSGoAs6+2YA4tRunUS0AFnzdNxZlANbC+wOIZ5XUiLns
 VXlmF5SSVtSrXRh92QTbWtMZ+kqiLKUkeD9KO+NX29+ZKmnXHT6909x25KgtJK7k5DFg
 lhDNxkegduKZAM8NaODc745huUt6n4RpAyeonqUCCgNcSOFB37/BiXBHzJWjYN7nQYTm
 5z2s1iAPnjD1dhP04ITvDJWdeoQmN/QKNRRombOa2Iz2mCqcWXwBy7dlmJPkJC0Xv/3I
 +uYA==
X-Gm-Message-State: AOAM530xfm9Cz2CKaIUKkIzx/Yx6u46DGeNPy6nBF5U3/hsI0efXvkgf
 7Bvgyphtu5TyjUx7yAFDQ3ShIbhAG8qaLg==
X-Google-Smtp-Source: ABdhPJy58EGJnzcT9WYEgtkNllso6EevDXScmd8zzcZ5FWlwNwgl8yaImVm/Ra5UwN0eVa9xM7lKyQ==
X-Received: by 2002:a17:902:9303:b0:15f:446e:dccc with SMTP id
 bc3-20020a170902930300b0015f446edcccmr44854630plb.35.1653675767205; 
 Fri, 27 May 2022 11:22:47 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 b15-20020a170903228f00b00163552a0953sm4033534plh.159.2022.05.27.11.22.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:22:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 041/114] target/arm: Introduce gen_gvec_fn_arg_zzi
Date: Fri, 27 May 2022 11:17:54 -0700
Message-Id: <20220527181907.189259-42-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527181907.189259-1-richard.henderson@linaro.org>
References: <20220527181907.189259-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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

We have two places that perform this particular operation.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 62bfc6fe7c..7a3b5f137a 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -273,6 +273,16 @@ static bool gen_gvec_fn_zzi(DisasContext *s, GVecGen2iFn *gvec_fn,
     return true;
 }
 
+static bool gen_gvec_fn_arg_zzi(DisasContext *s, GVecGen2iFn *gvec_fn,
+                                arg_rri_esz *a)
+{
+    if (a->esz < 0) {
+        /* Invalid tsz encoding -- see tszimm_esz. */
+        return false;
+    }
+    return gen_gvec_fn_zzi(s, gvec_fn, a->esz, a->rd, a->rn, a->imm);
+}
+
 /* Invoke a vector expander on three Zregs.  */
 static bool gen_gvec_fn_zzz(DisasContext *s, GVecGen3Fn *gvec_fn,
                             int esz, int rd, int rn, int rm)
@@ -3503,12 +3513,7 @@ static bool trans_ADD_zzi(DisasContext *s, arg_rri_esz *a)
     if (a->esz == 0 && extract32(s->insn, 13, 1)) {
         return false;
     }
-    if (sve_access_check(s)) {
-        unsigned vsz = vec_full_reg_size(s);
-        tcg_gen_gvec_addi(a->esz, vec_full_reg_offset(s, a->rd),
-                          vec_full_reg_offset(s, a->rn), a->imm, vsz, vsz);
-    }
-    return true;
+    return gen_gvec_fn_arg_zzi(s, tcg_gen_gvec_addi, a);
 }
 
 static bool trans_SUB_zzi(DisasContext *s, arg_rri_esz *a)
@@ -6825,10 +6830,10 @@ TRANS_FEAT(ADCLT, aa64_sve2, do_adcl, a, true)
 
 static bool do_sve2_fn2i(DisasContext *s, arg_rri_esz *a, GVecGen2iFn *fn)
 {
-    if (a->esz < 0 || !dc_isar_feature(aa64_sve2, s)) {
+    if (!dc_isar_feature(aa64_sve2, s)) {
         return false;
     }
-    return gen_gvec_fn_zzi(s, fn, a->esz, a->rd, a->rn, a->imm);
+    return gen_gvec_fn_arg_zzi(s, fn, a);
 }
 
 static bool trans_SSRA(DisasContext *s, arg_rri_esz *a)
-- 
2.34.1


