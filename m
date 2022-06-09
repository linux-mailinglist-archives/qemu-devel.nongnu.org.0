Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94735544B17
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 13:56:49 +0200 (CEST)
Received: from localhost ([::1]:44772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzGmN-0006rq-B0
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 07:56:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzE7X-0001d7-TT
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 05:06:28 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:34251)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzE7W-00067c-98
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 05:06:27 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 p6-20020a05600c1d8600b0039c630b8d96so432920wms.1
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 02:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=tECKDbH/4mwcOqBc4mXupaexcp4butR2eX7BFSU01YQ=;
 b=mTxweZhmwelgUUrFdCBV+SagYHBM8i4WTuasMM088/5EVcGSTkyBfhyKnikeGxOG5e
 UcWljrSt/086LLSCVRM6WmJqGzO+VrGvDqTC5AfSDiKQrET5aqtk7JtOpHqpfp/jXI0h
 FHzhhdHk1wuNx5UCr7zHFTvTs+QzB6+yc6QMNnfj/D6Aulu017huSaBKRI6VDyaGKMoq
 gTZRu3mnWse40o5ZkEOA8yYJAl4cwPwl6xRqcvWbr+G5HSWjYcPyWwtA73rNeTkCVaMY
 /WiErQbLBNgGmWNYrTuCnSgdhB5UJ+vNStObQlJqGV+fwtYUF+0whTc/KeIiFKupUl3e
 Gmzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tECKDbH/4mwcOqBc4mXupaexcp4butR2eX7BFSU01YQ=;
 b=scDD3HchEvW4aKE444YvGKq8YebopU2fa980I7DfnfgKGakIntp0VhOeTKd9iyuMPS
 rLMQRzTHH7sGcTp5nymdZ6XA0Ck6uQApRcqRLoxvBEA4en0LbS1gp4qS7SQmjLNc705S
 asOK6vhzwqojS60SNJSt0LdI5u9c62gTNxfg24615GEj/X/q6R3z5Xno0OWuPTvOpbO8
 C0HyqKaXxnCT7acgbBGimpqrgxkYWxVGZGiV5z5pJr7/M1EpDhy666a+tRRbJQPRSPUO
 LZtbsCgRRhoyJGmkFrDL1J3zMQ/7EIyEKEBpxwr/22QKg2OKYFJ1zFhoTj8aBPXYD76v
 yDFQ==
X-Gm-Message-State: AOAM532CmSvuNnd+znAxiCRlNbqTyb2TsCb1NBSZIyK5nzgEN7f9R5rh
 8moV+EGpbfpjYx7lwLYA6dFJGoPvD7JZTg==
X-Google-Smtp-Source: ABdhPJz1RA7TOHTMcX7TfvwriU+nWrbuVs4gZ+8r1No7+FP9hKjqkhrRLqWUlistYpcEKtGYEOr5wA==
X-Received: by 2002:a7b:c31a:0:b0:39c:4783:385e with SMTP id
 k26-20020a7bc31a000000b0039c4783385emr2248879wmj.185.1654765584789; 
 Thu, 09 Jun 2022 02:06:24 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 c13-20020adffb0d000000b002183cf9cd69sm11349796wrr.15.2022.06.09.02.06.24
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 02:06:24 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 42/55] target/arm: Use el_is_in_host for sve_exception_el
Date: Thu,  9 Jun 2022 10:05:24 +0100
Message-Id: <20220609090537.1971756-43-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220609090537.1971756-1-peter.maydell@linaro.org>
References: <20220609090537.1971756-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

The ARM pseudocode function CheckNormalSVEEnabled uses this
predicate now, and I think it's a bit clearer.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220607203306.657998-8-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 6b17c0f507f..40b60b1eea2 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6170,9 +6170,7 @@ static const ARMCPRegInfo minimal_ras_reginfo[] = {
 int sve_exception_el(CPUARMState *env, int el)
 {
 #ifndef CONFIG_USER_ONLY
-    uint64_t hcr_el2 = arm_hcr_el2_eff(env);
-
-    if (el <= 1 && (hcr_el2 & (HCR_E2H | HCR_TGE)) != (HCR_E2H | HCR_TGE)) {
+    if (el <= 1 && !el_is_in_host(env, el)) {
         switch (FIELD_EX64(env->cp15.cpacr_el1, CPACR_EL1, ZEN)) {
         case 1:
             if (el != 0) {
@@ -6189,6 +6187,7 @@ int sve_exception_el(CPUARMState *env, int el)
      * CPTR_EL2 changes format with HCR_EL2.E2H (regardless of TGE).
      */
     if (el <= 2) {
+        uint64_t hcr_el2 = arm_hcr_el2_eff(env);
         if (hcr_el2 & HCR_E2H) {
             switch (FIELD_EX64(env->cp15.cptr_el[2], CPTR_EL2, ZEN)) {
             case 1:
-- 
2.25.1


