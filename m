Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADAC36A4F24
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 00:00:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWmSD-0001RQ-K3; Mon, 27 Feb 2023 17:58:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWmSB-0001Q8-KW
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 17:58:43 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWmSA-0008Vc-2F
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 17:58:43 -0500
Received: by mail-pl1-x62e.google.com with SMTP id i3so8492199plg.6
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 14:58:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pUw/Q9WV6uI2o5+wRzg6/DeRVdVBmeUlUspfEoqm0lE=;
 b=vECubhlKRdQsN3lP8ZDYsjEKaVPJU7IbO2Bi8mzQPB6UOv7S2WTn3+w4fr8Ba6PlJ5
 0B+EkahIrihV88wCB5zYCRFbUWLtnSNNXB1mYZ9aFE8o7QXF16rw9yZc6ADmhKLhUVeS
 Qpx2TZfgco2oVSGtNVcIDADi3VdreXHMHyL8H3BRWrs6015roN0+dKGPdQP1+wNLehwz
 2Pm1zbVWyI4zZrvo+glxMCmJmEj2KK/NqvdUv5Sl6w7uxewrQ4PxjOpO5U9FT8orU81g
 H6BPHLWOcjdL91Hpv5L9FnvN5wH58IUvub6HhLpJ9qZgxDcUoAlCppOMf3Lm1S3pOchS
 xx6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pUw/Q9WV6uI2o5+wRzg6/DeRVdVBmeUlUspfEoqm0lE=;
 b=TFWK/RHtlP8U3N7qUTr+i7CADVinQFV8aIdWLo0W7IrkIqKoNeGLcqzgOrlChvjIHO
 ARqmQ3LA+Gjkx3hxgTyHK4BnbP6zgqLK0SWH7hO593UXHbjR4qO6Q4cQUuVodLtYQZY0
 fIUAbd0qlATj1J8U7Sgvu7Ls9sAM1a0JsRjHSTLGkHRqnPkViGI/B2/hOnpybMk65j61
 KtOCGwfL2khM7pENhh0iXBRf0YuWBjYrmbLbARSaOSihIl/ZYHUHuS3XRsQP0S+hmOEj
 YcBf8zi+uGQL5k3AbahLtWaZGT0E297c6sb7EsOCc5nHl6DTMnGwg+GbQAUXE3QcTRvj
 c/0w==
X-Gm-Message-State: AO0yUKXQ3H3R/U0eUvdj8qVqed6z1V1Db27DfL18fXtVsFtrPgkirgpP
 FrzSXkMz+xSO6gtKo1EDbr5nvN/Z06Qon8FTNE4=
X-Google-Smtp-Source: AK7set/6MaWdpOf7eIWaCjsp11jMQxRfjx41+UoheAxKTRgjXcceybTo24lxvLElAEIxgIQLTI3KJg==
X-Received: by 2002:a05:6a20:691b:b0:cd:a358:bb7 with SMTP id
 q27-20020a056a20691b00b000cda3580bb7mr972153pzj.37.1677538720613; 
 Mon, 27 Feb 2023 14:58:40 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 c2-20020a6566c2000000b00503000f0492sm4441050pgw.14.2023.02.27.14.58.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 14:58:40 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH for-8.0 v4 3/4] target/arm: Diagnose incorrect usage of
 arm_is_secure subroutines
Date: Mon, 27 Feb 2023 12:58:31 -1000
Message-Id: <20230227225832.816605-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227225832.816605-1-richard.henderson@linaro.org>
References: <20230227225832.816605-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

In several places we use arm_is_secure_below_el3 and
arm_is_el3_or_mon separately from arm_is_secure.
These functions make no sense for m-profile, and
would indicate prior incorrect feature testing.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 7a2f804aeb..cb4e405f04 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2389,7 +2389,8 @@ static inline int arm_feature(CPUARMState *env, int feature)
 void arm_cpu_finalize_features(ARMCPU *cpu, Error **errp);
 
 #if !defined(CONFIG_USER_ONLY)
-/* Return true if exception levels below EL3 are in secure state,
+/*
+ * Return true if exception levels below EL3 are in secure state,
  * or would be following an exception return to that level.
  * Unlike arm_is_secure() (which is always a question about the
  * _current_ state of the CPU) this doesn't care about the current
@@ -2397,6 +2398,7 @@ void arm_cpu_finalize_features(ARMCPU *cpu, Error **errp);
  */
 static inline bool arm_is_secure_below_el3(CPUARMState *env)
 {
+    assert(!arm_feature(env, ARM_FEATURE_M));
     if (arm_feature(env, ARM_FEATURE_EL3)) {
         return !(env->cp15.scr_el3 & SCR_NS);
     } else {
@@ -2410,6 +2412,7 @@ static inline bool arm_is_secure_below_el3(CPUARMState *env)
 /* Return true if the CPU is AArch64 EL3 or AArch32 Mon */
 static inline bool arm_is_el3_or_mon(CPUARMState *env)
 {
+    assert(!arm_feature(env, ARM_FEATURE_M));
     if (arm_feature(env, ARM_FEATURE_EL3)) {
         if (is_a64(env) && extract32(env->pstate, 2, 2) == 3) {
             /* CPU currently in AArch64 state and EL3 */
-- 
2.34.1


