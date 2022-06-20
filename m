Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 227A6552388
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 20:06:10 +0200 (CEST)
Received: from localhost ([::1]:47442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3Lmr-0003Sz-79
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 14:06:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3LZv-0005ep-4k
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 13:52:47 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:36361)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3LZs-0001N1-W9
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 13:52:46 -0400
Received: by mail-pf1-x42a.google.com with SMTP id u37so10871688pfg.3
 for <qemu-devel@nongnu.org>; Mon, 20 Jun 2022 10:52:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5s/+YW/vX1WwcuSwHWbOioATvoXW2euPDPUYkCg3zf8=;
 b=zznQRs1fTW5xZTmWQvugmL35dP2fkEUFzfmiY/JtJa3Xn+QiBlwjb0vhK9tsTrAbm7
 pfAArosd9aaQ0jVNZVTs9Mr3b/4JaSwr+ZCJU1166NYkHQ8S6N7kBH4v37lxelNhs+Dv
 1RErIcWZaKomyAoxZS7emEscry7ZD0phKrPAHXEP0vIBjodwQksVRSHmXGBKXAj+NdZe
 52LPMtGmEN9WZxuubR7kxbxpoVhptlQTbnQrnKMlf2f3lPlZPJ3aXNeokMe2dKHMTIS7
 KJHT6jp20lVQ9838Ue3J7GyA0nWRAAjH6117NB56yukV+4NKeZw72oXqo/TUEwGQh5PE
 /GbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5s/+YW/vX1WwcuSwHWbOioATvoXW2euPDPUYkCg3zf8=;
 b=mvaEdKr6Tx+Hj3L0YtT2TV1Dc2uWp/HngHlEbd+wH7CN0B3Bk2IT8rzhiRld/6g6UY
 +c9padGtZe94wiP1LIxWWrZ1c0Cb7FS0mDaO5x66ULEf/gaStsFcjShNjl5bj6+NvxB/
 G2ug+HkOWvZIH4b/ZKcXglxRKUmLUszXguu30NYium9y10YxCiCQ7wtzk4NVcif4Za2S
 8gBwUOSrJ7L2aYq0fe7vnS0VanUhNNBbdjCm2ndscdJHheE76YIPrOP6sBO9zqak6Ud8
 qjx4KxIY1L5LJ/fFr0XZSMb3u5YDC5G4nzd5q7Hro8FwApUqq1uYStS+f8C9cT0Geew8
 gtfA==
X-Gm-Message-State: AJIora/3G6eakUdAcHKZ7g7SXrduYuVK5IJrDyG67L6Xna7/fNeIxjIB
 4AD2u1Mn7MJZ7AqQp+nucrR1g+jsHIJk+g==
X-Google-Smtp-Source: AGRyM1trGt5geYMTEK/dRBC/QRJRS3g6P11S1x9KnHUyKTfypa6EWTO4wfV/jJdaM64Wu2pc/PwWMw==
X-Received: by 2002:a05:6a00:1152:b0:4be:ab79:fcfa with SMTP id
 b18-20020a056a00115200b004beab79fcfamr25668965pfm.3.1655747562634; 
 Mon, 20 Jun 2022 10:52:42 -0700 (PDT)
Received: from stoup.. ([2602:47:d49e:3c01:a3e0:8a80:7b85:aea6])
 by smtp.gmail.com with ESMTPSA id
 j14-20020aa7928e000000b00525133f98adsm5138138pfa.146.2022.06.20.10.52.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 10:52:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 07/51] target/arm: Add SMIDR_EL1, SMPRI_EL1, SMPRIMAP_EL2
Date: Mon, 20 Jun 2022 10:51:51 -0700
Message-Id: <20220620175235.60881-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220620175235.60881-1-richard.henderson@linaro.org>
References: <20220620175235.60881-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Implement the streaming mode identification register, and the
two streaming priority registers.  For QEMU, they are all RES0.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 2072f2a550..bbd04fbd67 100644
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
2.34.1


