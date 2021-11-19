Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78CB44572F2
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 17:29:43 +0100 (CET)
Received: from localhost ([::1]:60688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mo6li-0000Pw-K5
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 11:29:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mo6Ov-0006WP-3M
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 11:06:09 -0500
Received: from [2a00:1450:4864:20::335] (port=33382
 helo=mail-wm1-x335.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mo6Ot-0004TO-KY
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 11:06:08 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 r9-20020a7bc089000000b00332f4abf43fso8029413wmh.0
 for <qemu-devel@nongnu.org>; Fri, 19 Nov 2021 08:06:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hJYMrWgBLbvrLnER5gqNxXtDWmn4A7cBf68IZ0GsqMY=;
 b=xHBjhQiyR0UT3bi8zLicgY6s95KFyObAnKUjDDjYFJCbfNvnKJ51NmCNIMQL4TrySX
 B8baOTtXMO9KX04nXASzK+AWNq8uo+IVPXZLktTTQmpKgFS+5TFg+XQ6yS9+QP7LutqF
 YS7VrASDGRiA85/bHzDbYOorezCSazgyZTTNr0/pi8ONnpcNjgo5ODJbNAWGKyic120D
 L7WGrPLEtjzzyW/cHKJh3YSlhAk3P+ywFvaey22bgsgUZE0TUFxdLMU0ZTb60pUKkt9Z
 9GV4q99JyBJzI/h6A1x13Eytkxxn3tqE/caZUcMEp+pwTr9/+csg/T7ERA3tYUEov4/A
 snpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hJYMrWgBLbvrLnER5gqNxXtDWmn4A7cBf68IZ0GsqMY=;
 b=j2VIAAbx2HvkV6fd3VAmDwvvl/bnJejaW99ygb3t2MV9TPvCUYr56dw5LmzX64heoD
 bGKkkxQwccwCdj3pZZklWbgh6Yf0j/6p+baIN2wIHCMc8Dvg1ZOgGjARL5oyQjCMODb/
 9pSpB2lRHOGW2rM/AI/BY68qacSD5L+EfneLbXdHRQtw6EEwqyb4gToZWrI/ay0XwLZe
 9drYxG/AMkpKSIgrMiPP1ryWgBpLLwwzLABcHzRWFnCxTEnapKa0Q6E4QzEAUstqhHaa
 URFxRlQUeePndXPLQ24lNDOr/gGHnKYDNVhWkMH1NkBB+m9SkOcL6xhhy/ktUJ7l5qBP
 QOUA==
X-Gm-Message-State: AOAM533M88vim29P9c8yyf8lw3f9A+FCBmJ+rViD/ePQRswZbECl5qst
 AuGHNw5kwlg4UZHHyh5B3iRdsP+k3gmrxNZkgI0=
X-Google-Smtp-Source: ABdhPJwsEOK1xyOlH3Riu6GP97cAQnptiCiUM7p8aZlvkIKh3SczdfKevcuPqpQuCbMFlF39wvf3mA==
X-Received: by 2002:a05:600c:1e06:: with SMTP id
 ay6mr979917wmb.64.1637337966209; 
 Fri, 19 Nov 2021 08:06:06 -0800 (PST)
Received: from localhost.localdomain
 (165.red-37-158-79.dynamicip.rima-tde.net. [37.158.79.165])
 by smtp.gmail.com with ESMTPSA id q84sm14044877wme.3.2021.11.19.08.06.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 08:06:05 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 25/35] target/ppc: Update xsrqpi and xsrqpxp to new flags
Date: Fri, 19 Nov 2021 17:04:52 +0100
Message-Id: <20211119160502.17432-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211119160502.17432-1-richard.henderson@linaro.org>
References: <20211119160502.17432-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::335
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x335.google.com
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

Use float_flag_invalid_snan instead of recomputing
the snan-ness of the operand.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/fpu_helper.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
index f17d5a1af1..f46d529f04 100644
--- a/target/ppc/fpu_helper.c
+++ b/target/ppc/fpu_helper.c
@@ -3090,11 +3090,8 @@ void helper_xsrqpi(CPUPPCState *env, uint32_t opcode,
     t.f128 = float128_round_to_int(xb->f128, &tstat);
     env->fp_status.float_exception_flags |= tstat.float_exception_flags;
 
-    if (unlikely(tstat.float_exception_flags & float_flag_invalid)) {
-        if (float128_is_signaling_nan(xb->f128, &tstat)) {
-            float_invalid_op_vxsnan(env, GETPC());
-            t.f128 = float128_snan_to_qnan(t.f128);
-        }
+    if (unlikely(tstat.float_exception_flags & float_flag_invalid_snan)) {
+        float_invalid_op_vxsnan(env, GETPC());
     }
 
     if (ex == 0 && (tstat.float_exception_flags & float_flag_inexact)) {
@@ -3148,11 +3145,9 @@ void helper_xsrqpxp(CPUPPCState *env, uint32_t opcode,
     t.f128 = floatx80_to_float128(round_res, &tstat);
     env->fp_status.float_exception_flags |= tstat.float_exception_flags;
 
-    if (unlikely(tstat.float_exception_flags & float_flag_invalid)) {
-        if (float128_is_signaling_nan(xb->f128, &tstat)) {
-            float_invalid_op_vxsnan(env, GETPC());
-            t.f128 = float128_snan_to_qnan(t.f128);
-        }
+    if (unlikely(tstat.float_exception_flags & float_flag_invalid_snan)) {
+        float_invalid_op_vxsnan(env, GETPC());
+        t.f128 = float128_snan_to_qnan(t.f128);
     }
 
     helper_compute_fprf_float128(env, t.f128);
-- 
2.25.1


