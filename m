Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ED6F59156F
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Aug 2022 20:23:19 +0200 (CEST)
Received: from localhost ([::1]:38304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMZJW-0001vV-4e
	for lists+qemu-devel@lfdr.de; Fri, 12 Aug 2022 14:23:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oMZ54-0003Vm-7B
 for qemu-devel@nongnu.org; Fri, 12 Aug 2022 14:08:23 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:53088)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oMZ52-0006XK-Ds
 for qemu-devel@nongnu.org; Fri, 12 Aug 2022 14:08:21 -0400
Received: by mail-pj1-x102c.google.com with SMTP id ha11so1684879pjb.2
 for <qemu-devel@nongnu.org>; Fri, 12 Aug 2022 11:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=zLRxaasl4+x84svDvG8c3cbdQrK278he5Svo5wRC8nA=;
 b=cETksFk4/WjbelGXaMiLpboEpx2SJGWBTHydRs4r335eU5m7yUTQALR1lolY7OFlz2
 cLObBLzAPB7kFHnKp4dTjTa5x8JRvmO0bi87pOzV62xLjrsPwYqtFQDHFZn0h88cAOUl
 m3+vi6E+jMd6sMK+j7Pz9+9F2fhVS5r5kY4Ek5pGvTeI2AzEbekLwBlzWRlmU9ctQ3m/
 w0MKJOXnj3MyvznA+OGfCuEdiw63NeoaHphhw4jC/6yL7RA0Sv1WWhHpcM+lghZK96Fy
 YKPd46jjKJ+6sEfj5t9V3n7iESEQ+//gIaJUkOjr6wX+iJ0VPR8Qoi9KIu76rQs5dKRE
 zqNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=zLRxaasl4+x84svDvG8c3cbdQrK278he5Svo5wRC8nA=;
 b=VLE5svwY2lf2WIECKerwFklqiGUzX5/LH85SEQ1pl63rX3JCytj1WcM+R3PgJ0RpEM
 TdPa1lWlNDDNvM1i2HQ/dd4c0hEnBFhVax55r3cjUE48Lc9taFMxM6ytEk16/GTw0dss
 J0nzpfn9rQl2n/07q136DB5g7Ppx01511nX6q4StOa1hDR5BLCroFP1B5WJXJGWwU3Po
 cfXbUz/YetUNa2MiruATegCX2ON3DDD+0mjwTkaKg7v2zmiz2mvTSQCAweCysVM+lL3T
 GPTcFunr1s9l6eLflZH4UW82UR4ppTi2PKMp57KlB3ebshxKNY4E3vJ7Ig16lK/Ay19i
 k5Bg==
X-Gm-Message-State: ACgBeo2fP7njduATDYEVA6JaVoMEpJbEbAUsDApsF/9PK5kCQyJTibUu
 WewrHxZCy5d0p+seYO3KaQMTEQTzyg4tZQ==
X-Google-Smtp-Source: AA6agR7Q7wcDWgz3u6pBg0OUltb8hxVZK02b3YHs5KllKYFwGTsjIwB1yO3+1VMuPlQYauP+Gg87Vg==
X-Received: by 2002:a17:902:ce05:b0:16c:2a1:c335 with SMTP id
 k5-20020a170902ce0500b0016c02a1c335mr5230396plg.5.1660327699041; 
 Fri, 12 Aug 2022 11:08:19 -0700 (PDT)
Received: from stoup.. ([2602:ae:154e:e201:a7aa:1d1d:c857:5500])
 by smtp.gmail.com with ESMTPSA id
 h9-20020a056a00000900b0052dee21fecdsm1914761pfk.77.2022.08.12.11.08.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Aug 2022 11:08:17 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: laurent@vivier.eu,
	iii@linux.ibm.com,
	alex.bennee@linaro.org
