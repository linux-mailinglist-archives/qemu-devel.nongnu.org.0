Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA9974AD843
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 13:23:44 +0100 (CET)
Received: from localhost ([::1]:49678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHPX5-0000wU-Kw
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 07:23:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHOqt-0000l6-KX
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 06:40:08 -0500
Received: from [2a00:1450:4864:20::42c] (port=45049
 helo=mail-wr1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHOqn-000260-8L
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 06:40:04 -0500
Received: by mail-wr1-x42c.google.com with SMTP id k18so30169536wrg.11
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 03:40:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=0p89JlNK/gdgxgU6z1QE83PIekJHSLOFEA28AM6yAyk=;
 b=RtrCaCwgRKDDgmRcI3b785kbzlleCu0ZpTievGNAnIkU8UkGMevLodBC0t+n40+ujT
 c7xT8Eg4ivDpAo1rcxy1b3OiIZPaHe2q8k9/y7BzILMLXU8e+0h8gLs1NNvutrXYEam9
 NkLm0Dp+riw8GkOcgZNfyYVhRZxK3U5YF9PO94u3FpVjLLHGxEBxxOUu7KvDK+3IG+Nt
 h7pExs1ZwhC9FX/Fni3t9pz0ZPSbwth/aNOVu+f4EGSMWxK4hes1DrzijsKH4gu21JhE
 LO/dWq6cwS+Ku4Wm0A/rtefi+3g+m/QEt1WfYcbvHt1WRhSP6iKuPvTTc6FZGwFSkyKn
 7i1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0p89JlNK/gdgxgU6z1QE83PIekJHSLOFEA28AM6yAyk=;
 b=TjlrrLsSKpZcu7Fs33HBbnrG1P9KikeI0XCwmMd7KBst+1eUJ4IPW4fGF2rVX0NI/Q
 Hr+RZYjSUNjAtXJ/iuDeX5V/imibvcnrA+2gTj7YFqXs4vfnA38zuI28xU9ghhEBx5kO
 ZjO3YPiitVs8Hn5/v/ij3W/5lXByCen1pqvr8QCpdcxaAZY8u0BOiHgWdwbIP5DiVztG
 fZjVsy5YxqOewPh5wXw0O5eN+5VWUGqhh187Z9Dh/jZXzNg7160DyvRcP7+4BvGYIGtU
 4J//kvuJrdgdrs515YCFdbQS9cej2sJUny2eFERVEvYXt6gcivIIIFdfkdtMXiY4JmA6
 Exkg==
X-Gm-Message-State: AOAM533W4Et8XVgwvRRWdNkvTQa4LvePXsCwr+KDdEyMXEjfvMq1105P
 8s8ZH8DuAfKndeJ+QF1vPxGqXYArX0GgVA==
X-Google-Smtp-Source: ABdhPJwuzacO5JZFwfgKOWXV9jyiIlDIUZv5zy0V/fBR4SnR6q6AvJAfuN4VEfgrRImkx9csx0lvIA==
X-Received: by 2002:a5d:59af:: with SMTP id p15mr3310499wrr.488.1644320399960; 
 Tue, 08 Feb 2022 03:39:59 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id r11sm4245199wrt.28.2022.02.08.03.39.59
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 03:39:59 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 15/39] arm: tcg: Adhere to SMCCC 1.3 section 5.2
Date: Tue,  8 Feb 2022 11:39:24 +0000
Message-Id: <20220208113948.3217356-16-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220208113948.3217356-1-peter.maydell@linaro.org>
References: <20220208113948.3217356-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

The SMCCC 1.3 spec section 5.2 says

  The Unknown SMC Function Identifier is a sign-extended value of (-1)
  that is returned in the R0, W0 or X0 registers. An implementation must
  return this error code when it receives:

    * An SMC or HVC call with an unknown Function Identifier
    * An SMC or HVC call for a removed Function Identifier
    * An SMC64/HVC64 call from AArch32 state

To comply with these statements, let's always return -1 when we encounter
an unknown HVC or SMC call.

[PMM:
 This is a reinstatement of commit 9fcd15b9193e819b, previously
 reverted in commit 4825eaae4fdd56fba0f; we can do this now that we
 have arranged for all the affected board models to not enable the
 PSCI emulation if they are running guest code at EL3. This avoids
 the regressions that caused us to revert the change for 7.0.]

Signed-off-by: Alexander Graf <agraf@csgraf.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Niek Linnenbank <nieklinnenbank@gmail.com>
Tested-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Tested-by: Cédric Le Goater <clg@kaod.org>
Tested-by: Niek Linnenbank <nieklinnenbank@gmail.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/psci.c | 35 ++++++-----------------------------
 1 file changed, 6 insertions(+), 29 deletions(-)

diff --git a/target/arm/psci.c b/target/arm/psci.c
index 6709e280133..b279c0b9a45 100644
--- a/target/arm/psci.c
+++ b/target/arm/psci.c
@@ -27,15 +27,13 @@
 
 bool arm_is_psci_call(ARMCPU *cpu, int excp_type)
 {
-    /* Return true if the r0/x0 value indicates a PSCI call and
-     * the exception type matches the configured PSCI conduit. This is
-     * called before the SMC/HVC instruction is executed, to decide whether
-     * we should treat it as a PSCI call or with the architecturally
+    /*
+     * Return true if the exception type matches the configured PSCI conduit.
+     * This is called before the SMC/HVC instruction is executed, to decide
+     * whether we should treat it as a PSCI call or with the architecturally
      * defined behaviour for an SMC or HVC (which might be UNDEF or trap
      * to EL2 or to EL3).
      */
-    CPUARMState *env = &cpu->env;
-    uint64_t param = is_a64(env) ? env->xregs[0] : env->regs[0];
 
     switch (excp_type) {
     case EXCP_HVC:
@@ -52,27 +50,7 @@ bool arm_is_psci_call(ARMCPU *cpu, int excp_type)
         return false;
     }
 
-    switch (param) {
-    case QEMU_PSCI_0_2_FN_PSCI_VERSION:
-    case QEMU_PSCI_0_2_FN_MIGRATE_INFO_TYPE:
-    case QEMU_PSCI_0_2_FN_AFFINITY_INFO:
-    case QEMU_PSCI_0_2_FN64_AFFINITY_INFO:
-    case QEMU_PSCI_0_2_FN_SYSTEM_RESET:
-    case QEMU_PSCI_0_2_FN_SYSTEM_OFF:
-    case QEMU_PSCI_0_1_FN_CPU_ON:
-    case QEMU_PSCI_0_2_FN_CPU_ON:
-    case QEMU_PSCI_0_2_FN64_CPU_ON:
-    case QEMU_PSCI_0_1_FN_CPU_OFF:
-    case QEMU_PSCI_0_2_FN_CPU_OFF:
-    case QEMU_PSCI_0_1_FN_CPU_SUSPEND:
-    case QEMU_PSCI_0_2_FN_CPU_SUSPEND:
-    case QEMU_PSCI_0_2_FN64_CPU_SUSPEND:
-    case QEMU_PSCI_0_1_FN_MIGRATE:
-    case QEMU_PSCI_0_2_FN_MIGRATE:
-        return true;
-    default:
-        return false;
-    }
+    return true;
 }
 
 void arm_handle_psci_call(ARMCPU *cpu)
@@ -194,10 +172,9 @@ void arm_handle_psci_call(ARMCPU *cpu)
         break;
     case QEMU_PSCI_0_1_FN_MIGRATE:
     case QEMU_PSCI_0_2_FN_MIGRATE:
+    default:
         ret = QEMU_PSCI_RET_NOT_SUPPORTED;
         break;
-    default:
-        g_assert_not_reached();
     }
 
 err:
-- 
2.25.1


