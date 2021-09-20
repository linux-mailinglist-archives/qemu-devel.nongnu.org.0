Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E8EC4117D3
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 17:08:24 +0200 (CEST)
Received: from localhost ([::1]:33856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSKu7-000426-Bz
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 11:08:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mSK9i-0002r4-PL
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 10:20:26 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:42997)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mSK9O-0000vB-Jb
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 10:20:26 -0400
Received: by mail-wr1-x435.google.com with SMTP id q11so30195296wrr.9
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 07:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=nie3pKXCzIJPV1K6mbhMdgtowk9zlxPZe7V92dKlhpo=;
 b=o+lPNcw7OptJVJ5k54Snr9fWWrmstaN+Ex3ZokVHXC5wnNPcFApwFtJ3GRphQwtIRV
 32h19UU7PdBLuNV4x48MfOYQgQ1SCMsgcRxDe/WkC41wNiZ7cQBBHxaT/Xpr9hj632jt
 mqdqOXegaRFNFaOYZmc/rllf920u3/ZthV8F6hG8+kIcUJnhwLsELfs10Y04K9MgVJYc
 m1p0dLY5gzzVGIQRYo2EICMHmW2wHXeLZyEN1b0ReCLEWyk8dCplf8SmMGDNxc1qvJlS
 K7CI3NwA4uJVQqZLVnuwIM8soU6gsf+IuXzKV80AjGjgwqOaJGMsaONLYXqe8SCOVRyI
 Pk5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nie3pKXCzIJPV1K6mbhMdgtowk9zlxPZe7V92dKlhpo=;
 b=Dp/p9ihz2NqOC4350GTAhUms5qrcMO0uiayOy/5sqpljh1+KMNVF/ZGhUXeuLm69QG
 3fs59dUderqCUYSEw3HRZP5HPirodWa5JLHq/6PDZwtcLGKVfCKfE9pswoxb5uBy999A
 q3LFo7OV98R+Lbqt/2j3sZFWFWHtT01EVp9M94esBpUk5AmidQ2TuCyIqw+sMjrzf6Hx
 nQHXXweucbUjRlIOBj6ZhzqDXB/FUoc6hWEkFF0uo/oz72evhG41EaOHk38r0IbxUCCh
 /BHXSYzD2hK7hhiKIbH8H90f3EcM9OytmvIpfK7g/sBvNizOh8fE80Zy8K+lUyrCdnqd
 hUVQ==
X-Gm-Message-State: AOAM531TBgPi1wPoKXen+8kPrIbNorZ+JMxLHzzVFoLeBciguNY6jsVx
 3oMp8SNbD7P5y8PANCVBRPn3ANHXYyfg4g==
X-Google-Smtp-Source: ABdhPJx1nUDHttY/tVX/uZDjjBLd84LfP4vmeE/B0371L8MimVe/nnvZ3xFtd+oeHZ+2d9ykShch2g==
X-Received: by 2002:a5d:6343:: with SMTP id b3mr27743123wrw.124.1632147605309; 
 Mon, 20 Sep 2021 07:20:05 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id n17sm16229693wrp.17.2021.09.20.07.20.04
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 07:20:05 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 21/27] target/arm: Optimize MVE VNEG, VABS
Date: Mon, 20 Sep 2021 15:19:41 +0100
Message-Id: <20210920141947.5537-22-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210920141947.5537-1-peter.maydell@linaro.org>
References: <20210920141947.5537-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
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

Optimize the MVE VNEG and VABS insns by using TCG
vector ops when possible.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210913095440.13462-7-peter.maydell@linaro.org
---
 target/arm/translate-mve.c | 32 ++++++++++++++++++++++----------
 1 file changed, 22 insertions(+), 10 deletions(-)

diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 255cb860fec..d30c7e57ea3 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -510,7 +510,8 @@ static bool trans_VDUP(DisasContext *s, arg_VDUP *a)
     return true;
 }
 
-static bool do_1op(DisasContext *s, arg_1op *a, MVEGenOneOpFn fn)
+static bool do_1op_vec(DisasContext *s, arg_1op *a, MVEGenOneOpFn fn,
+                       GVecGen2Fn vecfn)
 {
     TCGv_ptr qd, qm;
 
@@ -524,16 +525,25 @@ static bool do_1op(DisasContext *s, arg_1op *a, MVEGenOneOpFn fn)
         return true;
     }
 
-    qd = mve_qreg_ptr(a->qd);
-    qm = mve_qreg_ptr(a->qm);
-    fn(cpu_env, qd, qm);
-    tcg_temp_free_ptr(qd);
-    tcg_temp_free_ptr(qm);
+    if (vecfn && mve_no_predication(s)) {
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
@@ -542,13 +552,15 @@ static bool do_1op(DisasContext *s, arg_1op *a, MVEGenOneOpFn fn)
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


