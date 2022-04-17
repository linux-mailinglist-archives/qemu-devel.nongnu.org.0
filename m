Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F4F9504900
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Apr 2022 20:43:46 +0200 (CEST)
Received: from localhost ([::1]:48954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ng9s9-00083U-21
	for lists+qemu-devel@lfdr.de; Sun, 17 Apr 2022 14:43:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng90W-0004jW-VW
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 13:48:21 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:44613)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng90V-00046C-3d
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 13:48:20 -0400
Received: by mail-pg1-x534.google.com with SMTP id j71so1451371pge.11
 for <qemu-devel@nongnu.org>; Sun, 17 Apr 2022 10:48:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4gebW4IdC/Bc62zWIHS5hydZkGTIlOLeMNTIUwSy2Ks=;
 b=CetYLbkrh2Emx4+viVrzNk2w06xK1Rh0zkQV/5RcLrJr2HpgyqKgR2xAFCrHXBm9Gh
 +xQKrxnGaTeocMQFYsn3+hpAl7IcOwCf+UVpYqGx9ENdsRGW3jxvAowQ5kDSIGKpIXBR
 VyGYdVEyzu1PZ2H/yOsov+XnQD7ChckHXaAvPFhdaAZsd9cGgY3OVVaeI61kqjqmkPrh
 zLGbLpSyXEdlXBTCEeWU+mBJ6c79GjO7UeonwJ1DCdREvt0Ld1TGAd23smVc6FDjxkqa
 jcw3M1m8gACwiH5M/+cB/9IVva5br17T8TFx5booqwz4Mfia9yyBfT8ayioPzYWpt6Sj
 hRlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4gebW4IdC/Bc62zWIHS5hydZkGTIlOLeMNTIUwSy2Ks=;
 b=wKp2vN4mxp6dF1aAFtQWptqFJOgzROXfy2NIfDJ+oU4HLklJAjWKvLsLEVtB4NvQ2Z
 Xe/JPS62Hwbr30BEWnYFnxNwUjHLH9kOB1hMLJ38m4SWRjmn8ROoAxHW5qymwOuD/t65
 ds8n9mEXoo2H42j71wAGUtPfAXK3479IeML1xbJuINNBDxfwlgpwe3yfpqeOsJVBps7g
 3rCCjDQFCBHpBEzZzLYNAVy1KZArcSBEz8gA/Lm4auwWfJOog+w937h+l70N8lkj9TDy
 bDp3HYJPc69MpV9ljePP3bZIRttmx6CNkpRkFIRM/jmp4YioTX8p1919WMm1Iv4Aw258
 IQOQ==
X-Gm-Message-State: AOAM531TqTge3/Aetst0lqyt37NneKgM9njzze2hWxWFQc1w8Sm4QrP4
 Hk/7+3MrTJZHN/ZyFaD1WRVSPFJOKlFxnw==
X-Google-Smtp-Source: ABdhPJz/fyNwMOOCljTOwKeqawBHV+rfVTn4SD1hmL6kGH7RnhOArjakyc8KbIV0vPebbEgymrtjCQ==
X-Received: by 2002:a05:6a00:8c5:b0:4fe:134d:30d3 with SMTP id
 s5-20020a056a0008c500b004fe134d30d3mr8405509pfu.3.1650217697790; 
 Sun, 17 Apr 2022 10:48:17 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 e14-20020aa78c4e000000b00506475da4cesm9372055pfd.49.2022.04.17.10.48.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Apr 2022 10:48:17 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 55/60] target/arm: Enable FEAT_CSV2 for -cpu max
Date: Sun, 17 Apr 2022 10:44:21 -0700
Message-Id: <20220417174426.711829-56-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220417174426.711829-1-richard.henderson@linaro.org>
References: <20220417174426.711829-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
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
index ebd9e418cc..91fb06c579 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -11,6 +11,7 @@ the following architecture extensions:
 - FEAT_AES (AESD and AESE instructions)
 - FEAT_BF16 (AArch64 BFloat16 instructions)
 - FEAT_BTI (Branch Target Identification)
+- FEAT_CSV2 (Cache speculation variant 2)
 - FEAT_DIT (Data Independent Timing instructions)
 - FEAT_DPB (DC CVAP instruction)
 - FEAT_Debugv8p2 (Debug changes for v8.2)
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 03fbb34e4e..b62656f3c3 100644
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
2.25.1


