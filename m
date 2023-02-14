Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA2ED69698E
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 17:32:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRyDD-0006yf-0V; Tue, 14 Feb 2023 11:31:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pRyD6-0006kO-3n
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 11:31:16 -0500
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pRyD3-00028X-VV
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 11:31:15 -0500
Received: by mail-pf1-x435.google.com with SMTP id bd35so5540285pfb.6
 for <qemu-devel@nongnu.org>; Tue, 14 Feb 2023 08:31:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GY8+XZXt1WwhGHNe4w41pwNJufQrqsV0Unpbj9QQTJg=;
 b=AAXYLp84X55v1PCIKEBERUmfIlyxGUSALhz8UOrF/T8CniZEX1VHLyQAwuAkueLI6c
 QfnsN2Br7mQxaRXboBU2iSAUBz2ogo/loYjjVx05p6clJNlSiglTvpTjdQ/bhaH8J9K/
 YwTokqCjq4EleEzelBi/ee8L9tf44hFcuVGw6DWzMNpfOuT+53W/p0R5+HLdvi54CE07
 V9eA7UKsvTJL/bOtC2K8BtARV0Ap8ZZ2aoNkAvUPHEevULO4iTwvtqWywb5XWeiZCv8m
 zUCoUSfnArlMGhzATOZYYiIaO0jOBFSdBRBjaHU9rZcuWppuoAG3Gfz8aT3wkPJF5gCD
 eH9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GY8+XZXt1WwhGHNe4w41pwNJufQrqsV0Unpbj9QQTJg=;
 b=YyCJNvCBqEaei5C69Bitnpo3wZa8Q3favSGwR5x9ep3AlkpjPZVyDBGJYqghye0pBd
 VnJwrkovvGc4zg55qgykuXx0/Bk/cj4VHxJVjDWRqlKKtxIHIUPlCIAwEknbs5yNPtse
 BhDoK/N0AzB2+UfFwunuLXTVkhEtkSYpImyJTAw1dvlZ2qqBKpbPJjhjIP3JWssDtQ5k
 3esfmW2zN1bFx31FCn08VL6itJbDyATsp60+rs61U7qmi//LveIb+lCqFWaX3/M8wKoI
 rpUGamkoAQepmmUmaOWICEWx2PxMuf77E8M+nT5AN0Kk0UJd8z/uJEgVJEa9BHpfj6TZ
 MxMA==
X-Gm-Message-State: AO0yUKVJsTu0BhoX8kPjtNLTukS+FWWvJdDc32h4qxjaj9WyVqNdn/S5
 xOHMeWRCgBAYSszVuSi8bMAy1TUXKGywXft4/hM=
X-Google-Smtp-Source: AK7set8y75kEdclW3cPAcGPsPOHoy/WGKQcjmVfp2xaBXCcd5yqfbwJ6z0/1gkpamUdNTYedFUjD8w==
X-Received: by 2002:a62:848e:0:b0:5a8:4de2:e94e with SMTP id
 k136-20020a62848e000000b005a84de2e94emr2560366pfd.33.1676392273135; 
 Tue, 14 Feb 2023 08:31:13 -0800 (PST)
Received: from stoup.. (rrcs-74-87-59-234.west.biz.rr.com. [74.87.59.234])
 by smtp.gmail.com with ESMTPSA id
 d17-20020aa78691000000b0058d99337381sm10337011pfo.172.2023.02.14.08.31.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Feb 2023 08:31:12 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	David Reiss <dreiss@meta.com>
Subject: [PATCH 14/14] target/arm: Support reading m-profile system registers
 from gdb
Date: Tue, 14 Feb 2023 06:30:48 -1000
Message-Id: <20230214163048.903964-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230214163048.903964-1-richard.henderson@linaro.org>
References: <20230214163048.903964-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
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

From: David Reiss <dreiss@meta.com>

Follows a fairly similar pattern to the existing special register
debug support.  Only reading is implemented, but it should be
possible to implement writes.

