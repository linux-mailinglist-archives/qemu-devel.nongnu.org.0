Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54CEE2CC5BB
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 19:46:25 +0100 (CET)
Received: from localhost ([::1]:42450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkX8y-0006KH-CG
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 13:46:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kkX75-0004xl-H8
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 13:44:28 -0500
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642]:41445)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kkX73-0002aI-2U
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 13:44:27 -0500
Received: by mail-ej1-x642.google.com with SMTP id f23so5929873ejt.8
 for <qemu-devel@nongnu.org>; Wed, 02 Dec 2020 10:44:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xk/Zq1xXAUYu4vZ1FKZqQpHvoK7NrbyHrURbYsCyDoM=;
 b=FmswlJTao8Y2QdCEg1sJYydqulsPhnWQDxYz/to1zmq5YjEqi71b5YaHRpWojdP/pj
 E65O/5tgKwiq76nJ47IZVH7aFOu1LQlbyv20N3Xn9KFhvlz3DCFX2EytF0zx8i2aakFX
 QMDM15WQTKlX6W8yRsE7Ns42BAZeVDFkLSOHoHrCxYyTIB8UbKwuYFUQiXiSJhU09WRp
 Yfpf4RzTkHfMOtBsJRmWulnVRrm+NK/LG+R6Pu0V2j1DrSIaporPi+O+4OZOJeMDgxfp
 OfIuRiQfVo1nmg00KCLbWr9UMunQGGWMwZqmzKQZtHPjmK4QrJipVOpqwFpjbANs9/PJ
 5djA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=xk/Zq1xXAUYu4vZ1FKZqQpHvoK7NrbyHrURbYsCyDoM=;
 b=RqUGEnhT8jVPBkEa6hvZMx/XsWxc9EZIfEZtp1nD+vczTzZNjy8uez6nmmsELKDEmr
 zuLmaGn75zs9fy5ED6EdhmyZReQTAbbN5BBgA3hTrHsFK6aKBAmy9RQ556A48lBBuPqq
 rA4zv8S0PEEM3nKXGqTVv/LSaFFQ0Hqg1Tl8BNYyYR+4zZwTn0r6Nt6vfPEs2rHPSabX
 6vhrjJLkgHJhakVtSclyV7fqCtmEsz7siAti0WAk7VAe0mFCsyHc4ccayhe8K2sI69bJ
 g0dmtuEGihDHYDH/DR3Wj5pbs66dxQYHl1Oqz+03m0RRxwzBSHfiuxwZljm9eqW2MZl1
 G1Ug==
X-Gm-Message-State: AOAM533wiiijlXdwn7+xYCmEWCj9KhLgwNT8hxz5pVTRMv6VQ7kEZvdz
 6TNsyCtomNUplhcDrVz2InQFiQYuD6s=
X-Google-Smtp-Source: ABdhPJybp/7ChjWK/qvpZtRmgllgrpJg/wIciJFaxPkewzGyNulPMFf/2FW4ujzwwpuSx1b/+v1FNw==
X-Received: by 2002:a17:906:d10f:: with SMTP id
 b15mr1095121ejz.268.1606934663190; 
 Wed, 02 Dec 2020 10:44:23 -0800 (PST)
Received: from x1w.redhat.com (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id t19sm440464eje.86.2020.12.02.10.44.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Dec 2020 10:44:22 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/9] target/mips: Introduce ase_msa_available() helper
Date: Wed,  2 Dec 2020 19:44:07 +0100
Message-Id: <20201202184415.1434484-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201202184415.1434484-1-f4bug@amsat.org>
References: <20201202184415.1434484-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::642;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x642.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Huacai Chen <chenhc@lemote.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Instead of accessing CP0_Config3 directly and checking
the 'MSA Present' bit, introduce an explicit helper,
making the code easier to read.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/internal.h  |  6 ++++++
 target/mips/kvm.c       | 12 ++++++------
 target/mips/translate.c |  8 +++-----
 3 files changed, 15 insertions(+), 11 deletions(-)

diff --git a/target/mips/internal.h b/target/mips/internal.h
index dd8a7809b64..f882ac1580c 100644
--- a/target/mips/internal.h
+++ b/target/mips/internal.h
@@ -80,6 +80,12 @@ enum CPUMIPSMSADataFormat {
     DF_DOUBLE
 };
 
+/* Check presence of MSA implementation */
+static inline bool ase_msa_available(CPUMIPSState *env)
+{
+    return env->CP0_Config3 & (1 << CP0C3_MSAP);
+}
+
 void mips_cpu_do_interrupt(CPUState *cpu);
 bool mips_cpu_exec_interrupt(CPUState *cpu, int int_req);
 void mips_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
