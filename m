Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77FE351DEFB
	for <lists+qemu-devel@lfdr.de>; Fri,  6 May 2022 20:19:43 +0200 (CEST)
Received: from localhost ([::1]:59282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nn2YI-000116-JX
	for lists+qemu-devel@lfdr.de; Fri, 06 May 2022 14:19:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nn2IQ-00060r-6K
 for qemu-devel@nongnu.org; Fri, 06 May 2022 14:03:19 -0400
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331]:35635)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nn2IN-0003rP-E2
 for qemu-devel@nongnu.org; Fri, 06 May 2022 14:03:17 -0400
Received: by mail-ot1-x331.google.com with SMTP id
 z5-20020a9d62c5000000b00606041d11f1so5424820otk.2
 for <qemu-devel@nongnu.org>; Fri, 06 May 2022 11:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=a7uvCKLLLjt6QC4udYfjSRWYfdLyPP29aktinhFaEDs=;
 b=nOVCrE4DhyinVWLnYHIJublaDDaVYrOVUuu0iAi6RSyOMNXySK8UDDnYYSx07gnfRB
 5pjC4vpOlKaHCTnoP1h/+kPnuTJOvBOTJuY0T1mOzxIJ5QNYh9GUOEJjKGjZCOyEigGE
 Kp9ydpdGQLp5J8dkexg1oT+dYazNqxkvJIhYDZTkuPiO8zb4ZtFQhUoaeEaH3JufH2Xc
 COP6iGRck558Jc2VlJF/4Yhn3mq8VNeCxNhCByi5MPhaaPjqjfa9/fHM7xSD2/3epTkq
 P7habZVl9U7ZkrwCXWsm0vw2stpY63vbZDU3pN4VYh7cP6jcmm2W/F8GY+8luE29kofx
 GjlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=a7uvCKLLLjt6QC4udYfjSRWYfdLyPP29aktinhFaEDs=;
 b=5x0+owql+P4aEBQGfwVZ0dy+WmS0uWIgFw0zqKyt+nDRaKYPMQCTMZjyJTSXqcQnTs
 n3oeY2JbyLT7DGykQvbEOP6ra9rr4JxmmtYnONwvoQIIr7FPGGLJ6Mj2VvDe5MNzEu9P
 P3D+7/5Pg3ZFCzcGPUreuRa3BOb6C7SzwP3Tf+sY4p4W5uY0pXSjWOHLILxcqCx8a0RJ
 1Iffi2sorgLOZYCtbVWh8709wnj683imuz1A4WqzWkOlNXOSFG0nFIQ9qQEoGARm1xtZ
 m46fQmfpCM1Q8M0r5+K61heav5412ZrlPkP+vtOD8p+/1zoYoFkJz2YvLbjqD59uUpkm
 ft+A==
X-Gm-Message-State: AOAM531sTrHs2TPt/xTRcVNBZjX/za8XdH4LLL8kyRfTD4OGpF6cefQs
 BYnlHHB6OkYZjX5bWcYzqMxgf7Jq5zNFZ6Dg
X-Google-Smtp-Source: ABdhPJwW8k8s3tIoefPwAa5uWOi0R6xA9F2fYxc3u/IKmQsFvhMOApicPic4z9ccRht43QQJ/4mXcQ==
X-Received: by 2002:a05:6830:1099:b0:605:fa6e:ac2a with SMTP id
 y25-20020a056830109900b00605fa6eac2amr1479809oto.305.1651860193587; 
 Fri, 06 May 2022 11:03:13 -0700 (PDT)
Received: from stoup.. ([2607:fb90:5fe1:b497:51bb:ba21:d1a7:eac2])
 by smtp.gmail.com with ESMTPSA id
 e4-20020a056870c0c400b000e686d1389esm1780002oad.56.2022.05.06.11.03.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 May 2022 11:03:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v6 17/24] target/arm: Enable FEAT_RAS for -cpu max
Date: Fri,  6 May 2022 13:02:35 -0500
Message-Id: <20220506180242.216785-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220506180242.216785-1-richard.henderson@linaro.org>
References: <20220506180242.216785-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::331;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x331.google.com
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
index 0acac6347c..8110408000 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -42,6 +42,7 @@ the following architecture extensions:
 - FEAT_PMULL (PMULL, PMULL2 instructions)
 - FEAT_PMUv3p1 (PMU Extensions v3.1)
 - FEAT_PMUv3p4 (PMU Extensions v3.4)
+- FEAT_RAS (Reliability, availability, and serviceability)
 - FEAT_RDM (Advanced SIMD rounding double multiply accumulate instructions)
 - FEAT_RNG (Random number generator)
 - FEAT_SB (Speculation Barrier)
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 88d3cef93e..35881c74b2 100644
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
index 337598e949..c5cf7efe95 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -69,6 +69,7 @@ void aa32_max_features(ARMCPU *cpu)
 
     t = cpu->isar.id_pfr0;
     t = FIELD_DP32(t, ID_PFR0, DIT, 1);           /* FEAT_DIT */
+    t = FIELD_DP32(t, ID_PFR0, RAS, 1);           /* FEAT_RAS */
     cpu->isar.id_pfr0 = t;
 
     t = cpu->isar.id_pfr2;
-- 
2.34.1


