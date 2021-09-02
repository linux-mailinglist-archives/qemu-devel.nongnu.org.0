Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 624E33FEFF3
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 17:16:50 +0200 (CEST)
Received: from localhost ([::1]:51040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLoSP-0000wd-Fe
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 11:16:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLoL9-0000Z3-TB
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 11:09:19 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:39439)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLoL7-0003Rr-Lm
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 11:09:19 -0400
Received: by mail-wr1-x42d.google.com with SMTP id z4so3469702wrr.6
 for <qemu-devel@nongnu.org>; Thu, 02 Sep 2021 08:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=hTL0YVceSstDhE4eWuPfHB9Yy35Pz6ourVXwIf0vsMU=;
 b=jHnvrAQYtPjAbycusOsjeAnyyqrreIFryg49SAPe4voxb0izxn5ES0syNU2FNpZ2qy
 CT22RkgtvNV2I3tvqx9p5u5t0uH4Z8NY7zPc3o7eIES2cpXCnZr5gSFffyFgJJMXjLpH
 YgAAF+spvWMpdMcpuSf3AyF6XWJJU+kEkuccqwV2hS+r+ZphqcMPJ80CeHE6kYbbwzTb
 Bz9AngrzlMLY3peHe+ReR9UIkZ1QvTRSDMnscQ45gn4BMQAYpogu7OJdYryVW3OH5/Cy
 wPiaZt1r7Cehs5zSj9W/WlMMdDa8geZy2xubDosQuP35YOkW6wbBr8Ioe3w6J2GoaFv0
 2gsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hTL0YVceSstDhE4eWuPfHB9Yy35Pz6ourVXwIf0vsMU=;
 b=N8DpcISZQTYecYjVrUnwY2+/H3Mbbfv9XKfoDhr4MY8jkHKj35sSRynKg6CcpPVsQU
 7mc5KPiP9yIro4KJnJM/nT+0nhcjk4C4e3TyzIp7vois5dmYBr0EiafxuO+DW/i/TeuK
 io4IEKvnnfBMNFBpGdWbr/jn4eCigyPookyyezmtO7sYPaDlCH3furDUOZtVPJ+MazGg
 nAKAT2e9rdh2InMvau4dKZO1OoG3VeTqRyqvZ+nvOjs4/vygIs1UFxENT6Y61z9f22ol
 d0wveiestJMX95/YZ1RUu6esUtXLQRFi21VVN7EkH8Tc1gs5dS2kpddBsa9SOGjI5lw3
 uv8Q==
X-Gm-Message-State: AOAM532j2tCCO838tlXdfLijOsYgvrGxHGk3fI4RqWPNf1e9DmL4/oHP
 A1nE/69eeoN3vt/f1/N1HPGCCQ==
X-Google-Smtp-Source: ABdhPJxgvd0Z5HvsFahw6WKE7cPvCBYp+js863wKPEnJhskiGdZFOE+NZMmnn0SQdAUkftl4rk4nXQ==
X-Received: by 2002:a5d:4e51:: with SMTP id r17mr4532791wrt.308.1630595356307; 
 Thu, 02 Sep 2021 08:09:16 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id c24sm2107842wrb.57.2021.09.02.08.09.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Sep 2021 08:09:15 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 4/4] target/arm: Optimize MVE VNEG, VABS
Date: Thu,  2 Sep 2021 16:09:10 +0100
Message-Id: <20210902150910.15748-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210902150910.15748-1-peter.maydell@linaro.org>
References: <20210902150910.15748-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

Optimize the MVE VNEG and VABS insns by using TCG
vector ops when possible.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-mve.c | 32 ++++++++++++++++++++++----------
 1 file changed, 22 insertions(+), 10 deletions(-)

diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 5bc5a3a2063..32c5ff6ea06 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -500,7 +500,8 @@ static bool trans_VDUP(DisasContext *s, arg_VDUP *a)
     return true;
 }
 
-static bool do_1op(DisasContext *s, arg_1op *a, MVEGenOneOpFn fn)
+static bool do_1op_vec(DisasContext *s, arg_1op *a, MVEGenOneOpFn fn,
+                       GVecGen2Fn vecfn)
 {
     TCGv_ptr qd, qm;
 
@@ -514,16 +515,25 @@ static bool do_1op(DisasContext *s, arg_1op *a, MVEGenOneOpFn fn)
         return true;
     }
 
-    qd = mve_qreg_ptr(a->qd);
-    qm = mve_qreg_ptr(a->qm);
-    fn(cpu_env, qd, qm);
-    tcg_temp_free_ptr(qd);
-    tcg_temp_free_ptr(qm);
+    if (vecfn && s->mve_no_pred) {
+        vecfn(a->size, mve_qreg_offset(a->qd), mve_qreg_offset(a->qm), 16, 16);
+    } else {
+        qd = mve_qreg_ptr(a->qd);
+        qm = mve_qreg_ptr(a->qm);
+        fn(cpu_env, qd, qm);
+        tcg_temp_free_ptr(qd);
+        tcg_temp_free_ptr(qm);
+    }
     mve_update_eci(s);
     return true;
 }
 
-#define DO_1OP(INSN, FN)                                        \
+static bool do_1op(DisasContext *s, arg_1op *a, MVEGenOneOpFn fn)
+{
+    return do_1op_vec(s, a, fn, NULL);
+}
+
+#define DO_1OP_VEC(INSN, FN, VECFN)                             \
     static bool trans_##INSN(DisasContext *s, arg_1op *a)       \
     {                                                           \
         static MVEGenOneOpFn * const fns[] = {                  \
@@ -532,13 +542,15 @@ static bool do_1op(DisasContext *s, arg_1op *a, MVEGenOneOpFn fn)
             gen_helper_mve_##FN##w,                             \
             NULL,                                               \
         };                                                      \
-        return do_1op(s, a, fns[a->size]);                      \
+        return do_1op_vec(s, a, fns[a->size], VECFN);           \
     }
 
+#define DO_1OP(INSN, FN) DO_1OP_VEC(INSN, FN, NULL)
+
 DO_1OP(VCLZ, vclz)
 DO_1OP(VCLS, vcls)
-DO_1OP(VABS, vabs)
-DO_1OP(VNEG, vneg)
+DO_1OP_VEC(VABS, vabs, tcg_gen_gvec_abs)
+DO_1OP_VEC(VNEG, vneg, tcg_gen_gvec_neg)
 DO_1OP(VQABS, vqabs)
 DO_1OP(VQNEG, vqneg)
 DO_1OP(VMAXA, vmaxa)
-- 
2.20.1


