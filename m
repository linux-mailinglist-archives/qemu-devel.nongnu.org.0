Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D744341179F
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 16:53:13 +0200 (CEST)
Received: from localhost ([::1]:37960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSKfQ-0004J9-JQ
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 10:53:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mSK9h-0002qy-Hg
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 10:20:26 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:46784)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mSK9O-0000uC-I4
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 10:20:25 -0400
Received: by mail-wr1-x434.google.com with SMTP id x6so30160436wrv.13
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 07:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=+cu3SIyBHWw2QogGpxhqAfMjv1A5vmLgpwlJwGfmSBQ=;
 b=BVjfGeJNTiARSgqMJ6eC1ASy4dA+v6ocdvK4veDARsbBcp6gxgSaj9P2ct7BflFWra
 q1+KUOOAacKgSGBlx/IYq6vJAy1RwUJMf6pxevFBK6Le8XFwljiG3P4Zl0BpSZtWML/I
 +p3yQHTwJNXJ4br8KVFXpafOW37UDfSyRAUPL/ZvhaG3cF+7PlDRXXYlJculfCdRpF3z
 AfIoBbCFYYvdIeK1cScZS95f8OFKRWW/C3lNMvdZPOOXQ0NxzKn7nHhwsSYlloXAQIG+
 J0nVh+8XRDxneD+CHrzdkeG0UsJX6mW/N6l4a6sJOaj2HOFbXSJ4p2R9qcbdzV3NqFJQ
 pZ+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+cu3SIyBHWw2QogGpxhqAfMjv1A5vmLgpwlJwGfmSBQ=;
 b=Okm4CxwRW8uxXTA4DdILJ9pw+nFgthg+sFLk9v+QkThfSxXFJDPnXlWH4sXM6FBuSi
 7gJknWzRQuZhdCR1jlT2VBK2Yy27KD177rtYc5HC5h/riuJDIisK4UVK6M4NJugM2B6l
 Zcb3oDxeIygK91pGb+yn6t2Won1qE1QjlVEHGe72sQwr1sMDeNe8gXbD1fNlv2jH9kTJ
 NBnagWByGHTXvW2fYElrNJY/ZpZp1zSSki9L7syBbkbh2/kFt89QnAhKk+lz9NHiKaPh
 Jd+6P2CDSr0RPTOtU1ZUgfkToaXON4WxCv3uOl+njOqZ4ONMV01DA9tZmJE9ojHvF96t
 2CQA==
X-Gm-Message-State: AOAM530fvrFPJyR+FY6fAfjuv1El1IXfz0jvgu7BeC49QMFfCOJnZZyn
 dZf6beMdOxPL+CP3tK3mwacZ+03coliBTQ==
X-Google-Smtp-Source: ABdhPJym4mrFqcTbSmGOUYi1/y4FMC7rPaLeTelqIe/C4vYiW+phkhHEpvgaGtprRLsUtXzXHtv0nw==
X-Received: by 2002:a5d:510b:: with SMTP id s11mr28125334wrt.79.1632147603956; 
 Mon, 20 Sep 2021 07:20:03 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id n17sm16229693wrp.17.2021.09.20.07.20.03
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 07:20:03 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 19/27] target/arm: Optimize MVE logic ops
Date: Mon, 20 Sep 2021 15:19:39 +0100
Message-Id: <20210920141947.5537-20-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210920141947.5537-1-peter.maydell@linaro.org>
References: <20210920141947.5537-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

When not predicating, implement the MVE bitwise logical insns
directly using TCG vector operations.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210913095440.13462-5-peter.maydell@linaro.org
---
 target/arm/translate-mve.c | 51 +++++++++++++++++++++++++++-----------
 1 file changed, 36 insertions(+), 15 deletions(-)

diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 0eca96e29cf..77b9f0db334 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -64,6 +64,16 @@ static TCGv_ptr mve_qreg_ptr(unsigned reg)
     return ret;
 }
 
+static bool mve_no_predication(DisasContext *s)
+{
+    /*
+     * Return true if we are executing the entire MVE instruction
+     * with no predication or partial-execution, and so we can safely
+     * use an inline TCG vector implementation.
+     */
+    return s->eci == 0 && s->mve_no_pred;
+}
+
 static bool mve_check_qreg_bank(DisasContext *s, int qmask)
 {
     /*
@@ -774,7 +784,8 @@ static bool trans_VNEG_fp(DisasContext *s, arg_1op *a)
     return do_1op(s, a, fns[a->size]);
 }
 
-static bool do_2op(DisasContext *s, arg_2op *a, MVEGenTwoOpFn fn)
+static bool do_2op_vec(DisasContext *s, arg_2op *a, MVEGenTwoOpFn fn,
+                       GVecGen3Fn *vecfn)
 {
     TCGv_ptr qd, qn, qm;
 
@@ -787,28 +798,38 @@ static bool do_2op(DisasContext *s, arg_2op *a, MVEGenTwoOpFn fn)
         return true;
     }
 
-    qd = mve_qreg_ptr(a->qd);
-    qn = mve_qreg_ptr(a->qn);
-    qm = mve_qreg_ptr(a->qm);
-    fn(cpu_env, qd, qn, qm);
-    tcg_temp_free_ptr(qd);
-    tcg_temp_free_ptr(qn);
-    tcg_temp_free_ptr(qm);
+    if (vecfn && mve_no_predication(s)) {
+        vecfn(a->size, mve_qreg_offset(a->qd), mve_qreg_offset(a->qn),
+              mve_qreg_offset(a->qm), 16, 16);
+    } else {
+        qd = mve_qreg_ptr(a->qd);
+        qn = mve_qreg_ptr(a->qn);
+        qm = mve_qreg_ptr(a->qm);
+        fn(cpu_env, qd, qn, qm);
+        tcg_temp_free_ptr(qd);
+        tcg_temp_free_ptr(qn);
+        tcg_temp_free_ptr(qm);
+    }
     mve_update_eci(s);
     return true;
 }
 
-#define DO_LOGIC(INSN, HELPER)                                  \
+static bool do_2op(DisasContext *s, arg_2op *a, MVEGenTwoOpFn *fn)
+{
+    return do_2op_vec(s, a, fn, NULL);
+}
+
+#define DO_LOGIC(INSN, HELPER, VECFN)                           \
     static bool trans_##INSN(DisasContext *s, arg_2op *a)       \
     {                                                           \
-        return do_2op(s, a, HELPER);                            \
+        return do_2op_vec(s, a, HELPER, VECFN);                 \
     }
 
-DO_LOGIC(VAND, gen_helper_mve_vand)
-DO_LOGIC(VBIC, gen_helper_mve_vbic)
-DO_LOGIC(VORR, gen_helper_mve_vorr)
-DO_LOGIC(VORN, gen_helper_mve_vorn)
-DO_LOGIC(VEOR, gen_helper_mve_veor)
+DO_LOGIC(VAND, gen_helper_mve_vand, tcg_gen_gvec_and)
+DO_LOGIC(VBIC, gen_helper_mve_vbic, tcg_gen_gvec_andc)
+DO_LOGIC(VORR, gen_helper_mve_vorr, tcg_gen_gvec_or)
+DO_LOGIC(VORN, gen_helper_mve_vorn, tcg_gen_gvec_orc)
+DO_LOGIC(VEOR, gen_helper_mve_veor, tcg_gen_gvec_xor)
 
 static bool trans_VPSEL(DisasContext *s, arg_2op *a)
 {
-- 
2.20.1


