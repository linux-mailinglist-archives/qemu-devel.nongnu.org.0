Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C445E929F
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Sep 2022 13:13:16 +0200 (CEST)
Received: from localhost ([::1]:34174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocPZT-0000mp-C7
	for lists+qemu-devel@lfdr.de; Sun, 25 Sep 2022 07:13:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ocPFA-0003GT-TH
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 06:52:18 -0400
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732]:39498)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ocPF9-0000OZ-8V
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 06:52:16 -0400
Received: by mail-qk1-x732.google.com with SMTP id x18so2640166qkn.6
 for <qemu-devel@nongnu.org>; Sun, 25 Sep 2022 03:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=QlaDsBBYnkmT1a3tK2/Vn5XLrsMQLav2sL/rl8HZTHY=;
 b=rLlFe0unT/aR7M5oBLtBTMtZpMpJcbjevKJueH4nDz5mLxUb8rqe9fNlefmdwIKqGk
 VEX0SEF+RewkrBRtSauoQhS1i0Pt/ilF2BqLibcPvAghoeuIywY56LKd6gopwFEVd400
 3LdSZnWVyZK7LQcIHSO8QkAecuP4DcELSZ7BeYsh6B1nit2kk/qf6IzJ5NwrAFeeVROE
 OXV9dYFFgdWaJ9f/BeAvFrGBh+W3wOyHFEmth9XBcCiYpLMz7WFRYJ9j67VB/GF4C1aO
 DOspGDULRgla+oCpeo75mZKamrSUosVsnWQfbEFkhgGZzdxA6fgwB5oNtORpqv1YDC4I
 P2lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=QlaDsBBYnkmT1a3tK2/Vn5XLrsMQLav2sL/rl8HZTHY=;
 b=yPpOdIpSJC4whnYpZ8OJ6R884SoWSbWSF8Gm2qVzKB3gLwwwHNpeLoYdW2mEiclknk
 9XAzmBXByWyx0OlDwcbynRW+c4ffW9oLEekRXX0Z5uFfwXcwVEfH4Lp2HN5IY7w4OG4+
 33x4DLUmBxCneEKw5PpM6k7lpdqd2fgknx7xDrMlrX17gLjeXCeZRW0LBun+q+wFNDY/
 2CgOhfaZqZ1u23CIbH0/XaHTVjOfW9vVDzPYuzFmmlY38ch/rUSmqSs8n/iHSXjb7k94
 2Nt543MogVW/665eNXYxWxdF5y5avckMrUpTpv7V+2+V3T3wTJ6MIbXsMcuGR9wnoHRn
 4HGQ==
X-Gm-Message-State: ACrzQf2gMIjrgLqdQQyKB4/v3fUABVzwMMRcILFcWWjhmSCfSh9i3oAR
 Bzb4Lk5ShEE0ZvMyyV7a7L/aCnwrt86fNw==
X-Google-Smtp-Source: AMsMyM6DGZpPU+pAQJcunN7sluboyTOFQPkrPAQILUvnEIE3Edt7iuJQS8ITJHcSS/aHawZLzgME9g==
X-Received: by 2002:a05:620a:2441:b0:6ce:6064:d421 with SMTP id
 h1-20020a05620a244100b006ce6064d421mr11050641qkn.618.1664103134305; 
 Sun, 25 Sep 2022 03:52:14 -0700 (PDT)
Received: from stoup.. ([2605:ef80:80a9:5c0e:1ec2:d482:4986:8538])
 by smtp.gmail.com with ESMTPSA id
 u15-20020a05620a0c4f00b006cf19068261sm10061132qki.116.2022.09.25.03.52.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Sep 2022 03:52:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v5 14/17] include/hw/core: Create struct CPUJumpCache
Date: Sun, 25 Sep 2022 10:51:21 +0000
Message-Id: <20220925105124.82033-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220925105124.82033-1-richard.henderson@linaro.org>
References: <20220925105124.82033-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::732;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x732.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Wrap the bare TranslationBlock pointer into a structure.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/hw/core/cpu.h     | 8 ++++++--
 accel/tcg/cpu-exec.c      | 9 ++++++---
 accel/tcg/cputlb.c        | 2 +-
 accel/tcg/translate-all.c | 4 ++--
 4 files changed, 15 insertions(+), 8 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 9e47184513..ee5b75dea0 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -232,6 +232,10 @@ struct hvf_vcpu_state;
 #define TB_JMP_CACHE_BITS 12
 #define TB_JMP_CACHE_SIZE (1 << TB_JMP_CACHE_BITS)
 
