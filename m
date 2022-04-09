Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AB444FA0A1
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Apr 2022 02:24:36 +0200 (CEST)
Received: from localhost ([::1]:38454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncyu3-0000YT-CS
	for lists+qemu-devel@lfdr.de; Fri, 08 Apr 2022 20:24:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ncydu-0008PO-VI
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 20:07:55 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:44721)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ncydt-0003Tb-8M
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 20:07:54 -0400
Received: by mail-pl1-x629.google.com with SMTP id j8so9234336pll.11
 for <qemu-devel@nongnu.org>; Fri, 08 Apr 2022 17:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MNTGLvkJnkedUMp8qlCzOgaMtMY1y27pusQZ1n5mN5U=;
 b=oKGhXehssyQgfEXYL3XAvFG4i5rWVMrdA50LWDpEhoW8BywZYpbFCmIlsgSytpoV8K
 2Ts4pN3cO+Cs1nW6tJ/1oaaw0AvBiYtJaBkcc31ZnlYYjy3hCzFdDASF1SC7NAU04S3b
 80etyrWF8FP9BZVcSITs3AZRGzOIuL38H7WWz6e99bxdAzi3W7mwIYr2vnY5pNUy4XxW
 KGoDopiCP/uC2et8LN11/rD2sASyHjPpNUUg2oZFMSqixryANqRjp84S1OeBNol9/AFq
 KYCKvHEQniHrrEUZGimJAPpaVHxUBjVm6ziflKAFxAKZxqbPA0JOuHT9QTRBiIJvtv7o
 T7Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MNTGLvkJnkedUMp8qlCzOgaMtMY1y27pusQZ1n5mN5U=;
 b=3lRXDB3nEhR82ZvX9cDy7O5qHJfdPxaqE8eAXuLZEI+HLeGNvPwFu1LmDp/BQwyC+z
 HejeCHfbUltw5OVCdS/7eSQidTySC5ZWevz+aPm9STJthbQaOwsG9y6sVu1aJqUxL+ze
 AKNBTYxKHCi+t1B7/ByIzk3idu6DwZc5RLfFr3hYOM3nSEzuEGU5s24gE1B6RY2gT0GK
 aK0C/FBpd7JZZdT4OnxPS9FOpkItvWZctzf01spHF8vBIvkiFejjRsul4g3CuuzOQAEx
 khYX+fVMJ/HTELMoW+9rHPaSG579a5asAuL980//VcUgbDa7OEqs//Z2xixAcuniIMYL
 EX4g==
X-Gm-Message-State: AOAM530LJjG903RJccmG1lX4Qs++K6a1iQFQnM1iu2Lwpn1YlA3fbaT1
 T+C4TQtODjIanR8dAqfNAJojoO7RlLSXjA==
X-Google-Smtp-Source: ABdhPJwYqNmCHb/0G6i9Ld8VZAEx8NZMMhGOESRDjF6YTvKlqVG7Vu7AargdGK/OK+ET1IPZe7e6ew==
X-Received: by 2002:a17:90a:f01:b0:1c7:ea40:93e7 with SMTP id
 1-20020a17090a0f0100b001c7ea4093e7mr24794823pjy.30.1649462871809; 
 Fri, 08 Apr 2022 17:07:51 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 t69-20020a637848000000b0039831d6dc23sm22073961pgc.94.2022.04.08.17.07.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 17:07:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 09/16] target/arm: Enable FEAT_Debugv8p4 for -cpu max
Date: Fri,  8 Apr 2022 17:07:35 -0700
Message-Id: <20220409000742.293691-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220409000742.293691-1-richard.henderson@linaro.org>
References: <20220409000742.293691-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This extension concerns changes to the External Debug interface,
with Secure and Non-secure access to the debug registers, and all
of it is outside the scope of QEMU.  Indicating support for this
is mandatory with FEAT_SEL2, which we do implement.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu64.c   | 2 +-
 target/arm/cpu_tcg.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 6b6422070d..f20fb6d9e1 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -854,7 +854,7 @@ static void aarch64_max_initfn(Object *obj)
     cpu->isar.id_aa64zfr0 = t;
 
     t = cpu->isar.id_aa64dfr0;
-    t = FIELD_DP64(t, ID_AA64DFR0, DEBUGVER, 8);  /* FEAT_Debugv8p2 */
+    t = FIELD_DP64(t, ID_AA64DFR0, DEBUGVER, 9);  /* FEAT_Debugv8p4 */
     t = FIELD_DP64(t, ID_AA64DFR0, PMUVER, 5);    /* FEAT_PMUv3p4 */
     cpu->isar.id_aa64dfr0 = t;
 
diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index ac91bbea9b..a443e8c48a 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -79,8 +79,8 @@ void arm32_max_features(ARMCPU *cpu)
     cpu->isar.id_pfr2 = t;
 
     t = cpu->isar.id_dfr0;
-    t = FIELD_DP32(t, ID_DFR0, COPDBG, 8);        /* FEAT_Debugv8p2 */
-    t = FIELD_DP32(t, ID_DFR0, COPSDBG, 8);       /* FEAT_Debugv8p2 */
+    t = FIELD_DP32(t, ID_DFR0, COPDBG, 9);        /* FEAT_Debugv8p4 */
+    t = FIELD_DP32(t, ID_DFR0, COPSDBG, 9);       /* FEAT_Debugv8p4 */
     t = FIELD_DP32(t, ID_DFR0, PERFMON, 5);       /* FEAT_PMUv3p4 */
     cpu->isar.id_dfr0 = t;
 }
-- 
2.25.1


