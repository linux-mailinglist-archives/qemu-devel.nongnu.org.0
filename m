Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2A8D64DB9F
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Dec 2022 13:51:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5nh2-0006oV-RO; Thu, 15 Dec 2022 07:50:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p5ngw-0006ko-El
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 07:50:26 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p5ngu-00047Y-Dt
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 07:50:26 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 z8-20020a05600c220800b003d33b0bda11so660178wml.0
 for <qemu-devel@nongnu.org>; Thu, 15 Dec 2022 04:50:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=DrWNKUI5/mIVVsAs8JQZepO2Gy1iWGNfZwBpATQuyTk=;
 b=MLSzjHd0DDF0ZKZJwwVZWywaVRMv+835mY3UhbZoHpfR3a/Cx/FIm2vFrzrlLoJe7O
 ABmll1YI46TISQMAwM2OVZ9R/tcihEpYcHqUHlXtsM1aS+cPm1CAe+i2XKIwJS7KxcNc
 QCd10tFANqH54Ot4ai34ALLssYigxhDJhByMY7OZYf+HyCFjp11y4HXzKcJZ7P4K4fXV
 EFlgJzDIyDzDnizZwPu8akUPz/hDJZoccp8wBlsTUg31bcCO016mBpHP9n2STunYkTDN
 gkyRD3nFTPzaACBu1mM+P+Z6i5CLm1mpvtMPxP6X2ywosPED8M/XUIX2dTB38i3M/rFA
 QOLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DrWNKUI5/mIVVsAs8JQZepO2Gy1iWGNfZwBpATQuyTk=;
 b=FURKh6Q6t5LcU0f2hz6Hi1kJJJ4MJ501TWwISymvskJXv2qnhfex62a6mf6QGUvQtM
 SuNBUcI/ey6jfz87PFE6vkDAEdZax2MqY8m3RzQ0x8gntUnNoumtFeJnumy9EdAPSp+D
 JN4jIXkhgt3MmRWa8FGPJCGRDj6ebK36AB6y/TTxaxTWhOTyqz7Qamx2erkbIgYcxbEZ
 776JM72tMFH95EQsBQg309EBXhO7bNCBZX4XYbUgdDVkcx+Ou2lUnnHCHcKI6XALISAL
 YpPTX/K5ORXXOgyL8f+LZSek3S+jAtmZKz9AqKnA+ZVab0reGIp7Tuygqs/TmYq0qj7B
 bJCA==
X-Gm-Message-State: ANoB5plDlQIc/x99hOj2EJMkTbwvVbG3wJWExxWH+t4DWXOSjue0CG90
 +7YW2YYtEf9xTGSYjGxxdzuUju3LGkGiuXtU
X-Google-Smtp-Source: AA0mqf4h54H426jGWzvIGNj8ZOsIQTSBXjR6s7wFyGmHFA8L90IfeacWo8beaPdQy0w2hgYHTYEzAw==
X-Received: by 2002:a05:600c:540c:b0:3d0:57ea:319c with SMTP id
 he12-20020a05600c540c00b003d057ea319cmr22875628wmb.13.1671108623087; 
 Thu, 15 Dec 2022 04:50:23 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 i12-20020a05600c354c00b003cfd64b6be1sm8388787wmq.27.2022.12.15.04.50.22
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Dec 2022 04:50:22 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 12/29] target/arm: Implement HCR_EL2.TTLBIS traps
Date: Thu, 15 Dec 2022 12:49:52 +0000
Message-Id: <20221215125009.980128-13-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221215125009.980128-1-peter.maydell@linaro.org>
References: <20221215125009.980128-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

For FEAT_EVT, the HCR_EL2.TTLBIS bit allows trapping on EL1 use of
TLB maintenance instructions that operate on the inner shareable
domain:

AArch64:
 TLBI VMALLE1IS, TLBI VAE1IS, TLBI ASIDE1IS, TLBI VAAE1IS,
 TLBI VALE1IS, TLBI VAALE1IS, TLBI RVAE1IS, TLBI RVAAE1IS,
 TLBI RVALE1IS, and TLBI RVAALE1IS.

