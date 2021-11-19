Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0E704572BD
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 17:20:58 +0100 (CET)
Received: from localhost ([::1]:34860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mo6dF-0007PJ-QP
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 11:20:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mo6OU-0005Mi-ER
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 11:05:44 -0500
Received: from [2a00:1450:4864:20::42f] (port=44789
 helo=mail-wr1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mo6OO-0004Cw-4V
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 11:05:40 -0500
Received: by mail-wr1-x42f.google.com with SMTP id n29so18917012wra.11
 for <qemu-devel@nongnu.org>; Fri, 19 Nov 2021 08:05:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TRfc/RFSZ/tSn5hrRAh3s014f/r4fo5NoHM3mYm54cI=;
 b=AIBM680nBipdPfuCXb0EEx89RHiqWGV+MoLlD21DBHRtUfBDiHHD71PP17u02qgQe9
 uCpHw5qiGVm+Wt8JRlVQIHyN8V+K2w2/T/RHmvMS3eTaXeRk2uFqL6YrM7yLTIUUFrli
 NEBV+uegS7cQjr/CS/GS2vWfvVdpvACo1TyP01WGoP1+EKdtQqBLOzm5kjHIUMQrwvy3
 +PJJU334m9zMav7IOAjL2MJqYAsMFsOXJ7zlzY/gNPgBew4M5/vz90WYFcuSpQHYLi4O
 Fn+DBG4Y7Ju2ztwiuzjQEpmvzojkvTuK/hA6kxIjtB9PFjOsLoLB4aeQ0TatPQPEHiin
 2ldw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TRfc/RFSZ/tSn5hrRAh3s014f/r4fo5NoHM3mYm54cI=;
 b=mV2yUVaPTm5gof5uj3q5otIJbM71r911BmC0W51kfRG6lqShKUfc7Flqdkq0YYYkJw
 GHnd8f/g+dbqkhQoHoxZQ5EGhaktpv+fEoRUiSj4OZMkOlX4N4hAQ4WadAv/BJBmqXYC
 XsUO5RHd+84OHVHbwKs8+TC2+T8EME6wqWVhwFt/U9AiOBSZKlkSznWePNG6EnEyaT2W
 AVgC1efI7LQnWKdW5S5ZHtH4injddPpI/OrEFILGQbN7OIf3jctmowCBS5qXZUysBysJ
 Mw+1A8Yvz2cd3gdUdbIInsLAhIrDE/QXK8TRwLRv8BkFIcVHxURNMYPBJRBuHD9xRvnG
 Ehyg==
X-Gm-Message-State: AOAM532FBtexnnkiKMLxen7/WlBqkMhdChXfVKYO05AuxgKqXXl+Gyp5
 zOSouAP0jNAnfkE2TVoIfwKC2aqdp3AIK6FM9uM=
X-Google-Smtp-Source: ABdhPJza/Zll+WMl99rtu0Wg1S5b8ufB3xeRrLA4rfcPIQTMuKOODipiB+X7J2BK7G6aKqZ31+LCSA==
X-Received: by 2002:a05:6000:2a4:: with SMTP id
 l4mr8926686wry.238.1637337933660; 
 Fri, 19 Nov 2021 08:05:33 -0800 (PST)
Received: from localhost.localdomain
 (165.red-37-158-79.dynamicip.rima-tde.net. [37.158.79.165])
 by smtp.gmail.com with ESMTPSA id q84sm14044877wme.3.2021.11.19.08.05.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 08:05:33 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 11/35] target/ppc: Move float_check_status from FPU_FCTI to
 translate
Date: Fri, 19 Nov 2021 17:04:38 +0100
Message-Id: <20211119160502.17432-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211119160502.17432-1-richard.henderson@linaro.org>
References: <20211119160502.17432-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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

Fixes a bug in which e.g XE enabled causes inexact to be raised
before the writeback to the architectural register.

All of the users of GEN_FLOAT_B either set set_fprf, or are one
of the convert-to-integer instructions that require this behaviour.
Split out the two gen_helper_* calls in gen_compute_fprf_float64
and protect only the first with set_fprf.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/fpu_helper.c            | 9 +++------
 target/ppc/translate/fp-impl.c.inc | 3 ++-
 2 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
index 2ab34236a3..0d58fd82a6 100644
--- a/target/ppc/fpu_helper.c
+++ b/target/ppc/fpu_helper.c
@@ -552,12 +552,9 @@ uint64_t helper_##op(CPUPPCState *env, float64 arg)                    \
     uint64_t ret = float64_to_##cvt(arg, &env->fp_status);             \
     int status = get_float_exception_flags(&env->fp_status);           \
                                                                        \
-    if (unlikely(status)) {                                            \
-        if (status & float_flag_invalid) {                             \
-            float_invalid_cvt(env, 1, GETPC(), float64_classify(arg)); \
-            ret = nanval;                                              \
-        }                                                              \
-        do_float_check_status(env, GETPC());                           \
+    if (unlikely(status & float_flag_invalid)) {                       \
+        float_invalid_cvt(env, 1, GETPC(), float64_classify(arg));     \
+        ret = nanval;                                                  \
     }                                                                  \
     return ret;                                                        \
 }
diff --git a/target/ppc/translate/fp-impl.c.inc b/target/ppc/translate/fp-impl.c.inc
index c9e05201d9..aad97a12e8 100644
--- a/target/ppc/translate/fp-impl.c.inc
+++ b/target/ppc/translate/fp-impl.c.inc
@@ -157,8 +157,9 @@ static void gen_f##name(DisasContext *ctx)                                    \
     gen_helper_f##name(t1, cpu_env, t0);                                      \
     set_fpr(rD(ctx->opcode), t1);                                             \
     if (set_fprf) {                                                           \
-        gen_compute_fprf_float64(t1);                                         \
+        gen_helper_compute_fprf_float64(cpu_env, t1);                         \
     }                                                                         \
+    gen_helper_float_check_status(cpu_env);                                   \
     if (unlikely(Rc(ctx->opcode) != 0)) {                                     \
         gen_set_cr1_from_fpscr(ctx);                                          \
     }                                                                         \
-- 
2.25.1


