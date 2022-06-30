Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6639B562367
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jun 2022 21:48:00 +0200 (CEST)
Received: from localhost ([::1]:48148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o708t-0006i7-E9
	for lists+qemu-devel@lfdr.de; Thu, 30 Jun 2022 15:47:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o702f-00031t-61
 for qemu-devel@nongnu.org; Thu, 30 Jun 2022 15:41:33 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:44611)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o702Y-0005ht-Tx
 for qemu-devel@nongnu.org; Thu, 30 Jun 2022 15:41:32 -0400
Received: by mail-wr1-x431.google.com with SMTP id i1so39185wrb.11
 for <qemu-devel@nongnu.org>; Thu, 30 Jun 2022 12:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=ahC5lT6iTXSDW+ViPehdtBvZE2IkaR7EsRwDpZjYPrA=;
 b=FFtBUT7KcLSVGVTFx3yqfW55pZKUltEo1KM/XlYBNKUEqLWy2QRFIAUWcv+bRjxGFc
 sBJa13FB11zKIkrh2TXA+WVryDhpCoN9AXljKnz654G9GPsdvH1Djqtl0mZ0ebUifL0e
 OoTqzrju8ox+4CPbCEE+ZHph7xPK+S+kAOq4YVnl8IAZVcDqTofNimVhhXFkaUIBuRRt
 NjY5P4P2iB6+d3RJj32/AW5+5jqAnrM0WXietW+QIFE8prQB8LUsNxLdBFdR4ijPpezP
 gkFpX+FcqHriS1aKc+X32W1H7xlhjchM3+ZOOzSDg1zITCrEneydZfgQZh3z4TNaFsHS
 Xf3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ahC5lT6iTXSDW+ViPehdtBvZE2IkaR7EsRwDpZjYPrA=;
 b=cO+roZ/Sgt/P23tErTHiV0SuitNLsCAnFqrnde0Me6CROArAG4ITVXg7N35v/FUtrd
 DOszS+1sANphcPEZ+B90Ep34/K8hsto5W2MQE9EiOdA3+L3cE8lGY2h1gT0GqCIIipE2
 cE0IHuFjC0w/BqyDvCXc2u75R4U9lDl1/mPFYnUilB+RTlTXEuf5FgqSIKxIo/a2QnKo
 K/rggTcFbNTiViSxMmli918HE+dUjh8/H3D3/isWa6V9YykZkabSgNZXGce3Jx3dDEC5
 W72Aj8SQS7Ya4gMmf98Lc4Q0iyW+t9ZqAV6IsUHkzzs1drjGp2S7jrwvouUY17pkEImR
 WLPQ==
X-Gm-Message-State: AJIora/NDc0VrPSGf0z0VVSwKrszL69+P/Txdwp05J9huojnJ7o+oszd
 SjmX+tfxNRhD3VyB5go8j02lWQ==
X-Google-Smtp-Source: AGRyM1u6ks7AyVJbOyZ8pJjfDyLj8QtRPumVpIhImtlNo6hm6I1baCy3gedpCK5pOA/duRyQxB3+Hw==
X-Received: by 2002:adf:decc:0:b0:21b:8915:36da with SMTP id
 i12-20020adfdecc000000b0021b891536damr9949665wrn.261.1656618085516; 
 Thu, 30 Jun 2022 12:41:25 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 m2-20020adffa02000000b0021d163daeb0sm13200228wrr.108.2022.06.30.12.41.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jun 2022 12:41:25 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 4/5] target/arm: Implement AArch32 DBGDEVID, DBGDEVID1,
 DBGDEVID2
Date: Thu, 30 Jun 2022 20:41:15 +0100
Message-Id: <20220630194116.3438513-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220630194116.3438513-1-peter.maydell@linaro.org>
References: <20220630194116.3438513-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Starting with v7 of the debug architecture, there are three extra
ID registers that add information on top of that provided in
DBGDIDR. These are DBGDEVID, DBGDEVID1 and DBGDEVID2. In the
v7 debug architecture, DBGDEVID is optional, present only of
DBGDIDR.DEVID_imp is set. In v7.1 all three must be present.

