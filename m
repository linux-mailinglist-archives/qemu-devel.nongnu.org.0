Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F5452DB6E2
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 00:05:59 +0100 (CET)
Received: from localhost ([::1]:57156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpJOI-0003jp-F4
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 18:05:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kpJH0-00036g-IP
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 17:58:26 -0500
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642]:42586)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kpJGy-0003eP-TR
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 17:58:26 -0500
Received: by mail-ej1-x642.google.com with SMTP id d17so30056599ejy.9
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 14:58:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+wY9Wxdfz8Q05SZXY3w48hyJcCL39vkqVQj5St83H/w=;
 b=GcAigDrbQLzOEAbrwidZpxN3admNCJMSaudn0ivWvxhNktukMBj0fo0yonOBBXDtAn
 ELcE2tBAf+8gJHst79f+6XryZ6ptaysj5mpNvo448Dk+FYx5onMDZWnUyshkaFP0aeI7
 fagA0KEYd53PPDYXjfgDypcgJ4I3Jj3vbZnZ+8VXuMDBkwzEancNWdoVvhOmRUjkLJ3K
 O37mugRMTBJVK0eW/ywUQiAnzd1sZOFLkw3wMFD5KJu+bp3gbSmFnunP/vlvyW7l79+7
 5RUcaNB5rhVTMxV6APoUMSuS3UXhBxG7+RwFe5knb1SAsDiCQx+YmqtvyNi+GZPiHOQn
 6Zfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=+wY9Wxdfz8Q05SZXY3w48hyJcCL39vkqVQj5St83H/w=;
 b=ggcduBjl8yvguJbZmZmE797vmZ9cBzupEw8qpi3yDBsldoXh4UjV7loqjHBfLUnbET
 M2Dw4g67440q9WpjXD3skx2M5djvo8AamZpMnHfUZevrIdTTE//PYxVrwL/DB+j1VS7R
 7ykLNs/s//GobUF4eFXlZEhToOIOKwVgYwtHbB7pgrETCvwBvAjqezNwtJgLm8Tx2Pbq
 xF9K0eZQeHbHAN7mmhYFt3QaznDyALP1hrNn/rAj1R98/BZSDPXsyHCZSbws4KdzkuBr
 /qJ36l/t7c/pN2njtxHvEH7RUPeZrOdYf4rdsopykpFj3cqLGF0/SVydKOejxkFT/eNX
 sm5w==
X-Gm-Message-State: AOAM533DRpPFO1u29wMYmmJHDbgicnDW2sN+Gq7TUXW36tiKlKeGDR97
 SFc76OqBSZ+5dJijSWsI3eE=
X-Google-Smtp-Source: ABdhPJysJBw/ijI2j8W8zKgKL6O2UflTWr8SqHldf1JMKj1Szq6aQAbJ5n/eI2DBnZIywd1nbmwueA==
X-Received: by 2002:a17:906:8051:: with SMTP id
 x17mr8771161ejw.430.1608073103571; 
 Tue, 15 Dec 2020 14:58:23 -0800 (PST)
Received: from x1w.redhat.com (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id dd12sm19502228edb.6.2020.12.15.14.58.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Dec 2020 14:58:22 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Richard Henderson <richard.henderson@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PATCH v2 04/24] target/mips: Introduce ase_msa_available() helper
Date: Tue, 15 Dec 2020 23:57:37 +0100
Message-Id: <20201215225757.764263-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201215225757.764263-1-f4bug@amsat.org>
References: <20201215225757.764263-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::642;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x642.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, kvm@vger.kernel.org,
 Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Instead of accessing CP0_Config3 directly and checking
the 'MSA Present' bit, introduce an explicit helper,
making the code easier to read.

Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/cpu.h       |  6 ++++++
 target/mips/cpu.c       |  2 +-
 target/mips/kvm.c       | 12 ++++++------
 target/mips/translate.c |  6 ++----
 4 files changed, 15 insertions(+), 11 deletions(-)

diff --git a/target/mips/cpu.h b/target/mips/cpu.h
index c6a556efad5..1d72307c547 100644
--- a/target/mips/cpu.h
+++ b/target/mips/cpu.h
@@ -1291,6 +1291,12 @@ bool cpu_supports_isa(const CPUMIPSState *env, uint64_t isa_mask);
 bool cpu_type_supports_isa(const char *cpu_type, uint64_t isa);
 bool isa_rel6_available(const CPUMIPSState *env);
 
+/* Check presence of MSA implementation */
+static inline bool ase_msa_available(CPUMIPSState *env)
+{
+    return env->CP0_Config3 & (1 << CP0C3_MSAP);
+}
+
 /* Check presence of multi-threading ASE implementation */
 static inline bool ase_mt_available(CPUMIPSState *env)
 {
diff --git a/target/mips/cpu.c b/target/mips/cpu.c
index 9f082518076..1b4c13bc972 100644
--- a/target/mips/cpu.c
+++ b/target/mips/cpu.c
@@ -532,7 +532,7 @@ static void mips_cpu_reset(DeviceState *dev)
     }
 
     /* MSA */