Signed-off-by: David Reiss <dreiss@meta.com>
[rth: Split out from two other patches;
 Use an enumeration to locally number the registers.
 Use a structure to list and control runtime visibility.
 Handle security extension with the same code.]
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h     |   1 +
 target/arm/gdbstub.c | 169 +++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 170 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index c9f768f945..536e60d48c 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -867,6 +867,7 @@ struct ArchCPU {
 
     DynamicGDBXMLInfo dyn_sysreg_xml;
     DynamicGDBXMLInfo dyn_svereg_xml;
+    DynamicGDBXMLInfo dyn_m_systemreg_xml;
 
     /* Timers used by the generic (architected) timer */
     QEMUTimer *gt_timer[NUM_GTIMERS];
diff --git a/target/arm/gdbstub.c b/target/arm/gdbstub.c
index 062c8d447a..a8848c7fee 100644
--- a/target/arm/gdbstub.c
+++ b/target/arm/gdbstub.c
@@ -322,6 +322,167 @@ static int arm_gen_dynamic_sysreg_xml(CPUState *cs, int base_reg)
     return cpu->dyn_sysreg_xml.num;
 }
 
+enum {
+    M_SYSREG_MSP        = 0,
+    M_SYSREG_PSP        = 1,
+    M_SYSREG_PRIMASK    = 2,
+    M_SYSREG_CONTROL    = 3,
+    M_SYSREG_BASEPRI    = 4,
+    M_SYSREG_FAULTMASK  = 5,
+    M_SYSREG_MSPLIM     = 6,
+    M_SYSREG_PSPLIM     = 7,
+    M_SYSREG_REG_MASK   = 7,
+
+    /*
+     * NOTE: MSP, PSP, MSPLIM, PSPLIM technically don't exist if the
+     * secure extension is present (replaced by MSP_S, MSP_NS, et al).
+     * However, the MRS instruction is still allowed to read from MSP and PSP,
+     * and will return the value associated with the current security state.
+     * We replicate this behavior for the convenience of users, who will see
+     * GDB behave similarly to their assembly code, even if they are oblivious
+     * to the security extension.
+     */
+    M_SYSREG_CURRENT    = 0 << 3,
+    M_SYSREG_NONSECURE  = 1 << 3,
+    M_SYSREG_SECURE     = 2 << 3,
+    M_SYSREG_MODE_MASK  = 3 << 3,
+};
+
+static const struct {
+    const char *name;
+    int feature;
+} m_systemreg_def[] = {
+    [M_SYSREG_MSP] = { "msp", ARM_FEATURE_M },
+    [M_SYSREG_PSP] = { "psp", ARM_FEATURE_M },
+    [M_SYSREG_PRIMASK] = { "primask", ARM_FEATURE_M },
+    [M_SYSREG_CONTROL] = { "control", ARM_FEATURE_M },
+    [M_SYSREG_BASEPRI] = { "basepri", ARM_FEATURE_M_MAIN },
+    [M_SYSREG_FAULTMASK] = { "faultmask", ARM_FEATURE_M_MAIN },
+    [M_SYSREG_MSPLIM] = { "msplim", ARM_FEATURE_V8 },
+    [M_SYSREG_PSPLIM] = { "psplim", ARM_FEATURE_V8 },
+};
+
+static int arm_gdb_get_m_systemreg(CPUARMState *env, GByteArray *buf, int reg)
+{
+    int mode = reg & M_SYSREG_MODE_MASK;
+    bool secure;
+    uint32_t val;
+
+    switch (mode) {
+    case M_SYSREG_CURRENT:
+        secure = env->v7m.secure;
+        break;
+    case M_SYSREG_NONSECURE:
+        secure = false;
+        break;
+    case M_SYSREG_SECURE:
+        secure = true;
+        break;
+    default:
+        return 0;
+    }
+
+    reg &= M_SYSREG_REG_MASK;
+    if (reg >= ARRAY_SIZE(m_systemreg_def)) {
+        return 0;
+    }
+    if (!arm_feature(env, m_systemreg_def[reg].feature)) {
+        return 0;
+    }
+
+    /* NOTE: This implementation shares a lot of logic with v7m_mrs. */
+    switch (reg) {
+    case M_SYSREG_MSP:
+        val = *arm_v7m_get_sp_ptr(env, secure, false, true);
+        break;
+    case M_SYSREG_PSP:
+        val = *arm_v7m_get_sp_ptr(env, secure, true, true);
+        break;
+    case M_SYSREG_MSPLIM:
+        val = env->v7m.msplim[secure];
+        break;
+    case M_SYSREG_PSPLIM:
+        val = env->v7m.psplim[secure];
+        break;
+    case M_SYSREG_PRIMASK:
+        val = env->v7m.primask[secure];
+        break;
+    case M_SYSREG_BASEPRI:
+        val = env->v7m.basepri[secure];
+        break;
+    case M_SYSREG_FAULTMASK:
+        val = env->v7m.faultmask[secure];
+        break;
+    case M_SYSREG_CONTROL:
+        /*
+         * NOTE: CONTROL has a mix of banked and non-banked bits.
+         * For "current", we emulate the MRS instruction.
+         * Unfortunately, this gives GDB no way to read the SFPA bit
+         * when the CPU is in a non-secure state.
+         */
+        if (mode == M_SYSREG_CURRENT) {
+            val = arm_v7m_mrs_control(env, secure);
+        } else {
+            val = env->v7m.control[secure];
+        }
+        break;
+    default:
+        g_assert_not_reached();
+    }
+
+    return gdb_get_reg32(buf, val);
+}
+
+static int arm_gdb_set_m_systemreg(CPUARMState *env, uint8_t *buf, int reg)
+{
+    /* TODO: Implement. */
+    return 0;
+}
+
+static int arm_gen_dynamic_m_systemreg_xml(CPUState *cs, int base_reg)
+{
+    ARMCPU *cpu = ARM_CPU(cs);
+    CPUARMState *env = &cpu->env;
+    GString *s = g_string_new(NULL);
+    int i, ret;
+
+    g_string_printf(s, "<?xml version=\"1.0\"?>");
+    g_string_append_printf(s, "<!DOCTYPE target SYSTEM \"gdb-target.dtd\">");
+    g_string_append_printf(s, "<feature name=\"org.gnu.gdb.arm.m-system\">\n");
+
+    QEMU_BUILD_BUG_ON(M_SYSREG_CURRENT != 0);
+    ret = ARRAY_SIZE(m_systemreg_def);
+
+    for (i = 0; i < ret; i++) {
+        if (arm_feature(env, m_systemreg_def[i].feature)) {
+            g_string_append_printf(s,
+                "<reg name=\"%s\" bitsize=\"32\" regnum=\"%d\"/>\n",
+                m_systemreg_def[i].name, base_reg + i);
+        }
+    }
+
+    if (arm_feature(env, ARM_FEATURE_M_SECURITY)) {
+        for (i = 0; i < ret; i++) {
+            g_string_append_printf(s,
+                "<reg name=\"%s_ns\" bitsize=\"32\" regnum=\"%d\"/>\n",
+                m_systemreg_def[i].name, base_reg + (i | M_SYSREG_NONSECURE));
+        }
+        for (i = 0; i < ret; i++) {
+            g_string_append_printf(s,
+                "<reg name=\"%s_s\" bitsize=\"32\" regnum=\"%d\"/>\n",
+                m_systemreg_def[i].name, base_reg + (i | M_SYSREG_SECURE));
+        }
+        QEMU_BUILD_BUG_ON(M_SYSREG_SECURE < M_SYSREG_NONSECURE);
+        ret |= M_SYSREG_SECURE;
+    }
+
+    g_string_append_printf(s, "</feature>");
+
+    cpu->dyn_m_systemreg_xml.desc = g_string_free(s, false);
+    cpu->dyn_m_systemreg_xml.num = ret;
+    return ret;
+}
+
 const char *arm_gdb_get_dynamic_xml(CPUState *cs, const char *xmlname)
 {
     ARMCPU *cpu = ARM_CPU(cs);
@@ -330,6 +491,8 @@ const char *arm_gdb_get_dynamic_xml(CPUState *cs, const char *xmlname)
         return cpu->dyn_sysreg_xml.desc;
     } else if (strcmp(xmlname, "sve-registers.xml") == 0) {
         return cpu->dyn_svereg_xml.desc;
+    } else if (strcmp(xmlname, "arm-m-system.xml") == 0) {
+        return cpu->dyn_m_systemreg_xml.desc;
     }
     return NULL;
 }
@@ -389,4 +552,10 @@ void arm_cpu_register_gdb_regs_for_features(ARMCPU *cpu)
                              arm_gen_dynamic_sysreg_xml(cs, cs->gdb_num_regs),
                              "system-registers.xml", 0);
 
+    if (arm_feature(env, ARM_FEATURE_M)) {
+        gdb_register_coprocessor(cs,
+            arm_gdb_get_m_systemreg, arm_gdb_set_m_systemreg,
+            arm_gen_dynamic_m_systemreg_xml(cs, cs->gdb_num_regs),
+            "arm-m-system.xml", 0);
+    }
 }
-- 
2.34.1


