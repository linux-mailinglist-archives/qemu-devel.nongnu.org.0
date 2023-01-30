Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39BB0681911
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 19:27:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMYqU-0001Ff-Ah; Mon, 30 Jan 2023 13:25:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pMYqP-0001CO-Pa
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 13:25:30 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pMYqK-0000C0-SP
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 13:25:29 -0500
Received: by mail-wr1-x42a.google.com with SMTP id t7so3636394wrp.5
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 10:25:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=5OppjKsEFWrzHuMej0d7TRJ+lmUSsgoknvJv6YnUZ9I=;
 b=iO8g3aAoSmI4JHtH3kA+JA6w8EI6AqCXrACoteJBXTbK05jj/coZrnaHGEGGFQkFjy
 3/1GC4CY9cXon5gJcR92jZJ3e+vrk/lQIRo9TzjKLK3mRtm1Xm/7vRu8vGHbn/IPLchb
 aHeue2EyQ7yoAuBWRjV6sIjE6+Jr6Y5SdO8k3qSlcxftPvrgv3hRo8eUrMqNTO9xOFWx
 TXgFy4oyKHC7pDmJaKUe7bLceJcqW6tAHZc2xj1jfbmiU72B+YXfRhkWtrjexVWDMzDD
 OOI/nKyu1ZkTY6bJu0vl9W0va9j50pL2gauLc2TMNt5UHchGM+BEePRnf+IGsvsz8uEN
 QviA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5OppjKsEFWrzHuMej0d7TRJ+lmUSsgoknvJv6YnUZ9I=;
 b=UMpV8igfy48EnSA8A+oz/t/zpTGfvFLGBJ2cjhQj4Eh1LuY9vsZ4bg8u5JjWWOXooz
 BEVq0RcoY6lfbtR1QNJLhhdEGFZ39CEpxel1LI+NwLTyYGeS75/eT8yKg9hDbKqgmmBO
 psIA0kv5Xm5zULcNxYTyN/qtaBW/Xa4aZ63SdjTCyxgaSgMwzSEF+gR+jxGHKJ2lHeFj
 7CohjbqZqZmHjxLjd54aQmNN8LK5ve2xN/UUCFroSA7HhgEWFDf97CjGpyh69OoqFvKI
 GUWytmDcJSFkZkuCapj8LvAKbsmTPPX7pbj4bAbN0dlzCxpUgBMmg8kj8J4ssHGdIyFC
 iv0A==
X-Gm-Message-State: AO0yUKXcVOr/MuGYNytOYyGoWY9XYHmB/A1URk65XWjgNOp2FiJx+l6a
 P/CyN6txc6lhqdNvfqQl7aGjD7sqmeIbrQtw
X-Google-Smtp-Source: AK7set+XOXZj5LnJMyRzEkFTrtbCT5i8+AP200tQPrA1DwpTdqMdZtCK1x8ONnChR9GHzCjVQg0+jw==
X-Received: by 2002:a5d:650f:0:b0:2bf:ae11:c40c with SMTP id
 x15-20020a5d650f000000b002bfae11c40cmr20484662wru.32.1675103123539; 
 Mon, 30 Jan 2023 10:25:23 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 l16-20020adffe90000000b002b8fe58d6desm12245202wrr.62.2023.01.30.10.25.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 10:25:23 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 22/23] target/arm: Implement MDCR_EL2.TDCC and
 MDCR_EL3.TDCC traps
Date: Mon, 30 Jan 2023 18:24:58 +0000
Message-Id: <20230130182459.3309057-23-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230130182459.3309057-1-peter.maydell@linaro.org>
References: <20230130182459.3309057-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

FEAT_FGT also implements an extra trap bit in the MDCR_EL2 and
MDCR_EL3 registers: bit TDCC enables trapping of use of the Debug
Comms Channel registers OSDTRRX_EL1, OSDTRTX_EL1, MDCCSR_EL0,
MDCCINT_EL0, DBGDTR_EL0, DBGDTRRX_EL0 and DBGDTRTX_EL0 (and their
AArch32 equivalents).  This trapping is independent of whether
fine-grained traps are enabled or not.

