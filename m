Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C99E9457314
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 17:34:36 +0100 (CET)
Received: from localhost ([::1]:47470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mo6qR-0002L9-UT
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 11:34:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mo6PM-00076R-Nt
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 11:06:39 -0500
Received: from [2a00:1450:4864:20::32a] (port=51809
 helo=mail-wm1-x32a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mo6P6-0004Yd-20
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 11:06:21 -0500
Received: by mail-wm1-x32a.google.com with SMTP id 137so5443897wma.1
 for <qemu-devel@nongnu.org>; Fri, 19 Nov 2021 08:06:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uD5uZbS3EVAOjcQ/CDXvtD52ArIioGdfvnZGW+Oo0bM=;
 b=Okqf4Va6f+otawpW/dP83gscpzFcQ8IYUp2/cvhR18JoG0gUR+sO7S5Dc0cuXWViRq
 wd7NYmKchZF6OqUJua3/hxE7LcKqLlx4/hMpXY2JGjF0zGxN7kzgGlwmPk2WpZvl9+Jp
 N1tFHbBaIltq4ymxNI/TlI+UTF1x96PdIcHyvPSTP88XEQVydvjGv+W3cQfPglAheoUu
 EXNx6X033D2/z1hLVzmm9IzExUF4Kf0PtwqHkpg7nudeXE7wgWK2jZkEWw8CAF4PazzD
 oZaydcUlc1Ba344fJCy4WKN1lzcZYA/7qKpALkqs0kETZsW46IPSREvse0icMTkjrhMk
 bT5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uD5uZbS3EVAOjcQ/CDXvtD52ArIioGdfvnZGW+Oo0bM=;
 b=LyUxmoatKZZea448YDoNAjaAAR7OMxQ/WtBPzwqICV5MYlZYkaRzsBngHbBI/xH01r
 NmAqTdifBgxoHNI8kfw6eqIuBr9fPJzNqlIP43wTswOF+YOFGgAfMlPWu9N+sIE1J3nP
 fsPEjsh8i5pH8uLguYjvPWiQq0jUcDskdwGSgfbPLn4z1HtUJS25odAyejNWfhCpTIFH
 fzLLqF+4cUPG8OHmyjtUiMqCWi200CJ9oJR8CPms2aTO8Nk3+Yf4ObQRnafKRB+T/f0t
 mJXXPTiX7KkndFDa/civjta4H5LJLoqNi6Trsa4txSNArXU+7qJcM6vh9TyqDyyRPYNs
 LdCA==
X-Gm-Message-State: AOAM530NdGRsoEb7ngt8VLR5dYmImL60wHkoWfKoT4t2VUDIFBjxtWhn
 Y/Ph8FAYoQntx4nrFxYwR3btbw1azrXo/AvwgvU=
X-Google-Smtp-Source: ABdhPJwETfcDnlhKvFSCcTVxUns0/MvY6esdjifbPKNonOAXU+yIMbpeLzlUaJcIUte5kYGho+GAlg==
X-Received: by 2002:a05:600c:1e06:: with SMTP id
 ay6mr981821wmb.64.1637337978777; 
 Fri, 19 Nov 2021 08:06:18 -0800 (PST)
Received: from localhost.localdomain
 (165.red-37-158-79.dynamicip.rima-tde.net. [37.158.79.165])
 by smtp.gmail.com with ESMTPSA id q84sm14044877wme.3.2021.11.19.08.06.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 08:06:18 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 33/35] target/ppc: Update fres to new flags and float64r32
Date: Fri, 19 Nov 2021 17:05:00 +0100
Message-Id: <20211119160502.17432-34-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211119160502.17432-1-richard.henderson@linaro.org>
References: <20211119160502.17432-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, alex.bennee@linaro.org,
 clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There is no double-rounding bug here, because the result is
merely an estimate to within 1 part in 256, but perform the
operation with float64r32_div for consistency.

Use float_flag_invalid_snan instead of recomputing the
snan-ness of the operand.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/fpu_helper.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
index cb511f2050..ea238929da 100644
--- a/target/ppc/fpu_helper.c
+++ b/target/ppc/fpu_helper.c
@@ -813,20 +813,20 @@ float64 helper_fre(CPUPPCState *env, float64 arg)
 /* fres - fres. */
 uint64_t helper_fres(CPUPPCState *env, uint64_t arg)
 {
-    CPU_DoubleU farg;
-    float32 f32;
+    /* "Estimate" the reciprocal with actual division.  */
+    float64 ret = float64r32_div(float64_one, arg, &env->fp_status);
+    int flags = get_float_exception_flags(&env->fp_status);
 
-    farg.ll = arg;
-
-    if (unlikely(float64_is_signaling_nan(farg.d, &env->fp_status))) {
-        /* sNaN reciprocal */
+    if (unlikely(flags & float_flag_invalid_snan)) {
         float_invalid_op_vxsnan(env, GETPC());
     }
-    farg.d = float64_div(float64_one, farg.d, &env->fp_status);
-    f32 = float64_to_float32(farg.d, &env->fp_status);
-    farg.d = float32_to_float64(f32, &env->fp_status);
+    if (unlikely(flags & float_flag_divbyzero)) {
+        float_zero_divide_excp(env, GETPC());
+        /* For FPSCR.ZE == 0, the result is 1/2.  */
+        ret = float64_set_sign(float64_half, float64_is_neg(arg));
+    }
 
-    return farg.ll;
+    return ret;
 }
 
 /* frsqrte  - frsqrte. */
-- 
2.25.1


