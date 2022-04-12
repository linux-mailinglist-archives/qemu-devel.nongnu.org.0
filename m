Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E1E64FCAAE
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Apr 2022 02:52:57 +0200 (CEST)
Received: from localhost ([::1]:56616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ne4m8-0005Tl-Ec
	for lists+qemu-devel@lfdr.de; Mon, 11 Apr 2022 20:52:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ne4Tf-0001vk-Cr
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 20:33:52 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:46923)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ne4Tb-0001sB-ID
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 20:33:49 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 h15-20020a17090a054f00b001cb7cd2b11dso1037967pjf.5
 for <qemu-devel@nongnu.org>; Mon, 11 Apr 2022 17:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=R71DKHnNpsszAqAd9gp7Tv5CqWiO0+QYaifaOUiuVt4=;
 b=o3vtlF5jyJRiHIqbh36aOpY+arnfp7JyqfPTk2aWKciVTJZ52kkSw8h//l1nRgDpup
 JUYk+NdzxsTcNN/0ypblg+8JrEZsdcbIk9Uj9pm49FWaNo2DrXtJjE8b0Il9HEpCfxEf
 U2Mk8HxgMT5LvVZWZd3E8r7ZDB22hioPCLYsAfPuXYuTeEVx+SOsn+AfVxhiXh8taxOa
 pwTV2/0JiLEraEUPZTDSNXCAMQVEtXZO1DEFFl53Tl34ylVki3VemR3oG7YUGWO0jYT9
 5iFxxocd2+s5V0gSJjxoBzVwQeNXk637vY9OvBrakCoU9Lh4Sa4mtn16CmdDECOiQMl6
 D6Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=R71DKHnNpsszAqAd9gp7Tv5CqWiO0+QYaifaOUiuVt4=;
 b=pMVNpO85glee2LsHRcYNTTxL91wF4WJUNCZ4PQPZSMgOH/RhURamMegWyABCM+PN5b
 QNnDKypSrRWjbx31pmTpTRBKAM9BLN+KLGLIRUiPMEyck37dBVHd9hD75OEt2GpVBU3M
 uyzSKfztkwan4SqS7qIQMCQQFToPCeo584AFxf841mWYmhHGfetCPgL+UxtYVrmaFoP3
 QwdbI/aNRbJUU2B2l96WNPp0ymPhTDlOaPxrApi+o1+ERCYQ8LxzxncCnK/ChkeIaCsi
 W72B05nj+Xj1oHGDpL8tpCMFHOYGcXI1wodBmxDlvjFnZ8/CbmY6EpU7est4I2yiTftE
 MqWg==
X-Gm-Message-State: AOAM533AizbWs+/ltHBJxtwVGdBKachdSx/7qNp47pjPPYqcUF0UEdMH
 b1qP2K5V/nOjFz9SAjRXtYA24dBmrGZ/DA==
X-Google-Smtp-Source: ABdhPJw+7VlyqEgAVyKNHaJT0A5IgLSUBfy2aGdIu5aLwucNr6gJSzliLxGdB8QpEicIiYOwq8mYbg==
X-Received: by 2002:a17:902:74cb:b0:158:2f25:4051 with SMTP id
 f11-20020a17090274cb00b001582f254051mr15847457plt.29.1649723622316; 
 Mon, 11 Apr 2022 17:33:42 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 g15-20020a056a0023cf00b004e17e11cb17sm38346669pfc.111.2022.04.11.17.33.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Apr 2022 17:33:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 16/24] target/arm: Enable FEAT_RAS for -cpu max
Date: Mon, 11 Apr 2022 17:33:18 -0700
Message-Id: <20220412003326.588530-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220412003326.588530-1-richard.henderson@linaro.org>
References: <20220412003326.588530-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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
index c89c344de1..35b6f7d4de 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -41,6 +41,7 @@ the following architecture extensions:
 - FEAT_PMULL (PMULL, PMULL2 instructions)
 - FEAT_PMUv3p1 (PMU Extensions v3.1)
 - FEAT_PMUv3p4 (PMU Extensions v3.4)
+- FEAT_RAS (Reliability, availability, and serviceability)
 - FEAT_RDM (Advanced SIMD rounding double multiply accumulate instructions)
 - FEAT_RNG (Random number generator)
 - FEAT_SB (Speculation Barrier)
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 9bed76342f..3525aba610 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -744,6 +744,7 @@ static void aarch64_max_initfn(Object *obj)
     t = cpu->isar.id_aa64pfr0;
     t = FIELD_DP64(t, ID_AA64PFR0, FP, 1);        /* FEAT_FP16 */
     t = FIELD_DP64(t, ID_AA64PFR0, ADVSIMD, 1);   /* FEAT_FP16 */
+    t = FIELD_DP64(t, ID_AA64PFR0, RAS, 1);       /* FEAT_RAS */
     t = FIELD_DP64(t, ID_AA64PFR0, SVE, 1);
     t = FIELD_DP64(t, ID_AA64PFR0, SEL2, 1);      /* FEAT_SEL2 */
     t = FIELD_DP64(t, ID_AA64PFR0, DIT, 1);       /* FEAT_DIT */
diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index 4ff4f30e89..4aa2eb0841 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -68,6 +68,7 @@ void arm32_max_features(ARMCPU *cpu)
 
     t = cpu->isar.id_pfr0;
     t = FIELD_DP32(t, ID_PFR0, DIT, 1);           /* FEAT_DIT */
+    t = FIELD_DP32(t, ID_PFR0, RAS, 1);           /* FEAT_RAS */
     cpu->isar.id_pfr0 = t;
 
     t = cpu->isar.id_pfr2;
-- 
2.25.1


