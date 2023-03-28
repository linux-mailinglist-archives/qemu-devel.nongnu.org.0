Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA9B86CC0F9
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 15:32:45 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ph9Pt-0000DH-T5; Tue, 28 Mar 2023 09:31:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ph9Pq-0000Ch-SE
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 09:31:10 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ph9Po-0006D0-TW
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 09:31:10 -0400
Received: by mail-wr1-x42e.google.com with SMTP id r11so12212059wrr.12
 for <qemu-devel@nongnu.org>; Tue, 28 Mar 2023 06:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680010268;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RpHBQbQwV/0NgNdAldoL5xQrOqOCQXGkNEOw37fpu/Y=;
 b=hjBnVEWp873waT3n+FTbt3LDEjNNsjlHMKTcsa5Yw7EuXTPxhK4ieLE8qLXMEShd3N
 rqYCzYlH4Je0J7Zo5M5nkpv5fcQz31Y3LGlY0nE7GytIsLVovVXTVXeyEe8bWHWKarbV
 1Yz/QPmk6ZcPNmceOKbrYfpDyGwKejxSHNBA1wV7t51rvxzmG/QiFeBAiI6erORLh7I+
 cv3OuNG6HiQ9F5rjpfJ6XcrljbkN/I2M5BwvWP1lMlAmv1vFB+oNpRnaldqD2/fNtL5g
 XLnCSRFhGk7AWnuLKiHmZQZMCh9BUHTE6JcTkV2s2wc7YMfg4bWj+LQRyTTpXGRSzcIG
 09tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680010268;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RpHBQbQwV/0NgNdAldoL5xQrOqOCQXGkNEOw37fpu/Y=;
 b=Yfn+Syyw7/FbV4jztSKPeqEOtyzxyA1YaUmwd3QOxELDb4A5fvI0R4/9H6Z2WxS+IN
 COuEgwqYqyXRyGvPNRb9mw/N3V9XQO/OkQZXEitPTDdkio0dcrBa9iPgPCIh9tBUabSH
 o6PWbQhJK7sI/aLuA2LBU7PeAv1aCQLsJ/QrHeJnfB/2bE8du9S120ja086O7wFfh8pk
 JGbxxUsb9aqB7pN1cjWkC0JUmbZTvVHhdc8wkpO5NN1is1j2K+y05v45bRxZvLNQdLu4
 Rgt5MTzRvqhexFZeWHMk0PdYcHkAIa2qDIjn/ctVymmdKDjx6CIMcSORHBWHpWwSIUHj
 syjA==
X-Gm-Message-State: AAQBX9dYFxc/hIsFHLaTWFv9f+11znzt+GJpfwuGimaKLu93RUvEvqX6
 R25RuLzd/y3zccEiGe6AFtHDug==
X-Google-Smtp-Source: AKy350ZpZeqOVAwUeVVnQce07pMDfOuvgDYq3HcnXrGqWSBegup0aOz5b26XpvePZ1DFsfz/GMjf6g==
X-Received: by 2002:a5d:4d11:0:b0:2d2:d324:e44f with SMTP id
 z17-20020a5d4d11000000b002d2d324e44fmr12287363wrt.16.1680010268143; 
 Tue, 28 Mar 2023 06:31:08 -0700 (PDT)
Received: from localhost.localdomain ([176.187.210.212])
 by smtp.gmail.com with ESMTPSA id
 v6-20020a5d6106000000b002c55521903bsm27530836wrt.51.2023.03.28.06.31.07
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 28 Mar 2023 06:31:07 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>,
	qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Claudio Fontana <cfontana@suse.de>, Fabiano Rosas <farosas@suse.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-8.0 v2 2/2] target/arm/pauth: Inline pauth_param_mask()
 and pauth_ptr_mask()
Date: Tue, 28 Mar 2023 15:30:54 +0200
Message-Id: <20230328133054.6553-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230328133054.6553-1-philmd@linaro.org>
References: <20230328133054.6553-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
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

