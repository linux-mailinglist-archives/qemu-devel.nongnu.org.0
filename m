Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18DEF5963F1
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Aug 2022 22:48:35 +0200 (CEST)
Received: from localhost ([::1]:55558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oO3UI-000733-4f
	for lists+qemu-devel@lfdr.de; Tue, 16 Aug 2022 16:48:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oO3Gp-0004sD-MM
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 16:34:41 -0400
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229]:34413)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oO3Gl-0004WK-1J
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 16:34:39 -0400
Received: by mail-oi1-x229.google.com with SMTP id q184so13327436oif.1
 for <qemu-devel@nongnu.org>; Tue, 16 Aug 2022 13:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=yvFaYil5KCmrJ18ST8mO/xgAXl5EVxbXc1ztEfjbOPQ=;
 b=Nxqz1pmVh/GpNWvT4Tloo4OxtjLId9CRdVZcUMNS4fibSV/v/3YYyBSoAevlSjTuVt
 pYjghwLEb0ZUaZ7jwOCdo3jadDZCpyKifIE8G8dbIN27eHeVboFZgYLLgFWihKOg9aAK
 /XM6UBNatULz6zeiN8UVeJWOII9O0BFtNBOV7zmyB7OpDSMPRHz8pUtjt4PJM47euxAn
 ZGXWbUkdJLlbSyC5DyQgAuDHkx0ZIpn7JxnAVm2x1Jo3aqIDdDKYCm8B9KK0TTT1HB96
 IfJWPJVOvF8FpL3TRAqRqUfcOZcT67rxZToSPfeobeg4hRWBeA79g4Hts2XdwS07mBjn
 r4IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=yvFaYil5KCmrJ18ST8mO/xgAXl5EVxbXc1ztEfjbOPQ=;
 b=XQ8FQ1NDLpuGBfppLywtwBeVlFbWNkPRO0ubrl0Cfgf+JxoHEf68dc618QUXYtm1lC
 hYudKhO7PE+jP9Q83ubYcLdQEHiPzq9+DjHvw1ZXyRgQPRqJfg5bk/5PGYB4Ymj51isd
 lQteidIHd6UDAXom0rCOd4aXgPjBSNEDRD1L7BEE7Let9oqjx3n+gC/uRpUMa1mvT6Oo
 eyX86LHoYsVd46xILE1zOme8UfOQD4WtHYqClQrK9Gje7gikZ6fHfqH+otBXD/3TUCpu
 TwknTOO0JLuLr+SpbXqQFJYzwARU74gV/Es72lEE5+nTlnWte6A3Ph5dddn8dzZCafcA
 lsTw==
X-Gm-Message-State: ACgBeo1R+h6T31nDpxWleYu30qAjxYXOaB3jwhJjDwyZN5tRT8n1QWU4
 midPtd8IXixIfK/v5fJsUMB2VvxIjkMQ5w==
X-Google-Smtp-Source: AA6agR6HqyeAUO+VriiEATpxONLVQA6JaR0DjkHSSbfEtmil/PIwNzraOiffR9KeUnVxCaQjC9LFng==
X-Received: by 2002:aca:ad0c:0:b0:342:f3e2:32a9 with SMTP id
 w12-20020acaad0c000000b00342f3e232a9mr128410oie.261.1660682065222; 
 Tue, 16 Aug 2022 13:34:25 -0700 (PDT)
Received: from stoup.. ([2605:ef80:80f6:61fa:9bc2:5095:d612:5e22])
 by smtp.gmail.com with ESMTPSA id
 y23-20020a056870b01700b0010ef8ccde67sm2285220oae.13.2022.08.16.13.34.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Aug 2022 13:34:23 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	iii@linux.ibm.com
Subject: [PATCH v2 08/33] accel/tcg: Make tb_htable_lookup static
Date: Tue, 16 Aug 2022 15:33:35 -0500
Message-Id: <20220816203400.161187-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220816203400.161187-1-richard.henderson@linaro.org>
References: <20220816203400.161187-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::229;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x229.google.com
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

The function is not used outside of cpu-exec.c.  Move it and
its subroutines up in the file, before the first use.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/exec-all.h |   3 -
 accel/tcg/cpu-exec.c    | 122 ++++++++++++++++++++--------------------
 2 files changed, 61 insertions(+), 64 deletions(-)

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
index a565a3f8ec..711859d4d4 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -170,6 +170,67 @@ uint32_t curr_cflags(CPUState *cpu)
     return cflags;
 }
 
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
+{
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
+static TranslationBlock *tb_htable_lookup(CPUState *cpu, target_ulong pc,
+                                          target_ulong cs_base, uint32_t flags,
+                                          uint32_t cflags)
+{
+    tb_page_addr_t phys_pc;
+    struct tb_desc desc;
+    uint32_t h;
+
+    desc.env = cpu->env_ptr;
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
+    h = tb_hash_func(phys_pc, pc, flags, cflags, *cpu->trace_dstate);
+    return qht_lookup_custom(&tb_ctx.htable, &desc, h, tb_lookup_cmp);
+}
+
 /* Might cause an exception, so have a longjmp destination ready */
 static inline TranslationBlock *tb_lookup(CPUState *cpu, target_ulong pc,
                                           target_ulong cs_base,
@@ -487,67 +548,6 @@ void cpu_exec_step_atomic(CPUState *cpu)
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


