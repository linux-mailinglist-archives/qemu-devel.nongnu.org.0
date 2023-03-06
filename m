Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CD646AC598
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 16:37:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZCrZ-0004ET-0D; Mon, 06 Mar 2023 10:34:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pZCrT-00045b-MV
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 10:34:51 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pZCrR-0002BY-Mw
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 10:34:51 -0500
Received: by mail-wm1-x332.google.com with SMTP id p26so5916996wmc.4
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 07:34:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678116888;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=giRxJaHKMC7HAYy/Ff4KTNN2PtdjEIM4re8VlfvNXuI=;
 b=kvanG4h0rFHwCOUAJ/pApEInoXuYQ7CH19Gzg5GpJQc2aO9Pvivj9FIZ73zSbezOAi
 rTAQldN5L/+KbexSCjhorKRnkJm/QnxpMTrzoRLWKTgsqpiVmgoJt85wt1g+gOp8EWA0
 zJ80/rkfqmxAIKcSAXyVMIh8447ZuSVYahHTDjVcSS6zK0EfwWv3E6/CvBs6Bl9MnEyL
 h0A5L/+LO0N0nkPnwdUrRHIKiWMsVi78AUaOr4oemuQrmn8UC1quRLjWjUEhSEU87VmP
 nXhUMzqHW/ohkV5XDymA6mFpbyehKhfRPqDhsFH6SkLwM7mur/JIo5CvO/Rt1qcjy1wV
 S6FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678116888;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=giRxJaHKMC7HAYy/Ff4KTNN2PtdjEIM4re8VlfvNXuI=;
 b=1P8f4GBz0l56dQ/KfHEVobT8gJdGPBsAF+gjja9LF2kY1oWR2g/1tGw+tbQXPWS3pQ
 tMnxLm0usBRcLV8BADk2fX0l5TTS28lDuEV8lvlXRbhuEdCqD9BWO6AR+fsNZOXnBC6I
 JYvA5liKBtUAicKQuVOtWMik+1MOwz7cH1xl6NnWUHweBoUOympS8A1oPPeSxby6G2o+
 ZilJi+RcyGqEBQayolqrhw766aobYutvrOS2gJrLt1LMzmNAtBghelxl1btmTKZkEW9E
 zW/zEspso+/0vWQ8yMGUdD3nS1AGx5dS/fAbPeKylToEFxRpxtq7C7yr41neMQvgTKXG
 9yKA==
X-Gm-Message-State: AO0yUKXZE52Y8ANnm6OnNMBmSpy47SZGf/WsFhvLPemSOg9FdyoFe6ZA
 drkxI7Qgu5uGLRlwHXWl6Yiysuz3C6icyr5bbM8=
X-Google-Smtp-Source: AK7set8jiEF6grlY6n+OvX7pn8ILIxBQFes4Cu6vC59ZDHEdNOgEw72d8jdwQ91HFglMe7boBufKFA==
X-Received: by 2002:a05:600c:198e:b0:3c6:e61e:ae71 with SMTP id
 t14-20020a05600c198e00b003c6e61eae71mr10603176wmq.1.1678116888368; 
 Mon, 06 Mar 2023 07:34:48 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 v7-20020a05600c444700b003eb0d6f48f3sm15287432wmn.27.2023.03.06.07.34.47
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Mar 2023 07:34:47 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 14/21] target/arm: Implement gdbstub m-profile systemreg and
 secext
Date: Mon,  6 Mar 2023 15:34:28 +0000
Message-Id: <20230306153435.490894-15-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230306153435.490894-1-peter.maydell@linaro.org>
References: <20230306153435.490894-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
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

From: Richard Henderson <richard.henderson@linaro.org>

The upstream gdb xml only implements {MSP,PSP}{,_NS,S}, but
go ahead and implement the other system registers as well.

Since there is significant overlap between the two, implement
them with common code.  The only exception is the systemreg
view of CONTROL, which merges the banked bits as per MRS.