aarch64_gdb_get_pauth_reg() -- although disabled since commit
5787d17a42 ("target/arm: Don't advertise aarch64-pauth.xml to
gdb") is still compiled in. It calls pauth_ptr_mask() which is
located in target/arm/tcg/pauth_helper.c, a TCG specific helper.

To avoid a linking error when TCG is not enabled:

  Undefined symbols for architecture arm64:
    "_pauth_ptr_mask", referenced from:
        _aarch64_gdb_get_pauth_reg in target_arm_gdbstub64.c.o
  ld: symbol(s) not found for architecture arm64
  clang: error: linker command failed with exit code 1 (use -v to see invocation)

- Rename pauth_ptr_mask_internal() as pauth_param_mask() and
  inline it in "internals.h",
- Inline pauth_ptr_mask() in "internals.h".

Fixes: e995d5cce4 ("target/arm: Implement gdbstub pauth extension")
Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/internals.h        | 16 +++++++++++++++-
 target/arm/tcg/pauth_helper.c | 18 +-----------------
 2 files changed, 16 insertions(+), 18 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 673519a24a..a617466fa8 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1389,6 +1389,14 @@ int exception_target_el(CPUARMState *env);
 bool arm_singlestep_active(CPUARMState *env);
 bool arm_generate_debug_exceptions(CPUARMState *env);
 
+static inline uint64_t pauth_param_mask(ARMVAParameters param)
+{
+    int bot_pac_bit = 64 - param.tsz;
+    int top_pac_bit = 64 - 8 * param.tbi;
+
+    return MAKE_64BIT_MASK(bot_pac_bit, top_pac_bit - bot_pac_bit);
+}
+
 /**
  * pauth_ptr_mask:
  * @env: cpu context
@@ -1397,7 +1405,13 @@ bool arm_generate_debug_exceptions(CPUARMState *env);
  *
  * Return a mask of the bits of @ptr that contain the authentication code.
  */
-uint64_t pauth_ptr_mask(CPUARMState *env, uint64_t ptr, bool data);
+static inline uint64_t pauth_ptr_mask(CPUARMState *env, uint64_t ptr, bool data)
+{
+    ARMMMUIdx mmu_idx = arm_stage1_mmu_idx(env);
+    ARMVAParameters param = aa64_va_parameters(env, ptr, mmu_idx, data);
+
+    return pauth_param_mask(param);
+}
 
 /* Add the cpreg definitions for debug related system registers */
 void define_debug_regs(ARMCPU *cpu);
diff --git a/target/arm/tcg/pauth_helper.c b/target/arm/tcg/pauth_helper.c
index 20f347332d..c78dafda4e 100644
--- a/target/arm/tcg/pauth_helper.c
+++ b/target/arm/tcg/pauth_helper.c
@@ -339,17 +339,9 @@ static uint64_t pauth_addpac(CPUARMState *env, uint64_t ptr, uint64_t modifier,
     return pac | ext | ptr;
 }
 
-static uint64_t pauth_ptr_mask_internal(ARMVAParameters param)
-{
-    int bot_pac_bit = 64 - param.tsz;
-    int top_pac_bit = 64 - 8 * param.tbi;
-
-    return MAKE_64BIT_MASK(bot_pac_bit, top_pac_bit - bot_pac_bit);
-}
-
 static uint64_t pauth_original_ptr(uint64_t ptr, ARMVAParameters param)
 {
-    uint64_t mask = pauth_ptr_mask_internal(param);
+    uint64_t mask = pauth_param_mask(param);
 
     /* Note that bit 55 is used whether or not the regime has 2 ranges. */
     if (extract64(ptr, 55, 1)) {
@@ -359,14 +351,6 @@ static uint64_t pauth_original_ptr(uint64_t ptr, ARMVAParameters param)
     }
 }
 
-uint64_t pauth_ptr_mask(CPUARMState *env, uint64_t ptr, bool data)
-{
-    ARMMMUIdx mmu_idx = arm_stage1_mmu_idx(env);
-    ARMVAParameters param = aa64_va_parameters(env, ptr, mmu_idx, data);
-
-    return pauth_ptr_mask_internal(param);
-}
-
 static uint64_t pauth_auth(CPUARMState *env, uint64_t ptr, uint64_t modifier,
                            ARMPACKey *key, bool data, int keynumber)
 {
-- 
2.38.1


