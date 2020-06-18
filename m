Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0239A1FEA20
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Jun 2020 06:31:56 +0200 (CEST)
Received: from localhost ([::1]:44734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jlmDT-0002qm-06
	for lists+qemu-devel@lfdr.de; Thu, 18 Jun 2020 00:31:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jlm9M-0003AQ-0c
 for qemu-devel@nongnu.org; Thu, 18 Jun 2020 00:27:40 -0400
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:41568)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jlm9I-0002SR-Ce
 for qemu-devel@nongnu.org; Thu, 18 Jun 2020 00:27:39 -0400
Received: by mail-pf1-x442.google.com with SMTP id 10so2186660pfx.8
 for <qemu-devel@nongnu.org>; Wed, 17 Jun 2020 21:27:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QJ/CvU4OhaMIqf4S190NGTq9cLpEvfuK5bf6XbTwWO4=;
 b=ON3dtOsTj+bM8GKQ5s9d9J70JjDBCogQhOmzcFHBF1XkjVzi9/2E0EcwdpLNddRYGZ
 fV4jBDT7qcQJMWIooHi1ThLjNqfxlheUECsRIvLApUomCb3vj2lGaDbseYMAeb01iYTB
 G7oYIx9NrTf85RNgOn5zrakwddiFwKHVsuExVrynUjbF3SKg0VrB9sXYTxqJ+7X0Kb7y
 N51+BwPYDbE7/MDkkZxgbVYfbQLOiYImate6KQkgdFS0guetfCcnQK+s5g9KyBVnypsB
 y2TO0THgfpnU9Ln5TybY/axPgXUBr5TZaPO1l4FS1mFk/XTzg+q/CMOC1LdbPKZo4xh5
 eLcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QJ/CvU4OhaMIqf4S190NGTq9cLpEvfuK5bf6XbTwWO4=;
 b=V/BADhdoYc3YHnhIDkVw1I81IJmIJw+liNpVyVelwqYJjt9ALZ4vilHP2xMGKXehS8
 fP8In/xMiSyrDDGC1FnwTF1uvsquzPjtRyFLnA/qPISZIuDyUWiZqcObutpyoNGYuMsp
 2wkylSdMeuUBq6nw2BK7rrTUA407x6XAjFliRCzJrZMRZGvzmX4kDi3bTTTIFgPFSujf
 KJVWJUETX7rP653Ps6KbYdW3i6NrYWKmMmXIyoIg/N2Dz+SxqvGtDYbQatYXhAvQ60iF
 4SgIGfJQMboh/wEDVE8ricA66iCgXRNTGRCI7sk951BycQ45i83fxr1AV7SmAn2ahPRo
 0tUQ==
X-Gm-Message-State: AOAM530Ke2qCFM8NZdIWDsw/Fq1moy07dKnkPY95kM+dJQSdz8T2rXn1
 6+rNxiKbHHEnes/TTbcJoAlaourRNN8=
X-Google-Smtp-Source: ABdhPJwd7zlc8q3fnfx8+GR4NncdcJ7M9bI3lvPOf7wptSWxrO5t52QKXeP9eS7CFWsnHMaG7FJ1CQ==
X-Received: by 2002:aa7:9f10:: with SMTP id g16mr1938591pfr.47.1592454454414; 
 Wed, 17 Jun 2020 21:27:34 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id u61sm964897pjb.7.2020.06.17.21.27.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2020 21:27:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 013/100] target/arm: Split out gen_gvec_ool_zz
Date: Wed, 17 Jun 2020 21:25:17 -0700
Message-Id: <20200618042644.1685561-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200618042644.1685561-1-richard.henderson@linaro.org>
References: <20200618042644.1685561-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::442;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x442.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: qemu-arm@nongnu.org, steplong@quicinc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 6bdd62d4f2..92a4e3f030 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -142,6 +142,16 @@ static int pred_gvec_reg_size(DisasContext *s)
     return size_for_gvec(pred_full_reg_size(s));
 }
 
+/* Invoke an out-of-line helper on 2 Zregs. */
+static void gen_gvec_ool_zz(DisasContext *s, gen_helper_gvec_2 *fn,
+                            int rd, int rn, int data)
+{
+    unsigned vsz = vec_full_reg_size(s);
+    tcg_gen_gvec_2_ool(vec_full_reg_offset(s, rd),
+                       vec_full_reg_offset(s, rn),
+                       vsz, vsz, data, fn);
+}
+
 /* Invoke an out-of-line helper on 3 Zregs. */
 static void gen_gvec_ool_zzz(DisasContext *s, gen_helper_gvec_3 *fn,
                              int rd, int rn, int rm, int data)
@@ -995,10 +1005,7 @@ static bool trans_FEXPA(DisasContext *s, arg_rr_esz *a)
         return false;
     }
     if (sve_access_check(s)) {
-        unsigned vsz = vec_full_reg_size(s);
-        tcg_gen_gvec_2_ool(vec_full_reg_offset(s, a->rd),
-                           vec_full_reg_offset(s, a->rn),
-                           vsz, vsz, 0, fns[a->esz]);
+        gen_gvec_ool_zz(s, fns[a->esz], a->rd, a->rn, 0);
     }
     return true;
 }
@@ -2050,10 +2057,7 @@ static bool trans_REV_v(DisasContext *s, arg_rr_esz *a)
     };
 
     if (sve_access_check(s)) {
-        unsigned vsz = vec_full_reg_size(s);
-        tcg_gen_gvec_2_ool(vec_full_reg_offset(s, a->rd),
-                           vec_full_reg_offset(s, a->rn),
-                           vsz, vsz, 0, fns[a->esz]);
+        gen_gvec_ool_zz(s, fns[a->esz], a->rd, a->rn, 0);
     }
     return true;
 }
-- 
2.25.1


