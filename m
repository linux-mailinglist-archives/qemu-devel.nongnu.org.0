Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE8834FCB6B
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Apr 2022 03:03:36 +0200 (CEST)
Received: from localhost ([::1]:49546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ne4wR-0004QQ-8l
	for lists+qemu-devel@lfdr.de; Mon, 11 Apr 2022 21:03:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ne4Ti-0001zZ-LN
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 20:33:55 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:42730)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ne4Tf-0001tW-SY
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 20:33:54 -0400
Received: by mail-pg1-x530.google.com with SMTP id q142so15604012pgq.9
 for <qemu-devel@nongnu.org>; Mon, 11 Apr 2022 17:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0Bp2AEYW6PnMq5QzYwmOeueQXF8b6aBC6y++J377950=;
 b=uYd/ckj2P59vXk7M5UnUbi9bbrNaAmc+2Z+/zJa5vc9gKdadjBOr5XtGvn3fDpObGj
 2HFTUN+4ArnshAt4lYrRrn1gy1Pg8+5W0Hs2bJoOVgsOEDZH1UWbABfjXSdbpJ0S5Hu4
 hJR2GbDWXJdTMDAmV5x5wNrhBQzivevpzjEoMZbPAYYbVFmLkkC3GosstbVeftmWvW8G
 ugSFWMXMwbk6qsF8N+p7hJgiCjnDWYh6V5yb57eXnsuqhB5QYRGfF+j4E42/tsin/2SC
 cYd9btq7tErbUvKnjXY8L1zT71YGGj3vsplgPnLQCE8UryvaMp7UIp21Ik6gZc/5ojUB
 x67A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0Bp2AEYW6PnMq5QzYwmOeueQXF8b6aBC6y++J377950=;
 b=326RMm4lPc+E67C1Bs6jRlNDKdj8+q0/CfmZhIuU0/x+AsUkYpHCO6iqSjLP9e7IDO
 7ECsLIpXWhb3OMhH6OiWZAVASDqk/qTSlQEpu93PrGCyDWeEro7DayS1+r5lZ19XHm7s
 N8V2iK9MmANRbi09APLrppQCPgMlb3R9z0tMWblk+GIoUCUKp0jfQR+XLk8xnTdF0FT2
 RjDk8sAQCUwNNwLJ8HDdZMaoqQjYm9eXwusoAma9xUV98SdVPyAOcR3qpGrOptO39W2z
 vvlBixOVrgWNblo7EtePF2TGMgEXQ90HjaCVAWc4WOap4mFSLv8PkVCeOxnft1FaPMx4
 AvKA==
X-Gm-Message-State: AOAM531LC2YmyynzxWGznseKSkI3TBWnDTvK31Ci0p5miYaNoV1Xpg4g
 bELbCYTYYKJTdC2jWXSnX4lQhU0/lzfPmw==
X-Google-Smtp-Source: ABdhPJwJNjxCGWzh8x77POBK69TkdSBGhu7WpinWlqbPlnCciefZ7r2LyO65d1cDQ1YgpgTXbl8fIg==
X-Received: by 2002:a05:6a00:a26:b0:4fd:f9dd:549c with SMTP id
 p38-20020a056a000a2600b004fdf9dd549cmr35308176pfh.42.1649723626814; 
 Mon, 11 Apr 2022 17:33:46 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 g15-20020a056a0023cf00b004e17e11cb17sm38346669pfc.111.2022.04.11.17.33.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Apr 2022 17:33:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 21/24] target/arm: Enable FEAT_CSV3 for -cpu max
Date: Mon, 11 Apr 2022 17:33:23 -0700
Message-Id: <20220412003326.588530-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220412003326.588530-1-richard.henderson@linaro.org>
References: <20220412003326.588530-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
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

This extension concerns cache speculation, which TCG does
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
index aebe3be1ba..f75f0fc110 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -15,6 +15,7 @@ the following architecture extensions:
 - FEAT_CSV2_1p1 (Cache speculation variant 2, version 1.1)
 - FEAT_CSV2_1p2 (Cache speculation variant 2, version 1.2)
 - FEAT_CSV2_2 (Cache speculation variant 2, version 2)
+- FEAT_CSV3 (Cache speculation variant 3)
 - FEAT_DIT (Data Independent Timing instructions)
 - FEAT_DPB (DC CVAP instruction)
 - FEAT_Debugv8p2 (Debug changes for v8.2)
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 98fc3ace1f..2b6b9afd76 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -749,6 +749,7 @@ static void aarch64_max_initfn(Object *obj)
     t = FIELD_DP64(t, ID_AA64PFR0, SEL2, 1);      /* FEAT_SEL2 */
     t = FIELD_DP64(t, ID_AA64PFR0, DIT, 1);       /* FEAT_DIT */
     t = FIELD_DP64(t, ID_AA64PFR0, CSV2, 2);      /* FEAT_CSV2_2 */
+    t = FIELD_DP64(t, ID_AA64PFR0, CSV3, 1);      /* FEAT_CSV3 */
     cpu->isar.id_aa64pfr0 = t;
 
     t = cpu->isar.id_aa64pfr1;
diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index 7775a84575..2592d7008a 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -73,6 +73,7 @@ void arm32_max_features(ARMCPU *cpu)
     cpu->isar.id_pfr0 = t;
 
     t = cpu->isar.id_pfr2;
+    t = FIELD_DP32(t, ID_PFR2, CSV3, 1);          /* FEAT_CSV3 */
     t = FIELD_DP32(t, ID_PFR2, SSBS, 1);          /* FEAT_SSBS */
     cpu->isar.id_pfr2 = t;
 
-- 
2.25.1


