Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7226F38F7FF
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 04:16:56 +0200 (CEST)
Received: from localhost ([::1]:33820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llMcp-0000gp-0t
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 22:16:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLbD-0006fe-CK
 for qemu-devel@nongnu.org; Mon, 24 May 2021 21:11:11 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:44657)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLb0-0005vE-Cw
 for qemu-devel@nongnu.org; Mon, 24 May 2021 21:11:11 -0400
Received: by mail-pf1-x42d.google.com with SMTP id 22so21887414pfv.11
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 18:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VPedUl43P4vqxrl3NSrXGTDi5BxZimL9v1f9QzCFBpQ=;
 b=kv2hmvyqSmdFYk30U8N88nW4kg8v6IYVRG9JGXd4z9wBBjuoGNWH1tthMaMC7FM0IP
 gONJwLNhKL90h5H7vEFZ6tNpcOOjlDw+UWmPAk9/ePJtZJTAzLhgl2GqVqc9b3k8JOrH
 SzvfPHC8d30KcJObv8t1XtU3wUWEREtwVBjzmy1GvUppriKuYpimpIBCuemjwfMYmSNJ
 JVARX0WeW8dYc4V5Rw5hSLfi7udQgrhuNZGdysWkEReVZKRZll2FhffPMe0bVdDn3FNe
 LMlZ9pCBAKJqs55ZW1yx/UWdYT2zPfFFiAj/wkqDPIdRAaAWAsF5qagmVysw+p8tkW4p
 FFZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VPedUl43P4vqxrl3NSrXGTDi5BxZimL9v1f9QzCFBpQ=;
 b=Rw2cI4ZksdabrC05kiXPH2BAp/cEo81bEADJhU2yze+KZMm5NVrzustECPyYgnmvch
 QpE52rZr8CDC5u383dq5zuESiex/vdvFdo0Kp4TtUnFquUE6Fei0mJWXJLagvJ1U3+sF
 0UASwTyT5hOquP36h691hn2Y1z20hEZCa23meXdSoO/vVYSejrVzQNY7jGWKcwJx7bnm
 c1+wAdqC03RSnJR+bk5WvJAxDCINVnDoYLgS6Om4oWTlJ6yqlqKWBRs32sJI65g3PBwp
 XDhX91BzlUPB0LLj81u7BemTEzouJerTp9+OWlmsBWn7q7J6zEjJMw5mNYC2Wo3P1oDt
 tFdA==
X-Gm-Message-State: AOAM531hOagxiHeWxabGRNuX/RaQBJzMiCVhMOFycVqUuAQAJ+/CXYcA
 OYoqJbHyF/tE0u/90pmAj583IkJZzy6rBQ==
X-Google-Smtp-Source: ABdhPJx99xOS/CSN3cVl0dt4jTxgh/QFq1Q1TtDrv2zsFF7sd0IcpHzJhA9rHy1IkfwpCFVCVpic7Q==
X-Received: by 2002:a05:6a00:1992:b029:2df:b93b:49a with SMTP id
 d18-20020a056a001992b02902dfb93b049amr27424816pfl.11.1621905057084; 
 Mon, 24 May 2021 18:10:57 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id i8sm10614839pjs.54.2021.05.24.18.10.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 18:10:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 92/92] target/arm: Enable SVE2 and related extensions
Date: Mon, 24 May 2021 18:03:58 -0700
Message-Id: <20210525010358.152808-93-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210525010358.152808-1-richard.henderson@linaro.org>
References: <20210525010358.152808-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

Disable I8MM again for !have_neon during realize.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.c     |  2 ++
 target/arm/cpu64.c   | 13 +++++++++++++
 target/arm/cpu_tcg.c |  1 +
 3 files changed, 16 insertions(+)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 4eb0d2f85c..7aeb4b1381 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1503,6 +1503,7 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
 
         t = cpu->isar.id_aa64isar1;
         t = FIELD_DP64(t, ID_AA64ISAR1, FCMA, 0);
+        t = FIELD_DP64(t, ID_AA64ISAR1, I8MM, 0);
         cpu->isar.id_aa64isar1 = t;
 
         t = cpu->isar.id_aa64pfr0;
@@ -1517,6 +1518,7 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
         u = cpu->isar.id_isar6;
         u = FIELD_DP32(u, ID_ISAR6, DP, 0);
         u = FIELD_DP32(u, ID_ISAR6, FHM, 0);
+        u = FIELD_DP32(u, ID_ISAR6, I8MM, 0);
         cpu->isar.id_isar6 = u;
 
         if (!arm_feature(env, ARM_FEATURE_M)) {
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index f0a9e968c9..379f90fab8 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -662,6 +662,7 @@ static void aarch64_max_initfn(Object *obj)
         t = FIELD_DP64(t, ID_AA64ISAR1, SPECRES, 1);
         t = FIELD_DP64(t, ID_AA64ISAR1, FRINTTS, 1);
         t = FIELD_DP64(t, ID_AA64ISAR1, LRCPC, 2); /* ARMv8.4-RCPC */
+        t = FIELD_DP64(t, ID_AA64ISAR1, I8MM, 1);
         cpu->isar.id_aa64isar1 = t;
 
         t = cpu->isar.id_aa64pfr0;
@@ -702,6 +703,17 @@ static void aarch64_max_initfn(Object *obj)
         t = FIELD_DP64(t, ID_AA64MMFR2, ST, 1); /* TTST */
         cpu->isar.id_aa64mmfr2 = t;
 
+        t = cpu->isar.id_aa64zfr0;
+        t = FIELD_DP64(t, ID_AA64ZFR0, SVEVER, 1);
+        t = FIELD_DP64(t, ID_AA64ZFR0, AES, 2);  /* PMULL */
+        t = FIELD_DP64(t, ID_AA64ZFR0, BITPERM, 1);
+        t = FIELD_DP64(t, ID_AA64ZFR0, SHA3, 1);
+        t = FIELD_DP64(t, ID_AA64ZFR0, SM4, 1);
+        t = FIELD_DP64(t, ID_AA64ZFR0, I8MM, 1);
+        t = FIELD_DP64(t, ID_AA64ZFR0, F32MM, 1);
+        t = FIELD_DP64(t, ID_AA64ZFR0, F64MM, 1);
+        cpu->isar.id_aa64zfr0 = t;
+
         /* Replicate the same data to the 32-bit id registers.  */
         u = cpu->isar.id_isar5;
         u = FIELD_DP32(u, ID_ISAR5, AES, 2); /* AES + PMULL */
@@ -718,6 +730,7 @@ static void aarch64_max_initfn(Object *obj)
         u = FIELD_DP32(u, ID_ISAR6, FHM, 1);
         u = FIELD_DP32(u, ID_ISAR6, SB, 1);
         u = FIELD_DP32(u, ID_ISAR6, SPECRES, 1);
+        u = FIELD_DP32(u, ID_ISAR6, I8MM, 1);
         cpu->isar.id_isar6 = u;
 
         u = cpu->isar.id_pfr0;
diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index 046e476f65..d3458335ed 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -968,6 +968,7 @@ static void arm_max_initfn(Object *obj)
         t = FIELD_DP32(t, ID_ISAR6, FHM, 1);
         t = FIELD_DP32(t, ID_ISAR6, SB, 1);
         t = FIELD_DP32(t, ID_ISAR6, SPECRES, 1);
+        t = FIELD_DP32(t, ID_ISAR6, I8MM, 1);
         cpu->isar.id_isar6 = t;
 
         t = cpu->isar.mvfr1;
-- 
2.25.1


