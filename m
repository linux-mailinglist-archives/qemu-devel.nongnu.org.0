Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A43A65048E8
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Apr 2022 20:29:15 +0200 (CEST)
Received: from localhost ([::1]:45538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ng9e6-0003JX-Nf
	for lists+qemu-devel@lfdr.de; Sun, 17 Apr 2022 14:29:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng8xM-0001QN-BW
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 13:45:04 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:35498)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng8xI-0003QB-8Q
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 13:45:03 -0400
Received: by mail-pg1-x536.google.com with SMTP id k62so8888438pgd.2
 for <qemu-devel@nongnu.org>; Sun, 17 Apr 2022 10:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KVOnCjEQiAnuJHjeIoAiZ0aHmG7YiIy0zMzqF1b7fG4=;
 b=TqDEJM02ssx29JOqmz9Ai/+UgG1EM0RDDecBUXMP9J+WMfeXKpilxyLuyJJFIPn19B
 B9DYeglGHwX0uURJL+g9eJSz5yj1GWODAKqBkZchjbrOBRzZ0LABrkSArdMJEBUJu20Q
 iz/gPVM18G8ayOY+FUEWdbGWdpysESPccDmN64MRouWzPuS6BJ7Db8DWOQL2FTz+xtyg
 1AiJjOQZMq3qWQ2LnLqt/zJy8xI4MRD54gshSr1/3LSZl5ZRg488lPmxA2er17cPz8Hr
 pYDGZ4DxjYpnv6v5/SzEKqn41gvfv83ndUq5PtFkvTdFTiE/FYIi0BMkUQDQ6NhOq514
 MdeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KVOnCjEQiAnuJHjeIoAiZ0aHmG7YiIy0zMzqF1b7fG4=;
 b=HdG+2Xe+SFQ56GzQl8YHV4jbw33CVGoVgVqfb7ggNOKvtr9exNTBBNlxwXmlIdyHz5
 XWDQpQS4VG5uSKgxC0lSKBGcTkvNLFBqgs16wShC4h08Te24JZfl75iqxqV+B+PXPHIQ
 l8Rxt4LqHagryhGWIgVNAAmXUl6UtyDWweCEhOJbMBHYBLbkTZH1u11Mc1/c2DLPkdhC
 bSfYGkhTv4jLAFvyWoqPU/WifciLglITF6BBnqZapBadl6h5a0bRPuWe011aVF3SvuEB
 iziiG84FPuSQyUKl0hV37ojjw7uJUBVr7RSRS2Vn1S1ZM94ujAA5QSkzNVXSdnGIQxd4
 vQ8g==
X-Gm-Message-State: AOAM533rM3s+G8Cj80BxPZrE+faGBuzLD+DotOmXu9StRPG9RYF9soWH
 O55qfpSNj52MJf5GM3qgOdOQbqtzICe9kw==
X-Google-Smtp-Source: ABdhPJxAzvANBVyMl+OFjETehWHeAaYoP+LoD84mj0oCdPSUZjJybOA/crFXUPZYGiKX6T4W3SvPZQ==
X-Received: by 2002:a63:444f:0:b0:39d:3aa5:c9f0 with SMTP id
 t15-20020a63444f000000b0039d3aa5c9f0mr7176015pgk.363.1650217498857; 
 Sun, 17 Apr 2022 10:44:58 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 i2-20020a17090a138200b001cb6512b579sm10372119pja.44.2022.04.17.10.44.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Apr 2022 10:44:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 34/60] target/arm: Cleanup add_cpreg_to_hashtable
Date: Sun, 17 Apr 2022 10:44:00 -0700
Message-Id: <20220417174426.711829-35-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220417174426.711829-1-richard.henderson@linaro.org>
References: <20220417174426.711829-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use a single memory allocation for name and reginfo.
Perform the override check early; use assert not printf+abort.
Use a switch statement to validate state.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.c    |  16 +----
 target/arm/helper.c | 154 +++++++++++++++++++++++---------------------
 2 files changed, 81 insertions(+), 89 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index af13b34697..3da8841eb2 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1061,27 +1061,13 @@ uint64_t arm_cpu_mp_affinity(int idx, uint8_t clustersz)
     return (Aff1 << ARM_AFF1_SHIFT) | Aff0;
 }
 
-static void cpreg_hashtable_data_destroy(gpointer data)
-{
-    /*
-     * Destroy function for cpu->cp_regs hashtable data entries.
-     * We must free the name string because it was g_strdup()ed in
-     * add_cpreg_to_hashtable(). It's OK to cast away the 'const'
-     * from r->name because we know we definitely allocated it.
-     */
-    ARMCPRegInfo *r = data;
-
-    g_free((void *)r->name);
-    g_free(r);
-}
-
 static void arm_cpu_initfn(Object *obj)
 {
     ARMCPU *cpu = ARM_CPU(obj);
 
     cpu_set_cpustate_pointers(cpu);
     cpu->cp_regs = g_hash_table_new_full(g_direct_hash, g_direct_equal,
-                                         NULL, cpreg_hashtable_data_destroy);
+                                         NULL, g_free);
 
     QLIST_INIT(&cpu->pre_el_change_hooks);
     QLIST_INIT(&cpu->el_change_hooks);
