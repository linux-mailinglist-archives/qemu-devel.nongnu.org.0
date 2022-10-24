Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DF78609A7C
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 08:27:15 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1omprf-0006VW-QT; Mon, 24 Oct 2022 01:19:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1omprb-0006S9-FX
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 01:19:04 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1omprZ-0002Ic-LV
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 01:19:03 -0400
Received: by mail-pl1-x632.google.com with SMTP id jo13so3977889plb.13
 for <qemu-devel@nongnu.org>; Sun, 23 Oct 2022 22:19:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dRBUuDv4xO4FSH5BCO5y+i5Lk2hVQIRJPv1ndVT7mQw=;
 b=lIfskUFuwd74y9mbyGyHFZpm1q3VWFHOfhC1cpd4hArkgXfbGbmQrVzPZe+5HM0WKz
 o7dxp/AlWoODR5DgSxjeCffz5VAQ/yIdLq4WrWYEf/1i/9qcwBvQQGJY79LGy6epz5/S
 dwugOjQB9aQBWmAlSwPuK6nnA0hDO651Oh00/kcBxRcTknHydTgJIjIDtywcqOdBqCcu
 QcS1qDUdhmXfrrv9a+j4zIUMOYNYOHZhBQRklLdw3F9/uLiLTzX8QyyOI+IhO3K2SK7q
 2rffRDsP47Hny1SHrCslMFx+TSAiHCHdTGSx9U+/3JYj2zp0aiLITR4lwa6Wb8nlCymc
 tW7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dRBUuDv4xO4FSH5BCO5y+i5Lk2hVQIRJPv1ndVT7mQw=;
 b=W/TOOUnMqlFy9Pim/P7DA2VIphw8vRgUPmbTSbf8+Azkrjo1cfdtkxxJ+mv/Bf1kqj
 bXZ31D+U6Y4M3c3bPRAHdiTpY64tFKLkPsnzEqw+SYuXkG4Iuhh+bC0f8ln1LKxB9GSI
 t8YM2T8eNDBFxtMbpuU9mUaLoa5v/sLIpSfs2IQHJ4cpO8gI9O/xrggnClKPKlIde4Ts
 4fEkPEplQ+MUMFSxgu53qz+c0RKV+Y52aBNEd0sltDnqCai1nEo6Y2txDLI3giZ7xGL5
 mZ8suVwvLWGEgwavgIeRANnm8SkVe2yuI9PH7Ib2kZeoz+qZUa/umyzJUk8uD9i7jYHr
 kCJg==
X-Gm-Message-State: ACrzQf2j4XsHNKVovD7j0S0u9sTMoV2mhoMYNh1UAd46oFU5Uc+V0Clm
 GFHpcr5HyXZTwrRBI60EyrBV1X0iaO7M7EwW
X-Google-Smtp-Source: AMsMyM7v62G1m/XdrJ2uStaGY5VMXNtIV1NwLiF27IEsM2BucKwUXJCUwDuiR+x0BMC6Ggexr+Z5tg==
X-Received: by 2002:a17:902:e952:b0:17c:2eee:c0ce with SMTP id
 b18-20020a170902e95200b0017c2eeec0cemr31633689pll.145.1666588740221; 
 Sun, 23 Oct 2022 22:19:00 -0700 (PDT)
Received: from stoup.. ([103.100.225.182]) by smtp.gmail.com with ESMTPSA id
 q12-20020a170902f34c00b00172951ddb12sm1895231ple.42.2022.10.23.22.18.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Oct 2022 22:18:59 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v6 01/14] target/arm: Introduce regime_is_stage2
Date: Mon, 24 Oct 2022 15:18:38 +1000
Message-Id: <20221024051851.3074715-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221024051851.3074715-1-richard.henderson@linaro.org>
References: <20221024051851.3074715-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Reduce the amount of typing required for this check.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h |  5 +++++
 target/arm/helper.c    | 14 +++++---------
 target/arm/ptw.c       | 14 ++++++--------
 3 files changed, 16 insertions(+), 17 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index c3c3920ded..2b6889073d 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -673,6 +673,11 @@ static inline bool regime_is_pan(CPUARMState *env, ARMMMUIdx mmu_idx)
     }
 }
 
