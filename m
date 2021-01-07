Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D1CB2EE95E
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 23:58:19 +0100 (CET)
Received: from localhost ([::1]:51112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxeEU-0007MD-JZ
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 17:58:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxdjO-00025G-Fd
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 17:26:10 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:53472)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxdjM-0005vS-Ue
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 17:26:10 -0500
Received: by mail-wm1-x334.google.com with SMTP id k10so6362607wmi.3
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 14:26:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=n6RRuYZ8EGGXTpGZvsOKW/oYziHM0vCJPjdxKK9QfP8=;
 b=b2liXW65beeD2lT7WvmvqnfKSev9lKyIOR/qt+3YfkcSBiqUXqCLub5tz2bF017rsZ
 KULF9vT4qroLXU7TSCScrYsnk11Jmz5bgKu6TL2rexVDoy5CRDrFPBiN0VXGes0eDzl4
 FSLlY1Zb79pg3RHBItCHpYH82i0/l14lIvo91iXlO5xJhWaJ6jUN4z7qBhiAnv2NMYvF
 3lo4E5vEwjugOPSLAVfwu88DkBRd1500Z/FZzKvHYODBzanfummJfxw3Td8hca/ciYxt
 P7Dwc+4SG3KxDNfnrlUlgv2HXu99MyObqsSwtGkZWsV21pMVDkD1zVPIJ9f0yX54znK8
 Q1lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=n6RRuYZ8EGGXTpGZvsOKW/oYziHM0vCJPjdxKK9QfP8=;
 b=ZR/MKpWBSrDeKqCH4hy7gOEY3/0KnTdHqfrCEKK06D98oZp5DbaYvQAcmedguKr74r
 ZNz+DG9VO4q1WRilaZpBMredS0aaFBq5RvghVNogtxKqokq8eQp1JGhdWUeOJuCfj9ki
 TCA92ihmcr9sMIAtyV6wA8OawEM9fyRpKSb7DbCgO1DLJcweDg4pdPERYRR9uCMZSnpG
 DMtA9Dbrs3VOuBdpLMdM/bMAUcivgIPUbqDX84teuX/lsYSivcnOty9SVfO6UDy/9qya
 gnfdtn7c/GDzrzpJbXp/fkKSfYH7X9/Rcmrqrfq4fDZZXqA3/fPpgag+NdrX5cVu3hSh
 jzBA==
X-Gm-Message-State: AOAM532jZvL1m7v88Pp0HclDCuAqRB0dRd7nEZpos3gZ3jTUzv6oba3o
 FMCa63o91Up/cHDsqaqZsE/d9L6J26Q=
X-Google-Smtp-Source: ABdhPJy+Bhg02UrR6EUU7nIp/RZlfsHKVNh0/aLRhJdggPjtZEe9ZOqSEYDljYp/dpQUQlWvLHykMA==
X-Received: by 2002:a7b:cb93:: with SMTP id m19mr522874wmi.45.1610058367428;
 Thu, 07 Jan 2021 14:26:07 -0800 (PST)
Received: from x1w.redhat.com (241.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.241])
 by smtp.gmail.com with ESMTPSA id h29sm11023080wrc.68.2021.01.07.14.26.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 14:26:06 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 37/66] target/mips: Introduce ase_msa_available() helper
Date: Thu,  7 Jan 2021 23:22:24 +0100
Message-Id: <20210107222253.20382-38-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210107222253.20382-1-f4bug@amsat.org>
References: <20210107222253.20382-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x334.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Paul Burton <paulburton@kernel.org>, kvm@vger.kernel.org,
 libvir-list@redhat.com, Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
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
Tested-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-Id: <20201208003702.4088927-2-f4bug@amsat.org>
---
 target/mips/cpu.h       |  6 ++++++
 target/mips/cpu.c       |  2 +-
 target/mips/kvm.c       | 12 ++++++------
 target/mips/translate.c |  6 ++----
 4 files changed, 15 insertions(+), 11 deletions(-)

diff --git a/target/mips/cpu.h b/target/mips/cpu.h
index 9c45744c5c1..b9e227a30e9 100644
--- a/target/mips/cpu.h
+++ b/target/mips/cpu.h
@@ -1299,6 +1299,12 @@ bool cpu_type_supports_cps_smp(const char *cpu_type);
 bool cpu_supports_isa(const CPUMIPSState *env, uint64_t isa_mask);
 bool cpu_type_supports_isa(const char *cpu_type, uint64_t isa);
 
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
index 55c6a054bba..45375ebc45c 100644
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
index 69fa8a50790..c01db5f9d39 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -24920,8 +24920,7 @@ static void decode_opc_special(CPUMIPSState *env, DisasContext *ctx)
         gen_trap(ctx, op1, rs, rt, -1);
         break;
     case OPC_LSA: /* OPC_PMON */
-        if ((ctx->insn_flags & ISA_MIPS_R6) ||
-            (env->CP0_Config3 & (1 << CP0C3_MSAP))) {
+        if ((ctx->insn_flags & ISA_MIPS_R6) || ase_msa_available(env)) {
             decode_opc_special_r6(env, ctx);
         } else {
             /* Pmon entry point, also R4010 selsl */
@@ -25023,8 +25022,7 @@ static void decode_opc_special(CPUMIPSState *env, DisasContext *ctx)
         }
         break;
     case OPC_DLSA:
-        if ((ctx->insn_flags & ISA_MIPS_R6) ||
-            (env->CP0_Config3 & (1 << CP0C3_MSAP))) {
+        if ((ctx->insn_flags & ISA_MIPS_R6) || ase_msa_available(env)) {
             decode_opc_special_r6(env, ctx);
         }
         break;
-- 
2.26.2


