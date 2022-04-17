Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5799B5048C1
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Apr 2022 20:04:33 +0200 (CEST)
Received: from localhost ([::1]:41544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ng9GC-0004iL-FP
	for lists+qemu-devel@lfdr.de; Sun, 17 Apr 2022 14:04:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng8x0-0000fb-AS
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 13:44:43 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:33601)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng8wx-0003Hb-IO
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 13:44:42 -0400
Received: by mail-pg1-x534.google.com with SMTP id k14so14986489pga.0
 for <qemu-devel@nongnu.org>; Sun, 17 Apr 2022 10:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vIjgH0QxYeAMP4DzJu3i3Y0UtqyUSNTOLfLjsYFO5vU=;
 b=PDXnRxqpB6Ja5X6pHmUS58KPdyU9sgvY3ljJ1wuYioD3iMjqxhl1US2Siw/MnLHRmm
 KDWsbWAByfc0AtQ2C1aieJm4zbxOClH7c6OOt2y8hBoeuNI0AlJT/MJEn8NEJFcBBfYB
 ao0RyFRr/Tp/D12Gw1gAw51lT/yp25XR4606YZEPIGyqoW01/vRbTW5JF2PywahmTWy5
 J4WKLJ1XfO6g5nR1YCgSllkqelxOc+f/5xBnc1e1RBLHICicd0oyHooWbfI+COkEDmyX
 mfhDYthyZ8dYoZmEEHM/HOnYha9srcbSTxv5tRCM6PP+BS91cz7u9OhO+jtZcxEUl280
 NJjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vIjgH0QxYeAMP4DzJu3i3Y0UtqyUSNTOLfLjsYFO5vU=;
 b=k2eDWJM8M6UHwvqZTclmRKPqOQ+viX2RmHSF+RUwB4QmrFODSarlsqeFoLOs0Itjd9
 dMTMnfLaWpHF4jWHLW4S4WqYFyYKXzvc7zNFoaQiCsPjdoLF1xEzzood9SK2mmXRtJkV
 GCVqUvz/TD2FVsLzxQ6GRadb3cRVoHBGkdR0XBwco6LYLGy1U4AjNW0fY1rFk86ZwtP4
 yi96sT0GjKplDEwZSEMzWtdo3GMGjCNKa3V4cVS8njogtHBJpMl+In7LnHgPD6XfVdCy
 faRlFaP2IdOyoH+tYVU87sSbKP4GW0rtJcqFUfdt5/ICYTqRweRoK8MrpzVDQ2GKY8G/
 dWdw==
X-Gm-Message-State: AOAM5302+/e2mD5OOw8hNGbaLv/830O9/QJtdDuonu3Y+KAwgilpzaFW
 CpCiKepUBJkjf3SCJzgBD3UbgPdLTDg5sw==
X-Google-Smtp-Source: ABdhPJyUrP1Buc94SOsJh37YYwb2NT31te6I54Ssx353atCZr66Wt70n3K1wgtbc9Ahyl4JgQeOwDA==
X-Received: by 2002:a63:4f43:0:b0:39d:96ff:838c with SMTP id
 p3-20020a634f43000000b0039d96ff838cmr6937937pgl.115.1650217478256; 
 Sun, 17 Apr 2022 10:44:38 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 i2-20020a17090a138200b001cb6512b579sm10372119pja.44.2022.04.17.10.44.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Apr 2022 10:44:37 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 10/60] target/arm: Remove fpexc32_access
Date: Sun, 17 Apr 2022 10:43:36 -0700
Message-Id: <20220417174426.711829-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220417174426.711829-1-richard.henderson@linaro.org>
References: <20220417174426.711829-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This function is incorrect in that it does not properly consider
CPTR_EL2.FPEN.  We've already got another mechanism for raising
an FPU access trap: ARM_CP_FPU, so use that instead.

Remove CP_ACCESS_TRAP_FP_EL{2,3}, which becomes unused.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h       |  5 -----
 target/arm/helper.c    | 17 ++---------------
 target/arm/op_helper.c | 13 -------------
 3 files changed, 2 insertions(+), 33 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 4eb378ede2..e7f669d0a9 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2806,11 +2806,6 @@ typedef enum CPAccessResult {
     /* As CP_ACCESS_UNCATEGORIZED, but for traps directly to EL2 or EL3 */
     CP_ACCESS_TRAP_UNCATEGORIZED_EL2 = 5,
     CP_ACCESS_TRAP_UNCATEGORIZED_EL3 = 6,
-    /* Access fails and results in an exception syndrome for an FP access,
-     * trapped directly to EL2 or EL3
-     */
-    CP_ACCESS_TRAP_FP_EL2 = 7,
-    CP_ACCESS_TRAP_FP_EL3 = 8,
 } CPAccessResult;
 
 /* Access functions for coprocessor registers. These cannot fail and
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 47fe790854..60d9233b7e 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -4785,18 +4785,6 @@ static void sctlr_write(CPUARMState *env, const ARMCPRegInfo *ri,
     }
 }
 
-static CPAccessResult fpexc32_access(CPUARMState *env, const ARMCPRegInfo *ri,
-                                     bool isread)
-{
-    if ((env->cp15.cptr_el[2] & CPTR_TFP) && arm_current_el(env) == 2) {
-        return CP_ACCESS_TRAP_FP_EL2;
-    }
-    if (env->cp15.cptr_el[3] & CPTR_TFP) {
-        return CP_ACCESS_TRAP_FP_EL3;
-    }
-    return CP_ACCESS_OK;
-}
-
 static void sdcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
                        uint64_t value)
 {
@@ -5098,9 +5086,8 @@ static const ARMCPRegInfo v8_cp_reginfo[] = {
       .access = PL1_RW, .readfn = spsel_read, .writefn = spsel_write },
     { .name = "FPEXC32_EL2", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 4, .crn = 5, .crm = 3, .opc2 = 0,
-      .type = ARM_CP_ALIAS,
-      .fieldoffset = offsetof(CPUARMState, vfp.xregs[ARM_VFP_FPEXC]),
-      .access = PL2_RW, .accessfn = fpexc32_access },
+      .access = PL2_RW, .type = ARM_CP_ALIAS | ARM_CP_FPU,
+      .fieldoffset = offsetof(CPUARMState, vfp.xregs[ARM_VFP_FPEXC]) },
     { .name = "DACR32_EL2", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 4, .crn = 3, .crm = 0, .opc2 = 0,
       .access = PL2_RW, .resetvalue = 0,
diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
index 70b42b55fd..2b87e8808b 100644
--- a/target/arm/op_helper.c
+++ b/target/arm/op_helper.c
@@ -691,19 +691,6 @@ void HELPER(access_check_cp_reg)(CPUARMState *env, void *rip, uint32_t syndrome,
         target_el = 3;
         syndrome = syn_uncategorized();
         break;
-    case CP_ACCESS_TRAP_FP_EL2:
-        target_el = 2;
-        /* Since we are an implementation that takes exceptions on a trapped
-         * conditional insn only if the insn has passed its condition code
-         * check, we take the IMPDEF choice to always report CV=1 COND=0xe
-         * (which is also the required value for AArch64 traps).
-         */
-        syndrome = syn_fp_access_trap(1, 0xe, false);
-        break;
-    case CP_ACCESS_TRAP_FP_EL3:
-        target_el = 3;
-        syndrome = syn_fp_access_trap(1, 0xe, false);
-        break;
     default:
         g_assert_not_reached();
     }
-- 
2.25.1


