Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E3CF65C642
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Jan 2023 19:28:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pClrb-00009D-Vt; Tue, 03 Jan 2023 13:18:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pClqr-0008Ig-Ob
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 13:17:40 -0500
Received: from mail-vk1-xa2b.google.com ([2607:f8b0:4864:20::a2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pClqp-0005Dd-Hc
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 13:17:29 -0500
Received: by mail-vk1-xa2b.google.com with SMTP id i32so9064913vkr.12
 for <qemu-devel@nongnu.org>; Tue, 03 Jan 2023 10:17:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TF6WRrkDyTJgx1M6YcuNUMdyG++qDPJUqtoWjJFxRL0=;
 b=y0JuM+N+f/Hd8F57ouZx9FQ/H1C2SdE/yfbdFioFjlBvfmdX3cGPQbN4Rih6w+XifV
 nOAuXXU75vl+2K0YJeu3ItYo0TFFVgwngb0vt3UD13B+4FnhyGh0DV38NkWhnhGibQan
 ZsKfIjb6+MCgwvgTBWNP62wPqY95/IeaDGGnlSD2PIEahNjELttedv939ZfYwVU9mjwS
 evhxuENGECzbW9RTFM4BIgWMLpAR5DZc+3HFEd7f+zT7vIegbLIOhC4krH/oI6ALi+Ma
 QVz/60On0SwsF7mFaBBhmPtvmaFOBftSxeJe9asv88lRSB6IkViVuZrSzXAsGayBEBuK
 pNsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TF6WRrkDyTJgx1M6YcuNUMdyG++qDPJUqtoWjJFxRL0=;
 b=8DbQh/jX/2/QeriUFxEGilYkkuxiNrKjifLCydVFdY+fp2rTjZG/Aolh7LwlAlgCzj
 PIWoXALpr4lHn4qL/Ah2ny50awDneuhHPhYONBeeju+I+DLc8M8+1ArW8A81i/0915Rp
 x88vDlP6GXSUkh3G1CWIczTxptyA8lUy2QXdoSuPMPKMcPCJAcs0SeVq2e17XGLWxPi0
 fPB5jIKPhjkrM082H4+LRTR41VcqlE+YBg5jRl/mxIWUUvpJuveJkY7TBuG30kYOHGHe
 VlyKh7rmHlRgpIO2ada0/BnZHwVmIMqLliptgZ+mzIKfASNKqwpCcDCe9DYkKCmrnlgY
 FGcA==
X-Gm-Message-State: AFqh2krERelBu8StWCbjX96g0Z2APoaAckl6w3vWbcHa9Nv0ALeetvDm
 jlaARAXoMR85hnT84UMD5GplKp2crHTtG5lZroc=
X-Google-Smtp-Source: AMrXdXu6dJKn2tJbpue4xVKov0GKS14dm/EbCMwn5DXHYwdPNq1lr9BTNoo9SEX0NFWfUMXBdJ+KKA==
X-Received: by 2002:a1f:2186:0:b0:3d5:53dc:2a91 with SMTP id
 h128-20020a1f2186000000b003d553dc2a91mr13637348vkh.14.1672769846028; 
 Tue, 03 Jan 2023 10:17:26 -0800 (PST)
Received: from stoup.. ([2607:fb90:8060:51a2:184b:6e49:c396:be2])
 by smtp.gmail.com with ESMTPSA id
 v2-20020a05620a440200b006fed2788751sm23042354qkp.76.2023.01.03.10.17.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Jan 2023 10:17:25 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, berrange@redhat.com, eduardo@habkost.net,
 armbru@redhat.com, ajones@ventanamicro.com, alex.bennee@linaro.org
Subject: [RFC PATCH 12/40] target/arm: Copy isar and friends from ARMCPUClass
Date: Tue,  3 Jan 2023 10:16:18 -0800
Message-Id: <20230103181646.55711-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230103181646.55711-1-richard.henderson@linaro.org>
References: <20230103181646.55711-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2b;
 envelope-from=richard.henderson@linaro.org; helo=mail-vk1-xa2b.google.com
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

Create a block of cpregs in ARMCPUClass and copy to the instance in
arm_cpu_init.  Settings of these values will come in a future patch.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu-qom.h | 98 ++++++++++++++++++++++++++++++++++++++++++++
 target/arm/cpu.h     | 43 ++-----------------
 target/arm/cpu.c     | 28 ++++++++++++-
 3 files changed, 128 insertions(+), 41 deletions(-)

diff --git a/target/arm/cpu-qom.h b/target/arm/cpu-qom.h
index ac58cc3a87..832b2cccf9 100644
--- a/target/arm/cpu-qom.h
+++ b/target/arm/cpu-qom.h
@@ -56,6 +56,45 @@ static inline void aarch64_cpu_register(const ARMCPUInfo *info)
     arm_cpu_register_parent(info, TYPE_AARCH64_CPU);
 }
 
+typedef struct ARMISARegisters {
+    uint32_t id_isar0;
+    uint32_t id_isar1;
+    uint32_t id_isar2;
+    uint32_t id_isar3;
+    uint32_t id_isar4;
+    uint32_t id_isar5;
+    uint32_t id_isar6;
+    uint32_t id_mmfr0;
+    uint32_t id_mmfr1;
+    uint32_t id_mmfr2;
+    uint32_t id_mmfr3;
+    uint32_t id_mmfr4;
+    uint32_t id_mmfr5;
+    uint32_t id_pfr0;
+    uint32_t id_pfr1;
+    uint32_t id_pfr2;
+    uint32_t mvfr0;
+    uint32_t mvfr1;
+    uint32_t mvfr2;
+    uint32_t id_dfr0;
+    uint32_t id_dfr1;
+    uint32_t dbgdidr;
+    uint32_t dbgdevid;
+    uint32_t dbgdevid1;
+    uint64_t id_aa64isar0;
+    uint64_t id_aa64isar1;
+    uint64_t id_aa64pfr0;
+    uint64_t id_aa64pfr1;
+    uint64_t id_aa64mmfr0;
+    uint64_t id_aa64mmfr1;
+    uint64_t id_aa64mmfr2;
+    uint64_t id_aa64dfr0;
+    uint64_t id_aa64dfr1;
+    uint64_t id_aa64zfr0;
+    uint64_t id_aa64smfr0;
+    uint64_t reset_pmcr_el0;
+} ARMISARegisters;
+
 /**
  * ARMCPUClass:
  * @parent_realize: The parent class' realize handler.
@@ -77,6 +116,65 @@ struct ARMCPUClass {
 
     /* Internal CPU feature flags.  */
     uint64_t features;
+
+    /*
+     * The instance init functions for implementation-specific subclasses
+     * set these fields to specify the implementation-dependent values of
+     * various constant registers and reset values of non-constant
+     * registers.
+     * Some of these might become QOM properties eventually.
+     * Field names match the official register names as defined in the
+     * ARMv7AR ARM Architecture Reference Manual. A reset_ prefix
+     * is used for reset values of non-constant registers; no reset_
+     * prefix means a constant register.
+     * Some of these registers are split out into a substructure that
+     * is shared with the translators to control the ISA.
+     *
+     * Note that if you add an ID register to the ARMISARegisters struct
+     * you need to also update the 32-bit and 64-bit versions of the
+     * kvm_arm_get_host_cpu_features() function to correctly populate the
+     * field by reading the value from the KVM vCPU.
+     */
+    ARMISARegisters isar;
+
+    uint64_t midr;
+    uint64_t ctr;
+    uint64_t pmceid0;
+    uint64_t pmceid1;
+    uint64_t id_aa64afr0;
+    uint64_t id_aa64afr1;
+    uint64_t clidr;
+    /*
+     * The elements of this array are the CCSIDR values for each cache,
+     * in the order L1DCache, L1ICache, L2DCache, L2ICache, etc.
+     */
+    uint64_t ccsidr[16];
+
+    uint32_t revidr;
+    uint32_t id_afr0;
+    uint32_t reset_fpsid;
+    uint32_t reset_sctlr;
+    uint32_t reset_auxcr;
+
+    /* PMSAv7 MPU number of supported regions */
+    uint32_t pmsav7_dregion;
+    /* v8M SAU number of supported regions */
+    uint32_t sau_sregion;
+
+    /* DCZ blocksize, in log_2(words), ie low 4 bits of DCZID_EL0 */
+    uint32_t dcz_blocksize;
+
+    /* Configurable aspects of GIC cpu interface (which is part of the CPU) */
+    int gic_num_lrs; /* number of list registers */
+    int gic_vpribits; /* number of virtual priority bits */
+    int gic_vprebits; /* number of virtual preemption bits */
+    int gic_pribits; /* number of physical priority bits */
+
+    /*
+     * [QEMU_]KVM_ARM_TARGET_* constant for this CPU, or
+     * QEMU_KVM_ARM_TARGET_NONE if the kernel doesn't support this CPU type.
+     */
+    uint32_t kvm_target;
 };
 
 static inline int arm_class_feature(ARMCPUClass *acc, int feature)
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 3ac650092f..2d9bddf197 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -799,8 +799,6 @@ typedef enum ARMPSCIState {
     PSCI_ON_PENDING = 2
 } ARMPSCIState;
 
