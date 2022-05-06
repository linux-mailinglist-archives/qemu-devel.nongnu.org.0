Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D7A351DEEE
	for <lists+qemu-devel@lfdr.de>; Fri,  6 May 2022 20:14:29 +0200 (CEST)
Received: from localhost ([::1]:45648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nn2TE-00083H-1n
	for lists+qemu-devel@lfdr.de; Fri, 06 May 2022 14:14:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nn2IG-0005vX-1P
 for qemu-devel@nongnu.org; Fri, 06 May 2022 14:03:09 -0400
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d]:46604)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nn2IE-0003ty-BF
 for qemu-devel@nongnu.org; Fri, 06 May 2022 14:03:07 -0400
Received: by mail-oi1-x22d.google.com with SMTP id q8so8277255oif.13
 for <qemu-devel@nongnu.org>; Fri, 06 May 2022 11:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NgxsvnW311osB1m0PaTzB1/zyzTpUBL9MpOPjCAC0zA=;
 b=yFIq+Kci3xI/NMBh2KSYjJnVAeIWG6dqXE+NnqPHS5Yr7Kpzlurticn/L/AEhQkUE5
 sjvn2RJ88ZSuw3pTVTppmIuanhdFhMINCYvyxuJP8BQ0WBBidyrSd84p5vbKKt2XNe3f
 6YQXxRgmrm+ojesyF4ceARNkjmjnyockdSBNNsC+PuAqGpPDOP8nInIOda9pYHGqBBcF
 uh47/oiYI60o/AJxoeyZQghbi1FfQQctZLGlJLxrpXPCGb23nNsvT/AYsc53q0CAnH/E
 iiGUnwcM2KrhQi0mLqAcQ8kGeoRThOugCL1lkcG2q6i9h+Zon9qK545abGBp0ZoOZmhI
 9BjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NgxsvnW311osB1m0PaTzB1/zyzTpUBL9MpOPjCAC0zA=;
 b=cDBH72o6UzHeWvkRnlGEAKBAlrRRoUMbvJIHM6mRFJkILiAjvl4+9q+IDRwDujC02I
 tSORWp4wmxegPMldSB9Lvkcod+YV43JUNTsWAAgQnlKpmSWdmuYWWs+lAWp2y6poNmv9
 RuX8RWEhyHeu0crKEGNjPHkE5bj3uNdCvtSltLdPmKeA0cMMYitwIK8BG/DMh7arRcoE
 JSIMNFpGtyH1ykJIGEjx9Fn27D7rlOJr1uZhPcpz/iepi2Hf6wJc7jOz/Uh4Mffm+M/L
 MAij3cqbLpVpj+62MRu78W5tfG7jyXCTXtukZm3b324Egv+nXja1msHyzSna7HFeGCsG
 1i1w==
X-Gm-Message-State: AOAM53357g64nN5a3/Dpz7A8akidQzorjrDtFDkoc+SKWQywl3GmmFvL
 /U4u9Rs2PAYj8pvzOAYTUrjtBw4u6ODIMVNH
X-Google-Smtp-Source: ABdhPJw/GQypmEHO+ovhFNUw6oTgNBaUkq6IowTCLMirvtGKN+6fe0NkSwXh2GrV9E9cdul8kAlVFQ==
X-Received: by 2002:a05:6808:2097:b0:326:6bc9:407e with SMTP id
 s23-20020a056808209700b003266bc9407emr5392575oiw.250.1651860185309; 
 Fri, 06 May 2022 11:03:05 -0700 (PDT)
Received: from stoup.. ([2607:fb90:5fe1:b497:51bb:ba21:d1a7:eac2])
 by smtp.gmail.com with ESMTPSA id
 e4-20020a056870c0c400b000e686d1389esm1780002oad.56.2022.05.06.11.03.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 May 2022 11:03:04 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v6 12/24] target/arm: Enable FEAT_Debugv8p4 for -cpu max
Date: Fri,  6 May 2022 13:02:30 -0500
Message-Id: <20220506180242.216785-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220506180242.216785-1-richard.henderson@linaro.org>
References: <20220506180242.216785-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22d;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22d.google.com
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

This extension concerns changes to the External Debug interface,
with Secure and Non-secure access to the debug registers, and all
of it is outside the scope of QEMU.  Indicating support for this
is mandatory with FEAT_SEL2, which we do implement.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Update emulation.rst
---
 docs/system/arm/emulation.rst | 1 +
 target/arm/cpu64.c            | 2 +-
 target/arm/cpu_tcg.c          | 4 ++--
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index 965f35d8c9..0acac6347c 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -15,6 +15,7 @@ the following architecture extensions:
 - FEAT_DIT (Data Independent Timing instructions)
 - FEAT_DPB (DC CVAP instruction)
 - FEAT_Debugv8p2 (Debug changes for v8.2)
+- FEAT_Debugv8p4 (Debug changes for v8.4)
 - FEAT_DotProd (Advanced SIMD dot product instructions)
 - FEAT_FCMA (Floating-point complex number instructions)
 - FEAT_FHM (Floating-point half-precision multiplication instructions)
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 202fd5c46e..88d3cef93e 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -799,7 +799,7 @@ static void aarch64_max_initfn(Object *obj)
     cpu->isar.id_aa64zfr0 = t;
 
     t = cpu->isar.id_aa64dfr0;
-    t = FIELD_DP64(t, ID_AA64DFR0, DEBUGVER, 8);  /* FEAT_Debugv8p2 */
+    t = FIELD_DP64(t, ID_AA64DFR0, DEBUGVER, 9);  /* FEAT_Debugv8p4 */
     t = FIELD_DP64(t, ID_AA64DFR0, PMUVER, 5);    /* FEAT_PMUv3p4 */
     cpu->isar.id_aa64dfr0 = t;
 
diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index b6fc3752f2..337598e949 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -76,8 +76,8 @@ void aa32_max_features(ARMCPU *cpu)
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
2.34.1


