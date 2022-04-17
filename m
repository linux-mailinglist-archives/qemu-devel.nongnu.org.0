Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8790E5048DA
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Apr 2022 20:18:21 +0200 (CEST)
Received: from localhost ([::1]:49396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ng9TY-0003Zl-LC
	for lists+qemu-devel@lfdr.de; Sun, 17 Apr 2022 14:18:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng90P-0004Ts-EN
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 13:48:13 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:41889)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng90N-000433-KL
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 13:48:13 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 e8-20020a17090a118800b001cb13402ea2so12268436pja.0
 for <qemu-devel@nongnu.org>; Sun, 17 Apr 2022 10:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5kb+iTgkLaSEzVf4MDtkdZKydBzZHBfZ2pA462UB2xc=;
 b=LAnuF1jOKOzfPTqMmI3XRB1A8iNc9BUZJHTEgtEiSYvltLlKIP59zk+EAI7Jp1Zf9n
 in6qEe74gknIMt1rzPX2JQum+fultlfARmW15Q/SpVGo/l5uIgp7ZABtocKh3ganTXVG
 pCLcr3Z4XDKxNasLY8nnLFuyi+fW0IGmijNzKbLkqp5hJIoXetEzCHjbvUCFEt4EkAcC
 rqkrNEsRYjm+LAunjXXgXilOXtNuNNr8IGwy6w0rIvcHLWbyAItOrgET3xEZbrp5eJKC
 9nXZcvqPqkPZgj7fQmxoqYTXjcHC9egwcVPcLbslJ0DvajVCHyoz4DaLrKV6W+xTBZHq
 oOmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5kb+iTgkLaSEzVf4MDtkdZKydBzZHBfZ2pA462UB2xc=;
 b=EySsdkT5Jv834ZqjoR7O3luMBQC+hcpFo65KNLSId0RcPcDP7uugpArr3shpWUr2cI
 hBZdvP1OvxQ6d8SQKhH4ttenktG4LrnwZcnLovIKZAZ5J45FvCSRwGuvq/qqsKUXhCgq
 zj3gja4THVydoSKLqbRh3YYKlYjJv9KXzAh2hGGY1vWRVSNN/6s1LtNlLE9EQLVGm31N
 WNU5KJKDtovOXpLFNrkiUwTcLM4icjphdEuoctqYi0CdQ3LCluRA0OH5xgMonfFSzHzi
 Ov0bC/WmdXWIZ/6X3NwKrCOylasFu4vWL63z/+0KdN8FYH49WsE4ILc2ewHRj66FdhlH
 RvwA==
X-Gm-Message-State: AOAM532lFP4V33Q4XGVT9sM55kWrCckVacKjKtolZSSHrngxZIV8s0CC
 jODWqYECRVCiL+SCXYzWw4bmZAOIBMfRTA==
X-Google-Smtp-Source: ABdhPJz6LCKMfDYiA3oO/64pMB4E1UqYhJnbhPkqfN/R9UwsuvgHC2hzwE79Nj+00txqcY2yugNqBg==
X-Received: by 2002:a17:90a:fa8d:b0:1d2:8126:ce15 with SMTP id
 cu13-20020a17090afa8d00b001d28126ce15mr4284693pjb.162.1650217690072; 
 Sun, 17 Apr 2022 10:48:10 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 e14-20020aa78c4e000000b00506475da4cesm9372055pfd.49.2022.04.17.10.48.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Apr 2022 10:48:09 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 46/60] target/arm: Enable FEAT_Debugv8p2 for -cpu max
Date: Sun, 17 Apr 2022 10:44:12 -0700
Message-Id: <20220417174426.711829-47-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220417174426.711829-1-richard.henderson@linaro.org>
References: <20220417174426.711829-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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

The only portion of FEAT_Debugv8p2 that is relevant to QEMU
is CONTEXTIDR_EL2, which is also conditionally implemented
with FEAT_VHE.  The rest of the debug extension concerns the
External debug interface, which is outside the scope of QEMU.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Update emulation.rst
---
 docs/system/arm/emulation.rst | 1 +
 target/arm/cpu.c              | 1 +
 target/arm/cpu64.c            | 1 +
 target/arm/cpu_tcg.c          | 2 ++
 4 files changed, 5 insertions(+)

diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index 520fd39071..035f7cf9d0 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -13,6 +13,7 @@ the following architecture extensions:
 - FEAT_BTI (Branch Target Identification)
 - FEAT_DIT (Data Independent Timing instructions)
 - FEAT_DPB (DC CVAP instruction)
+- FEAT_Debugv8p2 (Debug changes for v8.2)
 - FEAT_DotProd (Advanced SIMD dot product instructions)
 - FEAT_FCMA (Floating-point complex number instructions)
 - FEAT_FHM (Floating-point half-precision multiplication instructions)
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 33451cecf7..fc0d74b4d1 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1787,6 +1787,7 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
          * feature registers as well.
          */
         cpu->isar.id_pfr1 = FIELD_DP32(cpu->isar.id_pfr1, ID_PFR1, SECURITY, 0);
+        cpu->isar.id_dfr0 = FIELD_DP32(cpu->isar.id_dfr0, ID_DFR0, COPSDBG, 0);
         cpu->isar.id_aa64pfr0 = FIELD_DP64(cpu->isar.id_aa64pfr0,
                                            ID_AA64PFR0, EL3, 0);
     }
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index c9476680d4..2003d0a8c9 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -797,6 +797,7 @@ static void aarch64_max_initfn(Object *obj)
     cpu->isar.id_aa64zfr0 = t;
 
     t = cpu->isar.id_aa64dfr0;
+    t = FIELD_DP64(t, ID_AA64DFR0, DEBUGVER, 8);  /* FEAT_Debugv8p2 */
     t = FIELD_DP64(t, ID_AA64DFR0, PMUVER, 5);    /* FEAT_PMUv3p4 */
     cpu->isar.id_aa64dfr0 = t;
 
diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index bc8f9d0edf..b6fc3752f2 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -76,6 +76,8 @@ void aa32_max_features(ARMCPU *cpu)
     cpu->isar.id_pfr2 = t;
 
     t = cpu->isar.id_dfr0;
+    t = FIELD_DP32(t, ID_DFR0, COPDBG, 8);        /* FEAT_Debugv8p2 */
+    t = FIELD_DP32(t, ID_DFR0, COPSDBG, 8);       /* FEAT_Debugv8p2 */
     t = FIELD_DP32(t, ID_DFR0, PERFMON, 5);       /* FEAT_PMUv3p4 */
     cpu->isar.id_dfr0 = t;
 }
-- 
2.25.1


