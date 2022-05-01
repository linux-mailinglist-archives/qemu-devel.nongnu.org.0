Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F00F151626C
	for <lists+qemu-devel@lfdr.de>; Sun,  1 May 2022 09:12:50 +0200 (CEST)
Received: from localhost ([::1]:56596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nl3lB-0000hh-9f
	for lists+qemu-devel@lfdr.de; Sun, 01 May 2022 03:12:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nl2X5-0001AQ-V5
 for qemu-devel@nongnu.org; Sun, 01 May 2022 01:54:12 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:38594)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nl2X3-0001lY-Pn
 for qemu-devel@nongnu.org; Sun, 01 May 2022 01:54:11 -0400
Received: by mail-pl1-x633.google.com with SMTP id n18so10285324plg.5
 for <qemu-devel@nongnu.org>; Sat, 30 Apr 2022 22:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YgPJJBWxd6UwNbu8I9UhpjXUvb+eh/ewRL4C5SYoXZc=;
 b=ljUxeRGa0jwvJTYyNAzohNeJNnLr1DQxCjttj/QKBYNjVUQnWWSZaRvLgKJdB9R2To
 0LwzWV0iSsS6nXujHOrRXUSgM6FjbjTfeXIQDW0SBt3Drymx8aOQPrhtXtNVT+Nzh1pH
 OKpgFzQGVJbbyO6mMnKaAcpO7ZUnFA2z2DakqgXM8U9qQQjYgY+SKPaoLMD/GdUky9iK
 lhir4+PO8gtLuTB21oW6m7RcefTz/eUeF6b806x6OZ28K/gx/ZSujZExs/gjBgye3uDy
 U4+K6+Ef+9ef97Uu+izG6WQQ47lcIpsrkaUKgL7e5R+E4BsnUSBny6hWqlUVHAc+CWLZ
 DLZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YgPJJBWxd6UwNbu8I9UhpjXUvb+eh/ewRL4C5SYoXZc=;
 b=qalagUWsB/c9gPmLte+GidoyW7AvoTKNaIoxT0MLWzcBQU3QM0AmFf6WG0/JZJSBt3
 9nL/6iorFvN/jyMX5Z75iQJaLJqhqhmIf6jHzps1vCrF4BcNpo+WtefavyJCGasEQarf
 MndTKXxyZ8LEK3rUdVzO3N1EKLSmzYy5pJDSrx19LiQTp1L49FyAX4ttHo4QcYG49Q01
 Q1Y4h3WjWxlwC5lGlY+bk4k2tyqEshhd5DL2sIL9Q28w5wKeIGoAmWG9PGJIAo4yNgZl
 51UUhd9vGC6SDMzmprUgTW61f/WFX5C/uOgzU32hz57s1cVovJEnS3mFFqpKSxTt9Yn5
 /lgQ==
X-Gm-Message-State: AOAM532jp3XO40AF83fj8RsYw1QNa00RIJIQVk2FNjUbgrmJrysznT6M
 +ZedrxIKLBfW6SrvaByh2J/lozOtMdEbVA==
X-Google-Smtp-Source: ABdhPJxvunAgWX2I9XQi7UlWakfZr9WjznsyjEEcOCZzDZpim+GNJhI5Tx95MBCNaiEjMohz+S45Gg==
X-Received: by 2002:a17:90b:124a:b0:1d9:de12:520f with SMTP id
 gx10-20020a17090b124a00b001d9de12520fmr7139816pjb.28.1651384448637; 
 Sat, 30 Apr 2022 22:54:08 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 u63-20020a626042000000b005082a7fd144sm2341507pfb.3.2022.04.30.22.54.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Apr 2022 22:54:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 40/45] target/arm: Enable FEAT_CSV2 for -cpu max
Date: Sat, 30 Apr 2022 22:50:22 -0700
Message-Id: <20220501055028.646596-41-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220501055028.646596-1-richard.henderson@linaro.org>
References: <20220501055028.646596-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
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


