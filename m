Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B851A4088B7
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 12:04:34 +0200 (CEST)
Received: from localhost ([::1]:37744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPipF-0003Dv-KY
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 06:04:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mPifr-0007El-D2
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 05:54:51 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:54828)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mPifo-0001tl-8B
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 05:54:51 -0400
Received: by mail-wm1-x329.google.com with SMTP id s24so6166353wmh.4
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 02:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MPPFBEMAEyXetbowqu2rGA84XzkvyjzYzL/hwkj6xh0=;
 b=g/yqQ8jt9rUB05QDNocQsHw/tUugWBRveLtysQIdBTlXTm/VAqfZJJgeTjpUvsAJaS
 g6KoJD1puCY+sg3YDdhPvVuXT+Y5/E1/eloQpCPqczaFMBSQAX9DhHZLbl8PI34eqvci
 c/hFU9BfXUkyN7ygplcMwkZASyE05uyB/6ZwpXlriQlyph4732C/UmBZlRID1CX2pgY2
 xE+4Bh7jmEv4ohuJUXzquW5z4LaL/Dwsr7N9zjXtDx9lZkVsw5jBM0ZnW6zJW7V/fc8W
 Fpzp1sL6l73MDpCb4XGjgkZRnqrzCtG+WacBRpERloKD8DNPBcVE25/3scqJUKFAHZFd
 M/JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MPPFBEMAEyXetbowqu2rGA84XzkvyjzYzL/hwkj6xh0=;
 b=DfueGBQqVkUbQ62duorJ/09l6j1PjnUoz3ZkLsUIT1TkH+U0z/RWgN+CE/7OlX68KS
 kQJN2VBFEo3yr6LBTUxqTw9IGrjPWpbVKfpItaJ739QyyNGbddWy2tm3cte3SX5R4XdX
 J6FaVhDu/u22nE9OpNJqZcnFAv7q4mjrdjlMasQ5OuyczBpGbUCn/P8Jbc71+/MqmaJC
 lgb8hsryUaYMQqJDI8S1qqQxGIQ4fMQyDCzq2e/1WwKCnGbhN9fx3YMgxEBgfHQ08Jkf
 Su1tYAvpNp9wx05lPMlIM0EG02jmA/8LqPG167BafMZdqbqnJBb7EdAZnj7zlh6/O/PP
 TuLw==
X-Gm-Message-State: AOAM531CcsKgMQ/E8KPawTzPpqBPZZviPpP52wtWdwh82qoE8fzN/F2E
 bROoI3ITgD75T8aKt2E5QTR0ag==
X-Google-Smtp-Source: ABdhPJwdQJ1ktZhq4L+5Alg3Cz0C6MmhYqwN8/W11Y/jhI9ueJgy2PgaPKvZiwwKL/7vJRJ+VjbnYQ==
X-Received: by 2002:a1c:1f09:: with SMTP id f9mr10097119wmf.58.1631526886904; 
 Mon, 13 Sep 2021 02:54:46 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m184sm6475338wmm.3.2021.09.13.02.54.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 02:54:46 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 06/12] target/arm: Optimize MVE VNEG, VABS
Date: Mon, 13 Sep 2021 10:54:34 +0100
Message-Id: <20210913095440.13462-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210913095440.13462-1-peter.maydell@linaro.org>
References: <20210913095440.13462-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Optimize the MVE VNEG and VABS insns by using TCG
vector ops when possible.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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


