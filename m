Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEDE13FEFE5
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 17:11:44 +0200 (CEST)
Received: from localhost ([::1]:44048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLoNT-0004MV-RX
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 11:11:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLoL8-0000Uc-FD
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 11:09:18 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:46843)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLoL5-0003PY-Ko
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 11:09:18 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 m25-20020a7bcb99000000b002e751bcb5dbso1585150wmi.5
 for <qemu-devel@nongnu.org>; Thu, 02 Sep 2021 08:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=IOs+ybtxzQvBd0zTnc8h9eQMrze7nEv95Ct+IYf1dzY=;
 b=TTQVdtRMl79lUFvi/5MnSRHMqI4lwLDMAuQ3QwZCzd1D/omBeMZ9W5pPQIoJ/36fhn
 AVjt3f2CUz7ea959LqNR0PkxwWUPCQyv19EBQVGCHEoNxUiVkLGobINtZafPagFOvCPR
 me4qRVa686byFU9xQ5G2UqgWPKMyQd75s13qA9Tv/r6nxpBRiEThrFTDu05FsGFChH0y
 wKrizWiKyH5D5SC9IG+/rfUdTFySCnV+pTJcyv9MgMdyDHItx4auEgUCPIvDL1EowM3+
 RJnOJ2TUg+re5e3iVCFCfvUlRhR/2542QDhXKHzqWtq+wR0LunXyBxoGM+kTy0M47QXp
 BK1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IOs+ybtxzQvBd0zTnc8h9eQMrze7nEv95Ct+IYf1dzY=;
 b=TcIH/djlmB5UNKx0M7vvoqZ9XEkPkZv9PHVR3yrnLQUARNgIO4p398kb9QxPWCJYxq
 7p/C0qGIli/haBY4es+L3G09OhHV7XbOh+hudNYxmiz1cWGBkwYMCR4/E3Lw9T80hpzx
 R+6zafHw4VYZaQ9kkpyumEOrDv5EczVhAjVign0TYncPlo6fSeST8PadpvJo2xd1H6Cc
 gRQAVGTB1nx/QYG2J/wF/mTOoqPKu105qfxWDFwL0zLq3OwbcjJUOomKp6/FQZ79vGcS
 09qc9HqasO7uLPW3EYEhkGPbKA6Cf9auiNwqSGDGtMWH8kg+S5Z5Qi38Rv37r1S4cOam
 z2KQ==
X-Gm-Message-State: AOAM533oB2d+wiDlebc6NuzTBGFtB/fhphcXcBTD/9k8nyElztfbKhVJ
 pH3h5/tkXQx9+4ld1XcPPiTQuA==
X-Google-Smtp-Source: ABdhPJyKxWsjYQ1lT/7oxxAxdRo7OUCBVdWOxTGG0gHPcZNZu/9yrDBMMc0hA80Nqxlns2s3Uh7S7Q==
X-Received: by 2002:a1c:f405:: with SMTP id z5mr3681019wma.33.1630595354213;
 Thu, 02 Sep 2021 08:09:14 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id c24sm2107842wrb.57.2021.09.02.08.09.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Sep 2021 08:09:13 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 2/4] target/arm: Optimize MVE logic ops
Date: Thu,  2 Sep 2021 16:09:08 +0100
Message-Id: <20210902150910.15748-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210902150910.15748-1-peter.maydell@linaro.org>
References: <20210902150910.15748-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
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
---
 target/arm/translate-mve.c | 41 ++++++++++++++++++++++++--------------
 1 file changed, 26 insertions(+), 15 deletions(-)

diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index d95807541b1..087d60f0d81 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -774,7 +774,8 @@ static bool trans_VNEG_fp(DisasContext *s, arg_1op *a)
     return do_1op(s, a, fns[a->size]);
 }
 
-static bool do_2op(DisasContext *s, arg_2op *a, MVEGenTwoOpFn fn)
+static bool do_2op_vec(DisasContext *s, arg_2op *a, MVEGenTwoOpFn fn,
+                       GVecGen3Fn *vecfn)
 {
     TCGv_ptr qd, qn, qm;
 
@@ -787,28 +788,38 @@ static bool do_2op(DisasContext *s, arg_2op *a, MVEGenTwoOpFn fn)
         return true;
     }
 
-    qd = mve_qreg_ptr(a->qd);
-    qn = mve_qreg_ptr(a->qn);
-    qm = mve_qreg_ptr(a->qm);
-    fn(cpu_env, qd, qn, qm);
-    tcg_temp_free_ptr(qd);
-    tcg_temp_free_ptr(qn);
-    tcg_temp_free_ptr(qm);
+    if (vecfn && s->mve_no_pred) {
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


