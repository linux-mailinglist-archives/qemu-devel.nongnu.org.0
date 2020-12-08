Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76C6E2D1F25
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 01:42:07 +0100 (CET)
Received: from localhost ([::1]:54234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmR4w-00059W-Fr
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 19:42:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kmR0E-0003VB-4z
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 19:37:14 -0500
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642]:34479)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kmR0C-000190-2q
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 19:37:13 -0500
Received: by mail-ej1-x642.google.com with SMTP id g20so22220651ejb.1
 for <qemu-devel@nongnu.org>; Mon, 07 Dec 2020 16:37:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3nQ2rq5dw00RN3ISHz847HNPzVTdJvTY+D4+K8lpZUM=;
 b=O6uCHU2nt9XOgHKby483Y1sNEgW9zJgaE8hSa8WQWYgH66G6t7hlJbK2MH5lk+LFwN
 o1Qlnt2501GAvmbCTl7B9MwtCzBVK2TpKTFypwDbmjxFe/y30J0jJ28WlsC8JaQSZIxH
 ocj81ieDaVgREldsWZrOdhUoAA+9W2hnZIHaaMSPktKI0OA9S+CI3vSEmfkGucYVgYJZ
 eA2PV7Cn4wmwQKMIcKsdsIlIf1s0wkcGBZFrBKkbNITyizVDfx5rGyGy/4HMycsqtXsi
 lobwTUTDvEGqNjiePtcpkVKjn2hHm7v18PMFCV3r6PwO9oEDKyKPshn/QIGF5RyjO2Dt
 izow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=3nQ2rq5dw00RN3ISHz847HNPzVTdJvTY+D4+K8lpZUM=;
 b=icz/B4jrBksnTsSt4KNWPHuuxWeroenEy5ie9SKGpWvTdiFasLFVQREkEGUbcnTCOw
 A1AbiObZLLV5vrSYTcsOCDK9BfiJ4ui8M8Thvrr5KgFhNvPdf8rKIc8nN8RefF/phsZo
 MH4NbbSVKPq/9jbVeGHKad+Q8XniXRBXJfooYyPKuW+k0+QGI9n0gGWMtL3URLlYKa4w
 WRu2vFdxxORDMCfcVoIIf6zEpMuztz6Zq+y1llNbnDzi5Jjp8afkFZzQGuaVOqt2Pm6d
 7iLLPUDW+igKBtI8vEwOb72ygU5wp6cJ8f5Y38IGBG+pSvckgu+cACDZd6oKD3IM8O+O
 unsQ==
X-Gm-Message-State: AOAM531Mo+XNJuqwr0KP/RQ6w/F7pjPD3VK4a6JvtfUUHTznUku4AoJ8
 +JEvdtpXaFtjivP5H04KH0P1kWqd0Co=
X-Google-Smtp-Source: ABdhPJxMESd4QPMEdVDiXLWmRmAHveLm75pKdNMT0gidZNPbzqokGnxte7sQEw5ftElnbdGNm96S1Q==
X-Received: by 2002:a17:906:a106:: with SMTP id
 t6mr21575903ejy.63.1607387830419; 
 Mon, 07 Dec 2020 16:37:10 -0800 (PST)
Received: from x1w.redhat.com (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id x15sm15114272edj.91.2020.12.07.16.37.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Dec 2020 16:37:09 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 01/17] target/mips: Introduce ase_msa_available() helper
Date: Tue,  8 Dec 2020 01:36:46 +0100
Message-Id: <20201208003702.4088927-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201208003702.4088927-1-f4bug@amsat.org>
References: <20201208003702.4088927-1-f4bug@amsat.org>
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
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
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
 target/mips/kvm.c       | 12 ++++++------
 target/mips/translate.c |  8 +++-----
 3 files changed, 15 insertions(+), 11 deletions(-)

diff --git a/target/mips/cpu.h b/target/mips/cpu.h
index 7b3ff2fd6fb..6d4c8d63930 100644
--- a/target/mips/cpu.h
+++ b/target/mips/cpu.h
@@ -1296,6 +1296,12 @@ int cpu_mips_signal_handler(int host_signum, void *pinfo, void *puc);
 bool cpu_supports_cps_smp(const char *cpu_type);
 bool cpu_supports_isa(const char *cpu_type, uint64_t isa);
 
+/* Check presence of MSA implementation */
+static inline bool ase_msa_available(CPUMIPSState *env)
+{
+    return env->CP0_Config3 & (1 << CP0C3_MSAP);
+}
+
 /* Check presence of multi-threading ASE implementation */
 static inline bool ase_mt_available(CPUMIPSState *env)
 {
diff --git a/target/mips/kvm.c b/target/mips/kvm.c
index 3ca3a0da93f..c511a1303c6 100644
--- a/target/mips/kvm.c
+++ b/target/mips/kvm.c
@@ -82,7 +82,7 @@ int kvm_arch_init_vcpu(CPUState *cs)
         }
     }
 
