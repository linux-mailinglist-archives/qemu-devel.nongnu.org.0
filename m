Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A18DD596438
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Aug 2022 23:09:29 +0200 (CEST)
Received: from localhost ([::1]:60950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oO3oW-0001la-B8
	for lists+qemu-devel@lfdr.de; Tue, 16 Aug 2022 17:09:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oO3H7-00057c-7M
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 16:34:58 -0400
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233]:36416)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oO3H1-0004WL-UP
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 16:34:56 -0400
Received: by mail-oi1-x233.google.com with SMTP id s199so13320253oie.3
 for <qemu-devel@nongnu.org>; Tue, 16 Aug 2022 13:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=XGYmwpgiZPY1AsTDknzkrjEzLYeuV4sGoEw7odttBvA=;
 b=UnMscL2tGHKxQ8TdC8xytlcZW/r7PhcnXy3TItnrZ47TsrTywSvBINJs52001Zqgq8
 iXEVGm3hy1Wpt9zLgfyEY9E9yCU4wQlALd9D98sB6lyK9lxw8PMuKE+zfYUbQFyilMxi
 IOrXGV6MQCo1jUm39K+9nv9gQvXz14aa40zy3SwAQX4m5qzeMh8UmoRdp4rWQ7fIT+le
 vMdpjMw0sdcz1xz40XVtLDShRKru6Vv1wNSbKwGjwg3Cz0sHQacu+U3rPA151E9hmUr5
 6BM32PQU2xnP6rC29ml7MAntrAjfjl2npY/PMXunwp+d9E8f9cdItfLw0XIC6rHSynxA
 ISMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=XGYmwpgiZPY1AsTDknzkrjEzLYeuV4sGoEw7odttBvA=;
 b=LqfWxNa3zaG7/ZhgNj96/LUMpmtw4NwHD77ez/O7tfDTvdj56Wa4jq4O6lPwajXCoV
 9IPN9+Bzd7LXVbSGaFzIe/1TKEU7eiK7NsqYmnk3zhexAyh2bhmNvKA0wOJhImadNjjt
 bnsK1/BSIQROsCPEc273dsKRJfPSJOI2AzMABFfGhVXvCVW8FrFmsmsHPhV8v9olEWuP
 sA3BBrAoNr+4soBpnFriqbT1YI8jx5QT51bWrfa1M1CRx27b+0CFKT/Vj2iKWkh5MEgA
 Wh7kTgrpUrjil2ifosT/7YFp/n/CiNUzoQORWnedyj00BaJ4zurX4xTGoco3bEJT0ioW
 ahHg==
X-Gm-Message-State: ACgBeo29mE4ylK6LrXkHmEWKupw6y+2CCGq4w9Ewn5A06r3P3I/PFs1S
 9J0suGLQ1bq9VEwAq0pgYFTxresYuyUUcw==
X-Google-Smtp-Source: AA6agR6s97iDZIwbLXL0lTAIkThy/SaWhzJUMzNdpbk2b7z0VDZgeeU4slgUEHl9QFY0DUdmH5G9Hw==
X-Received: by 2002:a05:6808:23ca:b0:344:be60:144d with SMTP id
 bq10-20020a05680823ca00b00344be60144dmr154235oib.38.1660682091126; 
 Tue, 16 Aug 2022 13:34:51 -0700 (PDT)
Received: from stoup.. ([2605:ef80:80f6:61fa:9bc2:5095:d612:5e22])
 by smtp.gmail.com with ESMTPSA id
 y23-20020a056870b01700b0010ef8ccde67sm2285220oae.13.2022.08.16.13.34.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Aug 2022 13:34:50 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	iii@linux.ibm.com
Subject: [PATCH v2 21/33] include/hw/core: Create struct CPUJumpCache
Date: Tue, 16 Aug 2022 15:33:48 -0500
Message-Id: <20220816203400.161187-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220816203400.161187-1-richard.henderson@linaro.org>
References: <20220816203400.161187-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::233;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x233.google.com
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

Wrap the bare TranslationBlock pointer into a structure.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/hw/core/cpu.h     | 8 ++++++--
 accel/tcg/cpu-exec.c      | 9 ++++++---
 accel/tcg/cputlb.c        | 2 +-
 accel/tcg/translate-all.c | 4 ++--
 4 files changed, 15 insertions(+), 8 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 500503da13..8edef14199 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -233,6 +233,10 @@ struct hvf_vcpu_state;
 #define TB_JMP_CACHE_BITS 12
 #define TB_JMP_CACHE_SIZE (1 << TB_JMP_CACHE_BITS)
 
+typedef struct {
+    TranslationBlock *tb;
+} CPUJumpCache;
+
 /* work queue */
 
 /* The union type allows passing of 64 bit target pointers on 32 bit
@@ -362,7 +366,7 @@ struct CPUState {
     IcountDecr *icount_decr_ptr;
 
     /* Accessed in parallel; all accesses must be atomic */
-    TranslationBlock *tb_jmp_cache[TB_JMP_CACHE_SIZE];
+    CPUJumpCache tb_jmp_cache[TB_JMP_CACHE_SIZE];
 
     struct GDBRegisterState *gdb_regs;
     int gdb_num_regs;
@@ -453,7 +457,7 @@ static inline void cpu_tb_jmp_cache_clear(CPUState *cpu)
     unsigned int i;
 
     for (i = 0; i < TB_JMP_CACHE_SIZE; i++) {
-        qatomic_set(&cpu->tb_jmp_cache[i], NULL);
+        qatomic_set(&cpu->tb_jmp_cache[i].tb, NULL);
     }
 }
 
diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index b1fd962718..3f8e4bbbc8 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -243,7 +243,7 @@ static inline TranslationBlock *tb_lookup(CPUState *cpu, target_ulong pc,
     tcg_debug_assert(!(cflags & CF_INVALID));
 
     hash = tb_jmp_cache_hash_func(pc);
-    tb = qatomic_rcu_read(&cpu->tb_jmp_cache[hash]);
+    tb = qatomic_rcu_read(&cpu->tb_jmp_cache[hash].tb);
 
     if (likely(tb &&
                tb->pc == pc &&
@@ -257,7 +257,7 @@ static inline TranslationBlock *tb_lookup(CPUState *cpu, target_ulong pc,
     if (tb == NULL) {
         return NULL;
     }
-    qatomic_set(&cpu->tb_jmp_cache[hash], tb);
+    qatomic_set(&cpu->tb_jmp_cache[hash].tb, tb);
     return tb;
 }
 
@@ -978,6 +978,8 @@ int cpu_exec(CPUState *cpu)
 
             tb = tb_lookup(cpu, pc, cs_base, flags, cflags);
             if (tb == NULL) {
+                uint32_t h;
+
                 mmap_lock();
                 tb = tb_gen_code(cpu, pc, cs_base, flags, cflags);
                 mmap_unlock();
@@ -985,7 +987,8 @@ int cpu_exec(CPUState *cpu)
                  * We add the TB in the virtual pc hash table
                  * for the fast lookup
                  */
-                qatomic_set(&cpu->tb_jmp_cache[tb_jmp_cache_hash_func(pc)], tb);
+                h = tb_jmp_cache_hash_func(pc);
+                qatomic_set(&cpu->tb_jmp_cache[h].tb, tb);
             }
 
 #ifndef CONFIG_USER_ONLY
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index 8b81b07b79..a8afe1ab9f 100644
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
index 20f00f4335..c2745f14a6 100644
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