Implement the missing registers.  Note that we only need to set the
values in the ARMISARegisters struct for the CPUs Cortex-A7, A15,
A53, A57 and A72 (plus the 32-bit 'max' which uses the Cortex-A53
values): earlier CPUs didn't implement v7 of the architecture, and
our other 64-bit CPUs (Cortex-A76, Neoverse-N1 and A64fx) don't have
AArch32 support at EL1.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Clearly no guest code users care about is trying to read these
registers, or they'd have noticed the UNDEFs. But the AArch32
indicator that Feat_DoubleLock is present is in DBGDEVID, so
I want it in ARMISARegisters so I can test against it.
---
 target/arm/cpu.h          |  7 +++++++
 target/arm/cpu64.c        |  6 ++++++
 target/arm/cpu_tcg.c      |  6 ++++++
 target/arm/debug_helper.c | 36 ++++++++++++++++++++++++++++++++++++
 4 files changed, 55 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 4a4342f2622..c533ad0b64d 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -988,6 +988,8 @@ struct ArchCPU {
         uint32_t mvfr2;
         uint32_t id_dfr0;
         uint32_t dbgdidr;
+        uint32_t dbgdevid;
+        uint32_t dbgdevid1;
         uint64_t id_aa64isar0;
         uint64_t id_aa64isar1;
         uint64_t id_aa64pfr0;
@@ -3719,6 +3721,11 @@ static inline bool isar_feature_aa32_ssbs(const ARMISARegisters *id)
     return FIELD_EX32(id->id_pfr2, ID_PFR2, SSBS) != 0;
 }
 
+static inline bool isar_feature_aa32_debugv7p1(const ARMISARegisters *id)
+{
+    return FIELD_EX32(id->id_dfr0, ID_DFR0, COPDBG) >= 5;
+}
+
 static inline bool isar_feature_aa32_debugv8p2(const ARMISARegisters *id)
 {
     return FIELD_EX32(id->id_dfr0, ID_DFR0, COPDBG) >= 8;
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 19188d6cc2a..b4fd4b7ec87 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -79,6 +79,8 @@ static void aarch64_a57_initfn(Object *obj)
     cpu->isar.id_aa64isar0 = 0x00011120;
     cpu->isar.id_aa64mmfr0 = 0x00001124;
     cpu->isar.dbgdidr = 0x3516d000;
+    cpu->isar.dbgdevid = 0x01110f13;
+    cpu->isar.dbgdevid1 = 0x2;
     cpu->isar.reset_pmcr_el0 = 0x41013000;
     cpu->clidr = 0x0a200023;
     cpu->ccsidr[0] = 0x701fe00a; /* 32KB L1 dcache */
@@ -134,6 +136,8 @@ static void aarch64_a53_initfn(Object *obj)
     cpu->isar.id_aa64isar0 = 0x00011120;
     cpu->isar.id_aa64mmfr0 = 0x00001122; /* 40 bit physical addr */
     cpu->isar.dbgdidr = 0x3516d000;
+    cpu->isar.dbgdevid = 0x00110f13;
+    cpu->isar.dbgdevid1 = 0x1;
     cpu->isar.reset_pmcr_el0 = 0x41033000;
     cpu->clidr = 0x0a200023;
     cpu->ccsidr[0] = 0x700fe01a; /* 32KB L1 dcache */
@@ -187,6 +191,8 @@ static void aarch64_a72_initfn(Object *obj)
     cpu->isar.id_aa64isar0 = 0x00011120;
     cpu->isar.id_aa64mmfr0 = 0x00001124;
     cpu->isar.dbgdidr = 0x3516d000;
+    cpu->isar.dbgdevid = 0x01110f13;
+    cpu->isar.dbgdevid1 = 0x2;
     cpu->isar.reset_pmcr_el0 = 0x41023000;
     cpu->clidr = 0x0a200023;
     cpu->ccsidr[0] = 0x701fe00a; /* 32KB L1 dcache */
diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index b751a19c8a7..3099b38e32b 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -563,6 +563,8 @@ static void cortex_a7_initfn(Object *obj)
     cpu->isar.id_isar3 = 0x11112131;
     cpu->isar.id_isar4 = 0x10011142;
     cpu->isar.dbgdidr = 0x3515f005;
+    cpu->isar.dbgdevid = 0x01110f13;
+    cpu->isar.dbgdevid1 = 0x1;
     cpu->clidr = 0x0a200023;
     cpu->ccsidr[0] = 0x701fe00a; /* 32K L1 dcache */
     cpu->ccsidr[1] = 0x201fe00a; /* 32K L1 icache */
@@ -606,6 +608,8 @@ static void cortex_a15_initfn(Object *obj)
     cpu->isar.id_isar3 = 0x11112131;
     cpu->isar.id_isar4 = 0x10011142;
     cpu->isar.dbgdidr = 0x3515f021;
+    cpu->isar.dbgdevid = 0x01110f13;
+    cpu->isar.dbgdevid1 = 0x0;
     cpu->clidr = 0x0a200023;
     cpu->ccsidr[0] = 0x701fe00a; /* 32K L1 dcache */
     cpu->ccsidr[1] = 0x201fe00a; /* 32K L1 icache */
@@ -1098,6 +1102,8 @@ static void arm_max_initfn(Object *obj)
     cpu->isar.id_isar5 = 0x00011121;
     cpu->isar.id_isar6 = 0;
     cpu->isar.dbgdidr = 0x3516d000;
+    cpu->isar.dbgdevid = 0x00110f13;
+    cpu->isar.dbgdevid1 = 0x2;
     cpu->isar.reset_pmcr_el0 = 0x41013000;
     cpu->clidr = 0x0a200023;
     cpu->ccsidr[0] = 0x701fe00a; /* 32KB L1 dcache */
diff --git a/target/arm/debug_helper.c b/target/arm/debug_helper.c
index 691b9b74c4a..e96a4ffd28d 100644
--- a/target/arm/debug_helper.c
+++ b/target/arm/debug_helper.c
@@ -999,6 +999,42 @@ void define_debug_regs(ARMCPU *cpu)
         define_one_arm_cp_reg(cpu, &dbgdidr);
     }
 
