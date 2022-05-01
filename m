Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAC8A51626F
	for <lists+qemu-devel@lfdr.de>; Sun,  1 May 2022 09:14:28 +0200 (CEST)
Received: from localhost ([::1]:60170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nl3ml-000391-So
	for lists+qemu-devel@lfdr.de; Sun, 01 May 2022 03:14:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nl2U5-00071s-S1
 for qemu-devel@nongnu.org; Sun, 01 May 2022 01:51:08 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:35797)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nl2U1-0001NG-A3
 for qemu-devel@nongnu.org; Sun, 01 May 2022 01:51:02 -0400
Received: by mail-pl1-x62d.google.com with SMTP id d15so10294156plh.2
 for <qemu-devel@nongnu.org>; Sat, 30 Apr 2022 22:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LoFkNZI0EPN3UHmsZdxsDTn+j+LzMoee7yMTRcYWMTM=;
 b=JXF4y4NSINpr1sepl2M9ZPwPVaPLbNDyacnsWZjWlkmmQCNQ7tbyG+bt7JRrN15THj
 XrnWCkHFE0HQsfnFYLw0XjcRXw1r343JZSabBam98PuNCfWtnRxuumyCVZbDdLK3e2t3
 NDTvafGLPBGwjwAG0t3p+BZJEbKZj5SeXq5/VJ3AODGyQKgV09Xl5EECQdh2f3sse2Hx
 ROKUfBh7KUHr67e3gPdiixfCCH09MYuTnhfk9a+2pZvI1OPMEB+p/rjrxpXQpDN1KsR+
 luBDUXh+xuCo7OKNj0356y9sIzC4ansxOVvPXwbiWZKJCj6hvMCoph0+qZ2w4wDrtAVt
 +Cog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LoFkNZI0EPN3UHmsZdxsDTn+j+LzMoee7yMTRcYWMTM=;
 b=QbUHTAnjkJsNiyRuamzXXBwohgxbQ/QsW3W0fq1rPdJAzigOPpstvqSMTil3h9Od6I
 c4x/xLm8WaDzjVm9dSLqZwUnYpK87c6nyeBabjyiU7QsBctL1a4/eRQJ1k7Tn2ir4UV3
 Qy1TCdwwXmgxczdhXKShAsUEVPHy6G1LNs0eiwD3K068ZWa7P3AW4wh3zX4fBtJmdERe
 CqNrFhQhgJlQ5qwGV6SxZbxg2j0gj469vykovuoNTs/M97BaWogfb9hzhkRMTQfHPa/3
 fkyQ07svu38QfH+UFpJ0g5Mog3H/oSR+Unhl7qiadz8XtKBQFQJhbm+Bb/8BQWUqQuF9
 ruqg==
X-Gm-Message-State: AOAM530E+CovqIJloUjBVcQVdTd4N0BzbgP91HVqdwSRBQn2rFzl4x8O
 h0ENNjgtOPjWiJS+RmxApxKiCf7krHrxSA==
X-Google-Smtp-Source: ABdhPJyhTzLHYE81L3el6GXkf88zFc5U8r+uQNFYAElFh4d3rGcaASvxruWU6txX31r45PtGq8xHkA==
X-Received: by 2002:a17:90b:688:b0:1d9:9ddd:1f71 with SMTP id
 m8-20020a17090b068800b001d99ddd1f71mr11918311pjz.207.1651384259960; 
 Sat, 30 Apr 2022 22:50:59 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 cm18-20020a17090afa1200b001cd8e9ea22asm17310342pjb.52.2022.04.30.22.50.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Apr 2022 22:50:59 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 31/45] target/arm: Enable FEAT_Debugv8p2 for -cpu max
Date: Sat, 30 Apr 2022 22:50:13 -0700
Message-Id: <20220501055028.646596-32-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220501055028.646596-1-richard.henderson@linaro.org>
References: <20220501055028.646596-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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
index c3bd0676a8..965f35d8c9 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -14,6 +14,7 @@ the following architecture extensions:
 - FEAT_BTI (Branch Target Identification)
 - FEAT_DIT (Data Independent Timing instructions)
 - FEAT_DPB (DC CVAP instruction)
+- FEAT_Debugv8p2 (Debug changes for v8.2)
 - FEAT_DotProd (Advanced SIMD dot product instructions)
 - FEAT_FCMA (Floating-point complex number instructions)
 - FEAT_FHM (Floating-point half-precision multiplication instructions)
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 1b509bbd2a..97b6f9f68c 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1804,6 +1804,7 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
          * feature registers as well.
          */
         cpu->isar.id_pfr1 = FIELD_DP32(cpu->isar.id_pfr1, ID_PFR1, SECURITY, 0);
+        cpu->isar.id_dfr0 = FIELD_DP32(cpu->isar.id_dfr0, ID_DFR0, COPSDBG, 0);
         cpu->isar.id_aa64pfr0 = FIELD_DP64(cpu->isar.id_aa64pfr0,
                                            ID_AA64PFR0, EL3, 0);
     }
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 5fce40a6bc..202fd5c46e 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -799,6 +799,7 @@ static void aarch64_max_initfn(Object *obj)
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
2.34.1


