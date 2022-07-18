Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B183578165
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 13:57:53 +0200 (CEST)
Received: from localhost ([::1]:55192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDPNo-0007Pe-6D
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 07:57:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_trohmel@quicinc.com>)
 id 1oDPL5-0001c6-V2
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 07:55:04 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:9333)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <quic_trohmel@quicinc.com>)
 id 1oDPL3-0006B0-6M
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 07:55:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1658145301; x=1689681301;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=F7R/PnhfvZLI8UBzoiGgX1pK4EOqQ3G+phkVa1Mbv2w=;
 b=NAyTiDgT8enyYvM1PX2h2tiG6lEV7i6FJJUOp/HV2pA2OmvdkVkLYLrM
 SDvXrPjuzaoM9k4nLOJ7D3/6tiC/yJvTuG8xg2XKDAmkscT34l+IC4oHt
 AMkjmdbiASS2d1ccoxAg5QyXKjXjAf2C27eTIrAytwD1/HQ+c5pvxVpDp U=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 18 Jul 2022 04:54:59 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg03-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2022 04:54:59 -0700
Received: from nalasex01b.na.qualcomm.com (10.47.209.197) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 18 Jul 2022 04:54:58 -0700
Received: from avd-de-lrx-6.eu.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 18 Jul 2022 04:54:57 -0700
From: Tobias Roehmel <quic_trohmel@quicinc.com>
To: <qemu-devel@nongnu.org>
CC: <peter.maydell@linaro.org>, =?UTF-8?q?Tobias=20R=C3=B6hmel?=
 <quic_trohmel@quicinc.com>
Subject: [PATCH v2 7/9] target/arm: Add PMSAv8r registers
Date: Mon, 18 Jul 2022 13:54:31 +0200
Message-ID: <20220718115433.802-8-quic_trohmel@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220718115433.802-1-quic_trohmel@quicinc.com>
References: <20220718115433.802-1-quic_trohmel@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
Received-SPF: pass client-ip=199.106.114.38;
 envelope-from=quic_trohmel@quicinc.com; helo=alexa-out-sd-01.qualcomm.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Tobias Röhmel <quic_trohmel@quicinc.com>

Signed-off-by: Tobias Röhmel <quic_trohmel@quicinc.com>
---
 target/arm/cpu.h    |  10 +++
 target/arm/helper.c | 171 ++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 181 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 86e06116a9..632d0d13c6 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -726,8 +726,18 @@ typedef struct CPUArchState {
          */
         uint32_t *rbar[M_REG_NUM_BANKS];
         uint32_t *rlar[M_REG_NUM_BANKS];
+        uint32_t prbarn[255];
+        uint32_t prlarn[255];
+        uint32_t hprbarn[255];
+        uint32_t hprlarn[255];
         uint32_t mair0[M_REG_NUM_BANKS];
         uint32_t mair1[M_REG_NUM_BANKS];
+        uint32_t prbar;
+        uint32_t prlar;
+        uint32_t prselr;
+        uint32_t hprbar;
+        uint32_t hprlar;
+        uint32_t hprselr;
     } pmsav8;
 
     /* v8M SAU */
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 03bdc3d149..f9ed2bd5c3 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -7422,6 +7422,78 @@ static CPAccessResult access_joscr_jmcr(CPUARMState *env,
     return CP_ACCESS_OK;
 }
 
