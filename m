Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E93B6AC560
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 16:35:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZCrS-00043q-2b; Mon, 06 Mar 2023 10:34:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pZCrM-0003z7-77
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 10:34:44 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pZCrJ-000289-Cx
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 10:34:43 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 o11-20020a05600c4fcb00b003eb33ea29a8so5452263wmq.1
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 07:34:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678116880;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ZMWtEOLAgQgDEm/tR2wSYNPZ7HSsKw5Qp0kP2ZEcS2A=;
 b=O2eM7//WNEzI/g1/CT9G4OzYWhlVKhH34Goj5eUu6vOxi0MT+Z0JIeaN7kiza0n3c5
 KE9MjmkI53Ga5wkBr2O6C0W/PJboO3l4F2VzZlKqq49/Blk57LOuIyA20EnXKW6HEIbG
 QdkxissVqTjfONQ8jqMhMBymRkdaLEWxXMwdOeX80QL4DJmjgI9+SKhvUsgzL6tlQwQb
 ohUIPFYOr7cyNVasxx7Y6UtsM0sTPjnPyO5BORTBIBaHEd0TVaOgcnKYFAHE5jRISfD3
 y8xmV43BcfJTBTt8xuPlPoj6CmthTrHRKmPKRx6IrqWc2/qACkrT2SCX+3ZANjP4FWQD
 JyNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678116880;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZMWtEOLAgQgDEm/tR2wSYNPZ7HSsKw5Qp0kP2ZEcS2A=;
 b=JGZHXKSlnAODREagdpotUACpdOFTTTC4wTiTxFWEaFpo/64KaXERdkyTAkmoOzyOcR
 P7R91qTViqWLshLZ7rBZ5ffo/3cHt9Iu1I58AnnJWtm43aREd9EMPlO6cU7oWeaQleHW
 5i3XpEo+IuRRtlFBJ/fz92bp/FpIg+FqHbkZ/3+PhLHBLbQHiDr0jsNytoCBwk4hRxdn
 XFKCabx0u1qobAbebUqK67vewpSJQtYxsZWD4taYDNRPODpLOEflpki0kjZCYbjRc+MW
 7aNT+bXefvJegC4NOeUZPKCnU+2IUQwbU/8Ci4SCGngfJBYoo4Rm07ExRBCT1MRbuOWu
 F6gA==
X-Gm-Message-State: AO0yUKWCj63pxBCZgoCDEZvOxR9UGxcPfp0l9uVUJBPL1A8i1obmRMom
 27TWoik6b2L9DkWMr32Zq73KuA5/1q+rvSQMnyA=
X-Google-Smtp-Source: AK7set9G1c8Q/fdH4iCRGhyyTrDYrNxM87uAJLTny8SYF7GHFX2aeaV7UeH4ErkJqsmfhLyL89btcQ==
X-Received: by 2002:a05:600c:4f8f:b0:3e2:1d3d:ec41 with SMTP id
 n15-20020a05600c4f8f00b003e21d3dec41mr7326216wmq.20.1678116880076; 
 Mon, 06 Mar 2023 07:34:40 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 v7-20020a05600c444700b003eb0d6f48f3sm15287432wmn.27.2023.03.06.07.34.39
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Mar 2023 07:34:39 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 03/21] target/arm: Move arm_gen_dynamic_svereg_xml to
 gdbstub64.c
Date: Mon,  6 Mar 2023 15:34:17 +0000
Message-Id: <20230306153435.490894-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230306153435.490894-1-peter.maydell@linaro.org>
References: <20230306153435.490894-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
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

The function is only used for aarch64, so move it to the
file that has the other aarch64 gdbstub stuff.  Move the
declaration to internals.h.

