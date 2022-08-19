Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAEB459937C
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Aug 2022 05:36:09 +0200 (CEST)
Received: from localhost ([::1]:42136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOsno-00020F-US
	for lists+qemu-devel@lfdr.de; Thu, 18 Aug 2022 23:36:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oOseX-0001rn-Ng
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 23:26:33 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:33343)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oOseU-0002kr-OZ
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 23:26:32 -0400
Received: by mail-pl1-x62d.google.com with SMTP id 2so3132024pll.0
 for <qemu-devel@nongnu.org>; Thu, 18 Aug 2022 20:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=FS3DP+0K3pFLIFDXu1c6Y1ALlRlgb0mXw4XbbUyM3LE=;
 b=JUFzpsOLp8qe/lcdQS06BMeRKrAnw5vIpIRhMOQgo3p1LNpR4UtYxlW+7SWieYZVnm
 moF4mGf7bYoXZHuiWQeHpP5NujO6Yz0/O8QBUyR8tfJc8oODJGu7CjlTTHVe6Q6Qjwrx
 RwCDhFlO6EGDxhqhbdAukg7yzanb3CpVVHQNV5iju7Ee6nJ3Whuu8P3G3/LSqN9pWYvw
 eiA1JRCUXbAN40RGI0mdXIUoqOkv/sSlm+FI2L2L8RwYggtxd/uogOI+qLfp/Yp8/rab
 V7C2V3mpqrTdXUoCkMPU6TiV3dlvB5TBRng87XSbzpnjBBStpr9hObdJ7L/ClU73nm6j
 q3bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=FS3DP+0K3pFLIFDXu1c6Y1ALlRlgb0mXw4XbbUyM3LE=;
 b=rBAkRyyxvkAaelS1SRygX1kobHxemH1s5F+XEqXVUy/9orVnQQCI8050Uf8YpOjrjF
 nNFm9pBRvdoLdVlm+4VLVreQL1IuW1DFMSEaPHQsewhuocsdvQUe45ADmf6JZpq0Odzm
 0B0sPFcK3bpjUTr9rMlgrUc5mqCSSBlrhj5fhQNRZv4pLwolKB+pmUCnvyPyABBGNJNO
 UtgDdIKhLE5Vc7ls21Rm09nkWy35jMXXFsURYh8Vy0JBZofO/e6vmTW6maSEblkNk7WF
 1dP4qhxW7Ups3of8IPzVCm3p1VnpckCnwsPLwYRthNwo67SnslxF9GjWzxmIXGnY3KOl
 WArw==
X-Gm-Message-State: ACgBeo3GqynQSkIundG4u8Zaq7cQxH3XZHhvF+a7yFAr2OJXzX4UUZ8R
 t9j19OqnLP6QMCyrjx61ZT4ZQT+89d7GNg==
X-Google-Smtp-Source: AA6agR6T0JcZd2vDmXmBD19DAQfmxGysgrfPs8C6dA9qGtfvNt1fRzJqZKH+EwIDs+t+ldZpfp8IuQ==
X-Received: by 2002:a17:90b:4c52:b0:1f6:3a26:9f08 with SMTP id
 np18-20020a17090b4c5200b001f63a269f08mr6291017pjb.206.1660879588526; 
 Thu, 18 Aug 2022 20:26:28 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:bbf3:9914:aa9c:3b4e])
 by smtp.gmail.com with ESMTPSA id
 g184-20020a6252c1000000b00535d19c46d7sm2199904pfb.203.2022.08.18.20.26.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Aug 2022 20:26:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: laurent@vivier.eu, iii@linux.ibm.com, dramforever@live.com,
 alistair.francis@wdc.com, alex.bennee@linaro.org
Subject: [PATCH v6 10/21] accel/tcg: Make tb_htable_lookup static
Date: Thu, 18 Aug 2022 20:26:04 -0700
Message-Id: <20220819032615.884847-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220819032615.884847-1-richard.henderson@linaro.org>
References: <20220819032615.884847-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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


