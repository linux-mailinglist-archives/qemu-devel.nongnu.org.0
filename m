Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA1D5A8EFE
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 09:01:03 +0200 (CEST)
Received: from localhost ([::1]:34584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTeCE-0003VL-G7
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 03:01:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oTe4U-0005we-Ir
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 02:53:03 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:45914)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oTe4Q-0003G2-7n
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 02:53:00 -0400
Received: by mail-wr1-x42e.google.com with SMTP id w5so4832343wrn.12
 for <qemu-devel@nongnu.org>; Wed, 31 Aug 2022 23:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=zG39VovyIZ/PsCMFUhH4j2iQCKj21MZ5YeRW0rCmN4k=;
 b=yIEiKLRCM7TgLMdcNPxS9cOM8lzBkmKHXmNR9jzi6abZTaMt+nLlixbst1n/nf76hf
 rDm7qNnymNkoAA8FCZ8HgwLBe98URiISgUn2ltW9g4sXt3hwEnbpyd804btFeB4JBf5K
 wFMTtdl+21UHn7dVnG17aYit/icIUCSvrlZ8GGK3vYeaulQrRt68mZvUyTAgb4/TZ2Gh
 r/Z1RfMquRVoFkkkRoanSV+rA83maZzmj/qhxW3/UGLmkHrqcguVRkIu0DjjkCqVLJMf
 KjbS14SSnFVo0C3MCq8OFDGKXx2p5S3QJQaPj5NujzztdMZmHjp/UaSPjTBY1SP2wLip
 BxgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=zG39VovyIZ/PsCMFUhH4j2iQCKj21MZ5YeRW0rCmN4k=;
 b=IepzW3+J+/8EbVDjsm+cw4gidjiIw98TDGXKP+ghZkFV5JXJgRasSbq9k+iy7wFqrx
 VdCaz/D5tMHMwubwtzob1/VowuWfh1WhnQI7FCeXBC+dpusYpVwyTwXzB/dCmQG4SnxE
 LXpnzpSMDeuV+JXWTaB3wGkU2YsLYbSwLNmMNX2YNIck6dTiwTATZ8SerdR4OtCXSah9
 St2n/hCGR5VX4Y83e9o7OnSl0c3gS3HtTpCM6/gCBWq1dt3IpmBt/YcImctU83fumJ0h
 QjwVnnETZ2ZICPCmTjwtRCQVG187V3m9zXlG1K8E914I81ar/4MHL/g/SjkL5BwGxXUs
 XdEQ==
X-Gm-Message-State: ACgBeo3GWE8/Kx4Uj0oWYyIB/RrLPGaue9LojRb8yuZaYP1GYA2B4RJp
 QrwY0ohEGrer9yCRe8RnldXZaoIgVw/XpVaO
X-Google-Smtp-Source: AA6agR6yssG/rBudmJEhzx0k5i0wu0UN72meJ5yqMJOiLMyIA8fXfZSdo2T1yd7umSQJKBeK05ltLA==
X-Received: by 2002:a05:6000:2ce:b0:226:d420:db7a with SMTP id
 o14-20020a05600002ce00b00226d420db7amr11854630wry.489.1662015176456; 
 Wed, 31 Aug 2022 23:52:56 -0700 (PDT)
Received: from stoup.. ([87.192.221.83]) by smtp.gmail.com with ESMTPSA id
 a6-20020a5d4d46000000b00226dedf1ab7sm8308153wru.76.2022.08.31.23.52.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Aug 2022 23:52:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PULL 10/20] accel/tcg: Make tb_htable_lookup static
Date: Thu,  1 Sep 2022 07:52:00 +0100
Message-Id: <20220901065210.117081-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220901065210.117081-1-richard.henderson@linaro.org>
References: <20220901065210.117081-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42e.google.com
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


