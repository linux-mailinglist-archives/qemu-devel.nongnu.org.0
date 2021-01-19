Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90FB92FBAF5
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 16:22:14 +0100 (CET)
Received: from localhost ([::1]:51274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1sph-0003We-K4
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 10:22:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1sfF-0007e9-LG
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 10:11:25 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:39573)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1sf7-0001DE-Rp
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 10:11:25 -0500
Received: by mail-wm1-x32c.google.com with SMTP id u14so56422wmq.4
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 07:11:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=ydICPbhRKi9FJu+UXscVi4AXOo5YcQav2kdyz8F943Q=;
 b=SanGO4UXkCkhXHYZaW1TYiUDMAi1wXYTYFdDBfSuhfGCeWBwwAzgxxVjf+SGgNZ7zs
 O05vcqzg90SjMakGSuEaGndmuv/NxDtifGwL3ZUrQC4R5NAWhWOnLX2ra3gPmrVuSQAU
 0TURd693EY6GmRRajWcj43m1S+neWHB1AD5hAYZ0HvscMSFY4K14L4oB0Qq7l8QxtMSP
 tnvDh2lmKm7Qc6qVLLqRudMdQ7tMP2GIRacK6EsmyVjtn2aagaS4aiPsfRuP99qc7jsN
 unmoCaRG/YooBPVFpewJ8ribbfmxDtXz14dDeFuYkHtORyJy5pvWmeMD83w6FUA8WLef
 pOmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ydICPbhRKi9FJu+UXscVi4AXOo5YcQav2kdyz8F943Q=;
 b=oF2oqTar0dM7uNrTT/ZR+Vev038qOb52daNO5hmCJSMoqFKdVMgZTPeGU+pdT3G9iE
 Ph2Biy3IeetuTw6Af0uuiUPc/BtYZWTdiZ6GDt6HxW/tPVhU+VtR9HQGERoE0lmfg/BA
 svZdBs0i0f6x2kIPT3Q/KUzs2ZLiQNIsfDH+7u01lZtHdRSXnX04N3ZP/eZJTW25HRN2
 fUiZzdYSjYSGwuolBy8uUV35RVZj055nf0DmWJch8lMPfXwDsnM+lclJs5/m51P6JotY
 U8Haw8rByH+vMV2yxAakLC5XzhOFkOZ5H3fZbPFpSxCX8TCPs4utf4H5UIarkTo1YFHX
 gulQ==
X-Gm-Message-State: AOAM5312kq0nzti9PVMMMUNV/ZCYulh+Ts9lLz6m3t4StF/u+iLac/6a
 PRNqXPtN44r3ZT+Xgw8UEDyBUJI0+TNMTw==
X-Google-Smtp-Source: ABdhPJz29pOjZtUHsWwxYajYjfw+3MTBoyvjiQr68eSH1qH/ZUWVmeTmkuUk+eBOJHNNtXMlHmRbGQ==
X-Received: by 2002:a1c:c205:: with SMTP id s5mr71495wmf.129.1611069076563;
 Tue, 19 Jan 2021 07:11:16 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id a184sm4843699wme.35.2021.01.19.07.11.15
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jan 2021 07:11:16 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 12/33] target/arm: add ARMv8.4-SEL2 system registers
Date: Tue, 19 Jan 2021 15:10:43 +0000
Message-Id: <20210119151104.16264-13-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210119151104.16264-1-peter.maydell@linaro.org>
References: <20210119151104.16264-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>

Signed-off-by: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210112104511.36576-9-remi.denis.courmont@huawei.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h    |  7 +++++++
 target/arm/helper.c | 24 ++++++++++++++++++++++++
 2 files changed, 31 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index cc1ea586c10..53d0e989f05 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -168,6 +168,11 @@ typedef struct {
     uint32_t base_mask;
 } TCR;
 
+#define VTCR_NSW (1u << 29)
+#define VTCR_NSA (1u << 30)
+#define VSTCR_SW VTCR_NSW
+#define VSTCR_SA VTCR_NSA
+
 /* Define a maximum sized vector register.
  * For 32-bit, this is a 128-bit NEON/AdvSIMD register.
  * For 64-bit, this is a 2048-bit SVE register.
@@ -325,9 +330,11 @@ typedef struct CPUARMState {
             uint64_t ttbr1_el[4];
         };
         uint64_t vttbr_el2; /* Virtualization Translation Table Base.  */
+        uint64_t vsttbr_el2; /* Secure Virtualization Translation Table. */
         /* MMU translation table base control. */
         TCR tcr_el[4];
         TCR vtcr_el2; /* Virtualization Translation Control.  */
+        TCR vstcr_el2; /* Secure Virtualization Translation Control. */
         uint32_t c2_data; /* MPU data cacheable bits.  */
         uint32_t c2_insn; /* MPU instruction cacheable bits.  */
         union { /* MMU domain access control register
diff --git a/target/arm/helper.c b/target/arm/helper.c
index a11a76adb8d..9a0b8c9aa0a 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -5722,6 +5722,27 @@ static const ARMCPRegInfo el2_v8_cp_reginfo[] = {
     REGINFO_SENTINEL
 };
 
+static CPAccessResult sel2_access(CPUARMState *env, const ARMCPRegInfo *ri,
+                                  bool isread)
+{
+    if (arm_current_el(env) == 3 || arm_is_secure_below_el3(env)) {
+        return CP_ACCESS_OK;
+    }
+    return CP_ACCESS_TRAP_UNCATEGORIZED;
+}
+
+static const ARMCPRegInfo el2_sec_cp_reginfo[] = {
+    { .name = "VSTTBR_EL2", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 4, .crn = 2, .crm = 6, .opc2 = 0,
+      .access = PL2_RW, .accessfn = sel2_access,
+      .fieldoffset = offsetof(CPUARMState, cp15.vsttbr_el2) },
+    { .name = "VSTCR_EL2", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 4, .crn = 2, .crm = 6, .opc2 = 2,
+      .access = PL2_RW, .accessfn = sel2_access,
+      .fieldoffset = offsetof(CPUARMState, cp15.vstcr_el2) },
+    REGINFO_SENTINEL
+};
+
 static CPAccessResult nsacr_access(CPUARMState *env, const ARMCPRegInfo *ri,
                                    bool isread)
 {
@@ -7734,6 +7755,9 @@ void register_cp_regs_for_features(ARMCPU *cpu)
         if (arm_feature(env, ARM_FEATURE_V8)) {
             define_arm_cp_regs(cpu, el2_v8_cp_reginfo);
         }
+        if (cpu_isar_feature(aa64_sel2, cpu)) {
+            define_arm_cp_regs(cpu, el2_sec_cp_reginfo);
+        }
         /* RVBAR_EL2 is only implemented if EL2 is the highest EL */
         if (!arm_feature(env, ARM_FEATURE_EL3)) {
             ARMCPRegInfo rvbar = {
-- 
2.20.1


