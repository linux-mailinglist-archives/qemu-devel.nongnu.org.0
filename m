Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B94B53671D
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 20:50:32 +0200 (CEST)
Received: from localhost ([::1]:51490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuf2c-00071s-SX
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 14:50:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueYt-0007wu-SH
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:19:47 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:52759)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueYp-0003i1-SY
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:19:47 -0400
Received: by mail-pj1-x102a.google.com with SMTP id gz24so5282578pjb.2
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 11:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+cVwgYzICmqGu533hMCPScOcwt+8iW1To4Y7+/8b2m4=;
 b=zbX0iYe1DKh5uQK6rMclqCTbMHD78wTz8XegPFSUE+MExVjXW6xKA3Q4NQVo/6WeVG
 hyBE8KOb5Z2SiQerpyJwNg1HdjBnmg4Wo9YLS26XV1sCpSTucDz8lk6Qc0jfo4lMA7Dm
 55VQSYpkVSUE4ENWvW8jSL7Vu2MbxjZjMPSgTL5xtDE9qchJPRji41zAE6NjYNXUu+D3
 IVdKurUEF+j/Y7glQG4qAkX607dMFhaOUvu/cwGzDgUqEA7G8ncPs+NrB9mvfse/WGnW
 iQc2F/8Nbkh2z9628RWLo4+QSGLGjHFr9Y4j4mg3rg0uUska7+9OVHmtP+KcaoCGUl1Z
 RMKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+cVwgYzICmqGu533hMCPScOcwt+8iW1To4Y7+/8b2m4=;
 b=g8Lmx5OMlWqXZxhSIx1tShfykNTXWWNTwRTR6CDle806v8Cs0ieILXs3PG4TnSx2je
 dm3ULuOfetNFKQSJr97lrmC/wUzyeTSfCVSam+9NctutWeoANDDZI95YmxfqhHW8B15B
 6hh1h1Ihx7YN1m16pJ1Ekww8bTJ/98UIwZouhYc9GyAC+eH7WotIDUmjeJl64eCpGZa5
 WJ0onTXyDhx+wQYV+u6kMKVH5W8XbG7OfYvtjt/FRJ6XyIZ+rKsD70dqMAwfKqsQE/W7
 MwjYw6IHgKy76792uqtVU+MOi78xS35ggxKzBuseDlFR5uJknuaf4Ih1k8n3LkWCfmsi
 odRA==
X-Gm-Message-State: AOAM533uP61gx7zmQTKi7BbwXGdEq3NnjXnv5Lcjz6JH14fOWKbYp2yy
 9ij6cY2bxBdJu28rVMfoj0vAbKWPrrS5NQ==
X-Google-Smtp-Source: ABdhPJx8bBCoH00Pqu2uee9KuAK6l9l1QnjB24gYkCugyZerrkjAmRDLPQ0Ak2rTla6M4V6d4CzH1g==
X-Received: by 2002:a17:90b:3d0e:b0:1e0:9a3d:5a27 with SMTP id
 pt14-20020a17090b3d0e00b001e09a3d5a27mr9706281pjb.43.1653675582572; 
 Fri, 27 May 2022 11:19:42 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 t5-20020a17090ae50500b001deb3cbd8f1sm1911612pjy.27.2022.05.27.11.19.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:19:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 036/114] target/arm: Introduce gen_gvec_fn_arg_zzzz
Date: Fri, 27 May 2022 11:17:49 -0700
Message-Id: <20220527181907.189259-37-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527181907.189259-1-richard.henderson@linaro.org>
References: <20220527181907.189259-1-richard.henderson@linaro.org>
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

Merge gen_gvec_fn_zzzz with the sve access check and the
dereference of arg_rrrr_esz.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 36d739d7b2..e0b083f861 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -281,14 +281,20 @@ static bool gen_gvec_fn_arg_zzz(DisasContext *s, GVecGen3Fn *fn,
 }
 
 /* Invoke a vector expander on four Zregs.  */
-static void gen_gvec_fn_zzzz(DisasContext *s, GVecGen4Fn *gvec_fn,
-                             int esz, int rd, int rn, int rm, int ra)
+static bool gen_gvec_fn_arg_zzzz(DisasContext *s, GVecGen4Fn *gvec_fn,
+                                 arg_rrrr_esz *a)
 {
-    unsigned vsz = vec_full_reg_size(s);
-    gvec_fn(esz, vec_full_reg_offset(s, rd),
-            vec_full_reg_offset(s, rn),
-            vec_full_reg_offset(s, rm),
-            vec_full_reg_offset(s, ra), vsz, vsz);
+    if (gvec_fn == NULL) {
+        return false;
+    }
+    if (sve_access_check(s)) {
+        unsigned vsz = vec_full_reg_size(s);
+        gvec_fn(a->esz, vec_full_reg_offset(s, a->rd),
+                vec_full_reg_offset(s, a->rn),
+                vec_full_reg_offset(s, a->rm),
+                vec_full_reg_offset(s, a->ra), vsz, vsz);
+    }
+    return true;
 }
 
 /* Invoke a vector move on two Zregs.  */
@@ -490,10 +496,7 @@ static bool do_sve2_zzzz_fn(DisasContext *s, arg_rrrr_esz *a, GVecGen4Fn *fn)
     if (!dc_isar_feature(aa64_sve2, s)) {
         return false;
     }
-    if (sve_access_check(s)) {
-        gen_gvec_fn_zzzz(s, fn, a->esz, a->rd, a->rn, a->rm, a->ra);
-    }
-    return true;
+    return gen_gvec_fn_arg_zzzz(s, fn, a);
 }
 
 static void gen_eor3_i64(TCGv_i64 d, TCGv_i64 n, TCGv_i64 m, TCGv_i64 k)
-- 
2.34.1


