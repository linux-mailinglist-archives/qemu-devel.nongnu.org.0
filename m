Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F375251C922
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 21:32:44 +0200 (CEST)
Received: from localhost ([::1]:40786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmhDQ-0005a5-2I
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 15:32:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nmgYf-000356-EF
 for qemu-devel@nongnu.org; Thu, 05 May 2022 14:50:37 -0400
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232]:44007)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nmgYc-0004O4-9b
 for qemu-devel@nongnu.org; Thu, 05 May 2022 14:50:36 -0400
Received: by mail-oi1-x232.google.com with SMTP id v65so5241033oig.10
 for <qemu-devel@nongnu.org>; Thu, 05 May 2022 11:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=a7uvCKLLLjt6QC4udYfjSRWYfdLyPP29aktinhFaEDs=;
 b=wlmt+Svnq8jPhiyQRsqbd/tMWpAxLdCmQXH1j0TLzSQ9vIv4uUhQ8vBx818C8k4ejw
 nYV/kBdUyXGDTbdE8qqNGNNjXlXVuuPk8HM86p615JwnagIV8uw+gncTtAT2rOOzkIDu
 JQsooZmlz0s6fIB1ojSB4m64qsnvV/EsyFvNSRc06nlQtXhO9ueTnYkKdBbNXMqFkCDG
 IUWV5xOzFLxyzoZzPhgrfUqBS+rmvSpWiu19okKDp95QG1Bc907J1MWU6MNSwTcz5HtA
 VLqE05hZAh9RD7waqOE/YyEcmANFRCbrhbtmyWUeL3Vlv8VA+SOyhTOsVY7hb1h/CxZB
 WAIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=a7uvCKLLLjt6QC4udYfjSRWYfdLyPP29aktinhFaEDs=;
 b=OoYuq7zwEjBexjndbXsRNSc2T1yx475y7uf51q5CgAxeyLC/RfI+EMS4CIfHnwFPda
 3LXtiWo5ZdPWzuhuhBz3/lAkl9sSlNSyf1yJkU6nZ2ediP+PUMvSjyqR7GKOJGJr80N0
 4HgCq42Yao3RLVVKF0U3b9wdztW55dKS9NQB2I6AR4ljfOn5JhunvU4XxcuR6e5ETCvQ
 VWQNcWeSQwrxpgQ0E2kXJlcg2QT60uw51KpEhHyLZMRL5zP0N6MeACYNQ6ZEGEEzwyj4
 HVQ+f97WIZqjH7vfsDzBJRndRcd7tbpW8OQ7WJ0BnVev3B5Kt1IF5oJP3dlZdniSey2B
 jF6A==
X-Gm-Message-State: AOAM532Ro7uR3oLlUTElRMXtL5ytkx8wp9x5b4avVvCtL2qp1S8TfDzl
 bkIvRDltP44LFYUG2y5sDeqsIyuzm5YDT4vl
X-Google-Smtp-Source: ABdhPJwsUE1LjY+opWwEGSzAsyMnkdcERpnBD0gsdtGYHP9hZrVc7xC9doc0ZseUNUT+tCwLH3H6fQ==
X-Received: by 2002:a05:6808:1889:b0:326:7464:2858 with SMTP id
 bi9-20020a056808188900b0032674642858mr2208458oib.159.1651776633465; 
 Thu, 05 May 2022 11:50:33 -0700 (PDT)
Received: from stoup.. ([2607:fb90:5fe8:83ea:bbf4:c9ef:4f3:11c6])
 by smtp.gmail.com with ESMTPSA id
 s36-20020a0568302aa400b0060603221259sm857273otu.41.2022.05.05.11.50.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 11:50:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v5 17/24] target/arm: Enable FEAT_RAS for -cpu max
Date: Thu,  5 May 2022 13:49:59 -0500
Message-Id: <20220505185006.200555-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220505185006.200555-1-richard.henderson@linaro.org>
References: <20220505185006.200555-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::232;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x232.google.com
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


