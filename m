Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C31856EF9B8
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 20:00:53 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prjRe-0007IA-3g; Wed, 26 Apr 2023 14:00:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1prjRb-0007Br-0Z; Wed, 26 Apr 2023 14:00:43 -0400
Received: from smtp-out1.suse.de ([2001:67c:2178:6::1c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1prjRW-0006cl-Ak; Wed, 26 Apr 2023 14:00:42 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id CD82E21A19;
 Wed, 26 Apr 2023 18:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1682532035; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0CpkmTYGFnIekIS517EGCFqcHvNe7Onv1+tXQV971z8=;
 b=JPexdg2AE07zGvfd5XNIF2c0APRB71+JVuqjmsJXozY9lsGt/YvsZvxvYCaqAIZRt41pJj
 gaUG6VaLTxXXgKnCXNqXM0KGczg8He62O+G7hhXoFEwTVa4hBA8Nntv77ojWyfuYah6s87
 kDrIYixnViSsETOnuW/pzMoz3imUGHs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1682532035;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0CpkmTYGFnIekIS517EGCFqcHvNe7Onv1+tXQV971z8=;
 b=/jCyBtgSaNQkSvgUVrkGfI+6r5rNGI3FxGWP/OGS7GI2aabT61Kg+ziMH8ZWloRnjpz+5k
 bHbJM7frEYjJFuCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AC6C6138F0;
 Wed, 26 Apr 2023 18:00:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id SFYSHcBmSWSoVQAAMHmgww
 (envelope-from <farosas@suse.de>); Wed, 26 Apr 2023 18:00:32 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>
Subject: [PATCH v11 05/13] target/arm: Move 64-bit TCG CPUs into tcg/
Date: Wed, 26 Apr 2023 15:00:05 -0300
Message-Id: <20230426180013.14814-6-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230426180013.14814-1-farosas@suse.de>
References: <20230426180013.14814-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:67c:2178:6::1c; envelope-from=farosas@suse.de;
 helo=smtp-out1.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Move the 64-bit CPUs that are TCG-only:
- cortex-a35
- cortex-a55
- cortex-a72
- cortex-a76
- a64fx
- neoverse-n1

Keep the CPUs that can be used with KVM:
- cortex-a57
- cortex-a53
- max
- host

Signed-off-by: Fabiano Rosas <farosas@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/arm/virt.c              |   6 +-
 target/arm/cpu64.c         | 687 +----------------------------------
 target/arm/internals.h     |   4 +
 target/arm/tcg/cpu64.c     | 723 +++++++++++++++++++++++++++++++++++++
 target/arm/tcg/meson.build |   1 +
 5 files changed, 735 insertions(+), 686 deletions(-)
 create mode 100644 target/arm/tcg/cpu64.c

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index a89d699f0b..1450a9f363 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -208,14 +208,16 @@ static const char *valid_cpus[] = {
     ARM_CPU_TYPE_NAME("cortex-a7"),
 #endif
     ARM_CPU_TYPE_NAME("cortex-a15"),
+#ifdef CONFIG_TCG
     ARM_CPU_TYPE_NAME("cortex-a35"),
-    ARM_CPU_TYPE_NAME("cortex-a53"),
     ARM_CPU_TYPE_NAME("cortex-a55"),
-    ARM_CPU_TYPE_NAME("cortex-a57"),
     ARM_CPU_TYPE_NAME("cortex-a72"),
     ARM_CPU_TYPE_NAME("cortex-a76"),
     ARM_CPU_TYPE_NAME("a64fx"),
     ARM_CPU_TYPE_NAME("neoverse-n1"),
+#endif
+    ARM_CPU_TYPE_NAME("cortex-a53"),
+    ARM_CPU_TYPE_NAME("cortex-a57"),
     ARM_CPU_TYPE_NAME("host"),
     ARM_CPU_TYPE_NAME("max"),
 };
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 6a6a2ece2b..6eaf8e32cf 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -34,86 +34,6 @@
 #include "internals.h"
 #include "cpregs.h"
 
-static void aarch64_a35_initfn(Object *obj)
-{
-    ARMCPU *cpu = ARM_CPU(obj);
-
-    cpu->dtb_compatible = "arm,cortex-a35";
-    set_feature(&cpu->env, ARM_FEATURE_V8);
-    set_feature(&cpu->env, ARM_FEATURE_NEON);
-    set_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER);
-    set_feature(&cpu->env, ARM_FEATURE_AARCH64);
-    set_feature(&cpu->env, ARM_FEATURE_CBAR_RO);
-    set_feature(&cpu->env, ARM_FEATURE_EL2);
-    set_feature(&cpu->env, ARM_FEATURE_EL3);
-    set_feature(&cpu->env, ARM_FEATURE_PMU);
-
-    /* From B2.2 AArch64 identification registers. */
-    cpu->midr = 0x411fd040;
-    cpu->revidr = 0;
-    cpu->ctr = 0x84448004;
-    cpu->isar.id_pfr0 = 0x00000131;
-    cpu->isar.id_pfr1 = 0x00011011;
-    cpu->isar.id_dfr0 = 0x03010066;
-    cpu->id_afr0 = 0;
-    cpu->isar.id_mmfr0 = 0x10201105;
-    cpu->isar.id_mmfr1 = 0x40000000;
-    cpu->isar.id_mmfr2 = 0x01260000;
-    cpu->isar.id_mmfr3 = 0x02102211;
-    cpu->isar.id_isar0 = 0x02101110;
-    cpu->isar.id_isar1 = 0x13112111;
-    cpu->isar.id_isar2 = 0x21232042;
-    cpu->isar.id_isar3 = 0x01112131;
-    cpu->isar.id_isar4 = 0x00011142;
-    cpu->isar.id_isar5 = 0x00011121;
-    cpu->isar.id_aa64pfr0 = 0x00002222;
-    cpu->isar.id_aa64pfr1 = 0;
-    cpu->isar.id_aa64dfr0 = 0x10305106;
-    cpu->isar.id_aa64dfr1 = 0;
-    cpu->isar.id_aa64isar0 = 0x00011120;
-    cpu->isar.id_aa64isar1 = 0;
-    cpu->isar.id_aa64mmfr0 = 0x00101122;
-    cpu->isar.id_aa64mmfr1 = 0;
-    cpu->clidr = 0x0a200023;
-    cpu->dcz_blocksize = 4;
-
-    /* From B2.4 AArch64 Virtual Memory control registers */
-    cpu->reset_sctlr = 0x00c50838;
-
-    /* From B2.10 AArch64 performance monitor registers */
-    cpu->isar.reset_pmcr_el0 = 0x410a3000;
-
-    /* From B2.29 Cache ID registers */
-    cpu->ccsidr[0] = 0x700fe01a; /* 32KB L1 dcache */
-    cpu->ccsidr[1] = 0x201fe00a; /* 32KB L1 icache */
-    cpu->ccsidr[2] = 0x703fe03a; /* 512KB L2 cache */
-
-    /* From B3.5 VGIC Type register */
-    cpu->gic_num_lrs = 4;
-    cpu->gic_vpribits = 5;
-    cpu->gic_vprebits = 5;
-    cpu->gic_pribits = 5;
-
-    /* From C6.4 Debug ID Register */
-    cpu->isar.dbgdidr = 0x3516d000;
-    /* From C6.5 Debug Device ID Register */
-    cpu->isar.dbgdevid = 0x00110f13;
-    /* From C6.6 Debug Device ID Register 1 */
-    cpu->isar.dbgdevid1 = 0x2;
-
-    /* From Cortex-A35 SIMD and Floating-point Support r1p0 */
-    /* From 3.2 AArch32 register summary */
-    cpu->reset_fpsid = 0x41034043;
-
-    /* From 2.2 AArch64 register summary */
-    cpu->isar.mvfr0 = 0x10110222;
-    cpu->isar.mvfr1 = 0x12111111;
-    cpu->isar.mvfr2 = 0x00000043;
-
-    /* These values are the same with A53/A57/A72. */
-    define_cortex_a72_a57_a53_cp_reginfo(cpu);
-}
-
 void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp)
 {
     /*
@@ -313,41 +233,6 @@ void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp)
     cpu->sve_vq.map = vq_map;
 }
 
-static void cpu_max_get_sve_max_vq(Object *obj, Visitor *v, const char *name,
-                                   void *opaque, Error **errp)
-{
-    ARMCPU *cpu = ARM_CPU(obj);
-    uint32_t value;
-
-    /* All vector lengths are disabled when SVE is off. */
-    if (!cpu_isar_feature(aa64_sve, cpu)) {
-        value = 0;
-    } else {
-        value = cpu->sve_max_vq;
-    }
-    visit_type_uint32(v, name, &value, errp);
-}
-
-static void cpu_max_set_sve_max_vq(Object *obj, Visitor *v, const char *name,
-                                   void *opaque, Error **errp)
-{
-    ARMCPU *cpu = ARM_CPU(obj);
-    uint32_t max_vq;
-
-    if (!visit_type_uint32(v, name, &max_vq, errp)) {
-        return;
-    }
-
-    if (max_vq == 0 || max_vq > ARM_MAX_VQ) {
-        error_setg(errp, "unsupported SVE vector length");
-        error_append_hint(errp, "Valid sve-max-vq in range [1-%d]\n",
-                          ARM_MAX_VQ);
-        return;
-    }
-
-    cpu->sve_max_vq = max_vq;
-}
-
 /*
  * Note that cpu_arm_{get,set}_vq cannot use the simpler
  * object_property_add_bool interface because they make use of the
@@ -538,7 +423,7 @@ static void cpu_arm_get_default_vec_len(Object *obj, Visitor *v,
 }
 #endif
 
-static void aarch64_add_sve_properties(Object *obj)
+void aarch64_add_sve_properties(Object *obj)
 {
     ARMCPU *cpu = ARM_CPU(obj);
     uint32_t vq;
@@ -561,7 +446,7 @@ static void aarch64_add_sve_properties(Object *obj)
 #endif
 }
 
-static void aarch64_add_sme_properties(Object *obj)
+void aarch64_add_sme_properties(Object *obj)
 {
     ARMCPU *cpu = ARM_CPU(obj);
     uint32_t vq;
@@ -626,7 +511,7 @@ static Property arm_cpu_pauth_property =
 static Property arm_cpu_pauth_impdef_property =
     DEFINE_PROP_BOOL("pauth-impdef", ARMCPU, prop_pauth_impdef, false);
 
-static void aarch64_add_pauth_properties(Object *obj)
+void aarch64_add_pauth_properties(Object *obj)
 {
     ARMCPU *cpu = ARM_CPU(obj);
 
@@ -647,9 +532,6 @@ static void aarch64_add_pauth_properties(Object *obj)
     }
 }
 
-static Property arm_cpu_lpa2_property =
-    DEFINE_PROP_BOOL("lpa2", ARMCPU, prop_lpa2, true);
-
 void arm_cpu_lpa2_finalize(ARMCPU *cpu, Error **errp)
 {
     uint64_t t;
@@ -784,384 +666,6 @@ static void aarch64_a53_initfn(Object *obj)
     define_cortex_a72_a57_a53_cp_reginfo(cpu);
 }
 
-static void aarch64_a55_initfn(Object *obj)
-{
-    ARMCPU *cpu = ARM_CPU(obj);
-
-    cpu->dtb_compatible = "arm,cortex-a55";
-    set_feature(&cpu->env, ARM_FEATURE_V8);
-    set_feature(&cpu->env, ARM_FEATURE_NEON);
-    set_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER);
-    set_feature(&cpu->env, ARM_FEATURE_AARCH64);
-    set_feature(&cpu->env, ARM_FEATURE_CBAR_RO);
-    set_feature(&cpu->env, ARM_FEATURE_EL2);
-    set_feature(&cpu->env, ARM_FEATURE_EL3);
-    set_feature(&cpu->env, ARM_FEATURE_PMU);
-
-    /* Ordered by B2.4 AArch64 registers by functional group */
-    cpu->clidr = 0x82000023;
-    cpu->ctr = 0x84448004; /* L1Ip = VIPT */
-    cpu->dcz_blocksize = 4; /* 64 bytes */
-    cpu->isar.id_aa64dfr0  = 0x0000000010305408ull;
-    cpu->isar.id_aa64isar0 = 0x0000100010211120ull;
-    cpu->isar.id_aa64isar1 = 0x0000000000100001ull;
-    cpu->isar.id_aa64mmfr0 = 0x0000000000101122ull;
-    cpu->isar.id_aa64mmfr1 = 0x0000000010212122ull;
-    cpu->isar.id_aa64mmfr2 = 0x0000000000001011ull;
-    cpu->isar.id_aa64pfr0  = 0x0000000010112222ull;
-    cpu->isar.id_aa64pfr1  = 0x0000000000000010ull;
-    cpu->id_afr0       = 0x00000000;
-    cpu->isar.id_dfr0  = 0x04010088;
-    cpu->isar.id_isar0 = 0x02101110;
-    cpu->isar.id_isar1 = 0x13112111;
-    cpu->isar.id_isar2 = 0x21232042;
-    cpu->isar.id_isar3 = 0x01112131;
-    cpu->isar.id_isar4 = 0x00011142;
-    cpu->isar.id_isar5 = 0x01011121;
-    cpu->isar.id_isar6 = 0x00000010;
-    cpu->isar.id_mmfr0 = 0x10201105;
-    cpu->isar.id_mmfr1 = 0x40000000;
-    cpu->isar.id_mmfr2 = 0x01260000;
-    cpu->isar.id_mmfr3 = 0x02122211;
-    cpu->isar.id_mmfr4 = 0x00021110;
-    cpu->isar.id_pfr0  = 0x10010131;
-    cpu->isar.id_pfr1  = 0x00011011;
-    cpu->isar.id_pfr2  = 0x00000011;
-    cpu->midr = 0x412FD050;          /* r2p0 */
-    cpu->revidr = 0;
-
-    /* From B2.23 CCSIDR_EL1 */
-    cpu->ccsidr[0] = 0x700fe01a; /* 32KB L1 dcache */
-    cpu->ccsidr[1] = 0x200fe01a; /* 32KB L1 icache */
-    cpu->ccsidr[2] = 0x703fe07a; /* 512KB L2 cache */
-
-    /* From B2.96 SCTLR_EL3 */
-    cpu->reset_sctlr = 0x30c50838;
-
-    /* From B4.45 ICH_VTR_EL2 */
-    cpu->gic_num_lrs = 4;
-    cpu->gic_vpribits = 5;
-    cpu->gic_vprebits = 5;
-    cpu->gic_pribits = 5;
-
-    cpu->isar.mvfr0 = 0x10110222;
-    cpu->isar.mvfr1 = 0x13211111;
-    cpu->isar.mvfr2 = 0x00000043;
-
-    /* From D5.4 AArch64 PMU register summary */
-    cpu->isar.reset_pmcr_el0 = 0x410b3000;
-}
-
-static void aarch64_a72_initfn(Object *obj)
-{
-    ARMCPU *cpu = ARM_CPU(obj);
-
-    cpu->dtb_compatible = "arm,cortex-a72";
-    set_feature(&cpu->env, ARM_FEATURE_V8);
-    set_feature(&cpu->env, ARM_FEATURE_NEON);
-    set_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER);
-    set_feature(&cpu->env, ARM_FEATURE_AARCH64);
-    set_feature(&cpu->env, ARM_FEATURE_CBAR_RO);
-    set_feature(&cpu->env, ARM_FEATURE_EL2);
-    set_feature(&cpu->env, ARM_FEATURE_EL3);
-    set_feature(&cpu->env, ARM_FEATURE_PMU);
-    cpu->midr = 0x410fd083;
-    cpu->revidr = 0x00000000;
-    cpu->reset_fpsid = 0x41034080;
-    cpu->isar.mvfr0 = 0x10110222;
-    cpu->isar.mvfr1 = 0x12111111;
-    cpu->isar.mvfr2 = 0x00000043;
-    cpu->ctr = 0x8444c004;
-    cpu->reset_sctlr = 0x00c50838;
-    cpu->isar.id_pfr0 = 0x00000131;
-    cpu->isar.id_pfr1 = 0x00011011;
-    cpu->isar.id_dfr0 = 0x03010066;
-    cpu->id_afr0 = 0x00000000;
-    cpu->isar.id_mmfr0 = 0x10201105;
-    cpu->isar.id_mmfr1 = 0x40000000;
-    cpu->isar.id_mmfr2 = 0x01260000;
-    cpu->isar.id_mmfr3 = 0x02102211;
-    cpu->isar.id_isar0 = 0x02101110;
-    cpu->isar.id_isar1 = 0x13112111;
-    cpu->isar.id_isar2 = 0x21232042;
-    cpu->isar.id_isar3 = 0x01112131;
-    cpu->isar.id_isar4 = 0x00011142;
-    cpu->isar.id_isar5 = 0x00011121;
-    cpu->isar.id_aa64pfr0 = 0x00002222;
-    cpu->isar.id_aa64dfr0 = 0x10305106;
-    cpu->isar.id_aa64isar0 = 0x00011120;
-    cpu->isar.id_aa64mmfr0 = 0x00001124;
-    cpu->isar.dbgdidr = 0x3516d000;
-    cpu->isar.dbgdevid = 0x01110f13;
-    cpu->isar.dbgdevid1 = 0x2;
-    cpu->isar.reset_pmcr_el0 = 0x41023000;
-    cpu->clidr = 0x0a200023;
-    cpu->ccsidr[0] = 0x701fe00a; /* 32KB L1 dcache */
-    cpu->ccsidr[1] = 0x201fe012; /* 48KB L1 icache */
-    cpu->ccsidr[2] = 0x707fe07a; /* 1MB L2 cache */
-    cpu->dcz_blocksize = 4; /* 64 bytes */
-    cpu->gic_num_lrs = 4;
-    cpu->gic_vpribits = 5;
-    cpu->gic_vprebits = 5;
-    cpu->gic_pribits = 5;
-    define_cortex_a72_a57_a53_cp_reginfo(cpu);
-}
-
-static void aarch64_a76_initfn(Object *obj)
-{
-    ARMCPU *cpu = ARM_CPU(obj);
-
-    cpu->dtb_compatible = "arm,cortex-a76";
-    set_feature(&cpu->env, ARM_FEATURE_V8);
-    set_feature(&cpu->env, ARM_FEATURE_NEON);
-    set_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER);
-    set_feature(&cpu->env, ARM_FEATURE_AARCH64);
-    set_feature(&cpu->env, ARM_FEATURE_CBAR_RO);
-    set_feature(&cpu->env, ARM_FEATURE_EL2);
-    set_feature(&cpu->env, ARM_FEATURE_EL3);
-    set_feature(&cpu->env, ARM_FEATURE_PMU);
-
-    /* Ordered by B2.4 AArch64 registers by functional group */
-    cpu->clidr = 0x82000023;
-    cpu->ctr = 0x8444C004;
-    cpu->dcz_blocksize = 4;
-    cpu->isar.id_aa64dfr0  = 0x0000000010305408ull;
-    cpu->isar.id_aa64isar0 = 0x0000100010211120ull;
-    cpu->isar.id_aa64isar1 = 0x0000000000100001ull;
-    cpu->isar.id_aa64mmfr0 = 0x0000000000101122ull;
-    cpu->isar.id_aa64mmfr1 = 0x0000000010212122ull;
-    cpu->isar.id_aa64mmfr2 = 0x0000000000001011ull;
-    cpu->isar.id_aa64pfr0  = 0x1100000010111112ull; /* GIC filled in later */
-    cpu->isar.id_aa64pfr1  = 0x0000000000000010ull;
-    cpu->id_afr0       = 0x00000000;
-    cpu->isar.id_dfr0  = 0x04010088;
-    cpu->isar.id_isar0 = 0x02101110;
-    cpu->isar.id_isar1 = 0x13112111;
-    cpu->isar.id_isar2 = 0x21232042;
-    cpu->isar.id_isar3 = 0x01112131;
-    cpu->isar.id_isar4 = 0x00010142;
-    cpu->isar.id_isar5 = 0x01011121;
-    cpu->isar.id_isar6 = 0x00000010;
-    cpu->isar.id_mmfr0 = 0x10201105;
-    cpu->isar.id_mmfr1 = 0x40000000;
-    cpu->isar.id_mmfr2 = 0x01260000;
-    cpu->isar.id_mmfr3 = 0x02122211;
-    cpu->isar.id_mmfr4 = 0x00021110;
-    cpu->isar.id_pfr0  = 0x10010131;
-    cpu->isar.id_pfr1  = 0x00010000; /* GIC filled in later */
-    cpu->isar.id_pfr2  = 0x00000011;
-    cpu->midr = 0x414fd0b1;          /* r4p1 */
-    cpu->revidr = 0;
-
-    /* From B2.18 CCSIDR_EL1 */
-    cpu->ccsidr[0] = 0x701fe01a; /* 64KB L1 dcache */
-    cpu->ccsidr[1] = 0x201fe01a; /* 64KB L1 icache */
-    cpu->ccsidr[2] = 0x707fe03a; /* 512KB L2 cache */
-
-    /* From B2.93 SCTLR_EL3 */
-    cpu->reset_sctlr = 0x30c50838;
-
-    /* From B4.23 ICH_VTR_EL2 */
-    cpu->gic_num_lrs = 4;
-    cpu->gic_vpribits = 5;
-    cpu->gic_vprebits = 5;
-    cpu->gic_pribits = 5;
-
-    /* From B5.1 AdvSIMD AArch64 register summary */
-    cpu->isar.mvfr0 = 0x10110222;
-    cpu->isar.mvfr1 = 0x13211111;
-    cpu->isar.mvfr2 = 0x00000043;
-
-    /* From D5.1 AArch64 PMU register summary */
-    cpu->isar.reset_pmcr_el0 = 0x410b3000;
-}
-
-static void aarch64_a64fx_initfn(Object *obj)
-{
-    ARMCPU *cpu = ARM_CPU(obj);
-
-    cpu->dtb_compatible = "arm,a64fx";
-    set_feature(&cpu->env, ARM_FEATURE_V8);
-    set_feature(&cpu->env, ARM_FEATURE_NEON);
-    set_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER);
-    set_feature(&cpu->env, ARM_FEATURE_AARCH64);
-    set_feature(&cpu->env, ARM_FEATURE_EL2);
-    set_feature(&cpu->env, ARM_FEATURE_EL3);
-    set_feature(&cpu->env, ARM_FEATURE_PMU);
-    cpu->midr = 0x461f0010;
-    cpu->revidr = 0x00000000;
-    cpu->ctr = 0x86668006;
-    cpu->reset_sctlr = 0x30000180;
-    cpu->isar.id_aa64pfr0 =   0x0000000101111111; /* No RAS Extensions */
-    cpu->isar.id_aa64pfr1 = 0x0000000000000000;
-    cpu->isar.id_aa64dfr0 = 0x0000000010305408;
-    cpu->isar.id_aa64dfr1 = 0x0000000000000000;
-    cpu->id_aa64afr0 = 0x0000000000000000;
-    cpu->id_aa64afr1 = 0x0000000000000000;
-    cpu->isar.id_aa64mmfr0 = 0x0000000000001122;
-    cpu->isar.id_aa64mmfr1 = 0x0000000011212100;
-    cpu->isar.id_aa64mmfr2 = 0x0000000000001011;
-    cpu->isar.id_aa64isar0 = 0x0000000010211120;
-    cpu->isar.id_aa64isar1 = 0x0000000000010001;
-    cpu->isar.id_aa64zfr0 = 0x0000000000000000;
-    cpu->clidr = 0x0000000080000023;
-    cpu->ccsidr[0] = 0x7007e01c; /* 64KB L1 dcache */
-    cpu->ccsidr[1] = 0x2007e01c; /* 64KB L1 icache */
-    cpu->ccsidr[2] = 0x70ffe07c; /* 8MB L2 cache */
-    cpu->dcz_blocksize = 6; /* 256 bytes */
-    cpu->gic_num_lrs = 4;
-    cpu->gic_vpribits = 5;
-    cpu->gic_vprebits = 5;
-    cpu->gic_pribits = 5;
-
-    /* The A64FX supports only 128, 256 and 512 bit vector lengths */
-    aarch64_add_sve_properties(obj);
-    cpu->sve_vq.supported = (1 << 0)  /* 128bit */
-                          | (1 << 1)  /* 256bit */
-                          | (1 << 3); /* 512bit */
-
-    cpu->isar.reset_pmcr_el0 = 0x46014040;
-
-    /* TODO:  Add A64FX specific HPC extension registers */
-}
-
-static const ARMCPRegInfo neoverse_n1_cp_reginfo[] = {
-    { .name = "ATCR_EL1", .state = ARM_CP_STATE_AA64,
-      .opc0 = 3, .opc1 = 0, .crn = 15, .crm = 7, .opc2 = 0,
-      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
-    { .name = "ATCR_EL2", .state = ARM_CP_STATE_AA64,
-      .opc0 = 3, .opc1 = 4, .crn = 15, .crm = 7, .opc2 = 0,
-      .access = PL2_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
-    { .name = "ATCR_EL3", .state = ARM_CP_STATE_AA64,
-      .opc0 = 3, .opc1 = 6, .crn = 15, .crm = 7, .opc2 = 0,
-      .access = PL3_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
-    { .name = "ATCR_EL12", .state = ARM_CP_STATE_AA64,
-      .opc0 = 3, .opc1 = 5, .crn = 15, .crm = 7, .opc2 = 0,
-      .access = PL2_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
-    { .name = "AVTCR_EL2", .state = ARM_CP_STATE_AA64,
-      .opc0 = 3, .opc1 = 4, .crn = 15, .crm = 7, .opc2 = 1,
-      .access = PL2_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
-    { .name = "CPUACTLR_EL1", .state = ARM_CP_STATE_AA64,
-      .opc0 = 3, .opc1 = 0, .crn = 15, .crm = 1, .opc2 = 0,
-      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
-    { .name = "CPUACTLR2_EL1", .state = ARM_CP_STATE_AA64,
-      .opc0 = 3, .opc1 = 0, .crn = 15, .crm = 1, .opc2 = 1,
-      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
-    { .name = "CPUACTLR3_EL1", .state = ARM_CP_STATE_AA64,
-      .opc0 = 3, .opc1 = 0, .crn = 15, .crm = 1, .opc2 = 2,
-      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
-    /*
-     * Report CPUCFR_EL1.SCU as 1, as we do not implement the DSU
-     * (and in particular its system registers).
-     */
-    { .name = "CPUCFR_EL1", .state = ARM_CP_STATE_AA64,
-      .opc0 = 3, .opc1 = 0, .crn = 15, .crm = 0, .opc2 = 0,
-      .access = PL1_R, .type = ARM_CP_CONST, .resetvalue = 4 },
-    { .name = "CPUECTLR_EL1", .state = ARM_CP_STATE_AA64,
-      .opc0 = 3, .opc1 = 0, .crn = 15, .crm = 1, .opc2 = 4,
-      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0x961563010 },
-    { .name = "CPUPCR_EL3", .state = ARM_CP_STATE_AA64,
-      .opc0 = 3, .opc1 = 6, .crn = 15, .crm = 8, .opc2 = 1,
-      .access = PL3_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
-    { .name = "CPUPMR_EL3", .state = ARM_CP_STATE_AA64,
-      .opc0 = 3, .opc1 = 6, .crn = 15, .crm = 8, .opc2 = 3,
-      .access = PL3_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
-    { .name = "CPUPOR_EL3", .state = ARM_CP_STATE_AA64,
-      .opc0 = 3, .opc1 = 6, .crn = 15, .crm = 8, .opc2 = 2,
-      .access = PL3_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
-    { .name = "CPUPSELR_EL3", .state = ARM_CP_STATE_AA64,
-      .opc0 = 3, .opc1 = 6, .crn = 15, .crm = 8, .opc2 = 0,
-      .access = PL3_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
-    { .name = "CPUPWRCTLR_EL1", .state = ARM_CP_STATE_AA64,
-      .opc0 = 3, .opc1 = 0, .crn = 15, .crm = 2, .opc2 = 7,
-      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
-    { .name = "ERXPFGCDN_EL1", .state = ARM_CP_STATE_AA64,
-      .opc0 = 3, .opc1 = 0, .crn = 15, .crm = 2, .opc2 = 2,
-      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
-    { .name = "ERXPFGCTL_EL1", .state = ARM_CP_STATE_AA64,
-      .opc0 = 3, .opc1 = 0, .crn = 15, .crm = 2, .opc2 = 1,
-      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
-    { .name = "ERXPFGF_EL1", .state = ARM_CP_STATE_AA64,
-      .opc0 = 3, .opc1 = 0, .crn = 15, .crm = 2, .opc2 = 0,
-      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
-};
-
-static void define_neoverse_n1_cp_reginfo(ARMCPU *cpu)
-{
-    define_arm_cp_regs(cpu, neoverse_n1_cp_reginfo);
-}
-
-static void aarch64_neoverse_n1_initfn(Object *obj)
-{
-    ARMCPU *cpu = ARM_CPU(obj);
-
-    cpu->dtb_compatible = "arm,neoverse-n1";
-    set_feature(&cpu->env, ARM_FEATURE_V8);
-    set_feature(&cpu->env, ARM_FEATURE_NEON);
-    set_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER);
-    set_feature(&cpu->env, ARM_FEATURE_AARCH64);
-    set_feature(&cpu->env, ARM_FEATURE_CBAR_RO);
-    set_feature(&cpu->env, ARM_FEATURE_EL2);
-    set_feature(&cpu->env, ARM_FEATURE_EL3);
-    set_feature(&cpu->env, ARM_FEATURE_PMU);
-
-    /* Ordered by B2.4 AArch64 registers by functional group */
-    cpu->clidr = 0x82000023;
-    cpu->ctr = 0x8444c004;
-    cpu->dcz_blocksize = 4;
-    cpu->isar.id_aa64dfr0  = 0x0000000110305408ull;
-    cpu->isar.id_aa64isar0 = 0x0000100010211120ull;
-    cpu->isar.id_aa64isar1 = 0x0000000000100001ull;
-    cpu->isar.id_aa64mmfr0 = 0x0000000000101125ull;
-    cpu->isar.id_aa64mmfr1 = 0x0000000010212122ull;
-    cpu->isar.id_aa64mmfr2 = 0x0000000000001011ull;
-    cpu->isar.id_aa64pfr0  = 0x1100000010111112ull; /* GIC filled in later */
-    cpu->isar.id_aa64pfr1  = 0x0000000000000020ull;
-    cpu->id_afr0       = 0x00000000;
-    cpu->isar.id_dfr0  = 0x04010088;
-    cpu->isar.id_isar0 = 0x02101110;
-    cpu->isar.id_isar1 = 0x13112111;
-    cpu->isar.id_isar2 = 0x21232042;
-    cpu->isar.id_isar3 = 0x01112131;
-    cpu->isar.id_isar4 = 0x00010142;
-    cpu->isar.id_isar5 = 0x01011121;
-    cpu->isar.id_isar6 = 0x00000010;
-    cpu->isar.id_mmfr0 = 0x10201105;
-    cpu->isar.id_mmfr1 = 0x40000000;
-    cpu->isar.id_mmfr2 = 0x01260000;
-    cpu->isar.id_mmfr3 = 0x02122211;
-    cpu->isar.id_mmfr4 = 0x00021110;
-    cpu->isar.id_pfr0  = 0x10010131;
-    cpu->isar.id_pfr1  = 0x00010000; /* GIC filled in later */
-    cpu->isar.id_pfr2  = 0x00000011;
-    cpu->midr = 0x414fd0c1;          /* r4p1 */
-    cpu->revidr = 0;
-
-    /* From B2.23 CCSIDR_EL1 */
-    cpu->ccsidr[0] = 0x701fe01a; /* 64KB L1 dcache */
-    cpu->ccsidr[1] = 0x201fe01a; /* 64KB L1 icache */
-    cpu->ccsidr[2] = 0x70ffe03a; /* 1MB L2 cache */
-
-    /* From B2.98 SCTLR_EL3 */
-    cpu->reset_sctlr = 0x30c50838;
-
-    /* From B4.23 ICH_VTR_EL2 */
-    cpu->gic_num_lrs = 4;
-    cpu->gic_vpribits = 5;
-    cpu->gic_vprebits = 5;
-    cpu->gic_pribits = 5;
-
-    /* From B5.1 AdvSIMD AArch64 register summary */
-    cpu->isar.mvfr0 = 0x10110222;
-    cpu->isar.mvfr1 = 0x13211111;
-    cpu->isar.mvfr2 = 0x00000043;
-
-    /* From D5.1 AArch64 PMU register summary */
-    cpu->isar.reset_pmcr_el0 = 0x410c3000;
-
-    define_neoverse_n1_cp_reginfo(cpu);
-}
-
 static void aarch64_host_initfn(Object *obj)
 {
 #if defined(CONFIG_KVM)
@@ -1180,185 +684,6 @@ static void aarch64_host_initfn(Object *obj)
 #endif
 }
 
-/*
- * -cpu max: a CPU with as many features enabled as our emulation supports.
- * The version of '-cpu max' for qemu-system-arm is defined in cpu_tcg.c;
- * this only needs to handle 64 bits.
- */
-static void aarch64_max_tcg_initfn(Object *obj)
-{
-    ARMCPU *cpu = ARM_CPU(obj);
-    uint64_t t;
-    uint32_t u;
-
-    /*
-     * Reset MIDR so the guest doesn't mistake our 'max' CPU type for a real
-     * one and try to apply errata workarounds or use impdef features we
-     * don't provide.
-     * An IMPLEMENTER field of 0 means "reserved for software use";
-     * ARCHITECTURE must be 0xf indicating "v7 or later, check ID registers
-     * to see which features are present";
-     * the VARIANT, PARTNUM and REVISION fields are all implementation
-     * defined and we choose to define PARTNUM just in case guest
-     * code needs to distinguish this QEMU CPU from other software
-     * implementations, though this shouldn't be needed.
-     */
-    t = FIELD_DP64(0, MIDR_EL1, IMPLEMENTER, 0);
-    t = FIELD_DP64(t, MIDR_EL1, ARCHITECTURE, 0xf);
-    t = FIELD_DP64(t, MIDR_EL1, PARTNUM, 'Q');
-    t = FIELD_DP64(t, MIDR_EL1, VARIANT, 0);
-    t = FIELD_DP64(t, MIDR_EL1, REVISION, 0);
-    cpu->midr = t;
-
-    /*
-     * We're going to set FEAT_S2FWB, which mandates that CLIDR_EL1.{LoUU,LoUIS}
-     * are zero.
-     */
-    u = cpu->clidr;
-    u = FIELD_DP32(u, CLIDR_EL1, LOUIS, 0);
-    u = FIELD_DP32(u, CLIDR_EL1, LOUU, 0);
-    cpu->clidr = u;
-
-    t = cpu->isar.id_aa64isar0;
-    t = FIELD_DP64(t, ID_AA64ISAR0, AES, 2);      /* FEAT_PMULL */
-    t = FIELD_DP64(t, ID_AA64ISAR0, SHA1, 1);     /* FEAT_SHA1 */
-    t = FIELD_DP64(t, ID_AA64ISAR0, SHA2, 2);     /* FEAT_SHA512 */
-    t = FIELD_DP64(t, ID_AA64ISAR0, CRC32, 1);
-    t = FIELD_DP64(t, ID_AA64ISAR0, ATOMIC, 2);   /* FEAT_LSE */
-    t = FIELD_DP64(t, ID_AA64ISAR0, RDM, 1);      /* FEAT_RDM */
-    t = FIELD_DP64(t, ID_AA64ISAR0, SHA3, 1);     /* FEAT_SHA3 */
-    t = FIELD_DP64(t, ID_AA64ISAR0, SM3, 1);      /* FEAT_SM3 */
-    t = FIELD_DP64(t, ID_AA64ISAR0, SM4, 1);      /* FEAT_SM4 */
-    t = FIELD_DP64(t, ID_AA64ISAR0, DP, 1);       /* FEAT_DotProd */
-    t = FIELD_DP64(t, ID_AA64ISAR0, FHM, 1);      /* FEAT_FHM */
-    t = FIELD_DP64(t, ID_AA64ISAR0, TS, 2);       /* FEAT_FlagM2 */
-    t = FIELD_DP64(t, ID_AA64ISAR0, TLB, 2);      /* FEAT_TLBIRANGE */
-    t = FIELD_DP64(t, ID_AA64ISAR0, RNDR, 1);     /* FEAT_RNG */
-    cpu->isar.id_aa64isar0 = t;
-
-    t = cpu->isar.id_aa64isar1;
-    t = FIELD_DP64(t, ID_AA64ISAR1, DPB, 2);      /* FEAT_DPB2 */
-    t = FIELD_DP64(t, ID_AA64ISAR1, JSCVT, 1);    /* FEAT_JSCVT */
-    t = FIELD_DP64(t, ID_AA64ISAR1, FCMA, 1);     /* FEAT_FCMA */
-    t = FIELD_DP64(t, ID_AA64ISAR1, LRCPC, 2);    /* FEAT_LRCPC2 */
-    t = FIELD_DP64(t, ID_AA64ISAR1, FRINTTS, 1);  /* FEAT_FRINTTS */
-    t = FIELD_DP64(t, ID_AA64ISAR1, SB, 1);       /* FEAT_SB */
-    t = FIELD_DP64(t, ID_AA64ISAR1, SPECRES, 1);  /* FEAT_SPECRES */
-    t = FIELD_DP64(t, ID_AA64ISAR1, BF16, 1);     /* FEAT_BF16 */
-    t = FIELD_DP64(t, ID_AA64ISAR1, DGH, 1);      /* FEAT_DGH */
-    t = FIELD_DP64(t, ID_AA64ISAR1, I8MM, 1);     /* FEAT_I8MM */
-    cpu->isar.id_aa64isar1 = t;
-
-    t = cpu->isar.id_aa64pfr0;
-    t = FIELD_DP64(t, ID_AA64PFR0, FP, 1);        /* FEAT_FP16 */
-    t = FIELD_DP64(t, ID_AA64PFR0, ADVSIMD, 1);   /* FEAT_FP16 */
-    t = FIELD_DP64(t, ID_AA64PFR0, RAS, 2);       /* FEAT_RASv1p1 + FEAT_DoubleFault */
-    t = FIELD_DP64(t, ID_AA64PFR0, SVE, 1);
-    t = FIELD_DP64(t, ID_AA64PFR0, SEL2, 1);      /* FEAT_SEL2 */
-    t = FIELD_DP64(t, ID_AA64PFR0, DIT, 1);       /* FEAT_DIT */
-    t = FIELD_DP64(t, ID_AA64PFR0, CSV2, 2);      /* FEAT_CSV2_2 */
-    t = FIELD_DP64(t, ID_AA64PFR0, CSV3, 1);      /* FEAT_CSV3 */
-    cpu->isar.id_aa64pfr0 = t;
-
-    t = cpu->isar.id_aa64pfr1;
-    t = FIELD_DP64(t, ID_AA64PFR1, BT, 1);        /* FEAT_BTI */
-    t = FIELD_DP64(t, ID_AA64PFR1, SSBS, 2);      /* FEAT_SSBS2 */
-    /*
-     * Begin with full support for MTE. This will be downgraded to MTE=0
-     * during realize if the board provides no tag memory, much like
-     * we do for EL2 with the virtualization=on property.
-     */
-    t = FIELD_DP64(t, ID_AA64PFR1, MTE, 3);       /* FEAT_MTE3 */
-    t = FIELD_DP64(t, ID_AA64PFR1, RAS_FRAC, 0);  /* FEAT_RASv1p1 + FEAT_DoubleFault */
-    t = FIELD_DP64(t, ID_AA64PFR1, SME, 1);       /* FEAT_SME */
-    t = FIELD_DP64(t, ID_AA64PFR1, CSV2_FRAC, 0); /* FEAT_CSV2_2 */
-    cpu->isar.id_aa64pfr1 = t;
-
-    t = cpu->isar.id_aa64mmfr0;
-    t = FIELD_DP64(t, ID_AA64MMFR0, PARANGE, 6); /* FEAT_LPA: 52 bits */
-    t = FIELD_DP64(t, ID_AA64MMFR0, TGRAN16, 1);   /* 16k pages supported */
-    t = FIELD_DP64(t, ID_AA64MMFR0, TGRAN16_2, 2); /* 16k stage2 supported */
-    t = FIELD_DP64(t, ID_AA64MMFR0, TGRAN64_2, 2); /* 64k stage2 supported */
-    t = FIELD_DP64(t, ID_AA64MMFR0, TGRAN4_2, 2);  /*  4k stage2 supported */
-    t = FIELD_DP64(t, ID_AA64MMFR0, FGT, 1);       /* FEAT_FGT */
-    cpu->isar.id_aa64mmfr0 = t;
-
-    t = cpu->isar.id_aa64mmfr1;
-    t = FIELD_DP64(t, ID_AA64MMFR1, HAFDBS, 2);   /* FEAT_HAFDBS */
-    t = FIELD_DP64(t, ID_AA64MMFR1, VMIDBITS, 2); /* FEAT_VMID16 */
-    t = FIELD_DP64(t, ID_AA64MMFR1, VH, 1);       /* FEAT_VHE */
-    t = FIELD_DP64(t, ID_AA64MMFR1, HPDS, 1);     /* FEAT_HPDS */
-    t = FIELD_DP64(t, ID_AA64MMFR1, LO, 1);       /* FEAT_LOR */
-    t = FIELD_DP64(t, ID_AA64MMFR1, PAN, 3);      /* FEAT_PAN3 */
-    t = FIELD_DP64(t, ID_AA64MMFR1, XNX, 1);      /* FEAT_XNX */
-    t = FIELD_DP64(t, ID_AA64MMFR1, ETS, 1);      /* FEAT_ETS */
-    t = FIELD_DP64(t, ID_AA64MMFR1, HCX, 1);      /* FEAT_HCX */
-    cpu->isar.id_aa64mmfr1 = t;
-
-    t = cpu->isar.id_aa64mmfr2;
-    t = FIELD_DP64(t, ID_AA64MMFR2, CNP, 1);      /* FEAT_TTCNP */
-    t = FIELD_DP64(t, ID_AA64MMFR2, UAO, 1);      /* FEAT_UAO */
-    t = FIELD_DP64(t, ID_AA64MMFR2, IESB, 1);     /* FEAT_IESB */
-    t = FIELD_DP64(t, ID_AA64MMFR2, VARANGE, 1);  /* FEAT_LVA */
-    t = FIELD_DP64(t, ID_AA64MMFR2, ST, 1);       /* FEAT_TTST */
-    t = FIELD_DP64(t, ID_AA64MMFR2, IDS, 1);      /* FEAT_IDST */
-    t = FIELD_DP64(t, ID_AA64MMFR2, FWB, 1);      /* FEAT_S2FWB */
-    t = FIELD_DP64(t, ID_AA64MMFR2, TTL, 1);      /* FEAT_TTL */
-    t = FIELD_DP64(t, ID_AA64MMFR2, BBM, 2);      /* FEAT_BBM at level 2 */
-    t = FIELD_DP64(t, ID_AA64MMFR2, EVT, 2);      /* FEAT_EVT */
-    t = FIELD_DP64(t, ID_AA64MMFR2, E0PD, 1);     /* FEAT_E0PD */
-    cpu->isar.id_aa64mmfr2 = t;
-
-    t = cpu->isar.id_aa64zfr0;
-    t = FIELD_DP64(t, ID_AA64ZFR0, SVEVER, 1);
-    t = FIELD_DP64(t, ID_AA64ZFR0, AES, 2);       /* FEAT_SVE_PMULL128 */
-    t = FIELD_DP64(t, ID_AA64ZFR0, BITPERM, 1);   /* FEAT_SVE_BitPerm */
-    t = FIELD_DP64(t, ID_AA64ZFR0, BFLOAT16, 1);  /* FEAT_BF16 */
-    t = FIELD_DP64(t, ID_AA64ZFR0, SHA3, 1);      /* FEAT_SVE_SHA3 */
-    t = FIELD_DP64(t, ID_AA64ZFR0, SM4, 1);       /* FEAT_SVE_SM4 */
-    t = FIELD_DP64(t, ID_AA64ZFR0, I8MM, 1);      /* FEAT_I8MM */
-    t = FIELD_DP64(t, ID_AA64ZFR0, F32MM, 1);     /* FEAT_F32MM */
-    t = FIELD_DP64(t, ID_AA64ZFR0, F64MM, 1);     /* FEAT_F64MM */
-    cpu->isar.id_aa64zfr0 = t;
-
-    t = cpu->isar.id_aa64dfr0;
-    t = FIELD_DP64(t, ID_AA64DFR0, DEBUGVER, 9);  /* FEAT_Debugv8p4 */
-    t = FIELD_DP64(t, ID_AA64DFR0, PMUVER, 6);    /* FEAT_PMUv3p5 */
-    cpu->isar.id_aa64dfr0 = t;
-
-    t = cpu->isar.id_aa64smfr0;
-    t = FIELD_DP64(t, ID_AA64SMFR0, F32F32, 1);   /* FEAT_SME */
-    t = FIELD_DP64(t, ID_AA64SMFR0, B16F32, 1);   /* FEAT_SME */
-    t = FIELD_DP64(t, ID_AA64SMFR0, F16F32, 1);   /* FEAT_SME */
-    t = FIELD_DP64(t, ID_AA64SMFR0, I8I32, 0xf);  /* FEAT_SME */
-    t = FIELD_DP64(t, ID_AA64SMFR0, F64F64, 1);   /* FEAT_SME_F64F64 */
-    t = FIELD_DP64(t, ID_AA64SMFR0, I16I64, 0xf); /* FEAT_SME_I16I64 */
-    t = FIELD_DP64(t, ID_AA64SMFR0, FA64, 1);     /* FEAT_SME_FA64 */
-    cpu->isar.id_aa64smfr0 = t;
-
-    /* Replicate the same data to the 32-bit id registers.  */
-    aa32_max_features(cpu);
-
-#ifdef CONFIG_USER_ONLY
-    /*
-     * For usermode -cpu max we can use a larger and more efficient DCZ
-     * blocksize since we don't have to follow what the hardware does.
-     */
-    cpu->ctr = 0x80038003; /* 32 byte I and D cacheline size, VIPT icache */
-    cpu->dcz_blocksize = 7; /*  512 bytes */
-#endif
-
-    cpu->sve_vq.supported = MAKE_64BIT_MASK(0, ARM_MAX_VQ);
-    cpu->sme_vq.supported = SVE_VQ_POW2_MAP;
-
-    aarch64_add_pauth_properties(obj);
-    aarch64_add_sve_properties(obj);
-    aarch64_add_sme_properties(obj);
-    object_property_add(obj, "sve-max-vq", "uint32", cpu_max_get_sve_max_vq,
-                        cpu_max_set_sve_max_vq, NULL, NULL);
-    qdev_property_add_static(DEVICE(obj), &arm_cpu_lpa2_property);
-}
-
 static void aarch64_max_initfn(Object *obj)
 {
     if (kvm_enabled() || hvf_enabled()) {
@@ -1378,14 +703,8 @@ static void aarch64_max_initfn(Object *obj)
 }
 
 static const ARMCPUInfo aarch64_cpus[] = {
-    { .name = "cortex-a35",         .initfn = aarch64_a35_initfn },
     { .name = "cortex-a57",         .initfn = aarch64_a57_initfn },
     { .name = "cortex-a53",         .initfn = aarch64_a53_initfn },
-    { .name = "cortex-a55",         .initfn = aarch64_a55_initfn },
-    { .name = "cortex-a72",         .initfn = aarch64_a72_initfn },
-    { .name = "cortex-a76",         .initfn = aarch64_a76_initfn },
-    { .name = "a64fx",              .initfn = aarch64_a64fx_initfn },
-    { .name = "neoverse-n1",        .initfn = aarch64_neoverse_n1_initfn },
     { .name = "max",                .initfn = aarch64_max_initfn },
 #if defined(CONFIG_KVM) || defined(CONFIG_HVF)
     { .name = "host",               .initfn = aarch64_host_initfn },
diff --git a/target/arm/internals.h b/target/arm/internals.h
index b73c540e7e..0df8f3b8bc 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1361,6 +1361,10 @@ void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp);
 void arm_cpu_sme_finalize(ARMCPU *cpu, Error **errp);
 void arm_cpu_pauth_finalize(ARMCPU *cpu, Error **errp);
 void arm_cpu_lpa2_finalize(ARMCPU *cpu, Error **errp);
+void aarch64_max_tcg_initfn(Object *obj);
+void aarch64_add_pauth_properties(Object *obj);
+void aarch64_add_sve_properties(Object *obj);
+void aarch64_add_sme_properties(Object *obj);
 #endif
 
 /* Read the CONTROL register as the MRS instruction would. */
diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
new file mode 100644
index 0000000000..646aa46ac9
--- /dev/null
+++ b/target/arm/tcg/cpu64.c
@@ -0,0 +1,723 @@
+/*
+ * QEMU AArch64 TCG CPUs
+ *
+ * Copyright (c) 2013 Linaro Ltd
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License
+ * as published by the Free Software Foundation; either version 2
+ * of the License, or (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, see
+ * <http://www.gnu.org/licenses/gpl-2.0.html>
+ */
+
+#include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "cpu.h"
+#include "qemu/module.h"
+#include "qapi/visitor.h"
+#include "hw/qdev-properties.h"
+#include "internals.h"
+#include "cpregs.h"
+
+static void aarch64_a35_initfn(Object *obj)
+{
+    ARMCPU *cpu = ARM_CPU(obj);
+
+    cpu->dtb_compatible = "arm,cortex-a35";
+    set_feature(&cpu->env, ARM_FEATURE_V8);
+    set_feature(&cpu->env, ARM_FEATURE_NEON);
+    set_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER);
+    set_feature(&cpu->env, ARM_FEATURE_AARCH64);
+    set_feature(&cpu->env, ARM_FEATURE_CBAR_RO);
+    set_feature(&cpu->env, ARM_FEATURE_EL2);
+    set_feature(&cpu->env, ARM_FEATURE_EL3);
+    set_feature(&cpu->env, ARM_FEATURE_PMU);
+
+    /* From B2.2 AArch64 identification registers. */
+    cpu->midr = 0x411fd040;
+    cpu->revidr = 0;
+    cpu->ctr = 0x84448004;
+    cpu->isar.id_pfr0 = 0x00000131;
+    cpu->isar.id_pfr1 = 0x00011011;
+    cpu->isar.id_dfr0 = 0x03010066;
+    cpu->id_afr0 = 0;
+    cpu->isar.id_mmfr0 = 0x10201105;
+    cpu->isar.id_mmfr1 = 0x40000000;
+    cpu->isar.id_mmfr2 = 0x01260000;
+    cpu->isar.id_mmfr3 = 0x02102211;
+    cpu->isar.id_isar0 = 0x02101110;
+    cpu->isar.id_isar1 = 0x13112111;
+    cpu->isar.id_isar2 = 0x21232042;
+    cpu->isar.id_isar3 = 0x01112131;
+    cpu->isar.id_isar4 = 0x00011142;
+    cpu->isar.id_isar5 = 0x00011121;
+    cpu->isar.id_aa64pfr0 = 0x00002222;
+    cpu->isar.id_aa64pfr1 = 0;
+    cpu->isar.id_aa64dfr0 = 0x10305106;
+    cpu->isar.id_aa64dfr1 = 0;
+    cpu->isar.id_aa64isar0 = 0x00011120;
+    cpu->isar.id_aa64isar1 = 0;
+    cpu->isar.id_aa64mmfr0 = 0x00101122;
+    cpu->isar.id_aa64mmfr1 = 0;
+    cpu->clidr = 0x0a200023;
+    cpu->dcz_blocksize = 4;
+
+    /* From B2.4 AArch64 Virtual Memory control registers */
+    cpu->reset_sctlr = 0x00c50838;
+
+    /* From B2.10 AArch64 performance monitor registers */
+    cpu->isar.reset_pmcr_el0 = 0x410a3000;
+
+    /* From B2.29 Cache ID registers */
+    cpu->ccsidr[0] = 0x700fe01a; /* 32KB L1 dcache */
+    cpu->ccsidr[1] = 0x201fe00a; /* 32KB L1 icache */
+    cpu->ccsidr[2] = 0x703fe03a; /* 512KB L2 cache */
+
+    /* From B3.5 VGIC Type register */
+    cpu->gic_num_lrs = 4;
+    cpu->gic_vpribits = 5;
+    cpu->gic_vprebits = 5;
+    cpu->gic_pribits = 5;
+
+    /* From C6.4 Debug ID Register */
+    cpu->isar.dbgdidr = 0x3516d000;
+    /* From C6.5 Debug Device ID Register */
+    cpu->isar.dbgdevid = 0x00110f13;
+    /* From C6.6 Debug Device ID Register 1 */
+    cpu->isar.dbgdevid1 = 0x2;
+
+    /* From Cortex-A35 SIMD and Floating-point Support r1p0 */
+    /* From 3.2 AArch32 register summary */
+    cpu->reset_fpsid = 0x41034043;
+
+    /* From 2.2 AArch64 register summary */
+    cpu->isar.mvfr0 = 0x10110222;
+    cpu->isar.mvfr1 = 0x12111111;
+    cpu->isar.mvfr2 = 0x00000043;
+
+    /* These values are the same with A53/A57/A72. */
+    define_cortex_a72_a57_a53_cp_reginfo(cpu);
+}
+
+static void cpu_max_get_sve_max_vq(Object *obj, Visitor *v, const char *name,
+                                   void *opaque, Error **errp)
+{
+    ARMCPU *cpu = ARM_CPU(obj);
+    uint32_t value;
+
+    /* All vector lengths are disabled when SVE is off. */
+    if (!cpu_isar_feature(aa64_sve, cpu)) {
+        value = 0;
+    } else {
+        value = cpu->sve_max_vq;
+    }
+    visit_type_uint32(v, name, &value, errp);
+}
+
+static void cpu_max_set_sve_max_vq(Object *obj, Visitor *v, const char *name,
+                                   void *opaque, Error **errp)
+{
+    ARMCPU *cpu = ARM_CPU(obj);
+    uint32_t max_vq;
+
+    if (!visit_type_uint32(v, name, &max_vq, errp)) {
+        return;
+    }
+
+    if (max_vq == 0 || max_vq > ARM_MAX_VQ) {
+        error_setg(errp, "unsupported SVE vector length");
+        error_append_hint(errp, "Valid sve-max-vq in range [1-%d]\n",
+                          ARM_MAX_VQ);
+        return;
+    }
+
+    cpu->sve_max_vq = max_vq;
+}
+
+static Property arm_cpu_lpa2_property =
+    DEFINE_PROP_BOOL("lpa2", ARMCPU, prop_lpa2, true);
+
+static void aarch64_a55_initfn(Object *obj)
+{
+    ARMCPU *cpu = ARM_CPU(obj);
+
+    cpu->dtb_compatible = "arm,cortex-a55";
+    set_feature(&cpu->env, ARM_FEATURE_V8);
+    set_feature(&cpu->env, ARM_FEATURE_NEON);
+    set_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER);
+    set_feature(&cpu->env, ARM_FEATURE_AARCH64);
+    set_feature(&cpu->env, ARM_FEATURE_CBAR_RO);
+    set_feature(&cpu->env, ARM_FEATURE_EL2);
+    set_feature(&cpu->env, ARM_FEATURE_EL3);
+    set_feature(&cpu->env, ARM_FEATURE_PMU);
+
+    /* Ordered by B2.4 AArch64 registers by functional group */
+    cpu->clidr = 0x82000023;
+    cpu->ctr = 0x84448004; /* L1Ip = VIPT */
+    cpu->dcz_blocksize = 4; /* 64 bytes */
+    cpu->isar.id_aa64dfr0  = 0x0000000010305408ull;
+    cpu->isar.id_aa64isar0 = 0x0000100010211120ull;
+    cpu->isar.id_aa64isar1 = 0x0000000000100001ull;
+    cpu->isar.id_aa64mmfr0 = 0x0000000000101122ull;
+    cpu->isar.id_aa64mmfr1 = 0x0000000010212122ull;
+    cpu->isar.id_aa64mmfr2 = 0x0000000000001011ull;
+    cpu->isar.id_aa64pfr0  = 0x0000000010112222ull;
+    cpu->isar.id_aa64pfr1  = 0x0000000000000010ull;
+    cpu->id_afr0       = 0x00000000;
+    cpu->isar.id_dfr0  = 0x04010088;
+    cpu->isar.id_isar0 = 0x02101110;
+    cpu->isar.id_isar1 = 0x13112111;
+    cpu->isar.id_isar2 = 0x21232042;
+    cpu->isar.id_isar3 = 0x01112131;
+    cpu->isar.id_isar4 = 0x00011142;
+    cpu->isar.id_isar5 = 0x01011121;
+    cpu->isar.id_isar6 = 0x00000010;
+    cpu->isar.id_mmfr0 = 0x10201105;
+    cpu->isar.id_mmfr1 = 0x40000000;
+    cpu->isar.id_mmfr2 = 0x01260000;
+    cpu->isar.id_mmfr3 = 0x02122211;
+    cpu->isar.id_mmfr4 = 0x00021110;
+    cpu->isar.id_pfr0  = 0x10010131;
+    cpu->isar.id_pfr1  = 0x00011011;
+    cpu->isar.id_pfr2  = 0x00000011;
+    cpu->midr = 0x412FD050;          /* r2p0 */
+    cpu->revidr = 0;
+
+    /* From B2.23 CCSIDR_EL1 */
+    cpu->ccsidr[0] = 0x700fe01a; /* 32KB L1 dcache */
+    cpu->ccsidr[1] = 0x200fe01a; /* 32KB L1 icache */
+    cpu->ccsidr[2] = 0x703fe07a; /* 512KB L2 cache */
+
+    /* From B2.96 SCTLR_EL3 */
+    cpu->reset_sctlr = 0x30c50838;
+
+    /* From B4.45 ICH_VTR_EL2 */
+    cpu->gic_num_lrs = 4;
+    cpu->gic_vpribits = 5;
+    cpu->gic_vprebits = 5;
+    cpu->gic_pribits = 5;
+
+    cpu->isar.mvfr0 = 0x10110222;
+    cpu->isar.mvfr1 = 0x13211111;
+    cpu->isar.mvfr2 = 0x00000043;
+
+    /* From D5.4 AArch64 PMU register summary */
+    cpu->isar.reset_pmcr_el0 = 0x410b3000;
+}
+
+static void aarch64_a72_initfn(Object *obj)
+{
+    ARMCPU *cpu = ARM_CPU(obj);
+
+    cpu->dtb_compatible = "arm,cortex-a72";
+    set_feature(&cpu->env, ARM_FEATURE_V8);
+    set_feature(&cpu->env, ARM_FEATURE_NEON);
+    set_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER);
+    set_feature(&cpu->env, ARM_FEATURE_AARCH64);
+    set_feature(&cpu->env, ARM_FEATURE_CBAR_RO);
+    set_feature(&cpu->env, ARM_FEATURE_EL2);
+    set_feature(&cpu->env, ARM_FEATURE_EL3);
+    set_feature(&cpu->env, ARM_FEATURE_PMU);
+    cpu->midr = 0x410fd083;
+    cpu->revidr = 0x00000000;
+    cpu->reset_fpsid = 0x41034080;
+    cpu->isar.mvfr0 = 0x10110222;
+    cpu->isar.mvfr1 = 0x12111111;
+    cpu->isar.mvfr2 = 0x00000043;
+    cpu->ctr = 0x8444c004;
+    cpu->reset_sctlr = 0x00c50838;
+    cpu->isar.id_pfr0 = 0x00000131;
+    cpu->isar.id_pfr1 = 0x00011011;
+    cpu->isar.id_dfr0 = 0x03010066;
+    cpu->id_afr0 = 0x00000000;
+    cpu->isar.id_mmfr0 = 0x10201105;
+    cpu->isar.id_mmfr1 = 0x40000000;
+    cpu->isar.id_mmfr2 = 0x01260000;
+    cpu->isar.id_mmfr3 = 0x02102211;
+    cpu->isar.id_isar0 = 0x02101110;
+    cpu->isar.id_isar1 = 0x13112111;
+    cpu->isar.id_isar2 = 0x21232042;
+    cpu->isar.id_isar3 = 0x01112131;
+    cpu->isar.id_isar4 = 0x00011142;
+    cpu->isar.id_isar5 = 0x00011121;
+    cpu->isar.id_aa64pfr0 = 0x00002222;
+    cpu->isar.id_aa64dfr0 = 0x10305106;
+    cpu->isar.id_aa64isar0 = 0x00011120;
+    cpu->isar.id_aa64mmfr0 = 0x00001124;
+    cpu->isar.dbgdidr = 0x3516d000;
+    cpu->isar.dbgdevid = 0x01110f13;
+    cpu->isar.dbgdevid1 = 0x2;
+    cpu->isar.reset_pmcr_el0 = 0x41023000;
+    cpu->clidr = 0x0a200023;
+    cpu->ccsidr[0] = 0x701fe00a; /* 32KB L1 dcache */
+    cpu->ccsidr[1] = 0x201fe012; /* 48KB L1 icache */
+    cpu->ccsidr[2] = 0x707fe07a; /* 1MB L2 cache */
+    cpu->dcz_blocksize = 4; /* 64 bytes */
+    cpu->gic_num_lrs = 4;
+    cpu->gic_vpribits = 5;
+    cpu->gic_vprebits = 5;
+    cpu->gic_pribits = 5;
+    define_cortex_a72_a57_a53_cp_reginfo(cpu);
+}
+
+static void aarch64_a76_initfn(Object *obj)
+{
+    ARMCPU *cpu = ARM_CPU(obj);
+
+    cpu->dtb_compatible = "arm,cortex-a76";
+    set_feature(&cpu->env, ARM_FEATURE_V8);
+    set_feature(&cpu->env, ARM_FEATURE_NEON);
+    set_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER);
+    set_feature(&cpu->env, ARM_FEATURE_AARCH64);
+    set_feature(&cpu->env, ARM_FEATURE_CBAR_RO);
+    set_feature(&cpu->env, ARM_FEATURE_EL2);
+    set_feature(&cpu->env, ARM_FEATURE_EL3);
+    set_feature(&cpu->env, ARM_FEATURE_PMU);
+
+    /* Ordered by B2.4 AArch64 registers by functional group */
+    cpu->clidr = 0x82000023;
+    cpu->ctr = 0x8444C004;
+    cpu->dcz_blocksize = 4;
+    cpu->isar.id_aa64dfr0  = 0x0000000010305408ull;
+    cpu->isar.id_aa64isar0 = 0x0000100010211120ull;
+    cpu->isar.id_aa64isar1 = 0x0000000000100001ull;
+    cpu->isar.id_aa64mmfr0 = 0x0000000000101122ull;
+    cpu->isar.id_aa64mmfr1 = 0x0000000010212122ull;
+    cpu->isar.id_aa64mmfr2 = 0x0000000000001011ull;
+    cpu->isar.id_aa64pfr0  = 0x1100000010111112ull; /* GIC filled in later */
+    cpu->isar.id_aa64pfr1  = 0x0000000000000010ull;
+    cpu->id_afr0       = 0x00000000;
+    cpu->isar.id_dfr0  = 0x04010088;
+    cpu->isar.id_isar0 = 0x02101110;
+    cpu->isar.id_isar1 = 0x13112111;
+    cpu->isar.id_isar2 = 0x21232042;
+    cpu->isar.id_isar3 = 0x01112131;
+    cpu->isar.id_isar4 = 0x00010142;
+    cpu->isar.id_isar5 = 0x01011121;
+    cpu->isar.id_isar6 = 0x00000010;
+    cpu->isar.id_mmfr0 = 0x10201105;
+    cpu->isar.id_mmfr1 = 0x40000000;
+    cpu->isar.id_mmfr2 = 0x01260000;
+    cpu->isar.id_mmfr3 = 0x02122211;
+    cpu->isar.id_mmfr4 = 0x00021110;
+    cpu->isar.id_pfr0  = 0x10010131;
+    cpu->isar.id_pfr1  = 0x00010000; /* GIC filled in later */
+    cpu->isar.id_pfr2  = 0x00000011;
+    cpu->midr = 0x414fd0b1;          /* r4p1 */
+    cpu->revidr = 0;
+
+    /* From B2.18 CCSIDR_EL1 */
+    cpu->ccsidr[0] = 0x701fe01a; /* 64KB L1 dcache */
+    cpu->ccsidr[1] = 0x201fe01a; /* 64KB L1 icache */
+    cpu->ccsidr[2] = 0x707fe03a; /* 512KB L2 cache */
+
+    /* From B2.93 SCTLR_EL3 */
+    cpu->reset_sctlr = 0x30c50838;
+
+    /* From B4.23 ICH_VTR_EL2 */
+    cpu->gic_num_lrs = 4;
+    cpu->gic_vpribits = 5;
+    cpu->gic_vprebits = 5;
+    cpu->gic_pribits = 5;
+
+    /* From B5.1 AdvSIMD AArch64 register summary */
+    cpu->isar.mvfr0 = 0x10110222;
+    cpu->isar.mvfr1 = 0x13211111;
+    cpu->isar.mvfr2 = 0x00000043;
+
+    /* From D5.1 AArch64 PMU register summary */
+    cpu->isar.reset_pmcr_el0 = 0x410b3000;
+}
+
+static void aarch64_a64fx_initfn(Object *obj)
+{
+    ARMCPU *cpu = ARM_CPU(obj);
+
+    cpu->dtb_compatible = "arm,a64fx";
+    set_feature(&cpu->env, ARM_FEATURE_V8);
+    set_feature(&cpu->env, ARM_FEATURE_NEON);
+    set_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER);
+    set_feature(&cpu->env, ARM_FEATURE_AARCH64);
+    set_feature(&cpu->env, ARM_FEATURE_EL2);
+    set_feature(&cpu->env, ARM_FEATURE_EL3);
+    set_feature(&cpu->env, ARM_FEATURE_PMU);
+    cpu->midr = 0x461f0010;
+    cpu->revidr = 0x00000000;
+    cpu->ctr = 0x86668006;
+    cpu->reset_sctlr = 0x30000180;
+    cpu->isar.id_aa64pfr0 =   0x0000000101111111; /* No RAS Extensions */
+    cpu->isar.id_aa64pfr1 = 0x0000000000000000;
+    cpu->isar.id_aa64dfr0 = 0x0000000010305408;
+    cpu->isar.id_aa64dfr1 = 0x0000000000000000;
+    cpu->id_aa64afr0 = 0x0000000000000000;
+    cpu->id_aa64afr1 = 0x0000000000000000;
+    cpu->isar.id_aa64mmfr0 = 0x0000000000001122;
+    cpu->isar.id_aa64mmfr1 = 0x0000000011212100;
+    cpu->isar.id_aa64mmfr2 = 0x0000000000001011;
+    cpu->isar.id_aa64isar0 = 0x0000000010211120;
+    cpu->isar.id_aa64isar1 = 0x0000000000010001;
+    cpu->isar.id_aa64zfr0 = 0x0000000000000000;
+    cpu->clidr = 0x0000000080000023;
+    cpu->ccsidr[0] = 0x7007e01c; /* 64KB L1 dcache */
+    cpu->ccsidr[1] = 0x2007e01c; /* 64KB L1 icache */
+    cpu->ccsidr[2] = 0x70ffe07c; /* 8MB L2 cache */
+    cpu->dcz_blocksize = 6; /* 256 bytes */
+    cpu->gic_num_lrs = 4;
+    cpu->gic_vpribits = 5;
+    cpu->gic_vprebits = 5;
+    cpu->gic_pribits = 5;
+
+    /* The A64FX supports only 128, 256 and 512 bit vector lengths */
+    aarch64_add_sve_properties(obj);
+    cpu->sve_vq.supported = (1 << 0)  /* 128bit */
+                          | (1 << 1)  /* 256bit */
+                          | (1 << 3); /* 512bit */
+
+    cpu->isar.reset_pmcr_el0 = 0x46014040;
+
+    /* TODO:  Add A64FX specific HPC extension registers */
+}
+
+static const ARMCPRegInfo neoverse_n1_cp_reginfo[] = {
+    { .name = "ATCR_EL1", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 0, .crn = 15, .crm = 7, .opc2 = 0,
+      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
+    { .name = "ATCR_EL2", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 4, .crn = 15, .crm = 7, .opc2 = 0,
+      .access = PL2_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
+    { .name = "ATCR_EL3", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 6, .crn = 15, .crm = 7, .opc2 = 0,
+      .access = PL3_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
+    { .name = "ATCR_EL12", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 5, .crn = 15, .crm = 7, .opc2 = 0,
+      .access = PL2_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
+    { .name = "AVTCR_EL2", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 4, .crn = 15, .crm = 7, .opc2 = 1,
+      .access = PL2_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
+    { .name = "CPUACTLR_EL1", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 0, .crn = 15, .crm = 1, .opc2 = 0,
+      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
+    { .name = "CPUACTLR2_EL1", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 0, .crn = 15, .crm = 1, .opc2 = 1,
+      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
+    { .name = "CPUACTLR3_EL1", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 0, .crn = 15, .crm = 1, .opc2 = 2,
+      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
+    /*
+     * Report CPUCFR_EL1.SCU as 1, as we do not implement the DSU
+     * (and in particular its system registers).
+     */
+    { .name = "CPUCFR_EL1", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 0, .crn = 15, .crm = 0, .opc2 = 0,
+      .access = PL1_R, .type = ARM_CP_CONST, .resetvalue = 4 },
+    { .name = "CPUECTLR_EL1", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 0, .crn = 15, .crm = 1, .opc2 = 4,
+      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0x961563010 },
+    { .name = "CPUPCR_EL3", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 6, .crn = 15, .crm = 8, .opc2 = 1,
+      .access = PL3_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
+    { .name = "CPUPMR_EL3", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 6, .crn = 15, .crm = 8, .opc2 = 3,
+      .access = PL3_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
+    { .name = "CPUPOR_EL3", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 6, .crn = 15, .crm = 8, .opc2 = 2,
+      .access = PL3_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
+    { .name = "CPUPSELR_EL3", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 6, .crn = 15, .crm = 8, .opc2 = 0,
+      .access = PL3_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
+    { .name = "CPUPWRCTLR_EL1", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 0, .crn = 15, .crm = 2, .opc2 = 7,
+      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
+    { .name = "ERXPFGCDN_EL1", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 0, .crn = 15, .crm = 2, .opc2 = 2,
+      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
+    { .name = "ERXPFGCTL_EL1", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 0, .crn = 15, .crm = 2, .opc2 = 1,
+      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
+    { .name = "ERXPFGF_EL1", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 0, .crn = 15, .crm = 2, .opc2 = 0,
+      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
+};
+
+static void define_neoverse_n1_cp_reginfo(ARMCPU *cpu)
+{
+    define_arm_cp_regs(cpu, neoverse_n1_cp_reginfo);
+}
+
+static void aarch64_neoverse_n1_initfn(Object *obj)
+{
+    ARMCPU *cpu = ARM_CPU(obj);
+
+    cpu->dtb_compatible = "arm,neoverse-n1";
+    set_feature(&cpu->env, ARM_FEATURE_V8);
+    set_feature(&cpu->env, ARM_FEATURE_NEON);
+    set_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER);
+    set_feature(&cpu->env, ARM_FEATURE_AARCH64);
+    set_feature(&cpu->env, ARM_FEATURE_CBAR_RO);
+    set_feature(&cpu->env, ARM_FEATURE_EL2);
+    set_feature(&cpu->env, ARM_FEATURE_EL3);
+    set_feature(&cpu->env, ARM_FEATURE_PMU);
+
+    /* Ordered by B2.4 AArch64 registers by functional group */
+    cpu->clidr = 0x82000023;
+    cpu->ctr = 0x8444c004;
+    cpu->dcz_blocksize = 4;
+    cpu->isar.id_aa64dfr0  = 0x0000000110305408ull;
+    cpu->isar.id_aa64isar0 = 0x0000100010211120ull;
+    cpu->isar.id_aa64isar1 = 0x0000000000100001ull;
+    cpu->isar.id_aa64mmfr0 = 0x0000000000101125ull;
+    cpu->isar.id_aa64mmfr1 = 0x0000000010212122ull;
+    cpu->isar.id_aa64mmfr2 = 0x0000000000001011ull;
+    cpu->isar.id_aa64pfr0  = 0x1100000010111112ull; /* GIC filled in later */
+    cpu->isar.id_aa64pfr1  = 0x0000000000000020ull;
+    cpu->id_afr0       = 0x00000000;
+    cpu->isar.id_dfr0  = 0x04010088;
+    cpu->isar.id_isar0 = 0x02101110;
+    cpu->isar.id_isar1 = 0x13112111;
+    cpu->isar.id_isar2 = 0x21232042;
+    cpu->isar.id_isar3 = 0x01112131;
+    cpu->isar.id_isar4 = 0x00010142;
+    cpu->isar.id_isar5 = 0x01011121;
+    cpu->isar.id_isar6 = 0x00000010;
+    cpu->isar.id_mmfr0 = 0x10201105;
+    cpu->isar.id_mmfr1 = 0x40000000;
+    cpu->isar.id_mmfr2 = 0x01260000;
+    cpu->isar.id_mmfr3 = 0x02122211;
+    cpu->isar.id_mmfr4 = 0x00021110;
+    cpu->isar.id_pfr0  = 0x10010131;
+    cpu->isar.id_pfr1  = 0x00010000; /* GIC filled in later */
+    cpu->isar.id_pfr2  = 0x00000011;
+    cpu->midr = 0x414fd0c1;          /* r4p1 */
+    cpu->revidr = 0;
+
+    /* From B2.23 CCSIDR_EL1 */
+    cpu->ccsidr[0] = 0x701fe01a; /* 64KB L1 dcache */
+    cpu->ccsidr[1] = 0x201fe01a; /* 64KB L1 icache */
+    cpu->ccsidr[2] = 0x70ffe03a; /* 1MB L2 cache */
+
+    /* From B2.98 SCTLR_EL3 */
+    cpu->reset_sctlr = 0x30c50838;
+
+    /* From B4.23 ICH_VTR_EL2 */
+    cpu->gic_num_lrs = 4;
+    cpu->gic_vpribits = 5;
+    cpu->gic_vprebits = 5;
+    cpu->gic_pribits = 5;
+
+    /* From B5.1 AdvSIMD AArch64 register summary */
+    cpu->isar.mvfr0 = 0x10110222;
+    cpu->isar.mvfr1 = 0x13211111;
+    cpu->isar.mvfr2 = 0x00000043;
+
+    /* From D5.1 AArch64 PMU register summary */
+    cpu->isar.reset_pmcr_el0 = 0x410c3000;
+
+    define_neoverse_n1_cp_reginfo(cpu);
+}
+
+/*
+ * -cpu max: a CPU with as many features enabled as our emulation supports.
+ * The version of '-cpu max' for qemu-system-arm is defined in cpu_tcg.c;
+ * this only needs to handle 64 bits.
+ */
+void aarch64_max_tcg_initfn(Object *obj)
+{
+    ARMCPU *cpu = ARM_CPU(obj);
+    uint64_t t;
+    uint32_t u;
+
+    /*
+     * Reset MIDR so the guest doesn't mistake our 'max' CPU type for a real
+     * one and try to apply errata workarounds or use impdef features we
+     * don't provide.
+     * An IMPLEMENTER field of 0 means "reserved for software use";
+     * ARCHITECTURE must be 0xf indicating "v7 or later, check ID registers
+     * to see which features are present";
+     * the VARIANT, PARTNUM and REVISION fields are all implementation
+     * defined and we choose to define PARTNUM just in case guest
+     * code needs to distinguish this QEMU CPU from other software
+     * implementations, though this shouldn't be needed.
+     */
+    t = FIELD_DP64(0, MIDR_EL1, IMPLEMENTER, 0);
+    t = FIELD_DP64(t, MIDR_EL1, ARCHITECTURE, 0xf);
+    t = FIELD_DP64(t, MIDR_EL1, PARTNUM, 'Q');
+    t = FIELD_DP64(t, MIDR_EL1, VARIANT, 0);
+    t = FIELD_DP64(t, MIDR_EL1, REVISION, 0);
+    cpu->midr = t;
+
+    /*
+     * We're going to set FEAT_S2FWB, which mandates that CLIDR_EL1.{LoUU,LoUIS}
+     * are zero.
+     */
+    u = cpu->clidr;
+    u = FIELD_DP32(u, CLIDR_EL1, LOUIS, 0);
+    u = FIELD_DP32(u, CLIDR_EL1, LOUU, 0);
+    cpu->clidr = u;
+
+    t = cpu->isar.id_aa64isar0;
+    t = FIELD_DP64(t, ID_AA64ISAR0, AES, 2);      /* FEAT_PMULL */
+    t = FIELD_DP64(t, ID_AA64ISAR0, SHA1, 1);     /* FEAT_SHA1 */
+    t = FIELD_DP64(t, ID_AA64ISAR0, SHA2, 2);     /* FEAT_SHA512 */
+    t = FIELD_DP64(t, ID_AA64ISAR0, CRC32, 1);
+    t = FIELD_DP64(t, ID_AA64ISAR0, ATOMIC, 2);   /* FEAT_LSE */
+    t = FIELD_DP64(t, ID_AA64ISAR0, RDM, 1);      /* FEAT_RDM */
+    t = FIELD_DP64(t, ID_AA64ISAR0, SHA3, 1);     /* FEAT_SHA3 */
+    t = FIELD_DP64(t, ID_AA64ISAR0, SM3, 1);      /* FEAT_SM3 */
+    t = FIELD_DP64(t, ID_AA64ISAR0, SM4, 1);      /* FEAT_SM4 */
+    t = FIELD_DP64(t, ID_AA64ISAR0, DP, 1);       /* FEAT_DotProd */
+    t = FIELD_DP64(t, ID_AA64ISAR0, FHM, 1);      /* FEAT_FHM */
+    t = FIELD_DP64(t, ID_AA64ISAR0, TS, 2);       /* FEAT_FlagM2 */
+    t = FIELD_DP64(t, ID_AA64ISAR0, TLB, 2);      /* FEAT_TLBIRANGE */
+    t = FIELD_DP64(t, ID_AA64ISAR0, RNDR, 1);     /* FEAT_RNG */
+    cpu->isar.id_aa64isar0 = t;
+
+    t = cpu->isar.id_aa64isar1;
+    t = FIELD_DP64(t, ID_AA64ISAR1, DPB, 2);      /* FEAT_DPB2 */
+    t = FIELD_DP64(t, ID_AA64ISAR1, JSCVT, 1);    /* FEAT_JSCVT */
+    t = FIELD_DP64(t, ID_AA64ISAR1, FCMA, 1);     /* FEAT_FCMA */
+    t = FIELD_DP64(t, ID_AA64ISAR1, LRCPC, 2);    /* FEAT_LRCPC2 */
+    t = FIELD_DP64(t, ID_AA64ISAR1, FRINTTS, 1);  /* FEAT_FRINTTS */
+    t = FIELD_DP64(t, ID_AA64ISAR1, SB, 1);       /* FEAT_SB */
+    t = FIELD_DP64(t, ID_AA64ISAR1, SPECRES, 1);  /* FEAT_SPECRES */
+    t = FIELD_DP64(t, ID_AA64ISAR1, BF16, 1);     /* FEAT_BF16 */
+    t = FIELD_DP64(t, ID_AA64ISAR1, DGH, 1);      /* FEAT_DGH */
+    t = FIELD_DP64(t, ID_AA64ISAR1, I8MM, 1);     /* FEAT_I8MM */
+    cpu->isar.id_aa64isar1 = t;
+
+    t = cpu->isar.id_aa64pfr0;
+    t = FIELD_DP64(t, ID_AA64PFR0, FP, 1);        /* FEAT_FP16 */
+    t = FIELD_DP64(t, ID_AA64PFR0, ADVSIMD, 1);   /* FEAT_FP16 */
+    t = FIELD_DP64(t, ID_AA64PFR0, RAS, 2);       /* FEAT_RASv1p1 + FEAT_DoubleFault */
+    t = FIELD_DP64(t, ID_AA64PFR0, SVE, 1);
+    t = FIELD_DP64(t, ID_AA64PFR0, SEL2, 1);      /* FEAT_SEL2 */
+    t = FIELD_DP64(t, ID_AA64PFR0, DIT, 1);       /* FEAT_DIT */
+    t = FIELD_DP64(t, ID_AA64PFR0, CSV2, 2);      /* FEAT_CSV2_2 */
+    t = FIELD_DP64(t, ID_AA64PFR0, CSV3, 1);      /* FEAT_CSV3 */
+    cpu->isar.id_aa64pfr0 = t;
+
+    t = cpu->isar.id_aa64pfr1;
+    t = FIELD_DP64(t, ID_AA64PFR1, BT, 1);        /* FEAT_BTI */
+    t = FIELD_DP64(t, ID_AA64PFR1, SSBS, 2);      /* FEAT_SSBS2 */
+    /*
+     * Begin with full support for MTE. This will be downgraded to MTE=0
+     * during realize if the board provides no tag memory, much like
+     * we do for EL2 with the virtualization=on property.
+     */
+    t = FIELD_DP64(t, ID_AA64PFR1, MTE, 3);       /* FEAT_MTE3 */
+    t = FIELD_DP64(t, ID_AA64PFR1, RAS_FRAC, 0);  /* FEAT_RASv1p1 + FEAT_DoubleFault */
+    t = FIELD_DP64(t, ID_AA64PFR1, SME, 1);       /* FEAT_SME */
+    t = FIELD_DP64(t, ID_AA64PFR1, CSV2_FRAC, 0); /* FEAT_CSV2_2 */
+    cpu->isar.id_aa64pfr1 = t;
+
+    t = cpu->isar.id_aa64mmfr0;
+    t = FIELD_DP64(t, ID_AA64MMFR0, PARANGE, 6); /* FEAT_LPA: 52 bits */
+    t = FIELD_DP64(t, ID_AA64MMFR0, TGRAN16, 1);   /* 16k pages supported */
+    t = FIELD_DP64(t, ID_AA64MMFR0, TGRAN16_2, 2); /* 16k stage2 supported */
+    t = FIELD_DP64(t, ID_AA64MMFR0, TGRAN64_2, 2); /* 64k stage2 supported */
+    t = FIELD_DP64(t, ID_AA64MMFR0, TGRAN4_2, 2);  /*  4k stage2 supported */
+    t = FIELD_DP64(t, ID_AA64MMFR0, FGT, 1);       /* FEAT_FGT */
+    cpu->isar.id_aa64mmfr0 = t;
+
+    t = cpu->isar.id_aa64mmfr1;
+    t = FIELD_DP64(t, ID_AA64MMFR1, HAFDBS, 2);   /* FEAT_HAFDBS */
+    t = FIELD_DP64(t, ID_AA64MMFR1, VMIDBITS, 2); /* FEAT_VMID16 */
+    t = FIELD_DP64(t, ID_AA64MMFR1, VH, 1);       /* FEAT_VHE */
+    t = FIELD_DP64(t, ID_AA64MMFR1, HPDS, 1);     /* FEAT_HPDS */
+    t = FIELD_DP64(t, ID_AA64MMFR1, LO, 1);       /* FEAT_LOR */
+    t = FIELD_DP64(t, ID_AA64MMFR1, PAN, 3);      /* FEAT_PAN3 */
+    t = FIELD_DP64(t, ID_AA64MMFR1, XNX, 1);      /* FEAT_XNX */
+    t = FIELD_DP64(t, ID_AA64MMFR1, ETS, 1);      /* FEAT_ETS */
+    t = FIELD_DP64(t, ID_AA64MMFR1, HCX, 1);      /* FEAT_HCX */
+    cpu->isar.id_aa64mmfr1 = t;
+
+    t = cpu->isar.id_aa64mmfr2;
+    t = FIELD_DP64(t, ID_AA64MMFR2, CNP, 1);      /* FEAT_TTCNP */
+    t = FIELD_DP64(t, ID_AA64MMFR2, UAO, 1);      /* FEAT_UAO */
+    t = FIELD_DP64(t, ID_AA64MMFR2, IESB, 1);     /* FEAT_IESB */
+    t = FIELD_DP64(t, ID_AA64MMFR2, VARANGE, 1);  /* FEAT_LVA */
+    t = FIELD_DP64(t, ID_AA64MMFR2, ST, 1);       /* FEAT_TTST */
+    t = FIELD_DP64(t, ID_AA64MMFR2, IDS, 1);      /* FEAT_IDST */
+    t = FIELD_DP64(t, ID_AA64MMFR2, FWB, 1);      /* FEAT_S2FWB */
+    t = FIELD_DP64(t, ID_AA64MMFR2, TTL, 1);      /* FEAT_TTL */
+    t = FIELD_DP64(t, ID_AA64MMFR2, BBM, 2);      /* FEAT_BBM at level 2 */
+    t = FIELD_DP64(t, ID_AA64MMFR2, EVT, 2);      /* FEAT_EVT */
+    t = FIELD_DP64(t, ID_AA64MMFR2, E0PD, 1);     /* FEAT_E0PD */
+    cpu->isar.id_aa64mmfr2 = t;
+
+    t = cpu->isar.id_aa64zfr0;
+    t = FIELD_DP64(t, ID_AA64ZFR0, SVEVER, 1);
+    t = FIELD_DP64(t, ID_AA64ZFR0, AES, 2);       /* FEAT_SVE_PMULL128 */
+    t = FIELD_DP64(t, ID_AA64ZFR0, BITPERM, 1);   /* FEAT_SVE_BitPerm */
+    t = FIELD_DP64(t, ID_AA64ZFR0, BFLOAT16, 1);  /* FEAT_BF16 */
+    t = FIELD_DP64(t, ID_AA64ZFR0, SHA3, 1);      /* FEAT_SVE_SHA3 */
+    t = FIELD_DP64(t, ID_AA64ZFR0, SM4, 1);       /* FEAT_SVE_SM4 */
+    t = FIELD_DP64(t, ID_AA64ZFR0, I8MM, 1);      /* FEAT_I8MM */
+    t = FIELD_DP64(t, ID_AA64ZFR0, F32MM, 1);     /* FEAT_F32MM */
+    t = FIELD_DP64(t, ID_AA64ZFR0, F64MM, 1);     /* FEAT_F64MM */
+    cpu->isar.id_aa64zfr0 = t;
+
+    t = cpu->isar.id_aa64dfr0;
+    t = FIELD_DP64(t, ID_AA64DFR0, DEBUGVER, 9);  /* FEAT_Debugv8p4 */
+    t = FIELD_DP64(t, ID_AA64DFR0, PMUVER, 6);    /* FEAT_PMUv3p5 */
+    cpu->isar.id_aa64dfr0 = t;
+
+    t = cpu->isar.id_aa64smfr0;
+    t = FIELD_DP64(t, ID_AA64SMFR0, F32F32, 1);   /* FEAT_SME */
+    t = FIELD_DP64(t, ID_AA64SMFR0, B16F32, 1);   /* FEAT_SME */
+    t = FIELD_DP64(t, ID_AA64SMFR0, F16F32, 1);   /* FEAT_SME */
+    t = FIELD_DP64(t, ID_AA64SMFR0, I8I32, 0xf);  /* FEAT_SME */
+    t = FIELD_DP64(t, ID_AA64SMFR0, F64F64, 1);   /* FEAT_SME_F64F64 */
+    t = FIELD_DP64(t, ID_AA64SMFR0, I16I64, 0xf); /* FEAT_SME_I16I64 */
+    t = FIELD_DP64(t, ID_AA64SMFR0, FA64, 1);     /* FEAT_SME_FA64 */
+    cpu->isar.id_aa64smfr0 = t;
+
+    /* Replicate the same data to the 32-bit id registers.  */
+    aa32_max_features(cpu);
+
+#ifdef CONFIG_USER_ONLY
+    /*
+     * For usermode -cpu max we can use a larger and more efficient DCZ
+     * blocksize since we don't have to follow what the hardware does.
+     */
+    cpu->ctr = 0x80038003; /* 32 byte I and D cacheline size, VIPT icache */
+    cpu->dcz_blocksize = 7; /*  512 bytes */
+#endif
+
+    cpu->sve_vq.supported = MAKE_64BIT_MASK(0, ARM_MAX_VQ);
+    cpu->sme_vq.supported = SVE_VQ_POW2_MAP;
+
+    aarch64_add_pauth_properties(obj);
+    aarch64_add_sve_properties(obj);
+    aarch64_add_sme_properties(obj);
+    object_property_add(obj, "sve-max-vq", "uint32", cpu_max_get_sve_max_vq,
+                        cpu_max_set_sve_max_vq, NULL, NULL);
+    qdev_property_add_static(DEVICE(obj), &arm_cpu_lpa2_property);
+}
+
+static const ARMCPUInfo aarch64_cpus[] = {
+    { .name = "cortex-a35",         .initfn = aarch64_a35_initfn },
+    { .name = "cortex-a55",         .initfn = aarch64_a55_initfn },
+    { .name = "cortex-a72",         .initfn = aarch64_a72_initfn },
+    { .name = "cortex-a76",         .initfn = aarch64_a76_initfn },
+    { .name = "a64fx",              .initfn = aarch64_a64fx_initfn },
+    { .name = "neoverse-n1",        .initfn = aarch64_neoverse_n1_initfn },
+};
+
+static void aarch64_cpu_register_types(void)
+{
+    size_t i;
+
+    for (i = 0; i < ARRAY_SIZE(aarch64_cpus); ++i) {
+        aarch64_cpu_register(&aarch64_cpus[i]);
+    }
+}
+
+type_init(aarch64_cpu_register_types)
diff --git a/target/arm/tcg/meson.build b/target/arm/tcg/meson.build
index d27e76af6c..128f782816 100644
--- a/target/arm/tcg/meson.build
+++ b/target/arm/tcg/meson.build
@@ -35,6 +35,7 @@ arm_ss.add(files(
 ))
 
 arm_ss.add(when: 'TARGET_AARCH64', if_true: files(
+  'cpu64.c',
   'translate-a64.c',
   'translate-sve.c',
   'translate-sme.c',
-- 
2.35.3


