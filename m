Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C38CF4572CF
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 17:23:34 +0100 (CET)
Received: from localhost ([::1]:43186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mo6fl-0004nD-Sa
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 11:23:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mo6Oc-0005UU-Dv
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 11:05:50 -0500
Received: from [2a00:1450:4864:20::330] (port=36647
 helo=mail-wm1-x330.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mo6Oa-0004I4-KG
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 11:05:50 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 i8-20020a7bc948000000b0030db7b70b6bso10873589wml.1
 for <qemu-devel@nongnu.org>; Fri, 19 Nov 2021 08:05:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=s7EfQpdLCHZf6QMUUM6cZX2T9EjRc0bCKi3InTs2Bf4=;
 b=oN0Payc1KdvQt/frd+8tdypM6VnvGDgj6AacPRA8rZfr34RhKbL7srm9s1uoBJOAw/
 rFtbR83yy/wHGA/ZN8Z/6c/rJ5FGIRddbO+KGCdhX3ZLfcNJm4n0ru0QzTzKurrdM4jQ
 SyVakHLMfNHbK69iGqYBnt2pB2b0NtS9qA8Rvl5O74IMlnssQ7rJwU3xgi8Mvp4XGoSv
 DbWkCvroTJ/M1xuj1j74qoZqmZcyPv1UXOed6AqdtWsjHFX6Wb/igJot0ryqH1j2HZKF
 nSsaE1vMIrbg2vP3t3jVcoVdn8+vaR8VAQ3h8t5z+qF9FoTFy7DhbjGqy6HIpk0cuNGU
 lqEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=s7EfQpdLCHZf6QMUUM6cZX2T9EjRc0bCKi3InTs2Bf4=;
 b=4o0iI6Hd4KE/qqy4Xv/B3bFBYusdcSXMtsfFS5NQ5avsoZG8TWg5H+XuvGSVG/ejPb
 VW2YalHb5Hnt9svrC8pzUhfdzme/s+v484anYx409Mv4mtHFwQErwWAi52MPmh6c9Vsr
 YAyEvskVt/fuCbc8gD8KGljHknOIqXvvuFG/cjL4Y8SMcRsNgBcHRX6U00PzzJoqPcYw
 xL7fKSdI8GkWGC/tSA10XOJSyGV7tJFkhLgXYQOl+3kPHU4WHR5K4nYPlvtQBHcWtorO
 DUVthNDDb6HKyyWfzvH6U89Jd0trvWnzhcZwN91+oGi/naoSMR/tA2S/IVZKrtfQQWxn
 hXjA==
X-Gm-Message-State: AOAM5310Ysz5j1InoH32Y1p90vs5Znq1NT10Hz5c5uars5ApHR/F7a+8
 xTV3U4eTmO1SpXlUwWsPRMklhUPxbrxX5FrYJWg=
X-Google-Smtp-Source: ABdhPJwD0vf/iQ1nuBK+gAIOzEcjb5ErxPSGnSsc+3le88z0/V8uo+oqhjgC0wmXAEp+2ETYCjhTIw==
X-Received: by 2002:a7b:cf25:: with SMTP id m5mr883885wmg.51.1637337946897;
 Fri, 19 Nov 2021 08:05:46 -0800 (PST)
Received: from localhost.localdomain
 (165.red-37-158-79.dynamicip.rima-tde.net. [37.158.79.165])
 by smtp.gmail.com with ESMTPSA id q84sm14044877wme.3.2021.11.19.08.05.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 08:05:46 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 16/35] target/ppc: Tidy inexact handling in do_fri
Date: Fri, 19 Nov 2021 17:04:43 +0100
Message-Id: <20211119160502.17432-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211119160502.17432-1-richard.henderson@linaro.org>
References: <20211119160502.17432-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::330
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x330.google.com
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

In GEN_FLOAT_B, we called helper_reset_fpstatus immediately
before calling helper_fri*.  Therefore get_float_exception_flags
is known to be zero, and this code can be simplified.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/fpu_helper.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
index 535002741a..ec0288df01 100644
--- a/target/ppc/fpu_helper.c
+++ b/target/ppc/fpu_helper.c
@@ -606,16 +606,12 @@ static uint64_t do_fri(CPUPPCState *env, uint64_t arg,
         float_invalid_op_vxsnan(env, GETPC());
         farg.ll = arg | 0x0008000000000000ULL;
     } else {
-        int inexact = get_float_exception_flags(&env->fp_status) &
-                      float_flag_inexact;
         set_float_rounding_mode(rounding_mode, &env->fp_status);
         farg.ll = float64_round_to_int(farg.d, &env->fp_status);
         set_float_rounding_mode(old_rounding_mode, &env->fp_status);
 
         /* fri* does not set FPSCR[XX] */
-        if (!inexact) {
-            env->fp_status.float_exception_flags &= ~float_flag_inexact;
-        }
+        env->fp_status.float_exception_flags &= ~float_flag_inexact;
     }
     do_float_check_status(env, GETPC());
     return farg.ll;
-- 
2.25.1


