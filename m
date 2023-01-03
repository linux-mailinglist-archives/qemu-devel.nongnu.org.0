Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE1C865C629
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Jan 2023 19:26:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pClrd-0000Bb-08; Tue, 03 Jan 2023 13:18:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pClr8-0008Lc-Oz
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 13:17:49 -0500
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pClr6-0005Fq-Sm
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 13:17:46 -0500
Received: by mail-qt1-x831.google.com with SMTP id bp44so22549670qtb.0
 for <qemu-devel@nongnu.org>; Tue, 03 Jan 2023 10:17:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ovrzlFU5k82ZgCppHjlpfiJtVNxGU+QnnGdphNskZzQ=;
 b=NX0fx278JDrgNVIG7ZrjCXhyYNuWS7NQjjJYOvJgqMtjeV2JCPJuZ/hJCIHpeDBwhD
 HjArKLZ6VTnsL573Vbunv82OPpqjR93TIyVxzXkYoWsweKiffTLWOb/xWzgVKj0VpPex
 kpdHCsLp5/VVlPL4/HEgwQfCrDUwf9HNK0boKMP04soTKI8f/MIJLqK9zpgFhkRs91tk
 W10FYyXpTW1f5l0LWXAl1n9DpMFJAXjcNGU73vJODJjezq00wA1JjcixL9kjloH5WbvF
 hib2TSvIz0sRa8RSI6vofBAi1YVQby/mTtRnOIVBHrY7HpR+lxqRzUV+jm1JK2RwC41b
 QCMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ovrzlFU5k82ZgCppHjlpfiJtVNxGU+QnnGdphNskZzQ=;
 b=xd6xLtgCNYXjYLDAZ/5E6AFN9ANuPXeTtiSccE4YP3qW3wXQJy0LlM1N/M3N0YMkk/
 j4aHAM+aRP7BFAg491ve7mlTDlmiwQEjJU0QPL2TI8FH9RB8X/mIP1oIhsWcmRUcGMOj
 aCl6ql2d/5aPLS7CNS+bLAIzyBq40ukG9gF2Ixab6J+19RIiV6Oe4unTpb4KtTM+KwZ+
 ekRdHuh/eMdaecsrEoWnwhZ6vvLm21Te2ZDY22Jh4V9T44qbdmyv1mXl8rygnzLxQD8W
 iISzpxmV4wYYkwPgZTfYO1WKEWS9ZMWT16xJj46orC8NUujBEO3qLAjpksC0nCzh0XFU
 5sOA==
X-Gm-Message-State: AFqh2kpBsyTeq7+3ICFgdkqovDLkLnHYsp9IJnc4/T9jTB7tphNaEtyF
 BvZKw4vaPn2pMIxzXP4p1J5RuMuKPFBWQlv9Ygw=
X-Google-Smtp-Source: AMrXdXtbTghI6U/y+yxD5gLvIUnReaPRICy5HE/KObfyOJCqAUnZLuh1A59546GHiyltDHUziGm4CA==
X-Received: by 2002:ac8:4b4c:0:b0:3a6:58fd:4e5e with SMTP id
 e12-20020ac84b4c000000b003a658fd4e5emr62796257qts.24.1672769863124; 
 Tue, 03 Jan 2023 10:17:43 -0800 (PST)
Received: from stoup.. ([2607:fb90:8060:51a2:184b:6e49:c396:be2])
 by smtp.gmail.com with ESMTPSA id
 v2-20020a05620a440200b006fed2788751sm23042354qkp.76.2023.01.03.10.17.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Jan 2023 10:17:42 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, berrange@redhat.com, eduardo@habkost.net,
 armbru@redhat.com, ajones@ventanamicro.com, alex.bennee@linaro.org
Subject: [RFC PATCH 18/40] target/arm: Create cpreg definition functions with
 GHashTable arg
Date: Tue,  3 Jan 2023 10:16:24 -0800
Message-Id: <20230103181646.55711-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230103181646.55711-1-richard.henderson@linaro.org>
References: <20230103181646.55711-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::831;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x831.google.com
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

This will allow registration of cpregs at the class level.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpregs.h | 33 +++++++++++++++++++++++++++----
 target/arm/helper.c | 47 +++++++++++++++++++++++++--------------------
 2 files changed, 55 insertions(+), 25 deletions(-)

