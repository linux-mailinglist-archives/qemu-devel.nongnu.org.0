Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 378C755B928
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 12:33:03 +0200 (CEST)
Received: from localhost ([::1]:39178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5m3C-0003qH-6m
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 06:33:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o5ltJ-0002Ja-Ni
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 06:22:50 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:33879)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o5ltH-0004sk-88
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 06:22:49 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 m6-20020a05600c3b0600b003a0489f412cso1151907wms.1
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 03:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=UTv8wcV/DPc1kqXdo7thfBSpvl/+DZKxa8gDxsT5bAo=;
 b=TneaXHkM0fXpTarEfQI31y/ee0jSB/jVfAHkfjIosObO2/4CocUTQMR1TuR8OlDeZP
 YuLocisOt5J/NrSxWU1zJ4FoHouf301ZLK+UUPs0WvkXEge69OF+vWG0Pgic0KEcTpiH
 x/JtPbLPej/g0LLIBW3delR+nVxRRKex+xh7UzrmVrzJobIvwhK5qwNLWvXqX+wG61ag
 b+HK/0vO92DcJKP4tbRWuTATHgPANeLIh4FSdyC3GhtIn5Oohos7/G0cSZa6DRrNBiEE
 H7mQqqZEzoadhH9IfN+F2LZnSXV8NYThJL6VD1tM8x9MgslRUv5+x0pxMjvQ4GFCILr+
 GGxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UTv8wcV/DPc1kqXdo7thfBSpvl/+DZKxa8gDxsT5bAo=;
 b=ZfLSeIT4alN0Qz7HuIZ8V16+apDinlptjnrA15mJWWojqtPCifv25fQMnRQhut/m73
 1Z5uzaUotPCjhx+cQBMQd1VXh6HZstbVRsg+FrjHsEWNn+tfooWOlaXvPrysoixcO+Ve
 /s/+S/pIA12kc/eCgVqqG/gn6TdvlnNVoPw4q/keRPG+P7DvY4ebg05MrGVXnJJ5XrMw
 8+06WggOpCRh6hZwGQvMJY66XfA2eWoimNPQNsm2j7FeUCqzvxqGUfpBOhjwfZRVYI/O
 hfMBM5hWDWCjrBE+cGbaVvruLqrRdApQFYJaPUT5ABSjFYZBmLuV+9UasjG7oMUfmZQ5
 bEng==
X-Gm-Message-State: AJIora+ELsM6KdDaghS87xp5i6Nv0B1WlXtV+oPML9HBtfufAFbusEJA
 9BkX/KMoMbVA3AyUJU0Q5g1AYp4yIQfLOQ==
X-Google-Smtp-Source: AGRyM1suHhxwqAc6u/FL3G1A+6CzgIgWNPzjse9RBX50ZcnW3R6mE/kseJkNxR4nxOlLtN8d7OFuhg==
X-Received: by 2002:a1c:7719:0:b0:3a0:31a6:4469 with SMTP id
 t25-20020a1c7719000000b003a031a64469mr14404228wmi.20.1656325365869; 
 Mon, 27 Jun 2022 03:22:45 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 d11-20020a5d6dcb000000b0020e6ce4dabdsm9754335wrz.103.2022.06.27.03.22.45
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 03:22:45 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 10/25] target/arm: Add SMIDR_EL1, SMPRI_EL1, SMPRIMAP_EL2
Date: Mon, 27 Jun 2022 11:22:21 +0100
Message-Id: <20220627102236.3097629-11-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220627102236.3097629-1-peter.maydell@linaro.org>
References: <20220627102236.3097629-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
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

From: Richard Henderson <richard.henderson@linaro.org>

Implement the streaming mode identification register, and the
two streaming priority registers.  For QEMU, they are all RES0.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220620175235.60881-8-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 2072f2a550e..bbd04fbd67b 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6351,6 +6351,18 @@ static CPAccessResult access_tpidr2(CPUARMState *env, const ARMCPRegInfo *ri,
     return CP_ACCESS_OK;
 }
 
+static CPAccessResult access_esm(CPUARMState *env, const ARMCPRegInfo *ri,
+                                 bool isread)
+{
+    /* TODO: FEAT_FGT for SMPRI_EL1 but not SMPRIMAP_EL2 */
+    if (arm_current_el(env) < 3
+        && arm_feature(env, ARM_FEATURE_EL3)
+        && !FIELD_EX64(env->cp15.cptr_el[3], CPTR_EL3, ESM)) {
+        return CP_ACCESS_TRAP_EL3;
+    }
+    return CP_ACCESS_OK;
+}
+
 static void svcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
                        uint64_t value)
 {
@@ -6408,6 +6420,27 @@ static const ARMCPRegInfo sme_reginfo[] = {
       .access = PL3_RW, .type = ARM_CP_SME,
       .fieldoffset = offsetof(CPUARMState, vfp.smcr_el[3]),
       .writefn = smcr_write, .raw_writefn = raw_write },
+    { .name = "SMIDR_EL1", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 1, .crn = 0, .crm = 0, .opc2 = 6,
+      .access = PL1_R, .accessfn = access_aa64_tid1,
+      /*
+       * IMPLEMENTOR = 0 (software)
+       * REVISION    = 0 (implementation defined)
+       * SMPS        = 0 (no streaming execution priority in QEMU)
+       * AFFINITY    = 0 (streaming sve mode not shared with other PEs)
+       */
+      .type = ARM_CP_CONST, .resetvalue = 0, },
+    /*
+     * Because SMIDR_EL1.SMPS is 0, SMPRI_EL1 and SMPRIMAP_EL2 are RES 0.
+     */
+    { .name = "SMPRI_EL1", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 0, .crn = 1, .crm = 2, .opc2 = 4,
+      .access = PL1_RW, .accessfn = access_esm,
+      .type = ARM_CP_CONST, .resetvalue = 0 },
+    { .name = "SMPRIMAP_EL2", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 4, .crn = 1, .crm = 2, .opc2 = 5,
+      .access = PL2_RW, .accessfn = access_esm,
+      .type = ARM_CP_CONST, .resetvalue = 0 },
 };
 #endif /* TARGET_AARCH64 */
 
-- 
2.25.1