+    /*
+     * DBGDEVID is present in the v7 debug architecture if
+     * DBGDIDR.DEVID_imp is 1 (bit 15); from v7.1 and on it is
+     * mandatory (and bit 15 is RES1). DBGDEVID1 and DBGDEVID2 exist
+     * from v7.1 of the debug architecture. Because no fields have yet
+     * been defined in DBGDEVID2 (and quite possibly none will ever
+     * be) we don't define an ARMISARegisters field for it.
+     * These registers exist only if EL1 can use AArch32, but that
+     * happens naturally because they are only PL1 accessible anyway.
+     */
+    if (extract32(cpu->isar.dbgdidr, 15, 1)) {
+        ARMCPRegInfo dbgdevid = {
+            .name = "DBGDEVID",
+            .cp = 14, .opc1 = 0, .crn = 7, .opc2 = 2, .crn = 7,
+            .access = PL1_R, .accessfn = access_tda,
+            .type = ARM_CP_CONST, .resetvalue = cpu->isar.dbgdevid,
+        };
+        define_one_arm_cp_reg(cpu, &dbgdevid);
+    }
+    if (cpu_isar_feature(aa32_debugv7p1, cpu)) {
+        ARMCPRegInfo dbgdevid12[] = {
+            {
+                .name = "DBGDEVID1",
+                .cp = 14, .opc1 = 0, .crn = 7, .opc2 = 1, .crn = 7,
+                .access = PL1_R, .accessfn = access_tda,
+                .type = ARM_CP_CONST, .resetvalue = cpu->isar.dbgdevid1,
+            }, {
+                .name = "DBGDEVID2",
+                .cp = 14, .opc1 = 0, .crn = 7, .opc2 = 0, .crn = 7,
+                .access = PL1_R, .accessfn = access_tda,
+                .type = ARM_CP_CONST, .resetvalue = 0,
+            },
+        };
+        define_arm_cp_regs(cpu, dbgdevid12);
+    }
+
     brps = arm_num_brps(cpu);
     wrps = arm_num_wrps(cpu);
     ctx_cmps = arm_num_ctx_cmps(cpu);
-- 
2.25.1


