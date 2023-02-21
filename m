Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5227969D867
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 03:22:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUIGe-0001lA-8y; Mon, 20 Feb 2023 21:20:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUIGW-0001gn-6C
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 21:20:27 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUIGS-0008HQ-Q6
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 21:20:23 -0500
Received: by mail-pj1-x1032.google.com with SMTP id g14so3176296pjb.2
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 18:20:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=C4PEKitcWEtZp1SVejXeRjs9KFolSy/o7SWCuKGHUqY=;
 b=N3NJ6KF/Gh2/d861Aetl7rqT0Zky2IIUUjMpRt3v6HM9zOcFxTFAhYSdu18wqJjudF
 GgO1BeNnRfW4BjyXDTvrL8kX9nj1BqHMlSwgF9gmce7g2h0cSmoLaSKA+5DYkAfRZDj3
 kao8lu5EVBLkYbhVIY7kGN8acW8d+bVmoO6AyryW8QB9bqe44bP9f/t9aYfbG3ASEcfg
 WDUWWyG418X1Iqj/NyKMghAGJk10YKTZrHkpPG6zJAo8eEvuaNBnhkl/xFhjmsZJdo00
 yn7FfPVRNYmE5cxcr1bHiK1b5/AkyxFixcAdQLJCPY4Eu+wmsfXKslqjplYL5kQlg1FQ
 NWyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=C4PEKitcWEtZp1SVejXeRjs9KFolSy/o7SWCuKGHUqY=;
 b=rMUVP9RptPuf5D1n1wdvIuhHtDIDZZMdjIeAzR2Fx75yswrMjoDCCP1NBAIIoj8p/J
 15CGhD630ukJaZsjGGt265YNusXT0nKI3GJ++biLOZGClRpg49Q6/yW97mMdiScTkM65
 1ANcZ5IkFh+D/WQWpVvSoHlf61cq+7IYZtSeDDWOXNyogMYrUaTq6wkcefM32NGF9v+j
 f5hkiWVkENKk6svzFvsxhqvZdoN7UWyrt75Wz/QCjYCKyCJD6YE/pHJVoR+xKuXhZLrv
 qTxbl9aYfB2fqACaHxUAnUUMXdkdk/hFxFQdZh+muDPMBvxXUJ2uoLzuq6u91BMCfb8o
 oB3A==
X-Gm-Message-State: AO0yUKUQ+l/7N+Jr9BlO2W7bWHPhWVj4TtaMdLmvstxTLZUjTbraaBN9
 rS5iskC3scwkjcthtNDpnFPRstrhVQUlM3mOSB4=
X-Google-Smtp-Source: AK7set++Be8zHgmUDdR3gZrQHk0kVJsgVSue7Vq6M3KfqUB8UNc42rncmzNlbRgoR9vks1iVKdnzlQ==
X-Received: by 2002:a17:903:28c4:b0:19b:e2a:de14 with SMTP id
 kv4-20020a17090328c400b0019b0e2ade14mr2645611plb.6.1676946016371; 
 Mon, 20 Feb 2023 18:20:16 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 f3-20020a170902e98300b0019141c79b1dsm8559328plb.254.2023.02.20.18.20.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Feb 2023 18:20:15 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	David Reiss <dreiss@meta.com>
Subject: [PATCH v2 14/14] target/arm: Implement gdbstub m-profile systemreg
 and secext
Date: Mon, 20 Feb 2023 16:19:51 -1000
Message-Id: <20230221021951.453601-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230221021951.453601-1-richard.henderson@linaro.org>
References: <20230221021951.453601-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

The upstream gdb xml only implements {MSP,PSP}{,_NS,S}, but
go ahead and implement the other system registers as well.

Since there is significant overlap between the two, implement
them with common code.  The only exception is the systemreg
view of CONTROL, which merges the banked bits as per MRS.

Signed-off-by: David Reiss <dreiss@meta.com>
[rth: Substatial rewrite using enumerator and shared code.]
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h     |   2 +
 target/arm/gdbstub.c | 194 +++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 196 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 059fe62eaa..6e97a256fb 100644
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
index 062c8d447a..fef53e4ef5 100644
--- a/target/arm/gdbstub.c
+++ b/target/arm/gdbstub.c
@@ -322,6 +322,180 @@ static int arm_gen_dynamic_sysreg_xml(CPUState *cs, int base_reg)
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
+static int m_sysreg_set(CPUARMState *env, uint8_t *buf,
+                        MProfileSysreg reg, bool secure)
+{
+    uint32_t *ptr = m_sysreg_ptr(env, reg, secure);
+
+    if (ptr == NULL) {
+        return 0;
+    }
+    *ptr = ldl_p(buf);
+    return 4;
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
+    /* Control is a mix of banked and non-banked bits -- disallow write. */
+    if (reg == M_SYSREG_CONTROL) {
+        return 0;
+    }
+    return m_sysreg_set(env, buf, reg, env->v7m.secure);
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
+    return m_sysreg_set(env, buf, reg >> 1, reg & 1);
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
@@ -330,6 +504,12 @@ const char *arm_gdb_get_dynamic_xml(CPUState *cs, const char *xmlname)
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
@@ -389,4 +569,18 @@ void arm_cpu_register_gdb_regs_for_features(ARMCPU *cpu)
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