Subject: [PATCH for-7.2 08/21] accel/tcg: Merge tb_htable_lookup into caller
Date: Fri, 12 Aug 2022 11:07:53 -0700
Message-Id: <20220812180806.2128593-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220812180806.2128593-1-richard.henderson@linaro.org>
References: <20220812180806.2128593-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This function is used only once, so merge it into
its only caller, tb_lookup.  This requires moving
the support routine, tb_lookup_cmp, and its private
data structure, tb_desc, up in the file.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/exec-all.h |   3 -
 accel/tcg/cpu-exec.c    | 134 +++++++++++++++++++---------------------
 2 files changed, 64 insertions(+), 73 deletions(-)

diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index 311e5fb422..e7e30d55b8 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -552,9 +552,6 @@ void tb_invalidate_phys_addr(AddressSpace *as, hwaddr addr, MemTxAttrs attrs);
 #endif
 void tb_flush(CPUState *cpu);
 void tb_phys_invalidate(TranslationBlock *tb, tb_page_addr_t page_addr);
-TranslationBlock *tb_htable_lookup(CPUState *cpu, target_ulong pc,
-                                   target_ulong cs_base, uint32_t flags,
-                                   uint32_t cflags);
 void tb_set_jmp_target(TranslationBlock *tb, int n, uintptr_t addr);
 
 /* GETPC is the true target of the return instruction that we'll execute.  */
diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index a565a3f8ec..f6c0c0aff6 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -170,19 +170,60 @@ uint32_t curr_cflags(CPUState *cpu)
     return cflags;
 }
 
-/* Might cause an exception, so have a longjmp destination ready */
-static inline TranslationBlock *tb_lookup(CPUState *cpu, target_ulong pc,
-                                          target_ulong cs_base,
-                                          uint32_t flags, uint32_t cflags)
+struct tb_desc {
+    target_ulong pc;
+    target_ulong cs_base;
+    CPUArchState *env;
+    tb_page_addr_t phys_page1;
+    uint32_t flags;
+    uint32_t cflags;
+    uint32_t trace_vcpu_dstate;
+};
+
+static bool tb_lookup_cmp(const void *p, const void *d)
 {
+    const TranslationBlock *tb = p;
+    const struct tb_desc *desc = d;
+
+    if (tb->pc == desc->pc &&
+        tb->page_addr[0] == desc->phys_page1 &&
+        tb->cs_base == desc->cs_base &&
+        tb->flags == desc->flags &&
+        tb->trace_vcpu_dstate == desc->trace_vcpu_dstate &&
+        tb_cflags(tb) == desc->cflags) {
+        /* check next page if needed */
+        if (tb->page_addr[1] == -1) {
+            return true;
+        } else {
+            tb_page_addr_t phys_page2;
+            target_ulong virt_page2;
+
+            virt_page2 = (desc->pc & TARGET_PAGE_MASK) + TARGET_PAGE_SIZE;
+            phys_page2 = get_page_addr_code(desc->env, virt_page2);
+            if (tb->page_addr[1] == phys_page2) {
+                return true;
+            }
+        }
+    }
+    return false;
+}
+
+/* Might cause an exception, so have a longjmp destination ready */
+static TranslationBlock *tb_lookup(CPUState *cpu, target_ulong pc,
+                                   target_ulong cs_base,
+                                   uint32_t flags, uint32_t cflags)
+{
+    CPUArchState *env = cpu->env_ptr;
     TranslationBlock *tb;
-    uint32_t hash;
+    tb_page_addr_t phys_pc;
+    struct tb_desc desc;
+    uint32_t jmp_hash, tb_hash;
 
     /* we should never be trying to look up an INVALID tb */
     tcg_debug_assert(!(cflags & CF_INVALID));
 
-    hash = tb_jmp_cache_hash_func(pc);
-    tb = qatomic_rcu_read(&cpu->tb_jmp_cache[hash]);
+    jmp_hash = tb_jmp_cache_hash_func(pc);
+    tb = qatomic_rcu_read(&cpu->tb_jmp_cache[jmp_hash]);
 
     if (likely(tb &&
                tb->pc == pc &&
@@ -192,11 +233,25 @@ static inline TranslationBlock *tb_lookup(CPUState *cpu, target_ulong pc,
                tb_cflags(tb) == cflags)) {
         return tb;
     }
-    tb = tb_htable_lookup(cpu, pc, cs_base, flags, cflags);
+
+    desc.env = env;
+    desc.cs_base = cs_base;
+    desc.flags = flags;
+    desc.cflags = cflags;
+    desc.trace_vcpu_dstate = *cpu->trace_dstate;
+    desc.pc = pc;
+    phys_pc = get_page_addr_code(desc.env, pc);
+    if (phys_pc == -1) {
+        return NULL;
+    }
+    desc.phys_page1 = phys_pc & TARGET_PAGE_MASK;
+    tb_hash = tb_hash_func(phys_pc, pc, flags, cflags, *cpu->trace_dstate);
+    tb = qht_lookup_custom(&tb_ctx.htable, &desc, tb_hash, tb_lookup_cmp);
     if (tb == NULL) {
         return NULL;
     }
-    qatomic_set(&cpu->tb_jmp_cache[hash], tb);
+
+    qatomic_set(&cpu->tb_jmp_cache[jmp_hash], tb);
     return tb;
 }
 
@@ -487,67 +542,6 @@ void cpu_exec_step_atomic(CPUState *cpu)
     end_exclusive();
 }
 