Signed-off-by: David Reiss <dreiss@meta.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20230227213329.793795-15-richard.henderson@linaro.org
[rth: Substatial rewrite using enumerator and shared code.]
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h     |   2 +
 target/arm/gdbstub.c | 178 +++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 180 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 379e74d1f99..c4bd22808ce 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -869,6 +869,8 @@ struct ArchCPU {
 
     DynamicGDBXMLInfo dyn_sysreg_xml;
     DynamicGDBXMLInfo dyn_svereg_xml;
+    DynamicGDBXMLInfo dyn_m_systemreg_xml;
+    DynamicGDBXMLInfo dyn_m_secextreg_xml;
 
     /* Timers used by the generic (architected) timer */
     QEMUTimer *gt_timer[NUM_GTIMERS];
diff --git a/target/arm/gdbstub.c b/target/arm/gdbstub.c
index 062c8d447a0..3f799f5d058 100644
--- a/target/arm/gdbstub.c
+++ b/target/arm/gdbstub.c
@@ -322,6 +322,164 @@ static int arm_gen_dynamic_sysreg_xml(CPUState *cs, int base_reg)
     return cpu->dyn_sysreg_xml.num;
 }
 
+typedef enum {
+    M_SYSREG_MSP,
+    M_SYSREG_PSP,
+    M_SYSREG_PRIMASK,
+    M_SYSREG_CONTROL,
+    M_SYSREG_BASEPRI,
+    M_SYSREG_FAULTMASK,
+    M_SYSREG_MSPLIM,
+    M_SYSREG_PSPLIM,
+} MProfileSysreg;
+
+static const struct {
+    const char *name;
+    int feature;
+} m_sysreg_def[] = {
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
+static uint32_t *m_sysreg_ptr(CPUARMState *env, MProfileSysreg reg, bool sec)
+{
+    uint32_t *ptr;
+
+    switch (reg) {
+    case M_SYSREG_MSP:
+        ptr = arm_v7m_get_sp_ptr(env, sec, false, true);
+        break;
+    case M_SYSREG_PSP:
+        ptr = arm_v7m_get_sp_ptr(env, sec, true, true);
+        break;
+    case M_SYSREG_MSPLIM:
+        ptr = &env->v7m.msplim[sec];
+        break;
+    case M_SYSREG_PSPLIM:
+        ptr = &env->v7m.psplim[sec];
+        break;
+    case M_SYSREG_PRIMASK:
+        ptr = &env->v7m.primask[sec];
+        break;
+    case M_SYSREG_BASEPRI:
+        ptr = &env->v7m.basepri[sec];
+        break;
+    case M_SYSREG_FAULTMASK:
+        ptr = &env->v7m.faultmask[sec];
+        break;
+    case M_SYSREG_CONTROL:
+        ptr = &env->v7m.control[sec];
+        break;
+    default:
+        return NULL;
+    }
+    return arm_feature(env, m_sysreg_def[reg].feature) ? ptr : NULL;
+}
+
+static int m_sysreg_get(CPUARMState *env, GByteArray *buf,
+                        MProfileSysreg reg, bool secure)
+{
+    uint32_t *ptr = m_sysreg_ptr(env, reg, secure);
+
+    if (ptr == NULL) {
+        return 0;
+    }
+    return gdb_get_reg32(buf, *ptr);
+}
+
+static int arm_gdb_get_m_systemreg(CPUARMState *env, GByteArray *buf, int reg)
+{
+    /*
+     * Here, we emulate MRS instruction, where CONTROL has a mix of
+     * banked and non-banked bits.
+     */
+    if (reg == M_SYSREG_CONTROL) {
+        return gdb_get_reg32(buf, arm_v7m_mrs_control(env, env->v7m.secure));
+    }
+    return m_sysreg_get(env, buf, reg, env->v7m.secure);
+}
+
+static int arm_gdb_set_m_systemreg(CPUARMState *env, uint8_t *buf, int reg)
+{
+    return 0; /* TODO */
+}
+
+static int arm_gen_dynamic_m_systemreg_xml(CPUState *cs, int orig_base_reg)
+{
+    ARMCPU *cpu = ARM_CPU(cs);
+    CPUARMState *env = &cpu->env;
+    GString *s = g_string_new(NULL);
+    int base_reg = orig_base_reg;
+    int i;
+
+    g_string_printf(s, "<?xml version=\"1.0\"?>");
+    g_string_append_printf(s, "<!DOCTYPE target SYSTEM \"gdb-target.dtd\">");
+    g_string_append_printf(s, "<feature name=\"org.gnu.gdb.arm.m-system\">\n");
+
+    for (i = 0; i < ARRAY_SIZE(m_sysreg_def); i++) {
+        if (arm_feature(env, m_sysreg_def[i].feature)) {
+            g_string_append_printf(s,
+                "<reg name=\"%s\" bitsize=\"32\" regnum=\"%d\"/>\n",
+                m_sysreg_def[i].name, base_reg++);
+        }
+    }
+
+    g_string_append_printf(s, "</feature>");
+    cpu->dyn_m_systemreg_xml.desc = g_string_free(s, false);
+    cpu->dyn_m_systemreg_xml.num = base_reg - orig_base_reg;
+
+    return cpu->dyn_m_systemreg_xml.num;
+}
+
+#ifndef CONFIG_USER_ONLY
+/*
+ * For user-only, we see the non-secure registers via m_systemreg above.
+ * For secext, encode the non-secure view as even and secure view as odd.
+ */
+static int arm_gdb_get_m_secextreg(CPUARMState *env, GByteArray *buf, int reg)
+{
+    return m_sysreg_get(env, buf, reg >> 1, reg & 1);
+}
+
+static int arm_gdb_set_m_secextreg(CPUARMState *env, uint8_t *buf, int reg)
+{
+    return 0; /* TODO */
+}
+
+static int arm_gen_dynamic_m_secextreg_xml(CPUState *cs, int orig_base_reg)
+{
+    ARMCPU *cpu = ARM_CPU(cs);
+    GString *s = g_string_new(NULL);
+    int base_reg = orig_base_reg;
+    int i;
+
+    g_string_printf(s, "<?xml version=\"1.0\"?>");
+    g_string_append_printf(s, "<!DOCTYPE target SYSTEM \"gdb-target.dtd\">");
+    g_string_append_printf(s, "<feature name=\"org.gnu.gdb.arm.secext\">\n");
+
+    for (i = 0; i < ARRAY_SIZE(m_sysreg_def); i++) {
+        g_string_append_printf(s,
+            "<reg name=\"%s_ns\" bitsize=\"32\" regnum=\"%d\"/>\n",
+            m_sysreg_def[i].name, base_reg++);
+        g_string_append_printf(s,
+            "<reg name=\"%s_s\" bitsize=\"32\" regnum=\"%d\"/>\n",
+            m_sysreg_def[i].name, base_reg++);
+    }
+
+    g_string_append_printf(s, "</feature>");
+    cpu->dyn_m_secextreg_xml.desc = g_string_free(s, false);
+    cpu->dyn_m_secextreg_xml.num = base_reg - orig_base_reg;
+
+    return cpu->dyn_m_secextreg_xml.num;
+}
+#endif
+
 const char *arm_gdb_get_dynamic_xml(CPUState *cs, const char *xmlname)
 {
     ARMCPU *cpu = ARM_CPU(cs);
@@ -330,6 +488,12 @@ const char *arm_gdb_get_dynamic_xml(CPUState *cs, const char *xmlname)
         return cpu->dyn_sysreg_xml.desc;
     } else if (strcmp(xmlname, "sve-registers.xml") == 0) {
         return cpu->dyn_svereg_xml.desc;
+    } else if (strcmp(xmlname, "arm-m-system.xml") == 0) {
+        return cpu->dyn_m_systemreg_xml.desc;
+#ifndef CONFIG_USER_ONLY
+    } else if (strcmp(xmlname, "arm-m-secext.xml") == 0) {
+        return cpu->dyn_m_secextreg_xml.desc;
+#endif
     }
     return NULL;
 }
@@ -389,4 +553,18 @@ void arm_cpu_register_gdb_regs_for_features(ARMCPU *cpu)
                              arm_gen_dynamic_sysreg_xml(cs, cs->gdb_num_regs),
                              "system-registers.xml", 0);
 
+    if (arm_feature(env, ARM_FEATURE_M)) {
+        gdb_register_coprocessor(cs,
+            arm_gdb_get_m_systemreg, arm_gdb_set_m_systemreg,
+            arm_gen_dynamic_m_systemreg_xml(cs, cs->gdb_num_regs),
+            "arm-m-system.xml", 0);
+#ifndef CONFIG_USER_ONLY
+        if (arm_feature(env, ARM_FEATURE_M_SECURITY)) {
+            gdb_register_coprocessor(cs,
+                arm_gdb_get_m_secextreg, arm_gdb_set_m_secextreg,
+                arm_gen_dynamic_m_secextreg_xml(cs, cs->gdb_num_regs),
+                "arm-m-secext.xml", 0);
+        }
+#endif
+    }
 }
-- 
2.34.1