diff --git a/target/arm/helper.c b/target/arm/helper.c
index db9e75a42d..562ea5c418 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -8509,37 +8509,90 @@ CpuDefinitionInfoList *qmp_query_cpu_definitions(Error **errp)
     return cpu_list;
 }
 
+/*
+ * Private utility function for define_one_arm_cp_reg_with_opaque():
+ * add a single reginfo struct to the hash table.
+ */
 static void add_cpreg_to_hashtable(ARMCPU *cpu, const ARMCPRegInfo *r,
                                    void *opaque, CPState state,
                                    CPSecureState secstate,
                                    int crm, int opc1, int opc2,
                                    const char *name)
 {
-    /* Private utility function for define_one_arm_cp_reg_with_opaque():
-     * add a single reginfo struct to the hash table.
-     */
     uint32_t key;
-    ARMCPRegInfo *r2 = g_memdup(r, sizeof(ARMCPRegInfo));
-    int is64 = (r->type & ARM_CP_64BIT) ? 1 : 0;
-    int ns = (secstate & ARM_CP_SECSTATE_NS) ? 1 : 0;
+    ARMCPRegInfo *r2;
+    bool is64 = r->type & ARM_CP_64BIT;
+    bool ns = secstate & ARM_CP_SECSTATE_NS;
+    int cp = r->cp;
+    bool isbanked;
+    size_t name_len;
 
-    r2->name = g_strdup(name);
-    /* Reset the secure state to the specific incoming state.  This is
-     * necessary as the register may have been defined with both states.
+    switch (state) {
+    case ARM_CP_STATE_AA32:
+        /* We assume it is a cp15 register if the .cp field is left unset. */
+        if (cp == 0 && r->state == ARM_CP_STATE_BOTH) {
+            cp = 15;
+        }
+        key = ENCODE_CP_REG(cp, is64, ns, r->crn, crm, opc1, opc2);
+        break;
+    case ARM_CP_STATE_AA64:
+        /*
+         * To allow abbreviation of ARMCPRegInfo definitions, we treat
+         * cp == 0 as equivalent to the value for "standard guest-visible
+         * sysreg".  STATE_BOTH definitions are also always "standard sysreg"
+         * in their AArch64 view (the .cp value may be non-zero for the
+         * benefit of the AArch32 view).
+         */
+        if (cp == 0 || r->state == ARM_CP_STATE_BOTH) {
+            cp = CP_REG_ARM64_SYSREG_CP;
+        }
+        key = ENCODE_AA64_CP_REG(cp, r->crn, crm, r->opc0, opc1, opc2);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+
+    /* Overriding of an existing definition must be explicitly requested. */
+    if (!(r->type & ARM_CP_OVERRIDE)) {
+        const ARMCPRegInfo *oldreg = get_arm_cp_reginfo(cpu->cp_regs, key);
+        if (oldreg) {
+            assert(oldreg->type & ARM_CP_OVERRIDE);
+        }
+    }
+
+    /* Combine cpreg and name into one allocation. */
+    name_len = strlen(name) + 1;
+    r2 = g_malloc(sizeof(*r2) + name_len);
+    *r2 = *r;
+    r2->name = memcpy(r2 + 1, name, name_len);
+
+    /*
+     * Update fields to match the instantiation, overwiting wildcards
+     * such as CP_ANY, ARM_CP_STATE_BOTH, or ARM_CP_SECSTATE_BOTH.
      */
+    r2->cp = cp;
+    r2->crm = crm;
+    r2->opc1 = opc1;
+    r2->opc2 = opc2;
+    r2->state = state;
     r2->secure = secstate;
+    if (opaque) {
+        r2->opaque = opaque;
+    }
 
-    if (r->bank_fieldoffsets[0] && r->bank_fieldoffsets[1]) {
-        /* Register is banked (using both entries in array).
+    isbanked = r->bank_fieldoffsets[0] && r->bank_fieldoffsets[1];
+    if (isbanked) {
+        /*
+         * Register is banked (using both entries in array).
          * Overwriting fieldoffset as the array is only used to define
          * banked registers but later only fieldoffset is used.
          */
         r2->fieldoffset = r->bank_fieldoffsets[ns];
     }
-
     if (state == ARM_CP_STATE_AA32) {
-        if (r->bank_fieldoffsets[0] && r->bank_fieldoffsets[1]) {
-            /* If the register is banked then we don't need to migrate or
+        if (isbanked) {
+            /*
+             * If the register is banked then we don't need to migrate or
              * reset the 32-bit instance in certain cases:
              *
              * 1) If the register has both 32-bit and 64-bit instances then we
@@ -8554,56 +8607,22 @@ static void add_cpreg_to_hashtable(ARMCPU *cpu, const ARMCPRegInfo *r,
                 r2->type |= ARM_CP_ALIAS;
             }
         } else if ((secstate != r->secure) && !ns) {
-            /* The register is not banked so we only want to allow migration of
-             * the non-secure instance.
+            /*
+             * The register is not banked so we only want to allow migration
+             * of the non-secure instance.
              */
             r2->type |= ARM_CP_ALIAS;
         }
 
-        if (r->state == ARM_CP_STATE_BOTH) {
-            /* We assume it is a cp15 register if the .cp field is left unset.
-             */
-            if (r2->cp == 0) {
-                r2->cp = 15;
-            }
-
+        if (r->state == ARM_CP_STATE_BOTH && r->fieldoffset) {
 #ifdef HOST_WORDS_BIGENDIAN
-            if (r2->fieldoffset) {
-                r2->fieldoffset += sizeof(uint32_t);
-            }
+            r2->fieldoffset += sizeof(uint32_t);
 #endif
         }
     }
-    if (state == ARM_CP_STATE_AA64) {
-        /* To allow abbreviation of ARMCPRegInfo
-         * definitions, we treat cp == 0 as equivalent to
-         * the value for "standard guest-visible sysreg".
-         * STATE_BOTH definitions are also always "standard
-         * sysreg" in their AArch64 view (the .cp value may
-         * be non-zero for the benefit of the AArch32 view).
-         */
-        if (r->cp == 0 || r->state == ARM_CP_STATE_BOTH) {
-            r2->cp = CP_REG_ARM64_SYSREG_CP;
-        }
-        key = ENCODE_AA64_CP_REG(r2->cp, r2->crn, crm,
-                                 r2->opc0, opc1, opc2);
-    } else {
-        key = ENCODE_CP_REG(r2->cp, is64, ns, r2->crn, crm, opc1, opc2);
-    }
-    if (opaque) {
-        r2->opaque = opaque;
-    }
-    /* reginfo passed to helpers is correct for the actual access,
-     * and is never ARM_CP_STATE_BOTH:
-     */
-    r2->state = state;
-    /* Make sure reginfo passed to helpers for wildcarded regs
-     * has the correct crm/opc1/opc2 for this reg, not CP_ANY:
-     */
-    r2->crm = crm;
-    r2->opc1 = opc1;
-    r2->opc2 = opc2;
-    /* By convention, for wildcarded registers only the first
+
+    /*
+     * By convention, for wildcarded registers only the first
      * entry is used for migration; the others are marked as
      * ALIAS so we don't try to transfer the register
      * multiple times. Special registers (ie NOP/WFI) are
@@ -8612,13 +8631,14 @@ static void add_cpreg_to_hashtable(ARMCPU *cpu, const ARMCPRegInfo *r,
     if (r->type & ARM_CP_SPECIAL_MASK) {
         r2->type |= ARM_CP_NO_RAW;
     }
-    if (((r->crm == CP_ANY) && crm != 0) ||
-        ((r->opc1 == CP_ANY) && opc1 != 0) ||
-        ((r->opc2 == CP_ANY) && opc2 != 0)) {
+    if ((r->crm == CP_ANY && crm != 0) ||
+        (r->opc1 == CP_ANY && opc1 != 0) ||
+        (r->opc2 == CP_ANY && opc2 != 0)) {
         r2->type |= ARM_CP_ALIAS | ARM_CP_NO_GDB;
     }
 
-    /* Check that raw accesses are either forbidden or handled. Note that
+    /*
+     * Check that raw accesses are either forbidden or handled. Note that
      * we can't assert this earlier because the setup of fieldoffset for
      * banked registers has to be done first.
      */
@@ -8626,20 +8646,6 @@ static void add_cpreg_to_hashtable(ARMCPU *cpu, const ARMCPRegInfo *r,
         assert(!raw_accessors_invalid(r2));
     }
 
-    /* Overriding of an existing definition must be explicitly
-     * requested.
-     */
-    if (!(r->type & ARM_CP_OVERRIDE)) {
-        const ARMCPRegInfo *oldreg = get_arm_cp_reginfo(cpu->cp_regs, key);
-        if (oldreg && !(oldreg->type & ARM_CP_OVERRIDE)) {
-            fprintf(stderr, "Register redefined: cp=%d %d bit "
-                    "crn=%d crm=%d opc1=%d opc2=%d, "
-                    "was %s, now %s\n", r2->cp, 32 + 32 * is64,
-                    r2->crn, r2->crm, r2->opc1, r2->opc2,
-                    oldreg->name, r2->name);
-            g_assert_not_reached();
-        }
-    }
     g_hash_table_insert(cpu->cp_regs, (gpointer)(uintptr_t)key, r2);
 }
 
-- 
2.25.1


