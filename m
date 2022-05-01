Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EF56516277
	for <lists+qemu-devel@lfdr.de>; Sun,  1 May 2022 09:19:04 +0200 (CEST)
Received: from localhost ([::1]:38094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nl3rD-0007KR-M6
	for lists+qemu-devel@lfdr.de; Sun, 01 May 2022 03:19:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nl2UD-00077n-Ak
 for qemu-devel@nongnu.org; Sun, 01 May 2022 01:51:14 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:38579)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nl2U8-0001SS-JL
 for qemu-devel@nongnu.org; Sun, 01 May 2022 01:51:12 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 cx11-20020a17090afd8b00b001d9fe5965b3so11822893pjb.3
 for <qemu-devel@nongnu.org>; Sat, 30 Apr 2022 22:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=a7uvCKLLLjt6QC4udYfjSRWYfdLyPP29aktinhFaEDs=;
 b=Pg9nyjjYzzfQpFa9eoF8GpaSl+n3JbGSG+MXvYZJ1U2ElTbL22C7U7iRPbucs4AXdK
 WXTUf8qXMRfE0luelN0ous9Vd3TbwhW9AC6FIdsW9nqW4rmlrPIKw0owjNwFeFd/yci5
 d5nCpZwMBwoXOMytgU3Bde3v7Al8DKZaNEtTVYqxfG5hqqiL6MSlu3JhR9THEfBRtJBy
 1Lg3JgoFan/JYS4UWVmxCmUrk1a7hJqxoYvnCBqpDvPcU6Ner9HKfRQBxxXRtunWElzb
 zdw2NPPoLnCLIlptnuQht7OkSL1uLOe6fYT7R9G13qXywL0NiuI6O1AB/kbGhv/KvpCj
 rnJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=a7uvCKLLLjt6QC4udYfjSRWYfdLyPP29aktinhFaEDs=;
 b=BpAjUD5F9MXbSVCWZR7hqI+vvvvhQXWIkRN4mjGu28MbWRnFYHy6ZegheLghzeQhXj
 mc9xdSyAIwPLngfGolYQl/tEAw0YYUQH6TL6RBsTsTnXj6RrjrqZFS1MP9v/K28qiOvY
 rnwMtyKrVzwk+fDLL1URZ5uc2oqm5BU644ZlYJOXoAdAllie2+vE+FzTcyTu29/A2uzC
 CKHE+tdqMOTqqtV4lPm6cO4V79PKPCODD727IcTF6FdljVSw0xByLC2p5m8v5O1u/IKC
 GKb0OUg1DU+H+3wh48EPqlQBSjkT1LIp9uO+/9nmTgV2c1sy7+A9/sso39SRr4SE8w5r
 gAhA==
X-Gm-Message-State: AOAM531tGpMb6umsBzJPm0GLEq16FJesCRKBluU61sESxPgqENvhKPPG
 6gMnglJrI8p6Xsm7FssXyNmBqrXk7aoE7Q==
X-Google-Smtp-Source: ABdhPJw95jer0e4ot7iaEvG/K4gju6Bezvek8xnzdir5Rt0LdknbGDSf3eXfdfO6EiKb3HOfVS3qfA==
X-Received: by 2002:a17:902:e80e:b0:15d:34d2:4e8c with SMTP id
 u14-20020a170902e80e00b0015d34d24e8cmr6485413plg.142.1651384266149; 
 Sat, 30 Apr 2022 22:51:06 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 cm18-20020a17090afa1200b001cd8e9ea22asm17310342pjb.52.2022.04.30.22.51.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Apr 2022 22:51:05 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 38/45] target/arm: Enable FEAT_RAS for -cpu max
Date: Sat, 30 Apr 2022 22:50:20 -0700
Message-Id: <20220501055028.646596-39-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220501055028.646596-1-richard.henderson@linaro.org>
References: <20220501055028.646596-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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