AArch32:
 TLBIALLIS, TLBIMVAIS, TLBIASIDIS, TLBIMVAAIS, TLBIMVALIS,
 and TLBIMVAALIS.

Add the trapping support.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 43 +++++++++++++++++++++++++++----------------
 1 file changed, 27 insertions(+), 16 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 751c360ce45..475b48750e9 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -362,6 +362,17 @@ static CPAccessResult access_ttlb(CPUARMState *env, const ARMCPRegInfo *ri,
     return CP_ACCESS_OK;
 }
 
+/* Check for traps from EL1 due to HCR_EL2.TTLB or TTLBIS. */
+static CPAccessResult access_ttlbis(CPUARMState *env, const ARMCPRegInfo *ri,
+                                    bool isread)
+{
+    if (arm_current_el(env) == 1 &&
+        (arm_hcr_el2_eff(env) & (HCR_TTLB | HCR_TTLBIS))) {
+        return CP_ACCESS_TRAP_EL2;
+    }
+    return CP_ACCESS_OK;
+}
+
 static void dacr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
 {
     ARMCPU *cpu = env_archcpu(env);
@@ -2206,16 +2217,16 @@ static const ARMCPRegInfo v7_cp_reginfo[] = {
 static const ARMCPRegInfo v7mp_cp_reginfo[] = {
     /* 32 bit TLB invalidates, Inner Shareable */
     { .name = "TLBIALLIS", .cp = 15, .opc1 = 0, .crn = 8, .crm = 3, .opc2 = 0,
-      .type = ARM_CP_NO_RAW, .access = PL1_W, .accessfn = access_ttlb,
+      .type = ARM_CP_NO_RAW, .access = PL1_W, .accessfn = access_ttlbis,
       .writefn = tlbiall_is_write },
     { .name = "TLBIMVAIS", .cp = 15, .opc1 = 0, .crn = 8, .crm = 3, .opc2 = 1,
-      .type = ARM_CP_NO_RAW, .access = PL1_W, .accessfn = access_ttlb,
+      .type = ARM_CP_NO_RAW, .access = PL1_W, .accessfn = access_ttlbis,
       .writefn = tlbimva_is_write },
     { .name = "TLBIASIDIS", .cp = 15, .opc1 = 0, .crn = 8, .crm = 3, .opc2 = 2,
-      .type = ARM_CP_NO_RAW, .access = PL1_W, .accessfn = access_ttlb,
+      .type = ARM_CP_NO_RAW, .access = PL1_W, .accessfn = access_ttlbis,
       .writefn = tlbiasid_is_write },
     { .name = "TLBIMVAAIS", .cp = 15, .opc1 = 0, .crn = 8, .crm = 3, .opc2 = 3,
-      .type = ARM_CP_NO_RAW, .access = PL1_W, .accessfn = access_ttlb,
+      .type = ARM_CP_NO_RAW, .access = PL1_W, .accessfn = access_ttlbis,
       .writefn = tlbimvaa_is_write },
 };
 
@@ -4948,27 +4959,27 @@ static const ARMCPRegInfo v8_cp_reginfo[] = {
     /* TLBI operations */
     { .name = "TLBI_VMALLE1IS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 3, .opc2 = 0,
-      .access = PL1_W, .accessfn = access_ttlb, .type = ARM_CP_NO_RAW,
+      .access = PL1_W, .accessfn = access_ttlbis, .type = ARM_CP_NO_RAW,
       .writefn = tlbi_aa64_vmalle1is_write },
     { .name = "TLBI_VAE1IS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 3, .opc2 = 1,
-      .access = PL1_W, .accessfn = access_ttlb, .type = ARM_CP_NO_RAW,
+      .access = PL1_W, .accessfn = access_ttlbis, .type = ARM_CP_NO_RAW,
       .writefn = tlbi_aa64_vae1is_write },
     { .name = "TLBI_ASIDE1IS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 3, .opc2 = 2,
-      .access = PL1_W, .accessfn = access_ttlb, .type = ARM_CP_NO_RAW,
+      .access = PL1_W, .accessfn = access_ttlbis, .type = ARM_CP_NO_RAW,
       .writefn = tlbi_aa64_vmalle1is_write },
     { .name = "TLBI_VAAE1IS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 3, .opc2 = 3,
-      .access = PL1_W, .accessfn = access_ttlb, .type = ARM_CP_NO_RAW,
+      .access = PL1_W, .accessfn = access_ttlbis, .type = ARM_CP_NO_RAW,
       .writefn = tlbi_aa64_vae1is_write },
     { .name = "TLBI_VALE1IS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 3, .opc2 = 5,
-      .access = PL1_W, .accessfn = access_ttlb, .type = ARM_CP_NO_RAW,
+      .access = PL1_W, .accessfn = access_ttlbis, .type = ARM_CP_NO_RAW,
       .writefn = tlbi_aa64_vae1is_write },
     { .name = "TLBI_VAALE1IS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 3, .opc2 = 7,
-      .access = PL1_W, .accessfn = access_ttlb, .type = ARM_CP_NO_RAW,
+      .access = PL1_W, .accessfn = access_ttlbis, .type = ARM_CP_NO_RAW,
       .writefn = tlbi_aa64_vae1is_write },
     { .name = "TLBI_VMALLE1", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 7, .opc2 = 0,
@@ -5078,10 +5089,10 @@ static const ARMCPRegInfo v8_cp_reginfo[] = {
 #endif
     /* TLB invalidate last level of translation table walk */
     { .name = "TLBIMVALIS", .cp = 15, .opc1 = 0, .crn = 8, .crm = 3, .opc2 = 5,
-      .type = ARM_CP_NO_RAW, .access = PL1_W, .accessfn = access_ttlb,
+      .type = ARM_CP_NO_RAW, .access = PL1_W, .accessfn = access_ttlbis,
       .writefn = tlbimva_is_write },
     { .name = "TLBIMVAALIS", .cp = 15, .opc1 = 0, .crn = 8, .crm = 3, .opc2 = 7,
-      .type = ARM_CP_NO_RAW, .access = PL1_W, .accessfn = access_ttlb,
+      .type = ARM_CP_NO_RAW, .access = PL1_W, .accessfn = access_ttlbis,
       .writefn = tlbimvaa_is_write },
     { .name = "TLBIMVAL", .cp = 15, .opc1 = 0, .crn = 8, .crm = 7, .opc2 = 5,
       .type = ARM_CP_NO_RAW, .access = PL1_W, .accessfn = access_ttlb,
@@ -6726,19 +6737,19 @@ static const ARMCPRegInfo pauth_reginfo[] = {
 static const ARMCPRegInfo tlbirange_reginfo[] = {
     { .name = "TLBI_RVAE1IS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 2, .opc2 = 1,
-      .access = PL1_W, .accessfn = access_ttlb, .type = ARM_CP_NO_RAW,
+      .access = PL1_W, .accessfn = access_ttlbis, .type = ARM_CP_NO_RAW,
       .writefn = tlbi_aa64_rvae1is_write },
     { .name = "TLBI_RVAAE1IS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 2, .opc2 = 3,
-      .access = PL1_W, .accessfn = access_ttlb, .type = ARM_CP_NO_RAW,
+      .access = PL1_W, .accessfn = access_ttlbis, .type = ARM_CP_NO_RAW,
       .writefn = tlbi_aa64_rvae1is_write },
    { .name = "TLBI_RVALE1IS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 2, .opc2 = 5,
-      .access = PL1_W, .accessfn = access_ttlb, .type = ARM_CP_NO_RAW,
+      .access = PL1_W, .accessfn = access_ttlbis, .type = ARM_CP_NO_RAW,
       .writefn = tlbi_aa64_rvae1is_write },
     { .name = "TLBI_RVAALE1IS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 2, .opc2 = 7,
-      .access = PL1_W, .accessfn = access_ttlb, .type = ARM_CP_NO_RAW,
+      .access = PL1_W, .accessfn = access_ttlbis, .type = ARM_CP_NO_RAW,
       .writefn = tlbi_aa64_rvae1is_write },
     { .name = "TLBI_RVAE1OS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 5, .opc2 = 1,
-- 
2.25.1


