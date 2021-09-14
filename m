Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CCB240AD23
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 14:11:43 +0200 (CEST)
Received: from localhost ([::1]:49174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ7Hq-0004c6-Al
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 08:11:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mQ7Do-0000fj-KC
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 08:07:32 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:46749)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mQ7Dm-0001IE-Lz
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 08:07:32 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 d207-20020a1c1dd8000000b00307e2d1ec1aso2334147wmd.5
 for <qemu-devel@nongnu.org>; Tue, 14 Sep 2021 05:07:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/ZjtokmHY6o9GT+MByl1Znj62SUPnzI2WW/LyA2oZFU=;
 b=JjvceNK1WEKHsntIddF7zRL/X46gtby/InJOoOyub7rGuYABJBmBdL5paVtlSOS9Rp
 3nSX9GFnEbwYfyzE1e8vxdwgJwp7aMiLjNKy0wQddcBZ+X2pot5eIj8xx0O3Ljj1qlRU
 C+HfftMwCaH4dPTkexRI3g9LR1HO3v8UVLkh4tEr74Ho/lwVKRnd2c9iomLJyW7jhSV2
 iG1Zus+h2sc8U1tYEnky5C/r0LLZvtL1f7hhMKaquqXnApyRnsNEBPEgfxtWoChvpd9F
 WjH8Etg1lGziPezNkysf1dc69fzBplJ5mo3REa5IX663FjLIWVz0TLNgzOqMw6j44ksM
 qUkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/ZjtokmHY6o9GT+MByl1Znj62SUPnzI2WW/LyA2oZFU=;
 b=VXHW4O40rrgf5fXW6ULEdcJkcn/8ZHmr4qpTenj675RPAyHJSjBiq+tYqTLuS66sTP
 +Et1sY52oDqw7FLU9H294Yb9CLK+PRMgBS/LcBmxLyZJ8+7uhlRUKabGdZfSEg1qmEwk
 tYHOPedfqazm2sAazPQJPU2Yvlcvo/D3zy1GSB9jJ8607SiV6ln3itnhi23b82H/xDQt
 Iyr3a/xXn48klKC0HyrKrZ+/yEJR5VsUSewCdmkJaem1Xa1H2beKfBuvcMiBvDrwvGJ6
 Xu8EhtnT5Fm/zm1XlLBAxkKL75ivd05eOrvbjJaNbuYAXyTHehkmEQqOmlpKgLjDogZl
 z79Q==
X-Gm-Message-State: AOAM533s096ZaUE2w28zea1/v+64EVBwnbRZ4bsCd83lF2i5od9Dfqsp
 vxO3BEuxaZSbL5QzRpaXY3MLh5VCbYHFfw==
X-Google-Smtp-Source: ABdhPJwQ/NJJaJ8yvwOBLMsozaD8IAkGqbtRZvPLJzF9iyCJmlgcY0GqOeRWFKrcHi5YmYOmvMhvUA==
X-Received: by 2002:a1c:1cc:: with SMTP id 195mr1813254wmb.188.1631621248305; 
 Tue, 14 Sep 2021 05:07:28 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id o10sm11472466wrc.16.2021.09.14.05.07.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Sep 2021 05:07:28 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 1/3] target/arm: Don't skip M-profile reset entirely in user
 mode
Date: Tue, 14 Sep 2021 13:07:23 +0100
Message-Id: <20210914120725.24992-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210914120725.24992-1-peter.maydell@linaro.org>
References: <20210914120725.24992-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
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
Cc: Christophe Lyon <christophe.lyon@linaro.org>
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
---
 target/arm/cpu.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index d631c4683c4..98eed6c6d31 100644
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


