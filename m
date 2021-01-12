Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F5D52F3676
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 18:05:06 +0100 (CET)
Received: from localhost ([::1]:43212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzN6P-0007I8-22
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 12:05:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kzMzV-0001Q6-W4
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 11:57:58 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:33559)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kzMzT-0006vC-3S
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 11:57:57 -0500
Received: by mail-wr1-x42e.google.com with SMTP id t30so3280928wrb.0
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 08:57:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=RT64QSt/nocPy3bcUDYbqKLfp0TF6hHQCydKZeSEBxo=;
 b=u9w6qhq8HUoUQH472nC8PhkgXn0ySnJDddSnWpBkobIhhStDtoB24XsrTJTpaiorcb
 zYrMaQFJ+auZZBN4l3mHWVX369a87cTBQ+synx2btvjGG/wGUKQMJHtweXmFoPUfvcT7
 bdeCjAjuEeWUYkAcjINqrmoHhTlK5XjFJDXMibpZBFFW8DAufI1FGDZDsYrvX/iOw6e7
 kda8uAmMEoLGeVfGqvyaLJwij/awYN2B6kqJIPBMIZly8FVaYgTdokusDMTgn4BfezCY
 nItxIJE6i7pt34KGlf9WFnlhCScw1lJXgy/3MHjhjW/RCND8yDcCvRytVtiEVEZAh5xc
 tIrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RT64QSt/nocPy3bcUDYbqKLfp0TF6hHQCydKZeSEBxo=;
 b=rKE2EwjGh4wbsaKwhRsuR0nkaZcZ6OLsGnTBT5r3/F8y/2Ql5Y+Rh4syKI8YP4n7zh
 aIRU1wpW+klzxUG76smsu37v5m84nR0YqAOJxpi9vTDYaSXesDbOzlwZJf2SP+13RAf+
 yRlf6oHFtP0X9YLSRIJU4MWR2TCcXoYlvsKHblwnURhMk5fdSDhsGMAgnD5BXTzSqvmv
 tad0itznHAvfJ6V1LD+dC1CTvye589cI4CI5r993ZX4LO8JUpum530bQSrfgfeB/y4wf
 0fUUQPfrHPc2e0rfBC2mH2uBAqlxpGnSZtV1ruWuxKAGw1OJ4tCaCidcTm5oIeKmRG4x
 NwNg==
X-Gm-Message-State: AOAM5327Sbb1XD5rBLaNbJBc4mutdaAvDblPfv0mI4agFvHIJWJ+/o6F
 tZHl8Kk2J9OVn4cf61HvzIDvcrnP09EmMg==
X-Google-Smtp-Source: ABdhPJyEkFLpH0aoHDD1kt4YYmJlcwrQLrtvBx9+PjhroSkdgtYXfF97QFFBJoLrVlMW+kWYdppjBQ==
X-Received: by 2002:a5d:4d03:: with SMTP id z3mr3605150wrt.280.1610470673394; 
 Tue, 12 Jan 2021 08:57:53 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id i18sm6210083wrp.74.2021.01.12.08.57.52
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 08:57:52 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 01/21] target/arm: ARMv8.4-TTST extension
Date: Tue, 12 Jan 2021 16:57:30 +0000
Message-Id: <20210112165750.30475-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210112165750.30475-1-peter.maydell@linaro.org>
References: <20210112165750.30475-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>

This adds for the Small Translation tables extension in AArch64 state.

Signed-off-by: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h    |  5 +++++
 target/arm/helper.c | 15 +++++++++++++--
 2 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 7e6c881a7e2..ad37ff61c62 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3936,6 +3936,11 @@ static inline bool isar_feature_aa64_uao(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64mmfr2, ID_AA64MMFR2, UAO) != 0;
 }
 
+static inline bool isar_feature_aa64_st(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64mmfr2, ID_AA64MMFR2, ST) != 0;
+}
+
 static inline bool isar_feature_aa64_bti(const ARMISARegisters *id)
 {
     return FIELD_EX64(id->id_aa64pfr1, ID_AA64PFR1, BT) != 0;
diff --git a/target/arm/helper.c b/target/arm/helper.c
index d077dd9ef51..5ab3f5ace36 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -10842,7 +10842,7 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
 {
     uint64_t tcr = regime_tcr(env, mmu_idx)->raw_tcr;
     bool epd, hpd, using16k, using64k;
-    int select, tsz, tbi;
+    int select, tsz, tbi, max_tsz;
 
     if (!regime_has_2_ranges(mmu_idx)) {
         select = 0;
@@ -10877,7 +10877,14 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
             hpd = extract64(tcr, 42, 1);
         }
     }
-    tsz = MIN(tsz, 39);  /* TODO: ARMv8.4-TTST */
+
+    if (cpu_isar_feature(aa64_st, env_archcpu(env))) {
+        max_tsz = 48 - using64k;
+    } else {
+        max_tsz = 39;
+    }
+
+    tsz = MIN(tsz, max_tsz);
     tsz = MAX(tsz, 16);  /* TODO: ARMv8.2-LVA  */
 
     /* Present TBI as a composite with TBID.  */
@@ -11096,6 +11103,10 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
         if (!aarch64 || stride == 9) {
             /* AArch32 or 4KB pages */
             startlevel = 2 - sl0;
+
+            if (cpu_isar_feature(aa64_st, cpu)) {
+                startlevel &= 3;
+            }
         } else {
             /* 16KB or 64KB pages */
             startlevel = 3 - sl0;
-- 
2.20.1