diff --git a/target/mips/kvm.c b/target/mips/kvm.c
index 72637a1e021..9bfd67ede39 100644
--- a/target/mips/kvm.c
+++ b/target/mips/kvm.c
@@ -81,7 +81,7 @@ int kvm_arch_init_vcpu(CPUState *cs)
         }
     }
 
-    if (kvm_mips_msa_cap && env->CP0_Config3 & (1 << CP0C3_MSAP)) {
+    if (kvm_mips_msa_cap && ase_msa_available(env)) {
         ret = kvm_vcpu_enable_cap(cs, KVM_CAP_MIPS_MSA, 0, 0);
         if (ret < 0) {
             /* mark unsupported so it gets disabled on reset */
@@ -107,7 +107,7 @@ void kvm_mips_reset_vcpu(MIPSCPU *cpu)
         warn_report("KVM does not support FPU, disabling");
         env->CP0_Config1 &= ~(1 << CP0C1_FP);
     }
-    if (!kvm_mips_msa_cap && env->CP0_Config3 & (1 << CP0C3_MSAP)) {
+    if (!kvm_mips_msa_cap && ase_msa_available(env)) {
         warn_report("KVM does not support MSA, disabling");
         env->CP0_Config3 &= ~(1 << CP0C3_MSAP);
     }
@@ -624,7 +624,7 @@ static int kvm_mips_put_fpu_registers(CPUState *cs, int level)
          * FPU register state is a subset of MSA vector state, so don't put FPU
          * registers if we're emulating a CPU with MSA.
          */
-        if (!(env->CP0_Config3 & (1 << CP0C3_MSAP))) {
+        if (!ase_msa_available(env)) {
             /* Floating point registers */
             for (i = 0; i < 32; ++i) {
                 if (env->CP0_Status & (1 << CP0St_FR)) {
@@ -643,7 +643,7 @@ static int kvm_mips_put_fpu_registers(CPUState *cs, int level)
     }
 
     /* Only put MSA state if we're emulating a CPU with MSA */
-    if (env->CP0_Config3 & (1 << CP0C3_MSAP)) {
+    if (ase_msa_available(env)) {
         /* MSA Control Registers */
         if (level == KVM_PUT_FULL_STATE) {
             err = kvm_mips_put_one_reg(cs, KVM_REG_MIPS_MSA_IR,
@@ -704,7 +704,7 @@ static int kvm_mips_get_fpu_registers(CPUState *cs)
          * FPU register state is a subset of MSA vector state, so don't save FPU
          * registers if we're emulating a CPU with MSA.
          */
-        if (!(env->CP0_Config3 & (1 << CP0C3_MSAP))) {
+        if (!ase_msa_available(env)) {
             /* Floating point registers */
             for (i = 0; i < 32; ++i) {
                 if (env->CP0_Status & (1 << CP0St_FR)) {
@@ -723,7 +723,7 @@ static int kvm_mips_get_fpu_registers(CPUState *cs)
     }
 
     /* Only get MSA state if we're emulating a CPU with MSA */
-    if (env->CP0_Config3 & (1 << CP0C3_MSAP)) {
+    if (ase_msa_available(env)) {
         /* MSA Control Registers */
         err = kvm_mips_get_one_reg(cs, KVM_REG_MIPS_MSA_IR,
                                    &env->msair);
diff --git a/target/mips/translate.c b/target/mips/translate.c
index c64a1bc42e1..a7c01c2ea5b 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -25049,8 +25049,7 @@ static void decode_opc_special(CPUMIPSState *env, DisasContext *ctx)
         gen_trap(ctx, op1, rs, rt, -1);
         break;
     case OPC_LSA: /* OPC_PMON */
-        if ((ctx->insn_flags & ISA_MIPS32R6) ||
-            (env->CP0_Config3 & (1 << CP0C3_MSAP))) {
+        if ((ctx->insn_flags & ISA_MIPS32R6) || ase_msa_available(env)) {
             decode_opc_special_r6(env, ctx);
         } else {
             /* Pmon entry point, also R4010 selsl */
@@ -25152,8 +25151,7 @@ static void decode_opc_special(CPUMIPSState *env, DisasContext *ctx)
         }
         break;
     case OPC_DLSA:
-        if ((ctx->insn_flags & ISA_MIPS32R6) ||
-            (env->CP0_Config3 & (1 << CP0C3_MSAP))) {
+        if ((ctx->insn_flags & ISA_MIPS32R6) || ase_msa_available(env)) {
             decode_opc_special_r6(env, ctx);
         }
         break;
@@ -32000,7 +31998,7 @@ void cpu_state_reset(CPUMIPSState *env)
     }
 
     /* MSA */
-    if (env->CP0_Config3 & (1 << CP0C3_MSAP)) {
+    if (ase_msa_available(env)) {
         msa_reset(env);
     }
 
-- 
2.26.2


