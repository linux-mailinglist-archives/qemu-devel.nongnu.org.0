Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0254A59C07F
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Aug 2022 15:27:57 +0200 (CEST)
Received: from localhost ([::1]:46946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQ7T9-0004hr-S9
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 09:27:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oQ7PZ-0006FO-Ss
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 09:24:13 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:33351)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oQ7PY-0001hH-93
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 09:24:13 -0400
Received: by mail-wr1-x435.google.com with SMTP id k9so13229741wri.0
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 06:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=WKtyI8kjRNlnCB4JM27i0afmEKH1KHPL+DE/obbLKuA=;
 b=XIvLYfSWLsrWUnIX93zfq1Lp2LaVw/gKwEh7tArs9eWFgs4MsoJkikWAArcb2Kp0ic
 Pc1yJlszmCAS0J6hmGIh5JKv4ClP8nF3QfwqzHdZ24RITh2uMR5cfqTIYsVLwgTVMWnr
 bYSJ3IYHXsg9KUzO0Dn62IA8BOYvB0sLoPFvOVoFKVnd670fJ+sS6VWBBtk6XevP1OiS
 /6gUw5x6YmpuX3DVvmPhMaPWb9mVBiYiu8P5w1bHPSYyX52/4Vsd/HUioZyCCpOrerWy
 8CNBbWQa8Wvau23gL8wTNcVHsamH4j1OEz/JqVafdTKP2QcGesgGeYYlTsaaS86nMevd
 FU4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=WKtyI8kjRNlnCB4JM27i0afmEKH1KHPL+DE/obbLKuA=;
 b=tEdHAeVuu6NXf0uJ1hAeiE52uQ3w/peknSCC/tFSq5gC4vOxo0xv+uVYn1hzedsP7s
 4fr2AZRQHItdIJHc4IcoTHHvO9ZyozZWhuGAdvqLQydO1AoxLilxGRNgVYr+8LXFQHz3
 azBxQR6xp+yc5LeFyyReHrE0fCOnsIdZEO3YFWiMuyknFyJFGu1Rt2UxAiIaUexNumkX
 gxQwV2tx4WussTzLyPGbHmcEBndCVk8TYKyjpRqTP1t6YjE6+C3+E23Q+L3pF6uxATVk
 6WXCXffPegNWW+0N5LeKz8vmQkTL5BX3MJnxed0vFhF6GRT71OOIULkjvMc228zJ0kkS
 RSvw==
X-Gm-Message-State: ACgBeo1xzzSDK/5zkqAOH7O1Ugn0N74ZGfDakoC91m+crDKxtqGROQfw
 oco9MA3+xYiVoXWLNeya2OF07g==
X-Google-Smtp-Source: AA6agR6MbjTLB2g+4pzt1iTgE9KUhvfeKAyq0U4pLMJG5+sr52IIoNPabf+iB+gucZopk5Y+JkihGg==
X-Received: by 2002:a5d:5269:0:b0:225:4fa6:6b03 with SMTP id
 l9-20020a5d5269000000b002254fa66b03mr4257352wrc.163.1661174651046; 
 Mon, 22 Aug 2022 06:24:11 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 f12-20020adff98c000000b0021f13097d6csm11527946wrr.16.2022.08.22.06.24.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 06:24:10 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 10/10] target/arm: Report FEAT_PMUv3p5 for TCG '-cpu max'
Date: Mon, 22 Aug 2022 14:23:58 +0100
Message-Id: <20220822132358.3524971-11-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220822132358.3524971-1-peter.maydell@linaro.org>
References: <20220822132358.3524971-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
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

Update the ID registers for TCG's '-cpu max' to report a FEAT_PMUv3p5
compliant PMU.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
v1->v2: update emulation.rst too
---
 docs/system/arm/emulation.rst | 1 +
 target/arm/cpu64.c            | 2 +-
 target/arm/cpu_tcg.c          | 2 +-
 3 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index 8e494c8bea5..e36a60a4da6 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -52,6 +52,7 @@ the following architecture extensions:
 - FEAT_PMULL (PMULL, PMULL2 instructions)
 - FEAT_PMUv3p1 (PMU Extensions v3.1)
 - FEAT_PMUv3p4 (PMU Extensions v3.4)
+- FEAT_PMUv3p5 (PMU Extensions v3.5)
 - FEAT_RAS (Reliability, availability, and serviceability)
 - FEAT_RASv1p1 (RAS Extension v1.1)
 - FEAT_RDM (Advanced SIMD rounding double multiply accumulate instructions)
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 78e27f778ac..fa4b0152706 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -1072,7 +1072,7 @@ static void aarch64_max_initfn(Object *obj)
 
     t = cpu->isar.id_aa64dfr0;
     t = FIELD_DP64(t, ID_AA64DFR0, DEBUGVER, 9);  /* FEAT_Debugv8p4 */
-    t = FIELD_DP64(t, ID_AA64DFR0, PMUVER, 5);    /* FEAT_PMUv3p4 */
+    t = FIELD_DP64(t, ID_AA64DFR0, PMUVER, 6);    /* FEAT_PMUv3p5 */
     cpu->isar.id_aa64dfr0 = t;
 
     t = cpu->isar.id_aa64smfr0;
diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index 3099b38e32b..4c71a0b612d 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -81,7 +81,7 @@ void aa32_max_features(ARMCPU *cpu)
     t = cpu->isar.id_dfr0;
     t = FIELD_DP32(t, ID_DFR0, COPDBG, 9);        /* FEAT_Debugv8p4 */
     t = FIELD_DP32(t, ID_DFR0, COPSDBG, 9);       /* FEAT_Debugv8p4 */
-    t = FIELD_DP32(t, ID_DFR0, PERFMON, 5);       /* FEAT_PMUv3p4 */
+    t = FIELD_DP32(t, ID_DFR0, PERFMON, 6);       /* FEAT_PMUv3p5 */
     cpu->isar.id_dfr0 = t;
 }
 
-- 
2.25.1