+static void prbar_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                          uint64_t value)
+{
+    env->pmsav8.prbarn[env->pmsav8.prselr] = value;
+}
+
+static void prlar_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                          uint64_t value)
+{
+    env->pmsav8.prlarn[env->pmsav8.prselr] = value;
+}
+
+static uint64_t prbar_read(CPUARMState *env, const ARMCPRegInfo *ri)
+{
+    return env->pmsav8.prbarn[env->pmsav8.prselr];
+}
+
+static uint64_t prlar_read(CPUARMState *env, const ARMCPRegInfo *ri)
+{
+    return env->pmsav8.prlarn[env->pmsav8.prselr];
+}
+
+static void hprbar_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                          uint64_t value)
+{
+    env->pmsav8.hprbarn[env->pmsav8.hprselr] = value;
+}
+
+static void hprlar_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                          uint64_t value)
+{
+    env->pmsav8.hprlarn[env->pmsav8.hprselr] = value;
+}
+
+static void hprenr_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                          uint64_t value)
+{
+    uint32_t n;
+    ARMCPU *cpu = env_archcpu(env);
+    for (n = 0; n < (int)cpu->pmsav7_dregion; ++n) {
+        if (value & (1 << n)) {
+            env->pmsav8.hprlarn[n] |= 0x1;
+        } else {
+            env->pmsav8.hprlarn[n] &= (~0x1);
+        }
+    }
+}
+
+static uint64_t hprbar_read(CPUARMState *env, const ARMCPRegInfo *ri)
+{
+    return env->pmsav8.hprbarn[env->pmsav8.hprselr];
+}
+
+static uint64_t hprlar_read(CPUARMState *env, const ARMCPRegInfo *ri)
+{
+    return env->pmsav8.hprlarn[env->pmsav8.hprselr];
+}
+
+static uint64_t hprenr_read(CPUARMState *env, const ARMCPRegInfo *ri)
+{
+    uint32_t n;
+    uint32_t result = 0x0;
+    ARMCPU *cpu = env_archcpu(env);
+
+    for (n = 0; n < (int)cpu->pmsav7_dregion; ++n) {
+        if (env->pmsav8.hprlarn[n] & 0x1) {
+            result |= (0x1 << n);
+        }
+    }
+    return result;
+}
+
 static const ARMCPRegInfo jazelle_regs[] = {
     { .name = "JIDR",
       .cp = 14, .crn = 0, .crm = 0, .opc1 = 7, .opc2 = 0,
@@ -8235,6 +8307,46 @@ void register_cp_regs_for_features(ARMCPU *cpu)
               .access = PL1_R, .type = ARM_CP_CONST,
               .resetvalue = cpu->pmsav7_dregion << 8
         };
+        /* PMSAv8-R registers*/
+        ARMCPRegInfo id_pmsav8_r_reginfo[] = {
+            { .name = "HMPUIR",
+              .cp = 15, .crn = 0, .crm = 0, .opc1 = 4, .opc2 = 4,
+              .access = PL2_R, .type = ARM_CP_CONST,
+              .resetvalue = cpu->pmsav7_dregion},
+             /* PMSAv8-R registers */
+            { .name = "PRBAR",
+              .cp = 15, .opc1 = 0, .crn = 6, .crm = 3, .opc2 = 0,
+              .access = PL1_RW, .resetvalue = 0,
+              .readfn = prbar_read, .writefn = prbar_write,
+              .fieldoffset = offsetof(CPUARMState, pmsav8.prbar)},
+            { .name = "PRLAR",
+              .cp = 15, .opc1 = 0, .crn = 6, .crm = 3, .opc2 = 1,
+              .access = PL1_RW, .resetvalue = 0,
+              .readfn = prlar_read, .writefn = prlar_write,
+              .fieldoffset = offsetof(CPUARMState, pmsav8.prlar)},
+            { .name = "PRSELR", .resetvalue = 0,
+              .cp = 15, .opc1 = 0, .crn = 6, .crm = 2, .opc2 = 1,
+              .access = PL1_RW, .accessfn = access_tvm_trvm,
+              .fieldoffset = offsetof(CPUARMState, pmsav8.prselr)},
+            { .name = "HPRBAR", .resetvalue = 0,
+              .readfn = hprbar_read, .writefn = hprbar_write,
+              .cp = 15, .opc1 = 4, .crn = 6, .crm = 3, .opc2 = 0,
+              .access = PL2_RW, .resetvalue = 0,
+              .fieldoffset = offsetof(CPUARMState, pmsav8.hprbar)},
+            { .name = "HPRLAR",
+              .cp = 15, .opc1 = 4, .crn = 6, .crm = 3, .opc2 = 1,
+              .access = PL2_RW, .resetvalue = 0,
+              .readfn = hprlar_read, .writefn = hprlar_write,
+              .fieldoffset = offsetof(CPUARMState, pmsav8.hprlar)},
+            { .name = "HPRSELR", .resetvalue = 0,
+              .cp = 15, .opc1 = 4, .crn = 6, .crm = 2, .opc2 = 1,
+              .access = PL2_RW, .accessfn = access_tvm_trvm,
+              .fieldoffset = offsetof(CPUARMState, pmsav8.hprselr)},
+            { .name = "HPRENR",
+              .cp = 15, .opc1 = 4, .crn = 6, .crm = 1, .opc2 = 1,
+              .access = PL2_RW, .resetvalue = 0,
+              .readfn = hprenr_read, .writefn = hprenr_write},
+        };
         static const ARMCPRegInfo crn0_wi_reginfo = {
             .name = "CRN0_WI", .cp = 15, .crn = 0, .crm = CP_ANY,
             .opc1 = CP_ANY, .opc2 = CP_ANY, .access = PL1_W,
@@ -8278,6 +8390,65 @@ void register_cp_regs_for_features(ARMCPU *cpu)
         define_arm_cp_regs(cpu, id_cp_reginfo);
         if (!arm_feature(env, ARM_FEATURE_PMSA)) {
             define_one_arm_cp_reg(cpu, &id_tlbtr_reginfo);
+        } else if (arm_feature(env, ARM_FEATURE_V8_R)) {
+            uint32_t i = 0;
+            char hprbar_string[] = "HPRBAR%u";
+            char hprlar_string[] = "HPRLAR%u";
+
+            char prbar_string[] = "PRBAR%u";
+            char prlar_string[] = "PRLAR%u";
+            char tmp_string[50];
+            define_one_arm_cp_reg(cpu, &id_mpuir_reginfo);
+            define_arm_cp_regs(cpu, id_pmsav8_r_reginfo);
+            for (i = 0; i < cpu->pmsav7_dregion; ++i) {
+                uint8_t crm = 0b1000 | ((i & 0b1110) >> 1);
+                uint8_t opc2 = (i & 0x1) << 2;
+
+                sprintf(tmp_string, hprbar_string, i);
+                ARMCPRegInfo tmp_hprbarn_reginfo = {
+                    .name = tmp_string,
+                    .cp = 15, .opc1 = 4, .crn = 6, .crm = crm, .opc2 = opc2,
+                    .access = PL2_RW, .resetvalue = 0,
+                    .accessfn = access_tvm_trvm,
+                    .fieldoffset = offsetof(CPUARMState, pmsav8.hprbarn)
+                    + i * sizeof(env->pmsav8.hprbarn[0])
+                };
+                define_one_arm_cp_reg(cpu, &tmp_hprbarn_reginfo);
+
+                sprintf(tmp_string, prbar_string, i);
+                ARMCPRegInfo tmp_prbarn_reginfo = {
+                    .name = tmp_string,
+                    .cp = 15, .opc1 = 0, .crn = 6, .crm = crm, .opc2 = opc2,
+                    .access = PL1_RW, .resetvalue = 0,
+                    .accessfn = access_tvm_trvm,
+                    .fieldoffset = offsetof(CPUARMState, pmsav8.prbarn)
+                    + i * sizeof(env->pmsav8.prbarn[0])
+                };
+                define_one_arm_cp_reg(cpu, &tmp_prbarn_reginfo);
+
+                opc2 = (i & 0x1) << 2 | 0x1;
+                sprintf(tmp_string, hprlar_string, i);
+                ARMCPRegInfo tmp_hprlarn_reginfo = {
+                    .name = tmp_string,
+                    .cp = 15, .opc1 = 4, .crn = 6, .crm = crm, .opc2 = opc2,
+                    .access = PL2_RW, .resetvalue = 0,
+                    .accessfn = access_tvm_trvm,
+                    .fieldoffset = offsetof(CPUARMState, pmsav8.hprlarn)
+                    + i * sizeof(env->pmsav8.hprlarn[0])
+                };
+                define_one_arm_cp_reg(cpu, &tmp_hprlarn_reginfo);
+
+                sprintf(tmp_string, prlar_string, i);
+                ARMCPRegInfo tmp_prlarn_reginfo = {
+                    .name = tmp_string,
+                    .cp = 15, .opc1 = 0, .crn = 6, .crm = crm, .opc2 = opc2,
+                    .access = PL1_RW, .resetvalue = 0,
+                    .accessfn = access_tvm_trvm,
+                    .fieldoffset = offsetof(CPUARMState, pmsav8.prlarn)
+                    + i * sizeof(env->pmsav8.prlarn[0])
+                };
+                define_one_arm_cp_reg(cpu, &tmp_prlarn_reginfo);
+            }
         } else if (arm_feature(env, ARM_FEATURE_V7)) {
             define_one_arm_cp_reg(cpu, &id_mpuir_reginfo);
         }
-- 
2.25.1