-    if (env->CP0_Config3 & (1 << CP0C3_MSAP)) {
+    if (ase_msa_available(env)) {
         msa_reset(env);
     }
 
diff --git a/target/mips/kvm.c b/target/mips/kvm.c
index a5b6fe35dbc..84fb10ea35d 100644
--- a/target/mips/kvm.c
+++ b/target/mips/kvm.c
@@ -79,7 +79,7 @@ int kvm_arch_init_vcpu(CPUState *cs)
         }
     }
 
-    if (kvm_mips_msa_cap && env->CP0_Config3 & (1 << CP0C3_MSAP)) {
+    if (kvm_mips_msa_cap && ase_msa_available(env)) {
         ret = kvm_vcpu_enable_cap(cs, KVM_CAP_MIPS_MSA, 0, 0);
         if (ret < 0) {
             /* mark unsupported so it gets disabled on reset */
@@ -105,7 +105,7 @@ void kvm_mips_reset_vcpu(MIPSCPU *cpu)
         warn_report("KVM does not support FPU, disabling");
         env->CP0_Config1 &= ~(1 << CP0C1_FP);
     }
-    if (!kvm_mips_msa_cap && env->CP0_Config3 & (1 << CP0C3_MSAP)) {
+    if (!kvm_mips_msa_cap && ase_msa_available(env)) {
         warn_report("KVM does not support MSA, disabling");
         env->CP0_Config3 &= ~(1 << CP0C3_MSAP);
     }
@@ -618,7 +618,7 @@ static int kvm_mips_put_fpu_registers(CPUState *cs, int level)
          * FPU register state is a subset of MSA vector state, so don't put FPU
          * registers if we're emulating a CPU with MSA.
          */
-        if (!(env->CP0_Config3 & (1 << CP0C3_MSAP))) {
+        if (!ase_msa_available(env)) {
             /* Floating point registers */
             for (i = 0; i < 32; ++i) {
                 if (env->CP0_Status & (1 << CP0St_FR)) {
@@ -637,7 +637,7 @@ static int kvm_mips_put_fpu_registers(CPUState *cs, int level)
     }
 
     /* Only put MSA state if we're emulating a CPU with MSA */
-    if (env->CP0_Config3 & (1 << CP0C3_MSAP)) {
+    if (ase_msa_available(env)) {
         /* MSA Control Registers */
         if (level == KVM_PUT_FULL_STATE) {
             err = kvm_mips_put_one_reg(cs, KVM_REG_MIPS_MSA_IR,
@@ -698,7 +698,7 @@ static int kvm_mips_get_fpu_registers(CPUState *cs)
          * FPU register state is a subset of MSA vector state, so don't save FPU
          * registers if we're emulating a CPU with MSA.
          */
-        if (!(env->CP0_Config3 & (1 << CP0C3_MSAP))) {
+        if (!ase_msa_available(env)) {
             /* Floating point registers */
             for (i = 0; i < 32; ++i) {
                 if (env->CP0_Status & (1 << CP0St_FR)) {
@@ -717,7 +717,7 @@ static int kvm_mips_get_fpu_registers(CPUState *cs)
     }
 
     /* Only get MSA state if we're emulating a CPU with MSA */
-    if (env->CP0_Config3 & (1 << CP0C3_MSAP)) {
+    if (ase_msa_available(env)) {
         /* MSA Control Registers */
         err = kvm_mips_get_one_reg(cs, KVM_REG_MIPS_MSA_IR,
                                    &env->msair);
diff --git a/target/mips/translate.c b/target/mips/translate.c
index af543d1f375..fc658b3be33 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -24920,8 +24920,7 @@ static void decode_opc_special(CPUMIPSState *env, DisasContext *ctx)
         gen_trap(ctx, op1, rs, rt, -1);
         break;
     case OPC_LSA: /* OPC_PMON */
-        if ((ctx->insn_flags & ISA_MIPS32R6) ||
-            (env->CP0_Config3 & (1 << CP0C3_MSAP))) {
+        if ((ctx->insn_flags & ISA_MIPS32R6) || ase_msa_available(env)) {
             decode_opc_special_r6(env, ctx);
         } else {
             /* Pmon entry point, also R4010 selsl */
@@ -25023,8 +25022,7 @@ static void decode_opc_special(CPUMIPSState *env, DisasContext *ctx)
         }
         break;
     case OPC_DLSA:
-        if ((ctx->insn_flags & ISA_MIPS32R6) ||
-            (env->CP0_Config3 & (1 << CP0C3_MSAP))) {
+        if ((ctx->insn_flags & ISA_MIPS32R6) || ase_msa_available(env)) {
             decode_opc_special_r6(env, ctx);
         }
         break;
-- 
2.26.2