Reviewed-by: Fabiano Rosas <farosas@suse.de>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20230227213329.793795-4-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h       |   6 ---
 target/arm/internals.h |   1 +
 target/arm/gdbstub.c   | 120 -----------------------------------------
 target/arm/gdbstub64.c | 118 ++++++++++++++++++++++++++++++++++++++++
 4 files changed, 119 insertions(+), 126 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 209800d50df..379e74d1f99 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1112,12 +1112,6 @@ hwaddr arm_cpu_get_phys_page_attrs_debug(CPUState *cpu, vaddr addr,
 int arm_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
 int arm_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
 
-/*
- * Helpers to dynamically generates XML descriptions of the sysregs
- * and SVE registers. Returns the number of registers in each set.
- */
-int arm_gen_dynamic_svereg_xml(CPUState *cpu, int base_reg);
-
 /* Returns the dynamically generated XML for the gdb stub.
  * Returns a pointer to the XML contents for the specified XML file or NULL
  * if the XML name doesn't match the predefined one.
diff --git a/target/arm/internals.h b/target/arm/internals.h
index f99d0d98413..15988768be3 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1344,6 +1344,7 @@ static inline uint64_t pmu_counter_mask(CPUARMState *env)
 }
 
 #ifdef TARGET_AARCH64
+int arm_gen_dynamic_svereg_xml(CPUState *cpu, int base_reg);
 int aarch64_gdb_get_sve_reg(CPUARMState *env, GByteArray *buf, int reg);
 int aarch64_gdb_set_sve_reg(CPUARMState *env, uint8_t *buf, int reg);
 int aarch64_gdb_get_fpu_reg(CPUARMState *env, GByteArray *buf, int reg);
diff --git a/target/arm/gdbstub.c b/target/arm/gdbstub.c
index 52581e9784c..bf8aff78241 100644
--- a/target/arm/gdbstub.c
+++ b/target/arm/gdbstub.c
@@ -322,126 +322,6 @@ static int arm_gen_dynamic_sysreg_xml(CPUState *cs, int base_reg)
     return cpu->dyn_sysreg_xml.num;
 }
 
-struct TypeSize {
-    const char *gdb_type;
-    int  size;
-    const char sz, suffix;
-};
-
-static const struct TypeSize vec_lanes[] = {
-    /* quads */
-    { "uint128", 128, 'q', 'u' },
-    { "int128", 128, 'q', 's' },
-    /* 64 bit */
-    { "ieee_double", 64, 'd', 'f' },
-    { "uint64", 64, 'd', 'u' },
-    { "int64", 64, 'd', 's' },
-    /* 32 bit */
-    { "ieee_single", 32, 's', 'f' },
-    { "uint32", 32, 's', 'u' },
-    { "int32", 32, 's', 's' },
-    /* 16 bit */
-    { "ieee_half", 16, 'h', 'f' },
-    { "uint16", 16, 'h', 'u' },
-    { "int16", 16, 'h', 's' },
-    /* bytes */
-    { "uint8", 8, 'b', 'u' },
-    { "int8", 8, 'b', 's' },
-};
-
-
-int arm_gen_dynamic_svereg_xml(CPUState *cs, int base_reg)
-{
-    ARMCPU *cpu = ARM_CPU(cs);
-    GString *s = g_string_new(NULL);
-    DynamicGDBXMLInfo *info = &cpu->dyn_svereg_xml;
-    g_autoptr(GString) ts = g_string_new("");
-    int i, j, bits, reg_width = (cpu->sve_max_vq * 128);
-    info->num = 0;
-    g_string_printf(s, "<?xml version=\"1.0\"?>");
-    g_string_append_printf(s, "<!DOCTYPE target SYSTEM \"gdb-target.dtd\">");
-    g_string_append_printf(s, "<feature name=\"org.gnu.gdb.aarch64.sve\">");
-
-    /* First define types and totals in a whole VL */
-    for (i = 0; i < ARRAY_SIZE(vec_lanes); i++) {
-        int count = reg_width / vec_lanes[i].size;
-        g_string_printf(ts, "svev%c%c", vec_lanes[i].sz, vec_lanes[i].suffix);
-        g_string_append_printf(s,
-                               "<vector id=\"%s\" type=\"%s\" count=\"%d\"/>",
-                               ts->str, vec_lanes[i].gdb_type, count);
-    }
-    /*
-     * Now define a union for each size group containing unsigned and
-     * signed and potentially float versions of each size from 128 to
-     * 8 bits.
-     */
-    for (bits = 128, i = 0; bits >= 8; bits /= 2, i++) {
-        const char suf[] = { 'q', 'd', 's', 'h', 'b' };
-        g_string_append_printf(s, "<union id=\"svevn%c\">", suf[i]);
-        for (j = 0; j < ARRAY_SIZE(vec_lanes); j++) {
-            if (vec_lanes[j].size == bits) {
-                g_string_append_printf(s, "<field name=\"%c\" type=\"svev%c%c\"/>",
-                                       vec_lanes[j].suffix,
-                                       vec_lanes[j].sz, vec_lanes[j].suffix);
-            }
-        }
-        g_string_append(s, "</union>");
-    }
-    /* And now the final union of unions */
-    g_string_append(s, "<union id=\"svev\">");
-    for (bits = 128, i = 0; bits >= 8; bits /= 2, i++) {
-        const char suf[] = { 'q', 'd', 's', 'h', 'b' };
-        g_string_append_printf(s, "<field name=\"%c\" type=\"svevn%c\"/>",
-                               suf[i], suf[i]);
-    }
-    g_string_append(s, "</union>");
-
-    /* Finally the sve prefix type */
-    g_string_append_printf(s,
-                           "<vector id=\"svep\" type=\"uint8\" count=\"%d\"/>",
-                           reg_width / 8);
-
-    /* Then define each register in parts for each vq */
-    for (i = 0; i < 32; i++) {
-        g_string_append_printf(s,
-                               "<reg name=\"z%d\" bitsize=\"%d\""
-                               " regnum=\"%d\" type=\"svev\"/>",
-                               i, reg_width, base_reg++);
-        info->num++;
-    }
-    /* fpscr & status registers */
-    g_string_append_printf(s, "<reg name=\"fpsr\" bitsize=\"32\""
-                           " regnum=\"%d\" group=\"float\""
-                           " type=\"int\"/>", base_reg++);
-    g_string_append_printf(s, "<reg name=\"fpcr\" bitsize=\"32\""
-                           " regnum=\"%d\" group=\"float\""
-                           " type=\"int\"/>", base_reg++);
-    info->num += 2;
-
-    for (i = 0; i < 16; i++) {
-        g_string_append_printf(s,
-                               "<reg name=\"p%d\" bitsize=\"%d\""
-                               " regnum=\"%d\" type=\"svep\"/>",
-                               i, cpu->sve_max_vq * 16, base_reg++);
-        info->num++;
-    }
-    g_string_append_printf(s,
-                           "<reg name=\"ffr\" bitsize=\"%d\""
-                           " regnum=\"%d\" group=\"vector\""
-                           " type=\"svep\"/>",
-                           cpu->sve_max_vq * 16, base_reg++);
-    g_string_append_printf(s,
-                           "<reg name=\"vg\" bitsize=\"64\""
-                           " regnum=\"%d\" type=\"int\"/>",
-                           base_reg++);
-    info->num += 2;
-    g_string_append_printf(s, "</feature>");
-    cpu->dyn_svereg_xml.desc = g_string_free(s, false);
-
-    return cpu->dyn_svereg_xml.num;
-}
-
-
 const char *arm_gdb_get_dynamic_xml(CPUState *cs, const char *xmlname)
 {
     ARMCPU *cpu = ARM_CPU(cs);
diff --git a/target/arm/gdbstub64.c b/target/arm/gdbstub64.c
index c598cb03759..59fb5465d5c 100644
--- a/target/arm/gdbstub64.c
+++ b/target/arm/gdbstub64.c
@@ -209,3 +209,121 @@ int aarch64_gdb_set_sve_reg(CPUARMState *env, uint8_t *buf, int reg)
 
     return 0;
 }
