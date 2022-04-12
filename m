Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E7D34FCA38
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Apr 2022 02:50:01 +0200 (CEST)
Received: from localhost ([::1]:49644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ne4jI-0008Kz-BQ
	for lists+qemu-devel@lfdr.de; Mon, 11 Apr 2022 20:50:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ne4TU-0001sV-TM
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 20:33:42 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:35402)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ne4TR-0001qP-Tf
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 20:33:39 -0400
Received: by mail-pg1-x535.google.com with SMTP id z128so15650784pgz.2
 for <qemu-devel@nongnu.org>; Mon, 11 Apr 2022 17:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=13HoyrqJzJM1udVXlLkOrIOrEqLEasz9w/pSQOQ02PE=;
 b=uc06eI913KVDNmYMzRkLJbPSOhrbxbp6qkq/KKqcbICX32n9g4IvptMVj2R2mRJuFf
 016UNTnOuYDO9LXC6UoRRzGd0B2HrDLqdaFX2X5+wwjyHKxvxlN8dSn0Zo10JXdc9qet
 9lvXlu7oXj5sx+ouZwGYURkUTdU3SH/8ib3dx8GcveXE57zuRjYyKHqeW9Gx1ftynSEi
 arRW06W/IHZ8M1X/XcSAArQPknmP59zHuFHT9VirsdhfxldzuSOpw14pTqLtbEnTk5br
 OpfdEXkuqB4LDuu9yrn2cNS15nhwj5nzcPowkNOiGoR7rkBWGx8qAdF5ATRz4FQdBOYW
 U21Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=13HoyrqJzJM1udVXlLkOrIOrEqLEasz9w/pSQOQ02PE=;
 b=r31OidhIuZXztjBzWBZZ9B2N9OYdUPIarO6EgQw7XcdwVLNNRwJB8Y5Q6hnfrIhLEw
 u+oh64bMfg5eDHoTrqKn6/qM5rRLwlb3SeWoZT4ooAql8HfofJihqMJxeEP74MPGTG4O
 6yYxOpNd3TvH+NtKOGH74aNLKpDJZxqRyvHqxAToqJ2xRVLcbB6eH8SiGCjzJrLK4USi
 INjQX/GtosjYflsy+FxamUoSTmUwCw7W3LwrN+mj6s93r90jxXBwA1MEQ45EjKlMpshe
 62q2GDKuEFJfww7ludi1gKipmlCGLcUx83dMNJgDstsqENTk/0/AMma8e+dwG0EVgckt
 nVgA==
X-Gm-Message-State: AOAM5307yxyWDzNLMmDmDtmgL40dmKG5Bj7f+fE9p4zkfADjN3jOP4z6
 Ao8YdCdCDYSz6WkNN7Qsg53N9xw3jU70BQ==
X-Google-Smtp-Source: ABdhPJxCqKisSonD+PTzMm9vzIhZkxz1rIDQWrFWV/gsSCposLHfNmgGuX0N0sN4x2bUNMI7D/FB9A==
X-Received: by 2002:a05:6a02:10d:b0:381:f4c8:ad26 with SMTP id
 bg13-20020a056a02010d00b00381f4c8ad26mr28294821pgb.135.1649723616468; 
 Mon, 11 Apr 2022 17:33:36 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 g15-20020a056a0023cf00b004e17e11cb17sm38346669pfc.111.2022.04.11.17.33.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Apr 2022 17:33:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 09/24] target/arm: Enable FEAT_Debugv8p2 for -cpu max
Date: Mon, 11 Apr 2022 17:33:11 -0700
Message-Id: <20220412003326.588530-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220412003326.588530-1-richard.henderson@linaro.org>
References: <20220412003326.588530-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
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
index 6521f350f9..d815d3a397 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1800,6 +1800,7 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
          * feature registers as well.
          */
         cpu->isar.id_pfr1 = FIELD_DP32(cpu->isar.id_pfr1, ID_PFR1, SECURITY, 0);
+        cpu->isar.id_dfr0 = FIELD_DP32(cpu->isar.id_dfr0, ID_DFR0, COPSDBG, 0);
         cpu->isar.id_aa64pfr0 = FIELD_DP64(cpu->isar.id_aa64pfr0,
                                            ID_AA64PFR0, EL3, 0);
     }
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index e4f630d83f..33570c3b6d 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -797,6 +797,7 @@ static void aarch64_max_initfn(Object *obj)
     cpu->isar.id_aa64zfr0 = t;
 
     t = cpu->isar.id_aa64dfr0;
+    t = FIELD_DP64(t, ID_AA64DFR0, DEBUGVER, 8);  /* FEAT_Debugv8p2 */
     t = FIELD_DP64(t, ID_AA64DFR0, PMUVER, 5);    /* FEAT_PMUv3p4 */
     cpu->isar.id_aa64dfr0 = t;
 
diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index 075c187286..e719696412 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -75,6 +75,8 @@ void arm32_max_features(ARMCPU *cpu)
     cpu->isar.id_pfr2 = t;
 
     t = cpu->isar.id_dfr0;
+    t = FIELD_DP32(t, ID_DFR0, COPDBG, 8);        /* FEAT_Debugv8p2 */
+    t = FIELD_DP32(t, ID_DFR0, COPSDBG, 8);       /* FEAT_Debugv8p2 */
     t = FIELD_DP32(t, ID_DFR0, PERFMON, 5);       /* FEAT_PMUv3p4 */
     cpu->isar.id_dfr0 = t;
 }
-- 
2.25.1


