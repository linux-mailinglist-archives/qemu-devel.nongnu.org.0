Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B847E5048CA
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Apr 2022 20:09:33 +0200 (CEST)
Received: from localhost ([::1]:57420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ng9L2-0006v8-Rx
	for lists+qemu-devel@lfdr.de; Sun, 17 Apr 2022 14:09:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng8xM-0001PE-09
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 13:45:04 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:46663)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng8xH-0003Pb-Hm
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 13:45:03 -0400
Received: by mail-pl1-x634.google.com with SMTP id be5so10713848plb.13
 for <qemu-devel@nongnu.org>; Sun, 17 Apr 2022 10:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aDgvjaxwViELgB4ykiyMAgIgM6sZRWkjwRFfHxxhnR0=;
 b=q+10ZK4QziaY93HK4YRlUUL5E30RQARthfc6o4zouS9fSYBBEM1Cmf9bcC6LbhWJI+
 P2MBwBI5kjOhkGR2faHETErquGN/Tu5b6pvpfju1I8Malon3SCrW5y5vHWZF97n+dPPl
 BlDzPP89Lh1xQy62Klv0m1umntPrV/DO3GM+JVqnJ3dR2zzRspyQVSRz11g6S5AsQAT5
 HU8/GdHjArTwVfD0YDRIdPnQe3I3rgyYr/wTGoQGaTXV3WvC8umqzkRMHry64wnSgSD9
 nweyMu79SxtGMPem61MWoNIAJv3nX0g/84ktjiPoHapK5wIHW/F7xUTZWKmZSqWm+yvW
 tsrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aDgvjaxwViELgB4ykiyMAgIgM6sZRWkjwRFfHxxhnR0=;
 b=zrxeKQyulkScvvSDgcGqVH4f5NXCLMjIftkXAO08vPWR7ut8UhJypau8bzUwavU1T4
 igmYhpDSbvm7KiORdLv+/Tjp158WlEJaq082Ar7rY59C2W9bMTlW25+8roWePnGCzE+n
 kP1Cg9cSwUgFJmq7zDsR7sNeh3H672At3O794HlvDWe1hAHhlekWIFNqqwsLyfX/ougJ
 vxZXXWsHp0RFLuYjX6Fzkaxo+qQ/lyffp7RgahTSva9lGESe+Fu2k3wv5rehMaXSdN1t
 Q9G2z976kfLuOwTMpeJO5dwabiJPth+kD9YaggvSGwlUbsjM0zt35Jf4Sre2iBO8L61t
 jr+A==
X-Gm-Message-State: AOAM532NlmIcvrUElREEQ1kkNcR2mQ8cW7FYf3IcXIPkQ4gBztb1Hho+
 kNmZEiQqxTZhwP9+nJa/EGtwgtm7OS0ZTQ==
X-Google-Smtp-Source: ABdhPJzRt8n4xHzQVVryvU7AVDL19Es9oEomVRJqNVLLi/Xzdl/dSjXsX6NiYya0fhadXqKdCz+UIQ==
X-Received: by 2002:a17:902:cece:b0:158:d875:e6d6 with SMTP id
 d14-20020a170902cece00b00158d875e6d6mr7354133plg.165.1650217498102; 
 Sun, 17 Apr 2022 10:44:58 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 i2-20020a17090a138200b001cb6512b579sm10372119pja.44.2022.04.17.10.44.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Apr 2022 10:44:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 33/60] target/arm: Store cpregs key in the hash table
 directly
Date: Sun, 17 Apr 2022 10:43:59 -0700
Message-Id: <20220417174426.711829-34-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220417174426.711829-1-richard.henderson@linaro.org>
References: <20220417174426.711829-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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

Cast the uint32_t key into a gpointer directly, which
allows us to avoid allocating storage for each key.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.c     |  4 ++--
 target/arm/gdbstub.c |  2 +-
 target/arm/helper.c  | 45 ++++++++++++++++++++------------------------
 3 files changed, 23 insertions(+), 28 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 92fc75b2bf..af13b34697 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1080,8 +1080,8 @@ static void arm_cpu_initfn(Object *obj)
     ARMCPU *cpu = ARM_CPU(obj);
 
     cpu_set_cpustate_pointers(cpu);