+
+struct TypeSize {
+    const char *gdb_type;
+    short size;
+    char sz, suffix;
+};
+
+static const struct TypeSize vec_lanes[] = {
+    /* quads */
+    { "uint128", 128, 'q', 'u' },
+    { "int128", 128, 'q', 's' },
+    /* 64 bit */
+    { "ieee_double", 64, 'd', 'f' },
+    { "uint64", 64, 'd', 'u' },
+    { "int64", 64, 'd', 's' },
+    /* 32 bit */
+    { "ieee_single", 32, 's', 'f' },
+    { "uint32", 32, 's', 'u' },
+    { "int32", 32, 's', 's' },
+    /* 16 bit */
+    { "ieee_half", 16, 'h', 'f' },
+    { "uint16", 16, 'h', 'u' },
+    { "int16", 16, 'h', 's' },
+    /* bytes */
+    { "uint8", 8, 'b', 'u' },
+    { "int8", 8, 'b', 's' },
+};
+
+int arm_gen_dynamic_svereg_xml(CPUState *cs, int base_reg)
+{
+    ARMCPU *cpu = ARM_CPU(cs);
+    GString *s = g_string_new(NULL);
+    DynamicGDBXMLInfo *info = &cpu->dyn_svereg_xml;
+    g_autoptr(GString) ts = g_string_new("");
+    int i, j, bits, reg_width = (cpu->sve_max_vq * 128);
+    info->num = 0;
+    g_string_printf(s, "<?xml version=\"1.0\"?>");
+    g_string_append_printf(s, "<!DOCTYPE target SYSTEM \"gdb-target.dtd\">");
+    g_string_append_printf(s, "<feature name=\"org.gnu.gdb.aarch64.sve\">");
+
+    /* First define types and totals in a whole VL */
+    for (i = 0; i < ARRAY_SIZE(vec_lanes); i++) {
+        int count = reg_width / vec_lanes[i].size;
+        g_string_printf(ts, "svev%c%c", vec_lanes[i].sz, vec_lanes[i].suffix);
+        g_string_append_printf(s,
+                               "<vector id=\"%s\" type=\"%s\" count=\"%d\"/>",
+                               ts->str, vec_lanes[i].gdb_type, count);
+    }
+    /*
+     * Now define a union for each size group containing unsigned and
+     * signed and potentially float versions of each size from 128 to
+     * 8 bits.
+     */
+    for (bits = 128, i = 0; bits >= 8; bits /= 2, i++) {
+        const char suf[] = { 'q', 'd', 's', 'h', 'b' };
+        g_string_append_printf(s, "<union id=\"svevn%c\">", suf[i]);
+        for (j = 0; j < ARRAY_SIZE(vec_lanes); j++) {
+            if (vec_lanes[j].size == bits) {
+                g_string_append_printf(s, "<field name=\"%c\" type=\"svev%c%c\"/>",
+                                       vec_lanes[j].suffix,
+                                       vec_lanes[j].sz, vec_lanes[j].suffix);
+            }
+        }
+        g_string_append(s, "</union>");
+    }
+    /* And now the final union of unions */
+    g_string_append(s, "<union id=\"svev\">");
+    for (bits = 128, i = 0; bits >= 8; bits /= 2, i++) {
+        const char suf[] = { 'q', 'd', 's', 'h', 'b' };
+        g_string_append_printf(s, "<field name=\"%c\" type=\"svevn%c\"/>",
+                               suf[i], suf[i]);
+    }
+    g_string_append(s, "</union>");
+
+    /* Finally the sve prefix type */
+    g_string_append_printf(s,
+                           "<vector id=\"svep\" type=\"uint8\" count=\"%d\"/>",
+                           reg_width / 8);
+
+    /* Then define each register in parts for each vq */
+    for (i = 0; i < 32; i++) {
+        g_string_append_printf(s,
+                               "<reg name=\"z%d\" bitsize=\"%d\""
+                               " regnum=\"%d\" type=\"svev\"/>",
+                               i, reg_width, base_reg++);
+        info->num++;
+    }
+    /* fpscr & status registers */
+    g_string_append_printf(s, "<reg name=\"fpsr\" bitsize=\"32\""
+                           " regnum=\"%d\" group=\"float\""
+                           " type=\"int\"/>", base_reg++);
+    g_string_append_printf(s, "<reg name=\"fpcr\" bitsize=\"32\""
+                           " regnum=\"%d\" group=\"float\""
+                           " type=\"int\"/>", base_reg++);
+    info->num += 2;
+
+    for (i = 0; i < 16; i++) {
+        g_string_append_printf(s,
+                               "<reg name=\"p%d\" bitsize=\"%d\""
+                               " regnum=\"%d\" type=\"svep\"/>",
+                               i, cpu->sve_max_vq * 16, base_reg++);
+        info->num++;
+    }
+    g_string_append_printf(s,
+                           "<reg name=\"ffr\" bitsize=\"%d\""
+                           " regnum=\"%d\" group=\"vector\""
+                           " type=\"svep\"/>",
+                           cpu->sve_max_vq * 16, base_reg++);
+    g_string_append_printf(s,
+                           "<reg name=\"vg\" bitsize=\"64\""
+                           " regnum=\"%d\" type=\"int\"/>",
+                           base_reg++);
+    info->num += 2;
+    g_string_append_printf(s, "</feature>");
+    info->desc = g_string_free(s, false);
+
+    return info->num;
+}
-- 
2.34.1