-typedef struct ARMISARegisters ARMISARegisters;
-
 /*
  * In map, each set bit is a supported vector length of (bit-number + 1) * 16
  * bytes, i.e. each bit number + 1 is the vector length in quadwords.
@@ -967,44 +965,7 @@ struct ArchCPU {
      * kvm_arm_get_host_cpu_features() function to correctly populate the
      * field by reading the value from the KVM vCPU.
      */
-    struct ARMISARegisters {
-        uint32_t id_isar0;
-        uint32_t id_isar1;
-        uint32_t id_isar2;
-        uint32_t id_isar3;
-        uint32_t id_isar4;
-        uint32_t id_isar5;
-        uint32_t id_isar6;
-        uint32_t id_mmfr0;
-        uint32_t id_mmfr1;
-        uint32_t id_mmfr2;
-        uint32_t id_mmfr3;
-        uint32_t id_mmfr4;
-        uint32_t id_mmfr5;
-        uint32_t id_pfr0;
-        uint32_t id_pfr1;
-        uint32_t id_pfr2;
-        uint32_t mvfr0;
-        uint32_t mvfr1;
-        uint32_t mvfr2;
-        uint32_t id_dfr0;
-        uint32_t id_dfr1;
-        uint32_t dbgdidr;
-        uint32_t dbgdevid;
-        uint32_t dbgdevid1;
-        uint64_t id_aa64isar0;
-        uint64_t id_aa64isar1;
-        uint64_t id_aa64pfr0;
-        uint64_t id_aa64pfr1;
-        uint64_t id_aa64mmfr0;
-        uint64_t id_aa64mmfr1;
-        uint64_t id_aa64mmfr2;
-        uint64_t id_aa64dfr0;
-        uint64_t id_aa64dfr1;
-        uint64_t id_aa64zfr0;
-        uint64_t id_aa64smfr0;
-        uint64_t reset_pmcr_el0;
-    } isar;
+    ARMISARegisters isar;
     uint64_t midr;
     uint32_t revidr;
     uint32_t reset_fpsid;