+typedef struct {
+    TranslationBlock *tb;
+} CPUJumpCache;
+
 /* work queue */
 
 /* The union type allows passing of 64 bit target pointers on 32 bit
@@ -361,7 +365,7 @@ struct CPUState {
     IcountDecr *icount_decr_ptr;
 
     /* Accessed in parallel; all accesses must be atomic */
-    TranslationBlock *tb_jmp_cache[TB_JMP_CACHE_SIZE];
+    CPUJumpCache tb_jmp_cache[TB_JMP_CACHE_SIZE];
 
     struct GDBRegisterState *gdb_regs;
     int gdb_num_regs;
@@ -452,7 +456,7 @@ static inline void cpu_tb_jmp_cache_clear(CPUState *cpu)
     unsigned int i;
 
     for (i = 0; i < TB_JMP_CACHE_SIZE; i++) {
-        qatomic_set(&cpu->tb_jmp_cache[i], NULL);
+        qatomic_set(&cpu->tb_jmp_cache[i].tb, NULL);
     }
 }
 
diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index dd58a144a8..c6283d5798 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -252,7 +252,7 @@ static inline TranslationBlock *tb_lookup(CPUState *cpu, target_ulong pc,
     tcg_debug_assert(!(cflags & CF_INVALID));
 
     hash = tb_jmp_cache_hash_func(pc);
-    tb = qatomic_rcu_read(&cpu->tb_jmp_cache[hash]);
+    tb = qatomic_rcu_read(&cpu->tb_jmp_cache[hash].tb);
 
     if (likely(tb &&
                tb->pc == pc &&
@@ -266,7 +266,7 @@ static inline TranslationBlock *tb_lookup(CPUState *cpu, target_ulong pc,
     if (tb == NULL) {
         return NULL;
     }
-    qatomic_set(&cpu->tb_jmp_cache[hash], tb);
+    qatomic_set(&cpu->tb_jmp_cache[hash].tb, tb);
     return tb;
 }
 
@@ -987,6 +987,8 @@ int cpu_exec(CPUState *cpu)
 
             tb = tb_lookup(cpu, pc, cs_base, flags, cflags);
             if (tb == NULL) {
+                uint32_t h;
+
                 mmap_lock();
                 tb = tb_gen_code(cpu, pc, cs_base, flags, cflags);
                 mmap_unlock();
@@ -994,7 +996,8 @@ int cpu_exec(CPUState *cpu)
                  * We add the TB in the virtual pc hash table
                  * for the fast lookup
                  */
-                qatomic_set(&cpu->tb_jmp_cache[tb_jmp_cache_hash_func(pc)], tb);
+                h = tb_jmp_cache_hash_func(pc);
+                qatomic_set(&cpu->tb_jmp_cache[h].tb, tb);
             }
 
 #ifndef CONFIG_USER_ONLY
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index f5e6ca2da2..fb8f3087f1 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -103,7 +103,7 @@ static void tb_jmp_cache_clear_page(CPUState *cpu, target_ulong page_addr)
     unsigned int i, i0 = tb_jmp_cache_hash_page(page_addr);
 
     for (i = 0; i < TB_JMP_PAGE_SIZE; i++) {
-        qatomic_set(&cpu->tb_jmp_cache[i0 + i], NULL);
+        qatomic_set(&cpu->tb_jmp_cache[i0 + i].tb, NULL);
     }
 }
 
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index f429d33981..efa479ccf3 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -1187,8 +1187,8 @@ static void do_tb_phys_invalidate(TranslationBlock *tb, bool rm_from_page_list)
     /* remove the TB from the hash list */
     h = tb_jmp_cache_hash_func(tb->pc);
     CPU_FOREACH(cpu) {
-        if (qatomic_read(&cpu->tb_jmp_cache[h]) == tb) {
-            qatomic_set(&cpu->tb_jmp_cache[h], NULL);
+        if (qatomic_read(&cpu->tb_jmp_cache[h].tb) == tb) {
+            qatomic_set(&cpu->tb_jmp_cache[h].tb, NULL);
         }
     }
 
-- 
2.34.1