diff --git a/target/arm/cpregs.h b/target/arm/cpregs.h
index 7e78c2c05c..11926c643e 100644
--- a/target/arm/cpregs.h
+++ b/target/arm/cpregs.h
@@ -381,16 +381,33 @@ struct ARMCPRegInfo {
 #define CPREG_FIELD64(env, ri) \
     (*(uint64_t *)((char *)(env) + (ri)->fieldoffset))
 
-void define_one_arm_cp_reg_with_opaque(ARMCPU *cpu, const ARMCPRegInfo *reg,
-                                       void *opaque);
+void define_one_arm_cp_reg_with_table(GHashTable *cp_regs, uint64_t features,
+                                      const ARMCPRegInfo *reg, void *opaque);
+
+void define_arm_cp_regs_with_table(GHashTable *cp_regs, uint64_t features,
+                                   const ARMCPRegInfo *regs,
+                                   void *opaque, size_t len);
+
+static inline void
+define_one_arm_cp_reg_with_opaque(ARMCPU *cpu, const ARMCPRegInfo *reg,
+                                  void *opaque)
+{
+    define_one_arm_cp_reg_with_table(cpu->cp_regs, cpu->env.features,
+                                     reg, opaque);
+}
 
 static inline void define_one_arm_cp_reg(ARMCPU *cpu, const ARMCPRegInfo *regs)
 {
     define_one_arm_cp_reg_with_opaque(cpu, regs, NULL);
 }
 
-void define_arm_cp_regs_with_opaque_len(ARMCPU *cpu, const ARMCPRegInfo *regs,
-                                        void *opaque, size_t len);
+static inline void
+define_arm_cp_regs_with_opaque_len(ARMCPU *cpu, const ARMCPRegInfo *regs,
+                                   void *opaque, size_t len)
+{
+    define_arm_cp_regs_with_table(cpu->cp_regs, cpu->env.features,
+                                  regs, opaque, len);
+}
 
 #define define_arm_cp_regs_with_opaque(CPU, REGS, OPAQUE)               \
     do {                                                                \
@@ -402,6 +419,14 @@ void define_arm_cp_regs_with_opaque_len(ARMCPU *cpu, const ARMCPRegInfo *regs,
 #define define_arm_cp_regs(CPU, REGS) \
     define_arm_cp_regs_with_opaque(CPU, REGS, NULL)
 
+#define define_arm_cp_regs_with_class(ACC, REGS, OPAQUE)                \
+    do {                                                                \
+        QEMU_BUILD_BUG_ON(ARRAY_SIZE(REGS) == 0);                       \
+        ARMCPUClass *acc_ = (ACC);                                      \
+        define_arm_cp_regs_with_table(acc_->cp_regs, acc_->features,    \
+                                      REGS, OPAQUE, ARRAY_SIZE(REGS));  \
+    } while (0)
+
 const ARMCPRegInfo *get_arm_cp_reginfo(GHashTable *cpregs, uint32_t encoded_cp);
 
 /*
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 8f5097f995..43756e130a 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -8527,13 +8527,13 @@ CpuDefinitionInfoList *qmp_query_cpu_definitions(Error **errp)
  * Private utility function for define_one_arm_cp_reg_with_opaque():
  * add a single reginfo struct to the hash table.
  */
-static void add_cpreg_to_hashtable(ARMCPU *cpu, const ARMCPRegInfo *r,
+static void add_cpreg_to_hashtable(GHashTable *cp_regs, uint64_t features,
+                                   const ARMCPRegInfo *r,
                                    void *opaque, CPState state,
                                    CPSecureState secstate,
                                    int crm, int opc1, int opc2,
                                    const char *name)
 {
-    CPUARMState *env = &cpu->env;
     uint32_t key;
     ARMCPRegInfo *r2;
     bool is64 = r->type & ARM_CP_64BIT;
@@ -8541,6 +8541,7 @@ static void add_cpreg_to_hashtable(ARMCPU *cpu, const ARMCPRegInfo *r,
     int cp = r->cp;
     size_t name_len;
     bool make_const;
+    bool have_el2;
 
     switch (state) {
     case ARM_CP_STATE_AA32:
@@ -8569,7 +8570,7 @@ static void add_cpreg_to_hashtable(ARMCPU *cpu, const ARMCPRegInfo *r,
 
     /* Overriding of an existing definition must be explicitly requested. */
     if (!(r->type & ARM_CP_OVERRIDE)) {
-        const ARMCPRegInfo *oldreg = get_arm_cp_reginfo(cpu->cp_regs, key);
+        const ARMCPRegInfo *oldreg = get_arm_cp_reginfo(cp_regs, key);
         if (oldreg) {
             assert(oldreg->type & ARM_CP_OVERRIDE);
         }
@@ -8581,21 +8582,21 @@ static void add_cpreg_to_hashtable(ARMCPU *cpu, const ARMCPRegInfo *r,
      * feature into the same ARMCPRegInfo array and define them all at once.
      */
     make_const = false;
-    if (arm_feature(env, ARM_FEATURE_EL3)) {
+    have_el2 = features & (1ull << ARM_FEATURE_EL2);
+    if (features & (1ull << ARM_FEATURE_EL3)) {
         /*
          * An EL2 register without EL2 but with EL3 is (usually) RES0.
          * See rule RJFFP in section D1.1.3 of DDI0487H.a.
          */
         int min_el = ctz32(r->access) / 2;
-        if (min_el == 2 && !arm_feature(env, ARM_FEATURE_EL2)) {
+        if (min_el == 2 && !have_el2) {
             if (r->type & ARM_CP_EL3_NO_EL2_UNDEF) {
                 return;
             }
             make_const = !(r->type & ARM_CP_EL3_NO_EL2_KEEP);
         }
     } else {
-        CPAccessRights max_el = (arm_feature(env, ARM_FEATURE_EL2)
-                                 ? PL2_RW : PL1_RW);
+        CPAccessRights max_el = have_el2 ? PL2_RW : PL1_RW;
         if ((r->access & max_el) == 0) {
             return;
         }
@@ -8677,7 +8678,7 @@ static void add_cpreg_to_hashtable(ARMCPU *cpu, const ARMCPRegInfo *r,
                  *    that separate 32 and 64-bit definitions are provided.
                  */
                 if ((r->state == ARM_CP_STATE_BOTH && ns) ||
-                    (arm_feature(env, ARM_FEATURE_V8) && !ns)) {
+                    ((features & (1ull << ARM_FEATURE_V8)) && !ns)) {
                     r2->type |= ARM_CP_ALIAS;
                 }
             } else if ((secstate != r->secure) && !ns) {
@@ -8720,12 +8721,11 @@ static void add_cpreg_to_hashtable(ARMCPU *cpu, const ARMCPRegInfo *r,
         assert(!raw_accessors_invalid(r2));
     }
 
-    g_hash_table_insert(cpu->cp_regs, (gpointer)(uintptr_t)key, r2);
+    g_hash_table_insert(cp_regs, (gpointer)(uintptr_t)key, r2);
 }
 
-
-void define_one_arm_cp_reg_with_opaque(ARMCPU *cpu,
-                                       const ARMCPRegInfo *r, void *opaque)
+void define_one_arm_cp_reg_with_table(GHashTable *cp_regs, uint64_t features,
+                                      const ARMCPRegInfo *r, void *opaque)
 {
     /* Define implementations of coprocessor registers.
      * We store these in a hashtable because typically
@@ -8781,8 +8781,8 @@ void define_one_arm_cp_reg_with_opaque(ARMCPU *cpu,
         }
         /* fall through */
     case ARM_CP_STATE_AA32:
-        if (arm_feature(&cpu->env, ARM_FEATURE_V8) &&
-            !arm_feature(&cpu->env, ARM_FEATURE_M)) {
+        if ((features & (1ull << ARM_FEATURE_V8)) &&
+            !(features & (1ull << ARM_FEATURE_M))) {
             assert(r->cp >= 14 && r->cp <= 15);
         } else {
             assert(r->cp < 8 || (r->cp >= 14 && r->cp <= 15));
@@ -8869,17 +8869,20 @@ void define_one_arm_cp_reg_with_opaque(ARMCPU *cpu,
                         switch (r->secure) {
                         case ARM_CP_SECSTATE_S:
                         case ARM_CP_SECSTATE_NS:
-                            add_cpreg_to_hashtable(cpu, r, opaque, state,
+                            add_cpreg_to_hashtable(cp_regs, features, r,
+                                                   opaque, state,
                                                    r->secure, crm, opc1, opc2,
                                                    r->name);
                             break;
                         case ARM_CP_SECSTATE_BOTH:
                             name = g_strdup_printf("%s_S", r->name);
-                            add_cpreg_to_hashtable(cpu, r, opaque, state,
+                            add_cpreg_to_hashtable(cp_regs, features, r,
+                                                   opaque, state,
                                                    ARM_CP_SECSTATE_S,
                                                    crm, opc1, opc2, name);
                             g_free(name);
-                            add_cpreg_to_hashtable(cpu, r, opaque, state,
+                            add_cpreg_to_hashtable(cp_regs, features, r,
+                                                   opaque, state,
                                                    ARM_CP_SECSTATE_NS,
                                                    crm, opc1, opc2, r->name);
                             break;
@@ -8889,7 +8892,8 @@ void define_one_arm_cp_reg_with_opaque(ARMCPU *cpu,
                     } else {
                         /* AArch64 registers get mapped to non-secure instance
                          * of AArch32 */
-                        add_cpreg_to_hashtable(cpu, r, opaque, state,
+                        add_cpreg_to_hashtable(cp_regs, features, r,
+                                               opaque, state,
                                                ARM_CP_SECSTATE_NS,
                                                crm, opc1, opc2, r->name);
                     }
@@ -8900,12 +8904,13 @@ void define_one_arm_cp_reg_with_opaque(ARMCPU *cpu,
 }
 
 /* Define a whole list of registers */
-void define_arm_cp_regs_with_opaque_len(ARMCPU *cpu, const ARMCPRegInfo *regs,
-                                        void *opaque, size_t len)
+void define_arm_cp_regs_with_table(GHashTable *cp_regs, uint64_t features,
+                                   const ARMCPRegInfo *regs,
+                                   void *opaque, size_t len)
 {
     size_t i;
     for (i = 0; i < len; ++i) {
-        define_one_arm_cp_reg_with_opaque(cpu, regs + i, opaque);
+        define_one_arm_cp_reg_with_table(cp_regs, features, regs + i, opaque);
     }
 }
 
-- 
2.34.1