@@ -4346,5 +4307,7 @@ static inline bool isar_feature_any_evt(const ARMISARegisters *id)
  */
 #define cpu_isar_feature(name, cpu) \
     ({ ARMCPU *cpu_ = (cpu); isar_feature_##name(&cpu_->isar); })
+#define class_isar_feature(name, acc) \
+    ({ ARMCPUClass *acc_ = (acc); isar_feature_##name(&acc_->isar); })
 
 #endif
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index d64b86b6a5..8463c45d87 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1192,6 +1192,32 @@ static void arm_cpu_initfn(Object *obj)
 
     cpu->dtb_compatible = acc->dtb_compatible;
     cpu->env.features = acc->features;
+    cpu->isar = acc->isar;
+
+    cpu->midr = acc->midr;
+    cpu->ctr = acc->ctr;
+    cpu->pmceid0 = acc->pmceid0;
+    cpu->pmceid1 = acc->pmceid1;
+    cpu->id_aa64afr0 = acc->id_aa64afr0;
+    cpu->id_aa64afr1 = acc->id_aa64afr1;
+    cpu->clidr = acc->clidr;
+
+    QEMU_BUILD_BUG_ON(sizeof(cpu->ccsidr) != sizeof(acc->ccsidr));
+    memcpy(cpu->ccsidr, acc->ccsidr, sizeof(acc->ccsidr));
+
+    cpu->revidr = acc->revidr;
+    cpu->id_afr0 = acc->id_afr0;
+    cpu->reset_fpsid = acc->reset_fpsid;
+    cpu->reset_sctlr = acc->reset_sctlr;
+    cpu->reset_auxcr = acc->reset_auxcr;
+    cpu->pmsav7_dregion = acc->pmsav7_dregion;
+    cpu->sau_sregion = acc->sau_sregion;
+    cpu->dcz_blocksize = acc->dcz_blocksize;
+    cpu->gic_num_lrs = acc->gic_num_lrs;
+    cpu->gic_vpribits = acc->gic_vpribits;
+    cpu->gic_vprebits = acc->gic_vprebits;
+    cpu->gic_pribits = acc->gic_pribits;
+    cpu->kvm_target = acc->kvm_target;
 
 #ifdef CONFIG_USER_ONLY
 # ifdef TARGET_AARCH64
@@ -1225,7 +1251,6 @@ static void arm_cpu_initfn(Object *obj)
 #endif
 
     cpu->psci_version = QEMU_PSCI_VERSION_0_1; /* By default assume PSCI v0.1 */
-    cpu->kvm_target = QEMU_KVM_ARM_TARGET_NONE;
 
     if (tcg_enabled() || hvf_enabled()) {
         /* TCG and HVF implement PSCI 1.1 */
@@ -2249,6 +2274,7 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
      * picky DTB consumer will also provide a helpful error message.
      */
     acc->dtb_compatible = "qemu,unknown";
+    acc->kvm_target = QEMU_KVM_ARM_TARGET_NONE;
 }
 
 static void arm_cpu_leaf_class_init(ObjectClass *oc, void *data)
-- 
2.34.1


