Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8B81411765
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 16:45:24 +0200 (CEST)
Received: from localhost ([::1]:45130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSKXr-00071m-Jp
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 10:45:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mSK9G-0002Zh-Rf
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 10:19:58 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:41508)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mSK9D-0000nD-Ko
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 10:19:57 -0400
Received: by mail-wr1-x42b.google.com with SMTP id w29so30193173wra.8
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 07:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=pEPR4cXzCE7ylWGFdInCkdZZDyzNIPwfTQoI/xgwREk=;
 b=Zfn+KPVsf0BiDgxk/ZHSPEsTVhrx/FOyw59F8vGXjBv75WcjzudoMUWJwBdaAZbTaQ
 r1hshLUDZHq25TTSAl+loNcegwH10QU5EP2Rw2/ujh1NVI3Ct8UeND1LwzO6vXp9t04x
 4zcPdEz5NXlAdiDI9GegFztIbMXxP/B2UpnSq5NPkawP87uPEElvW/LUJqVcUh0SDd3S
 Ns8DSGirgTwagSn7Rjv/SkTmI1eYjuqmxtC7Bs+uB0+BhL7o4VyTqm/bDYkfW89dyWHo
 25iMY+bbkoexJFgJr/7nZwr78mTIhhK9S3jJDKEio272DjFcShC0dctklfY0aRVIKsC9
 OoAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pEPR4cXzCE7ylWGFdInCkdZZDyzNIPwfTQoI/xgwREk=;
 b=Fp6K6pNHBSbbgbkiG2Tr8RIwTt+uO8ehjUaxNUbYc6YqYYEH2mtEqNHjAPw2MhVu5G
 LUL9v19q3SzfvGOdSP5+CwpkF0Do7Wxk/j7gYlGdGpF7Ms1bZ+k8H7aNwS9Q9agxMg1R
 8FlhHrmV35X7PDiCVZ4Vhd0sJXpaNXmdfCddvSCLNPHFFWw9w5fldgNaIa2GTDsSLhw7
 0tE0FjRSDUR81C/AUOpEkBMfEQwT3JEBLUAfne73h//sKH1ufkpg3MNyztkkzfCHW1wy
 UU9XCaQlRWz6IQpaMlP8mpTu6c6W/qd4CUxPP964us0gTjfNlihjpMRaeODx7ko9rF6X
 /MzQ==
X-Gm-Message-State: AOAM5326ZR2eCuTCjGrrWXhqLtSnlFGrO/SGmskw6rKIMQhd/xkUNCap
 U3eTWSMo6WWWfskZFq3or7zBM/L2l9Z4qA==
X-Google-Smtp-Source: ABdhPJxpW27aIPsoChkhxJQx6NAgWiUu7roh6q5yey5KiQdnn3pPqN/ADS6v+fb0c+KM23yKd2reTw==
X-Received: by 2002:a5d:64c3:: with SMTP id f3mr27643369wri.73.1632147591422; 
 Mon, 20 Sep 2021 07:19:51 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id n17sm16229693wrp.17.2021.09.20.07.19.50
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 07:19:51 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 03/27] target/arm: Don't skip M-profile reset entirely in user
 mode
Date: Mon, 20 Sep 2021 15:19:23 +0100
Message-Id: <20210920141947.5537-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210920141947.5537-1-peter.maydell@linaro.org>
References: <20210920141947.5537-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Currently all of the M-profile specific code in arm_cpu_reset() is
inside a !defined(CONFIG_USER_ONLY) ifdef block.  This is
unintentional: it happened because originally the only
M-profile-specific handling was the setup of the initial SP and PC
from the vector table, which is system-emulation only.  But then we
added a lot of other M-profile setup to the same "if (ARM_FEATURE_M)"
code block without noticing that it was all inside a not-user-mode
ifdef.  This has generally been harmless, but with the addition of
v8.1M low-overhead-loop support we ran into a problem: the reset of
FPSCR.LTPSIZE to 4 was only being done for system emulation mode, so
if a user-mode guest tried to execute the LE instruction it would
incorrectly take a UsageFault.

Adjust the ifdefs so only the really system-emulation specific parts
are covered.  Because this means we now run some reset code that sets
up initial values in the FPCCR and similar FPU related registers,
explicitly set up the registers controlling FPU context handling in
user-emulation mode so that the FPU works by design and not by
chance.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/613
Cc: qemu-stable@nongnu.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210914120725.24992-2-peter.maydell@linaro.org
---
 target/arm/cpu.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index ba0741b20e4..3f750d5bfea 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -265,12 +265,15 @@ static void arm_cpu_reset(DeviceState *dev)
         env->uncached_cpsr = ARM_CPU_MODE_SVC;
     }
     env->daif = PSTATE_D | PSTATE_A | PSTATE_I | PSTATE_F;
+#endif
 
     if (arm_feature(env, ARM_FEATURE_M)) {
+#ifndef CONFIG_USER_ONLY
         uint32_t initial_msp; /* Loaded from 0x0 */
         uint32_t initial_pc; /* Loaded from 0x4 */
         uint8_t *rom;
         uint32_t vecbase;
+#endif
 
         if (cpu_isar_feature(aa32_lob, cpu)) {
             /*
@@ -324,6 +327,8 @@ static void arm_cpu_reset(DeviceState *dev)
             env->v7m.fpccr[M_REG_S] = R_V7M_FPCCR_ASPEN_MASK |
                 R_V7M_FPCCR_LSPEN_MASK | R_V7M_FPCCR_S_MASK;
         }
+
+#ifndef CONFIG_USER_ONLY
         /* Unlike A/R profile, M profile defines the reset LR value */
         env->regs[14] = 0xffffffff;
 
@@ -352,8 +357,22 @@ static void arm_cpu_reset(DeviceState *dev)
         env->regs[13] = initial_msp & 0xFFFFFFFC;
         env->regs[15] = initial_pc & ~1;
         env->thumb = initial_pc & 1;
+#else
+        /*
+         * For user mode we run non-secure and with access to the FPU.
+         * The FPU context is active (ie does not need further setup)
+         * and is owned by non-secure.
+         */
+        env->v7m.secure = false;
+        env->v7m.nsacr = 0xcff;
+        env->v7m.cpacr[M_REG_NS] = 0xf0ffff;
+        env->v7m.fpccr[M_REG_S] &=
+            ~(R_V7M_FPCCR_LSPEN_MASK | R_V7M_FPCCR_S_MASK);
+        env->v7m.control[M_REG_S] |= R_V7M_CONTROL_FPCA_MASK;
+#endif
     }
 
+#ifndef CONFIG_USER_ONLY
     /* AArch32 has a hard highvec setting of 0xFFFF0000.  If we are currently
      * executing as AArch32 then check if highvecs are enabled and
      * adjust the PC accordingly.
-- 
2.20.1


