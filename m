Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AE6B4572CD
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 17:23:08 +0100 (CET)
Received: from localhost ([::1]:41716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mo6fL-0003o6-Ml
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 11:23:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mo6Of-0005c1-CZ
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 11:05:53 -0500
Received: from [2a00:1450:4864:20::334] (port=50927
 helo=mail-wm1-x334.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mo6Od-0004Iz-L1
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 11:05:53 -0500
Received: by mail-wm1-x334.google.com with SMTP id 133so9006387wme.0
 for <qemu-devel@nongnu.org>; Fri, 19 Nov 2021 08:05:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wryGVpZb06m25zx5Ni2rv3/SjWRLXHAAknrwCXzqExE=;
 b=T7y43h8yTZU7KC2hbppEPJzpQE0AFnfnWnxTwKwsaefnR0ZRSXDQgw+HLB2ny7pKUv
 TW1MEjECrdpjuSiuagpw8zpJsTMqctO6Plg/ZNVl4dGxt8zsv0qlSreQATNaXnvSquLk
 DIP3f2PhLfaoZLndLDhtnP9TMB+VlDo+jq0/Nvk1yTv0/1TctswR1GqYoIbd0X0ifw8V
 IGy0DHGP6/u7nDZCTz+ITsMBavkhP76+g9KPiS/4I1jnR+ekbxX4YbACWTE4CLfjkB5l
 aa/jnxUIYnT6XYh2ZD6qQseGfLqHQz3H+6Xnb2tqjvyQzvyifx5n46kITL9oFNT3jSNV
 d/XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wryGVpZb06m25zx5Ni2rv3/SjWRLXHAAknrwCXzqExE=;
 b=HDIaFr5mciMLyydbaGKuaAaEgv7VysUCNEeX/Ka85FlFRW9OHU4jS59FgxrWTx4Jdp
 Ya9XWOrgFOtCLDR3EkCz8pCJ+ge3mfIztynaSYQnyEwkBjuw/WfFoCP63/vFAinpHsa0
 k0PgaUZd7ubO4gqPsYjjGT2BwG7OKlFHAXg1HWQhmBVTJBIIf83V/1hi6fquRfN/fF5n
 gPPqWRmLMzfb+Nal/uY0EEfli/J0Ss5EKhrfsTVitl+bORCXJv2T2Vxo7ljVQfNCJcFD
 1rZzwJNQfp2/h2FnlyZ7wsMNJZP6TViXJudtVDfes0T7jCHPTK+1ocpPRdFLNa8VrJpm
 EKyg==
X-Gm-Message-State: AOAM530+yXd31O2UMoMrpgIDE8eRLaCKKc57agyThwxPWOvdg7s+H/Be
 1rWUkCC4baquQ+0LoLawe5rq3GbffvPJUvclB2M=
X-Google-Smtp-Source: ABdhPJwfJdnbVu8XBXs9OyU2yiRAjZ3PwUeVoIv3RhSYv3y/o4uuljp48c4N6pwSQXbtJ1hWTy++qA==
X-Received: by 2002:a1c:448b:: with SMTP id r133mr877343wma.85.1637337949255; 
 Fri, 19 Nov 2021 08:05:49 -0800 (PST)
Received: from localhost.localdomain
 (165.red-37-158-79.dynamicip.rima-tde.net. [37.158.79.165])
 by smtp.gmail.com with ESMTPSA id q84sm14044877wme.3.2021.11.19.08.05.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 08:05:48 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 17/35] target/ppc: Clean up do_fri
Date: Fri, 19 Nov 2021 17:04:44 +0100
Message-Id: <20211119160502.17432-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211119160502.17432-1-richard.henderson@linaro.org>
References: <20211119160502.17432-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::334
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x334.google.com
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

Let float64_round_to_int detect and silence snans.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/fpu_helper.c | 24 +++++++++++-------------
 1 file changed, 11 insertions(+), 13 deletions(-)

diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
index ec0288df01..3a462e5596 100644
--- a/target/ppc/fpu_helper.c
+++ b/target/ppc/fpu_helper.c
@@ -596,25 +596,23 @@ FPU_FCFI(fcfidus, uint64_to_float32, 1)
 static uint64_t do_fri(CPUPPCState *env, uint64_t arg,
                        FloatRoundMode rounding_mode)
 {
-    CPU_DoubleU farg;
     FloatRoundMode old_rounding_mode = get_float_rounding_mode(&env->fp_status);
+    int flags;
 
-    farg.ll = arg;
+    set_float_rounding_mode(rounding_mode, &env->fp_status);
+    arg = float64_round_to_int(arg, &env->fp_status);
+    set_float_rounding_mode(old_rounding_mode, &env->fp_status);
 
-    if (unlikely(float64_is_signaling_nan(farg.d, &env->fp_status))) {
-        /* sNaN round */
+    flags = get_float_exception_flags(&env->fp_status);
+    if (flags & float_flag_invalid_snan) {
         float_invalid_op_vxsnan(env, GETPC());
-        farg.ll = arg | 0x0008000000000000ULL;
-    } else {
-        set_float_rounding_mode(rounding_mode, &env->fp_status);
-        farg.ll = float64_round_to_int(farg.d, &env->fp_status);
-        set_float_rounding_mode(old_rounding_mode, &env->fp_status);
-
-        /* fri* does not set FPSCR[XX] */
-        env->fp_status.float_exception_flags &= ~float_flag_inexact;
     }
+
+    /* fri* does not set FPSCR[XX] */
+    set_float_exception_flags(flags & ~float_flag_inexact, &env->fp_status);
     do_float_check_status(env, GETPC());
-    return farg.ll;
+
+    return arg;
 }
 
 uint64_t helper_frin(CPUPPCState *env, uint64_t arg)
-- 
2.25.1