Implement these extra traps.  (We don't implement DBGDTR_EL0,
DBGDTRRX_EL0 and DBGDTRTX_EL0.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20230127175507.2895013-23-peter.maydell@linaro.org
---
 target/arm/debug_helper.c | 35 +++++++++++++++++++++++++++++++----
 1 file changed, 31 insertions(+), 4 deletions(-)

diff --git a/target/arm/debug_helper.c b/target/arm/debug_helper.c
index b106746b0e1..3c671c88c1a 100644
--- a/target/arm/debug_helper.c
+++ b/target/arm/debug_helper.c
@@ -599,6 +599,33 @@ static CPAccessResult access_tda(CPUARMState *env, const ARMCPRegInfo *ri,
     return CP_ACCESS_OK;
 }
 
+/*
+ * Check for traps to Debug Comms Channel registers. If FEAT_FGT
+ * is implemented then these are controlled by MDCR_EL2.TDCC for
+ * EL2 and MDCR_EL3.TDCC for EL3. They are also controlled by
+ * the general debug access trap bits MDCR_EL2.TDA and MDCR_EL3.TDA.
+ */
+static CPAccessResult access_tdcc(CPUARMState *env, const ARMCPRegInfo *ri,
+                                  bool isread)
+{
+    int el = arm_current_el(env);
+    uint64_t mdcr_el2 = arm_mdcr_el2_eff(env);
+    bool mdcr_el2_tda = (mdcr_el2 & MDCR_TDA) || (mdcr_el2 & MDCR_TDE) ||
+        (arm_hcr_el2_eff(env) & HCR_TGE);
+    bool mdcr_el2_tdcc = cpu_isar_feature(aa64_fgt, env_archcpu(env)) &&
+                                          (mdcr_el2 & MDCR_TDCC);
+    bool mdcr_el3_tdcc = cpu_isar_feature(aa64_fgt, env_archcpu(env)) &&
+                                          (env->cp15.mdcr_el3 & MDCR_TDCC);
+
+    if (el < 2 && (mdcr_el2_tda || mdcr_el2_tdcc)) {
+        return CP_ACCESS_TRAP_EL2;
+    }
+    if (el < 3 && ((env->cp15.mdcr_el3 & MDCR_TDA) || mdcr_el3_tdcc)) {
+        return CP_ACCESS_TRAP_EL3;
+    }
+    return CP_ACCESS_OK;
+}
+
 static void oslar_write(CPUARMState *env, const ARMCPRegInfo *ri,
                         uint64_t value)
 {
@@ -681,7 +708,7 @@ static const ARMCPRegInfo debug_cp_reginfo[] = {
      */
     { .name = "MDCCSR_EL0", .state = ARM_CP_STATE_AA64,
       .opc0 = 2, .opc1 = 3, .crn = 0, .crm = 1, .opc2 = 0,
-      .access = PL0_R, .accessfn = access_tda,
+      .access = PL0_R, .accessfn = access_tdcc,
       .type = ARM_CP_CONST, .resetvalue = 0 },
     /*
      * OSDTRRX_EL1/OSDTRTX_EL1 are used for save and restore of DBGDTRRX_EL0.
@@ -689,11 +716,11 @@ static const ARMCPRegInfo debug_cp_reginfo[] = {
      */
     { .name = "OSDTRRX_EL1", .state = ARM_CP_STATE_BOTH, .cp = 14,
       .opc0 = 2, .opc1 = 0, .crn = 0, .crm = 0, .opc2 = 2,
-      .access = PL1_RW, .accessfn = access_tda,
+      .access = PL1_RW, .accessfn = access_tdcc,
       .type = ARM_CP_CONST, .resetvalue = 0 },
     { .name = "OSDTRTX_EL1", .state = ARM_CP_STATE_BOTH, .cp = 14,
       .opc0 = 2, .opc1 = 0, .crn = 0, .crm = 3, .opc2 = 2,
-      .access = PL1_RW, .accessfn = access_tda,
+      .access = PL1_RW, .accessfn = access_tdcc,
       .type = ARM_CP_CONST, .resetvalue = 0 },
     /*
      * OSECCR_EL1 provides a mechanism for an operating system
@@ -757,7 +784,7 @@ static const ARMCPRegInfo debug_cp_reginfo[] = {
      */
     { .name = "MDCCINT_EL1", .state = ARM_CP_STATE_BOTH,
       .cp = 14, .opc0 = 2, .opc1 = 0, .crn = 0, .crm = 2, .opc2 = 0,
-      .access = PL1_RW, .accessfn = access_tda,
+      .access = PL1_RW, .accessfn = access_tdcc,
       .type = ARM_CP_NOP },
     /*
      * Dummy DBGCLAIM registers.
-- 
2.34.1