-    cpu->cp_regs = g_hash_table_new_full(g_int_hash, g_int_equal,
-                                         g_free, cpreg_hashtable_data_destroy);
+    cpu->cp_regs = g_hash_table_new_full(g_direct_hash, g_direct_equal,
+                                         NULL, cpreg_hashtable_data_destroy);
 
     QLIST_INIT(&cpu->pre_el_change_hooks);
     QLIST_INIT(&cpu->el_change_hooks);
diff --git a/target/arm/gdbstub.c b/target/arm/gdbstub.c
index f01a126108..f5b35cd55f 100644
--- a/target/arm/gdbstub.c
+++ b/target/arm/gdbstub.c
@@ -273,7 +273,7 @@ static void arm_gen_one_xml_sysreg_tag(GString *s, DynamicGDBXMLInfo *dyn_xml,
 static void arm_register_sysreg_for_xml(gpointer key, gpointer value,
                                         gpointer p)
 {
-    uint32_t ri_key = *(uint32_t *)key;
+    uint32_t ri_key = (uintptr_t)key;
     ARMCPRegInfo *ri = value;
     RegisterSysregXmlParam *param = (RegisterSysregXmlParam *)p;
     GString *s = param->s;
diff --git a/target/arm/helper.c b/target/arm/helper.c
index aee195400b..db9e75a42d 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -215,11 +215,8 @@ bool write_list_to_cpustate(ARMCPU *cpu)
 static void add_cpreg_to_list(gpointer key, gpointer opaque)
 {
     ARMCPU *cpu = opaque;
-    uint64_t regidx;
-    const ARMCPRegInfo *ri;
-
-    regidx = *(uint32_t *)key;
-    ri = get_arm_cp_reginfo(cpu->cp_regs, regidx);
+    uint32_t regidx = (uintptr_t)key;
+    const ARMCPRegInfo *ri = get_arm_cp_reginfo(cpu->cp_regs, regidx);
 
     if (!(ri->type & (ARM_CP_NO_RAW|ARM_CP_ALIAS))) {
         cpu->cpreg_indexes[cpu->cpreg_array_len] = cpreg_to_kvm_id(regidx);
@@ -231,11 +228,9 @@ static void add_cpreg_to_list(gpointer key, gpointer opaque)
 static void count_cpreg(gpointer key, gpointer opaque)
 {
     ARMCPU *cpu = opaque;
-    uint64_t regidx;
     const ARMCPRegInfo *ri;
 
-    regidx = *(uint32_t *)key;
-    ri = get_arm_cp_reginfo(cpu->cp_regs, regidx);
+    ri = g_hash_table_lookup(cpu->cp_regs, key);
 
     if (!(ri->type & (ARM_CP_NO_RAW|ARM_CP_ALIAS))) {
         cpu->cpreg_array_len++;
@@ -244,8 +239,8 @@ static void count_cpreg(gpointer key, gpointer opaque)
 
 static gint cpreg_key_compare(gconstpointer a, gconstpointer b)
 {
-    uint64_t aidx = cpreg_to_kvm_id(*(uint32_t *)a);
-    uint64_t bidx = cpreg_to_kvm_id(*(uint32_t *)b);
+    uint64_t aidx = cpreg_to_kvm_id((uintptr_t)a);
+    uint64_t bidx = cpreg_to_kvm_id((uintptr_t)b);
 
     if (aidx > bidx) {
         return 1;
@@ -5915,16 +5910,17 @@ static void define_arm_vh_e2h_redirects_aliases(ARMCPU *cpu)
 
     for (i = 0; i < ARRAY_SIZE(aliases); i++) {
         const struct E2HAlias *a = &aliases[i];
-        ARMCPRegInfo *src_reg, *dst_reg, *new_reg;
-        uint32_t *new_key;
+        const ARMCPRegInfo *dst_reg;
+        ARMCPRegInfo *src_reg;
+        ARMCPRegInfo *new_reg;
         bool ok;
 
         if (a->feature && !a->feature(&cpu->isar)) {
             continue;
         }
 
-        src_reg = g_hash_table_lookup(cpu->cp_regs, &a->src_key);
-        dst_reg = g_hash_table_lookup(cpu->cp_regs, &a->dst_key);
+        src_reg = (ARMCPRegInfo *)get_arm_cp_reginfo(cpu->cp_regs, a->src_key);
+        dst_reg = get_arm_cp_reginfo(cpu->cp_regs, a->dst_key);
         g_assert(src_reg != NULL);
         g_assert(dst_reg != NULL);
 
@@ -5937,7 +5933,6 @@ static void define_arm_vh_e2h_redirects_aliases(ARMCPU *cpu)
 
         /* Create alias before redirection so we dup the right data. */
         new_reg = g_memdup(src_reg, sizeof(ARMCPRegInfo));
-        new_key = g_memdup(&a->new_key, sizeof(uint32_t));
 
         new_reg->name = a->new_name;
         new_reg->type |= ARM_CP_ALIAS;
@@ -5956,10 +5951,11 @@ static void define_arm_vh_e2h_redirects_aliases(ARMCPU *cpu)
 
 #undef E
 
-        ok = g_hash_table_insert(cpu->cp_regs, new_key, new_reg);
+        ok = g_hash_table_insert(cpu->cp_regs,
+                                 (gpointer)(uintptr_t)a->new_key, new_reg);
         g_assert(ok);
 
-        src_reg->opaque = dst_reg;
+        src_reg->opaque = (void *)dst_reg;
         src_reg->orig_readfn = src_reg->readfn ?: raw_read;
         src_reg->orig_writefn = src_reg->writefn ?: raw_write;
         if (!src_reg->raw_readfn) {
@@ -8522,7 +8518,7 @@ static void add_cpreg_to_hashtable(ARMCPU *cpu, const ARMCPRegInfo *r,
     /* Private utility function for define_one_arm_cp_reg_with_opaque():
      * add a single reginfo struct to the hash table.
      */
-    uint32_t *key = g_new(uint32_t, 1);
+    uint32_t key;
     ARMCPRegInfo *r2 = g_memdup(r, sizeof(ARMCPRegInfo));
     int is64 = (r->type & ARM_CP_64BIT) ? 1 : 0;
     int ns = (secstate & ARM_CP_SECSTATE_NS) ? 1 : 0;
@@ -8589,10 +8585,10 @@ static void add_cpreg_to_hashtable(ARMCPU *cpu, const ARMCPRegInfo *r,
         if (r->cp == 0 || r->state == ARM_CP_STATE_BOTH) {
             r2->cp = CP_REG_ARM64_SYSREG_CP;
         }
-        *key = ENCODE_AA64_CP_REG(r2->cp, r2->crn, crm,
-                                  r2->opc0, opc1, opc2);
+        key = ENCODE_AA64_CP_REG(r2->cp, r2->crn, crm,
+                                 r2->opc0, opc1, opc2);
     } else {
-        *key = ENCODE_CP_REG(r2->cp, is64, ns, r2->crn, crm, opc1, opc2);
+        key = ENCODE_CP_REG(r2->cp, is64, ns, r2->crn, crm, opc1, opc2);
     }
     if (opaque) {
         r2->opaque = opaque;
@@ -8634,8 +8630,7 @@ static void add_cpreg_to_hashtable(ARMCPU *cpu, const ARMCPRegInfo *r,
      * requested.
      */
     if (!(r->type & ARM_CP_OVERRIDE)) {
-        ARMCPRegInfo *oldreg;
-        oldreg = g_hash_table_lookup(cpu->cp_regs, key);
+        const ARMCPRegInfo *oldreg = get_arm_cp_reginfo(cpu->cp_regs, key);
         if (oldreg && !(oldreg->type & ARM_CP_OVERRIDE)) {
             fprintf(stderr, "Register redefined: cp=%d %d bit "
                     "crn=%d crm=%d opc1=%d opc2=%d, "
@@ -8645,7 +8640,7 @@ static void add_cpreg_to_hashtable(ARMCPU *cpu, const ARMCPRegInfo *r,
             g_assert_not_reached();
         }
     }
-    g_hash_table_insert(cpu->cp_regs, key, r2);
+    g_hash_table_insert(cpu->cp_regs, (gpointer)(uintptr_t)key, r2);
 }
 
 
@@ -8875,7 +8870,7 @@ void modify_arm_cp_regs_with_len(ARMCPRegInfo *regs, size_t regs_len,
 
 const ARMCPRegInfo *get_arm_cp_reginfo(GHashTable *cpregs, uint32_t encoded_cp)
 {
-    return g_hash_table_lookup(cpregs, &encoded_cp);
+    return g_hash_table_lookup(cpregs, (gpointer)(uintptr_t)encoded_cp);
 }
 
 void arm_cp_write_ignore(CPUARMState *env, const ARMCPRegInfo *ri,
-- 
2.25.1