-    if (kvm_mips_msa_cap && env->CP0_Config3 & (1 << CP0C3_MSAP)) {
+    if (kvm_mips_msa_cap && ase_msa_available(env)) {
         ret = kvm_vcpu_enable_cap(cs, KVM_CAP_MIPS_MSA, 0, 0);
         if (ret < 0) {
             /* mark unsupported so it gets disabled on reset */
@@ -108,7 +108,7 @@ void kvm_mips_reset_vcpu(MIPSCPU *cpu)
         warn_report("KVM does not support FPU, disabling");
         env->CP0_Config1 &= ~(1 << CP0C1_FP);
     }
-    if (!kvm_mips_msa_cap && env->CP0_Config3 & (1 << CP0C3_MSAP)) {
+    if (!kvm_mips_msa_cap && ase_msa_available(env)) {
         warn_report("KVM does not support MSA, disabling");
         env->CP0_Config3 &= ~(1 << CP0C3_MSAP);
     }
@@ -621,7 +621,7 @@ static int kvm_mips_put_fpu_registers(CPUState *cs, int level)
          * FPU register state is a subset of MSA vector state, so don't put FPU
          * registers if we're emulating a CPU with MSA.
          */
-        if (!(env->CP0_Config3 & (1 << CP0C3_MSAP))) {
+        if (!ase_msa_available(env)) {
             /* Floating point registers */
             for (i = 0; i < 32; ++i) {
                 if (env->CP0_Status & (1 << CP0St_FR)) {
@@ -640,7 +640,7 @@ static int kvm_mips_put_fpu_registers(CPUState *cs, int level)
     }
 
     /* Only put MSA state if we're emulating a CPU with MSA */
-    if (env->CP0_Config3 & (1 << CP0C3_MSAP)) {
+    if (ase_msa_available(env)) {
         /* MSA Control Registers */
         if (level == KVM_PUT_FULL_STATE) {
             err = kvm_mips_put_one_reg(cs, KVM_REG_MIPS_MSA_IR,
@@ -701,7 +701,7 @@ static int kvm_mips_get_fpu_registers(CPUState *cs)
          * FPU register state is a subset of MSA vector state, so don't save FPU
          * registers if we're emulating a CPU with MSA.
          */
-        if (!(env->CP0_Config3 & (1 << CP0C3_MSAP))) {
+        if (!ase_msa_available(env)) {
             /* Floating point registers */
             for (i = 0; i < 32; ++i) {
                 if (env->CP0_Status & (1 << CP0St_FR)) {
@@ -720,7 +720,7 @@ static int kvm_mips_get_fpu_registers(CPUState *cs)
     }
 
     /* Only get MSA state if we're emulating a CPU with MSA */
-    if (env->CP0_Config3 & (1 << CP0C3_MSAP)) {
+    if (ase_msa_available(env)) {
         /* MSA Control Registers */
         err = kvm_mips_get_one_reg(cs, KVM_REG_MIPS_MSA_IR,
                                    &env->msair);
diff --git a/target/mips/translate.c b/target/mips/translate.c
index 80c9c17819f..cb822e52c4b 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -24928,8 +24928,7 @@ static void decode_opc_special(CPUMIPSState *env, DisasContext *ctx)
         gen_trap(ctx, op1, rs, rt, -1);
         break;
     case OPC_LSA: /* OPC_PMON */
-        if ((ctx->insn_flags & ISA_MIPS32R6) ||
-            (env->CP0_Config3 & (1 << CP0C3_MSAP))) {
+        if ((ctx->insn_flags & ISA_MIPS32R6) || ase_msa_available(env)) {
             decode_opc_special_r6(env, ctx);
         } else {
             /* Pmon entry point, also R4010 selsl */
@@ -25031,8 +25030,7 @@ static void decode_opc_special(CPUMIPSState *env, DisasContext *ctx)
         }
         break;
     case OPC_DLSA:
-        if ((ctx->insn_flags & ISA_MIPS32R6) ||
-            (env->CP0_Config3 & (1 << CP0C3_MSAP))) {
+        if ((ctx->insn_flags & ISA_MIPS32R6) || ase_msa_available(env)) {
             decode_opc_special_r6(env, ctx);
         }
         break;
@@ -31879,7 +31877,7 @@ void cpu_state_reset(CPUMIPSState *env)
     }
 
     /* MSA */
-    if (env->CP0_Config3 & (1 << CP0C3_MSAP)) {
+    if (ase_msa_available(env)) {
         msa_reset(env);
     }
 
-- 
2.26.2