-struct tb_desc {
-    target_ulong pc;
-    target_ulong cs_base;
-    CPUArchState *env;
-    tb_page_addr_t phys_page1;
-    uint32_t flags;
-    uint32_t cflags;
-    uint32_t trace_vcpu_dstate;
-};
-
-static bool tb_lookup_cmp(const void *p, const void *d)
-{
-    const TranslationBlock *tb = p;
-    const struct tb_desc *desc = d;
-
-    if (tb->pc == desc->pc &&
-        tb->page_addr[0] == desc->phys_page1 &&
-        tb->cs_base == desc->cs_base &&
-        tb->flags == desc->flags &&
-        tb->trace_vcpu_dstate == desc->trace_vcpu_dstate &&
-        tb_cflags(tb) == desc->cflags) {
-        /* check next page if needed */
-        if (tb->page_addr[1] == -1) {
-            return true;
-        } else {
-            tb_page_addr_t phys_page2;
-            target_ulong virt_page2;
-
-            virt_page2 = (desc->pc & TARGET_PAGE_MASK) + TARGET_PAGE_SIZE;
-            phys_page2 = get_page_addr_code(desc->env, virt_page2);
-            if (tb->page_addr[1] == phys_page2) {
-                return true;
-            }
-        }
-    }
-    return false;
-}
-
-TranslationBlock *tb_htable_lookup(CPUState *cpu, target_ulong pc,
-                                   target_ulong cs_base, uint32_t flags,
-                                   uint32_t cflags)
-{
-    tb_page_addr_t phys_pc;
-    struct tb_desc desc;
-    uint32_t h;
-
-    desc.env = cpu->env_ptr;
-    desc.cs_base = cs_base;
-    desc.flags = flags;
-    desc.cflags = cflags;
-    desc.trace_vcpu_dstate = *cpu->trace_dstate;
-    desc.pc = pc;
-    phys_pc = get_page_addr_code(desc.env, pc);
-    if (phys_pc == -1) {
-        return NULL;
-    }
-    desc.phys_page1 = phys_pc & TARGET_PAGE_MASK;
-    h = tb_hash_func(phys_pc, pc, flags, cflags, *cpu->trace_dstate);
-    return qht_lookup_custom(&tb_ctx.htable, &desc, h, tb_lookup_cmp);
-}
-
 void tb_set_jmp_target(TranslationBlock *tb, int n, uintptr_t addr)
 {
     if (TCG_TARGET_HAS_direct_jump) {
-- 
2.34.1