+static inline bool regime_is_stage2(ARMMMUIdx mmu_idx)
+{
+    return mmu_idx == ARMMMUIdx_Stage2 || mmu_idx == ARMMMUIdx_Stage2_S;
+}
+
 /* Return the exception level which controls this address translation regime */
 static inline uint32_t regime_el(CPUARMState *env, ARMMMUIdx mmu_idx)
 {
diff --git a/target/arm/helper.c b/target/arm/helper.c
index c672903f43..cbfaabbc09 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -10352,7 +10352,7 @@ int aa64_va_parameter_tbi(uint64_t tcr, ARMMMUIdx mmu_idx)
 {
     if (regime_has_2_ranges(mmu_idx)) {
         return extract64(tcr, 37, 2);
-    } else if (mmu_idx == ARMMMUIdx_Stage2 || mmu_idx == ARMMMUIdx_Stage2_S) {
+    } else if (regime_is_stage2(mmu_idx)) {
         return 0; /* VTCR_EL2 */
     } else {
         /* Replicate the single TBI bit so we always have 2 bits.  */
@@ -10364,7 +10364,7 @@ int aa64_va_parameter_tbid(uint64_t tcr, ARMMMUIdx mmu_idx)
 {
     if (regime_has_2_ranges(mmu_idx)) {
         return extract64(tcr, 51, 2);
-    } else if (mmu_idx == ARMMMUIdx_Stage2 || mmu_idx == ARMMMUIdx_Stage2_S) {
+    } else if (regime_is_stage2(mmu_idx)) {
         return 0; /* VTCR_EL2 */
     } else {
         /* Replicate the single TBID bit so we always have 2 bits.  */
@@ -10474,7 +10474,7 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
     int select, tsz, tbi, max_tsz, min_tsz, ps, sh;
     ARMGranuleSize gran;
     ARMCPU *cpu = env_archcpu(env);
-    bool stage2 = mmu_idx == ARMMMUIdx_Stage2 || mmu_idx == ARMMMUIdx_Stage2_S;
+    bool stage2 = regime_is_stage2(mmu_idx);
 
     if (!regime_has_2_ranges(mmu_idx)) {
         select = 0;
@@ -10532,22 +10532,18 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
         }
         ds = false;
     } else if (ds) {
-        switch (mmu_idx) {
-        case ARMMMUIdx_Stage2:
-        case ARMMMUIdx_Stage2_S:
+        if (regime_is_stage2(mmu_idx)) {
             if (gran == Gran16K) {
                 ds = cpu_isar_feature(aa64_tgran16_2_lpa2, cpu);
             } else {
                 ds = cpu_isar_feature(aa64_tgran4_2_lpa2, cpu);
             }
-            break;
-        default:
+        } else {
             if (gran == Gran16K) {
                 ds = cpu_isar_feature(aa64_tgran16_lpa2, cpu);
             } else {
                 ds = cpu_isar_feature(aa64_tgran4_lpa2, cpu);
             }
-            break;
         }
         if (ds) {
             min_tsz = 12;
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 6c5ed56a10..004375e02b 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -842,8 +842,7 @@ static int get_S1prot(CPUARMState *env, ARMMMUIdx mmu_idx, bool is_aa64,
     bool have_wxn;
     int wxn = 0;
 
-    assert(mmu_idx != ARMMMUIdx_Stage2);
-    assert(mmu_idx != ARMMMUIdx_Stage2_S);
+    assert(!regime_is_stage2(mmu_idx));
 
     user_rw = simple_ap_to_rw_prot_is_user(ap, true);
     if (is_user) {
@@ -1171,7 +1170,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
         goto do_fault;
     }
 
-    if (mmu_idx != ARMMMUIdx_Stage2 && mmu_idx != ARMMMUIdx_Stage2_S) {
+    if (!regime_is_stage2(mmu_idx)) {
         /*
          * The starting level depends on the virtual address size (which can
          * be up to 48 bits) and the translation granule size. It indicates
@@ -1342,7 +1341,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
         attrs = extract64(descriptor, 2, 10)
             | (extract64(descriptor, 52, 12) << 10);
 
-        if (mmu_idx == ARMMMUIdx_Stage2 || mmu_idx == ARMMMUIdx_Stage2_S) {
+        if (regime_is_stage2(mmu_idx)) {
             /* Stage 2 table descriptors do not include any attribute fields */
             break;
         }
@@ -1374,7 +1373,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
 
     ap = extract32(attrs, 4, 2);
 
-    if (mmu_idx == ARMMMUIdx_Stage2 || mmu_idx == ARMMMUIdx_Stage2_S) {
+    if (regime_is_stage2(mmu_idx)) {
         ns = mmu_idx == ARMMMUIdx_Stage2;
         xn = extract32(attrs, 11, 2);
         result->f.prot = get_S2prot(env, ap, xn, s1_is_el0);
@@ -1404,7 +1403,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
         result->f.guarded = guarded;
     }
 
-    if (mmu_idx == ARMMMUIdx_Stage2 || mmu_idx == ARMMMUIdx_Stage2_S) {
+    if (regime_is_stage2(mmu_idx)) {
         result->cacheattrs.is_s2_format = true;
         result->cacheattrs.attrs = extract32(attrs, 0, 4);
     } else {
@@ -1435,8 +1434,7 @@ do_fault:
     fi->type = fault_type;
     fi->level = level;
     /* Tag the error as S2 for failed S1 PTW at S2 or ordinary S2.  */
-    fi->stage2 = fi->s1ptw || (mmu_idx == ARMMMUIdx_Stage2 ||
-                               mmu_idx == ARMMMUIdx_Stage2_S);
+    fi->stage2 = fi->s1ptw || regime_is_stage2(mmu_idx);
     fi->s1ns = mmu_idx == ARMMMUIdx_Stage2;
     return true;
 }
-- 
2.34.1


