Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E3F65AE391
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 10:56:57 +0200 (CEST)
Received: from localhost ([::1]:56898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVUO8-00053q-I4
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 04:56:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVU6L-0002er-7V
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 04:38:33 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:40910)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVU6J-0005Wy-3m
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 04:38:32 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 h204-20020a1c21d5000000b003a5b467c3abso9111751wmh.5
 for <qemu-devel@nongnu.org>; Tue, 06 Sep 2022 01:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=zG39VovyIZ/PsCMFUhH4j2iQCKj21MZ5YeRW0rCmN4k=;
 b=nF7WSL+BqHfsgJPyQx+cpUVczWpT068d3Bt8wdW/75IYYvhomFLrlqnjXXxwlfwk5N
 p5caQr2Yk3MCxramc3f2uEDs+UgapmS9DIJ4t1RV0eGPnAs3GFPfFmpYGtwUJGDUE2f/
 b4vxHoEmnkRIlwyru3k1qEq4en76Q0FpW0qNntmujEggTJS525ZBjiJIBuhbrqHHa7g6
 EhjkqmDrPrIPwQg/4HzVEHHoJDdcZ8aS3T911+CinxVHfxo72KwzyJEPssRV3GMlSrTq
 KkX4KzT+drYaq0XS2c4av+bzfchHCHga+tWP73cMyRczIFsN+xQVYNafswVqbDUz4+P1
 8hEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=zG39VovyIZ/PsCMFUhH4j2iQCKj21MZ5YeRW0rCmN4k=;
 b=qpGHwz3szH4HqgwQatsq2MhbcRTjFrKeiYgJRE5NSksWllYLBpg0W+64spTcUEQEEv
 QT7bbwu+I+KPJXWJ65PM2+erIfT34HosYNWWRFf5UIcvKN5QbjUocCnhBPcCZd440qDw
 kxuMEeQvem6psqWNtmxcZyPsSu+ZdObIcguR6yyQXbUKzN0TM8zZiq3+iwV/wspheBl7
 9Kcp5sSFipz/amazlk0ClY7GD36nr3r+wPfx2cBeUGAQPVA0waaRgRTNEjcVkIiYI3Mj
 koEZ4OWlEhxLLokrFPerr3iKEz3/CrZlIwh8btBUTxmo/dW+fnIkhUEvWeYpvKR5bxqG
 wPkA==
X-Gm-Message-State: ACgBeo3Fpsy8lmkZuGUOPO6HkaJlfqveooAZGcK+Ksxc0wiYx8TRNGbk
 TlXW8ZsrPw5goANXs31gX+nPMQjksE23yT2h
X-Google-Smtp-Source: AA6agR5tDn193PEAUhAsJfslRR2UJtZa5Bu9VMZWIdwOPQWKFo0S4YoCn9XsR+DcnpfHxHniY8F3ig==
X-Received: by 2002:a05:600c:1c16:b0:3a6:b11:79be with SMTP id
 j22-20020a05600c1c1600b003a60b1179bemr12638932wms.203.1662453509525; 
 Tue, 06 Sep 2022 01:38:29 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:8084:a5c0:5a80:ba98:3a71:8524:e0b1])
 by smtp.gmail.com with ESMTPSA id
 g26-20020a7bc4da000000b003a54f49c1c8sm13421859wmk.12.2022.09.06.01.38.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 01:38:29 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@gmail.com, Alistair Francis <alistair.francis@wdc.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PULL v3 10/20] accel/tcg: Make tb_htable_lookup static
Date: Tue,  6 Sep 2022 09:38:05 +0100
Message-Id: <20220906083815.252478-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220906083815.252478-1-richard.henderson@linaro.org>
References: <20220906083815.252478-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x334.google.com
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

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Acked-by: Ilya Leoshkevich <iii@linux.ibm.com>
Tested-by: Ilya Leoshkevich <iii@linux.ibm.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/exec-all.h |   3 -
 accel/tcg/cpu-exec.c    | 122 ++++++++++++++++++++--------------------
 2 files changed, 61 insertions(+), 64 deletions(-)

diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index 0475ec6007..9f35e3b7a9 100644
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
index d18081ca6f..7887af6f45 100644
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
@@ -485,67 +546,6 @@ void cpu_exec_step_atomic(CPUState *cpu)
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


