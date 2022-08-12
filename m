Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A38591582
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Aug 2022 20:33:35 +0200 (CEST)
Received: from localhost ([::1]:53508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMZTS-0004HQ-FZ
	for lists+qemu-devel@lfdr.de; Fri, 12 Aug 2022 14:33:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oMZ5A-0003Ya-Of
 for qemu-devel@nongnu.org; Fri, 12 Aug 2022 14:08:28 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:40800)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oMZ59-0006YU-5P
 for qemu-devel@nongnu.org; Fri, 12 Aug 2022 14:08:28 -0400
Received: by mail-pl1-x636.google.com with SMTP id x23so1398113pll.7
 for <qemu-devel@nongnu.org>; Fri, 12 Aug 2022 11:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=VWZ7e4tvP40ubeS7KjHkbJNbecgKw6jyn6G7dk6Ns4k=;
 b=Ws/iUeRD7AyNLifd2ZZr0E0WwxIdWQoFDktRiR67Pv89j2dFkMOG4R5MEd8dwficDB
 OH01mxBQnndypF21VddWeHRW6IJLCamAFeJUjCQAY8GWCYgY4z4ZaoS4sXFlE7vXxWB5
 /mIsn1RHFF8xcNyiOKpIkqXe/NQOQfAjPjJIWXbklkT6v8f4t84HRMYPCzd2fN2CVWfu
 b7fwO05QJY4KQdtdtD8+gO43ZYK+hsrDPfcjDMcviOSXc6EDvKzARfQ+RyDUG8jh3KOo
 DTFT6iXI7UiVnqafeAYMqHyIFQKGAPux/QqbftjCACRflGjN7ejJ28sFz8YOXYv/QcZO
 RVsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=VWZ7e4tvP40ubeS7KjHkbJNbecgKw6jyn6G7dk6Ns4k=;
 b=4DVt2D5cT7W3jdYDoMPrWuBomLlYyOmPdTpsrP9RdL2tBCOeVL/Be4lh65W5RiFVac
 4RCq19h9h6ql4uZ79iJbDF8Qs+E6Ixwhhsd6ELQ/DpGG/L8h14qs0qBy12cZ5t4/g85r
 tvUO6lHEz7vaNk3l4oEOnKAQPTK99iTj7AYjxJJTT4/wwPSw+6Q+VaPvHgq5aeZhY2BD
 GrVu16HO8LuT0BFdP2d3+SEsipnskFzwnTNxturZdUEzbSbtadQQ8Q8niCY1VtY7hb+X
 qPKQb/iNxY3SccHe5RpXulmLwbGk9g6YFwllF5f2aOSnow0o3Q0Jh8a1ytqXPMaI90CO
 gGdg==
X-Gm-Message-State: ACgBeo1Hoc5pUDKmGfawKlDbqibWuiCu3GwNL5BxEZXy0JtdZ2HhBGMg
 8jfbRYa2zQE6RYAg/B8qV2ITw+tWX46hBQ==
X-Google-Smtp-Source: AA6agR7GEnLwqC8yVyk6BRJAx9DQ4vcHkwbP9Ftp5OT1vhUDiQtgOG9aFsZpXJvShxKEPtBvuR3XmQ==
X-Received: by 2002:a17:902:e749:b0:171:2480:4320 with SMTP id
 p9-20020a170902e74900b0017124804320mr5095269plf.153.1660327705849; 
 Fri, 12 Aug 2022 11:08:25 -0700 (PDT)
Received: from stoup.. ([2602:ae:154e:e201:a7aa:1d1d:c857:5500])
 by smtp.gmail.com with ESMTPSA id
 h9-20020a056a00000900b0052dee21fecdsm1914761pfk.77.2022.08.12.11.08.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Aug 2022 11:08:25 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: laurent@vivier.eu,
	iii@linux.ibm.com,
	alex.bennee@linaro.org
Subject: [PATCH for-7.2 14/21] accel/tcg: Hoist get_page_addr_code out of
 tb_lookup
Date: Fri, 12 Aug 2022 11:07:59 -0700
Message-Id: <20220812180806.2128593-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220812180806.2128593-1-richard.henderson@linaro.org>
References: <20220812180806.2128593-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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

We will want to re-use the result of get_page_addr_code
beyond the scope of tb_lookup.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/cpu-exec.c | 34 ++++++++++++++++++++++++----------
 1 file changed, 24 insertions(+), 10 deletions(-)

diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index a9b7053274..889355b341 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -209,13 +209,12 @@ static bool tb_lookup_cmp(const void *p, const void *d)
 }
 
 /* Might cause an exception, so have a longjmp destination ready */
-static TranslationBlock *tb_lookup(CPUState *cpu, target_ulong pc,
-                                   target_ulong cs_base,
+static TranslationBlock *tb_lookup(CPUState *cpu, tb_page_addr_t phys_pc,
+                                   target_ulong pc, target_ulong cs_base,
                                    uint32_t flags, uint32_t cflags)
 {
     CPUArchState *env = cpu->env_ptr;
     TranslationBlock *tb;
-    tb_page_addr_t phys_pc;
     struct tb_desc desc;
     uint32_t jmp_hash, tb_hash;
 
@@ -240,11 +239,8 @@ static TranslationBlock *tb_lookup(CPUState *cpu, target_ulong pc,
     desc.cflags = cflags;
     desc.trace_vcpu_dstate = *cpu->trace_dstate;
     desc.pc = pc;
-    phys_pc = get_page_addr_code(desc.env, pc);
-    if (phys_pc == -1) {
-        return NULL;
-    }
     desc.phys_page1 = phys_pc & TARGET_PAGE_MASK;
+
     tb_hash = tb_hash_func(phys_pc, pc, flags, cflags, *cpu->trace_dstate);
     tb = qht_lookup_custom(&tb_ctx.htable, &desc, tb_hash, tb_lookup_cmp);
     if (tb == NULL) {
@@ -371,6 +367,7 @@ const void *HELPER(lookup_tb_ptr)(CPUArchState *env)
     TranslationBlock *tb;
     target_ulong cs_base, pc;
     uint32_t flags, cflags;
+    tb_page_addr_t phys_pc;
 
     cpu_get_tb_cpu_state(env, &pc, &cs_base, &flags);
 
@@ -379,7 +376,12 @@ const void *HELPER(lookup_tb_ptr)(CPUArchState *env)
         cpu_loop_exit(cpu);
     }
 
-    tb = tb_lookup(cpu, pc, cs_base, flags, cflags);
+    phys_pc = get_page_addr_code(env, pc);
+    if (phys_pc == -1) {
+        return tcg_code_gen_epilogue;
+    }
+
+    tb = tb_lookup(cpu, phys_pc, pc, cs_base, flags, cflags);
     if (tb == NULL) {
         return tcg_code_gen_epilogue;
     }
@@ -482,6 +484,7 @@ void cpu_exec_step_atomic(CPUState *cpu)
     TranslationBlock *tb;
     target_ulong cs_base, pc;
     uint32_t flags, cflags;
+    tb_page_addr_t phys_pc;
     int tb_exit;
 
     if (sigsetjmp(cpu->jmp_env, 0) == 0) {
@@ -504,7 +507,12 @@ void cpu_exec_step_atomic(CPUState *cpu)
          * Any breakpoint for this insn will have been recognized earlier.
          */
 
-        tb = tb_lookup(cpu, pc, cs_base, flags, cflags);
+        phys_pc = get_page_addr_code(env, pc);
+        if (phys_pc == -1) {
+            tb = NULL;
+        } else {
+            tb = tb_lookup(cpu, phys_pc, pc, cs_base, flags, cflags);
+        }
         if (tb == NULL) {
             mmap_lock();
             tb = tb_gen_code(cpu, pc, cs_base, flags, cflags);
@@ -949,6 +957,7 @@ int cpu_exec(CPUState *cpu)
             TranslationBlock *tb;
             target_ulong cs_base, pc;
             uint32_t flags, cflags;
+            tb_page_addr_t phys_pc;
 
             cpu_get_tb_cpu_state(cpu->env_ptr, &pc, &cs_base, &flags);
 
@@ -970,7 +979,12 @@ int cpu_exec(CPUState *cpu)
                 break;
             }
 
-            tb = tb_lookup(cpu, pc, cs_base, flags, cflags);
+            phys_pc = get_page_addr_code(cpu->env_ptr, pc);
+            if (phys_pc == -1) {
+                tb = NULL;
+            } else {
+                tb = tb_lookup(cpu, phys_pc, pc, cs_base, flags, cflags);
+            }
             if (tb == NULL) {
                 mmap_lock();
                 tb = tb_gen_code(cpu, pc, cs_base, flags, cflags);
-- 
2.34.1


