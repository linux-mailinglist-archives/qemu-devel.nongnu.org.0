Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74C9F6969AB
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 17:33:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRyD1-0006ZC-FK; Tue, 14 Feb 2023 11:31:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pRyCr-0006R8-BA
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 11:31:02 -0500
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pRyCo-00026g-HD
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 11:31:01 -0500
Received: by mail-pg1-x52b.google.com with SMTP id a23so10550842pga.13
 for <qemu-devel@nongnu.org>; Tue, 14 Feb 2023 08:30:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mvgiDpyQbdYw4jcH8pTJPq847zR7SPy67CXXghghUYE=;
 b=LZZ/dH8zlSqvMJYS02qMFGIvYKekLhRLiBgyZNz56bGgKKjSXMFtjqX61y/iPvOson
 AH7Bd/yIjCrpdubFKM3g7pce4ZHABuCzyKwmHbPSw+lkvjGXagJnto4S1D4awaf3v5Fh
 1eC1plwyD3BxQm8/Y9L9Bsi0lHAj8FPb1DzbX3dpMsB30gEdvH5XQ0oTg5I27mIsrs3d
 x8K91G+4R5rq5qncvNNxNxDsmcUMDhIHjrlgFqDKswbJp7AGmVmX9csW/j6lMr14313D
 RJFhEp3tmAwk4VdQ/PXJ/I1vUQ3MdAVSft/capBicZu8+V3APKc6fL34zfwVov6iyJCp
 nJwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mvgiDpyQbdYw4jcH8pTJPq847zR7SPy67CXXghghUYE=;
 b=oOVZcmMcAO9thS3WBt3MPeFIhfCukQK9mCyICGrW2aL9Rfk2JzmqT5qi91KwUM/by1
 iKTVBttfMaENzHD/TNRrjxzeh7rSXE5/7zYB2pLSrxxpXBPM6eaS8ozbO07pA1GikjQl
 VMyuys2DQHVDcVA70b9XSIY2qTRfS1qt1LWYD7CGfbT/3RlBqt/a5uofTqiuiAzdNghZ
 /voiHoveHp6MxpACelaBFXZypTtzxwfofnCaG4GET+li7ABRORQX77ryZoyi49TsxOZO
 grWUVbx7MOElyXdXK0qqUjgUWKyxzjl+pas680166S/1IRfA6iUG5JWk5w8cG7hJ80RJ
 PayQ==
X-Gm-Message-State: AO0yUKUYTGt8nf3nofpNt9/07xxfdXUZjrVGKm5ysfx3tHSLN8bRwMZr
 S7gAzYapjG4Lkd3ktP3pkMaw+pG4Qx+lzZ7ArkM=
X-Google-Smtp-Source: AK7set/qOGl66TACFUduoxdI5RoTdIPYF6kRSHXT4yz1TuBRbBl956YMmSzbzRz/LOTCho/AY/fGzA==
X-Received: by 2002:a62:cf03:0:b0:5a8:cf20:e35e with SMTP id
 b3-20020a62cf03000000b005a8cf20e35emr2487057pfg.3.1676392256006; 
 Tue, 14 Feb 2023 08:30:56 -0800 (PST)
Received: from stoup.. (rrcs-74-87-59-234.west.biz.rr.com. [74.87.59.234])
 by smtp.gmail.com with ESMTPSA id
 d17-20020aa78691000000b0058d99337381sm10337011pfo.172.2023.02.14.08.30.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Feb 2023 08:30:55 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 03/14] target/arm: Move arm_gen_dynamic_svereg_xml to
 gdbstub64.c
Date: Tue, 14 Feb 2023 06:30:37 -1000
Message-Id: <20230214163048.903964-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230214163048.903964-1-richard.henderson@linaro.org>
References: <20230214163048.903964-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
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

The function is only used for aarch64, so move it to the
file that has the other aarch64 gdbstub stuff.  Move the
declaration to internals.h.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h       |   6 ---
 target/arm/internals.h |   1 +
 target/arm/gdbstub.c   | 120 -----------------------------------------
 target/arm/gdbstub64.c | 118 ++++++++++++++++++++++++++++++++++++++++
 4 files changed, 119 insertions(+), 126 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index b2c49b3605..c9f768f945 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1110,12 +1110,6 @@ hwaddr arm_cpu_get_phys_page_attrs_debug(CPUState *cpu, vaddr addr,
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
index 69b5e7ba73..c98482561e 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1340,6 +1340,7 @@ static inline uint64_t pmu_counter_mask(CPUARMState *env)
 }
 
 #ifdef TARGET_AARCH64
+int arm_gen_dynamic_svereg_xml(CPUState *cpu, int base_reg);
 int aarch64_gdb_get_sve_reg(CPUARMState *env, GByteArray *buf, int reg);
 int aarch64_gdb_set_sve_reg(CPUARMState *env, uint8_t *buf, int reg);
 int aarch64_gdb_get_fpu_reg(CPUARMState *env, GByteArray *buf, int reg);
diff --git a/target/arm/gdbstub.c b/target/arm/gdbstub.c
index 52581e9784..bf8aff7824 100644
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
index c598cb0375..59fb5465d5 100644
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


