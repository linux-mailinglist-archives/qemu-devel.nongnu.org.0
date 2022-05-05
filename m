Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D981951C94A
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 21:35:22 +0200 (CEST)
Received: from localhost ([::1]:49020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmhFx-0002tR-UV
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 15:35:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nmgYg-00036W-Mw
 for qemu-devel@nongnu.org; Thu, 05 May 2022 14:50:39 -0400
Received: from mail-oa1-x2e.google.com ([2001:4860:4864:20::2e]:42475)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nmgYf-0004Oz-3v
 for qemu-devel@nongnu.org; Thu, 05 May 2022 14:50:38 -0400
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-edf3b6b0f2so4703822fac.9
 for <qemu-devel@nongnu.org>; Thu, 05 May 2022 11:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YgPJJBWxd6UwNbu8I9UhpjXUvb+eh/ewRL4C5SYoXZc=;
 b=UfSkOVchHfgBlrTVp+PH/kf8/Sfoel/eQSDwrU7RGWHkxroYJlEIVQQSNDKBepVn+x
 FOA1UgIigPqB/5XSEqLCqexNXUsHA9LV/BZjr01hD8x52vkCSVhmww6UPNuk4dKoulv0
 FRwNqlWcAmflCLGWA3dmww/XaJNRX2lpcu8zsQZmBtlq0eMAyIWG2OPPuepWiYglY+b8
 G9G/bv1+V0C+0JrsYaoNQBfmpUh0ekptK0mYbg7bcFYAO3AFG+m0DnBEXVqzZa++5wXW
 oHPM/YILqAe6N9qjcb29+UDEf0833INtYs7qGRxbkFjrNV3xFUJW1Qc4hAgtKVjgwGLq
 JjJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YgPJJBWxd6UwNbu8I9UhpjXUvb+eh/ewRL4C5SYoXZc=;
 b=HAyVIiud81tsBJjzkPERoJIeSRvPsR32XWrUmbdoMqWhLR7MbC5iyS+KBw/6oN5uV2
 cpPtyk1+RhOeWPZE+80LcvsXF/lDuVNEJDiyKAh5JzbCPWqtb8OxmDEuRz77bbojmK1N
 pdPpj81CrlPvCCb1gxO0+ERO/ACvNfeaF6lzws/dFKa+kJ0CgihaAhJxABZaL3YP3WwM
 mWbch/HXqvHa2+oqmezRMTehppAGiv8z0cAxzCuSitEzGzZ2CcFh6vGYCtREEwTaNqMl
 gvntuOvy85t1WC9gvzjeEvWgSAfsui8wwx6XAfqcGUxrcB1wFv0UoQVGusEC9imsn9yk
 G8CA==
X-Gm-Message-State: AOAM530tZBk+iqu1KFFgr7cotk9WpnL+NDdxqqbUuTLfRViQlWtPbwNx
 UzpLt7L2DklOqADAoiC3fQF7D+MeR5OYeagT
X-Google-Smtp-Source: ABdhPJzlfwdXKjNd2Ldu4AbeQL4WJlkulZVeVt3Va0+oDuew+ftWkfWJSbPgXTy9foFXSQCFQ8nkTw==
X-Received: by 2002:a05:6870:6013:b0:e5:e6f6:5379 with SMTP id
 t19-20020a056870601300b000e5e6f65379mr2946078oaa.67.1651776636353; 
 Thu, 05 May 2022 11:50:36 -0700 (PDT)
Received: from stoup.. ([2607:fb90:5fe8:83ea:bbf4:c9ef:4f3:11c6])
 by smtp.gmail.com with ESMTPSA id
 s36-20020a0568302aa400b0060603221259sm857273otu.41.2022.05.05.11.50.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 11:50:35 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v5 19/24] target/arm: Enable FEAT_CSV2 for -cpu max
Date: Thu,  5 May 2022 13:50:01 -0500
Message-Id: <20220505185006.200555-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220505185006.200555-1-richard.henderson@linaro.org>
References: <20220505185006.200555-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2e;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2e.google.com
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

This extension concerns branch speculation, which TCG does
not implement.  Thus we can trivially enable this feature.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Update emulation.rst
---
 docs/system/arm/emulation.rst | 1 +
 target/arm/cpu64.c            | 1 +
 target/arm/cpu_tcg.c          | 1 +
 3 files changed, 3 insertions(+)

diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index b200012d89..b2a3e2a437 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -12,6 +12,7 @@ the following architecture extensions:
 - FEAT_BBM at level 2 (Translation table break-before-make levels)
 - FEAT_BF16 (AArch64 BFloat16 instructions)
 - FEAT_BTI (Branch Target Identification)
+- FEAT_CSV2 (Cache speculation variant 2)
 - FEAT_DIT (Data Independent Timing instructions)
 - FEAT_DPB (DC CVAP instruction)
 - FEAT_Debugv8p2 (Debug changes for v8.2)
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 10410619f9..25fe74f928 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -748,6 +748,7 @@ static void aarch64_max_initfn(Object *obj)
     t = FIELD_DP64(t, ID_AA64PFR0, SVE, 1);
     t = FIELD_DP64(t, ID_AA64PFR0, SEL2, 1);      /* FEAT_SEL2 */
     t = FIELD_DP64(t, ID_AA64PFR0, DIT, 1);       /* FEAT_DIT */
+    t = FIELD_DP64(t, ID_AA64PFR0, CSV2, 1);      /* FEAT_CSV2 */
     cpu->isar.id_aa64pfr0 = t;
 
     t = cpu->isar.id_aa64pfr1;
diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index c5cf7efe95..762b961707 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -68,6 +68,7 @@ void aa32_max_features(ARMCPU *cpu)
     cpu->isar.id_mmfr4 = t;
 
     t = cpu->isar.id_pfr0;
+    t = FIELD_DP32(t, ID_PFR0, CSV2, 2);          /* FEAT_CVS2 */
     t = FIELD_DP32(t, ID_PFR0, DIT, 1);           /* FEAT_DIT */
     t = FIELD_DP32(t, ID_PFR0, RAS, 1);           /* FEAT_RAS */
     cpu->isar.id_pfr0 = t;
-- 
2.34.1


